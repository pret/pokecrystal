SendScreenToPrinter:
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

Printer_CleanUpAfterSend:
	xor a
	ld [wPrinterConnectionOpen], a
	ld [wPrinterOpcode], a
	ret

Printer_PrepareTilemapForPrint:
	push af
	call Printer_StartTransmission
	pop af
	ld [wPrinterMargins], a
	call Printer_CopyTilemapToBuffer
	ret

Printer_ExitPrinter:
	call ReturnToMapFromSubmenu
	call Printer_RestartMapMusic
	ret

PrintDexEntry:
	ld a, [wPrinterQueueLength]
	push af

	ld hl, vTiles1
	ld de, FontInversed
	lb bc, BANK(FontInversed), $80
	call Request1bpp

	xor a
	ldh [hPrinter], a
	call Printer_PlayMusic

	ldh a, [rIE]
	push af
	xor a
	ldh [rIF], a
	ld a, (1 << SERIAL) | (1 << VBLANK)
	ldh [rIE], a

	call Printer_StartTransmission
	ln a, 1, 0
	ld [wPrinterMargins], a
	farcall PrintPage1
	call ClearTilemap
	ld a, %11100100
	call DmgToCgbBGPals
	call DelayFrame

	ld hl, hVBlank
	ld a, [hl]
	push af
	ld [hl], 4 ; vblank mode that calls AskSerial

	ld a, 8 ; 16 rows
	ld [wPrinterQueueLength], a
	call Printer_ResetJoypadRegisters
	call SendScreenToPrinter
	jr c, .skip_second_page ; canceled or got an error

	call Printer_CleanUpAfterSend
	ld c, 12
	call DelayFrames
	xor a
	ldh [hBGMapMode], a

	call Printer_StartTransmission
	ln a, 0, 3
	ld [wPrinterMargins], a
	farcall PrintPage2
	call Printer_ResetJoypadRegisters
	ld a, 4
	ld [wPrinterQueueLength], a
	call SendScreenToPrinter

.skip_second_page
	pop af
	ldh [hVBlank], a
	call Printer_CleanUpAfterSend

	xor a
	ldh [rIF], a
	pop af
	ldh [rIE], a

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

Printer_ResetRegistersAndStartDataSend:
	call Printer_ResetJoypadRegisters
	call SendScreenToPrinter
	ret

PrintUnownStamp:
	ld a, [wPrinterQueueLength]
	push af

	xor a
	ldh [hPrinter], a
	call Printer_PlayMusic

	ldh a, [rIE]
	push af
	xor a
	ldh [rIF], a
	ld a, (1 << SERIAL) | (1 << VBLANK)
	ldh [rIE], a

	ld hl, hVBlank
	ld a, [hl]
	push af
	ld [hl], 4 ; vblank mode that calls AskSerial

	xor a
	ldh [hBGMapMode], a
	call LoadTilemapToTempTilemap
	farcall PlaceUnownPrinterFrontpic
	ln a, 0, 0 ; to be loaded to wPrinterMargins
	call Printer_PrepareTilemapForPrint
	call SafeLoadTempTilemapToTilemap
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
	ldh [hVBlank], a
	call Printer_CleanUpAfterSend
	call SafeLoadTempTilemapToTilemap

	xor a
	ldh [rIF], a
	pop af
	ldh [rIE], a

	pop af
	ld [wPrinterQueueLength], a
	ret

PrintMailAndExit:
	call PrintMail
	call Printer_ExitPrinter
	ret

PrintMail:
	ld a, [wPrinterQueueLength]
	push af
	xor a
	ldh [hPrinter], a
	call Printer_PlayMusic

	ldh a, [rIE]
	push af
	xor a
	ldh [rIF], a
	ld a, (1 << SERIAL) | (1 << VBLANK)
	ldh [rIE], a

	xor a
	ldh [hBGMapMode], a

	ln a, 1, 3 ; to be loaded to wPrinterMargins
	call Printer_PrepareTilemapForPrint
	ld hl, hVBlank
	ld a, [hl]
	push af
	ld [hl], 4 ; vblank mode that calls AskSerial

	ld a, 18 / 2
	ld [wPrinterQueueLength], a
	call SendScreenToPrinter

	pop af
	ldh [hVBlank], a
	call Printer_CleanUpAfterSend
	call Printer_CopyBufferToTilemap

	xor a
	ldh [rIF], a
	pop af
	ldh [rIE], a

	pop af
	ld [wPrinterQueueLength], a
	ret

PrintPartymon:
	ld a, [wPrinterQueueLength]
	push af
	xor a
	ldh [hPrinter], a
	call Printer_PlayMusic

	ldh a, [rIE]
	push af
	xor a
	ldh [rIF], a
	ld a, (1 << SERIAL) | (1 << VBLANK)
	ldh [rIE], a

	xor a
	ldh [hBGMapMode], a
	farcall PrintPartyMonPage1
	ln a, 1, 0 ; to be loaded to wPrinterMargins
	call Printer_PrepareTilemapForPrint

	ld hl, hVBlank
	ld a, [hl]
	push af
	ld [hl], 4 ; vblank mode that calls AskSerial

	ld a, 16 / 2
	ld [wPrinterQueueLength], a
	call Printer_ResetJoypadRegisters
	call SendScreenToPrinter
	jr c, .cancel

	call Printer_CleanUpAfterSend
	ld c, 12
	call DelayFrames

	xor a
	ldh [hBGMapMode], a
	farcall PrintPartyMonPage2
	ln a, 0, 3 ; to be loaded to wPrinterMargins
	call Printer_PrepareTilemapForPrint

	ld a, 18 / 2
	ld [wPrinterQueueLength], a
	call Printer_ResetJoypadRegisters
	call SendScreenToPrinter
.cancel
	pop af
	ldh [hVBlank], a
	call Printer_CleanUpAfterSend

	call Printer_CopyBufferToTilemap
	xor a
	ldh [rIF], a
	pop af
	ldh [rIE], a
	call Printer_ExitPrinter

	pop af
	ld [wPrinterQueueLength], a
	ret

_PrintDiploma:
	ld a, [wPrinterQueueLength]
	push af

	farcall PlaceDiplomaOnScreen

	xor a
	ldh [hPrinter], a
	call Printer_PlayMusic

	ldh a, [rIE]
	push af
	xor a
	ldh [rIF], a
	ld a, (1 << SERIAL) | (1 << VBLANK)
	ldh [rIE], a

	ld hl, hVBlank
	ld a, [hl]
	push af
	ld [hl], 4 ; vblank mode that calls AskSerial

	ln a, 1, 0 ; to be loaded to wPrinterMargins
	call Printer_PrepareTilemapForPrint
	call Printer_ResetJoypadRegisters

	ld a, 18 / 2
	ld [wPrinterQueueLength], a
	call SendScreenToPrinter
	jr c, .cancel
	call Printer_CleanUpAfterSend
	ld c, 12
	call DelayFrames

	call LoadTilemapToTempTilemap
	xor a
	ldh [hBGMapMode], a

	farcall PrintDiplomaPage2

	ln a, 0, 3 ; to be loaded to wPrinterMargins
	call Printer_PrepareTilemapForPrint
	call SafeLoadTempTilemapToTilemap
	call Printer_ResetJoypadRegisters

	ld a, 18 / 2
	ld [wPrinterQueueLength], a
	call SendScreenToPrinter
.cancel
	pop af
	ldh [hVBlank], a
	call Printer_CleanUpAfterSend

	xor a
	ldh [rIF], a
	pop af
	ldh [rIE], a
	call Printer_ExitPrinter

	pop af
	ld [wPrinterQueueLength], a
	ret

CheckCancelPrint:
	ldh a, [hJoyDown]
	and B_BUTTON
	jr nz, .pressed_b
	and a
	ret

.pressed_b
	ld a, [wUnusedGameboyPrinterSafeCancelFlag]
	cp $0c
	jr nz, .cancel

; wait for printer activity to finish before canceling?
.loop
	ld a, [wPrinterOpcode]
	and a
	jr nz, .loop
	ld a, $16 ; cancel
	ld [wPrinterOpcode], a
	ld a, $88
	ldh [rSB], a
	ld a, (0 << rSC_ON) | (1 << rSC_CLOCK)
	ldh [rSC], a
	ld a, (1 << rSC_ON) | (1 << rSC_CLOCK)
	ldh [rSC], a
.loop2
	ld a, [wPrinterOpcode]
	and a
	jr nz, .loop2

.cancel
	ld a, $1
	ldh [hPrinter], a
	scf
	ret

Printer_CopyTilemapToBuffer:
	hlcoord 0, 0
	ld de, wPrinterTilemapBuffer
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call CopyBytes
	ret

Printer_CopyBufferToTilemap:
	ld hl, wPrinterTilemapBuffer
	decoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call CopyBytes
	ret

Printer_ResetJoypadRegisters:
	xor a
	ldh [hJoyReleased], a
	ldh [hJoyPressed], a
	ldh [hJoyDown], a
	ldh [hJoyLast], a
	ret

Printer_PlayMusic:
	ld de, MUSIC_PRINTER
	call PlayMusic2
	ret

Printer_RestartMapMusic:
	call RestartMapMusic
	ret

CheckPrinterStatus:
; Check for printer errors
; If [wPrinterHandshake] == -1, we're disconnected
	ld a, [wPrinterHandshake]
	cp -1
	jr nz, .printer_connected
	ld a, [wPrinterStatusFlags]
	cp -1
	jr z, .error_2
.printer_connected
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

PlacePrinterStatusString:
; Print nonzero printer status
	ld a, [wPrinterStatus]
	and a
	ret z
	push af
	xor a
	ldh [hBGMapMode], a
	hlcoord 0, 5
	lb bc, 10, 18
	call Textbox
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
	call PlaceFarString
	hlcoord 2, 15
	ld de, String_PressBToCancel
	call PlaceString
	ld a, $1
	ldh [hBGMapMode], a
	xor a
	ld [wPrinterStatus], a
	ret

PlacePrinterStatusStringBorderless: ; unreferenced
; Similar to PlacePrinterStatusString, but with different hlcoords
; and ClearBox instead of TextBox.
	ld a, [wPrinterStatus]
	and a
	ret z
	push af
	xor a
	ldh [hBGMapMode], a
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
	call PlaceFarString
	hlcoord 4, 15
	ld de, String_PressBToCancel
	call PlaceString
	ld a, $1
	ldh [hBGMapMode], a
	xor a
	ld [wPrinterStatus], a
	ret

String_PressBToCancel:
	db "Press B to Cancel@"

PrinterStatusStringPointers:
	dw GBPrinterString_Null ; @
	dw GBPrinterString_CheckingLink ; CHECKING LINK
	dw GBPrinterString_Transmitting ; TRANSMITTING
	dw GBPrinterString_Printing ; PRINTING
	dw GBPrinterString_PrinterError1 ; error 1
	dw GBPrinterString_PrinterError2 ; error 2
	dw GBPrinterString_PrinterError3 ; error 3
	dw GBPrinterString_PrinterError4 ; error 4
