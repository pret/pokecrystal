	const_def
	const DEXSTATE_MAIN_SCR
	const DEXSTATE_UPDATE_MAIN_SCR
	const DEXSTATE_DEX_ENTRY_SCR
	const DEXSTATE_UPDATE_DEX_ENTRY_SCR
	const DEXSTATE_REINIT_DEX_ENTRY_SCR
	const DEXSTATE_SEARCH_SCR
	const DEXSTATE_UPDATE_SEARCH_SCR
	const DEXSTATE_OPTION_SCR
	const DEXSTATE_UPDATE_OPTION_SCR
	const DEXSTATE_SEARCH_RESULTS_SCR
	const DEXSTATE_UPDATE_SEARCH_RESULTS_SCR
	const DEXSTATE_UNOWN_MODE
	const DEXSTATE_UPDATE_UNOWN_MODE
	const DEXSTATE_EXIT

Pokedex: ; 40000

	ld a, [hWX]
	ld l, a
	ld a, [hWY]
	ld h, a
	push hl
	ld a, [hSCX]
	push af
	ld hl, Options
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	ld a, [VramState]
	push af
	xor a
	ld [VramState], a
	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a

	xor a
	ld [hMapAnims], a
	call InitPokedex
	call DelayFrame

.main
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .exit
	call Pokedex_RunJumptable
	call DelayFrame
	jr .main

.exit
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	call WaitSFX
	call ClearSprites
	ld a, [wCurrentDexMode]
	ld [wLastDexMode], a

	pop af
	ld [hInMenu], a
	pop af
	ld [VramState], a
	pop af
	ld [Options], a
	pop af
	ld [hSCX], a
	pop hl
	ld a, l
	ld [hWX], a
	ld a, h
	ld [hWY], a
	ret

InitPokedex: ; 40063
	call ClearBGPalettes
	call ClearSprites
	call ClearTileMap
	call Pokedex_LoadGFX

	ld hl, wPokedexDataStart
	ld bc, wPokedexDataEnd - wPokedexDataStart
	xor a
	call ByteFill

	xor a
	ld [wJumptableIndex], a
	ld [wDexEntryPrevJumptableIndex], a
	ld [wcf65], a
	ld [wcf66], a

	call Pokedex_CheckUnlockedUnownMode

	ld a, [wLastDexMode]
	ld [wCurrentDexMode], a

	call Pokedex_OrderMonsByMode
	call Pokedex_InitCursorPosition
	call Pokedex_GetLandmark
	farcall DrawDexEntryScreenRightEdge
	call Pokedex_ResetBGMapMode
	ret

Pokedex_CheckUnlockedUnownMode: ; 400a2
	ld a, [wStatusFlags]
	bit 1, a
	jr nz, .unlocked

	xor a
	ld [wUnlockedUnownMode], a
	ret

.unlocked
	ld a, TRUE
	ld [wUnlockedUnownMode], a
	ret

Pokedex_InitCursorPosition: ; 400b4
	ld hl, wPokedexOrder
	ld a, [wLastDexEntry]
	and a
	jr z, .done
	cp NUM_POKEMON + 1
	jr nc, .done

	ld b, a
	ld a, [wDexListingEnd]
	cp $8
	jr c, .only_one_page

	sub $7
	ld c, a
.loop1
	ld a, b
	cp [hl]
	jr z, .done
	inc hl
	ld a, [wDexListingScrollOffset]
	inc a
	ld [wDexListingScrollOffset], a
	dec c
	jr nz, .loop1

.only_one_page
	ld c, $7
.loop2
	ld a, b
	cp [hl]
	jr z, .done
	inc hl
	ld a, [wDexListingCursor]
	inc a
	ld [wDexListingCursor], a
	dec c
	jr nz, .loop2

.done
	ret

Pokedex_GetLandmark: ; 400ed
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	call GetWorldMapLocation

	cp SPECIAL_MAP
	jr nz, .load

	ld a, [BackupMapGroup]
	ld b, a
	ld a, [BackupMapNumber]
	ld c, a
	call GetWorldMapLocation

.load
	ld [wDexCurrentLocation], a
	ret

Pokedex_RunJumptable: ; 4010b
	ld a, [wJumptableIndex]
	ld hl, .Jumptable
	call Pokedex_LoadPointer
	jp hl

.Jumptable: ; 40115 (10:4115)
	dw Pokedex_InitMainScreen
	dw Pokedex_UpdateMainScreen
	dw Pokedex_InitDexEntryScreen
	dw Pokedex_UpdateDexEntryScreen
	dw Pokedex_ReinitDexEntryScreen
	dw Pokedex_InitSearchScreen
	dw Pokedex_UpdateSearchScreen
	dw Pokedex_InitOptionScreen
	dw Pokedex_UpdateOptionScreen
	dw Pokedex_InitSearchResultsScreen
	dw Pokedex_UpdateSearchResultsScreen
	dw Pokedex_InitUnownMode
	dw Pokedex_UpdateUnownMode
	dw Pokedex_Exit

Pokedex_IncrementDexPointer: ; 40131 (10:4131)
	ld hl, wJumptableIndex
	inc [hl]
	ret

Pokedex_Exit: ; 40136 (10:4136)
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

Pokedex_InitMainScreen: ; 4013c (10:413c)
	xor a
	ld [hBGMapMode], a
	call ClearSprites
	xor a
	hlcoord 0, 0, AttrMap
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	call ByteFill
	farcall DrawPokedexListWindow
	hlcoord 0, 17
	ld de, String_START_SEARCH
	call Pokedex_PlaceString
	ld a, 7
	ld [wDexListingHeight], a
	call Pokedex_PrintListing
	call Pokedex_SetBGMapMode_3ifDMG_4ifCGB
	call Pokedex_ResetBGMapMode
	call Pokedex_DrawMainScreenBG
	ld a, $5
	ld [hSCX], a

	ld a, [wCurrentDexMode]
	cp DEXMODE_OLD
	ld a, $4a
	jr z, .okay
	ld a, $47
.okay
	ld [hWX], a
	xor a
	ld [hWY], a
	call WaitBGMap

	call Pokedex_ResetBGMapMode
	ld a, -1
	ld [CurPartySpecies], a
	ld a, SCGB_POKEDEX
	call Pokedex_GetSGBLayout
	call Pokedex_UpdateCursorOAM
	farcall DrawPokedexListWindow
	hlcoord 0, 17
	ld de, String_START_SEARCH
	call Pokedex_PlaceString
	ld a, 7
	ld [wDexListingHeight], a
	call Pokedex_PrintListing
	call Pokedex_IncrementDexPointer
	ret

Pokedex_UpdateMainScreen: ; 401ae (10:41ae)
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	jr nz, .b
	ld a, [hl]
	and A_BUTTON
	jr nz, .a
	ld a, [hl]
	and SELECT
	jr nz, .select
	ld a, [hl]
	and START
	jr nz, .start
	call Pokedex_ListingHandleDPadInput
	ret nc
	call Pokedex_UpdateCursorOAM
	xor a
	ld [hBGMapMode], a
	call Pokedex_PrintListing
	call Pokedex_SetBGMapMode3
	call Pokedex_ResetBGMapMode
	ret

.a
	call Pokedex_GetSelectedMon
	call Pokedex_CheckSeen
	ret z
	ld a, DEXSTATE_DEX_ENTRY_SCR
	ld [wJumptableIndex], a
	ld a, DEXSTATE_MAIN_SCR
	ld [wDexEntryPrevJumptableIndex], a
	ret

.select
	call Pokedex_BlackOutBG
	ld a, DEXSTATE_OPTION_SCR
	ld [wJumptableIndex], a
	xor a
	ld [hSCX], a
	ld a, $a7
	ld [hWX], a
	call DelayFrame
	ret

.start
	call Pokedex_BlackOutBG
	ld a, DEXSTATE_SEARCH_SCR
	ld [wJumptableIndex], a
	xor a
	ld [hSCX], a
	ld a, $a7
	ld [hWX], a
	call DelayFrame
	ret

.b
	ld a, DEXSTATE_EXIT
	ld [wJumptableIndex], a
	ret

Pokedex_InitDexEntryScreen: ; 40217 (10:4217)
	call LowVolume
	xor a
	ld [wPokedexStatus], a
	xor a
	ld [hBGMapMode], a
	call ClearSprites
	call Pokedex_LoadCurrentFootprint
	call Pokedex_DrawDexEntryScreenBG
	call Pokedex_InitArrowCursor
	call Pokedex_GetSelectedMon
	ld [wLastDexEntry], a
	farcall DisplayDexEntry
	call Pokedex_DrawFootprint
	call WaitBGMap
	ld a, $a7
	ld [hWX], a
	call Pokedex_GetSelectedMon
	ld [CurPartySpecies], a
	ld a, SCGB_POKEDEX
	call Pokedex_GetSGBLayout
	ld a, [CurPartySpecies]
	call PlayCry
	call Pokedex_IncrementDexPointer
	ret

Pokedex_UpdateDexEntryScreen: ; 40258 (10:4258)
	ld de, DexEntryScreen_ArrowCursorData
	call Pokedex_MoveArrowCursor
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	jr nz, .return_to_prev_screen
	ld a, [hl]
	and A_BUTTON
	jr nz, .do_menu_action
	call Pokedex_NextOrPreviousDexEntry
	ret nc
	call Pokedex_IncrementDexPointer
	ret

.do_menu_action
	ld a, [wDexArrowCursorPosIndex]
	ld hl, DexEntryScreen_MenuActionJumptable
	call Pokedex_LoadPointer
	jp hl

.return_to_prev_screen
	ld a, [LastVolume]
	and a
	jr z, .max_volume
	ld a, $77
	ld [LastVolume], a

.max_volume
	call MaxVolume
	ld a, [wDexEntryPrevJumptableIndex]
	ld [wJumptableIndex], a
	ret

Pokedex_Page: ; 40292
	ld a, [wPokedexStatus]
	xor $1
	ld [wPokedexStatus], a
	call Pokedex_GetSelectedMon
	ld [wLastDexEntry], a
	farcall DisplayDexEntry
	call WaitBGMap
	ret

Pokedex_ReinitDexEntryScreen: ; 402aa (10:42aa)
; Reinitialize the Pokédex entry screen after changing the selected mon.
	call Pokedex_BlackOutBG
	xor a
	ld [wPokedexStatus], a
	xor a
	ld [hBGMapMode], a
	call Pokedex_DrawDexEntryScreenBG
	call Pokedex_InitArrowCursor
	call Pokedex_LoadCurrentFootprint
	call Pokedex_GetSelectedMon
	ld [wLastDexEntry], a
	farcall DisplayDexEntry
	call Pokedex_DrawFootprint
	call Pokedex_LoadSelectedMonTiles
	call WaitBGMap
	call Pokedex_GetSelectedMon
	ld [CurPartySpecies], a
	ld a, SCGB_POKEDEX
	call Pokedex_GetSGBLayout
	ld a, [CurPartySpecies]
	call PlayCry
	ld hl, wJumptableIndex
	dec [hl]
	ret

DexEntryScreen_ArrowCursorData: ; 402e8
	db D_RIGHT | D_LEFT, 4
	dwcoord 1, 17
	dwcoord 6, 17
	dwcoord 11, 17
	dwcoord 15, 17


DexEntryScreen_MenuActionJumptable: ; 402f2
	dw Pokedex_Page
	dw .Area
	dw .Cry
	dw .Print

.Area: ; 402fa
	call Pokedex_BlackOutBG
	xor a
	ld [hSCX], a
	call DelayFrame
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	call Pokedex_GetSelectedMon
	ld a, [wDexCurrentLocation]
	ld e, a
	predef _Area
	call Pokedex_BlackOutBG
	call DelayFrame
	xor a
	ld [hBGMapMode], a
	ld a, $90
	ld [hWY], a
	ld a, $5
	ld [hSCX], a
	call DelayFrame
	call Pokedex_RedisplayDexEntry
	call Pokedex_LoadSelectedMonTiles
	call WaitBGMap
	call Pokedex_GetSelectedMon
	ld [CurPartySpecies], a
	ld a, SCGB_POKEDEX
	call Pokedex_GetSGBLayout
	ret

.Cry: ; 40340
	call Pokedex_GetSelectedMon
	ld a, [wd265]
	call GetCryIndex
	ld e, c
	ld d, b
	call PlayCryHeader
	ret

.Print: ; 4034f
	call Pokedex_ApplyPrintPals
	xor a
	ld [hSCX], a
	ld a, [wcf65]
	push af
	ld a, [wDexEntryPrevJumptableIndex]
	push af
	ld a, [wJumptableIndex]
	push af
	farcall PrintDexEntry
	pop af
	ld [wJumptableIndex], a
	pop af
	ld [wDexEntryPrevJumptableIndex], a
	pop af
	ld [wcf65], a
	call ClearBGPalettes
	call DisableLCD
	call Pokedex_LoadInvertedFont
	call Pokedex_RedisplayDexEntry
	call EnableLCD
	call WaitBGMap
	ld a, $5
	ld [hSCX], a
	call Pokedex_ApplyUsualPals
	ret

Pokedex_RedisplayDexEntry: ; 4038d
	call Pokedex_DrawDexEntryScreenBG
	call Pokedex_GetSelectedMon
	farcall DisplayDexEntry
	call Pokedex_DrawFootprint
	ret

Pokedex_InitOptionScreen: ; 4039d (10:439d)
	xor a
	ld [hBGMapMode], a
	call ClearSprites
	call Pokedex_DrawOptionScreenBG
	call Pokedex_InitArrowCursor
	ld a, [wCurrentDexMode] ; Index of the topmost visible item in a scrolling menu ???
	ld [wDexArrowCursorPosIndex], a
	call Pokedex_DisplayModeDescription
	call WaitBGMap
	ld a, SCGB_POKEDEX_SEARCH_OPTION
	call Pokedex_GetSGBLayout
	call Pokedex_IncrementDexPointer
	ret

Pokedex_UpdateOptionScreen: ; 403be (10:43be)
	ld a, [wUnlockedUnownMode]
	and a
	jr nz, .okay
	ld de, .NoUnownModeArrowCursorData
	jr .okay2
.okay
	ld de, .ArrowCursorData
.okay2
	call Pokedex_MoveArrowCursor
	call c, Pokedex_DisplayModeDescription
	ld hl, hJoyPressed
	ld a, [hl]
	and SELECT | B_BUTTON
	jr nz, .return_to_main_screen
	ld a, [hl]
	and A_BUTTON
	jr nz, .do_menu_action
	ret

.do_menu_action
	ld a, [wDexArrowCursorPosIndex]
	ld hl, .MenuActionJumptable
	call Pokedex_LoadPointer
	jp hl

.return_to_main_screen
	call Pokedex_BlackOutBG
	ld a, DEXSTATE_MAIN_SCR
	ld [wJumptableIndex], a
	ret

.NoUnownModeArrowCursorData: ; 403f3
	db D_UP | D_DOWN, 3
	dwcoord 2,  4
	dwcoord 2,  6
	dwcoord 2,  8

.ArrowCursorData: ; 403fb
	db D_UP | D_DOWN, 4
	dwcoord 2,  4
	dwcoord 2,  6
	dwcoord 2,  8
	dwcoord 2, 10

.MenuActionJumptable: ; 40405 (10:4405)
	dw .MenuAction_NewMode
	dw .MenuAction_OldMode
	dw .MenuAction_ABCMode
	dw .MenuAction_UnownMode

.MenuAction_NewMode: ; 4040d (10:440d)
	ld b, DEXMODE_NEW
	jr .ChangeMode

.MenuAction_OldMode: ; 40411 (10:4411)
	ld b, DEXMODE_OLD
	jr .ChangeMode

.MenuAction_ABCMode: ; 40415 (10:4415)
	ld b, DEXMODE_ABC

.ChangeMode: ; 40417 (10:4417)
	ld a, [wCurrentDexMode]
	cp b
	jr z, .skip_changing_mode ; Skip if new mode is same as current.

	ld a, b
	ld [wCurrentDexMode], a
	call Pokedex_OrderMonsByMode
	call Pokedex_DisplayChangingModesMessage
	xor a
	ld [wDexListingScrollOffset], a
	ld [wDexListingCursor], a
	call Pokedex_InitCursorPosition

.skip_changing_mode
	call Pokedex_BlackOutBG
	ld a, DEXSTATE_MAIN_SCR
	ld [wJumptableIndex], a
	ret

.MenuAction_UnownMode: ; 4043a (10:443a)
	call Pokedex_BlackOutBG
	ld a, DEXSTATE_UNOWN_MODE
	ld [wJumptableIndex], a
	ret

Pokedex_InitSearchScreen: ; 40443 (10:4443)
	xor a
	ld [hBGMapMode], a
	call ClearSprites
	call Pokedex_DrawSearchScreenBG
	call Pokedex_InitArrowCursor
	ld a, NORMAL + 1
	ld [wDexSearchMonType1], a
	xor a
	ld [wDexSearchMonType2], a
	call Pokedex_PlaceSearchScreenTypeStrings
	xor a
	ld [wDexSearchSlowpokeFrame], a
	farcall DoDexSearchSlowpokeFrame
	call WaitBGMap
	ld a, SCGB_POKEDEX_SEARCH_OPTION
	call Pokedex_GetSGBLayout
	call Pokedex_IncrementDexPointer
	ret

Pokedex_UpdateSearchScreen: ; 40471 (10:4471)
	ld de, .ArrowCursorData
	call Pokedex_MoveArrowCursor
	call Pokedex_UpdateSearchMonType
	call c, Pokedex_PlaceSearchScreenTypeStrings
	ld hl, hJoyPressed
	ld a, [hl]
	and START | B_BUTTON
	jr nz, .cancel
	ld a, [hl]
	and A_BUTTON
	jr nz, .do_menu_action
	ret

.do_menu_action
	ld a, [wDexArrowCursorPosIndex]
	ld hl, .MenuActionJumptable
	call Pokedex_LoadPointer
	jp hl

.cancel
	call Pokedex_BlackOutBG
	ld a, DEXSTATE_MAIN_SCR
	ld [wJumptableIndex], a
	ret

.ArrowCursorData: ; 4049e
	db D_UP | D_DOWN, 4
	dwcoord 2, 4
	dwcoord 2, 6
	dwcoord 2, 13
	dwcoord 2, 15

.MenuActionJumptable: ; 404a8
	dw .MenuAction_MonSearchType
	dw .MenuAction_MonSearchType
	dw .MenuAction_BeginSearch
	dw .MenuAction_Cancel

.MenuAction_MonSearchType: ; 404b0
	call Pokedex_NextSearchMonType
	call Pokedex_PlaceSearchScreenTypeStrings
	ret

.MenuAction_BeginSearch: ; 404b7
	call Pokedex_SearchForMons
	farcall AnimateDexSearchSlowpoke
	ld a, [wDexSearchResultCount]
	and a
	jr nz, .show_search_results

; No mon with matching types was found.
	call Pokedex_OrderMonsByMode
	call Pokedex_DisplayTypeNotFoundMessage
	xor a
	ld [hBGMapMode], a
	call Pokedex_DrawSearchScreenBG
	call Pokedex_InitArrowCursor
	call Pokedex_PlaceSearchScreenTypeStrings
	call WaitBGMap
	ret

.show_search_results
	ld [wDexListingEnd], a
	ld a, [wDexListingScrollOffset]
	ld [wDexListingScrollOffsetBackup], a
	ld a, [wDexListingCursor]
	ld [wDexListingCursorBackup], a
	ld a, [wLastDexEntry]
	ld [wcf65], a
	xor a
	ld [wDexListingScrollOffset], a
	ld [wDexListingCursor], a
	call Pokedex_BlackOutBG
	ld a, DEXSTATE_SEARCH_RESULTS_SCR
	ld [wJumptableIndex], a
	ret

.MenuAction_Cancel: ; 40501
	call Pokedex_BlackOutBG
	ld a, DEXSTATE_MAIN_SCR
	ld [wJumptableIndex], a
	ret

Pokedex_InitSearchResultsScreen: ; 4050a (10:450a)
	xor a
	ld [hBGMapMode], a
	xor a
	hlcoord 0, 0, AttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call ByteFill
	call Pokedex_SetBGMapMode4
	call Pokedex_ResetBGMapMode
	farcall DrawPokedexSearchResultsWindow
	call Pokedex_PlaceSearchResultsTypeStrings
	ld a, 4
	ld [wDexListingHeight], a
	call Pokedex_PrintListing
	call Pokedex_SetBGMapMode3
	call Pokedex_ResetBGMapMode
	call Pokedex_DrawSearchResultsScreenBG
	ld a, $5
	ld [hSCX], a
	ld a, $4a
	ld [hWX], a
	xor a
	ld [hWY], a
	call WaitBGMap
	call Pokedex_ResetBGMapMode
	farcall DrawPokedexSearchResultsWindow
	call Pokedex_PlaceSearchResultsTypeStrings
	call Pokedex_UpdateSearchResultsCursorOAM
	ld a, $ff
	ld [CurPartySpecies], a
	ld a, SCGB_POKEDEX
	call Pokedex_GetSGBLayout
	call Pokedex_IncrementDexPointer
	ret

Pokedex_UpdateSearchResultsScreen: ; 40562 (10:4562)
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	jr nz, .return_to_search_screen
	ld a, [hl]
	and A_BUTTON
	jr nz, .go_to_dex_entry
	call Pokedex_ListingHandleDPadInput
	ret nc
	call Pokedex_UpdateSearchResultsCursorOAM
	xor a
	ld [hBGMapMode], a
	call Pokedex_PrintListing
	call Pokedex_SetBGMapMode3
	call Pokedex_ResetBGMapMode
	ret

.go_to_dex_entry
	call Pokedex_GetSelectedMon
	call Pokedex_CheckSeen
	ret z
	ld a, DEXSTATE_DEX_ENTRY_SCR
	ld [wJumptableIndex], a
	ld a, DEXSTATE_SEARCH_RESULTS_SCR
	ld [wDexEntryPrevJumptableIndex], a
	ret

.return_to_search_screen
	ld a, [wDexListingScrollOffsetBackup]
	ld [wDexListingScrollOffset], a
	ld a, [wDexListingCursorBackup]
	ld [wDexListingCursor], a
	ld a, [wcf65]
	ld [wLastDexEntry], a
	call Pokedex_BlackOutBG
	call ClearSprites
	call Pokedex_OrderMonsByMode
	ld a, DEXSTATE_SEARCH_SCR
	ld [wJumptableIndex], a
	xor a
	ld [hSCX], a
	ld a, $a7
	ld [hWX], a
	ret

Pokedex_InitUnownMode: ; 405bd (10:45bd)
	call Pokedex_LoadUnownFont
	call Pokedex_DrawUnownModeBG
	xor a
	ld [wDexCurrentUnownIndex], a
	call Pokedex_LoadUnownFrontpicTiles
	call Pokedex_UnownModePlaceCursor
	farcall PrintUnownWord
	call WaitBGMap
	ld a, SCGB_POKEDEX_UNOWN_MODE
	call Pokedex_GetSGBLayout
	call Pokedex_IncrementDexPointer
	ret

Pokedex_UpdateUnownMode: ; 405df (10:45df)
	ld hl, hJoyPressed
	ld a, [hl]
	and A_BUTTON | B_BUTTON
	jr nz, .a_b
	call Pokedex_UnownModeHandleDPadInput
	ret

.a_b
	call Pokedex_BlackOutBG
	ld a, DEXSTATE_OPTION_SCR
	ld [wJumptableIndex], a
	call DelayFrame
	call Pokedex_CheckSGB
	jr nz, .decompress
	farcall LoadSGBPokedexGFX2
	jr .done

.decompress
	ld hl, PokedexLZ
	ld de, vTiles2 tile $31
	lb bc, BANK(PokedexLZ), $3a
	call DecompressRequest2bpp

.done
	ret

Pokedex_UnownModeHandleDPadInput: ; 40610 (10:4610)
	ld hl, hJoyLast
	ld a, [hl]
	and D_RIGHT
	jr nz, .right
	ld a, [hl]
	and D_LEFT
	jr nz, .left
	ret

.right
	ld a, [wDexUnownCount]
	ld e, a
	ld hl, wDexCurrentUnownIndex
	ld a, [hl]
	inc a
	cp e
	ret nc
	ld a, [hl]
	inc [hl]
	jr .update

.left
	ld hl, wDexCurrentUnownIndex
	ld a, [hl]
	and a
	ret z
	ld a, [hl]
	dec [hl]

.update
	push af
	xor a
	ld [hBGMapMode], a
	pop af
	call Pokedex_UnownModeEraseCursor
	call Pokedex_LoadUnownFrontpicTiles
	call Pokedex_UnownModePlaceCursor
	farcall PrintUnownWord
	ld a, $1
	ld [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	ret

Pokedex_UnownModeEraseCursor: ; 40654 (10:4654)
	ld c, " "
	jr Pokedex_UnownModeUpdateCursorGfx

Pokedex_UnownModePlaceCursor: ; 40658 (10:4658)
	ld a, [wDexCurrentUnownIndex]
	ld c, $5a ; diamond cursor

Pokedex_UnownModeUpdateCursorGfx: ; 4065d (10:465d)
	ld e, a
	ld d, 0
	ld hl, UnownModeLetterAndCursorCoords + 2
rept 4
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld [hl], c
	ret

Pokedex_NextOrPreviousDexEntry: ; 4066c (10:466c)
	ld a, [wDexListingCursor]
	ld [wBackupDexListingCursor], a
	ld a, [wDexListingScrollOffset]
	ld [wBackupDexListingPage], a
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .up
	ld a, [hl]
	and D_DOWN
	jr nz, .down
	and a
	ret

.up
	ld a, [wDexListingHeight]
	ld d, a
	ld a, [wDexListingEnd]
	ld e, a
	call Pokedex_ListingMoveCursorUp
	jr nc, .nope
	call Pokedex_GetSelectedMon
	call Pokedex_CheckSeen
	jr nz, .yep
	jr .up

.down
	ld a, [wDexListingHeight]
	ld d, a
	ld a, [wDexListingEnd]
	ld e, a
	call Pokedex_ListingMoveCursorDown
	jr nc, .nope
	call Pokedex_GetSelectedMon
	call Pokedex_CheckSeen
	jr nz, .yep
	jr .down

.yep
	scf
	ret

.nope
	ld a, [wBackupDexListingCursor]
	ld [wDexListingCursor], a
	ld a, [wBackupDexListingPage]
	ld [wDexListingScrollOffset], a
	and a
	ret

Pokedex_ListingHandleDPadInput: ; 406c5 (10:46c5)
; Handles D-pad input for a list of Pokémon.
	ld a, [wDexListingHeight]
	ld d, a
	ld a, [wDexListingEnd]
	ld e, a
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, Pokedex_ListingMoveCursorUp
	ld a, [hl]
	and D_DOWN
	jr nz, Pokedex_ListingMoveCursorDown
	ld a, d
	cp e
	jr nc, Pokedex_ListingPosStayedSame
	ld a, [hl]
	and D_LEFT
	jr nz, Pokedex_ListingMoveUpOnePage
	ld a, [hl]
	and D_RIGHT
	jr nz, Pokedex_ListingMoveDownOnePage
	jr Pokedex_ListingPosStayedSame

Pokedex_ListingMoveCursorUp: ; 406ea (10:46ea)
	ld hl, wDexListingCursor
	ld a, [hl]
	and a
	jr z, .try_scrolling
	dec [hl]
	jr Pokedex_ListingPosChanged
.try_scrolling
	ld hl, wDexListingScrollOffset
	ld a, [hl]
	and a
	jr z, Pokedex_ListingPosStayedSame
	dec [hl]
	jr Pokedex_ListingPosChanged

Pokedex_ListingMoveCursorDown: ; 406fe (10:46fe)
	ld hl, wDexListingCursor
	ld a, [hl]
	inc a
	cp e
	jr nc, Pokedex_ListingPosStayedSame
	cp d
	jr nc, .try_scrolling
	inc [hl]
	jr Pokedex_ListingPosChanged
.try_scrolling
	ld hl, wDexListingScrollOffset
	add [hl]
	cp e
	jr nc, Pokedex_ListingPosStayedSame
	inc [hl]
	jr Pokedex_ListingPosChanged

Pokedex_ListingMoveUpOnePage: ; 40716 (10:4716)
	ld hl, wDexListingScrollOffset
	ld a, [hl]
	and a
	jr z, Pokedex_ListingPosStayedSame
	cp d
	jr nc, .not_near_top
; If we're already less than page away from the top, go to the top.
	xor a
	ld [hl], a
	jr Pokedex_ListingPosChanged
.not_near_top
	sub d
	ld [hl], a
	jr Pokedex_ListingPosChanged

Pokedex_ListingMoveDownOnePage: ; 40728 (10:4728)
; When moving down a page, the return value always report a change in position.
	ld hl, wDexListingScrollOffset
	ld a, d
	add a
	add [hl]
	jr c, .near_bottom
	cp e
	jr c, .not_near_bottom
.near_bottom
	ld a, e
	sub d
	ld [hl], a
	jr Pokedex_ListingPosChanged
.not_near_bottom
	ld a, [hl]
	add d
	ld [hl], a
	jr Pokedex_ListingPosChanged

Pokedex_ListingPosStayedSame: ; 4073d (10:473d)
	and a
	ret

Pokedex_ListingPosChanged: ; 4073f (10:473f)
	scf
	ret

Pokedex_FillColumn: ; 40741
; Fills a column starting at HL, going downwards.
; B is the height of the column and A is the tile it's filled with.
	push de
	ld de, SCREEN_WIDTH
.loop
	ld [hl], a
	add hl, de
	dec b
	jr nz, .loop
	pop de
	ret


Pokedex_DrawMainScreenBG: ; 4074c (10:474c)
; Draws the left sidebar and the bottom bar on the main screen.
	hlcoord 0, 17
	ld de, String_START_SEARCH
	call Pokedex_PlaceString
	ld a, $32
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call ByteFill
	hlcoord 0, 0
	lb bc, 7, 7
	call Pokedex_PlaceBorder
	hlcoord 0, 9
	lb bc, 6, 7
	call Pokedex_PlaceBorder
	hlcoord 1, 11
	ld de, String_SEEN
	call Pokedex_PlaceString
	ld hl, PokedexSeen
	ld b, EndPokedexSeen - PokedexSeen
	call CountSetBits
	ld de, wd265
	hlcoord 5, 12
	lb bc, 1, 3
	call PrintNum
	hlcoord 1, 14
	ld de, String_OWN
	call Pokedex_PlaceString
	ld hl, PokedexCaught
	ld b, EndPokedexCaught - PokedexCaught
	call CountSetBits
	ld de, wd265
	hlcoord 5, 15
	lb bc, 1, 3
	call PrintNum
	hlcoord 1, 17
	ld de, String_SELECT_OPTION
	call Pokedex_PlaceString
	hlcoord 8, 1
	ld b, 7
	ld a, $5a
	call Pokedex_FillColumn
	hlcoord 8, 10
	ld b, 6
	ld a, $5a
	call Pokedex_FillColumn
	hlcoord 8, 0
	ld [hl], $59
	hlcoord 8, 8
	ld [hl], $53
	hlcoord 8, 9
	ld [hl], $54
	hlcoord 8, 16
	ld [hl], $5b
	call Pokedex_PlaceFrontpicTopLeftCorner
	ret

String_SEEN: ; 407e1
	db "SEEN", $ff
String_OWN: ; 407e6
	db "OWN", $ff
String_SELECT_OPTION: ; 407ea
	db $3b, $48, $49, $4a, $44, $45, $46, $47 ; SELECT > OPTION
String_START_SEARCH: ; 407f2
	db $3c, $3b, $41, $42, $43, $4b, $4c, $4d, $4e, $3c, $ff ; START > SEARCH

Pokedex_DrawDexEntryScreenBG: ; 407fd
	call Pokedex_FillBackgroundColor2
	hlcoord 0, 0
	lb bc, 15, 18
	call Pokedex_PlaceBorder
	hlcoord 19, 0
	ld [hl], $34
	hlcoord 19, 1
	ld a, " "
	ld b, 15
	call Pokedex_FillColumn
	ld [hl], $39
	hlcoord 1, 10
	ld bc, 19
	ld a, $61
	call ByteFill
	hlcoord 1, 17
	ld bc, 18
	ld a, " "
	call ByteFill
	hlcoord 9, 7
	ld de, .Height
	call Pokedex_PlaceString
	hlcoord 9, 9
	ld de, .Weight
	call Pokedex_PlaceString
	hlcoord 0, 17
	ld de, .MenuItems
	call Pokedex_PlaceString
	call Pokedex_PlaceFrontpicTopLeftCorner
	ret

.Unused: ; 4084f
	db $5c, $5d, $ff ; No.
.Height: ; 40852
	db "HT  ?", $5e, "??", $5f, $ff ; HT  ?'??"
.Weight: ; 4085c
	db "WT   ???lb", $ff ; WT   ???lb
.MenuItems: ; 40867
	db $3b, " PAGE AREA CRY PRNT", $ff

Pokedex_DrawOptionScreenBG: ; 4087c (10:487c)
	call Pokedex_FillBackgroundColor2
	hlcoord 0, 2
	lb bc, 8, 18
	call Pokedex_PlaceBorder
	hlcoord 0, 12
	lb bc, 4, 18
	call Pokedex_PlaceBorder
	hlcoord 0, 1
	ld de, .Title
	call Pokedex_PlaceString
	hlcoord 3, 4
	ld de, .Modes
	call PlaceString
	ld a, [wUnlockedUnownMode]
	and a
	ret z
	hlcoord 3, 10
	ld de, .UnownMode
	call PlaceString
	ret

.Title: ; 408b2
	db $3b, " OPTION ", $3c, $ff

.Modes: ; 408bd
	db   "NEW #DEX MODE"
	next "OLD #DEX MODE"
	next "A to Z MODE"
	db "@"

.UnownMode: ; 408e5
	db "UNOWN MODE@"

Pokedex_DrawSearchScreenBG: ; 408f0 (10:48f0)
	call Pokedex_FillBackgroundColor2
	hlcoord 0, 2
	lb bc, 14, 18
	call Pokedex_PlaceBorder
	hlcoord 0, 1
	ld de, .Title
	call Pokedex_PlaceString
	hlcoord 8, 4
	ld de, .TypeLeftRightArrows
	call Pokedex_PlaceString
	hlcoord 8, 6
	ld de, .TypeLeftRightArrows
	call Pokedex_PlaceString
	hlcoord 3, 4
	ld de, .Types
	call PlaceString
	hlcoord 3, 13
	ld de, .Menu
	call PlaceString
	ret

.Title: ; 4092a
	db $3b, " SEARCH ", $3c, $ff

.TypeLeftRightArrows: ; 40935
	db $3d, "        ", $3e, $ff

.Types: ; 40940
	db   "TYPE1"
	next "TYPE2"
	db   "@"

.Menu: ; 4094c
	db   "BEGIN SEARCH!!"
	next "CANCEL"
	db   "@"

Pokedex_DrawSearchResultsScreenBG: ; 40962 (10:4962)
	call Pokedex_FillBackgroundColor2
	hlcoord 0, 0
	lb bc, 7, 7
	call Pokedex_PlaceBorder
	hlcoord 0, 11
	lb bc, 5, 18
	call Pokedex_PlaceBorder
	hlcoord 1, 12
	ld de, .BottomWindowText
	call PlaceString
	ld de, wDexSearchResultCount
	hlcoord 1, 16
	lb bc, 1, 3
	call PrintNum
	hlcoord 8, 0
	ld [hl], $59
	hlcoord 8, 1
	ld b, 7
	ld a, $5a
	call Pokedex_FillColumn
	hlcoord 8, 8
	ld [hl], $53
	hlcoord 8, 9
	ld [hl], $69
	hlcoord 8, 10
	ld [hl], $6a
	call Pokedex_PlaceFrontpicTopLeftCorner
	ret

.BottomWindowText: ; 409ae
	db   "SEARCH RESULTS"
	next "  TYPE"
	next "    FOUND!"
	db   "@"

Pokedex_PlaceSearchResultsTypeStrings: ; 409cf (10:49cf)
	ld a, [wDexSearchMonType1]
	hlcoord 0, 14
	call Pokedex_PlaceTypeString
	ld a, [wDexSearchMonType1]
	ld b, a
	ld a, [wDexSearchMonType2]
	and a
	jr z, .done
	cp b
	jr z, .done
	hlcoord 2, 15
	call Pokedex_PlaceTypeString
	hlcoord 1, 15
	ld [hl], "/"
.done
	ret

Pokedex_DrawUnownModeBG: ; 409f1 (10:49f1)
	call Pokedex_FillBackgroundColor2
	hlcoord 2, 1
	lb bc, 10, 13
	call Pokedex_PlaceBorder
	hlcoord 2, 14
	lb bc, 1, 13
	call Pokedex_PlaceBorder
	hlcoord 2, 15
	ld [hl], $3d
	hlcoord 16, 15
	ld [hl], $3e
	hlcoord 6, 5
	call Pokedex_PlaceFrontpicAtHL
	ld de, 0
	ld b, 0
	ld c, 26
.loop
	ld hl, UnownDex
	add hl, de
	ld a, [hl]
	and a
	jr z, .done
	push af
	ld hl, UnownModeLetterAndCursorCoords
rept 4
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	add $40 - 1 ; Unown A
	ld [hl], a
	inc de
	inc b
	dec c
	jr nz, .loop
.done
	ld a, b
	ld [wDexUnownCount], a
	ret

UnownModeLetterAndCursorCoords: ; 40a3e
;           letter, cursor
	dwcoord   4,11,   3,11
	dwcoord   4,10,   3,10
	dwcoord   4, 9,   3, 9
	dwcoord   4, 8,   3, 8
	dwcoord   4, 7,   3, 7
	dwcoord   4, 6,   3, 6
	dwcoord   4, 5,   3, 5
	dwcoord   4, 4,   3, 4
	dwcoord   4, 3,   3, 2
	dwcoord   5, 3,   5, 2
	dwcoord   6, 3,   6, 2
	dwcoord   7, 3,   7, 2
	dwcoord   8, 3,   8, 2
	dwcoord   9, 3,   9, 2
	dwcoord  10, 3,  10, 2
	dwcoord  11, 3,  11, 2
	dwcoord  12, 3,  12, 2
	dwcoord  13, 3,  13, 2
	dwcoord  14, 3,  15, 2
	dwcoord  14, 4,  15, 4
	dwcoord  14, 5,  15, 5
	dwcoord  14, 6,  15, 6
	dwcoord  14, 7,  15, 7
	dwcoord  14, 8,  15, 8
	dwcoord  14, 9,  15, 9
	dwcoord  14,10,  15,10

Pokedex_FillBackgroundColor2: ; 40aa6
	hlcoord 0, 0
	ld a, $32
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call ByteFill
	ret

Pokedex_PlaceFrontpicTopLeftCorner: ; 40ab2
	hlcoord 1, 1
Pokedex_PlaceFrontpicAtHL: ; 40ab5
	xor a
	ld b, $7
.row
	ld c, $7
	push af
	push hl
.col
	ld [hli], a
	add $7
	dec c
	jr nz, .col
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	pop af
	inc a
	dec b
	jr nz, .row
	ret

Pokedex_PlaceString: ; 40acd
.loop
	ld a, [de]
	cp -1
	ret z
	inc de
	ld [hli], a
	jr .loop


Pokedex_PlaceBorder: ; 40ad5
	push hl
	ld a, $33
	ld [hli], a
	ld d, $34
	call .FillRow
	ld a, $35
	ld [hl], a
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
.loop
	push hl
	ld a, $36
	ld [hli], a
	ld d, $7f
	call .FillRow
	ld a, $37
	ld [hl], a
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .loop
	ld a, $38
	ld [hli], a
	ld d, $39
	call .FillRow
	ld a, $3a
	ld [hl], a
	ret

.FillRow: ; 40b06
	ld e, c
.row_loop
	ld a, e
	and a
	ret z
	ld a, d
	ld [hli], a
	dec e
	jr .row_loop


Pokedex_PrintListing: ; 40b0f (10:4b0f)
; Prints the list of Pokémon on the main Pokédex screen.

; This check is completely useless.
	ld a, [wCurrentDexMode]
	cp DEXMODE_OLD
	jr z, .okay
	ld c, 11
	jr .resume
.okay
	ld c, 11
; End useless check

.resume
; Clear (2 * [wDexListingHeight] + 1) by 11 box starting at 0,1
	hlcoord 0, 1
	ld a, [wDexListingHeight]
	add a
	inc a
	ld b, a
	ld a, " "
	call Pokedex_FillBox

; Load de with wPokedexOrder + [wDexListingScrollOffset]
	ld a, [wDexListingScrollOffset]
	ld e, a
	ld d, $0
	ld hl, wPokedexOrder
	add hl, de
	ld e, l
	ld d, h
	hlcoord 0, 2
	ld a, [wDexListingHeight]
.loop
	push af
	ld a, [de]
	ld [wd265], a
	push de
	push hl
	call .PrintEntry
	pop hl
	ld de, 2 * SCREEN_WIDTH
	add hl, de
	pop de
	inc de
	pop af
	dec a
	jr nz, .loop
	call Pokedex_LoadSelectedMonTiles
	ret

.PrintEntry: ; 40b55 (10:4b55)
; Prints one entry in the list of Pokémon on the main Pokédex screen.
	and a
	ret z
	call Pokedex_PrintNumberIfOldMode
	call Pokedex_PlaceDefaultStringIfNotSeen
	ret c
	call Pokedex_PlaceCaughtSymbolIfCaught
	push hl
	call GetPokemonName
	pop hl
	call PlaceString
	ret

Pokedex_PrintNumberIfOldMode: ; 40b6a (10:4b6a)
	ld a, [wCurrentDexMode]
	cp DEXMODE_OLD
	jr z, .printnum
	ret

.printnum
	push hl
	ld de, -SCREEN_WIDTH
	add hl, de
	ld de, wd265
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	pop hl
	ret

Pokedex_PlaceCaughtSymbolIfCaught: ; 40b82 (10:4b82)
	call Pokedex_CheckCaught
	jr nz, .place_caught_symbol
	inc hl
	ret

.place_caught_symbol
	ld a, $4f
	ld [hli], a
	ret

Pokedex_PlaceDefaultStringIfNotSeen: ; 40b8d (10:4b8d)
	call Pokedex_CheckSeen
	ret nz
	inc hl
	ld de, .NameNotSeen
	call PlaceString
	scf
	ret

.NameNotSeen: ; 40b9a
	db "-----@"

Pokedex_DrawFootprint: ; 40ba0
	hlcoord 18, 1
	ld a, $62
	ld [hli], a
	inc a
	ld [hl], a
	hlcoord 18, 2
	ld a, $64
	ld [hli], a
	inc a
	ld [hl], a
	ret


Pokedex_GetSelectedMon: ; 40bb1
; Gets the species of the currently selected Pokémon. This corresponds to the
; position of the cursor in the main listing, but this function can be used
; on all Pokédex screens.
	ld a, [wDexListingCursor]
	ld hl, wDexListingScrollOffset
	add [hl]
	ld e, a
	ld d, $0
	ld hl, wPokedexOrder
	add hl, de
	ld a, [hl]
	ld [wd265], a
	ret


Pokedex_CheckCaught: ; 40bc4 (10:4bc4)
	push de
	push hl
	ld a, [wd265]
	dec a
	call CheckCaughtMon
	pop hl
	pop de
	ret


Pokedex_CheckSeen: ; 40bd0
	push de
	push hl
	ld a, [wd265]
	dec a
	call CheckSeenMon
	pop hl
	pop de
	ret



Pokedex_OrderMonsByMode: ; 40bdc
	ld hl, wPokedexOrder
	ld bc, wPokedexOrderEnd - wPokedexOrder
	xor a
	call ByteFill
	ld a, [wCurrentDexMode]
	ld hl, .Jumptable
	call Pokedex_LoadPointer
	jp hl

.Jumptable: ; 40bf0 (10:4bf0)
	dw .NewMode
	dw .OldMode
	dw Pokedex_ABCMode

.NewMode: ; 40bf6 (10:4bf6)
	ld de, NewPokedexOrder
	ld hl, wPokedexOrder
	ld c, NUM_POKEMON
.loopnew
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .loopnew
	call .FindLastSeen
	ret

.OldMode: ; 40c08 (10:4c08)
	ld hl, wPokedexOrder
	ld a, $1
	ld c, NUM_POKEMON
.loopold
	ld [hli], a
	inc a
	dec c
	jr nz, .loopold
	call .FindLastSeen
	ret

.FindLastSeen: ; 40c18 (10:4c18)
	ld hl, wPokedexOrder + NUM_POKEMON - 1
	ld d, NUM_POKEMON
	ld e, d
.loopfindend
	ld a, [hld]
	ld [wd265], a
	call Pokedex_CheckSeen
	jr nz, .foundend
	dec d
	dec e
	jr nz, .loopfindend
.foundend
	ld a, d
	ld [wDexListingEnd], a
	ret

Pokedex_ABCMode: ; 40c30
	xor a
	ld [wDexListingEnd], a
	ld hl, wPokedexOrder
	ld de, AlphabeticalPokedexOrder
	ld c, NUM_POKEMON
.loop1abc
	push bc
	ld a, [de]
	ld [wd265], a
	call Pokedex_CheckSeen
	jr z, .skipabc
	ld a, [wd265]
	ld [hli], a
	ld a, [wDexListingEnd]
	inc a
	ld [wDexListingEnd], a

.skipabc
	inc de
	pop bc
	dec c
	jr nz, .loop1abc
	ld a, [wDexListingEnd]
	ld c, 0
.loop2abc
	cp NUM_POKEMON
	jr z, .doneabc
	ld [hl], c
	inc hl
	inc a
	jr .loop2abc

.doneabc
	ret


INCLUDE "data/pokemon/dex_order_alpha.asm"

INCLUDE "data/pokemon/dex_order_new.asm"


Pokedex_DisplayModeDescription: ; 40e5b
	xor a
	ld [hBGMapMode], a
	hlcoord 0, 12
	lb bc, 4, 18
	call Pokedex_PlaceBorder
	ld a, [wDexArrowCursorPosIndex]
	ld hl, .Modes
	call Pokedex_LoadPointer
	ld e, l
	ld d, h
	hlcoord 1, 14
	call PlaceString
	ld a, $1
	ld [hBGMapMode], a
	ret

.Modes: ; 40e7d
	dw .NewMode
	dw .OldMode
	dw .ABCMode
	dw .UnownMode

.NewMode: ; 40e85
	db   "<PK><MN> are listed by"
	next "evolution type.@"

.OldMode: ; 40ea6
	db   "<PK><MN> are listed by"
	next "official type.@"

.ABCMode: ; 40ec6
	db   "<PK><MN> are listed"
	next "alphabetically.@"

.UnownMode: ; 40ee4
	db   "UNOWN are listed"
	next "in catching order.@"

Pokedex_DisplayChangingModesMessage: ; 40f08 (10:4f08)
	xor a
	ld [hBGMapMode], a
	hlcoord 0, 12
	lb bc, 4, 18
	call Pokedex_PlaceBorder
	ld de, String_ChangingModesPleaseWait
	hlcoord 1, 14
	call PlaceString
	ld a, $1
	ld [hBGMapMode], a
	ld c, 64
	call DelayFrames
	ld de, SFX_CHANGE_DEX_MODE
	call PlaySFX
	ld c, 64
	call DelayFrames
	ret

String_ChangingModesPleaseWait: ; 40f32
	db   "Changing modes."
	next "Please wait.@"

Pokedex_UpdateSearchMonType: ; 40f4f (10:4f4f)
	ld a, [wDexArrowCursorPosIndex]
	cp 2
	jr nc, .no_change
	ld hl, hJoyLast
	ld a, [hl]
	and D_LEFT
	jr nz, Pokedex_PrevSearchMonType
	ld a, [hl]
	and D_RIGHT
	jr nz, Pokedex_NextSearchMonType
.no_change
	and a
	ret

Pokedex_PrevSearchMonType: ; 40f65
	ld a, [wDexArrowCursorPosIndex]
	and a
	jr nz, .type2

	ld hl, wDexSearchMonType1
	ld a, [hl]
	cp $1
	jr z, .wrap_around
	dec [hl]
	jr .done

.type2
	ld hl, wDexSearchMonType2
	ld a, [hl]
	and a
	jr z, .wrap_around
	dec [hl]
	jr .done

.wrap_around
	ld [hl], $11

.done
	scf
	ret

Pokedex_NextSearchMonType: ; 40f84
	ld a, [wDexArrowCursorPosIndex]
	and a
	jr nz, .type2

	ld hl, wDexSearchMonType1
	ld a, [hl]
	cp $11
	jr nc, .type1_wrap_around
	inc [hl]
	jr .done
.type1_wrap_around
	ld [hl], $1
	jr .done

.type2
	ld hl, wDexSearchMonType2
	ld a, [hl]
	cp $11
	jr nc, .type2_wrap_around
	inc [hl]
	jr .done
.type2_wrap_around
	ld [hl], 0

.done
	scf
	ret

Pokedex_PlaceSearchScreenTypeStrings: ; 40fa8 (10:4fa8)
	xor a
	ld [hBGMapMode], a
	hlcoord 9, 3
	lb bc, 4, 8
	ld a, " "
	call Pokedex_FillBox
	ld a, [wDexSearchMonType1]
	hlcoord 9, 4
	call Pokedex_PlaceTypeString
	ld a, [wDexSearchMonType2]
	hlcoord 9, 6
	call Pokedex_PlaceTypeString
	ld a, $1
	ld [hBGMapMode], a
	ret

Pokedex_PlaceTypeString: ; 40fcd (10:4fcd)
	push hl
	ld e, a
	ld d, 0
	ld hl, .TypeStrings
rept 9
	add hl, de
endr
	ld e, l
	ld d, h
	pop hl
	call PlaceString
	ret

.TypeStrings: ; 40fe4
	db "  ----  @"
	db " NORMAL @"
	db "  FIRE  @"
	db " WATER  @"
	db " GRASS  @"
	db "ELECTRIC@"
	db "  ICE   @"
	db "FIGHTING@"
	db " POISON @"
	db " GROUND @"
	db " FLYING @"
	db "PSYCHIC @"
	db "  BUG   @"
	db "  ROCK  @"
	db " GHOST  @"
	db " DRAGON @"
	db "  DARK  @"
	db " STEEL  @"

Pokedex_SearchForMons: ; 41086
	ld a, [wDexSearchMonType2]
	and a
	call nz, .Search
	ld a, [wDexSearchMonType1]
	and a
	call nz, .Search
	ret

.Search: ; 41095
	dec a
	ld e, a
	ld d, 0
	ld hl, .TypeConversionTable
	add hl, de
	ld a, [hl]
	ld [wDexConvertedMonType], a
	ld hl, wPokedexOrder
	ld de, wPokedexOrder
	ld c, NUM_POKEMON
	xor a
	ld [wDexSearchResultCount], a
.loop
	push bc
	ld a, [hl]
	and a
	jr z, .next_mon
	ld [wd265], a
	ld [CurSpecies], a
	call Pokedex_CheckCaught
	jr z, .next_mon
	push hl
	push de
	call GetBaseData
	pop de
	pop hl
	ld a, [wDexConvertedMonType]
	ld b, a
	ld a, [BaseType1]
	cp b
	jr z, .match_found
	ld a, [BaseType2]
	cp b
	jr nz, .next_mon

.match_found
	ld a, [wd265]
	ld [de], a
	inc de
	ld a, [wDexSearchResultCount]
	inc a
	ld [wDexSearchResultCount], a

.next_mon
	inc hl
	pop bc
	dec c
	jr nz, .loop

	ld l, e
	ld h, d
	ld a, [wDexSearchResultCount]
	ld c, 0

.zero_remaining_mons
	cp NUM_POKEMON
	jr z, .done
	ld [hl], c
	inc hl
	inc a
	jr .zero_remaining_mons

.done
	ret

.TypeConversionTable: ; 410f6
	db NORMAL
	db FIRE
	db WATER
	db GRASS
	db ELECTRIC
	db ICE
	db FIGHTING
	db POISON
	db GROUND
	db FLYING
	db PSYCHIC
	db BUG
	db ROCK
	db GHOST
	db DRAGON
	db DARK
	db STEEL

Pokedex_DisplayTypeNotFoundMessage: ; 41107
	xor a
	ld [hBGMapMode], a
	hlcoord 0, 12
	lb bc, 4, 18
	call Pokedex_PlaceBorder
	ld de, .TypeNotFound
	hlcoord 1, 14
	call PlaceString
	ld a, $1
	ld [hBGMapMode], a
	ld c, $80
	call DelayFrames
	ret

.TypeNotFound: ; 41126
	db   "The specified type"
	next "was not found.@"

Pokedex_UpdateCursorOAM: ; 41148 (10:5148)
	ld a, [wCurrentDexMode]
	cp DEXMODE_OLD
	jp z, Pokedex_PutOldModeCursorOAM
	call Pokedex_PutNewModeABCModeCursorOAM
	call Pokedex_PutScrollbarOAM
	ret

Pokedex_PutOldModeCursorOAM: ; 41157 (10:5157)
	ld hl, .CursorOAM
	ld a, [wDexListingCursor]
	or a
	jr nz, .okay
	ld hl, .CursorAtTopOAM
.okay
	call Pokedex_LoadCursorOAM
	ret

.CursorOAM: ; 41167
	dsprite  3,  0,  9, -1, $30, 7
	dsprite  2,  0,  9, -1, $31, 7
	dsprite  2,  0, 10, -1, $32, 7
	dsprite  2,  0, 11, -1, $32, 7
	dsprite  2,  0, 12, -1, $32, 7
	dsprite  2,  0, 13, -1, $33, 7
	dsprite  2,  0, 16, -2, $33, 7 | X_FLIP
	dsprite  2,  0, 17, -2, $32, 7 | X_FLIP
	dsprite  2,  0, 18, -2, $32, 7 | X_FLIP
	dsprite  2,  0, 19, -2, $32, 7 | X_FLIP
	dsprite  2,  0, 20, -2, $31, 7 | X_FLIP
	dsprite  3,  0, 20, -2, $30, 7 | X_FLIP
	dsprite  4,  0,  9, -1, $30, 7 | Y_FLIP
	dsprite  5,  0,  9, -1, $31, 7 | Y_FLIP
	dsprite  5,  0, 10, -1, $32, 7 | Y_FLIP
	dsprite  5,  0, 11, -1, $32, 7 | Y_FLIP
	dsprite  5,  0, 12, -1, $32, 7 | Y_FLIP
	dsprite  5,  0, 13, -1, $33, 7 | Y_FLIP
	dsprite  5,  0, 16, -2, $33, 7 | X_FLIP | Y_FLIP
	dsprite  5,  0, 17, -2, $32, 7 | X_FLIP | Y_FLIP
	dsprite  5,  0, 18, -2, $32, 7 | X_FLIP | Y_FLIP
	dsprite  5,  0, 19, -2, $32, 7 | X_FLIP | Y_FLIP
	dsprite  5,  0, 20, -2, $31, 7 | X_FLIP | Y_FLIP
	dsprite  4,  0, 20, -2, $30, 7 | X_FLIP | Y_FLIP
	db $ff

.CursorAtTopOAM: ; 411c8
; OAM data for when the cursor is at the top of the list. The tiles at the top
; are cut off so they don't show up outside the list area.
	dsprite  3,  0,  9, -1, $30, 7
	dsprite  2,  0,  9, -1, $34, 7
	dsprite  2,  0, 10, -1, $35, 7
	dsprite  2,  0, 11, -1, $35, 7
	dsprite  2,  0, 12, -1, $35, 7
	dsprite  2,  0, 13, -1, $36, 7
	dsprite  2,  0, 16, -2, $36, 7 | X_FLIP
	dsprite  2,  0, 17, -2, $35, 7 | X_FLIP
	dsprite  2,  0, 18, -2, $35, 7 | X_FLIP
	dsprite  2,  0, 19, -2, $35, 7 | X_FLIP
	dsprite  2,  0, 20, -2, $34, 7 | X_FLIP
	dsprite  3,  0, 20, -2, $30, 7 | X_FLIP
	dsprite  4,  0,  9, -1, $30, 7 | Y_FLIP
	dsprite  5,  0,  9, -1, $31, 7 | Y_FLIP
	dsprite  5,  0, 10, -1, $32, 7 | Y_FLIP
	dsprite  5,  0, 11, -1, $32, 7 | Y_FLIP
	dsprite  5,  0, 12, -1, $32, 7 | Y_FLIP
	dsprite  5,  0, 13, -1, $33, 7 | Y_FLIP
	dsprite  5,  0, 16, -2, $33, 7 | X_FLIP | Y_FLIP
	dsprite  5,  0, 17, -2, $32, 7 | X_FLIP | Y_FLIP
	dsprite  5,  0, 18, -2, $32, 7 | X_FLIP | Y_FLIP
	dsprite  5,  0, 19, -2, $32, 7 | X_FLIP | Y_FLIP
	dsprite  5,  0, 20, -2, $31, 7 | X_FLIP | Y_FLIP
	dsprite  4,  0, 20, -2, $30, 7 | X_FLIP | Y_FLIP
	db $ff

Pokedex_PutNewModeABCModeCursorOAM: ; 41229 (10:5229)
	ld hl, .CursorOAM
	call Pokedex_LoadCursorOAM
	ret

.CursorOAM: ; 41230
	dsprite  3,  3,  9, -1, $30, 7
	dsprite  2,  3,  9, -1, $31, 7
	dsprite  2,  3, 10, -1, $32, 7
	dsprite  2,  3, 11, -1, $32, 7
	dsprite  2,  3, 12, -1, $33, 7
	dsprite  2,  3, 16,  0, $33, 7 | X_FLIP
	dsprite  2,  3, 17,  0, $32, 7 | X_FLIP
	dsprite  2,  3, 18,  0, $32, 7 | X_FLIP
	dsprite  2,  3, 19,  0, $31, 7 | X_FLIP
	dsprite  3,  3, 19,  0, $30, 7 | X_FLIP
	dsprite  4,  3,  9, -1, $30, 7 | Y_FLIP
	dsprite  5,  3,  9, -1, $31, 7 | Y_FLIP
	dsprite  5,  3, 10, -1, $32, 7 | Y_FLIP
	dsprite  5,  3, 11, -1, $32, 7 | Y_FLIP
	dsprite  5,  3, 12, -1, $33, 7 | Y_FLIP
	dsprite  5,  3, 16,  0, $33, 7 | X_FLIP | Y_FLIP
	dsprite  5,  3, 17,  0, $32, 7 | X_FLIP | Y_FLIP
	dsprite  5,  3, 18,  0, $32, 7 | X_FLIP | Y_FLIP
	dsprite  5,  3, 19,  0, $31, 7 | X_FLIP | Y_FLIP
	dsprite  4,  3, 19,  0, $30, 7 | X_FLIP | Y_FLIP
	db $ff

Pokedex_UpdateSearchResultsCursorOAM: ; 41281 (10:5281)
	ld a, [wCurrentDexMode]
	cp DEXMODE_OLD
	jp z, Pokedex_PutOldModeCursorOAM
	ld hl, .CursorOAM
	call Pokedex_LoadCursorOAM
	ret

.CursorOAM: ; 41290
	dsprite  3,  3,  9, -1, $30, 7
	dsprite  2,  3,  9, -1, $31, 7
	dsprite  2,  3, 10, -1, $32, 7
	dsprite  2,  3, 11, -1, $32, 7
	dsprite  2,  3, 12, -1, $32, 7
	dsprite  2,  3, 13, -1, $33, 7
	dsprite  2,  3, 16, -2, $33, 7 | X_FLIP
	dsprite  2,  3, 17, -2, $32, 7 | X_FLIP
	dsprite  2,  3, 18, -2, $32, 7 | X_FLIP
	dsprite  2,  3, 19, -2, $32, 7 | X_FLIP
	dsprite  2,  3, 20, -2, $31, 7 | X_FLIP
	dsprite  3,  3, 20, -2, $30, 7 | X_FLIP
	dsprite  4,  3,  9, -1, $30, 7 | Y_FLIP
	dsprite  5,  3,  9, -1, $31, 7 | Y_FLIP
	dsprite  5,  3, 10, -1, $32, 7 | Y_FLIP
	dsprite  5,  3, 11, -1, $32, 7 | Y_FLIP
	dsprite  5,  3, 12, -1, $32, 7 | Y_FLIP
	dsprite  5,  3, 13, -1, $33, 7 | Y_FLIP
	dsprite  5,  3, 16, -2, $33, 7 | X_FLIP | Y_FLIP
	dsprite  5,  3, 17, -2, $32, 7 | X_FLIP | Y_FLIP
	dsprite  5,  3, 18, -2, $32, 7 | X_FLIP | Y_FLIP
	dsprite  5,  3, 19, -2, $32, 7 | X_FLIP | Y_FLIP
	dsprite  5,  3, 20, -2, $31, 7 | X_FLIP | Y_FLIP
	dsprite  4,  3, 20, -2, $30, 7 | X_FLIP | Y_FLIP
	db $ff

Pokedex_LoadCursorOAM: ; 412f1 (10:52f1)
	ld de, Sprites
.loop
	ld a, [hl]
	cp $ff
	ret z
	ld a, [wDexListingCursor]
	and $7
	swap a
	add [hl]
	inc hl
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	jr .loop

Pokedex_PutScrollbarOAM: ; 4130e (10:530e)
; Writes the OAM data for the scrollbar in the new mode and ABC mode.
	push de
	ld a, [wDexListingEnd]
	dec a
	ld e, a
	ld a, [wDexListingCursor]
	ld hl, wDexListingScrollOffset
	add [hl]
	cp e
	jr z, .asm_4133f
	ld hl, $0
	ld bc, $79
	call AddNTimes
	ld e, l
	ld d, h
	ld b, $0
	ld a, d
	or e
	jr z, .asm_41341
	ld a, [wDexListingEnd]
	ld c, a
.asm_41333
	ld a, e
	sub c
	ld e, a
	ld a, d
	sbc $0
	ld d, a
	jr c, .asm_41341
	inc b
	jr .asm_41333
.asm_4133f
	ld b, $79
.asm_41341
	ld a, $14
	add b
	pop hl
	ld [hli], a
	ld a, $a1
	ld [hli], a
	ld a, $f
	ld [hli], a
	ld [hl], $0
	ret

Pokedex_InitArrowCursor: ; 4134f (10:534f)
	xor a
	ld [wDexArrowCursorPosIndex], a
	ld [wDexArrowCursorDelayCounter], a
	ld [wDexArrowCursorBlinkCounter], a
	ret

Pokedex_MoveArrowCursor: ; 4135a (10:535a)
; bc = [de] - 1
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	dec a
	ld c, a
	inc de
	call Pokedex_BlinkArrowCursor

	ld hl, hJoyPressed
	ld a, [hl]
	and D_LEFT | D_UP
	and b
	jr nz, .move_left_or_up
	ld a, [hl]
	and D_RIGHT | D_DOWN
	and b
	jr nz, .move_right_or_down
	ld a, [hl]
	and SELECT
	and b
	jr nz, .select
	call Pokedex_ArrowCursorDelay
	jr c, .no_action
	ld hl, hJoyLast
	ld a, [hl]
	and D_LEFT | D_UP
	and b
	jr nz, .move_left_or_up
	ld a, [hl]
	and D_RIGHT | D_DOWN
	and b
	jr nz, .move_right_or_down
	jr .no_action

.move_left_or_up
	ld a, [wDexArrowCursorPosIndex]
	and a
	jr z, .no_action
	call Pokedex_GetArrowCursorPos
	ld [hl], " "
	ld hl, wDexArrowCursorPosIndex
	dec [hl]
	jr .update_cursor_pos

.move_right_or_down
	ld a, [wDexArrowCursorPosIndex]
	cp c
	jr nc, .no_action
	call Pokedex_GetArrowCursorPos
	ld [hl], " "
	ld hl, wDexArrowCursorPosIndex
	inc [hl]

.update_cursor_pos
	call Pokedex_GetArrowCursorPos
	ld [hl], "▶"
	ld a, 12
	ld [wDexArrowCursorDelayCounter], a
	xor a
	ld [wDexArrowCursorBlinkCounter], a
	scf
	ret

.no_action
	and a
	ret

.select
	call Pokedex_GetArrowCursorPos
	ld [hl], " "
	ld a, [wDexArrowCursorPosIndex]
	cp c
	jr c, .update
	ld a, -1
.update
	inc a
	ld [wDexArrowCursorPosIndex], a
	jr .update_cursor_pos

Pokedex_GetArrowCursorPos: ; 413d4 (10:53d4)
	ld a, [wDexArrowCursorPosIndex]
	add a
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

Pokedex_BlinkArrowCursor: ; 413e0 (10:53e0)
	ld hl, wDexArrowCursorBlinkCounter
	ld a, [hl]
	inc [hl]
	and $8
	jr z, .blink_on
	call Pokedex_GetArrowCursorPos
	ld [hl], " "
	ret

.blink_on
	call Pokedex_GetArrowCursorPos
	ld [hl], "▶"
	ret

Pokedex_ArrowCursorDelay: ; 413f5 (10:53f5)
; Updates the delay counter set when moving the arrow cursor.
; Returns whether the delay is active in carry.
	ld hl, wDexArrowCursorDelayCounter
	ld a, [hl]
	and a
	ret z

	dec [hl]
	scf
	ret

Pokedex_FillBox: ; 413fe (10:53fe)
	jp FillBoxWithByte

Pokedex_BlackOutBG: ; 41401 (10:5401)
; Make BG palettes black so that the BG becomes all black.
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, wBGPals1
	ld bc, 8 palettes
	xor a
	call ByteFill
	pop af
	ld [rSVBK], a

Pokedex_ApplyPrintPals: ; 41415
	ld a, $ff
	call DmgToCgbBGPals
	ld a, $ff
	call DmgToCgbObjPal0
	call DelayFrame
	ret

Pokedex_GetSGBLayout: ; 41423
	ld b, a
	call GetSGBLayout

Pokedex_ApplyUsualPals: ; 41427
; This applies the palettes used for most Pokédex screens.
	ld a, $e4
	call DmgToCgbBGPals
	ld a, $e0
	call DmgToCgbObjPal0
	ret


Pokedex_LoadPointer: ; 41432
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

Pokedex_LoadSelectedMonTiles: ; 4143b
; Loads the tiles of the currently selected Pokémon.
	call Pokedex_GetSelectedMon
	call Pokedex_CheckSeen
	jr z, .QuestionMark
	ld a, [wFirstUnownSeen]
	ld [UnownLetter], a
	ld a, [wd265]
	ld [CurPartySpecies], a
	call GetBaseData
	ld de, vTiles2
	predef GetMonFrontpic
	ret

.QuestionMark:
	ld a, BANK(sScratch)
	call GetSRAMBank
	farcall LoadQuestionMarkPic
	ld hl, vTiles2
	ld de, sScratch
	ld c, 7 * 7
	ld a, [hROMBank]
	ld b, a
	call Get2bpp
	call CloseSRAM
	ret


Pokedex_LoadCurrentFootprint: ; 41478 (10:5478)
	call Pokedex_GetSelectedMon

Pokedex_LoadAnyFootprint: ; 4147b
	ld a, [wd265]
	dec a
	and %11111000
	srl a
	srl a
	srl a
	ld e, 0
	ld d, a
	ld a, [wd265]
	dec a
	and %111
	swap a ; * $10
	ld l, a
	ld h, 0
	add hl, de
	ld de, Footprints
	add hl, de

	push hl
	ld e, l
	ld d, h
	ld hl, vTiles2 tile $62
	lb bc, BANK(Footprints), 2
	call Request1bpp
	pop hl

	; Whoever was editing footprints forgot to fix their
	; tile editor. Now each bottom half is 8 tiles off.
	ld de, 8 tiles
	add hl, de

	ld e, l
	ld d, h
	ld hl, vTiles2 tile $64
	lb bc, BANK(Footprints), 2
	call Request1bpp

	ret


Pokedex_LoadGFX: ; 414b7
	call DisableLCD
	ld hl, vTiles2
	ld bc, $31 tiles
	xor a
	call ByteFill
	call Pokedex_LoadInvertedFont
	call LoadFontsExtra
	ld hl, vTiles2 tile $60
	ld bc, $20 tiles
	call Pokedex_InvertTiles
	call Pokedex_CheckSGB
	jr nz, .LoadPokedexLZ
	farcall LoadSGBPokedexGFX
	jr .LoadPokedexSlowpokeLZ

.LoadPokedexLZ:
	ld hl, PokedexLZ
	ld de, vTiles2 tile $31
	call Decompress

.LoadPokedexSlowpokeLZ:
	ld hl, PokedexSlowpokeLZ
	ld de, vTiles0
	call Decompress
	ld a, 6
	call SkipMusic
	call EnableLCD
	ret

Pokedex_LoadInvertedFont: ; 414fb
	call LoadStandardFont
	ld hl, vTiles1
	ld bc, $80 tiles

Pokedex_InvertTiles: ; 41504
.loop
	ld a, [hl]
	xor $ff
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret

PokedexLZ: ; 4150e
INCBIN "gfx/pokedex/pokedex.2bpp.lz"

PokedexSlowpokeLZ: ; 416b0
INCBIN "gfx/pokedex/slowpoke.2bpp.lz"

Pokedex_CheckSGB: ; 41a24
	ld a, [hCGB]
	or a
	ret nz
	ld a, [hSGB]
	dec a
	ret

Pokedex_LoadUnownFont: ; 41a2c
	ld a, BANK(sScratch)
	call GetSRAMBank
	ld hl, UnownFont
	ld de, sScratch + $188
	ld bc, 39 tiles
	ld a, BANK(UnownFont)
	call FarCopyBytes
	ld hl, sScratch + $188
	ld bc, 27 tiles
	call Pokedex_InvertTiles
	ld de, sScratch + $188
	ld hl, vTiles2 tile $40
	lb bc, BANK(Pokedex_LoadUnownFont), 27
	call Request2bpp
	call CloseSRAM
	ret

Pokedex_LoadUnownFrontpicTiles: ; 41a58 (10:5a58)
	ld a, [UnownLetter]
	push af
	ld a, [wDexCurrentUnownIndex]
	ld e, a
	ld d, 0
	ld hl, UnownDex
	add hl, de
	ld a, [hl]
	ld [UnownLetter], a
	ld a, UNOWN
	ld [CurPartySpecies], a
	call GetBaseData
	ld de, vTiles2 tile $00
	predef GetMonFrontpic
	pop af
	ld [UnownLetter], a
	ret

_NewPokedexEntry: ; 41a7f
	xor a
	ld [hBGMapMode], a
	farcall DrawDexEntryScreenRightEdge
	call Pokedex_ResetBGMapMode
	call DisableLCD
	call LoadStandardFont
	call LoadFontsExtra
	call Pokedex_LoadGFX
	call Pokedex_LoadAnyFootprint
	ld a, [wd265]
	ld [CurPartySpecies], a
	call Pokedex_DrawDexEntryScreenBG
	call Pokedex_DrawFootprint
	hlcoord 0, 17
	ld [hl], $3b
	inc hl
	ld bc, 19
	ld a, " "
	call ByteFill
	farcall DisplayDexEntry
	call EnableLCD
	call WaitBGMap
	call GetBaseData
	ld de, vTiles2
	predef GetMonFrontpic
	ld a, SCGB_POKEDEX
	call Pokedex_GetSGBLayout
	ld a, [CurPartySpecies]
	call PlayCry
	ret


Pokedex_SetBGMapMode3: ; 41ad7 (10:5ad7)
	ld a, $3
	ld [hBGMapMode], a
	ld c, 4
	call DelayFrames
	ret

Pokedex_SetBGMapMode4: ; 41ae1 (10:5ae1)
	ld a, $4
	ld [hBGMapMode], a
	ld c, 4
	call DelayFrames
	ret

Pokedex_SetBGMapMode_3ifDMG_4ifCGB: ; 41aeb (10:5aeb)
	ld a, [hCGB]
	and a
	jr z, .DMG
	call Pokedex_SetBGMapMode4
.DMG:
	call Pokedex_SetBGMapMode3
	ret


Pokedex_ResetBGMapMode: ; 41af7
	xor a
	ld [hBGMapMode], a
	ret
