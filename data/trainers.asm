
; All trainers follow a basic structure:
	; Name
		; String in format "TEXT@"
	; Data type
		; 0: Level, species
		; 1: Level, species, moves
		; 2: Level, sepcies, item
		; 3: Level, species, item, moves
	; Party
		; Up to six monsters following the data type
	; $ff


FalknerGroup: ; 0x39a1f
	; FALKNER (1) at 0x39a1f
	db "FALKNER@"
	db $01 ; data type
	db 7, PIDGEY, TACKLE, MUD_SLAP, 0, 0
	db 9, PIDGEOTTO, TACKLE, MUD_SLAP, GUST, 0
	db $ff ; end trainer party mons
	; last_address=0x39a35 size=22
; 0x39a35

WhitneyGroup: ; 0x39a35
	; WHITNEY (1) at 0x39a35
	db "WHITNEY@"
	db $01 ; data type
	db 18, CLEFAIRY, DOUBLESLAP, MIMIC, ENCORE, METRONOME
	db 20, MILTANK, ROLLOUT, ATTRACT, STOMP, MILK_DRINK
	db $ff ; end trainer party mons
	; last_address=0x39a4b size=22
; 0x39a4b

BugsyGroup: ; 0x39a4b
	; BUGSY (1) at 0x39a4b
	db "BUGSY@"
	db $01 ; data type
	db 14, METAPOD, TACKLE, STRING_SHOT, HARDEN, 0
	db 14, KAKUNA, POISON_STING, STRING_SHOT, HARDEN, 0
	db 16, SCYTHER, QUICK_ATTACK, LEER, FURY_CUTTER, 0
	db $ff ; end trainer party mons
	; last_address=0x39a65 size=26
; 0x39a65

MortyGroup: ; 0x39a65
	; MORTY (1) at 0x39a65
	db "MORTY@"
	db $01 ; data type
	db 21, GASTLY, LICK, SPITE, MEAN_LOOK, CURSE
	db 21, HAUNTER, HYPNOSIS, MIMIC, CURSE, NIGHT_SHADE
	db 25, GENGAR, HYPNOSIS, SHADOW_BALL, MEAN_LOOK, DREAM_EATER
	db 23, HAUNTER, SPITE, MEAN_LOOK, MIMIC, NIGHT_SHADE
	db $ff ; end trainer party mons
	; last_address=0x39a85 size=32
; 0x39a85

PryceGroup: ; 0x39a85
	; PRYCE (1) at 0x39a85
	db "PRYCE@"
	db $01 ; data type
	db 27, SEEL, HEADBUTT, ICY_WIND, AURORA_BEAM, REST
	db 29, DEWGONG, HEADBUTT, ICY_WIND, AURORA_BEAM, REST
	db 31, PILOSWINE, ICY_WIND, FURY_ATTACK, MIST, BLIZZARD
	db $ff ; end trainer party mons
	; last_address=0x39a9f size=26
; 0x39a9f

JasmineGroup: ; 0x39a9f
	; JASMINE (1) at 0x39a9f
	db "JASMINE@"
	db $01 ; data type
	db 30, MAGNEMITE, THUNDERBOLT, SUPERSONIC, SONICBOOM, THUNDER_WAVE
	db 30, MAGNEMITE, THUNDERBOLT, SUPERSONIC, SONICBOOM, THUNDER_WAVE
	db 35, STEELIX, SCREECH, SUNNY_DAY, ROCK_THROW, IRON_TAIL
	db $ff ; end trainer party mons
	; last_address=0x39abb size=28
; 0x39abb

ChuckGroup: ; 0x39abb
	; CHUCK (1) at 0x39abb
	db "CHUCK@"
	db $01 ; data type
	db 27, PRIMEAPE, LEER, RAGE, KARATE_CHOP, FURY_SWIPES
	db 30, POLIWRATH, HYPNOSIS, MIND_READER, SURF, DYNAMICPUNCH
	db $ff ; end trainer party mons
	; last_address=0x39acf size=20
; 0x39acf

ClairGroup: ; 0x39acf
	; CLAIR (1) at 0x39acf
	db "CLAIR@"
	db $01 ; data type
	db 37, DRAGONAIR, THUNDER_WAVE, SURF, SLAM, DRAGONBREATH
	db 37, DRAGONAIR, THUNDER_WAVE, THUNDERBOLT, SLAM, DRAGONBREATH
	db 37, DRAGONAIR, THUNDER_WAVE, ICE_BEAM, SLAM, DRAGONBREATH
	db 40, KINGDRA, SMOKESCREEN, SURF, HYPER_BEAM, DRAGONBREATH
	db $ff ; end trainer party mons
	; last_address=0x39aef size=32
; 0x39aef

Rival1Group: ; 0x39aef
	; RIVAL1_1 (1) at 0x39aef
	db "?@"
	db $00 ; data type
	db 5, CHIKORITA
	db $ff ; end trainer party mons
	; last_address=0x39af5 size=6

	; RIVAL1_2 (2) at 0x39af5
	db "?@"
	db $00 ; data type
	db 5, CYNDAQUIL
	db $ff ; end trainer party mons
	; last_address=0x39afb size=6

	; RIVAL1_3 (3) at 0x39afb
	db "?@"
	db $00 ; data type
	db 5, TOTODILE
	db $ff ; end trainer party mons
	; last_address=0x39b01 size=6

	; RIVAL1_4 (4) at 0x39b01
	db "?@"
	db $00 ; data type
	db 12, GASTLY
	db 14, ZUBAT
	db 16, BAYLEEF
	db $ff ; end trainer party mons
	; last_address=0x39b0b size=10

	; RIVAL1_5 (5) at 0x39b0b
	db "?@"
	db $00 ; data type
	db 12, GASTLY
	db 14, ZUBAT
	db 16, QUILAVA
	db $ff ; end trainer party mons
	; last_address=0x39b15 size=10

	; RIVAL1_6 (6) at 0x39b15
	db "?@"
	db $00 ; data type
	db 12, GASTLY
	db 14, ZUBAT
	db 16, CROCONAW
	db $ff ; end trainer party mons
	; last_address=0x39b1f size=10

	; RIVAL1_7 (7) at 0x39b1f
	db "?@"
	db $01 ; data type
	db 20, HAUNTER, LICK, SPITE, MEAN_LOOK, CURSE
	db 18, MAGNEMITE, TACKLE, THUNDERSHOCK, SUPERSONIC, SONICBOOM
	db 20, ZUBAT, LEECH_LIFE, SUPERSONIC, BITE, CONFUSE_RAY
	db 22, BAYLEEF, GROWL, REFLECT, RAZOR_LEAF, POISONPOWDER
	db $ff ; end trainer party mons
	; last_address=0x39b3b size=28

	; RIVAL1_8 (8) at 0x39b3b
	db "?@"
	db $01 ; data type
	db 20, HAUNTER, LICK, SPITE, MEAN_LOOK, CURSE
	db 18, MAGNEMITE, TACKLE, THUNDERSHOCK, SUPERSONIC, SONICBOOM
	db 20, ZUBAT, LEECH_LIFE, SUPERSONIC, BITE, CONFUSE_RAY
	db 22, QUILAVA, LEER, SMOKESCREEN, EMBER, QUICK_ATTACK
	db $ff ; end trainer party mons
	; last_address=0x39b57 size=28

	; RIVAL1_9 (9) at 0x39b57
	db "?@"
	db $01 ; data type
	db 20, HAUNTER, LICK, SPITE, MEAN_LOOK, CURSE
	db 18, MAGNEMITE, TACKLE, THUNDERSHOCK, SUPERSONIC, SONICBOOM
	db 20, ZUBAT, LEECH_LIFE, SUPERSONIC, BITE, CONFUSE_RAY
	db 22, CROCONAW, LEER, RAGE, WATER_GUN, BITE
	db $ff ; end trainer party mons
	; last_address=0x39b73 size=28

	; RIVAL1_10 (10) at 0x39b73
	db "?@"
	db $01 ; data type
	db 30, GOLBAT, LEECH_LIFE, BITE, CONFUSE_RAY, WING_ATTACK
	db 28, MAGNEMITE, TACKLE, THUNDERSHOCK, SONICBOOM, THUNDER_WAVE
	db 30, HAUNTER, LICK, MEAN_LOOK, CURSE, SHADOW_BALL
	db 32, SNEASEL, LEER, QUICK_ATTACK, SCREECH, FAINT_ATTACK
	db 32, MEGANIUM, REFLECT, RAZOR_LEAF, POISONPOWDER, BODY_SLAM
	db $ff ; end trainer party mons
	; last_address=0x39b95 size=34

	; RIVAL1_11 (11) at 0x39b95
	db "?@"
	db $01 ; data type
	db 30, GOLBAT, LEECH_LIFE, BITE, CONFUSE_RAY, WING_ATTACK
	db 28, MAGNEMITE, TACKLE, THUNDERSHOCK, SONICBOOM, THUNDER_WAVE
	db 30, HAUNTER, LICK, MEAN_LOOK, CURSE, SHADOW_BALL
	db 32, SNEASEL, LEER, QUICK_ATTACK, SCREECH, FAINT_ATTACK
	db 32, QUILAVA, SMOKESCREEN, EMBER, QUICK_ATTACK, FLAME_WHEEL
	db $ff ; end trainer party mons
	; last_address=0x39bb7 size=34

	; RIVAL1_12 (12) at 0x39bb7
	db "?@"
	db $01 ; data type
	db 30, GOLBAT, LEECH_LIFE, BITE, CONFUSE_RAY, WING_ATTACK
	db 28, MAGNEMITE, TACKLE, THUNDERSHOCK, SONICBOOM, THUNDER_WAVE
	db 30, HAUNTER, LICK, MEAN_LOOK, CURSE, SHADOW_BALL
	db 32, SNEASEL, LEER, QUICK_ATTACK, SCREECH, FAINT_ATTACK
	db 32, FERALIGATR, RAGE, WATER_GUN, BITE, SCARY_FACE
	db $ff ; end trainer party mons
	; last_address=0x39bd9 size=34

	; RIVAL1_13 (13) at 0x39bd9
	db "?@"
	db $01 ; data type
	db 34, SNEASEL, QUICK_ATTACK, SCREECH, FAINT_ATTACK, FURY_CUTTER
	db 36, GOLBAT, LEECH_LIFE, BITE, CONFUSE_RAY, WING_ATTACK
	db 35, MAGNETON, THUNDERSHOCK, SONICBOOM, THUNDER_WAVE, SWIFT
	db 35, HAUNTER, MEAN_LOOK, CURSE, SHADOW_BALL, CONFUSE_RAY
	db 35, KADABRA, DISABLE, PSYBEAM, RECOVER, FUTURE_SIGHT
	db 38, MEGANIUM, REFLECT, RAZOR_LEAF, POISONPOWDER, BODY_SLAM
	db $ff ; end trainer party mons
	; last_address=0x39c01 size=40

	; RIVAL1_14 (14) at 0x39c01
	db "?@"
	db $01 ; data type
	db 34, SNEASEL, QUICK_ATTACK, SCREECH, FAINT_ATTACK, FURY_CUTTER
	db 36, GOLBAT, LEECH_LIFE, BITE, CONFUSE_RAY, WING_ATTACK
	db 35, MAGNETON, THUNDERSHOCK, SONICBOOM, THUNDER_WAVE, SWIFT
	db 35, HAUNTER, MEAN_LOOK, CURSE, SHADOW_BALL, CONFUSE_RAY
	db 35, KADABRA, DISABLE, PSYBEAM, RECOVER, FUTURE_SIGHT
	db 38, TYPHLOSION, SMOKESCREEN, EMBER, QUICK_ATTACK, FLAME_WHEEL
	db $ff ; end trainer party mons
	; last_address=0x39c29 size=40

	; RIVAL1_15 (15) at 0x39c29
	db "?@"
	db $01 ; data type
	db 34, SNEASEL, QUICK_ATTACK, SCREECH, FAINT_ATTACK, FURY_CUTTER
	db 36, GOLBAT, LEECH_LIFE, BITE, CONFUSE_RAY, WING_ATTACK
	db 34, MAGNETON, THUNDERSHOCK, SONICBOOM, THUNDER_WAVE, SWIFT
	db 35, HAUNTER, MEAN_LOOK, CURSE, SHADOW_BALL, CONFUSE_RAY
	db 35, KADABRA, DISABLE, PSYBEAM, RECOVER, FUTURE_SIGHT
	db 38, FERALIGATR, RAGE, WATER_GUN, SCARY_FACE, SLASH
	db $ff ; end trainer party mons
	; last_address=0x39c51 size=40
; 0x39c51

PokemonProfGroup: ; 0x39c51
	
; 0x39c51

WillGroup: ; 0x39c51
	; WILL (1) at 0x39c51
	db "WILL@"
	db $01 ; data type
	db 40, XATU, QUICK_ATTACK, FUTURE_SIGHT, CONFUSE_RAY, PSYCHIC_M
	db 41, JYNX, DOUBLESLAP, LOVELY_KISS, ICE_PUNCH, PSYCHIC_M
	db 41, EXEGGUTOR, REFLECT, LEECH_SEED, EGG_BOMB, PSYCHIC_M
	db 41, SLOWBRO, CURSE, AMNESIA, BODY_SLAM, PSYCHIC_M
	db 42, XATU, QUICK_ATTACK, FUTURE_SIGHT, CONFUSE_RAY, PSYCHIC_M
	db $ff ; end trainer party mons
	; last_address=0x39c76 size=37
; 0x39c76

PKMNTrainerGroup: ; 0x39c76
	; CAL1 (2) at 0x39c76
	db "CAL@"
	db $00 ; data type
	db 10, CHIKORITA
	db 10, CYNDAQUIL
	db 10, TOTODILE
	db $ff ; end trainer party mons
	; last_address=0x39c82 size=12

	; CAL2 (3) at 0x39c82
	db "CAL@"
	db $00 ; data type
	db 30, BAYLEEF
	db 30, QUILAVA
	db 30, CROCONAW
	db $ff ; end trainer party mons
	; last_address=0x39c8e size=12

	; CAL3 (4) at 0x39c8e
	db "CAL@"
	db $00 ; data type
	db 50, MEGANIUM
	db 50, TYPHLOSION
	db 50, FERALIGATR
	db $ff ; end trainer party mons
	; last_address=0x39c9a size=12
; 0x39c9a

BrunoGroup: ; 0x39c9a
	; BRUNO (1) at 0x39c9a
	db "BRUNO@"
	db $01 ; data type
	db 42, HITMONTOP, PURSUIT, QUICK_ATTACK, DIG, DETECT
	db 42, HITMONLEE, SWAGGER, DOUBLE_KICK, HI_JUMP_KICK, FORESIGHT
	db 42, HITMONCHAN, THUNDERPUNCH, ICE_PUNCH, FIRE_PUNCH, MACH_PUNCH
	db 43, ONIX, BIND, EARTHQUAKE, SANDSTORM, ROCK_SLIDE
	db 46, MACHAMP, ROCK_SLIDE, FORESIGHT, VITAL_THROW, CROSS_CHOP
	db $ff ; end trainer party mons
	; last_address=0x39cc0 size=38
; 0x39cc0

KarenGroup: ; 0x39cc0
	; KAREN (1) at 0x39cc0
	db "KAREN@"
	db $01 ; data type
	db 42, UMBREON, SAND_ATTACK, CONFUSE_RAY, FAINT_ATTACK, MEAN_LOOK
	db 42, VILEPLUME, STUN_SPORE, ACID, MOONLIGHT, PETAL_DANCE
	db 45, GENGAR, LICK, SPITE, CURSE, DESTINY_BOND
	db 44, MURKROW, QUICK_ATTACK, WHIRLWIND, PURSUIT, FAINT_ATTACK
	db 47, HOUNDOOM, ROAR, PURSUIT, FLAMETHROWER, CRUNCH
	db $ff ; end trainer party mons
	; last_address=0x39ce6 size=38
; 0x39ce6

KogaGroup: ; 0x39ce6
	; KOGA (1) at 0x39ce6
	db "KOGA@"
	db $01 ; data type
	db 40, ARIADOS, DOUBLE_TEAM, SPIDER_WEB, BATON_PASS, GIGA_DRAIN
	db 41, VENOMOTH, SUPERSONIC, GUST, PSYCHIC_M, TOXIC
	db 43, FORRETRESS, PROTECT, SWIFT, EXPLOSION, SPIKES
	db 42, MUK, MINIMIZE, ACID_ARMOR, SLUDGE_BOMB, TOXIC
	db 44, CROBAT, DOUBLE_TEAM, QUICK_ATTACK, WING_ATTACK, TOXIC
	db $ff ; end trainer party mons
	; last_address=0x39d0b size=37
; 0x39d0b

ChampionGroup: ; 0x39d0b
	; LANCE (1) at 0x39d0b
	db "LANCE@"
	db $01 ; data type
	db 44, GYARADOS, FLAIL, RAIN_DANCE, SURF, HYPER_BEAM
	db 47, DRAGONITE, THUNDER_WAVE, TWISTER, THUNDER, HYPER_BEAM
	db 47, DRAGONITE, THUNDER_WAVE, TWISTER, BLIZZARD, HYPER_BEAM
	db 46, AERODACTYL, WING_ATTACK, ANCIENTPOWER, ROCK_SLIDE, HYPER_BEAM
	db 46, CHARIZARD, FLAMETHROWER, WING_ATTACK, SLASH, HYPER_BEAM
	db 50, DRAGONITE, FIRE_BLAST, SAFEGUARD, OUTRAGE, HYPER_BEAM
	db $ff ; end trainer party mons
	; last_address=0x39d37 size=44
; 0x39d37

BrockGroup: ; 0x39d37
	; BROCK (1) at 0x39d37
	db "BROCK@"
	db $01 ; data type
	db 41, GRAVELER, DEFENSE_CURL, ROCK_SLIDE, ROLLOUT, EARTHQUAKE
	db 41, RHYHORN, FURY_ATTACK, SCARY_FACE, EARTHQUAKE, HORN_DRILL
	db 42, OMASTAR, BITE, SURF, PROTECT, SPIKE_CANNON
	db 44, ONIX, BIND, ROCK_SLIDE, BIDE, SANDSTORM
	db 42, KABUTOPS, SLASH, SURF, ENDURE, GIGA_DRAIN
	db $ff ; end trainer party mons
	; last_address=0x39d5d size=38
; 0x39d5d

MistyGroup: ; 0x39d5d
	; MISTY (1) at 0x39d5d
	db "MISTY@"
	db $01 ; data type
	db 42, GOLDUCK, SURF, DISABLE, PSYCH_UP, PSYCHIC_M
	db 42, QUAGSIRE, SURF, AMNESIA, EARTHQUAKE, RAIN_DANCE
	db 44, LAPRAS, SURF, PERISH_SONG, BLIZZARD, RAIN_DANCE
	db 47, STARMIE, SURF, CONFUSE_RAY, RECOVER, ICE_BEAM
	db $ff ; end trainer party mons
	; last_address=0x39d7d size=32
; 0x39d7d

LtSurgeGroup: ; 0x39d7d
	; LT_SURGE (1) at 0x39d7d
	db "LT.SURGE@"
	db $01 ; data type
	db 44, RAICHU, THUNDER_WAVE, QUICK_ATTACK, THUNDERBOLT, THUNDER
	db 40, ELECTRODE, SCREECH, DOUBLE_TEAM, SWIFT, EXPLOSION
	db 40, MAGNETON, LOCK_ON, DOUBLE_TEAM, SWIFT, ZAP_CANNON
	db 40, ELECTRODE, SCREECH, DOUBLE_TEAM, SWIFT, EXPLOSION
	db 46, ELECTABUZZ, QUICK_ATTACK, THUNDERPUNCH, LIGHT_SCREEN, THUNDER
	db $ff ; end trainer party mons
	; last_address=0x39da6 size=41
; 0x39da6

ScientistGroup: ; 0x39da6
	; ROSS (1) at 0x39da6
	db "ROSS@"
	db $00 ; data type
	db 22, KOFFING
	db 22, KOFFING
	db $ff ; end trainer party mons
	; last_address=0x39db1 size=11

	; MITCH (2) at 0x39db1
	db "MITCH@"
	db $00 ; data type
	db 24, DITTO
	db $ff ; end trainer party mons
	; last_address=0x39dbb size=10

	; JED (3) at 0x39dbb
	db "JED@"
	db $00 ; data type
	db 20, MAGNEMITE
	db 20, MAGNEMITE
	db 20, MAGNEMITE
	db $ff ; end trainer party mons
	; last_address=0x39dc7 size=12

	; MARC (4) at 0x39dc7
	db "MARC@"
	db $00 ; data type
	db 27, MAGNEMITE
	db 27, MAGNEMITE
	db 27, MAGNEMITE
	db $ff ; end trainer party mons
	; last_address=0x39dd4 size=13

	; RICH (5) at 0x39dd4
	db "RICH@"
	db $01 ; data type
	db 30, PORYGON, CONVERSION, CONVERSION2, RECOVER, TRI_ATTACK
	db $ff ; end trainer party mons
	; last_address=0x39de1 size=13
; 0x39de1

ErikaGroup: ; 0x39de1
	; ERIKA (1) at 0x39de1
	db "ERIKA@"
	db $01 ; data type
	db 42, TANGELA, VINE_WHIP, BIND, GIGA_DRAIN, SLEEP_POWDER
	db 41, JUMPLUFF, MEGA_DRAIN, LEECH_SEED, COTTON_SPORE, GIGA_DRAIN
	db 46, VICTREEBEL, SUNNY_DAY, SYNTHESIS, ACID, RAZOR_LEAF
	db 46, BELLOSSOM, SUNNY_DAY, SYNTHESIS, PETAL_DANCE, SOLARBEAM
	db $ff ; end trainer party mons
	; last_address=0x39e01 size=32
; 0x39e01

YoungsterGroup: ; 0x39e01
	; JOEY1 (1) at 0x39e01
	db "JOEY@"
	db $00 ; data type
	db 4, RATTATA
	db $ff ; end trainer party mons
	; last_address=0x39e0a size=9

	; MIKEY (2) at 0x39e0a
	db "MIKEY@"
	db $00 ; data type
	db 2, PIDGEY
	db 4, RATTATA
	db $ff ; end trainer party mons
	; last_address=0x39e16 size=12

	; ALBERT (3) at 0x39e16
	db "ALBERT@"
	db $00 ; data type
	db 6, RATTATA
	db 8, ZUBAT
	db $ff ; end trainer party mons
	; last_address=0x39e23 size=13

	; GORDON (4) at 0x39e23
	db "GORDON@"
	db $00 ; data type
	db 10, WOOPER
	db $ff ; end trainer party mons
	; last_address=0x39e2e size=11

	; SAMUEL (5) at 0x39e2e
	db "SAMUEL@"
	db $00 ; data type
	db 7, RATTATA
	db 10, SANDSHREW
	db 8, SPEAROW
	db 8, SPEAROW
	db $ff ; end trainer party mons
	; last_address=0x39e3f size=17

	; IAN (6) at 0x39e3f
	db "IAN@"
	db $00 ; data type
	db 10, MANKEY
	db 12, DIGLETT
	db $ff ; end trainer party mons
	; last_address=0x39e49 size=10

	; JOEY2 (7) at 0x39e49
	db "JOEY@"
	db $00 ; data type
	db 15, RATTATA
	db $ff ; end trainer party mons
	; last_address=0x39e52 size=9

	; JOEY3 (8) at 0x39e52
	db "JOEY@"
	db $01 ; data type
	db 21, RATICATE, TAIL_WHIP, QUICK_ATTACK, HYPER_FANG, SCARY_FACE
	db $ff ; end trainer party mons
	; last_address=0x39e5f size=13

	; WARREN (9) at 0x39e5f
	db "WARREN@"
	db $00 ; data type
	db 35, FEAROW
	db $ff ; end trainer party mons
	; last_address=0x39e6a size=11

	; JIMMY (10) at 0x39e6a
	db "JIMMY@"
	db $00 ; data type
	db 33, RATICATE
	db 33, ARBOK
	db $ff ; end trainer party mons
	; last_address=0x39e76 size=12

	; OWEN (11) at 0x39e76
	db "OWEN@"
	db $00 ; data type
	db 35, GROWLITHE
	db $ff ; end trainer party mons
	; last_address=0x39e7f size=9

	; JASON (12) at 0x39e7f
	db "JASON@"
	db $00 ; data type
	db 33, SANDSLASH
	db 33, CROBAT
	db $ff ; end trainer party mons
	; last_address=0x39e8b size=12

	; JOEY4 (13) at 0x39e8b
	db "JOEY@"
	db $01 ; data type
	db 30, RATICATE, TAIL_WHIP, QUICK_ATTACK, HYPER_FANG, PURSUIT
	db $ff ; end trainer party mons
	; last_address=0x39e98 size=13

	; JOEY5 (14) at 0x39e98
	db "JOEY@"
	db $01 ; data type
	db 37, RATICATE, HYPER_BEAM, QUICK_ATTACK, HYPER_FANG, PURSUIT
	db $ff ; end trainer party mons
	; last_address=0x39ea5 size=13
; 0x39ea5

SchoolboyGroup: ; 0x39ea5
	; JACK1 (1) at 0x39ea5
	db "JACK@"
	db $00 ; data type
	db 12, ODDISH
	db 15, VOLTORB
	db $ff ; end trainer party mons
	; last_address=0x39eb0 size=11

	; KIPP (2) at 0x39eb0
	db "KIPP@"
	db $00 ; data type
	db 27, VOLTORB
	db 27, MAGNEMITE
	db 31, VOLTORB
	db 31, MAGNETON
	db $ff ; end trainer party mons
	; last_address=0x39ebf size=15

	; ALAN1 (3) at 0x39ebf
	db "ALAN@"
	db $00 ; data type
	db 16, TANGELA
	db $ff ; end trainer party mons
	; last_address=0x39ec8 size=9

	; JOHNNY (4) at 0x39ec8
	db "JOHNNY@"
	db $00 ; data type
	db 29, BELLSPROUT
	db 31, WEEPINBELL
	db 33, VICTREEBEL
	db $ff ; end trainer party mons
	; last_address=0x39ed7 size=15

	; DANNY (5) at 0x39ed7
	db "DANNY@"
	db $00 ; data type
	db 31, JYNX
	db 31, ELECTABUZZ
	db 31, MAGMAR
	db $ff ; end trainer party mons
	; last_address=0x39ee5 size=14

	; TOMMY (6) at 0x39ee5
	db "TOMMY@"
	db $00 ; data type
	db 32, XATU
	db 34, ALAKAZAM
	db $ff ; end trainer party mons
	; last_address=0x39ef1 size=12

	; DUDLEY (7) at 0x39ef1
	db "DUDLEY@"
	db $00 ; data type
	db 35, ODDISH
	db $ff ; end trainer party mons
	; last_address=0x39efc size=11

	; JOE (8) at 0x39efc
	db "JOE@"
	db $00 ; data type
	db 33, TANGELA
	db 33, VAPOREON
	db $ff ; end trainer party mons
	; last_address=0x39f06 size=10

	; BILLY (9) at 0x39f06
	db "BILLY@"
	db $00 ; data type
	db 27, PARAS
	db 27, PARAS
	db 27, POLIWHIRL
	db 35, DITTO
	db $ff ; end trainer party mons
	; last_address=0x39f16 size=16

	; CHAD1 (10) at 0x39f16
	db "CHAD@"
	db $00 ; data type
	db 19, MR__MIME
	db $ff ; end trainer party mons
	; last_address=0x39f1f size=9

	; NATE (11) at 0x39f1f
	db "NATE@"
	db $00 ; data type
	db 32, LEDIAN
	db 32, EXEGGUTOR
	db $ff ; end trainer party mons
	; last_address=0x39f2a size=11

	; RICKY (12) at 0x39f2a
	db "RICKY@"
	db $00 ; data type
	db 32, AIPOM
	db 32, DITTO
	db $ff ; end trainer party mons
	; last_address=0x39f36 size=12

	; JACK2 (13) at 0x39f36
	db "JACK@"
	db $00 ; data type
	db 14, ODDISH
	db 17, VOLTORB
	db $ff ; end trainer party mons
	; last_address=0x39f41 size=11

	; JACK3 (14) at 0x39f41
	db "JACK@"
	db $00 ; data type
	db 28, GLOOM
	db 31, ELECTRODE
	db $ff ; end trainer party mons
	; last_address=0x39f4c size=11

	; ALAN2 (15) at 0x39f4c
	db "ALAN@"
	db $00 ; data type
	db 17, TANGELA
	db 17, YANMA
	db $ff ; end trainer party mons
	; last_address=0x39f57 size=11

	; ALAN3 (16) at 0x39f57
	db "ALAN@"
	db $00 ; data type
	db 20, NATU
	db 22, TANGELA
	db 20, QUAGSIRE
	db 25, YANMA
	db $ff ; end trainer party mons
	; last_address=0x39f66 size=15

	; CHAD2 (17) at 0x39f66
	db "CHAD@"
	db $00 ; data type
	db 19, MR__MIME
	db 19, MAGNEMITE
	db $ff ; end trainer party mons
	; last_address=0x39f71 size=11

	; CHAD3 (18) at 0x39f71
	db "CHAD@"
	db $00 ; data type
	db 27, MR__MIME
	db 31, MAGNETON
	db $ff ; end trainer party mons
	; last_address=0x39f7c size=11

	; JACK4 (19) at 0x39f7c
	db "JACK@"
	db $00 ; data type
	db 30, GLOOM
	db 33, GROWLITHE
	db 33, ELECTRODE
	db $ff ; end trainer party mons
	; last_address=0x39f89 size=13

	; JACK5 (20) at 0x39f89
	db "JACK@"
	db $01 ; data type
	db 35, ELECTRODE, SCREECH, SONICBOOM, ROLLOUT, LIGHT_SCREEN
	db 35, GROWLITHE, SUNNY_DAY, LEER, TAKE_DOWN, FLAME_WHEEL
	db 37, VILEPLUME, SOLARBEAM, SLEEP_POWDER, ACID, MOONLIGHT
	db $ff ; end trainer party mons
	; last_address=0x39fa2 size=25

	; ALAN4 (21) at 0x39fa2
	db "ALAN@"
	db $00 ; data type
	db 27, NATU
	db 27, TANGELA
	db 30, QUAGSIRE
	db 30, YANMA
	db $ff ; end trainer party mons
	; last_address=0x39fb1 size=15

	; ALAN5 (22) at 0x39fb1
	db "ALAN@"
	db $01 ; data type
	db 35, XATU, PECK, NIGHT_SHADE, SWIFT, FUTURE_SIGHT
	db 32, TANGELA, POISONPOWDER, VINE_WHIP, BIND, MEGA_DRAIN
	db 32, YANMA, QUICK_ATTACK, DOUBLE_TEAM, SONICBOOM, SUPERSONIC
	db 35, QUAGSIRE, TAIL_WHIP, SLAM, AMNESIA, EARTHQUAKE
	db $ff ; end trainer party mons
	; last_address=0x39fd0 size=31

	; CHAD4 (23) at 0x39fd0
	db "CHAD@"
	db $00 ; data type
	db 30, MR__MIME
	db 34, MAGNETON
	db $ff ; end trainer party mons
	; last_address=0x39fdb size=11

	; CHAD5 (24) at 0x39fdb
	db "CHAD@"
	db $01 ; data type
	db 34, MR__MIME, PSYCHIC_M, LIGHT_SCREEN, REFLECT, ENCORE
	db 38, MAGNETON, ZAP_CANNON, THUNDER_WAVE, LOCK_ON, SWIFT
	db $ff ; end trainer party mons
	; last_address=0x39fee size=19
; 0x39fee

BirdKeeperGroup: ; 0x39fee
	; ROD (1) at 0x39fee
	db "ROD@"
	db $00 ; data type
	db 7, PIDGEY
	db 7, PIDGEY
	db $ff ; end trainer party mons
	; last_address=0x39ff8 size=10

	; ABE (2) at 0x39ff8
	db "ABE@"
	db $00 ; data type
	db 9, SPEAROW
	db $ff ; end trainer party mons
	; last_address=0x3a000 size=8

	; BRYAN (3) at 0x3a000
	db "BRYAN@"
	db $00 ; data type
	db 12, PIDGEY
	db 14, PIDGEOTTO
	db $ff ; end trainer party mons
	; last_address=0x3a00c size=12

	; THEO (4) at 0x3a00c
	db "THEO@"
	db $00 ; data type
	db 17, PIDGEY
	db 15, PIDGEY
	db 19, PIDGEY
	db 15, PIDGEY
	db 15, PIDGEY
	db $ff ; end trainer party mons
	; last_address=0x3a01d size=17

	; TOBY (5) at 0x3a01d
	db "TOBY@"
	db $00 ; data type
	db 15, DODUO
	db 16, DODUO
	db 17, DODUO
	db $ff ; end trainer party mons
	; last_address=0x3a02a size=13

	; DENIS (6) at 0x3a02a
	db "DENIS@"
	db $00 ; data type
	db 18, SPEAROW
	db 20, FEAROW
	db 18, SPEAROW
	db $ff ; end trainer party mons
	; last_address=0x3a038 size=14

	; VANCE1 (7) at 0x3a038
	db "VANCE@"
	db $00 ; data type
	db 25, PIDGEOTTO
	db 25, PIDGEOTTO
	db $ff ; end trainer party mons
	; last_address=0x3a044 size=12

	; HANK (8) at 0x3a044
	db "HANK@"
	db $00 ; data type
	db 12, PIDGEY
	db 34, PIDGEOT
	db $ff ; end trainer party mons
	; last_address=0x3a04f size=11

	; ROY (9) at 0x3a04f
	db "ROY@"
	db $00 ; data type
	db 29, FEAROW
	db 35, FEAROW
	db $ff ; end trainer party mons
	; last_address=0x3a059 size=10

	; BORIS (10) at 0x3a059
	db "BORIS@"
	db $00 ; data type
	db 30, DODUO
	db 28, DODUO
	db 32, DODRIO
	db $ff ; end trainer party mons
	; last_address=0x3a067 size=14

	; BOB (11) at 0x3a067
	db "BOB@"
	db $00 ; data type
	db 34, NOCTOWL
	db $ff ; end trainer party mons
	; last_address=0x3a06f size=8

	; JOSE1 (12) at 0x3a06f
	db "JOSE@"
	db $00 ; data type
	db 36, FARFETCH_D
	db $ff ; end trainer party mons
	; last_address=0x3a078 size=9

	; PETER (13) at 0x3a078
	db "PETER@"
	db $00 ; data type
	db 6, PIDGEY
	db 6, PIDGEY
	db 8, SPEAROW
	db $ff ; end trainer party mons
	; last_address=0x3a086 size=14

	; JOSE2 (14) at 0x3a086
	db "JOSE@"
	db $00 ; data type
	db 34, FARFETCH_D
	db $ff ; end trainer party mons
	; last_address=0x3a08f size=9

	; PERRY (15) at 0x3a08f
	db "PERRY@"
	db $00 ; data type
	db 34, FARFETCH_D
	db $ff ; end trainer party mons
	; last_address=0x3a099 size=10

	; BRET (16) at 0x3a099
	db "BRET@"
	db $00 ; data type
	db 32, PIDGEOTTO
	db 32, FEAROW
	db $ff ; end trainer party mons
	; last_address=0x3a0a4 size=11

	; JOSE3 (17) at 0x3a0a4
	db "JOSE@"
	db $01 ; data type
	db 40, FARFETCH_D, FURY_ATTACK, DETECT, FLY, SLASH
	db $ff ; end trainer party mons
	; last_address=0x3a0b1 size=13

	; VANCE2 (18) at 0x3a0b1
	db "VANCE@"
	db $00 ; data type
	db 32, PIDGEOTTO
	db 32, PIDGEOTTO
	db $ff ; end trainer party mons
	; last_address=0x3a0bd size=12

	; VANCE3 (19) at 0x3a0bd
	db "VANCE@"
	db $01 ; data type
	db 38, PIDGEOT, TOXIC, QUICK_ATTACK, WHIRLWIND, FLY
	db 38, PIDGEOT, SWIFT, DETECT, STEEL_WING, FLY
	db $ff ; end trainer party mons
	; last_address=0x3a0d1 size=20
; 0x3a0d1

LassGroup: ; 0x3a0d1
	; CARRIE (1) at 0x3a0d1
	db "CARRIE@"
	db $01 ; data type
	db 18, SNUBBULL, SCARY_FACE, CHARM, BITE, LICK
	db $ff ; end trainer party mons
	; last_address=0x3a0e0 size=15

	; BRIDGET (2) at 0x3a0e0
	db "BRIDGET@"
	db $00 ; data type
	db 15, JIGGLYPUFF
	db 15, JIGGLYPUFF
	db 15, JIGGLYPUFF
	db $ff ; end trainer party mons
	; last_address=0x3a0f0 size=16

	; ALICE (3) at 0x3a0f0
	db "ALICE@"
	db $00 ; data type
	db 30, GLOOM
	db 34, ARBOK
	db 30, GLOOM
	db $ff ; end trainer party mons
	; last_address=0x3a0fe size=14

	; KRISE (4) at 0x3a0fe
	db "KRISE@"
	db $00 ; data type
	db 12, ODDISH
	db 15, CUBONE
	db $ff ; end trainer party mons
	; last_address=0x3a10a size=12

	; CONNIE1 (5) at 0x3a10a
	db "CONNIE@"
	db $00 ; data type
	db 21, MARILL
	db $ff ; end trainer party mons
	; last_address=0x3a115 size=11

	; LINDA (6) at 0x3a115
	db "LINDA@"
	db $00 ; data type
	db 30, BULBASAUR
	db 32, IVYSAUR
	db 34, VENUSAUR
	db $ff ; end trainer party mons
	; last_address=0x3a123 size=14

	; LAURA (7) at 0x3a123
	db "LAURA@"
	db $00 ; data type
	db 28, GLOOM
	db 31, PIDGEOTTO
	db 31, BELLOSSOM
	db $ff ; end trainer party mons
	; last_address=0x3a131 size=14

	; SHANNON (8) at 0x3a131
	db "SHANNON@"
	db $00 ; data type
	db 29, PARAS
	db 29, PARAS
	db 32, PARASECT
	db $ff ; end trainer party mons
	; last_address=0x3a141 size=16

	; MICHELLE (9) at 0x3a141
	db "MICHELLE@"
	db $00 ; data type
	db 32, SKIPLOOM
	db 33, HOPPIP
	db 34, JUMPLUFF
	db $ff ; end trainer party mons
	; last_address=0x3a152 size=17

	; DANA1 (10) at 0x3a152
	db "DANA@"
	db $01 ; data type
	db 18, FLAAFFY, TACKLE, GROWL, THUNDERSHOCK, THUNDER_WAVE
	db 18, PSYDUCK, SCRATCH, TAIL_WHIP, DISABLE, CONFUSION
	db $ff ; end trainer party mons
	; last_address=0x3a165 size=19

	; ELLEN (11) at 0x3a165
	db "ELLEN@"
	db $00 ; data type
	db 30, WIGGLYTUFF
	db 34, GRANBULL
	db $ff ; end trainer party mons
	; last_address=0x3a171 size=12

	; CONNIE2 (12) at 0x3a171
	db "CONNIE@"
	db $00 ; data type
	db 21, MARILL
	db $ff ; end trainer party mons
	; last_address=0x3a17c size=11

	; CONNIE3 (13) at 0x3a17c
	db "CONNIE@"
	db $00 ; data type
	db 21, MARILL
	db $ff ; end trainer party mons
	; last_address=0x3a187 size=11

	; DANA2 (14) at 0x3a187
	db "DANA@"
	db $01 ; data type
	db 21, FLAAFFY, TACKLE, GROWL, THUNDERSHOCK, THUNDER_WAVE
	db 21, PSYDUCK, SCRATCH, TAIL_WHIP, DISABLE, CONFUSION
	db $ff ; end trainer party mons
	; last_address=0x3a19a size=19

	; DANA3 (15) at 0x3a19a
	db "DANA@"
	db $01 ; data type
	db 29, PSYDUCK, SCRATCH, DISABLE, CONFUSION, SCREECH
	db 29, AMPHAROS, TACKLE, THUNDERSHOCK, THUNDER_WAVE, COTTON_SPORE
	db $ff ; end trainer party mons
	; last_address=0x3a1ad size=19

	; DANA4 (16) at 0x3a1ad
	db "DANA@"
	db $01 ; data type
	db 32, PSYDUCK, SCRATCH, DISABLE, CONFUSION, SCREECH
	db 32, AMPHAROS, TACKLE, THUNDERPUNCH, THUNDER_WAVE, COTTON_SPORE
	db $ff ; end trainer party mons
	; last_address=0x3a1c0 size=19

	; DANA5 (17) at 0x3a1c0
	db "DANA@"
	db $01 ; data type
	db 36, AMPHAROS, SWIFT, THUNDERPUNCH, THUNDER_WAVE, COTTON_SPORE
	db 36, GOLDUCK, DISABLE, SURF, PSYCHIC_M, SCREECH
	db $ff ; end trainer party mons
	; last_address=0x3a1d3 size=19
; 0x3a1d3

JanineGroup: ; 0x3a1d3
	; JANINE (1) at 0x3a1d3
	db "JANINE@"
	db $01 ; data type
	db 36, CROBAT, SCREECH, SUPERSONIC, CONFUSE_RAY, WING_ATTACK
	db 36, WEEZING, SMOG, SLUDGE_BOMB, TOXIC, EXPLOSION
	db 36, WEEZING, SMOG, SLUDGE_BOMB, TOXIC, EXPLOSION
	db 33, ARIADOS, SCARY_FACE, GIGA_DRAIN, STRING_SHOT, NIGHT_SHADE
	db 39, VENOMOTH, FORESIGHT, DOUBLE_TEAM, GUST, PSYCHIC_M
	db $ff ; end trainer party mons
	; last_address=0x3a1fa size=39
; 0x3a1fa

CooltrainerMGroup: ; 0x3a1fa
	; NICK (1) at 0x3a1fa
	db "NICK@"
	db $01 ; data type
	db 26, CHARMANDER, EMBER, SMOKESCREEN, RAGE, SCARY_FACE
	db 26, SQUIRTLE, WITHDRAW, WATER_GUN, BITE, CURSE
	db 26, BULBASAUR, LEECH_SEED, POISONPOWDER, SLEEP_POWDER, RAZOR_LEAF
	db $ff ; end trainer party mons
	; last_address=0x3a213 size=25

	; AARON (2) at 0x3a213
	db "AARON@"
	db $00 ; data type
	db 24, IVYSAUR
	db 24, CHARMELEON
	db 24, WARTORTLE
	db $ff ; end trainer party mons
	; last_address=0x3a221 size=14

	; PAUL (3) at 0x3a221
	db "PAUL@"
	db $00 ; data type
	db 34, DRATINI
	db 34, DRATINI
	db 34, DRATINI
	db $ff ; end trainer party mons
	; last_address=0x3a22e size=13

	; CODY (4) at 0x3a22e
	db "CODY@"
	db $00 ; data type
	db 34, HORSEA
	db 36, SEADRA
	db $ff ; end trainer party mons
	; last_address=0x3a239 size=11

	; MIKE (5) at 0x3a239
	db "MIKE@"
	db $00 ; data type
	db 37, DRAGONAIR
	db $ff ; end trainer party mons
	; last_address=0x3a242 size=9

	; GAVEN1 (6) at 0x3a242
	db "GAVEN@"
	db $01 ; data type
	db 35, VICTREEBEL, WRAP, TOXIC, ACID, RAZOR_LEAF
	db 35, KINGLER, BUBBLEBEAM, STOMP, GUILLOTINE, PROTECT
	db 35, FLAREON, SAND_ATTACK, QUICK_ATTACK, BITE, FIRE_SPIN
	db $ff ; end trainer party mons
	; last_address=0x3a25c size=26

	; GAVEN2 (7) at 0x3a25c
	db "GAVEN@"
	db $03 ; data type
	db 39, VICTREEBEL, $0, GIGA_DRAIN, TOXIC, SLUDGE_BOMB, RAZOR_LEAF
	db 39, KINGLER, KINGS_ROCK, SURF, STOMP, GUILLOTINE, BLIZZARD
	db 39, FLAREON, $0, FLAMETHROWER, QUICK_ATTACK, BITE, FIRE_SPIN
	db $ff ; end trainer party mons
	; last_address=0x3a279 size=29

	; RYAN (8) at 0x3a279
	db "RYAN@"
	db $01 ; data type
	db 25, PIDGEOT, SAND_ATTACK, QUICK_ATTACK, WHIRLWIND, WING_ATTACK
	db 27, ELECTABUZZ, THUNDERPUNCH, LIGHT_SCREEN, SWIFT, SCREECH
	db $ff ; end trainer party mons
	; last_address=0x3a28c size=19

	; JAKE (9) at 0x3a28c
	db "JAKE@"
	db $01 ; data type
	db 33, PARASECT, LEECH_LIFE, SPORE, SLASH, SWORDS_DANCE
	db 35, GOLDUCK, CONFUSION, SCREECH, PSYCH_UP, FURY_SWIPES
	db $ff ; end trainer party mons
	; last_address=0x3a29f size=19

	; GAVEN3 (10) at 0x3a29f
	db "GAVEN@"
	db $01 ; data type
	db 32, VICTREEBEL, WRAP, TOXIC, ACID, RAZOR_LEAF
	db 32, KINGLER, BUBBLEBEAM, STOMP, GUILLOTINE, PROTECT
	db 32, FLAREON, SAND_ATTACK, QUICK_ATTACK, BITE, FIRE_SPIN
	db $ff ; end trainer party mons
	; last_address=0x3a2b9 size=26

	; BLAKE (11) at 0x3a2b9
	db "BLAKE@"
	db $01 ; data type
	db 33, MAGNETON, THUNDERBOLT, SUPERSONIC, SWIFT, SCREECH
	db 31, QUAGSIRE, WATER_GUN, SLAM, AMNESIA, EARTHQUAKE
	db 31, EXEGGCUTE, LEECH_SEED, CONFUSION, SLEEP_POWDER, SOLARBEAM
	db $ff ; end trainer party mons
	; last_address=0x3a2d3 size=26

	; BRIAN (12) at 0x3a2d3
	db "BRIAN@"
	db $01 ; data type
	db 35, SANDSLASH, SAND_ATTACK, POISON_STING, SLASH, SWIFT
	db $ff ; end trainer party mons
	; last_address=0x3a2e1 size=14

	; ERICK (13) at 0x3a2e1
	db "ERICK@"
	db $00 ; data type
	db 10, BULBASAUR
	db 10, CHARMANDER
	db 10, SQUIRTLE
	db $ff ; end trainer party mons
	; last_address=0x3a2ef size=14

	; ANDY (14) at 0x3a2ef
	db "ANDY@"
	db $00 ; data type
	db 10, BULBASAUR
	db 10, CHARMANDER
	db 10, SQUIRTLE
	db $ff ; end trainer party mons
	; last_address=0x3a2fc size=13

	; TYLER (15) at 0x3a2fc
	db "TYLER@"
	db $00 ; data type
	db 10, BULBASAUR
	db 10, CHARMANDER
	db 10, SQUIRTLE
	db $ff ; end trainer party mons
	; last_address=0x3a30a size=14

	; SEAN (16) at 0x3a30a
	db "SEAN@"
	db $00 ; data type
	db 35, FLAREON
	db 35, TANGELA
	db 35, TAUROS
	db $ff ; end trainer party mons
	; last_address=0x3a317 size=13

	; KEVIN (17) at 0x3a317
	db "KEVIN@"
	db $00 ; data type
	db 38, RHYHORN
	db 35, CHARMELEON
	db 35, WARTORTLE
	db $ff ; end trainer party mons
	; last_address=0x3a325 size=14

	; STEVE (18) at 0x3a325
	db "STEVE@"
	db $00 ; data type
	db 14, BULBASAUR
	db 14, CHARMANDER
	db 14, SQUIRTLE
	db $ff ; end trainer party mons
	; last_address=0x3a333 size=14

	; ALLEN (19) at 0x3a333
	db "ALLEN@"
	db $01 ; data type
	db 27, CHARMELEON, EMBER, SMOKESCREEN, RAGE, SCARY_FACE
	db $ff ; end trainer party mons
	; last_address=0x3a341 size=14

	; DARIN (20) at 0x3a341
	db "DARIN@"
	db $01 ; data type
	db 37, DRAGONAIR, WRAP, SURF, DRAGON_RAGE, SLAM
	db $ff ; end trainer party mons
	; last_address=0x3a34f size=14
; 0x3a34f

CooltrainerFGroup: ; 0x3a34f
	; GWEN (1) at 0x3a34f
	db "GWEN@"
	db $00 ; data type
	db 26, EEVEE
	db 22, FLAREON
	db 22, VAPOREON
	db 22, JOLTEON
	db $ff ; end trainer party mons
	; last_address=0x3a35e size=15

	; LOIS (2) at 0x3a35e
	db "LOIS@"
	db $01 ; data type
	db 25, SKIPLOOM, SYNTHESIS, POISONPOWDER, MEGA_DRAIN, LEECH_SEED
	db 25, NINETALES, EMBER, QUICK_ATTACK, CONFUSE_RAY, SAFEGUARD
	db $ff ; end trainer party mons
	; last_address=0x3a371 size=19

	; FRAN (3) at 0x3a371
	db "FRAN@"
	db $00 ; data type
	db 37, SEADRA
	db $ff ; end trainer party mons
	; last_address=0x3a37a size=9

	; LOLA (4) at 0x3a37a
	db "LOLA@"
	db $00 ; data type
	db 34, DRATINI
	db 36, DRAGONAIR
	db $ff ; end trainer party mons
	; last_address=0x3a385 size=11

	; KATE (5) at 0x3a385
	db "KATE@"
	db $00 ; data type
	db 26, SHELLDER
	db 28, CLOYSTER
	db $ff ; end trainer party mons
	; last_address=0x3a390 size=11

	; IRENE (6) at 0x3a390
	db "IRENE@"
	db $00 ; data type
	db 22, GOLDEEN
	db 24, SEAKING
	db $ff ; end trainer party mons
	; last_address=0x3a39c size=12

	; KELLY (7) at 0x3a39c
	db "KELLY@"
	db $00 ; data type
	db 27, MARILL
	db 24, WARTORTLE
	db 24, WARTORTLE
	db $ff ; end trainer party mons
	; last_address=0x3a3aa size=14

	; JOYCE (8) at 0x3a3aa
	db "JOYCE@"
	db $01 ; data type
	db 36, PIKACHU, QUICK_ATTACK, DOUBLE_TEAM, THUNDERBOLT, THUNDER
	db 32, BLASTOISE, BITE, CURSE, SURF, RAIN_DANCE
	db $ff ; end trainer party mons
	; last_address=0x3a3be size=20

	; BETH1 (9) at 0x3a3be
	db "BETH@"
	db $01 ; data type
	db 36, RAPIDASH, STOMP, FIRE_SPIN, FURY_ATTACK, AGILITY
	db $ff ; end trainer party mons
	; last_address=0x3a3cb size=13

	; REENA1 (10) at 0x3a3cb
	db "REENA@"
	db $00 ; data type
	db 31, STARMIE
	db 33, NIDOQUEEN
	db 31, STARMIE
	db $ff ; end trainer party mons
	; last_address=0x3a3d9 size=14

	; MEGAN (11) at 0x3a3d9
	db "MEGAN@"
	db $01 ; data type
	db 32, BULBASAUR, GROWL, LEECH_SEED, POISONPOWDER, RAZOR_LEAF
	db 32, IVYSAUR, GROWL, LEECH_SEED, POISONPOWDER, RAZOR_LEAF
	db 32, VENUSAUR, BODY_SLAM, SLEEP_POWDER, RAZOR_LEAF, SWEET_SCENT
	db $ff ; end trainer party mons
	; last_address=0x3a3f3 size=26

	; BETH2 (12) at 0x3a3f3
	db "BETH@"
	db $01 ; data type
	db 39, RAPIDASH, STOMP, FIRE_SPIN, FURY_ATTACK, AGILITY
	db $ff ; end trainer party mons
	; last_address=0x3a400 size=13

	; CAROL (13) at 0x3a400
	db "CAROL@"
	db $00 ; data type
	db 35, ELECTRODE
	db 35, STARMIE
	db 35, NINETALES
	db $ff ; end trainer party mons
	; last_address=0x3a40e size=14

	; QUINN (14) at 0x3a40e
	db "QUINN@"
	db $00 ; data type
	db 38, IVYSAUR
	db 38, STARMIE
	db $ff ; end trainer party mons
	; last_address=0x3a41a size=12

	; EMMA (15) at 0x3a41a
	db "EMMA@"
	db $00 ; data type
	db 28, POLIWHIRL
	db $ff ; end trainer party mons
	; last_address=0x3a423 size=9

	; CYBIL (16) at 0x3a423
	db "CYBIL@"
	db $01 ; data type
	db 25, BUTTERFREE, CONFUSION, SLEEP_POWDER, WHIRLWIND, GUST
	db 25, BELLOSSOM, ABSORB, STUN_SPORE, ACID, SOLARBEAM
	db $ff ; end trainer party mons
	; last_address=0x3a437 size=20

	; JENN (17) at 0x3a437
	db "JENN@"
	db $00 ; data type
	db 24, STARYU
	db 26, STARMIE
	db $ff ; end trainer party mons
	; last_address=0x3a442 size=11

	; BETH3 (18) at 0x3a442
	db "BETH@"
	db $03 ; data type
	db 43, RAPIDASH, FOCUS_BAND, STOMP, FIRE_SPIN, FURY_ATTACK, FIRE_BLAST
	db $ff ; end trainer party mons
	; last_address=0x3a450 size=14

	; REENA2 (19) at 0x3a450
	db "REENA@"
	db $00 ; data type
	db 34, STARMIE
	db 36, NIDOQUEEN
	db 34, STARMIE
	db $ff ; end trainer party mons
	; last_address=0x3a45e size=14

	; REENA3 (20) at 0x3a45e
	db "REENA@"
	db $03 ; data type
	db 38, STARMIE, $0, DOUBLE_TEAM, PSYCHIC_M, WATERFALL, CONFUSE_RAY
	db 40, NIDOQUEEN, PINK_BOW, EARTHQUAKE, DOUBLE_KICK, TOXIC, BODY_SLAM
	db 38, STARMIE, $0, BLIZZARD, PSYCHIC_M, WATERFALL, RECOVER
	db $ff ; end trainer party mons
	; last_address=0x3a47b size=29

	; CARA (21) at 0x3a47b
	db "CARA@"
	db $01 ; data type
	db 33, HORSEA, SMOKESCREEN, LEER, WHIRLPOOL, TWISTER
	db 33, HORSEA, SMOKESCREEN, LEER, WHIRLPOOL, TWISTER
	db 35, SEADRA, SWIFT, LEER, WATERFALL, TWISTER
	db $ff ; end trainer party mons
	; last_address=0x3a494 size=25
; 0x3a494

BeautyGroup: ; 0x3a494
	; VICTORIA (1) at 0x3a494
	db "VICTORIA@"
	db $00 ; data type
	db 9, SENTRET
	db 13, SENTRET
	db 17, SENTRET
	db $ff ; end trainer party mons
	; last_address=0x3a4a5 size=17

	; SAMANTHA (2) at 0x3a4a5
	db "SAMANTHA@"
	db $01 ; data type
	db 16, MEOWTH, SCRATCH, GROWL, BITE, PAY_DAY
	db 16, MEOWTH, SCRATCH, GROWL, BITE, SLASH
	db $ff ; end trainer party mons
	; last_address=0x3a4bc size=23

	; JULIE (3) at 0x3a4bc
	db "JULIE@"
	db $00 ; data type
	db 15, SENTRET
	db $ff ; end trainer party mons
	; last_address=0x3a4c6 size=10

	; JACLYN (4) at 0x3a4c6
	db "JACLYN@"
	db $00 ; data type
	db 15, SENTRET
	db $ff ; end trainer party mons
	; last_address=0x3a4d1 size=11

	; BRENDA (5) at 0x3a4d1
	db "BRENDA@"
	db $00 ; data type
	db 16, FURRET
	db $ff ; end trainer party mons
	; last_address=0x3a4dc size=11

	; CASSIE (6) at 0x3a4dc
	db "CASSIE@"
	db $00 ; data type
	db 28, VILEPLUME
	db 34, BUTTERFREE
	db $ff ; end trainer party mons
	; last_address=0x3a4e9 size=13

	; CAROLINE (7) at 0x3a4e9
	db "CAROLINE@"
	db $00 ; data type
	db 30, MARILL
	db 32, SEEL
	db 30, MARILL
	db $ff ; end trainer party mons
	; last_address=0x3a4fa size=17

	; CARLENE (8) at 0x3a4fa
	db "CARLENE@"
	db $00 ; data type
	db 15, SENTRET
	db $ff ; end trainer party mons
	; last_address=0x3a506 size=12

	; JESSICA (9) at 0x3a506
	db "JESSICA@"
	db $00 ; data type
	db 15, SENTRET
	db $ff ; end trainer party mons
	; last_address=0x3a512 size=12

	; RACHAEL (10) at 0x3a512
	db "RACHAEL@"
	db $00 ; data type
	db 15, SENTRET
	db $ff ; end trainer party mons
	; last_address=0x3a51e size=12

	; ANGELICA (11) at 0x3a51e
	db "ANGELICA@"
	db $00 ; data type
	db 15, SENTRET
	db $ff ; end trainer party mons
	; last_address=0x3a52b size=13

	; KENDRA (12) at 0x3a52b
	db "KENDRA@"
	db $00 ; data type
	db 15, SENTRET
	db $ff ; end trainer party mons
	; last_address=0x3a536 size=11

	; VERONICA (13) at 0x3a536
	db "VERONICA@"
	db $00 ; data type
	db 15, SENTRET
	db $ff ; end trainer party mons
	; last_address=0x3a543 size=13

	; JULIA (14) at 0x3a543
	db "JULIA@"
	db $00 ; data type
	db 32, PARAS
	db 32, EXEGGCUTE
	db 35, PARASECT
	db $ff ; end trainer party mons
	; last_address=0x3a551 size=14

	; THERESA (15) at 0x3a551
	db "THERESA@"
	db $00 ; data type
	db 15, SENTRET
	db $ff ; end trainer party mons
	; last_address=0x3a55d size=12

	; VALERIE (16) at 0x3a55d
	db "VALERIE@"
	db $01 ; data type
	db 17, HOPPIP, SYNTHESIS, TAIL_WHIP, TACKLE, POISONPOWDER
	db 17, SKIPLOOM, SYNTHESIS, TAIL_WHIP, TACKLE, STUN_SPORE
	db $ff ; end trainer party mons
	; last_address=0x3a573 size=22

	; OLIVIA (17) at 0x3a573
	db "OLIVIA@"
	db $00 ; data type
	db 19, CORSOLA
	db $ff ; end trainer party mons
	; last_address=0x3a57e size=11
; 0x3a57e

PokemaniacGroup: ; 0x3a57e
	; LARRY (1) at 0x3a57e
	db "LARRY@"
	db $00 ; data type
	db 10, SLOWPOKE
	db $ff ; end trainer party mons
	; last_address=0x3a588 size=10

	; ANDREW (2) at 0x3a588
	db "ANDREW@"
	db $00 ; data type
	db 24, MAROWAK
	db 24, MAROWAK
	db $ff ; end trainer party mons
	; last_address=0x3a595 size=13

	; CALVIN (3) at 0x3a595
	db "CALVIN@"
	db $00 ; data type
	db 26, KANGASKHAN
	db $ff ; end trainer party mons
	; last_address=0x3a5a0 size=11

	; SHANE (4) at 0x3a5a0
	db "SHANE@"
	db $00 ; data type
	db 16, NIDORINA
	db 16, NIDORINO
	db $ff ; end trainer party mons
	; last_address=0x3a5ac size=12

	; BEN (5) at 0x3a5ac
	db "BEN@"
	db $00 ; data type
	db 19, SLOWBRO
	db $ff ; end trainer party mons
	; last_address=0x3a5b4 size=8

	; BRENT1 (6) at 0x3a5b4
	db "BRENT@"
	db $00 ; data type
	db 19, LICKITUNG
	db $ff ; end trainer party mons
	; last_address=0x3a5be size=10

	; RON (7) at 0x3a5be
	db "RON@"
	db $00 ; data type
	db 19, NIDOKING
	db $ff ; end trainer party mons
	; last_address=0x3a5c6 size=8

	; ETHAN (8) at 0x3a5c6
	db "ETHAN@"
	db $00 ; data type
	db 31, RHYHORN
	db 31, RHYDON
	db $ff ; end trainer party mons
	; last_address=0x3a5d2 size=12

	; BRENT2 (9) at 0x3a5d2
	db "BRENT@"
	db $00 ; data type
	db 25, KANGASKHAN
	db $ff ; end trainer party mons
	; last_address=0x3a5dc size=10

	; BRENT3 (10) at 0x3a5dc
	db "BRENT@"
	db $01 ; data type
	db 36, PORYGON, RECOVER, PSYCHIC_M, CONVERSION2, TRI_ATTACK
	db $ff ; end trainer party mons
	; last_address=0x3a5ea size=14

	; ISSAC (11) at 0x3a5ea
	db "ISSAC@"
	db $01 ; data type
	db 12, LICKITUNG, LICK, SUPERSONIC, CUT, 0
	db $ff ; end trainer party mons
	; last_address=0x3a5f8 size=14

	; DONALD (12) at 0x3a5f8
	db "DONALD@"
	db $00 ; data type
	db 10, SLOWPOKE
	db 10, SLOWPOKE
	db $ff ; end trainer party mons
	; last_address=0x3a605 size=13

	; ZACH (13) at 0x3a605
	db "ZACH@"
	db $00 ; data type
	db 27, RHYHORN
	db $ff ; end trainer party mons
	; last_address=0x3a60e size=9

	; BRENT4 (14) at 0x3a60e
	db "BRENT@"
	db $01 ; data type
	db 41, CHANSEY, ROLLOUT, ATTRACT, EGG_BOMB, SOFTBOILED
	db $ff ; end trainer party mons
	; last_address=0x3a61c size=14

	; MILLER (15) at 0x3a61c
	db "MILLER@"
	db $00 ; data type
	db 17, NIDOKING
	db 17, NIDOQUEEN
	db $ff ; end trainer party mons
	; last_address=0x3a629 size=13
; 0x3a629

GruntMGroup: ; 0x3a629
	; GRUNT1 (1) at 0x3a629
	db "GRUNT@"
	db $00 ; data type
	db 14, KOFFING
	db $ff ; end trainer party mons
	; last_address=0x3a633 size=10

	; GRUNT2 (2) at 0x3a633
	db "GRUNT@"
	db $00 ; data type
	db 7, RATTATA
	db 9, ZUBAT
	db 9, ZUBAT
	db $ff ; end trainer party mons
	; last_address=0x3a641 size=14

	; GRUNT3 (3) at 0x3a641
	db "GRUNT@"
	db $00 ; data type
	db 24, RATICATE
	db 24, RATICATE
	db $ff ; end trainer party mons
	; last_address=0x3a64d size=12

	; GRUNT4 (4) at 0x3a64d
	db "GRUNT@"
	db $00 ; data type
	db 23, GRIMER
	db 23, GRIMER
	db 25, MUK
	db $ff ; end trainer party mons
	; last_address=0x3a65b size=14

	; GRUNT5 (5) at 0x3a65b
	db "GRUNT@"
	db $00 ; data type
	db 21, RATTATA
	db 21, RATTATA
	db 23, RATTATA
	db 23, RATTATA
	db 23, RATTATA
	db $ff ; end trainer party mons
	; last_address=0x3a66d size=18

	; GRUNT6 (6) at 0x3a66d
	db "GRUNT@"
	db $00 ; data type
	db 26, ZUBAT
	db 26, ZUBAT
	db $ff ; end trainer party mons
	; last_address=0x3a679 size=12

	; GRUNT7 (7) at 0x3a679
	db "GRUNT@"
	db $00 ; data type
	db 23, KOFFING
	db 23, GRIMER
	db 23, ZUBAT
	db 23, RATTATA
	db $ff ; end trainer party mons
	; last_address=0x3a689 size=16

	; GRUNT8 (8) at 0x3a689
	db "GRUNT@"
	db $00 ; data type
	db 26, WEEZING
	db $ff ; end trainer party mons
	; last_address=0x3a693 size=10

	; GRUNT9 (9) at 0x3a693
	db "GRUNT@"
	db $00 ; data type
	db 24, RATICATE
	db 26, KOFFING
	db $ff ; end trainer party mons
	; last_address=0x3a69f size=12

	; GRUNT10 (10) at 0x3a69f
	db "GRUNT@"
	db $00 ; data type
	db 22, ZUBAT
	db 24, GOLBAT
	db 22, GRIMER
	db $ff ; end trainer party mons
	; last_address=0x3a6ad size=14

	; GRUNT11 (11) at 0x3a6ad
	db "GRUNT@"
	db $00 ; data type
	db 23, MUK
	db 23, KOFFING
	db 25, RATTATA
	db $ff ; end trainer party mons
	; last_address=0x3a6bb size=14

	; GRUNT_EXECUTIVE1 (12) at 0x3a6bb
	db "EXECUTIVE@"
	db $00 ; data type
	db 33, HOUNDOUR
	db $ff ; end trainer party mons
	; last_address=0x3a6c9 size=14

	; GRUNT12 (13) at 0x3a6c9
	db "GRUNT@"
	db $00 ; data type
	db 27, RATTATA
	db $ff ; end trainer party mons
	; last_address=0x3a6d3 size=10

	; GRUNT13 (14) at 0x3a6d3
	db "GRUNT@"
	db $00 ; data type
	db 24, RATICATE
	db 24, GOLBAT
	db $ff ; end trainer party mons
	; last_address=0x3a6df size=12

	; GRUNT14 (15) at 0x3a6df
	db "GRUNT@"
	db $00 ; data type
	db 26, GRIMER
	db 23, WEEZING
	db $ff ; end trainer party mons
	; last_address=0x3a6eb size=12

	; GRUNT15 (16) at 0x3a6eb
	db "GRUNT@"
	db $00 ; data type
	db 16, RATTATA
	db 16, RATTATA
	db 16, RATTATA
	db 16, RATTATA
	db $ff ; end trainer party mons
	; last_address=0x3a6fb size=16

	; GRUNT16 (17) at 0x3a6fb
	db "GRUNT@"
	db $00 ; data type
	db 18, GOLBAT
	db $ff ; end trainer party mons
	; last_address=0x3a705 size=10

	; GRUNT17 (18) at 0x3a705
	db "GRUNT@"
	db $00 ; data type
	db 17, RATTATA
	db 17, ZUBAT
	db 17, RATTATA
	db $ff ; end trainer party mons
	; last_address=0x3a713 size=14

	; GRUNT18 (19) at 0x3a713
	db "GRUNT@"
	db $00 ; data type
	db 18, VENONAT
	db 18, VENONAT
	db $ff ; end trainer party mons
	; last_address=0x3a71f size=12

	; GRUNT19 (20) at 0x3a71f
	db "GRUNT@"
	db $00 ; data type
	db 17, DROWZEE
	db 19, ZUBAT
	db $ff ; end trainer party mons
	; last_address=0x3a72b size=12

	; GRUNT20 (21) at 0x3a72b
	db "GRUNT@"
	db $00 ; data type
	db 16, ZUBAT
	db 17, GRIMER
	db 18, RATTATA
	db $ff ; end trainer party mons
	; last_address=0x3a739 size=14

	; GRUNT_EXECUTIVE2 (22) at 0x3a739
	db "EXECUTIVE@"
	db $00 ; data type
	db 36, GOLBAT
	db $ff ; end trainer party mons
	; last_address=0x3a747 size=14

	; GRUNT_EXECUTIVE3 (23) at 0x3a747
	db "EXECUTIVE@"
	db $00 ; data type
	db 30, KOFFING
	db $ff ; end trainer party mons
	; last_address=0x3a755 size=14

	; GRUNT21 (24) at 0x3a755
	db "GRUNT@"
	db $00 ; data type
	db 25, KOFFING
	db 25, KOFFING
	db $ff ; end trainer party mons
	; last_address=0x3a761 size=12

	; GRUNT22 (25) at 0x3a761
	db "GRUNT@"
	db $00 ; data type
	db 24, KOFFING
	db 24, MUK
	db $ff ; end trainer party mons
	; last_address=0x3a76d size=12

	; GRUNT23 (26) at 0x3a76d
	db "GRUNT@"
	db $00 ; data type
	db 15, RATTATA
	db 15, RATTATA
	db $ff ; end trainer party mons
	; last_address=0x3a779 size=12

	; GRUNT_EXECUTIVE4 (27) at 0x3a779
	db "EXECUTIVE@"
	db $00 ; data type
	db 22, ZUBAT
	db $ff ; end trainer party mons
	; last_address=0x3a787 size=14

	; GRUNT24 (28) at 0x3a787
	db "GRUNT@"
	db $00 ; data type
	db 19, RATICATE
	db $ff ; end trainer party mons
	; last_address=0x3a791 size=10

	; GRUNT25 (29) at 0x3a791
	db "GRUNT@"
	db $00 ; data type
	db 9, RATTATA
	db 9, RATTATA
	db $ff ; end trainer party mons
	; last_address=0x3a79d size=12

	; GRUNT26 (30) at 0x3a79d
	db "GRUNT@"
	db $00 ; data type
	db 25, GOLBAT
	db 25, GOLBAT
	db 30, ARBOK
	db $ff ; end trainer party mons
	; last_address=0x3a7ab size=14

	; GRUNT27 (31) at 0x3a7ab
	db "GRUNT@"
	db $00 ; data type
	db 30, GOLBAT
	db $ff ; end trainer party mons
	; last_address=0x3a7b5 size=10
; 0x3a7b5

GentlemanGroup: ; 0x3a7b5
	; PRESTON (1) at 0x3a7b5
	db "PRESTON@"
	db $00 ; data type
	db 18, GROWLITHE
	db 18, GROWLITHE
	db $ff ; end trainer party mons
	; last_address=0x3a7c3 size=14

	; EDWARD (2) at 0x3a7c3
	db "EDWARD@"
	db $00 ; data type
	db 33, PERSIAN
	db $ff ; end trainer party mons
	; last_address=0x3a7ce size=11

	; GREGORY (3) at 0x3a7ce
	db "GREGORY@"
	db $00 ; data type
	db 37, PIKACHU
	db 33, FLAAFFY
	db $ff ; end trainer party mons
	; last_address=0x3a7dc size=14

	; VIRGIL (4) at 0x3a7dc
	db "VIRGIL@"
	db $00 ; data type
	db 20, PONYTA
	db $ff ; end trainer party mons
	; last_address=0x3a7e7 size=11

	; ALFRED (5) at 0x3a7e7
	db "ALFRED@"
	db $00 ; data type
	db 20, NOCTOWL
	db $ff ; end trainer party mons
	; last_address=0x3a7f2 size=11
; 0x3a7f2

SkierGroup: ; 0x3a7f2
	; ROXANNE (1) at 0x3a7f2
	db "ROXANNE@"
	db $00 ; data type
	db 28, JYNX
	db $ff ; end trainer party mons
	; last_address=0x3a7fe size=12

	; CLARISSA (2) at 0x3a7fe
	db "CLARISSA@"
	db $00 ; data type
	db 28, DEWGONG
	db $ff ; end trainer party mons
	; last_address=0x3a80b size=13
; 0x3a80b

TeacherGroup: ; 0x3a80b
	; COLETTE (1) at 0x3a80b
	db "COLETTE@"
	db $00 ; data type
	db 36, CLEFAIRY
	db $ff ; end trainer party mons
	; last_address=0x3a817 size=12

	; HILLARY (2) at 0x3a817
	db "HILLARY@"
	db $00 ; data type
	db 32, AIPOM
	db 36, CUBONE
	db $ff ; end trainer party mons
	; last_address=0x3a825 size=14

	; SHIRLEY (3) at 0x3a825
	db "SHIRLEY@"
	db $00 ; data type
	db 35, JIGGLYPUFF
	db $ff ; end trainer party mons
	; last_address=0x3a831 size=12
; 0x3a831

SabrinaGroup: ; 0x3a831
	; SABRINA (1) at 0x3a831
	db "SABRINA@"
	db $01 ; data type
	db 46, ESPEON, SAND_ATTACK, QUICK_ATTACK, SWIFT, PSYCHIC_M
	db 46, MR__MIME, BARRIER, REFLECT, BATON_PASS, PSYCHIC_M
	db 48, ALAKAZAM, RECOVER, FUTURE_SIGHT, PSYCHIC_M, REFLECT
	db $ff ; end trainer party mons
	; last_address=0x3a84d size=28
; 0x3a84d

BugCatcherGroup: ; 0x3a84d
	; DON (1) at 0x3a84d
	db "DON@"
	db $00 ; data type
	db 3, CATERPIE
	db 3, CATERPIE
	db $ff ; end trainer party mons
	; last_address=0x3a857 size=10

	; ROB (2) at 0x3a857
	db "ROB@"
	db $00 ; data type
	db 32, BEEDRILL
	db 32, BUTTERFREE
	db $ff ; end trainer party mons
	; last_address=0x3a861 size=10

	; ED (3) at 0x3a861
	db "ED@"
	db $00 ; data type
	db 30, BEEDRILL
	db 30, BEEDRILL
	db 30, BEEDRILL
	db $ff ; end trainer party mons
	; last_address=0x3a86c size=11

	; WADE1 (4) at 0x3a86c
	db "WADE@"
	db $00 ; data type
	db 2, CATERPIE
	db 2, CATERPIE
	db 3, WEEDLE
	db 2, CATERPIE
	db $ff ; end trainer party mons
	; last_address=0x3a87b size=15

	; BUG_CATCHER_BENNY (5) at 0x3a87b
	db "BENNY@"
	db $00 ; data type
	db 7, WEEDLE
	db 9, KAKUNA
	db 12, BEEDRILL
	db $ff ; end trainer party mons
	; last_address=0x3a889 size=14

	; AL (6) at 0x3a889
	db "AL@"
	db $00 ; data type
	db 12, CATERPIE
	db 12, WEEDLE
	db $ff ; end trainer party mons
	; last_address=0x3a892 size=9

	; JOSH (7) at 0x3a892
	db "JOSH@"
	db $00 ; data type
	db 13, PARAS
	db $ff ; end trainer party mons
	; last_address=0x3a89b size=9

	; ARNIE1 (8) at 0x3a89b
	db "ARNIE@"
	db $00 ; data type
	db 15, VENONAT
	db $ff ; end trainer party mons
	; last_address=0x3a8a5 size=10

	; KEN (9) at 0x3a8a5
	db "KEN@"
	db $00 ; data type
	db 30, ARIADOS
	db 32, PINSIR
	db $ff ; end trainer party mons
	; last_address=0x3a8af size=10

	; WADE2 (10) at 0x3a8af
	db "WADE@"
	db $00 ; data type
	db 9, METAPOD
	db 9, METAPOD
	db 10, KAKUNA
	db 9, METAPOD
	db $ff ; end trainer party mons
	; last_address=0x3a8be size=15

	; WADE3 (11) at 0x3a8be
	db "WADE@"
	db $00 ; data type
	db 14, BUTTERFREE
	db 14, BUTTERFREE
	db 15, BEEDRILL
	db 14, BUTTERFREE
	db $ff ; end trainer party mons
	; last_address=0x3a8cd size=15

	; DOUG (12) at 0x3a8cd
	db "DOUG@"
	db $00 ; data type
	db 34, ARIADOS
	db $ff ; end trainer party mons
	; last_address=0x3a8d6 size=9

	; ARNIE2 (13) at 0x3a8d6
	db "ARNIE@"
	db $00 ; data type
	db 19, VENONAT
	db $ff ; end trainer party mons
	; last_address=0x3a8e0 size=10

	; ARNIE3 (14) at 0x3a8e0
	db "ARNIE@"
	db $01 ; data type
	db 28, VENOMOTH, DISABLE, SUPERSONIC, CONFUSION, LEECH_LIFE
	db $ff ; end trainer party mons
	; last_address=0x3a8ee size=14

	; WADE4 (15) at 0x3a8ee
	db "WADE@"
	db $01 ; data type
	db 24, BUTTERFREE, CONFUSION, POISONPOWDER, SUPERSONIC, WHIRLWIND
	db 24, BUTTERFREE, CONFUSION, STUN_SPORE, SUPERSONIC, WHIRLWIND
	db 25, BEEDRILL, FURY_ATTACK, FOCUS_ENERGY, TWINEEDLE, RAGE
	db 24, BUTTERFREE, CONFUSION, SLEEP_POWDER, SUPERSONIC, WHIRLWIND
	db $ff ; end trainer party mons
	; last_address=0x3a90d size=31

	; WADE5 (16) at 0x3a90d
	db "WADE@"
	db $01 ; data type
	db 30, BUTTERFREE, CONFUSION, POISONPOWDER, SUPERSONIC, GUST
	db 30, BUTTERFREE, CONFUSION, STUN_SPORE, SUPERSONIC, GUST
	db 32, BEEDRILL, FURY_ATTACK, PURSUIT, TWINEEDLE, DOUBLE_TEAM
	db 34, BUTTERFREE, PSYBEAM, SLEEP_POWDER, GUST, WHIRLWIND
	db $ff ; end trainer party mons
	; last_address=0x3a92c size=31

	; ARNIE4 (17) at 0x3a92c
	db "ARNIE@"
	db $01 ; data type
	db 36, VENOMOTH, GUST, SUPERSONIC, PSYBEAM, LEECH_LIFE
	db $ff ; end trainer party mons
	; last_address=0x3a93a size=14

	; ARNIE5 (18) at 0x3a93a
	db "ARNIE@"
	db $01 ; data type
	db 40, VENOMOTH, GUST, SUPERSONIC, PSYCHIC_M, TOXIC
	db $ff ; end trainer party mons
	; last_address=0x3a948 size=14

	; WAYNE (19) at 0x3a948
	db "WAYNE@"
	db $00 ; data type
	db 8, LEDYBA
	db 10, PARAS
	db $ff ; end trainer party mons
	; last_address=0x3a954 size=12
; 0x3a954

FisherGroup: ; 0x3a954
	; JUSTIN (1) at 0x3a954
	db "JUSTIN@"
	db $00 ; data type
	db 5, MAGIKARP
	db 5, MAGIKARP
	db 15, MAGIKARP
	db 5, MAGIKARP
	db $ff ; end trainer party mons
	; last_address=0x3a965 size=17

	; RALPH1 (2) at 0x3a965
	db "RALPH@"
	db $00 ; data type
	db 10, GOLDEEN
	db $ff ; end trainer party mons
	; last_address=0x3a96f size=10

	; ARNOLD (3) at 0x3a96f
	db "ARNOLD@"
	db $00 ; data type
	db 34, TENTACRUEL
	db $ff ; end trainer party mons
	; last_address=0x3a97a size=11

	; KYLE (4) at 0x3a97a
	db "KYLE@"
	db $00 ; data type
	db 28, SEAKING
	db 31, POLIWHIRL
	db 31, SEAKING
	db $ff ; end trainer party mons
	; last_address=0x3a987 size=13

	; HENRY (5) at 0x3a987
	db "HENRY@"
	db $00 ; data type
	db 8, POLIWAG
	db 8, POLIWAG
	db $ff ; end trainer party mons
	; last_address=0x3a993 size=12

	; MARVIN (6) at 0x3a993
	db "MARVIN@"
	db $00 ; data type
	db 10, MAGIKARP
	db 10, GYARADOS
	db 15, MAGIKARP
	db 15, GYARADOS
	db $ff ; end trainer party mons
	; last_address=0x3a9a4 size=17

	; TULLY1 (7) at 0x3a9a4
	db "TULLY@"
	db $00 ; data type
	db 18, QWILFISH
	db $ff ; end trainer party mons
	; last_address=0x3a9ae size=10

	; ANDRE (8) at 0x3a9ae
	db "ANDRE@"
	db $00 ; data type
	db 27, GYARADOS
	db $ff ; end trainer party mons
	; last_address=0x3a9b8 size=10

	; RAYMOND (9) at 0x3a9b8
	db "RAYMOND@"
	db $00 ; data type
	db 22, MAGIKARP
	db 22, MAGIKARP
	db 22, MAGIKARP
	db 22, MAGIKARP
	db $ff ; end trainer party mons
	; last_address=0x3a9ca size=18

	; WILTON1 (10) at 0x3a9ca
	db "WILTON@"
	db $00 ; data type
	db 23, GOLDEEN
	db 23, GOLDEEN
	db 25, SEAKING
	db $ff ; end trainer party mons
	; last_address=0x3a9d9 size=15

	; EDGAR (11) at 0x3a9d9
	db "EDGAR@"
	db $01 ; data type
	db 25, REMORAID, LOCK_ON, PSYBEAM, AURORA_BEAM, BUBBLEBEAM
	db 25, REMORAID, LOCK_ON, PSYBEAM, AURORA_BEAM, BUBBLEBEAM
	db $ff ; end trainer party mons
	; last_address=0x3a9ed size=20

	; JONAH (12) at 0x3a9ed
	db "JONAH@"
	db $00 ; data type
	db 25, SHELLDER
	db 29, OCTILLERY
	db 25, REMORAID
	db 29, CLOYSTER
	db $ff ; end trainer party mons
	; last_address=0x3a9fd size=16

	; MARTIN (13) at 0x3a9fd
	db "MARTIN@"
	db $00 ; data type
	db 32, REMORAID
	db 32, REMORAID
	db $ff ; end trainer party mons
	; last_address=0x3aa0a size=13

	; STEPHEN (14) at 0x3aa0a
	db "STEPHEN@"
	db $00 ; data type
	db 25, MAGIKARP
	db 25, MAGIKARP
	db 31, QWILFISH
	db 31, TENTACRUEL
	db $ff ; end trainer party mons
	; last_address=0x3aa1c size=18

	; BARNEY (15) at 0x3aa1c
	db "BARNEY@"
	db $00 ; data type
	db 30, GYARADOS
	db 30, GYARADOS
	db 30, GYARADOS
	db $ff ; end trainer party mons
	; last_address=0x3aa2b size=15

	; RALPH2 (16) at 0x3aa2b
	db "RALPH@"
	db $00 ; data type
	db 17, GOLDEEN
	db $ff ; end trainer party mons
	; last_address=0x3aa35 size=10

	; RALPH3 (17) at 0x3aa35
	db "RALPH@"
	db $00 ; data type
	db 17, QWILFISH
	db 19, GOLDEEN
	db $ff ; end trainer party mons
	; last_address=0x3aa41 size=12

	; TULLY2 (18) at 0x3aa41
	db "TULLY@"
	db $00 ; data type
	db 23, QWILFISH
	db $ff ; end trainer party mons
	; last_address=0x3aa4b size=10

	; TULLY3 (19) at 0x3aa4b
	db "TULLY@"
	db $00 ; data type
	db 32, GOLDEEN
	db 32, GOLDEEN
	db 32, QWILFISH
	db $ff ; end trainer party mons
	; last_address=0x3aa59 size=14

	; WILTON2 (20) at 0x3aa59
	db "WILTON@"
	db $00 ; data type
	db 29, GOLDEEN
	db 29, GOLDEEN
	db 32, SEAKING
	db $ff ; end trainer party mons
	; last_address=0x3aa68 size=15

	; SCOTT (21) at 0x3aa68
	db "SCOTT@"
	db $00 ; data type
	db 30, QWILFISH
	db 30, QWILFISH
	db 34, SEAKING
	db $ff ; end trainer party mons
	; last_address=0x3aa76 size=14

	; WILTON3 (22) at 0x3aa76
	db "WILTON@"
	db $01 ; data type
	db 34, SEAKING, SUPERSONIC, WATERFALL, FLAIL, FURY_ATTACK
	db 34, SEAKING, SUPERSONIC, WATERFALL, FLAIL, FURY_ATTACK
	db 38, REMORAID, PSYBEAM, AURORA_BEAM, BUBBLEBEAM, HYPER_BEAM
	db $ff ; end trainer party mons
	; last_address=0x3aa91 size=27

	; RALPH4 (23) at 0x3aa91
	db "RALPH@"
	db $00 ; data type
	db 30, QWILFISH
	db 32, GOLDEEN
	db $ff ; end trainer party mons
	; last_address=0x3aa9d size=12

	; RALPH5 (24) at 0x3aa9d
	db "RALPH@"
	db $01 ; data type
	db 35, QWILFISH, TOXIC, MINIMIZE, SURF, PIN_MISSILE
	db 39, SEAKING, ENDURE, FLAIL, FURY_ATTACK, WATERFALL
	db $ff ; end trainer party mons
	; last_address=0x3aab1 size=20

	; TULLY4 (25) at 0x3aab1
	db "TULLY@"
	db $01 ; data type
	db 34, SEAKING, SUPERSONIC, RAIN_DANCE, WATERFALL, FURY_ATTACK
	db 34, SEAKING, SUPERSONIC, RAIN_DANCE, WATERFALL, FURY_ATTACK
	db 37, QWILFISH, ROLLOUT, SURF, PIN_MISSILE, TAKE_DOWN
	db $ff ; end trainer party mons
	; last_address=0x3aacb size=26
; 0x3aacb

SwimmerMGroup: ; 0x3aacb
	; HAROLD (1) at 0x3aacb
	db "HAROLD@"
	db $00 ; data type
	db 32, REMORAID
	db 30, SEADRA
	db $ff ; end trainer party mons
	; last_address=0x3aad8 size=13

	; SIMON (2) at 0x3aad8
	db "SIMON@"
	db $00 ; data type
	db 20, TENTACOOL
	db 20, TENTACOOL
	db $ff ; end trainer party mons
	; last_address=0x3aae4 size=12

	; RANDALL (3) at 0x3aae4
	db "RANDALL@"
	db $00 ; data type
	db 18, SHELLDER
	db 20, WARTORTLE
	db 18, SHELLDER
	db $ff ; end trainer party mons
	; last_address=0x3aaf4 size=16

	; CHARLIE (4) at 0x3aaf4
	db "CHARLIE@"
	db $00 ; data type
	db 21, SHELLDER
	db 19, TENTACOOL
	db 19, TENTACRUEL
	db $ff ; end trainer party mons
	; last_address=0x3ab04 size=16

	; GEORGE (5) at 0x3ab04
	db "GEORGE@"
	db $00 ; data type
	db 16, TENTACOOL
	db 17, TENTACOOL
	db 16, TENTACOOL
	db 19, STARYU
	db 17, TENTACOOL
	db 19, REMORAID
	db $ff ; end trainer party mons
	; last_address=0x3ab19 size=21

	; BERKE (6) at 0x3ab19
	db "BERKE@"
	db $00 ; data type
	db 23, QWILFISH
	db $ff ; end trainer party mons
	; last_address=0x3ab23 size=10

	; KIRK (7) at 0x3ab23
	db "KIRK@"
	db $00 ; data type
	db 20, GYARADOS
	db 20, GYARADOS
	db $ff ; end trainer party mons
	; last_address=0x3ab2e size=11

	; MATHEW (8) at 0x3ab2e
	db "MATHEW@"
	db $00 ; data type
	db 23, KRABBY
	db $ff ; end trainer party mons
	; last_address=0x3ab39 size=11

	; HAL (9) at 0x3ab39
	db "HAL@"
	db $00 ; data type
	db 24, SEEL
	db 25, DEWGONG
	db 24, SEEL
	db $ff ; end trainer party mons
	; last_address=0x3ab45 size=12

	; PATON (10) at 0x3ab45
	db "PATON@"
	db $00 ; data type
	db 26, PILOSWINE
	db 26, PILOSWINE
	db $ff ; end trainer party mons
	; last_address=0x3ab51 size=12

	; DARYL (11) at 0x3ab51
	db "DARYL@"
	db $00 ; data type
	db 24, SHELLDER
	db 25, CLOYSTER
	db 24, SHELLDER
	db $ff ; end trainer party mons
	; last_address=0x3ab5f size=14

	; WALTER (12) at 0x3ab5f
	db "WALTER@"
	db $00 ; data type
	db 15, HORSEA
	db 15, HORSEA
	db 20, SEADRA
	db $ff ; end trainer party mons
	; last_address=0x3ab6e size=15

	; TONY (13) at 0x3ab6e
	db "TONY@"
	db $00 ; data type
	db 13, STARYU
	db 18, STARMIE
	db 16, HORSEA
	db $ff ; end trainer party mons
	; last_address=0x3ab7b size=13

	; JEROME (14) at 0x3ab7b
	db "JEROME@"
	db $00 ; data type
	db 26, SEADRA
	db 28, TENTACOOL
	db 30, TENTACRUEL
	db 28, GOLDEEN
	db $ff ; end trainer party mons
	; last_address=0x3ab8c size=17

	; TUCKER (15) at 0x3ab8c
	db "TUCKER@"
	db $00 ; data type
	db 30, SHELLDER
	db 34, CLOYSTER
	db $ff ; end trainer party mons
	; last_address=0x3ab99 size=13

	; RICK (16) at 0x3ab99
	db "RICK@"
	db $00 ; data type
	db 13, STARYU
	db 18, STARMIE
	db 16, HORSEA
	db $ff ; end trainer party mons
	; last_address=0x3aba6 size=13

	; CAMERON (17) at 0x3aba6
	db "CAMERON@"
	db $00 ; data type
	db 34, MARILL
	db $ff ; end trainer party mons
	; last_address=0x3abb2 size=12

	; SETH (18) at 0x3abb2
	db "SETH@"
	db $00 ; data type
	db 29, QUAGSIRE
	db 29, OCTILLERY
	db 32, QUAGSIRE
	db $ff ; end trainer party mons
	; last_address=0x3abbf size=13

	; JAMES (19) at 0x3abbf
	db "JAMES@"
	db $00 ; data type
	db 13, STARYU
	db 18, STARMIE
	db 16, HORSEA
	db $ff ; end trainer party mons
	; last_address=0x3abcd size=14

	; LEWIS (20) at 0x3abcd
	db "LEWIS@"
	db $00 ; data type
	db 13, STARYU
	db 18, STARMIE
	db 16, HORSEA
	db $ff ; end trainer party mons
	; last_address=0x3abdb size=14

	; PARKER (21) at 0x3abdb
	db "PARKER@"
	db $00 ; data type
	db 32, HORSEA
	db 32, HORSEA
	db 35, SEADRA
	db $ff ; end trainer party mons
	; last_address=0x3abea size=15
; 0x3abea

SwimmerFGroup: ; 0x3abea
	; ELAINE (1) at 0x3abea
	db "ELAINE@"
	db $00 ; data type
	db 21, STARYU
	db $ff ; end trainer party mons
	; last_address=0x3abf5 size=11

	; PAULA (2) at 0x3abf5
	db "PAULA@"
	db $00 ; data type
	db 19, STARYU
	db 19, SHELLDER
	db $ff ; end trainer party mons
	; last_address=0x3ac01 size=12

	; KAYLEE (3) at 0x3ac01
	db "KAYLEE@"
	db $00 ; data type
	db 18, GOLDEEN
	db 20, GOLDEEN
	db 20, SEAKING
	db $ff ; end trainer party mons
	; last_address=0x3ac10 size=15

	; SUSIE (4) at 0x3ac10
	db "SUSIE@"
	db $01 ; data type
	db 20, PSYDUCK, SCRATCH, TAIL_WHIP, DISABLE, CONFUSION
	db 22, GOLDEEN, PECK, TAIL_WHIP, SUPERSONIC, HORN_ATTACK
	db $ff ; end trainer party mons
	; last_address=0x3ac24 size=20

	; DENISE (5) at 0x3ac24
	db "DENISE@"
	db $00 ; data type
	db 22, SEEL
	db $ff ; end trainer party mons
	; last_address=0x3ac2f size=11

	; KARA (6) at 0x3ac2f
	db "KARA@"
	db $00 ; data type
	db 20, STARYU
	db 20, STARMIE
	db $ff ; end trainer party mons
	; last_address=0x3ac3a size=11

	; WENDY (7) at 0x3ac3a
	db "WENDY@"
	db $01 ; data type
	db 21, HORSEA, BUBBLE, SMOKESCREEN, LEER, WATER_GUN
	db 21, HORSEA, DRAGON_RAGE, SMOKESCREEN, LEER, WATER_GUN
	db $ff ; end trainer party mons
	; last_address=0x3ac4e size=20

	; LISA (8) at 0x3ac4e
	db "LISA@"
	db $00 ; data type
	db 28, JYNX
	db $ff ; end trainer party mons
	; last_address=0x3ac57 size=9

	; JILL (9) at 0x3ac57
	db "JILL@"
	db $00 ; data type
	db 28, DEWGONG
	db $ff ; end trainer party mons
	; last_address=0x3ac60 size=9

	; MARY (10) at 0x3ac60
	db "MARY@"
	db $00 ; data type
	db 20, SEAKING
	db $ff ; end trainer party mons
	; last_address=0x3ac69 size=9

	; KATIE (11) at 0x3ac69
	db "KATIE@"
	db $00 ; data type
	db 33, DEWGONG
	db $ff ; end trainer party mons
	; last_address=0x3ac73 size=10

	; DAWN (12) at 0x3ac73
	db "DAWN@"
	db $00 ; data type
	db 34, SEAKING
	db $ff ; end trainer party mons
	; last_address=0x3ac7c size=9

	; TARA (13) at 0x3ac7c
	db "TARA@"
	db $00 ; data type
	db 20, SEAKING
	db $ff ; end trainer party mons
	; last_address=0x3ac85 size=9

	; NICOLE (14) at 0x3ac85
	db "NICOLE@"
	db $00 ; data type
	db 29, MARILL
	db 29, MARILL
	db 32, LAPRAS
	db $ff ; end trainer party mons
	; last_address=0x3ac94 size=15

	; LORI (15) at 0x3ac94
	db "LORI@"
	db $00 ; data type
	db 32, STARMIE
	db 32, STARMIE
	db $ff ; end trainer party mons
	; last_address=0x3ac9f size=11

	; JODY (16) at 0x3ac9f
	db "JODY@"
	db $00 ; data type
	db 20, SEAKING
	db $ff ; end trainer party mons
	; last_address=0x3aca8 size=9

	; NIKKI (17) at 0x3aca8
	db "NIKKI@"
	db $00 ; data type
	db 28, SEEL
	db 28, SEEL
	db 28, SEEL
	db 28, DEWGONG
	db $ff ; end trainer party mons
	; last_address=0x3acb8 size=16

	; DIANA (18) at 0x3acb8
	db "DIANA@"
	db $00 ; data type
	db 37, GOLDUCK
	db $ff ; end trainer party mons
	; last_address=0x3acc2 size=10

	; BRIANA (19) at 0x3acc2
	db "BRIANA@"
	db $00 ; data type
	db 35, SEAKING
	db 35, SEAKING
	db $ff ; end trainer party mons
	; last_address=0x3accf size=13
; 0x3accf

SailorGroup: ; 0x3accf
	; EUGENE (1) at 0x3accf
	db "EUGENE@"
	db $00 ; data type
	db 17, POLIWHIRL
	db 17, RATICATE
	db 19, KRABBY
	db $ff ; end trainer party mons
	; last_address=0x3acde size=15

	; HUEY1 (2) at 0x3acde
	db "HUEY@"
	db $00 ; data type
	db 18, POLIWAG
	db 18, POLIWHIRL
	db $ff ; end trainer party mons
	; last_address=0x3ace9 size=11

	; TERRELL (3) at 0x3ace9
	db "TERRELL@"
	db $00 ; data type
	db 20, POLIWHIRL
	db $ff ; end trainer party mons
	; last_address=0x3acf5 size=12

	; KENT (4) at 0x3acf5
	db "KENT@"
	db $01 ; data type
	db 18, KRABBY, BUBBLE, LEER, VICEGRIP, HARDEN
	db 20, KRABBY, BUBBLEBEAM, LEER, VICEGRIP, HARDEN
	db $ff ; end trainer party mons
	; last_address=0x3ad08 size=19

	; ERNEST (5) at 0x3ad08
	db "ERNEST@"
	db $00 ; data type
	db 18, MACHOP
	db 18, MACHOP
	db 18, POLIWHIRL
	db $ff ; end trainer party mons
	; last_address=0x3ad17 size=15

	; JEFF (6) at 0x3ad17
	db "JEFF@"
	db $00 ; data type
	db 32, RATICATE
	db 32, RATICATE
	db $ff ; end trainer party mons
	; last_address=0x3ad22 size=11

	; GARRETT (7) at 0x3ad22
	db "GARRETT@"
	db $00 ; data type
	db 34, KINGLER
	db $ff ; end trainer party mons
	; last_address=0x3ad2e size=12

	; KENNETH (8) at 0x3ad2e
	db "KENNETH@"
	db $00 ; data type
	db 28, MACHOP
	db 28, MACHOP
	db 28, POLIWRATH
	db 28, MACHOP
	db $ff ; end trainer party mons
	; last_address=0x3ad40 size=18

	; STANLY (9) at 0x3ad40
	db "STANLY@"
	db $00 ; data type
	db 31, MACHOP
	db 33, MACHOKE
	db 26, PSYDUCK
	db $ff ; end trainer party mons
	; last_address=0x3ad4f size=15

	; HARRY (10) at 0x3ad4f
	db "HARRY@"
	db $00 ; data type
	db 19, WOOPER
	db $ff ; end trainer party mons
	; last_address=0x3ad59 size=10

	; HUEY2 (11) at 0x3ad59
	db "HUEY@"
	db $00 ; data type
	db 28, POLIWHIRL
	db 28, POLIWHIRL
	db $ff ; end trainer party mons
	; last_address=0x3ad64 size=11

	; HUEY3 (12) at 0x3ad64
	db "HUEY@"
	db $00 ; data type
	db 34, POLIWHIRL
	db 34, POLIWRATH
	db $ff ; end trainer party mons
	; last_address=0x3ad6f size=11

	; HUEY4 (13) at 0x3ad6f
	db "HUEY@"
	db $01 ; data type
	db 38, POLITOED, WHIRLPOOL, RAIN_DANCE, BODY_SLAM, PERISH_SONG
	db 38, POLIWRATH, SURF, STRENGTH, ICE_PUNCH, SUBMISSION
	db $ff ; end trainer party mons
	; last_address=0x3ad82 size=19
; 0x3ad82

SuperNerdGroup: ; 0x3ad82
	; STAN (2) at 0x3ad82
	db "STAN@"
	db $00 ; data type
	db 20, GRIMER
	db $ff ; end trainer party mons
	; last_address=0x3ad8b size=9

	; ERIC (3) at 0x3ad8b
	db "ERIC@"
	db $00 ; data type
	db 11, GRIMER
	db 11, GRIMER
	db $ff ; end trainer party mons
	; last_address=0x3ad96 size=11

	; GREGG (4) at 0x3ad96
	db "GREGG@"
	db $00 ; data type
	db 20, MAGNEMITE
	db 20, MAGNEMITE
	db 20, MAGNEMITE
	db $ff ; end trainer party mons
	; last_address=0x3ada4 size=14

	; JAY (5) at 0x3ada4
	db "JAY@"
	db $00 ; data type
	db 22, KOFFING
	db 22, KOFFING
	db $ff ; end trainer party mons
	; last_address=0x3adae size=10

	; DAVE (6) at 0x3adae
	db "DAVE@"
	db $00 ; data type
	db 24, DITTO
	db $ff ; end trainer party mons
	; last_address=0x3adb7 size=9

	; SAM (7) at 0x3adb7
	db "SAM@"
	db $00 ; data type
	db 34, GRIMER
	db 34, MUK
	db $ff ; end trainer party mons
	; last_address=0x3adc1 size=10

	; TOM (8) at 0x3adc1
	db "TOM@"
	db $00 ; data type
	db 32, MAGNEMITE
	db 32, MAGNEMITE
	db 32, MAGNEMITE
	db $ff ; end trainer party mons
	; last_address=0x3adcd size=12

	; PAT (9) at 0x3adcd
	db "PAT@"
	db $00 ; data type
	db 36, PORYGON
	db $ff ; end trainer party mons
	; last_address=0x3add5 size=8

	; SHAWN (10) at 0x3add5
	db "SHAWN@"
	db $00 ; data type
	db 31, MAGNEMITE
	db 33, MUK
	db 31, MAGNEMITE
	db $ff ; end trainer party mons
	; last_address=0x3ade3 size=14

	; TERU (11) at 0x3ade3
	db "TERU@"
	db $00 ; data type
	db 7, MAGNEMITE
	db 11, VOLTORB
	db 7, MAGNEMITE
	db 9, MAGNEMITE
	db $ff ; end trainer party mons
	; last_address=0x3adf2 size=15

	; RUSS (12) at 0x3adf2
	db "RUSS@"
	db $00 ; data type
	db 27, MAGNEMITE
	db 27, MAGNEMITE
	db 27, MAGNEMITE
	db $ff ; end trainer party mons
	; last_address=0x3adff size=13

	; NORTON (13) at 0x3adff
	db "NORTON@"
	db $01 ; data type
	db 30, PORYGON, CONVERSION, CONVERSION2, RECOVER, TRI_ATTACK
	db $ff ; end trainer party mons
	; last_address=0x3ae0e size=15

	; HUGH (14) at 0x3ae0e
	db "HUGH@"
	db $01 ; data type
	db 39, SEADRA, SMOKESCREEN, TWISTER, SURF, WATERFALL
	db $ff ; end trainer party mons
	; last_address=0x3ae1b size=13

	; MARKUS (15) at 0x3ae1b
	db "MARKUS@"
	db $01 ; data type
	db 19, SLOWPOKE, CURSE, WATER_GUN, GROWL, STRENGTH
	db $ff ; end trainer party mons
	; last_address=0x3ae2a size=15
; 0x3ae2a

Rival2Group: ; 0x3ae2a
	; RIVAL2_1 (1) at 0x3ae2a
	db "?@"
	db $01 ; data type
	db 41, SNEASEL, QUICK_ATTACK, SCREECH, FAINT_ATTACK, FURY_CUTTER
	db 42, GOLBAT, LEECH_LIFE, BITE, CONFUSE_RAY, WING_ATTACK
	db 41, MAGNETON, THUNDERSHOCK, SONICBOOM, THUNDER_WAVE, SWIFT
	db 43, GENGAR, MEAN_LOOK, CURSE, SHADOW_BALL, CONFUSE_RAY
	db 43, ALAKAZAM, DISABLE, RECOVER, FUTURE_SIGHT, PSYCHIC_M
	db 45, MEGANIUM, RAZOR_LEAF, POISONPOWDER, BODY_SLAM, LIGHT_SCREEN
	db $ff ; end trainer party mons
	; last_address=0x3ae52 size=40

	; RIVAL2_2 (2) at 0x3ae52
	db "?@"
	db $01 ; data type
	db 41, SNEASEL, QUICK_ATTACK, SCREECH, FAINT_ATTACK, FURY_CUTTER
	db 42, GOLBAT, LEECH_LIFE, BITE, CONFUSE_RAY, WING_ATTACK
	db 41, MAGNETON, THUNDERSHOCK, SONICBOOM, THUNDER_WAVE, SWIFT
	db 43, GENGAR, MEAN_LOOK, CURSE, SHADOW_BALL, CONFUSE_RAY
	db 43, ALAKAZAM, DISABLE, RECOVER, FUTURE_SIGHT, PSYCHIC_M
	db 45, TYPHLOSION, SMOKESCREEN, QUICK_ATTACK, FLAME_WHEEL, SWIFT
	db $ff ; end trainer party mons
	; last_address=0x3ae7a size=40

	; RIVAL2_3 (3) at 0x3ae7a
	db "?@"
	db $01 ; data type
	db 41, SNEASEL, QUICK_ATTACK, SCREECH, FAINT_ATTACK, FURY_CUTTER
	db 42, GOLBAT, LEECH_LIFE, BITE, CONFUSE_RAY, WING_ATTACK
	db 41, MAGNETON, THUNDERSHOCK, SONICBOOM, THUNDER_WAVE, SWIFT
	db 43, GENGAR, MEAN_LOOK, CURSE, SHADOW_BALL, CONFUSE_RAY
	db 43, ALAKAZAM, DISABLE, RECOVER, FUTURE_SIGHT, PSYCHIC_M
	db 45, FERALIGATR, RAGE, WATER_GUN, SCARY_FACE, SLASH
	db $ff ; end trainer party mons
	; last_address=0x3aea2 size=40

	; RIVAL2_4 (4) at 0x3aea2
	db "?@"
	db $01 ; data type
	db 45, SNEASEL, QUICK_ATTACK, SCREECH, FAINT_ATTACK, FURY_CUTTER
	db 48, CROBAT, TOXIC, BITE, CONFUSE_RAY, WING_ATTACK
	db 45, MAGNETON, THUNDER, SONICBOOM, THUNDER_WAVE, SWIFT
	db 46, GENGAR, MEAN_LOOK, CURSE, SHADOW_BALL, CONFUSE_RAY
	db 46, ALAKAZAM, RECOVER, FUTURE_SIGHT, PSYCHIC_M, REFLECT
	db 50, MEGANIUM, GIGA_DRAIN, BODY_SLAM, LIGHT_SCREEN, SAFEGUARD
	db $ff ; end trainer party mons
	; last_address=0x3aeca size=40

	; RIVAL2_5 (5) at 0x3aeca
	db "?@"
	db $01 ; data type
	db 45, SNEASEL, QUICK_ATTACK, SCREECH, FAINT_ATTACK, FURY_CUTTER
	db 48, CROBAT, TOXIC, BITE, CONFUSE_RAY, WING_ATTACK
	db 45, MAGNETON, THUNDER, SONICBOOM, THUNDER_WAVE, SWIFT
	db 46, GENGAR, MEAN_LOOK, CURSE, SHADOW_BALL, CONFUSE_RAY
	db 46, ALAKAZAM, RECOVER, FUTURE_SIGHT, PSYCHIC_M, REFLECT
	db 50, TYPHLOSION, SMOKESCREEN, QUICK_ATTACK, FIRE_BLAST, SWIFT
	db $ff ; end trainer party mons
	; last_address=0x3aef2 size=40

	; RIVAL2_6 (6) at 0x3aef2
	db "?@"
	db $01 ; data type
	db 45, SNEASEL, QUICK_ATTACK, SCREECH, FAINT_ATTACK, FURY_CUTTER
	db 48, CROBAT, TOXIC, BITE, CONFUSE_RAY, WING_ATTACK
	db 45, MAGNETON, THUNDER, SONICBOOM, THUNDER_WAVE, SWIFT
	db 46, GENGAR, MEAN_LOOK, CURSE, SHADOW_BALL, CONFUSE_RAY
	db 46, ALAKAZAM, RECOVER, FUTURE_SIGHT, PSYCHIC_M, REFLECT
	db 50, FERALIGATR, SURF, RAIN_DANCE, SLASH, SCREECH
	db $ff ; end trainer party mons
	; last_address=0x3af1a size=40
; 0x3af1a

GuitaristGroup: ; 0x3af1a
	; CLYDE (1) at 0x3af1a
	db "CLYDE@"
	db $00 ; data type
	db 34, ELECTABUZZ
	db $ff ; end trainer party mons
	; last_address=0x3af24 size=10

	; VINCENT (2) at 0x3af24
	db "VINCENT@"
	db $00 ; data type
	db 27, MAGNEMITE
	db 33, VOLTORB
	db 32, MAGNEMITE
	db 32, MAGNEMITE
	db $ff ; end trainer party mons
	; last_address=0x3af36 size=18
; 0x3af36

HikerGroup: ; 0x3af36
	; ANTHONY1 (1) at 0x3af36
	db "ANTHONY@"
	db $00 ; data type
	db 16, GEODUDE
	db 18, MACHAMP
	db $ff ; end trainer party mons
	; last_address=0x3af44 size=14

	; RUSSELL (2) at 0x3af44
	db "RUSSELL@"
	db $00 ; data type
	db 4, GEODUDE
	db 6, GEODUDE
	db 8, GEODUDE
	db $ff ; end trainer party mons
	; last_address=0x3af54 size=16

	; PHILLIP (3) at 0x3af54
	db "PHILLIP@"
	db $00 ; data type
	db 23, GEODUDE
	db 23, GEODUDE
	db 23, GRAVELER
	db $ff ; end trainer party mons
	; last_address=0x3af64 size=16

	; LEONARD (4) at 0x3af64
	db "LEONARD@"
	db $00 ; data type
	db 23, GEODUDE
	db 25, MACHOP
	db $ff ; end trainer party mons
	; last_address=0x3af72 size=14

	; ANTHONY2 (5) at 0x3af72
	db "ANTHONY@"
	db $00 ; data type
	db 11, GEODUDE
	db 11, MACHOP
	db $ff ; end trainer party mons
	; last_address=0x3af80 size=14

	; BENJAMIN (6) at 0x3af80
	db "BENJAMIN@"
	db $00 ; data type
	db 14, DIGLETT
	db 14, GEODUDE
	db 16, DUGTRIO
	db $ff ; end trainer party mons
	; last_address=0x3af91 size=17

	; ERIK (7) at 0x3af91
	db "ERIK@"
	db $00 ; data type
	db 24, MACHOP
	db 27, GRAVELER
	db 27, MACHOP
	db $ff ; end trainer party mons
	; last_address=0x3af9e size=13

	; MICHAEL (8) at 0x3af9e
	db "MICHAEL@"
	db $00 ; data type
	db 25, GEODUDE
	db 25, GRAVELER
	db 25, GOLEM
	db $ff ; end trainer party mons
	; last_address=0x3afae size=16

	; PARRY1 (9) at 0x3afae
	db "PARRY@"
	db $00 ; data type
	db 35, ONIX
	db 33, SWINUB
	db $ff ; end trainer party mons
	; last_address=0x3afba size=12

	; TIMOTHY (10) at 0x3afba
	db "TIMOTHY@"
	db $01 ; data type
	db 27, DIGLETT, MAGNITUDE, DIG, SAND_ATTACK, SLASH
	db 27, DUGTRIO, MAGNITUDE, DIG, SAND_ATTACK, SLASH
	db $ff ; end trainer party mons
	; last_address=0x3afd0 size=22

	; BAILEY (11) at 0x3afd0
	db "BAILEY@"
	db $00 ; data type
	db 13, GEODUDE
	db 13, GEODUDE
	db 13, GEODUDE
	db 13, GEODUDE
	db 13, GEODUDE
	db $ff ; end trainer party mons
	; last_address=0x3afe3 size=19

	; ANTHONY3 (12) at 0x3afe3
	db "ANTHONY@"
	db $00 ; data type
	db 25, GRAVELER
	db 27, GRAVELER
	db 29, MACHOKE
	db $ff ; end trainer party mons
	; last_address=0x3aff3 size=16

	; TIM (13) at 0x3aff3
	db "TIM@"
	db $00 ; data type
	db 31, GRAVELER
	db 31, GRAVELER
	db 31, GRAVELER
	db $ff ; end trainer party mons
	; last_address=0x3afff size=12

	; NOLAND (14) at 0x3afff
	db "NOLAND@"
	db $00 ; data type
	db 31, SANDSLASH
	db 33, GOLEM
	db $ff ; end trainer party mons
	; last_address=0x3b00c size=13

	; SIDNEY (15) at 0x3b00c
	db "SIDNEY@"
	db $00 ; data type
	db 34, DUGTRIO
	db 32, ONIX
	db $ff ; end trainer party mons
	; last_address=0x3b019 size=13

	; KENNY (16) at 0x3b019
	db "KENNY@"
	db $00 ; data type
	db 27, SANDSLASH
	db 29, GRAVELER
	db 31, GOLEM
	db 29, GRAVELER
	db $ff ; end trainer party mons
	; last_address=0x3b029 size=16

	; JIM (17) at 0x3b029
	db "JIM@"
	db $00 ; data type
	db 35, MACHAMP
	db $ff ; end trainer party mons
	; last_address=0x3b031 size=8

	; DANIEL (18) at 0x3b031
	db "DANIEL@"
	db $00 ; data type
	db 11, ONIX
	db $ff ; end trainer party mons
	; last_address=0x3b03c size=11

	; PARRY2 (19) at 0x3b03c
	db "PARRY@"
	db $01 ; data type
	db 35, PILOSWINE, EARTHQUAKE, BLIZZARD, REST, TAKE_DOWN
	db 35, DUGTRIO, MAGNITUDE, DIG, MUD_SLAP, SLASH
	db 38, STEELIX, DIG, IRON_TAIL, SANDSTORM, SLAM
	db $ff ; end trainer party mons
	; last_address=0x3b056 size=26

	; PARRY3 (20) at 0x3b056
	db "PARRY@"
	db $00 ; data type
	db 29, ONIX
	db $ff ; end trainer party mons
	; last_address=0x3b060 size=10

	; ANTHONY4 (21) at 0x3b060
	db "ANTHONY@"
	db $00 ; data type
	db 30, GRAVELER
	db 30, GRAVELER
	db 32, MACHOKE
	db $ff ; end trainer party mons
	; last_address=0x3b070 size=16

	; ANTHONY5 (22) at 0x3b070
	db "ANTHONY@"
	db $01 ; data type
	db 34, GRAVELER, MAGNITUDE, SELFDESTRUCT, DEFENSE_CURL, ROLLOUT
	db 36, GOLEM, MAGNITUDE, SELFDESTRUCT, DEFENSE_CURL, ROLLOUT
	db 34, MACHOKE, KARATE_CHOP, VITAL_THROW, HEADBUTT, DIG
	db $ff ; end trainer party mons
	; last_address=0x3b08c size=28
; 0x3b08c

BikerGroup: ; 0x3b08c
	; BIKER_BENNY (3) at 0x3b08c
	db "BENNY@"
	db $00 ; data type
	db 20, KOFFING
	db 20, KOFFING
	db 20, KOFFING
	db $ff ; end trainer party mons
	; last_address=0x3b09a size=14

	; KAZU (4) at 0x3b09a
	db "KAZU@"
	db $00 ; data type
	db 20, KOFFING
	db 20, KOFFING
	db 20, KOFFING
	db $ff ; end trainer party mons
	; last_address=0x3b0a7 size=13

	; DWAYNE (5) at 0x3b0a7
	db "DWAYNE@"
	db $00 ; data type
	db 27, KOFFING
	db 28, KOFFING
	db 29, KOFFING
	db 30, KOFFING
	db $ff ; end trainer party mons
	; last_address=0x3b0b8 size=17

	; HARRIS (6) at 0x3b0b8
	db "HARRIS@"
	db $00 ; data type
	db 34, FLAREON
	db $ff ; end trainer party mons
	; last_address=0x3b0c3 size=11

	; ZEKE (7) at 0x3b0c3
	db "ZEKE@"
	db $00 ; data type
	db 32, KOFFING
	db 32, KOFFING
	db $ff ; end trainer party mons
	; last_address=0x3b0ce size=11

	; CHARLES (8) at 0x3b0ce
	db "CHARLES@"
	db $00 ; data type
	db 30, KOFFING
	db 30, CHARMELEON
	db 30, WEEZING
	db $ff ; end trainer party mons
	; last_address=0x3b0de size=16

	; RILEY (9) at 0x3b0de
	db "RILEY@"
	db $00 ; data type
	db 34, WEEZING
	db $ff ; end trainer party mons
	; last_address=0x3b0e8 size=10

	; JOEL (10) at 0x3b0e8
	db "JOEL@"
	db $00 ; data type
	db 32, MAGMAR
	db 32, MAGMAR
	db $ff ; end trainer party mons
	; last_address=0x3b0f3 size=11

	; GLENN (11) at 0x3b0f3
	db "GLENN@"
	db $00 ; data type
	db 28, KOFFING
	db 30, MAGMAR
	db 32, WEEZING
	db $ff ; end trainer party mons
	; last_address=0x3b101 size=14
; 0x3b101

BlaineGroup: ; 0x3b101
	; BLAINE (1) at 0x3b101
	db "BLAINE@"
	db $01 ; data type
	db 45, MAGCARGO, CURSE, SMOG, FLAMETHROWER, ROCK_SLIDE
	db 45, MAGMAR, THUNDERPUNCH, FIRE_PUNCH, SUNNY_DAY, CONFUSE_RAY
	db 50, RAPIDASH, QUICK_ATTACK, FIRE_SPIN, FURY_ATTACK, FIRE_BLAST
	db $ff ; end trainer party mons
	; last_address=0x3b11c size=27
; 0x3b11c

BurglarGroup: ; 0x3b11c
	; DUNCAN (1) at 0x3b11c
	db "DUNCAN@"
	db $00 ; data type
	db 23, KOFFING
	db 25, MAGMAR
	db 23, KOFFING
	db $ff ; end trainer party mons
	; last_address=0x3b12b size=15

	; EDDIE (2) at 0x3b12b
	db "EDDIE@"
	db $01 ; data type
	db 26, GROWLITHE, ROAR, EMBER, LEER, TAKE_DOWN
	db 24, KOFFING, TACKLE, SMOG, SLUDGE, SMOKESCREEN
	db $ff ; end trainer party mons
	; last_address=0x3b13f size=20

	; COREY (3) at 0x3b13f
	db "COREY@"
	db $00 ; data type
	db 25, KOFFING
	db 28, MAGMAR
	db 25, KOFFING
	db 30, KOFFING
	db $ff ; end trainer party mons
	; last_address=0x3b14f size=16
; 0x3b14f

FirebreatherGroup: ; 0x3b14f
	; OTIS (1) at 0x3b14f
	db "OTIS@"
	db $00 ; data type
	db 29, MAGMAR
	db 32, WEEZING
	db 29, MAGMAR
	db $ff ; end trainer party mons
	; last_address=0x3b15c size=13

	; DICK (2) at 0x3b15c
	db "DICK@"
	db $00 ; data type
	db 17, CHARMELEON
	db $ff ; end trainer party mons
	; last_address=0x3b165 size=9

	; NED (3) at 0x3b165
	db "NED@"
	db $00 ; data type
	db 15, KOFFING
	db 16, GROWLITHE
	db 15, KOFFING
	db $ff ; end trainer party mons
	; last_address=0x3b171 size=12

	; BURT (4) at 0x3b171
	db "BURT@"
	db $00 ; data type
	db 32, KOFFING
	db 32, SLUGMA
	db $ff ; end trainer party mons
	; last_address=0x3b17c size=11

	; BILL (5) at 0x3b17c
	db "BILL@"
	db $00 ; data type
	db 6, KOFFING
	db 6, KOFFING
	db $ff ; end trainer party mons
	; last_address=0x3b187 size=11

	; WALT (6) at 0x3b187
	db "WALT@"
	db $00 ; data type
	db 11, MAGMAR
	db 13, MAGMAR
	db $ff ; end trainer party mons
	; last_address=0x3b192 size=11

	; RAY (7) at 0x3b192
	db "RAY@"
	db $00 ; data type
	db 9, VULPIX
	db $ff ; end trainer party mons
	; last_address=0x3b19a size=8

	; LYLE (8) at 0x3b19a
	db "LYLE@"
	db $00 ; data type
	db 28, KOFFING
	db 31, FLAREON
	db 28, KOFFING
	db $ff ; end trainer party mons
	; last_address=0x3b1a7 size=13
; 0x3b1a7

JugglerGroup: ; 0x3b1a7
	; IRWIN1 (1) at 0x3b1a7
	db "IRWIN@"
	db $00 ; data type
	db 2, VOLTORB
	db 6, VOLTORB
	db 10, VOLTORB
	db 14, VOLTORB
	db $ff ; end trainer party mons
	; last_address=0x3b1b7 size=16

	; FRITZ (2) at 0x3b1b7
	db "FRITZ@"
	db $00 ; data type
	db 29, MR__MIME
	db 29, MAGMAR
	db 29, MACHOKE
	db $ff ; end trainer party mons
	; last_address=0x3b1c5 size=14

	; HORTON (3) at 0x3b1c5
	db "HORTON@"
	db $00 ; data type
	db 33, ELECTRODE
	db 33, ELECTRODE
	db 33, ELECTRODE
	db 33, ELECTRODE
	db $ff ; end trainer party mons
	; last_address=0x3b1d6 size=17

	; IRWIN2 (4) at 0x3b1d6
	db "IRWIN@"
	db $00 ; data type
	db 6, VOLTORB
	db 10, VOLTORB
	db 14, VOLTORB
	db 18, VOLTORB
	db $ff ; end trainer party mons
	; last_address=0x3b1e6 size=16

	; IRWIN3 (5) at 0x3b1e6
	db "IRWIN@"
	db $00 ; data type
	db 18, VOLTORB
	db 22, VOLTORB
	db 26, VOLTORB
	db 30, ELECTRODE
	db $ff ; end trainer party mons
	; last_address=0x3b1f6 size=16

	; IRWIN4 (6) at 0x3b1f6
	db "IRWIN@"
	db $00 ; data type
	db 18, VOLTORB
	db 22, VOLTORB
	db 26, VOLTORB
	db 30, ELECTRODE
	db $ff ; end trainer party mons
	; last_address=0x3b206 size=16
; 0x3b206

BlackbeltGroup: ; 0x3b206
	; KENJI1 (2) at 0x3b206
	db "KENJI@"
	db $00 ; data type
	db 27, ONIX
	db 30, HITMONLEE
	db 27, ONIX
	db 32, MACHOKE
	db $ff ; end trainer party mons
	; last_address=0x3b216 size=16

	; YOSHI (3) at 0x3b216
	db "YOSHI@"
	db $01 ; data type
	db 27, HITMONLEE, DOUBLE_KICK, MEDITATE, JUMP_KICK, FOCUS_ENERGY
	db $ff ; end trainer party mons
	; last_address=0x3b224 size=14

	; KENJI2 (4) at 0x3b224
	db "KENJI@"
	db $01 ; data type
	db 33, ONIX, BIND, ROCK_THROW, TOXIC, DIG
	db 38, MACHAMP, HEADBUTT, SWAGGER, THUNDERPUNCH, VITAL_THROW
	db 33, STEELIX, EARTHQUAKE, ROCK_THROW, IRON_TAIL, SANDSTORM
	db 36, HITMONLEE, DOUBLE_TEAM, HI_JUMP_KICK, MUD_SLAP, SWIFT
	db $ff ; end trainer party mons
	; last_address=0x3b244 size=32

	; LAO (5) at 0x3b244
	db "LAO@"
	db $01 ; data type
	db 27, HITMONCHAN, COMET_PUNCH, THUNDERPUNCH, ICE_PUNCH, FIRE_PUNCH
	db $ff ; end trainer party mons
	; last_address=0x3b250 size=12

	; NOB (6) at 0x3b250
	db "NOB@"
	db $01 ; data type
	db 25, MACHOP, LEER, FOCUS_ENERGY, KARATE_CHOP, SEISMIC_TOSS
	db 25, MACHOKE, LEER, KARATE_CHOP, SEISMIC_TOSS, ROCK_SLIDE
	db $ff ; end trainer party mons
	; last_address=0x3b262 size=18

	; KIYO (7) at 0x3b262
	db "KIYO@"
	db $00 ; data type
	db 34, HITMONLEE
	db 34, HITMONCHAN
	db $ff ; end trainer party mons
	; last_address=0x3b26d size=11

	; LUNG (8) at 0x3b26d
	db "LUNG@"
	db $00 ; data type
	db 23, MANKEY
	db 23, MANKEY
	db 25, PRIMEAPE
	db $ff ; end trainer party mons
	; last_address=0x3b27a size=13

	; KENJI3 (9) at 0x3b27a
	db "KENJI@"
	db $00 ; data type
	db 28, MACHOKE
	db $ff ; end trainer party mons
	; last_address=0x3b284 size=10

	; WAI (10) at 0x3b284
	db "WAI@"
	db $00 ; data type
	db 30, MACHOKE
	db 32, MACHOKE
	db 34, MACHOKE
	db $ff ; end trainer party mons
	; last_address=0x3b290 size=12
; 0x3b290

ExecutiveMGroup: ; 0x3b290
	; EXECUTIVE1 (1) at 0x3b290
	db "EXECUTIVE@"
	db $01 ; data type
	db 33, HOUNDOUR, EMBER, ROAR, BITE, FAINT_ATTACK
	db 33, KOFFING, TACKLE, SLUDGE, SMOKESCREEN, HAZE
	db 35, HOUNDOOM, EMBER, SMOG, BITE, FAINT_ATTACK
	db $ff ; end trainer party mons
	; last_address=0x3b2ae size=30

	; EXECUTIVE2 (2) at 0x3b2ae
	db "EXECUTIVE@"
	db $01 ; data type
	db 36, GOLBAT, LEECH_LIFE, BITE, CONFUSE_RAY, WING_ATTACK
	db $ff ; end trainer party mons
	; last_address=0x3b2c0 size=18

	; EXECUTIVE3 (3) at 0x3b2c0
	db "EXECUTIVE@"
	db $01 ; data type
	db 30, KOFFING, TACKLE, SELFDESTRUCT, SLUDGE, SMOKESCREEN
	db 30, KOFFING, TACKLE, SELFDESTRUCT, SLUDGE, SMOKESCREEN
	db 30, KOFFING, TACKLE, SELFDESTRUCT, SLUDGE, SMOKESCREEN
	db 32, WEEZING, TACKLE, EXPLOSION, SLUDGE, SMOKESCREEN
	db 30, KOFFING, TACKLE, SELFDESTRUCT, SLUDGE, SMOKESCREEN
	db 30, KOFFING, TACKLE, SMOG, SLUDGE, SMOKESCREEN
	db $ff ; end trainer party mons
	; last_address=0x3b2f0 size=48

	; EXECUTIVE4 (4) at 0x3b2f0
	db "EXECUTIVE@"
	db $00 ; data type
	db 22, ZUBAT
	db 24, RATICATE
	db 22, KOFFING
	db $ff ; end trainer party mons
	; last_address=0x3b302 size=18
; 0x3b302

PsychicGroup: ; 0x3b302
	; NATHAN (1) at 0x3b302
	db "NATHAN@"
	db $00 ; data type
	db 26, GIRAFARIG
	db $ff ; end trainer party mons
	; last_address=0x3b30d size=11

	; FRANKLIN (2) at 0x3b30d
	db "FRANKLIN@"
	db $00 ; data type
	db 37, KADABRA
	db $ff ; end trainer party mons
	; last_address=0x3b31a size=13

	; HERMAN (3) at 0x3b31a
	db "HERMAN@"
	db $00 ; data type
	db 30, EXEGGCUTE
	db 30, EXEGGCUTE
	db 30, EXEGGUTOR
	db $ff ; end trainer party mons
	; last_address=0x3b329 size=15

	; FIDEL (4) at 0x3b329
	db "FIDEL@"
	db $00 ; data type
	db 34, XATU
	db $ff ; end trainer party mons
	; last_address=0x3b333 size=10

	; GREG (5) at 0x3b333
	db "GREG@"
	db $01 ; data type
	db 17, DROWZEE, HYPNOSIS, DISABLE, DREAM_EATER, 0
	db $ff ; end trainer party mons
	; last_address=0x3b340 size=13

	; NORMAN (6) at 0x3b340
	db "NORMAN@"
	db $01 ; data type
	db 17, SLOWPOKE, TACKLE, GROWL, WATER_GUN, 0
	db 20, SLOWPOKE, CURSE, BODY_SLAM, WATER_GUN, CONFUSION
	db $ff ; end trainer party mons
	; last_address=0x3b355 size=21

	; MARK (7) at 0x3b355
	db "MARK@"
	db $01 ; data type
	db 13, ABRA, TELEPORT, FLASH, 0, 0
	db 13, ABRA, TELEPORT, FLASH, 0, 0
	db 15, KADABRA, TELEPORT, KINESIS, CONFUSION, 0
	db $ff ; end trainer party mons
	; last_address=0x3b36e size=25

	; PHIL (8) at 0x3b36e
	db "PHIL@"
	db $01 ; data type
	db 24, NATU, LEER, NIGHT_SHADE, FUTURE_SIGHT, CONFUSE_RAY
	db 26, KADABRA, DISABLE, PSYBEAM, RECOVER, FUTURE_SIGHT
	db $ff ; end trainer party mons
	; last_address=0x3b381 size=19

	; RICHARD (9) at 0x3b381
	db "RICHARD@"
	db $00 ; data type
	db 36, ESPEON
	db $ff ; end trainer party mons
	; last_address=0x3b38d size=12

	; GILBERT (10) at 0x3b38d
	db "GILBERT@"
	db $00 ; data type
	db 30, STARMIE
	db 30, EXEGGCUTE
	db 34, GIRAFARIG
	db $ff ; end trainer party mons
	; last_address=0x3b39d size=16

	; JARED (11) at 0x3b39d
	db "JARED@"
	db $00 ; data type
	db 32, MR__MIME
	db 32, EXEGGCUTE
	db 35, EXEGGCUTE
	db $ff ; end trainer party mons
	; last_address=0x3b3ab size=14

	; RODNEY (12) at 0x3b3ab
	db "RODNEY@"
	db $00 ; data type
	db 29, DROWZEE
	db 33, HYPNO
	db $ff ; end trainer party mons
	; last_address=0x3b3b8 size=13
; 0x3b3b8

PicnickerGroup: ; 0x3b3b8
	; LIZ1 (1) at 0x3b3b8
	db "LIZ@"
	db $00 ; data type
	db 9, NIDORAN_F
	db $ff ; end trainer party mons
	; last_address=0x3b3c0 size=8

	; GINA1 (2) at 0x3b3c0
	db "GINA@"
	db $00 ; data type
	db 9, HOPPIP
	db 9, HOPPIP
	db 12, BULBASAUR
	db $ff ; end trainer party mons
	; last_address=0x3b3cd size=13

	; BROOKE (3) at 0x3b3cd
	db "BROOKE@"
	db $01 ; data type
	db 16, PIKACHU, THUNDERSHOCK, GROWL, QUICK_ATTACK, DOUBLE_TEAM
	db $ff ; end trainer party mons
	; last_address=0x3b3dc size=15

	; KIM (4) at 0x3b3dc
	db "KIM@"
	db $00 ; data type
	db 15, VULPIX
	db $ff ; end trainer party mons
	; last_address=0x3b3e4 size=8

	; CINDY (5) at 0x3b3e4
	db "CINDY@"
	db $00 ; data type
	db 36, NIDOQUEEN
	db $ff ; end trainer party mons
	; last_address=0x3b3ee size=10

	; HOPE (6) at 0x3b3ee
	db "HOPE@"
	db $00 ; data type
	db 34, FLAAFFY
	db $ff ; end trainer party mons
	; last_address=0x3b3f7 size=9

	; SHARON (7) at 0x3b3f7
	db "SHARON@"
	db $00 ; data type
	db 31, FURRET
	db 33, RAPIDASH
	db $ff ; end trainer party mons
	; last_address=0x3b404 size=13

	; DEBRA (8) at 0x3b404
	db "DEBRA@"
	db $00 ; data type
	db 33, SEAKING
	db $ff ; end trainer party mons
	; last_address=0x3b40e size=10

	; GINA2 (9) at 0x3b40e
	db "GINA@"
	db $00 ; data type
	db 14, HOPPIP
	db 14, HOPPIP
	db 17, IVYSAUR
	db $ff ; end trainer party mons
	; last_address=0x3b41b size=13

	; ERIN1 (10) at 0x3b41b
	db "ERIN@"
	db $00 ; data type
	db 16, PONYTA
	db 16, PONYTA
	db $ff ; end trainer party mons
	; last_address=0x3b426 size=11

	; LIZ2 (11) at 0x3b426
	db "LIZ@"
	db $00 ; data type
	db 15, WEEPINBELL
	db 15, NIDORINA
	db $ff ; end trainer party mons
	; last_address=0x3b430 size=10

	; LIZ3 (12) at 0x3b430
	db "LIZ@"
	db $00 ; data type
	db 19, WEEPINBELL
	db 19, NIDORINO
	db 21, NIDOQUEEN
	db $ff ; end trainer party mons
	; last_address=0x3b43c size=12

	; HEIDI (13) at 0x3b43c
	db "HEIDI@"
	db $00 ; data type
	db 32, SKIPLOOM
	db 32, SKIPLOOM
	db $ff ; end trainer party mons
	; last_address=0x3b448 size=12

	; EDNA (14) at 0x3b448
	db "EDNA@"
	db $00 ; data type
	db 30, NIDORINA
	db 34, RAICHU
	db $ff ; end trainer party mons
	; last_address=0x3b453 size=11

	; GINA3 (15) at 0x3b453
	db "GINA@"
	db $00 ; data type
	db 26, SKIPLOOM
	db 26, SKIPLOOM
	db 29, IVYSAUR
	db $ff ; end trainer party mons
	; last_address=0x3b460 size=13

	; TIFFANY1 (16) at 0x3b460
	db "TIFFANY@"
	db $01 ; data type
	db 31, CLEFAIRY, ENCORE, SING, DOUBLESLAP, MINIMIZE
	db $ff ; end trainer party mons
	; last_address=0x3b470 size=16

	; TIFFANY2 (17) at 0x3b470
	db "TIFFANY@"
	db $01 ; data type
	db 37, CLEFAIRY, ENCORE, DOUBLESLAP, MINIMIZE, METRONOME
	db $ff ; end trainer party mons
	; last_address=0x3b480 size=16

	; ERIN2 (18) at 0x3b480
	db "ERIN@"
	db $00 ; data type
	db 32, PONYTA
	db 32, PONYTA
	db $ff ; end trainer party mons
	; last_address=0x3b48b size=11

	; TANYA (19) at 0x3b48b
	db "TANYA@"
	db $00 ; data type
	db 37, EXEGGUTOR
	db $ff ; end trainer party mons
	; last_address=0x3b495 size=10

	; TIFFANY3 (20) at 0x3b495
	db "TIFFANY@"
	db $01 ; data type
	db 20, CLEFAIRY, ENCORE, SING, DOUBLESLAP, MINIMIZE
	db $ff ; end trainer party mons
	; last_address=0x3b4a5 size=16

	; ERIN3 (21) at 0x3b4a5
	db "ERIN@"
	db $01 ; data type
	db 36, PONYTA, DOUBLE_TEAM, STOMP, FIRE_SPIN, SUNNY_DAY
	db 34, RAICHU, SWIFT, MUD_SLAP, QUICK_ATTACK, THUNDERBOLT
	db 36, PONYTA, DOUBLE_TEAM, STOMP, FIRE_SPIN, SUNNY_DAY
	db $ff ; end trainer party mons
	; last_address=0x3b4be size=25

	; LIZ4 (22) at 0x3b4be
	db "LIZ@"
	db $00 ; data type
	db 24, WEEPINBELL
	db 26, NIDORINO
	db 26, NIDOQUEEN
	db $ff ; end trainer party mons
	; last_address=0x3b4ca size=12

	; LIZ5 (23) at 0x3b4ca
	db "LIZ@"
	db $01 ; data type
	db 30, WEEPINBELL, SLEEP_POWDER, POISONPOWDER, STUN_SPORE, SLUDGE_BOMB
	db 32, NIDOKING, EARTHQUAKE, DOUBLE_KICK, POISON_STING, IRON_TAIL
	db 32, NIDOQUEEN, EARTHQUAKE, DOUBLE_KICK, TAIL_WHIP, BODY_SLAM
	db $ff ; end trainer party mons
	; last_address=0x3b4e2 size=24

	; GINA4 (24) at 0x3b4e2
	db "GINA@"
	db $00 ; data type
	db 30, SKIPLOOM
	db 30, SKIPLOOM
	db 32, IVYSAUR
	db $ff ; end trainer party mons
	; last_address=0x3b4ef size=13

	; GINA5 (25) at 0x3b4ef
	db "GINA@"
	db $01 ; data type
	db 33, JUMPLUFF, STUN_SPORE, SUNNY_DAY, LEECH_SEED, COTTON_SPORE
	db 33, JUMPLUFF, SUNNY_DAY, SLEEP_POWDER, LEECH_SEED, COTTON_SPORE
	db 38, VENUSAUR, SOLARBEAM, RAZOR_LEAF, HEADBUTT, MUD_SLAP
	db $ff ; end trainer party mons
	; last_address=0x3b508 size=25

	; TIFFANY4 (26) at 0x3b508
	db "TIFFANY@"
	db $01 ; data type
	db 43, CLEFAIRY, METRONOME, ENCORE, MOONLIGHT, MINIMIZE
	db $ff ; end trainer party mons
	; last_address=0x3b518 size=16
; 0x3b518

CamperGroup: ; 0x3b518
	; ROLAND (1) at 0x3b518
	db "ROLAND@"
	db $00 ; data type
	db 9, NIDORAN_M
	db $ff ; end trainer party mons
	; last_address=0x3b523 size=11

	; TODD1 (2) at 0x3b523
	db "TODD@"
	db $00 ; data type
	db 14, PSYDUCK
	db $ff ; end trainer party mons
	; last_address=0x3b52c size=9

	; IVAN (3) at 0x3b52c
	db "IVAN@"
	db $00 ; data type
	db 10, DIGLETT
	db 10, ZUBAT
	db 14, DIGLETT
	db $ff ; end trainer party mons
	; last_address=0x3b539 size=13

	; ELLIOT (4) at 0x3b539
	db "ELLIOT@"
	db $00 ; data type
	db 13, SANDSHREW
	db 15, MARILL
	db $ff ; end trainer party mons
	; last_address=0x3b546 size=13

	; BARRY (5) at 0x3b546
	db "BARRY@"
	db $00 ; data type
	db 36, NIDOKING
	db $ff ; end trainer party mons
	; last_address=0x3b550 size=10

	; LLOYD (6) at 0x3b550
	db "LLOYD@"
	db $00 ; data type
	db 34, NIDOKING
	db $ff ; end trainer party mons
	; last_address=0x3b55a size=10

	; DEAN (7) at 0x3b55a
	db "DEAN@"
	db $00 ; data type
	db 33, GOLDUCK
	db 31, SANDSLASH
	db $ff ; end trainer party mons
	; last_address=0x3b565 size=11

	; SID (8) at 0x3b565
	db "SID@"
	db $00 ; data type
	db 32, DUGTRIO
	db 29, PRIMEAPE
	db 29, POLIWRATH
	db $ff ; end trainer party mons
	; last_address=0x3b571 size=12

	; HARVEY (9) at 0x3b571
	db "HARVEY@"
	db $00 ; data type
	db 15, NIDORINO
	db $ff ; end trainer party mons
	; last_address=0x3b57c size=11

	; DALE (10) at 0x3b57c
	db "DALE@"
	db $00 ; data type
	db 15, NIDORINO
	db $ff ; end trainer party mons
	; last_address=0x3b585 size=9

	; TED (11) at 0x3b585
	db "TED@"
	db $00 ; data type
	db 17, MANKEY
	db $ff ; end trainer party mons
	; last_address=0x3b58d size=8

	; TODD2 (12) at 0x3b58d
	db "TODD@"
	db $00 ; data type
	db 17, GEODUDE
	db 17, GEODUDE
	db 23, PSYDUCK
	db $ff ; end trainer party mons
	; last_address=0x3b59a size=13

	; TODD3 (13) at 0x3b59a
	db "TODD@"
	db $00 ; data type
	db 23, GEODUDE
	db 23, GEODUDE
	db 26, PSYDUCK
	db $ff ; end trainer party mons
	; last_address=0x3b5a7 size=13

	; THOMAS (14) at 0x3b5a7
	db "THOMAS@"
	db $00 ; data type
	db 33, GRAVELER
	db 36, GRAVELER
	db 40, GOLBAT
	db 42, GOLDUCK
	db $ff ; end trainer party mons
	; last_address=0x3b5b8 size=17

	; LEROY (15) at 0x3b5b8
	db "LEROY@"
	db $00 ; data type
	db 33, GRAVELER
	db 36, GRAVELER
	db 40, GOLBAT
	db 42, GOLDUCK
	db $ff ; end trainer party mons
	; last_address=0x3b5c8 size=16

	; DAVID (16) at 0x3b5c8
	db "DAVID@"
	db $00 ; data type
	db 33, GRAVELER
	db 36, GRAVELER
	db 40, GOLBAT
	db 42, GOLDUCK
	db $ff ; end trainer party mons
	; last_address=0x3b5d8 size=16

	; JOHN (17) at 0x3b5d8
	db "JOHN@"
	db $00 ; data type
	db 33, GRAVELER
	db 36, GRAVELER
	db 40, GOLBAT
	db 42, GOLDUCK
	db $ff ; end trainer party mons
	; last_address=0x3b5e7 size=15

	; JERRY (18) at 0x3b5e7
	db "JERRY@"
	db $00 ; data type
	db 37, SANDSLASH
	db $ff ; end trainer party mons
	; last_address=0x3b5f1 size=10

	; SPENCER (19) at 0x3b5f1
	db "SPENCER@"
	db $00 ; data type
	db 17, SANDSHREW
	db 17, SANDSLASH
	db 19, ZUBAT
	db $ff ; end trainer party mons
	; last_address=0x3b601 size=16

	; TODD4 (20) at 0x3b601
	db "TODD@"
	db $00 ; data type
	db 30, GRAVELER
	db 30, GRAVELER
	db 30, SLUGMA
	db 32, PSYDUCK
	db $ff ; end trainer party mons
	; last_address=0x3b610 size=15

	; TODD5 (21) at 0x3b610
	db "TODD@"
	db $01 ; data type
	db 33, GRAVELER, SELFDESTRUCT, ROCK_THROW, HARDEN, MAGNITUDE
	db 33, GRAVELER, SELFDESTRUCT, ROCK_THROW, HARDEN, MAGNITUDE
	db 36, MAGCARGO, ROCK_THROW, HARDEN, AMNESIA, FLAMETHROWER
	db 34, GOLDUCK, DISABLE, PSYCHIC_M, SURF, PSYCH_UP
	db $ff ; end trainer party mons
	; last_address=0x3b62f size=31

	; QUENTIN (22) at 0x3b62f
	db "QUENTIN@"
	db $00 ; data type
	db 30, FEAROW
	db 30, PRIMEAPE
	db 30, TAUROS
	db $ff ; end trainer party mons
	; last_address=0x3b63f size=16
; 0x3b63f

ExecutiveFGroup: ; 0x3b63f
	; EXECUTIVE1 (1) at 0x3b63f
	db "EXECUTIVE@"
	db $01 ; data type
	db 32, ARBOK, WRAP, POISON_STING, BITE, GLARE
	db 32, VILEPLUME, ABSORB, SWEET_SCENT, SLEEP_POWDER, ACID
	db 32, MURKROW, PECK, PURSUIT, HAZE, NIGHT_SHADE
	db $ff ; end trainer party mons
	; last_address=0x3b65d size=30

	; EXECUTIVE2 (2) at 0x3b65d
	db "EXECUTIVE@"
	db $01 ; data type
	db 23, ARBOK, WRAP, LEER, POISON_STING, BITE
	db 23, GLOOM, ABSORB, SWEET_SCENT, SLEEP_POWDER, ACID
	db 25, MURKROW, PECK, PURSUIT, HAZE, 0
	db $ff ; end trainer party mons
	; last_address=0x3b67b size=30
; 0x3b67b

SageGroup: ; 0x3b67b
	; CHOW (1) at 0x3b67b
	db "CHOW@"
	db $00 ; data type
	db 3, BELLSPROUT
	db 3, BELLSPROUT
	db 3, BELLSPROUT
	db $ff ; end trainer party mons
	; last_address=0x3b688 size=13

	; NICO (2) at 0x3b688
	db "NICO@"
	db $00 ; data type
	db 3, BELLSPROUT
	db 3, BELLSPROUT
	db 3, BELLSPROUT
	db $ff ; end trainer party mons
	; last_address=0x3b695 size=13

	; JIN (3) at 0x3b695
	db "JIN@"
	db $00 ; data type
	db 6, BELLSPROUT
	db $ff ; end trainer party mons
	; last_address=0x3b69d size=8

	; TROY (4) at 0x3b69d
	db "TROY@"
	db $00 ; data type
	db 7, BELLSPROUT
	db 7, HOOTHOOT
	db $ff ; end trainer party mons
	; last_address=0x3b6a8 size=11

	; JEFFREY (5) at 0x3b6a8
	db "JEFFREY@"
	db $00 ; data type
	db 22, HAUNTER
	db $ff ; end trainer party mons
	; last_address=0x3b6b4 size=12

	; PING (6) at 0x3b6b4
	db "PING@"
	db $00 ; data type
	db 16, GASTLY
	db 16, GASTLY
	db 16, GASTLY
	db 16, GASTLY
	db 16, GASTLY
	db $ff ; end trainer party mons
	; last_address=0x3b6c5 size=17

	; EDMOND (7) at 0x3b6c5
	db "EDMOND@"
	db $00 ; data type
	db 3, BELLSPROUT
	db 3, BELLSPROUT
	db 3, BELLSPROUT
	db $ff ; end trainer party mons
	; last_address=0x3b6d4 size=15

	; NEAL (8) at 0x3b6d4
	db "NEAL@"
	db $00 ; data type
	db 6, BELLSPROUT
	db $ff ; end trainer party mons
	; last_address=0x3b6dd size=9

	; LI (9) at 0x3b6dd
	db "LI@"
	db $00 ; data type
	db 7, BELLSPROUT
	db 7, BELLSPROUT
	db 10, HOOTHOOT
	db $ff ; end trainer party mons
	; last_address=0x3b6e8 size=11

	; GAKU (10) at 0x3b6e8
	db "GAKU@"
	db $00 ; data type
	db 32, NOCTOWL
	db 32, FLAREON
	db $ff ; end trainer party mons
	; last_address=0x3b6f3 size=11

	; MASA (11) at 0x3b6f3
	db "MASA@"
	db $00 ; data type
	db 32, NOCTOWL
	db 32, JOLTEON
	db $ff ; end trainer party mons
	; last_address=0x3b6fe size=11

	; KOJI (12) at 0x3b6fe
	db "KOJI@"
	db $00 ; data type
	db 32, NOCTOWL
	db 32, VAPOREON
	db $ff ; end trainer party mons
	; last_address=0x3b709 size=11
; 0x3b709

MediumGroup: ; 0x3b709
	; MARTHA (1) at 0x3b709
	db "MARTHA@"
	db $00 ; data type
	db 18, GASTLY
	db 20, HAUNTER
	db 20, GASTLY
	db $ff ; end trainer party mons
	; last_address=0x3b718 size=15

	; GRACE (2) at 0x3b718
	db "GRACE@"
	db $00 ; data type
	db 20, HAUNTER
	db 20, HAUNTER
	db $ff ; end trainer party mons
	; last_address=0x3b724 size=12

	; BETHANY (3) at 0x3b724
	db "BETHANY@"
	db $00 ; data type
	db 25, HAUNTER
	db $ff ; end trainer party mons
	; last_address=0x3b730 size=12

	; MARGRET (4) at 0x3b730
	db "MARGRET@"
	db $00 ; data type
	db 25, HAUNTER
	db $ff ; end trainer party mons
	; last_address=0x3b73c size=12

	; ETHEL (5) at 0x3b73c
	db "ETHEL@"
	db $00 ; data type
	db 25, HAUNTER
	db $ff ; end trainer party mons
	; last_address=0x3b746 size=10

	; REBECCA (6) at 0x3b746
	db "REBECCA@"
	db $00 ; data type
	db 35, DROWZEE
	db 35, HYPNO
	db $ff ; end trainer party mons
	; last_address=0x3b754 size=14

	; DORIS (7) at 0x3b754
	db "DORIS@"
	db $00 ; data type
	db 34, SLOWPOKE
	db 36, SLOWBRO
	db $ff ; end trainer party mons
	; last_address=0x3b760 size=12
; 0x3b760

BoarderGroup: ; 0x3b760
	; RONALD (1) at 0x3b760
	db "RONALD@"
	db $00 ; data type
	db 24, SEEL
	db 25, DEWGONG
	db 24, SEEL
	db $ff ; end trainer party mons
	; last_address=0x3b76f size=15

	; BRAD (2) at 0x3b76f
	db "BRAD@"
	db $00 ; data type
	db 26, SWINUB
	db 26, SWINUB
	db $ff ; end trainer party mons
	; last_address=0x3b77a size=11

	; DOUGLAS (3) at 0x3b77a
	db "DOUGLAS@"
	db $00 ; data type
	db 24, SHELLDER
	db 25, CLOYSTER
	db 24, SHELLDER
	db $ff ; end trainer party mons
	; last_address=0x3b78a size=16
; 0x3b78a

PokefanMGroup: ; 0x3b78a
	; WILLIAM (1) at 0x3b78a
	db "WILLIAM@"
	db $02 ; data type
	db 14, RAICHU, BERRY
	db $ff ; end trainer party mons
	; last_address=0x3b797 size=13

	; DEREK1 (2) at 0x3b797
	db "DEREK@"
	db $02 ; data type
	db 17, PIKACHU, BERRY
	db $ff ; end trainer party mons
	; last_address=0x3b7a2 size=11

	; ROBERT (3) at 0x3b7a2
	db "ROBERT@"
	db $02 ; data type
	db 33, QUAGSIRE, BERRY
	db $ff ; end trainer party mons
	; last_address=0x3b7ae size=12

	; JOSHUA (4) at 0x3b7ae
	db "JOSHUA@"
	db $02 ; data type
	db 23, PIKACHU, BERRY
	db 23, PIKACHU, BERRY
	db 23, PIKACHU, BERRY
	db 23, PIKACHU, BERRY
	db 23, PIKACHU, BERRY
	db 23, PIKACHU, BERRY
	db $ff ; end trainer party mons
	; last_address=0x3b7c9 size=27

	; CARTER (5) at 0x3b7c9
	db "CARTER@"
	db $02 ; data type
	db 29, BULBASAUR, BERRY
	db 29, CHARMANDER, BERRY
	db 29, SQUIRTLE, BERRY
	db $ff ; end trainer party mons
	; last_address=0x3b7db size=18

	; TREVOR (6) at 0x3b7db
	db "TREVOR@"
	db $02 ; data type
	db 33, PSYDUCK, BERRY
	db $ff ; end trainer party mons
	; last_address=0x3b7e7 size=12

	; BRANDON (7) at 0x3b7e7
	db "BRANDON@"
	db $02 ; data type
	db 13, SNUBBULL, BERRY
	db $ff ; end trainer party mons
	; last_address=0x3b7f4 size=13

	; JEREMY (8) at 0x3b7f4
	db "JEREMY@"
	db $02 ; data type
	db 28, MEOWTH, BERRY
	db 28, MEOWTH, BERRY
	db 28, MEOWTH, BERRY
	db $ff ; end trainer party mons
	; last_address=0x3b806 size=18

	; COLIN (9) at 0x3b806
	db "COLIN@"
	db $02 ; data type
	db 32, DELIBIRD, BERRY
	db $ff ; end trainer party mons
	; last_address=0x3b811 size=11

	; DEREK2 (10) at 0x3b811
	db "DEREK@"
	db $02 ; data type
	db 19, PIKACHU, BERRY
	db $ff ; end trainer party mons
	; last_address=0x3b81c size=11

	; DEREK3 (11) at 0x3b81c
	db "DEREK@"
	db $02 ; data type
	db 36, PIKACHU, BERRY
	db $ff ; end trainer party mons
	; last_address=0x3b827 size=11

	; ALEX (12) at 0x3b827
	db "ALEX@"
	db $02 ; data type
	db 29, NIDOKING, BERRY
	db 29, SLOWKING, BERRY
	db 29, SEAKING, BERRY
	db $ff ; end trainer party mons
	; last_address=0x3b837 size=16

	; REX (13) at 0x3b837
	db "REX@"
	db $02 ; data type
	db 35, PHANPY, BERRY
	db $ff ; end trainer party mons
	; last_address=0x3b840 size=9

	; ALLAN (14) at 0x3b840
	db "ALLAN@"
	db $02 ; data type
	db 35, TEDDIURSA, BERRY
	db $ff ; end trainer party mons
	; last_address=0x3b84b size=11
; 0x3b84b

KimonoGirlGroup: ; 0x3b84b
	; NAOKO1 (2) at 0x3b84b
	db "NAOKO@" ; unused
	db $00 ; data type
	db 20, SKIPLOOM
	db 20, VULPIX
	db 18, SKIPLOOM
	db $ff ; end trainer party mons
	; last_address=0x3b859 size=14

	; NAOKO2 (3) at 0x3b859
	db "NAOKO@"
	db $00 ; data type
	db 17, FLAREON
	db $ff ; end trainer party mons
	; last_address=0x3b863 size=10

	; SAYO (4) at 0x3b863
	db "SAYO@"
	db $00 ; data type
	db 17, ESPEON
	db $ff ; end trainer party mons
	; last_address=0x3b86c size=9

	; ZUKI (5) at 0x3b86c
	db "ZUKI@"
	db $00 ; data type
	db 17, UMBREON
	db $ff ; end trainer party mons
	; last_address=0x3b875 size=9

	; KUNI (6) at 0x3b875
	db "KUNI@"
	db $00 ; data type
	db 17, VAPOREON
	db $ff ; end trainer party mons
	; last_address=0x3b87e size=9

	; MIKI (7) at 0x3b87e
	db "MIKI@"
	db $00 ; data type
	db 17, JOLTEON
	db $ff ; end trainer party mons
	; last_address=0x3b887 size=9
; 0x3b887

TwinsGroup: ; 0x3b887
	; AMYANDMAY1 (1) at 0x3b887
	db "AMY & MAY@"
	db $00 ; data type
	db 10, SPINARAK
	db 10, LEDYBA
	db $ff ; end trainer party mons
	; last_address=0x3b897 size=16

	; ANNANDANNE1 (2) at 0x3b897
	db "ANN & ANNE@"
	db $01 ; data type
	db 16, CLEFAIRY, GROWL, ENCORE, DOUBLESLAP, METRONOME
	db 16, JIGGLYPUFF, SING, DEFENSE_CURL, POUND, DISABLE
	db $ff ; end trainer party mons
	; last_address=0x3b8b0 size=25

	; ANNANDANNE2 (3) at 0x3b8b0
	db "ANN & ANNE@"
	db $01 ; data type
	db 16, JIGGLYPUFF, SING, DEFENSE_CURL, POUND, DISABLE
	db 16, CLEFAIRY, GROWL, ENCORE, DOUBLESLAP, METRONOME
	db $ff ; end trainer party mons
	; last_address=0x3b8c9 size=25

	; AMYANDMAY2 (4) at 0x3b8c9
	db "AMY & MAY@"
	db $00 ; data type
	db 10, LEDYBA
	db 10, SPINARAK
	db $ff ; end trainer party mons
	; last_address=0x3b8d9 size=16

	; JOANDZOE1 (5) at 0x3b8d9
	db "JO & ZOE@"
	db $00 ; data type
	db 35, VICTREEBEL
	db 35, VILEPLUME
	db $ff ; end trainer party mons
	; last_address=0x3b8e8 size=15

	; JOANDZOE2 (6) at 0x3b8e8
	db "JO & ZOE@"
	db $00 ; data type
	db 35, VILEPLUME
	db 35, VICTREEBEL
	db $ff ; end trainer party mons
	; last_address=0x3b8f7 size=15

	; MEGANDPEG1 (7) at 0x3b8f7
	db "MEG & PEG@"
	db $00 ; data type
	db 31, TEDDIURSA
	db 31, PHANPY
	db $ff ; end trainer party mons
	; last_address=0x3b907 size=16

	; MEGANDPEG2 (8) at 0x3b907
	db "MEG & PEG@"
	db $00 ; data type
	db 31, PHANPY
	db 31, TEDDIURSA
	db $ff ; end trainer party mons
	; last_address=0x3b917 size=16

	; LEAANDPIA1 (9) at 0x3b917
	db "LEA & PIA@"
	db $01 ; data type
	db 35, DRATINI, THUNDER_WAVE, TWISTER, FLAMETHROWER, HEADBUTT
	db 35, DRATINI, THUNDER_WAVE, TWISTER, ICE_BEAM, HEADBUTT
	db $ff ; end trainer party mons
	; last_address=0x3b92f size=24

	; LEAANDPIA2 (10) at 0x3b92f
	db "LEA & PIA@"
	db $01 ; data type
	db 38, DRATINI, THUNDER_WAVE, TWISTER, ICE_BEAM, HEADBUTT
	db 38, DRATINI, THUNDER_WAVE, TWISTER, FLAMETHROWER, HEADBUTT
	db $ff ; end trainer party mons
	; last_address=0x3b947 size=24
; 0x3b947

PokefanFGroup: ; 0x3b947
	; BEVERLY1 (1) at 0x3b947
	db "BEVERLY@"
	db $02 ; data type
	db 14, SNUBBULL, BERRY
	db $ff ; end trainer party mons
	; last_address=0x3b954 size=13

	; RUTH (2) at 0x3b954
	db "RUTH@"
	db $02 ; data type
	db 17, PIKACHU, BERRY
	db $ff ; end trainer party mons
	; last_address=0x3b95e size=10

	; BEVERLY2 (3) at 0x3b95e
	db "BEVERLY@"
	db $02 ; data type
	db 18, SNUBBULL, BERRY
	db $ff ; end trainer party mons
	; last_address=0x3b96b size=13

	; BEVERLY3 (4) at 0x3b96b
	db "BEVERLY@"
	db $02 ; data type
	db 30, GRANBULL, BERRY
	db $ff ; end trainer party mons
	; last_address=0x3b978 size=13

	; GEORGIA (5) at 0x3b978
	db "GEORGIA@"
	db $02 ; data type
	db 23, SENTRET, BERRY
	db 23, SENTRET, BERRY
	db 23, SENTRET, BERRY
	db 28, FURRET, BERRY
	db 23, SENTRET, BERRY
	db $ff ; end trainer party mons
	; last_address=0x3b991 size=25

	; JAIME (6) at 0x3b991
	db "JAIME@"
	db $02 ; data type
	db 16, MEOWTH, BERRY
	db $ff ; end trainer party mons
	; last_address=0x3b99c size=11
; 0x3b99c

RedGroup: ; 0x3b99c
	; RED (1) at 0x3b99c
	db "RED@"
	db $01 ; data type
	db 81, PIKACHU, CHARM, QUICK_ATTACK, THUNDERBOLT, THUNDER
	db 73, ESPEON, MUD_SLAP, REFLECT, SWIFT, PSYCHIC_M
	db 75, SNORLAX, AMNESIA, SNORE, REST, BODY_SLAM
	db 77, VENUSAUR, SUNNY_DAY, GIGA_DRAIN, SYNTHESIS, SOLARBEAM
	db 77, CHARIZARD, FLAMETHROWER, WING_ATTACK, SLASH, FIRE_SPIN
	db 77, BLASTOISE, RAIN_DANCE, SURF, BLIZZARD, WHIRLPOOL
	db $ff ; end trainer party mons
	; last_address=0x3b9c6 size=42
; 0x3b9c6

BlueGroup: ; 0x3b9c6
	; BLUE (1) at 0x3b9c6
	db "BLUE@"
	db $01 ; data type
	db 56, PIDGEOT, QUICK_ATTACK, WHIRLWIND, WING_ATTACK, MIRROR_MOVE
	db 54, ALAKAZAM, DISABLE, RECOVER, PSYCHIC_M, REFLECT
	db 56, RHYDON, FURY_ATTACK, SANDSTORM, ROCK_SLIDE, EARTHQUAKE
	db 58, GYARADOS, TWISTER, HYDRO_PUMP, RAIN_DANCE, HYPER_BEAM
	db 58, EXEGGUTOR, SUNNY_DAY, LEECH_SEED, EGG_BOMB, SOLARBEAM
	db 58, ARCANINE, ROAR, SWIFT, FLAMETHROWER, EXTREMESPEED
	db $ff ; end trainer party mons
	; last_address=0x3b9f1 size=43
; 0x3b9f1

OfficerGroup: ; 0x3b9f1
	; KEITH (1) at 0x3b9f1
	db "KEITH@"
	db $00 ; data type
	db 17, GROWLITHE
	db $ff ; end trainer party mons
	; last_address=0x3b9fb size=10

	; DIRK (2) at 0x3b9fb
	db "DIRK@"
	db $00 ; data type
	db 14, GROWLITHE
	db 14, GROWLITHE
	db $ff ; end trainer party mons
	; last_address=0x3ba06 size=11
; 0x3ba06

GruntFGroup: ; 0x3ba06
	; GRUNT1 (1) at 0x3ba06
	db "GRUNT@"
	db $00 ; data type
	db 9, ZUBAT
	db 11, EKANS
	db $ff ; end trainer party mons
	; last_address=0x3ba12 size=12

	; GRUNT2 (2) at 0x3ba12
	db "GRUNT@"
	db $00 ; data type
	db 26, ARBOK
	db $ff ; end trainer party mons
	; last_address=0x3ba1c size=10

	; GRUNT3 (3) at 0x3ba1c
	db "GRUNT@"
	db $00 ; data type
	db 25, GLOOM
	db 25, GLOOM
	db $ff ; end trainer party mons
	; last_address=0x3ba28 size=12

	; GRUNT4 (4) at 0x3ba28
	db "GRUNT@"
	db $00 ; data type
	db 21, EKANS
	db 23, ODDISH
	db 21, EKANS
	db 24, GLOOM
	db $ff ; end trainer party mons
	; last_address=0x3ba38 size=16

	; GRUNT5 (5) at 0x3ba38
	db "GRUNT@"
	db $01 ; data type
	db 18, EKANS, WRAP, LEER, POISON_STING, BITE
	db 18, GLOOM, ABSORB, SWEET_SCENT, STUN_SPORE, SLEEP_POWDER
	db $ff ; end trainer party mons
	; last_address=0x3ba4c size=20
; 0x3ba4c

MysticalmanGroup: ; 0x3ba4c
	; EUSINE (1) at 0x3ba4c
	db "EUSINE@"
	db $01 ; data type
	db 23, DROWZEE, DREAM_EATER, HYPNOSIS, DISABLE, CONFUSION
	db 23, HAUNTER, LICK, HYPNOSIS, MEAN_LOOK, CURSE
	db 25, ELECTRODE, SCREECH, SONICBOOM, THUNDER, ROLLOUT
	db $ff ; end trainer party mons
	; last_address=0x3ba67 size=27
; 0x3ba67
