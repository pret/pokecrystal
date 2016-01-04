PrinterReceive:: ; 2057
	ld a, [hROMBank]
	push af
	ld a, BANK(_PrinterReceive)
	rst Bankswitch

	call _PrinterReceive
	pop af
	rst Bankswitch

	ret
; 2063

AskSerial:: ; 2063
; send out a handshake while serial int is off
	ld a, [wc2d4]
	bit 0, a
	ret z
	
	ld a, [wc2d5]
	and a
	ret nz
	
; once every 6 frames
	ld hl, wca8a
	inc [hl]
	ld a, [hl]
	cp 6
	ret c
	
	xor a
	ld [hl], a
	
	ld a, $c
	ld [wc2d5], a
	
; handshake
	ld a, $88
	ld [rSB], a
	
; switch to internal clock
	ld a, %00000001
	ld [rSC], a
	
; start transfer
	ld a, %10000001
	ld [rSC], a
	
	ret
; 208a
