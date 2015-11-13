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
	callba Function8cf53
	call Function91ff2
	ld de, GFX_922e1
	ld hl, VTiles2 tile $30
	lb bc, BANK(GFX_922e1), 6
	call Request1bpp
	call FlyMap
	call Function91c8f
	ld b, $2
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
	callba Function8cf69
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

.ScrollNext
	ld hl, wd002
	ld a, [hl]
	cp d
	jr nz, .NotAtEndYet
	ld a, e
	dec a
	ld [hl], a

.NotAtEndYet
	inc [hl]
	call CheckIfVisitedFlypoint
	jr z, .ScrollNext
	jr .Finally

.ScrollPrev
	ld hl, wd002
	ld a, [hl]
	cp e
	jr nz, .NotAtStartYet
	ld a, d
	inc a
	ld [hl], a

.NotAtStartYet
	dec [hl]
	call CheckIfVisitedFlypoint
	jr z, .ScrollPrev

.Finally
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

.Where
	db "Where?@"

.Name
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
; \1\@FLY   EQUS "FLY_\1"
; \1\@SPAWN EQUS "SPAWN_\1"
	; const \1\@FLY
	; db \2, \1\@SPAWN
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

Function91c8f: ; 91c8f
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

.CheckRegion
; The first 46 locations are part of Johto. The rest are in Kanto
	cp KANTO_LANDMARK
	jr nc, .KantoFlyMap

.JohtoFlyMap
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

.KantoFlyMap

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

.NoKanto
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

.MapHud
	call TownMapBubble
	call TownMapPals

	ld hl, VBGMap0 ; BG Map 0
	call TownMapBGUpdate

	call TownMapMon
	ld a, c
	ld [wd003], a
	ld a, b
	ld [wd004], a
	ret
; 91d11

Function91d11: ; 91d11
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
	ld de, GFX_922d1
	ld hl, VTiles0 tile $7f
	lb bc, BANK(GFX_922d1), 1
	call Request2bpp ; actually 1bpp
	call Function91ed0
	ld hl, VTiles0 tile $78
	ld c, $4
	call Request2bpp
	call Function91ff2
	call FillKantoMap
	call Function91de9
	call TownMapPals
	ld hl, VBGMap1
	call TownMapBGUpdate
	call FillJohtoMap
	call Function91de9
	call TownMapPals
	ld hl, VBGMap0
	call TownMapBGUpdate
	ld b, $2
	call GetSGBLayout
	call SetPalettes
	xor a
	ld [hBGMapMode], a
	xor a
	call Function91e1e
.asm_91d6e
	call JoyTextDelay
	ld hl, hJoyPressed
	ld a, [hl]
	and A_BUTTON | B_BUTTON
	jr nz, .asm_91d8f
	ld a, [hJoypadDown]
	and SELECT
	jr nz, .asm_91d87
	call Function91d9b
	call Function91dcd
	jr .asm_91d8a

.asm_91d87
	call Function91e5a

.asm_91d8a
	call DelayFrame
	jr .asm_91d6e

.asm_91d8f
	call ClearSprites
	pop af
	ld [wd003], a
	pop af
	ld [wd002], a
	ret
; 91d9b

Function91d9b: ; 91d9b
	ld a, [hl]
	and $20
	jr nz, .asm_91da6
	ld a, [hl]
	and $10
	jr nz, .asm_91db7
	ret

.asm_91da6
	ld a, [hWY]
	cp $90
	ret z
	call ClearSprites
	ld a, $90
	ld [hWY], a
	xor a
	call Function91e1e
	ret

.asm_91db7
	ld a, [StatusFlags]
	bit 6, a ; hall of fame
	ret z
	ld a, [hWY]
	and a
	ret z
	call ClearSprites
	xor a
	ld [hWY], a
	ld a, $1
	call Function91e1e
	ret
; 91dcd

Function91dcd: ; 91dcd
	ld a, [hVBlankCounter]
	ld e, a
	and $f
	ret nz
	ld a, e
	and $10
	jr nz, .asm_91ddc
	call ClearSprites
	ret

.asm_91ddc
	hlcoord 0, 0
	ld de, Sprites
	ld bc, $a0
	call CopyBytes
	ret
; 91de9

Function91de9: ; 91de9
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH
	ld a, $7f
	call ByteFill
	hlcoord 0, 1
	ld a, $6
	ld [hli], a
	ld bc, SCREEN_HEIGHT
	ld a, $7
	call ByteFill
	ld [hl], $17
	call GetPokemonName
	hlcoord 2, 0
	call PlaceString
	ld h, b
	ld l, c
	ld de, String_91e16
	call PlaceString
	ret
; 91e16

String_91e16:
	db "'S NEST@"
; 91e1e

Function91e1e: ; 91e1e
	ld [wd003], a
	ld e, a
	callba Function2a01f
	decoord 0, 0
	ld hl, Sprites
.asm_91e2e
	ld a, [de]
	and a
	jr z, .asm_91e4d
	push de
	ld e, a
	push hl
	callba GetLandmarkCoords
	pop hl
	ld a, d
	sub $4
	ld [hli], a
	ld a, e
	sub $4
	ld [hli], a
	ld a, $7f
	ld [hli], a
	xor a
	ld [hli], a
	pop de
	inc de
	jr .asm_91e2e

.asm_91e4d
	ld hl, Sprites
	decoord 0, 0
	ld bc, $a0
	call CopyBytes
	ret
; 91e5a

Function91e5a: ; 91e5a
	call Function91ea9
	ret c

	ld a, [wd002]
	ld e, a
	callba GetLandmarkCoords
	ld c, e
	ld b, d
	ld de, Unknown_91e9c
	ld hl, Sprites
.asm_91e70
	ld a, [de]
	cp $80
	jr z, .asm_91e91

	add b
	ld [hli], a
	inc de

	ld a, [de]
	add c
	ld [hli], a
	inc de

	ld a, [de]
	add $78
	ld [hli], a
	inc de

	push bc
	ld c, 0
	ld a, [PlayerGender]
	bit 0, a
	jr z, .asm_91e8c
	inc c
.asm_91e8c
	ld a, c
	ld [hli], a
	pop bc

	jr .asm_91e70

.asm_91e91
	ld hl, Sprites + $10
	ld bc, SpritesEnd - (Sprites + $10)
	xor a
	call ByteFill
	ret
; 91e9c

Unknown_91e9c: ; 91e9c
	db -8, -8,  0
	db -8,  0,  1
	db  0, -8,  2
	db  0,  0,  3
	db $80 ; terminator
; 91ea9

Function91ea9: ; 91ea9
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

Function91ed0: ; 91ed0
	ld a, [wd002]
	cp FAST_SHIP
	jr z, .asm_91ede
	callba GetPlayerIcon
	ret

.asm_91ede
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
	cp $ff
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
	ld bc, 360
.loop
; Current tile
	ld a, [hli]
	push hl

; HP/borders use palette 0
	cp $60
	jr nc, .pal0

; The palette data is condensed to nybbles,
; least-significant first.
	ld hl, TownMapPalMap
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

TownMapPalMap:
	db $11, $21, $22, $00, $11, $13, $54, $54, $11, $21, $22, $00
	db $11, $10, $01, $00, $11, $21, $22, $00, $00, $00, $00, $00
	db $00, $00, $44, $04, $00, $00, $00, $00, $33, $33, $33, $33
	db $33, $33, $33, $03, $33, $33, $33, $33, $00, $00, $00, $00
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
	ld de, 0
	ld a, $0
	call Function3b2a

	ld hl, 3
	add hl, bc
	ld [hl], 8
	ld hl, 2
	add hl, bc
	ld [hl], 0
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
	ld de, 0
	ld b, $0a ; Male
	ld a, [PlayerGender]
	bit 0, a
	jr z, .asm_91fd3
	ld b, $1e ; Female
.asm_91fd3
	ld a, b
	call Function3b2a

	ld hl, $3
	add hl, bc
	ld [hl], $10

	pop af
	ld e, a
	push bc
	callba GetLandmarkCoords
	pop bc

	ld hl, 4
	add hl, bc
	ld [hl], e
	ld hl, 5
	add hl, bc
	ld [hl], d
	ret
; 0x91ff2

Function91ff2: ; 91ff2
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


GFX_922d1: ; 922d1
INCBIN "gfx/unknown/0922d1.2bpp"
GFX_922e1: ; 922e1
INCBIN "gfx/unknown/0922e1.2bpp"
GFX_92301: ; 92301
INCBIN "gfx/unknown/092301.2bpp"
