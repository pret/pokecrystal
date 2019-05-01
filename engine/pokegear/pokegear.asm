; Pokégear cards
	const_def
	const POKEGEARCARD_CLOCK ; 0
	const POKEGEARCARD_MAP   ; 1
	const POKEGEARCARD_PHONE ; 2
	const POKEGEARCARD_RADIO ; 3
NUM_POKEGEAR_CARDS EQU const_value

; PokegearJumptable.Jumptable indexes
	const_def
	const POKEGEARSTATE_CLOCKINIT       ; 0
	const POKEGEARSTATE_CLOCKJOYPAD     ; 1
	const POKEGEARSTATE_MAPCHECKREGION  ; 2
	const POKEGEARSTATE_JOHTOMAPINIT    ; 3
	const POKEGEARSTATE_JOHTOMAPJOYPAD  ; 4
	const POKEGEARSTATE_KANTOMAPINIT    ; 5
	const POKEGEARSTATE_KANTOMAPJOYPAD  ; 6
	const POKEGEARSTATE_PHONEINIT       ; 7
	const POKEGEARSTATE_PHONEJOYPAD     ; 8
	const POKEGEARSTATE_MAKEPHONECALL   ; 9
	const POKEGEARSTATE_FINISHPHONECALL ; a
	const POKEGEARSTATE_RADIOINIT       ; b
	const POKEGEARSTATE_RADIOJOYPAD     ; c


SECTION "engine/pokegear/pokegear.asm", ROMX, BANK[BANK_PHONE_CALL]

PokeGear:
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	ldh a, [hInMenu]
	push af
	ld a, $1
	ldh [hInMenu], a
	ld a, [wVramState]
	push af
	xor a
	ld [wVramState], a
	call .InitTilemap
	call DelayFrame
.loop
	call UpdateTime
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .done
	call PokegearJumptable
	farcall PlaySpriteAnimations
	call DelayFrame
	jr .loop

.done
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	call WaitSFX
	pop af
	ld [wVramState], a
	pop af
	ldh [hInMenu], a
	pop af
	ld [wOptions], a
	call ClearBGPalettes
	xor a ; LOW(vBGMap0)
	ldh [hBGMapAddress], a
	ld a, HIGH(vBGMap0)
	ldh [hBGMapAddress + 1], a
	ld a, $90
	ldh [hWY], a
	call ExitPokegearRadio_HandleMusic
	ret

.InitTilemap:
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	call DisableLCD
	xor a
	ldh [hSCY], a
	ldh [hSCX], a
	ld a, $7
	ldh [hWX], a
	call Pokegear_LoadGFX
	farcall ClearSpriteAnims
	call InitPokegearModeIndicatorArrow
	ld a, 8
	call SkipMusic
	ld a, LCDC_DEFAULT
	ldh [rLCDC], a
	call TownMap_InitCursorAndPlayerIconPositions
	xor a
	ld [wJumptableIndex], a ; POKEGEARSTATE_CLOCKINIT
	ld [wPokegearCard], a ; POKEGEARCARD_CLOCK
	ld [wPokegearMapRegion], a ; JOHTO_REGION
	ld [wcf66], a
	ld [wPokegearPhoneScrollPosition], a
	ld [wPokegearPhoneCursorPosition], a
	ld [wPokegearPhoneSelectedPerson], a
	ld [wPokegearRadioChannelBank], a
	ld [wPokegearRadioChannelAddr], a
	ld [wPokegearRadioChannelAddr + 1], a
	call Pokegear_InitJumptableIndices
	call InitPokegearTilemap
	ld b, SCGB_POKEGEAR_PALS
	call GetSGBLayout
	call SetPalettes
	ldh a, [hCGB]
	and a
	ret z
	ld a, %11100100
	call DmgToCgbObjPal0
	ret

Pokegear_LoadGFX:
	call ClearVBank1
	ld hl, TownMapGFX
	ld de, vTiles2
	ld a, BANK(TownMapGFX)
	call FarDecompress
	ld hl, PokegearGFX
	ld de, vTiles2 tile $30
	ld a, BANK(PokegearGFX)
	call FarDecompress
	ld hl, PokegearSpritesGFX
	ld de, vTiles0
	ld a, BANK(PokegearSpritesGFX)
	call Decompress
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetWorldMapLocation
	cp FAST_SHIP
	jr z, .ssaqua
	farcall GetPlayerIcon
	push de
	ld h, d
	ld l, e
	ld a, b
	; standing sprite
	push af
	ld de, vTiles0 tile $10
	ld bc, 4 tiles
	call FarCopyBytes
	pop af
	pop hl
	; walking sprite
	ld de, 12 tiles
	add hl, de
	ld de, vTiles0 tile $14
	ld bc, 4 tiles
	call FarCopyBytes
	ret

.ssaqua
	ld hl, FastShipGFX
	ld de, vTiles0 tile $10
	ld bc, 8 tiles
	call CopyBytes
	ret

FastShipGFX:
INCBIN "gfx/pokegear/fast_ship.2bpp"

InitPokegearModeIndicatorArrow:
	depixel 4, 2, 4, 0
	ld a, SPRITE_ANIM_INDEX_POKEGEAR_ARROW
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $0
	ret

AnimatePokegearModeIndicatorArrow:
	ld hl, wPokegearCard
	ld e, [hl]
	ld d, 0
	ld hl, .XCoords
	add hl, de
	ld a, [hl]
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.XCoords:
	db $00 ; POKEGEARCARD_CLOCK
	db $10 ; POKEGEARCARD_MAP
	db $20 ; POKEGEARCARD_PHONE
	db $30 ; POKEGEARCARD_RADIO

TownMap_GetCurrentLandmark:
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetWorldMapLocation
	cp SPECIAL_MAP
	ret nz
	ld a, [wBackupMapGroup]
	ld b, a
	ld a, [wBackupMapNumber]
	ld c, a
	call GetWorldMapLocation
	ret

TownMap_InitCursorAndPlayerIconPositions:
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetWorldMapLocation
	cp FAST_SHIP
	jr z, .FastShip
	cp SPECIAL_MAP
	jr nz, .LoadLandmark
	ld a, [wBackupMapGroup]
	ld b, a
	ld a, [wBackupMapNumber]
	ld c, a
	call GetWorldMapLocation
.LoadLandmark:
	ld [wPokegearMapPlayerIconLandmark], a
	ld [wPokegearMapCursorLandmark], a
	ret

.FastShip:
	ld [wPokegearMapPlayerIconLandmark], a
	ld a, NEW_BARK_TOWN
	ld [wPokegearMapCursorLandmark], a
	ret

Pokegear_InitJumptableIndices:
	ld a, POKEGEARSTATE_CLOCKINIT
	ld [wJumptableIndex], a
	xor a ; POKEGEARCARD_CLOCK
	ld [wPokegearCard], a
	ret

InitPokegearTilemap:
	xor a
	ldh [hBGMapMode], a
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, $4f
	call ByteFill
	ld a, [wPokegearCard]
	maskbits NUM_POKEGEAR_CARDS
	add a
	ld e, a
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .return_from_jumptable
	push de
	jp hl

.return_from_jumptable
	call Pokegear_FinishTilemap
	farcall TownMapPals
	ld a, [wPokegearMapRegion]
	and a
	jr nz, .kanto_0
	xor a ; LOW(vBGMap0)
	ldh [hBGMapAddress], a
	ld a, HIGH(vBGMap0)
	ldh [hBGMapAddress + 1], a
	call .UpdateBGMap
	ld a, $90
	jr .finish

.kanto_0
	xor a ; LOW(vBGMap1)
	ldh [hBGMapAddress], a
	ld a, HIGH(vBGMap1)
	ldh [hBGMapAddress + 1], a
	call .UpdateBGMap
	xor a
.finish
	ldh [hWY], a
	; swap region maps
	ld a, [wPokegearMapRegion]
	maskbits NUM_REGIONS
	xor 1
	ld [wPokegearMapRegion], a
	ret

.UpdateBGMap:
	ldh a, [hCGB]
	and a
	jr z, .dmg
	ld a, $2
	ldh [hBGMapMode], a
	ld c, 3
	call DelayFrames
.dmg
	call WaitBGMap
	ret

.Jumptable:
; entries correspond to POKEGEARCARD_* constants
	dw .Clock
	dw .Map
	dw .Phone
	dw .Radio

.Clock:
	ld de, ClockTilemapRLE
	call Pokegear_LoadTilemapRLE
	hlcoord 12, 1
	ld de, .switch
	call PlaceString
	hlcoord 0, 12
	lb bc, 4, 18
	call Textbox
	call Pokegear_UpdateClock
	ret

.switch
	db " SWITCH▶@"

.Map:
	ld a, [wPokegearMapPlayerIconLandmark]
	cp FAST_SHIP
	jr z, .johto
	cp KANTO_LANDMARK
	jr nc, .kanto
.johto
	ld e, 0
	jr .ok

.kanto
	ld e, 1
.ok
	farcall PokegearMap
	ld a, $07
	ld bc, $12
	hlcoord 1, 2
	call ByteFill
	hlcoord 0, 2
	ld [hl], $06
	hlcoord 19, 2
	ld [hl], $17
	ld a, [wPokegearMapCursorLandmark]
	call PokegearMap_UpdateLandmarkName
	ret

.Radio:
	ld de, RadioTilemapRLE
	call Pokegear_LoadTilemapRLE
	hlcoord 0, 12
	lb bc, 4, 18
	call Textbox
	ret

.Phone:
	ld de, PhoneTilemapRLE
	call Pokegear_LoadTilemapRLE
	hlcoord 0, 12
	lb bc, 4, 18
	call Textbox
	call .PlacePhoneBars
	call PokegearPhone_UpdateDisplayList
	ret

.PlacePhoneBars:
	hlcoord 17, 1
	ld a, $3c
	ld [hli], a
	inc a
	ld [hl], a
	hlcoord 17, 2
	inc a
	ld [hli], a
	call GetMapPhoneService
	and a
	ret nz
	hlcoord 18, 2
	ld [hl], $3f
	ret

Pokegear_FinishTilemap:
	hlcoord 0, 0
	ld bc, $8
	ld a, $4f
	call ByteFill
	hlcoord 0, 1
	ld bc, $8
	ld a, $4f
	call ByteFill
	ld de, wPokegearFlags
	ld a, [de]
	bit POKEGEAR_MAP_CARD_F, a
	call nz, .PlaceMapIcon
	ld a, [de]
	bit POKEGEAR_PHONE_CARD_F, a
	call nz, .PlacePhoneIcon
	ld a, [de]
	bit POKEGEAR_RADIO_CARD_F, a
	call nz, .PlaceRadioIcon
	hlcoord 0, 0
	ld a, $46
	call .PlacePokegearCardIcon
	ret

.PlaceMapIcon:
	hlcoord 2, 0
	ld a, $40
	jr .PlacePokegearCardIcon

.PlacePhoneIcon:
	hlcoord 4, 0
	ld a, $44
	jr .PlacePokegearCardIcon

.PlaceRadioIcon:
	hlcoord 6, 0
	ld a, $42
.PlacePokegearCardIcon:
	ld [hli], a
	inc a
	ld [hld], a
	ld bc, $14
	add hl, bc
	add $f
	ld [hli], a
	inc a
	ld [hld], a
	ret

PokegearJumptable:
	ld a, [wJumptableIndex]
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
; entries correspond to POKEGEARSTATE_* constants
	dw PokegearClock_Init
	dw PokegearClock_Joypad
	dw PokegearMap_CheckRegion
	dw PokegearMap_Init
	dw PokegearMap_JohtoMap
	dw PokegearMap_Init
	dw PokegearMap_KantoMap
	dw PokegearPhone_Init
	dw PokegearPhone_Joypad
	dw PokegearPhone_MakePhoneCall
	dw PokegearPhone_FinishPhoneCall
	dw PokegearRadio_Init
	dw PokegearRadio_Joypad

PokegearClock_Init:
	call InitPokegearTilemap
	ld hl, PokegearText_PressAnyButtonToExit
	call PrintText
	ld hl, wJumptableIndex
	inc [hl]
	call ExitPokegearRadio_HandleMusic
	ret

PokegearClock_Joypad:
	call .UpdateClock
	ld hl, hJoyLast
	ld a, [hl]
	and A_BUTTON | B_BUTTON | START | SELECT
	jr nz, .quit
	ld a, [hl]
	and D_RIGHT
	ret z
	ld a, [wPokegearFlags]
	bit POKEGEAR_MAP_CARD_F, a
	jr z, .no_map_card
	ld c, POKEGEARSTATE_MAPCHECKREGION
	ld b, POKEGEARCARD_MAP
	jr .done

.no_map_card
	ld a, [wPokegearFlags]
	bit POKEGEAR_PHONE_CARD_F, a
	jr z, .no_phone_card
	ld c, POKEGEARSTATE_PHONEINIT
	ld b, POKEGEARCARD_PHONE
	jr .done

.no_phone_card
	ld a, [wPokegearFlags]
	bit POKEGEAR_RADIO_CARD_F, a
	ret z
	ld c, POKEGEARSTATE_RADIOINIT
	ld b, POKEGEARCARD_RADIO
.done
	call Pokegear_SwitchPage
	ret

.quit
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

.UpdateClock:
	xor a
	ldh [hBGMapMode], a
	call Pokegear_UpdateClock
	ld a, $1
	ldh [hBGMapMode], a
	ret

Pokegear_UpdateClock:
	hlcoord 3, 5
	lb bc, 5, 14
	call ClearBox
	ldh a, [hHours]
	ld b, a
	ldh a, [hMinutes]
	ld c, a
	decoord 6, 8
	farcall PrintHoursMins
	ld hl, .DayText
	bccoord 6, 6
	call PlaceHLTextAtBC
	ret

	db "ごぜん@"
	db "ごご@"

.DayText:
	text_far UnknownText_0x1c5821
	text_end

PokegearMap_CheckRegion:
	ld a, [wPokegearMapPlayerIconLandmark]
	cp FAST_SHIP
	jr z, .johto
	cp KANTO_LANDMARK
	jr nc, .kanto
.johto
	ld a, POKEGEARSTATE_JOHTOMAPINIT
	jr .done
	ret

.kanto
	ld a, POKEGEARSTATE_KANTOMAPINIT
.done
	ld [wJumptableIndex], a
	call ExitPokegearRadio_HandleMusic
	ret

PokegearMap_Init:
	call InitPokegearTilemap
	ld a, [wPokegearMapPlayerIconLandmark]
	call PokegearMap_InitPlayerIcon
	ld a, [wPokegearMapCursorLandmark]
	call PokegearMap_InitCursor
	ld a, c
	ld [wPokegearMapCursorObjectPointer], a
	ld a, b
	ld [wPokegearMapCursorObjectPointer + 1], a
	ld hl, wJumptableIndex
	inc [hl]
	ret

PokegearMap_KantoMap:
	call TownMap_GetKantoLandmarkLimits
	jr PokegearMap_ContinueMap

PokegearMap_JohtoMap:
	ld d, SILVER_CAVE
	ld e, NEW_BARK_TOWN
PokegearMap_ContinueMap:
	ld hl, hJoyLast
	ld a, [hl]
	and B_BUTTON
	jr nz, .cancel
	ld a, [hl]
	and D_RIGHT
	jr nz, .right
	ld a, [hl]
	and D_LEFT
	jr nz, .left
	call .DPad
	ret

.right
	ld a, [wPokegearFlags]
	bit POKEGEAR_PHONE_CARD_F, a
	jr z, .no_phone
	ld c, POKEGEARSTATE_PHONEINIT
	ld b, POKEGEARCARD_PHONE
	jr .done

.no_phone
	ld a, [wPokegearFlags]
	bit POKEGEAR_RADIO_CARD_F, a
	ret z
	ld c, POKEGEARSTATE_RADIOINIT
	ld b, POKEGEARCARD_RADIO
	jr .done

.left
	ld c, POKEGEARSTATE_CLOCKINIT
	ld b, POKEGEARCARD_CLOCK
.done
	call Pokegear_SwitchPage
	ret

.cancel
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

.DPad:
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .up
	ld a, [hl]
	and D_DOWN
	jr nz, .down
	ret

.up
	ld hl, wPokegearMapCursorLandmark
	ld a, [hl]
	cp d
	jr c, .wrap_around_up
	ld a, e
	dec a
	ld [hl], a
.wrap_around_up
	inc [hl]
	jr .done_dpad

.down
	ld hl, wPokegearMapCursorLandmark
	ld a, [hl]
	cp e
	jr nz, .wrap_around_down
	ld a, d
	inc a
	ld [hl], a
.wrap_around_down
	dec [hl]
.done_dpad
	ld a, [wPokegearMapCursorLandmark]
	call PokegearMap_UpdateLandmarkName
	ld a, [wPokegearMapCursorObjectPointer]
	ld c, a
	ld a, [wPokegearMapCursorObjectPointer + 1]
	ld b, a
	ld a, [wPokegearMapCursorLandmark]
	call PokegearMap_UpdateCursorPosition
	ret

PokegearMap_InitPlayerIcon:
	push af
	depixel 0, 0
	ld b, SPRITE_ANIM_INDEX_RED_WALK
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .got_gender
	ld b, SPRITE_ANIM_INDEX_BLUE_WALK
.got_gender
	ld a, b
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $10
	pop af
	ld e, a
	push bc
	farcall GetLandmarkCoords
	pop bc
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], e
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld [hl], d
	ret

PokegearMap_InitCursor:
	push af
	depixel 0, 0
	ld a, SPRITE_ANIM_INDEX_POKEGEAR_ARROW
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $04
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], SPRITE_ANIM_SEQ_NULL
	pop af
	push bc
	call PokegearMap_UpdateCursorPosition
	pop bc
	ret

PokegearMap_UpdateLandmarkName:
	push af
	hlcoord 8, 0
	lb bc, 2, 12
	call ClearBox
	pop af
	ld e, a
	push de
	farcall GetLandmarkName
	pop de
	farcall TownMap_ConvertLineBreakCharacters
	hlcoord 8, 0
	ld [hl], $34
	ret

PokegearMap_UpdateCursorPosition:
	push bc
	ld e, a
	farcall GetLandmarkCoords
	pop bc
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], e
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld [hl], d
	ret

TownMap_GetKantoLandmarkLimits:
	ld a, [wStatusFlags]
	bit STATUSFLAGS_HALL_OF_FAME_F, a
	jr z, .not_hof
	ld d, ROUTE_28
	ld e, PALLET_TOWN
	ret

.not_hof
	ld d, ROUTE_28
	ld e, VICTORY_ROAD
	ret

PokegearRadio_Init:
	call InitPokegearTilemap
	depixel 4, 10, 4, 4
	ld a, SPRITE_ANIM_INDEX_RADIO_TUNING_KNOB
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $08
	call _UpdateRadioStation
	ld hl, wJumptableIndex
	inc [hl]
	ret

PokegearRadio_Joypad:
	ld hl, hJoyLast
	ld a, [hl]
	and B_BUTTON
	jr nz, .cancel
	ld a, [hl]
	and D_LEFT
	jr nz, .left
	ld a, [wPokegearRadioChannelAddr]
	ld l, a
	ld a, [wPokegearRadioChannelAddr + 1]
	ld h, a
	ld a, [wPokegearRadioChannelBank]
	and a
	ret z
	rst FarCall
	ret

.left
	ld a, [wPokegearFlags]
	bit POKEGEAR_PHONE_CARD_F, a
	jr z, .no_phone
	ld c, POKEGEARSTATE_PHONEINIT
	ld b, POKEGEARCARD_PHONE
	jr .switch_page

.no_phone
	ld a, [wPokegearFlags]
	bit POKEGEAR_MAP_CARD_F, a
	jr z, .no_map
	ld c, POKEGEARSTATE_MAPCHECKREGION
	ld b, POKEGEARCARD_MAP
	jr .switch_page

.no_map
	ld c, POKEGEARSTATE_CLOCKINIT
	ld b, POKEGEARCARD_CLOCK
.switch_page
	call Pokegear_SwitchPage
	ret

.cancel
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

PokegearPhone_Init:
	ld hl, wJumptableIndex
	inc [hl]
	xor a
	ld [wPokegearPhoneScrollPosition], a
	ld [wPokegearPhoneCursorPosition], a
	ld [wPokegearPhoneSelectedPerson], a
	call InitPokegearTilemap
	call ExitPokegearRadio_HandleMusic
	ld hl, PokegearText_WhomToCall
	call PrintText
	ret

PokegearPhone_Joypad:
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	jr nz, .b
	ld a, [hl]
	and A_BUTTON
	jr nz, .a
	ld hl, hJoyLast
	ld a, [hl]
	and D_LEFT
	jr nz, .left
	ld a, [hl]
	and D_RIGHT
	jr nz, .right
	call PokegearPhone_GetDPad
	ret

.left
	ld a, [wPokegearFlags]
	bit POKEGEAR_MAP_CARD_F, a
	jr z, .no_map
	ld c, POKEGEARSTATE_MAPCHECKREGION
	ld b, POKEGEARCARD_MAP
	jr .switch_page

.no_map
	ld c, POKEGEARSTATE_CLOCKINIT
	ld b, POKEGEARCARD_CLOCK
	jr .switch_page

.right
	ld a, [wPokegearFlags]
	bit POKEGEAR_RADIO_CARD_F, a
	ret z
	ld c, POKEGEARSTATE_RADIOINIT
	ld b, POKEGEARCARD_RADIO
.switch_page
	call Pokegear_SwitchPage
	ret

.b
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

.a
	ld hl, wPhoneList
	ld a, [wPokegearPhoneScrollPosition]
	ld e, a
	ld d, 0
	add hl, de
	ld a, [wPokegearPhoneCursorPosition]
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	and a
	ret z
	ld [wPokegearPhoneSelectedPerson], a
	hlcoord 1, 4
	ld a, [wPokegearPhoneCursorPosition]
	ld bc, 20 * 2
	call AddNTimes
	ld [hl], "▷"
	call PokegearPhoneContactSubmenu
	jr c, .quit_submenu
	ld hl, wJumptableIndex
	inc [hl]
	ret

.quit_submenu
	ld a, POKEGEARSTATE_PHONEJOYPAD
	ld [wJumptableIndex], a
	ret

PokegearPhone_MakePhoneCall:
	call GetMapPhoneService
	and a
	jr nz, .no_service
	ld hl, wOptions
	res NO_TEXT_SCROLL, [hl]
	xor a
	ldh [hInMenu], a
	ld de, SFX_CALL
	call PlaySFX
	ld hl, .dotdotdot
	call PrintText
	call WaitSFX
	ld de, SFX_CALL
	call PlaySFX
	ld hl, .dotdotdot
	call PrintText
	call WaitSFX
	ld a, [wPokegearPhoneSelectedPerson]
	ld b, a
	call Function90199
	ld c, 10
	call DelayFrames
	ld hl, wOptions
	set NO_TEXT_SCROLL, [hl]
	ld a, $1
	ldh [hInMenu], a
	call PokegearPhone_UpdateCursor
	ld hl, wJumptableIndex
	inc [hl]
	ret

.no_service
	farcall Phone_NoSignal
	ld hl, .OutOfServiceArea
	call PrintText
	ld a, POKEGEARSTATE_PHONEJOYPAD
	ld [wJumptableIndex], a
	ld hl, PokegearText_WhomToCall
	call PrintText
	ret

.dotdotdot
	;
	text_far UnknownText_0x1c5824
	text_end

.OutOfServiceArea:
	; You're out of the service area.
	text_far UnknownText_0x1c5827
	text_end

PokegearPhone_FinishPhoneCall:
	ldh a, [hJoyPressed]
	and A_BUTTON | B_BUTTON
	ret z
	farcall HangUp
	ld a, POKEGEARSTATE_PHONEJOYPAD
	ld [wJumptableIndex], a
	ld hl, PokegearText_WhomToCall
	call PrintText
	ret

PokegearPhone_GetDPad:
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .up
	ld a, [hl]
	and D_DOWN
	jr nz, .down
	ret

.up
	ld hl, wPokegearPhoneCursorPosition
	ld a, [hl]
	and a
	jr z, .scroll_page_up
	dec [hl]
	jr .done_joypad_same_page

.scroll_page_up
	ld hl, wPokegearPhoneScrollPosition
	ld a, [hl]
	and a
	ret z
	dec [hl]
	jr .done_joypad_update_page

.down
	ld hl, wPokegearPhoneCursorPosition
	ld a, [hl]
	cp 3
	jr nc, .scroll_page_down
	inc [hl]
	jr .done_joypad_same_page

.scroll_page_down
	ld hl, wPokegearPhoneScrollPosition
	ld a, [hl]
	cp 6
	ret nc
	inc [hl]
	jr .done_joypad_update_page

.done_joypad_same_page
	xor a
	ldh [hBGMapMode], a
	call PokegearPhone_UpdateCursor
	call WaitBGMap
	ret

.done_joypad_update_page
	xor a
	ldh [hBGMapMode], a
	call PokegearPhone_UpdateDisplayList
	call WaitBGMap
	ret

PokegearPhone_UpdateCursor:
	ld a, " "
	hlcoord 1, 4
	ld [hl], a
	hlcoord 1, 6
	ld [hl], a
	hlcoord 1, 8
	ld [hl], a
	hlcoord 1, 10
	ld [hl], a
	hlcoord 1, 4
	ld a, [wPokegearPhoneCursorPosition]
	ld bc, 2 * SCREEN_WIDTH
	call AddNTimes
	ld [hl], "▶"
	ret

PokegearPhone_UpdateDisplayList:
	hlcoord 1, 3
	ld b, 9
	ld a, " "
.row
	ld c, 18
.col
	ld [hli], a
	dec c
	jr nz, .col
	inc hl
	inc hl
	dec b
	jr nz, .row
	ld a, [wPokegearPhoneScrollPosition]
	ld e, a
	ld d, $0
	ld hl, wPhoneList
	add hl, de
	xor a
	ld [wPokegearPhoneLoadNameBuffer], a
.loop
	ld a, [hli]
	push hl
	push af
	hlcoord 2, 4
	ld a, [wPokegearPhoneLoadNameBuffer]
	ld bc, 2 * SCREEN_WIDTH
	call AddNTimes
	ld d, h
	ld e, l
	pop af
	ld b, a
	call Function90380
	pop hl
	ld a, [wPokegearPhoneLoadNameBuffer]
	inc a
	ld [wPokegearPhoneLoadNameBuffer], a
	cp 4
	jr c, .loop
	call PokegearPhone_UpdateCursor
	ret

PokegearPhone_DeletePhoneNumber:
	ld hl, wPhoneList
	ld a, [wPokegearPhoneScrollPosition]
	ld e, a
	ld d, 0
	add hl, de
	ld a, [wPokegearPhoneCursorPosition]
	ld e, a
	ld d, 0
	add hl, de
	ld [hl], 0
	ld hl, wPhoneList
	ld c, CONTACT_LIST_SIZE
.loop
	ld a, [hli]
	and a
	jr nz, .skip
	ld a, [hld]
	ld [hli], a
	ld [hl], 0
.skip
	dec c
	jr nz, .loop
	ret

PokegearPhoneContactSubmenu:
	ld hl, wPhoneList
	ld a, [wPokegearPhoneScrollPosition]
	ld e, a
	ld d, 0
	add hl, de
	ld a, [wPokegearPhoneCursorPosition]
	ld e, a
	ld d, 0
	add hl, de
	ld c, [hl]
	farcall CheckCanDeletePhoneNumber
	ld a, c
	and a
	jr z, .cant_delete
	ld hl, .CallDeleteCancelJumptable
	ld de, .CallDeleteCancelStrings
	jr .got_menu_data

.cant_delete
	ld hl, .CallCancelJumptable
	ld de, .CallCancelStrings
.got_menu_data
	xor a
	ldh [hBGMapMode], a
	push hl
	push de
	ld a, [de]
	ld l, a
	inc de
	ld a, [de]
	ld h, a
	inc de
	push hl
	ld bc, hBGMapAddress + 1
	add hl, bc
	ld a, [de]
	inc de
	sla a
	ld b, a
	ld c, 8
	push de
	call Textbox
	pop de
	pop hl
	inc hl
	call PlaceString
	pop de
	xor a
	ld [wPokegearPhoneSubmenuCursor], a
	call .UpdateCursor
	call WaitBGMap
.loop
	push de
	call JoyTextDelay
	pop de
	ld hl, hJoyPressed
	ld a, [hl]
	and D_UP
	jr nz, .d_up
	ld a, [hl]
	and D_DOWN
	jr nz, .d_down
	ld a, [hl]
	and A_BUTTON | B_BUTTON
	jr nz, .a_b
	call DelayFrame
	jr .loop

.d_up
	ld hl, wPokegearPhoneSubmenuCursor
	ld a, [hl]
	and a
	jr z, .loop
	dec [hl]
	call .UpdateCursor
	jr .loop

.d_down
	ld hl, 2
	add hl, de
	ld a, [wPokegearPhoneSubmenuCursor]
	inc a
	cp [hl]
	jr nc, .loop
	ld [wPokegearPhoneSubmenuCursor], a
	call .UpdateCursor
	jr .loop

.a_b
	xor a
	ldh [hBGMapMode], a
	call PokegearPhone_UpdateDisplayList
	ld a, $1
	ldh [hBGMapMode], a
	pop hl
	ldh a, [hJoyPressed]
	and B_BUTTON
	jr nz, .Cancel
	ld a, [wPokegearPhoneSubmenuCursor]
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Cancel:
	ld hl, PokegearText_WhomToCall
	call PrintText
	scf
	ret

.Delete:
	ld hl, PokegearText_DeleteStoredNumber
	call MenuTextbox
	call YesNoBox
	call ExitMenu
	jr c, .CancelDelete
	call PokegearPhone_DeletePhoneNumber
	xor a
	ldh [hBGMapMode], a
	call PokegearPhone_UpdateDisplayList
	ld hl, PokegearText_WhomToCall
	call PrintText
	call WaitBGMap
.CancelDelete:
	scf
	ret

.Call:
	and a
	ret

.UpdateCursor:
	push de
	ld a, [de]
	inc de
	ld l, a
	ld a, [de]
	inc de
	ld h, a
	ld a, [de]
	ld c, a
	push hl
	ld a, " "
	ld de, SCREEN_WIDTH * 2
.clear_column
	ld [hl], a
	add hl, de
	dec c
	jr nz, .clear_column
	pop hl
	ld a, [wPokegearPhoneSubmenuCursor]
	ld bc, SCREEN_WIDTH  * 2
	call AddNTimes
	ld [hl], "▶"
	pop de
	ret

.CallDeleteCancelStrings:
	dwcoord 10, 6
	db 3
	db   "CALL"
	next "DELETE"
	next "CANCEL"
	db   "@"

.CallDeleteCancelJumptable:
	dw .Call
	dw .Delete
	dw .Cancel

.CallCancelStrings:
	dwcoord 10, 8
	db 2
	db   "CALL"
	next "CANCEL"
	db   "@"

.CallCancelJumptable:
	dw .Call
	dw .Cancel

; unused
	ldh a, [hHours]
	cp 12
	jr c, .am
	sub 12
	ld [wTempByteValue], a
	scf
	ret

.am
	ld [wTempByteValue], a
	and a
	ret

Pokegear_SwitchPage:
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	ld a, c
	ld [wJumptableIndex], a
	ld a, b
	ld [wPokegearCard], a
	call DeleteSpriteAnimStruct2ToEnd
	ret

ExitPokegearRadio_HandleMusic:
	ld a, [wPokegearRadioMusicPlaying]
	cp RESTART_MAP_MUSIC
	jr z, .restart_map_music
	cp ENTER_MAP_MUSIC
	call z, EnterMapMusic
	xor a
	ld [wPokegearRadioMusicPlaying], a
	ret

.restart_map_music
	call RestartMapMusic
	xor a
	ld [wPokegearRadioMusicPlaying], a
	ret

DeleteSpriteAnimStruct2ToEnd:
	ld hl, wSpriteAnim2
	ld bc, wSpriteAnimationStructsEnd - wSpriteAnim2
	xor a
	call ByteFill
	ld a, 2
	ld [wSpriteAnimCount], a
	ret

Pokegear_LoadTilemapRLE:
	; Format: repeat count, tile ID
	; Terminated with -1
	hlcoord 0, 0
.loop
	ld a, [de]
	cp -1
	ret z
	ld b, a
	inc de
	ld a, [de]
	ld c, a
	inc de
	ld a, b
.load
	ld [hli], a
	dec c
	jr nz, .load
	jr .loop

PokegearText_WhomToCall:
	; Whom do you want to call?
	text_far UnknownText_0x1c5847
	text_end

PokegearText_PressAnyButtonToExit:
	; Press any button to exit.
	text_far UnknownText_0x1c5862
	text_end

PokegearText_DeleteStoredNumber:
	; Delete this stored phone number?
	text_far UnknownText_0x1c587d
	text_end

PokegearSpritesGFX:
INCBIN "gfx/pokegear/pokegear_sprites.2bpp.lz"

RadioTilemapRLE:
INCBIN "gfx/pokegear/radio.tilemap.rle"
PhoneTilemapRLE:
INCBIN "gfx/pokegear/phone.tilemap.rle"
ClockTilemapRLE:
INCBIN "gfx/pokegear/clock.tilemap.rle"

_UpdateRadioStation:
	jr UpdateRadioStation

; called from engine/sprite_anims.asm

AnimateTuningKnob:
	push bc
	call .TuningKnob
	pop bc
	ld a, [wRadioTuningKnob]
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.TuningKnob:
	ld hl, hJoyLast
	ld a, [hl]
	and D_DOWN
	jr nz, .down
	ld a, [hl]
	and D_UP
	jr nz, .up
	ret

.down
	ld hl, wRadioTuningKnob
	ld a, [hl]
	and a
	ret z
	dec [hl]
	dec [hl]
	jr .update

.up
	ld hl, wRadioTuningKnob
	ld a, [hl]
	cp 80
	ret nc
	inc [hl]
	inc [hl]
.update
UpdateRadioStation:
	ld hl, wRadioTuningKnob
	ld d, [hl]
	ld hl, RadioChannels
.loop
	ld a, [hli]
	cp -1
	jr z, .nostation
	cp d
	jr z, .foundstation
	inc hl
	inc hl
	jr .loop

.nostation
	call NoRadioStation
	ret

.foundstation
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .returnafterstation
	push de
	jp hl

.returnafterstation
	ld a, [wPokegearRadioChannelBank]
	and a
	ret z
	xor a
	ldh [hBGMapMode], a
	hlcoord 2, 9
	call PlaceString
	ld a, $1
	ldh [hBGMapMode], a
	ret

; unused
	ld [wPokegearRadioChannelBank], a
	ld a, [hli]
	ld [wPokegearRadioChannelAddr], a
	ld a, [hli]
	ld [wPokegearRadioChannelAddr + 1], a
	ret

RadioChannels:
; entries correspond to constants/radio_constants.asm

; frequency value given here = 4 × ingame_frequency − 2
	dbw 16, .PKMNTalkAndPokedexShow
	dbw 28, .PokemonMusic
	dbw 32, .LuckyChannel
	dbw 40, .BuenasPassword
	dbw 52, .RuinsOfAlphRadio
	dbw 64, .PlacesAndPeople
	dbw 72, .LetsAllSing
	dbw 78, .PokeFluteRadio
	dbw 80, .EvolutionRadio
	db -1

.PKMNTalkAndPokedexShow:
; Pokédex Show in the morning

; Oak's Pokémon Talk in the afternoon and evening
	call .InJohto
	jr nc, .NoSignal
	ld a, [wTimeOfDay]
	and a
	jp z, LoadStation_PokedexShow
	jp LoadStation_OaksPokemonTalk

.PokemonMusic:
	call .InJohto
	jr nc, .NoSignal
	jp LoadStation_PokemonMusic

.LuckyChannel:
	call .InJohto
	jr nc, .NoSignal
	jp LoadStation_LuckyChannel

.BuenasPassword:
	call .InJohto
	jr nc, .NoSignal
	jp LoadStation_BuenasPassword

.RuinsOfAlphRadio:
	ld a, [wPokegearMapPlayerIconLandmark]
	cp RUINS_OF_ALPH
	jr nz, .NoSignal
	jp LoadStation_UnownRadio

.PlacesAndPeople:
	call .InJohto
	jr c, .NoSignal
	ld a, [wPokegearFlags]
	bit POKEGEAR_EXPN_CARD_F, a
	jr z, .NoSignal
	jp LoadStation_PlacesAndPeople

.LetsAllSing:
	call .InJohto
	jr c, .NoSignal
	ld a, [wPokegearFlags]
	bit POKEGEAR_EXPN_CARD_F, a
	jr z, .NoSignal
	jp LoadStation_LetsAllSing

.PokeFluteRadio:
	call .InJohto
	jr c, .NoSignal
	ld a, [wPokegearFlags]
	bit POKEGEAR_EXPN_CARD_F, a
	jr z, .NoSignal
	jp LoadStation_PokeFluteRadio

.EvolutionRadio:
; This station airs in the Lake of Rage area when Team Rocket is still in Mahogany.
	ld a, [wStatusFlags]
	bit STATUSFLAGS_ROCKET_SIGNAL_F, a
	jr z, .NoSignal
	ld a, [wPokegearMapPlayerIconLandmark]
	cp MAHOGANY_TOWN
	jr z, .ok
	cp ROUTE_43
	jr z, .ok
	cp LAKE_OF_RAGE
	jr nz, .NoSignal
.ok
	jp LoadStation_EvolutionRadio

.NoSignal:
	call NoRadioStation
	ret

.InJohto:
; if in Johto or on the S.S. Aqua, set carry

; otherwise clear carry
	ld a, [wPokegearMapPlayerIconLandmark]
	cp FAST_SHIP
	jr z, .johto
	cp KANTO_LANDMARK
	jr c, .johto
.kanto
	and a
	ret

.johto
	scf
	ret

LoadStation_OaksPokemonTalk:
	xor a ; OAKS_POKEMON_TALK
	ld [wCurRadioLine], a
	ld [wNumRadioLinesPrinted], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, OaksPKMNTalkName
	ret

LoadStation_PokedexShow:
	ld a, POKEDEX_SHOW
	ld [wCurRadioLine], a
	xor a
	ld [wNumRadioLinesPrinted], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, PokedexShowName
	ret

LoadStation_PokemonMusic:
	ld a, POKEMON_MUSIC
	ld [wCurRadioLine], a
	xor a
	ld [wNumRadioLinesPrinted], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, PokemonMusicName
	ret

LoadStation_LuckyChannel:
	ld a, LUCKY_CHANNEL
	ld [wCurRadioLine], a
	xor a
	ld [wNumRadioLinesPrinted], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, LuckyChannelName
	ret

LoadStation_BuenasPassword:
	ld a, BUENAS_PASSWORD
	ld [wCurRadioLine], a
	xor a
	ld [wNumRadioLinesPrinted], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, NotBuenasPasswordName
	ld a, [wStatusFlags2]
	bit STATUSFLAGS2_ROCKETS_IN_RADIO_TOWER_F, a
	ret z
	ld de, BuenasPasswordName
	ret

BuenasPasswordName:    db "BUENA'S PASSWORD@"
NotBuenasPasswordName: db "@"

LoadStation_UnownRadio:
	ld a, UNOWN_RADIO
	ld [wCurRadioLine], a
	xor a
	ld [wNumRadioLinesPrinted], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, UnownStationName
	ret

LoadStation_PlacesAndPeople:
	ld a, PLACES_AND_PEOPLE
	ld [wCurRadioLine], a
	xor a
	ld [wNumRadioLinesPrinted], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, PlacesAndPeopleName
	ret

LoadStation_LetsAllSing:
	ld a, LETS_ALL_SING
	ld [wCurRadioLine], a
	xor a
	ld [wNumRadioLinesPrinted], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, LetsAllSingName
	ret

LoadStation_RocketRadio:
	ld a, ROCKET_RADIO
	ld [wCurRadioLine], a
	xor a
	ld [wNumRadioLinesPrinted], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, LetsAllSingName
	ret

LoadStation_PokeFluteRadio:
	ld a, POKE_FLUTE_RADIO
	ld [wCurRadioLine], a
	xor a
	ld [wNumRadioLinesPrinted], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, PokeFluteStationName
	ret

LoadStation_EvolutionRadio:
	ld a, EVOLUTION_RADIO
	ld [wCurRadioLine], a
	xor a
	ld [wNumRadioLinesPrinted], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, UnownStationName
	ret

Unreferenced_LoadStation:
	ret

RadioMusicRestartDE:
	push de
	ld a, e
	ld [wPokegearRadioMusicPlaying], a
	ld de, MUSIC_NONE
	call PlayMusic
	pop de
	ld a, e
	ld [wMapMusic], a
	call PlayMusic
	ret

RadioMusicRestartPokemonChannel:
	push de
	ld a, RESTART_MAP_MUSIC
	ld [wPokegearRadioMusicPlaying], a
	ld de, MUSIC_NONE
	call PlayMusic
	pop de
	ld de, MUSIC_POKEMON_CHANNEL
	call PlayMusic
	ret

Radio_BackUpFarCallParams:
	ld [wPokegearRadioChannelBank], a
	ld a, l
	ld [wPokegearRadioChannelAddr], a
	ld a, h
	ld [wPokegearRadioChannelAddr + 1], a
	ret

NoRadioStation:
	call NoRadioMusic
	call NoRadioName
	xor a
	ld [wPokegearRadioChannelBank], a
	ld [wPokegearRadioChannelAddr], a
	ld [wPokegearRadioChannelAddr + 1], a
	ld a, $1
	ldh [hBGMapMode], a
	ret

NoRadioMusic:
	ld de, MUSIC_NONE
	call PlayMusic
	ld a, ENTER_MAP_MUSIC
	ld [wPokegearRadioMusicPlaying], a
	ret

NoRadioName:
	xor a
	ldh [hBGMapMode], a
	hlcoord 1, 8
	lb bc, 3, 18
	call ClearBox
	hlcoord 0, 12
	lb bc, 4, 18
	call Textbox
	ret

OaksPKMNTalkName:     db "OAK's <PK><MN> Talk@"
PokedexShowName:      db "#DEX Show@"
PokemonMusicName:     db "#MON Music@"
LuckyChannelName:     db "Lucky Channel@"
UnownStationName:     db "?????@"

PlacesAndPeopleName:  db "Places & People@"
LetsAllSingName:      db "Let's All Sing!@"
PokeFluteStationName: db "# FLUTE@"

_TownMap:
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]

	ldh a, [hInMenu]
	push af
	ld a, $1
	ldh [hInMenu], a

	ld a, [wVramState]
	push af
	xor a
	ld [wVramState], a

	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	call DisableLCD
	call Pokegear_LoadGFX
	farcall ClearSpriteAnims
	ld a, 8
	call SkipMusic
	ld a, LCDC_DEFAULT
	ldh [rLCDC], a
	call TownMap_GetCurrentLandmark
	ld [wTownMapPlayerIconLandmark], a
	ld [wTownMapCursorLandmark], a
	xor a
	ldh [hBGMapMode], a
	call .InitTilemap
	call WaitBGMap2
	ld a, [wTownMapPlayerIconLandmark]
	call PokegearMap_InitPlayerIcon
	ld a, [wTownMapCursorLandmark]
	call PokegearMap_InitCursor
	ld a, c
	ld [wTownMapCursorObjectPointer], a
	ld a, b
	ld [wTownMapCursorObjectPointer + 1], a
	ld b, SCGB_POKEGEAR_PALS
	call GetSGBLayout
	call SetPalettes
	ldh a, [hCGB]
	and a
	jr z, .dmg
	ld a, %11100100
	call DmgToCgbObjPal0
	call DelayFrame

.dmg
	ld a, [wTownMapPlayerIconLandmark]
	cp KANTO_LANDMARK
	jr nc, .kanto
	ld d, KANTO_LANDMARK - 1
	ld e, 1
	call .loop
	jr .resume

.kanto
	call TownMap_GetKantoLandmarkLimits
	call .loop

.resume
	pop af
	ld [wVramState], a
	pop af
	ldh [hInMenu], a
	pop af
	ld [wOptions], a
	call ClearBGPalettes
	ret

.loop
	call JoyTextDelay
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	ret nz

	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .pressed_up

	ld a, [hl]
	and D_DOWN
	jr nz, .pressed_down
.loop2
	push de
	farcall PlaySpriteAnimations
	pop de
	call DelayFrame
	jr .loop

.pressed_up
	ld hl, wTownMapCursorLandmark
	ld a, [hl]
	cp d
	jr c, .okay
	ld a, e
	dec a
	ld [hl], a

.okay
	inc [hl]
	jr .next

.pressed_down
	ld hl, wTownMapCursorLandmark
	ld a, [hl]
	cp e
	jr nz, .okay2
	ld a, d
	inc a
	ld [hl], a

.okay2
	dec [hl]

.next
	push de
	ld a, [wTownMapCursorLandmark]
	call PokegearMap_UpdateLandmarkName
	ld a, [wTownMapCursorObjectPointer]
	ld c, a
	ld a, [wTownMapCursorObjectPointer + 1]
	ld b, a
	ld a, [wTownMapCursorLandmark]
	call PokegearMap_UpdateCursorPosition
	pop de
	jr .loop2

.InitTilemap:
	ld a, [wTownMapPlayerIconLandmark]
	cp KANTO_LANDMARK
	jr nc, .kanto2
	ld e, JOHTO_REGION
	jr .okay_tilemap

.kanto2
	ld e, KANTO_REGION
.okay_tilemap
	farcall PokegearMap
	ld a, $07
	ld bc, 6
	hlcoord 1, 0
	call ByteFill
	hlcoord 0, 0
	ld [hl], $06
	hlcoord 7, 0
	ld [hl], $17
	hlcoord 7, 1
	ld [hl], $16
	hlcoord 7, 2
	ld [hl], $26
	ld a, $07
	ld bc, NAME_LENGTH
	hlcoord 8, 2
	call ByteFill
	hlcoord 19, 2
	ld [hl], $17
	ld a, [wTownMapCursorLandmark]
	call PokegearMap_UpdateLandmarkName
	farcall TownMapPals
	ret

PlayRadio:
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	call .PlayStation
	ld c, 100
	call DelayFrames
.loop
	call JoyTextDelay
	ldh a, [hJoyPressed]
	and A_BUTTON | B_BUTTON
	jr nz, .stop
	ld a, [wPokegearRadioChannelAddr]
	ld l, a
	ld a, [wPokegearRadioChannelAddr + 1]
	ld h, a
	ld a, [wPokegearRadioChannelBank]
	and a
	jr z, .zero
	rst FarCall
.zero
	call DelayFrame
	jr .loop

.stop
	pop af
	ld [wOptions], a
	call ExitPokegearRadio_HandleMusic
	ret

.PlayStation:
	ld a, ENTER_MAP_MUSIC
	ld [wPokegearRadioMusicPlaying], a
	ld hl, .StationPointers
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .jump_return
	push de
	jp hl

.jump_return
	push de
	hlcoord 0, 12
	lb bc, 4, 18
	call Textbox
	hlcoord 1, 14
	ld [hl], "“"
	pop de
	hlcoord 2, 14
	call PlaceString
	ld h, b
	ld l, c
	ld [hl], "”"
	call WaitBGMap
	ret

.StationPointers:
; entries correspond to MAPRADIO_* constants
	dw .OakOrPnP
	dw LoadStation_OaksPokemonTalk
	dw LoadStation_PokedexShow
	dw LoadStation_PokemonMusic
	dw LoadStation_LuckyChannel
	dw LoadStation_UnownRadio
	dw LoadStation_PlacesAndPeople
	dw LoadStation_LetsAllSing
	dw LoadStation_RocketRadio

.OakOrPnP:
	call IsInJohto
	and a
	jr nz, .kanto
	call UpdateTime
	ld a, [wTimeOfDay]
	and a
	jp z, LoadStation_PokedexShow
	jp LoadStation_OaksPokemonTalk

.kanto
	jp LoadStation_PlacesAndPeople
