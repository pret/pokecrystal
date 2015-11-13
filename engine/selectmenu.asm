SelectMenu:: ; 13327

	call CheckRegisteredItem
	jr c, .NotRegistered
	jp UseRegisteredItem

.NotRegistered
	call LoadFont
	ld b, BANK(ItemMayBeRegisteredText)
	ld hl, ItemMayBeRegisteredText
	call MapTextbox
	call CloseText
	jp LoadMoveSprites
; 13340


ItemMayBeRegisteredText: ; 13340
	text_jump UnknownText_0x1c1cf3
	db "@"
; 13345


CheckRegisteredItem: ; 13345

	ld a, [WhichRegisteredItem]
	and a
	jr z, .NoRegisteredItem
	and REGISTERED_POCKET
	rlca
	rlca
	ld hl, .Pockets
	rst JumpTable
	ret

.Pockets
	dw .CheckItem
	dw .CheckBall
	dw .CheckKeyItem
	dw .CheckTMHM

.CheckItem
	ld hl, NumItems
	call .CheckRegisteredNo
	jr c, .NoRegisteredItem
	inc hl
	ld e, a
	ld d, 0
rept 2
	add hl, de
endr
	call .IsSameItem
	jr c, .NoRegisteredItem
	and a
	ret

.CheckKeyItem
	ld a, [RegisteredItem]
	ld hl, KeyItems
	ld de, 1
	call IsInArray
	jr nc, .NoRegisteredItem
	ld a, [RegisteredItem]
	ld [CurItem], a
	and a
	ret

.CheckBall
	ld hl, NumBalls
	call .CheckRegisteredNo
	jr nc, .NoRegisteredItem
	inc hl
	ld e, a
	ld d, 0
rept 2
	add hl, de
endr
	call .IsSameItem
	jr c, .NoRegisteredItem
	ret

.CheckTMHM
	jr .NoRegisteredItem

.NoRegisteredItem
	xor a
	ld [WhichRegisteredItem], a
	ld [RegisteredItem], a
	scf
	ret
; 133a6


.CheckRegisteredNo ; 133a6
	ld a, [WhichRegisteredItem]
	and REGISTERED_NUMBER
	dec a
	cp [hl]
	jr nc, .NotEnoughItems
	ld [wd107], a
	and a
	ret

.NotEnoughItems
	scf
	ret
; 133b6


.IsSameItem ; 133b6
	ld a, [RegisteredItem]
	cp [hl]
	jr nz, .NotSameItem
	ld [CurItem], a
	and a
	ret

.NotSameItem
	scf
	ret
; 133c3


UseRegisteredItem: ; 133c3

	callba CheckItemMenu
	ld a, [wItemAttributeParamBuffer]
	ld hl, .SwitchTo
	rst JumpTable
	ret

.SwitchTo
	dw .CantUse
	dw .NoFunction
	dw .NoFunction
	dw .NoFunction
	dw .Current
	dw .Party
	dw .Overworld
; 133df

.NoFunction ; 133df
	call LoadFont
	call CantUseItem
	call LoadMoveSprites
	and a
	ret
; 133ea

.Current ; 133ea
	call LoadFont
	call DoItemEffect
	call LoadMoveSprites
	and a
	ret
; 133f5

.Party ; 133f5
	call ResetWindow
	call FadeToMenu
	call DoItemEffect
	call Function2b3c
	call LoadMoveSprites
	and a
	ret
; 13406

.Overworld ; 13406
	call ResetWindow
	ld a, 1
	ld [wd0ef], a
	call DoItemEffect
	xor a
	ld [wd0ef], a
	ld a, [wd0ec]
	cp 1
	jr nz, ._cantuse
	scf
	ld a, HMENURETURN_SCRIPT
	ld [hMenuReturn], a
	ret
; 13422

.CantUse ; 13422
	call ResetWindow

._cantuse
	call CantUseItem
	call LoadMoveSprites
	and a
	ret
; 1342d
