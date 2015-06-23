DoItemEffect:: ; 2f3f
	callba _DoItemEffect
	ret
; 2f46

CheckTossableItem:: ; 2f46
	push hl
	push de
	push bc
	callba _CheckTossableItem
	pop bc
	pop de
	pop hl
	ret
; 2f53

TossItem:: ; 2f53
	push hl
	push de
	push bc
	ld a, [hROMBank]
	push af
	ld a, BANK(_TossItem)
	rst Bankswitch

	call _TossItem

	pop bc
	ld a, b
	rst Bankswitch
	pop bc
	pop de
	pop hl
	ret
; 2f66

ReceiveItem:: ; 2f66
	push bc
	ld a, [hROMBank]
	push af
	ld a, BANK(_ReceiveItem)
	rst Bankswitch
	push hl
	push de

	call _ReceiveItem

	pop de
	pop hl
	pop bc
	ld a, b
	rst Bankswitch
	pop bc
	ret
; 2f79

CheckItem:: ; 2f79
	push hl
	push de
	push bc
	ld a, [hROMBank]
	push af
	ld a, BANK(_CheckItem)
	rst Bankswitch

	call _CheckItem

	pop bc
	ld a, b
	rst Bankswitch
	pop bc
	pop de
	pop hl
	ret
; 2f8c
