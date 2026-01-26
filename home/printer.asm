PrinterReceive::
	homecall _PrinterReceive
	ret

AskSerial::
; send out a handshake while serial int is off
	ld a, [wPrinterConnectionOpen]
	bit PRINTER_CONNECTION_OPEN, a
	ret z

; if we're still interpreting data, don't try to receive
	ld a, [wPrinterOpcode]
	and a
	ret nz

; once every 6 frames
	ld hl, wHandshakeFrameDelay
	inc [hl]
	ld a, [hl]
	cp 6
	ret c

	xor a
	ld [hl], a

	ld a, $0c
	ld [wPrinterOpcode], a

; handshake
	ld a, $88
	ldh [rSB], a

; switch to internal clock
	ld a, SC_INTERNAL
	ldh [rSC], a

; start transfer
	ld a, SC_START | SC_INTERNAL
	ldh [rSC], a

	ret
