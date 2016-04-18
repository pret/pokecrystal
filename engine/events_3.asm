ReturnFromMapSetupScript:: ; b8000
	xor a
	ld [hBGMapMode], a
	; For some reson, GameFreak chose to use a callba here instead of just falling through.
	; No other function in the game references the function at 2E:400A, here labeled
	; ReturnFromMapSetupScript.inefficientcallba.
	callba .inefficientcallba ; this is a waste of 6 ROM bytes and 6 stack bytes
	ret
; b800a

.inefficientcallba ; b800a
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	call GetWorldMapLocation
	ld [wCurrentLandmark], a
	call .CheckNationalParkGate
	jr z, .nationalparkgate

	call GetMapPermission
	cp GATE
	jr nz, .not_gate

.nationalparkgate
	ld a, -1
	ld [wCurrentLandmark], a

.not_gate
	ld hl, wEnteredMapFromContinue
	bit 1, [hl]
	res 1, [hl]
	jr nz, .dont_do_map_sign

	call .CheckMovingWithinLandmark
	jr z, .dont_do_map_sign
	ld a, [wCurrentLandmark]
	ld [wPreviousLandmark], a

	call .CheckSpecialMap
	jr z, .dont_do_map_sign

; Display for 60 frames
	ld a, 60
	ld [wLandmarkSignTimer], a
	call LoadMapNameSignGFX
	call InitMapNameFrame
	callba Function104303
	ret

.dont_do_map_sign
	ld a, [wCurrentLandmark]
	ld [wPreviousLandmark], a
	ld a, $90
	ld [rWY], a
	ld [hWY], a
	xor a
	ld [hFFC6], a
	ret
; b8064

.CheckMovingWithinLandmark: ; b8064
	ld a, [wCurrentLandmark]
	ld c, a
	ld a, [wPreviousLandmark]
	cp c
	ret z
	cp $0
	ret
; b8070

.CheckSpecialMap: ; b8070
	cp -1
	ret z
	cp SPECIAL_MAP
	ret z
	cp RADIO_TOWER
	ret z
	cp LAV_RADIO_TOWER
	ret z
	cp UNDERGROUND
	ret z
	cp INDIGO_PLATEAU
	ret z
	cp POWER_PLANT
	ret z
	ld a, $1
	and a
	ret
; b8089

.CheckNationalParkGate: ; b8089
	ld a, [MapGroup]
	cp GROUP_ROUTE_35_NATIONAL_PARK_GATE
	ret nz
	ld a, [MapNumber]
	cp MAP_ROUTE_35_NATIONAL_PARK_GATE
	ret z
	cp MAP_ROUTE_36_NATIONAL_PARK_GATE
	ret
; b8098


PlaceMapNameSign:: ; b8098 (2e:4098)
	ld hl, wLandmarkSignTimer
	ld a, [hl]
	and a
	jr z, .disappear
	dec [hl]
	cp 60
	ret z
	cp 59
	jr nz, .skip2
	call InitMapNameFrame
	call PlaceMapNameCenterAlign
	callba Function104303
.skip2
	ld a, $80
	ld a, $70
	ld [rWY], a
	ld [hWY], a
	ret

.disappear
	ld a, $90
	ld [rWY], a
	ld [hWY], a
	xor a
	ld [hFFC6], a
	ret


LoadMapNameSignGFX: ; b80c6
	ld de, MapEntryFrameGFX
	ld hl, VTiles2 tile $60
	lb bc, BANK(MapEntryFrameGFX), $e
	call Get2bpp
	ret
; b80d3

InitMapNameFrame: ; b80d3
	hlcoord 0, 0
	ld b, 2
	ld c, 18
	call InitMapSignAttrMap
	call PlaceMapNameFrame
	ret
; b80e1


PlaceMapNameCenterAlign: ; b80e1 (2e:40e1)
	ld a, [wCurrentLandmark]
	ld e, a
	callba GetLandmarkName
	call .GetNameLength
	ld a, SCREEN_WIDTH
	sub c
	srl a
	ld b, $0
	ld c, a
	hlcoord 0, 2
	add hl, bc
	ld de, StringBuffer1
	call PlaceString
	ret

.GetNameLength: ; b8101 (2e:4101)
	ld c, 0
	push hl
	ld hl, StringBuffer1
.loop
	ld a, [hli]
	cp "@"
	jr z, .stop
	cp "%"
	jr z, .loop
	inc c
	jr .loop
.stop
	pop hl
	ret


InitMapSignAttrMap: ; b8115
	ld de, AttrMap - TileMap
	add hl, de
rept 2
	inc b
endr
rept 2
	inc c
endr
	ld a, $87
.loop
	push bc
	push hl
.inner_loop
	ld [hli], a
	dec c
	jr nz, .inner_loop
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	pop bc
	dec b
	jr nz, .loop
	ret
; b812f

PlaceMapNameFrame: ; b812f
	hlcoord 0, 0
	; top left
	ld a, $61
	ld [hli], a
	; top row
	ld a, $62
	call .FillTopBottom
	; top right
	ld a, $64
	ld [hli], a
	; left, first line
	ld a, $65
	ld [hli], a
	; first line
	call .FillMiddle
	; right, first line
	ld a, $6b
	ld [hli], a
	; left, second line
	ld a, $66
	ld [hli], a
	; second line
	call .FillMiddle
	; right, second line
	ld a, $6c
	ld [hli], a
	; bottom left
	ld a, $67
	ld [hli], a
	; bottom
	ld a, $68
	call .FillTopBottom
	; bottom right
	ld a, $6a
	ld [hl], a
	ret
; b815b

.FillMiddle: ; b815b
	ld c, 18
	ld a, $6d
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	ret
; b8164

.FillTopBottom: ; b8164
	ld c, 5
	jr .enterloop

.continueloop
rept 2
	ld [hli], a
endr

.enterloop
	inc a
rept 2
	ld [hli], a
endr
	dec a
	dec c
	jr nz, .continueloop
	ret
; b8172

CheckForHiddenItems: ; b8172
; Checks to see if there are hidden items on the screen that have not yet been found.  If it finds one, returns carry.
	call GetMapScriptHeaderBank
	ld [Buffer1], a
; Get the coordinate of the bottom right corner of the screen, and load it in wd1ec/wd1ed.
	ld a, [XCoord]
	add SCREEN_WIDTH / 4
	ld [wd1ed], a
	ld a, [YCoord]
	add SCREEN_HEIGHT / 4
	ld [wd1ec], a
; Get the pointer for the first signpost header in the map...
	ld hl, wCurrentMapSignpostHeaderPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
; ... before even checking to see if there are any signposts on this map.
	ld a, [wCurrentMapSignpostCount]
	and a
	jr z, .nosignpostitems
; For i = 1:wCurrentMapSignpostCount...
.loop
; Store the counter in Buffer2, and store the signpost header pointer in the stack.
	ld [Buffer2], a
	push hl
; Get the Y coordinate of the signpost.
	call .GetFarByte
	ld e, a
; Is the Y coordinate of the signpost on the screen?  If not, go to the next signpost.
	ld a, [wd1ec]
	sub e
	jr c, .next
	cp SCREEN_HEIGHT / 2
	jr nc, .next
; Is the X coordinate of the signpost on the screen?  If not, go to the next signpost.
	call .GetFarByte
	ld d, a
	ld a, [wd1ed]
	sub d
	jr c, .next
	cp SCREEN_WIDTH / 2
	jr nc, .next
; Is this signpost a hidden item?  If not, go to the next signpost.
	call .GetFarByte
	cp SIGNPOST_ITEM
	jr nz, .next
; Has this item already been found?  If not, set off the Itemfinder.
	ld a, [Buffer1]
	call GetFarHalfword
	ld a, [Buffer1]
	call GetFarHalfword
	ld d, h
	ld e, l
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	and a
	jr z, .itemnearby

.next
; Restore the signpost header pointer and increment it by the length of a signpost header.
	pop hl
	ld bc, 5
	add hl, bc
; Restore the signpost counter and decrement it.  If it hits zero, there are no hidden items in range.
	ld a, [Buffer2]
	dec a
	jr nz, .loop

.nosignpostitems
	xor a
	ret

.itemnearby
	pop hl
	scf
	ret
; b81e2

.GetFarByte: ; b81e2
	ld a, [Buffer1]
	call GetFarByte
	inc hl
	ret
; b81ea


TreeMonEncounter: ; b81ea
	callba MobileFn_1060ef

	xor a
	ld [TempWildMonSpecies], a
	ld [CurPartyLevel], a

	ld hl, TreeMonMaps
	call GetTreeMonSet
	jr nc, .no_battle

	call GetTreeMons
	jr nc, .no_battle

	call GetTreeMon
	jr nc, .no_battle

	ld a, BATTLETYPE_TREE
	ld [BattleType], a
	ld a, 1
	ld [ScriptVar], a
	ret

.no_battle
	xor a
	ld [ScriptVar], a
	ret
; b8219

RockMonEncounter: ; b8219

	xor a
	ld [TempWildMonSpecies], a
	ld [CurPartyLevel], a

	ld hl, RockMonMaps
	call GetTreeMonSet
	jr nc, .no_battle

	call GetTreeMons
	jr nc, .no_battle

	ld a, 10
	call RandomRange
	cp 4
	jr nc, .no_battle

	call SelectTreeMon
	jr nc, .no_battle

	ret

.no_battle
	xor a
	ret
; b823e

	db $05 ; ????

GetTreeMonSet: ; b823f
; Return carry and treemon set in a
; if the current map is in table hl.
	ld a, [MapNumber]
	ld e, a
	ld a, [MapGroup]
	ld d, a
.loop
	ld a, [hli]
	cp -1
	jr z, .not_in_table

	cp d
	jr nz, .skip2

	ld a, [hli]
	cp e
	jr nz, .skip1

	jr .in_table

.skip2
	inc hl
.skip1
	inc hl
	jr .loop

.not_in_table
	xor a
	ret

.in_table
	ld a, [hl]
	scf
	ret
; b825e

TreeMonMaps: ; b825e
treemon_map: macro
	map \1
	db  \2 ; treemon set
endm
	treemon_map ROUTE_26, 4
	treemon_map ROUTE_27, 4
	treemon_map ROUTE_28, 0
	treemon_map ROUTE_29, 3
	treemon_map ROUTE_30, 3
	treemon_map ROUTE_31, 3
	treemon_map ROUTE_32, 4
	treemon_map ROUTE_33, 2
	treemon_map ROUTE_34, 3
	treemon_map ROUTE_35, 3
	treemon_map ROUTE_36, 3
	treemon_map ROUTE_37, 3
	treemon_map ROUTE_38, 3
	treemon_map ROUTE_39, 3
	treemon_map ROUTE_40, 0
	treemon_map ROUTE_41, 0
	treemon_map ROUTE_42, 2
	treemon_map ROUTE_43, 5
	treemon_map ROUTE_44, 1
	treemon_map ROUTE_45, 1
	treemon_map ROUTE_46, 1
	treemon_map NEW_BARK_TOWN, 0
	treemon_map CHERRYGROVE_CITY, 0
	treemon_map VIOLET_CITY, 0
	treemon_map AZALEA_TOWN, 2
	treemon_map CIANWOOD_CITY, 0
	treemon_map GOLDENROD_CITY, 0
	treemon_map OLIVINE_CITY, 0
	treemon_map ECRUTEAK_CITY, 0
	treemon_map MAHOGANY_TOWN, 0
	treemon_map LAKE_OF_RAGE, 5
	treemon_map BLACKTHORN_CITY, 0
	treemon_map SILVER_CAVE_OUTSIDE, 0
	treemon_map ILEX_FOREST, 6
	db -1
; b82c5

RockMonMaps: ; b82c5
	treemon_map CIANWOOD_CITY, 7
	treemon_map ROUTE_40, 7
	treemon_map DARK_CAVE_VIOLET_ENTRANCE, 7
	treemon_map SLOWPOKE_WELL_B1F, 7
	db -1
; b82d2

GetTreeMons: ; b82d2
; Return the address of TreeMon table a in hl.
; Return nc if table a doesn't exist.

	cp 8
	jr nc, .quit

	and a
	jr z, .quit

	ld e, a
	ld d, 0
	ld hl, TreeMons
rept 2
	add hl, de
endr

	ld a, [hli]
	ld h, [hl]
	ld l, a

	scf
	ret

.quit
	xor a
	ret
; b82e8

TreeMons: ; b82e8
	dw TreeMons1
	dw TreeMons1
	dw TreeMons2
	dw TreeMons3
	dw TreeMons4
	dw TreeMons5
	dw TreeMons6
	dw RockMons
	dw TreeMons1

; Two tables each (normal, rare).
; Structure:
;	db  %, species, level

TreeMons1: ; b82fa
	db 50, SPEAROW,    10
	db 15, SPEAROW,    10
	db 15, SPEAROW,    10
	db 10, AIPOM,      10
	db  5, AIPOM,      10
	db  5, AIPOM,      10
	db -1

	db 50, SPEAROW,    10
	db 15, HERACROSS,  10
	db 15, HERACROSS,  10
	db 10, AIPOM,      10
	db  5, AIPOM,      10
	db  5, AIPOM,      10
	db -1

TreeMons2: ; b8320
	db 50, SPEAROW,    10
	db 15, EKANS,      10
	db 15, SPEAROW,    10
	db 10, AIPOM,      10
	db  5, AIPOM,      10
	db  5, AIPOM,      10
	db -1

	db 50, SPEAROW,    10
	db 15, HERACROSS,  10
	db 15, HERACROSS,  10
	db 10, AIPOM,      10
	db  5, AIPOM,      10
	db  5, AIPOM,      10
	db -1

TreeMons3: ; b8346
	db 50, HOOTHOOT,   10
	db 15, SPINARAK,   10
	db 15, LEDYBA,     10
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db -1

	db 50, HOOTHOOT,   10
	db 15, PINECO,     10
	db 15, PINECO,     10
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db -1

TreeMons4: ; b836c
	db 50, HOOTHOOT,   10
	db 15, EKANS,      10
	db 15, HOOTHOOT,   10
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db -1

	db 50, HOOTHOOT,   10
	db 15, PINECO,     10
	db 15, PINECO,     10
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db -1

TreeMons5: ; b8392
	db 50, HOOTHOOT,   10
	db 15, VENONAT,    10
	db 15, HOOTHOOT,   10
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db -1

	db 50, HOOTHOOT,   10
	db 15, PINECO,     10
	db 15, PINECO,     10
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db -1

TreeMons6: ; b83b8
	db 50, HOOTHOOT,   10
	db 15, PINECO,     10
	db 15, PINECO,     10
	db 10, NOCTOWL,    10
	db  5, BUTTERFREE, 10
	db  5, BEEDRILL,   10
	db -1

	db 50, HOOTHOOT,   10
	db 15, CATERPIE,   10
	db 15, WEEDLE,     10
	db 10, HOOTHOOT,   10
	db  5, METAPOD,    10
	db  5, KAKUNA,     10
	db -1

RockMons: ; b83de
	db 90, KRABBY,     15
	db 10, SHUCKLE,    15
	db -1
; b83e5

GetTreeMon: ; b83e5
	push hl
	call GetTreeScore
	pop hl
	and a
	jr z, .bad
	cp 1
	jr z, .good
	cp 2
	jr z, .rare
	ret

.bad
	ld a, 10
	call RandomRange
	and a
	jr nz, NoTreeMon
	jr SelectTreeMon

.good
	ld a, 10
	call RandomRange
	cp 5
	jr nc, NoTreeMon
	jr SelectTreeMon

.rare
	ld a, 10
	call RandomRange
	cp 8
	jr nc, NoTreeMon
	jr .skip
.skip
	ld a, [hli]
	cp -1
	jr nz, .skip
	call SelectTreeMon
	ret
; b841f

SelectTreeMon: ; b841f
; Read a TreeMons table and pick one monster at random.

	ld a, 100
	call RandomRange
.loop
	sub [hl]
	jr c, .ok
rept 3
	inc hl
endr
	jr .loop

.ok
	ld a, [hli]
	cp $ff
	jr z, NoTreeMon

	ld a, [hli]
	ld [TempWildMonSpecies], a
	ld a, [hl]
	ld [CurPartyLevel], a
	scf
	ret

NoTreeMon: ; b843b
	xor a
	ld [TempWildMonSpecies], a
	ld [CurPartyLevel], a
	ret
; b8443

GetTreeScore: ; b8443
	call .CoordScore
	ld [Buffer1], a
	call .OTIDScore
	ld [Buffer2], a
	ld c, a
	ld a, [Buffer1]
	sub c
	jr z, .rare
	jr nc, .ok
	add 10
.ok
	cp 5
	jr c, .good

.bad
	xor a
	ret

.good
	ld a, 1
	ret

.rare
	ld a, 2
	ret
; b8466

.CoordScore: ; b8466
	call GetFacingTileCoord
	ld hl, 0
	ld c, e
	ld b, 0
	ld a, d

	and a
	jr z, .next
.loop
	add hl, bc
	dec a
	jr nz, .loop
.next

	add hl, bc
	ld c, d
	add hl, bc

	ld a, h
	ld [hDividend], a
	ld a, l
	ld [hDividend + 1], a
	ld a, 5
	ld [hDivisor], a
	ld b, 2
	call Divide

	ld a, [hQuotient + 1]
	ld [hDividend], a
	ld a, [hQuotient + 2]
	ld [hDividend + 1], a
	ld a, 10
	ld [hDivisor], a
	ld b, 2
	call Divide

	ld a, [hQuotient + 3]
	ret
; b849d

.OTIDScore: ; b849d
	ld a, [PlayerID]
	ld [hDividend], a
	ld a, [PlayerID + 1]
	ld [hDividend + 1], a
	ld a, 10
	ld [hDivisor], a
	ld b, 2
	call Divide
	ld a, [hQuotient + 3]
	ret
; b84b3

LoadFishingGFX: ; b84b3
	ld a, [rVBK]
	push af
	ld a, $1
	ld [rVBK], a

	ld de, FishingGFX
	ld a, [PlayerGender]
	bit 0, a
	jr z, .got_gender
	ld de, KrisFishingGFX
.got_gender

	ld hl, VTiles0 tile $02
	call .LoadGFX
	ld hl, VTiles0 tile $06
	call .LoadGFX
	ld hl, VTiles0 tile $0a
	call .LoadGFX
	ld hl, VTiles1 tile $7c
	call .LoadGFX

	pop af
	ld [rVBK], a
	ret
; b84e3

.LoadGFX: ; b84e3
	lb bc, BANK(FishingGFX), 2
	push de
	call Get2bpp
	pop de
	ld hl, 2 tiles
	add hl, de
	ld d, h
	ld e, l
	ret
; b84f2

FishingGFX: ; b84f2
INCBIN "gfx/overworld/chris_fish.2bpp"
; b8582

KrisFishingGFX: ; b8582
INCBIN "gfx/overworld/kris_fish.2bpp"
; b8612
