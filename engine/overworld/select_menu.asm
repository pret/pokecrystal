SelectMenu::
	call CheckRegisteredItem
	jr c, .NotRegistered
	jp UseRegisteredItem

.NotRegistered:
	call OpenText
	ld b, BANK(ItemMayBeRegisteredText)
	ld hl, ItemMayBeRegisteredText
	call MapTextbox
	call WaitButton
	jp CloseText

ItemMayBeRegisteredText:
	text_far UnknownText_0x1c1cf3
	text_end

CheckRegisteredItem:
	ld a, [wWhichRegisteredItem]
	and a
	jr z, .NoRegisteredItem
	and REGISTERED_POCKET
	rlca
	rlca
	ld hl, .Pockets
	rst JumpTable
	ret

.Pockets:
; entries correspond to *_POCKET constants
	dw .CheckItem
	dw .CheckBall
	dw .CheckKeyItem
	dw .CheckTMHM

.CheckItem:
	ld hl, wNumItems
	call .CheckRegisteredNo
	jr c, .NoRegisteredItem
	inc hl
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	call .IsSameItem
	jr c, .NoRegisteredItem
	and a
	ret

.CheckKeyItem:
	ld a, [wRegisteredItem]
	ld hl, wKeyItems
	ld de, 1
	call IsInArray
	jr nc, .NoRegisteredItem
	ld a, [wRegisteredItem]
	ld [wCurItem], a
	and a
	ret

.CheckBall:
	ld hl, wNumBalls
	call .CheckRegisteredNo
	jr nc, .NoRegisteredItem
	inc hl
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	call .IsSameItem
	jr c, .NoRegisteredItem
	ret

.CheckTMHM:
	jr .NoRegisteredItem

.NoRegisteredItem:
	xor a
	ld [wWhichRegisteredItem], a
	ld [wRegisteredItem], a
	scf
	ret

.CheckRegisteredNo:
	ld a, [wWhichRegisteredItem]
	and REGISTERED_NUMBER
	dec a
	cp [hl]
	jr nc, .NotEnoughItems
	ld [wCurItemQuantity], a
	and a
	ret

.NotEnoughItems:
	scf
	ret

.IsSameItem:
	ld a, [wRegisteredItem]
	cp [hl]
	jr nz, .NotSameItem
	ld [wCurItem], a
	and a
	ret

.NotSameItem:
	scf
	ret

UseRegisteredItem:
	farcall CheckItemMenu
	ld a, [wItemAttributeParamBuffer]
	ld hl, .SwitchTo
	rst JumpTable
	ret

.SwitchTo:
; entries correspond to ITEMMENU_* constants
	dw .CantUse
	dw .NoFunction
	dw .NoFunction
	dw .NoFunction
	dw .Current
	dw .Party
	dw .Overworld

.NoFunction:
	call OpenText
	call CantUseItem
	call CloseText
	and a
	ret

.Current:
	call OpenText
	call DoItemEffect
	call CloseText
	and a
	ret

.Party:
	call RefreshScreen
	call FadeToMenu
	call DoItemEffect
	call CloseSubmenu
	call CloseText
	and a
	ret

.Overworld:
	call RefreshScreen
	ld a, 1
	ld [wUsingItemWithSelect], a
	call DoItemEffect
	xor a
	ld [wUsingItemWithSelect], a
	ld a, [wItemEffectSucceeded]
	cp 1
	jr nz, ._cantuse
	scf
	ld a, HMENURETURN_SCRIPT
	ldh [hMenuReturn], a
	ret

.CantUse:
	call RefreshScreen

._cantuse
	call CantUseItem
	call CloseText
	and a
	ret
