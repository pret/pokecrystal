LoadOverworldMonIcon: ; 8e82b
	ld a, e
	call ReadMonMenuIcon
	ld l, a
	ld h, 0
	add hl, hl
	ld de, IconPointers
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld b, BANK(Icons)
	ld c, 8
	ret
; 8e83f

LoadMenuMonIcon: ; 8e83f
	push hl
	push de
	push bc
	call .LoadIcon
	pop bc
	pop de
	pop hl
	ret
; 8e849

.LoadIcon: ; 8e849
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
; 8e854


.Jumptable: ; 8e854 (23:6854)
	dw PartyMenu_InitAnimatedMonIcon ; party menu
	dw NamingScreen_InitAnimatedMonIcon ; naming screen
	dw MoveList_InitAnimatedMonIcon ; moves (?)
	dw Trade_LoadMonIconGFX ; trade
	dw Mobile_InitAnimatedMonIcon ; mobile
	dw Mobile_InitPartyMenuBGPal71 ; mobile
	dw .GetPartyMenuMonIcon ; unused


.GetPartyMenuMonIcon: ; 8e862 (23:6862)
	call InitPartyMenuIcon
	call .GetPartyMonItemGFX
	call SetPartyMonIconAnimSpeed
	ret

.GetPartyMonItemGFX: ; 8e86c (23:686c)
	push bc
	ld a, [hObjectStructIndexBuffer]
	ld hl, PartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	pop bc
	ld a, [hl]
	and a
	jr z, .no_item
	push hl
	push bc
	ld d, a
	callab ItemIsMail
	pop bc
	pop hl
	jr c, .not_mail
	ld a, $6
	jr .got_tile
.not_mail
	ld a, $5
	; jr .got_tile

.no_item
	ld a, $4
.got_tile
	ld hl, SPRITEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld [hl], a
	ret

Mobile_InitAnimatedMonIcon: ; 8e898 (23:6898)
	call PartyMenu_InitAnimatedMonIcon
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld a, SPRITE_ANIM_SEQ_NULL
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, 9 * 8
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, 9 * 8
	ld [hl], a
	ret

Mobile_InitPartyMenuBGPal71: ; 8e8b1 (23:68b1)
	call InitPartyMenuIcon
	call SetPartyMonIconAnimSpeed
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld a, SPRITE_ANIM_SEQ_NULL
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, 3 * 8
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, 12 * 8
	ld [hl], a
	ld a, c
	ld [wc608], a
	ld a, b
	ld [wc608 + 1], a
	ret

PartyMenu_InitAnimatedMonIcon: ; 8e8d5 (23:68d5)
	call InitPartyMenuIcon
	call .SpawnItemIcon
	call SetPartyMonIconAnimSpeed
	ret

.SpawnItemIcon: ; 8e8df (23:68df)
	push bc
	ld a, [hObjectStructIndexBuffer]
	ld hl, PartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	pop bc
	ld a, [hl]
	and a
	ret z
	push hl
	push bc
	ld d, a
	callab ItemIsMail
	pop bc
	pop hl
	jr c, .mail
	ld a, SPRITE_ANIM_FRAMESET_03
	jr .okay

.mail
	ld a, SPRITE_ANIM_FRAMESET_02
.okay
	ld hl, SPRITEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld [hl], a
	ret

InitPartyMenuIcon: ; 8e908 (23:6908)
	ld a, [wCurIconTile]
	push af
	ld a, [hObjectStructIndexBuffer]
	ld hl, PartySpecies
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	call ReadMonMenuIcon
	ld [CurIcon], a
	call GetMemIconGFX
	ld a, [hObjectStructIndexBuffer]
; y coord
	add a
	add a
	add a
	add a
	add $1c
	ld d, a
; x coord
	ld e, $10
; type is partymon icon
	ld a, SPRITE_ANIM_INDEX_00
	call InitSpriteAnimStruct
	pop af
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], a
	ret

SetPartyMonIconAnimSpeed: ; 8e936 (23:6936)
	push bc
	ld a, [hObjectStructIndexBuffer]
	ld b, a
	call .getspeed
	ld a, b
	pop bc
	ld hl, SPRITEANIMSTRUCT_DURATIONOFFSET
	add hl, bc
	ld [hl], a
	rlca
	rlca
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld [hl], a
	ret

.getspeed ; 8e94c (23:694c)
	callba PlacePartymonHPBar
	call GetHPPal
	ld e, d
	ld d, 0
	ld hl, .speeds
	add hl, de
	ld b, [hl]
	ret
; 8e95e (23:695e)

.speeds ; 8e95e
	db $00, $40, $80
; 8e961

NamingScreen_InitAnimatedMonIcon: ; 8e961 (23:6961)
	ld a, [wd265]
	call ReadMonMenuIcon
	ld [CurIcon], a
	xor a
	call GetIconGFX
	depixel 4, 4, 4, 0
	ld a, SPRITE_ANIM_INDEX_00
	call InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], SPRITE_ANIM_SEQ_NULL
	ret

MoveList_InitAnimatedMonIcon: ; 8e97d (23:697d)
	ld a, [wd265]
	call ReadMonMenuIcon
	ld [CurIcon], a
	xor a
	call GetIconGFX
	ld d, 3 * 8 + 2
	ld e, 4 * 8 + 4
	ld a, SPRITE_ANIM_INDEX_00
	call InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], SPRITE_ANIM_SEQ_NULL
	ret

Trade_LoadMonIconGFX: ; 8e99a (23:699a)
	ld a, [wd265]
	call ReadMonMenuIcon
	ld [CurIcon], a
	ld a, $62
	ld [wCurIconTile], a
	call GetMemIconGFX
	ret

GetSpeciesIcon: ; 8e9ac
; Load species icon into VRAM at tile a
	push de
	ld a, [wd265]
	call ReadMonMenuIcon
	ld [CurIcon], a
	pop de
	ld a, e
	call GetIconGFX
	ret
; 8e9bc


FlyFunction_GetMonIcon: ; 8e9bc (23:69bc)
	push de
	ld a, [wd265]
	call ReadMonMenuIcon
	ld [CurIcon], a
	pop de
	ld a, e
	call GetIcon_a
	ret
; 8e9cc (23:69cc)

GetMonIcon2: ; 8e9cc
; unreferenced
	push de
	ld a, [wd265]
	call ReadMonMenuIcon
	ld [CurIcon], a
	pop de
	call GetIcon_de
	ret
; 8e9db

GetMemIconGFX: ; 8e9db (23:69db)
	ld a, [wCurIconTile]
GetIconGFX: ; 8e9de
	call GetIcon_a
	ld de, $80 ; 8 tiles
	add hl, de
	ld de, HeldItemIcons
	lb bc, BANK(HeldItemIcons), 2
	call GetGFXUnlessMobile
	ld a, [wCurIconTile]
	add 10
	ld [wCurIconTile], a
	ret

HeldItemIcons:
INCBIN "gfx/icon/mail.2bpp"
INCBIN "gfx/icon/item.2bpp"
; 8ea17

GetIcon_de: ; 8ea17
; Load icon graphics into VRAM starting from tile de.
	ld l, e
	ld h, d
	jr GetIcon

GetIcon_a: ; 8ea1b
; Load icon graphics into VRAM starting from tile a.
	ld l, a
	ld h, 0

GetIcon: ; 8ea1e
; Load icon graphics into VRAM starting from tile hl.

; One tile is 16 bytes long.
rept 4
	add hl, hl
endr

	ld de, VTiles0
	add hl, de
	push hl

; The icons are contiguous, in order and of the same
; size, so the pointer table is somewhat redundant.
	ld a, [CurIcon]
	push hl
	ld l, a
	ld h, 0
	add hl, hl
	ld de, IconPointers
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl

	lb bc, BANK(Icons), 8
	call GetGFXUnlessMobile

	pop hl
	ret
; 8ea3f

GetGFXUnlessMobile: ; 8ea3f
	ld a, [wLinkMode]
	cp LINK_MOBILE
	jp nz, Request2bpp
	jp Get2bpp_2
; 8ea4a

FreezeMonIcons: ; 8ea4a
	ld hl, wSpriteAnimationStructs
	ld e, PARTY_LENGTH
	ld a, [wMenuCursorY]
	ld d, a
.loop
	ld a, [hl]
	and a
	jr z, .next
	cp d
	jr z, .loadwithtwo
	ld a, SPRITE_ANIM_SEQ_NULL
	jr .ok

.loadwithtwo
	ld a, SPRITE_ANIM_SEQ_02

.ok
	push hl
	ld c, l
	ld b, h
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], a
	pop hl

.next
	ld bc, $10
	add hl, bc
	dec e
	jr nz, .loop
	ret
; 8ea71

UnfreezeMonIcons: ; 8ea71
	ld hl, wSpriteAnimationStructs
	ld e, PARTY_LENGTH
.loop
	ld a, [hl]
	and a
	jr z, .next
	push hl
	ld c, l
	ld b, h
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], SPRITE_ANIM_SEQ_01
	pop hl
.next
	ld bc, $10
	add hl, bc
	dec e
	jr nz, .loop
	ret
; 8ea8c (23:6a8c)

HoldSwitchmonIcon: ; 8ea8c
	ld hl, wSpriteAnimationStructs
	ld e, PARTY_LENGTH
	ld a, [wSwitchMon]
	ld d, a
.loop
	ld a, [hl]
	and a
	jr z, .next
	cp d
	jr z, .is_switchmon
	ld a, SPRITE_ANIM_SEQ_03
	jr .join_back

.is_switchmon
	ld a, SPRITE_ANIM_SEQ_02
.join_back
	push hl
	ld c, l
	ld b, h
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], a
	pop hl
.next
	ld bc, $10
	add hl, bc
	dec e
	jr nz, .loop
	ret

INCLUDE "menu/mon_icons.asm"
