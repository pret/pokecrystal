	; _DebugRoom.MenuItems indexes
	const_def
	const DEBUGROOMMENU_PAGE_1 ; 0
	const DEBUGROOMMENU_PAGE_2 ; 1
	const DEBUGROOMMENU_PAGE_3 ; 2
DEF DEBUGROOMMENU_NUM_PAGES EQU const_value

	; _DebugRoom.Strings and _DebugRoom.Jumptable indexes
	const_def
	const DEBUGROOMMENUITEM_SP_CLEAR     ; 00
	const DEBUGROOMMENUITEM_WIN_WORK_CLR ; 01
	const DEBUGROOMMENUITEM_POKEMON_GET  ; 02
	const DEBUGROOMMENUITEM_POKEDEX_COMP ; 03
	const DEBUGROOMMENUITEM_TIMER_RESET  ; 04
	const DEBUGROOMMENUITEM_DECORATE_ALL ; 05
	const DEBUGROOMMENUITEM_ITEM_GET     ; 06
	const DEBUGROOMMENUITEM_RTC_EDIT     ; 07
	const DEBUGROOMMENUITEM_NEXT         ; 08
	const DEBUGROOMMENUITEM_GB_ID_SET    ; 09
	const DEBUGROOMMENUITEM_BTL_REC_CLR  ; 0a
	const DEBUGROOMMENUITEM_POKEDEX_CLR  ; 0b
	const DEBUGROOMMENUITEM_HALT_CHK_CLR ; 0c
	const DEBUGROOMMENUITEM_BATTLE_SKIP  ; 0d
	const DEBUGROOMMENUITEM_HOF_CLEAR    ; 0e
	const DEBUGROOMMENUITEM_ROM_CHECKSUM ; 0f
	const DEBUGROOMMENUITEM_TEL_DEBUG    ; 10
	const DEBUGROOMMENUITEM_SUM_RECALC   ; 11
	const DEBUGROOMMENUITEM_RAM_FLAG_CLR ; 12
	const DEBUGROOMMENUITEM_CHANGE_SEX   ; 13
	const DEBUGROOMMENUITEM_BT_BUG_POKE  ; 14

_DebugRoom:
	ldh a, [hJoyDown]
	and SELECT | START
	cp SELECT | START
	ret nz
	ldh a, [hDebugRoomMenuPage]
	push af
	xor a
	ldh [hDebugRoomMenuPage], a
.loop
	ld hl, wTilemap
	ld bc, wTilemapEnd - wTilemap
	ld a, " "
	call ByteFill
	call DebugRoom_PrintStackBottomTop
	call DebugRoom_PrintWindowStackBottomTop
	call DebugRoom_PrintRTCHaltChk
	call DebugRoom_PrintBattleSkip
	call DebugRoom_PrintTelDebug
	call DebugRoom_PrintRAMFlag
	call DebugRoom_PrintGender
	ldh a, [hDebugRoomMenuPage]
	ld [wWhichIndexSet], a
	ld hl, .MenuHeader
	call LoadMenuHeader
	call SetUpMenu
.wait
	call GetScrollingMenuJoypad
	ld a, [wMenuJoypad]
	and A_BUTTON | B_BUTTON
	jr z, .wait
	call CloseWindow
	cp B_BUTTON
	jr z, .done
	ld a, [wMenuSelection]
	ld hl, .Jumptable
	rst JumpTable
	jr .loop
.done
	pop af
	ldh [hDebugRoomMenuPage], a
	ret

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, SCREEN_HEIGHT - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 0 ; items
	dw .MenuItems
	dw PlaceMenuStrings
	dw .Strings

.Strings:
; entries correspond to DEBUGROOMMENUITEM_* constants
	db "SP CLEAR@"
	db "WIN WORK CLR@"
	db "#MON GET!@"
	db "#DEX COMP@"
	db "TIMER RESET@"
	db "DECORATE ALL@"
	db "ITEM GET!@"
	db "RTC EDIT@"
	db "NEXT@"
	db "GB ID SET@"
	db "BTL REC CLR@"
	db "#DEX CLR@"
	db "HALT CHK CLR@"
	db "BATTLE SKIP@"
	db "HOF CLEAR@"
	db "ROM CHECKSUM@"
	db "TEL DEBUG@"
	db "SUM RECALC@"
	db "RAM FLAG CLR@"
	db "CHANGE SEX@"
	db "BT BUG POKE@"

.Jumptable:
; entries correspond to DEBUGROOMMENUITEM_* constants
	dw DebugRoomMenu_SpClear
	dw DebugRoomMenu_WinWorkClr
	dw DebugRoomMenu_PokemonGet
	dw DebugRoomMenu_PokedexComp
	dw DebugRoomMenu_TimerReset
	dw DebugRoomMenu_DecorateAll
	dw DebugRoomMenu_ItemGet
	dw DebugRoomMenu_RTCEdit
	dw DebugRoomMenu_Next
	dw DebugRoomMenu_GBIDSet
	dw DebugRoomMenu_BtlRecClr
	dw DebugRoomMenu_PokedexClr
	dw DebugRoomMenu_HaltChkClr
	dw DebugRoomMenu_BattleSkip
	dw DebugRoomMenu_HOFClear
	dw DebugRoomMenu_ROMChecksum
	dw DebugRoomMenu_TelDebug
	dw DebugRoomMenu_SumRecalc
	dw DebugRoomMenu_RAMFlagClr
	dw DebugRoomMenu_ChangeSex
	dw DebugRoomMenu_BTBugPoke

.MenuItems:
; entries correspond to DEBUGROOMMENU_* constants

	; DEBUGROOMMENU_PAGE_1
	db 8
	db DEBUGROOMMENUITEM_SP_CLEAR
	db DEBUGROOMMENUITEM_BATTLE_SKIP
	db DEBUGROOMMENUITEM_RTC_EDIT
	db DEBUGROOMMENUITEM_TIMER_RESET
	db DEBUGROOMMENUITEM_HALT_CHK_CLR
	db DEBUGROOMMENUITEM_GB_ID_SET
	db DEBUGROOMMENUITEM_BTL_REC_CLR
	db DEBUGROOMMENUITEM_NEXT
	db -1

	; DEBUGROOMMENU_PAGE_2
	db 8
	db DEBUGROOMMENUITEM_POKEMON_GET
	db DEBUGROOMMENUITEM_ITEM_GET
	db DEBUGROOMMENUITEM_POKEDEX_COMP
	db DEBUGROOMMENUITEM_POKEDEX_CLR
	db DEBUGROOMMENUITEM_DECORATE_ALL
	db DEBUGROOMMENUITEM_HOF_CLEAR
	db DEBUGROOMMENUITEM_ROM_CHECKSUM
	db DEBUGROOMMENUITEM_NEXT
	db -1

	; DEBUGROOMMENU_PAGE_3
	db 6
	db DEBUGROOMMENUITEM_TEL_DEBUG
	db DEBUGROOMMENUITEM_SUM_RECALC
	db DEBUGROOMMENUITEM_RAM_FLAG_CLR
	db DEBUGROOMMENUITEM_CHANGE_SEX
	db DEBUGROOMMENUITEM_BT_BUG_POKE
	db DEBUGROOMMENUITEM_NEXT
	db -1

DebugRoomMenu_Next:
	ldh a, [hDebugRoomMenuPage]
	inc a
	cp DEBUGROOMMENU_NUM_PAGES
	jr c, .got_page
	xor a ; DEBUGROOMMENU_PAGE_1
.got_page
	ldh [hDebugRoomMenuPage], a
	ret

DebugRoom_SaveChecksum:
	ld a, BANK(sGameData)
	call OpenSRAM
	ld bc, sGameDataEnd - sGameData
	ld de, 0
	ld hl, sGameData
.loop
	ld a, [hli]
	add e
	ld e, a
	ld a, d
	adc 0
	ld d, a
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ld a, e
	ld [sChecksum + 0], a
	ld a, d
	ld [sChecksum + 1], a
	call CloseSRAM
	ret

DebugRoomMenu_SpClear:
	call YesNoBox
	ret c
	ld a, BANK(sStackTop)
	call OpenSRAM
	xor a
	ld hl, sStackTop
	ld [hli], a
	ld [hl], a
	call CloseSRAM
	call DebugRoom_PrintStackBottomTop
	ret

DebugRoom_PrintStackBottomTop:
	ld a, BANK(sStackTop)
	call OpenSRAM
	hlcoord 16, 14
	ld de, sStackTop + 1
	ld c, 1
	call PrintHexNumber
	ld de, sStackTop + 0
	ld c, 1
	call PrintHexNumber
	call CloseSRAM
	hlcoord 16, 12
	ld de, .SPString
	call PlaceString
	ld d, LOW(wStackBottom)
	ld e, HIGH(wStackBottom)
	push de
	ld hl, sp+0
	ld d, h
	ld e, l
	hlcoord 16, 13
	ld c, 2
	call PrintHexNumber
	pop de
	ret

.SPString:
	db "SP:@"

DebugRoomMenu_WinWorkClr:
	call YesNoBox
	ret c
	ld a, [wWindowStackPointer]
	ld l, a
	ld a, [wWindowStackPointer + 1]
	ld h, a
	inc hl
	ld a, l
	sub LOW(wWindowStack)
	ld a, h
	sbc HIGH(wWindowStack)
	ret c
	ld a, $00
	call OpenSRAM
	ld bc, -wWindowStack + $10000
	add hl, bc
	ld b, h
	ld c, l
	ld hl, wWindowStack
	xor a
	call ByteFill
	call CloseSRAM
	ret

DebugRoom_PrintWindowStackBottomTop:
	ret ; stubbed out

	ld a, $00
	call OpenSRAM
	ld hl, wWindowStack
.loop
	ld a, h
	cp $c0
	jr z, .ok
	ld a, [hl]
	or a
	jr nz, .ok
	inc hl
	jr .loop
.ok
	call CloseSRAM
	ld a, h
	ld h, l
	ld l, a
	push hl
	ld hl, sp+0
	ld d, h
	ld e, l
	hlcoord 16, 17
	ld c, 2
	call PrintHexNumber
	pop hl
	ld d, LOW(wWindowStack)
	ld e, HIGH(wWindowStack)
	push de
	ld hl, sp+0
	ld d, h
	ld e, l
	hlcoord 16, 16
	ld c, 2
	call PrintHexNumber
	pop de
	hlcoord 16, 15
	ld de, .WSPString
	call PlaceString
	ret

.WSPString:
	db "WSP:@"

DebugRoomMenu_PokedexComp:
	call YesNoBox
	ret c
	ld a, BANK(sGameData) ; aka BANK(sPlayerData)
	call OpenSRAM
	ld hl, sPlayerData + (wPokedexCaught - wPlayerData)
	ld b, wEndPokedexSeen - wPokedexCaught
	ld a, %11111111
.loop1
	ld [hli], a
	dec b
	jr nz, .loop1
	ld a, (1 << (NUM_POKEMON % 8)) - 1 ; %00000111
	ld [sPlayerData + (wEndPokedexCaught - 1 - wPlayerData)], a
	ld [sPlayerData + (wEndPokedexSeen - 1 - wPlayerData)], a
	ld hl, sPlayerData + (wStatusFlags - wPlayerData)
	set STATUSFLAGS_UNOWN_DEX_F, [hl]
	ld a, UNOWN_A
	ld [sGameData + (wFirstUnownSeen - wGameData)], a
	ld hl, sGameData + (wUnownDex - wGameData)
	ld b, NUM_UNOWN
.loop2
	ld [hli], a
	inc a
	dec b
	jr nz, .loop2
	call CloseSRAM
	call DebugRoom_SaveChecksum
	ret

DebugRoomMenu_PokedexClr:
	call YesNoBox
	ret c
	ld a, BANK(sPlayerData)
	call OpenSRAM
	ld hl, sPlayerData + (wStatusFlags - wPlayerData)
	res STATUSFLAGS_UNOWN_DEX_F, [hl]
	ld hl, sPlayerData + (wPokedexCaught - wPlayerData)
	ld bc, wEndPokedexSeen - wPokedexCaught
	xor a
	call ByteFill
	ld hl, sGameData + (wUnownDex - wGameData)
	ld bc, NUM_UNOWN
	xor a
	call ByteFill
	call CloseSRAM
	call DebugRoom_SaveChecksum
	ret

DebugRoomMenu_TimerReset:
	call YesNoBox
	ret c
	ld a, BANK(sRTCStatusFlags)
	call OpenSRAM
	ld hl, sRTCStatusFlags
	set 7, [hl]
	call CloseSRAM
	ret

DebugRoomMenu_BattleSkip:
	ld a, BANK(sSkipBattle)
	call OpenSRAM
	ld a, [sSkipBattle]
	inc a
	and 1
	ld [sSkipBattle], a
	call CloseSRAM
	ret

DebugRoom_PrintBattleSkip:
	hlcoord 16, 6
	ld de, .BTLString
	call PlaceString
	ld a, BANK(sSkipBattle)
	call OpenSRAM
	ld a, [sSkipBattle]
	call CloseSRAM
	hlcoord 16, 7
	ld de, .DoString
	or a
	jr z, .ok
	ld de, .SkipString
.ok
	call PlaceString
	ret

.BTLString:
	db "BTL:@"
.DoString:
	db "  DO@"
.SkipString:
	db "SKIP@"

DebugRoomMenu_ChangeSex:
	ld a, BANK(sCrystalData)
	call OpenSRAM
	ld a, [sCrystalData + (wPlayerGender - wCrystalData)]
	inc a
	and 1
	ld [sCrystalData + (wPlayerGender - wCrystalData)], a
	call CloseSRAM
	ret

DebugRoom_PrintGender:
	hlcoord 16, 0
	ld de, .SexString
	call PlaceString
	ld a, BANK(sCrystalData)
	call OpenSRAM
	ld a, [sCrystalData + (wPlayerGender - wCrystalData)]
	call CloseSRAM
	or a
	ld a, "♂"
	jr z, .ok
	ld a, "♀"
.ok
	hlcoord 19, 1
	ld [hl], a
	ret

.SexString:
	db "SEX:@"

DebugRoomMenu_TelDebug:
	ld a, BANK(sDebugTimeCyclesSinceLastCall)
	call OpenSRAM
	ld a, [sDebugTimeCyclesSinceLastCall]
	inc a
	cp 3
	jr c, .ok
	xor a
.ok
	ld [sDebugTimeCyclesSinceLastCall], a
	call CloseSRAM
	ret

DebugRoom_PrintTelDebug:
	hlcoord 16, 16
	ld de, .TelString
	call PlaceString
	ld a, BANK(sDebugTimeCyclesSinceLastCall)
	call OpenSRAM
	ld a, [sDebugTimeCyclesSinceLastCall]
	call CloseSRAM
	hlcoord 16, 17
	ld de, .BusyString
	dec a
	jr z, .ok
	ld de, .HardString
	dec a
	jr z, .ok
	ld de, .OffString
.ok
	call PlaceString
	ret

.TelString:
	db "TEL:@"
.OffString:
	db " OFF@"
.BusyString:
	db "BUSY@"
.HardString:
	db "HARD@"

DebugRoomMenu_RAMFlagClr:
	call YesNoBox
	ret c
	ld a, BANK(sOpenedInvalidSRAM)
	call OpenSRAM
	xor a
	ld [sOpenedInvalidSRAM], a
	call CloseSRAM
	ret

DebugRoom_PrintRAMFlag:
	ld a, BANK(sOpenedInvalidSRAM)
	call OpenSRAM
	ld de, sOpenedInvalidSRAM
	hlcoord 18, 4
	ld c, 1
	call PrintHexNumber
	call CloseSRAM
	hlcoord 16, 3
	ld de, .RamString
	call PlaceString
	ret

.RamString:
	db "RAM:@"

DebugRoomMenu_SumRecalc:
	call YesNoBox
	ret c
	call DebugRoom_SaveChecksum
	ret

DebugRoomMenu_DecorateAll:
	call YesNoBox
	ret c
	ld a, BANK(sPlayerData)
	call OpenSRAM
	ld hl, sPlayerData + (wEventFlags - wPlayerData)
	ld de, EVENT_DECO_BED_1 ; the first EVENT_DECO_* constant
	ld b, SET_FLAG
	ld c, EVENT_DECO_BIG_LAPRAS_DOLL - EVENT_DECO_BED_1 + 1
.loop
	push bc
	push de
	push hl
	call FlagAction
	pop hl
	pop de
	pop bc
	inc de
	dec c
	jr nz, .loop
	call CloseSRAM
	call DebugRoom_SaveChecksum
	ret

MACRO paged_value
	dw \1 ; value address
	db \2 ; min value
	db \3 ; max value
	db \4 ; initial value
	dw \5 ; label string
	dw \6 ; value name function
	db \7 ; is hex value?
ENDM

DEF PAGED_VALUE_SIZE EQU 10

DebugRoom_EditPagedValues:
	xor a
	ld [wDebugRoomCurPage], a
	ld [wDebugRoomCurValue], a
	ld a, [hli]
	ld [wDebugRoomAFunction], a
	ld a, [hli]
	ld [wDebugRoomAFunction+1], a
	ld a, [hli]
	ld [wDebugRoomSelectFunction], a
	ld a, [hli]
	ld [wDebugRoomSelectFunction+1], a
	ld a, [hli]
	ld [wDebugRoomStartFunction], a
	ld a, [hli]
	ld [wDebugRoomStartFunction+1], a
	ld a, [hli]
	ld [wDebugRoomAutoFunction], a
	ld a, [hli]
	ld [wDebugRoomAutoFunction+1], a
	ld a, [hli]
	ld [wDebugRoomPageCount], a
	ld a, l
	ld [wDebugRoomPagesPointer], a
	ld a, h
	ld [wDebugRoomPagesPointer+1], a
	ld hl, hInMenu
	ld a, [hl]
	push af
	ld [hl], TRUE
	call ClearBGPalettes
	hlcoord 0, 0
	ld b, SCREEN_HEIGHT - 2
	ld c, SCREEN_WIDTH - 2
	call Textbox
	hlcoord 8, 17
	ld de, DebugRoom_PageString
	call PlaceString
	call DebugRoom_InitializePagedValues
	xor a
	call DebugRoom_PrintPage
	ld a, "▶"
	call DebugRoom_ShowHideCursor
	xor a
	ldh [hJoyLast], a
	xor a
	ld [wDebugRoomCurPage], a
	inc a
	ldh [hBGMapMode], a
	call WaitBGMap
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call SetPalettes
.resume
	call DelayFrame
	call JoyTextDelay
	ldh a, [hJoyLast]
	bit 1, a
	jr nz, .done
	ld hl, .continue
	push hl
	rra ; A_BUTTON_F?
	jr c, DebugRoom_PagedValuePressedA
	rra ; skip B_BUTTON_F
	rra ; SELECT_F?
	jr c, DebugRoom_PagedValuePressedSelect
	rra ; START_F?
	jr c, DebugRoom_PagedValuePressedStart
	rra ; D_RIGHT_F?
	jp c, DebugRoom_IncrementPagedValue
	rra ; D_LEFT_F?
	jp c, DebugRoom_DecrementPagedValue
	rra ; D_UP_F?
	jp c, DebugRoom_PrevPagedValue
	rra ; D_DOWN_F?
	jp c, DebugRoom_NextPagedValue
	pop hl
.continue
; call wDebugRoomAutoFunction if it's not null, then jump to .resume
	ld hl, .resume
	push hl
	ld a, [wDebugRoomAutoFunction]
	ld l, a
	ld a, [wDebugRoomAutoFunction+1]
	ld h, a
	or l
	ret z
	jp hl

.done
	pop af
	ldh [hInMenu], a
	scf
	ret

DebugRoom_PagedValuePressedA:
	ld hl, wDebugRoomAFunction
	jr _CallNonNullPointer

DebugRoom_PagedValuePressedSelect:
	ld hl, wDebugRoomSelectFunction
	jr _CallNonNullPointer

DebugRoom_PagedValuePressedStart:
	ld hl, wDebugRoomStartFunction
	; fallthrough

_CallNonNullPointer:
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	ret z
	jp hl

DebugRoom_PageString:
	db " P  @"

DebugRoom_IncrementPagedValue:
	call DebugRoom_GetCurPagedValuePointer
	ld e, [hl] ; de = value address
	inc hl
	ld d, [hl]
	inc hl
	inc hl
	ld a, [de] ; a = max value
	cp [hl]
	ret z
	inc a
	ld [de], a
	call DebugRoom_PrintPageBValueC
	ret

DebugRoom_DecrementPagedValue:
	call DebugRoom_GetCurPagedValuePointer
	ld e, [hl] ; de = value address
	inc hl
	ld d, [hl]
	inc hl
	ld a, [de] ; a = min value
	cp [hl]
	ret z
	dec a
	ld [de], a
	call DebugRoom_PrintPageBValueC
	ret

DebugRoom_NextPage:
	ld a, [wDebugRoomPageCount]
	ld c, a
	ld a, [wDebugRoomCurPage]
	inc a
	cp c
	jr c, .ok
	xor a
.ok
	ld [wDebugRoomCurPage], a
	call DebugRoom_PrintPage
	ld a, [wDebugRoomCurPage]
	call DebugRoom_GetNthPagePointer
	ld a, [wDebugRoomCurValue]
	cp [hl]
	jr c, .skip
	ld a, [hl]
	dec a
	ld [wDebugRoomCurValue], a
.skip
	ld a, "▶"
	call DebugRoom_ShowHideCursor
	ret

DebugRoom_PrevPage:
	ld a, [wDebugRoomCurPage]
	or a
	jr nz, .ok
	ld a, [wDebugRoomPageCount]
.ok
	dec a
	ld [wDebugRoomCurPage], a
	call DebugRoom_PrintPage
	ld a, [wDebugRoomCurPage]
	call DebugRoom_GetNthPagePointer
	ld a, [wDebugRoomCurValue]
	cp [hl]
	jr c, .skip
	ld a, [hl]
	dec a
	ld [wDebugRoomCurValue], a
.skip
	ld a, "▶"
	call DebugRoom_ShowHideCursor
	ret

DebugRoom_NextPagedValue:
	ld a, " "
	call DebugRoom_ShowHideCursor
	ld a, [wDebugRoomCurPage]
	call DebugRoom_GetNthPagePointer
	ld a, [wDebugRoomCurValue]
	inc a
	cp [hl] ; incremented value < paged_value count?
	jr c, DebugRoom_UpdateValueCursor
	xor a
	ld [wDebugRoomCurValue], a
	jr DebugRoom_NextPage

DebugRoom_UpdateValueCursor:
	ld [wDebugRoomCurValue], a
	ld a, "▶"
	call DebugRoom_ShowHideCursor
	ret

DebugRoom_PrevPagedValue:
	ld a, " "
	call DebugRoom_ShowHideCursor
	ld a, [wDebugRoomCurValue]
	or a ; pre-decremented value > 0?
	jr nz, .decrement
	ld a, -1
	ld [wDebugRoomCurValue], a
	jr DebugRoom_PrevPage

.decrement:
	dec a
	jr DebugRoom_UpdateValueCursor

DebugRoom_GetNthPagePointer:
; Input: a = page index
; Output: hl = pointer to paged_data list
	ld h, 0
	ld l, a
	add hl, hl
	ld a, [wDebugRoomPagesPointer]
	ld e, a
	ld a, [wDebugRoomPagesPointer+1]
	ld d, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

_DebugRoom_GetPageBValueCPointer:
	push bc
	ld a, b
	call DebugRoom_GetNthPagePointer
	pop bc
	inc hl
	ld a, c
	ld bc, PAGED_VALUE_SIZE
	call AddNTimes
	ret

DebugRoom_GetCurPagedValuePointer:
	ld a, [wDebugRoomCurPage]
	ld b, a
	ld a, [wDebugRoomCurValue]
	ld c, a
	jr _DebugRoom_GetPageBValueCPointer

DebugRoom_ShowHideCursor:
	push af
	hlcoord 1, 1
	ld bc, SCREEN_WIDTH * 2
	ld a, [wDebugRoomCurValue]
	call AddNTimes
	pop af
	ld [hl], a
	ret

DebugRoom_InitializePagedValues:
; Load the initial values for all pages of the current paged value header
	ld a, [wDebugRoomPageCount]
.page_loop
	dec a
	push af
	call .InitializePage
	pop af
	jr nz, .page_loop
	ret

.InitializePage:
; Load the initial values for page a
	ld b, a
	ld h, 0
	ld l, a
	add hl, hl
	ld a, [wDebugRoomPagesPointer]
	ld e, a
	ld a, [wDebugRoomPagesPointer+1]
	ld d, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld c, [hl] ; c = paged_value count
.value_loop
	push bc
	dec c
	call .InitializeValue
	pop bc
	dec c
	jr nz, .value_loop
	ret

.InitializeValue:
; Load the initial value for page b, value c
	ld h, 0
	ld l, b
	add hl, hl
	ld a, [wDebugRoomPagesPointer]
	ld e, a
	ld a, [wDebugRoomPagesPointer+1]
	ld d, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl ; skip the paged_value count
	ld a, c
	push bc
	ld bc, PAGED_VALUE_SIZE
	call AddNTimes
	pop bc
	ld e, [hl] ; de = value address
	inc hl
	ld d, [hl]
	inc hl
	inc hl
	inc hl
	ld a, [hl] ; a = initial value
	ld [de], a
	ret

DebugRoom_PrintPage:
	push af
	hlcoord 10, 17
	add "1"
	ld [hl], a
	hlcoord 1, 1
	lb bc, SCREEN_HEIGHT - 2, SCREEN_WIDTH - 2
	call ClearBox
	pop af
	ld b, a
	ld h, 0
	ld l, a
	add hl, hl
	ld a, [wDebugRoomPagesPointer]
	ld e, a
	ld a, [wDebugRoomPagesPointer+1]
	ld d, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld c, [hl] ; c = paged_value count
.loop
	push bc
	dec c
	call DebugRoom_PrintPagedValue
	pop bc
	dec c
	jr nz, .loop
	ret

DebugRoom_PrintPageBValueC:
	ld a, [wDebugRoomCurPage]
	ld b, a
	ld a, [wDebugRoomCurValue]
	ld c, a
	jr DebugRoom_PrintPagedValue

DebugRoom_PrintPagedValue:
; Print the value for page b, value c
	ld h, 0
	ld l, b
	add hl, hl
	ld a, [wDebugRoomPagesPointer]
	ld e, a
	ld a, [wDebugRoomPagesPointer+1]
	ld d, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl ; skip the paged_value count
	ld a, c
	push bc
	ld bc, PAGED_VALUE_SIZE
	call AddNTimes
	pop bc
	ld e, [hl] ; de = value address
	inc hl
	ld d, [hl]
	inc hl
	push de
	inc hl
	inc hl
	inc hl
	ld e, [hl] ; de = label string
	inc hl
	ld d, [hl]
	inc hl
	push hl
	hlcoord 2, 1
	ld a, c
	ld bc, SCREEN_WIDTH * 2
	call AddNTimes
	push hl
	call PlaceString
	pop hl
	ld bc, SCREEN_WIDTH - 7
	add hl, bc
	pop bc ; pushed hl
	pop de
	push de
	push bc
	inc bc
	inc bc
	ld a, [bc] ; a = is hex value?
	or a
	jr nz, .hex
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	jr .printed
.hex
	ld c, 1
	call PrintHexNumber
	ld [hl], "H"
	inc hl
.printed
	ld bc, 6
	add hl, bc
	ld b, h
	ld c, l
	pop hl
	pop de
	ld a, [hli] ; hl = value name function
	ld h, [hl]
	ld l, a
	or h
	ret z
	ld a, [de]
	jp hl

DebugRoom_JoyWaitABSelect:
.loop
	call GetJoypad
	ldh a, [hJoyPressed]
	and A_BUTTON | B_BUTTON | SELECT
	jr z, .loop
	ret

DebugRoomMenu_ItemGet:
	ld hl, .PagedValuesHeader
	call DebugRoom_EditPagedValues
	ret

.PagedValuesHeader:
	dw NULL ; A function
	dw NULL ; Select function
	dw DebugRoom_SaveItem ; Start function
	dw NULL ; Auto function
	db 1 ; # pages
	dw DebugRoomMenu_ItemGet_Page1Values

DebugRoom_SaveItem:
	call YesNoBox
	ret c
	ld a, BANK(sPlayerData)
	call OpenSRAM
	ld hl, sPlayerData + (wPCItems - wPlayerData)
	ld a, [wDebugRoomItemID]
	ld c, a
.loop1
	ld a, [hl]
	cp c
	jr z, .found
	cp -1
	jr z, .not_found
	inc hl
	inc hl
	jr .loop1

.found
	inc hl
	ld a, [wDebugRoomItemQuantity]
	add [hl]
	cp MAX_ITEM_STACK + 1
	jr c, .max
	ld a, MAX_ITEM_STACK
.max
	ld [hl], a
	ld hl, .ItemNumberAddedText
	jr .done

.not_found
	ld a, [sPlayerData + (wNumPCItems - wPlayerData)]
	cp MAX_PC_ITEMS
	jr nc, .full
	inc a
	ld [sPlayerData + (wNumPCItems - wPlayerData)], a
	ld a, [wDebugRoomItemID]
	ld [hli], a
	ld a, [wDebugRoomItemQuantity]
	ld [hli], a
	ld [hl], -1 ; terminator
	ld hl, .CreatedNewItemText
	jr .done

.full
	ld hl, .StockFullText
.done
	call CloseSRAM
	call MenuTextbox
	call DebugRoom_JoyWaitABSelect
	call CloseWindow
	call DebugRoom_SaveChecksum
	ret

.ItemNumberAddedText:
	text "Item number added!"
	done

.CreatedNewItemText:
	text "Created new item!"
	done

.StockFullText:
	text "Stock full!!"
	done

DebugRoom_PrintItemName:
	ld [wNamedObjectIndex], a
	push bc
	call GetItemName
	pop hl
	push hl
	lb bc, 1, 12
	call ClearBox
	pop hl
	ld de, wStringBuffer1
	call PlaceString
	ret

DebugRoomMenu_ItemGet_Page1Values:
	db 2
	paged_value wDebugRoomItemID,       1, NUM_POKEMON, MASTER_BALL, .ItemNameString, DebugRoom_PrintItemName, FALSE
	paged_value wDebugRoomItemQuantity, 1, 99,          1,           .NumberString,   NULL,                    FALSE

.ItemNameString: db "ITEM NAME@"
.NumberString:   db "NUMBER@"

DebugRoomMenu_PokemonGet:
	ld hl, .PagedValuesHeader
	call DebugRoom_EditPagedValues
	ret

.PagedValuesHeader:
	dw NULL ; A function
	dw NULL ; Select function
	dw DebugRoom_SavePokemon ; Start function
	dw NULL ; Auto function
	db 4 ; # pages
	dw DebugRoomMenu_PokemonGet_Page1Values
	dw DebugRoomMenu_PokemonGet_Page2Values
	dw DebugRoomMenu_PokemonGet_Page3Values
	dw DebugRoomMenu_PokemonGet_Page4Values

DebugRoom_SavePokemon:
	call YesNoBox
	ret c
	call DebugRoom_UpdateExpForLevel
	ld a, [wDebugRoomMonBox]
	dec a
	ld b, a
	add a
	add b
	ld h, 0
	ld l, a
	ld de, DebugRoom_BoxAddresses
	add hl, de
	ld a, [hli]
	call OpenSRAM
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	cp MONS_PER_BOX
	jr nc, .full
	; update count and species list
	push hl
	inc [hl]
	inc hl
	ld d, 0
	ld e, a
	add hl, de
	ld a, [wDebugRoomMonSpecies]
	ld [hli], a
	ld [hl], -1
	pop hl
	; skip count and species list
	ld bc, 2 + MONS_PER_BOX
	add hl, bc
	; update Nth box mon
	push de
	push hl
	ld a, e
	ld bc, BOXMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, wDebugRoomMon
	ld bc, BOXMON_STRUCT_LENGTH
	call CopyBytes
	pop hl
	pop de
	; skip box mons
	ld bc, BOXMON_STRUCT_LENGTH * MONS_PER_BOX
	add hl, bc
	; update Nth OT name
	push de
	push hl
	ld a, e
	ld bc, NAME_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, .OTString
	ld bc, NAME_LENGTH
	call CopyBytes
	pop hl
	pop de
	; skip OT names
	ld bc, NAME_LENGTH * MONS_PER_BOX
	add hl, bc
	; update Nth nickname
	push de
	push hl
	ld a, e
	ld bc, MON_NAME_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, .NicknameString
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	pop hl
	pop de
	call CloseSRAM
	ld hl, .CompletedText
	call MenuTextbox
	call DebugRoom_JoyWaitABSelect
	call CloseWindow
	ret

.full
	call CloseSRAM
	ld hl, .BoxIsFullText
	call MenuTextbox
	call DebugRoom_JoyWaitABSelect
	call CloseWindow
	ret

.OTString:
	db "DEBUG▶OT@"

.NicknameString:
	db "DEBUG▶<PK><MN>@"

.CompletedText:
	text "COMPLETED!"
	done

.BoxIsFullText:
	text "BOX IS FULL!"
	done

DebugRoom_PrintPokemonName:
	ld [wNamedObjectIndex], a
	push bc
	call GetPokemonName
	jr _DebugRoom_FinishGetName

DebugRoom_PrintItemName2:
	ld [wNamedObjectIndex], a
	push bc
	call GetItemName
	jr _DebugRoom_FinishGetName

DebugRoom_PrintMoveName:
	ld [wNamedObjectIndex], a
	push bc
	call GetMoveName
	jr _DebugRoom_FinishGetName

_DebugRoom_FinishGetName:
	pop hl
	push hl
	lb bc, 1, 12
	call ClearBox
	pop hl
	ld de, wStringBuffer1
	call PlaceString
	ret

DebugRoom_UpdateExpForLevel:
	ld hl, BaseData + BASE_GROWTH_RATE
	ld bc, BASE_DATA_SIZE
	ld a, [wDebugRoomMonSpecies]
	dec a
	call AddNTimes
	ld a, BANK(BaseData)
	call GetFarByte
	ld [wBaseGrowthRate], a
	ld a, [wDebugRoomMonLevel]
	ld d, a
	farcall CalcExpAtLevel
	ld hl, wDebugRoomMonExp
	ldh a, [hProduct + 1]
	ld [hli], a
	ldh a, [hProduct + 2]
	ld [hli], a
	ldh a, [hProduct + 3]
	ld [hl], a
	ret

DebugRoomMenu_PokemonGet_Page1Values:
	db 8
	paged_value wDebugRoomMonSpecies,       1,   NUM_POKEMON, BULBASAUR,      DebugRoom_BoxStructStrings.Pokemon,   DebugRoom_PrintPokemonName, FALSE
	paged_value wDebugRoomMonItem,          1,   $ff,         MASTER_BALL,    DebugRoom_BoxStructStrings.Item,      DebugRoom_PrintItemName2,   FALSE
	paged_value wDebugRoomMonMoves+0,       1,   NUM_ATTACKS, POUND,          DebugRoom_BoxStructStrings.Move1,     DebugRoom_PrintMoveName,    FALSE
	paged_value wDebugRoomMonMoves+1,       1,   NUM_ATTACKS, POUND,          DebugRoom_BoxStructStrings.Move2,     DebugRoom_PrintMoveName,    FALSE
	paged_value wDebugRoomMonMoves+2,       1,   NUM_ATTACKS, POUND,          DebugRoom_BoxStructStrings.Move3,     DebugRoom_PrintMoveName,    FALSE
	paged_value wDebugRoomMonMoves+3,       1,   NUM_ATTACKS, POUND,          DebugRoom_BoxStructStrings.Move4,     DebugRoom_PrintMoveName,    FALSE
	paged_value wDebugRoomMonID+0,          $00, $ff,         HIGH(1234),     DebugRoom_BoxStructStrings.ID0,       NULL,                       FALSE
	paged_value wDebugRoomMonID+1,          $00, $ff,         LOW(1234),      DebugRoom_BoxStructStrings.ID1,       NULL,                       FALSE

DebugRoomMenu_PokemonGet_Page2Values:
	db 8
	paged_value wDebugRoomMonHPExp+0,       $00, $ff,         $00,            DebugRoom_BoxStructStrings.HPExp0,    NULL,                       FALSE
	paged_value wDebugRoomMonHPExp+1,       $00, $ff,         $00,            DebugRoom_BoxStructStrings.HPExp1,    NULL,                       FALSE
	paged_value wDebugRoomMonAtkExp+0,      $00, $ff,         $00,            DebugRoom_BoxStructStrings.AttkExp0,  NULL,                       FALSE
	paged_value wDebugRoomMonAtkExp+1,      $00, $ff,         $00,            DebugRoom_BoxStructStrings.AttkExp1,  NULL,                       FALSE
	paged_value wDebugRoomMonDefExp+0,      $00, $ff,         $00,            DebugRoom_BoxStructStrings.DfnsExp0,  NULL,                       FALSE
	paged_value wDebugRoomMonDefExp+1,      $00, $ff,         $00,            DebugRoom_BoxStructStrings.DfnsExp1,  NULL,                       FALSE
	paged_value wDebugRoomMonSpdExp+0,      $00, $ff,         $00,            DebugRoom_BoxStructStrings.SpeedExp0, NULL,                       FALSE
	paged_value wDebugRoomMonSpdExp+1,      $00, $ff,         $00,            DebugRoom_BoxStructStrings.SpeedExp1, NULL,                       FALSE

DebugRoomMenu_PokemonGet_Page3Values:
	db 8
	paged_value wDebugRoomMonSpcExp+0,      $00, $ff,         $00,            DebugRoom_BoxStructStrings.SpclExp0,  NULL,                       FALSE
	paged_value wDebugRoomMonSpcExp+1,      $00, $ff,         $00,            DebugRoom_BoxStructStrings.SpclExp1,  NULL,                       FALSE
	paged_value wDebugRoomMonDVs+0,         $00, $ff,         $00,            DebugRoom_BoxStructStrings.PowerRnd0, NULL,                       TRUE
	paged_value wDebugRoomMonDVs+1,         $00, $ff,         $00,            DebugRoom_BoxStructStrings.PowerRnd1, NULL,                       TRUE
	paged_value wDebugRoomMonPP+0,          $00, $ff,         $00,            DebugRoom_BoxStructStrings.PP1,       NULL,                       FALSE
	paged_value wDebugRoomMonPP+1,          $00, $ff,         $00,            DebugRoom_BoxStructStrings.PP2,       NULL,                       FALSE
	paged_value wDebugRoomMonPP+2,          $00, $ff,         $00,            DebugRoom_BoxStructStrings.PP3,       NULL,                       FALSE
	paged_value wDebugRoomMonPP+3,          $00, $ff,         $00,            DebugRoom_BoxStructStrings.PP4,       NULL,                       FALSE

DebugRoomMenu_PokemonGet_Page4Values:
	db 6
	paged_value wDebugRoomMonHappiness,     $00, $ff,         BASE_HAPPINESS, DebugRoom_BoxStructStrings.Friend,    NULL,                       FALSE
	paged_value wDebugRoomMonPokerusStatus, $00, $ff,         $00,            DebugRoom_BoxStructStrings.Pokerus,   NULL,                       TRUE
	paged_value wDebugRoomMonCaughtData+0,  $00, $ff,         $00,            DebugRoom_BoxStructStrings.NoUse0,    NULL,                       FALSE
	paged_value wDebugRoomMonCaughtData+1,  $00, $ff,         $00,            DebugRoom_BoxStructStrings.NoUse1,    NULL,                       FALSE
	paged_value wDebugRoomMonLevel,         1,   MAX_LEVEL,   $05,            DebugRoom_BoxStructStrings.Level,     NULL,                       FALSE
	paged_value wDebugRoomMonBox,           1,   NUM_BOXES,   $0e,            DebugRoom_BoxStructStrings.SendBox,   NULL,                       FALSE

DebugRoom_BoxStructStrings:
.Pokemon:   db "#MON@"
.Item:      db "ITEM@"
.Move1:     db "MOVE 1@"
.Move2:     db "MOVE 2@"
.Move3:     db "MOVE 3@"
.Move4:     db "MOVE 4@"
.ID0:       db "ID[0]@"
.ID1:       db "ID[1]@"
.BaseExp0:  db "BASE EXP[0]@" ; unreferenced
.BaseExp1:  db "BASE EXP[1]@" ; unreferenced
.BaseExp2:  db "BASE EXP[2]@" ; unreferenced
.HPExp0:    db "HP EXP[0]@"
.HPExp1:    db "HP EXP[1]@"
.AttkExp0:  db "ATTK EXP[0]@"
.AttkExp1:  db "ATTK EXP[1]@"
.DfnsExp0:  db "DFNS EXP[0]@"
.DfnsExp1:  db "DFNS EXP[1]@"
.SpeedExp0: db "SPEED EXP[0]@"
.SpeedExp1: db "SPEED EXP[1]@"
.SpclExp0:  db "SPCL EXP[0]@"
.SpclExp1:  db "SPCL EXP[1]@"
.PowerRnd0: db "POWER RND[0]<LF>  RARE:--1-1010@"
.PowerRnd1: db "POWER RND[1]<LF>  RARE:10101010@"
.PP1:       db "PP 1@"
.PP2:       db "PP 2@"
.PP3:       db "PP 3@"
.PP4:       db "PP 4@"
.Friend:    db "FRIEND@"
.Pokerus:   db "#RUS@"
.NoUse0:    db "NO USE[0]@"
.NoUse1:    db "NO USE[1]@"
.Level:     db "LEVEL@"
.SendBox:   db "SEND BOX@"

DebugRoom_BoxAddresses:
	table_width 3, DebugRoom_BoxAddresses
for n, 1, NUM_BOXES + 1
	dba sBox{d:n}
endr
	assert_table_length NUM_BOXES

DebugRoomMenu_RTCEdit:
	ld hl, .PagedValuesHeader
	call DebugRoom_EditPagedValues
	ret

.PagedValuesHeader:
	dw NULL ; A function
	dw NULL ; Select function
	dw DebugRoom_SaveRTC ; Start function
	dw DebugRoomMenu_RTCEdit_UpdateClock ; Auto function
	db 1 ; # pages
	dw DebugRoomMenu_RTCEdit_Page1Values

DebugRoom_SaveRTC:
	call YesNoBox
	ret c
	ld hl, wDebugRoomRTCSec
	call DebugRoom_SetClock
	ret

DebugRoomMenu_RTCEdit_UpdateClock:
	ld hl, wDebugRoomRTCCurSec
	call DebugRoom_GetClock
	ld de, DebugRoom_DayHTimeString
	hlcoord 3, 14
	call PlaceString
	ld a, [wDebugRoomRTCCurDay + 0]
	ld h, a
	ld a, [wDebugRoomRTCCurDay + 1]
	ld l, a
	push hl
	ld hl, sp+0
	ld d, h
	ld e, l
	hlcoord 7, 14
	ld c, 2
	call PrintHexNumber
	pop hl
	hlcoord 8, 15
	ld de, wDebugRoomRTCCurHour
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ld [hl], ":"
	inc hl
	ld de, wDebugRoomRTCCurMin
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ld [hl], ":"
	inc hl
	ld de, wDebugRoomRTCCurSec
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ret

DebugRoom_DayHTimeString:
	db "DAY     H<LF>TIME@"

DebugRoom_GetClock:
	ld a, SRAM_ENABLE
	ld [MBC3SRamEnable], a
	xor a
	ld [MBC3LatchClock], a
	inc a
	ld [MBC3LatchClock], a
	ld b, RTC_DH - RTC_S + 1
	ld c, RTC_S
.loop
	ld a, c
	ld [MBC3SRamBank], a
	ld a, [MBC3RTC]
	ld [hli], a
	inc c
	dec b
	jr nz, .loop
	call CloseSRAM
	ret

DebugRoom_SetClock:
	ld a, SRAM_ENABLE
	ld [MBC3SRamEnable], a
	ld b, RTC_DH - RTC_S + 1
	ld c, RTC_S
.loop
	ld a, c
	ld [MBC3SRamBank], a
	ld a, [hli]
	ld [MBC3RTC], a
	inc c
	dec b
	jr nz, .loop
	call CloseSRAM
	ret

DebugRoomMenu_RTCEdit_Page1Values:
	db 5
	paged_value wDebugRoomRTCSec,   0,   60 - 1, 0, .SecondString, NULL, FALSE
	paged_value wDebugRoomRTCMin,   0,   60 - 1, 0, .MinuteString, NULL, FALSE
	paged_value wDebugRoomRTCHour,  0,   24 - 1, 0, .HourString,   NULL, FALSE
	paged_value wDebugRoomRTCDay+0, $00, $ff,    0, .DayLString,   NULL, TRUE
	paged_value wDebugRoomRTCDay+1, $00, $ff,    0, .DayHString,   NULL, TRUE

.SecondString: db "SECOND@"
.MinuteString: db "MINUTE@"
.HourString:   db "HOUR@"
.DayLString:   db "DAY L@"
.DayHString:   db "DAY H<LF> BIT0:DAY MSB<LF> BIT6:HALT<LF> BIT7:DAY CARRY@"

DebugRoomMenu_HaltChkClr:
	call YesNoBox
	ret c
	ld a, BANK(sRTCHaltCheckValue)
	call OpenSRAM
	xor a
	ld hl, sRTCHaltCheckValue
	ld [hli], a
	ld [hl], a
	call CloseSRAM
	call DebugRoom_PrintRTCHaltChk
	ret

DebugRoom_PrintRTCHaltChk:
	hlcoord 16, 9
	ld de, .RTCString
	call PlaceString
	ld a, BANK(sRTCHaltCheckValue)
	ld hl, sRTCHaltCheckValue
	call OpenSRAM
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call CloseSRAM
	ld de, .HaltString
	ld a, h
	cp HIGH(RTC_HALT_VALUE)
	jr nz, .ok
	ld a, l
	cp LOW(RTC_HALT_VALUE)
	jr z, .done
.ok
	ld de, .OKString
.done
	hlcoord 16, 10
	call PlaceString
	ret

.RTCString:
	db "RTC:@"

.OKString:
	db "  OK@"

.HaltString:
	db "HALT@"

DebugRoomMenu_GBIDSet:
	ld hl, .PagedValuesHeader
	call DebugRoom_EditPagedValues
	ret

.PagedValuesHeader:
	dw NULL ; A function
	dw NULL ; Select function
	dw DebugRoom_SaveGBID ; Start function
	dw NULL ; Auto function
	db 1 ; # pages
	dw DebugRoomMenu_GBIDSet_Page1Values

DebugRoom_SaveGBID:
	call YesNoBox
	ret c
	ld a, BANK(sPlayerData)
	call OpenSRAM
	ld hl, sPlayerData + (wPlayerID - wPlayerData)
	ld a, [wDebugRoomGBID + 0]
	ld [hli], a
	ld a, [wDebugRoomGBID + 1]
	ld [hli], a
	call CloseSRAM
	call DebugRoom_SaveChecksum
	ret

DebugRoomMenu_GBIDSet_Page1Values:
	db 2
	paged_value wDebugRoomGBID+0, $00, $ff, $00, .GBID0String, NULL, TRUE
	paged_value wDebugRoomGBID+1, $00, $ff, $00, .GBID1String, NULL, TRUE

.GBID0String: db "GB ID [0]@"
.GBID1String: db "GB ID [1]@"

DebugRoomMenu_BtlRecClr:
	call YesNoBox
	ret c
	ld a, BANK(sLinkBattleStats)
	call OpenSRAM
	xor a
	ld hl, sLinkBattleStats
	ld bc, sLinkBattleStatsEnd - sLinkBattleStats
	call ByteFill
	call CloseSRAM
	ret

DebugRoomMenu_HOFClear:
	call YesNoBox
	ret c
	ld a, BANK(sPlayerData)
	call OpenSRAM
	ld hl, sPlayerData + (wHallOfFameCount - wPlayerData)
	ld [hl], 0
	xor a
	ld hl, sHallOfFame
	ld bc, sHallOfFameEnd - sHallOfFame
	call ByteFill
	call CloseSRAM
	call DebugRoom_SaveChecksum
	ret

ComputeROMChecksum:
	ld de, 0
	call .ComputeROM0Checksum
	ld c, $01 ; first bank
.loop:
	push bc
	push de
	ld a, c
	cpl
	inc a
	add $80
	ld de, wDebugRoomCurChecksumBank
	ld [de], a
	hlcoord 16, 16
	ld c, 1
	call PrintHexNumber
	ld [hl], "h"
	pop de
	pop bc
	call ComputeROMXChecksum
	inc c
	ld a, c
	cp $80 ; number of banks
	jr c, .loop
	ld a, d
	ld [wDebugRoomROMChecksum + 0], a
	ld a, e
	ld [wDebugRoomROMChecksum + 1], a
	ret

.AddAtoDE:
	add e
	ld e, a
	ld a, d
	adc 0
	ld d, a
	ret

.ComputeROM0Checksum:
	ld hl, $0000 ; ROM0 start
.rom0_loop
	ld a, [hli]
	call .AddAtoDE
	ld a, h
	cp $40 ; HIGH(ROM0 end)
	jr c, .rom0_loop
	ret

.ComputeROMXChecksum: ; unreferenced
	ld hl, $4000 ; ROMX start
.romx_loop
	ld a, c
	call GetFarByte
	inc hl
	call .AddAtoDE
	ld a, h
	cp $80 ; HIGH(ROMX end)
	jr c, .romx_loop
	ret

DebugRoom_PrintROMChecksum: ; unreferenced
	hlcoord 16, 0
	ld de, .SumString
	call PlaceString
	hlcoord 16, 1
	ld de, wDebugRoomROMChecksum
	ld c, 2
	call PrintHexNumber
	ret

.SumString:
	db "SUM:@"

DebugRoomMenu_ROMChecksum:
	ld hl, .WaitText
	call MenuTextbox
	call ComputeROMChecksum
	call CloseWindow
	ld hl, .ROMChecksumText
	call MenuTextbox
	hlcoord 14, 14
	ld de, wDebugRoomROMChecksum
	ld c, 2
	call PrintHexNumber
	ld [hl], "h"
	call DebugRoom_JoyWaitABSelect
	call CloseWindow
	ret

.WaitText:
	text "Wait..."
	done

.ROMChecksumText:
	text "ROM CHECKSUM:"
	next ""
	done

DebugRoomMenu_BTBugPoke:
	ld a, BANK(sIsBugMon)
	call OpenSRAM
	ld a, [sIsBugMon]
	call CloseSRAM
	or a
	jr nz, .bug_mon
	ld hl, .NoBugMonText
	call MenuTextbox
	call DebugRoom_JoyWaitABSelect
	call CloseWindow
	ret

.NoBugMonText:
	text "No bug #MON."
	done

.bug_mon:
	ld hl, .ItsBugMonText
	call MenuTextbox
	ld a, BANK(sIsBugMon)
	call OpenSRAM
	hlcoord 4, 16
	ld de, sIsBugMon
	ld c, 1
	call PrintHexNumber
	ld [hl], "h"
	call YesNoBox
	jr c, .done
	xor a
	ld [sIsBugMon], a
.done
	call CloseSRAM
	call CloseWindow
	ret

.ItsBugMonText:
	text "It'", "s bug #MON!"
	next "No.    Clear flag?"
	done

PrintHexNumber:
; Print the c-byte value from de to hl as hexadecimal digits.
.loop
	push bc
	call .HandleByte
	pop bc
	dec c
	jr nz, .loop
	ret

.HandleByte:
	ld a, [de]
	swap a
	and $f
	call .PrintDigit
	ld [hli], a
	ld a, [de]
	and $f
	call .PrintDigit
	ld [hli], a
	inc de
	ret

.PrintDigit:
	ld bc, .HexDigits
	add c
	ld c, a
	ld a, 0
	adc b
	ld b, a
	ld a, [bc]
	ret

.HexDigits:
	db "0123456789ABCDEF"
