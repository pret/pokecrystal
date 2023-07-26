SelectMonFromParty:
	call DisableSpriteUpdates
	xor a
	ld [wPartyMenuActionText], a
	call ClearBGPalettes
	call InitPartyMenuLayout
	call WaitBGMap
	call SetPalettes
	call DelayFrame
	call PartyMenuSelect
	call ReturnToMapWithSpeechTextbox
	ret

SelectTradeOrDayCareMon:
	ld a, b
	ld [wPartyMenuActionText], a
	call DisableSpriteUpdates
	call ClearBGPalettes
	call InitPartyMenuLayout
	call WaitBGMap
	ld b, SCGB_PARTY_MENU
	call GetSGBLayout
	call SetPalettes
	call DelayFrame
	call PartyMenuSelect
	call ReturnToMapWithSpeechTextbox
	ret

InitPartyMenuLayout:
	call LoadPartyMenuGFX
	call InitPartyMenuWithCancel
	call InitPartyMenuGFX
	call WritePartyMenuTilemap
	call PrintPartyMenuText
	ret

LoadPartyMenuGFX:
	call LoadFontsBattleExtra
	callfar InitPartyMenuPalettes
	callfar ClearSpriteAnims2
	ret

WritePartyMenuTilemap:
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	xor a
	ldh [hBGMapMode], a
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, " "
	call ByteFill ; blank the tilemap
	call GetPartyMenuQualityIndexes
.loop
	ld a, [hli]
	cp -1
	jr z, .end
	push hl
	ld hl, .Jumptable
	rst JumpTable
	pop hl
	jr .loop
.end
	pop af
	ld [wOptions], a
	ret

.Jumptable:
; entries correspond to PARTYMENUQUALITY_* constants
	dw PlacePartyNicknames
	dw PlacePartyHPBar
	dw PlacePartyMenuHPDigits
	dw PlacePartyMonLevel
	dw PlacePartyMonStatus
	dw PlacePartyMonTMHMCompatibility
	dw PlacePartyMonEvoStoneCompatibility
	dw PlacePartyMonGender
	dw PlacePartyMonMobileBattleSelection

PlacePartyNicknames:
	hlcoord 3, 1
	ld a, [wPartyCount]
	and a
	jr z, .end
	ld c, a
	ld b, 0
.loop
	push bc
	push hl
	push hl
	ld hl, wPartyMonNicknames
	ld a, b
	call GetNickname
	pop hl
	call PlaceString
	pop hl
	ld de, 2 * SCREEN_WIDTH
	add hl, de
	pop bc
	inc b
	dec c
	jr nz, .loop

.end
	dec hl
	dec hl
	ld de, .CancelString
	call PlaceString
	ret

.CancelString:
	db "CANCEL@"

PlacePartyHPBar:
	xor a
	ld [wSGBPals], a
	ld a, [wPartyCount]
	and a
	ret z
	ld c, a
	ld b, 0
	hlcoord 11, 2
.loop
	push bc
	push hl
	call PartyMenuCheckEgg
	jr z, .skip
	push hl
	call PlacePartymonHPBar
	pop hl
	ld d, $6
	ld b, $0
	call DrawBattleHPBar
	ld hl, wHPPals
	ld a, [wSGBPals]
	ld c, a
	ld b, 0
	add hl, bc
	call SetHPPal
	ld b, SCGB_PARTY_MENU_HP_BARS
	call GetSGBLayout
.skip
	ld hl, wSGBPals
	inc [hl]
	pop hl
	ld de, 2 * SCREEN_WIDTH
	add hl, de
	pop bc
	inc b
	dec c
	jr nz, .loop
	ld b, SCGB_PARTY_MENU
	call GetSGBLayout
	ret

PlacePartymonHPBar:
	ld a, b
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wPartyMon1HP
	call AddNTimes
	ld a, [hli]
	or [hl]
	jr nz, .not_fainted
	xor a
	ld e, a
	ld c, a
	ret

.not_fainted
	dec hl
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld e, a
	predef ComputeHPBarPixels
	ret

PlacePartyMenuHPDigits:
	ld a, [wPartyCount]
	and a
	ret z
	ld c, a
	ld b, 0
	hlcoord 13, 1
.loop
	push bc
	push hl
	call PartyMenuCheckEgg
	jr z, .next
	push hl
	ld a, b
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wPartyMon1HP
	call AddNTimes
	ld e, l
	ld d, h
	pop hl
	push de
	lb bc, 2, 3
	call PrintNum
	pop de
	ld a, "/"
	ld [hli], a
	inc de
	inc de
	lb bc, 2, 3
	call PrintNum

.next
	pop hl
	ld de, 2 * SCREEN_WIDTH
	add hl, de
	pop bc
	inc b
	dec c
	jr nz, .loop
	ret

PlacePartyMonLevel:
	ld a, [wPartyCount]
	and a
	ret z
	ld c, a
	ld b, 0
	hlcoord 8, 2
.loop
	push bc
	push hl
	call PartyMenuCheckEgg
	jr z, .next
	push hl
	ld a, b
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wPartyMon1Level
	call AddNTimes
	ld e, l
	ld d, h
	pop hl
	ld a, [de]
	cp 100 ; This is distinct from MAX_LEVEL.
	jr nc, .ThreeDigits
	ld a, "<LV>"
	ld [hli], a
	lb bc, PRINTNUM_LEFTALIGN | 1, 2
	; jr .okay
.ThreeDigits:
	lb bc, PRINTNUM_LEFTALIGN | 1, 3
; .okay
	call PrintNum

.next
	pop hl
	ld de, SCREEN_WIDTH * 2
	add hl, de
	pop bc
	inc b
	dec c
	jr nz, .loop
	ret

PlacePartyMonStatus:
	ld a, [wPartyCount]
	and a
	ret z
	ld c, a
	ld b, 0
	hlcoord 5, 2
.loop
	push bc
	push hl
	call PartyMenuCheckEgg
	jr z, .next
	push hl
	ld a, b
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wPartyMon1Status
	call AddNTimes
	ld e, l
	ld d, h
	pop hl
	call PlaceStatusString

.next
	pop hl
	ld de, SCREEN_WIDTH * 2
	add hl, de
	pop bc
	inc b
	dec c
	jr nz, .loop
	ret

PlacePartyMonTMHMCompatibility:
	ld a, [wPartyCount]
	and a
	ret z
	ld c, a
	ld b, 0
	hlcoord 12, 2
.loop
	push bc
	push hl
	call PartyMenuCheckEgg
	jr z, .next
	push hl
	ld hl, wPartySpecies
	ld e, b
	ld d, 0
	add hl, de
	ld a, [hl]
	ld [wCurPartySpecies], a
	predef CanLearnTMHMMove
	pop hl
	call .PlaceAbleNotAble
	call PlaceString

.next
	pop hl
	ld de, SCREEN_WIDTH * 2
	add hl, de
	pop bc
	inc b
	dec c
	jr nz, .loop
	ret

.PlaceAbleNotAble:
	ld a, c
	and a
	jr nz, .able
	ld de, .string_not_able
	ret

.able
	ld de, .string_able
	ret

.string_able
	db "ABLE@"

.string_not_able
	db "NOT ABLE@"

PlacePartyMonEvoStoneCompatibility:
	ld a, [wPartyCount]
	and a
	ret z
	ld c, a
	ld b, 0
	hlcoord 12, 2
.loop
	push bc
	push hl
	call PartyMenuCheckEgg
	jr z, .next
	push hl
	ld a, b
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wPartyMon1Species
	call AddNTimes
	ld a, [hl]
	dec a
	ld e, a
	ld d, 0
	ld hl, EvosAttacksPointers
	add hl, de
	add hl, de
	call .DetermineCompatibility
	pop hl
	call PlaceString

.next
	pop hl
	ld de, 2 * SCREEN_WIDTH
	add hl, de
	pop bc
	inc b
	dec c
	jr nz, .loop
	ret

.DetermineCompatibility:
	ld de, wStringBuffer1
	ld a, BANK(EvosAttacksPointers)
	ld bc, 2
	call FarCopyBytes
	ld hl, wStringBuffer1
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wStringBuffer1
	ld a, BANK("Evolutions and Attacks")
	ld bc, STRING_BUFFER_LENGTH
	call FarCopyBytes
	ld hl, wStringBuffer1
.loop2
	ld a, [hli]
	and a
	jr z, .nope
	cp EVOLVE_STAT
	jr nz, .not_four_bytes
	inc hl
.not_four_bytes
	inc hl
	inc hl
	cp EVOLVE_ITEM
	jr nz, .loop2
	dec hl
	dec hl
	ld a, [wCurItem]
	cp [hl]
	inc hl
	inc hl
	jr nz, .loop2
	ld de, .string_able
	ret

.nope
	ld de, .string_not_able
	ret

.string_able
	db "ABLE@"
.string_not_able
	db "NOT ABLE@"

PlacePartyMonGender:
	ld a, [wPartyCount]
	and a
	ret z
	ld c, a
	ld b, 0
	hlcoord 12, 2
.loop
	push bc
	push hl
	call PartyMenuCheckEgg
	jr z, .next
	ld [wCurPartySpecies], a
	push hl
	ld a, b
	ld [wCurPartyMon], a
	xor a
	ld [wMonType], a
	call GetGender
	ld de, .unknown
	jr c, .got_gender
	ld de, .male
	jr nz, .got_gender
	ld de, .female

.got_gender
	pop hl
	call PlaceString

.next
	pop hl
	ld de, 2 * SCREEN_WIDTH
	add hl, de
	pop bc
	inc b
	dec c
	jr nz, .loop
	ret

.male
	db "♂…MALE@"

.female
	db "♀…FEMALE@"

.unknown
	db "…UNKNOWN@"

PlacePartyMonMobileBattleSelection:
	ld a, [wPartyCount]
	and a
	ret z
	ld c, a
	ld b, 0
	hlcoord 12, 1
.loop
	push bc
	push hl
	ld de, .String_Sanka_Shinai
	call PlaceString
	pop hl
	ld de, 2 * SCREEN_WIDTH
	add hl, de
	pop bc
	inc b
	dec c
	jr nz, .loop
	ld a, l
	ld e, MON_NAME_LENGTH
	sub e
	ld l, a
	ld a, h
	sbc $0
	ld h, a
	ld de, .String_Kettei_Yameru
	call PlaceString
	ld b, $3
	ld c, $0
	ld hl, wd002
	ld a, [hl]
.loop2
	push hl
	push bc
	hlcoord 12, 1
.loop3
	and a
	jr z, .done
	ld de, 2 * SCREEN_WIDTH
	add hl, de
	dec a
	jr .loop3

.done
	ld de, .String_Banme
	push hl
	call PlaceString
	pop hl
	pop bc
	push bc
	push hl
	ld a, c
	ld hl, .Strings_1_2_3
	call GetNthString
	ld d, h
	ld e, l
	pop hl
	call PlaceString
	pop bc
	pop hl
	inc hl
	ld a, [hl]
	inc c
	dec b
	ret z
	jr .loop2

.String_Banme:
	db "　ばんめ　　@" ; Place
.String_Sanka_Shinai:
	db "さんかしない@" ; Cancel
.String_Kettei_Yameru:
	db "けってい　　やめる@" ; Quit
.Strings_1_2_3:
	db "１@", "２@", "３@" ; 1st, 2nd, 3rd

PartyMenuCheckEgg:
	ld a, LOW(wPartySpecies)
	add b
	ld e, a
	ld a, HIGH(wPartySpecies)
	adc 0
	ld d, a
	ld a, [de]
	cp EGG
	ret

GetPartyMenuQualityIndexes:
	ld a, [wPartyMenuActionText]
	and $f0
	jr nz, .skip
	ld a, [wPartyMenuActionText]
	and $f
	ld e, a
	ld d, 0
	ld hl, PartyMenuQualityPointers
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

.skip
	ld hl, PartyMenuQualityPointers.Default
	ret

INCLUDE "data/party_menu_qualities.asm"

InitPartyMenuGFX:
	ld hl, wPartyCount
	ld a, [hli]
	and a
	ret z
	ld c, a
	xor a
	ldh [hObjectStructIndex], a
.loop
	push bc
	push hl
	ld hl, LoadMenuMonIcon
	ld a, BANK(LoadMenuMonIcon)
	ld e, MONICON_PARTYMENU
	rst FarCall
	ldh a, [hObjectStructIndex]
	inc a
	ldh [hObjectStructIndex], a
	pop hl
	pop bc
	dec c
	jr nz, .loop
	callfar PlaySpriteAnimations
	ret

InitPartyMenuWithCancel:
; with cancel
	xor a
	ld [wSwitchMon], a
	ld de, PartyMenu2DMenuData
	call Load2DMenuData
	ld a, [wPartyCount]
	inc a
	ld [w2DMenuNumRows], a ; list length
	dec a
	ld b, a
	ld a, [wPartyMenuCursor]
	and a
	jr z, .skip
	inc b
	cp b
	jr c, .done

.skip
	ld a, 1

.done
	ld [wMenuCursorY], a
	ld a, A_BUTTON | B_BUTTON
	ld [wMenuJoypadFilter], a
	ret

InitPartyMenuNoCancel:
; no cancel
	ld de, PartyMenu2DMenuData
	call Load2DMenuData
	ld a, [wPartyCount]
	ld [w2DMenuNumRows], a ; list length
	ld b, a
	ld a, [wPartyMenuCursor]
	and a
	jr z, .skip
	inc b
	cp b
	jr c, .done
.skip
	ld a, 1
.done
	ld [wMenuCursorY], a
	ld a, A_BUTTON | B_BUTTON
	ld [wMenuJoypadFilter], a
	ret

PartyMenu2DMenuData:
	db 1, 0 ; cursor start y, x
	db 0, 1 ; rows, columns
	db $60, $00 ; flags
	dn 2, 0 ; cursor offset
	db 0 ; accepted buttons

PartyMenuSelect:
; sets carry if exitted menu.
	call StaticMenuJoypad
	call PlaceHollowCursor
	ld a, [wPartyCount]
	inc a
	ld b, a
	ld a, [wMenuCursorY] ; menu selection?
	cp b
	jr z, .exitmenu ; CANCEL
	ld [wPartyMenuCursor], a
	ldh a, [hJoyLast]
	ld b, a
	bit B_BUTTON_F, b
	jr nz, .exitmenu ; B button
	ld a, [wMenuCursorY]
	dec a
	ld [wCurPartyMon], a
	ld c, a
	ld b, 0
	ld hl, wPartySpecies
	add hl, bc
	ld a, [hl]
	ld [wCurPartySpecies], a

	ld de, SFX_READ_TEXT_2
	call PlaySFX
	call WaitSFX
	and a
	ret

.exitmenu
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	call WaitSFX
	scf
	ret

PrintPartyMenuText:
	hlcoord 0, 14
	lb bc, 2, 18
	call Textbox
	ld a, [wPartyCount]
	and a
	jr nz, .haspokemon
	ld de, YouHaveNoPKMNString
	jr .gotstring
.haspokemon
	ld a, [wPartyMenuActionText]
	and $f ; drop high nibble
	ld hl, PartyMenuStrings
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
.gotstring
	ld a, [wOptions]
	push af
	set NO_TEXT_SCROLL, a
	ld [wOptions], a
	hlcoord 1, 16 ; Coord
	call PlaceString
	pop af
	ld [wOptions], a
	ret

PartyMenuStrings:
	dw ChooseAMonString
	dw UseOnWhichPKMNString
	dw WhichPKMNString
	dw TeachWhichPKMNString
	dw MoveToWhereString
	dw UseOnWhichPKMNString
	dw ChooseAMonString ; Probably used to be ChooseAFemalePKMNString
	dw ChooseAMonString ; Probably used to be ChooseAMalePKMNString
	dw ToWhichPKMNString

ChooseAMonString:
	db "Choose a #MON.@"

UseOnWhichPKMNString:
	db "Use on which <PK><MN>?@"

WhichPKMNString:
	db "Which <PK><MN>?@"

TeachWhichPKMNString:
	db "Teach which <PK><MN>?@"

MoveToWhereString:
	db "Move to where?@"

ChooseAFemalePKMNString: ; unreferenced
	db "Choose a ♀<PK><MN>.@"

ChooseAMalePKMNString: ; unreferenced
	db "Choose a ♂<PK><MN>.@"

ToWhichPKMNString:
	db "To which <PK><MN>?@"

YouHaveNoPKMNString:
	db "You have no <PK><MN>!@"

PrintPartyMenuActionText:
	ld a, [wCurPartyMon]
	ld hl, wPartyMonNicknames
	call GetNickname
	ld a, [wPartyMenuActionText]
	and $f
	ld hl, .MenuActionTexts
	call .PrintText
	ret

.MenuActionTexts:
; entries correspond to PARTYMENUTEXT_* constants
	dw .CuredOfPoisonText
	dw .BurnWasHealedText
	dw .WasDefrostedText
	dw .WokeUpText
	dw .RidOfParalysisText
	dw .RecoveredSomeHPText
	dw .HealthReturnedText
	dw .RevitalizedText
	dw .GrewToLevelText
	dw .CameToItsSensesText

.RecoveredSomeHPText:
	text_far _RecoveredSomeHPText
	text_end

.CuredOfPoisonText:
	text_far _CuredOfPoisonText
	text_end

.RidOfParalysisText:
	text_far _RidOfParalysisText
	text_end

.BurnWasHealedText:
	text_far _BurnWasHealedText
	text_end

.WasDefrostedText:
	text_far _WasDefrostedText
	text_end

.WokeUpText:
	text_far _WokeUpText
	text_end

.HealthReturnedText:
	text_far _HealthReturnedText
	text_end

.RevitalizedText:
	text_far _RevitalizedText
	text_end

.GrewToLevelText:
	text_far _GrewToLevelText
	text_end

.CameToItsSensesText:
	text_far _CameToItsSensesText
	text_end

.PrintText:
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wOptions]
	push af
	set NO_TEXT_SCROLL, a
	ld [wOptions], a
	call PrintText
	pop af
	ld [wOptions], a
	ret
