Printer_StartTransmission: ; 84000
	ld hl, wGameboyPrinterRAM
	ld bc, wGameboyPrinterRAMEnd - wGameboyPrinterRAM
	xor a
	call Printer_ByteFill
	xor a
	ld [rSB], a
	ld [rSC], a
	ld [wPrinterOpcode], a
	ld hl, wPrinterConnectionOpen
	set 0, [hl]
	ld a, [GBPrinter]
	ld [wGBPrinterSettings], a
	xor a
	ld [wJumptableIndex], a
	ret
; 84022

PrinterJumptableIteration: ; 84022
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
; 84031


.Jumptable: ; 84031 (21:4031)

	dw Print_InitPrinterHandshake ; 00
	dw Printer_CheckConnectionStatus ; 01
	dw Printer_WaitSerial ; 02
	dw Printer_StartTransmittingTilemap ; 03
	dw Printer_TransmissionLoop ; 04
	dw Printer_WaitSerialAndLoopBack2 ; 05

	dw Printer_EndTilemapTransmission ; 06
	dw Printer_TransmissionLoop ; 07
	dw Printer_WaitSerial ; 08
	dw Printer_SignalSendHeader ; 09
	dw Printer_TransmissionLoop ; 0a
	dw Printer_WaitSerial ; 0b
	dw Printer_WaitUntilFinished ; 0c
	dw Printer_Quit ; 0d

	dw Printer_NextSection_ ; 0e
	dw Printer_WaitSerial ; 0f
	dw Printer_SignalLoopBack ; 10
	dw Printer_SectionOne ; 11
	dw Printer_WaitLoopBack ; 12
	dw Printer_WaitLoopBack_ ; 13


Printer_NextSection: ; 84059 (21:4059)
	ld hl, wJumptableIndex
	inc [hl]
	ret

Printer_PrevSection: ; 8405e (21:405e)
	ld hl, wJumptableIndex
	dec [hl]
	ret

Printer_Quit: ; 84063 (21:4063)
	xor a
	ld [wPrinterStatusFlags], a
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

Printer_NextSection_: ; 8406d (21:406d)
	call Printer_NextSection
	ret

Printer_SectionOne: ; 84071 (21:4071)
	ld a, $1
	ld [wJumptableIndex], a
	ret

Print_InitPrinterHandshake: ; 84077 (21:4077)
	call Printer_ResetData
	ld hl, PrinterDataPacket1
	call Printer_CopyPacket
	xor a
	ld [wPrinterSendByteCounter], a
	ld [wPrinterSendByteCounter + 1], a
	ld a, [wPrinterQueueLength]
	ld [wPrinterRowIndex], a
	call Printer_NextSection
	call Printer_WaitHandshake
	ld a, PRINTER_STATUS_CHECKING
	ld [wPrinterStatus], a
	ret

Printer_StartTransmittingTilemap: ; 84099 (21:4099)
	call Printer_ResetData
	; check ???
	ld hl, wPrinterRowIndex
	ld a, [hl]
	and a
	jr z, Printer_EndTilemapTransmission
	; send packet 3
	ld hl, PrinterDataPacket3 ; signal start of transmission
	call Printer_CopyPacket
	; prepare to send 40 tiles
	call Printer_Convert2RowsTo2bpp
	ld a, (40 tiles) % $100
	ld [wPrinterSendByteCounter], a
	ld a, (40 tiles) / $100
	ld [wPrinterSendByteCounter + 1], a
	; compute the checksum
	call Printer_ComputeChecksum
	call Printer_NextSection
	call Printer_WaitHandshake
	ld a, PRINTER_STATUS_TRANSMITTING
	ld [wPrinterStatus], a
	ret

Printer_EndTilemapTransmission: ; 840c5 (21:40c5)
	; ensure that we go from here to routine 7
	ld a, $6
	ld [wJumptableIndex], a
	; send packet 4
	ld hl, PrinterDataPacket4 ; signal no transmission
	call Printer_CopyPacket
	; send no tile data
	xor a
	ld [wPrinterSendByteCounter], a
	ld [wPrinterSendByteCounter + 1], a
	call Printer_NextSection
	call Printer_WaitHandshake
	ret

Printer_SignalSendHeader: ; 840de (21:40de)
	call Printer_ResetData
	ld hl, PrinterDataPacket2 ; signal request print
	call Printer_CopyPacket
	; prepare to send 1 tile
	call Printer_StageHeaderForSend
	ld a, 4 % $100
	ld [wPrinterSendByteCounter], a
	ld a, 4 / $100
	ld [wPrinterSendByteCounter + 1], a
	; compute the checksum
	call Printer_ComputeChecksum
	call Printer_NextSection
	call Printer_WaitHandshake
	ld a, PRINTER_STATUS_PRINTING
	ld [wPrinterStatus], a
	ret

Printer_SignalLoopBack: ; 84103 (21:4103)
	call Printer_ResetData
	; send packet 1
	ld hl, PrinterDataPacket1 ; signal no transmission
	call Printer_CopyPacket
	; send no tile data
	xor a
	ld [wPrinterSendByteCounter], a
	ld [wPrinterSendByteCounter + 1], a
	ld a, [wPrinterQueueLength]
	ld [wPrinterRowIndex], a
	call Printer_NextSection
	call Printer_WaitHandshake
	ret

Printer_WaitSerial: ; 84120 (21:4120)
	ld hl, wPrinterSerialFrameDelay
	inc [hl]
	ld a, [hl]
	cp $6
	ret c
	xor a
	ld [hl], a
	call Printer_NextSection
	ret

Printer_WaitSerialAndLoopBack2: ; 8412e (21:412e)
	ld hl, wPrinterSerialFrameDelay
	inc [hl]
	ld a, [hl]
	cp $6
	ret c
	xor a
	ld [hl], a
	ld hl, wPrinterRowIndex
	dec [hl]
	call Printer_PrevSection
	call Printer_PrevSection
	ret

Printer_CheckConnectionStatus: ; 84143 (21:4143)
	ld a, [wPrinterOpcode]
	and a
	ret nz
	ld a, [wPrinterHandshake]
	cp $ff
	jr nz, .printer_connected
	ld a, [wPrinterStatusFlags]
	cp $ff
	jr z, .printer_error

.printer_connected
	ld a, [wPrinterHandshake]
	cp $81
	jr nz, .printer_error
	ld a, [wPrinterStatusFlags]
	cp $0
	jr nz, .printer_error
	ld hl, wPrinterConnectionOpen
	set 1, [hl]
	ld a, $5
	ld [wHandshakeFrameDelay], a
	call Printer_NextSection
	ret

.printer_error
	ld a, $ff
	ld [wPrinterHandshake], a
	ld [wPrinterStatusFlags], a
	ld a, $e
	ld [wJumptableIndex], a
	ret

Printer_TransmissionLoop: ; 84180 (21:4180)
	ld a, [wPrinterOpcode]
	and a
	ret nz
	ld a, [wPrinterStatusFlags]
	and $f0
	jr nz, .enter_wait_loop
	ld a, [wPrinterStatusFlags]
	and $1
	jr nz, .cycle_back
	call Printer_NextSection
	ret

.cycle_back
	call Printer_PrevSection
	ret

.enter_wait_loop
	ld a, $12 ; Printer_WaitLoopBack
	ld [wJumptableIndex], a
	ret

Printer_WaitUntilFinished: ; 841a1 (21:41a1)
	ld a, [wPrinterOpcode]
	and a
	ret nz
	ld a, [wPrinterStatusFlags]
	and $f3
	ret nz
	call Printer_NextSection
	ret

Printer_WaitLoopBack: ; 841b0 (21:41b0)
	call Printer_NextSection
Printer_WaitLoopBack_: ; 841b3 (21:41b3)
	ld a, [wPrinterOpcode]
	and a
	ret nz
	ld a, [wPrinterStatusFlags]
	and $f0
	ret nz
	xor a
	ld [wJumptableIndex], a
	ret

Printer_WaitHandshake: ; 841c3 (21:41c3)
.loop
	ld a, [wPrinterOpcode]
	and a
	jr nz, .loop
	xor a
	ld [wPrinterSendByteOffset], a
	ld [wPrinterSendByteOffset + 1], a
	ld a, $1
	ld [wPrinterOpcode], a
	ld a, $88
	ld [rSB], a
	ld a, $1
	ld [rSC], a
	ld a, $81
	ld [rSC], a
	ret

Printer_CopyPacket: ; 841e2 (21:41e2)
	ld a, [hli]
	ld [wca82], a
	ld a, [hli]
	ld [wca83], a
	ld a, [hli]
	ld [wca84], a
	ld a, [hli]
	ld [wca85], a
	ld a, [hli]
	ld [wPrinterChecksum], a
	ld a, [hl]
	ld [wPrinterChecksum + 1], a
	ret

Printer_ResetData: ; 841fb (21:41fb)
	xor a
	ld hl, wca82
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, wPrinterChecksum
	ld [hli], a
	ld [hl], a
	xor a
	ld [wPrinterSendByteCounter], a
	ld [wPrinterSendByteCounter + 1], a
	ld hl, wGameboyPrinterRAM
	ld bc, wGameboyPrinter2bppSourceEnd - wGameboyPrinter2bppSource
	call Printer_ByteFill
	ret

Printer_ComputeChecksum: ; 84219 (21:4219)
	ld hl, 0
	ld bc, 4
	ld de, wca82
	call .ComputeChecksum
	ld a, [wPrinterSendByteCounter]
	ld c, a
	ld a, [wPrinterSendByteCounter + 1]
	ld b, a
	ld de, wGameboyPrinterRAM
	call .ComputeChecksum
	ld a, l
	ld [wPrinterChecksum], a
	ld a, h
	ld [wPrinterChecksum + 1], a
	ret

.ComputeChecksum: ; 8423c (21:423c)
.loop
	ld a, [de]
	inc de
	add l
	jr nc, .no_overflow
	inc h
.no_overflow
	ld l, a
	dec bc
	ld a, c
	or b
	jr nz, .loop
	ret

Printer_StageHeaderForSend: ; 84249 (21:4249)
	ld a, $1
	ld [wGameboyPrinter2bppSource + 0], a
	ld a, [wcbfa]
	ld [wGameboyPrinter2bppSource + 1], a
	ld a, %11100100
	ld [wGameboyPrinter2bppSource + 2], a
	ld a, [wGBPrinterSettings]
	ld [wGameboyPrinter2bppSource + 3], a
	ret

Printer_Convert2RowsTo2bpp: ; 84260 (21:4260)
	; de = wPrinterTileMapBuffer + 2 * SCREEN_WIDTH * ([wPrinterQueueLength] - [wPrinterRowIndex])
	ld a, [wPrinterRowIndex]
	xor $ff
	ld d, a
	ld a, [wPrinterQueueLength]
	inc a
	add d
	ld hl, wPrinterTileMapBuffer
	ld de, 2 * SCREEN_WIDTH
.loop1
	and a
	jr z, .okay1
	add hl, de
	dec a
	jr .loop1
.okay1
	ld e, l
	ld d, h
	ld hl, wGameboyPrinter2bppSource
	ld c, 2 * SCREEN_WIDTH
.loop2
	ld a, [de]
	inc de
	push bc
	push de
	push hl
	; convert tile index to vram address
	swap a
	ld d, a
	and $f0
	ld e, a
	ld a, d
	and $f
	ld d, a
	and $8
	ld a, d
	jr nz, .vtiles_8xxx
	or $90
	jr .got_vtile_addr

.vtiles_8xxx
	or $80
.got_vtile_addr
	ld d, a
	; copy 1 vtile to hl
	lb bc, BANK(Printer_Convert2RowsTo2bpp), 1
	call Request2bpp
	pop hl
	ld de, 1 tiles
	add hl, de
	pop de
	pop bc
	dec c
	jr nz, .loop2
	ret

Printer_ByteFill: ; 842ab
	push de
	ld e, a
.loop
	ld [hl], e
	inc hl
	dec bc
	ld a, c
	or b
	jr nz, .loop
	ld a, e
	pop de
	ret
; 842b7

PrinterDataPacket1:
	db  1, 0, $00, 0
	dw 1
PrinterDataPacket2:
	db  2, 0, $04, 0
	dw 0
PrinterDataPacket3:
	db  4, 0, $80, 2
	dw 0
PrinterDataPacket4:
	db  4, 0, $00, 0
	dw 4
PrinterDataPacket5: ; unused
	db  8, 0, $00, 0
	dw 8
PrinterDataPacket6: ; unused
	db 15, 0, $00, 0
	dw 15
; 842db

_PrinterReceive:: ; 842db
	ld a, [wPrinterOpcode]
	add a
	ld e, a
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
; 842ea


.Jumptable: ; 842ea (21:42ea)
	dw Printer_DoNothing ; 00

	dw Printer_Send0x33 ; 01
	dw Printer_Sendwca82 ; 02
	dw Printer_Sendwca83 ; 03
	dw Printer_Sendwca84 ; 04
	dw Printer_Sendwca85 ; 05
	dw Printer_SendNextByte ; 06
	dw Printer_SendwPrinterChecksumLo ; 07
	dw Printer_SendwPrinterChecksumHi ; 08
	dw Printer_Send0x00 ; 09
	dw Printer_ReceiveTowPrinterHandshakeAndSend0x00 ; 0a
	dw Printer_ReceiveTowPrinterStatusFlagsAndExitSendLoop ; 0b

	dw Printer_Send0x33 ; 0c triggered by AskSerial
	dw Printer_Send0x0f ; 0d
	dw Printer_Send0x00_ ; 0e
	dw Printer_Send0x00_ ; 0f
	dw Printer_Send0x00_ ; 10
	dw Printer_Send0x0f ; 11
	dw Printer_Send0x00_ ; 12
	dw Printer_Send0x00 ; 13
	dw Printer_ReceiveTowPrinterHandshakeAndSend0x00 ; 14
	dw Printer_ReceiveTowPrinterStatusFlagsAndExitSendLoop_ ; 15

	dw Printer_Send0x33 ; 16 triggered by pressing B
	dw Printer_Send0x08 ; 17
	dw Printer_Send0x00_ ; 18
	dw Printer_Send0x00_ ; 19
	dw Printer_Send0x00_ ; 1a
	dw Printer_Send0x08 ; 1b
	dw Printer_Send0x00_ ; 1c
	dw Printer_Send0x00 ; 1d
	dw Printer_ReceiveTowPrinterHandshakeAndSend0x00 ; 1e
	dw Printer_ReceiveTowPrinterStatusFlagsAndExitSendLoop ; 1f


Printer_NextInstruction: ; 8432a (21:432a)
	ld hl, wPrinterOpcode
	inc [hl]
	ret

Printer_DoNothing: ; 8432f (21:432f)
	ret

Printer_Send0x33: ; 84330 (21:4330)
	ld a, $33
	call Printer_SerialSend
	call Printer_NextInstruction
	ret

Printer_Sendwca82: ; 84339 (21:4339)
	ld a, [wca82]
	call Printer_SerialSend
	call Printer_NextInstruction
	ret

Printer_Sendwca83: ; 84343 (21:4343)
	ld a, [wca83]
	call Printer_SerialSend
	call Printer_NextInstruction
	ret

Printer_Sendwca84: ; 8434d (21:434d)
	ld a, [wca84]
	call Printer_SerialSend
	call Printer_NextInstruction
	ret

Printer_Sendwca85: ; 84357 (21:4357)
	ld a, [wca85]
	call Printer_SerialSend
	call Printer_NextInstruction
	ret

Printer_SendNextByte: ; 84361 (21:4361)
	; decrement 16-bit counter
	ld hl, wPrinterSendByteCounter
	ld a, [hli]
	ld d, [hl]
	ld e, a
	or d
	jr z, .done
	dec de
	ld [hl], d
	dec hl
	ld [hl], e

	ld a, [wPrinterSendByteOffset]
	ld e, a
	ld a, [wPrinterSendByteOffset + 1]
	ld d, a
	ld hl, wGameboyPrinterRAM
	add hl, de
	inc de
	ld a, e
	ld [wPrinterSendByteOffset], a
	ld a, d
	ld [wPrinterSendByteOffset + 1], a
	ld a, [hl]
	call Printer_SerialSend
	ret

.done
	call Printer_NextInstruction
Printer_SendwPrinterChecksumLo: ; 8438b (21:438b)
	ld a, [wPrinterChecksum]
	call Printer_SerialSend
	call Printer_NextInstruction
	ret

Printer_SendwPrinterChecksumHi: ; 84395 (21:4395)
	ld a, [wPrinterChecksum + 1]
	call Printer_SerialSend
	call Printer_NextInstruction
	ret

Printer_Send0x00: ; 8439f (21:439f)
	ld a, $0
	call Printer_SerialSend
	call Printer_NextInstruction
	ret

Printer_ReceiveTowPrinterHandshakeAndSend0x00: ; 843a8 (21:43a8)
	ld a, [rSB]
	ld [wPrinterHandshake], a
	ld a, $0
	call Printer_SerialSend
	call Printer_NextInstruction
	ret

Printer_ReceiveTowPrinterStatusFlagsAndExitSendLoop: ; 843b6 (21:43b6)
	ld a, [rSB]
	ld [wPrinterStatusFlags], a
	xor a
	ld [wPrinterOpcode], a
	ret

Printer_Send0x0f: ; 843c0 (21:43c0)
	ld a, $f
	call Printer_SerialSend
	call Printer_NextInstruction
	ret

Printer_Send0x00_: ; 843c9 (21:43c9)
	ld a, $0
	call Printer_SerialSend
	call Printer_NextInstruction
	ret

Printer_Send0x08: ; 843d2 (21:43d2)
	ld a, $8
	call Printer_SerialSend
	call Printer_NextInstruction
	ret

Printer_SerialSend: ; 843db (21:43db)
	ld [rSB], a
	ld a, $1 ; switch to internal clock
	ld [rSC], a
	ld a, $81 ; start transfer
	ld [rSC], a
	ret

Printer_ReceiveTowPrinterStatusFlagsAndExitSendLoop_: ; 843e6 (21:43e6)
	ld a, [rSB]
	ld [wPrinterStatusFlags], a
	xor a
	ld [wPrinterOpcode], a
	ret
