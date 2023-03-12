FarCall_de::
; Call a:de.
; Preserves other registers.
	ldh [hTempBank], a
	ldh a, [hROMBank]
	push af
	ldh a, [hTempBank]
	rst Bankswitch
	call _de_
	jr ReturnFarCall

FarCall_hl::
; Call a:hl.
; Preserves other registers.
	ldh [hTempBank], a
	ldh a, [hROMBank]
	push af
	ldh a, [hTempBank]
	rst Bankswitch
	call _hl_
	; fallthrough

ReturnFarCall::
; We want to retain the contents of f.
; To do this, we can pop to bc instead of af.
	ld a, b
	ld [wFarCallBC], a
	ld a, c
	ld [wFarCallBC + 1], a

; Restore the working bank.
	pop bc
	ld a, b
	rst Bankswitch

; Restore the contents of bc.
	ld a, [wFarCallBC]
	ld b, a
	ld a, [wFarCallBC + 1]
	ld c, a
	ret

MACRO update_pushed_af_flags
; Must have been preceded by 'push af'.
; Updates the flags on the stack to their current value
; without clobbering any other registers.
	push af ; pushes current flags
	push hl
	ld hl, sp+$2
	ld a, [hli] ; reads current flags
	assert HIGH(wStackBottom) == HIGH(wStackTop)
	inc l ; more efficient than 'inc hl'
	ld [hl], a ; overwrites pushed flags
	pop hl
	pop af
ENDM

RstBetterFarCall::
; Call the following dba pointer on the stack.
; Preserves a, bc, de, hl.
	ldh [hFarCallSavedA], a
	ld a, h
	ldh [hFarCallSavedH], a
	ld a, l
	ldh [hFarCallSavedL], a
	pop hl
	ld a, [hli]
	ldh [hTempBank], a
	add a
	jr c, .farjp
	inc hl
	inc hl
	push hl
	dec hl
	dec hl
.farjp
	ldh a, [hROMBank]
	push af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ldh a, [hTempBank]
	and $7f
	rst Bankswitch
	call RetrieveAHLAndCallFunction
	ldh [hFarCallSavedA], a
	update_pushed_af_flags
	pop af
	rst Bankswitch
	ldh a, [hFarCallSavedA]
	ret

StackCallInWRAMBankA::
; Call the following function in WRAM bank a.
	ldh [hTempBank], a
	ld a, h
	ldh [hFarCallSavedH], a
	ld a, l
	ldh [hFarCallSavedL], a
	pop hl
	ldh a, [rSVBK]
	push af
	ldh a, [hTempBank]
	ldh [rSVBK], a
	call RetrieveAHLAndCallFunction
	ldh [hTempBank], a
	update_pushed_af_flags
	pop af
	ldh [rSVBK], a
	ldh a, [hTempBank]
	ret

RetrieveAHLAndCallFunction::
; Call the function at hl with restored values of a and hl.
	push hl
	ld hl, hFarCallSavedHL
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ldh a, [hFarCallSavedA]
	ret
