Function_LoadOpponentTrainerAndPokemons: ; 1f8000
	ld a, [rSVBK]
	push af
	ld a, BANK(BT_OTTrainer)
	ld [rSVBK], a

	; Fill BT_OTTrainer with zeros
	xor a
	ld hl, BT_OTTrainer
	ld bc, BT_OTTrainerEnd - BT_OTTrainer
	call ByteFill

	; Write $ff into the Item-Slots
	ld a, $ff
	ld [BT_OTPkmn1Item], a
	ld [BT_OTPkmn2Item], a
	ld [BT_OTPkmn3Item], a

	; Set BT_OTTrainer as start address to write the following data to
	ld de, BT_OTTrainer

	ld a, [hRandomAdd]
	ld b, a
.resample ; loop to find a random trainer
	call Random
	ld a, [hRandomAdd]
	add b
	ld b, a ; b contains the nr of the trainer
IF DEF(CRYSTAL11)
	and (1 << 7) - 1
	cp 70
ELSE
	and (1 << 5) - 1
	cp 21
ENDC
	jr nc, .resample
	ld b, a

	ld a, BANK(sBTTrainers)
	call GetSRAMBank

	ld c, BATTLETOWER_NROFTRAINERS
	ld hl, sBTTrainers
.next_trainer
	ld a, [hli]
	cp b
	jr z, .resample
	dec c
	jr nz, .next_trainer ; c <= 7  initialise all 7 trainers?

	ld hl, sBTTrainers
	ld a, [sNrOfBeatenBattleTowerTrainers]
	ld c, a
	ld a, b
	ld b, 0
	add hl, bc
	ld [hl], a

	call CloseSRAM

	push af
; Copy name (10 bytes) and class (1 byte) of trainer
	ld hl, BattleTowerTrainers
	ld bc, NAME_LENGTH
	call AddNTimes
	ld bc, NAME_LENGTH
	call CopyBytes

	call Function_LoadRandomBattleTowerPkmn
	pop af

	ld hl, BattleTowerTrainerData
	ld bc, BATTLETOWER_TRAINERDATALENGTH
	call AddNTimes
	ld bc, BATTLETOWER_TRAINERDATALENGTH
.copy_bt_trainer_data_loop
	ld a, BANK(BattleTowerTrainerData)
	call GetFarByte
	ld [de], a
	inc hl
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .copy_bt_trainer_data_loop

	pop af
	ld [rSVBK], a

	ret


Function_LoadRandomBattleTowerPkmn: ; 1f8081
	ld c, BATTLETOWER_NROFPKMNS
.loop
	push bc
	ld a, BANK(sBTPkmnPrevTrainer1)
	call GetSRAMBank

.FindARandomBattleTowerPkmn:
	; From Which LevelGroup are the Pkmn loaded
	; a = 1..10
	ld a, [wBTChoiceOfLvlGroup] ; [$d800]
	dec a
	ld hl, BattleTowerMons
	ld bc, BattleTowerMons2 - BattleTowerMons1
	call AddNTimes

	ld a, [hRandomAdd]
	ld b, a
.resample
	call Random
	ld a, [hRandomAdd]
	add b
	ld b, a
	and $1f
	cp BATTLETOWER_NRMONSPERLEVELBRACKET
	jr nc, .resample
	; in register 'a' is the chosen Pkmn of the LevelGroup

	; Check if Pkmn was already loaded before
	; Check current and the 2 previous teams
	; includes check if item is double at the current team
	ld bc, PARTYMON_STRUCT_LENGTH + PKMN_NAME_LENGTH
	call AddNTimes
	ld a, [hli]
	ld b, a
	ld a, [hld]
	ld c, a
	ld a, [BT_OTPkmn1]
	cp b
	jr z, .FindARandomBattleTowerPkmn
	ld a, [BT_OTPkmn1Item]
	cp c
	jr z, .FindARandomBattleTowerPkmn
	ld a, [BT_OTPkmn2]
	cp b
	jr z, .FindARandomBattleTowerPkmn
	ld a, [BT_OTPkmn2Item]
	cp c
	jr z, .FindARandomBattleTowerPkmn
	ld a, [BT_OTPkmn3]
	cp b
	jr z, .FindARandomBattleTowerPkmn
	ld a, [BT_OTPkmn3Item]
	cp c
	jr z, .FindARandomBattleTowerPkmn
	ld a, [sBTPkmnPrevTrainer1]
	cp b
	jr z, .FindARandomBattleTowerPkmn
	ld a, [sBTPkmnPrevTrainer2]
	cp b
	jr z, .FindARandomBattleTowerPkmn
	ld a, [sBTPkmnPrevTrainer3]
	cp b
	jr z, .FindARandomBattleTowerPkmn
	ld a, [sBTPkmnPrevPrevTrainer1]
	cp b
	jr z, .FindARandomBattleTowerPkmn
	ld a, [sBTPkmnPrevPrevTrainer2]
	cp b
	jr z, .FindARandomBattleTowerPkmn
	ld a, [sBTPkmnPrevPrevTrainer3]
	cp b
	jr z, .FindARandomBattleTowerPkmn

	ld bc, PARTYMON_STRUCT_LENGTH + PKMN_NAME_LENGTH
	call CopyBytes

	ld a, [wNamedObjectIndexBuffer]
	push af
	push de
	ld hl, - (PARTYMON_STRUCT_LENGTH + PKMN_NAME_LENGTH)
	add hl, de
	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	push hl
	call GetPokemonName
	ld h, d
	ld l, e
	pop de
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes

	pop de
	pop af
	ld [wNamedObjectIndexBuffer], a
	pop bc
	dec c
	jp nz, .loop

	ld a, [sBTPkmnPrevTrainer1]
	ld [sBTPkmnPrevPrevTrainer1], a
	ld a, [sBTPkmnPrevTrainer2]
	ld [sBTPkmnPrevPrevTrainer2], a
	ld a, [sBTPkmnPrevTrainer3]
	ld [sBTPkmnPrevPrevTrainer3], a
	ld a, [BT_OTPkmn1]
	ld [sBTPkmnPrevTrainer1], a
	ld a, [BT_OTPkmn2]
	ld [sBTPkmnPrevTrainer2], a
	ld a, [BT_OTPkmn3]
	ld [sBTPkmnPrevTrainer3], a
	call CloseSRAM
	ret
; 1f814e

BattleTowerTrainers: ; 1f814e
; The trainer class is not used in Crystal 1.0 due to a bug.
; Instead, the sixth character in the trainer's name is used.
; See misc/battle_tower_47.asm
	db "HANSON@@@@", FISHER
	db "SAWYER@@@@", POKEMANIAC
	db "MASUDA@@@@", GUITARIST
	db "NICKEL@@@@", SCIENTIST
	db "OLSON@@@@@", POKEFANM
	db "ZABOROWSKI", LASS
	db "WRIGHT@@@@", YOUNGSTER
	db "ALEXANDER@", HIKER
	db "KAWAKAMI@@", TEACHER
	db "BICKETT@@@", POKEFANM
	db "SAITO@@@@@", KIMONO_GIRL
	db "CRAWFORD@@", BOARDER
	db "DIAZ@@@@@@", PICNICKER
	db "ERICKSON@@", BIKER
	db "FAIRFIELD@", JUGGLER
	db "HUNTER@@@@", POKEFANF
	db "HILL@@@@@@", FIREBREATHER
	db "JAVIER@@@@", SWIMMERF
	db "KAUFMAN@@@", SWIMMERM
	db "LANCASTER@", SKIER
	db "McMAHILL@@", CAMPER
; The following can only be sampled in Crystal 1.1.
	db "OBRIEN@@@@", GENTLEMAN
	db "FROST@@@@@", BEAUTY
	db "MORSE@@@@@", SUPER_NERD
	db "YUFUNE@@@@", BLACKBELT_T
	db "RAJAN@@@@@", COOLTRAINERF
	db "RODRIGUEZ@", OFFICER
	db "SANTIAGO@@", PSYCHIC_T
	db "STOCK@@@@@", POKEFANM
	db "THURMAN@@@", SCIENTIST
	db "VALENTINO@", BEAUTY
	db "WAGNER@@@@", CAMPER
	db "YATES@@@@@", BIRD_KEEPER
	db "ANDREWS@@@", PICNICKER
	db "BAHN@@@@@@", POKEMANIAC
	db "MORI@@@@@@", SCIENTIST
	db "BUCKMAN@@@", SAGE
	db "COBB@@@@@@", SCHOOLBOY
	db "HUGHES@@@@", FISHER
	db "ARITA@@@@@", KIMONO_GIRL
	db "EASTON@@@@", PSYCHIC_T
	db "FREEMAN@@@", CAMPER
	db "GIESE@@@@@", LASS
	db "HATCHER@@@", GENTLEMAN
	db "JACKSON@@@", POKEFANF
	db "KAHN@@@@@@", POKEMANIAC
	db "LEONG@@@@@", YOUNGSTER
	db "MARINO@@@@", TEACHER
	db "NEWMAN@@@@", SAILOR
	db "NGUYEN@@@@", BLACKBELT_T
	db "OGDEN@@@@@", SUPER_NERD
	db "PARK@@@@@@", COOLTRAINERF
	db "RAINE@@@@@", SWIMMERM
	db "SELLS@@@@@", BIRD_KEEPER
	db "ROCKWELL@@", BOARDER
	db "THORNTON@@", LASS
	db "TURNER@@@@", OFFICER
	db "VAN DYKE@@", SKIER
	db "WALKER@@@@", SCHOOLBOY
	db "MEYER@@@@@", SWIMMERF
	db "JOHNSON@@@", YOUNGSTER
	db "ADAMS@@@@@", GUITARIST
	db "SMITH@@@@@", BUG_CATCHER
	db "TAJIRI@@@@", BUG_CATCHER
	db "BAKER@@@@@", POKEMANIAC
	db "COLLINS@@@", SCIENTIST
	db "SMART@@@@@", SUPER_NERD
	db "DYKSTRA@@@", SWIMMERF
	db "EATON@@@@@", BIKER
	db "WONG@@@@@@", FIREBREATHER
; 1f8450


BattleTowerMons: ; 1f8450
; 10 groups of 21 mons.
BattleTowerMons1:

	db JOLTEON
	db MIRACLEBERRY
	db THUNDERBOLT, HYPER_BEAM, SHADOW_BALL, ROAR
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 40000
	bigdw 40000
	bigdw 35000
	bigdw 40000
	db $dd, $bd ; DVs
	db 15, 5, 15, 20 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 41 ; HP
	bigdw 41 ; Max HP
	bigdw 25 ; Atk
	bigdw 24 ; Def
	bigdw 37 ; Spd
	bigdw 34 ; SAtk
	bigdw 31 ; SDef
	db "SANDA-SU@@@"


	db ESPEON
	db LEFTOVERS
	db MUD_SLAP, PSYCHIC_M, PSYCH_UP, TOXIC
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 50000
	bigdw 35000
	bigdw 40000
	bigdw 40000
	db $ed, $fb ; DVs
	db 10, 10, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 39 ; HP
	bigdw 39 ; Max HP
	bigdw 26 ; Atk
	bigdw 24 ; Def
	bigdw 35 ; Spd
	bigdw 38 ; SAtk
	bigdw 31 ; SDef
	db "E-HUi@@@@@@"


	db UMBREON
	db GOLD_BERRY
	db SHADOW_BALL, IRON_TAIL, PSYCH_UP, TOXIC
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 40000
	bigdw 45000
	bigdw 50000
	bigdw 40000
	db $db, $ef ; DVs
	db 15, 15, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 46 ; HP
	bigdw 46 ; Max HP
	bigdw 25 ; Atk
	bigdw 34 ; Def
	bigdw 26 ; Spd
	bigdw 25 ; SAtk
	bigdw 39 ; SDef
	db "BURAtuKI-@@"


	db WOBBUFFET
	db FOCUS_BAND
	db COUNTER, MIRROR_COAT, SAFEGUARD, DESTINY_BOND
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	db $7f, $d7 ; DVs
	db 20, 20, 25, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 66 ; HP
	bigdw 66 ; Max HP
	bigdw 18 ; Atk
	bigdw 25 ; Def
	bigdw 19 ; Spd
	bigdw 18 ; SAtk
	bigdw 23 ; SDef
	db "SO-NANSU@@@"


	db KANGASKHAN
	db MIRACLEBERRY
	db REVERSAL, HYPER_BEAM, EARTHQUAKE, ATTRACT
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 30000
	bigdw 40000
	bigdw 30000
	bigdw 30000
	db $ef, $cf ; DVs
	db 15, 5, 10, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 47 ; HP
	bigdw 47 ; Max HP
	bigdw 31 ; Atk
	bigdw 29 ; Def
	bigdw 29 ; Spd
	bigdw 20 ; SAtk
	bigdw 28 ; SDef
	db "GARU-RA@@@@"


	db CORSOLA
	db SCOPE_LENS
	db SURF, PSYCHIC_M, RECOVER, ANCIENTPOWER
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 30000
	bigdw 33300
	bigdw 30000
	bigdw 30000
	db $fe, $fd ; DVs
	db 15, 10, 20, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 38 ; HP
	bigdw 38 ; Max HP
	bigdw 23 ; Atk
	bigdw 29 ; Def
	bigdw 19 ; Spd
	bigdw 24 ; SAtk
	bigdw 28 ; SDef
	db "SANI-GO@@@@"


	db MILTANK
	db GOLD_BERRY
	db BLIZZARD, EARTHQUAKE, HYPER_BEAM, TOXIC
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 35000
	db $bb, $df ; DVs
	db 5, 10, 5, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 46 ; HP
	bigdw 46 ; Max HP
	bigdw 27 ; Atk
	bigdw 32 ; Def
	bigdw 31 ; Spd
	bigdw 20 ; SAtk
	bigdw 26 ; SDef
	db "MIRUTANKU@@"


	db AERODACTYL
	db LEFTOVERS
	db HYPER_BEAM, SUPERSONIC, EARTHQUAKE, BITE
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	db $db, $fb ; DVs
	db 5, 20, 10, 25 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 43 ; HP
	bigdw 43 ; Max HP
	bigdw 32 ; Atk
	bigdw 24 ; Def
	bigdw 38 ; Spd
	bigdw 23 ; SAtk
	bigdw 26 ; SDef
	db "PUTERA@@@@@"


	db LAPRAS
	db MIRACLEBERRY
	db BLIZZARD, SURF, THUNDERBOLT, PSYCHIC_M
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	db $fd, $eb ; DVs
	db 5, 15, 15, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 52 ; HP
	bigdw 52 ; Max HP
	bigdw 29 ; Atk
	bigdw 27 ; Def
	bigdw 24 ; Spd
	bigdw 28 ; SAtk
	bigdw 30 ; SDef
	db "RAPURASU@@@"


	db SNEASEL
	db GOLD_BERRY
	db SLASH, FAINT_ATTACK, SURF, BLIZZARD
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 35000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	db $fb, $bf ; DVs
	db 20, 20, 15, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 38 ; HP
	bigdw 38 ; Max HP
	bigdw 31 ; Atk
	bigdw 22 ; Def
	bigdw 34 ; Spd
	bigdw 19 ; SAtk
	bigdw 27 ; SDef
	db "NIyu-RA@@@@"


	db PORYGON2
	db BRIGHTPOWDER
	db PSYCHIC_M, BLIZZARD, HYPER_BEAM, TRI_ATTACK
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 40000
	bigdw 30000
	bigdw 30000
	db $fb, $de ; DVs
	db 10, 5, 5, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 44 ; HP
	bigdw 44 ; Max HP
	bigdw 28 ; Atk
	bigdw 30 ; Def
	bigdw 23 ; Spd
	bigdw 33 ; SAtk
	bigdw 31 ; SDef
	db "PORIGON2@@@"


	db MISDREAVUS
	db FOCUS_BAND
	db PERISH_SONG, MEAN_LOOK, PAIN_SPLIT, SHADOW_BALL
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	db $ef, $df ; DVs
	db 5, 5, 20, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 37 ; HP
	bigdw 37 ; Max HP
	bigdw 24 ; Atk
	bigdw 24 ; Def
	bigdw 28 ; Spd
	bigdw 29 ; SAtk
	bigdw 29 ; SDef
	db "MUUMA@@@@@@"


	db HOUNDOUR
	db GOLD_BERRY
	db FAINT_ATTACK, SOLARBEAM, ROAR, SUNNY_DAY
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 33000
	bigdw 30000
	db $fd, $fe ; DVs
	db 20, 10, 20, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 36 ; HP
	bigdw 36 ; Max HP
	bigdw 24 ; Atk
	bigdw 17 ; Def
	bigdw 25 ; Spd
	bigdw 28 ; SAtk
	bigdw 22 ; SDef
	db "DERUBIRU@@@"


	db GIRAFARIG
	db KINGS_ROCK
	db PSYBEAM, MUD_SLAP, SHADOW_BALL, AGILITY
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	db $ed, $fd ; DVs
	db 20, 10, 15, 30 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 39 ; HP
	bigdw 39 ; Max HP
	bigdw 28 ; Atk
	bigdw 24 ; Def
	bigdw 29 ; Spd
	bigdw 29 ; SAtk
	bigdw 24 ; SDef
	db "KIRINRIKI@@"


	db BLISSEY
	db QUICK_CLAW
	db HEADBUTT, SOLARBEAM, ROLLOUT, STRENGTH
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 32000
	bigdw 40000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	db $df, $ce ; DVs
	db 15, 10, 20, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 77 ; HP
	bigdw 77 ; Max HP
	bigdw 14 ; Atk
	bigdw 14 ; Def
	bigdw 22 ; Spd
	bigdw 27 ; SAtk
	bigdw 39 ; SDef
	db "HAPINASU@@@"


	db SNORLAX
	db MIRACLEBERRY
	db HEADBUTT, PROTECT, SNORE, SURF
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	db $ef, $f7 ; DVs
	db 15, 10, 15, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 57 ; HP
	bigdw 57 ; Max HP
	bigdw 34 ; Atk
	bigdw 25 ; Def
	bigdw 18 ; Spd
	bigdw 23 ; SAtk
	bigdw 32 ; SDef
	db "KABIGON@@@@"


	db EXEGGUTOR
	db KINGS_ROCK
	db TOXIC, GIGA_DRAIN, THIEF, CONFUSION
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	db $fe, $fe ; DVs
	db 10, 5, 10, 25 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 45 ; HP
	bigdw 45 ; Max HP
	bigdw 31 ; Atk
	bigdw 29 ; Def
	bigdw 23 ; Spd
	bigdw 37 ; SAtk
	bigdw 25 ; SDef
	db "NAtuSI-@@@@"


	db HERACROSS
	db GOLD_BERRY
	db REVERSAL, ENDURE, COUNTER, ROCK_SMASH
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	db $f7, $f7 ; DVs
	db 15, 10, 20, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 43 ; HP
	bigdw 43 ; Max HP
	bigdw 37 ; Atk
	bigdw 25 ; Def
	bigdw 29 ; Spd
	bigdw 18 ; SAtk
	bigdw 29 ; SDef
	db "HERAKUROSU@"


	db UNOWN
	db BERRY
	db HIDDEN_POWER, 0, 0, 0
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	db $ff, $ff ; DVs
	db 15, 0, 0, 0 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 36 ; HP
	bigdw 36 ; Max HP
	bigdw 26 ; Atk
	bigdw 21 ; Def
	bigdw 21 ; Spd
	bigdw 26 ; SAtk
	bigdw 21 ; SDef
	db "ANNO-N@@@@@"


	db TAUROS
	db KINGS_ROCK
	db HEADBUTT, SWAGGER, TAIL_WHIP, ICY_WIND
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	db $65, $57 ; DVs
	db 15, 15, 30, 15 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 40 ; HP
	bigdw 40 ; Max HP
	bigdw 30 ; Atk
	bigdw 29 ; Def
	bigdw 32 ; Spd
	bigdw 18 ; SAtk
	bigdw 24 ; SDef
	db "KENTAROSU@@"


	db MR__MIME
	db QUICK_CLAW
	db TOXIC, PSYCH_UP, FIRE_PUNCH, HEADBUTT
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	db $73, $67 ; DVs
	db 10, 10, 15, 15 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 34 ; HP
	bigdw 34 ; Max HP
	bigdw 19 ; Atk
	bigdw 22 ; Def
	bigdw 28 ; Spd
	bigdw 30 ; SAtk
	bigdw 34 ; SDef
	db "BARIYA-DO@@"




BattleTowerMons2:

	db UMBREON
	db LEFTOVERS
	db PROTECT, TOXIC, MUD_SLAP, ATTRACT
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	db $cf, $bc ; DVs
	db 10, 10, 10, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 81 ; HP
	bigdw 81 ; Max HP
	bigdw 46 ; Atk
	bigdw 66 ; Def
	bigdw 46 ; Spd
	bigdw 44 ; SAtk
	bigdw 72 ; SDef
	db "BURAtuKI-@@"


	db STARMIE
	db GOLD_BERRY
	db RECOVER, PSYCHIC_M, SURF, PSYCH_UP
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	db $db, $db ; DVs
	db 20, 10, 15, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 71 ; HP
	bigdw 71 ; Max HP
	bigdw 51 ; Atk
	bigdw 54 ; Def
	bigdw 67 ; Spd
	bigdw 60 ; SAtk
	bigdw 54 ; SDef
	db "SUTA-MI-@@@"


	db GYARADOS
	db MIRACLEBERRY
	db HYPER_BEAM, DRAGON_RAGE, THUNDERBOLT, FIRE_BLAST
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	db $fa, $fd ; DVs
	db 5, 10, 15, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 83 ; HP
	bigdw 83 ; Max HP
	bigdw 72 ; Atk
	bigdw 51 ; Def
	bigdw 54 ; Spd
	bigdw 45 ; SAtk
	bigdw 61 ; SDef
	db "GIyaRADOSU@"


	db STEELIX
	db GOLD_BERRY
	db ROAR, IRON_TAIL, SWAGGER, EARTHQUAKE
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 30000
	bigdw 50000
	db $ff, $ff ; DVs
	db 20, 15, 15, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 77 ; HP
	bigdw 77 ; Max HP
	bigdw 55 ; Atk
	bigdw 102 ; Def
	bigdw 31 ; Spd
	bigdw 44 ; SAtk
	bigdw 48 ; SDef
	db "HAGANE-RU@@"


	db ALAKAZAM
	db BERRY_JUICE
	db PSYCHIC_M, PSYCH_UP, TOXIC, THUNDERPUNCH
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 30000
	bigdw 50000
	bigdw 40000
	db $fd, $ef ; DVs
	db 10, 10, 10, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 68 ; HP
	bigdw 68 ; Max HP
	bigdw 42 ; Atk
	bigdw 36 ; Def
	bigdw 69 ; Spd
	bigdw 75 ; SAtk
	bigdw 55 ; SDef
	db "HU-DEiN@@@@"


	db ARCANINE
	db BRIGHTPOWDER
	db FLAMETHROWER, ROAR, HYPER_BEAM, IRON_TAIL
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 35000
	bigdw 45000
	bigdw 50000
	bigdw 55000
	bigdw 50000
	db $db, $fb ; DVs
	db 15, 20, 5, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 81 ; HP
	bigdw 81 ; Max HP
	bigdw 64 ; Atk
	bigdw 52 ; Def
	bigdw 60 ; Spd
	bigdw 60 ; SAtk
	bigdw 52 ; SDef
	db "UINDEi@@@@@"


	db HERACROSS
	db FOCUS_BAND
	db ENDURE, REVERSAL, MEGAHORN, EARTHQUAKE
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 30000
	bigdw 45000
	bigdw 30000
	bigdw 45000
	db $df, $de ; DVs
	db 10, 15, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 78 ; HP
	bigdw 78 ; Max HP
	bigdw 68 ; Atk
	bigdw 51 ; Def
	bigdw 52 ; Spd
	bigdw 37 ; SAtk
	bigdw 59 ; SDef
	db "HERAKUROSU@"


	db EXEGGUTOR
	db LEFTOVERS
	db HYPER_BEAM, PSYCHIC_M, TOXIC, DREAM_EATER
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 50000
	bigdw 45000
	bigdw 45000
	db $fd, $eb ; DVs
	db 5, 10, 10, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 83 ; HP
	bigdw 83 ; Max HP
	bigdw 60 ; Atk
	bigdw 55 ; Def
	bigdw 43 ; Spd
	bigdw 70 ; SAtk
	bigdw 46 ; SDef
	db "NAtuSI-@@@@"


	db AERODACTYL
	db GOLD_BERRY
	db REST, HYPER_BEAM, EARTHQUAKE, DRAGON_RAGE
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 40000
	bigdw 50000
	bigdw 45000
	db $fb, $bb ; DVs
	db 10, 5, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 78 ; HP
	bigdw 78 ; Max HP
	bigdw 64 ; Atk
	bigdw 45 ; Def
	bigdw 72 ; Spd
	bigdw 44 ; SAtk
	bigdw 50 ; SDef
	db "PUTERA@@@@@"


	db BLISSEY
	db BRIGHTPOWDER
	db PSYCHIC_M, SUBMISSION, SOFTBOILED, COUNTER
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 30000
	bigdw 30000
	bigdw 50000
	db $bd, $fe ; DVs
	db 10, 25, 10, 20 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 148 ; HP
	bigdw 148 ; Max HP
	bigdw 24 ; Atk
	bigdw 22 ; Def
	bigdw 41 ; Spd
	bigdw 51 ; SAtk
	bigdw 75 ; SDef
	db "HAPINASU@@@"


	db LAPRAS
	db GOLD_BERRY
	db PSYCHIC_M, THUNDERBOLT, BLIZZARD, CONFUSE_RAY
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 55000
	bigdw 30000
	bigdw 40000
	bigdw 55000
	bigdw 30000
	db $fe, $d7 ; DVs
	db 10, 15, 5, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 98 ; HP
	bigdw 98 ; Max HP
	bigdw 53 ; Atk
	bigdw 52 ; Def
	bigdw 45 ; Spd
	bigdw 50 ; SAtk
	bigdw 54 ; SDef
	db "RAPURASU@@@"


	db PIKACHU
	db LIGHT_BALL
	db THUNDERBOLT, THUNDER_WAVE, STRENGTH, TOXIC
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 50000
	db $fc, $fe ; DVs
	db 15, 20, 15, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 58 ; HP
	bigdw 58 ; Max HP
	bigdw 44 ; Atk
	bigdw 32 ; Def
	bigdw 58 ; Spd
	bigdw 41 ; SAtk
	bigdw 37 ; SDef
	db "PIKATIyuU@@"


	db SCIZOR
	db FOCUS_BAND
	db STEEL_WING, SLASH, TOXIC, SANDSTORM
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 45000
	bigdw 40000
	bigdw 45000
	bigdw 50000
	db $fd, $fe ; DVs
	db 25, 20, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 73 ; HP
	bigdw 73 ; Max HP
	bigdw 73 ; Atk
	bigdw 60 ; Def
	bigdw 47 ; Spd
	bigdw 43 ; SAtk
	bigdw 53 ; SDef
	db "HAtuSAMU@@@"


	db HITMONCHAN
	db GOLD_BERRY
	db THUNDERPUNCH, ICE_PUNCH, FIRE_PUNCH, MEGA_PUNCH
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 45000
	bigdw 35000
	bigdw 50000
	bigdw 30000
	db $fb, $fd ; DVs
	db 15, 15, 15, 20 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 67 ; HP
	bigdw 67 ; Max HP
	bigdw 63 ; Atk
	bigdw 50 ; Def
	bigdw 52 ; Spd
	bigdw 32 ; SAtk
	bigdw 62 ; SDef
	db "EBIWARA-@@@"


	db TAUROS
	db BRIGHTPOWDER
	db THUNDERBOLT, EARTHQUAKE, HYPER_BEAM, BLIZZARD
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 40000
	bigdw 50000
	bigdw 30000
	bigdw 30000
	db $fb, $ef ; DVs
	db 15, 10, 5, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 76 ; HP
	bigdw 76 ; Max HP
	bigdw 61 ; Atk
	bigdw 58 ; Def
	bigdw 63 ; Spd
	bigdw 35 ; SAtk
	bigdw 47 ; SDef
	db "KENTAROSU@@"


	db AZUMARILL
	db MYSTIC_WATER
	db SURF, BLIZZARD, ATTRACT, RAIN_DANCE
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 40000
	bigdw 40000
	bigdw 40000
	bigdw 40000
	db $ed, $f7 ; DVs
	db 15, 5, 15, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 82 ; HP
	bigdw 82 ; Max HP
	bigdw 40 ; Atk
	bigdw 52 ; Def
	bigdw 41 ; Spd
	bigdw 37 ; SAtk
	bigdw 49 ; SDef
	db "MARIRURI@@@"


	db MILTANK
	db KINGS_ROCK
	db EARTHQUAKE, THUNDER, ATTRACT, SURF
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 40000
	bigdw 40000
	bigdw 40000
	bigdw 40000
	db $df, $fe ; DVs
	db 10, 10, 15, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 83 ; HP
	bigdw 83 ; Max HP
	bigdw 52 ; Atk
	bigdw 63 ; Def
	bigdw 61 ; Spd
	bigdw 36 ; SAtk
	bigdw 48 ; SDef
	db "MIRUTANKU@@"


	db WIGGLYTUFF
	db GOLD_BERRY
	db HYPER_BEAM, BLIZZARD, FIRE_BLAST, ATTRACT
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 40000
	bigdw 40000
	bigdw 40000
	bigdw 40000
	db $c7, $fe ; DVs
	db 5, 5, 5, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 98 ; HP
	bigdw 98 ; Max HP
	bigdw 47 ; Atk
	bigdw 35 ; Def
	bigdw 39 ; Spd
	bigdw 50 ; SAtk
	bigdw 40 ; SDef
	db "PUKURIN@@@@"


	db WIGGLYTUFF
	db PINK_BOW
	db PSYCHIC_M, SWAGGER, PSYCH_UP, HEADBUTT
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	db $c7, $77 ; DVs
	db 10, 15, 10, 15 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 97 ; HP
	bigdw 97 ; Max HP
	bigdw 46 ; Atk
	bigdw 34 ; Def
	bigdw 34 ; Spd
	bigdw 46 ; SAtk
	bigdw 36 ; SDef
	db "PUKURIN@@@@"


	db NIDOKING
	db BERRY
	db BLIZZARD, EARTHQUAKE, SURF, THUNDERPUNCH
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	db $56, $46 ; DVs
	db 5, 10, 15, 15 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 74 ; HP
	bigdw 74 ; Max HP
	bigdw 52 ; Atk
	bigdw 46 ; Def
	bigdw 49 ; Spd
	bigdw 50 ; SAtk
	bigdw 46 ; SDef
	db "NIDOKINGU@@"


	db QUAGSIRE
	db QUICK_CLAW
	db AMNESIA, EARTHQUAKE, SURF, RAIN_DANCE
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	db $55, $47 ; DVs
	db 20, 10, 15, 5 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 81 ; HP
	bigdw 81 ; Max HP
	bigdw 49 ; Atk
	bigdw 49 ; Def
	bigdw 29 ; Spd
	bigdw 42 ; SAtk
	bigdw 42 ; SDef
	db "NUO-@@@@@@@"




BattleTowerMons3:

	db JOLTEON
	db MIRACLEBERRY
	db THUNDERBOLT, THUNDER_WAVE, ROAR, MUD_SLAP
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 55000
	db $db, $ed ; DVs
	db 15, 20, 20, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 103 ; HP
	bigdw 103 ; Max HP
	bigdw 68 ; Atk
	bigdw 64 ; Def
	bigdw 107 ; Spd
	bigdw 96 ; SAtk
	bigdw 87 ; SDef
	db "SANDA-SU@@@"


	db POLIWRATH
	db BRIGHTPOWDER
	db DOUBLE_TEAM, SURF, FISSURE, SUBMISSION
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 55000
	bigdw 55000
	bigdw 55000
	bigdw 50000
	db $dd, $fb ; DVs
	db 15, 15, 5, 25 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 119 ; HP
	bigdw 119 ; Max HP
	bigdw 81 ; Atk
	bigdw 87 ; Def
	bigdw 73 ; Spd
	bigdw 70 ; SAtk
	bigdw 82 ; SDef
	db "NIyoROBON@@"


	db STARMIE
	db LEFTOVERS
	db THUNDER_WAVE, PSYCHIC_M, RECOVER, SURF
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	db $ff, $ff ; DVs
	db 20, 10, 20, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 101 ; HP
	bigdw 101 ; Max HP
	bigdw 75 ; Atk
	bigdw 81 ; Def
	bigdw 99 ; Spd
	bigdw 90 ; SAtk
	bigdw 81 ; SDef
	db "SUTA-MI-@@@"


	db JYNX
	db GOLD_BERRY
	db BLIZZARD, LOVELY_KISS, DREAM_EATER, ATTRACT
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 30000
	bigdw 50000
	db $fb, $ee ; DVs
	db 5, 10, 15, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 102 ; HP
	bigdw 102 ; Max HP
	bigdw 60 ; Atk
	bigdw 49 ; Def
	bigdw 83 ; Spd
	bigdw 98 ; SAtk
	bigdw 86 ; SDef
	db "RU-ZIyuRA@@"


	db DUGTRIO
	db KINGS_ROCK
	db EARTHQUAKE, SLUDGE_BOMB, SLASH, MUD_SLAP
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 30000
	bigdw 50000
	bigdw 50000
	db $ef, $ff ; DVs
	db 10, 10, 20, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 81 ; HP
	bigdw 81 ; Max HP
	bigdw 77 ; Atk
	bigdw 56 ; Def
	bigdw 102 ; Spd
	bigdw 60 ; SAtk
	bigdw 72 ; SDef
	db "DAGUTORIO@@"


	db BELLOSSOM
	db BRIGHTPOWDER
	db GIGA_DRAIN, SUNNY_DAY, SOLARBEAM, DOUBLE_TEAM
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 45000
	bigdw 50000
	bigdw 55000
	bigdw 50000
	db $df, $db ; DVs
	db 5, 5, 10, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 109 ; HP
	bigdw 109 ; Max HP
	bigdw 76 ; Atk
	bigdw 81 ; Def
	bigdw 60 ; Spd
	bigdw 82 ; SAtk
	bigdw 88 ; SDef
	db "KIREIHANA@@"


	db BLISSEY
	db LEFTOVERS
	db TOXIC, REFLECT, SOFTBOILED, PROTECT
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 30000
	bigdw 45000
	bigdw 30000
	bigdw 45000
	db $fb, $ed ; DVs
	db 10, 20, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 217 ; HP
	bigdw 217 ; Max HP
	bigdw 32 ; Atk
	bigdw 33 ; Def
	bigdw 59 ; Spd
	bigdw 73 ; SAtk
	bigdw 109 ; SDef
	db "HAPINASU@@@"


	db HOUNDOOM
	db CHARCOAL
	db FLAMETHROWER, CRUNCH, SHADOW_BALL, DREAM_EATER
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 50000
	bigdw 45000
	bigdw 45000
	db $fd, $ed ; DVs
	db 15, 15, 15, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 108 ; HP
	bigdw 108 ; Max HP
	bigdw 84 ; Atk
	bigdw 59 ; Def
	bigdw 86 ; Spd
	bigdw 94 ; SAtk
	bigdw 76 ; SDef
	db "HERUGA-@@@@"


	db MACHAMP
	db MIRACLEBERRY
	db CROSS_CHOP, ICE_PUNCH, EARTHQUAKE, FIRE_BLAST
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 40000
	bigdw 50000
	bigdw 45000
	db $fd, $be ; DVs
	db 5, 15, 10, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 118 ; HP
	bigdw 118 ; Max HP
	bigdw 108 ; Atk
	bigdw 75 ; Def
	bigdw 61 ; Spd
	bigdw 68 ; SAtk
	bigdw 80 ; SDef
	db "KAIRIKI-@@@"


	db CROBAT
	db GOLD_BERRY
	db ATTRACT, CONFUSE_RAY, TOXIC, WING_ATTACK
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 30000
	bigdw 30000
	bigdw 50000
	db $ef, $dc ; DVs
	db 15, 10, 10, 35 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 111 ; HP
	bigdw 111 ; Max HP
	bigdw 83 ; Atk
	bigdw 74 ; Def
	bigdw 103 ; Spd
	bigdw 70 ; SAtk
	bigdw 76 ; SDef
	db "KUROBAtuTO@"


	db PORYGON2
	db BRIGHTPOWDER
	db PSYCHIC_M, RECOVER, HYPER_BEAM, TRI_ATTACK
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 55000
	bigdw 30000
	bigdw 40000
	bigdw 55000
	bigdw 30000
	db $df, $db ; DVs
	db 10, 20, 5, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 117 ; HP
	bigdw 117 ; Max HP
	bigdw 73 ; Atk
	bigdw 83 ; Def
	bigdw 66 ; Spd
	bigdw 87 ; SAtk
	bigdw 81 ; SDef
	db "PORIGON2@@@"


	db MAROWAK
	db THICK_CLUB
	db EARTHQUAKE, RETURN, HYPER_BEAM, BONEMERANG
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 30000
	db $dd, $eb ; DVs
	db 10, 20, 5, 10 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 99 ; HP
	bigdw 99 ; Max HP
	bigdw 77 ; Atk
	bigdw 94 ; Def
	bigdw 56 ; Spd
	bigdw 54 ; SAtk
	bigdw 72 ; SDef
	db "GARAGARA@@@"


	db ELECTRODE
	db BRIGHTPOWDER
	db LIGHT_SCREEN, THUNDERBOLT, PROTECT, THUNDER
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 45000
	bigdw 40000
	bigdw 45000
	bigdw 50000
	db $bd, $ef ; DVs
	db 30, 15, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 98 ; HP
	bigdw 98 ; Max HP
	bigdw 57 ; Atk
	bigdw 69 ; Def
	bigdw 113 ; Spd
	bigdw 78 ; SAtk
	bigdw 78 ; SDef
	db "MARUMAIN@@@"


	db LAPRAS
	db LEFTOVERS
	db RAIN_DANCE, WATER_GUN, ICY_WIND, STRENGTH
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 45000
	bigdw 35000
	bigdw 50000
	bigdw 30000
	db $fd, $eb ; DVs
	db 5, 25, 15, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 142 ; HP
	bigdw 142 ; Max HP
	bigdw 80 ; Atk
	bigdw 74 ; Def
	bigdw 65 ; Spd
	bigdw 75 ; SAtk
	bigdw 81 ; SDef
	db "RAPURASU@@@"


	db LANTURN
	db GOLD_BERRY
	db RAIN_DANCE, THUNDER, SURF, FLAIL
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 40000
	bigdw 50000
	bigdw 30000
	bigdw 30000
	db $dd, $eb ; DVs
	db 5, 10, 15, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 139 ; HP
	bigdw 139 ; Max HP
	bigdw 62 ; Atk
	bigdw 64 ; Def
	bigdw 66 ; Spd
	bigdw 70 ; SAtk
	bigdw 70 ; SDef
	db "RANTA-N@@@@"


	db ESPEON
	db MIRACLEBERRY
	db CONFUSION, SWIFT, TOXIC, PSYCH_UP
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	db $ef, $f7 ; DVs
	db 25, 20, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 99 ; HP
	bigdw 99 ; Max HP
	bigdw 68 ; Atk
	bigdw 66 ; Def
	bigdw 96 ; Spd
	bigdw 103 ; SAtk
	bigdw 82 ; SDef
	db "E-HUi@@@@@@"


	db TENTACRUEL
	db KINGS_ROCK
	db WRAP, TOXIC, SLUDGE_BOMB, BUBBLEBEAM
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 47000
	bigdw 45000
	db $fe, $fe ; DVs
	db 20, 10, 10, 20 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 110 ; HP
	bigdw 110 ; Max HP
	bigdw 71 ; Atk
	bigdw 68 ; Def
	bigdw 90 ; Spd
	bigdw 77 ; SAtk
	bigdw 101 ; SDef
	db "DOKUKURAGE@"


	db GENGAR
	db GOLD_BERRY
	db THIEF, LICK, NIGHT_SHADE, GIGA_DRAIN
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	db $f7, $f7 ; DVs
	db 10, 30, 15, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 101 ; HP
	bigdw 101 ; Max HP
	bigdw 68 ; Atk
	bigdw 61 ; Def
	bigdw 96 ; Spd
	bigdw 103 ; SAtk
	bigdw 70 ; SDef
	db "GENGA-@@@@@"


	db URSARING
	db GOLD_BERRY
	db HEADBUTT, PROTECT, ROAR, LEER
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	db $77, $45 ; DVs
	db 15, 10, 20, 30 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 114 ; HP
	bigdw 114 ; Max HP
	bigdw 100 ; Atk
	bigdw 67 ; Def
	bigdw 53 ; Spd
	bigdw 65 ; SAtk
	bigdw 65 ; SDef
	db "RINGUMA@@@@"


	db FEAROW
	db BRIGHTPOWDER
	db MIRROR_MOVE, PURSUIT, PECK, SWIFT
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	db $67, $77 ; DVs
	db 20, 20, 35, 20 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 96 ; HP
	bigdw 96 ; Max HP
	bigdw 75 ; Atk
	bigdw 61 ; Def
	bigdw 82 ; Spd
	bigdw 58 ; SAtk
	bigdw 58 ; SDef
	db "ONIDORIRU@@"


	db PRIMEAPE
	db MIRACLEBERRY
	db LOW_KICK, KARATE_CHOP, REVERSAL, FOCUS_ENERGY
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	db $77, $67 ; DVs
	db 20, 25, 15, 30 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 99 ; HP
	bigdw 99 ; Max HP
	bigdw 85 ; Atk
	bigdw 58 ; Def
	bigdw 78 ; Spd
	bigdw 58 ; SAtk
	bigdw 64 ; SDef
	db "OKORIZARU@@"




BattleTowerMons4:

	db TAUROS
	db GOLD_BERRY
	db RETURN, HYPER_BEAM, EARTHQUAKE, IRON_TAIL
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	db $fd, $fe ; DVs
	db 20, 5, 10, 15 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 143 ; HP
	bigdw 143 ; Max HP
	bigdw 119 ; Atk
	bigdw 113 ; Def
	bigdw 127 ; Spd
	bigdw 70 ; SAtk
	bigdw 94 ; SDef
	db "KENTAROSU@@"


	db KINGDRA
	db LEFTOVERS
	db SURF, DRAGONBREATH, HYPER_BEAM, BLIZZARD
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	db $fd, $ef ; DVs
	db 15, 20, 5, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 142 ; HP
	bigdw 142 ; Max HP
	bigdw 115 ; Atk
	bigdw 113 ; Def
	bigdw 106 ; Spd
	bigdw 115 ; SAtk
	bigdw 115 ; SDef
	db "KINGUDORA@@"


	db SNORLAX
	db QUICK_CLAW
	db ATTRACT, BODY_SLAM, PSYCH_UP, EARTHQUAKE
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	db $ed, $dd ; DVs
	db 15, 15, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 205 ; HP
	bigdw 205 ; Max HP
	bigdw 126 ; Atk
	bigdw 89 ; Def
	bigdw 61 ; Spd
	bigdw 89 ; SAtk
	bigdw 125 ; SDef
	db "KABIGON@@@@"


	db LAPRAS
	db LEFTOVERS
	db THUNDERBOLT, ICE_BEAM, CONFUSE_RAY, SURF
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	db $fd, $eb ; DVs
	db 15, 10, 10, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 186 ; HP
	bigdw 186 ; Max HP
	bigdw 107 ; Atk
	bigdw 101 ; Def
	bigdw 86 ; Spd
	bigdw 103 ; SAtk
	bigdw 111 ; SDef
	db "RAPURASU@@@"


	db STEELIX
	db GOLD_BERRY
	db SANDSTORM, IRON_TAIL, EARTHQUAKE, TOXIC
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	db $ef, $db ; DVs
	db 10, 15, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 137 ; HP
	bigdw 137 ; Max HP
	bigdw 106 ; Atk
	bigdw 199 ; Def
	bigdw 61 ; Spd
	bigdw 79 ; SAtk
	bigdw 87 ; SDef
	db "HAGANE-RU@@"


	db ALAKAZAM
	db KINGS_ROCK
	db PSYCHIC_M, THUNDERPUNCH, RECOVER, FIRE_PUNCH
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 55000
	bigdw 50000
	db $dd, $ef ; DVs
	db 10, 15, 20, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 126 ; HP
	bigdw 126 ; Max HP
	bigdw 76 ; Atk
	bigdw 73 ; Def
	bigdw 135 ; Spd
	bigdw 147 ; SAtk
	bigdw 107 ; SDef
	db "HU-DEiN@@@@"


	db STARMIE
	db LEFTOVERS
	db BLIZZARD, THUNDERBOLT, SURF, PSYCHIC_M
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 45000
	db $fd, $be ; DVs
	db 5, 15, 15, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 131 ; HP
	bigdw 131 ; Max HP
	bigdw 99 ; Atk
	bigdw 104 ; Def
	bigdw 127 ; Spd
	bigdw 117 ; SAtk
	bigdw 105 ; SDef
	db "SUTA-MI-@@@"


	db WOBBUFFET
	db GOLD_BERRY
	db COUNTER, MIRROR_COAT, SAFEGUARD, DESTINY_BOND
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	db $bf, $e7 ; DVs
	db 20, 20, 25, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 233 ; HP
	bigdw 233 ; Max HP
	bigdw 62 ; Atk
	bigdw 85 ; Def
	bigdw 64 ; Spd
	bigdw 59 ; SAtk
	bigdw 79 ; SDef
	db "SO-NANSU@@@"


	db GOLEM
	db FOCUS_BAND
	db EXPLOSION, EARTHQUAKE, MEGA_PUNCH, ROCK_SLIDE
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 40000
	bigdw 50000
	bigdw 45000
	db $dd, $ed ; DVs
	db 5, 10, 20, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 145 ; HP
	bigdw 145 ; Max HP
	bigdw 125 ; Atk
	bigdw 139 ; Def
	bigdw 74 ; Spd
	bigdw 80 ; SAtk
	bigdw 88 ; SDef
	db "GORO-NIya@@"


	db SCIZOR
	db SCOPE_LENS
	db SLASH, STEEL_WING, PURSUIT, HYPER_BEAM
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 40000
	bigdw 50000
	db $bd, $fe ; DVs
	db 20, 25, 20, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 139 ; HP
	bigdw 139 ; Max HP
	bigdw 139 ; Atk
	bigdw 117 ; Def
	bigdw 89 ; Spd
	bigdw 82 ; SAtk
	bigdw 102 ; SDef
	db "HAtuSAMU@@@"


	db DUGTRIO
	db KINGS_ROCK
	db EARTHQUAKE, HYPER_BEAM, SLUDGE_BOMB, MUD_SLAP
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	db $fe, $bb ; DVs
	db 10, 5, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 108 ; HP
	bigdw 108 ; Max HP
	bigdw 103 ; Atk
	bigdw 78 ; Def
	bigdw 131 ; Spd
	bigdw 75 ; SAtk
	bigdw 91 ; SDef
	db "DAGUTORIO@@"


	db SLOWBRO
	db MIRACLEBERRY
	db SURF, PSYCHIC_M, EARTHQUAKE, BLIZZARD
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 50000
	db $bf, $cf ; DVs
	db 15, 10, 10, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 157 ; HP
	bigdw 157 ; Max HP
	bigdw 95 ; Atk
	bigdw 126 ; Def
	bigdw 60 ; Spd
	bigdw 119 ; SAtk
	bigdw 103 ; SDef
	db "YADORAN@@@@"


	db PORYGON2
	db NO_ITEM
	db CONVERSION2, CONVERSION, PSYBEAM, THIEF
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	db $bc, $ef ; DVs
	db 30, 30, 20, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 147 ; HP
	bigdw 147 ; Max HP
	bigdw 99 ; Atk
	bigdw 108 ; Def
	bigdw 86 ; Spd
	bigdw 123 ; SAtk
	bigdw 115 ; SDef
	db "PORIGON2@@@"


	db ARCANINE
	db CHARCOAL
	db FLAME_WHEEL, LEER, BODY_SLAM, ROAR
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	db $fe, $bb ; DVs
	db 25, 30, 15, 20 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 152 ; HP
	bigdw 152 ; Max HP
	bigdw 127 ; Atk
	bigdw 102 ; Def
	bigdw 111 ; Spd
	bigdw 115 ; SAtk
	bigdw 99 ; SDef
	db "UINDEi@@@@@"


	db FORRETRESS
	db LEFTOVERS
	db RAPID_SPIN, PROTECT, TOXIC, SANDSTORM
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	db $fa, $7f ; DVs
	db 40, 10, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 140 ; HP
	bigdw 140 ; Max HP
	bigdw 111 ; Atk
	bigdw 147 ; Def
	bigdw 64 ; Spd
	bigdw 87 ; SAtk
	bigdw 87 ; SDef
	db "HUoRETOSU@@"


	db OMASTAR
	db GOLD_BERRY
	db CURSE, WATER_GUN, ANCIENTPOWER, ROCK_SMASH
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	db $ef, $f7 ; DVs
	db 10, 25, 5, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 133 ; HP
	bigdw 133 ; Max HP
	bigdw 86 ; Atk
	bigdw 139 ; Def
	bigdw 83 ; Spd
	bigdw 124 ; SAtk
	bigdw 88 ; SDef
	db "OMUSUTA-@@@"


	db CHARIZARD
	db KINGS_ROCK
	db FIRE_SPIN, DRAGON_RAGE, FLY, SLASH
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	db $fe, $fe ; DVs
	db 15, 10, 15, 20 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 142 ; HP
	bigdw 142 ; Max HP
	bigdw 106 ; Atk
	bigdw 100 ; Def
	bigdw 119 ; Spd
	bigdw 125 ; SAtk
	bigdw 106 ; SDef
	db "RIZA-DON@@@"


	db EXEGGUTOR
	db BRIGHTPOWDER
	db EGG_BOMB, STOMP, PSYCH_UP, CONFUSION
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	db $f7, $e7 ; DVs
	db 10, 20, 10, 25 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 158 ; HP
	bigdw 158 ; Max HP
	bigdw 115 ; Atk
	bigdw 100 ; Def
	bigdw 82 ; Spd
	bigdw 132 ; SAtk
	bigdw 84 ; SDef
	db "NAtuSI-@@@@"


	db HYPNO
	db BRIGHTPOWDER
	db CONFUSION, THUNDERPUNCH, HEADBUTT, DISABLE
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	db $77, $7a ; DVs
	db 25, 15, 15, 20 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 146 ; HP
	bigdw 146 ; Max HP
	bigdw 86 ; Atk
	bigdw 83 ; Def
	bigdw 81 ; Spd
	bigdw 88 ; SAtk
	bigdw 122 ; SDef
	db "SURI-PA-@@@"


	db MUK
	db QUICK_CLAW
	db SCREECH, TOXIC, SLUDGE, HARDEN
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	db $75, $6b ; DVs
	db 40, 10, 20, 30 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 161 ; HP
	bigdw 161 ; Max HP
	bigdw 111 ; Atk
	bigdw 86 ; Def
	bigdw 67 ; Spd
	bigdw 83 ; SAtk
	bigdw 111 ; SDef
	db "BETOBETON@@"


	db ELECTABUZZ
	db KINGS_ROCK
	db LIGHT_SCREEN, THUNDERPUNCH, SWIFT, SNORE
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	db $65, $77 ; DVs
	db 30, 15, 20, 15 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 124 ; HP
	bigdw 124 ; Max HP
	bigdw 93 ; Atk
	bigdw 71 ; Def
	bigdw 111 ; Spd
	bigdw 103 ; SAtk
	bigdw 95 ; SDef
	db "EREBU-@@@@@"




BattleTowerMons5:

	db KINGDRA
	db GOLD_BERRY
	db SURF, HYPER_BEAM, BLIZZARD, DRAGONBREATH
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 55000
	bigdw 55000
	bigdw 60000
	bigdw 50000
	bigdw 55000
	db $dd, $ff ; DVs
	db 15, 5, 5, 20 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 179 ; HP
	bigdw 179 ; Max HP
	bigdw 142 ; Atk
	bigdw 143 ; Def
	bigdw 132 ; Spd
	bigdw 144 ; SAtk
	bigdw 144 ; SDef
	db "KINGUDORA@@"


	db HOUNDOOM
	db MIRACLEBERRY
	db REST, CRUNCH, DREAM_EATER, FLAMETHROWER
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 55000
	bigdw 50000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	db $dd, $fc ; DVs
	db 10, 15, 15, 15 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 178 ; HP
	bigdw 178 ; Max HP
	bigdw 135 ; Atk
	bigdw 98 ; Def
	bigdw 145 ; Spd
	bigdw 157 ; SAtk
	bigdw 127 ; SDef
	db "HERUGA-@@@@"


	db SHUCKLE
	db LEFTOVERS
	db SANDSTORM, REST, TOXIC, WRAP
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 55000
	db $fd, $cf ; DVs
	db 10, 10, 10, 20 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 123 ; HP
	bigdw 123 ; Max HP
	bigdw 60 ; Atk
	bigdw 278 ; Def
	bigdw 52 ; Spd
	bigdw 59 ; SAtk
	bigdw 279 ; SDef
	db "TUBOTUBO@@@"


	db SNORLAX
	db LEFTOVERS
	db HYPER_BEAM, EARTHQUAKE, SURF, PSYCH_UP
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 55000
	bigdw 55000
	bigdw 60000
	bigdw 55000
	db $fd, $ef ; DVs
	db 5, 10, 15, 10 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 263 ; HP
	bigdw 263 ; Max HP
	bigdw 159 ; Atk
	bigdw 112 ; Def
	bigdw 79 ; Spd
	bigdw 114 ; SAtk
	bigdw 159 ; SDef
	db "KABIGON@@@@"


	db LAPRAS
	db GOLD_BERRY
	db THUNDERBOLT, SURF, CONFUSE_RAY, BLIZZARD
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 55000
	bigdw 60000
	bigdw 60000
	bigdw 55000
	bigdw 60000
	db $dd, $dd ; DVs
	db 15, 15, 10, 5 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 234 ; HP
	bigdw 234 ; Max HP
	bigdw 133 ; Atk
	bigdw 128 ; Def
	bigdw 107 ; Spd
	bigdw 133 ; SAtk
	bigdw 143 ; SDef
	db "RAPURASU@@@"


	db JOLTEON
	db KINGS_ROCK
	db THUNDERBOLT, THUNDER_WAVE, SHADOW_BALL, HIDDEN_POWER
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 55000
	bigdw 60000
	bigdw 57000
	bigdw 55000
	bigdw 55000
	db $ed, $ff ; DVs
	db 15, 20, 15, 15 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 161 ; HP
	bigdw 161 ; Max HP
	bigdw 114 ; Atk
	bigdw 107 ; Def
	bigdw 179 ; Spd
	bigdw 159 ; SAtk
	bigdw 144 ; SDef
	db "SANDA-SU@@@"


	db SCIZOR
	db LEFTOVERS
	db HYPER_BEAM, SLASH, AGILITY, METAL_CLAW
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 40000
	bigdw 50000
	bigdw 45000
	db $df, $ed ; DVs
	db 5, 20, 30, 35 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 169 ; HP
	bigdw 169 ; Max HP
	bigdw 175 ; Atk
	bigdw 145 ; Def
	bigdw 111 ; Spd
	bigdw 99 ; SAtk
	bigdw 124 ; SDef
	db "HAtuSAMU@@@"


	db SLOWKING
	db MINT_BERRY
	db REST, SURF, PSYCHIC_M, AMNESIA
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 40000
	bigdw 45000
	bigdw 50000
	bigdw 50000
	db $df, $de ; DVs
	db 10, 15, 10, 20 ; PP
	db 15 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 196 ; HP
	bigdw 196 ; Max HP
	bigdw 118 ; Atk
	bigdw 126 ; Def
	bigdw 75 ; Spd
	bigdw 146 ; SAtk
	bigdw 156 ; SDef
	db "YADOKINGU@@"


	db MACHAMP
	db GOLD_BERRY
	db CROSS_CHOP, EARTHQUAKE, FIRE_BLAST, THUNDERPUNCH
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 45000
	bigdw 50000
	bigdw 40000
	bigdw 44000
	db $ff, $ec ; DVs
	db 5, 10, 5, 15 ; PP
	db 13 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 187 ; HP
	bigdw 187 ; Max HP
	bigdw 176 ; Atk
	bigdw 127 ; Def
	bigdw 99 ; Spd
	bigdw 108 ; SAtk
	bigdw 128 ; SDef
	db "KAIRIKI-@@@"


	db STARMIE
	db SCOPE_LENS
	db THUNDER_WAVE, RECOVER, THUNDERBOLT, SURF
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 44000
	bigdw 40000
	bigdw 45000
	bigdw 40000
	db $ff, $ff ; DVs
	db 20, 20, 15, 15 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 161 ; HP
	bigdw 161 ; Max HP
	bigdw 121 ; Atk
	bigdw 130 ; Def
	bigdw 161 ; Spd
	bigdw 145 ; SAtk
	bigdw 130 ; SDef
	db "SUTA-MI-@@@"


	db DUGTRIO
	db KINGS_ROCK
	db EARTHQUAKE, SLASH, HYPER_BEAM, SLUDGE_BOMB
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 40000
	bigdw 50000
	bigdw 45000
	bigdw 50000
	db $f7, $fe ; DVs
	db 10, 20, 5, 10 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 135 ; HP
	bigdw 135 ; Max HP
	bigdw 125 ; Atk
	bigdw 89 ; Def
	bigdw 166 ; Spd
	bigdw 96 ; SAtk
	bigdw 116 ; SDef
	db "DAGUTORIO@@"


	db ELECTRODE
	db MIRACLEBERRY
	db THUNDERBOLT, EXPLOSION, MIRROR_COAT, REST
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 45000
	bigdw 54000
	bigdw 40000
	bigdw 50000
	db $7d, $fe ; DVs
	db 15, 5, 20, 10 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 161 ; HP
	bigdw 161 ; Max HP
	bigdw 88 ; Atk
	bigdw 117 ; Def
	bigdw 185 ; Spd
	bigdw 126 ; SAtk
	bigdw 126 ; SDef
	db "MARUMAIN@@@"


	db AERODACTYL
	db KINGS_ROCK
	db HYPER_BEAM, EARTHQUAKE, FIRE_BLAST, IRON_TAIL
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 50000
	bigdw 45000
	bigdw 45000
	db $fd, $dd ; DVs
	db 5, 10, 5, 15 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 181 ; HP
	bigdw 181 ; Max HP
	bigdw 152 ; Atk
	bigdw 110 ; Def
	bigdw 174 ; Spd
	bigdw 104 ; SAtk
	bigdw 119 ; SDef
	db "PUTERA@@@@@"


	db CROBAT
	db LEFTOVERS
	db CONFUSE_RAY, ATTRACT, HYPER_BEAM, TOXIC
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 40000
	bigdw 50000
	bigdw 40000
	bigdw 50000
	db $ef, $ff ; DVs
	db 10, 15, 5, 10 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 178 ; HP
	bigdw 178 ; Max HP
	bigdw 134 ; Atk
	bigdw 127 ; Def
	bigdw 175 ; Spd
	bigdw 117 ; SAtk
	bigdw 127 ; SDef
	db "KUROBAtuTO@"


	db ZAPDOS
	db MIRACLEBERRY
	db DRILL_PECK, THUNDERBOLT, THUNDER_WAVE, HYPER_BEAM
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 45000
	bigdw 40000
	bigdw 50000
	db $fd, $de ; DVs
	db 20, 15, 20, 5 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 190 ; HP
	bigdw 190 ; Max HP
	bigdw 137 ; Atk
	bigdw 129 ; Def
	bigdw 143 ; Spd
	bigdw 171 ; SAtk
	bigdw 136 ; SDef
	db "SANDA-@@@@@"


	db SKARMORY
	db GOLD_BERRY
	db SANDSTORM, FLY, STEEL_WING, TOXIC
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 40000
	db $d7, $ed ; DVs
	db 10, 15, 25, 10 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 164 ; HP
	bigdw 164 ; Max HP
	bigdw 125 ; Atk
	bigdw 179 ; Def
	bigdw 116 ; Spd
	bigdw 83 ; SAtk
	bigdw 113 ; SDef
	db "EA-MUDO@@@@"


	db FORRETRESS
	db LEFTOVERS
	db SANDSTORM, TOXIC, EXPLOSION, SWAGGER
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 55000
	bigdw 45000
	bigdw 40000
	db $cf, $dd ; DVs
	db 10, 10, 5, 15 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 169 ; HP
	bigdw 169 ; Max HP
	bigdw 134 ; Atk
	bigdw 189 ; Def
	bigdw 84 ; Spd
	bigdw 103 ; SAtk
	bigdw 103 ; SDef
	db "HUoRETOSU@@"


	db STEELIX
	db MIRACLEBERRY
	db SANDSTORM, IRON_TAIL, REST, EARTHQUAKE
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 50000
	bigdw 40000
	bigdw 45000
	db $dd, $dd ; DVs
	db 10, 15, 10, 10 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 176 ; HP
	bigdw 176 ; Max HP
	bigdw 130 ; Atk
	bigdw 245 ; Def
	bigdw 73 ; Spd
	bigdw 99 ; SAtk
	bigdw 109 ; SDef
	db "HAGANE-RU@@"


	db GIRAFARIG
	db SCOPE_LENS
	db DREAM_EATER, CRUNCH, PSYCHIC_M, EARTHQUAKE
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 40000
	bigdw 40000
	bigdw 40000
	bigdw 40000
	db $45, $56 ; DVs
	db 15, 15, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 161 ; HP
	bigdw 161 ; Max HP
	bigdw 114 ; Atk
	bigdw 100 ; Def
	bigdw 120 ; Spd
	bigdw 126 ; SAtk
	bigdw 101 ; SDef
	db "KIRINRIKI@@"


	db GYARADOS
	db MIRACLEBERRY
	db HYPER_BEAM, SURF, RAIN_DANCE, ZAP_CANNON
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 40000
	bigdw 40000
	bigdw 40000
	bigdw 40000
	db $75, $65 ; DVs
	db 5, 15, 5, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 193 ; HP
	bigdw 193 ; Max HP
	bigdw 162 ; Atk
	bigdw 114 ; Def
	bigdw 117 ; Spd
	bigdw 95 ; SAtk
	bigdw 135 ; SDef
	db "GIyaRADOSU@"


	db ARTICUNO
	db GOLD_BERRY
	db BLIZZARD, HYPER_BEAM, ROAR, ICY_WIND
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 40000
	bigdw 40000
	bigdw 40000
	bigdw 40000
	db $45, $56 ; DVs
	db 5, 5, 20, 15 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 181 ; HP
	bigdw 181 ; Max HP
	bigdw 119 ; Atk
	bigdw 135 ; Def
	bigdw 120 ; Spd
	bigdw 131 ; SAtk
	bigdw 161 ; SDef
	db "HURI-ZA-@@@"




BattleTowerMons6:

	db KINGDRA
	db LEFTOVERS
	db DRAGONBREATH, SURF, HYPER_BEAM, BLIZZARD
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 55000
	bigdw 55000
	bigdw 50000
	bigdw 60000
	bigdw 60000
	db $dd, $fe ; DVs
	db 20, 15, 5, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 211 ; HP
	bigdw 211 ; Max HP
	bigdw 169 ; Atk
	bigdw 167 ; Def
	bigdw 161 ; Spd
	bigdw 172 ; SAtk
	bigdw 172 ; SDef
	db "KINGUDORA@@"


	db TYRANITAR
	db GOLD_BERRY
	db CRUNCH, EARTHQUAKE, ROCK_SLIDE, HYPER_BEAM
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 55000
	bigdw 60000
	bigdw 55000
	bigdw 60000
	bigdw 55000
	db $fd, $ed ; DVs
	db 15, 10, 10, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 240 ; HP
	bigdw 240 ; Max HP
	bigdw 220 ; Atk
	bigdw 187 ; Def
	bigdw 131 ; Spd
	bigdw 169 ; SAtk
	bigdw 175 ; SDef
	db "BANGIRASU@@"


	db HOUNDOOM
	db MIRACLEBERRY
	db FLAMETHROWER, CRUNCH, DREAM_EATER, REST
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 55000
	bigdw 55000
	bigdw 60000
	bigdw 55000
	db $fb, $ef ; DVs
	db 15, 15, 15, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 212 ; HP
	bigdw 212 ; Max HP
	bigdw 165 ; Atk
	bigdw 113 ; Def
	bigdw 172 ; Spd
	bigdw 189 ; SAtk
	bigdw 153 ; SDef
	db "HERUGA-@@@@"


	db PORYGON2
	db LEFTOVERS
	db BLIZZARD, RECOVER, TOXIC, PSYCHIC_M
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 55000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 55000
	db $dd, $de ; DVs
	db 5, 20, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 223 ; HP
	bigdw 223 ; Max HP
	bigdw 149 ; Atk
	bigdw 161 ; Def
	bigdw 125 ; Spd
	bigdw 182 ; SAtk
	bigdw 170 ; SDef
	db "PORIGON2@@@"


	db MACHAMP
	db QUICK_CLAW
	db FIRE_PUNCH, CROSS_CHOP, THUNDERPUNCH, EARTHQUAKE
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 50000
	db $fd, $ef ; DVs
	db 15, 5, 15, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 226 ; HP
	bigdw 226 ; Max HP
	bigdw 212 ; Atk
	bigdw 148 ; Def
	bigdw 120 ; Spd
	bigdw 134 ; SAtk
	bigdw 158 ; SDef
	db "KAIRIKI-@@@"


	db ZAPDOS
	db MINT_BERRY
	db REST, DRILL_PECK, THUNDERBOLT, THUNDER_WAVE
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 55000
	bigdw 50000
	db $dd, $fd ; DVs
	db 10, 20, 15, 20 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 229 ; HP
	bigdw 229 ; Max HP
	bigdw 160 ; Atk
	bigdw 155 ; Def
	bigdw 177 ; Spd
	bigdw 203 ; SAtk
	bigdw 161 ; SDef
	db "SANDA-@@@@@"


	db WOBBUFFET
	db GOLD_BERRY
	db COUNTER, MIRROR_COAT, DESTINY_BOND, SAFEGUARD
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 45000
	db $fd, $ed ; DVs
	db 20, 20, 5, 25 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 346 ; HP
	bigdw 346 ; Max HP
	bigdw 95 ; Atk
	bigdw 122 ; Def
	bigdw 94 ; Spd
	bigdw 92 ; SAtk
	bigdw 122 ; SDef
	db "SO-NANSU@@@"


	db AERODACTYL
	db LEFTOVERS
	db HYPER_BEAM, SUPERSONIC, EARTHQUAKE, BITE
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 50000
	bigdw 45000
	bigdw 45000
	db $fd, $dd ; DVs
	db 5, 20, 10, 25 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 215 ; HP
	bigdw 215 ; Max HP
	bigdw 182 ; Atk
	bigdw 131 ; Def
	bigdw 208 ; Spd
	bigdw 124 ; SAtk
	bigdw 142 ; SDef
	db "PUTERA@@@@@"


	db DRAGONITE
	db MIRACLEBERRY
	db HYPER_BEAM, ICY_WIND, THUNDERBOLT, SURF
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 40000
	bigdw 50000
	bigdw 45000
	db $dd, $fd ; DVs
	db 5, 15, 15, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 229 ; HP
	bigdw 229 ; Max HP
	bigdw 214 ; Atk
	bigdw 164 ; Def
	bigdw 152 ; Spd
	bigdw 172 ; SAtk
	bigdw 172 ; SDef
	db "KAIRIyu-@@@"


	db UMBREON
	db GOLD_BERRY
	db MUD_SLAP, MOONLIGHT, PSYCHIC_M, FAINT_ATTACK
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	db $fd, $ef ; DVs
	db 10, 5, 10, 20 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 232 ; HP
	bigdw 232 ; Max HP
	bigdw 134 ; Atk
	bigdw 185 ; Def
	bigdw 132 ; Spd
	bigdw 128 ; SAtk
	bigdw 212 ; SDef
	db "BURAtuKI-@@"


	db ARCANINE
	db CHARCOAL
	db FLAMETHROWER, CRUNCH, EXTREMESPEED, IRON_TAIL
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 55000
	bigdw 50000
	bigdw 40000
	bigdw 55000
	bigdw 50000
	db $fd, $ed ; DVs
	db 15, 15, 5, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 228 ; HP
	bigdw 228 ; Max HP
	bigdw 188 ; Atk
	bigdw 146 ; Def
	bigdw 170 ; Spd
	bigdw 173 ; SAtk
	bigdw 149 ; SDef
	db "UINDEi@@@@@"


	db SKARMORY
	db MIRACLEBERRY
	db STEEL_WING, FLY, TOXIC, PROTECT
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 50000
	db $fb, $eb ; DVs
	db 25, 15, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 196 ; HP
	bigdw 196 ; Max HP
	bigdw 152 ; Atk
	bigdw 218 ; Def
	bigdw 138 ; Spd
	bigdw 99 ; SAtk
	bigdw 135 ; SDef
	db "EA-MUDO@@@@"


	db BLISSEY
	db LEFTOVERS
	db SOFTBOILED, TOXIC, PROTECT, PSYCHIC_M
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 45000
	bigdw 50000
	db $fb, $cd ; DVs
	db 10, 10, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 424 ; HP
	bigdw 424 ; Max HP
	bigdw 66 ; Atk
	bigdw 63 ; Def
	bigdw 117 ; Spd
	bigdw 143 ; SAtk
	bigdw 215 ; SDef
	db "HAPINASU@@@"


	db SNORLAX
	db PINK_BOW
	db ROCK_SLIDE, SURF, BODY_SLAM, EARTHQUAKE
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	db $fa, $fc ; DVs
	db 10, 15, 15, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 307 ; HP
	bigdw 307 ; Max HP
	bigdw 186 ; Atk
	bigdw 128 ; Def
	bigdw 92 ; Spd
	bigdw 130 ; SAtk
	bigdw 184 ; SDef
	db "KABIGON@@@@"


	db HERACROSS
	db FOCUS_BAND
	db REVERSAL, MEGAHORN, EARTHQUAKE, COUNTER
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 40000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	db $df, $ed ; DVs
	db 15, 10, 10, 20 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 214 ; HP
	bigdw 214 ; Max HP
	bigdw 200 ; Atk
	bigdw 146 ; Def
	bigdw 156 ; Spd
	bigdw 101 ; SAtk
	bigdw 167 ; SDef
	db "HERAKUROSU@"


	db JYNX
	db MIRACLEBERRY
	db BLIZZARD, PSYCHIC_M, SHADOW_BALL, ICY_WIND
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	db $ff, $eb ; DVs
	db 5, 10, 15, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 196 ; HP
	bigdw 196 ; Max HP
	bigdw 116 ; Atk
	bigdw 98 ; Def
	bigdw 168 ; Spd
	bigdw 189 ; SAtk
	bigdw 165 ; SDef
	db "RU-ZIyuRA@@"


	db BLASTOISE
	db GOLD_BERRY
	db SURF, EARTHQUAKE, RAPID_SPIN, BLIZZARD
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	db $fe, $fe ; DVs
	db 15, 10, 40, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 209 ; HP
	bigdw 209 ; Max HP
	bigdw 155 ; Atk
	bigdw 174 ; Def
	bigdw 149 ; Spd
	bigdw 156 ; SAtk
	bigdw 180 ; SDef
	db "KAMEtuKUSU@"


	db RHYDON
	db QUICK_CLAW
	db EARTHQUAKE, SURF, IRON_TAIL, ROCK_SLIDE
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	db $fb, $fa ; DVs
	db 10, 15, 15, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 245 ; HP
	bigdw 245 ; Max HP
	bigdw 212 ; Atk
	bigdw 195 ; Def
	bigdw 104 ; Spd
	bigdw 104 ; SAtk
	bigdw 104 ; SDef
	db "SAIDON@@@@@"


	db SANDSLASH
	db SCOPE_LENS
	db EARTHQUAKE, SLASH, HYPER_BEAM, SNORE
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	db $b7, $67 ; DVs
	db 10, 20, 5, 15 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 201 ; HP
	bigdw 201 ; Max HP
	bigdw 164 ; Atk
	bigdw 171 ; Def
	bigdw 116 ; Spd
	bigdw 93 ; SAtk
	bigdw 105 ; SDef
	db "SANDOPAN@@@"


	db PARASECT
	db GOLD_BERRY
	db SPORE, GIGA_DRAIN, HYPER_BEAM, SLUDGE_BOMB
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	db $66, $5f ; DVs
	db 15, 5, 5, 10 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 171 ; HP
	bigdw 171 ; Max HP
	bigdw 152 ; Atk
	bigdw 134 ; Def
	bigdw 72 ; Spd
	bigdw 120 ; SAtk
	bigdw 144 ; SDef
	db "PARASEKUTO@"


	db GOLEM
	db BRIGHTPOWDER
	db EXPLOSION, EARTHQUAKE, FIRE_PUNCH, FRUSTRATION
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	db $76, $57 ; DVs
	db 5, 10, 15, 20 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 205 ; HP
	bigdw 205 ; Max HP
	bigdw 171 ; Atk
	bigdw 194 ; Def
	bigdw 90 ; Spd
	bigdw 105 ; SAtk
	bigdw 117 ; SDef
	db "GORO-NIya@@"




BattleTowerMons7:

	db JOLTEON
	db MIRACLEBERRY
	db THUNDERBOLT, HYPER_BEAM, SHADOW_BALL, ROAR
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 56000
	bigdw 55000
	bigdw 50000
	bigdw 60000
	db $fb, $ef ; DVs
	db 15, 5, 15, 20 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 231 ; HP
	bigdw 231 ; Max HP
	bigdw 158 ; Atk
	bigdw 145 ; Def
	bigdw 245 ; Spd
	bigdw 222 ; SAtk
	bigdw 201 ; SDef
	db "SANDA-SU@@@"


	db VAPOREON
	db LEFTOVERS
	db BLIZZARD, SHADOW_BALL, SURF, MUD_SLAP
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 60000
	bigdw 60000
	bigdw 50000
	db $bf, $ef ; DVs
	db 5, 15, 15, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 318 ; HP
	bigdw 318 ; Max HP
	bigdw 149 ; Atk
	bigdw 152 ; Def
	bigdw 158 ; Spd
	bigdw 218 ; SAtk
	bigdw 197 ; SDef
	db "SIyaWA-ZU@@"


	db UMBREON
	db GOLD_BERRY
	db FAINT_ATTACK, MOONLIGHT, PSYCH_UP, TOXIC
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 54000
	bigdw 60000
	bigdw 55000
	bigdw 50000
	bigdw 58000
	db $dd, $dd ; DVs
	db 20, 5, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 274 ; HP
	bigdw 274 ; Max HP
	bigdw 156 ; Atk
	bigdw 217 ; Def
	bigdw 152 ; Spd
	bigdw 149 ; SAtk
	bigdw 247 ; SDef
	db "BURAtuKI-@@"


	db BLISSEY
	db GOLD_BERRY
	db COUNTER, SOFTBOILED, SHADOW_BALL, THUNDERBOLT
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 55000
	bigdw 55000
	bigdw 55000
	bigdw 58000
	bigdw 50000
	db $df, $ed ; DVs
	db 20, 10, 15, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 495 ; HP
	bigdw 495 ; Max HP
	bigdw 77 ; Atk
	bigdw 80 ; Def
	bigdw 143 ; Spd
	bigdw 166 ; SAtk
	bigdw 250 ; SDef
	db "HAPINASU@@@"


	db SNORLAX
	db LEFTOVERS
	db ROCK_SLIDE, EARTHQUAKE, BLIZZARD, SHADOW_BALL
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 55000
	bigdw 55000
	bigdw 60000
	bigdw 55000
	bigdw 50000
	db $dd, $dd ; DVs
	db 10, 10, 5, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 365 ; HP
	bigdw 365 ; Max HP
	bigdw 217 ; Atk
	bigdw 156 ; Def
	bigdw 105 ; Spd
	bigdw 152 ; SAtk
	bigdw 215 ; SDef
	db "KABIGON@@@@"


	db HOUNDOOM
	db KINGS_ROCK
	db CRUNCH, FLAMETHROWER, FAINT_ATTACK, ROAR
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 58000
	bigdw 50000
	bigdw 55000
	bigdw 60000
	bigdw 55000
	db $dd, $cd ; DVs
	db 15, 15, 20, 20 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 245 ; HP
	bigdw 245 ; Max HP
	bigdw 187 ; Atk
	bigdw 133 ; Def
	bigdw 197 ; Spd
	bigdw 217 ; SAtk
	bigdw 175 ; SDef
	db "HERUGA-@@@@"


	db TYRANITAR
	db LEFTOVERS
	db EARTHQUAKE, CRUNCH, ROCK_SLIDE, HYPER_BEAM
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 45000
	bigdw 45000
	bigdw 50000
	bigdw 45000
	db $db, $df ; DVs
	db 10, 15, 10, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 279 ; HP
	bigdw 279 ; Max HP
	bigdw 247 ; Atk
	bigdw 211 ; Def
	bigdw 147 ; Spd
	bigdw 196 ; SAtk
	bigdw 203 ; SDef
	db "BANGIRASU@@"


	db ZAPDOS
	db GOLD_BERRY
	db THUNDERBOLT, DRILL_PECK, THUNDER_WAVE, HYPER_BEAM
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 50000
	bigdw 45000
	bigdw 45000
	db $db, $df ; DVs
	db 15, 20, 20, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 264 ; HP
	bigdw 264 ; Max HP
	bigdw 187 ; Atk
	bigdw 177 ; Def
	bigdw 200 ; Spd
	bigdw 238 ; SAtk
	bigdw 189 ; SDef
	db "SANDA-@@@@@"


	db EXEGGUTOR
	db MIRACLEBERRY
	db REST, EXPLOSION, PSYCHIC_M, GIGA_DRAIN
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 40000
	bigdw 50000
	bigdw 45000
	db $dd, $ed ; DVs
	db 10, 5, 10, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 268 ; HP
	bigdw 268 ; Max HP
	bigdw 194 ; Atk
	bigdw 177 ; Def
	bigdw 140 ; Spd
	bigdw 235 ; SAtk
	bigdw 151 ; SDef
	db "NAtuSI-@@@@"


	db UMBREON
	db GOLD_BERRY
	db MOONLIGHT, FAINT_ATTACK, PSYCHIC_M, SHADOW_BALL
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 45000
	bigdw 45000
	bigdw 50000
	db $fd, $eb ; DVs
	db 5, 20, 10, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 269 ; HP
	bigdw 269 ; Max HP
	bigdw 155 ; Atk
	bigdw 214 ; Def
	bigdw 152 ; Spd
	bigdw 142 ; SAtk
	bigdw 240 ; SDef
	db "BURAtuKI-@@"


	db GYARADOS
	db BRIGHTPOWDER
	db SURF, THUNDERBOLT, HYPER_BEAM, ROAR
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 55000
	bigdw 45000
	bigdw 50000
	bigdw 55000
	bigdw 50000
	db $db, $ef ; DVs
	db 15, 15, 5, 20 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 271 ; HP
	bigdw 271 ; Max HP
	bigdw 235 ; Atk
	bigdw 169 ; Def
	bigdw 178 ; Spd
	bigdw 148 ; SAtk
	bigdw 204 ; SDef
	db "GIyaRADOSU@"


	db QUAGSIRE
	db MIRACLEBERRY
	db EARTHQUAKE, SURF, SLUDGE_BOMB, IRON_TAIL
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 50000
	db $de, $dd ; DVs
	db 10, 15, 10, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 266 ; HP
	bigdw 266 ; Max HP
	bigdw 180 ; Atk
	bigdw 180 ; Def
	bigdw 110 ; Spd
	bigdw 152 ; SAtk
	bigdw 152 ; SDef
	db "NUO-@@@@@@@"


	db URSARING
	db SCOPE_LENS
	db SLASH, EARTHQUAKE, HYPER_BEAM, THUNDERPUNCH
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 45000
	bigdw 50000
	db $fd, $ed ; DVs
	db 20, 10, 5, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 262 ; HP
	bigdw 262 ; Max HP
	bigdw 245 ; Atk
	bigdw 166 ; Def
	bigdw 138 ; Spd
	bigdw 166 ; SAtk
	bigdw 166 ; SDef
	db "RINGUMA@@@@"


	db MR__MIME
	db KINGS_ROCK
	db REFLECT, FIRE_PUNCH, PSYCHIC_M, ENCORE
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 45000
	bigdw 45000
	bigdw 50000
	bigdw 50000
	db $bd, $fb ; DVs
	db 20, 15, 10, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 195 ; HP
	bigdw 195 ; Max HP
	bigdw 120 ; Atk
	bigdw 151 ; Def
	bigdw 190 ; Spd
	bigdw 198 ; SAtk
	bigdw 226 ; SDef
	db "BARIYA-DO@@"


	db PRIMEAPE
	db QUICK_CLAW
	db CROSS_CHOP, ICE_PUNCH, THUNDERPUNCH, ROCK_SLIDE
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 40000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	db $bd, $ef ; DVs
	db 5, 15, 15, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 227 ; HP
	bigdw 227 ; Max HP
	bigdw 202 ; Atk
	bigdw 145 ; Def
	bigdw 196 ; Spd
	bigdw 148 ; SAtk
	bigdw 162 ; SDef
	db "OKORIZARU@@"


	db GIRAFARIG
	db GOLD_BERRY
	db AGILITY, BATON_PASS, CRUNCH, EARTHQUAKE
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	db $fe, $fd ; DVs
	db 30, 40, 15, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 231 ; HP
	bigdw 231 ; Max HP
	bigdw 176 ; Atk
	bigdw 154 ; Def
	bigdw 183 ; Spd
	bigdw 187 ; SAtk
	bigdw 152 ; SDef
	db "KIRINRIKI@@"


	db HITMONLEE
	db FOCUS_BAND
	db REVERSAL, ENDURE, BODY_SLAM, MEGA_KICK
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	db $fe, $fe ; DVs
	db 15, 10, 15, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 202 ; HP
	bigdw 202 ; Max HP
	bigdw 232 ; Atk
	bigdw 137 ; Def
	bigdw 186 ; Spd
	bigdw 112 ; SAtk
	bigdw 217 ; SDef
	db "SAWAMURA-@@"


	db HERACROSS
	db BRIGHTPOWDER
	db REVERSAL, ENDURE, MEGAHORN, EARTHQUAKE
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	db $f7, $f7 ; DVs
	db 15, 10, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 251 ; HP
	bigdw 251 ; Max HP
	bigdw 239 ; Atk
	bigdw 158 ; Def
	bigdw 183 ; Spd
	bigdw 109 ; SAtk
	bigdw 186 ; SDef
	db "HERAKUROSU@"


	db VENUSAUR
	db BRIGHTPOWDER
	db SUNNY_DAY, SOLARBEAM, SYNTHESIS, HYPER_BEAM
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	db $76, $44 ; DVs
	db 5, 10, 5, 5 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 233 ; HP
	bigdw 233 ; Max HP
	bigdw 159 ; Atk
	bigdw 159 ; Def
	bigdw 152 ; Spd
	bigdw 180 ; SAtk
	bigdw 180 ; SDef
	db "HUSIGIBANA@"


	db CHARIZARD
	db SCOPE_LENS
	db SLASH, EARTHQUAKE, HYPER_BEAM, FLAMETHROWER
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	db $56, $44 ; DVs
	db 20, 10, 5, 15 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 230 ; HP
	bigdw 230 ; Max HP
	bigdw 159 ; Atk
	bigdw 152 ; Def
	bigdw 180 ; Spd
	bigdw 193 ; SAtk
	bigdw 159 ; SDef
	db "RIZA-DON@@@"


	db BLASTOISE
	db QUICK_CLAW
	db HYDRO_PUMP, ICE_PUNCH, HYPER_BEAM, IRON_TAIL
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	db $76, $64 ; DVs
	db 5, 15, 5, 15 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 231 ; HP
	bigdw 231 ; Max HP
	bigdw 161 ; Atk
	bigdw 183 ; Def
	bigdw 152 ; Spd
	bigdw 159 ; SAtk
	bigdw 187 ; SDef
	db "KAMEtuKUSU@"




BattleTowerMons8:

	db JOLTEON
	db MIRACLEBERRY
	db THUNDER_WAVE, THUNDERBOLT, IRON_TAIL, ROAR
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 55000
	bigdw 60000
	bigdw 55000
	bigdw 55000
	db $fd, $eb ; DVs
	db 20, 15, 15, 20 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 263 ; HP
	bigdw 263 ; Max HP
	bigdw 179 ; Atk
	bigdw 170 ; Def
	bigdw 281 ; Spd
	bigdw 245 ; SAtk
	bigdw 221 ; SDef
	db "SANDA-SU@@@"


	db SNORLAX
	db LEFTOVERS
	db REST, BELLY_DRUM, SNORE, EARTHQUAKE
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 55000
	bigdw 50000
	bigdw 55500
	bigdw 60000
	db $db, $ed ; DVs
	db 10, 10, 15, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 415 ; HP
	bigdw 415 ; Max HP
	bigdw 248 ; Atk
	bigdw 170 ; Def
	bigdw 121 ; Spd
	bigdw 178 ; SAtk
	bigdw 250 ; SDef
	db "KABIGON@@@@"


	db HOUNDOOM
	db MINT_BERRY
	db REST, CRUNCH, FLAMETHROWER, SUNNY_DAY
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 55000
	bigdw 50000
	bigdw 55000
	bigdw 55000
	bigdw 55000
	db $fd, $db ; DVs
	db 10, 15, 15, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 280 ; HP
	bigdw 280 ; Max HP
	bigdw 217 ; Atk
	bigdw 152 ; Def
	bigdw 224 ; Spd
	bigdw 245 ; SAtk
	bigdw 197 ; SDef
	db "HERUGA-@@@@"


	db TAUROS
	db GOLD_BERRY
	db EARTHQUAKE, BODY_SLAM, IRON_TAIL, HYPER_BEAM
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 30000
	bigdw 50000
	db $fd, $de ; DVs
	db 10, 15, 15, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 276 ; HP
	bigdw 276 ; Max HP
	bigdw 233 ; Atk
	bigdw 221 ; Def
	bigdw 236 ; Spd
	bigdw 135 ; SAtk
	bigdw 183 ; SDef
	db "KENTAROSU@@"


	db LAPRAS
	db MINT_BERRY
	db REST, SURF, CONFUSE_RAY, PSYCHIC_M
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 55000
	bigdw 50000
	db $df, $db ; DVs
	db 10, 15, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 366 ; HP
	bigdw 366 ; Max HP
	bigdw 205 ; Atk
	bigdw 201 ; Def
	bigdw 168 ; Spd
	bigdw 202 ; SAtk
	bigdw 218 ; SDef
	db "RAPURASU@@@"


	db TYRANITAR
	db MIRACLEBERRY
	db REST, CRUNCH, EARTHQUAKE, ROCK_SLIDE
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 55000
	bigdw 50000
	bigdw 55000
	bigdw 50000
	db $df, $db ; DVs
	db 10, 15, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 318 ; HP
	bigdw 318 ; Max HP
	bigdw 286 ; Atk
	bigdw 249 ; Def
	bigdw 169 ; Spd
	bigdw 218 ; SAtk
	bigdw 226 ; SDef
	db "BANGIRASU@@"


	db GENGAR
	db NO_ITEM
	db THUNDERBOLT, SHADOW_BALL, CONFUSE_RAY, THIEF
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 45000
	bigdw 55000
	bigdw 50000
	db $de, $dd ; DVs
	db 15, 15, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 247 ; HP
	bigdw 247 ; Max HP
	bigdw 173 ; Atk
	bigdw 165 ; Def
	bigdw 248 ; Spd
	bigdw 277 ; SAtk
	bigdw 189 ; SDef
	db "GENGA-@@@@@"


	db FORRETRESS
	db LEFTOVERS
	db EXPLOSION, TOXIC, SOLARBEAM, SWAGGER
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 50000
	bigdw 45000
	bigdw 50000
	db $fd, $ed ; DVs
	db 5, 10, 10, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 273 ; HP
	bigdw 273 ; Max HP
	bigdw 217 ; Atk
	bigdw 293 ; Def
	bigdw 133 ; Spd
	bigdw 165 ; SAtk
	bigdw 165 ; SDef
	db "HUoRETOSU@@"


	db KINGDRA
	db MINT_BERRY
	db REST, SURF, BLIZZARD, DRAGONBREATH
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 40000
	bigdw 55000
	bigdw 50000
	db $fb, $ed ; DVs
	db 10, 15, 5, 20 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 273 ; HP
	bigdw 273 ; Max HP
	bigdw 225 ; Atk
	bigdw 214 ; Def
	bigdw 209 ; Spd
	bigdw 221 ; SAtk
	bigdw 221 ; SDef
	db "KINGUDORA@@"


	db DRAGONITE
	db GOLD_BERRY
	db THUNDER_WAVE, SURF, THUNDERBOLT, OUTRAGE
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 45000
	db $dd, $dd ; DVs
	db 20, 15, 15, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 284 ; Atk
	bigdw 221 ; Def
	bigdw 197 ; Spd
	bigdw 228 ; SAtk
	bigdw 228 ; SDef
	db "KAIRIyu-@@@"


	db PORYGON2
	db LEFTOVERS
	db PSYCHIC_M, RECOVER, HYPER_BEAM, TRI_ATTACK
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 55000
	bigdw 50000
	bigdw 40000
	bigdw 55000
	bigdw 50000
	db $df, $ed ; DVs
	db 10, 20, 5, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 293 ; HP
	bigdw 293 ; Max HP
	bigdw 197 ; Atk
	bigdw 213 ; Def
	bigdw 169 ; Spd
	bigdw 237 ; SAtk
	bigdw 221 ; SDef
	db "PORIGON2@@@"


	db JYNX
	db QUICK_CLAW
	db LOVELY_KISS, BLIZZARD, DREAM_EATER, PSYCHIC_M
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 55000
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 50000
	db $df, $df ; DVs
	db 10, 5, 15, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 264 ; HP
	bigdw 264 ; Max HP
	bigdw 149 ; Atk
	bigdw 127 ; Def
	bigdw 221 ; Spd
	bigdw 257 ; SAtk
	bigdw 225 ; SDef
	db "RU-ZIyuRA@@"


	db MANTINE
	db GOLD_BERRY
	db SURF, CONFUSE_RAY, BLIZZARD, WING_ATTACK
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 45000
	bigdw 40000
	bigdw 45000
	bigdw 50000
	db $df, $dc ; DVs
	db 15, 10, 5, 35 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 256 ; HP
	bigdw 256 ; Max HP
	bigdw 132 ; Atk
	bigdw 181 ; Def
	bigdw 180 ; Spd
	bigdw 196 ; SAtk
	bigdw 292 ; SDef
	db "MANTAIN@@@@"


	db SKARMORY
	db QUICK_CLAW
	db STEEL_WING, FLY, MUD_SLAP, TOXIC
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 45000
	bigdw 35000
	bigdw 50000
	bigdw 50000
	db $dd, $ef ; DVs
	db 25, 15, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 258 ; HP
	bigdw 258 ; Max HP
	bigdw 196 ; Atk
	bigdw 286 ; Def
	bigdw 183 ; Spd
	bigdw 137 ; SAtk
	bigdw 185 ; SDef
	db "EA-MUDO@@@@"


	db MOLTRES
	db CHARCOAL
	db FLAMETHROWER, SKY_ATTACK, STEEL_WING, HYPER_BEAM
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 40000
	bigdw 50000
	bigdw 40000
	bigdw 50000
	db $dd, $fe ; DVs
	db 15, 5, 25, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 300 ; HP
	bigdw 300 ; Max HP
	bigdw 225 ; Atk
	bigdw 213 ; Def
	bigdw 213 ; Spd
	bigdw 271 ; SAtk
	bigdw 207 ; SDef
	db "HUaIYA-@@@@"


	db AERODACTYL
	db MIRACLEBERRY
	db HYPER_BEAM, REST, EARTHQUAKE, ROAR
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 40000
	bigdw 50000
	bigdw 40000
	bigdw 50000
	db $ff, $ed ; DVs
	db 5, 10, 10, 20 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 282 ; HP
	bigdw 282 ; Max HP
	bigdw 237 ; Atk
	bigdw 177 ; Def
	bigdw 275 ; Spd
	bigdw 165 ; SAtk
	bigdw 189 ; SDef
	db "PUTERA@@@@@"


	db ELECTRODE
	db KINGS_ROCK
	db THUNDERBOLT, EXPLOSION, MIRROR_COAT, TOXIC
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 40000
	bigdw 40000
	bigdw 50000
	db $ff, $ef ; DVs
	db 15, 5, 20, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 250 ; HP
	bigdw 250 ; Max HP
	bigdw 153 ; Atk
	bigdw 181 ; Def
	bigdw 291 ; Spd
	bigdw 201 ; SAtk
	bigdw 201 ; SDef
	db "MARUMAIN@@@"


	db DUGTRIO
	db SCOPE_LENS
	db SLASH, EARTHQUAKE, THIEF, MUD_SLAP
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 40000
	bigdw 50000
	bigdw 40000
	db $fd, $dd ; DVs
	db 20, 10, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 214 ; HP
	bigdw 214 ; Max HP
	bigdw 201 ; Atk
	bigdw 145 ; Def
	bigdw 261 ; Spd
	bigdw 145 ; SAtk
	bigdw 177 ; SDef
	db "DAGUTORIO@@"


	db VICTREEBEL
	db QUICK_CLAW
	db GIGA_DRAIN, SLUDGE_BOMB, HYPER_BEAM, TOXIC
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	db $65, $65 ; DVs
	db 5, 10, 5, 10 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 260 ; HP
	bigdw 260 ; Max HP
	bigdw 217 ; Atk
	bigdw 151 ; Def
	bigdw 161 ; Spd
	bigdw 207 ; SAtk
	bigdw 143 ; SDef
	db "UTUBOtuTO@@"


	db PINSIR
	db GOLD_BERRY
	db HYPER_BEAM, SUBMISSION, STRENGTH, TOXIC
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	db $74, $64 ; DVs
	db 5, 25, 15, 10 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 241 ; HP
	bigdw 241 ; Max HP
	bigdw 250 ; Atk
	bigdw 205 ; Def
	bigdw 185 ; Spd
	bigdw 133 ; SAtk
	bigdw 157 ; SDef
	db "KAIROSU@@@@"


	db GRANBULL
	db BRIGHTPOWDER
	db ROAR, SHADOW_BALL, HYPER_BEAM, THUNDERPUNCH
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	db $76, $57 ; DVs
	db 20, 15, 5, 15 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 286 ; HP
	bigdw 286 ; Max HP
	bigdw 242 ; Atk
	bigdw 169 ; Def
	bigdw 119 ; Spd
	bigdw 146 ; SAtk
	bigdw 146 ; SDef
	db "GURANBURU@@"




BattleTowerMons9:

	db UMBREON
	db KINGS_ROCK
	db FAINT_ATTACK, MUD_SLAP, MOONLIGHT, CONFUSE_RAY
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 55000
	bigdw 60000
	bigdw 55000
	db $fd, $ed ; DVs
	db 20, 10, 5, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 349 ; HP
	bigdw 349 ; Max HP
	bigdw 203 ; Atk
	bigdw 278 ; Def
	bigdw 202 ; Spd
	bigdw 188 ; SAtk
	bigdw 314 ; SDef
	db "BURAtuKI-@@"


	db DRAGONITE
	db QUICK_CLAW
	db FIRE_BLAST, HYPER_BEAM, OUTRAGE, BLIZZARD
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 65000
	bigdw 50000
	bigdw 56000
	bigdw 60000
	bigdw 60000
	db $fd, $ed ; DVs
	db 5, 5, 15, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 343 ; HP
	bigdw 343 ; Max HP
	bigdw 322 ; Atk
	bigdw 252 ; Def
	bigdw 229 ; Spd
	bigdw 263 ; SAtk
	bigdw 263 ; SDef
	db "KAIRIyu-@@@"


	db STARMIE
	db LEFTOVERS
	db RECOVER, THUNDERBOLT, SURF, PSYCHIC_M
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 55000
	bigdw 60000
	db $df, $dd ; DVs
	db 20, 15, 15, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 289 ; HP
	bigdw 289 ; Max HP
	bigdw 218 ; Atk
	bigdw 239 ; Def
	bigdw 287 ; Spd
	bigdw 263 ; SAtk
	bigdw 236 ; SDef
	db "SUTA-MI-@@@"


	db CLOYSTER
	db LEFTOVERS
	db EXPLOSION, BLIZZARD, SURF, ICY_WIND
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	db $db, $df ; DVs
	db 5, 5, 15, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 266 ; HP
	bigdw 266 ; Max HP
	bigdw 248 ; Atk
	bigdw 398 ; Def
	bigdw 203 ; Spd
	bigdw 234 ; SAtk
	bigdw 162 ; SDef
	db "PARUSIeN@@@"


	db CROBAT
	db GOLD_BERRY
	db WING_ATTACK, HAZE, HYPER_BEAM, GIGA_DRAIN
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	db $fd, $cf ; DVs
	db 35, 30, 5, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 325 ; HP
	bigdw 325 ; Max HP
	bigdw 243 ; Atk
	bigdw 221 ; Def
	bigdw 310 ; Spd
	bigdw 207 ; SAtk
	bigdw 225 ; SDef
	db "KUROBAtuTO@"


	db PORYGON2
	db QUICK_CLAW
	db TOXIC, PSYCHIC_M, RECOVER, PROTECT
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 55000
	bigdw 50000
	db $fd, $ed ; DVs
	db 10, 10, 20, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 325 ; HP
	bigdw 325 ; Max HP
	bigdw 223 ; Atk
	bigdw 239 ; Def
	bigdw 190 ; Spd
	bigdw 266 ; SAtk
	bigdw 248 ; SDef
	db "PORIGON2@@@"


	db KINGDRA
	db LEFTOVERS
	db DRAGONBREATH, SURF, HYPER_BEAM, BLIZZARD
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 55000
	bigdw 50000
	bigdw 45000
	db $df, $de ; DVs
	db 20, 15, 5, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 309 ; HP
	bigdw 309 ; Max HP
	bigdw 248 ; Atk
	bigdw 255 ; Def
	bigdw 230 ; Spd
	bigdw 248 ; SAtk
	bigdw 248 ; SDef
	db "KINGUDORA@@"


	db TYRANITAR
	db QUICK_CLAW
	db HYPER_BEAM, CRUNCH, EARTHQUAKE, ROCK_SLIDE
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 55000
	bigdw 50000
	bigdw 45000
	bigdw 50000
	db $df, $de ; DVs
	db 5, 15, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 354 ; HP
	bigdw 354 ; Max HP
	bigdw 321 ; Atk
	bigdw 279 ; Def
	bigdw 185 ; Spd
	bigdw 250 ; SAtk
	bigdw 259 ; SDef
	db "BANGIRASU@@"


	db LAPRAS
	db MINT_BERRY
	db REST, SURF, THUNDERBOLT, PSYCHIC_M
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 55000
	db $bd, $ef ; DVs
	db 10, 15, 15, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 405 ; HP
	bigdw 405 ; Max HP
	bigdw 227 ; Atk
	bigdw 221 ; Def
	bigdw 187 ; Spd
	bigdw 237 ; SAtk
	bigdw 255 ; SDef
	db "RAPURASU@@@"


	db ESPEON
	db GOLD_BERRY
	db PSYCHIC_M, SHADOW_BALL, SUNNY_DAY, MORNING_SUN
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 55000
	bigdw 50000
	bigdw 50000
	bigdw 55000
	bigdw 50000
	db $dd, $fe ; DVs
	db 10, 15, 5, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 294 ; HP
	bigdw 294 ; Max HP
	bigdw 194 ; Atk
	bigdw 185 ; Def
	bigdw 282 ; Spd
	bigdw 313 ; SAtk
	bigdw 250 ; SDef
	db "E-HUi@@@@@@"


	db MACHAMP
	db QUICK_CLAW
	db CROSS_CHOP, VITAL_THROW, FIRE_BLAST, EARTHQUAKE
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 55000
	bigdw 55000
	bigdw 50000
	bigdw 55000
	bigdw 50000
	db $dd, $ed ; DVs
	db 5, 10, 5, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 337 ; HP
	bigdw 337 ; Max HP
	bigdw 314 ; Atk
	bigdw 221 ; Def
	bigdw 181 ; Spd
	bigdw 194 ; SAtk
	bigdw 230 ; SDef
	db "KAIRIKI-@@@"


	db SNORLAX
	db MIRACLEBERRY
	db FIRE_BLAST, SURF, EARTHQUAKE, HYPER_BEAM
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 55000
	bigdw 50000
	bigdw 50000
	db $fe, $fd ; DVs
	db 5, 15, 10, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 455 ; HP
	bigdw 455 ; Max HP
	bigdw 279 ; Atk
	bigdw 199 ; Def
	bigdw 135 ; Spd
	bigdw 194 ; SAtk
	bigdw 275 ; SDef
	db "KABIGON@@@@"


	db ARCANINE
	db MINT_BERRY
	db SUNNY_DAY, FLAMETHROWER, EXTREMESPEED, REST
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 45000
	bigdw 55000
	db $df, $de ; DVs
	db 5, 15, 5, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 336 ; HP
	bigdw 336 ; Max HP
	bigdw 274 ; Atk
	bigdw 225 ; Def
	bigdw 247 ; Spd
	bigdw 262 ; SAtk
	bigdw 226 ; SDef
	db "UINDEi@@@@@"


	db BLISSEY
	db LEFTOVERS
	db SOLARBEAM, SUNNY_DAY, SOFTBOILED, FIRE_BLAST
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 45000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	db $bd, $fe ; DVs
	db 10, 5, 10, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 633 ; HP
	bigdw 633 ; Max HP
	bigdw 90 ; Atk
	bigdw 95 ; Def
	bigdw 180 ; Spd
	bigdw 214 ; SAtk
	bigdw 322 ; SDef
	db "HAPINASU@@@"


	db HOUNDOOM
	db BRIGHTPOWDER
	db FLAMETHROWER, CRUNCH, SUNNY_DAY, SOLARBEAM
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 40000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	db $db, $fe ; DVs
	db 15, 15, 5, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 309 ; HP
	bigdw 309 ; Max HP
	bigdw 235 ; Atk
	bigdw 164 ; Def
	bigdw 252 ; Spd
	bigdw 277 ; SAtk
	bigdw 223 ; SDef
	db "HERUGA-@@@@"


	db SKARMORY
	db QUICK_CLAW
	db SANDSTORM, STEEL_WING, TOXIC, RETURN
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	db $ef, $f7 ; DVs
	db 10, 25, 10, 20 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 279 ; HP
	bigdw 279 ; Max HP
	bigdw 223 ; Atk
	bigdw 333 ; Def
	bigdw 207 ; Spd
	bigdw 139 ; SAtk
	bigdw 193 ; SDef
	db "EA-MUDO@@@@"


	db SHUCKLE
	db LEFTOVERS
	db TOXIC, WRAP, PROTECT, ENCORE
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	db $fe, $fe ; DVs
	db 10, 20, 10, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 203 ; HP
	bigdw 203 ; Max HP
	bigdw 99 ; Atk
	bigdw 493 ; Def
	bigdw 90 ; Spd
	bigdw 97 ; SAtk
	bigdw 493 ; SDef
	db "TUBOTUBO@@@"


	db FLAREON
	db MINT_BERRY
	db HYPER_BEAM, FLAMETHROWER, SHADOW_BALL, ROAR
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	db $f7, $f7 ; DVs
	db 5, 15, 15, 20 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 293 ; HP
	bigdw 293 ; Max HP
	bigdw 315 ; Atk
	bigdw 175 ; Def
	bigdw 198 ; Spd
	bigdw 238 ; SAtk
	bigdw 265 ; SDef
	db "BU-SUTA-@@@"


	db MILTANK
	db LEFTOVERS
	db MILK_DRINK, EARTHQUAKE, ATTRACT, BODY_SLAM
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	db $47, $57 ; DVs
	db 10, 10, 15, 15 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 322 ; HP
	bigdw 322 ; Max HP
	bigdw 194 ; Atk
	bigdw 245 ; Def
	bigdw 232 ; Spd
	bigdw 128 ; SAtk
	bigdw 182 ; SDef
	db "MIRUTANKU@@"


	db TAUROS
	db PINK_BOW
	db THUNDERBOLT, HYPER_BEAM, ATTRACT, EARTHQUAKE
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	db $65, $76 ; DVs
	db 15, 5, 15, 10 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 284 ; HP
	bigdw 284 ; Max HP
	bigdw 234 ; Atk
	bigdw 223 ; Def
	bigdw 254 ; Spd
	bigdw 126 ; SAtk
	bigdw 180 ; SDef
	db "KENTAROSU@@"


	db MUK
	db QUICK_CLAW
	db TOXIC, SLUDGE_BOMB, ATTRACT, GIGA_DRAIN
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	db $54, $44 ; DVs
	db 10, 10, 15, 5 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 342 ; HP
	bigdw 342 ; Max HP
	bigdw 241 ; Atk
	bigdw 185 ; Def
	bigdw 140 ; Spd
	bigdw 167 ; SAtk
	bigdw 230 ; SDef
	db "BETOBETON@@"




BattleTowerMons10:

	db HOUNDOOM
	db MINT_BERRY
	db CRUNCH, FLAMETHROWER, ROAR, REST
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	db $fd, $ed ; DVs
	db 15, 15, 20, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 347 ; HP
	bigdw 347 ; Max HP
	bigdw 276 ; Atk
	bigdw 192 ; Def
	bigdw 284 ; Spd
	bigdw 312 ; SAtk
	bigdw 252 ; SDef
	db "HERUGA-@@@@"


	db MACHAMP
	db QUICK_CLAW
	db CROSS_CHOP, EARTHQUAKE, HYPER_BEAM, VITAL_THROW
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	db $fd, $ef ; DVs
	db 5, 10, 5, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 377 ; HP
	bigdw 377 ; Max HP
	bigdw 356 ; Atk
	bigdw 252 ; Def
	bigdw 204 ; Spd
	bigdw 226 ; SAtk
	bigdw 266 ; SDef
	db "KAIRIKI-@@@"


	db KINGDRA
	db LEFTOVERS
	db SURF, DRAGONBREATH, REST, TOXIC
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	db $df, $fe ; DVs
	db 15, 20, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 349 ; HP
	bigdw 349 ; Max HP
	bigdw 282 ; Atk
	bigdw 286 ; Def
	bigdw 266 ; Spd
	bigdw 284 ; SAtk
	bigdw 284 ; SDef
	db "KINGUDORA@@"


	db JOLTEON
	db BRIGHTPOWDER
	db THUNDERBOLT, ROAR, THUNDER_WAVE, IRON_TAIL
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 30000
	bigdw 50000
	db $fd, $fe ; DVs
	db 15, 20, 20, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 323 ; HP
	bigdw 323 ; Max HP
	bigdw 220 ; Atk
	bigdw 206 ; Def
	bigdw 338 ; Spd
	bigdw 308 ; SAtk
	bigdw 278 ; SDef
	db "SANDA-SU@@@"


	db TAUROS
	db KINGS_ROCK
	db HYPER_BEAM, EARTHQUAKE, IRON_TAIL, THUNDERBOLT
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	db $fd, $ef ; DVs
	db 5, 10, 15, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 341 ; HP
	bigdw 341 ; Max HP
	bigdw 290 ; Atk
	bigdw 276 ; Def
	bigdw 308 ; Spd
	bigdw 170 ; SAtk
	bigdw 230 ; SDef
	db "KENTAROSU@@"


	db ARCANINE
	db LEFTOVERS
	db FLAMETHROWER, EXTREMESPEED, IRON_TAIL, HYPER_BEAM
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 55000
	bigdw 50000
	bigdw 50000
	bigdw 55000
	bigdw 50000
	db $dd, $ef ; DVs
	db 15, 5, 15, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 374 ; HP
	bigdw 374 ; Max HP
	bigdw 306 ; Atk
	bigdw 246 ; Def
	bigdw 281 ; Spd
	bigdw 290 ; SAtk
	bigdw 250 ; SDef
	db "UINDEi@@@@@"


	db CHARIZARD
	db SCOPE_LENS
	db FLAMETHROWER, EARTHQUAKE, SLASH, FLY
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 55000
	bigdw 55000
	bigdw 55000
	db $fe, $df ; DVs
	db 15, 10, 20, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 343 ; HP
	bigdw 343 ; Max HP
	bigdw 258 ; Atk
	bigdw 247 ; Def
	bigdw 289 ; Spd
	bigdw 311 ; SAtk
	bigdw 263 ; SDef
	db "RIZA-DON@@@"


	db ELECTRODE
	db BRIGHTPOWDER
	db THUNDER_WAVE, THUNDERBOLT, EXPLOSION, MIRROR_COAT
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 50000
	bigdw 45000
	bigdw 45000
	db $fb, $ef ; DVs
	db 20, 15, 5, 20 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 309 ; HP
	bigdw 309 ; Max HP
	bigdw 190 ; Atk
	bigdw 222 ; Def
	bigdw 366 ; Spd
	bigdw 248 ; SAtk
	bigdw 248 ; SDef
	db "MARUMAIN@@@"


	db RHYDON
	db MIRACLEBERRY
	db SURF, EARTHQUAKE, HYPER_BEAM, ROCK_SLIDE
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 55000
	bigdw 50000
	bigdw 55000
	bigdw 50000
	bigdw 45000
	db $fd, $ef ; DVs
	db 15, 10, 5, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 404 ; HP
	bigdw 404 ; Max HP
	bigdw 350 ; Atk
	bigdw 329 ; Def
	bigdw 168 ; Spd
	bigdw 178 ; SAtk
	bigdw 178 ; SDef
	db "SAIDON@@@@@"


	db STEELIX
	db LEFTOVERS
	db EARTHQUAKE, HYPER_BEAM, SWAGGER, CRUNCH
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 55000
	bigdw 60000
	bigdw 50000
	db $fd, $de ; DVs
	db 10, 5, 15, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 343 ; HP
	bigdw 343 ; Max HP
	bigdw 260 ; Atk
	bigdw 489 ; Def
	bigdw 152 ; Spd
	bigdw 198 ; SAtk
	bigdw 218 ; SDef
	db "HAGANE-RU@@"


	db FEAROW
	db KINGS_ROCK
	db DRILL_PECK, STEEL_WING, HYPER_BEAM, MUD_SLAP
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 55000
	bigdw 50000
	bigdw 50000
	bigdw 55000
	bigdw 50000
	db $fd, $cf ; DVs
	db 20, 25, 5, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 324 ; HP
	bigdw 324 ; Max HP
	bigdw 270 ; Atk
	bigdw 216 ; Def
	bigdw 287 ; Spd
	bigdw 212 ; SAtk
	bigdw 212 ; SDef
	db "ONIDORIRU@@"


	db MISDREAVUS
	db FOCUS_BAND
	db PERISH_SONG, MEAN_LOOK, PAIN_SPLIT, SHADOW_BALL
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 55000
	bigdw 50000
	bigdw 55000
	db $bd, $ef ; DVs
	db 5, 5, 20, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 309 ; HP
	bigdw 309 ; Max HP
	bigdw 202 ; Atk
	bigdw 209 ; Def
	bigdw 258 ; Spd
	bigdw 263 ; SAtk
	bigdw 263 ; SDef
	db "MUUMA@@@@@@"


	db SNEASEL
	db SCOPE_LENS
	db SLASH, BLIZZARD, DREAM_EATER, FAINT_ATTACK
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 48000
	bigdw 45000
	bigdw 50000
	db $fd, $ef ; DVs
	db 20, 5, 15, 20 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 301 ; HP
	bigdw 301 ; Max HP
	bigdw 280 ; Atk
	bigdw 195 ; Def
	bigdw 316 ; Spd
	bigdw 160 ; SAtk
	bigdw 240 ; SDef
	db "NIyu-RA@@@@"


	db SCIZOR
	db QUICK_CLAW
	db STEEL_WING, HYPER_BEAM, SLASH, TOXIC
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 45000
	db $fb, $fe ; DVs
	db 25, 5, 20, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 333 ; HP
	bigdw 333 ; Max HP
	bigdw 350 ; Atk
	bigdw 282 ; Def
	bigdw 220 ; Spd
	bigdw 196 ; SAtk
	bigdw 246 ; SDef
	db "HAtuSAMU@@@"


	db BLISSEY
	db LEFTOVERS
	db THUNDERBOLT, BLIZZARD, FIRE_BLAST, SOFTBOILED
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 40000
	bigdw 50000
	bigdw 30000
	bigdw 30000
	db $dd, $fe ; DVs
	db 15, 5, 5, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 703 ; HP
	bigdw 703 ; Max HP
	bigdw 101 ; Atk
	bigdw 106 ; Def
	bigdw 188 ; Spd
	bigdw 226 ; SAtk
	bigdw 346 ; SDef
	db "HAPINASU@@@"


	db PILOSWINE
	db MINT_BERRY
	db REST, BLIZZARD, HYPER_BEAM, EARTHQUAKE
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	db $fe, $f7 ; DVs
	db 10, 5, 5, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 387 ; HP
	bigdw 387 ; Max HP
	bigdw 290 ; Atk
	bigdw 248 ; Def
	bigdw 190 ; Spd
	bigdw 194 ; SAtk
	bigdw 194 ; SDef
	db "INOMU-@@@@@"


	db EXEGGUTOR
	db QUICK_CLAW
	db PSYCHIC_M, TOXIC, EXPLOSION, GIGA_DRAIN
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	db $fe, $fe ; DVs
	db 10, 10, 5, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 375 ; HP
	bigdw 375 ; Max HP
	bigdw 280 ; Atk
	bigdw 258 ; Def
	bigdw 200 ; Spd
	bigdw 338 ; SAtk
	bigdw 218 ; SDef
	db "NAtuSI-@@@@"


	db OMASTAR
	db LEFTOVERS
	db SURF, ANCIENTPOWER, BLIZZARD, TOXIC
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	db $fb, $e7 ; DVs
	db 15, 5, 5, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 331 ; HP
	bigdw 331 ; Max HP
	bigdw 210 ; Atk
	bigdw 332 ; Def
	bigdw 198 ; Spd
	bigdw 304 ; SAtk
	bigdw 214 ; SDef
	db "OMUSUTA-@@@"


	db GOLEM
	db BRIGHTPOWDER
	db EXPLOSION, EARTHQUAKE, ROCK_SLIDE, FIRE_BLAST
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	db $74, $46 ; DVs
	db 5, 10, 10, 5 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 329 ; HP
	bigdw 329 ; Max HP
	bigdw 282 ; Atk
	bigdw 316 ; Def
	bigdw 146 ; Spd
	bigdw 170 ; SAtk
	bigdw 190 ; SDef
	db "GORO-NIya@@"


	db HITMONCHAN
	db FOCUS_BAND
	db COUNTER, FIRE_PUNCH, THUNDERPUNCH, ICE_PUNCH
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	db $67, $76 ; DVs
	db 20, 15, 15, 15 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 265 ; HP
	bigdw 265 ; Max HP
	bigdw 270 ; Atk
	bigdw 220 ; Def
	bigdw 214 ; Spd
	bigdw 130 ; SAtk
	bigdw 280 ; SDef
	db "EBIWARA-@@@"


	db LANTURN
	db QUICK_CLAW
	db SURF, RAIN_DANCE, ZAP_CANNON, CONFUSE_RAY
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	db $76, $57 ; DVs
	db 15, 5, 5, 10 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 425 ; HP
	bigdw 425 ; Max HP
	bigdw 178 ; Atk
	bigdw 176 ; Def
	bigdw 192 ; Spd
	bigdw 214 ; SAtk
	bigdw 214 ; SDef
	db "RANTA-N@@@@"
