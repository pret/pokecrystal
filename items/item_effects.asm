_DoItemEffect:: ; e722
	ld a, [CurItem]
	ld [$d265], a
	call GetItemName
	call CopyName1
	ld a, 1
	ld [$d0ec], a
	ld a, [CurItem]
	dec a
	ld hl, ItemEffects
	rst JumpTable
	ret
; e73c


ItemEffects: ; e73c
	dw MasterBall
	dw UltraBall
	dw Brightpowder
	dw GreatBall
	dw PokeBall
	dw TownMap
	dw Bicycle
	dw MoonStone
	dw Antidote
	dw BurnHeal
	dw IceHeal
	dw Awakening
	dw ParlyzHeal
	dw FullRestore
	dw MaxPotion
	dw HyperPotion
	dw SuperPotion
	dw Potion
	dw EscapeRope
	dw Repel
	dw MaxElixer
	dw FireStone
	dw Thunderstone
	dw WaterStone
	dw Item19
	dw HpUp
	dw Protein
	dw Iron
	dw Carbos
	dw LuckyPunch
	dw Calcium
	dw RareCandy
	dw XAccuracy
	dw LeafStone
	dw MetalPowder
	dw Nugget
	dw PokeDoll
	dw FullHeal
	dw Revive
	dw MaxRevive
	dw GuardSpec
	dw SuperRepel
	dw MaxRepel
	dw DireHit
	dw Item2D
	dw FreshWater
	dw SodaPop
	dw Lemonade
	dw XAttack
	dw Item32
	dw XDefend
	dw XSpeed
	dw XSpecial
	dw CoinCase
	dw Itemfinder
	dw PokeFlute
	dw ExpShare
	dw OldRod
	dw GoodRod
	dw SilverLeaf
	dw SuperRod
	dw PpUp
	dw Ether
	dw MaxEther
	dw Elixer
	dw RedScale
	dw Secretpotion
	dw SSTicket
	dw MysteryEgg
	dw ClearBell
	dw SilverWing
	dw MoomooMilk
	dw QuickClaw
	dw Psncureberry
	dw GoldLeaf
	dw SoftSand
	dw SharpBeak
	dw Przcureberry
	dw BurntBerry
	dw IceBerry
	dw PoisonBarb
	dw KingsRock
	dw BitterBerry
	dw MintBerry
	dw RedApricorn
	dw Tinymushroom
	dw BigMushroom
	dw Silverpowder
	dw BluApricorn
	dw Item5A
	dw AmuletCoin
	dw YlwApricorn
	dw GrnApricorn
	dw CleanseTag
	dw MysticWater
	dw Twistedspoon
	dw WhtApricorn
	dw Blackbelt
	dw BlkApricorn
	dw Item64
	dw PnkApricorn
	dw Blackglasses
	dw Slowpoketail
	dw PinkBow
	dw Stick
	dw SmokeBall
	dw Nevermeltice
	dw Magnet
	dw Miracleberry
	dw Pearl
	dw BigPearl
	dw Everstone
	dw SpellTag
	dw Ragecandybar
	dw GsBall
	dw BlueCard
	dw MiracleSeed
	dw ThickClub
	dw FocusBand
	dw Item78
	dw Energypowder
	dw EnergyRoot
	dw HealPowder
	dw RevivalHerb
	dw HardStone
	dw LuckyEgg
	dw CardKey
	dw MachinePart
	dw EggTicket
	dw LostItem
	dw Stardust
	dw StarPiece
	dw BasementKey
	dw Pass
	dw Item87
	dw Item88
	dw Item89
	dw Charcoal
	dw BerryJuice
	dw ScopeLens
	dw Item8D
	dw Item8E
	dw MetalCoat
	dw DragonFang
	dw Item91
	dw Leftovers
	dw Item93
	dw Item94
	dw Item95
	dw Mysteryberry
	dw DragonScale
	dw BerserkGene
	dw Item99
	dw Item9A
	dw Item9B
	dw SacredAsh
	dw HeavyBall
	dw FlowerMail
	dw LevelBall
	dw LureBall
	dw FastBall
	dw ItemA2
	dw LightBall
	dw FriendBall
	dw MoonBall
	dw LoveBall
	dw NormalBox
	dw GorgeousBox
	dw SunStone
	dw PolkadotBow
	dw ItemAB
	dw UpGrade
	dw Berry
	dw GoldBerry
	dw Squirtbottle
	dw ItemB0
	dw ParkBall
	dw RainbowWing
	dw ItemB3
; e8a2


MasterBall:
UltraBall:
GreatBall:
PokeBall:
HeavyBall:
LevelBall:
LureBall:
FastBall:
FriendBall:
MoonBall:
LoveBall:
ParkBall: ; e8a2
	ld a, [IsInBattle]
	dec a
	jp nz, Functionf7a0

	ld a, [PartyCount]
	cp 6
	jr nz, .asm_e8c0

	ld a, $1
	call GetSRAMBank
	ld a, [$ad10]
	cp 20
	call CloseSRAM
	jp z, Ball_BoxIsFullMessage

.asm_e8c0
	xor a
	ld [$c64e], a
	ld a, [CurItem]
	cp PARK_BALL
	call nz, Functionedfa

	ld hl, Options
	res 4, [hl]
	ld hl, UsedItemText
	call PrintText

	ld a, [EnemyMonCatchRate]
	ld b, a
	ld a, [BattleType]
	cp $3
	jp z, .asm_e99c
	ld a, [CurItem]
	cp $1
	jp z, .asm_e99c
	ld a, [CurItem]
	ld c, a
	ld hl, Table_0xec0a

.asm_e8f2
	ld a, [hli]
	cp $ff
	jr z, .asm_e906
	cp c
	jr z, .asm_e8fe
	inc hl
	inc hl
	jr .asm_e8f2

.asm_e8fe
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .asm_e906
	push de
	jp [hl]

.asm_e906
	ld a, [CurItem]
	cp LEVEL_BALL
	ld a, b
	jp z, .asm_e98e

	ld a, b
	ld [$ffb6], a

	ld hl, EnemyMonHP
	ld b, [hl]
	inc hl
	ld c, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld e, [hl]
	sla c
	rl b

	ld h, d
	ld l, e
	add hl, de
	add hl, de
	ld d, h
	ld e, l
	ld a, d
	and a
	jr z, .asm_e940

	srl d
	rr e
	srl d
	rr e
	srl b
	rr c
	srl b
	rr c

	ld a, c
	and a
	jr nz, .asm_e940
	ld c, $1
.asm_e940
	ld b, e

	push bc
	ld a, b
	sub c
	ld [hMultiplier], a
	xor a
	ld [hProduct], a
	ld [hMultiplicand], a
	ld [$ffb5], a
	call Multiply
	pop bc

	ld a, b
	ld [hMultiplier], a
	ld b, $4
	call Divide

	ld a, [$ffb6]
	and a
	jr nz, .asm_e960
	ld a, $1

.asm_e960
	ld b, a
	ld a, [EnemyMonStatus]
	and 1 << FRZ | SLP
	ld c, 10
	jr nz, .asm_e971
	and a
	ld c, 5
	jr nz, .asm_e971
	ld c, 0

.asm_e971
	ld a, b
	add c
	jr nc, .asm_e977
	ld a, $ff

.asm_e977
	ld d, a
	push de
	ld a, [BattleMonItem]
	callba GetItem

	ld a, b
	cp $46
	pop de
	ld a, d
	jr nz, .asm_e98e
	add c
	jr nc, .asm_e98e
	ld a, $ff

.asm_e98e
	ld b, a
	ld [Buffer1], a
	call Random

	cp b
	ld a, 0
	jr z, .asm_e99c
	jr nc, .asm_e99f

.asm_e99c
	ld a, [EnemyMonSpecies]

.asm_e99f
	ld [$c64e], a
	ld c, 20
	call DelayFrames

	ld a, [CurItem]
	cp $6
	jr c, .asm_e9b0

	ld a, POKE_BALL

.asm_e9b0
	ld [$c689], a
	ld de, ANIM_THROW_POKE_BALL
	ld a, e
	ld [FXAnimIDLo], a
	ld a, d
	ld [FXAnimIDHi], a
	xor a
	ld [hBattleTurn], a
	ld [Buffer2], a
	ld [$cfca], a
	ld a, $37
	call Predef

	ld a, [$c64e]
	and a
	jr nz, .asm_e9f5
	ld a, [Buffer2]
	cp $1
	ld hl, UnknownText_0xedb5
	jp z, .asm_ebdc
	cp $2
	ld hl, UnknownText_0xedba
	jp z, .asm_ebdc
	cp $3
	ld hl, UnknownText_0xedbf
	jp z, .asm_ebdc
	cp $4
	ld hl, UnknownText_0xedc4
	jp z, .asm_ebdc

.asm_e9f5
	ld hl, EnemyMonStatus
	ld a, [hli]
	push af
	inc hl
	ld a, [hli]
	push af
	ld a, [hl]
	push af
	push hl
	ld hl, EnemyMonItem
	ld a, [hl]
	push af
	push hl
	ld hl, EnemySubStatus5
	ld a, [hl]
	push af
	set 3, [hl]
	bit 3, a
	jr nz, .asm_ea13
	jr .asm_ea1a

.asm_ea13
	ld a, DITTO
	ld [TempEnemyMonSpecies], a
	jr .asm_ea27

.asm_ea1a
	set 3, [hl]
	ld hl, $c6f2
	ld a, [EnemyMonDVs]
	ld [hli], a
	ld a, [EnemyMonDVs + 1]
	ld [hl], a

.asm_ea27
	ld a, [TempEnemyMonSpecies]
	ld [CurPartySpecies], a
	ld a, [EnemyMonLevel]
	ld [CurPartyLevel], a
	callba LoadEnemyMon

	pop af
	ld [EnemySubStatus5], a
	pop hl
	pop af
	ld [hl], a
	pop hl
	pop af
	ld [hld], a
	pop af
	ld [hld], a
	dec hl
	pop af
	ld [hl], a
	ld hl, EnemySubStatus5
	bit 3, [hl]
	jr nz, .asm_ea67
	ld hl, $c735
	ld de, EnemyMonMoves
	ld bc, NUM_MOVES
	call CopyBytes

	ld hl, $c739
	ld de, EnemyMonPP
	ld bc, NUM_MOVES
	call CopyBytes

.asm_ea67
	ld a, [EnemyMonSpecies]
	ld [$c64e], a
	ld [CurPartySpecies], a
	ld [$d265], a
	ld a, [BattleType]
	cp $3
	jp z, .asm_ebd9
	callba Function10607f

	ld hl, UnknownText_0xedc9
	call PrintText

	call ClearSprites

	ld a, [$d265]
	dec a
	call CheckCaughtMon

	ld a, c
	push af
	ld a, [$d265]
	dec a
	call SetSeenAndCaughtMon

	pop af
	and a
	jr nz, .asm_eab7
	call Function2ead

	jr z, .asm_eab7
	ld hl, UnknownText_0xedf0
	call PrintText

	call ClearSprites

	ld a, [EnemyMonSpecies]
	ld [$d265], a
	ld a, $43
	call Predef

.asm_eab7
	ld a, [BattleType]
	cp $6
	jp z, .asm_ebd1
	cp $b
	jr nz, .asm_eac8
	ld hl, $d0ee
	set 6, [hl]

.asm_eac8
	ld a, [PartyCount]
	cp 6
	jr z, .asm_eb3c

	xor a
	ld [MonType], a
	call ClearSprites

	ld a, $6
	call Predef

	callba Function4db49

	ld a, [CurItem]
	cp FRIEND_BALL
	jr nz, .asm_eaf8

	ld a, [PartyCount]
	dec a
	ld hl, PartyMon1Happiness
	ld bc, PartyMon2 - PartyMon1
	call AddNTimes

	ld a, 200
	ld [hl], a

.asm_eaf8
	ld hl, UnknownText_0xedf5
	call PrintText

	ld a, [CurPartySpecies]
	ld [$d265], a
	call GetPokemonName

	call YesNoBox

	jp c, .asm_ebe2

	ld a, [PartyCount]
	dec a
	ld [CurPartyMon], a
	ld hl, PartyMonNicknames
	ld bc, PKMN_NAME_LENGTH
	call AddNTimes

	ld d, h
	ld e, l
	push de
	xor a
	ld [MonType], a
	ld b, 0
	callba Function116c1

	call Function4b6

	call Functione51

	pop hl
	ld de, StringBuffer1
	call InitName

	jp .asm_ebe2

.asm_eb3c
	call ClearSprites

	ld a, $9
	call Predef

	callba Function4db83

	ld a, $1
	call GetSRAMBank

	ld a, [$ad10]
	cp $14
	jr nz, .asm_eb5b
	ld hl, $d0ee
	set 7, [hl]

.asm_eb5b
	ld a, [CurItem]
	cp FRIEND_BALL
	jr nz, .asm_eb67
	ld a, 200
	ld [$ad41], a

.asm_eb67
	call CloseSRAM

	ld hl, UnknownText_0xedf5
	call PrintText

	ld a, [CurPartySpecies]
	ld [$d265], a
	call GetPokemonName

	call YesNoBox

	jr c, .asm_ebaf

	xor a
	ld [CurPartyMon], a
	ld a, BOXMON
	ld [MonType], a
	ld de, $d050
	ld b, $0
	callba Function116c1

	ld a, $1
	call GetSRAMBank

	ld hl, $d050
	ld de, $b082
	ld bc, $000b
	call CopyBytes

	ld hl, $b082
	ld de, StringBuffer1
	call InitName

	call CloseSRAM

.asm_ebaf
	ld a, $1
	call GetSRAMBank

	ld hl, $b082
	ld de, $d050
	ld bc, $000b
	call CopyBytes

	call CloseSRAM

	ld hl, UnknownText_0xedeb
	call PrintText

	call Function4b6
	call Functione51
	jr .asm_ebe2

.asm_ebd1
	callba Functione6ce
	jr .asm_ebe2

.asm_ebd9
	ld hl, UnknownText_0xedc9

.asm_ebdc
	call PrintText
	call ClearSprites

.asm_ebe2
	ld a, [BattleType]
	cp BATTLETYPE_TUTORIAL
	ret z
	cp 2
	ret z
	cp 6
	jr z, .asm_ec05

	ld a, [$c64e]
	and a
	jr z, .asm_ebfb

	call WhiteBGMap
	call ClearTileMap

.asm_ebfb
	ld hl, NumItems
	inc a
	ld [$d10c], a
	jp TossItem

.asm_ec05
	ld hl, $dc79
	dec [hl]
	ret
; ec0a


Table_0xec0a: ; ec0a
	dbw ULTRA_BALL, Function_0xec29
	dbw GREAT_BALL, Function_0xec2f
	dbw MOON_STONE, Function_0xec2f
	dbw HEAVY_BALL, Function_0xec50
	dbw LEVEL_BALL, Function_0xed8c
	dbw LURE_BALL,  Function_0xeccc
	dbw FAST_BALL,  Function_0xed68
	dbw MOON_BALL,  Function_0xecdd
	dbw LOVE_BALL,  Function_0xed12
	dbw PARK_BALL,  Function_0xec2f
	db $ff
; ec29


Function_0xec29: ; ec29
	sla b
	ret nc
	ld b, $ff
	ret
; ec2f


Function_0xec2f: ; ec2f
	ld a, b
	srl a
	add b
	ld b, a
	ret nc
	ld b, $ff
	ret
; ec38


GetPokedexEntryBank: ; ec38
	push hl
	push de
	ld a, [EnemyMonSpecies]
	rlca
	rlca
	and 3
	ld hl, .PokedexEntryBanks
	ld d, 0
	ld e, a
	add hl, de
	ld a, [hl]
	pop de
	pop hl
	ret

.PokedexEntryBanks

GLOBAL PokedexEntries1
GLOBAL PokedexEntries2
GLOBAL PokedexEntries3
GLOBAL PokedexEntries4

	db BANK(PokedexEntries1)
	db BANK(PokedexEntries2)
	db BANK(PokedexEntries3)
	db BANK(PokedexEntries4)
; ec50

Function_0xec50: ; ec50
	ld a, [EnemyMonSpecies]
	ld hl, PokedexDataPointerTable
	dec a
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, BANK(PokedexDataPointerTable)
	call GetFarHalfword

.SkipText
	call GetPokedexEntryBank
	call GetFarByte
	inc hl
	cp "@"
	jr nz, .SkipText

	call GetPokedexEntryBank
	push bc
	inc hl
	inc hl
	call GetFarHalfword

	srl h
	rr l
	ld b, h
	ld c, l
	srl b
	rr c
	srl b
	rr c
	srl b
	rr c
	srl b
	rr c
	call .asm_ec99

	srl b
	rr c
	call .asm_ec99

	ld a, h
	pop bc
	jr .asm_eca4

.asm_ec99
	push bc
	ld a, b
	cpl
	ld b, a
	ld a, c
	cpl
	ld c, a
	inc bc
	add hl, bc
	pop bc
	ret

.asm_eca4
	ld c, a
	cp $4
	jr c, .asm_ecbc

	ld hl, .table_ecc4
.asm_ecac
	ld a, c
	cp [hl]
	jr c, .asm_ecb4
	inc hl
	inc hl
	jr .asm_ecac

.asm_ecb4
	inc hl
	ld a, b
	add [hl]
	ld b, a
	ret nc
	ld b, $ff
	ret

.asm_ecbc
	ld a, b
	sub 20
	ld b, a
	ret nc
	ld b, $1
	ret

.table_ecc4
	db 8, 0
	db 12, 20
	db 16, 30
	db 255, 40
; eccc


Function_0xeccc: ; eccc
	ld a, [BattleType]
	cp $4
	ret nz
	ld a, b
	add a
	jr c, .asm_ecd9

	add b
	jr nc, .asm_ecdb

.asm_ecd9
	ld a, $ff

.asm_ecdb
	ld b, a
	ret
; ecdd


Function_0xecdd: ; ecdd

GLOBAL EvosAttacks
GLOBAL EvosAttacksPointers

	push bc
	ld a, [TempEnemyMonSpecies]
	dec a
	ld c, a
	ld b, 0
	ld hl, EvosAttacksPointers
	add hl, bc
	add hl, bc
	ld a, BANK(EvosAttacksPointers)
	call GetFarHalfword
	pop bc

	push bc
	ld a, BANK(EvosAttacks)
	call GetFarByte
	cp EVOLVE_ITEM
	pop bc
	ret nz

	inc hl
	inc hl
	inc hl

; It appears that Moon Stone's constant from Pokémon Red is used.
; No Pokémon evolve with Burn Heal, so
; Moon Balls always have a catch rate of 1x.
	push bc
	ld a, BANK(EvosAttacks)
	call GetFarByte
	cp MOON_STONE + 2 ; BURN_HEAL
	pop bc
	ret nz

	sla b
	jr c, .max
	sla b
	jr nc, .done
.max
	ld b, $ff
.done
	ret
; ed12


Function_0xed12: ; ed12
	ld a, [TempEnemyMonSpecies]
	ld c, a
	ld a, [TempBattleMonSpecies]
	cp c
	ret nz

	push bc
	ld a, [TempBattleMonSpecies]
	ld [CurPartySpecies], a
	xor a
	ld [MonType], a
	ld a, [CurBattleMon]
	ld [CurPartyMon], a
	callba GetGender
	jr c, .asm_ed66

	ld d, 0
	jr nz, .asm_ed39
	inc d
.asm_ed39

	push de
	ld a, [TempEnemyMonSpecies]
	ld [CurPartySpecies], a
	ld a, WILDMON
	ld [MonType], a
	callba GetGender
	jr c, .asm_ed65

	ld d, 0
	jr nz, .asm_ed52
	inc d
.asm_ed52

	ld a, d
	pop de
	cp d
	pop bc
	ret nz

	sla b
	jr c, .asm_ed62
	sla b
	jr c, .asm_ed62
	sla b
	ret nc
.asm_ed62
	ld b, $ff
	ret

.asm_ed65
	pop de

.asm_ed66
	pop bc
	ret
; ed68


Function_0xed68: ; ed68
	ld a, [TempEnemyMonSpecies]
	ld c, a
	ld hl, FleeMons
	ld d, 3

.loop
	ld a, BANK(FleeMons)
	call GetFarByte

	inc hl
	cp -1
	jr z, .next
	cp c
	jr nz, .next
	sla b
	jr c, .max

	sla b
	ret nc

.max
	ld b, $ff
	ret

.next
	dec d
	jr nz, .loop
	ret
; ed8c


Function_0xed8c: ; ed8c
	ld a, [BattleMonLevel]
	ld c, a
	ld a, [EnemyMonLevel]
	cp c
	ret nc
	sla b
	jr c, .asm_eda8

	srl c
	cp c
	ret nc
	sla b
	jr c, .asm_eda8

	srl c
	cp c
	ret nc
	sla b
	ret nc

.asm_eda8
	ld b, $ff
	ret
; edab


UnknownText_0xedab: ; 0xedab
	; It dodged the thrown BALL! This #MON can't be caught!
	text_jump UnknownText_0x1c5a5a
	db "@"
; 0xedb0

UnknownText_0xedb0: ; 0xedb0
	; You missed the #MON!
	text_jump UnknownText_0x1c5a90
	db "@"
; 0xedb5

UnknownText_0xedb5: ; 0xedb5
	; Oh no! The #MON broke free!
	text_jump UnknownText_0x1c5aa6
	db "@"
; 0xedba

UnknownText_0xedba: ; 0xedba
	; Aww! It appeared to be caught!
	text_jump UnknownText_0x1c5ac3
	db "@"
; 0xedbf

UnknownText_0xedbf: ; 0xedbf
	; Aargh! Almost had it!
	text_jump UnknownText_0x1c5ae3
	db "@"
; 0xedc4

UnknownText_0xedc4: ; 0xedc4
	; Shoot! It was so close too!
	text_jump UnknownText_0x1c5afa
	db "@"
; 0xedc9

UnknownText_0xedc9: ; 0xedc9
	; Gotcha! @ was caught!@ @
	text_jump UnknownText_0x1c5b17
	start_asm
; 0xedce

Functionedce: ; edce
	call WaitSFX
	push bc
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	ld de, MUSIC_CAPTURE
	call PlayMusic
	pop bc
	ld hl, UnknownText_0xede6
	ret
; ede6

UnknownText_0xede6: ; 0xede6
	; @
	text_jump UnknownText_0x1c5b35
	db "@"
; 0xedeb

UnknownText_0xedeb: ; 0xedeb
	; was sent to BILL's PC.
	text_jump UnknownText_0x1c5b38
	db "@"
; 0xedf0

UnknownText_0xedf0: ; 0xedf0
	; 's data was newly added to the #DEX.@ @
	text_jump UnknownText_0x1c5b53
	db "@"
; 0xedf5

UnknownText_0xedf5: ; 0xedf5
	; Give a nickname to @ ?
	text_jump UnknownText_0x1c5b7f
	db "@"
; 0xedfa

; known jump sources: e8c9 (3:68c9), f7a0 (3:77a0)
Functionedfa: ; edfa (3:6dfa)
	callba Function2715c
	ret

TownMap: ; ee01
	callba Function91ae1
	ret
; ee08


Bicycle: ; ee08
	callba Functiond0b3
	ret
; ee0f


MoonStone:
FireStone:
Thunderstone:
WaterStone:
LeafStone:
SunStone: ; ee0f
	ld b, $5
	call Functionf1f9

	jp c, .asm_ee38

	ld a, PartyMon1Item - PartyMon1
	call GetPartyParamLocation

	ld a, [hl]
	cp EVERSTONE
	jr z, .asm_ee35

	ld a, $1
	ld [$d1e9], a
	callba Function421d8

	ld a, [$d268]
	and a
	jr z, .asm_ee35

	jp Functionf795

.asm_ee35
	call WontHaveAnyEffectMessage

.asm_ee38
	xor a
	ld [$d0ec], a
	ret
; ee3d


HpUp:
Protein:
Iron:
Carbos:
Calcium: ; ee3d
	ld b, $1
	call Functionf1f9

	jp c, Functionee9f

	call Functioneef5

	call Functioneed9

	ld a, PartyMon1StatExp - PartyMon1
	call GetPartyParamLocation

	add hl, bc
	ld a, [hl]
	cp 100
	jr nc, Functionee83

	add 10
	ld [hl], a
	call Functionee8c

	call Functioneed9

	ld hl, Strings_eeab
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, StringBuffer2
	ld bc, $000d
	call CopyBytes

	call Functionf780

	ld hl, UnknownText_0xeea6
	call PrintText

	ld c, $2
	callba ChangeHappiness

	jp Functionf795


Functionee83: ; ee83
	ld hl, WontHaveAnyEffectText
	call PrintText
	jp ClearPalettes
; ee8c


Functionee8c: ; ee8c
	ld a, PartyMon1MaxHP - PartyMon1
	call GetPartyParamLocation
	ld d, h
	ld e, l
	ld a, PartyMon1HPExp - 1 - PartyMon1
	call GetPartyParamLocation
	ld b, $1
	ld a, $c
	jp Predef
; ee9f

Functionee9f: ; ee9f
	xor a
	ld [$d0ec], a
	jp ClearPalettes
; eea6


UnknownText_0xeea6: ; 0xeea6
	; 's @  rose.
	text_jump UnknownText_0x1c5b9a
	db "@"
; 0xeeab


Strings_eeab: ; eeab
	dw .health
	dw .attack
	dw .defense
	dw .speed
	dw .special

.health  db "HEALTH@"
.attack  db "ATTACK@"
.defense db "DEFENSE@"
.speed   db "SPEED@"
.special db "SPECIAL@"
; eed9


Functioneed9: ; eed9
	ld a, [CurItem]
	ld hl, Table_eeeb
.next
	cp [hl]
	inc hl
	jr z, .asm_eee6
	inc hl
	jr .next

.asm_eee6
	ld a, [hl]
	ld c, a
	ld b, 0
	ret
; eeeb

Table_eeeb: ; eeeb
	db HP_UP,   PartyMon1HPExp  - PartyMon1StatExp
	db PROTEIN, PartyMon1AtkExp - PartyMon1StatExp
	db IRON,    PartyMon1DefExp - PartyMon1StatExp
	db CARBOS,  PartyMon1SpdExp - PartyMon1StatExp
	db CALCIUM, PartyMon1SpcExp - PartyMon1StatExp
; eef5


Functioneef5: ; eef5
	ld a, [CurPartySpecies]
	ld [CurSpecies], a
	ld [$d265], a
	ld a, PartyMon1Level - PartyMon1
	call GetPartyParamLocation
	ld a, [hl]
	ld [CurPartyLevel], a
	call GetBaseData
	ld a, [CurPartyMon]
	ld hl, PartyMonNicknames
	call GetNick
	ret
; 0xef14


RareCandy: ; ef14
	ld b, $1
	call Functionf1f9

	jp c, Functionee9f

	call Functioneef5

	ld a, PartyMon1Level - PartyMon1
	call GetPartyParamLocation

	ld a, [hl]
	cp MAX_LEVEL
	jp nc, Functionee83

	inc a
	ld [hl], a
	ld [CurPartyLevel], a
	push de
	ld d, a
	callba Function50e47

	pop de
	ld a, $8
	call GetPartyParamLocation

	ld a, [hMultiplicand]
	ld [hli], a
	ld a, [$ffb5]
	ld [hli], a
	ld a, [$ffb6]
	ld [hl], a

	ld a, $24
	call GetPartyParamLocation
	ld a, [hli]
	ld b, a
	ld c, [hl]
	push bc
	call Functionee8c

	ld a, $25
	call GetPartyParamLocation

	pop bc
	ld a, [hld]
	sub c
	ld c, a
	ld a, [hl]
	sbc b
	ld b, a
	dec hl
	ld a, [hl]
	add c
	ld [hld], a
	ld a, [hl]
	adc b
	ld [hl], a
	callba Function2709e

	ld a, $f8
	call Functionf24a

	xor a
	ld [MonType], a
	ld a, $1f
	call Predef

	hlcoord 9, 0
	ld b, 10
	ld c, 9
	call TextBox

	hlcoord 11, 1
	ld bc, $0004
	ld a, $28
	call Predef

	call Functiona80

	xor a
	ld [MonType], a
	ld a, [CurPartySpecies]
	ld [$d265], a
	ld a, $1a
	call Predef

	xor a
	ld [$d1e9], a
	callba Function421d8

	jp Functionf795
; efad


HealPowder: ; efad
	ld b, $1
	call Functionf1f9

	jp c, Functionf29e

	call Functionefda

	cp $0
	jr nz, .asm_efc9
	ld c, $f
	callba ChangeHappiness

	call LooksBitterMessage

	ld a, $0

.asm_efc9
	jp Functionf09e
; efcc


Antidote:
BurnHeal:
IceHeal:
Awakening:
ParlyzHeal:
FullHeal:
Psncureberry:
Przcureberry:
BurntBerry:
IceBerry:
MintBerry:
Miracleberry: ; efcc
	ld b, $1
	call Functionf1f9
	jp c, Functionf29e

Functionefd4: ; efd4
	call Functionefda
	jp Functionf09e
; efda


; known jump sources: efb5 (3:6fb5), efd4 (3:6fd4)
Functionefda: ; efda (3:6fda)
	call Functionf30d
	ld a, $1
	ret z
	call Functionf058
	ld a, $20
	call GetPartyParamLocation
	ld a, [hl]
	and c
	jr nz, .asm_eff4
	call Functionf009
	ld a, $1
	ret nc
	ld b, $f9
.asm_eff4
	xor a
	ld [hl], a
	ld a, b
	ld [PartyMenuActionText], a ; $d141
	call Functionf030
	call Functionf780
	call Functionf279
	call Functionf795
	ld a, $0
	ret

; known jump sources: efec (3:6fec)
Functionf009: ; f009 (3:7009)
	call Functionf2a6
	jr nc, .asm_f01c
	ld a, [PlayerSubStatus3] ; $c66a
	bit 7, a
	jr z, .asm_f01c
	ld a, c
	cp $ff
	jr nz, .asm_f01c
	scf
	ret
.asm_f01c
	and a
	ret

; known jump sources: f156 (3:7156), f1c7 (3:71c7)
Functionf01e: ; f01e (3:701e)
	call Functionf2a6
	ret nc
	ld a, $22
	call GetPartyParamLocation
	ld a, [hli]
	ld [BattleMonHP], a ; $c63c
	ld a, [hld]
	ld [$c63d], a
	ret

; known jump sources: effa (3:6ffa), f153 (3:7153)
Functionf030: ; f030 (3:7030)
	call Functionf2a6
	ret nc
	xor a
	ld [BattleMonStatus], a ; $c63a
	ld hl, PlayerSubStatus5 ; $c66c
	res 0, [hl]
	ld hl, PlayerSubStatus1 ; $c668
	res 0, [hl]
	call Functionf058
	ld a, c
	cp $ff
	jr nz, .asm_f04f
	ld hl, PlayerSubStatus3 ; $c66a
	res 7, [hl]
.asm_f04f
	push bc
	callba Function365d7
	pop bc
	ret

; known jump sources: efe0 (3:6fe0), f042 (3:7042)
Functionf058: ; f058 (3:7058)
	push hl
	ld a, [CurItem] ; $d106
	ld hl, Table_f071
	ld bc, 3
.next
	cp [hl]
	jr z, .asm_f068
	add hl, bc
	jr .next

.asm_f068
	inc hl
	ld b, [hl]
	inc hl
	ld a, [hl]
	ld c, a
	cp %11111111
	pop hl
	ret
; f071 (3:7071)

Table_f071: ; f071
; item, party menu action text, status
	db ANTIDOTE,     $f0, 1 << PSN
	db BURN_HEAL,    $f1, 1 << BRN
	db ICE_HEAL,     $f2, 1 << FRZ
	db AWAKENING,    $f3, SLP
	db PARLYZ_HEAL,  $f4, 1 << PAR
	db FULL_HEAL,    $f6, %11111111
	db FULL_RESTORE, $f6, %11111111
	db HEAL_POWDER,  $f6, %11111111
	db PSNCUREBERRY, $f0, 1 << PSN
	db PRZCUREBERRY, $f4, 1 << PAR
	db BURNT_BERRY,  $f2, 1 << FRZ
	db ICE_BERRY,    $f1, 1 << BRN
	db MINT_BERRY,   $f3, SLP
	db MIRACLEBERRY, $f6, %11111111
	db -1, 0, 0
; f09e

; known jump sources: efc9 (3:6fc9), efd7 (3:6fd7), f0c5 (3:70c5), f0d3 (3:70d3), f141 (3:7141), f183 (3:7183), f189 (3:7189), f1a6 (3:71a6)
Functionf09e: ; f09e (3:709e)
	ld hl, Jumptable_f0a3
	rst JumpTable
	ret

; no known jump sources
Jumptable_f0a3: ; f0a3 (3:70a3)
	dw Functionf2a2
	dw Functionf299
	dw Functionf29e


RevivalHerb: ; f0a9
	ld b, $1
	call Functionf1f9
	jp c, Functionf29e

	call Functionf0d6
	cp 0
	jr nz, .asm_f0c5

	ld c, $11
	callba ChangeHappiness
	call LooksBitterMessage
	ld a, 0

.asm_f0c5
	jp Functionf09e
; f0c8


Revive:
MaxRevive: ; f0c8
	ld b, $1
	call Functionf1f9
	jp c, Functionf29e

	call Functionf0d6
	jp Functionf09e
; f0d6


Functionf0d6: ; f0d6
	call Functionf30d
	ld a, 1
	ret nz
	ld a, [IsInBattle]
	and a
	jr z, .asm_f104

	ld a, [CurPartyMon]
	ld c, a
	ld d, 0
	ld hl, $c6fc
	ld b, CHECK_FLAG
	ld a, PREDEF_FLAG
	call Predef
	ld a, c
	and a
	jr z, .asm_f104

	ld a, [CurPartyMon]
	ld c, a
	ld hl, $c664
	ld b, SET_FLAG
	ld a, PREDEF_FLAG
	call Predef

.asm_f104
	xor a
	ld [Danger], a
	ld a, [CurItem]
	cp REVIVE
	jr z, .asm_f114

	call Functionf2c3
	jr .asm_f117

.asm_f114
	call Functionf2ba

.asm_f117
	call Functionf1db
	ld a, $f7
	ld [PartyMenuActionText], a
	call Functionf279
	call Functionf795
	ld a, 0
	ret
; f128


FullRestore: ; f128
	ld b, 1
	call Functionf1f9
	jp c, Functionf29e

	call Functionf30d
	jp z, Functionf299

	call Functionf31b
	jr c, .asm_f13e

	jp Functionefd4

.asm_f13e
	call Functionf144
	jp Functionf09e
; f144


Functionf144: ; f144
	xor a
	ld [Danger], a
	call Functionf2c3
	ld a, PartyMon1Status - PartyMon1
	call GetPartyParamLocation
	xor a
	ld [hli], a
	ld [hl], a
	call Functionf030
	call Functionf01e
	call Functionf1db
	ld a, $f5
	ld [PartyMenuActionText], a
	call Functionf279
	call Functionf795
	ld a, 0
	ret
; f16a


BitterBerry: ; f16a
	ld hl, PlayerSubStatus3
	bit SUBSTATUS_CONFUSED, [hl]
	ld a, 1
	jr z, .done

	res SUBSTATUS_CONFUSED, [hl]
	xor a
	ld [hBattleTurn], a
	call Functionf789

	ld hl, ConfusedNoMoreText
	call StdBattleTextBox

	ld a, 0

.done
	jp Functionf09e
; f186


MaxPotion:
HyperPotion:
SuperPotion:
Potion:
FreshWater:
SodaPop:
Lemonade:
MoomooMilk:
Ragecandybar:
BerryJuice:
Berry:
GoldBerry: ; f186
	call Functionf1a9
	jp Functionf09e
; f18c


Energypowder: ; f18c
	ld c, $f
	jr Functionf192
; f190

EnergyRoot: ; f190
	ld c, $10
; f192

Functionf192: ; f192
	push bc
	call Functionf1a9
	pop bc
	cp 0
	jr nz, .asm_f1a6

	callba ChangeHappiness
	call LooksBitterMessage
	ld a, 0

.asm_f1a6
	jp Functionf09e
; f1a9


; known jump sources: f186 (3:7186), f193 (3:7193)
Functionf1a9: ; f1a9 (3:71a9)
	ld b, 1
	call Functionf1f9
	ld a, 2
	ret c

	call Functionf30d
	ld a, 1
	ret z

	call Functionf31b
	ld a, 1
	ret nc

	xor a
	ld [Danger], a ; $c2a6
	call Functionf395
	call Functionf2d1
	call Functionf01e
	call Functionf1db
	ld a, $f5
	ld [PartyMenuActionText], a ; $d141
	call Functionf279
	call Functionf795
	ld a, 0
	ret

; known jump sources: f117 (3:7117), f159 (3:7159), f1ca (3:71ca), f3f7 (3:73f7), f408 (3:7408)
Functionf1db: ; f1db (3:71db)
	push de
	ld de, SFX_POTION
	call WaitPlaySFX
	pop de
	ld a, [CurPartyMon] ; $d109
	hlcoord 11, 0
	ld bc, $28
	call AddNTimes
	ld a, $2
	ld [$d10a], a
	ld a, $b
	jp Predef

; known jump sources: ee11 (3:6e11), ee3f (3:6e3f), ef16 (3:6f16), efaf (3:6faf), efce (3:6fce), f0ab (3:70ab), f0ca (3:70ca), f12a (3:712a), f1ab (3:71ab), f5c7 (3:75c7)
Functionf1f9: ; f1f9 (3:71f9)
	call Functionf20b
	ret c

	ld a, [CurPartySpecies] ; $d108
	cp EGG
	jr nz, .asm_f209

	call CantUseOnEggMessage
	scf
	ret

.asm_f209
	and a
	ret

; known jump sources: f1f9 (3:71f9)
Functionf20b: ; f20b (3:720b)
	ld a, b
	ld [PartyMenuActionText], a ; $d141
	push hl
	push de
	push bc
	call WhiteBGMap
	call Functionf21c
	pop bc
	pop de
	pop hl
	ret

; known jump sources: f215 (3:7215), f41f (3:741f)
Functionf21c: ; f21c (3:721c)
	callba Function5004f
	callba Function50405
	callba Function503e0
	callba WritePartyMenuTilemap
	callba PrintPartyMenuText
	call WaitBGMap
	call Function32f9
	call DelayFrame
	callba PartyMenuSelect
	ret

; known jump sources: ef6d (3:6f6d), f28a (3:728a), f40d (3:740d)
Functionf24a: ; f24a (3:724a)
	ld [PartyMenuActionText], a ; $d141
	ld a, [CurPartySpecies] ; $d108
	push af
	ld a, [CurPartyMon] ; $d109
	push af
	push hl
	push de
	push bc
	callba WritePartyMenuTilemap
	callba Function50566
	call WaitBGMap
	call Function32f9
	call DelayFrame
	pop bc
	pop de
	pop hl
	pop af
	ld [CurPartyMon], a ; $d109
	pop af
	ld [CurPartySpecies], a ; $d108
	ret

; known jump sources: f000 (3:7000), f11f (3:711f), f161 (3:7161), f1d2 (3:71d2)
Functionf279: ; f279 (3:7279)
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	ld hl, TileMap ; $c4a0 (aliases: SpritesEnd)
	ld bc, TileMapEnd - TileMap
	ld a, " "
	call ByteFill
	ld a, [PartyMenuActionText] ; $d141
	call Functionf24a
	ld a, $1
	ld [hBGMapMode], a ; $ff00+$d4
	ld c, $32
	call DelayFrames
	jp Functiona80

; known jump sources: f133 (3:7133)
Functionf299: ; f299 (3:7299)
	call WontHaveAnyEffectMessage
	jr Functionf2a2

; known jump sources: efb2 (3:6fb2), efd1 (3:6fd1), f0ae (3:70ae), f0cd (3:70cd), f12d (3:712d)
Functionf29e: ; f29e (3:729e)
	xor a
	ld [$d0ec], a

; known jump sources: f29c (3:729c)
Functionf2a2: ; f2a2 (3:72a2)
	call ClearPalettes
	ret

; known jump sources: f009 (3:7009), f01e (3:701e), f030 (3:7030)
Functionf2a6: ; f2a6 (3:72a6)
	ld a, [IsInBattle] ; $d22d (aliases: EnemyMonEnd)
	and a
	ret z
	ld a, [CurPartyMon] ; $d109
	push hl
	ld hl, CurBattleMon ; $d0d4
	cp [hl]
	pop hl
	jr nz, .asm_f2b8
	scf
	ret
.asm_f2b8
	xor a
	ret

; known jump sources: f114 (3:7114)
Functionf2ba: ; f2ba (3:72ba)
	call Functionf36f
	srl d
	rr e
	jr asm_f2c6

; known jump sources: f10f (3:710f), f148 (3:7148), f2f5 (3:72f5)
Functionf2c3: ; f2c3 (3:72c3)
	call Functionf36f
asm_f2c6: ; f2c6 (3:72c6)
	ld a, $22
	call GetPartyParamLocation
	ld [hl], d
	inc hl
	ld [hl], e
	jp Functionf328

; known jump sources: f1c4 (3:71c4), f405 (3:7405)
Functionf2d1: ; f2d1 (3:72d1)
	ld a, $23
	call GetPartyParamLocation
	ld a, [hl]
	add e
	ld [hld], a
	ld a, [hl]
	adc d
	ld [hl], a
	jr c, .asm_f2f5
	call Functionf328
	ld a, $23
	call GetPartyParamLocation
	ld d, h
	ld e, l
	ld a, $25
	call GetPartyParamLocation
	ld a, [de]
	sub [hl]
	dec de
	dec hl
	ld a, [de]
	sbc [hl]
	jr c, .asm_f2f8
.asm_f2f5
	call Functionf2c3
.asm_f2f8
	ret

; known jump sources: f3f3 (3:73f3)
Functionf2f9: ; f2f9 (3:72f9)
	ld a, $23
	call GetPartyParamLocation
	ld a, [hl]
	sub e
	ld [hld], a
	ld a, [hl]
	sbc d
	ld [hl], a
	jr nc, .asm_f309
	xor a
	ld [hld], a
	ld [hl], a
.asm_f309
	call Functionf328
	ret

; known jump sources: efda (3:6fda), f0d6 (3:70d6), f130 (3:7130), f1b1 (3:71b1), f3ed (3:73ed), f402 (3:7402), f432 (3:7432)
Functionf30d: ; f30d (3:730d)
	push de
	call Functionf35f
	call Functionf348
	call Functionf356
	ld a, d
	or e
	pop de
	ret

; known jump sources: f136 (3:7136), f1b7 (3:71b7), f437 (3:7437)
Functionf31b: ; f31b (3:731b)
	call Functionf356
	ld h, d
	ld l, e
	call Functionf36f
	ld a, l
	sub e
	ld a, h
	sbc d
	ret

; known jump sources: f2ce (3:72ce), f2de (3:72de), f309 (3:7309)
Functionf328: ; f328 (3:7328)
	ld a, $22
	call GetPartyParamLocation
	ld a, [hli]
	ld [$d1ef], a
	ld a, [hl]
	ld [$d1ee], a
	ret
; f336 (3:7336)

Functionf336: ; f336
	ld a, d
	ld [$d1ef], a
	ld a, e
	ld [$d1ee], a
	ret
; f33f

Functionf33f: ; f33f
	ld a, [$d1ef]
	ld d, a
	ld a, [$d1ee]
	ld e, a
	ret
; f348

; known jump sources: f311 (3:7311)
Functionf348: ; f348 (3:7348)
	ld a, $22
	call GetPartyParamLocation
	ld a, [hli]
	ld [$d1ed], a
	ld a, [hl]
	ld [$d1ec], a
	ret

; known jump sources: f314 (3:7314), f31b (3:731b)
Functionf356: ; f356 (3:7356)
	ld a, [$d1ed]
	ld d, a
	ld a, [$d1ec]
	ld e, a
	ret

; known jump sources: f30e (3:730e)
Functionf35f: ; f35f (3:735f)
	push hl
	ld a, $24
	call GetPartyParamLocation
	ld a, [hli]
	ld [Buffer2], a ; $d1eb (aliases: MovementType)
	ld a, [hl]
	ld [Buffer1], a ; $d1ea (aliases: MagikarpLength)
	pop hl
	ret

; known jump sources: f2ba (3:72ba), f2c3 (3:72c3), f320 (3:7320)
Functionf36f: ; f36f (3:736f)
	ld a, [Buffer2] ; $d1eb (aliases: MovementType)
	ld d, a
	ld a, [Buffer1] ; $d1ea (aliases: MagikarpLength)
	ld e, a
	ret

; known jump sources: f3f0 (3:73f0), f3fb (3:73fb)
Functionf378: ; f378 (3:7378)
	push bc
	ld a, $24
	call GetPartyParamLocation
	ld a, [hli]
	ld [hPastLeadingZeroes], a ; $ff00+$b3 (aliases: hDividend, hProduct)
	ld a, [hl]
	ld [hQuotient], a ; $ff00+$b4 (aliases: hMultiplicand)
	ld a, $5
	ld [hDivisor], a ; $ff00+$b7 (aliases: hMultiplier)
	ld b, $2
	call Divide
	ld a, [$FF00+$b5]
	ld d, a
	ld a, [$FF00+$b6]
	ld e, a
	pop bc
	ret

; known jump sources: f1c1 (3:71c1)
Functionf395: ; f395 (3:7395)
	push hl
	ld a, [CurItem] ; $d106
	ld hl, Tablef3af
	ld d, a
.next
	ld a, [hli]
	cp -1
	jr z, .asm_f3a9
	cp d
	jr z, .done
	inc hl
	inc hl
	jr .next

.asm_f3a9
	scf
.done
	ld e, [hl]
	inc hl
	ld d, [hl]
	pop hl
	ret
; f3af (3:73af)

Tablef3af: ; f3af
	dbw FRESH_WATER,   50
	dbw SODA_POP,      60
	dbw LEMONADE,      80
	dbw HYPER_POTION, 200
	dbw SUPER_POTION,  50
	dbw POTION,        20
	dbw MAX_POTION,   999
	dbw FULL_RESTORE, 999
	dbw MOOMOO_MILK,  100
	dbw BERRY,         10
	dbw GOLD_BERRY,    30
	dbw ENERGYPOWDER,  50
	dbw ENERGY_ROOT,  200
	dbw RAGECANDYBAR,  20
	dbw BERRY_JUICE,   20
	dbw -1,             0
; f3df

Functionf3df: ; f3df (3:73df)
	ld a, [$d0d8]
	dec a
	ld b, a
	call Functionf419
	jr c, .asm_f413
	ld a, b
	ld [CurPartyMon], a ; $d109
	call Functionf30d
	call Functionf378
	call Functionf2f9
	push bc
	call Functionf1db
	pop bc
	call Functionf378
	ld a, c
	ld [CurPartyMon], a ; $d109
	call Functionf30d
	call Functionf2d1
	call Functionf1db
	ld a, $f5
	call Functionf24a
	call Functiona36
.asm_f413
	ld a, b
	inc a
	ld [$d0d8], a
	ret

; known jump sources: f3e4 (3:73e4), f448 (3:7448)
Functionf419: ; f419 (3:7419)
	push bc
	ld a, $1
	ld [PartyMenuActionText], a ; $d141
	call Functionf21c
	pop bc
	jr c, .asm_f43e
	ld a, [$d0d8]
	dec a
	ld c, a
	ld a, b
	cp c
	jr z, .asm_f440
	ld a, c
	ld [CurPartyMon], a ; $d109
	call Functionf30d
	jr z, .asm_f440
	call Functionf31b
	jr nc, .asm_f440
	xor a
	ret
.asm_f43e
	scf
	ret
.asm_f440
	push bc
	ld hl, UnknownText_0xf44a
	call Function1d67
	pop bc
	jr Functionf419
; f44a (3:744a)

UnknownText_0xf44a: ; 0xf44a
	; That can't be used on this #MON.
	text_jump UnknownText_0x1c5bac
	db "@"
; 0xf44f


EscapeRope: ; f44f
	xor a
	ld [$d0ec], a
	callba Functioncb95

	ld a, [$d0ec]
	cp 1
	call z, Functionf795
	ret
; f462


SuperRepel: ; f462
	ld b, 200
	jr Function_0xf46c
; f466

MaxRepel: ; f466
	ld b, 250
	jr Function_0xf46c
; f466

Repel: ; f46a
	ld b, 100
; f46c

Function_0xf46c: ; f46c
	ld a, [$dca1]
	and a
	ld hl, UnknownText_0xf47d
	jp nz, PrintText
	ld a, b
	ld [$dca1], a
	jp Functionf789
; f47d

UnknownText_0xf47d: ; 0xf47d
	; The REPEL used earlier is still in effect.
	text_jump UnknownText_0x1c5bcd
	db "@"
; 0xf482


XAccuracy: ; f482
	ld hl, PlayerSubStatus4
	bit 0, [hl]
	jp nz, WontHaveAnyEffect_NotUsedMessage
	set 0, [hl]
	jp Functionf789
; f48f


PokeDoll: ; f48f
	ld a, [IsInBattle]
	dec a
	jr nz, .asm_f4a6
	inc a
	ld [$d232], a
	ld a, [$d0ee]
	and $c0
	or $2
	ld [$d0ee], a
	jp Functionf789

.asm_f4a6
	xor a
	ld [$d0ec], a
	ret
; f4ab


GuardSpec: ; f4ab
	ld hl, PlayerSubStatus4
	bit 1, [hl]
	jp nz, WontHaveAnyEffect_NotUsedMessage
	set 1, [hl]
	jp Functionf789
; f4b8


DireHit: ; f4b8
	ld hl, PlayerSubStatus4
	bit 2, [hl]
	jp nz, WontHaveAnyEffect_NotUsedMessage
	set 2, [hl]
	jp Functionf789
; f4c5


XAttack:
XDefend:
XSpeed:
XSpecial: ; f4c5
	call Functionf789

	ld a, [CurItem]
	ld hl, Tablef504

.asm_f4ce
	cp [hl]
	jr z, .asm_f4d5
	inc hl
	inc hl
	jr .asm_f4ce

.asm_f4d5
	inc hl
	ld b, [hl]
	xor a
	ld [hBattleTurn], a
	ld [AttackMissed], a
	ld [$c70d], a
	callba Function361ef
	call WaitSFX

	callba BattleCommand8c
	callba BattleCommand8e

	ld a, [CurBattleMon]
	ld [CurPartyMon], a
	ld c, $3
	callba ChangeHappiness
	ret
; f504

Tablef504: ; f504
	db X_ATTACK,  0
	db X_DEFEND,  1
	db X_SPEED,   2
	db X_SPECIAL, 3
; f50c


PokeFlute: ; f50c
	ld a, [IsInBattle]
	and a
	jr nz, .asm_f512

.asm_f512
	xor a
	ld [$d002], a
	ld b, $f8
	ld hl, PartyMon1Status
	call .asm_f554

	ld a, [IsInBattle]
	cp $1
	jr z, .asm_f52b
	ld hl, OTPartyMon1Status
	call .asm_f554

.asm_f52b
	ld hl, BattleMonStatus
	ld a, [hl]
	and b
	ld [hl], a
	ld hl, EnemyMonStatus
	ld a, [hl]
	and b
	ld [hl], a
	ld a, [$d002]
	and a
	ld hl, UnknownText_0xf56c
	jp z, PrintText
	ld hl, UnknownText_0xf576
	call PrintText

	ld a, [Danger]
	and $80
	jr nz, .asm_f54e

.asm_f54e
	ld hl, UnknownText_0xf571
	jp PrintText


.asm_f554
	ld de, $0030
	ld c, $6

.asm_f559
	ld a, [hl]
	push af
	and $7
	jr z, .asm_f564
	ld a, $1
	ld [$d002], a

.asm_f564
	pop af
	and b
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_f559
	ret
; f56c


UnknownText_0xf56c: ; 0xf56c
	; Played the # FLUTE. Now, that's a catchy tune!
	text_jump UnknownText_0x1c5bf9
	db "@"
; 0xf571

UnknownText_0xf571: ; 0xf571
	; All sleeping #MON woke up.
	text_jump UnknownText_0x1c5c28
	db "@"
; 0xf576

UnknownText_0xf576: ; 0xf576
	; played the # FLUTE.@ @
	text_jump UnknownText_0x1c5c44
	start_asm
; 0xf57b


Function_0xf57b: ; f57b
	ld a, [IsInBattle]
	and a
	jr nz, .asm_f58c

	push de
	ld de, SFX_POKEFLUTE
	call WaitPlaySFX
	call WaitSFX
	pop de

.asm_f58c
	jp Function13e0
; f58f


BlueCard: ; f58f
	ld hl, .bluecardtext
	jp Function2012

.bluecardtext
	text_jump UnknownText_0x1c5c5e
	db "@"
; f59a


CoinCase: ; f59a
	ld hl, .coincasetext
	jp Function2012

.coincasetext
	text_jump UnknownText_0x1c5c7b
	db "@"
; f5a5


OldRod: ; f5a5
	ld e, $0
	jr Function_0xf5b1
; f5a9

GoodRod: ; f5a9
	ld e, $1
	jr Function_0xf5b1
; f5ad

SuperRod: ; f5ad
	ld e, $2
	jr Function_0xf5b1
; f5b1

Function_0xf5b1: ; f5b1
	callba Functioncf8e
	ret
; f5b8


Itemfinder: ; f5b8
	callba Function12580
	ret
; f5bf


MaxElixer:
PpUp:
Ether:
MaxEther:
Elixer:
Mysteryberry: ; f5bf
	ld a, [CurItem]
	ld [$d002], a

.asm_f5c5
	ld b, $1
	call Functionf1f9
	jp c, Functionf6e0

.asm_f5cd
	ld a, [$d002]
	cp MAX_ELIXER
	jp z, Functionf6af
	cp ELIXER
	jp z, Functionf6af

	ld hl, UnknownText_0xf725
	ld a, [$d002]
	cp PP_UP
	jr z, .asm_f5e7
	ld hl, UnknownText_0xf72a

.asm_f5e7
	call PrintText

	ld a, [CurMoveNum]
	push af
	xor a
	ld [CurMoveNum], a
	ld a, $2
	ld [$d235], a
	callba Function3e4bc

	pop bc
	ld a, b
	ld [CurMoveNum], a
	jr nz, .asm_f5c5
	ld hl, PartyMon1Moves
	ld bc, PartyMon2 - PartyMon1
	call Functionf963

	push hl
	ld a, [hl]
	ld [$d265], a
	call GetMoveName
	call CopyName1

	pop hl
	ld a, [$d002]
	cp PP_UP
	jp nz, Functionf6a7

	ld a, [hl]
	cp $a6
	jr z, .asm_f62f

	ld bc, $0015
	add hl, bc
	ld a, [hl]
	cp $c0
	jr c, .asm_f637

.asm_f62f
	ld hl, UnknownText_0xf72f
	call PrintText
	jr .asm_f5cd

.asm_f637
	ld a, [hl]
	add $40
	ld [hl], a
	ld a, $1
	ld [$d265], a
	call Functionf84c
	call Functionf780

	ld hl, UnknownText_0xf734
	call PrintText

Functionf64c: ; f64c
	call ClearPalettes
	jp Functionf795
; f652

Functionf652: ; f652
	ld a, [IsInBattle]
	and a
	jr z, .asm_f66c
	ld a, [CurPartyMon]
	ld b, a
	ld a, [CurBattleMon]
	cp b
	jr nz, .asm_f66c
	ld a, [PlayerSubStatus5]
	bit 3, a
	jr nz, .asm_f66c
	call .asm_f677

.asm_f66c
	call Functionf780
	ld hl, UnknownText_0xf739
	call PrintText
	jr Functionf64c

.asm_f677
	ld a, [CurPartyMon]
	ld hl, PartyMon1Moves
	ld bc, PartyMon2 - PartyMon1
	call AddNTimes
	ld de, BattleMonMoves
	ld b, NUM_MOVES
.asm_f688
	ld a, [de]
	and a
	jr z, .asm_f6a6
	cp [hl]
	jr nz, .asm_f6a1
	push hl
	push de
	push bc
	rept NUM_MOVES + 2 ; BattleMonPP - BattleMonMoves
	inc de
	endr
	ld bc, PartyMon1PP - PartyMon1Moves
	add hl, bc
	ld a, [hl]
	ld [de], a
	pop bc
	pop de
	pop hl

.asm_f6a1
	inc hl
	inc de
	dec b
	jr nz, .asm_f688

.asm_f6a6
	ret
; f6a7

Functionf6a7: ; f6a7
	call Functionf6e8
	jr nz, Functionf652
	jp Functionf6dd
; f6af

Functionf6af: ; f6af
	xor a
	ld hl, $cfa9
	ld [hli], a
	ld [hl], a
	ld b, NUM_MOVES
.asm_f6b7
	push bc
	ld hl, PartyMon1Moves
	ld bc, PartyMon2 - PartyMon1
	call Functionf963
	ld a, [hl]
	and a
	jr z, .asm_f6ce

	call Functionf6e8
	jr z, .asm_f6ce
	ld hl, $cfaa
	inc [hl]

.asm_f6ce
	ld hl, $cfa9
	inc [hl]
	pop bc
	dec b
	jr nz, .asm_f6b7
	ld a, [$cfaa]
	and a
	jp nz, Functionf652

Functionf6dd: ; f6dd
	call WontHaveAnyEffectMessage

Functionf6e0: ; f6e0
	call ClearPalettes
	xor a
	ld [$d0ec], a
	ret
; f6e8

Functionf6e8: ; f6e8
	xor a
	ld [MonType], a
	call Functionf8ec
	ld hl, PartyMon1PP
	ld bc, PartyMon2 - PartyMon1
	call Functionf963
	ld a, [$d265]
	ld b, a
	ld a, [hl]
	and $3f
	cp b
	jr nc, .asm_f723

	ld a, [$d002]
	cp MAX_ELIXER
	jr z, .asm_f71d
	cp MAX_ETHER
	jr z, .asm_f71d

	ld c, 5
	cp MYSTERYBERRY
	jr z, .asm_f715

	ld c, 10

.asm_f715
	ld a, [hl]
	and $3f
	add c
	cp b
	jr nc, .asm_f71d
	ld b, a

.asm_f71d
	ld a, [hl]
	and $c0
	or b
	ld [hl], a
	ret

.asm_f723
	xor a
	ret
; f725

UnknownText_0xf725: ; 0xf725
	; Raise the PP of which move?
	text_jump UnknownText_0x1c5c8a
	db "@"
; 0xf72a

UnknownText_0xf72a: ; 0xf72a
	; Restore the PP of which move?
	text_jump UnknownText_0x1c5ca7
	db "@"
; 0xf72f

UnknownText_0xf72f: ; 0xf72f
	; 's PP is maxed out.
	text_jump UnknownText_0x1c5cc6
	db "@"
; 0xf734

UnknownText_0xf734: ; 0xf734
	; 's PP increased.
	text_jump UnknownText_0x1c5cdd
	db "@"
; 0xf739

UnknownText_0xf739: ; 0xf739
	; PP was restored.
	text_jump UnknownText_0x1c5cf1
	db "@"
; 0xf73e


Squirtbottle: ; f73e
	callba _Squirtbottle
	ret
; f745


CardKey: ; f745
	callba _CardKey
	ret
; f74c


BasementKey: ; f74c
	callba _BasementKey
	ret
; f753


SacredAsh: ; f753
	callba _SacredAsh
	ld a, [$d0ec]
	cp $1
	ret nz
	call Functionf795
	ret
; f763


NormalBox: ; f763
	ld c, $2c
	jr Function_0xf769
; f767

GorgeousBox: ; f767
	ld c, $2b
; f769

Function_0xf769: ; f769
	callba Function26f02

	ld hl, UnknownText_0xf778
	call PrintText

	jp Functionf795
; f778

UnknownText_0xf778: ; 0xf778
	text_jump UnknownText_0x1c5d03
	db "@"
; 0xf77d


Brightpowder:
Item19:
LuckyPunch:
MetalPowder:
Nugget:
Item2D:
Item32:
ExpShare:
SilverLeaf:
RedScale:
Secretpotion:
SSTicket:
MysteryEgg:
ClearBell:
SilverWing:
QuickClaw:
GoldLeaf:
SoftSand:
SharpBeak:
PoisonBarb:
KingsRock:
RedApricorn:
Tinymushroom:
BigMushroom:
Silverpowder:
BluApricorn:
Item5A:
AmuletCoin:
YlwApricorn:
GrnApricorn:
CleanseTag:
MysticWater:
Twistedspoon:
WhtApricorn:
Blackbelt:
BlkApricorn:
Item64:
PnkApricorn:
Blackglasses:
Slowpoketail:
PinkBow:
Stick:
SmokeBall:
Nevermeltice:
Magnet:
Pearl:
BigPearl:
Everstone:
SpellTag:
GsBall:
MiracleSeed:
ThickClub:
FocusBand:
Item78:
HardStone:
LuckyEgg:
MachinePart:
EggTicket:
LostItem:
Stardust:
StarPiece:
Pass:
Item87:
Item88:
Item89:
Charcoal:
ScopeLens:
Item8D:
Item8E:
MetalCoat:
DragonFang:
Item91:
Leftovers:
Item93:
Item94:
Item95:
DragonScale:
BerserkGene:
Item99:
Item9A:
Item9B:
FlowerMail:
ItemA2:
LightBall:
PolkadotBow:
ItemAB:
UpGrade:
ItemB0:
RainbowWing:
ItemB3: ; f77d
	jp IsntTheTimeMessage
; f780


Functionf780: ; f780
	push de
	ld de, SFX_FULL_HEAL
	call WaitPlaySFX
	pop de
	ret
; f789

Functionf789: ; f789
	ld hl, UsedItemText
	call PrintText
	call Functionf780
	call Functiona80
	; fallthrough
; f795

Functionf795: ; f795
	ld hl, NumItems
	ld a, 1
	ld [$d10c], a
	jp TossItem
; f7a0

Functionf7a0: ; f7a0
	call Functionedfa
	ld de, ANIM_THROW_POKE_BALL
	ld a, e
	ld [FXAnimIDLo], a
	ld a, d
	ld [FXAnimIDHi], a
	xor a
	ld [$c689], a
	ld [hBattleTurn], a
	ld [$cfca], a
	ld a, $37
	call Predef
	ld hl, BlockedTheBallText
	call PrintText
	ld hl, DontBeAThiefText
	call PrintText
	jr Functionf795
; f7ca

WontHaveAnyEffect_NotUsedMessage: ; f7ca
	ld hl, WontHaveAnyEffectText
	call PrintText

	; Item wasn't used.
	ld a, $2
	ld [$d0ec], a
	ret
; f7d6

LooksBitterMessage: ; f7d6
	ld hl, LooksBitterText
	jp PrintText
; f7dc

Ball_BoxIsFullMessage: ; f7dc
	ld hl, Ball_BoxIsFullText
	call PrintText

	; Item wasn't used.
	ld a, $2
	ld [$d0ec], a
	ret
; f7e8

CantUseOnEggMessage: ; f7e8
	ld hl, CantUseOnEggText
	jr CantUseItemMessage

IsntTheTimeMessage: ; f7ed
	ld hl, IsntTheTimeText
	jr CantUseItemMessage

WontHaveAnyEffectMessage: ; f7f2
	ld hl, WontHaveAnyEffectText
	jr CantUseItemMessage

BelongsToSomeoneElseMessage: ; f7f7
	ld hl, BelongsToSomeoneElseText
	jr CantUseItemMessage

CyclingIsntAllowedMessage: ; f7fc
	ld hl, CyclingIsntAllowedText
	jr CantUseItemMessage

CantGetOnYourBikeMessage: ; f801
	ld hl, CantGetOnYourBikeText

CantUseItemMessage: ; f804
; Item couldn't be used.
	xor a
	ld [$d0ec], a
	jp PrintText
; f80b

LooksBitterText: ; 0xf80b
	; It looks bitter…
	text_jump UnknownText_0x1c5d3e
	db "@"
; 0xf810

CantUseOnEggText: ; 0xf810
	; That can't be used on an EGG.
	text_jump UnknownText_0x1c5d50
	db "@"
; 0xf815

IsntTheTimeText: ; 0xf815
	; OAK:  ! This isn't the time to use that!
	text_jump UnknownText_0x1c5d6e
	db "@"
; 0xf81a

BelongsToSomeoneElseText: ; 0xf81a
	; That belongs to someone else!
	text_jump UnknownText_0x1c5d97
	db "@"
; 0xf81f

WontHaveAnyEffectText: ; 0xf81f
	; It won't have any effect.
	text_jump UnknownText_0x1c5db6
	db "@"
; 0xf824

BlockedTheBallText: ; 0xf824
	; The trainer blocked the BALL!
	text_jump UnknownText_0x1c5dd0
	db "@"
; 0xf829

DontBeAThiefText: ; 0xf829
	; Don't be a thief!
	text_jump UnknownText_0x1c5def
	db "@"
; 0xf82e

CyclingIsntAllowedText: ; 0xf82e
	; Cycling isn't allowed here.
	text_jump UnknownText_0x1c5e01
	db "@"
; 0xf833

CantGetOnYourBikeText: ; 0xf833
	; Can't get on your @  now.
	text_jump UnknownText_0x1c5e1d
	db "@"
; 0xf838

Ball_BoxIsFullText: ; 0xf838
	; The #MON BOX is full. That can't be used now.
	text_jump UnknownText_0x1c5e3a
	db "@"
; 0xf83d

UsedItemText: ; 0xf83d
	; used the@ .
	text_jump UnknownText_0x1c5e68
	db "@"
; 0xf842

GotOnTheItemText: ; 0xf842
	; got on the@ .
	text_jump UnknownText_0x1c5e7b
	db "@"
; 0xf847

GotOffTheItemText: ; 0xf847
	; got off@ the @ .
	text_jump UnknownText_0x1c5e90
	db "@"
; 0xf84c


Functionf84c: ; f84c
	ld a, PartyMon1Moves - PartyMon1
	call GetPartyParamLocation
	push hl
	ld de, Buffer1
	ld a, PREDEF_FILLPP
	call Predef
	pop hl
	ld bc, PartyMon1PP - PartyMon1Moves
	add hl, bc
	ld de, Buffer1
	ld b, 0
.asm_f864
	inc b
	ld a, b
	cp NUM_MOVES + 1
	ret z
	ld a, [$d265]
	dec a
	jr nz, .asm_f876
	ld a, [$cfa9]
	inc a
	cp b
	jr nz, .asm_f87d

.asm_f876
	ld a, [hl]
	and $c0
	ld a, [de]
	call nz, Functionf881

.asm_f87d
	inc hl
	inc de
	jr .asm_f864
; f881



Functionf881: ; f881
	push bc
	ld a, [de]
	ld [hDividend + 3], a
	xor a
	ld [hDividend], a
	ld [hDividend + 1], a
	ld [hDividend + 2], a
	ld a, 5
	ld [hDivisor], a
	ld b, 4
	call Divide
	ld a, [hl]
	ld b, a
	swap a
	and $f
	srl a
	srl a
	ld c, a
	and a
	jr z, .asm_f8b6
.asm_f8a3
	ld a, [$ffb6]
	cp $8
	jr c, .asm_f8ab
	ld a, $7

.asm_f8ab
	add b
	ld b, a
	ld a, [$d265]
	dec a
	jr z, .asm_f8b6
	dec c
	jr nz, .asm_f8a3

.asm_f8b6
	ld [hl], b
	pop bc
	ret
; f8b9

Functionf8b9: ; f8b9
	ld a, PartyMon1PP - PartyMon1
	call GetPartyParamLocation
	push hl
	ld a, PartyMon1Moves - PartyMon1
	call GetPartyParamLocation
	pop de
	xor a
	ld [$cfa9], a
	ld [MonType], a
	ld c, NUM_MOVES
.asm_f8ce
	ld a, [hli]
	and a
	ret z
	push hl
	push de
	push bc
	call Functionf8ec
	pop bc
	pop de
	ld a, [de]
	and $c0
	ld b, a
	ld a, [$d265]
	add b
	ld [de], a
	inc de
	ld hl, $cfa9
	inc [hl]
	pop hl
	dec c
	jr nz, .asm_f8ce
	ret
; f8ec


Functionf8ec: ; f8ec
	ld a, [StringBuffer1]
	push af
	ld a, [$d074]
	push af
	ld a, [MonType]
	and a
	ld hl, PartyMon1Moves
	ld bc, PartyMon2 - PartyMon1
	jr z, .asm_f91a
	ld hl, OTPartyMon1Moves
	dec a
	jr z, .asm_f91a
	ld hl, TempMonMoves
	dec a
	jr z, .asm_f915
	ld hl, TempMonMoves
	dec a
	jr z, .asm_f915
	ld hl, BattleMonMoves

.asm_f915
	call Functionf969
	jr .asm_f91d

.asm_f91a
	call Functionf963

.asm_f91d
	ld a, [hl]
	dec a
	push hl
	ld hl, Moves + MOVE_PP
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	ld b, a
	ld de, StringBuffer1
	ld [de], a
	pop hl
	push bc
	ld bc, PartyMon1PP - PartyMon1Moves
	ld a, [MonType]
	cp WILDMON
	jr nz, .asm_f942
	ld bc, EnemyMonPP - EnemyMonMoves

.asm_f942
	add hl, bc
	ld a, [hl]
	and $c0
	pop bc
	or b
	ld hl, $d074
	ld [hl], a
	xor a
	ld [$d265], a
	ld a, b
	call Functionf881
	ld a, [hl]
	and $3f
	ld [$d265], a
	pop af
	ld [$d074], a
	pop af
	ld [StringBuffer1], a
	ret
; f963

Functionf963: ; f963
	ld a, [CurPartyMon]
	call AddNTimes

Functionf969: ; f969
	ld a, [$cfa9]
	ld c, a
	ld b, 0
	add hl, bc
	ret
; f971

