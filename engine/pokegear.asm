PokeGear: ; 90b8d (24:4b8d)
	ld hl, Options
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a
	ld a, [VramState]
	push af
	xor a
	ld [VramState], a
	call .InitTilemap
	call DelayFrame
.loop
	call UpdateTime
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .done
	call PokegearJumptable
	callba PlaySpriteAnimations
	call DelayFrame
	jr .loop

.done
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	call WaitSFX
	pop af
	ld [VramState], a
	pop af
	ld [hInMenu], a
	pop af
	ld [Options], a
	call ClearBGPalettes
	xor a
	ld [hBGMapAddress], a
	ld a, VBGMap0 / $100
	ld [hBGMapAddress + 1], a
	ld a, $90
	ld [hWY], a
	call ExitPokegearRadio_HandleMusic
	ret

.InitTilemap: ; 90bea (24:4bea)
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	call DisableLCD
	xor a
	ld [hSCY], a
	ld [hSCX], a
	ld a, $7
	ld [hWX], a
	call Pokegear_LoadGFX
	callba ClearSpriteAnims
	call InitPokegearModeIndicatorArrow
	ld a, 8
	call SkipMusic
	ld a, $e3
	ld [rLCDC], a
	call TownMap_InitCursorAndPlayerIconPositions
	xor a
	ld [wJumptableIndex], a
	ld [wcf64], a
	ld [wcf65], a
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
	ld a, [hCGB]
	and a
	ret z
	ld a, %11100100
	call DmgToCgbObjPal0
	ret

Pokegear_LoadGFX: ; 90c4e
	call ClearVBank1
	ld hl, TownMapGFX
	ld de, VTiles2
	ld a, BANK(TownMapGFX)
	call FarDecompress
	ld hl, PokegearGFX
	ld de, VTiles2 + $30 tiles
	ld a, BANK(PokegearGFX)
	call FarDecompress
	ld hl, PokegearSpritesGFX
	ld de, VTiles0
	ld a, BANK(PokegearSpritesGFX)
	call Decompress
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	call GetWorldMapLocation
	cp FAST_SHIP
	jr z, .ssaqua
	callba GetPlayerIcon
	push de
	ld h, d
	ld l, e
	ld a, b
	; standing sprite
	push af
	ld de, VTiles0 tile $10
	ld bc, 4 tiles
	call FarCopyBytes
	pop af
	pop hl
	; walking sprite
	ld de, 12 tiles
	add hl, de
	ld de, VTiles0 tile $14
	ld bc, 4 tiles
	call FarCopyBytes
	ret

.ssaqua
	ld hl, FastShipGFX
	ld de, VTiles0 tile $10
	ld bc, 8 tiles
	call CopyBytes
	ret

; 90cb2

FastShipGFX: ; 90cb2
INCBIN "gfx/misc/fast_ship.2bpp"
; 90d32

InitPokegearModeIndicatorArrow: ; 90d32 (24:4d32)
	depixel 4, 2, 4, 0
	ld a, SPRITE_ANIM_INDEX_0D
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $0
	ret

AnimatePokegearModeIndicatorArrow: ; 90d41 (24:4d41)
	ld hl, wcf64
	ld e, [hl]
	ld d, 0
	ld hl, .XCoords
	add hl, de
	ld a, [hl]
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

; 90d52 (24:4d52)

.XCoords: ; 90d52
	db $00, $10, $20, $30
; 90d56

TownMap_GetCurrentLandmark: ; 90d56
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	call GetWorldMapLocation
	cp SPECIAL_MAP
	ret nz
	ld a, [BackupMapGroup]
	ld b, a
	ld a, [BackupMapNumber]
	ld c, a
	call GetWorldMapLocation
	ret

; 90d70

TownMap_InitCursorAndPlayerIconPositions: ; 90d70 (24:4d70)
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	call GetWorldMapLocation
	cp FAST_SHIP
	jr z, .FastShip
	cp SPECIAL_MAP
	jr nz, .LoadLandmark
	ld a, [BackupMapGroup]
	ld b, a
	ld a, [BackupMapNumber]
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

Pokegear_InitJumptableIndices: ; 90d9e (24:4d9e)
	ld a, $0
	ld [wJumptableIndex], a
	xor a
	ld [wcf64], a
	ret

InitPokegearTilemap: ; 90da8 (24:4da8)
	xor a
	ld [hBGMapMode], a
	hlcoord 0, 0
	ld bc, TileMapEnd - TileMap
	ld a, $4f
	call ByteFill
	ld a, [wcf64]
	and $3
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
	jp [hl]

.return_from_jumptable
	call Pokegear_FinishTilemap
	callba TownMapPals
	ld a, [wcf65]
	and a
	jr nz, .kanto_0
	xor a
	ld [hBGMapAddress], a
	ld a, VBGMap0 / $100
	ld [hBGMapAddress + 1], a
	call .UpdateBGMap
	ld a, $90
	jr .finish

.kanto_0
	xor a
	ld [hBGMapAddress], a
	ld a, VBGMap1 / $100
	ld [hBGMapAddress + 1], a
	call .UpdateBGMap
	xor a
.finish
	ld [hWY], a
	ld a, [wcf65]
	and 1
	xor 1
	ld [wcf65], a
	ret

.UpdateBGMap: ; 90e00 (24:4e00)
	ld a, [hCGB]
	and a
	jr z, .dmg
	ld a, $2
	ld [hBGMapMode], a
	ld c, 3
	call DelayFrames
.dmg
	call WaitBGMap
	ret

; 90e12 (24:4e12)

.Jumptable: ; 90e12
	dw .Clock
	dw .Map
	dw .Phone
	dw .Radio

; 90e1a

.Clock: ; 90e1a
	ld de, ClockTilemapRLE
	call Pokegear_LoadTilemapRLE
	hlcoord 12, 1
	ld de, .switch
	call PlaceString
	hlcoord 0, 12
	lb bc, 4, 18
	call TextBox
	call Pokegear_UpdateClock
	ret

; 90e36 (24:4e36)

.switch
	db " SWITCH▶@"
; 90e3f

.Map: ; 90e3f
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
	callba PokegearMap
	ld a, $7
	ld bc, $12
	hlcoord 1, 2
	call ByteFill
	hlcoord 0, 2
	ld [hl], $6
	hlcoord 19, 2
	ld [hl], $17
	ld a, [wPokegearMapCursorLandmark]
	call PokegearMap_UpdateLandmarkName
	ret

; 90e72

.Radio: ; 90e72
	ld de, RadioTilemapRLE
	call Pokegear_LoadTilemapRLE
	hlcoord 0, 12
	lb bc, 4, 18
	call TextBox
	ret

; 90e82

.Phone: ; 90e82
	ld de, PhoneTilemapRLE
	call Pokegear_LoadTilemapRLE
	hlcoord 0, 12
	lb bc, 4, 18
	call TextBox
	call .PlacePhoneBars
	call PokegearPhone_UpdateDisplayList
	ret

; 90e98

.PlacePhoneBars: ; 90e98 (24:4e98)
	hlcoord 17, 1
	ld a, $3c
	ld [hli], a
	inc a
	ld [hl], a
	hlcoord 17, 2
	inc a
	ld [hli], a
	call GetMapHeaderPhoneServiceNybble
	and a
	ret nz
	hlcoord 18, 2
	ld [hl], $3f
	ret

Pokegear_FinishTilemap: ; 90eb0 (24:4eb0)
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
	bit 0, a
	call nz, .PlaceMapIcon
	ld a, [de]
	bit 2, a
	call nz, .PlacePhoneIcon
	ld a, [de]
	bit 1, a
	call nz, .PlaceRadioIcon
	hlcoord 0, 0
	ld a, $46
	call .PlacePokegearCardIcon
	ret

.PlaceMapIcon: ; 90ee4 (24:4ee4)
	hlcoord 2, 0
	ld a, $40
	jr .PlacePokegearCardIcon

.PlacePhoneIcon: ; 90eeb (24:4eeb)
	hlcoord 4, 0
	ld a, $44
	jr .PlacePokegearCardIcon

.PlaceRadioIcon: ; 90ef2 (24:4ef2)
	hlcoord 6, 0
	ld a, $42
.PlacePokegearCardIcon: ; 90ef7 (24:4ef7)
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

PokegearJumptable: ; 90f04 (24:4f04)
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

.Jumptable: ; 90f13 (24:4f13)
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

PokegearClock_Init: ; 90f2d (24:4f2d)
	call InitPokegearTilemap
	ld hl, PokegearText_PressAnyButtonToExit
	call PrintText
	ld hl, wJumptableIndex
	inc [hl]
	call ExitPokegearRadio_HandleMusic
	ret

PokegearClock_Joypad: ; 90f3e (24:4f3e)
	call .UpdateClock
	ld hl, hJoyLast
	ld a, [hl]
	and A_BUTTON + B_BUTTON + START + SELECT
	jr nz, .quit
	ld a, [hl]
	and D_RIGHT
	ret z
	ld a, [wPokegearFlags]
	bit 0, a
	jr z, .no_map_card
	ld c, $2
	ld b, $1
	jr .done

.no_map_card
	ld a, [wPokegearFlags]
	bit 2, a
	jr z, .no_phone_card
	ld c, $7
	ld b, $2
	jr .done

.no_phone_card
	ld a, [wPokegearFlags]
	bit 1, a
	ret z
	ld c, $b
	ld b, $3
.done
	call Pokegear_SwitchPage
	ret

.quit
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

.UpdateClock: ; 90f7b (24:4f7b)
	xor a
	ld [hBGMapMode], a
	call Pokegear_UpdateClock
	ld a, $1
	ld [hBGMapMode], a
	ret

Pokegear_UpdateClock: ; 90f86 (24:4f86)
	hlcoord 3, 5
	lb bc, 5, 14
	call ClearBox
	ld a, [hHours]
	ld b, a
	ld a, [hMinutes]
	ld c, a
	decoord 6, 8
	callba PrintHoursMins
	ld hl, .DayText
	bccoord 6, 6
	call PlaceHLTextAtBC
	ret

; 90fa8 (24:4fa8)
	db "ごぜん@"
	db "ごご@"

.DayText: ; 0x90faf
	text_jump UnknownText_0x1c5821
	db "@"

; 0x90fb4

PokegearMap_CheckRegion: ; 90fb4 (24:4fb4)
	ld a, [wPokegearMapPlayerIconLandmark]
	cp FAST_SHIP
	jr z, .johto
	cp KANTO_LANDMARK
	jr nc, .kanto
.johto
	ld a, 3
	jr .done
	ret

.kanto
	ld a, 5
.done
	ld [wJumptableIndex], a
	call ExitPokegearRadio_HandleMusic
	ret

PokegearMap_Init: ; 90fcd (24:4fcd)
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

PokegearMap_KantoMap: ; 90fe9 (24:4fe9)
	call TownMap_GetKantoLandmarkLimits
	jr PokegearMap_ContinueMap

PokegearMap_JohtoMap: ; 90fee (24:4fee)
	ld d, SILVER_CAVE
	ld e, NEW_BARK_TOWN
PokegearMap_ContinueMap: ; 90ff2 (24:4ff2)
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
	bit 2, a
	jr z, .no_phone
	ld c, $7
	ld b, $2
	jr .done

.no_phone
	ld a, [wPokegearFlags]
	bit 1, a
	ret z
	ld c, $b
	ld b, $3
	jr .done

.left
	ld c, $0
	ld b, $0
.done
	call Pokegear_SwitchPage
	ret

.cancel
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

.DPad: ; 9102f (24:502f)
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

PokegearMap_InitPlayerIcon: ; 9106a
	push af
	depixel 0, 0
	ld b, SPRITE_ANIM_INDEX_RED_WALK
	ld a, [PlayerGender]
	bit 0, a
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
	callba GetLandmarkCoords
	pop bc
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], e
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld [hl], d
	ret

; 91098

PokegearMap_InitCursor: ; 91098
	push af
	depixel 0, 0
	ld a, SPRITE_ANIM_INDEX_0D
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $4
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], SPRITE_ANIM_SEQ_NULL
	pop af
	push bc
	call PokegearMap_UpdateCursorPosition
	pop bc
	ret

; 910b4

PokegearMap_UpdateLandmarkName: ; 910b4
	push af
	hlcoord 8, 0
	lb bc, 2, 12
	call ClearBox
	pop af
	ld e, a
	push de
	callba GetLandmarkName
	pop de
	callba TownMap_ConvertLineBreakCharacters
	hlcoord 8, 0
	ld [hl], $34
	ret

; 910d4

PokegearMap_UpdateCursorPosition: ; 910d4
	push bc
	ld e, a
	callba GetLandmarkCoords
	pop bc
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], e
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld [hl], d
	ret

; 910e8

TownMap_GetKantoLandmarkLimits: ; 910e8
	ld a, [StatusFlags]
	bit 6, a
	jr z, .not_hof
	ld d, ROUTE_28
	ld e, PALLET_TOWN
	ret

.not_hof
	ld d, ROUTE_28
	ld e, VICTORY_ROAD
	ret

; 910f9

PokegearRadio_Init: ; 910f9 (24:50f9)
	call InitPokegearTilemap
	depixel 4, 10, 4, 4
	ld a, SPRITE_ANIM_INDEX_14
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $8
	call _UpdateRadioStation
	ld hl, wJumptableIndex
	inc [hl]
	ret

PokegearRadio_Joypad: ; 91112 (24:5112)
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
	bit 2, a
	jr z, .no_phone
	ld c, $7
	ld b, $2
	jr .switch_page

.no_phone
	ld a, [wPokegearFlags]
	bit 0, a
	jr z, .no_map
	ld c, $2
	ld b, $1
	jr .switch_page

.no_map
	ld c, $0
	ld b, $0
.switch_page
	call Pokegear_SwitchPage
	ret

.cancel
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

PokegearPhone_Init: ; 91156 (24:5156)
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

PokegearPhone_Joypad: ; 91171 (24:5171)
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
	bit 0, a
	jr z, .no_map
	ld c, $2
	ld b, $1
	jr .switch_page

.no_map
	ld c, $0
	ld b, $0
	jr .switch_page

.right
	ld a, [wPokegearFlags]
	bit 1, a
	ret z
	ld c, $b
	ld b, $3
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
	ld a, $8
	ld [wJumptableIndex], a
	ret

PokegearPhone_MakePhoneCall: ; 911eb (24:51eb)
	call GetMapHeaderPhoneServiceNybble
	and a
	jr nz, .no_service
	ld hl, Options
	res NO_TEXT_SCROLL, [hl]
	xor a
	ld [hInMenu], a
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
	ld hl, Options
	set NO_TEXT_SCROLL, [hl]
	ld a, $1
	ld [hInMenu], a
	call PokegearPhone_UpdateCursor
	ld hl, wJumptableIndex
	inc [hl]
	ret

.no_service
	callba Phone_NoSignal
	ld hl, .OutOfServiceArea
	call PrintText
	ld a, $8
	ld [wJumptableIndex], a
	ld hl, PokegearText_WhomToCall
	call PrintText
	ret

; 9124c (24:524c)

.dotdotdot ; 0x9124c
	;
	text_jump UnknownText_0x1c5824
	db "@"

; 0x91251

.OutOfServiceArea: ; 0x91251
	; You're out of the service area.
	text_jump UnknownText_0x1c5827
	db "@"

; 0x91256

PokegearPhone_FinishPhoneCall: ; 91256 (24:5256)
	ld a, [hJoyPressed]
	and A_BUTTON | B_BUTTON
	ret z
	callba HangUp
	ld a, $8
	ld [wJumptableIndex], a
	ld hl, PokegearText_WhomToCall
	call PrintText
	ret

PokegearPhone_GetDPad: ; 9126d (24:526d)
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
	cp $3
	jr nc, .scroll_page_down
	inc [hl]
	jr .done_joypad_same_page

.scroll_page_down
	ld hl, wPokegearPhoneScrollPosition
	ld a, [hl]
	cp $6
	ret nc
	inc [hl]
	jr .done_joypad_update_page

.done_joypad_same_page
	xor a
	ld [hBGMapMode], a
	call PokegearPhone_UpdateCursor
	call WaitBGMap
	ret

.done_joypad_update_page
	xor a
	ld [hBGMapMode], a
	call PokegearPhone_UpdateDisplayList
	call WaitBGMap
	ret

PokegearPhone_UpdateCursor: ; 912b7 (24:52b7)
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

PokegearPhone_UpdateDisplayList: ; 912d8 (24:52d8)
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
	cp $4
	jr c, .loop
	call PokegearPhone_UpdateCursor
	ret

; 9131e (24:531e)

PokegearPhone_DeletePhoneNumber: ; 9131e
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

; 91342

PokegearPhoneContactSubmenu: ; 91342 (24:5342)
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
	callba CheckCanDeletePhoneNumber
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
	ld [hBGMapMode], a
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
	call TextBox
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
	ld [hBGMapMode], a
	call PokegearPhone_UpdateDisplayList
	ld a, $1
	ld [hBGMapMode], a
	pop hl
	ld a, [hJoyPressed]
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
	jp [hl]

.Cancel: ; 913f1
	ld hl, PokegearText_WhomToCall
	call PrintText
	scf
	ret

; 913f9 (24:53f9)

.Delete: ; 913f9
	ld hl, PokegearText_DeleteStoredNumber
	call MenuTextBox
	call YesNoBox
	call ExitMenu
	jr c, .CancelDelete
	call PokegearPhone_DeletePhoneNumber
	xor a
	ld [hBGMapMode], a
	call PokegearPhone_UpdateDisplayList
	ld hl, PokegearText_WhomToCall
	call PrintText
	call WaitBGMap
.CancelDelete:
	scf
	ret

; 9141b

.Call: ; 9141b
	and a
	ret

; 9141d

.UpdateCursor: ; 9141d (24:541d)
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

; 9143f (24:543f)

.CallDeleteCancelStrings: ; 9143f
	dwcoord 10, 6
	db 3
	db   "CALL"
	next "DELETE"
	next "CANCEL"
	db   "@"
; 91455

.CallDeleteCancelJumptable: ; 91455
	dw .Call
	dw .Delete
	dw .Cancel

; 9145b

.CallCancelStrings: ; 9145b
	dwcoord 10, 8
	db 2
	db   "CALL"
	next "CANCEL"
	db   "@"
; 9146a

.CallCancelJumptable: ; 9146a
	dw .Call
	dw .Cancel

; 9146e

; XXX
	ld a, [hHours]
	cp 12
	jr c, .am
	sub 12
	ld [wd265], a
	scf
	ret

.am
	ld [wd265], a
	and a
	ret

; 91480

Pokegear_SwitchPage: ; 91480 (24:5480)
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	ld a, c
	ld [wJumptableIndex], a
	ld a, b
	ld [wcf64], a
	call DeleteSpriteAnimStruct2ToEnd
	ret

ExitPokegearRadio_HandleMusic: ; 91492
	ld a, [wPokegearRadioMusicPlaying]
	cp $fe
	jr z, .restart_map_music
	cp $ff
	call z, EnterMapMusic
	xor a
	ld [wPokegearRadioMusicPlaying], a
	ret

.restart_map_music
	call RestartMapMusic
	xor a
	ld [wPokegearRadioMusicPlaying], a
	ret

; 914ab

DeleteSpriteAnimStruct2ToEnd: ; 914ab (24:54ab)
	ld hl, SpriteAnim2
	ld bc, wSpriteAnimationStructsEnd - SpriteAnim2
	xor a
	call ByteFill
	ld a, 2
	ld [wSpriteAnimCount], a
	ret

Pokegear_LoadTilemapRLE: ; 914bb (24:54bb)
	; Format: repeat count, tile ID
	; Terminated with $FF
	hlcoord 0, 0
.loop
	ld a, [de]
	cp $ff
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

; 914ce (24:54ce)

PokegearText_WhomToCall: ; 0x914ce
	; Whom do you want to call?
	text_jump UnknownText_0x1c5847
	db "@"

; 0x914d3

PokegearText_PressAnyButtonToExit: ; 0x914d3
	; Press any button to exit.
	text_jump UnknownText_0x1c5862
	db "@"

; 0x914d8

PokegearText_DeleteStoredNumber: ; 0x914d8
	; Delete this stored phone number?
	text_jump UnknownText_0x1c587d
	db "@"

; 0x914dd

PokegearSpritesGFX: ; 914dd
INCBIN "gfx/misc/pokegear_sprites.2bpp.lz"
; 9150d

RadioTilemapRLE: ; 9150d
INCBIN "gfx/pokegear/radio.tilemap.rle"
PhoneTilemapRLE: ; 9158a
INCBIN "gfx/pokegear/phone.tilemap.rle"
ClockTilemapRLE: ; 915db
INCBIN "gfx/pokegear/clock.tilemap.rle"
; 9163e

_UpdateRadioStation: ; 9163e (24:563e)
	jr UpdateRadioStation

; called from engine/sprite_anims.asm

AnimateTuningKnob: ; 91640 (24:5640)
	push bc
	call .TuningKnob
	pop bc
	ld a, [wRadioTuningKnob]
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.TuningKnob: ; 9164e (24:564e)
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
UpdateRadioStation: ; 9166f (24:566f)
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
	jp [hl]

.returnafterstation
	ld a, [wPokegearRadioChannelBank]
	and a
	ret z
	xor a
	ld [hBGMapMode], a
	hlcoord 2, 9
	call PlaceString
	ld a, $1
	ld [hBGMapMode], a
	ret

; 916a1 (24:56a1)

; XXX
	ld [wPokegearRadioChannelBank], a
	ld a, [hli]
	ld [wPokegearRadioChannelAddr], a
	ld a, [hli]
	ld [wPokegearRadioChannelAddr + 1], a
	ret

; 916ad

RadioChannels:
; frequencies and the shows that play on them.

; frequency value given here = 4 × ingame_frequency − 2
	dbw 16, .PkmnTalkAndPokedexShow
	dbw 28, .PokemonMusic
	dbw 32, .LuckyChannel
	dbw 40, .BuenasPassword
	dbw 52, .RuinsOfAlphRadio
	dbw 64, .PlacesAndPeople
	dbw 72, .LetsAllSing
	dbw 78, .PokeFluteRadio
	dbw 80, .EvolutionRadio
	db -1

.PkmnTalkAndPokedexShow:
; Pokédex Show in the morning

; Oak's Pokémon Talk in the afternoon and evening
	call .InJohto
	jr nc, .NoSignal
	ld a, [TimeOfDay]
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
	bit 3, a
	jr z, .NoSignal
	jp LoadStation_PlacesAndPeople

.LetsAllSing:
	call .InJohto
	jr c, .NoSignal
	ld a, [wPokegearFlags]
	bit 3, a
	jr z, .NoSignal
	jp LoadStation_LetsAllSing

.PokeFluteRadio:
	call .InJohto
	jr c, .NoSignal
	ld a, [wPokegearFlags]
	bit 3, a
	jr z, .NoSignal
	jp LoadStation_PokeFluteRadio

.EvolutionRadio:
; This station airs in the Lake of Rage area when Rocket are still in Mahogany.
	ld a, [StatusFlags]
	bit 4, a
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

LoadStation_OaksPokemonTalk: ; 91753 (24:5753)
	xor a ; OAKS_POKEMON_TALK
	ld [wd002], a
	ld [wd005], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, OaksPkmnTalkName
	ret

LoadStation_PokedexShow: ; 91766 (24:5766)
	ld a, POKEDEX_SHOW
	ld [wd002], a
	xor a
	ld [wd005], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, PokedexShowName
	ret

LoadStation_PokemonMusic: ; 9177b (24:577b)
	ld a, POKEMON_MUSIC
	ld [wd002], a
	xor a
	ld [wd005], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, PokemonMusicName
	ret

LoadStation_LuckyChannel: ; 91790 (24:5790)
	ld a, LUCKY_CHANNEL
	ld [wd002], a
	xor a
	ld [wd005], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, LuckyChannelName
	ret

LoadStation_BuenasPassword: ; 917a5 (24:57a5)
	ld a, BUENAS_PASSWORD
	ld [wd002], a
	xor a
	ld [wd005], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, NotBuenasPasswordName
	ld a, [StatusFlags2]
	bit 0, a
	ret z
	ld de, BuenasPasswordName
	ret

; 917c3 (24:57c3)

BuenasPasswordName:    db "BUENA'S PASSWORD@"
NotBuenasPasswordName: db "@"

LoadStation_UnownRadio: ; 917d5 (24:57d5)
	ld a, UNOWN_RADIO
	ld [wd002], a
	xor a
	ld [wd005], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, UnknownStationName
	ret

LoadStation_PlacesAndPeople: ; 917ea (24:57ea)
	ld a, PLACES_AND_PEOPLE
	ld [wd002], a
	xor a
	ld [wd005], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, PlacesAndPeopleName
	ret

LoadStation_LetsAllSing: ; 917ff (24:57ff)
	ld a, LETS_ALL_SING
	ld [wd002], a
	xor a
	ld [wd005], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, LetsAllSingName
	ret

; 91814 (24:5814)

LoadStation_RocketRadio: ; 91814
	ld a, ROCKET_RADIO
	ld [wd002], a
	xor a
	ld [wd005], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, LetsAllSingName
	ret

; 91829

LoadStation_PokeFluteRadio: ; 91829 (24:5829)
	ld a, POKE_FLUTE_RADIO
	ld [wd002], a
	xor a
	ld [wd005], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, PokeFluteStationName
	ret

LoadStation_EvolutionRadio: ; 9183e (24:583e)
	ld a, EVOLUTION_RADIO
	ld [wd002], a
	xor a
	ld [wd005], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, UnknownStationName
	ret

; 91853 (24:5853)

LoadStation_Dummy: ; 91853
	ret

RadioMusicRestartDE: ; 91854 (24:5854)
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

RadioMusicRestartPokemonChannel: ; 91868 (24:5868)
	push de
	ld a, $fe
	ld [wPokegearRadioMusicPlaying], a
	ld de, MUSIC_NONE
	call PlayMusic
	pop de
	ld de, MUSIC_POKEMON_CHANNEL
	call PlayMusic
	ret

Radio_BackUpFarCallParams: ; 9187c (24:587c)
	ld [wPokegearRadioChannelBank], a
	ld a, l
	ld [wPokegearRadioChannelAddr], a
	ld a, h
	ld [wPokegearRadioChannelAddr + 1], a
	ret

NoRadioStation: ; 91888 (24:5888)
	call NoRadioMusic
	call NoRadioName
	xor a
	ld [wPokegearRadioChannelBank], a
	ld [wPokegearRadioChannelAddr], a
	ld [wPokegearRadioChannelAddr + 1], a
	ld a, $1
	ld [hBGMapMode], a
	ret

NoRadioMusic: ; 9189d (24:589d)
	ld de, MUSIC_NONE
	call PlayMusic
	ld a, $ff
	ld [wPokegearRadioMusicPlaying], a
	ret

NoRadioName: ; 918a9 (24:58a9)
	xor a
	ld [hBGMapMode], a
	hlcoord 1, 8
	lb bc, 3, 18
	call ClearBox
	hlcoord 0, 12
	ld bc, $412
	call TextBox
	ret

; 918bf

OaksPkmnTalkName:     db "OAK's <PK><MN> Talk@"
PokedexShowName:      db "#DEX Show@"
PokemonMusicName:     db "#MON Music@"
LuckyChannelName:     db "Lucky Channel@"
UnknownStationName:   db "?????@"

PlacesAndPeopleName:  db "Places & People@"
LetsAllSingName:      db "Let's All Sing!@"
PokeFluteStationName: db "# FLUTE@"
; 9191c

_TownMap: ; 9191c
	ld hl, Options
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]

	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a

	ld a, [VramState]
	push af
	xor a
	ld [VramState], a

	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	call DisableLCD
	call Pokegear_LoadGFX
	callba ClearSpriteAnims
	ld a, 8
	call SkipMusic
	ld a, $e3
	ld [rLCDC], a
	call TownMap_GetCurrentLandmark
	ld [wd002], a
	ld [wd003], a
	xor a
	ld [hBGMapMode], a
	call .InitTilemap
	call WaitBGMap2
	ld a, [wd002]
	call PokegearMap_InitPlayerIcon
	ld a, [wd003]
	call PokegearMap_InitCursor
	ld a, c
	ld [wd004], a
	ld a, b
	ld [wd005], a
	ld b, SCGB_POKEGEAR_PALS
	call GetSGBLayout
	call SetPalettes
	ld a, [hCGB]
	and a
	jr z, .dmg
	ld a, %11100100
	call DmgToCgbObjPal0
	call DelayFrame

.dmg
	ld a, [wd002]
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
	ld [VramState], a
	pop af
	ld [hInMenu], a
	pop af
	ld [Options], a
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
	callba PlaySpriteAnimations
	pop de
	call DelayFrame
	jr .loop

.pressed_up
	ld hl, wd003
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
	ld hl, wd003
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
	ld a, [wd003]
	call PokegearMap_UpdateLandmarkName
	ld a, [wd004]
	ld c, a
	ld a, [wd005]
	ld b, a
	ld a, [wd003]
	call PokegearMap_UpdateCursorPosition
	pop de
	jr .loop2
; 91a04

.InitTilemap: ; 91a04
	ld a, [wd002]
	cp KANTO_LANDMARK
	jr nc, .kanto2
	ld e, $0
	jr .okay_tilemap

.kanto2
	ld e, $1
.okay_tilemap
	callba PokegearMap
	ld a, $7
	ld bc, 6
	hlcoord 1, 0
	call ByteFill
	hlcoord 0, 0
	ld [hl], $6
	hlcoord 7, 0
	ld [hl], $17
	hlcoord 7, 1
	ld [hl], $16
	hlcoord 7, 2
	ld [hl], $26
	ld a, $7
	ld bc, NAME_LENGTH
	hlcoord 8, 2
	call ByteFill
	hlcoord 19, 2
	ld [hl], $17
	ld a, [wd003]
	call PokegearMap_UpdateLandmarkName
	callba TownMapPals
	ret
; 91a53

PlayRadio: ; 91a53
	ld hl, Options
	ld a, [hl]
	push af
	set 4, [hl]
	call .PlayStation
	ld c, 100
	call DelayFrames
.loop
	call JoyTextDelay
	ld a, [hJoyPressed]
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
	ld [Options], a
	call ExitPokegearRadio_HandleMusic
	ret

; 91a87

.PlayStation: ; 91a87
	ld a, -1
	ld [EnemyTurnsTaken], a
	ld hl, .StationPointers
	ld d, $0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .jump_return
	push de
	jp [hl]

.jump_return
	push de
	hlcoord 0, 12
	lb bc, 4, 18
	call TextBox
	hlcoord 1, 14
	ld [hl], $72
	pop de
	hlcoord 2, 14
	call PlaceString
	ld h, b
	ld l, c
	ld [hl], $73
	call WaitBGMap
	ret

; 91ab9

.StationPointers: ; 91ab9
	dw .OakOrPnP
	dw LoadStation_OaksPokemonTalk
	dw LoadStation_PokedexShow
	dw LoadStation_PokemonMusic
	dw LoadStation_LuckyChannel
	dw LoadStation_UnownRadio
	dw LoadStation_PlacesAndPeople
	dw LoadStation_LetsAllSing
	dw LoadStation_RocketRadio

; 91acb

.OakOrPnP: ; 91acb
	call IsInJohto
	and a
	jr nz, .kanto
	call UpdateTime
	ld a, [TimeOfDay]
	and a
	jp z, LoadStation_PokedexShow
	jp LoadStation_OaksPokemonTalk

.kanto
	jp LoadStation_PlacesAndPeople

; 91ae1

PokegearMap: ; 91ae1
	ld a, e
	and a
	jr nz, .kanto
	call LoadTownMapGFX
	call FillJohtoMap
	ret

.kanto
	call LoadTownMapGFX
	call FillKantoMap
	ret

; 91af3

_FlyMap: ; 91af3
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	ld hl, hInMenu
	ld a, [hl]
	push af
	ld [hl], $1
	xor a
	ld [hBGMapMode], a
	callba ClearSpriteAnims
	call LoadTownMapGFX
	ld de, FlyMapLabelBorderGFX
	ld hl, VTiles2 tile $30
	lb bc, BANK(FlyMapLabelBorderGFX), 6
	call Request1bpp
	call FlyMap
	call ret_91c8f
	ld b, SCGB_POKEGEAR_PALS
	call GetSGBLayout
	call SetPalettes
.loop
	call JoyTextDelay
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	jr nz, .pressedB
	ld a, [hl]
	and A_BUTTON
	jr nz, .pressedA
	call FlyMapScroll
	call GetMapCursorCoordinates
	callba PlaySpriteAnimations
	call DelayFrame
	jr .loop

.pressedB
	ld a, -1
	jr .exit

.pressedA
	ld a, [wd002]
	ld l, a
	ld h, 0
	add hl, hl
	ld de, Flypoints + 1
	add hl, de
	ld a, [hl]
.exit
	ld [wd002], a
	pop af
	ld [hInMenu], a
	call ClearBGPalettes
	ld a, $90
	ld [hWY], a
	xor a
	ld [hBGMapAddress], a
	ld a, VBGMap0 / $100
	ld [hBGMapAddress + 1], a
	ld a, [wd002]
	ld e, a
	ret

; 91b73

FlyMapScroll: ; 91b73
	ld a, [StartFlypoint]
	ld e, a
	ld a, [EndFlypoint]
	ld d, a
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .ScrollNext
	ld a, [hl]
	and D_DOWN
	jr nz, .ScrollPrev
	ret

.ScrollNext:
	ld hl, wd002
	ld a, [hl]
	cp d
	jr nz, .NotAtEndYet
	ld a, e
	dec a
	ld [hl], a
.NotAtEndYet:
	inc [hl]
	call CheckIfVisitedFlypoint
	jr z, .ScrollNext
	jr .Finally

.ScrollPrev:
	ld hl, wd002
	ld a, [hl]
	cp e
	jr nz, .NotAtStartYet
	ld a, d
	inc a
	ld [hl], a
.NotAtStartYet:
	dec [hl]
	call CheckIfVisitedFlypoint
	jr z, .ScrollPrev
.Finally:
	call TownMapBubble
	call WaitBGMap
	xor a
	ld [hBGMapMode], a
	ret

; 91bb5

TownMapBubble: ; 91bb5
; Draw the bubble containing the location text in the town map HUD

; Top-left corner
	hlcoord 1, 0
	ld a, $30
	ld [hli], a
; Top row
	ld bc, 16
	ld a, " "
	call ByteFill
; Top-right corner
	ld a, $31
	ld [hl], a
	hlcoord 1, 1

; Middle row
	ld bc, 18
	ld a, " "
	call ByteFill

; Bottom-left corner
	hlcoord 1, 2
	ld a, $32
	ld [hli], a
; Bottom row
	ld bc, 16
	ld a, " "
	call ByteFill
; Bottom-right corner
	ld a, $33
	ld [hl], a

; Print "Where?"
	hlcoord 2, 0
	ld de, .Where
	call PlaceString
; Print the name of the default flypoint
	call .Name
; Up/down arrows
	hlcoord 18, 1
	ld [hl], $34
	ret

.Where:
	db "Where?@"

.Name:
; We need the map location of the default flypoint
	ld a, [wd002]
	ld l, a
	ld h, 0
	add hl, hl ; two bytes per flypoint
	ld de, Flypoints
	add hl, de
	ld e, [hl]
	callba GetLandmarkName
	hlcoord 2, 1
	ld de, StringBuffer1
	call PlaceString
	ret

; 91c17

GetMapCursorCoordinates: ; 91c17
	ld a, [wd002]
	ld l, a
	ld h, $0
	add hl, hl
	ld de, Flypoints
	add hl, de
	ld e, [hl]
	callba GetLandmarkCoords
	ld a, [wd003]
	ld c, a
	ld a, [wd004]
	ld b, a
	ld hl, $4
	add hl, bc
	ld [hl], e
	ld hl, $5
	add hl, bc
	ld [hl], d
	ret

; 91c3c

CheckIfVisitedFlypoint: ; 91c3c
; Check if the flypoint loaded in [hl] has been visited yet.
	push bc
	push de
	push hl
	ld l, [hl]
	ld h, 0
	add hl, hl
	ld de, Flypoints + 1
	add hl, de
	ld c, [hl]
	call HasVisitedSpawn
	pop hl
	pop de
	pop bc
	and a
	ret

; 91c50

HasVisitedSpawn: ; 91c50
; Check if spawn point c has been visited.
	ld hl, VisitedSpawns
	ld b, CHECK_FLAG
	ld d, 0
	predef FlagPredef
	ld a, c
	ret

; 91c5e

Flypoints: ; 91c5e
; landmark, spawn point
	const_def
flypoint: MACRO
	const FLY_\1
	db \2, SPAWN_\1
ENDM
; Johto
	flypoint NEW_BARK,    NEW_BARK_TOWN
	flypoint CHERRYGROVE, CHERRYGROVE_CITY
	flypoint VIOLET,      VIOLET_CITY
	flypoint AZALEA,      AZALEA_TOWN
	flypoint GOLDENROD,   GOLDENROD_CITY
	flypoint ECRUTEAK,    ECRUTEAK_CITY
	flypoint OLIVINE,     OLIVINE_CITY
	flypoint CIANWOOD,    CIANWOOD_CITY
	flypoint MAHOGANY,    MAHOGANY_TOWN
	flypoint LAKE,        LAKE_OF_RAGE
	flypoint BLACKTHORN,  BLACKTHORN_CITY
	flypoint MT_SILVER,   SILVER_CAVE
; Kanto

KANTO_FLYPOINT EQU const_value
	flypoint PALLET,      PALLET_TOWN
	flypoint VIRIDIAN,    VIRIDIAN_CITY
	flypoint PEWTER,      PEWTER_CITY
	flypoint CERULEAN,    CERULEAN_CITY
	flypoint VERMILION,   VERMILION_CITY
	flypoint ROCK_TUNNEL, ROCK_TUNNEL
	flypoint LAVENDER,    LAVENDER_TOWN
	flypoint CELADON,     CELADON_CITY
	flypoint SAFFRON,     SAFFRON_CITY
	flypoint FUCHSIA,     FUCHSIA_CITY
	flypoint CINNABAR,    CINNABAR_ISLAND
	flypoint INDIGO,      INDIGO_PLATEAU
	db -1

; 91c8f

ret_91c8f: ; 91c8f
	ret

; 91c90

FlyMap: ; 91c90
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	call GetWorldMapLocation
; If we're not in a valid location, i.e. Pokecenter floor 2F,

; the backup map information is used
	cp SPECIAL_MAP
	jr nz, .CheckRegion
	ld a, [BackupMapGroup]
	ld b, a
	ld a, [BackupMapNumber]
	ld c, a
	call GetWorldMapLocation
.CheckRegion:
; The first 46 locations are part of Johto. The rest are in Kanto
	cp KANTO_LANDMARK
	jr nc, .KantoFlyMap
.JohtoFlyMap:
; Note that .NoKanto should be modified in tandem with this branch
	push af
; Start from New Bark Town
	ld a, FLY_NEW_BARK
	ld [wd002], a
; Flypoints begin at New Bark Town...
	ld [StartFlypoint], a
; ..and end at Silver Cave
	ld a, FLY_MT_SILVER
	ld [EndFlypoint], a
; Fill out the map
	call FillJohtoMap
	call .MapHud
	pop af
	call TownMapPlayerIcon
	ret

.KantoFlyMap:
; The event that there are no flypoints enabled in a map is not

; accounted for. As a result, if you attempt to select a flypoint
; when there are none enabled, the game will crash. Additionally,

; the flypoint selection has a default starting point that
; can be flown to even if none are enabled

; To prevent both of these things from happening when the player
; enters Kanto, fly access is restricted until Indigo Plateau is

; visited and its flypoint enabled
	push af
	ld c, SPAWN_INDIGO
	call HasVisitedSpawn
	and a
	jr z, .NoKanto
; Kanto's map is only loaded if we've visited Indigo Plateau

; Flypoints begin at Pallet Town...
	ld a, FLY_PALLET
	ld [StartFlypoint], a
; ...and end at Indigo Plateau
	ld a, FLY_INDIGO
	ld [EndFlypoint], a
; Because Indigo Plateau is the first flypoint the player

; visits, it's made the default flypoint
	ld [wd002], a
; Fill out the map
	call FillKantoMap
	call .MapHud
	pop af
	call TownMapPlayerIcon
	ret

.NoKanto:
; If Indigo Plateau hasn't been visited, we use Johto's map instead

; Start from New Bark Town
	ld a, FLY_NEW_BARK
	ld [wd002], a
; Flypoints begin at New Bark Town...
	ld [StartFlypoint], a
; ..and end at Silver Cave
	ld a, FLY_MT_SILVER
	ld [EndFlypoint], a
	call FillJohtoMap
	pop af
.MapHud:
	call TownMapBubble
	call TownMapPals
	hlbgcoord 0, 0 ; BG Map 0
	call TownMapBGUpdate
	call TownMapMon
	ld a, c
	ld [wd003], a
	ld a, b
	ld [wd004], a
	ret

; 91d11

_Area: ; 91d11
; e: Current landmark
	ld a, [wd002]
	push af
	ld a, [wd003]
	push af
	ld a, e
	ld [wd002], a
	call ClearSprites
	xor a
	ld [hBGMapMode], a
	ld a, $1
	ld [hInMenu], a
	ld de, PokedexNestIconGFX
	ld hl, VTiles0 tile $7f
	lb bc, BANK(PokedexNestIconGFX), 1
	call Request2bpp
	call .GetPlayerOrFastShipIcon
	ld hl, VTiles0 tile $78
	ld c, 4
	call Request2bpp
	call LoadTownMapGFX
	call FillKantoMap
	call .PlaceString_MonsNest
	call TownMapPals
	hlbgcoord 0, 0, VBGMap1
	call TownMapBGUpdate
	call FillJohtoMap
	call .PlaceString_MonsNest
	call TownMapPals
	hlbgcoord 0, 0
	call TownMapBGUpdate
	ld b, SCGB_POKEGEAR_PALS
	call GetSGBLayout
	call SetPalettes
	xor a
	ld [hBGMapMode], a
	xor a ; Johto
	call .GetAndPlaceNest
.loop
	call JoyTextDelay
	ld hl, hJoyPressed
	ld a, [hl]
	and A_BUTTON | B_BUTTON
	jr nz, .a_b
	ld a, [hJoypadDown]
	and SELECT
	jr nz, .select
	call .LeftRightInput
	call .BlinkNestIcons
	jr .next

.select
	call .HideNestsShowPlayer
.next
	call DelayFrame
	jr .loop

.a_b
	call ClearSprites
	pop af
	ld [wd003], a
	pop af
	ld [wd002], a
	ret

; 91d9b

.LeftRightInput: ; 91d9b
	ld a, [hl]
	and D_LEFT
	jr nz, .left
	ld a, [hl]
	and D_RIGHT
	jr nz, .right
	ret

.left
	ld a, [hWY]
	cp $90
	ret z
	call ClearSprites
	ld a, $90
	ld [hWY], a
	xor a ; Johto
	call .GetAndPlaceNest
	ret

.right
	ld a, [StatusFlags]
	bit 6, a ; hall of fame
	ret z
	ld a, [hWY]
	and a
	ret z
	call ClearSprites
	xor a
	ld [hWY], a
	ld a, 1 ; Kanto
	call .GetAndPlaceNest
	ret

; 91dcd

.BlinkNestIcons: ; 91dcd
	ld a, [hVBlankCounter]
	ld e, a
	and $f
	ret nz
	ld a, e
	and $10
	jr nz, .copy_sprites
	call ClearSprites
	ret

.copy_sprites
	hlcoord 0, 0
	ld de, Sprites
	ld bc, SpritesEnd - Sprites
	call CopyBytes
	ret

; 91de9

.PlaceString_MonsNest: ; 91de9
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH
	ld a, " "
	call ByteFill
	hlcoord 0, 1
	ld a, $6
	ld [hli], a
	ld bc, SCREEN_WIDTH - 2
	ld a, $7
	call ByteFill
	ld [hl], $17
	call GetPokemonName
	hlcoord 2, 0
	call PlaceString
	ld h, b
	ld l, c
	ld de, .String_SNest
	call PlaceString
	ret

; 91e16

.String_SNest:
	db "'S NEST@"
; 91e1e

.GetAndPlaceNest: ; 91e1e
	ld [wd003], a
	ld e, a
	callba FindNest ; load nest landmarks into TileMap[0,0]
	decoord 0, 0
	ld hl, Sprites
.nestloop
	ld a, [de]
	and a
	jr z, .done_nest
	push de
	ld e, a
	push hl
	callba GetLandmarkCoords
	pop hl
	; load into OAM
	ld a, d
	sub 4
	ld [hli], a
	ld a, e
	sub 4
	ld [hli], a
	ld a, $7f ; nest icon in this context
	ld [hli], a
	xor a
	ld [hli], a
	; next
	pop de
	inc de
	jr .nestloop

.done_nest
	ld hl, Sprites
	decoord 0, 0
	ld bc, SpritesEnd - Sprites
	call CopyBytes
	ret

; 91e5a

.HideNestsShowPlayer: ; 91e5a
	call .CheckPlayerLocation
	ret c
	ld a, [wd002]
	ld e, a
	callba GetLandmarkCoords
	ld c, e
	ld b, d
	ld de, .PlayerOAM
	ld hl, Sprites
.ShowPlayerLoop:
	ld a, [de]
	cp $80
	jr z, .clear_oam
	add b
	ld [hli], a
	inc de
	ld a, [de]
	add c
	ld [hli], a
	inc de
	ld a, [de]
	add $78 ; where the player's sprite is loaded
	ld [hli], a
	inc de
	push bc
	ld c, 0 ; RED
	ld a, [PlayerGender]
	bit 0, a
	jr z, .got_gender
	inc c   ; BLUE
.got_gender
	ld a, c
	ld [hli], a
	pop bc
	jr .ShowPlayerLoop

.clear_oam
	ld hl, Sprites + 4 * 4
	ld bc, SpritesEnd - (Sprites + 4 * 4)
	xor a
	call ByteFill
	ret

; 91e9c

.PlayerOAM: ; 91e9c
	db -1 * 8, -1 * 8,  0 ; top left
	db -1 * 8,  0 * 8,  1 ; top right
	db  0 * 8, -1 * 8,  2 ; bottom left
	db  0 * 8,  0 * 8,  3 ; bottom right
	db $80 ; terminator
; 91ea9

.CheckPlayerLocation: ; 91ea9
; Don't show the player's sprite if you're

; not in the same region as what's currently
; on the screen.
	ld a, [wd002]
	cp FAST_SHIP
	jr z, .johto
	cp KANTO_LANDMARK
	jr c, .johto
.kanto
	ld a, [wd003]
	and a
	jr z, .clear
	jr .ok

.johto
	ld a, [wd003]
	and a
	jr nz, .clear
.ok
	and a
	ret

.clear
	ld hl, Sprites
	ld bc, SpritesEnd - Sprites
	xor a
	call ByteFill
	scf
	ret

; 91ed0

.GetPlayerOrFastShipIcon: ; 91ed0
	ld a, [wd002]
	cp FAST_SHIP
	jr z, .FastShip
	callba GetPlayerIcon
	ret

.FastShip:
	ld de, FastShipGFX
	ld b, BANK(FastShipGFX)
	ret

; 91ee4

TownMapBGUpdate: ; 91ee4
; Update BG Map tiles and attributes

; BG Map address
	ld a, l
	ld [hBGMapAddress], a
	ld a, h
	ld [hBGMapAddress + 1], a
; Only update palettes on CGB
	ld a, [hCGB]
	and a
	jr z, .tiles
; BG Map mode 2 (palettes)
	ld a, 2
	ld [hBGMapMode], a
; The BG Map is updated in thirds, so we wait

; 3 frames to update the whole screen's palettes.
	ld c, 3
	call DelayFrames
.tiles
; Update BG Map tiles
	call WaitBGMap
; Turn off BG Map update
	xor a
	ld [hBGMapMode], a
	ret

; 91eff

FillJohtoMap: ; 91eff
	ld de, JohtoMap
	jr FillTownMap

FillKantoMap: ; 91f04
	ld de, KantoMap
FillTownMap: ; 91f07
	hlcoord 0, 0
.loop
	ld a, [de]
	cp -1
	ret z
	ld a, [de]
	ld [hli], a
	inc de
	jr .loop

; 91f13

TownMapPals: ; 91f13
; Assign palettes based on tile ids
	hlcoord 0, 0
	decoord 0, 0, AttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
.loop
; Current tile
	ld a, [hli]
	push hl
; HP/borders use palette 0
	cp $60
	jr nc, .pal0
; The palette data is condensed to nybbles,

; least-significant first.
	ld hl, .PalMap
	srl a
	jr c, .odd
; Even-numbered tile ids take the bottom nybble...
	add l
	ld l, a
	ld a, h
	adc 0
	ld h, a
	ld a, [hl]
	and %111
	jr .update

.odd
; ...and odd ids take the top.
	add l
	ld l, a
	ld a, h
	adc 0
	ld h, a
	ld a, [hl]
	swap a
	and %111
	jr .update

.pal0
	xor a
.update
	pop hl
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret

.PalMap:
townmappals: MACRO
rept _NARG / 2
	dn \2, \1
	shift
	shift
endr
endm
	townmappals 1, 1, 1, 2, 2, 2, 0, 0, 1, 1, 3, 1, 4, 5, 4, 5
	townmappals 1, 1, 1, 2, 2, 2, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0
	townmappals 1, 1, 1, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	townmappals 0, 0, 0, 0, 4, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0
	townmappals 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0
	townmappals 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0
; 91f7b

TownMapMon: ; 91f7b
; Draw the FlyMon icon at town map location in

; Get FlyMon species
	ld a, [CurPartyMon]
	ld hl, PartySpecies
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	ld [wd265], a
; Get FlyMon icon
	ld e, 8 ; starting tile in VRAM
	callba GetSpeciesIcon
; Animation/palette
	depixel 0, 0
	ld a, SPRITE_ANIM_INDEX_00
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $8
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], SPRITE_ANIM_SEQ_NULL
	ret

; 91fa6

TownMapPlayerIcon: ; 91fa6
; Draw the player icon at town map location in a
	push af
	callba GetPlayerIcon
; Standing icon
	ld hl, VTiles0 tile $10
	ld c, 4 ; # tiles
	call Request2bpp
; Walking icon
	ld hl, $c0
	add hl, de
	ld d, h
	ld e, l
	ld hl, VTiles0 tile $14
	ld c, 4 ; # tiles
	ld a, BANK(ChrisSpriteGFX) ; does nothing
	call Request2bpp
; Animation/palette
	depixel 0, 0
	ld b, SPRITE_ANIM_INDEX_RED_WALK ; Male
	ld a, [PlayerGender]
	bit 0, a
	jr z, .got_gender
	ld b, SPRITE_ANIM_INDEX_BLUE_WALK ; Female
.got_gender
	ld a, b
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $10
	pop af
	ld e, a
	push bc
	callba GetLandmarkCoords
	pop bc
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], e
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld [hl], d
	ret

; 0x91ff2

LoadTownMapGFX: ; 91ff2
	ld hl, TownMapGFX
	ld de, VTiles2
	lb bc, BANK(TownMapGFX), $30
	call DecompressRequest2bpp
	ret

; 91fff

JohtoMap: ; 91fff
INCBIN "gfx/misc/johto.bin"
; 92168

KantoMap: ; 92168
INCBIN "gfx/misc/kanto.bin"
; 922d1

PokedexNestIconGFX: ; 922d1
INCBIN "gfx/pokegear/dexmap_nest_icon.2bpp"
FlyMapLabelBorderGFX: ; 922e1
INCBIN "gfx/pokegear/flymap_label_border.2bpp"

; XXX
	xor a
	ld [wd002], a
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	ld hl, hInMenu
	ld a, [hl]
	push af
	ld [hl], $1
	xor a
	ld [hBGMapMode], a
	callba ClearSpriteAnims
	call LoadTownMapGFX
	ld de, FlyMapLabelBorderGFX
	ld hl, VTiles2 tile $30
	lb bc, BANK(FlyMapLabelBorderGFX), 6
	call Request1bpp
	call FillKantoMap
	call TownMapBubble
	call TownMapPals
	hlbgcoord 0, 0, VBGMap1
	call TownMapBGUpdate
	call FillJohtoMap
	call TownMapBubble
	call TownMapPals
	hlbgcoord 0, 0
	call TownMapBGUpdate
	call TownMapMon
	ld a, c
	ld [wd003], a
	ld a, b
	ld [wd004], a
	ld b, SCGB_POKEGEAR_PALS
	call GetSGBLayout
	call SetPalettes
.loop
	call JoyTextDelay
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	jr nz, .pressedB
	ld a, [hl]
	and A_BUTTON
	jr nz, .pressedA
	call .HandleDPad
	call GetMapCursorCoordinates
	callba PlaySpriteAnimations
	call DelayFrame
	jr .loop

.pressedB
	ld a, -1
	jr .finished_a_b

.pressedA
	ld a, [wd002]
	ld l, a
	ld h, 0
	add hl, hl
	ld de, Flypoints + 1
	add hl, de
	ld a, [hl]
.finished_a_b
	ld [wd002], a
	pop af
	ld [hInMenu], a
	call ClearBGPalettes
	ld a, $90
	ld [hWY], a
	xor a
	ld [hBGMapAddress], a
	ld a, VBGMap0 / $100
	ld [hBGMapAddress + 1], a
	ld a, [wd002]
	ld e, a
	ret

; 923b8

.HandleDPad: ; 923b8
	ld hl, hJoyLast
	ld a, [hl]
	and D_DOWN | D_RIGHT
	jr nz, .down_right
	ld a, [hl]
	and D_UP | D_LEFT
	jr nz, .up_left
	ret

.down_right
	ld hl, wd002
	ld a, [hl]
	cp FLY_INDIGO
	jr c, .okay_dr
	ld [hl], -1
.okay_dr
	inc [hl]
	jr .continue

.up_left
	ld hl, wd002
	ld a, [hl]
	and a
	jr nz, .okay_ul
	ld [hl], FLY_INDIGO + 1
.okay_ul
	dec [hl]
.continue
	ld a, [wd002]
	cp KANTO_FLYPOINT
	jr c, .johto
	call FillKantoMap
	xor a
	ld b, $9c
	jr .finish

.johto
	call FillJohtoMap
	ld a, $90
	ld b, $98
.finish
	ld [hWY], a
	ld a, b
	ld [hBGMapAddress + 1], a
	call TownMapBubble
	call WaitBGMap
	xor a
	ld [hBGMapMode], a
	ret

; 92402
