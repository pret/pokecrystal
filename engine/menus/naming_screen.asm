DEF NAMINGSCREEN_CURSOR     EQU $7e

DEF NAMINGSCREEN_BORDER     EQU "■" ; $60
DEF NAMINGSCREEN_MIDDLELINE EQU "→" ; $eb
DEF NAMINGSCREEN_UNDERLINE  EQU "<DOT>" ; $f2

_NamingScreen:
	call DisableSpriteUpdates
	call NamingScreen
	call ReturnToMapWithSpeechTextbox
	ret

NamingScreen:
	ld hl, wNamingScreenDestinationPointer
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, wNamingScreenType
	ld [hl], b
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	ldh a, [hMapAnims]
	push af
	xor a
	ldh [hMapAnims], a
	ldh a, [hInMenu]
	push af
	ld a, $1
	ldh [hInMenu], a
	call .SetUpNamingScreen
	call DelayFrame
.loop
	call NamingScreenJoypadLoop
	jr nc, .loop
	pop af
	ldh [hInMenu], a
	pop af
	ldh [hMapAnims], a
	pop af
	ld [wOptions], a
	call ClearJoypad
	ret

.SetUpNamingScreen:
	call ClearBGPalettes
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call DisableLCD
	call LoadNamingScreenGFX
	call NamingScreen_InitText
	ld a, LCDC_DEFAULT
	ldh [rLCDC], a
	call .GetNamingScreenSetup
	call WaitBGMap
	call WaitTop
	call SetPalettes
	call NamingScreen_InitNameEntry
	ret

.GetNamingScreenSetup:
	ld a, [wNamingScreenType]
	maskbits NUM_NAME_TYPES
	ld e, a
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
; entries correspond to NAME_* constants
	dw .Pokemon
	dw .Player
	dw .Rival
	dw .Mom
	dw .Box
	dw .Tomodachi
	dw .Pokemon
	dw .Pokemon

.Pokemon:
	ld a, [wCurPartySpecies]
	ld [wTempIconSpecies], a

	; Is it a PartyMon or a BoxMon?
	ld a, [wMonType]
	and a
	ld hl, wBufferMonDVs
	jr nz, .start
	ld a, MON_DVS
	call GetPartyParamLocation
.start
	ld de, wTempMonDVs
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a

	ld hl, LoadMenuMonIcon
	ld a, BANK(LoadMenuMonIcon)
	ld e, MONICON_NAMINGSCREEN
	rst FarCall
	ld a, [wCurPartySpecies]
	ld [wNamedObjectIndex], a
	call GetPokemonName
	hlcoord 5, 2
	call PlaceString
	ld l, c
	ld h, b
	ld de, .NicknameStrings
	call PlaceString
	inc de
	hlcoord 5, 4
	call PlaceString
	farcall GetGender
	jr c, .genderless
	ld a, "♂"
	jr nz, .place_gender
	ld a, "♀"
.place_gender
	hlcoord 1, 2
	ld [hl], a
.genderless
	call .StoreMonIconParams
	ret

.NicknameStrings:
	db "'S@"
	db "NICKNAME?@"

.Player:
	farcall GetPlayerIcon
	call .LoadSprite
	hlcoord 5, 2
	ld de, .PlayerNameString
	call PlaceString
	call .StoreSpriteIconParams
	ret

.PlayerNameString:
	db "YOUR NAME?@"

.Rival:
	ld de, RivalSpriteGFX
	ld b, BANK(RivalSpriteGFX)
	call .LoadSprite
	hlcoord 5, 2
	ld de, .RivalNameString
	call PlaceString
	call .StoreSpriteIconParams
	ret

.RivalNameString:
	db "RIVAL'S NAME?@"

.Mom:
	ld de, MomSpriteGFX
	ld b, BANK(MomSpriteGFX)
	call .LoadSprite
	hlcoord 5, 2
	ld de, .MomNameString
	call PlaceString
	call .StoreSpriteIconParams
	ret

.MomNameString:
	db "MOTHER'S NAME?@"

.Box:
	ld de, PokeBallSpriteGFX
	ld hl, vTiles0 tile $00
	lb bc, BANK(PokeBallSpriteGFX), 4
	call Request2bpp
	xor a ; SPRITE_ANIM_DICT_DEFAULT and tile offset $00
	ld hl, wSpriteAnimDict
	ld [hli], a
	ld [hl], a
	depixel 4, 4, 4, 0
	ld a, SPRITE_ANIM_INDEX_RED_WALK
	call InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld [hl], $0
	hlcoord 5, 2
	ld de, .BoxNameString
	call PlaceString
	call .StoreBoxIconParams
	ret

.BoxNameString:
	db "BOX NAME?@"

.Tomodachi:
	hlcoord 3, 2
	ld de, .oTomodachi_no_namae_sutoringu
	call PlaceString
	call .StoreSpriteIconParams
	ret

.oTomodachi_no_namae_sutoringu
	db "おともだち　の　なまえは？@"

.LoadSprite:
	push de
	ld hl, vTiles0 tile $00
	ld c, 4
	push bc
	call Request2bpp
	pop bc
	ld hl, 12 tiles
	add hl, de
	ld e, l
	ld d, h
	ld hl, vTiles0 tile $04
	call Request2bpp
	xor a ; SPRITE_ANIM_DICT_DEFAULT and tile offset $00
	ld hl, wSpriteAnimDict
	ld [hli], a
	ld [hl], a
	pop de
	ld b, SPRITE_ANIM_INDEX_RED_WALK
	ld a, d
	cp HIGH(KrisSpriteGFX)
	jr nz, .not_kris
	ld a, e
	cp LOW(KrisSpriteGFX)
	jr nz, .not_kris
	ld b, SPRITE_ANIM_INDEX_BLUE_WALK
.not_kris
	ld a, b
	depixel 4, 4, 4, 0
	call InitSpriteAnimStruct
	ret

.StoreMonIconParams:
	ld a, MON_NAME_LENGTH - 1
	hlcoord 5, 6
	jr .StoreParams

.StoreSpriteIconParams:
	ld a, PLAYER_NAME_LENGTH - 1
	hlcoord 5, 6
	jr .StoreParams

.StoreBoxIconParams:
	; the terminator isn't saved, so no "- 1" is needed.
	ld a, BOX_NAME_LENGTH
	hlcoord 5, 4
	jr .StoreParams

.StoreParams:
	ld [wNamingScreenMaxNameLength], a
	ld a, l
	ld [wNamingScreenStringEntryCoord], a
	ld a, h
	ld [wNamingScreenStringEntryCoord + 1], a
	ret

NamingScreen_IsTargetBox:
; Return z if [wNamingScreenType] == NAME_BOX.
	push bc
	push af
	ld a, [wNamingScreenType]
	sub NAME_BOX - 1
	ld b, a
	pop af
	dec b
	pop bc
	ret

NamingScreen_InitText:
	call WaitTop
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, NAMINGSCREEN_BORDER
	call ByteFill
	hlcoord 1, 1
	lb bc, 6, 18
	call NamingScreen_IsTargetBox
	jr nz, .not_box
	lb bc, 4, 18

.not_box
	call ClearBox
	ld de, NameInputUpper
NamingScreen_ApplyTextInputMode:
	call NamingScreen_IsTargetBox
	jr nz, .not_box
	assert BoxNameInputLower - NameInputLower == BoxNameInputUpper - NameInputUpper
	ld hl, BoxNameInputLower - NameInputLower
	add hl, de
	ld d, h
	ld e, l

.not_box
	push de
	hlcoord 1, 8
	lb bc, 7, 18
	call NamingScreen_IsTargetBox
	jr nz, .not_box_2
	hlcoord 1, 6
	lb bc, 9, 18

.not_box_2
	call ClearBox
	hlcoord 1, 16
	lb bc, 1, 18
	call ClearBox
	pop de
	hlcoord 2, 8
	ld b, $5
	call NamingScreen_IsTargetBox
	jr nz, .row
	hlcoord 2, 6
	ld b, $6

.row
	ld c, $11
.col
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .col
	push de
	ld de, 2 * SCREEN_WIDTH - $11
	add hl, de
	pop de
	dec b
	jr nz, .row
	ret

NamingScreenJoypadLoop:
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .quit
	call .RunJumptable
	farcall PlaySpriteAnimationsAndDelayFrame
	call .UpdateStringEntry
	call DelayFrame
	and a
	ret

.quit
	callfar ClearSpriteAnims
	call ClearSprites
	xor a
	ldh [hSCX], a
	ldh [hSCY], a
	scf
	ret

.UpdateStringEntry:
	xor a
	ldh [hBGMapMode], a
	hlcoord 1, 5
	call NamingScreen_IsTargetBox
	jr nz, .got_coords
	hlcoord 1, 3

.got_coords
	lb bc, 1, 18
	call ClearBox
	ld hl, wNamingScreenDestinationPointer
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, wNamingScreenStringEntryCoord
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PlaceString
	ld a, $1
	ldh [hBGMapMode], a
	ret

.RunJumptable:
	jumptable .Jumptable, wJumptableIndex

.Jumptable:
	dw .InitCursor
	dw .ReadButtons

.InitCursor:
	depixel 10, 3
	call NamingScreen_IsTargetBox
	jr nz, .got_cursor_position
	ld d, 8 * 8
.got_cursor_position
	ld a, SPRITE_ANIM_INDEX_NAMING_SCREEN_CURSOR
	call InitSpriteAnimStruct
	ld a, c
	ld [wNamingScreenCursorObjectPointer], a
	ld a, b
	ld [wNamingScreenCursorObjectPointer + 1], a
	ld hl, SPRITEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld a, [hl]
	ld hl, SPRITEANIMSTRUCT_VAR3
	add hl, bc
	ld [hl], a
	ld hl, wJumptableIndex
	inc [hl]
	ret

.ReadButtons:
	ld hl, hJoyPressed
	ld a, [hl]
	and A_BUTTON
	jr nz, .a
	ld a, [hl]
	and B_BUTTON
	jr nz, .b
	ld a, [hl]
	and START
	jr nz, .start
	ld a, [hl]
	and SELECT
	jr nz, .select
	ret

.a
	call .GetCursorPosition
	cp $1
	jr z, .select
	cp $2
	jr z, .b
	cp $3
	jr z, .end
	call NamingScreen_GetLastCharacter
	call NamingScreen_TryAddCharacter
	ret nc

.start
	ld hl, wNamingScreenCursorObjectPointer
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $8
	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], $4
	call NamingScreen_IsTargetBox
	ret nz
	inc [hl]
	ret

.b
	call NamingScreen_DeleteCharacter
	ret

.end
	call NamingScreen_StoreEntry
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

.select
	ld hl, wNamingScreenLetterCase
	ld a, [hl]
	xor 1
	ld [hl], a
	jr z, .upper
	ld de, NameInputLower
	call NamingScreen_ApplyTextInputMode
	ret

.upper
	ld de, NameInputUpper
	call NamingScreen_ApplyTextInputMode
	ret

.GetCursorPosition:
	ld hl, wNamingScreenCursorObjectPointer
	ld c, [hl]
	inc hl
	ld b, [hl]

NamingScreen_GetCursorPosition:
	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	push bc
	ld b, $4
	call NamingScreen_IsTargetBox
	jr nz, .not_box
	inc b
.not_box
	cp b
	pop bc
	jr nz, .not_bottom_row
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	cp $3
	jr c, .case_switch
	cp $6
	jr c, .delete
	ld a, $3
	ret

.case_switch
	ld a, $1
	ret

.delete
	ld a, $2
	ret

.not_bottom_row
	xor a
	ret

NamingScreen_AnimateCursor:
	call .GetDPad
	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	ld e, a
	swap e
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], e
	ld d, $4
	call NamingScreen_IsTargetBox
	jr nz, .ok
	inc d
.ok
	cp d
	ld de, .LetterEntries
	ld a, SPRITE_ANIM_FRAMESET_TEXT_ENTRY_CURSOR - SPRITE_ANIM_FRAMESET_TEXT_ENTRY_CURSOR ; 0
	jr nz, .ok2
	ld de, .CaseDelEnd
	ld a, SPRITE_ANIM_FRAMESET_TEXT_ENTRY_CURSOR_BIG - SPRITE_ANIM_FRAMESET_TEXT_ENTRY_CURSOR ; 1
.ok2
	ld hl, SPRITEANIMSTRUCT_VAR3
	add hl, bc
	add [hl] ; default SPRITE_ANIM_FRAMESET_TEXT_ENTRY_CURSOR
	ld hl, SPRITEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld l, [hl]
	ld h, $0
	add hl, de
	ld a, [hl]
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.LetterEntries:
	db $00, $10, $20, $30, $40, $50, $60, $70, $80

.CaseDelEnd:
	db $00, $00, $00, $30, $30, $30, $60, $60, $60

.GetDPad:
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .up
	ld a, [hl]
	and D_DOWN
	jr nz, .down
	ld a, [hl]
	and D_LEFT
	jr nz, .left
	ld a, [hl]
	and D_RIGHT
	jr nz, .right
	ret

.right
	call NamingScreen_GetCursorPosition
	and a
	jr nz, .target_right
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	cp $8
	jr nc, .wrap_left
	inc [hl]
	ret

.wrap_left
	ld [hl], $0
	ret

.target_right
	cp $3
	jr nz, .no_wrap_target_left
	xor a
.no_wrap_target_left
	ld e, a
	add a
	add e
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], a
	ret

.left
	call NamingScreen_GetCursorPosition
	and a
	jr nz, .target_left
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	and a
	jr z, .wrap_right
	dec [hl]
	ret

.wrap_right
	ld [hl], $8
	ret

.target_left
	cp $1
	jr nz, .no_wrap_target_right
	ld a, $4
.no_wrap_target_right
	dec a
	dec a
	ld e, a
	add a
	add e
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], a
	ret

.down
	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	call NamingScreen_IsTargetBox
	jr nz, .not_box
	cp $5
	jr nc, .wrap_up
	inc [hl]
	ret

.not_box
	cp $4
	jr nc, .wrap_up
	inc [hl]
	ret

.wrap_up
	ld [hl], $0
	ret

.up
	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	and a
	jr z, .wrap_down
	dec [hl]
	ret

.wrap_down
	ld [hl], $4
	call NamingScreen_IsTargetBox
	ret nz
	inc [hl]
	ret

NamingScreen_TryAddCharacter:
	ld a, [wNamingScreenLastCharacter] ; lost
MailComposition_TryAddCharacter:
	ld a, [wNamingScreenMaxNameLength]
	ld c, a
	ld a, [wNamingScreenCurNameLength]
	cp c
	ret nc

	ld a, [wNamingScreenLastCharacter]

NamingScreen_LoadNextCharacter:
	call NamingScreen_GetTextCursorPosition
	ld [hl], a

NamingScreen_AdvanceCursor_CheckEndOfString:
	ld hl, wNamingScreenCurNameLength
	inc [hl]
	call NamingScreen_GetTextCursorPosition
	ld a, [hl]
	cp "@"
	jr z, .end_of_string
	ld [hl], NAMINGSCREEN_UNDERLINE
	and a
	ret

.end_of_string
	scf
	ret

AddDakutenToCharacter: ; unreferenced
	ld a, [wNamingScreenCurNameLength]
	and a
	ret z
	push hl
	ld hl, wNamingScreenCurNameLength
	dec [hl]
	call NamingScreen_GetTextCursorPosition
	ld c, [hl]
	pop hl

.loop
	ld a, [hli]
	cp -1
	jr z, NamingScreen_AdvanceCursor_CheckEndOfString
	cp c
	jr z, .done
	inc hl
	jr .loop

.done
	ld a, [hl]
	jr NamingScreen_LoadNextCharacter

INCLUDE "data/text/unused_dakutens.asm"

NamingScreen_DeleteCharacter:
	ld hl, wNamingScreenCurNameLength
	ld a, [hl]
	and a
	ret z
	dec [hl]
	call NamingScreen_GetTextCursorPosition
	ld [hl], NAMINGSCREEN_UNDERLINE
	inc hl
	ld a, [hl]
	cp NAMINGSCREEN_UNDERLINE
	ret nz
	ld [hl], NAMINGSCREEN_MIDDLELINE
	ret

NamingScreen_GetTextCursorPosition:
	push af
	ld hl, wNamingScreenDestinationPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wNamingScreenCurNameLength]
	ld e, a
	ld d, 0
	add hl, de
	pop af
	ret

NamingScreen_InitNameEntry:
; load NAMINGSCREEN_UNDERLINE, (NAMINGSCREEN_MIDDLELINE * [wNamingScreenMaxNameLength]), "@" into the dw address at wNamingScreenDestinationPointer
	ld hl, wNamingScreenDestinationPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld [hl], NAMINGSCREEN_UNDERLINE
	inc hl
	ld a, [wNamingScreenMaxNameLength]
	dec a
	ld c, a
	ld a, NAMINGSCREEN_MIDDLELINE
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	ld [hl], "@"
	ret

NamingScreen_StoreEntry:
	ld hl, wNamingScreenDestinationPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wNamingScreenMaxNameLength]
	ld c, a
.loop
	ld a, [hl]
	cp NAMINGSCREEN_MIDDLELINE
	jr z, .terminator
	cp NAMINGSCREEN_UNDERLINE
	jr nz, .not_terminator
.terminator
	ld [hl], "@"
.not_terminator
	inc hl
	dec c
	jr nz, .loop
	ret

NamingScreen_GetLastCharacter:
	ld hl, wNamingScreenCursorObjectPointer
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	add [hl]
	sub $8
	srl a
	srl a
	srl a
	ld e, a
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	add [hl]
	sub $10
	srl a
	srl a
	srl a
	ld d, a
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH
.loop
	ld a, d
	and a
	jr z, .done
	add hl, bc
	dec d
	jr .loop

.done
	add hl, de
	ld a, [hl]
	ld [wNamingScreenLastCharacter], a
	ret

LoadNamingScreenGFX:
	call ClearSprites
	callfar ClearSpriteAnims
	call LoadStandardFont
	call LoadFontsExtra

	ld de, NamingScreenGFX_MiddleLine
	ld hl, vTiles0 tile NAMINGSCREEN_MIDDLELINE
	lb bc, BANK(NamingScreenGFX_MiddleLine), 1
	call Get1bpp

	ld de, NamingScreenGFX_UnderLine
	ld hl, vTiles0 tile NAMINGSCREEN_UNDERLINE
	lb bc, BANK(NamingScreenGFX_UnderLine), 1
	call Get1bpp

	ld de, vTiles2 tile NAMINGSCREEN_BORDER
	ld hl, NamingScreenGFX_Border
	ld bc, 1 tiles
	ld a, BANK(NamingScreenGFX_Border)
	call FarCopyBytes

	ld de, vTiles0 tile NAMINGSCREEN_CURSOR
	ld hl, NamingScreenGFX_Cursor
	ld bc, 2 tiles
	ld a, BANK(NamingScreenGFX_Cursor)
	call FarCopyBytes

	ld a, SPRITE_ANIM_DICT_TEXT_CURSOR
	ld hl, wSpriteAnimDict + (NUM_SPRITEANIMDICT_ENTRIES - 1) * 2
	ld [hli], a
	ld [hl], NAMINGSCREEN_CURSOR
	xor a
	ldh [hSCY], a
	ld [wGlobalAnimYOffset], a
	ldh [hSCX], a
	ld [wGlobalAnimXOffset], a
	ld [wJumptableIndex], a
	ld [wNamingScreenLetterCase], a
	ldh [hBGMapMode], a
	ld [wNamingScreenCurNameLength], a
	ld a, $7
	ldh [hWX], a
	ret

NamingScreenGFX_Border:
INCBIN "gfx/naming_screen/border.2bpp"

NamingScreenGFX_Cursor:
INCBIN "gfx/naming_screen/cursor.2bpp"

INCLUDE "data/text/name_input_chars.asm"

NamingScreenGFX_End: ; unreferenced
INCBIN "gfx/naming_screen/end.1bpp"

NamingScreenGFX_MiddleLine:
INCBIN "gfx/naming_screen/middle_line.1bpp"

NamingScreenGFX_UnderLine:
INCBIN "gfx/naming_screen/underline.1bpp"

_ComposeMailMessage:
	ld hl, wNamingScreenDestinationPointer
	ld [hl], e
	inc hl
	ld [hl], d
	ldh a, [hMapAnims]
	push af
	xor a
	ldh [hMapAnims], a
	ldh a, [hInMenu]
	push af
	ld a, $1
	ldh [hInMenu], a
	call .InitBlankMail
	call DelayFrame

.loop
	call .DoMailEntry
	jr nc, .loop

	pop af
	ldh [hInMenu], a
	pop af
	ldh [hMapAnims], a
	ret

.InitBlankMail:
	call ClearBGPalettes
	call DisableLCD
	call LoadNamingScreenGFX
	ld de, vTiles0 tile $00
	ld hl, .MailIcon
	ld bc, 8 tiles
	ld a, BANK(.MailIcon)
	call FarCopyBytes
	xor a ; SPRITE_ANIM_DICT_DEFAULT and tile offset $00
	ld hl, wSpriteAnimDict
	ld [hli], a
	ld [hl], a

	; init mail icon
	depixel 3, 2
	ld a, SPRITE_ANIM_INDEX_PARTY_MON
	call InitSpriteAnimStruct

	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], $0
	call .InitCharset
	ld a, LCDC_DEFAULT
	ldh [rLCDC], a
	call .initwNamingScreenMaxNameLength
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call WaitBGMap
	call WaitTop
	ld a, %11100100
	call DmgToCgbBGPals
	ld a, %11100100
	call DmgToCgbObjPal0
	call NamingScreen_InitNameEntry
	ld hl, wNamingScreenDestinationPointer
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, MAIL_LINE_LENGTH
	add hl, de
	ld [hl], "<NEXT>"
	ret

.MailIcon:
INCBIN "gfx/naming_screen/mail.2bpp"

.initwNamingScreenMaxNameLength
	ld a, MAIL_MSG_LENGTH + 1
	ld [wNamingScreenMaxNameLength], a
	ret

.PleaseWriteAMailString: ; unreferenced
	db "メールを　かいてね@"

.InitCharset:
	call WaitTop
	hlcoord 0, 0
	ld bc, 6 * SCREEN_WIDTH
	ld a, NAMINGSCREEN_BORDER
	call ByteFill
	hlcoord 0, 6
	ld bc, 12 * SCREEN_WIDTH
	ld a, " "
	call ByteFill
	hlcoord 1, 1
	lb bc, 4, SCREEN_WIDTH - 2
	call ClearBox
	ld de, MailEntry_Uppercase

.PlaceMailCharset:
	hlcoord 1, 7
	ld b, 6
.next
	ld c, SCREEN_WIDTH - 1
.loop_
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .loop_
	push de
	ld de, SCREEN_WIDTH + 1
	add hl, de
	pop de
	dec b
	jr nz, .next
	ret

.DoMailEntry:
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .exit_mail
	call .DoJumptable
	farcall PlaySpriteAnimationsAndDelayFrame
	call .Update
	call DelayFrame
	and a
	ret

.exit_mail
	callfar ClearSpriteAnims
	call ClearSprites
	xor a
	ldh [hSCX], a
	ldh [hSCY], a
	scf
	ret

.Update:
	xor a
	ldh [hBGMapMode], a
	hlcoord 1, 1
	lb bc, 4, 18
	call ClearBox
	ld hl, wNamingScreenDestinationPointer
	ld e, [hl]
	inc hl
	ld d, [hl]
	hlcoord 2, 2
	call PlaceString
	ld a, $1
	ldh [hBGMapMode], a
	ret

.DoJumptable:
	jumptable .Jumptable, wJumptableIndex

.Jumptable:
	dw .init_blinking_cursor
	dw .process_joypad

.init_blinking_cursor
	depixel 9, 2
	ld a, SPRITE_ANIM_INDEX_COMPOSE_MAIL_CURSOR
	call InitSpriteAnimStruct
	ld a, c
	ld [wNamingScreenCursorObjectPointer], a
	ld a, b
	ld [wNamingScreenCursorObjectPointer + 1], a
	ld hl, SPRITEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld a, [hl]
	ld hl, SPRITEANIMSTRUCT_VAR3
	add hl, bc
	ld [hl], a
	ld hl, wJumptableIndex
	inc [hl]
	ret

.process_joypad
	ld hl, hJoyPressed
	ld a, [hl]
	and A_BUTTON
	jr nz, .a
	ld a, [hl]
	and B_BUTTON
	jr nz, .b
	ld a, [hl]
	and START
	jr nz, .start
	ld a, [hl]
	and SELECT
	jr nz, .select
	ret

.a
	call NamingScreen_PressedA_GetCursorCommand
	cp $1
	jr z, .select
	cp $2
	jr z, .b
	cp $3
	jr z, .finished
	call NamingScreen_GetLastCharacter
	call MailComposition_TryAddLastCharacter
	jr c, .start
	ld hl, wNamingScreenCurNameLength
	ld a, [hl]
	cp MAIL_LINE_LENGTH
	ret nz
	inc [hl]
	call NamingScreen_GetTextCursorPosition
	ld [hl], NAMINGSCREEN_UNDERLINE
	dec hl
	ld [hl], "<NEXT>"
	ret

.start
	ld hl, wNamingScreenCursorObjectPointer
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $9
	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], $5
	ret

.b
	call NamingScreen_DeleteCharacter
	ld hl, wNamingScreenCurNameLength
	ld a, [hl]
	cp MAIL_LINE_LENGTH
	ret nz
	dec [hl]
	call NamingScreen_GetTextCursorPosition
	ld [hl], NAMINGSCREEN_UNDERLINE
	inc hl
	ld [hl], "<NEXT>"
	ret

.finished
	call NamingScreen_StoreEntry
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

.select
	ld hl, wNamingScreenLetterCase
	ld a, [hl]
	xor 1
	ld [hl], a
	jr nz, .switch_to_lowercase
	ld de, MailEntry_Uppercase
	call .PlaceMailCharset
	ret

.switch_to_lowercase
	ld de, MailEntry_Lowercase
	call .PlaceMailCharset
	ret

; called from engine/gfx/sprite_anims.asm

ComposeMail_AnimateCursor:
	call .GetDPad
	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	ld e, a
	swap e
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], e
	cp $5
	ld de, .LetterEntries
	ld a, 0
	jr nz, .got_pointer
	ld de, .CaseDelEnd
	ld a, 1
.got_pointer
	ld hl, SPRITEANIMSTRUCT_VAR3
	add hl, bc
	add [hl]
	ld hl, SPRITEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld l, [hl]
	ld h, 0
	add hl, de
	ld a, [hl]
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.LetterEntries:
	db $00, $10, $20, $30, $40, $50, $60, $70, $80, $90

.CaseDelEnd:
	db $00, $00, $00, $30, $30, $30, $60, $60, $60, $60

.GetDPad:
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .up
	ld a, [hl]
	and D_DOWN
	jr nz, .down
	ld a, [hl]
	and D_LEFT
	jr nz, .left
	ld a, [hl]
	and D_RIGHT
	jr nz, .right
	ret

.right
	call ComposeMail_GetCursorPosition
	and a
	jr nz, .case_del_done_right
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	cp $9
	jr nc, .wrap_around_letter_right
	inc [hl]
	ret

.wrap_around_letter_right
	ld [hl], $0
	ret

.case_del_done_right
	cp $3
	jr nz, .wrap_around_command_right
	xor a
.wrap_around_command_right
	ld e, a
	add a
	add e
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], a
	ret

.left
	call ComposeMail_GetCursorPosition
	and a
	jr nz, .caps_del_done_left
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	and a
	jr z, .wrap_around_letter_left
	dec [hl]
	ret

.wrap_around_letter_left
	ld [hl], $9
	ret

.caps_del_done_left
	cp $1
	jr nz, .wrap_around_command_left
	ld a, $4
.wrap_around_command_left
	dec a
	dec a
	ld e, a
	add a
	add e
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], a
	ret

.down
	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	cp $5
	jr nc, .wrap_around_down
	inc [hl]
	ret

.wrap_around_down
	ld [hl], $0
	ret

.up
	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	and a
	jr z, .wrap_around_up
	dec [hl]
	ret

.wrap_around_up
	ld [hl], $5
	ret

NamingScreen_PressedA_GetCursorCommand:
	ld hl, wNamingScreenCursorObjectPointer
	ld c, [hl]
	inc hl
	ld b, [hl]

ComposeMail_GetCursorPosition:
	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	cp $5
	jr nz, .letter
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	cp $3
	jr c, .case
	cp $6
	jr c, .del
	ld a, $3
	ret

.case
	ld a, $1
	ret

.del
	ld a, $2
	ret

.letter
	xor a
	ret

MailComposition_TryAddLastCharacter:
	ld a, [wNamingScreenLastCharacter]
	jp MailComposition_TryAddCharacter

.add_dakuten ; unreferenced
	ld a, [wNamingScreenCurNameLength]
	and a
	ret z
	cp $11
	jr nz, .one_back
	push hl
	ld hl, wNamingScreenCurNameLength
	dec [hl]
	dec [hl]
	jr .continue

.one_back
	push hl
	ld hl, wNamingScreenCurNameLength
	dec [hl]

.continue
	call NamingScreen_GetTextCursorPosition
	ld c, [hl]
	pop hl
.loop
	ld a, [hli]
	cp -1 ; end?
	jp z, NamingScreen_AdvanceCursor_CheckEndOfString
	cp c
	jr z, .done
	inc hl
	jr .loop

.done
	ld a, [hl]
	jp NamingScreen_LoadNextCharacter

INCLUDE "data/text/mail_input_chars.asm"
