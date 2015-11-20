Function4dc7b: ; 4dc7b (13:5c7b)
	ld a, [wLinkMode]
	cp LINK_MOBILE
	jr nz, StatsScreenInit

	ld a, [wBattleMode] ; wd22d (aliases: EnemyMonEnd)
	and a
	jr z, StatsScreenInit
	jr Function4dc8f

StatsScreenInit: ; 4dc8a
	ld hl, StatsScreenMain
	jr StatsScreenInit_gotaddress

Function4dc8f: ; 4dc8f
	ld hl, StatsScreenBattle
	jr StatsScreenInit_gotaddress

StatsScreenInit_gotaddress: ; 4dc94
	ld a, [hMapAnims]
	push af
	xor a
	ld [hMapAnims], a ; disable overworld tile animations
	ld a, [wc2c6] ; whether sprite is to be mirrorred
	push af
	ld a, [wJumptableIndex]
	ld b, a
	ld a, [wcf64]
	ld c, a

	push bc
	push hl
	call ClearBGPalettes
	call ClearTileMap
	call UpdateSprites
	callba Functionfb53e
	pop hl
	call _hl_
	call ClearBGPalettes
	call ClearTileMap
	pop bc

	; restore old values
	ld a, b
	ld [wJumptableIndex], a
	ld a, c
	ld [wcf64], a
	pop af
	ld [wc2c6], a
	pop af
	ld [hMapAnims], a
	ret
; 0x4dcd2

StatsScreenMain: ; 0x4dcd2
	xor a
	ld [wJumptableIndex], a
	; stupid interns
	ld [wcf64], a
	ld a, [wcf64]
	and $fc
	or $1
	ld [wcf64], a
.loop ; 4dce3
	ld a, [wJumptableIndex]
	and $7f
	ld hl, StatsScreenPointerTable
	rst JumpTable
	call Function4dd3a ; check for keys?
	ld a, [wJumptableIndex]
	bit 7, a
	jr z, .loop
	ret
; 0x4dcf7

StatsScreenBattle: ; 4dcf7
	xor a
	ld [wJumptableIndex], a
	; stupid interns
	ld [wcf64], a
	ld a, [wcf64]
	and $fc
	or $1
	ld [wcf64], a
.loop
	callba Function100dd2
	ld a, [wJumptableIndex]
	and $7f
	ld hl, StatsScreenPointerTable
	rst JumpTable
	call Function4dd3a
	callba Function100dfd
	jr c, .exit
	ld a, [wJumptableIndex]
	bit 7, a
	jr z, .loop

.exit
	ret
; 4dd2a

StatsScreenPointerTable: ; 4dd2a
	dw MonStatsInit ; regular pokémon
	dw EggStatsInit ; egg
	dw StatsScreenWaitCry
	dw Function4ddac
	dw Function4ddc6
	dw StatsScreenWaitCry
	dw Function4ddd6
	dw Function4dd6c
; 4dd3a


Function4dd3a: ; 4dd3a (13:5d3a)
	ld hl, wcf64
	bit 6, [hl]
	jr nz, .asm_4dd49
	bit 5, [hl]
	jr nz, .asm_4dd56
	call DelayFrame
	ret
.asm_4dd49
	callba Functiond00b4
	jr nc, .asm_4dd56
	ld hl, wcf64
	res 6, [hl]
.asm_4dd56
	ld hl, wcf64
	res 5, [hl]
	callba Function10402d
	ret

Function4dd62: ; 4dd62 (13:5d62)
	ld a, [wJumptableIndex]
	and $80
	or h
	ld [wJumptableIndex], a
	ret

Function4dd6c: ; 4dd6c (13:5d6c)
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

MonStatsInit: ; 4dd72 (13:5d72)
	ld hl, wcf64
	res 6, [hl]
	call ClearBGPalettes
	call ClearTileMap
	callba Function10402d
	call Function4ddf2
	ld a, [CurPartySpecies]
	cp EGG
	jr z, .asm_4dd9b
	call Function4deea
	ld hl, wcf64
	set 4, [hl]
	ld h, $4
	call Function4dd62
	ret
.asm_4dd9b
	ld h, $1
	call Function4dd62
	ret

EggStatsInit: ; 4dda1
	call EggStatsScreen
	ld a, [wJumptableIndex]
	inc a
	ld [wJumptableIndex], a
	ret
; 0x4ddac


Function4ddac: ; 4ddac (13:5dac)
	call Function4de2c
	jr nc, .asm_4ddb7
	ld h, $0
	call Function4dd62
	ret
.asm_4ddb7
	bit 0, a
	jr nz, .asm_4ddc0
	and $c3
	jp Function4de54
.asm_4ddc0
	ld h, $7
	call Function4dd62
	ret

Function4ddc6: ; 4ddc6 (13:5dc6)
	call Function4dfb6
	ld hl, wcf64
	res 4, [hl]
	ld a, [wJumptableIndex]
	inc a
	ld [wJumptableIndex], a
	ret

Function4ddd6: ; 4ddd6 (13:5dd6)
	call Function4de2c
	jr nc, .asm_4dde1
	ld h, $0
	call Function4dd62
	ret

.asm_4dde1
	and $f3
	jp Function4de54

StatsScreenWaitCry: ; 4dde6 (13:5de6)
	call IsSFXPlaying
	ret nc
	ld a, [wJumptableIndex]
	inc a
	ld [wJumptableIndex], a
	ret

Function4ddf2: ; 4ddf2 (13:5df2)
	ld a, [MonType]
	cp BREEDMON
	jr nz, .asm_4de10
	ld a, [wd018_Mon]
	ld [CurSpecies], a
	call GetBaseData
	ld hl, wd018_Mon
	ld de, TempMon
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	jr .asm_4de2a
.asm_4de10
	callba CopyPkmnToTempMon
	ld a, [CurPartySpecies]
	cp EGG
	jr z, .asm_4de2a
	ld a, [MonType]
	cp BOXMON
	jr c, .asm_4de2a
	callba Function50890
.asm_4de2a
	and a
	ret

Function4de2c: ; 4de2c (13:5e2c)
	call GetJoypad
	ld a, [MonType]
	cp BREEDMON
	jr nz, .notbreedmon
	push hl
	push de
	push bc
	callba Functione2f95
	pop bc
	pop de
	pop hl
	ld a, [wcf73]
	and $c0
	jr nz, .set_carry
	ld a, [wcf73]
	jr .clear_flags

.notbreedmon
	ld a, [hJoyPressed]
.clear_flags
	and a
	ret

.set_carry
	scf
	ret

Function4de54: ; 4de54 (13:5e54)
	push af
	ld a, [wcf64]
	and $3
	ld c, a
	pop af
	bit 1, a
	jp nz, Function4dee4
	bit 5, a
	jr nz, .asm_4dec7
	bit 4, a
	jr nz, .asm_4debd
	bit 0, a
	jr nz, .asm_4deb8
	bit 6, a
	jr nz, .asm_4dea0
	bit 7, a
	jr nz, .asm_4de77
	jr .asm_4dece
.asm_4de77
	ld a, [MonType]
	cp BOXMON
	jr nc, .asm_4dece
	and a
	ld a, [PartyCount]
	jr z, .asm_4de87
	ld a, [OTPartyCount]
.asm_4de87
	ld b, a
	ld a, [CurPartyMon]
	inc a
	cp b
	jr z, .asm_4dece
	ld [CurPartyMon], a
	ld b, a
	ld a, [MonType]
	and a
	jr nz, .asm_4dede
	ld a, b
	inc a
	ld [wd0d8], a
	jr .asm_4dede
.asm_4dea0
	ld a, [CurPartyMon]
	and a
	jr z, .asm_4dece
	dec a
	ld [CurPartyMon], a
	ld b, a
	ld a, [MonType]
	and a
	jr nz, .asm_4dede
	ld a, b
	inc a
	ld [wd0d8], a
	jr .asm_4dede
.asm_4deb8
	ld a, c
	cp $3
	jr z, Function4dee4
.asm_4debd
	inc c
	ld a, $3
	cp c
	jr nc, .asm_4decf
	ld c, $1
	jr .asm_4decf
.asm_4dec7
	dec c
	jr nz, .asm_4decf
	ld c, $3
	jr .asm_4decf
.asm_4dece
	ret
.asm_4decf
	ld a, [wcf64]
	and $fc
	or c
	ld [wcf64], a
	ld h, $4
	call Function4dd62
	ret
.asm_4dede
	ld h, $0
	call Function4dd62
	ret

Function4dee4: ; 4dee4 (13:5ee4)
	ld h, $7
	call Function4dd62
	ret

Function4deea: ; 4deea (13:5eea)
	call Function4df45
	xor a
	ld [hBGMapMode], a
	ld a, [CurBaseData] ; wd236 (aliases: BaseDexNo)
	ld [wd265], a
	ld [CurSpecies], a
	hlcoord 8, 0
	ld [hl], "№"
	inc hl
	ld [hl], "."
	inc hl
	hlcoord 10, 0
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	ld de, wd265
	call PrintNum
	hlcoord 14, 0
	call PrintLevel
	ld hl, Unknown_4df77
	call Function4e528
	call Function4e505
	hlcoord 8, 2
	call PlaceString
	hlcoord 18, 0
	call Function4df66
	hlcoord 9, 4
	ld a, "/"
	ld [hli], a
	ld a, [CurBaseData] ; wd236 (aliases: BaseDexNo)
	ld [wd265], a
	call GetPokemonName
	call PlaceString
	call Function4df8f
	call Function4df9b
	call Function4dfa6
	ret

Function4df45: ; 4df45 (13:5f45)
	ld hl, TempMonHP
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, TempMonMaxHP
	ld a, [hli]
	ld d, a
	ld e, [hl]
	callba DrawPartyMenuHPBar
	ld hl, wcda1
	call SetHPPal
	ld b, SCGB_03
	call GetSGBLayout
	call DelayFrame
	ret

Function4df66: ; 4df66 (13:5f66)
	push hl
	callba GetGender
	pop hl
	ret c
	ld a, "♂"
	jr nz, .got_gender
	ld a, "♀"
.got_gender
	ld [hl], a
	ret
; 4df77 (13:5f77)

Unknown_4df77: ; 4df77
	dw PartyMonNicknames
	dw OTPartyMonNicknames
	dw sBoxMonNicknames
	dw wd002
; 4df7f

Function4df7f: ; 4df7f
	hlcoord 7, 0
	ld bc, SCREEN_WIDTH
	ld d, SCREEN_HEIGHT
.loop
	ld a, $31
	ld [hl], a
	add hl, bc
	dec d
	jr nz, .loop
	ret
; 4df8f

Function4df8f: ; 4df8f (13:5f8f)
	hlcoord 0, 7
	ld b, SCREEN_WIDTH
	ld a, "_"
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	ret

Function4df9b: ; 4df9b (13:5f9b)
	hlcoord 12, 6
	ld [hl], "◀"
	hlcoord 19, 6
	ld [hl], "▶"
	ret

Function4dfa6: ; 4dfa6 (13:5fa6)
	ld bc, TempMonDVs
	callba CheckShininess
	ret nc
	hlcoord 19, 0
	ld [hl], "<SHINY>"
	ret

Function4dfb6: ; 4dfb6 (13:5fb6)
	ld a, [CurBaseData] ; wd236 (aliases: BaseDexNo)
	ld [wd265], a
	ld [CurSpecies], a
	xor a
	ld [hBGMapMode], a
	call Function4dfda
	call Function4e002
	call Function4dfed
	ld hl, wcf64
	bit 4, [hl]
	jr nz, .asm_4dfd6
	call SetPalettes
	ret

.asm_4dfd6
	call Function4e226
	ret

Function4dfda: ; 4dfda (13:5fda)
	ld a, [wcf64]
	and $3
	ld c, a
	call Function4e4cd
	hlcoord 0, 8
	lb bc, 10, 20
	call ClearBox
	ret

Function4dfed: ; 4dfed (13:5fed)
	ld a, [wcf64]
	and $3
	ld c, a
	callba Function8c8a
	call DelayFrame
	ld hl, wcf64
	set 5, [hl]
	ret

Function4e002: ; 4e002 (13:6002)
	ld a, [wcf64]
	and $3
	dec a
	ld hl, Jumptable_4e00d
	rst JumpTable
	ret

Jumptable_4e00d: ; 4e00d (13:600d)
	dw Function4e013
	dw Function4e147
	dw Function4e1ae


Function4e013: ; 4e013 (13:6013)
	hlcoord 0, 9
	ld b, $0
	predef DrawPlayerHP
	hlcoord 8, 9
	ld [hl], $41
	ld de, String_4e119
	hlcoord 0, 12
	call PlaceString
	ld a, [TempMonPokerusStatus]
	ld b, a
	and $f
	jr nz, .asm_4e055
	ld a, b
	and $f0
	jr z, .asm_4e03d
	hlcoord 8, 8
	ld [hl], $e8
.asm_4e03d
	ld a, [MonType]
	cp $2
	jr z, .asm_4e060
	hlcoord 6, 13
	push hl
	ld de, TempMonStatus
	predef PlaceStatusString
	pop hl
	jr nz, .asm_4e066
	jr .asm_4e060
.asm_4e055
	ld de, String_4e142
	hlcoord 1, 13
	call PlaceString
	jr .asm_4e066
.asm_4e060
	ld de, String_4e127
	call PlaceString
.asm_4e066
	hlcoord 1, 15
	predef PrintMonTypes
	hlcoord 9, 8
	ld de, $14
	ld b, $a
	ld a, $31
.asm_4e078
	ld [hl], a
	add hl, de
	dec b
	jr nz, .asm_4e078
	ld de, String_4e12b
	hlcoord 10, 9
	call PlaceString
	hlcoord 17, 14
	call Function4e0d3
	hlcoord 13, 10
	lb bc, 3, 7
	ld de, TempMonExp
	call PrintNum
	call Function4e0e7
	hlcoord 13, 13
	lb bc, 3, 7
	ld de, Buffer1 ; wd1ea (aliases: MagikarpLength)
	call PrintNum
	ld de, String_4e136
	hlcoord 10, 12
	call PlaceString
	ld de, String_4e13f
	hlcoord 14, 14
	call PlaceString
	hlcoord 11, 16
	ld a, [TempMonLevel]
	ld b, a
	ld de, TempMonExp + 2
	predef FillInExpBar
	hlcoord 10, 16
	ld [hl], $40
	hlcoord 19, 16
	ld [hl], $41
	ret

Function4e0d3: ; 4e0d3 (13:60d3)
	ld a, [TempMonLevel]
	push af
	cp MAX_LEVEL
	jr z, .asm_4e0df
	inc a
	ld [TempMonLevel], a
.asm_4e0df
	call PrintLevel
	pop af
	ld [TempMonLevel], a
	ret

Function4e0e7: ; 4e0e7 (13:60e7)
	ld a, [TempMonLevel]
	cp MAX_LEVEL
	jr z, .asm_4e111
	inc a
	ld d, a
	callba CalcExpAtLevel
rept 2
	ld hl, TempMonExp + 2
endr
	ld a, [$ffb6]
	sub [hl]
	dec hl
	ld [wd1ec], a
	ld a, [$ffb5]
	sbc [hl]
	dec hl
	ld [Buffer2], a ; wd1eb (aliases: MovementType)
	ld a, [hQuotient]
	sbc [hl]
	ld [Buffer1], a ; wd1ea (aliases: MagikarpLength)
	ret
.asm_4e111
	ld hl, Buffer1 ; wd1ea (aliases: MagikarpLength)
	xor a
rept 2
	ld [hli], a
endr
	ld [hl], a
	ret
; 4e119 (13:6119)

String_4e119: ; 4e119
	db   "STATUS/"
	next "TYPE/@"
; 4e127

String_4e127: ; 4e127
	db "OK @"
; 4e12b

String_4e12b: ; 4e12b
	db "EXP POINTS@"
; 4e136

String_4e136: ; 4e136
	db "LEVEL UP@"
; 4e13f

String_4e13f: ; 4e13f
	db "TO@"
; 4e142

String_4e142: ; 4e142
	db "#RUS@"
; 4e147

Function4e147: ; 4e147 (13:6147)
	ld de, String_4e1a0
	hlcoord 0, 8
	call PlaceString
	call Function4e189
	hlcoord 8, 8
	call PlaceString
	ld de, String_4e1a9
	hlcoord 0, 10
	call PlaceString
	ld hl, TempMonMoves
	ld de, wListMoves_MoveIndicesBuffer
	ld bc, NUM_MOVES
	call CopyBytes
	hlcoord 8, 10
	ld a, SCREEN_WIDTH * 2
	ld [Buffer1], a
	predef ListMoves
	hlcoord 12, 11
	ld a, $28
	ld [Buffer1], a
	predef Function50c50
	ret

Function4e189: ; 4e189 (13:6189)
	ld de, String_4e1a5
	ld a, [TempMonItem]
	and a
	ret z
	ld b, a
	callba Function28771
	ld a, b
	ld [wd265], a
	call GetItemName
	ret
; 4e1a0 (13:61a0)

String_4e1a0: ; 4e1a0
	db "ITEM@"
; 4e1a5

String_4e1a5: ; 4e1a5
	db "---@"
; 4e1a9

String_4e1a9: ; 4e1a9
	db "MOVE@"
; 4e1ae

Function4e1ae: ; 4e1ae (13:61ae)
	call Function4e1cc
	hlcoord 10, 8
	ld de, $14
	ld b, $a
	ld a, $31
.asm_4e1bb
	ld [hl], a
	add hl, de
	dec b
	jr nz, .asm_4e1bb
	hlcoord 11, 8
	ld bc, $6
	predef PrintTempMonStats
	ret

Function4e1cc: ; 4e1cc (13:61cc)
	ld de, IDNoString
	hlcoord 0, 9
	call PlaceString
	ld de, OTString
	hlcoord 0, 12
	call PlaceString
	hlcoord 2, 10
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	ld de, TempMonID
	call PrintNum
	ld hl, Unknown_4e216
	call Function4e528
	call Function4e505
	callba CheckNickErrors
	hlcoord 2, 13
	call PlaceString
	ld a, [TempMonCaughtGender]
	and a
	jr z, .asm_4e215
	cp $7f
	jr z, .asm_4e215
	and $80
	ld a, "♂"
	jr z, .asm_4e211
	ld a, "♀"
.asm_4e211
	hlcoord 9, 13
	ld [hl], a
.asm_4e215
	ret
; 4e216 (13:6216)

Unknown_4e216: ; 4e216
	dw PartyMonOT
	dw OTPartyMonOT
	dw sBoxMonOT
	dw wd00d
; 4e21e

IDNoString: ; 4e21e
	db $73, "№.@"

OTString: ; 4e222
	db "OT/@"
; 4e226


Function4e226: ; 4e226 (13:6226)
	ld hl, TempMonDVs
	predef GetUnownLetter
	call Function4e2ad
	jr c, .asm_4e238
	and a
	jr z, .asm_4e23f
	jr .asm_4e246
.asm_4e238
	call Function4e271
	call SetPalettes
	ret
.asm_4e23f
	call Function4e253
	call SetPalettes
	ret
.asm_4e246
	call SetPalettes
	call Function4e253
	ld a, [CurPartySpecies]
	call PlayCry2
	ret

Function4e253: ; 4e253 (13:6253)
	ld hl, wcf64
	set 5, [hl]
	ld a, [CurPartySpecies]
	cp UNOWN
	jr z, .asm_4e266
	hlcoord 0, 0
	call PrepMonFrontpic
	ret
.asm_4e266
	xor a
	ld [wc2c6], a
	hlcoord 0, 0
	call _PrepMonFrontpic
	ret

Function4e271: ; 4e271 (13:6271)
	ld a, [CurPartySpecies]
	cp UNOWN
	jr z, .asm_4e281
	ld a, $1
	ld [wc2c6], a
	call Function4e289
	ret
.asm_4e281
	xor a
	ld [wc2c6], a
	call Function4e289
	ret

Function4e289: ; 4e289 (13:6289)
	ld a, [CurPartySpecies]
	call IsAPokemon
	ret c
	call Function4e307
	ld de, VTiles2 tile $00
	predef Function5108b
	hlcoord 0, 0
	ld d, $0
	ld e, $2
	predef LoadMonAnimation
	ld hl, wcf64
	set 6, [hl]
	ret

Function4e2ad: ; 4e2ad (13:62ad)
	ld a, [MonType]
	ld hl, .Jumptable
	rst JumpTable
	ret

.Jumptable: ; 4e2b5 (13:62b5)
	dw Function4e2bf
	dw Function4e2cf
	dw Function4e2d1
	dw Function4e2ed
	dw Function4e301


Function4e2bf: ; 4e2bf (13:62bf)
	ld a, [CurPartyMon]
	ld hl, PartyMons ; wdcdf (aliases: PartyMon1, PartyMon1Species)
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld b, h
	ld c, l
	jr Function4e2f2

Function4e2cf: ; 4e2cf (13:62cf)
	xor a
	ret

Function4e2d1: ; 4e2d1 (13:62d1)
	ld hl, sBoxMons
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [CurPartyMon]
	call AddNTimes
	ld b, h
	ld c, l
	ld a, BANK(sBoxMons)
	call GetSRAMBank
	call Function4e2f2
	push af
	call CloseSRAM
	pop af
	ret

Function4e2ed: ; 4e2ed (13:62ed)
	ld bc, TempMonSpecies ; wd10e (aliases: TempMon)
	jr Function4e2f2 ; utterly pointless

Function4e2f2: ; 4e2f2 (13:62f2)
	ld a, [CurPartySpecies]
	cp EGG
	jr z, .egg
	call CheckFaintedFrzSlp
	jr c, Function4e305
.egg
	xor a
	scf
	ret

Function4e301: ; 4e301 (13:6301)
	ld a, $1
	and a
	ret
Function4e305: ; 4e305 (13:6305)
	xor a
	ret

Function4e307: ; 4e307 (13:6307)
	nop
	push hl
	push de
	push bc
	push af
	call DelayFrame
	ld a, [rVBK]
	push af
	ld a, $1
	ld [rVBK], a
	ld de, TextBoxSpaceGFX
	lb bc, BANK(TextBoxSpaceGFX), 1
	ld hl, VTiles2 tile $7f
	call Get2bpp
	pop af
	ld [rVBK], a
	pop af
	pop bc
	pop de
	pop hl
	ret
; 4e32a (13:632a)

Unknown_4e32a: ; 4e32a
; A blank tile?
	ds 16
; 4e33a

EggStatsScreen: ; 4e33a
	xor a
	ld [hBGMapMode], a
	ld hl, wcda1
	call SetHPPal
	ld b, SCGB_03
	call GetSGBLayout
	call Function4df8f
	ld de, EggString
	hlcoord 8, 1
	call PlaceString
	ld de, IDNoString
	hlcoord 8, 3
	call PlaceString
	ld de, OTString
	hlcoord 8, 5
	call PlaceString
	ld de, FiveQMarkString
	hlcoord 11, 3
	call PlaceString
	ld de, FiveQMarkString
	hlcoord 11, 5
	call PlaceString
	ld a, [TempMonHappiness] ; egg status
	ld de, EggSoonString
	cp $6
	jr c, .picked
	ld de, EggCloseString
	cp $b
	jr c, .picked
	ld de, EggMoreTimeString
	cp $29
	jr c, .picked
	ld de, EggALotMoreTimeString
.picked
	hlcoord 1, 9
	call PlaceString
	ld hl, wcf64
	set 5, [hl]
	call SetPalettes ; pals
	call DelayFrame
	hlcoord 0, 0
	call PrepMonFrontpic
	callba Function10402d
	call Function4e497

	ld a, [TempMonHappiness]
	cp 6
	ret nc
	ld de, SFX_2_BOOPS
	call PlaySFX
	ret
; 0x4e3c0

EggString: ; 4e3c0
	db "EGG@"

FiveQMarkString: ; 4e3c4
	db "?????@"

EggSoonString: ; 0x4e3ca
	db   "It's making sounds"
	next "inside. It's going"
	next "to hatch soon!@"

EggCloseString: ; 0x4e3fd
	db   "It moves around"
	next "inside sometimes."
	next "It must be close"
	next "to hatching.@"

EggMoreTimeString: ; 0x4e43d
	db   "Wonder what's"
	next "inside? It needs"
	next "more time, though.@"

EggALotMoreTimeString: ; 0x4e46e
	db   "This EGG needs a"
	next "lot more time to"
	next "hatch.@"
; 0x4e497


Function4e497: ; 4e497 (13:6497)
	call Function4e2ad
	ret nc
	ld a, [TempMonHappiness]
	ld e, $7
	cp $6
	jr c, .asm_4e4ab
	ld e, $8
	cp $b
	jr c, .asm_4e4ab
	ret
.asm_4e4ab
	push de
	ld a, $1
	ld [wc2c6], a
	call Function4e307
	ld de, VTiles2 tile $00
	predef Function5108b
	pop de
	hlcoord 0, 0
	ld d, $0
	predef LoadMonAnimation
	ld hl, wcf64
	set 6, [hl]
	ret

Function4e4cd: ; 4e4cd (13:64cd)
	hlcoord 13, 5
	ld a, $36
	call .load_square
	hlcoord 15, 5
	ld a, $36
	call .load_square
	hlcoord 17, 5
	ld a, $36
	call .load_square
	ld a, c
	cp $2
	ld a, $3a
	hlcoord 13, 5
	jr c, .load_square
	hlcoord 15, 5
	jr z, .load_square
	hlcoord 17, 5
.load_square: ; 4e4f7 (13:64f7)
	push bc
	ld [hli], a
	inc a
	ld [hld], a
	ld bc, SCREEN_WIDTH
	add hl, bc
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	pop bc
	ret

Function4e505: ; 4e505 (13:6505)
	ld de, StringBuffer1
	ld bc, PKMN_NAME_LENGTH
	jr .okay ; uuterly pointless
.okay
	ld a, [MonType]
	cp BOXMON
	jr nz, .partymon
	ld a, BANK(sBoxMonNicknames)
	call GetSRAMBank
	push de
	call CopyBytes
	pop de
	call CloseSRAM
	ret

.partymon
	push de
	call CopyBytes
	pop de
	ret

Function4e528: ; 4e528 (13:6528)
	ld a, [MonType]
	add a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [MonType]
	cp $3
	ret z
	ld a, [CurPartyMon]
	jp SkipNames


CheckFaintedFrzSlp: ; 4e53f
	ld hl, MON_HP
	add hl, bc
	ld a, [hli]
	or [hl]
	jr z, .fainted_frz_slp
	ld hl, MON_STATUS
	add hl, bc
	ld a, [hl]
	and (1 << FRZ) | SLP
	jr nz, .fainted_frz_slp
	and a
	ret

.fainted_frz_slp
	scf
	ret
; 4e554
