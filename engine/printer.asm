INCLUDE "engine/printer/serial.asm"

SendScreenToPrinter: ; 843f0
.loop
	call JoyTextDelay
	call CheckCancelPrint
	jr c, .cancel
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .finished
	call PrinterJumptableIteration
	call CheckPrinterStatus
	call PlacePrinterStatusString
	call DelayFrame
	jr .loop

.finished
	and a
	ret

.cancel
	scf
	ret
; 84411

Printer_CleanUpAfterSend: ; 84411
	xor a
	ld [wPrinterConnectionOpen], a
	ld [wPrinterOpcode], a
	ret
; 84419

Printer_PrepareTileMapForPrint: ; 84419
	push af
	call Printer_StartTransmission
	pop af
	ld [wcbfa], a
	call Printer_CopyTileMapToBuffer
	ret
; 84425

Printer_ExitPrinter: ; 84425
	call ReturnToMapFromSubmenu
	call Printer_RestartMapMusic
	ret
; 8442c

PrintDexEntry: ; 8442c
	ld a, [wPrinterQueueLength]
	push af

	ld hl, VTiles1
	ld de, FontInversed
	lb bc, BANK(FontInversed), $80
	call Request1bpp

	xor a
	ld [hPrinter], a
	call Printer_PlayMusic

	ld a, [rIE]
	push af
	xor a
	ld [rIF], a
	ld a, $9
	ld [rIE], a

	call Printer_StartTransmission
	ld a, $10
	ld [wcbfa], a
	callba PrintPage1
	call ClearTileMap
	ld a, %11100100
	call DmgToCgbBGPals
	call DelayFrame

	ld hl, hVBlank
	ld a, [hl]
	push af
	ld [hl], $4

	ld a, 8 ; 16 rows
	ld [wPrinterQueueLength], a
	call Printer_ResetJoypadRegisters
	call SendScreenToPrinter
	jr c, .skip_second_page ; canceled or got an error

	call Printer_CleanUpAfterSend
	ld c, 12
	call DelayFrames
	xor a
	ld [hBGMapMode], a

	call Printer_StartTransmission
	ld a, $3
	ld [wcbfa], a
	callba PrintPage2
	call Printer_ResetJoypadRegisters
	ld a, 4
	ld [wPrinterQueueLength], a
	call SendScreenToPrinter

.skip_second_page
	pop af
	ld [hVBlank], a
	call Printer_CleanUpAfterSend

	xor a
	ld [rIF], a
	pop af
	ld [rIE], a

	call Printer_ExitPrinter
	ld c, 8
.low_volume_delay_frames
	call LowVolume
	call DelayFrame
	dec c
	jr nz, .low_volume_delay_frames

	pop af
	ld [wPrinterQueueLength], a
	ret
; 844bc

PrintPCBox: ; 844bc (21:44bc)
	ld a, [wPrinterQueueLength]
	push af
	ld a, 18 / 2
	ld [wPrinterQueueLength], a

	ld a, e
	ld [wAddrOfBoxToPrint], a
	ld a, d
	ld [wAddrOfBoxToPrint + 1], a
	ld a, b
	ld [wBankOfBoxToPrint], a
	ld a, c
	ld [wWhichBoxToPrint], a

	xor a
	ld [hPrinter], a
	ld [wFinishedPrintingBox], a
	call Printer_PlayMusic

	ld a, [rIE]
	push af
	xor a
	ld [rIF], a
	ld a, %1001
	ld [rIE], a

	ld hl, hVBlank
	ld a, [hl]
	push af
	ld [hl], %0100

	xor a
	ld [hBGMapMode], a
	call PrintPCBox_Page1
	ld a, $10 ; to be loaded to wcbfa
	call Printer_PrepareTileMapForPrint
	call Printer_ResetRegistersAndStartDataSend
	jr c, .cancel

	call Printer_CleanUpAfterSend
	ld c, 12
	call DelayFrames
	xor a
	ld [hBGMapMode], a
	call PrintPCBox_Page2
	ld a, $0 ; to be loaded to wcbfa
	call Printer_PrepareTileMapForPrint
	call Printer_ResetRegistersAndStartDataSend
	jr c, .cancel

	call Printer_CleanUpAfterSend
	ld c, 12
	call DelayFrames

	xor a
	ld [hBGMapMode], a
	call PrintPCBox_Page3
	ld a, $0 ; to be loaded to wcbfa
	call Printer_PrepareTileMapForPrint
	call Printer_ResetRegistersAndStartDataSend
	jr c, .cancel

	call Printer_CleanUpAfterSend
	ld c, 12
	call DelayFrames

	xor a
	ld [hBGMapMode], a
	call PrintPCBox_Page4
	ld a, $3 ; to be loaded to wcbfa
	call Printer_PrepareTileMapForPrint
	call Printer_ResetRegistersAndStartDataSend
.cancel
	pop af
	ld [hVBlank], a
	call Printer_CleanUpAfterSend

	xor a
	ld [rIF], a
	pop af
	ld [rIE], a
	call Printer_ExitPrinter

	pop af
	ld [wPrinterQueueLength], a
	ret

Printer_ResetRegistersAndStartDataSend: ; 84559 (21:4559)
	call Printer_ResetJoypadRegisters
	call SendScreenToPrinter
	ret

PrintUnownStamp: ; 84560
	ld a, [wPrinterQueueLength]
	push af
	xor a
	ld [hPrinter], a
	call Printer_PlayMusic
	ld a, [rIE]
	push af
	xor a
	ld [rIF], a
	ld a, $9
	ld [rIE], a
	ld hl, hVBlank
	ld a, [hl]
	push af
	ld [hl], $4
	xor a
	ld [hBGMapMode], a
	call LoadTileMapToTempTileMap
	callba PlaceUnownPrinterFrontpic
	ld a, $0 ; to be loaded to wcbfa
	call Printer_PrepareTileMapForPrint
	call Call_LoadTempTileMapToTileMap
	call Printer_ResetJoypadRegisters
	ld a, 18 / 2
	ld [wPrinterQueueLength], a
.loop
	call JoyTextDelay
	call CheckCancelPrint
	jr c, .done
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .done
	call PrinterJumptableIteration
	ld a, [wJumptableIndex]
	cp $2
	jr nc, .check_status
	ld a, 6 / 2
	ld [wPrinterRowIndex], a

.check_status
	call CheckPrinterStatus
	call PlacePrinterStatusString
	call DelayFrame
	jr .loop

.done
	pop af
	ld [hVBlank], a
	call Printer_CleanUpAfterSend
	call Call_LoadTempTileMapToTileMap
	xor a
	ld [rIF], a
	pop af
	ld [rIE], a
	pop af
	ld [wPrinterQueueLength], a
	ret
; 845d4

PrintMail: ; 845d4
	call PrintMail_
	call Printer_ExitPrinter
	ret
; 845db

PrintMail_: ; 845db
	ld a, [wPrinterQueueLength]
	push af
	xor a
	ld [hPrinter], a
	call Printer_PlayMusic

	ld a, [rIE]
	push af
	xor a
	ld [rIF], a
	ld a, %1001
	ld [rIE], a

	xor a
	ld [hBGMapMode], a

	ld a, $13 ; to be loaded to wcbfa
	call Printer_PrepareTileMapForPrint
	ld hl, hVBlank
	ld a, [hl]
	push af
	ld [hl], %0100

	ld a, 18 / 2
	ld [wPrinterQueueLength], a
	call SendScreenToPrinter

	pop af
	ld [hVBlank], a
	call Printer_CleanUpAfterSend
	call Printer_CopyBufferToTileMap

	xor a
	ld [rIF], a
	pop af
	ld [rIE], a

	pop af
	ld [wPrinterQueueLength], a
	ret
; 8461a

PrintPartymon: ; 8461a
	ld a, [wPrinterQueueLength]
	push af
	xor a
	ld [hPrinter], a
	call Printer_PlayMusic

	ld a, [rIE]
	push af
	xor a
	ld [rIF], a
	ld a, %1001
	ld [rIE], a

	xor a
	ld [hBGMapMode], a
	callba PrintPartyMonPage1
	ld a, $10 ; to be loaded to wcbfa
	call Printer_PrepareTileMapForPrint

	ld hl, hVBlank
	ld a, [hl]
	push af
	ld [hl], %0100

	ld a, 16 / 2
	ld [wPrinterQueueLength], a
	call Printer_ResetJoypadRegisters
	call SendScreenToPrinter
	jr c, .cancel

	call Printer_CleanUpAfterSend
	ld c, 12
	call DelayFrames

	xor a
	ld [hBGMapMode], a
	callba PrintPartyMonPage2
	ld a, $3 ; to be loaded to wcbfa
	call Printer_PrepareTileMapForPrint

	ld a, 18 / 2
	ld [wPrinterQueueLength], a
	call Printer_ResetJoypadRegisters
	call SendScreenToPrinter
.cancel
	pop af
	ld [hVBlank], a
	call Printer_CleanUpAfterSend

	call Printer_CopyBufferToTileMap
	xor a
	ld [rIF], a
	pop af
	ld [rIE], a
	call Printer_ExitPrinter

	pop af
	ld [wPrinterQueueLength], a
	ret
; 84688

_PrintDiploma: ; 84688
	ld a, [wPrinterQueueLength]
	push af

	callba PlaceDiplomaOnScreen

	xor a
	ld [hPrinter], a
	call Printer_PlayMusic

	ld a, [rIE]
	push af
	xor a
	ld [rIF], a
	ld a, %1001
	ld [rIE], a

	ld hl, hVBlank
	ld a, [hl]
	push af
	ld [hl], %0100

	ld a, $10 ; to be loaded to wcbfa
	call Printer_PrepareTileMapForPrint
	call Printer_ResetJoypadRegisters

	ld a, 18 / 2
	ld [wPrinterQueueLength], a
	call SendScreenToPrinter
	jr c, .cancel
	call Printer_CleanUpAfterSend
	ld c, 12
	call DelayFrames

	call LoadTileMapToTempTileMap
	xor a
	ld [hBGMapMode], a

	callba PrintDiplomaPage2

	ld a, $3 ; to be loaded to wcbfa
	call Printer_PrepareTileMapForPrint
	call Call_LoadTempTileMapToTileMap
	call Printer_ResetJoypadRegisters

	ld a, 18 / 2
	ld [wPrinterQueueLength], a
	call SendScreenToPrinter
.cancel
	pop af
	ld [hVBlank], a
	call Printer_CleanUpAfterSend

	xor a
	ld [rIF], a
	pop af
	ld [rIE], a
	call Printer_ExitPrinter

	pop af
	ld [wPrinterQueueLength], a
	ret
; 846f6

CheckCancelPrint: ; 846f6
	ld a, [hJoyDown]
	and B_BUTTON
	jr nz, .pressed_b
	and a
	ret

.pressed_b
	ld a, [wca80]
	cp $c
	jr nz, .cancel
.loop
	ld a, [wPrinterOpcode]
	and a
	jr nz, .loop
	ld a, $16 ; cancel
	ld [wPrinterOpcode], a
	ld a, $88
	ld [rSB], a
	ld a, $1
	ld [rSC], a
	ld a, $81
	ld [rSC], a
.loop2
	ld a, [wPrinterOpcode]
	and a
	jr nz, .loop2

.cancel
	ld a, $1
	ld [hPrinter], a
	scf
	ret
; 84728

Printer_CopyTileMapToBuffer: ; 84728
	hlcoord 0, 0
	ld de, wPrinterTileMapBuffer
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call CopyBytes
	ret
; 84735

Printer_CopyBufferToTileMap: ; 84735
	ld hl, wPrinterTileMapBuffer
	decoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call CopyBytes
	ret
; 84742

Printer_ResetJoypadRegisters: ; 84742
	xor a
	ld [hJoyReleased], a
	ld [hJoyPressed], a
	ld [hJoyDown], a
	ld [hJoyLast], a
	ret
; 8474c

Printer_PlayMusic: ; 8474c
	ld de, MUSIC_PRINTER
	call PlayMusic2
	ret
; 84753

Printer_RestartMapMusic: ; 84753
	call RestartMapMusic
	ret
; 84757

CheckPrinterStatus: ; 84757
; Check for printer errors
; If [ca88] == -1, we're disconnected
	ld a, [wPrinterHandshake]
	cp -1
	jr nz, .printer_connected
	ld a, [wPrinterStatusFlags]
	cp -1
	jr z, .error_2
.printer_connected
; ca89 contains printer status flags
	ld a, [wPrinterStatusFlags]
	and %11100000
	ret z ; no error

	bit 7, a
	jr nz, .error_1
	bit 6, a
	jr nz, .error_4
	; paper error
	ld a, PRINTER_ERROR_3
	jr .load_text_index

.error_4
	; temperature error
	ld a, PRINTER_ERROR_4
	jr .load_text_index

.error_1
	; printer battery low
	ld a, PRINTER_ERROR_1
	jr .load_text_index

.error_2
	; connection error
	ld a, PRINTER_ERROR_2
.load_text_index
	ld [wPrinterStatus], a
	ret
; 84785

PlacePrinterStatusString: ; 84785
; Print nonzero printer status
	ld a, [wPrinterStatus]
	and a
	ret z
	push af
	xor a
	ld [hBGMapMode], a
	hlcoord 0, 5
	lb bc, 10, 18
	call TextBox
	pop af
	ld e, a
	ld d, 0
	ld hl, PrinterStatusStringPointers
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	hlcoord 1, 7
	ld a, BANK(GBPrinterStrings)
	call FarString
	hlcoord 2, 15
	ld de, String_PressBToCancel
	call PlaceString
	ld a, $1
	ld [hBGMapMode], a
	xor a
	ld [wPrinterStatus], a
	ret
; 847bd

Function847bd: ; 847bd
; XXX
	ld a, [wPrinterStatus]
	and a
	ret z
	push af
	xor a
	ld [hBGMapMode], a
	hlcoord 2, 4
	lb bc, 13, 16
	call ClearBox
	pop af
	ld e, a
	ld d, 0
	ld hl, PrinterStatusStringPointers
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	hlcoord 4, 7
	ld a, BANK(GBPrinterStrings)
	call FarString
	hlcoord 4, 15
	ld de, String_PressBToCancel
	call PlaceString
	ld a, $1
	ld [hBGMapMode], a
	xor a
	ld [wPrinterStatus], a
	ret
; 847f5

String_PressBToCancel:
	db "Press B to Cancel@"
; 84807

PrinterStatusStringPointers: ; 84807
	dw GBPrinterString_Null ; @
	dw GBPrinterString_CheckingLink ; CHECKING LINK
	dw GBPrinterString_Transmitting ; TRANSMITTING
	dw GBPrinterString_Printing ; PRINTING
	dw GBPrinterString_PrinterError1 ; error 1
	dw GBPrinterString_PrinterError2 ; error 2
	dw GBPrinterString_PrinterError3 ; error 3
	dw GBPrinterString_PrinterError4 ; error 4
; 84817

PrintPCBox_Page1: ; 84817 (21:4817)
	xor a
	ld [wWhichBoxMonToPrint], a
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	ld a, " "
	call ByteFill
	call Printer_PlaceEmptyBoxSlotString

	hlcoord 0, 0
	ld bc, 9 * SCREEN_WIDTH
	ld a, " "
	call ByteFill

	call Printer_PlaceSideBorders
	call Printer_PlaceTopBorder

	hlcoord 4, 3
	ld de, .String_PokemonList
	call PlaceString

	ld a, [wWhichBoxToPrint]
	ld bc, BOX_NAME_LENGTH
	ld hl, wBoxNames
	call AddNTimes
	ld d, h
	ld e, l
	hlcoord 6, 5
	call PlaceString
	ld a, 1
	call Printer_GetBoxMonSpecies
	hlcoord 2, 9
	ld c, 3
	call Printer_PrintBoxListSegment
	ret
; 84865 (21:4865)

.String_PokemonList:
	db "#MON LIST@"
; 8486f

PrintPCBox_Page2: ; 8486f (21:486f)
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	ld a, " "
	call ByteFill
	call Printer_PlaceEmptyBoxSlotString
	call Printer_PlaceSideBorders
	ld a, [wFinishedPrintingBox]
	and a
	ret nz
	ld a, 4
	call Printer_GetBoxMonSpecies
	hlcoord 2, 0
	ld c, 6
	call Printer_PrintBoxListSegment
	ret

PrintPCBox_Page3: ; 84893 (21:4893)
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	ld a, " "
	call ByteFill
	call Printer_PlaceEmptyBoxSlotString
	call Printer_PlaceSideBorders
	ld a, [wFinishedPrintingBox]
	and a
	ret nz
	ld a, 10
	call Printer_GetBoxMonSpecies
	hlcoord 2, 0
	ld c, 6
	call Printer_PrintBoxListSegment
	ret

PrintPCBox_Page4: ; 848b7 (21:48b7)
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	ld a, " "
	call ByteFill
	call Printer_PlaceEmptyBoxSlotString
	hlcoord 1, 15
	lb bc, 2, 18
	call ClearBox
	call Printer_PlaceSideBorders
	call Printer_PlaceBottomBorders
	ld a, [wFinishedPrintingBox]
	and a
	ret nz
	ld a, 16
	call Printer_GetBoxMonSpecies
	hlcoord 2, 0
	ld c, 5
	call Printer_PrintBoxListSegment
	ret

Printer_PrintBoxListSegment: ; 848e7 (21:48e7)
	ld a, [wBankOfBoxToPrint]
	call GetSRAMBank
.loop
	ld a, c
	and a
	jp z, .max_length
	dec c
	ld a, [de]
	cp $ff
	jp z, .finish
	ld [wd265], a
	ld [CurPartySpecies], a

	push bc
	push hl
	push de

	push hl
	ld bc, 16
	ld a, " "
	call ByteFill
	pop hl

	push hl
	call GetBasePokemonName
	pop hl

	push hl
	call PlaceString
	ld a, [CurPartySpecies]
	cp EGG
	pop hl
	jr z, .ok2

	ld bc, PKMN_NAME_LENGTH
	add hl, bc
	call Printer_GetMonGender
	ld bc, SCREEN_WIDTH - PKMN_NAME_LENGTH
	add hl, bc
	ld a, "/"
	ld [hli], a

	push hl
	ld bc, 14
	ld a, " "
	call ByteFill
	pop hl

	push hl
	ld a, [wAddrOfBoxToPrint]
	ld l, a
	ld a, [wAddrOfBoxToPrint + 1]
	ld h, a
	ld bc, sBoxMonNicknames - sBox
	add hl, bc
	ld bc, PKMN_NAME_LENGTH
	ld a, [wWhichBoxMonToPrint]
	call AddNTimes
	ld e, l
	ld d, h
	pop hl

	push hl
	call PlaceString
	pop hl

	ld bc, PKMN_NAME_LENGTH
	add hl, bc
	push hl
	ld a, [wAddrOfBoxToPrint]
	ld l, a
	ld a, [wAddrOfBoxToPrint + 1]
	ld h, a
	ld bc, 2 + MONS_PER_BOX + MON_LEVEL
	add hl, bc
	ld bc, BOXMON_STRUCT_LENGTH
	ld a, [wWhichBoxMonToPrint]
	call AddNTimes
	ld a, [hl]
	pop hl
	call PrintLevel_Force3Digits
.ok2
	ld hl, wWhichBoxMonToPrint
	inc [hl]
	pop de
	pop hl
	ld bc, 3 * SCREEN_WIDTH
	add hl, bc
	pop bc
	inc de
	jp .loop

.finish
	ld a, $1
	ld [wFinishedPrintingBox], a
.max_length
	call CloseSRAM
	ret

Printer_GetMonGender: ; 8498a (21:498a)
	push hl
	ld a, [wAddrOfBoxToPrint]
	ld l, a
	ld a, [wAddrOfBoxToPrint + 1]
	ld h, a
	ld bc, $2b
	add hl, bc
	ld bc, BOXMON_STRUCT_LENGTH
	ld a, [wWhichBoxMonToPrint]
	call AddNTimes
	ld de, TempMonDVs
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ld a, [wWhichBoxMonToPrint]
	ld [CurPartyMon], a
	ld a, TEMPMON
	ld [MonType], a
	callba GetGender
	ld a, " "
	jr c, .got_gender
	ld a, "♂"
	jr nz, .got_gender
	ld a, "♀"
.got_gender
	pop hl
	ld [hli], a
	ret

Printer_GetBoxMonSpecies: ; 849c6 (21:49c6)
	push hl
	ld e, a
	ld d, $0
	ld a, [wAddrOfBoxToPrint]
	ld l, a
	ld a, [wAddrOfBoxToPrint + 1]
	ld h, a
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ret

Printer_PlaceTopBorder: ; 849d7 (21:49d7)
	hlcoord 0, 0
	ld a, "┌"
	ld [hli], a
	ld a, "─"
	ld c, SCREEN_WIDTH - 2
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	ld a, "┐"
	ld [hl], a
	ret

Printer_PlaceSideBorders: ; 849e9 (21:49e9)
	hlcoord 0, 0
	ld de, SCREEN_WIDTH - 1
	ld c, SCREEN_HEIGHT
.loop
	ld a, "│"
	ld [hl], a
	add hl, de
	ld a, "│"
	ld [hli], a
	dec c
	jr nz, .loop
	ret

Printer_PlaceBottomBorders: ; 849fc (21:49fc)
	hlcoord 0, 17
	ld a, "└"
	ld [hli], a
	ld a, "─"
	ld c, SCREEN_WIDTH - 2
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	ld a, "┘"
	ld [hl], a
	ret

Printer_PlaceEmptyBoxSlotString: ; 84a0e (21:4a0e)
	hlcoord 2, 0
	ld c, $6
.loop
	push bc
	push hl
	ld de, String84a25
	call PlaceString
	pop hl
	ld bc, 3 * SCREEN_WIDTH
	add hl, bc
	pop bc
	dec c
	jr nz, .loop
	ret
; 84a25 (21:4a25)

String84a25: ; 84a25
	db "  ------@"
; 84a2e
