INCLUDE "includes.asm"

SECTION "bank1", ROMX, BANK[$1]

PlaceWaitingText:: ; 4000
	hlcoord 3, 10
	ld b, 1
	ld c, 11

	ld a, [wBattleMode]
	and a
	jr z, .notinbattle

	call TextBox
	jr .proceed

.notinbattle
	predef Predef_LinkTextbox

.proceed
	hlcoord 4, 11
	ld de, .Waiting
	call PlaceString
	ld c, 50
	jp DelayFrames

.Waiting: ; 4025
	db "Waiting...!@"

LoadPushOAM:: ; 4031
	ld c, hPushOAM - $ff00
	ld b, PushOAMEnd - PushOAM
	ld hl, PushOAM
.loop
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	dec b
	jr nz, .loop
	ret

PushOAM: ; 403f
	ld a, Sprites / $100
	ld [rDMA], a
	ld a, (SpritesEnd - Sprites) / 4 ; 40
.loop
	dec a
	jr nz, .loop
	ret
PushOAMEnd

INCLUDE "engine/map_objects.asm"

INCLUDE "engine/intro_menu.asm"

ReanchorBGMap_NoOAMUpdate:: ; 6454
	call DelayFrame
	ld a, [hOAMUpdate]
	push af

	ld a, $1
	ld [hOAMUpdate], a
	ld a, [hBGMapMode]
	push af
	xor a
	ld [hBGMapMode], a

	call .ReanchorBGMap

	pop af
	ld [hBGMapMode], a
	pop af
	ld [hOAMUpdate], a
	ld hl, VramState
	set 6, [hl]
	ret

.ReanchorBGMap:
	xor a
	ld [hLCDCPointer], a
	ld [hBGMapMode], a
	ld a, $90
	ld [hWY], a
	call OverworldTextModeSwitch
	ld a, VBGMap1 / $100
	call .LoadBGMapAddrIntoHRAM
	call _OpenAndCloseMenu_HDMATransferTileMapAndAttrMap
	callba LoadOW_BGPal7
	callba ApplyPals
	ld a, $1
	ld [hCGBPalUpdate], a
	xor a
	ld [hBGMapMode], a
	ld [hWY], a
	callba HDMATransfer_FillBGMap0WithTile60 ; no need to farcall
	ld a, VBGMap0 / $100
	call .LoadBGMapAddrIntoHRAM
	xor a
	ld [wBGMapAnchor], a
	ld a, VBGMap0 / $100
	ld [wBGMapAnchor + 1], a
	xor a
	ld [hSCX], a
	ld [hSCY], a
	call ApplyBGMapAnchorToObjects
	ret

.LoadBGMapAddrIntoHRAM: ; 64b9
	ld [hBGMapAddress + 1], a
	xor a
	ld [hBGMapAddress], a
	ret

LoadFonts_NoOAMUpdate:: ; 64bf
	ld a, [hOAMUpdate]
	push af
	ld a, $1
	ld [hOAMUpdate], a

	call .LoadGFX

	pop af
	ld [hOAMUpdate], a
	ret

.LoadGFX:
	call LoadFontsExtra
	ld a, $90
	ld [hWY], a
	call SafeUpdateSprites
	call LoadStandardFont
	ret

HDMATransfer_FillBGMap0WithTile60: ; 64db
	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a

	ld a, $60
	ld hl, wDecompressScratch
	ld bc, wScratchAttrMap - wDecompressScratch
	call ByteFill
	ld a, wDecompressScratch / $100
	ld [rHDMA1], a
	ld a, wDecompressScratch % $100
	ld [rHDMA2], a
	ld a, (VBGMap0 % $8000) / $100
	ld [rHDMA3], a
	ld a, (VBGMap0 % $8000) % $100
	ld [rHDMA4], a
	ld a, $3f
	ld [hDMATransfer], a
	call DelayFrame

	pop af
	ld [rSVBK], a
	ret

INCLUDE "engine/learn.asm"

CheckNickErrors:: ; 669f
; error-check monster nick before use
; must be a peace offering to gamesharkers

; input: de = nick location

	push bc
	push de
	ld b, PKMN_NAME_LENGTH

.checkchar
; end of nick?
	ld a, [de]
	cp "@" ; terminator
	jr z, .end

; check if this char is a text command
	ld hl, .textcommands
	dec hl
.loop
; next entry
	inc hl
; reached end of commands table?
	ld a, [hl]
	cp a, -1
	jr z, .done

; is the current char between this value (inclusive)...
	ld a, [de]
	cp [hl]
	inc hl
	jr c, .loop
; ...and this one?
	cp [hl]
	jr nc, .loop

; replace it with a "?"
	ld a, "?"
	ld [de], a
	jr .loop

.done
; next char
	inc de
; reached end of nick without finding a terminator?
	dec b
	jr nz, .checkchar

; change nick to "?@"
	pop de
	push de
	ld a, "?"
	ld [de], a
	inc de
	ld a, "@"
	ld [de], a
.end
; if the nick has any errors at this point it's out of our hands
	pop de
	pop bc
	ret

.textcommands ; 66cf
; table defining which characters are actually text commands
; format:
	;      ≥           <
	db "<START>",  $04       + 1
	db "<PLAY_G>", $18       + 1
	db $1d,        "%"       + 1
	db $35,        "<GREEN>" + 1
	db "<ENEMY>",  "<ENEMY>" + 1
	db $49,        "<TM>"    + 1
	db "<ROCKET>", "┘"       + 1
	db -1 ; end

INCLUDE "engine/math.asm"

ItemAttributes: ; 67c1
INCLUDE "items/item_attributes.asm"
INCLUDE "engine/npc_movement.asm"
INCLUDE "event/happiness_egg.asm"
INCLUDE "event/special.asm"

Predef1: ; 747a
; not used
	ret

SECTION "bank2", ROMX, BANK[$2]

INCLUDE "engine/player_object.asm"
INCLUDE "engine/sine.asm"
INCLUDE "engine/predef.asm"
INCLUDE "engine/color.asm"

SECTION "bank3", ROMX, BANK[$3]

CheckTime:: ; c000
	ld a, [TimeOfDay]
	ld hl, TimeOfDayTable
	ld de, 2
	call IsInArray
	inc hl
	ld c, [hl]
	ret c

	xor a
	ld c, a
	ret

TimeOfDayTable: ; c012
	db MORN, 1 << MORN
	db DAY,  1 << DAY
	db NITE, 1 << NITE
	db NITE, 1 << NITE
	db -1

INCLUDE "engine/specials.asm"
INCLUDE "engine/printnum.asm"
INCLUDE "engine/health.asm"
INCLUDE "event/overworld.asm"
INCLUDE "engine/items.asm"
INCLUDE "engine/player_step.asm"
INCLUDE "engine/anim_hp_bar.asm"
INCLUDE "engine/move_mon.asm"
INCLUDE "engine/billspctop.asm"

GetBreedMon1LevelGrowth: ; e698
	ld hl, wBreedMon1Stats
	ld de, TempMon
	ld bc, BOXMON_STRUCT_LENGTH
	call CopyBytes
	callab CalcLevel
	ld a, [wBreedMon1Level]
	ld b, a
	ld a, d
	ld e, a
	sub b
	ld d, a
	ret

GetBreedMon2LevelGrowth: ; e6b3
	ld hl, wBreedMon2Stats
	ld de, TempMon
	ld bc, BOXMON_STRUCT_LENGTH
	call CopyBytes
	callab CalcLevel
	ld a, [wBreedMon2Level]
	ld b, a
	ld a, d
	ld e, a
	sub b
	ld d, a
	ret

BugContest_SetCaughtContestMon: ; e6ce
	ld a, [wContestMon]
	and a
	jr z, .firstcatch
	ld [wd265], a
	callba DisplayAlreadyCaughtText
	callba DisplayCaughtContestMonStats
	lb bc, 14, 7
	call PlaceYesNoBox
	ret c

.firstcatch
	call .generatestats
	ld a, [TempEnemyMonSpecies]
	ld [wd265], a
	call GetPokemonName
	ld hl, .caughttext
	call PrintText
	ret

.generatestats ; e6fd
	ld a, [TempEnemyMonSpecies]
	ld [CurSpecies], a
	ld [CurPartySpecies], a
	call GetBaseData
	xor a
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wContestMon
	call ByteFill
	xor a
	ld [MonType], a
	ld hl, wContestMon
	jp GeneratePartyMonStats

.caughttext ; 0xe71d
	; Caught @ !
	text_jump UnknownText_0x1c10c0
	db "@"

INCLUDE "items/item_effects.asm"

KnowsMove: ; f9ea
	ld a, MON_MOVES
	call GetPartyParamLocation
	ld a, [wPutativeTMHMMove]
	ld b, a
	ld c, NUM_MOVES
.loop
	ld a, [hli]
	cp b
	jr z, .knows_move
	dec c
	jr nz, .loop
	and a
	ret

.knows_move
	ld hl, .Text_knows
	call PrintText
	scf
	ret

.Text_knows: ; 0xfa06
	; knows @ .
	text_jump UnknownText_0x1c5ea8
	db "@"

SECTION "bank4", ROMX, BANK[$4]

INCLUDE "engine/pack.asm"
INCLUDE "engine/time.asm"
INCLUDE "engine/tmhm.asm"
INCLUDE "engine/namingscreen.asm"

Script_AbortBugContest: ; 0x122c1
	checkflag ENGINE_BUG_CONTEST_TIMER
	iffalse .finish
	setflag ENGINE_DAILY_BUG_CONTEST
	special ContestReturnMons
.finish
	end

INCLUDE "event/itemball.asm"
INCLUDE "engine/healmachineanim.asm"
INCLUDE "event/whiteout.asm"
INCLUDE "event/forced_movement.asm"
INCLUDE "event/itemfinder.asm"
INCLUDE "engine/startmenu.asm"
INCLUDE "engine/selectmenu.asm"
INCLUDE "event/elevator.asm"

Special_GiveParkBalls: ; 135db
	xor a
	ld [wContestMon], a
	ld a, 20
	ld [wParkBallsRemaining], a
	callba StartBugContestTimer
	ret

BugCatchingContestBattleScript:: ; 0x135eb
	writecode VAR_BATTLETYPE, BATTLETYPE_CONTEST
	randomwildmon
	startbattle
	reloadmapafterbattle
	copybytetovar wParkBallsRemaining
	iffalse BugCatchingContestOutOfBallsScript
	end

BugCatchingContestOverScript:: ; 0x135f8
	playsound SFX_ELEVATOR_END
	opentext
	writetext BugCatchingContestText_BeeepTimesUp
	waitbutton
	jump BugCatchingContestReturnToGateScript

BugCatchingContestOutOfBallsScript: ; 0x13603
	playsound SFX_ELEVATOR_END
	opentext
	writetext BugCatchingContestText_ContestIsOver
	waitbutton

BugCatchingContestReturnToGateScript: ; 0x1360b
	closetext
	jumpstd bugcontestresultswarp

BugCatchingContestText_BeeepTimesUp: ; 0x1360f
	; ANNOUNCER: BEEEP! Time's up!
	text_jump UnknownText_0x1bd2ca
	db "@"

BugCatchingContestText_ContestIsOver: ; 0x13614
	; ANNOUNCER: The Contest is over!
	text_jump UnknownText_0x1bd2e7
	db "@"

RepelWoreOffScript:: ; 0x13619
	opentext
	writetext .text
	waitbutton
	closetext
	end

.text ; 0x13620
	; REPEL's effect wore off.
	text_jump UnknownText_0x1bd308
	db "@"

HiddenItemScript:: ; 0x13625
	opentext
	copybytetovar EngineBuffer3
	itemtotext 0, 0
	writetext .found_text
	giveitem ITEM_FROM_MEM
	iffalse .bag_full
	callasm SetMemEvent
	specialsound
	itemnotify
	jump .finish

.bag_full ; 0x1363e
	buttonsound
	writetext .no_room_text
	waitbutton

.finish ; 13643
	closetext
	end

.found_text ; 0x13645
	; found @ !
	text_jump UnknownText_0x1bd321
	db "@"

.no_room_text ; 0x1364a
	; But   has no space left…
	text_jump UnknownText_0x1bd331
	db "@"

SetMemEvent: ; 1364f
	ld hl, EngineBuffer1 ; wd03e (aliases: MenuItemsList, CurFruitTree, CurInput)
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld b, SET_FLAG
	call EventFlagAction
	ret

CheckFacingTileForStd:: ; 1365b
; Checks to see if the tile you're facing has a std script associated with it.  If so, executes the script and returns carry.
	ld a, c
	ld de, 3
	ld hl, .table1
	call IsInArray
	jr nc, .notintable

	ld a, jumpstd_command
	ld [wJumpStdScriptBuffer], a
	inc hl
	ld a, [hli]
	ld [wJumpStdScriptBuffer + 1], a
	ld a, [hli]
	ld [wJumpStdScriptBuffer + 2], a
	ld a, BANK(Script_JumpStdFromRAM)
	ld hl, Script_JumpStdFromRAM
	call CallScript
	scf
	ret

.notintable
	xor a
	ret

.table1
	dbw $91, magazinebookshelf
	dbw $93, pcscript
	dbw $94, radio1
	dbw $95, townmap
	dbw $96, merchandiseshelf
	dbw $97, tv
	dbw $9d, window
	dbw $9f, incenseburner
	db   -1 ; end

Script_JumpStdFromRAM: ; 0x1369a
	jump wJumpStdScriptBuffer

INCLUDE "event/bug_contest_judging.asm"

ApplyPokerusTick: ; 13988
; decreases all pokemon's pokerus counter by b. if the lower nybble reaches zero, the pokerus is cured.
	ld hl, PartyMon1PokerusStatus ; PartyMon1 + MON_PKRS
	ld a, [PartyCount]
	and a
	ret z ; make sure it's not wasting time on an empty party
	ld c, a
.loop
	ld a, [hl]
	and $f ; lower nybble is the number of days remaining
	jr z, .next ; if already 0, skip
	sub b ; subtract the number of days
	jr nc, .ok ; max(result, 0)
	xor a
.ok
	ld d, a ; back up this value because we need to preserve the strain (upper nybble)
	ld a, [hl]
	and $f0
	add d
	ld [hl], a ; this prevents a cured pokemon from recontracting pokerus
.next
	ld de, PARTYMON_STRUCT_LENGTH
	add hl, de
	dec c
	jr nz, .loop
	ret

INCLUDE "event/bug_contest_2.asm"

INCLUDE "unknown/013a47.asm"

GetSquareRoot: ; 13b87
; Return the square root of de in b.

; Rather than calculating the result, we take the index of the
; first value in a table of squares that isn't lower than de.

	ld hl, Squares
	ld b, 0
.loop
; Make sure we don't go past the end of the table.
	inc b
	ld a, b
	cp $ff
	ret z

; Iterate over the table until b**2 >= de.
	ld a, [hli]
	sub e
	ld a, [hli]
	sbc d

	jr c, .loop
	ret

Squares: ; 13b98
root	set 1
	rept $ff
	dw root*root
root	set root+1
	endr

SECTION "bank5", ROMX, BANK[$5]

INCLUDE "engine/rtc.asm"
INCLUDE "engine/overworld.asm"
INCLUDE "engine/tile_events.asm"
INCLUDE "engine/save.asm"
INCLUDE "engine/spawn_points.asm"
INCLUDE "engine/map_setup.asm"
INCLUDE "engine/pokecenter_pc.asm"
INCLUDE "engine/mart.asm"
INCLUDE "engine/money.asm"
INCLUDE "items/marts.asm"
INCLUDE "event/mom.asm"
INCLUDE "event/daycare.asm"
INCLUDE "event/photo.asm"
INCLUDE "engine/breeding/egg.asm"

SECTION "Tileset Data 1", ROMX, BANK[TILESETS_1]

INCLUDE "tilesets/data_1.asm"

SECTION "Roofs", ROMX, BANK[ROOFS]

INCLUDE "tilesets/roofs.asm"

SECTION "Tileset Data 2", ROMX, BANK[TILESETS_2]

INCLUDE "tilesets/data_2.asm"

SECTION "bank8", ROMX, BANK[$8]

INCLUDE "engine/clock_reset.asm"

SECTION "Tileset Data 3", ROMX, BANK[TILESETS_3]

INCLUDE "tilesets/data_3.asm"

SECTION "bank9", ROMX, BANK[$9]

StringBufferPointers:: ; 24000
	dw StringBuffer3
	dw StringBuffer4
	dw StringBuffer5
	dw StringBuffer2
	dw StringBuffer1
	dw EnemyMonNick
	dw BattleMonNick

INCLUDE "engine/menu.asm"

UpdateItemDescription: ; 0x244c3
	ld a, [MenuSelection]
	ld [CurSpecies], a
	hlcoord 0, 12
	ld b, 4
	ld c, SCREEN_WIDTH - 2
	call TextBox
	ld a, [MenuSelection]
	cp -1
	ret z
	decoord 1, 14
	callba PrintItemDescription
	ret

INCLUDE "engine/pokepic.asm"

LoadObjectMasks: ; 2454f
	ld hl, wObjectMasks
	xor a
	ld bc, NUM_OBJECTS
	call ByteFill
	nop
	ld bc, MapObjects
	ld de, wObjectMasks
	xor a
.loop
	push af
	push bc
	push de
	call GetObjectTimeMask
	jr c, .next
	call CheckObjectFlag
.next
	pop de
	ld [de], a
	inc de
	pop bc
	ld hl, OBJECT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	pop af
	inc a
	cp NUM_OBJECTS
	jr nz, .loop
	ret

CheckObjectFlag: ; 2457d (9:457d)
	ld hl, MAPOBJECT_SPRITE
	add hl, bc
	ld a, [hl]
	and a
	jr z, .masked
	ld hl, MAPOBJECT_EVENT_FLAG
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	cp -1
	jr nz, .check
	ld a, e
	cp -1
	jr z, .unmasked
	jr .masked
.check
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	and a
	jr nz, .masked
.unmasked
	xor a
	ret

.masked
	ld a, -1
	scf
	ret

GetObjectTimeMask: ; 245a7 (9:45a7)
	call CheckObjectTime
	ld a, -1
	ret c
	xor a
	ret

INCLUDE "engine/scrolling_menu.asm"
INCLUDE "engine/switch_items.asm"

PlaceMenuItemName: ; 0x24ab4
	push de
	ld a, [MenuSelection]
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	pop hl
	call PlaceString
	ret

PlaceMenuItemQuantity: ; 0x24ac3
	push de
	ld a, [MenuSelection]
	ld [CurItem], a
	callba _CheckTossableItem
	ld a, [wItemAttributeParamBuffer]
	pop hl
	and a
	jr nz, .done
	ld de, $15
	add hl, de
	ld [hl], "×"
	inc hl
	ld de, MenuSelectionQuantity
	lb bc, 1, 2
	call PrintNum

.done
	ret

PlaceMoneyTopRight: ; 24ae8
	ld hl, MenuDataHeader_0x24b15
	call CopyMenuDataHeader
	jr PlaceMoneyDataHeader

PlaceMoneyBottomLeft: ; 24af0
	ld hl, MenuDataHeader_0x24b1d
	call CopyMenuDataHeader
	jr PlaceMoneyDataHeader

PlaceMoneyAtTopLeftOfTextbox: ; 24af8
	ld hl, MenuDataHeader_0x24b15
	lb de, 0, 11
	call OffsetMenuDataHeader

PlaceMoneyDataHeader: ; 24b01
	call MenuBox
	call MenuBoxCoord2Tile
	ld de, SCREEN_WIDTH + 1
	add hl, de
	ld de, Money
	lb bc, PRINTNUM_MONEY | 3, 6
	call PrintNum
	ret

MenuDataHeader_0x24b15: ; 0x24b15
	db $40 ; flags
	db 00, 11 ; start coords
	db 02, 19 ; end coords
	dw NULL
	db 1 ; default option

MenuDataHeader_0x24b1d: ; 0x24b1d
	db $40 ; flags
	db 11, 00 ; start coords
	db 13, 08 ; end coords
	dw NULL
	db 1 ; default option

Special_DisplayCoinCaseBalance: ; 24b25
	; Place a text box of size 1x7 at 11, 0.
	hlcoord 11, 0
	ld b, 1
	ld c, 7
	call TextBox
	hlcoord 12, 0
	ld de, CoinString
	call PlaceString
	hlcoord 17, 1
	ld de, ShowMoney_TerminatorString
	call PlaceString
	ld de, Coins
	lb bc, 2, 4
	hlcoord 13, 1
	call PrintNum
	ret

Special_DisplayMoneyAndCoinBalance: ; 24b4e
	hlcoord 5, 0
	ld b, 3
	ld c, 13
	call TextBox
	hlcoord 6, 1
	ld de, MoneyString
	call PlaceString
	hlcoord 12, 1
	ld de, Money
	lb bc, PRINTNUM_MONEY | 3, 6
	call PrintNum
	hlcoord 6, 3
	ld de, CoinString
	call PlaceString
	hlcoord 15, 3
	ld de, Coins
	lb bc, 2, 4
	call PrintNum
	ret

MoneyString: ; 24b83
	db "MONEY@"
CoinString: ; 24b89
	db "COIN@"
ShowMoney_TerminatorString: ; 24b8e
	db "@"

Function24b8f: ; 24b8f
; unreferenced, related to safari?
	ld hl, Options
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	hlcoord 0, 0
	ld b, 3
	ld c, 7
	call TextBox
	hlcoord 1, 1
	ld de, wSafariTimeRemaining
	lb bc, 2, 3
	call PrintNum
	hlcoord 4, 1
	ld de, .slash_500
	call PlaceString
	hlcoord 1, 3
	ld de, .booru_ko
	call PlaceString
	hlcoord 5, 3
	ld de, wSafariBallsRemaining
	lb bc, 1, 2
	call PrintNum
	pop af
	ld [Options], a
	ret

.slash_500 ; 24bcf
	db "/500@"
.booru_ko ; 24bd4
	db "ボール   こ@"

StartMenu_DrawBugContestStatusBox: ; 24bdc
	hlcoord 0, 0
	ld b, 5
	ld c, 17
	call TextBox
	ret

StartMenu_PrintBugContestStatus: ; 24be7
	ld hl, Options
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	call StartMenu_DrawBugContestStatusBox
	hlcoord 1, 5
	ld de, .Balls_EN
	call PlaceString
	hlcoord 8, 5
	ld de, wParkBallsRemaining
	lb bc, PRINTNUM_RIGHTALIGN | 1, 2
	call PrintNum
	hlcoord 1, 1
	ld de, .CAUGHT
	call PlaceString
	ld a, [wContestMon]
	and a
	ld de, .None
	jr z, .no_contest_mon
	ld [wd265], a
	call GetPokemonName

.no_contest_mon
	hlcoord 8, 1
	call PlaceString
	ld a, [wContestMon]
	and a
	jr z, .skip_level
	hlcoord 1, 3
	ld de, .LEVEL
	call PlaceString
	ld a, [wContestMonLevel]
	ld h, b
	ld l, c
	inc hl
	ld c, 3
	call Print8BitNumRightAlign

.skip_level
	pop af
	ld [Options], a
	ret

.Balls_JP: ; 24c43
	db "ボール   こ@"
.CAUGHT: ; 24c4b
	db "CAUGHT@"
.Balls_EN: ; 24c52
	db "BALLS:@"
.None: ; 24c59
	db "None@"
.LEVEL: ; 24c5e
	db "LEVEL@"

FindApricornsInBag: ; 24c64
; Checks the bag for Apricorns.
	ld hl, Buffer1
	xor a
	ld [hli], a
	dec a
	ld bc, 10
	call ByteFill

	ld hl, .ApricornBalls
.loop
	ld a, [hl]
	cp -1
	jr z, .done
	push hl
	ld [CurItem], a
	ld hl, NumItems
	call CheckItem
	pop hl
	jr nc, .nope
	ld a, [hl]
	call .addtobuffer
.nope
	inc hl
	inc hl
	jr .loop

.done
	ld a, [Buffer1]
	and a
	ret nz
	scf
	ret

.addtobuffer ; 24c94
	push hl
	ld hl, Buffer1
	inc [hl]
	ld e, [hl]
	ld d, 0
	add hl, de
	ld [hl], a
	pop hl
	ret

.ApricornBalls: ; 24ca0
	db RED_APRICORN, LEVEL_BALL
	db BLU_APRICORN, LURE_BALL
	db YLW_APRICORN, MOON_BALL
	db GRN_APRICORN, FRIEND_BALL
	db WHT_APRICORN, FAST_BALL
	db BLK_APRICORN, HEAVY_BALL
	db PNK_APRICORN, LOVE_BALL
	db -1

INCLUDE "engine/mon_menu.asm"
INCLUDE "battle/menu.asm"
INCLUDE "engine/buy_sell_toss.asm"
INCLUDE "engine/trainer_card.asm"
INCLUDE "engine/prof_oaks_pc.asm"
INCLUDE "engine/decorations.asm"

PadCoords_de: ; 27092
	ld a, d
	add 4
	ld d, a
	ld a, e
	add 4
	ld e, a
	call GetBlockLocation
	ret

LevelUpHappinessMod: ; 2709e
	ld a, [CurPartyMon]
	ld hl, PartyMon1CaughtLocation
	call GetPartyLocation
	ld a, [hl]
	and $7f
	ld d, a
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	call GetWorldMapLocation
	cp d
	ld c, HAPPINESS_GAINLEVEL
	jr nz, .ok
	ld c, HAPPINESS_GAINLEVELATHOME

.ok
	callab ChangeHappiness
	ret

INCLUDE "trainers/dvs.asm"

_ReturnToBattle_UseBall: ; 2715c
	call ClearBGPalettes
	call ClearTileMap
	ld a, [BattleType]
	cp BATTLETYPE_TUTORIAL
	jr z, .gettutorialbackpic
	callba GetMonBackpic
	jr .continue

.gettutorialbackpic
	callba GetTrainerBackpic
.continue
	callba GetMonFrontpic
	callba _LoadBattleFontsHPBar
	call GetMemSGBLayout
	call CloseWindow
	call LoadStandardMenuDataHeader
	call WaitBGMap
	jp SetPalettes

ConsumeHeldItem: ; 27192
	push hl
	push de
	push bc
	ld a, [hBattleTurn]
	and a
	ld hl, OTPartyMon1Item
	ld de, EnemyMonItem
	ld a, [CurOTMon]
	jr z, .theirturn
	ld hl, PartyMon1Item
	ld de, BattleMonItem
	ld a, [CurBattleMon]

.theirturn
	push hl
	push af
	ld a, [de]
	ld b, a
	callba GetItemHeldEffect
	ld hl, .ConsumableEffects
.loop
	ld a, [hli]
	cp b
	jr z, .ok
	inc a
	jr nz, .loop
	pop af
	pop hl
	pop bc
	pop de
	pop hl
	ret

.ok
	xor a
	ld [de], a
	pop af
	pop hl
	call GetPartyLocation
	ld a, [hBattleTurn]
	and a
	jr nz, .ourturn
	ld a, [wBattleMode]
	dec a
	jr z, .done

.ourturn
	ld [hl], $0

.done
	pop bc
	pop de
	pop hl
	ret

.ConsumableEffects: ; 271de
; Consumable items?
	db HELD_BERRY
	db HELD_2
	db HELD_5
	db HELD_HEAL_POISON
	db HELD_HEAL_FREEZE
	db HELD_HEAL_BURN
	db HELD_HEAL_SLEEP
	db HELD_HEAL_PARALYZE
	db HELD_HEAL_STATUS
	db HELD_30
	db HELD_ATTACK_UP
	db HELD_DEFENSE_UP
	db HELD_SPEED_UP
	db HELD_SP_ATTACK_UP
	db HELD_SP_DEFENSE_UP
	db HELD_ACCURACY_UP
	db HELD_EVASION_UP
	db HELD_38
	db HELD_71
	db HELD_ESCAPE
	db HELD_CRITICAL_UP
	db -1

MoveEffectsPointers: ; 271f4
INCLUDE "battle/moves/move_effects_pointers.asm"

MoveEffects: ; 2732e
INCLUDE "battle/moves/move_effects.asm"

Kurt_SelectQuantity_InterpretJoypad: ; 27a28
	call BuySellToss_InterpretJoypad
	ld b, a
	ret

SECTION "bankA", ROMX, BANK[$A]

INCLUDE "engine/link.asm"

Function29fe4: ; unreferenced
	ld a, $0
	call GetSRAMBank
	ld d, $0
	ld b, CHECK_FLAG
	predef FlagPredef
	call CloseSRAM
	ld a, c
	and a
	ret

INCLUDE "engine/wildmons.asm"
INCLUDE "battle/link_result.asm"

ChrisBackpic: ; 2ba1a
INCBIN "gfx/misc/player.6x6.2bpp.lz"

DudeBackpic: ; 2bbaa
INCBIN "gfx/misc/dude.6x6.2bpp.lz"

SECTION "bankB", ROMX, BANK[$B]

INCLUDE "battle/trainer_huds.asm"

TrainerClassNames:: ; 2c1ef
INCLUDE "text/trainer_class_names.asm"

INCLUDE "battle/ai/redundant.asm"

INCLUDE "event/move_deleter.asm"

INCLUDE "engine/mysterygift2.asm"

INCLUDE "engine/tmhm2.asm"

MoveDescriptions:: ; 2cb52
INCLUDE "battle/moves/move_descriptions.asm"

GivePokerusAndConvertBerries: ; 2ed44
	call ConvertBerriesToBerryJuice
	ld hl, PartyMon1PokerusStatus
	ld a, [PartyCount]
	ld b, a
	ld de, PARTYMON_STRUCT_LENGTH
; Check to see if any of your Pokemon already has Pokerus.
; If so, sample its spread through your party.
; This means that you cannot get Pokerus de novo while
; a party member has an active infection.
.loopMons
	ld a, [hl]
	and $f
	jr nz, .TrySpreadPokerus
	add hl, de
	dec b
	jr nz, .loopMons

; If we haven't been to Goldenrod City at least once,
; prevent the contraction of Pokerus.
	ld hl, StatusFlags2
	bit 6, [hl]
	ret z
	call Random
	ld a, [hRandomAdd]
	and a
	ret nz
	ld a, [hRandomSub]
	cp $3
	ret nc                 ; 3/65536 chance (00 00, 00 01 or 00 02)
	ld a, [PartyCount]
	ld b, a
.randomMonSelectLoop
	call Random
	and $7
	cp b
	jr nc, .randomMonSelectLoop
	ld hl, PartyMon1PokerusStatus
	call GetPartyLocation  ; get pokerus byte of random mon
	ld a, [hl]
	and $f0
	ret nz                 ; if it already has pokerus, do nothing
.randomPokerusLoop         ; Simultaneously sample the strain and duration
	call Random
	and a
	jr z, .randomPokerusLoop
	ld b, a
	and $f0
	jr z, .load_pkrs
	ld a, b
	and $7
	inc a
.load_pkrs
	ld b, a ; this should come before the label
	swap b
	and $3
	inc a
	add b
	ld [hl], a
	ret

.TrySpreadPokerus:
	call Random
	cp 1 + 33 percent
	ret nc              ; 1/3 chance

	ld a, [PartyCount]
	cp 1
	ret z               ; only one mon, nothing to do

	ld c, [hl]
	ld a, b
	cp 2
	jr c, .checkPreviousMonsLoop    ; no more mons after this one, go backwards

	call Random
	cp 1 + 50 percent
	jr c, .checkPreviousMonsLoop    ; 1/2 chance, go backwards
.checkFollowingMonsLoop
	add hl, de
	ld a, [hl]
	and a
	jr z, .infectMon
	ld c, a
	and $3
	ret z               ; if mon has cured pokerus, stop searching
	dec b               ; go on to next mon
	ld a, b
	cp 1
	jr nz, .checkFollowingMonsLoop ; no more mons left
	ret

.checkPreviousMonsLoop
	ld a, [PartyCount]
	cp b
	ret z               ; no more mons
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	ld a, [hl]
	and a
	jr z, .infectMon
	ld c, a
	and $3
	ret z               ; if mon has cured pokerus, stop searching
	inc b               ; go on to next mon
	jr .checkPreviousMonsLoop

.infectMon
	ld a, c
	and $f0
	ld b, a
	ld a, c
	swap a
	and $3
	inc a
	add b
	ld [hl], a
	ret

; any berry held by a Shuckle may be converted to berry juice
ConvertBerriesToBerryJuice: ; 2ede6
	ld hl, StatusFlags2
	bit 6, [hl]
	ret z
	call Random
	cp $10
	ret nc              ; 1/16 chance
	ld hl, PartyMons
	ld a, [PartyCount]
.partyMonLoop
	push af
	push hl
	ld a, [hl]
	cp SHUCKLE
	jr nz, .loopMon
	ld bc, MON_ITEM
	add hl, bc
	ld a, [hl]
	cp BERRY
	jr z, .convertToJuice

.loopMon
	pop hl
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	pop af
	dec a
	jr nz, .partyMonLoop
	ret

.convertToJuice
	ld a, BERRY_JUICE
	ld [hl], a
	pop hl
	pop af
	ret

ShowLinkBattleParticipants: ; 2ee18
; If we're not in a communications room,
; we don't need to be here.
	ld a, [wLinkMode]
	and a
	ret z

	callba _ShowLinkBattleParticipants
	ld c, 150
	call DelayFrames
	call ClearTileMap
	call ClearSprites
	ret

FindFirstAliveMonAndStartBattle: ; 2ee2f
	xor a
	ld [hMapAnims], a
	call DelayFrame
	ld b, 6
	ld hl, PartyMon1HP
	ld de, PARTYMON_STRUCT_LENGTH - 1

.loop
	ld a, [hli]
	or [hl]
	jr nz, .okay
	add hl, de
	dec b
	jr nz, .loop

.okay
	ld de, MON_LEVEL - MON_HP
	add hl, de
	ld a, [hl]
	ld [BattleMonLevel], a
	predef Predef_StartBattle
	callba _LoadBattleFontsHPBar
	ld a, 1
	ld [hBGMapMode], a
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hBGMapMode], a
	ld [hWY], a
	ld [rWY], a
	ld [hMapAnims], a
	ret

PlayBattleMusic: ; 2ee6c

	push hl
	push de
	push bc

	xor a
	ld [MusicFade], a
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	call MaxVolume

	ld a, [BattleType]
	cp BATTLETYPE_SUICUNE
	ld de, MUSIC_SUICUNE_BATTLE
	jp z, .done
	cp BATTLETYPE_ROAMING
	jp z, .done

	; Are we fighting a trainer?
	ld a, [OtherTrainerClass]
	and a
	jr nz, .trainermusic

	callba RegionCheck
	ld a, e
	and a
	jr nz, .kantowild

	ld de, MUSIC_JOHTO_WILD_BATTLE
	ld a, [TimeOfDay]
	cp NITE
	jr nz, .done
	ld de, MUSIC_JOHTO_WILD_BATTLE_NIGHT
	jr .done

.kantowild
	ld de, MUSIC_KANTO_WILD_BATTLE
	jr .done

.trainermusic
	ld de, MUSIC_CHAMPION_BATTLE
	cp CHAMPION
	jr z, .done
	cp RED
	jr z, .done

	; really, they should have included admins and scientists here too...
	ld de, MUSIC_ROCKET_BATTLE
	cp GRUNTM
	jr z, .done
	cp GRUNTF
	jr z, .done

	ld de, MUSIC_KANTO_GYM_LEADER_BATTLE
	callba IsKantoGymLeader
	jr c, .done

	ld de, MUSIC_JOHTO_GYM_LEADER_BATTLE
	callba IsJohtoGymLeader
	jr c, .done

	ld de, MUSIC_RIVAL_BATTLE
	ld a, [OtherTrainerClass]
	cp RIVAL1
	jr z, .done
	cp RIVAL2
	jr nz, .othertrainer

	ld a, [OtherTrainerID]
	cp 4 ; Rival in Indigo Plateau
	jr c, .done
	ld de, MUSIC_CHAMPION_BATTLE
	jr .done

.othertrainer
	ld a, [wLinkMode]
	and a
	jr nz, .johtotrainer

	callba RegionCheck
	ld a, e
	and a
	jr nz, .kantotrainer

.johtotrainer
	ld de, MUSIC_JOHTO_TRAINER_BATTLE
	jr .done

.kantotrainer
	ld de, MUSIC_KANTO_TRAINER_BATTLE

.done
	call PlayMusic

	pop bc
	pop de
	pop hl
	ret

ClearBattleRAM: ; 2ef18
	xor a
	ld [wPlayerAction], a
	ld [wBattleResult], a

	ld hl, wPartyMenuCursor
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a

	ld [wMenuScrollPosition], a
	ld [CriticalHit], a
	ld [BattleMonSpecies], a
	ld [wBattleParticipantsNotFainted], a
	ld [CurBattleMon], a
	ld [wForcedSwitch], a
	ld [TimeOfDayPal], a
	ld [PlayerTurnsTaken], a
	ld [EnemyTurnsTaken], a
	ld [EvolvableFlags], a

	ld hl, PlayerHPPal
	ld [hli], a
	ld [hl], a

	ld hl, BattleMonDVs
	ld [hli], a
	ld [hl], a

	ld hl, EnemyMonDVs
	ld [hli], a
	ld [hl], a

; Clear the entire BattleMons area
	ld hl, wBattle
	ld bc, wBattleEnd - wBattle
	xor a
	call ByteFill

	callab ResetEnemyStatLevels

	call ClearWindowData

	ld hl, hBGMapAddress
	xor a
	ld [hli], a
	ld [hl], VBGMap0 / $100
	ret

PlaceGraphic: ; 2ef6e
; Fill wBoxAlignment-aligned box width b height c
; with iterating tile starting from hGraphicStartTile at hl.
; Predef $13

	ld de, SCREEN_WIDTH

	ld a, [wBoxAlignment]
	and a
	jr nz, .right

	ld a, [hGraphicStartTile]
.x1
	push bc
	push hl

.y1
	ld [hl], a
	add hl, de
	inc a
	dec c
	jr nz, .y1

	pop hl
	inc hl
	pop bc
	dec b
	jr nz, .x1
	ret

.right
; Right-aligned.
	push bc
	ld b, 0
	dec c
	add hl, bc
	pop bc

	ld a, [hGraphicStartTile]
.x2
	push bc
	push hl

.y2
	ld [hl], a
	add hl, de
	inc a
	dec c
	jr nz, .y2

	pop hl
	dec hl
	pop bc
	dec b
	jr nz, .x2
	ret

SECTION "Tileset Data 4", ROMX, BANK[TILESETS_4]

INCLUDE "tilesets/data_4.asm"

SECTION "Effect Commands", ROMX, BANK[$D]

INCLUDE "battle/effect_commands.asm"

SECTION "Enemy Trainers", ROMX, BANK[$E]

INCLUDE "battle/ai/items.asm"

AIScoring: ; 38591
INCLUDE "battle/ai/scoring.asm"

GetTrainerClassName: ; 3952d
	ld hl, RivalName
	ld a, c
	cp RIVAL1
	jr z, .rival

	ld [CurSpecies], a
	ld a, TRAINER_NAME
	ld [wNamedObjectTypeBuffer], a
	call GetName
	ld de, StringBuffer1
	ret

.rival
	ld de, StringBuffer1
	push de
	ld bc, NAME_LENGTH
	call CopyBytes
	pop de
	ret

GetOTName: ; 39550
	ld hl, OTPlayerName
	ld a, [wLinkMode]
	and a
	jr nz, .ok

	ld hl, RivalName
	ld a, c
	cp RIVAL1
	jr z, .ok

	ld [CurSpecies], a
	ld a, TRAINER_NAME
	ld [wNamedObjectTypeBuffer], a
	call GetName
	ld hl, StringBuffer1

.ok
	ld bc, TRAINER_CLASS_NAME_LENGTH
	ld de, OTClassName
	push de
	call CopyBytes
	pop de
	ret

GetTrainerAttributes: ; 3957b
	ld a, [TrainerClass]
	ld c, a
	call GetOTName
	ld a, [TrainerClass]
	dec a
	ld hl, TrainerClassAttributes + TRNATTR_ITEM1
	ld bc, NUM_TRAINER_ATTRIBUTES
	call AddNTimes
	ld de, wEnemyTrainerItem1
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ld a, [hl]
	ld [wEnemyTrainerBaseReward], a
	ret

INCLUDE "trainers/attributes.asm"

INCLUDE "trainers/read_party.asm"

INCLUDE "trainers/trainer_pointers.asm"

INCLUDE "trainers/trainers.asm"

SECTION "Battle Core", ROMX, BANK[$F]

INCLUDE "battle/core.asm"

INCLUDE "battle/effect_command_pointers.asm"

SECTION "bank10", ROMX, BANK[$10]

INCLUDE "engine/pokedex.asm"

INCLUDE "battle/moves/moves.asm"

INCLUDE "engine/evolve.asm"

SECTION "bank11", ROMX, BANK[$11]

INCLUDE "engine/fruit_trees.asm"

INCLUDE "battle/ai/move.asm"

AnimateDexSearchSlowpoke: ; 441cf
	ld hl, .FrameIDs
	ld b, 25
.loop
	ld a, [hli]

	; Wrap around
	cp $fe
	jr nz, .ok
	ld hl, .FrameIDs
	ld a, [hli]
.ok

	ld [wDexSearchSlowpokeFrame], a
	ld a, [hli]
	ld c, a
	push bc
	push hl
	call DoDexSearchSlowpokeFrame
	pop hl
	pop bc
	call DelayFrames
	dec b
	jr nz, .loop
	xor a
	ld [wDexSearchSlowpokeFrame], a
	call DoDexSearchSlowpokeFrame
	ld c, 32
	call DelayFrames
	ret

.FrameIDs: ; 441fc
	; frame ID, duration
	db 0, 7
	db 1, 7
	db 2, 7
	db 3, 7
	db 4, 7
	db -2

DoDexSearchSlowpokeFrame: ; 44207
	ld a, [wDexSearchSlowpokeFrame]
	ld hl, .SpriteData
	ld de, Sprites
.loop
	ld a, [hli]
	cp -1
	ret z
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [wDexSearchSlowpokeFrame]
	ld b, a
	add a
	add b
	add [hl]
	inc hl
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	jr .loop

.SpriteData: ; 44228
	dsprite 11, 0,  9, 0, $00, $00
	dsprite 11, 0, 10, 0, $01, $00
	dsprite 11, 0, 11, 0, $02, $00
	dsprite 12, 0,  9, 0, $10, $00
	dsprite 12, 0, 10, 0, $11, $00
	dsprite 12, 0, 11, 0, $12, $00
	dsprite 13, 0,  9, 0, $20, $00
	dsprite 13, 0, 10, 0, $21, $00
	dsprite 13, 0, 11, 0, $22, $00
	db -1

DisplayDexEntry: ; 4424d
	call GetPokemonName
	hlcoord 9, 3
	call PlaceString ; mon species
	ld a, [wd265]
	ld b, a
	call GetDexEntryPointer
	ld a, b
	push af
	hlcoord 9, 5
	call FarString ; dex species
	ld h, b
	ld l, c
	push de
; Print dex number
	hlcoord 2, 8
	ld a, $5c ; No
	ld [hli], a
	ld a, $5d ; .
	ld [hli], a
	ld de, wd265
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
; Check to see if we caught it.  Get out of here if we haven't.
	ld a, [wd265]
	dec a
	call CheckCaughtMon
	pop hl
	pop bc
	ret z
; Get the height of the Pokemon.
	ld a, [CurPartySpecies]
	ld [CurSpecies], a
	inc hl
	ld a, b
	push af
	push hl
	call GetFarHalfword
	ld d, l
	ld e, h
	pop hl
	inc hl
	inc hl
	ld a, d
	or e
	jr z, .skip_height
	push hl
	push de
	ld hl, [sp+$0]
	ld d, h
	ld e, l
	hlcoord 12, 7
	lb bc, 2, PRINTNUM_MONEY | 4
	call PrintNum
	hlcoord 14, 7
	ld [hl], $5e ; ft symbol
	pop af
	pop hl

.skip_height
	pop af
	push af
	inc hl
	push hl
	dec hl
	call GetFarHalfword
	ld d, l
	ld e, h
	ld a, e
	or d
	jr z, .skip_weight
	push de
	ld hl, [sp+$0]
	ld d, h
	ld e, l
	hlcoord 11, 9
	lb bc, 2, PRINTNUM_RIGHTALIGN | 5
	call PrintNum
	pop de

.skip_weight
; Page 1
	lb bc, 5, SCREEN_WIDTH - 2
	hlcoord 2, 11
	call ClearBox
	hlcoord 1, 10
	ld bc, SCREEN_WIDTH - 1
	ld a, $61 ; horizontal divider
	call ByteFill
	; page number
	hlcoord 1, 9
	ld [hl], $55
	inc hl
	ld [hl], $55
	hlcoord 1, 10
	ld [hl], $56 ; P.
	inc hl
	ld [hl], $57 ; 1
	pop de
	inc de
	pop af
	hlcoord 2, 11
	push af
	call FarString
	pop bc
	ld a, [wPokedexStatus]
	or a
	ret z

; Page 2
	push bc
	push de
	lb bc, 5, SCREEN_WIDTH - 2
	hlcoord 2, 11
	call ClearBox
	hlcoord 1, 10
	ld bc, SCREEN_WIDTH - 1
	ld a, $61
	call ByteFill
	; page number
	hlcoord 1, 9
	ld [hl], $55
	inc hl
	ld [hl], $55
	hlcoord 1, 10
	ld [hl], $56 ; P.
	inc hl
	ld [hl], $58 ; 2
	pop de
	inc de
	pop af
	hlcoord 2, 11
	call FarString
	ret

String_44331: ; 44331
	db "#@"

INCLUDE "data/pokedex/entry_pointers.asm"

INCLUDE "engine/mail.asm"

SECTION "Crystal Unique", ROMX, BANK[$12]

INCLUDE "engine/init_gender.asm"

DrawKrisPackGFX: ; 48e81
	ld hl, PackFGFXPointers
	add hl, de
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld hl, VTiles2 tile $50
	lb bc, BANK(PackFGFX), 15
	call Request2bpp
	ret

PackFGFXPointers: ; 48e93
	dw PackFGFX + (15 tiles) * 1
	dw PackFGFX + (15 tiles) * 3
	dw PackFGFX + (15 tiles) * 0
	dw PackFGFX + (15 tiles) * 2

PackFGFX: ; 48e9b
INCBIN "gfx/misc/pack_f.2bpp"

Special_MoveTutor: ; 4925b
	call FadeToMenu
	call ClearBGPalettes
	call ClearScreen
	call DelayFrame
	ld b, SCGB_PACKPALS
	call GetSGBLayout
	xor a
	ld [wItemAttributeParamBuffer], a
	call .GetMoveTutorMove
	ld [wd265], a
	ld [wPutativeTMHMMove], a
	call GetMoveName
	call CopyName1
	callba ChooseMonToLearnTMHM
	jr c, .cancel
	jr .enter_loop

.loop
	callba ChooseMonToLearnTMHM_NoRefresh
	jr c, .cancel
.enter_loop
	call CheckCanLearnMoveTutorMove
	jr nc, .loop
	xor a
	ld [ScriptVar], a
	jr .quit

.cancel
	ld a, -1
	ld [ScriptVar], a
.quit
	call CloseSubmenu
	ret

.GetMoveTutorMove: ; 492a5
	ld a, [ScriptVar]
	cp 1
	jr z, .flamethrower
	cp 2
	jr z, .thunderbolt
	ld a, ICE_BEAM
	ret

.flamethrower
	ld a, FLAMETHROWER
	ret

.thunderbolt
	ld a, THUNDERBOLT
	ret

CheckCanLearnMoveTutorMove: ; 492b9
	ld hl, .MenuDataHeader
	call LoadMenuDataHeader

	predef CanLearnTMHMMove

	push bc
	ld a, [CurPartyMon]
	ld hl, PartyMonNicknames
	call GetNick
	pop bc

	ld a, c
	and a
	jr nz, .can_learn
	push de
	ld de, SFX_WRONG
	call PlaySFX
	pop de
	ld a, BANK(Text_TMHMNotCompatible)
	ld hl, Text_TMHMNotCompatible
	call FarPrintText
	jr .didnt_learn

.can_learn
	callab KnowsMove
	jr c, .didnt_learn

	predef LearnMove
	ld a, b
	and a
	jr z, .didnt_learn

	ld c, HAPPINESS_LEARNMOVE
	callab ChangeHappiness
	jr .learned

.didnt_learn
	call ExitMenu
	and a
	ret

.learned
	call ExitMenu
	scf
	ret

.MenuDataHeader: ; 0x4930a
	db $40 ; flags
	db 12, 00 ; start coords
	db 17, 19 ; end coords

INCLUDE "predef/crystal.asm"

Unknown_4985a: ; unreferenced
	db $ab, $03, $57, $24, $ac, $0e, $13, $32
	db $be, $30, $5b, $4c, $47, $60, $ed, $f2
	db $ab, $03, $55, $26, $aa, $0a, $13, $3a
	db $be, $28, $33, $24, $6e, $71, $df, $b0
	db $a8, $00, $e5, $e0, $9a, $fc, $f4, $2c
	db $fe, $4c, $a3, $5e, $c6, $3a, $ab, $4d
	db $a8, $00, $b5, $b0, $de, $e8, $fc, $1c
	db $ba, $66, $f7, $0e, $ba, $5e, $43, $bd

INCLUDE "event/celebi.asm"
INCLUDE "engine/main_menu.asm"
INCLUDE "misc/mobile_menu.asm"
INCLUDE "engine/search.asm"
INCLUDE "misc/mobile_12_2.asm"
; mobile battle selection

AskRememberPassword: ; 4ae12
	call .DoMenu
	ld a, $0
	jr c, .okay
	ld a, $1

.okay
	ld [ScriptVar], a
	ret

.DoMenu: ; 4ae1f
	lb bc, 14, 7
	push bc
	ld hl, YesNoMenuDataHeader
	call CopyMenuDataHeader
	pop bc
	ld a, b
	ld [wMenuBorderLeftCoord], a
	add $5
	ld [wMenuBorderRightCoord], a
	ld a, c
	ld [wMenuBorderTopCoord], a
	add $4
	ld [wMenuBorderBottomCoord], a
	call PushWindow
	call VerticalMenu
	push af
	ld c, 15
	call DelayFrames
	call Buena_ExitMenu
	pop af
	jr c, .refused
	ld a, [wMenuCursorY]
	cp $2
	jr z, .refused
	and a
	ret

.refused
	ld a, $2
	ld [wMenuCursorY], a
	scf
	ret

Buena_ExitMenu: ; 4ae5e
	ld a, [hOAMUpdate]
	push af
	call ExitMenu
	call UpdateSprites
	xor a
	ld [hOAMUpdate], a
	call DelayFrame
	ld a, $1
	ld [hOAMUpdate], a
	call ApplyTilemap
	pop af
	ld [hOAMUpdate], a
	ret

SECTION "bank13", ROMX, BANK[$13]

SwapTextboxPalettes:: ; 4c000
	hlcoord 0, 0
	decoord 0, 0, AttrMap
	ld b, SCREEN_HEIGHT
.loop
	push bc
	ld c, SCREEN_WIDTH
.innerloop
	ld a, [hl]
	push hl
	srl a
	jr c, .UpperNybble
	ld hl, TilesetPalettes
	add [hl]
	ld l, a
	ld a, [TilesetPalettes + 1]
	adc $0
	ld h, a
	ld a, [hl]
	and $f
	jr .next

.UpperNybble:
	ld hl, TilesetPalettes
	add [hl]
	ld l, a
	ld a, [TilesetPalettes + 1]
	adc $0
	ld h, a
	ld a, [hl]
	swap a
	and $f

.next
	pop hl
	ld [de], a
	res 7, [hl]
	inc hl
	inc de
	dec c
	jr nz, .innerloop
	pop bc
	dec b
	jr nz, .loop
	ret

ScrollBGMapPalettes:: ; 4c03f
	ld hl, BGMapBuffer
	ld de, BGMapPalBuffer
.loop
	ld a, [hl]
	push hl
	srl a
	jr c, .UpperNybble

; .LowerNybble
	ld hl, TilesetPalettes
	add [hl]
	ld l, a
	ld a, [TilesetPalettes + 1]
	adc $0
	ld h, a
	ld a, [hl]
	and $f
	jr .next

.UpperNybble:
	ld hl, TilesetPalettes
	add [hl]
	ld l, a
	ld a, [TilesetPalettes + 1]
	adc $0
	ld h, a
	ld a, [hl]
	swap a
	and $f

.next
	pop hl
	ld [de], a
	res 7, [hl]
	inc hl
	inc de
	dec c
	jr nz, .loop
	ret

INCLUDE "tilesets/palette_maps.asm"

TileCollisionTable:: ; 4ce1f
INCLUDE "tilesets/collision.asm"

EmptyAllSRAMBanks: ; 4cf1f
	ld a, $0
	call .EmptyBank
	ld a, $1
	call .EmptyBank
	ld a, $2
	call .EmptyBank
	ld a, $3
	call .EmptyBank
	ret

.EmptyBank: ; 4cf34
	call GetSRAMBank
	ld hl, SRAM_Begin
	ld bc, SRAM_End - SRAM_Begin
	xor a
	call ByteFill
	call CloseSRAM
	ret

SaveMenu_LoadEDTile: ; 4cf45 (13:4f45)
	ld a, [hCGB]
	and a
	jp z, WaitBGMap

; The following is a modified version of LoadEDTile.
	ld a, [hBGMapMode]
	push af
	xor a
	ld [hBGMapMode], a
	ld a, [hMapAnims]
	push af
	xor a
	ld [hMapAnims], a
.WaitLY:
	ld a, [rLY]
	cp $60
	jr c, .WaitLY

	di
	ld a, 1 ; BANK(VBGMap2)
	ld [rVBK], a
	hlcoord 0, 0, AttrMap
	call .LoadEDTile
	ld a, 0 ; BANK(VBGMap0)
	ld [rVBK], a
	hlcoord 0, 0
	call .LoadEDTile
.WaitLY2:
	ld a, [rLY]
	cp $60
	jr c, .WaitLY2
	ei

	pop af
	ld [hMapAnims], a
	pop af
	ld [hBGMapMode], a
	ret

.LoadEDTile: ; 4cf80 (13:4f80)
	ld [hSPBuffer], sp ; $ffd9
	ld sp, hl
	ld a, [hBGMapAddress + 1]
	ld h, a
	ld l, 0
	ld a, SCREEN_HEIGHT
	ld [hTilesPerCycle], a
	ld b, 1 << 1
	ld c, rSTAT % $100

.loop
rept SCREEN_WIDTH / 2
	pop de
.loop\@
	ld a, [$ff00+c]
	and b
	jr nz, .loop\@
	ld [hl], e
	inc l
	ld [hl], d
	inc l
endr

	ld de, $20 - SCREEN_WIDTH
	add hl, de
	ld a, [hTilesPerCycle]
	dec a
	ld [hTilesPerCycle], a
	jr nz, .loop

	ld a, [hSPBuffer]
	ld l, a
	ld a, [hSPBuffer + 1]
	ld h, a
	ld sp, hl
	ret

CheckSave:: ; 4cffe
	ld a, BANK(s1_a008)
	call GetSRAMBank
	ld a, [s1_a008]
	ld b, a
	ld a, [s1_ad0f]
	ld c, a
	call CloseSRAM
	ld a, b
	cp 99
	jr nz, .ok
	ld a, c
	cp " "
	jr nz, .ok
	ld c, $1
	ret

.ok
	ld c, $0
	ret

INCLUDE "engine/map_triggers.asm"

_LoadMapPart:: ; 4d15b
	ld hl, wMisc
	ld a, [wMetatileStandingY]
	and a
	jr z, .top_row
	ld bc, WMISC_WIDTH * 2
	add hl, bc

.top_row
	ld a, [wMetatileStandingX]
	and a
	jr z, .left_column
	inc hl
	inc hl

.left_column
	decoord 0, 0
	ld b, SCREEN_HEIGHT
.loop
	ld c, SCREEN_WIDTH
.loop2
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop2
	ld a, l
	add 4
	ld l, a
	jr nc, .carry
	inc h

.carry
	dec b
	jr nz, .loop
	ret

PhoneRing_LoadEDTile: ; 4d188
	ld a, [hCGB]
	and a
	jp z, WaitBGMap
	ld a, [wSpriteUpdatesEnabled]
	cp $0
	jp z, WaitBGMap

; What follows is a modified version of LoadEDTile.
	ld a, [hBGMapMode]
	push af
	xor a
	ld [hBGMapMode], a
	ld a, [hMapAnims]
	push af
	xor a
	ld [hMapAnims], a
.wait
	ld a, [rLY]
	cp $8f
	jr c, .wait

	di
	ld a, 1 ; BANK(VBGMap2)
	ld [rVBK], a
	hlcoord 0, 0, AttrMap
	call .LoadEDTile
	ld a, 0 ; BANK(VBGMap0)
	ld [rVBK], a
	hlcoord 0, 0
	call .LoadEDTile
.wait2
	ld a, [rLY]
	cp $8f
	jr c, .wait2
	ei

	pop af
	ld [hMapAnims], a
	pop af
	ld [hBGMapMode], a
	ret

.LoadEDTile: ; 4d1cb
	ld [hSPBuffer], sp
	ld sp, hl
	ld a, [hBGMapAddress + 1]
	ld h, a
	ld l, 0
	ld a, SCREEN_HEIGHT
	ld [hTilesPerCycle], a
	ld b, 1 << 1 ; not in v/hblank
	ld c, rSTAT % $100

.loop
rept SCREEN_WIDTH / 2
	pop de
.loop\@
	ld a, [$ff00+c]
	and b
	jr nz, .loop\@
	ld [hl], e
	inc l
	ld [hl], d
	inc l
endr

	ld de, $20 - SCREEN_WIDTH
	add hl, de
	ld a, [hTilesPerCycle]
	dec a
	ld [hTilesPerCycle], a
	jr nz, .loop

	ld a, [hSPBuffer]
	ld l, a
	ld a, [hSPBuffer + 1]
	ld h, a
	ld sp, hl
	ret

Shrink1Pic: ; 4d249
INCBIN "gfx/shrink1.2bpp.lz"

Shrink2Pic: ; 4d2d9
INCBIN "gfx/shrink2.2bpp.lz"

LinkMonStatsScreen: ; 4d319
	ld a, [wMenuCursorY]
	dec a
	ld [CurPartyMon], a
	call LowVolume
	predef StatsScreenInit
	ld a, [CurPartyMon]
	inc a
	ld [wMenuCursorY], a
	call ClearScreen
	call ClearBGPalettes
	call MaxVolume
	callba LoadTradeScreenBorder
	callba Link_WaitBGMap
	callba InitTradeSpeciesList
	callba SetTradeRoomBGPals
	call WaitBGMap2
	ret

Link_WaitBGMap: ; 4d354
	call WaitBGMap
	call WaitBGMap2
	ret

LinkTextbox2: ; 4d35b
	ld h, d
	ld l, e
	push bc
	push hl
	call .PlaceBorder
	pop hl
	pop bc
	ld de, AttrMap - TileMap
	add hl, de
	inc b
	inc b
	inc c
	inc c
	ld a, $7
.row
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	pop bc
	dec b
	jr nz, .row
	ret

.PlaceBorder: ; 4d37e
	push hl
	ld a, $76
	ld [hli], a
	inc a
	call .PlaceRow
	inc a
	ld [hl], a
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
.loop
	push hl
	ld a, "┌"
	ld [hli], a
	ld a, " "
	call .PlaceRow
	ld [hl], "─"
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .loop
	ld a, "┐"
	ld [hli], a
	ld a, "│"
	call .PlaceRow
	ld [hl], "└"
	ret

.PlaceRow: ; 4d3ab
	ld d, c
.row_loop
	ld [hli], a
	dec d
	jr nz, .row_loop
	ret

INCLUDE "engine/delete_save_change_clock.asm"

Tilesets::
INCLUDE "tilesets/tileset_headers.asm"

FlagPredef: ; 4d7c1
; Perform action b on flag c in flag array hl.
; If checking a flag, check flag array d:hl unless d is 0.

; For longer flag arrays, see FlagAction.

	push hl
	push bc

; Divide by 8 to get the byte we want.
	push bc
	srl c
	srl c
	srl c
	ld b, 0
	add hl, bc
	pop bc

; Which bit we want from the byte
	ld a, c
	and 7
	ld c, a

; Shift left until we can mask the bit
	ld a, 1
	jr z, .shifted
.shift
	add a
	dec c
	jr nz, .shift
.shifted
	ld c, a

; What are we doing to this flag?
	dec b
	jr z, .set ; 1
	dec b
	jr z, .check ; 2

.reset
	ld a, c
	cpl
	and [hl]
	ld [hl], a
	jr .done

.set
	ld a, [hl]
	or c
	ld [hl], a
	jr .done

.check
	ld a, d
	cp 0
	jr nz, .farcheck

	ld a, [hl]
	and c
	jr .done

.farcheck
	call GetFarByte
	and c

.done
	pop bc
	pop hl
	ld c, a
	ret

GetTrademonFrontpic: ; 4d7fd
	ld a, [wOTTrademonSpecies]
	ld hl, wOTTrademonDVs
	ld de, VTiles2
	push de
	push af
	predef GetUnownLetter
	pop af
	ld [CurPartySpecies], a
	ld [CurSpecies], a
	call GetBaseData
	pop de
	predef FrontpicPredef
	ret

AnimateTrademonFrontpic: ; 4d81e
	ld a, [wOTTrademonSpecies]
	call IsAPokemon
	ret c
	callba ShowOTTrademonStats
	ld a, [wOTTrademonSpecies]
	ld [CurPartySpecies], a
	ld a, [wOTTrademonDVs]
	ld [TempMonDVs], a
	ld a, [wOTTrademonDVs + 1]
	ld [TempMonDVs + 1], a
	ld b, SCGB_PLAYER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	ld a, %11100100 ; 3,2,1,0
	call DmgToCgbBGPals
	callba TradeAnim_ShowGetmonFrontpic
	ld a, [wOTTrademonSpecies]
	ld [CurPartySpecies], a
	hlcoord 7, 2
	ld d, $0
	ld e, ANIM_MON_TRADE
	predef AnimateFrontpic
	ret

CheckPokerus: ; 4d860
; Return carry if a monster in your party has Pokerus

; Get number of monsters to iterate over
	ld a, [PartyCount]
	and a
	jr z, .NoPokerus
	ld b, a
; Check each monster in the party for Pokerus
	ld hl, PartyMon1PokerusStatus
	ld de, PARTYMON_STRUCT_LENGTH
.Check:
	ld a, [hl]
	and $0f ; only the bottom nybble is used
	jr nz, .HasPokerus
; Next PartyMon
	add hl, de
	dec b
	jr nz, .Check
.NoPokerus:
	and a
	ret
.HasPokerus:
	scf
	ret

Special_CheckForLuckyNumberWinners: ; 4d87a
	xor a
	ld [ScriptVar], a
	ld [wFoundMatchingIDInParty], a
	ld a, [PartyCount]
	and a
	ret z
	ld d, a
	ld hl, PartyMon1ID
	ld bc, PartySpecies
.PartyLoop:
	ld a, [bc]
	inc bc
	cp EGG
	call nz, .CompareLuckyNumberToMonID
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	dec d
	jr nz, .PartyLoop
	ld a, BANK(sBox)
	call GetSRAMBank
	ld a, [sBoxCount]
	and a
	jr z, .SkipOpenBox
	ld d, a
	ld hl, sBoxMon1ID
	ld bc, sBoxSpecies
.OpenBoxLoop:
	ld a, [bc]
	inc bc
	cp EGG
	jr z, .SkipOpenBoxMon
	call .CompareLuckyNumberToMonID
	jr nc, .SkipOpenBoxMon
	ld a, 1
	ld [wFoundMatchingIDInParty], a

.SkipOpenBoxMon:
	push bc
	ld bc, BOXMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	dec d
	jr nz, .OpenBoxLoop

.SkipOpenBox:
	call CloseSRAM
	ld c, $0
.BoxesLoop:
	ld a, [wCurBox]
	and $f
	cp c
	jr z, .SkipBox
	ld hl, .BoxBankAddresses
	ld b, 0
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [hli]
	call GetSRAMBank
	ld a, [hli]
	ld h, [hl]
	ld l, a ; hl now contains the address of the loaded box in SRAM
	ld a, [hl]
	and a
	jr z, .SkipBox ; no mons in this box
	push bc
	ld b, h
	ld c, l
	inc bc
	ld de, sBoxMon1ID - sBox
	add hl, de
	ld d, a
.BoxNLoop:
	ld a, [bc]
	inc bc
	cp EGG
	jr z, .SkipBoxMon

	call .CompareLuckyNumberToMonID ; sets ScriptVar and CurPartySpecies appropriately
	jr nc, .SkipBoxMon
	ld a, 1
	ld [wFoundMatchingIDInParty], a

.SkipBoxMon:
	push bc
	ld bc, BOXMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	dec d
	jr nz, .BoxNLoop
	pop bc

.SkipBox:
	inc c
	ld a, c
	cp NUM_BOXES
	jr c, .BoxesLoop

	call CloseSRAM
	ld a, [ScriptVar]
	and a
	ret z ; found nothing
	callba TrainerRankings_LuckyNumberShow
	ld a, [wFoundMatchingIDInParty]
	and a
	push af
	ld a, [CurPartySpecies]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld hl, .FoundPartymonText
	pop af
	jr z, .print
	ld hl, .FoundBoxmonText

.print
	jp PrintText

.CompareLuckyNumberToMonID: ; 4d939
	push bc
	push de
	push hl
	ld d, h
	ld e, l
	ld hl, Buffer1
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	ld hl, LuckyNumberDigit1Buffer
	ld de, wLuckyIDNumber
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	ld b, 5
	ld c, 0
	ld hl, LuckyNumberDigit5Buffer
	ld de, Buffer5
.loop
	ld a, [de]
	cp [hl]
	jr nz, .done
	dec de
	dec hl
	inc c
	dec b
	jr nz, .loop

.done
	pop hl
	push hl
	ld de, -6
	add hl, de
	ld a, [hl]
	pop hl
	pop de
	push af
	ld a, c
	ld b, 1
	cp 5
	jr z, .okay
	ld b, 2
	cp 3
	jr nc, .okay
	ld b, 3
	cp 2
	jr nz, .nomatch

.okay
	inc b
	ld a, [ScriptVar]
	and a
	jr z, .bettermatch
	cp b
	jr c, .nomatch

.bettermatch
	dec b
	ld a, b
	ld [ScriptVar], a
	pop bc
	ld a, b
	ld [CurPartySpecies], a
	pop bc
	scf
	ret

.nomatch
	pop bc
	pop bc
	and a
	ret

.BoxBankAddresses: ; 4d99f
	dba sBox1
	dba sBox2
	dba sBox3
	dba sBox4
	dba sBox5
	dba sBox6
	dba sBox7
	dba sBox8
	dba sBox9
	dba sBox10
	dba sBox11
	dba sBox12
	dba sBox13
	dba sBox14

.FoundPartymonText: ; 0x4d9c9
	; Congratulations! We have a match with the ID number of @  in your party.
	text_jump UnknownText_0x1c1261
	db "@"

.FoundBoxmonText: ; 0x4d9ce
	; Congratulations! We have a match with the ID number of @  in your PC BOX.
	text_jump UnknownText_0x1c12ae
	db "@"

Special_PrintTodaysLuckyNumber: ; 4d9d3
	ld hl, StringBuffer3
	ld de, wLuckyIDNumber
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	ld a, "@"
	ld [StringBuffer3 + 5], a
	ret

CheckPartyFullAfterContest: ; 4d9e5
	ld a, [wContestMon]
	and a
	jp z, .DidntCatchAnything
	ld [CurPartySpecies], a
	ld [CurSpecies], a
	call GetBaseData
	ld hl, PartyCount
	ld a, [hl]
	cp 6
	jp nc, .TryAddToBox
	inc a
	ld [hl], a
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [wContestMon]
	ld [hli], a
	ld [CurSpecies], a
	ld a, $ff
	ld [hl], a
	ld hl, PartyMon1Species
	ld a, [PartyCount]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, wContestMon
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	ld a, [PartyCount]
	dec a
	ld hl, PartyMonOT
	call SkipNames
	ld d, h
	ld e, l
	ld hl, PlayerName
	call CopyBytes
	ld a, [CurPartySpecies]
	ld [wd265], a
	call GetPokemonName
	ld hl, StringBuffer1
	ld de, wMonOrItemNameBuffer
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	call GiveANickname_YesNo
	jr c, .Party_SkipNickname
	ld a, [PartyCount]
	dec a
	ld [CurPartyMon], a
	xor a
	ld [MonType], a
	ld de, wMonOrItemNameBuffer
	callab InitNickname

.Party_SkipNickname:
	ld a, [PartyCount]
	dec a
	ld hl, PartyMonNicknames
	call SkipNames
	ld d, h
	ld e, l
	ld hl, wMonOrItemNameBuffer
	call CopyBytes
	ld a, [PartyCount]
	dec a
	ld hl, PartyMon1Level
	call GetPartyLocation
	ld a, [hl]
	ld [CurPartyLevel], a
	call SetCaughtData
	ld a, [PartyCount]
	dec a
	ld hl, PartyMon1CaughtLocation
	call GetPartyLocation
	ld a, [hl]
	and $80
	ld b, $13
	or b
	ld [hl], a
	xor a
	ld [wContestMon], a
	and a
	ld [ScriptVar], a
	ret

.TryAddToBox: ; 4daa3
	ld a, BANK(sBoxCount)
	call GetSRAMBank
	ld hl, sBoxCount
	ld a, [hl]
	cp MONS_PER_BOX
	call CloseSRAM
	jr nc, .BoxFull
	xor a
	ld [CurPartyMon], a
	ld hl, wContestMon
	ld de, wBufferMon
	ld bc, BOXMON_STRUCT_LENGTH
	call CopyBytes
	ld hl, PlayerName
	ld de, wBufferMonOT
	ld bc, NAME_LENGTH
	call CopyBytes
	callab InsertPokemonIntoBox
	ld a, [CurPartySpecies]
	ld [wd265], a
	call GetPokemonName
	call GiveANickname_YesNo
	ld hl, StringBuffer1
	jr c, .Box_SkipNickname
	ld a, BOXMON
	ld [MonType], a
	ld de, wMonOrItemNameBuffer
	callab InitNickname
	ld hl, wMonOrItemNameBuffer

.Box_SkipNickname:
	ld a, BANK(sBoxMonNicknames)
	call GetSRAMBank
	ld de, sBoxMonNicknames
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	call CloseSRAM

.BoxFull:
	ld a, BANK(sBoxMon1Level)
	call GetSRAMBank
	ld a, [sBoxMon1Level]
	ld [CurPartyLevel], a
	call CloseSRAM
	call SetBoxMonCaughtData
	ld a, BANK(sBoxMon1CaughtLocation)
	call GetSRAMBank
	ld hl, sBoxMon1CaughtLocation
	ld a, [hl]
	and $80
	ld b, $13
	or b
	ld [hl], a
	call CloseSRAM
	xor a
	ld [wContestMon], a
	ld a, $1
	ld [ScriptVar], a
	ret

.DidntCatchAnything: ; 4db35
	ld a, $2
	ld [ScriptVar], a
	ret

GiveANickname_YesNo: ; 4db3b
	ld hl, TextJump_GiveANickname
	call PrintText
	jp YesNoBox

TextJump_GiveANickname: ; 0x4db44
	; Give a nickname to the @  you received?
	text_jump UnknownText_0x1c12fc
	db "@"

SetCaughtData: ; 4db49
	ld a, [PartyCount]
	dec a
	ld hl, PartyMon1CaughtLevel
	call GetPartyLocation
SetBoxmonOrEggmonCaughtData: ; 4db53
	ld a, [TimeOfDay]
	inc a
	rrca
	rrca
	ld b, a
	ld a, [CurPartyLevel]
	or b
	ld [hli], a
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	cp MAP_POKECENTER_2F
	jr nz, .NotPokeCenter2F
	ld a, b
	cp GROUP_POKECENTER_2F
	jr nz, .NotPokeCenter2F

	ld a, [BackupMapGroup]
	ld b, a
	ld a, [BackupMapNumber]
	ld c, a

.NotPokeCenter2F:
	call GetWorldMapLocation
	ld b, a
	ld a, [PlayerGender]
	rrca
	or b
	ld [hl], a
	ret

SetBoxMonCaughtData: ; 4db83
	ld a, BANK(sBoxMon1CaughtLevel)
	call GetSRAMBank
	ld hl, sBoxMon1CaughtLevel
	call SetBoxmonOrEggmonCaughtData
	call CloseSRAM
	ret

SetGiftBoxMonCaughtData: ; 4db92
	push bc
	ld a, BANK(sBoxMon1CaughtLevel)
	call GetSRAMBank
	ld hl, sBoxMon1CaughtLevel
	pop bc
	call SetGiftMonCaughtData
	call CloseSRAM
	ret

SetGiftPartyMonCaughtData: ; 4dba3
	ld a, [PartyCount]
	dec a
	ld hl, PartyMon1CaughtLevel
	push bc
	call GetPartyLocation
	pop bc
SetGiftMonCaughtData: ; 4dbaf
	xor a
	ld [hli], a
	ld a, $7e
	rrc b
	or b
	ld [hl], a
	ret

SetEggMonCaughtData: ; 4dbb8 (13:5bb8)
	ld a, [CurPartyMon]
	ld hl, PartyMon1CaughtLevel
	call GetPartyLocation
	ld a, [CurPartyLevel]
	push af
	ld a, $1
	ld [CurPartyLevel], a
	call SetBoxmonOrEggmonCaughtData
	pop af
	ld [CurPartyLevel], a
	ret

INCLUDE "engine/search2.asm"
INCLUDE "engine/stats_screen.asm"

CatchTutorial:: ; 4e554
	ld a, [BattleType]
	dec a
	ld c, a
	ld hl, .dw
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

.dw ; 4e564 (13:6564)
	dw .DudeTutorial
	dw .DudeTutorial
	dw .DudeTutorial

.DudeTutorial: ; 4e56a (13:656a)
; Back up your name to your Mom's name.
	ld hl, PlayerName
	ld de, MomsName
	ld bc, NAME_LENGTH
	call CopyBytes
; Copy Dude's name to your name
	ld hl, .Dude
	ld de, PlayerName
	ld bc, NAME_LENGTH
	call CopyBytes

	call .LoadDudeData

	xor a
	ld [hJoyDown], a
	ld [hJoyPressed], a
	ld a, [Options]
	push af
	and $f8
	add $3
	ld [Options], a
	ld hl, .AutoInput
	ld a, BANK(.AutoInput)
	call StartAutoInput
	callab StartBattle
	call StopAutoInput
	pop af

	ld [Options], a
	ld hl, MomsName
	ld de, PlayerName
	ld bc, NAME_LENGTH
	call CopyBytes
	ret

.LoadDudeData: ; 4e5b7 (13:65b7)
	ld hl, wDudeNumItems
	ld [hl], 1
	inc hl
	ld [hl], POTION
	inc hl
	ld [hl], 1
	inc hl
	ld [hl], -1
	ld hl, wDudeNumKeyItems
	ld [hl], 0
	inc hl
	ld [hl], -1
	ld hl, wDudeNumBalls
	ld a, 1
	ld [hli], a
	ld a, POKE_BALL ; 5
	ld [hli], a
	ld [hli], a
	ld [hl], -1
	ret

.Dude: ; 4e5da
	db "DUDE@"

.AutoInput: ; 4e5df
	db NO_INPUT, $ff ; end

INCLUDE "engine/evolution_animation.asm"

InitDisplayForHallOfFame: ; 4e881
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	call DisableLCD
	call LoadStandardFont
	call LoadFontsBattleExtra
	hlbgcoord 0, 0
	ld bc, VBGMap1 - VBGMap0
	ld a, " "
	call ByteFill
	hlcoord 0, 0, AttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	xor a
	call ByteFill
	xor a
	ld [hSCY], a
	ld [hSCX], a
	call EnableLCD
	ld hl, .SavingRecordDontTurnOff
	call PrintText
	call WaitBGMap2
	call SetPalettes
	ret

.SavingRecordDontTurnOff: ; 0x4e8bd
	; SAVING RECORD… DON'T TURN OFF!
	text_jump UnknownText_0x1bd39e
	db "@"

InitDisplayForRedCredits: ; 4e8c2
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	call DisableLCD
	call LoadStandardFont
	call LoadFontsBattleExtra
	hlbgcoord 0, 0
	ld bc, VBGMap1 - VBGMap0
	ld a, " "
	call ByteFill
	hlcoord 0, 0, AttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	xor a
	call ByteFill
	ld hl, wd000 ; UnknBGPals
	ld c, 4 tiles
.load_white_palettes
	ld a, (palred 31 + palgreen 31 + palblue 31) % $100
	ld [hli], a
	ld a, (palred 31 + palgreen 31 + palblue 31) / $100
	ld [hli], a
	dec c
	jr nz, .load_white_palettes
	xor a
	ld [hSCY], a
	ld [hSCX], a
	call EnableLCD
	call WaitBGMap2
	call SetPalettes
	ret

ResetDisplayBetweenHallOfFameMons: ; 4e906
	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a
	ld hl, wDecompressScratch
	ld bc, wScratchAttrMap - wDecompressScratch
	ld a, " "
	call ByteFill
	hlbgcoord 0, 0
	ld de, wDecompressScratch
	ld b, 0
	ld c, 4 tiles
	call Request2bpp
	pop af
	ld [rSVBK], a
	ret

GetMobileOTTrainerClass: ; mobile function
	ld h, b
	ld l, c
	call .GetMobileOTTrainerClass
	ld c, a
	ret

.GetMobileOTTrainerClass: ; 4e930
	ld a, [hli]
	xor [hl]
	ld c, a
	jr z, .skip_male_trainers
	srl c
	srl c
.male_trainer_loop
	srl c
	ld a, c
	cp MaleTrainersEnd - MaleTrainers - 1
	jr nc, .male_trainer_loop
	inc c

.skip_male_trainers
	ld a, [de]
	cp $1
	ld hl, MaleTrainers
	jr nz, .finished

	ld hl, FemaleTrainers
	ld a, c
	and a
	jr z, .finished

.female_trainer_loop
	srl c
	ld a, c
	cp FemaleTrainersEnd - FemaleTrainers - 1
	jr nc, .female_trainer_loop
	inc c

.finished
	ld b, $0
	add hl, bc
	ld a, [hl]
	ret

MaleTrainers: ; 4e95d
	db BURGLAR
	db YOUNGSTER
	db SCHOOLBOY
	db BIRD_KEEPER
	db POKEMANIAC
	db GENTLEMAN
	db BUG_CATCHER
	db FISHER
	db SWIMMERM
	db SAILOR
	db SUPER_NERD
	db GUITARIST
	db HIKER
	db FIREBREATHER
	db BLACKBELT_T
	db PSYCHIC_T
	db CAMPER
	db COOLTRAINERM
	db BOARDER
	db JUGGLER
	db POKEFANM
	db OFFICER
	db SAGE
	db BIKER
	db SCIENTIST
MaleTrainersEnd:

FemaleTrainers: ; 4e976
	db MEDIUM
	db LASS
	db BEAUTY
	db SKIER
	db TEACHER
	db SWIMMERF
	db PICNICKER
	db KIMONO_GIRL
	db POKEFANF
	db COOLTRAINERF
FemaleTrainersEnd:

INCLUDE "battle/sliding_intro.asm"

Mobile_PrintOpponentBattleMessage: ; 4ea0a
	ld a, c
	push af
	call SpeechTextBox
	call MobileTextBorder
	pop af
	dec a
	ld bc, $c
	ld hl, w5_MobileOpponentBattleMessages
	call AddNTimes
	ld de, wMobileOpponentBattleMessage
	ld bc, $c
	ld a, $5 ; BANK(w5_MobileOpponentBattleMessages)
	call FarCopyWRAM

	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a

	ld bc, wMobileOpponentBattleMessage
	decoord 1, 14
	callba PrintEZChatBattleMessage

	pop af
	ld [rSVBK], a

	ld c, 180
	call DelayFrames
	ret

CheckBattleScene: ; 4ea44
; Return carry if battle scene is turned off.

	ld a, 0
	ld hl, wLinkMode
	call GetFarWRAMByte
	cp LINK_MOBILE
	jr z, .mobile

	ld a, [Options]
	bit BATTLE_SCENE, a
	jr nz, .off

	and a
	ret

.mobile
	ld a, [wcd2f]
	and a
	jr nz, .from_wram

	ld a, $4
	call GetSRAMBank
	ld a, [$a60c]
	ld c, a
	call CloseSRAM

	ld a, c
	bit 0, c
	jr z, .off

	and a
	ret

.from_wram
	ld a, $5
	ld hl, w5_dc00
	call GetFarWRAMByte
	bit 0, a
	jr z, .off

	and a
	ret

.off
	scf
	ret

INCLUDE "misc/gbc_only.asm"

INCLUDE "event/poke_seer.asm"

SECTION "bank14", ROMX, BANK[$14]

INCLUDE "engine/party_menu.asm"
INCLUDE "event/poisonstep.asm"
INCLUDE "event/sweet_scent.asm"
INCLUDE "event/squirtbottle.asm"
INCLUDE "event/card_key.asm"
INCLUDE "event/basement_key.asm"
INCLUDE "event/sacred_ash.asm"

CopyPkmnToTempMon: ; 5084a
; gets the BaseData of a Pkmn
; and copys the PkmnStructure to TempMon

	ld a, [CurPartyMon]
	ld e, a
	call GetPkmnSpecies
	ld a, [CurPartySpecies]
	ld [CurSpecies], a
	call GetBaseData

	ld a, [MonType]
	ld hl, PartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	and a
	jr z, .copywholestruct
	ld hl, OTPartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	cp OTPARTYMON
	jr z, .copywholestruct
	ld bc, BOXMON_STRUCT_LENGTH
	callab CopyBoxmonToTempMon
	jr .done

.copywholestruct
	ld a, [CurPartyMon]
	call AddNTimes
	ld de, TempMon
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes

.done
	ret

CalcwBufferMonStats: ; 5088b
	ld bc, wBufferMon
	jr _TempMonStatsCalculation

CalcTempmonStats: ; 50890
	ld bc, TempMon
_TempMonStatsCalculation: ; 50893
	ld hl, MON_LEVEL
	add hl, bc
	ld a, [hl]
	ld [CurPartyLevel], a
	ld hl, MON_MAXHP
	add hl, bc
	ld d, h
	ld e, l
	ld hl, MON_STAT_EXP - 1
	add hl, bc
	push bc
	ld b, $1
	predef CalcPkmnStats
	pop bc
	ld hl, MON_HP
	add hl, bc
	ld d, h
	ld e, l
	ld a, [CurPartySpecies]
	cp EGG
	jr nz, .not_egg
	xor a
	ld [de], a
	inc de
	ld [de], a
	jr .zero_status

.not_egg
	push bc
	ld hl, MON_MAXHP
	add hl, bc
	ld bc, 2
	call CopyBytes
	pop bc

.zero_status
	ld hl, MON_STATUS
	add hl, bc
	xor a
	ld [hli], a
	ld [hl], a
	ret

GetPkmnSpecies: ; 508d5
; [MonType] has the type of the Pkmn
; e = Nr. of Pkmn (i.e. [CurPartyMon])

	ld a, [MonType]
	and a ; PARTYMON
	jr z, .partymon
	cp OTPARTYMON
	jr z, .otpartymon
	cp BOXMON
	jr z, .boxmon
	cp TEMPMON
	jr z, .breedmon
	; WILDMON

.partymon
	ld hl, PartySpecies
	jr .done

.otpartymon
	ld hl, OTPartySpecies
	jr .done

.boxmon
	ld a, BANK(sBoxSpecies)
	call GetSRAMBank
	ld hl, sBoxSpecies
	call .done
	call CloseSRAM
	ret

.breedmon
	ld a, [wBreedMon1Species]
	jr .done2

.done
	ld d, 0
	add hl, de
	ld a, [hl]

.done2
	ld [CurPartySpecies], a
	ret

INCLUDE "text/types.asm"

Function50a28: ; 50a28
; XXX
	ld hl, .Strings
	ld a, [TrainerClass]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, StringBuffer1
.copy
	ld a, [hli]
	ld [de], a
	inc de
	cp "@"
	jr nz, .copy
	ret

.Strings: ; 50a42
; Untranslated trainer class names from Red.
	dw .Youngster
	dw .BugCatcher
	dw .Lass
	dw OTClassName
	dw .JrTrainerM
	dw .JrTrainerF
	dw .Pokemaniac
	dw .SuperNerd
	dw OTClassName
	dw OTClassName
	dw .Burglar
	dw .Engineer
	dw .Jack
	dw OTClassName
	dw .Swimmer
	dw OTClassName
	dw OTClassName
	dw .Beauty
	dw OTClassName
	dw .Rocker
	dw .Juggler
	dw OTClassName
	dw OTClassName
	dw .Blackbelt
	dw OTClassName
	dw .ProfOak
	dw .Chief
	dw .Scientist
	dw OTClassName
	dw .Rocket
	dw .CooltrainerM
	dw .CooltrainerF
	dw OTClassName
	dw OTClassName
	dw OTClassName
	dw OTClassName
	dw OTClassName
	dw OTClassName
	dw OTClassName
	dw OTClassName
	dw OTClassName
	dw OTClassName
	dw OTClassName
	dw OTClassName
	dw OTClassName
	dw OTClassName
	dw OTClassName

.Youngster:    db "たんパン@"
.BugCatcher:   db "むしとり@"
.Lass:         db "ミニスカ@"
.JrTrainerM:   db "ボーイ@"
.JrTrainerF:   db "ガール@"
.Pokemaniac:   db "マニア@"
.SuperNerd:    db "りかけい@"
.Burglar:      db "どろぼう@"
.Engineer:     db "ォヤジ@"
.Jack:         db "ジャック@"
.Swimmer:      db "かいパン@"
.Beauty:       db "おねえさん@"
.Rocker:       db "グループ@"
.Juggler:      db "ジャグラー@"
.Blackbelt:    db "からて@"
.ProfOak:      db "ォーキド@"
.Chief:        db "チーフ@"
.Scientist:    db "けんきゅういん@"
.Rocket:       db "だんいん@"
.CooltrainerM: db "エりート♂@"
.CooltrainerF: db "エりート♀@"

DrawPlayerHP: ; 50b0a
	ld a, $1
	jr DrawHP

DrawEnemyHP: ; 50b0e
	ld a, $2

DrawHP: ; 50b10
	ld [wWhichHPBar], a
	push hl
	push bc
	; box mons have full HP
	ld a, [MonType]
	cp BOXMON
	jr z, .at_least_1_hp

	ld a, [TempMonHP]
	ld b, a
	ld a, [TempMonHP + 1]
	ld c, a

; Any HP?
	or b
	jr nz, .at_least_1_hp

	xor a
	ld c, a
	ld e, a
	ld a, 6
	ld d, a
	jp .fainted

.at_least_1_hp
	ld a, [TempMonMaxHP]
	ld d, a
	ld a, [TempMonMaxHP + 1]
	ld e, a
	ld a, [MonType]
	cp BOXMON
	jr nz, .not_boxmon

	ld b, d
	ld c, e

.not_boxmon
	predef ComputeHPBarPixels
	ld a, 6
	ld d, a
	ld c, a

.fainted
	ld a, c
	pop bc
	ld c, a
	pop hl
	push de
	push hl
	push hl
	call DrawBattleHPBar
	pop hl

; Print HP
	bccoord 1, 1, 0
	add hl, bc
	ld de, TempMonHP
	ld a, [MonType]
	cp BOXMON
	jr nz, .not_boxmon_2
	ld de, TempMonMaxHP
.not_boxmon_2
	lb bc, 2, 3
	call PrintNum

	ld a, "/"
	ld [hli], a

; Print max HP
	ld de, TempMonMaxHP
	lb bc, 2, 3
	call PrintNum
	pop hl
	pop de
	ret

PrintTempMonStats: ; 50b7b
; Print TempMon's stats at hl, with spacing bc.
	push bc
	push hl
	ld de, .StatNames
	call PlaceString
	pop hl
	pop bc
	add hl, bc
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld de, TempMonAttack
	lb bc, 2, 3
	call .PrintStat
	ld de, TempMonDefense
	call .PrintStat
	ld de, TempMonSpclAtk
	call .PrintStat
	ld de, TempMonSpclDef
	call .PrintStat
	ld de, TempMonSpeed
	jp PrintNum

.PrintStat: ; 50bab
	push hl
	call PrintNum
	pop hl
	ld de, SCREEN_WIDTH * 2
	add hl, de
	ret

.StatNames: ; 50bb5
	db   "ATTACK"
	next "DEFENSE"
	next "SPCL.ATK"
	next "SPCL.DEF"
	next "SPEED"
	next "@"

GetGender: ; 50bdd
; Return the gender of a given monster (CurPartyMon/CurOTMon/CurWildMon).
; When calling this function, a should be set to an appropriate MonType value.

; return values:
; a = 1: f = nc|nz; male
; a = 0: f = nc|z;  female
;        f = c:  genderless

; This is determined by comparing the Attack and Speed DVs
; with the species' gender ratio.

; Figure out what type of monster struct we're looking at.

; 0: PartyMon
	ld hl, PartyMon1DVs
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [MonType]
	and a
	jr z, .PartyMon

; 1: OTPartyMon
	ld hl, OTPartyMon1DVs
	dec a
	jr z, .PartyMon

; 2: sBoxMon
	ld hl, sBoxMon1DVs
	ld bc, BOXMON_STRUCT_LENGTH
	dec a
	jr z, .sBoxMon

; 3: Unknown
	ld hl, TempMonDVs
	dec a
	jr z, .DVs

; else: WildMon
	ld hl, EnemyMonDVs
	jr .DVs

; Get our place in the party/box.

.PartyMon:
.sBoxMon
	ld a, [CurPartyMon]
	call AddNTimes

.DVs:

; sBoxMon data is read directly from SRAM.
	ld a, [MonType]
	cp BOXMON
	ld a, 1
	call z, GetSRAMBank

; Attack DV
	ld a, [hli]
	and $f0
	ld b, a
; Speed DV
	ld a, [hl]
	and $f0
	swap a

; Put our DVs together.
	or b
	ld b, a

; Close SRAM if we were dealing with a sBoxMon.
	ld a, [MonType]
	cp BOXMON
	call z, CloseSRAM

; We need the gender ratio to do anything with this.
	push bc
	ld a, [CurPartySpecies]
	dec a
	ld hl, BaseData + BaseGender - CurBaseData
	ld bc, BaseData1 - BaseData
	call AddNTimes
	pop bc

	ld a, BANK(BaseData)
	call GetFarByte

; The higher the ratio, the more likely the monster is to be female.

	cp $ff
	jr z, .Genderless

	and a
	jr z, .Male

	cp $fe
	jr z, .Female

; Values below the ratio are male, and vice versa.
	cp b
	jr c, .Male

.Female:
	xor a
	ret

.Male:
	ld a, 1
	and a
	ret

.Genderless:
	scf
	ret

ListMovePP: ; 50c50
	ld a, [wNumMoves]
	inc a
	ld c, a
	ld a, NUM_MOVES
	sub c
	ld b, a
	push hl
	ld a, [Buffer1]
	ld e, a
	ld d, $0
	ld a, $3e ; P
	call .load_loop
	ld a, b
	and a
	jr z, .skip
	ld c, a
	ld a, "-"
	call .load_loop

.skip
	pop hl
	inc hl
	inc hl
	inc hl
	ld d, h
	ld e, l
	ld hl, TempMonMoves
	ld b, 0
.loop
	ld a, [hli]
	and a
	jr z, .done
	push bc
	push hl
	push de
	ld hl, wMenuCursorY
	ld a, [hl]
	push af
	ld [hl], b
	push hl
	callab GetMaxPPOfMove
	pop hl
	pop af
	ld [hl], a
	pop de
	pop hl
	push hl
	ld bc, TempMonPP - (TempMonMoves + 1)
	add hl, bc
	ld a, [hl]
	and $3f
	ld [StringBuffer1 + 4], a
	ld h, d
	ld l, e
	push hl
	ld de, StringBuffer1 + 4
	lb bc, 1, 2
	call PrintNum
	ld a, "/"
	ld [hli], a
	ld de, wd265
	lb bc, 1, 2
	call PrintNum
	pop hl
	ld a, [Buffer1]
	ld e, a
	ld d, 0
	add hl, de
	ld d, h
	ld e, l
	pop hl
	pop bc
	inc b
	ld a, b
	cp NUM_MOVES
	jr nz, .loop

.done
	ret

.load_loop ; 50cc9
	ld [hli], a
	ld [hld], a
	add hl, de
	dec c
	jr nz, .load_loop
	ret

Function50cd0: ; 50cd0
; XXX
.loop
	ld [hl], $32
	inc hl
	ld [hl], $3e
	dec hl
	add hl, de
	dec c
	jr nz, .loop
	ret

Predef22: ; unreferenced predef
	push hl
	push hl
	ld hl, PartyMonNicknames
	ld a, [CurPartyMon]
	call GetNick
	pop hl
	call PlaceString
	call CopyPkmnToTempMon
	pop hl
	ld a, [CurPartySpecies]
	cp EGG
	jr z, .egg
	push hl
	ld bc, -12
	add hl, bc
	ld b, $0
	call DrawEnemyHP
	pop hl
	ld bc, 5
	add hl, bc
	push de
	call PrintLevel
	pop de

.egg
	ret

PlaceStatusString: ; 50d0a
	push de
	inc de
	inc de
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	or b
	pop de
	jr nz, PlaceNonFaintStatus
	push de
	ld de, FntString
	call CopyStatusString
	pop de
	ld a, $1
	and a
	ret

FntString: ; 50d22
	db "FNT@"

CopyStatusString: ; 50d25
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hl], a
	ret

PlaceNonFaintStatus: ; 50d2e
	push de
	ld a, [de]
	ld de, PsnString
	bit PSN, a
	jr nz, .place
	ld de, BrnString
	bit BRN, a
	jr nz, .place
	ld de, FrzString
	bit FRZ, a
	jr nz, .place
	ld de, ParString
	bit PAR, a
	jr nz, .place
	ld de, SlpString
	and SLP
	jr z, .no_status

.place
	call CopyStatusString
	ld a, $1
	and a

.no_status
	pop de
	ret

SlpString: db "SLP@"
PsnString: db "PSN@"
BrnString: db "BRN@"
FrzString: db "FRZ@"
ParString: db "PAR@"

ListMoves: ; 50d6f
; List moves at hl, spaced every [Buffer1] tiles.
	ld de, wListMoves_MoveIndicesBuffer
	ld b, $0
.moves_loop
	ld a, [de]
	inc de
	and a
	jr z, .no_more_moves
	push de
	push hl
	push hl
	ld [CurSpecies], a
	ld a, MOVE_NAME
	ld [wNamedObjectTypeBuffer], a
	call GetName
	ld de, StringBuffer1
	pop hl
	push bc
	call PlaceString
	pop bc
	ld a, b
	ld [wNumMoves], a
	inc b
	pop hl
	push bc
	ld a, [Buffer1]
	ld c, a
	ld b, 0
	add hl, bc
	pop bc
	pop de
	ld a, b
	cp NUM_MOVES
	jr z, .done
	jr .moves_loop

.no_more_moves
	ld a, b
.nonmove_loop
	push af
	ld [hl], "-"
	ld a, [Buffer1]
	ld c, a
	ld b, 0
	add hl, bc
	pop af
	inc a
	cp NUM_MOVES
	jr nz, .nonmove_loop

.done
	ret

InitList: ; 50db9
	ld a, [wInitListType]

	cp INIT_ENEMYOT_LIST
	jr nz, .check_party_ot_name
	ld hl, OTPartyCount
	ld de, OTPartyMonOT
	ld a, ENEMY_OT_NAME
	jr .done

.check_party_ot_name
	cp INIT_PLAYEROT_LIST
	jr nz, .check_mon_name
	ld hl, PartyCount
	ld de, PartyMonOT
	ld a, PARTY_OT_NAME
	jr .done

.check_mon_name
	cp INIT_MON_LIST
	jr nz, .check_item_name
	ld hl, CurMart
	ld de, PokemonNames
	ld a, PKMN_NAME
	jr .done

.check_item_name
	cp INIT_BAG_ITEM_LIST
	jr nz, .check_ob_item_name
	ld hl, NumItems
	ld de, ItemNames
	ld a, ITEM_NAME
	jr .done

.check_ob_item_name
	ld hl, CurMart
	ld de, ItemNames
	ld a, ITEM_NAME
.done
	ld [wNamedObjectTypeBuffer], a ; d265
	ld a, l
	ld [wListPointer], a
	ld a, h
	ld [wListPointer + 1], a
	ld a, e
	ld [wUnusedD102], a
	ld a, d
	ld [wUnusedD102 + 1], a
	ld bc, ItemAttributes ; ParseEnemyAction, HandleMapTimeAndJoypad, Music_LakeOfRage_Ch3, String_11a7c1 $67c1
	ld a, c
	ld [wItemAttributesPtr], a
	ld a, b
	ld [wItemAttributesPtr + 1], a
	ret

CalcLevel: ; 50e1b
	ld a, [TempMonSpecies]
	ld [CurSpecies], a
	call GetBaseData
	ld d, 1
.next_level
	inc d
	ld a, d
	cp (MAX_LEVEL + 1) % $100
	jr z, .got_level
	call CalcExpAtLevel
	push hl
	ld hl, TempMonExp + 2
	ld a, [hProduct + 3]
	ld c, a
	ld a, [hld]
	sub c
	ld a, [hProduct + 2]
	ld c, a
	ld a, [hld]
	sbc c
	ld a, [hProduct + 1]
	ld c, a
	ld a, [hl]
	sbc c
	pop hl
	jr nc, .next_level

.got_level
	dec d
	ret

CalcExpAtLevel: ; 50e47
; (a/b)*n**3 + c*n**2 + d*n - e
	ld a, [BaseGrowthRate]
	add a
	add a
	ld c, a
	ld b, 0
	ld hl, GrowthRates
	add hl, bc
; Cube the level
	call .LevelSquared
	ld a, d
	ld [hMultiplier], a
	call Multiply

; Multiply by a
	ld a, [hl]
	and $f0
	swap a
	ld [hMultiplier], a
	call Multiply
; Divide by b
	ld a, [hli]
	and $f
	ld [hDivisor], a
	ld b, 4
	call Divide
; Push the cubic term to the stack
	ld a, [hQuotient + 0]
	push af
	ld a, [hQuotient + 1]
	push af
	ld a, [hQuotient + 2]
	push af
; Square the level and multiply by the lower 7 bits of c
	call .LevelSquared
	ld a, [hl]
	and $7f
	ld [hMultiplier], a
	call Multiply
; Push the absolute value of the quadratic term to the stack
	ld a, [hProduct + 1]
	push af
	ld a, [hProduct + 2]
	push af
	ld a, [hProduct + 3]
	push af
	ld a, [hli]
	push af
; Multiply the level by d
	xor a
	ld [hMultiplicand + 0], a
	ld [hMultiplicand + 1], a
	ld a, d
	ld [hMultiplicand + 2], a
	ld a, [hli]
	ld [hMultiplier], a
	call Multiply
; Subtract e
	ld b, [hl]
	ld a, [hProduct + 3]
	sub b
	ld [hMultiplicand + 2], a
	ld b, $0
	ld a, [hProduct + 2]
	sbc b
	ld [hMultiplicand + 1], a
	ld a, [hProduct + 1]
	sbc b
	ld [hMultiplicand], a
; If bit 7 of c is set, c is negative; otherwise, it's positive
	pop af
	and $80
	jr nz, .subtract
; Add c*n**2 to (d*n - e)
	pop bc
	ld a, [hProduct + 3]
	add b
	ld [hMultiplicand + 2], a
	pop bc
	ld a, [hProduct + 2]
	adc b
	ld [hMultiplicand + 1], a
	pop bc
	ld a, [hProduct + 1]
	adc b
	ld [hMultiplicand], a
	jr .done_quadratic

.subtract
; Subtract c*n**2 from (d*n - e)
	pop bc
	ld a, [hProduct + 3]
	sub b
	ld [hMultiplicand + 2], a
	pop bc
	ld a, [hProduct + 2]
	sbc b
	ld [hMultiplicand + 1], a
	pop bc
	ld a, [hProduct + 1]
	sbc b
	ld [hMultiplicand], a

.done_quadratic
; Add (a/b)*n**3 to (d*n - e +/- c*n**2)
	pop bc
	ld a, [hProduct + 3]
	add b
	ld [hMultiplicand + 2], a
	pop bc
	ld a, [hProduct + 2]
	adc b
	ld [hMultiplicand + 1], a
	pop bc
	ld a, [hProduct + 1]
	adc b
	ld [hMultiplicand], a
	ret

.LevelSquared: ; 50eed
	xor a
	ld [hMultiplicand + 0], a
	ld [hMultiplicand + 1], a
	ld a, d
	ld [hMultiplicand + 2], a
	ld [hMultiplier], a
	jp Multiply

GrowthRates: ; 50efa

growth_rate: MACRO
; [1]/[2]*n**3 + [3]*n**2 + [4]*n - [5]
	dn \1, \2
	if \3 & $80 ; signed
		db -\3 | $80
	else
		db \3
	endc
	db \4, \5
ENDM

	growth_rate 1, 1,   0,   0,   0 ; Medium Fast
	growth_rate 3, 4,  10,   0,  30 ; Slightly Fast
	growth_rate 3, 4,  20,   0,  70 ; Slightly Slow
	growth_rate 6, 5, -15, 100, 140 ; Medium Slow
	growth_rate 4, 5,   0,   0,   0 ; Fast
	growth_rate 5, 4,   0,   0,   0 ; Slow

_SwitchPartyMons:
	ld a, [wd0e3]
	dec a
	ld [Buffer3], a
	ld b, a
	ld a, [wMenuCursorY]
	dec a
	ld [Buffer2], a ; wd1eb (aliases: MovementType)
	cp b
	jr z, .skip
	call .SwapMonAndMail
	ld a, [Buffer3]
	call .ClearSprite
	ld a, [Buffer2] ; wd1eb (aliases: MovementType)
	call .ClearSprite
.skip
	ret

.ClearSprite: ; 50f34 (14:4f34)
	push af
	hlcoord 0, 1
	ld bc, 2 * SCREEN_WIDTH
	call AddNTimes
	ld bc, 2 * SCREEN_WIDTH
	ld a, " "
	call ByteFill
	pop af
	ld hl, Sprites
	ld bc, $10
	call AddNTimes
	ld de, $4
	ld c, $4
.gfx_loop
	ld [hl], $a0
	add hl, de
	dec c
	jr nz, .gfx_loop
	ld de, SFX_SWITCH_POKEMON
	call WaitPlaySFX
	ret

.SwapMonAndMail: ; 50f62 (14:4f62)
	push hl
	push de
	push bc
	ld bc, PartySpecies
	ld a, [Buffer2] ; wd1eb (aliases: MovementType)
	ld l, a
	ld h, $0
	add hl, bc
	ld d, h
	ld e, l
	ld a, [Buffer3]
	ld l, a
	ld h, $0
	add hl, bc
	ld a, [hl]
	push af
	ld a, [de]
	ld [hl], a
	pop af
	ld [de], a
	ld a, [Buffer2] ; wd1eb (aliases: MovementType)
	ld hl, PartyMons ; wdcdf (aliases: PartyMon1, PartyMon1Species)
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	push hl
	ld de, wd002
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	ld a, [Buffer3]
	ld hl, PartyMons ; wdcdf (aliases: PartyMon1, PartyMon1Species)
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	pop de
	push hl
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	pop de
	ld hl, wd002
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	ld a, [Buffer2] ; wd1eb (aliases: MovementType)
	ld hl, PartyMonOT
	call SkipNames
	push hl
	call .CopyNameTowd002
	ld a, [Buffer3]
	ld hl, PartyMonOT
	call SkipNames
	pop de
	push hl
	call .CopyName
	pop de
	ld hl, wd002
	call .CopyName
	ld hl, PartyMonNicknames
	ld a, [Buffer2] ; wd1eb (aliases: MovementType)
	call SkipNames
	push hl
	call .CopyNameTowd002
	ld hl, PartyMonNicknames
	ld a, [Buffer3]
	call SkipNames
	pop de
	push hl
	call .CopyName
	pop de
	ld hl, wd002
	call .CopyName
	ld hl, sPartyMail
	ld a, [Buffer2] ; wd1eb (aliases: MovementType)
	ld bc, MAIL_STRUCT_LENGTH
	call AddNTimes
	push hl
	ld de, wd002
	ld bc, MAIL_STRUCT_LENGTH
	ld a, BANK(sPartyMail)
	call GetSRAMBank
	call CopyBytes
	ld hl, sPartyMail
	ld a, [Buffer3]
	ld bc, MAIL_STRUCT_LENGTH
	call AddNTimes
	pop de
	push hl
	ld bc, MAIL_STRUCT_LENGTH
	call CopyBytes
	pop de
	ld hl, wd002
	ld bc, MAIL_STRUCT_LENGTH
	call CopyBytes
	call CloseSRAM
	pop bc
	pop de
	pop hl
	ret

.CopyNameTowd002: ; 51036 (14:5036)
	ld de, wd002

.CopyName: ; 51039 (14:5039)
	ld bc, NAME_LENGTH
	call CopyBytes
	ret

INCLUDE "gfx/load_pics.asm"
INCLUDE "engine/move_mon_wo_mail.asm"
BaseData::
INCLUDE "data/base_stats.asm"

PokemonNames::
INCLUDE "data/pokemon_names.asm"

Unknown_53d84: ; unreferenced
	db $1a, $15
	db $33, $16
	db $4b, $17
	db $62, $18
	db $79, $19
	db $90, $1a
	db $a8, $1b
	db $c4, $1c
	db $e0, $1d
	db $f6, $1e
	db $ff, $1f
	db $ff, $20

UnknownEggPic:: ; 53d9c
; Another egg pic. This is shifted up a few pixels.
INCBIN "gfx/misc/unknown_egg.5x5.2bpp.lz"

SECTION "bank19", ROMX, BANK[$19]

INCLUDE "text/phone/extra.asm"

SECTION "bank20", ROMX, BANK[$20]

INCLUDE "engine/player_movement.asm"

INCLUDE "engine/engine_flags.asm"

INCLUDE "engine/variables.asm"

BattleText::
INCLUDE "text/battle.asm"

INCLUDE "engine/debug.asm"

SECTION "bank21", ROMX, BANK[$21]

INCLUDE "engine/printer.asm"

INCLUDE "battle/anim_gfx.asm"

INCLUDE "event/halloffame.asm"

SECTION "bank22", ROMX, BANK[$22]

INCLUDE "event/kurt.asm"

Function88248: ; 88248
; XXX
	ld c, CAL
	ld a, [PlayerGender]
	bit 0, a
	jr z, .okay
	ld c, KAREN

.okay
	ld a, c
	ld [TrainerClass], a
	ret

MovePlayerPicRight: ; 88258
	hlcoord 6, 4
	ld de, 1
	jr MovePlayerPic

MovePlayerPicLeft: ; 88260
	hlcoord 13, 4
	ld de, -1
	; fallthrough

MovePlayerPic: ; 88266
; Move player pic at hl by de * 7 tiles.
	ld c, $8
.loop
	push bc
	push hl
	push de
	xor a
	ld [hBGMapMode], a
	lb bc, 7, 7
	predef PlaceGraphic
	xor a
	ld [hBGMapThird], a
	call WaitBGMap
	call DelayFrame
	pop de
	pop hl
	add hl, de
	pop bc
	dec c
	ret z
	push hl
	push bc
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	lb bc, 7, 7
	call ClearBox
	pop bc
	pop hl
	jr .loop

ShowPlayerNamingChoices: ; 88297
	ld hl, ChrisNameMenuHeader
	ld a, [PlayerGender]
	bit 0, a
	jr z, .GotGender
	ld hl, KrisNameMenuHeader
.GotGender:
	call LoadMenuDataHeader
	call VerticalMenu
	ld a, [wMenuCursorY]
	dec a
	call CopyNameFromMenu
	call CloseWindow
	ret

ChrisNameMenuHeader: ; 882b5
	db $40 ; flags
	db 00, 00 ; start coords
	db 11, 10 ; end coords
	dw .MaleNames
	db 1 ; ????
	db 0 ; default option

.MaleNames: ; 882be
	db $91 ; flags
	db 5 ; items
	db "NEW NAME@"
MalePlayerNameArray: ; 882c9
	db "CHRIS@"
	db "MAT@"
	db "ALLAN@"
	db "JON@"
	db 2 ; displacement
	db " NAME @" ; title

KrisNameMenuHeader: ; 882e5
	db $40 ; flags
	db 00, 00 ; start coords
	db 11, 10 ; end coords
	dw .FemaleNames
	db 1 ; ????
	db 0 ; default option

.FemaleNames: ; 882ee
	db $91 ; flags
	db 5 ; items
	db "NEW NAME@"
FemalePlayerNameArray: ; 882f9
	db "KRIS@"
	db "AMANDA@"
	db "JUANA@"
	db "JODI@"
	db 2 ; displacement
	db " NAME @" ; title

GetPlayerNameArray: ; 88318 This Function is never called
	ld hl, PlayerName
	ld de, MalePlayerNameArray
	ld a, [PlayerGender]
	bit 0, a
	jr z, .done
	ld de, FemalePlayerNameArray

.done
	call InitName
	ret

GetPlayerIcon: ; 8832c
; Get the player icon corresponding to gender

; Male
	ld de, ChrisSpriteGFX
	ld b, BANK(ChrisSpriteGFX)

	ld a, [PlayerGender]
	bit 0, a
	jr z, .done

; Female
	ld de, KrisSpriteGFX
	ld b, BANK(KrisSpriteGFX)

.done
	ret

GetCardPic: ; 8833e
	ld hl, ChrisCardPic
	ld a, [PlayerGender]
	bit 0, a
	jr z, .GotClass
	ld hl, KrisCardPic
.GotClass:
	ld de, VTiles2 tile $00
	ld bc, $23 tiles
	ld a, BANK(ChrisCardPic) ; BANK(KrisCardPic)
	call FarCopyBytes
	ld hl, CardGFX
	ld de, VTiles2 tile $23
	ld bc, 6 tiles
	ld a, BANK(CardGFX)
	call FarCopyBytes
	ret

ChrisCardPic: ; 88365
INCBIN "gfx/misc/chris_card.5x7.2bpp"

KrisCardPic: ; 88595
INCBIN "gfx/misc/kris_card.5x7.2bpp"

CardGFX: ; 887c5
INCBIN "gfx/misc/trainer_card.2bpp"

GetPlayerBackpic: ; 88825
	ld a, [PlayerGender]
	bit 0, a
	jr z, GetChrisBackpic
	call GetKrisBackpic
	ret

GetChrisBackpic: ; 88830
	ld hl, ChrisBackpic
	ld b, BANK(ChrisBackpic)
	ld de, VTiles2 tile $31
	ld c, 7 * 7
	predef DecompressPredef
	ret

HOF_LoadTrainerFrontpic: ; 88840
	call WaitBGMap
	xor a
	ld [hBGMapMode], a
	ld e, 0
	ld a, [PlayerGender]
	bit 0, a
	jr z, .GotClass
	ld e, 1

.GotClass:
	ld a, e
	ld [TrainerClass], a
	ld de, ChrisPic
	ld a, [PlayerGender]
	bit 0, a
	jr z, .GotPic
	ld de, KrisPic

.GotPic:
	ld hl, VTiles2
	ld b, BANK(ChrisPic) ; BANK(KrisPic)
	ld c, 7 * 7
	call Get2bpp
	call WaitBGMap
	ld a, $1
	ld [hBGMapMode], a
	ret

DrawIntroPlayerPic: ; 88874
; Draw the player pic at (6,4).

; Get class
	ld e, CHRIS
	ld a, [PlayerGender]
	bit 0, a
	jr z, .GotClass
	ld e, KRIS
.GotClass:
	ld a, e
	ld [TrainerClass], a

; Load pic
	ld de, ChrisPic
	ld a, [PlayerGender]
	bit 0, a
	jr z, .GotPic
	ld de, KrisPic
.GotPic:
	ld hl, VTiles2
	ld b, BANK(ChrisPic) ; BANK(KrisPic)
	ld c, 7 * 7 ; dimensions
	call Get2bpp

; Draw
	xor a
	ld [hGraphicStartTile], a
	hlcoord 6, 4
	lb bc, 7, 7
	predef PlaceGraphic
	ret

ChrisPic: ; 888a9
INCBIN "gfx/misc/chris.7x7.2bpp"

KrisPic: ; 88bb9
INCBIN "gfx/misc/kris.7x7.2bpp"

GetKrisBackpic: ; 88ec9
; Kris's backpic is uncompressed.
	ld de, KrisBackpic
	ld hl, VTiles2 tile $31
	lb bc, BANK(KrisBackpic), 7 * 7 ; dimensions
	call Get2bpp
	ret

KrisBackpic: ; 88ed6
INCBIN "gfx/misc/kris_back.6x6.2bpp"

String_89116:
	db "-----@"

INCLUDE "misc/mobile_22.asm"
INCLUDE "event/unown.asm"
INCLUDE "event/buena.asm"
INCLUDE "event/dratini.asm"
INCLUDE "event/battle_tower.asm"
INCLUDE "misc/mobile_22_2.asm"

SECTION "bank23", ROMX, BANK[$23]

Predef35: ; 8c000
Predef36:
	ret

INCLUDE "engine/timeofdaypals.asm"
INCLUDE "engine/battle_start.asm"

Function8c7c9:
; XXX
	ld a, $1
	ld [hBGMapMode], a
	call WaitBGMap
	xor a
	ld [hBGMapMode], a
	ret

INCLUDE "event/field_moves.asm"
INCLUDE "event/magnet_train.asm"

BattleStart_LoadEDTile: ; 8cf4f
	call CGBOnly_LoadEDTile
	ret

INCLUDE "engine/sprites.asm"

INCLUDE "engine/mon_icons.asm"

SECTION "bank24", ROMX, BANK[$24]

INCLUDE "engine/phone.asm"
INCLUDE "engine/timeset.asm"
INCLUDE "engine/pokegear.asm"

INCLUDE "engine/fish.asm"
INCLUDE "engine/slot_machine.asm"

SECTION "Phone Engine", ROMX, BANK[$28]

INCLUDE "engine/more_phone_scripts.asm"
INCLUDE "engine/buena_phone_scripts.asm"

SECTION "Phone Text", ROMX, BANK[$29]

INCLUDE "text/phone/anthony_overworld.asm"
INCLUDE "text/phone/todd_overworld.asm"
INCLUDE "text/phone/gina_overworld.asm"
INCLUDE "text/phone/irwin_overworld.asm"
INCLUDE "text/phone/arnie_overworld.asm"
INCLUDE "text/phone/alan_overworld.asm"
INCLUDE "text/phone/dana_overworld.asm"
INCLUDE "text/phone/chad_overworld.asm"
INCLUDE "text/phone/derek_overworld.asm"
INCLUDE "text/phone/tully_overworld.asm"
INCLUDE "text/phone/brent_overworld.asm"
INCLUDE "text/phone/tiffany_overworld.asm"
INCLUDE "text/phone/vance_overworld.asm"
INCLUDE "text/phone/wilton_overworld.asm"
INCLUDE "text/phone/kenji_overworld.asm"
INCLUDE "text/phone/parry_overworld.asm"
INCLUDE "text/phone/erin_overworld.asm"

SECTION "Tileset Data 5", ROMX, BANK[TILESETS_5]

INCLUDE "tilesets/data_5.asm"

SECTION "bank2E", ROMX, BANK[$2E]

INCLUDE "engine/events_3.asm"

INCLUDE "engine/radio.asm"

INCLUDE "gfx/mail.asm"

SECTION "bank2F", ROMX, BANK[$2F]

INCLUDE "engine/std_scripts.asm"

INCLUDE "engine/phone_scripts.asm"

TalkToTrainerScript:: ; 0xbe66a
	faceplayer
	trainerflagaction CHECK_FLAG
	iftrue AlreadyBeatenTrainerScript
	loadmemtrainer
	encountermusic
	jump StartBattleWithMapTrainerScript

SeenByTrainerScript:: ; 0xbe675
	loadmemtrainer
	encountermusic
	showemote EMOTE_SHOCK, LAST_TALKED, 30
	callasm TrainerWalkToPlayer
	applymovement2 MovementBuffer
	writepersonxy LAST_TALKED
	faceperson PLAYER, LAST_TALKED
	jump StartBattleWithMapTrainerScript

StartBattleWithMapTrainerScript: ; 0xbe68a
	opentext
	trainertext $0
	waitbutton
	closetext
	loadmemtrainer
	startbattle
	reloadmapafterbattle
	trainerflagaction SET_FLAG
	loadvar wRunningTrainerBattleScript, -1

AlreadyBeatenTrainerScript:
	scripttalkafter

SECTION "bank30", ROMX, BANK[$30]

INCLUDE "gfx/overworld/sprites_1.asm"

SECTION "bank31", ROMX, BANK[$31]

INCLUDE "gfx/overworld/sprites_2.asm"

SECTION "bank32", ROMX, BANK[$32]

INCLUDE "battle/bg_effects.asm"

INCLUDE "battle/anims.asm"

LoadPoisonBGPals: ; cbcdd
	call .LoadPals
	ld a, [hCGB]
	and a
	ret nz
	ret ; ????

.LoadPals: ; cbce5
	ld a, [hCGB]
	and a
	jr nz, .cgb
	ld a, [TimeOfDayPal]
	and $3
	cp $3
	ld a, %00000000
	jr z, .convert_pals
	ld a, %10101010

.convert_pals
	call DmgToCgbBGPals
	ld c, 4
	call DelayFrames
	callba _UpdateTimePals
	ret

.cgb
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, BGPals
	ld c, $20
.loop
; RGB 28, 21, 31
	ld a, (palred 28 + palgreen 21 + palblue 31) % $100
	ld [hli], a
	ld a, (palred 28 + palgreen 21 + palblue 31) / $100
	ld [hli], a
	dec c
	jr nz, .loop
	pop af
	ld [rSVBK], a
	ld a, $1
	ld [hCGBPalUpdate], a
	ld c, 4
	call DelayFrames
	callba _UpdateTimePals
	ret

TheEndGFX:: ; cbd2e
INCBIN "gfx/credits/theend.2bpp"

SECTION "bank33", ROMX, BANK[$33]

DisplayCaughtContestMonStats: ; cc000

	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	call LoadFontsBattleExtra

	ld hl, Options
	ld a, [hl]
	push af
	set 4, [hl]

	hlcoord 0, 0
	ld b, 4
	ld c, 13
	call TextBox

	hlcoord 0, 6
	ld b, 4
	ld c, 13
	call TextBox

	hlcoord 2, 0
	ld de, .Stock
	call PlaceString

	hlcoord 2, 6
	ld de, .This
	call PlaceString

	hlcoord 5, 4
	ld de, .Health
	call PlaceString

	hlcoord 5, 10
	ld de, .Health
	call PlaceString

	ld a, [wContestMon]
	ld [wd265], a
	call GetPokemonName
	ld de, StringBuffer1
	hlcoord 1, 2
	call PlaceString

	ld h, b
	ld l, c
	ld a, [wContestMonLevel]
	ld [TempMonLevel], a
	call PrintLevel

	ld de, EnemyMonNick
	hlcoord 1, 8
	call PlaceString

	ld h, b
	ld l, c
	ld a, [EnemyMonLevel]
	ld [TempMonLevel], a
	call PrintLevel

	hlcoord 11, 4
	ld de, wContestMonMaxHP
	lb bc, 2, 3
	call PrintNum

	hlcoord 11, 10
	ld de, EnemyMonMaxHP
	call PrintNum

	ld hl, SwitchMonText
	call PrintText

	pop af
	ld [Options], a

	call WaitBGMap
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call SetPalettes
	ret

.Health:
	db "HEALTH@"
.Stock:
	db " STOCK ", $4a, " @"
.This:
	db " THIS ", $4a, "  @"

SwitchMonText: ; cc0c2
	; Switch #MON?
	text_jump UnknownText_0x1c10cf
	db "@"

DisplayAlreadyCaughtText: ; cc0c7
	call GetPokemonName
	ld hl, .AlreadyCaughtText
	jp PrintText

.AlreadyCaughtText: ; 0xcc0d0
	; You already caught a @ .
	text_jump UnknownText_0x1c10dd
	db "@"

Predef2F:
Predef38:
Predef39: ; cc0d5
	ret

INCLUDE "battle/anim_commands.asm"

INCLUDE "battle/anim_objects.asm"

SECTION "Pic Animations 1", ROMX, BANK[$34]

INCLUDE "gfx/pics/animation.asm"

; Pic animations are assembled in 3 parts:

; Top-level animations:
; 	frame #, duration: Frame 0 is the original pic (no change)
;	setrepeat #:       Sets the number of times to repeat
; 	dorepeat #:        Repeats from command # (starting from 0)
; 	end

; Bitmasks:
;	Layered over the pic to designate affected tiles

; Frame definitions:
;	first byte is the bitmask used for this frame
;	following bytes are tile ids mapped to each bit in the mask

; Main animations (played everywhere)
INCLUDE "gfx/pics/anim_pointers.asm"
INCLUDE "gfx/pics/anims.asm"

; Extra animations, appended to the main animation
; Used in the status screen (blinking, tail wags etc.)
INCLUDE "gfx/pics/extra_pointers.asm"
INCLUDE "gfx/pics/extras.asm"

; Unown has its own animation data despite having an entry in the main tables
INCLUDE "gfx/pics/unown_anim_pointers.asm"
INCLUDE "gfx/pics/unown_anims.asm"
INCLUDE "gfx/pics/unown_extra_pointers.asm"
INCLUDE "gfx/pics/unown_extras.asm"

; Bitmasks
INCLUDE "gfx/pics/bitmask_pointers.asm"
INCLUDE "gfx/pics/bitmasks.asm"
INCLUDE "gfx/pics/unown_bitmask_pointers.asm"
INCLUDE "gfx/pics/unown_bitmasks.asm"

SECTION "Pic Animations 2", ROMX, BANK[$35]

INCLUDE "gfx/pics/frame_pointers.asm"
INCLUDE "gfx/pics/kanto_frames.asm"

SECTION "bank36", ROMX, BANK[$36]

FontInversed: INCBIN "gfx/misc/font_inversed.1bpp"

SECTION "Pic Animations 3", ROMX, BANK[$36]

INCLUDE "gfx/pics/johto_frames.asm"
INCLUDE "gfx/pics/unown_frame_pointers.asm"
INCLUDE "gfx/pics/unown_frames.asm"

SECTION "Tileset Data 6", ROMX, BANK[TILESETS_6]

INCLUDE "tilesets/data_6.asm"

SECTION "bank38", ROMX, BANK[$38]

RotateUnownFrontpic: ; e0000
; something to do with Unown printer
	push de
	xor a
	call GetSRAMBank
	ld hl, sScratch
	ld bc, 0
.loop
	push bc
	push hl
	push bc
	ld de, wd002
	call .Copy
	call .Rotate
	ld hl, UnownPrinter_OverworldMapRectangle
	pop bc
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld hl, wd012
	call .Copy
	pop hl
	ld bc, $10
	add hl, bc
	pop bc
	inc c
	ld a, c
	cp 7 * 7
	jr c, .loop

	ld hl, OverworldMap
	ld de, sScratch
	ld bc, 7 * 7 tiles
	call CopyBytes
	pop hl
	ld de, sScratch
	ld c, 7 * 7
	ld a, [hROMBank]
	ld b, a
	call Get2bpp
	call CloseSRAM
	ret

.Copy: ; e004e
	ld c, $10
.loop_copy
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop_copy
	ret

.Rotate: ; e0057
	ld hl, wd012
	ld e, %10000000
	ld d, 8
.loop_decompress
	push hl
	ld hl, wd002
	call .CountSetBit
	pop hl
	ld a, b
	ld [hli], a
	push hl
	ld hl, wd003
	call .CountSetBit
	pop hl
	ld a, b
	ld [hli], a
	srl e
	dec d
	jr nz, .loop_decompress
	ret

.CountSetBit: ; e0078
	ld b, 0
	ld c, 8
.loop_count
	ld a, [hli]
	and e
	jr z, .clear
	scf
	jr .apply

.clear
	and a

.apply
	rr b
	inc hl
	dec c
	jr nz, .loop_count
	ret

overworldmaprect: MACRO
y = 0
rept \1
x = \1 * (\2 +- 1) + y
rept \2
	dw OverworldMap tile x
x = x +- \2
endr
y = y + 1
endr
endm

UnownPrinter_OverworldMapRectangle: ; e008b
	overworldmaprect 7, 7

Unknown_e00ed:
; Graphics for an unused Game Corner
; game were meant to be here.

ret_e00ed: ; e00ed (38:40ed)
; How many coins?
	ret

INCLUDE "engine/card_flip.asm"
INCLUDE "engine/unown_puzzle.asm"
INCLUDE "engine/dummy_game.asm"
INCLUDE "engine/billspc.asm"

SECTION "bank39", ROMX, BANK[$39]

CopyrightGFX:: ; e4000
INCBIN "gfx/misc/copyright.2bpp"

INCLUDE "engine/options_menu.asm"
INCLUDE "engine/crystal_intro.asm"

SECTION "bank3E", ROMX, BANK[$3E]

INCLUDE "gfx/font.asm"
INCLUDE "engine/time_capsule/conversion.asm"
INCLUDE "engine/unowndex.asm"
INCLUDE "event/magikarp.asm"

INCLUDE "battle/hidden_power.asm"

INCLUDE "battle/misc.asm"

SECTION "bank3F", ROMX, BANK[$3F]

INCLUDE "tilesets/animations.asm"

INCLUDE "engine/npctrade.asm"

INCLUDE "event/mom_phone.asm"

SECTION "bank40", ROMX, BANK[$40]

INCLUDE "misc/mobile_40.asm"

SECTION "bank41", ROMX, BANK[$41]

INCLUDE "misc/gfx_41.asm"

INCLUDE "engine/warp_connection.asm"

INCLUDE "engine/mysterygift.asm"

INCLUDE "battle/used_move_text.asm"

INCLUDE "misc/mobile_41.asm"

SECTION "bank42", ROMX, BANK[$42]

INCLUDE "misc/mobile_42.asm"

SECTION "Intro Logo", ROMX, BANK[$42]

IntroLogoGFX: ; 109407
INCBIN "gfx/intro/logo.2bpp.lz"

INCLUDE "misc/unused_title.asm"

INCLUDE "engine/title.asm"

INCLUDE "misc/mobile_45.asm"
INCLUDE "misc/mobile_46.asm"

SECTION "bank47", ROMX, BANK[$47]

INCLUDE "misc/battle_tower_47.asm"

SECTION "bank5B", ROMX, BANK[$5B]

INCLUDE "misc/mobile_5b.asm"
INCLUDE "engine/link_trade.asm"

SECTION "bank5C", ROMX, BANK[$5C]

INCLUDE "misc/mobile_5c.asm"

SECTION "bank5D", ROMX, BANK[$5D]

INCLUDE "text/phone/extra3.asm"

SECTION "bank5E", ROMX, BANK[$5E]

_UpdateBattleHUDs:
	callba DrawPlayerHUD
	ld hl, PlayerHPPal
	call SetHPPal
	callba DrawEnemyHUD
	ld hl, EnemyHPPal
	call SetHPPal
	callba FinishBattleAnim
	ret

INCLUDE "misc/mobile_5f.asm"

SECTION "Common Text 1", ROMX, BANK[$6C]

INCLUDE "text/stdtext.asm"
INCLUDE "text/phone/jack_overworld.asm"
INCLUDE "text/phone/beverly_overworld.asm"
INCLUDE "text/phone/huey_overworld.asm"
INCLUDE "text/phone/gaven_overworld.asm"
INCLUDE "text/phone/beth_overworld.asm"
INCLUDE "text/phone/jose_overworld.asm"
INCLUDE "text/phone/reena_overworld.asm"
INCLUDE "text/phone/joey_overworld.asm"
INCLUDE "text/phone/wade_overworld.asm"
INCLUDE "text/phone/ralph_overworld.asm"
INCLUDE "text/phone/liz_overworld.asm"

SECTION "bank6D", ROMX, BANK[$6D]

INCLUDE "text/phone/mom.asm"
INCLUDE "text/phone/bill.asm"
INCLUDE "text/phone/elm.asm"
INCLUDE "text/phone/trainers1.asm"

SECTION "bank72", ROMX, BANK[$72]

ItemNames::
INCLUDE "items/item_names.asm"

INCLUDE "items/item_descriptions.asm"

MoveNames::
INCLUDE "battle/move_names.asm"

INCLUDE "engine/landmarks.asm"

SECTION "bank77", ROMX, BANK[$77]

UnownFont: ; 1dc000
INCBIN "gfx/misc/unown_font.2bpp"

INCLUDE "misc/printer_77.asm"

MobileHPIcon: ; 1dc591
INCBIN "gfx/mobile/hp.1bpp"

MobileLvIcon: ; 1dc599
INCBIN "gfx/mobile/lv.1bpp"

SECTION "Tileset Data 7", ROMX, BANK[TILESETS_7]

INCLUDE "tilesets/data_7.asm"

SECTION "bank77_2", ROMX, BANK[$77]

Function1dd6a9: ; 1dd6a9
; XXX
	ld a, b
	ld b, c
	ld c, a
	push bc
	push de
	ld hl, [sp+$2]
	ld d, h
	ld e, l
	pop hl
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	pop bc
	ret

PrintHoursMins ; 1dd6bb (77:56bb)
; Hours in b, minutes in c
	ld a, b
	cp 12
	push af
	jr c, .AM
	jr z, .PM
	sub 12
	jr .PM
.AM:
	or a
	jr nz, .PM
	ld a, 12
.PM:
	ld b, a
; Crazy stuff happening with the stack
	push bc
	ld hl, [sp+$1]
	push de
	push hl
	pop de
	pop hl
	ld [hl], " "
	lb bc, 1, 2
	call PrintNum
	ld [hl], ":"
	inc hl
	ld d, h
	ld e, l
	ld hl, [sp+$0]
	push de
	push hl
	pop de
	pop hl
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	pop bc
	ld de, String_AM
	pop af
	jr c, .place_am_pm
	ld de, String_PM
.place_am_pm
	inc hl
	call PlaceString
	ret

String_AM: db "AM@" ; 1dd6fc
String_PM: db "PM@" ; 1dd6ff

INCLUDE "engine/diploma.asm"

LoadSGBPokedexGFX: ; 1ddf1c
	ld hl, SGBPokedexGFX_LZ
	ld de, VTiles2 tile $31
	call Decompress
	ret

LoadSGBPokedexGFX2: ; 1ddf26 (77:5f26)
	ld hl, SGBPokedexGFX_LZ
	ld de, VTiles2 tile $31
	lb bc, BANK(SGBPokedexGFX_LZ), $3a
	call DecompressRequest2bpp
	ret

SGBPokedexGFX_LZ: ; 1ddf33
INCBIN "gfx/pokedex/sgb.2bpp.lz"

LoadQuestionMarkPic: ; 1de0d7
	ld hl, .QuestionMarkLZ
	ld de, sScratch
	call Decompress
	ret

.QuestionMarkLZ: ; 1de0e1
INCBIN "gfx/pics/questionmark/front.2bpp.lz"

DrawPokedexListWindow: ; 1de171 (77:6171)
	ld a, $32
	hlcoord 0, 17
	ld bc, 12
	call ByteFill
	hlcoord 0, 1
	lb bc, 15, 11
	call ClearBox
	ld a, $34
	hlcoord 0, 0
	ld bc, 11
	call ByteFill
	ld a, $39
	hlcoord 0, 16
	ld bc, 11
	call ByteFill
	hlcoord 5, 0
	ld [hl], $3f
	hlcoord 5, 16
	ld [hl], $40
	ld a, [wCurrentDexMode]
	cp DEXMODE_OLD
	jr z, .OldMode
; scroll bar
	hlcoord 11, 0
	ld [hl], $50
	ld a, $51
	hlcoord 11, 1
	ld b, SCREEN_HEIGHT - 3
	call Bank77_FillColumn
	ld [hl], $52
	jr .Done

.OldMode:
; no scroll bar
	hlcoord 11, 0
	ld [hl], $66
	ld a, $67
	hlcoord 11, 1
	ld b, SCREEN_HEIGHT - 3
	call Bank77_FillColumn
	ld [hl], $68
.Done:
	ret

DrawPokedexSearchResultsWindow: ; 1de1d1 (77:61d1)
	ld a, $34
	hlcoord 0, 0
	ld bc, 11
	call ByteFill
	ld a, $39
	hlcoord 0, 10
	ld bc, 11
	call ByteFill
	hlcoord 5, 0
	ld [hl], $3f
	hlcoord 5, 10
	ld [hl], $40
	hlcoord 11, 0
	ld [hl], $66
	ld a, $67
	hlcoord 11, 1
	ld b, SCREEN_HEIGHT / 2
	call Bank77_FillColumn
	ld [hl], $68
	ld a, $34
	hlcoord 0, 11
	ld bc, 11
	call ByteFill
	ld a, $39
	hlcoord 0, 17
	ld bc, 11
	call ByteFill
	hlcoord 11, 11
	ld [hl], $66
	ld a, $67
	hlcoord 11, 12
	ld b, 5
	call Bank77_FillColumn
	ld [hl], $68
	hlcoord 0, 12
	lb bc, 5, 11
	call ClearBox
	ld de, .esults_D
	hlcoord 0, 12
	call PlaceString
	ret

.esults_D ; 1de23c
; (SEARCH R)
	db   "ESULTS"
	next ""
; (### FOUN)
	next "D!@"

DrawDexEntryScreenRightEdge: ; 1de247
	ld a, [hBGMapAddress]
	ld l, a
	ld a, [hBGMapAddress + 1]
	ld h, a
	push hl
	inc hl
	ld a, l
	ld [hBGMapAddress], a
	ld a, h
	ld [hBGMapAddress + 1], a
	hlcoord 19, 0
	ld [hl], $66
	hlcoord 19, 1
	ld a, $67
	ld b, 15
	call Bank77_FillColumn
	ld [hl], $68
	hlcoord 19, 17
	ld [hl], $3c
	xor a
	ld b, SCREEN_HEIGHT
	hlcoord 19, 0, AttrMap
	call Bank77_FillColumn
	call WaitBGMap2
	pop hl
	ld a, l
	ld [hBGMapAddress], a
	ld a, h
	ld [hBGMapAddress + 1], a
	ret

Bank77_FillColumn: ; 1de27f
	push de
	ld de, SCREEN_WIDTH
.loop
	ld [hl], a
	add hl, de
	dec b
	jr nz, .loop
	pop de
	ret

_DudeAutoInput_A:: ; 1de28a
	ld hl, DudeAutoInput_A
	jr _DudeAutoInput

_DudeAutoInput_RightA: ; 1de28f
	ld hl, DudeAutoInput_RightA
	jr _DudeAutoInput

_DudeAutoInput_DownA: ; 1de294
	ld hl, DudeAutoInput_DownA
	jr _DudeAutoInput

_DudeAutoInput: ; 1de299
	ld a, BANK(DudeAutoInputs)
	call StartAutoInput
	ret

DudeAutoInputs:

DudeAutoInput_A: ; 1de29f
	db NO_INPUT, $50
	db A_BUTTON, $00
	db NO_INPUT, $ff ; end

DudeAutoInput_RightA: ; 1de2a5
	db NO_INPUT, $08
	db D_RIGHT,  $00
	db NO_INPUT, $08
	db A_BUTTON, $00
	db NO_INPUT, $ff ; end

DudeAutoInput_DownA: ; 1de2af
	db NO_INPUT, $fe
	db NO_INPUT, $fe
	db NO_INPUT, $fe
	db NO_INPUT, $fe
	db D_DOWN,   $00
	db NO_INPUT, $fe
	db NO_INPUT, $fe
	db NO_INPUT, $fe
	db NO_INPUT, $fe
	db A_BUTTON, $00
	db NO_INPUT, $ff ; end

TownMap_ConvertLineBreakCharacters: ; 1de2c5
	ld hl, StringBuffer1
.loop
	ld a, [hl]
	cp "@"
	jr z, .end
	cp "%"
	jr z, .line_break
	cp "¯"
	jr z, .line_break
	inc hl
	jr .loop

.line_break
	ld [hl], "<LNBRK>"

.end
	ld de, StringBuffer1
	hlcoord 9, 0
	call PlaceString
	ret

PokegearGFX: ; 1de2e4
INCBIN "gfx/misc/pokegear.2bpp.lz"

IsMailEuropean: ; 1de5c8
; return 1 if French
; return 2 if German
; return 3 if Italian
; return 4 if Spanish
; return 0 if none of the above
	ld c, $0
	ld hl, sPartyMon1MailAuthorNationality - sPartyMon1Mail
	add hl, de
	ld a, [hli]
	cp "E"
	ret nz
	ld a, [hli]
	inc c
	cp "F"
	ret z
	inc c
	cp "G"
	ret z
	inc c
	cp "I"
	ret z
	inc c
	cp "S"
	ret z
	ld c, $0
	ret

; The regular font.
StandardEnglishFont: ; 1de5e6
INCBIN "gfx/font/english.1bpp"

; An extended font.
FrenchGermanFont: ; 1de9e6
INCBIN "gfx/font/french_german.1bpp"

; An even more extended font.
SpanishItalianFont: ; 1dede6
INCBIN "gfx/font/spanish_italian.1bpp"

HandleFrenchGermanMail: ; 1df1e6
; called if mail is french or german
; fix 's 't 'v
	ld b, sPartyMon1MailAuthor - sPartyMon1Mail
	ld h, d
	ld l, e
.loop
	ld a, [hl]
	cp $dc ; 's in french/german font
	jr nz, .check_intermediate_chars
	ld a, "'s"
	jr .replace

.check_intermediate_chars
	sub "'s"
	jr c, .dont_replace
	cp "'v" - "'s" + 1
	jr nc, .dont_replace
	add $cd

.replace
	ld [hl], a

.dont_replace
	inc hl
	dec b
	jr nz, .loop
	ret

LireLeCourrierAnglais:
DeutenEnglischenPost: ; 1df203
; Cette fonction convertit certains des caractères anglais pour
; leur équivalent dans le jeu de caractères français.
; Diese Funktion wandelt bestimmte englische Zeichen, um ihre
; Entsprechung in der Deutschen-Zeichensatz.
	ld b, sPartyMon1MailAuthor - sPartyMon1Mail
	ld h, d
	ld l, e
.loop
	ld a, [hl]
	cp "'s"
	jr nz, .check_intermediate_chars
	ld a, $dc
	jr .replace

.check_intermediate_chars
	sub $cd
	jr c, .dont_replace
	cp "'v" - "'s" + 1
	jr nc, .dont_replace
	add "'s"

.replace
	ld [hl], a

.dont_replace
	inc hl
	dec b
	jr nz, .loop
	ret

HandleSpanishItalianMail: ; 1df220
LeerCorreosIngleses:
LeggiPostaInglese:
; This function converts certain characters between
; the English and Spanish/Italian character sets.
; Esta función convierte ciertos caracteres entre
; el juego de caracteres Inglés y Español.
; Questa funzione converte alcuni caratteri tra
; l'inglese e il set di caratteri italiani.
	ld b, sPartyMon1MailAuthor - sPartyMon1Mail
	ld h, d
	ld l, e
.loop
	ld a, [hl]
	and $f0
	cp $d0
	jr nz, .dont_replace
	ld a, [hl]
	add $8
	and $f
	or $d0
	ld [hl], a

.dont_replace
	inc hl
	dec b
	jr nz, .loop
	ret

SECTION "Tileset Data 8", ROMX, BANK[TILESETS_8]

INCLUDE "tilesets/data_8.asm"

SECTION "bank7B", ROMX, BANK[$7B]

INCLUDE "text/battle_tower.asm"

SECTION "bank7C", ROMX, BANK[$7C]

INCLUDE "data/battle_tower_2.asm"

SECTION "bank7D", ROMX, BANK[$7D]

	db $cc, $6b, $1e ; XXX

Function1f4003: ; 1f4003
; XXX
	ld a, $6
	call GetSRAMBank
	ld hl, .unknown_data
	ld de, $a000
	ld bc, $1000
	call CopyBytes
	call CloseSRAM
	ret

.unknown_data
INCBIN "unknown/1f4018.bin"

Function1f4dbe: ; 1f4dbe
; XXX
	ld a, $6
	call GetSRAMBank
	ld hl, .unknown_data
	ld de, $a000
	ld bc, $1000
	call CopyBytes
	call CloseSRAM
	ret

.unknown_data
INCBIN "unknown/1f4dd3.bin"

Function1f5d9f: ; 1f5d9f
	ld a, $6
	call GetSRAMBank
	ld hl, .unknown_data
	ld de, $a000
	ld bc, $1000
	call CopyBytes
	call CloseSRAM
	ret

.unknown_data
INCBIN "unknown/1f5db4.bin"

SECTION "bank7E", ROMX, BANK[$7E]

INCLUDE "data/battle_tower.asm"
INCLUDE "data/odd_eggs.asm"

SECTION "bank7F", ROMX, BANK[$7F]

SECTION "stadium2", ROMX[$8000-$220], BANK[$7F]

IF DEF(CRYSTAL11)
INCBIN "misc/stadium2_2.bin"
ELSE
INCBIN "misc/stadium2_1.bin"
ENDC
