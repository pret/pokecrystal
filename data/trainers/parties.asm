Trainers:

; All trainers follow a basic structure:
	; Name
		; String in format "TEXT@"
	; Type
		; TRAINERTYPE_NORMAL:     level, species
		; TRAINERTYPE_MOVES:      level, species, moves
		; TRAINERTYPE_ITEM:       level, species, item
		; TRAINERTYPE_ITEM_MOVES: level, species, item, moves
	; Party
		; Up to six monsters following the data type
	; $ff


FalknerGroup:
; ================================
; ================

	; FALKNER (1)
	db "FALKNER@"
	db TRAINERTYPE_MOVES

	; party

	db 7, PIDGEY
		db TACKLE
		db MUD_SLAP
		db 0
		db 0

	db 9, PIDGEOTTO
		db TACKLE
		db MUD_SLAP
		db GUST
		db 0

	db -1 ; end

; ================
; ================================


WhitneyGroup:
; ================================
; ================

	; WHITNEY (1)
	db "WHITNEY@"
	db TRAINERTYPE_MOVES

	; party

	db 18, CLEFAIRY
		db DOUBLESLAP
		db MIMIC
		db ENCORE
		db METRONOME

	db 20, MILTANK
		db ROLLOUT
		db ATTRACT
		db STOMP
		db MILK_DRINK

	db -1 ; end

; ================
; ================================


BugsyGroup:
; ================================
; ================

	; BUGSY (1)
	db "BUGSY@"
	db TRAINERTYPE_MOVES

	; party

	db 14, METAPOD
		db TACKLE
		db STRING_SHOT
		db HARDEN
		db 0

	db 14, KAKUNA
		db POISON_STING
		db STRING_SHOT
		db HARDEN
		db 0

	db 16, SCYTHER
		db QUICK_ATTACK
		db LEER
		db FURY_CUTTER
		db 0

	db -1 ; end

; ================
; ================================


MortyGroup:
; ================================
; ================

	; MORTY (1)
	db "MORTY@"
	db TRAINERTYPE_MOVES

	; party

	db 21, GASTLY
		db LICK
		db SPITE
		db MEAN_LOOK
		db CURSE

	db 21, HAUNTER
		db HYPNOSIS
		db MIMIC
		db CURSE
		db NIGHT_SHADE

	db 25, GENGAR
		db HYPNOSIS
		db SHADOW_BALL
		db MEAN_LOOK
		db DREAM_EATER

	db 23, HAUNTER
		db SPITE
		db MEAN_LOOK
		db MIMIC
		db NIGHT_SHADE

	db -1 ; end

; ================
; ================================


PryceGroup:
; ================================
; ================

	; PRYCE (1)
	db "PRYCE@"
	db TRAINERTYPE_MOVES

	; party

	db 27, SEEL
		db HEADBUTT
		db ICY_WIND
		db AURORA_BEAM
		db REST

	db 29, DEWGONG
		db HEADBUTT
		db ICY_WIND
		db AURORA_BEAM
		db REST

	db 31, PILOSWINE
		db ICY_WIND
		db FURY_ATTACK
		db MIST
		db BLIZZARD

	db -1 ; end

; ================
; ================================


JasmineGroup:
; ================================
; ================

	; JASMINE (1)
	db "JASMINE@"
	db TRAINERTYPE_MOVES

	; party

	db 30, MAGNEMITE
		db THUNDERBOLT
		db SUPERSONIC
		db SONICBOOM
		db THUNDER_WAVE

	db 30, MAGNEMITE
		db THUNDERBOLT
		db SUPERSONIC
		db SONICBOOM
		db THUNDER_WAVE

	db 35, STEELIX
		db SCREECH
		db SUNNY_DAY
		db ROCK_THROW
		db IRON_TAIL

	db -1 ; end

; ================
; ================================


ChuckGroup:
; ================================
; ================

	; CHUCK (1)
	db "CHUCK@"
	db TRAINERTYPE_MOVES

	; party

	db 27, PRIMEAPE
		db LEER
		db RAGE
		db KARATE_CHOP
		db FURY_SWIPES

	db 30, POLIWRATH
		db HYPNOSIS
		db MIND_READER
		db SURF
		db DYNAMICPUNCH

	db -1 ; end

; ================
; ================================


ClairGroup:
; ================================
; ================

	; CLAIR (1)
	db "CLAIR@"
	db TRAINERTYPE_MOVES

	; party

	db 37, DRAGONAIR
		db THUNDER_WAVE
		db SURF
		db SLAM
		db DRAGONBREATH

	db 37, DRAGONAIR
		db THUNDER_WAVE
		db THUNDERBOLT
		db SLAM
		db DRAGONBREATH

	db 37, DRAGONAIR
		db THUNDER_WAVE
		db ICE_BEAM
		db SLAM
		db DRAGONBREATH

	db 40, KINGDRA
		db SMOKESCREEN
		db SURF
		db HYPER_BEAM
		db DRAGONBREATH

	db -1 ; end

; ================
; ================================


Rival1Group:
; ================================
; ================

	; RIVAL1 (1)
	db "?@"
	db TRAINERTYPE_NORMAL

	; party
	db 5, CHIKORITA

	db -1 ; end

; ================

	; RIVAL1 (2)
	db "?@"
	db TRAINERTYPE_NORMAL

	; party
	db 5, CYNDAQUIL

	db -1 ; end

; ================

	; RIVAL1 (3)
	db "?@"
	db TRAINERTYPE_NORMAL

	; party
	db 5, TOTODILE

	db -1 ; end

; ================

	; RIVAL1 (4)
	db "?@"
	db TRAINERTYPE_NORMAL

	; party
	db 12, GASTLY
	db 14, ZUBAT
	db 16, BAYLEEF

	db -1 ; end

; ================

	; RIVAL1 (5)
	db "?@"
	db TRAINERTYPE_NORMAL

	; party
	db 12, GASTLY
	db 14, ZUBAT
	db 16, QUILAVA

	db -1 ; end

; ================

	; RIVAL1 (6)
	db "?@"
	db TRAINERTYPE_NORMAL

	; party
	db 12, GASTLY
	db 14, ZUBAT
	db 16, CROCONAW

	db -1 ; end

; ================

	; RIVAL1 (7)
	db "?@"
	db TRAINERTYPE_MOVES

	; party

	db 20, HAUNTER
		db LICK
		db SPITE
		db MEAN_LOOK
		db CURSE

	db 18, MAGNEMITE
		db TACKLE
		db THUNDERSHOCK
		db SUPERSONIC
		db SONICBOOM

	db 20, ZUBAT
		db LEECH_LIFE
		db SUPERSONIC
		db BITE
		db CONFUSE_RAY

	db 22, BAYLEEF
		db GROWL
		db REFLECT
		db RAZOR_LEAF
		db POISONPOWDER

	db -1 ; end

; ================

	; RIVAL1 (8)
	db "?@"
	db TRAINERTYPE_MOVES

	; party

	db 20, HAUNTER
		db LICK
		db SPITE
		db MEAN_LOOK
		db CURSE

	db 18, MAGNEMITE
		db TACKLE
		db THUNDERSHOCK
		db SUPERSONIC
		db SONICBOOM

	db 20, ZUBAT
		db LEECH_LIFE
		db SUPERSONIC
		db BITE
		db CONFUSE_RAY

	db 22, QUILAVA
		db LEER
		db SMOKESCREEN
		db EMBER
		db QUICK_ATTACK

	db -1 ; end

; ================

	; RIVAL1 (9)
	db "?@"
	db TRAINERTYPE_MOVES

	; party

	db 20, HAUNTER
		db LICK
		db SPITE
		db MEAN_LOOK
		db CURSE

	db 18, MAGNEMITE
		db TACKLE
		db THUNDERSHOCK
		db SUPERSONIC
		db SONICBOOM

	db 20, ZUBAT
		db LEECH_LIFE
		db SUPERSONIC
		db BITE
		db CONFUSE_RAY

	db 22, CROCONAW
		db LEER
		db RAGE
		db WATER_GUN
		db BITE

	db -1 ; end

; ================

	; RIVAL1 (10)
	db "?@"
	db TRAINERTYPE_MOVES

	; party

	db 30, GOLBAT
		db LEECH_LIFE
		db BITE
		db CONFUSE_RAY
		db WING_ATTACK

	db 28, MAGNEMITE
		db TACKLE
		db THUNDERSHOCK
		db SONICBOOM
		db THUNDER_WAVE

	db 30, HAUNTER
		db LICK
		db MEAN_LOOK
		db CURSE
		db SHADOW_BALL

	db 32, SNEASEL
		db LEER
		db QUICK_ATTACK
		db SCREECH
		db FAINT_ATTACK

	db 32, MEGANIUM
		db REFLECT
		db RAZOR_LEAF
		db POISONPOWDER
		db BODY_SLAM

	db -1 ; end

; ================

	; RIVAL1 (11)
	db "?@"
	db TRAINERTYPE_MOVES

	; party

	db 30, GOLBAT
		db LEECH_LIFE
		db BITE
		db CONFUSE_RAY
		db WING_ATTACK

	db 28, MAGNEMITE
		db TACKLE
		db THUNDERSHOCK
		db SONICBOOM
		db THUNDER_WAVE

	db 30, HAUNTER
		db LICK
		db MEAN_LOOK
		db CURSE
		db SHADOW_BALL

	db 32, SNEASEL
		db LEER
		db QUICK_ATTACK
		db SCREECH
		db FAINT_ATTACK

	db 32, QUILAVA
		db SMOKESCREEN
		db EMBER
		db QUICK_ATTACK
		db FLAME_WHEEL

	db -1 ; end

; ================

	; RIVAL1 (12)
	db "?@"
	db TRAINERTYPE_MOVES

	; party

	db 30, GOLBAT
		db LEECH_LIFE
		db BITE
		db CONFUSE_RAY
		db WING_ATTACK

	db 28, MAGNEMITE
		db TACKLE
		db THUNDERSHOCK
		db SONICBOOM
		db THUNDER_WAVE

	db 30, HAUNTER
		db LICK
		db MEAN_LOOK
		db CURSE
		db SHADOW_BALL

	db 32, SNEASEL
		db LEER
		db QUICK_ATTACK
		db SCREECH
		db FAINT_ATTACK

	db 32, FERALIGATR
		db RAGE
		db WATER_GUN
		db BITE
		db SCARY_FACE

	db -1 ; end

; ================

	; RIVAL1 (13)
	db "?@"
	db TRAINERTYPE_MOVES

	; party

	db 34, SNEASEL
		db QUICK_ATTACK
		db SCREECH
		db FAINT_ATTACK
		db FURY_CUTTER

	db 36, GOLBAT
		db LEECH_LIFE
		db BITE
		db CONFUSE_RAY
		db WING_ATTACK

	db 35, MAGNETON
		db THUNDERSHOCK
		db SONICBOOM
		db THUNDER_WAVE
		db SWIFT

	db 35, HAUNTER
		db MEAN_LOOK
		db CURSE
		db SHADOW_BALL
		db CONFUSE_RAY

	db 35, KADABRA
		db DISABLE
		db PSYBEAM
		db RECOVER
		db FUTURE_SIGHT

	db 38, MEGANIUM
		db REFLECT
		db RAZOR_LEAF
		db POISONPOWDER
		db BODY_SLAM

	db -1 ; end

; ================

	; RIVAL1 (14)
	db "?@"
	db TRAINERTYPE_MOVES

	; party

	db 34, SNEASEL
		db QUICK_ATTACK
		db SCREECH
		db FAINT_ATTACK
		db FURY_CUTTER

	db 36, GOLBAT
		db LEECH_LIFE
		db BITE
		db CONFUSE_RAY
		db WING_ATTACK

	db 35, MAGNETON
		db THUNDERSHOCK
		db SONICBOOM
		db THUNDER_WAVE
		db SWIFT

	db 35, HAUNTER
		db MEAN_LOOK
		db CURSE
		db SHADOW_BALL
		db CONFUSE_RAY

	db 35, KADABRA
		db DISABLE
		db PSYBEAM
		db RECOVER
		db FUTURE_SIGHT

	db 38, TYPHLOSION
		db SMOKESCREEN
		db EMBER
		db QUICK_ATTACK
		db FLAME_WHEEL

	db -1 ; end

; ================

	; RIVAL1 (15)
	db "?@"
	db TRAINERTYPE_MOVES

	; party

	db 34, SNEASEL
		db QUICK_ATTACK
		db SCREECH
		db FAINT_ATTACK
		db FURY_CUTTER

	db 36, GOLBAT
		db LEECH_LIFE
		db BITE
		db CONFUSE_RAY
		db WING_ATTACK

	db 34, MAGNETON
		db THUNDERSHOCK
		db SONICBOOM
		db THUNDER_WAVE
		db SWIFT

	db 35, HAUNTER
		db MEAN_LOOK
		db CURSE
		db SHADOW_BALL
		db CONFUSE_RAY

	db 35, KADABRA
		db DISABLE
		db PSYBEAM
		db RECOVER
		db FUTURE_SIGHT

	db 38, FERALIGATR
		db RAGE
		db WATER_GUN
		db SCARY_FACE
		db SLASH

	db -1 ; end

; ================
; ================================


PokemonProfGroup:
; ================================
; ================
; ================================


WillGroup:
; ================================
; ================

	; WILL (1)
	db "WILL@"
	db TRAINERTYPE_MOVES

	; party

	db 40, XATU
		db QUICK_ATTACK
		db FUTURE_SIGHT
		db CONFUSE_RAY
		db PSYCHIC_M

	db 41, JYNX
		db DOUBLESLAP
		db LOVELY_KISS
		db ICE_PUNCH
		db PSYCHIC_M

	db 41, EXEGGUTOR
		db REFLECT
		db LEECH_SEED
		db EGG_BOMB
		db PSYCHIC_M

	db 41, SLOWBRO
		db CURSE
		db AMNESIA
		db BODY_SLAM
		db PSYCHIC_M

	db 42, XATU
		db QUICK_ATTACK
		db FUTURE_SIGHT
		db CONFUSE_RAY
		db PSYCHIC_M

	db -1 ; end

; ================
; ================================


PKMNTrainerGroup:
; ================================
; ================

	; CAL (1)
	db "CAL@"
	db TRAINERTYPE_NORMAL

	; party
	db 10, CHIKORITA
	db 10, CYNDAQUIL
	db 10, TOTODILE

	db -1 ; end

; ================

	; CAL (2)
	db "CAL@"
	db TRAINERTYPE_NORMAL

	; party
	db 30, BAYLEEF
	db 30, QUILAVA
	db 30, CROCONAW

	db -1 ; end

; ================

	; CAL (3)
	db "CAL@"
	db TRAINERTYPE_NORMAL

	; party
	db 50, MEGANIUM
	db 50, TYPHLOSION
	db 50, FERALIGATR

	db -1 ; end

; ================
; ================================


BrunoGroup:
; ================================
; ================

	; BRUNO (1)
	db "BRUNO@"
	db TRAINERTYPE_MOVES

	; party

	db 42, HITMONTOP
		db PURSUIT
		db QUICK_ATTACK
		db DIG
		db DETECT

	db 42, HITMONLEE
		db SWAGGER
		db DOUBLE_KICK
		db HI_JUMP_KICK
		db FORESIGHT

	db 42, HITMONCHAN
		db THUNDERPUNCH
		db ICE_PUNCH
		db FIRE_PUNCH
		db MACH_PUNCH

	db 43, ONIX
		db BIND
		db EARTHQUAKE
		db SANDSTORM
		db ROCK_SLIDE

	db 46, MACHAMP
		db ROCK_SLIDE
		db FORESIGHT
		db VITAL_THROW
		db CROSS_CHOP

	db -1 ; end

; ================
; ================================


KarenGroup:
; ================================
; ================

	; KAREN (1)
	db "KAREN@"
	db TRAINERTYPE_MOVES

	; party

	db 42, UMBREON
		db SAND_ATTACK
		db CONFUSE_RAY
		db FAINT_ATTACK
		db MEAN_LOOK

	db 42, VILEPLUME
		db STUN_SPORE
		db ACID
		db MOONLIGHT
		db PETAL_DANCE

	db 45, GENGAR
		db LICK
		db SPITE
		db CURSE
		db DESTINY_BOND

	db 44, MURKROW
		db QUICK_ATTACK
		db WHIRLWIND
		db PURSUIT
		db FAINT_ATTACK

	db 47, HOUNDOOM
		db ROAR
		db PURSUIT
		db FLAMETHROWER
		db CRUNCH

	db -1 ; end

; ================
; ================================


KogaGroup:
; ================================
; ================

	; KOGA (1)
	db "KOGA@"
	db TRAINERTYPE_MOVES

	; party

	db 40, ARIADOS
		db DOUBLE_TEAM
		db SPIDER_WEB
		db BATON_PASS
		db GIGA_DRAIN

	db 41, VENOMOTH
		db SUPERSONIC
		db GUST
		db PSYCHIC_M
		db TOXIC

	db 43, FORRETRESS
		db PROTECT
		db SWIFT
		db EXPLOSION
		db SPIKES

	db 42, MUK
		db MINIMIZE
		db ACID_ARMOR
		db SLUDGE_BOMB
		db TOXIC

	db 44, CROBAT
		db DOUBLE_TEAM
		db QUICK_ATTACK
		db WING_ATTACK
		db TOXIC

	db -1 ; end

; ================
; ================================


ChampionGroup:
; ================================
; ================

	; CHAMPION (1)
	db "LANCE@"
	db TRAINERTYPE_MOVES

	; party

	db 44, GYARADOS
		db FLAIL
		db RAIN_DANCE
		db SURF
		db HYPER_BEAM

	db 47, DRAGONITE
		db THUNDER_WAVE
		db TWISTER
		db THUNDER
		db HYPER_BEAM

	db 47, DRAGONITE
		db THUNDER_WAVE
		db TWISTER
		db BLIZZARD
		db HYPER_BEAM

	db 46, AERODACTYL
		db WING_ATTACK
		db ANCIENTPOWER
		db ROCK_SLIDE
		db HYPER_BEAM

	db 46, CHARIZARD
		db FLAMETHROWER
		db WING_ATTACK
		db SLASH
		db HYPER_BEAM

	db 50, DRAGONITE
		db FIRE_BLAST
		db SAFEGUARD
		db OUTRAGE
		db HYPER_BEAM

	db -1 ; end

; ================
; ================================


BrockGroup:
; ================================
; ================

	; BROCK (1)
	db "BROCK@"
	db TRAINERTYPE_MOVES

	; party

	db 41, GRAVELER
		db DEFENSE_CURL
		db ROCK_SLIDE
		db ROLLOUT
		db EARTHQUAKE

	db 41, RHYHORN
		db FURY_ATTACK
		db SCARY_FACE
		db EARTHQUAKE
		db HORN_DRILL

	db 42, OMASTAR
		db BITE
		db SURF
		db PROTECT
		db SPIKE_CANNON

	db 44, ONIX
		db BIND
		db ROCK_SLIDE
		db BIDE
		db SANDSTORM

	db 42, KABUTOPS
		db SLASH
		db SURF
		db ENDURE
		db GIGA_DRAIN

	db -1 ; end

; ================
; ================================


MistyGroup:
; ================================
; ================

	; MISTY (1)
	db "MISTY@"
	db TRAINERTYPE_MOVES

	; party

	db 42, GOLDUCK
		db SURF
		db DISABLE
		db PSYCH_UP
		db PSYCHIC_M

	db 42, QUAGSIRE
		db SURF
		db AMNESIA
		db EARTHQUAKE
		db RAIN_DANCE

	db 44, LAPRAS
		db SURF
		db PERISH_SONG
		db BLIZZARD
		db RAIN_DANCE

	db 47, STARMIE
		db SURF
		db CONFUSE_RAY
		db RECOVER
		db ICE_BEAM

	db -1 ; end

; ================
; ================================


LtSurgeGroup:
; ================================
; ================

	; LT_SURGE (1)
	db "LT.SURGE@"
	db TRAINERTYPE_MOVES

	; party

	db 44, RAICHU
		db THUNDER_WAVE
		db QUICK_ATTACK
		db THUNDERBOLT
		db THUNDER

	db 40, ELECTRODE
		db SCREECH
		db DOUBLE_TEAM
		db SWIFT
		db EXPLOSION

	db 40, MAGNETON
		db LOCK_ON
		db DOUBLE_TEAM
		db SWIFT
		db ZAP_CANNON

	db 40, ELECTRODE
		db SCREECH
		db DOUBLE_TEAM
		db SWIFT
		db EXPLOSION

	db 46, ELECTABUZZ
		db QUICK_ATTACK
		db THUNDERPUNCH
		db LIGHT_SCREEN
		db THUNDER

	db -1 ; end

; ================
; ================================


ScientistGroup:
; ================================
; ================

	; SCIENTIST (1)
	db "ROSS@"
	db TRAINERTYPE_NORMAL

	; party
	db 22, KOFFING
	db 22, KOFFING

	db -1 ; end

; ================

	; SCIENTIST (2)
	db "MITCH@"
	db TRAINERTYPE_NORMAL

	; party
	db 24, DITTO

	db -1 ; end

; ================

	; SCIENTIST (3)
	db "JED@"
	db TRAINERTYPE_NORMAL

	; party
	db 20, MAGNEMITE
	db 20, MAGNEMITE
	db 20, MAGNEMITE

	db -1 ; end

; ================

	; SCIENTIST (4)
	db "MARC@"
	db TRAINERTYPE_NORMAL

	; party
	db 27, MAGNEMITE
	db 27, MAGNEMITE
	db 27, MAGNEMITE

	db -1 ; end

; ================

	; SCIENTIST (5)
	db "RICH@"
	db TRAINERTYPE_MOVES

	; party

	db 30, PORYGON
		db CONVERSION
		db CONVERSION2
		db RECOVER
		db TRI_ATTACK

	db -1 ; end

; ================
; ================================


ErikaGroup:
; ================================
; ================

	; ERIKA (1)
	db "ERIKA@"
	db TRAINERTYPE_MOVES

	; party

	db 42, TANGELA
		db VINE_WHIP
		db BIND
		db GIGA_DRAIN
		db SLEEP_POWDER

	db 41, JUMPLUFF
		db MEGA_DRAIN
		db LEECH_SEED
		db COTTON_SPORE
		db GIGA_DRAIN

	db 46, VICTREEBEL
		db SUNNY_DAY
		db SYNTHESIS
		db ACID
		db RAZOR_LEAF

	db 46, BELLOSSOM
		db SUNNY_DAY
		db SYNTHESIS
		db PETAL_DANCE
		db SOLARBEAM

	db -1 ; end

; ================
; ================================


YoungsterGroup:
; ================================
; ================

	; YOUNGSTER (1)
	db "JOEY@"
	db TRAINERTYPE_NORMAL

	; party
	db 4, RATTATA

	db -1 ; end

; ================

	; YOUNGSTER (2)
	db "MIKEY@"
	db TRAINERTYPE_NORMAL

	; party
	db 2, PIDGEY
	db 4, RATTATA

	db -1 ; end

; ================

	; YOUNGSTER (3)
	db "ALBERT@"
	db TRAINERTYPE_NORMAL

	; party
	db 6, RATTATA
	db 8, ZUBAT

	db -1 ; end

; ================

	; YOUNGSTER (4)
	db "GORDON@"
	db TRAINERTYPE_NORMAL

	; party
	db 10, WOOPER

	db -1 ; end

; ================

	; YOUNGSTER (5)
	db "SAMUEL@"
	db TRAINERTYPE_NORMAL

	; party
	db 7, RATTATA
	db 10, SANDSHREW
	db 8, SPEAROW
	db 8, SPEAROW

	db -1 ; end

; ================

	; YOUNGSTER (6)
	db "IAN@"
	db TRAINERTYPE_NORMAL

	; party
	db 10, MANKEY
	db 12, DIGLETT

	db -1 ; end

; ================

	; YOUNGSTER (7)
	db "JOEY@"
	db TRAINERTYPE_NORMAL

	; party
	db 15, RATTATA

	db -1 ; end

; ================

	; YOUNGSTER (8)
	db "JOEY@"
	db TRAINERTYPE_MOVES

	; party

	db 21, RATICATE
		db TAIL_WHIP
		db QUICK_ATTACK
		db HYPER_FANG
		db SCARY_FACE

	db -1 ; end

; ================

	; YOUNGSTER (9)
	db "WARREN@"
	db TRAINERTYPE_NORMAL

	; party
	db 35, FEAROW

	db -1 ; end

; ================

	; YOUNGSTER (10)
	db "JIMMY@"
	db TRAINERTYPE_NORMAL

	; party
	db 33, RATICATE
	db 33, ARBOK

	db -1 ; end

; ================

	; YOUNGSTER (11)
	db "OWEN@"
	db TRAINERTYPE_NORMAL

	; party
	db 35, GROWLITHE

	db -1 ; end

; ================

	; YOUNGSTER (12)
	db "JASON@"
	db TRAINERTYPE_NORMAL

	; party
	db 33, SANDSLASH
	db 33, CROBAT

	db -1 ; end

; ================

	; YOUNGSTER (13)
	db "JOEY@"
	db TRAINERTYPE_MOVES

	; party

	db 30, RATICATE
		db TAIL_WHIP
		db QUICK_ATTACK
		db HYPER_FANG
		db PURSUIT

	db -1 ; end

; ================

	; YOUNGSTER (14)
	db "JOEY@"
	db TRAINERTYPE_MOVES

	; party

	db 37, RATICATE
		db HYPER_BEAM
		db QUICK_ATTACK
		db HYPER_FANG
		db PURSUIT

	db -1 ; end

; ================
; ================================


SchoolboyGroup:
; ================================
; ================

	; SCHOOLBOY (1)
	db "JACK@"
	db TRAINERTYPE_NORMAL

	; party
	db 12, ODDISH
	db 15, VOLTORB

	db -1 ; end

; ================

	; SCHOOLBOY (2)
	db "KIPP@"
	db TRAINERTYPE_NORMAL

	; party
	db 27, VOLTORB
	db 27, MAGNEMITE
	db 31, VOLTORB
	db 31, MAGNETON

	db -1 ; end

; ================

	; SCHOOLBOY (3)
	db "ALAN@"
	db TRAINERTYPE_NORMAL

	; party
	db 16, TANGELA

	db -1 ; end

; ================

	; SCHOOLBOY (4)
	db "JOHNNY@"
	db TRAINERTYPE_NORMAL

	; party
	db 29, BELLSPROUT
	db 31, WEEPINBELL
	db 33, VICTREEBEL

	db -1 ; end

; ================

	; SCHOOLBOY (5)
	db "DANNY@"
	db TRAINERTYPE_NORMAL

	; party
	db 31, JYNX
	db 31, ELECTABUZZ
	db 31, MAGMAR

	db -1 ; end

; ================

	; SCHOOLBOY (6)
	db "TOMMY@"
	db TRAINERTYPE_NORMAL

	; party
	db 32, XATU
	db 34, ALAKAZAM

	db -1 ; end

; ================

	; SCHOOLBOY (7)
	db "DUDLEY@"
	db TRAINERTYPE_NORMAL

	; party
	db 35, ODDISH

	db -1 ; end

; ================

	; SCHOOLBOY (8)
	db "JOE@"
	db TRAINERTYPE_NORMAL

	; party
	db 33, TANGELA
	db 33, VAPOREON

	db -1 ; end

; ================

	; SCHOOLBOY (9)
	db "BILLY@"
	db TRAINERTYPE_NORMAL

	; party
	db 27, PARAS
	db 27, PARAS
	db 27, POLIWHIRL
	db 35, DITTO

	db -1 ; end

; ================

	; SCHOOLBOY (10)
	db "CHAD@"
	db TRAINERTYPE_NORMAL

	; party
	db 19, MR__MIME

	db -1 ; end

; ================

	; SCHOOLBOY (11)
	db "NATE@"
	db TRAINERTYPE_NORMAL

	; party
	db 32, LEDIAN
	db 32, EXEGGUTOR

	db -1 ; end

; ================

	; SCHOOLBOY (12)
	db "RICKY@"
	db TRAINERTYPE_NORMAL

	; party
	db 32, AIPOM
	db 32, DITTO

	db -1 ; end

; ================

	; SCHOOLBOY (13)
	db "JACK@"
	db TRAINERTYPE_NORMAL

	; party
	db 14, ODDISH
	db 17, VOLTORB

	db -1 ; end

; ================

	; SCHOOLBOY (14)
	db "JACK@"
	db TRAINERTYPE_NORMAL

	; party
	db 28, GLOOM
	db 31, ELECTRODE

	db -1 ; end

; ================

	; SCHOOLBOY (15)
	db "ALAN@"
	db TRAINERTYPE_NORMAL

	; party
	db 17, TANGELA
	db 17, YANMA

	db -1 ; end

; ================

	; SCHOOLBOY (16)
	db "ALAN@"
	db TRAINERTYPE_NORMAL

	; party
	db 20, NATU
	db 22, TANGELA
	db 20, QUAGSIRE
	db 25, YANMA

	db -1 ; end

; ================

	; SCHOOLBOY (17)
	db "CHAD@"
	db TRAINERTYPE_NORMAL

	; party
	db 19, MR__MIME
	db 19, MAGNEMITE

	db -1 ; end

; ================

	; SCHOOLBOY (18)
	db "CHAD@"
	db TRAINERTYPE_NORMAL

	; party
	db 27, MR__MIME
	db 31, MAGNETON

	db -1 ; end

; ================

	; SCHOOLBOY (19)
	db "JACK@"
	db TRAINERTYPE_NORMAL

	; party
	db 30, GLOOM
	db 33, GROWLITHE
	db 33, ELECTRODE

	db -1 ; end

; ================

	; SCHOOLBOY (20)
	db "JACK@"
	db TRAINERTYPE_MOVES

	; party

	db 35, ELECTRODE
		db SCREECH
		db SONICBOOM
		db ROLLOUT
		db LIGHT_SCREEN

	db 35, GROWLITHE
		db SUNNY_DAY
		db LEER
		db TAKE_DOWN
		db FLAME_WHEEL

	db 37, VILEPLUME
		db SOLARBEAM
		db SLEEP_POWDER
		db ACID
		db MOONLIGHT

	db -1 ; end

; ================

	; SCHOOLBOY (21)
	db "ALAN@"
	db TRAINERTYPE_NORMAL

	; party
	db 27, NATU
	db 27, TANGELA
	db 30, QUAGSIRE
	db 30, YANMA

	db -1 ; end

; ================

	; SCHOOLBOY (22)
	db "ALAN@"
	db TRAINERTYPE_MOVES

	; party

	db 35, XATU
		db PECK
		db NIGHT_SHADE
		db SWIFT
		db FUTURE_SIGHT

	db 32, TANGELA
		db POISONPOWDER
		db VINE_WHIP
		db BIND
		db MEGA_DRAIN

	db 32, YANMA
		db QUICK_ATTACK
		db DOUBLE_TEAM
		db SONICBOOM
		db SUPERSONIC

	db 35, QUAGSIRE
		db TAIL_WHIP
		db SLAM
		db AMNESIA
		db EARTHQUAKE

	db -1 ; end

; ================

	; SCHOOLBOY (23)
	db "CHAD@"
	db TRAINERTYPE_NORMAL

	; party
	db 30, MR__MIME
	db 34, MAGNETON

	db -1 ; end

; ================

	; SCHOOLBOY (24)
	db "CHAD@"
	db TRAINERTYPE_MOVES

	; party

	db 34, MR__MIME
		db PSYCHIC_M
		db LIGHT_SCREEN
		db REFLECT
		db ENCORE

	db 38, MAGNETON
		db ZAP_CANNON
		db THUNDER_WAVE
		db LOCK_ON
		db SWIFT

	db -1 ; end

; ================
; ================================


BirdKeeperGroup:
; ================================
; ================

	; BIRD_KEEPER (1)
	db "ROD@"
	db TRAINERTYPE_NORMAL

	; party
	db 7, PIDGEY
	db 7, PIDGEY

	db -1 ; end

; ================

	; BIRD_KEEPER (2)
	db "ABE@"
	db TRAINERTYPE_NORMAL

	; party
	db 9, SPEAROW

	db -1 ; end

; ================

	; BIRD_KEEPER (3)
	db "BRYAN@"
	db TRAINERTYPE_NORMAL

	; party
	db 12, PIDGEY
	db 14, PIDGEOTTO

	db -1 ; end

; ================

	; BIRD_KEEPER (4)
	db "THEO@"
	db TRAINERTYPE_NORMAL

	; party
	db 17, PIDGEY
	db 15, PIDGEY
	db 19, PIDGEY
	db 15, PIDGEY
	db 15, PIDGEY

	db -1 ; end

; ================

	; BIRD_KEEPER (5)
	db "TOBY@"
	db TRAINERTYPE_NORMAL

	; party
	db 15, DODUO
	db 16, DODUO
	db 17, DODUO

	db -1 ; end

; ================

	; BIRD_KEEPER (6)
	db "DENIS@"
	db TRAINERTYPE_NORMAL

	; party
	db 18, SPEAROW
	db 20, FEAROW
	db 18, SPEAROW

	db -1 ; end

; ================

	; BIRD_KEEPER (7)
	db "VANCE@"
	db TRAINERTYPE_NORMAL

	; party
	db 25, PIDGEOTTO
	db 25, PIDGEOTTO

	db -1 ; end

; ================

	; BIRD_KEEPER (8)
	db "HANK@"
	db TRAINERTYPE_NORMAL

	; party
	db 12, PIDGEY
	db 34, PIDGEOT

	db -1 ; end

; ================

	; BIRD_KEEPER (9)
	db "ROY@"
	db TRAINERTYPE_NORMAL

	; party
	db 29, FEAROW
	db 35, FEAROW

	db -1 ; end

; ================

	; BIRD_KEEPER (10)
	db "BORIS@"
	db TRAINERTYPE_NORMAL

	; party
	db 30, DODUO
	db 28, DODUO
	db 32, DODRIO

	db -1 ; end

; ================

	; BIRD_KEEPER (11)
	db "BOB@"
	db TRAINERTYPE_NORMAL

	; party
	db 34, NOCTOWL

	db -1 ; end

; ================

	; BIRD_KEEPER (12)
	db "JOSE@"
	db TRAINERTYPE_NORMAL

	; party
	db 36, FARFETCH_D

	db -1 ; end

; ================

	; BIRD_KEEPER (13)
	db "PETER@"
	db TRAINERTYPE_NORMAL

	; party
	db 6, PIDGEY
	db 6, PIDGEY
	db 8, SPEAROW

	db -1 ; end

; ================

	; BIRD_KEEPER (14)
	db "JOSE@"
	db TRAINERTYPE_NORMAL

	; party
	db 34, FARFETCH_D

	db -1 ; end

; ================

	; BIRD_KEEPER (15)
	db "PERRY@"
	db TRAINERTYPE_NORMAL

	; party
	db 34, FARFETCH_D

	db -1 ; end

; ================

	; BIRD_KEEPER (16)
	db "BRET@"
	db TRAINERTYPE_NORMAL

	; party
	db 32, PIDGEOTTO
	db 32, FEAROW

	db -1 ; end

; ================

	; BIRD_KEEPER (17)
	db "JOSE@"
	db TRAINERTYPE_MOVES

	; party

	db 40, FARFETCH_D
		db FURY_ATTACK
		db DETECT
		db FLY
		db SLASH

	db -1 ; end

; ================

	; BIRD_KEEPER (18)
	db "VANCE@"
	db TRAINERTYPE_NORMAL

	; party
	db 32, PIDGEOTTO
	db 32, PIDGEOTTO

	db -1 ; end

; ================

	; BIRD_KEEPER (19)
	db "VANCE@"
	db TRAINERTYPE_MOVES

	; party

	db 38, PIDGEOT
		db TOXIC
		db QUICK_ATTACK
		db WHIRLWIND
		db FLY

	db 38, PIDGEOT
		db SWIFT
		db DETECT
		db STEEL_WING
		db FLY

	db -1 ; end

; ================
; ================================


LassGroup:
; ================================
; ================

	; LASS (1)
	db "CARRIE@"
	db TRAINERTYPE_MOVES

	; party

	db 18, SNUBBULL
		db SCARY_FACE
		db CHARM
		db BITE
		db LICK

	db -1 ; end

; ================

	; LASS (2)
	db "BRIDGET@"
	db TRAINERTYPE_NORMAL

	; party
	db 15, JIGGLYPUFF
	db 15, JIGGLYPUFF
	db 15, JIGGLYPUFF

	db -1 ; end

; ================

	; LASS (3)
	db "ALICE@"
	db TRAINERTYPE_NORMAL

	; party
	db 30, GLOOM
	db 34, ARBOK
	db 30, GLOOM

	db -1 ; end

; ================

	; LASS (4)
	db "KRISE@"
	db TRAINERTYPE_NORMAL

	; party
	db 12, ODDISH
	db 15, CUBONE

	db -1 ; end

; ================

	; LASS (5)
	db "CONNIE@"
	db TRAINERTYPE_NORMAL

	; party
	db 21, MARILL

	db -1 ; end

; ================

	; LASS (6)
	db "LINDA@"
	db TRAINERTYPE_NORMAL

	; party
	db 30, BULBASAUR
	db 32, IVYSAUR
	db 34, VENUSAUR

	db -1 ; end

; ================

	; LASS (7)
	db "LAURA@"
	db TRAINERTYPE_NORMAL

	; party
	db 28, GLOOM
	db 31, PIDGEOTTO
	db 31, BELLOSSOM

	db -1 ; end

; ================

	; LASS (8)
	db "SHANNON@"
	db TRAINERTYPE_NORMAL

	; party
	db 29, PARAS
	db 29, PARAS
	db 32, PARASECT

	db -1 ; end

; ================

	; LASS (9)
	db "MICHELLE@"
	db TRAINERTYPE_NORMAL

	; party
	db 32, SKIPLOOM
	db 33, HOPPIP
	db 34, JUMPLUFF

	db -1 ; end

; ================

	; LASS (10)
	db "DANA@"
	db TRAINERTYPE_MOVES

	; party

	db 18, FLAAFFY
		db TACKLE
		db GROWL
		db THUNDERSHOCK
		db THUNDER_WAVE

	db 18, PSYDUCK
		db SCRATCH
		db TAIL_WHIP
		db DISABLE
		db CONFUSION

	db -1 ; end

; ================

	; LASS (11)
	db "ELLEN@"
	db TRAINERTYPE_NORMAL

	; party
	db 30, WIGGLYTUFF
	db 34, GRANBULL

	db -1 ; end

; ================

	; LASS (12)
	db "CONNIE@"
	db TRAINERTYPE_NORMAL

	; party
	db 21, MARILL

	db -1 ; end

; ================

	; LASS (13)
	db "CONNIE@"
	db TRAINERTYPE_NORMAL

	; party
	db 21, MARILL

	db -1 ; end

; ================

	; LASS (14)
	db "DANA@"
	db TRAINERTYPE_MOVES

	; party

	db 21, FLAAFFY
		db TACKLE
		db GROWL
		db THUNDERSHOCK
		db THUNDER_WAVE

	db 21, PSYDUCK
		db SCRATCH
		db TAIL_WHIP
		db DISABLE
		db CONFUSION

	db -1 ; end

; ================

	; LASS (15)
	db "DANA@"
	db TRAINERTYPE_MOVES

	; party

	db 29, PSYDUCK
		db SCRATCH
		db DISABLE
		db CONFUSION
		db SCREECH

	db 29, AMPHAROS
		db TACKLE
		db THUNDERSHOCK
		db THUNDER_WAVE
		db COTTON_SPORE

	db -1 ; end

; ================

	; LASS (16)
	db "DANA@"
	db TRAINERTYPE_MOVES

	; party

	db 32, PSYDUCK
		db SCRATCH
		db DISABLE
		db CONFUSION
		db SCREECH

	db 32, AMPHAROS
		db TACKLE
		db THUNDERPUNCH
		db THUNDER_WAVE
		db COTTON_SPORE

	db -1 ; end

; ================

	; LASS (17)
	db "DANA@"
	db TRAINERTYPE_MOVES

	; party

	db 36, AMPHAROS
		db SWIFT
		db THUNDERPUNCH
		db THUNDER_WAVE
		db COTTON_SPORE

	db 36, GOLDUCK
		db DISABLE
		db SURF
		db PSYCHIC_M
		db SCREECH

	db -1 ; end

; ================
; ================================


JanineGroup:
; ================================
; ================

	; JANINE (1)
	db "JANINE@"
	db TRAINERTYPE_MOVES

	; party

	db 36, CROBAT
		db SCREECH
		db SUPERSONIC
		db CONFUSE_RAY
		db WING_ATTACK

	db 36, WEEZING
		db SMOG
		db SLUDGE_BOMB
		db TOXIC
		db EXPLOSION

	db 36, WEEZING
		db SMOG
		db SLUDGE_BOMB
		db TOXIC
		db EXPLOSION

	db 33, ARIADOS
		db SCARY_FACE
		db GIGA_DRAIN
		db STRING_SHOT
		db NIGHT_SHADE

	db 39, VENOMOTH
		db FORESIGHT
		db DOUBLE_TEAM
		db GUST
		db PSYCHIC_M

	db -1 ; end

; ================
; ================================


CooltrainerMGroup:
; ================================
; ================

	; COOLTRAINERM (1)
	db "NICK@"
	db TRAINERTYPE_MOVES

	; party

	db 26, CHARMANDER
		db EMBER
		db SMOKESCREEN
		db RAGE
		db SCARY_FACE

	db 26, SQUIRTLE
		db WITHDRAW
		db WATER_GUN
		db BITE
		db CURSE

	db 26, BULBASAUR
		db LEECH_SEED
		db POISONPOWDER
		db SLEEP_POWDER
		db RAZOR_LEAF

	db -1 ; end

; ================

	; COOLTRAINERM (2)
	db "AARON@"
	db TRAINERTYPE_NORMAL

	; party
	db 24, IVYSAUR
	db 24, CHARMELEON
	db 24, WARTORTLE

	db -1 ; end

; ================

	; COOLTRAINERM (3)
	db "PAUL@"
	db TRAINERTYPE_NORMAL

	; party
	db 34, DRATINI
	db 34, DRATINI
	db 34, DRATINI

	db -1 ; end

; ================

	; COOLTRAINERM (4)
	db "CODY@"
	db TRAINERTYPE_NORMAL

	; party
	db 34, HORSEA
	db 36, SEADRA

	db -1 ; end

; ================

	; COOLTRAINERM (5)
	db "MIKE@"
	db TRAINERTYPE_NORMAL

	; party
	db 37, DRAGONAIR

	db -1 ; end

; ================

	; COOLTRAINERM (6)
	db "GAVEN@"
	db TRAINERTYPE_MOVES

	; party

	db 35, VICTREEBEL
		db WRAP
		db TOXIC
		db ACID
		db RAZOR_LEAF

	db 35, KINGLER
		db BUBBLEBEAM
		db STOMP
		db GUILLOTINE
		db PROTECT

	db 35, FLAREON
		db SAND_ATTACK
		db QUICK_ATTACK
		db BITE
		db FIRE_SPIN

	db -1 ; end

; ================

	; COOLTRAINERM (7)
	db "GAVEN@"
	db TRAINERTYPE_ITEM_MOVES

	; party

	db 39, VICTREEBEL, NO_ITEM
		db GIGA_DRAIN
		db TOXIC
		db SLUDGE_BOMB
		db RAZOR_LEAF

	db 39, KINGLER, KINGS_ROCK
		db SURF
		db STOMP
		db GUILLOTINE
		db BLIZZARD

	db 39, FLAREON, NO_ITEM
		db FLAMETHROWER
		db QUICK_ATTACK
		db BITE
		db FIRE_SPIN

	db -1 ; end

; ================

	; COOLTRAINERM (8)
	db "RYAN@"
	db TRAINERTYPE_MOVES

	; party

	db 25, PIDGEOT
		db SAND_ATTACK
		db QUICK_ATTACK
		db WHIRLWIND
		db WING_ATTACK

	db 27, ELECTABUZZ
		db THUNDERPUNCH
		db LIGHT_SCREEN
		db SWIFT
		db SCREECH

	db -1 ; end

; ================

	; COOLTRAINERM (9)
	db "JAKE@"
	db TRAINERTYPE_MOVES

	; party

	db 33, PARASECT
		db LEECH_LIFE
		db SPORE
		db SLASH
		db SWORDS_DANCE

	db 35, GOLDUCK
		db CONFUSION
		db SCREECH
		db PSYCH_UP
		db FURY_SWIPES

	db -1 ; end

; ================

	; COOLTRAINERM (10)
	db "GAVEN@"
	db TRAINERTYPE_MOVES

	; party

	db 32, VICTREEBEL
		db WRAP
		db TOXIC
		db ACID
		db RAZOR_LEAF

	db 32, KINGLER
		db BUBBLEBEAM
		db STOMP
		db GUILLOTINE
		db PROTECT

	db 32, FLAREON
		db SAND_ATTACK
		db QUICK_ATTACK
		db BITE
		db FIRE_SPIN

	db -1 ; end

; ================

	; COOLTRAINERM (11)
	db "BLAKE@"
	db TRAINERTYPE_MOVES

	; party

	db 33, MAGNETON
		db THUNDERBOLT
		db SUPERSONIC
		db SWIFT
		db SCREECH

	db 31, QUAGSIRE
		db WATER_GUN
		db SLAM
		db AMNESIA
		db EARTHQUAKE

	db 31, EXEGGCUTE
		db LEECH_SEED
		db CONFUSION
		db SLEEP_POWDER
		db SOLARBEAM

	db -1 ; end

; ================

	; COOLTRAINERM (12)
	db "BRIAN@"
	db TRAINERTYPE_MOVES

	; party

	db 35, SANDSLASH
		db SAND_ATTACK
		db POISON_STING
		db SLASH
		db SWIFT

	db -1 ; end

; ================

	; COOLTRAINERM (13)
	db "ERICK@"
	db TRAINERTYPE_NORMAL

	; party
	db 10, BULBASAUR
	db 10, CHARMANDER
	db 10, SQUIRTLE

	db -1 ; end

; ================

	; COOLTRAINERM (14)
	db "ANDY@"
	db TRAINERTYPE_NORMAL

	; party
	db 10, BULBASAUR
	db 10, CHARMANDER
	db 10, SQUIRTLE

	db -1 ; end

; ================

	; COOLTRAINERM (15)
	db "TYLER@"
	db TRAINERTYPE_NORMAL

	; party
	db 10, BULBASAUR
	db 10, CHARMANDER
	db 10, SQUIRTLE

	db -1 ; end

; ================

	; COOLTRAINERM (16)
	db "SEAN@"
	db TRAINERTYPE_NORMAL

	; party
	db 35, FLAREON
	db 35, TANGELA
	db 35, TAUROS

	db -1 ; end

; ================

	; COOLTRAINERM (17)
	db "KEVIN@"
	db TRAINERTYPE_NORMAL

	; party
	db 38, RHYHORN
	db 35, CHARMELEON
	db 35, WARTORTLE

	db -1 ; end

; ================

	; COOLTRAINERM (18)
	db "STEVE@"
	db TRAINERTYPE_NORMAL

	; party
	db 14, BULBASAUR
	db 14, CHARMANDER
	db 14, SQUIRTLE

	db -1 ; end

; ================

	; COOLTRAINERM (19)
	db "ALLEN@"
	db TRAINERTYPE_MOVES

	; party

	db 27, CHARMELEON
		db EMBER
		db SMOKESCREEN
		db RAGE
		db SCARY_FACE

	db -1 ; end

; ================

	; COOLTRAINERM (20)
	db "DARIN@"
	db TRAINERTYPE_MOVES

	; party

	db 37, DRAGONAIR
		db WRAP
		db SURF
		db DRAGON_RAGE
		db SLAM

	db -1 ; end

; ================
; ================================


CooltrainerFGroup:
; ================================
; ================

	; COOLTRAINERF (1)
	db "GWEN@"
	db TRAINERTYPE_NORMAL

	; party
	db 26, EEVEE
	db 22, FLAREON
	db 22, VAPOREON
	db 22, JOLTEON

	db -1 ; end

; ================

	; COOLTRAINERF (2)
	db "LOIS@"
	db TRAINERTYPE_MOVES

	; party

	db 25, SKIPLOOM
		db SYNTHESIS
		db POISONPOWDER
		db MEGA_DRAIN
		db LEECH_SEED

	db 25, NINETALES
		db EMBER
		db QUICK_ATTACK
		db CONFUSE_RAY
		db SAFEGUARD

	db -1 ; end

; ================

	; COOLTRAINERF (3)
	db "FRAN@"
	db TRAINERTYPE_NORMAL

	; party
	db 37, SEADRA

	db -1 ; end

; ================

	; COOLTRAINERF (4)
	db "LOLA@"
	db TRAINERTYPE_NORMAL

	; party
	db 34, DRATINI
	db 36, DRAGONAIR

	db -1 ; end

; ================

	; COOLTRAINERF (5)
	db "KATE@"
	db TRAINERTYPE_NORMAL

	; party
	db 26, SHELLDER
	db 28, CLOYSTER

	db -1 ; end

; ================

	; COOLTRAINERF (6)
	db "IRENE@"
	db TRAINERTYPE_NORMAL

	; party
	db 22, GOLDEEN
	db 24, SEAKING

	db -1 ; end

; ================

	; COOLTRAINERF (7)
	db "KELLY@"
	db TRAINERTYPE_NORMAL

	; party
	db 27, MARILL
	db 24, WARTORTLE
	db 24, WARTORTLE

	db -1 ; end

; ================

	; COOLTRAINERF (8)
	db "JOYCE@"
	db TRAINERTYPE_MOVES

	; party

	db 36, PIKACHU
		db QUICK_ATTACK
		db DOUBLE_TEAM
		db THUNDERBOLT
		db THUNDER

	db 32, BLASTOISE
		db BITE
		db CURSE
		db SURF
		db RAIN_DANCE

	db -1 ; end

; ================

	; COOLTRAINERF (9)
	db "BETH@"
	db TRAINERTYPE_MOVES

	; party

	db 36, RAPIDASH
		db STOMP
		db FIRE_SPIN
		db FURY_ATTACK
		db AGILITY

	db -1 ; end

; ================

	; COOLTRAINERF (10)
	db "REENA@"
	db TRAINERTYPE_NORMAL

	; party
	db 31, STARMIE
	db 33, NIDOQUEEN
	db 31, STARMIE

	db -1 ; end

; ================

	; COOLTRAINERF (11)
	db "MEGAN@"
	db TRAINERTYPE_MOVES

	; party

	db 32, BULBASAUR
		db GROWL
		db LEECH_SEED
		db POISONPOWDER
		db RAZOR_LEAF

	db 32, IVYSAUR
		db GROWL
		db LEECH_SEED
		db POISONPOWDER
		db RAZOR_LEAF

	db 32, VENUSAUR
		db BODY_SLAM
		db SLEEP_POWDER
		db RAZOR_LEAF
		db SWEET_SCENT

	db -1 ; end

; ================

	; COOLTRAINERF (12)
	db "BETH@"
	db TRAINERTYPE_MOVES

	; party

	db 39, RAPIDASH
		db STOMP
		db FIRE_SPIN
		db FURY_ATTACK
		db AGILITY

	db -1 ; end

; ================

	; COOLTRAINERF (13)
	db "CAROL@"
	db TRAINERTYPE_NORMAL

	; party
	db 35, ELECTRODE
	db 35, STARMIE
	db 35, NINETALES

	db -1 ; end

; ================

	; COOLTRAINERF (14)
	db "QUINN@"
	db TRAINERTYPE_NORMAL

	; party
	db 38, IVYSAUR
	db 38, STARMIE

	db -1 ; end

; ================

	; COOLTRAINERF (15)
	db "EMMA@"
	db TRAINERTYPE_NORMAL

	; party
	db 28, POLIWHIRL

	db -1 ; end

; ================

	; COOLTRAINERF (16)
	db "CYBIL@"
	db TRAINERTYPE_MOVES

	; party

	db 25, BUTTERFREE
		db CONFUSION
		db SLEEP_POWDER
		db WHIRLWIND
		db GUST

	db 25, BELLOSSOM
		db ABSORB
		db STUN_SPORE
		db ACID
		db SOLARBEAM

	db -1 ; end

; ================

	; COOLTRAINERF (17)
	db "JENN@"
	db TRAINERTYPE_NORMAL

	; party
	db 24, STARYU
	db 26, STARMIE

	db -1 ; end

; ================

	; COOLTRAINERF (18)
	db "BETH@"
	db TRAINERTYPE_ITEM_MOVES

	; party

	db 43, RAPIDASH, FOCUS_BAND
		db STOMP
		db FIRE_SPIN
		db FURY_ATTACK
		db FIRE_BLAST

	db -1 ; end

; ================

	; COOLTRAINERF (19)
	db "REENA@"
	db TRAINERTYPE_NORMAL

	; party
	db 34, STARMIE
	db 36, NIDOQUEEN
	db 34, STARMIE

	db -1 ; end

; ================

	; COOLTRAINERF (20)
	db "REENA@"
	db TRAINERTYPE_ITEM_MOVES

	; party

	db 38, STARMIE, NO_ITEM
		db DOUBLE_TEAM
		db PSYCHIC_M
		db WATERFALL
		db CONFUSE_RAY

	db 40, NIDOQUEEN, PINK_BOW
		db EARTHQUAKE
		db DOUBLE_KICK
		db TOXIC
		db BODY_SLAM

	db 38, STARMIE, NO_ITEM
		db BLIZZARD
		db PSYCHIC_M
		db WATERFALL
		db RECOVER

	db -1 ; end

; ================

	; COOLTRAINERF (21)
	db "CARA@"
	db TRAINERTYPE_MOVES

	; party

	db 33, HORSEA
		db SMOKESCREEN
		db LEER
		db WHIRLPOOL
		db TWISTER

	db 33, HORSEA
		db SMOKESCREEN
		db LEER
		db WHIRLPOOL
		db TWISTER

	db 35, SEADRA
		db SWIFT
		db LEER
		db WATERFALL
		db TWISTER

	db -1 ; end

; ================
; ================================


BeautyGroup:
; ================================
; ================

	; BEAUTY (1)
	db "VICTORIA@"
	db TRAINERTYPE_NORMAL

	; party
	db 9, SENTRET
	db 13, SENTRET
	db 17, SENTRET

	db -1 ; end

; ================

	; BEAUTY (2)
	db "SAMANTHA@"
	db TRAINERTYPE_MOVES

	; party

	db 16, MEOWTH
		db SCRATCH
		db GROWL
		db BITE
		db PAY_DAY

	db 16, MEOWTH
		db SCRATCH
		db GROWL
		db BITE
		db SLASH

	db -1 ; end

; ================

	; BEAUTY (3)
	db "JULIE@"
	db TRAINERTYPE_NORMAL

	; party
	db 15, SENTRET

	db -1 ; end

; ================

	; BEAUTY (4)
	db "JACLYN@"
	db TRAINERTYPE_NORMAL

	; party
	db 15, SENTRET

	db -1 ; end

; ================

	; BEAUTY (5)
	db "BRENDA@"
	db TRAINERTYPE_NORMAL

	; party
	db 16, FURRET

	db -1 ; end

; ================

	; BEAUTY (6)
	db "CASSIE@"
	db TRAINERTYPE_NORMAL

	; party
	db 28, VILEPLUME
	db 34, BUTTERFREE

	db -1 ; end

; ================

	; BEAUTY (7)
	db "CAROLINE@"
	db TRAINERTYPE_NORMAL

	; party
	db 30, MARILL
	db 32, SEEL
	db 30, MARILL

	db -1 ; end

; ================

	; BEAUTY (8)
	db "CARLENE@"
	db TRAINERTYPE_NORMAL

	; party
	db 15, SENTRET

	db -1 ; end

; ================

	; BEAUTY (9)
	db "JESSICA@"
	db TRAINERTYPE_NORMAL

	; party
	db 15, SENTRET

	db -1 ; end

; ================

	; BEAUTY (10)
	db "RACHAEL@"
	db TRAINERTYPE_NORMAL

	; party
	db 15, SENTRET

	db -1 ; end

; ================

	; BEAUTY (11)
	db "ANGELICA@"
	db TRAINERTYPE_NORMAL

	; party
	db 15, SENTRET

	db -1 ; end

; ================

	; BEAUTY (12)
	db "KENDRA@"
	db TRAINERTYPE_NORMAL

	; party
	db 15, SENTRET

	db -1 ; end

; ================

	; BEAUTY (13)
	db "VERONICA@"
	db TRAINERTYPE_NORMAL

	; party
	db 15, SENTRET

	db -1 ; end

; ================

	; BEAUTY (14)
	db "JULIA@"
	db TRAINERTYPE_NORMAL

	; party
	db 32, PARAS
	db 32, EXEGGCUTE
	db 35, PARASECT

	db -1 ; end

; ================

	; BEAUTY (15)
	db "THERESA@"
	db TRAINERTYPE_NORMAL

	; party
	db 15, SENTRET

	db -1 ; end

; ================

	; BEAUTY (16)
	db "VALERIE@"
	db TRAINERTYPE_MOVES

	; party

	db 17, HOPPIP
		db SYNTHESIS
		db TAIL_WHIP
		db TACKLE
		db POISONPOWDER

	db 17, SKIPLOOM
		db SYNTHESIS
		db TAIL_WHIP
		db TACKLE
		db STUN_SPORE

	db -1 ; end

; ================

	; BEAUTY (17)
	db "OLIVIA@"
	db TRAINERTYPE_NORMAL

	; party
	db 19, CORSOLA

	db -1 ; end

; ================
; ================================


PokemaniacGroup:
; ================================
; ================

	; POKEMANIAC (1)
	db "LARRY@"
	db TRAINERTYPE_NORMAL

	; party
	db 10, SLOWPOKE

	db -1 ; end

; ================

	; POKEMANIAC (2)
	db "ANDREW@"
	db TRAINERTYPE_NORMAL

	; party
	db 24, MAROWAK
	db 24, MAROWAK

	db -1 ; end

; ================

	; POKEMANIAC (3)
	db "CALVIN@"
	db TRAINERTYPE_NORMAL

	; party
	db 26, KANGASKHAN

	db -1 ; end

; ================

	; POKEMANIAC (4)
	db "SHANE@"
	db TRAINERTYPE_NORMAL

	; party
	db 16, NIDORINA
	db 16, NIDORINO

	db -1 ; end

; ================

	; POKEMANIAC (5)
	db "BEN@"
	db TRAINERTYPE_NORMAL

	; party
	db 19, SLOWBRO

	db -1 ; end

; ================

	; POKEMANIAC (6)
	db "BRENT@"
	db TRAINERTYPE_NORMAL

	; party
	db 19, LICKITUNG

	db -1 ; end

; ================

	; POKEMANIAC (7)
	db "RON@"
	db TRAINERTYPE_NORMAL

	; party
	db 19, NIDOKING

	db -1 ; end

; ================

	; POKEMANIAC (8)
	db "ETHAN@"
	db TRAINERTYPE_NORMAL

	; party
	db 31, RHYHORN
	db 31, RHYDON

	db -1 ; end

; ================

	; POKEMANIAC (9)
	db "BRENT@"
	db TRAINERTYPE_NORMAL

	; party
	db 25, KANGASKHAN

	db -1 ; end

; ================

	; POKEMANIAC (10)
	db "BRENT@"
	db TRAINERTYPE_MOVES

	; party

	db 36, PORYGON
		db RECOVER
		db PSYCHIC_M
		db CONVERSION2
		db TRI_ATTACK

	db -1 ; end

; ================

	; POKEMANIAC (11)
	db "ISSAC@"
	db TRAINERTYPE_MOVES

	; party

	db 12, LICKITUNG
		db LICK
		db SUPERSONIC
		db CUT
		db 0

	db -1 ; end

; ================

	; POKEMANIAC (12)
	db "DONALD@"
	db TRAINERTYPE_NORMAL

	; party
	db 10, SLOWPOKE
	db 10, SLOWPOKE

	db -1 ; end

; ================

	; POKEMANIAC (13)
	db "ZACH@"
	db TRAINERTYPE_NORMAL

	; party
	db 27, RHYHORN

	db -1 ; end

; ================

	; POKEMANIAC (14)
	db "BRENT@"
	db TRAINERTYPE_MOVES

	; party

	db 41, CHANSEY
		db ROLLOUT
		db ATTRACT
		db EGG_BOMB
		db SOFTBOILED

	db -1 ; end

; ================

	; POKEMANIAC (15)
	db "MILLER@"
	db TRAINERTYPE_NORMAL

	; party
	db 17, NIDOKING
	db 17, NIDOQUEEN

	db -1 ; end

; ================
; ================================


GruntMGroup:
; ================================
; ================

	; GRUNTM (1)
	db "GRUNT@"
	db TRAINERTYPE_NORMAL

	; party
	db 14, KOFFING

	db -1 ; end

; ================

	; GRUNTM (2)
	db "GRUNT@"
	db TRAINERTYPE_NORMAL

	; party
	db 7, RATTATA
	db 9, ZUBAT
	db 9, ZUBAT

	db -1 ; end

; ================

	; GRUNTM (3)
	db "GRUNT@"
	db TRAINERTYPE_NORMAL

	; party
	db 24, RATICATE
	db 24, RATICATE

	db -1 ; end

; ================

	; GRUNTM (4)
	db "GRUNT@"
	db TRAINERTYPE_NORMAL

	; party
	db 23, GRIMER
	db 23, GRIMER
	db 25, MUK

	db -1 ; end

; ================

	; GRUNTM (5)
	db "GRUNT@"
	db TRAINERTYPE_NORMAL

	; party
	db 21, RATTATA
	db 21, RATTATA
	db 23, RATTATA
	db 23, RATTATA
	db 23, RATTATA

	db -1 ; end

; ================

	; GRUNTM (6)
	db "GRUNT@"
	db TRAINERTYPE_NORMAL

	; party
	db 26, ZUBAT
	db 26, ZUBAT

	db -1 ; end

; ================

	; GRUNTM (7)
	db "GRUNT@"
	db TRAINERTYPE_NORMAL

	; party
	db 23, KOFFING
	db 23, GRIMER
	db 23, ZUBAT
	db 23, RATTATA

	db -1 ; end

; ================

	; GRUNTM (8)
	db "GRUNT@"
	db TRAINERTYPE_NORMAL

	; party
	db 26, WEEZING

	db -1 ; end

; ================

	; GRUNTM (9)
	db "GRUNT@"
	db TRAINERTYPE_NORMAL

	; party
	db 24, RATICATE
	db 26, KOFFING

	db -1 ; end

; ================

	; GRUNTM (10)
	db "GRUNT@"
	db TRAINERTYPE_NORMAL

	; party
	db 22, ZUBAT
	db 24, GOLBAT
	db 22, GRIMER

	db -1 ; end

; ================

	; GRUNTM (11)
	db "GRUNT@"
	db TRAINERTYPE_NORMAL

	; party
	db 23, MUK
	db 23, KOFFING
	db 25, RATTATA

	db -1 ; end

; ================

	; GRUNTM (12)
	db "EXECUTIVE@"
	db TRAINERTYPE_NORMAL

	; party
	db 33, HOUNDOUR

	db -1 ; end

; ================

	; GRUNTM (13)
	db "GRUNT@"
	db TRAINERTYPE_NORMAL

	; party
	db 27, RATTATA

	db -1 ; end

; ================

	; GRUNTM (14)
	db "GRUNT@"
	db TRAINERTYPE_NORMAL

	; party
	db 24, RATICATE
	db 24, GOLBAT

	db -1 ; end

; ================

	; GRUNTM (15)
	db "GRUNT@"
	db TRAINERTYPE_NORMAL

	; party
	db 26, GRIMER
	db 23, WEEZING

	db -1 ; end

; ================

	; GRUNTM (16)
	db "GRUNT@"
	db TRAINERTYPE_NORMAL

	; party
	db 16, RATTATA
	db 16, RATTATA
	db 16, RATTATA
	db 16, RATTATA

	db -1 ; end

; ================

	; GRUNTM (17)
	db "GRUNT@"
	db TRAINERTYPE_NORMAL

	; party
	db 18, GOLBAT

	db -1 ; end

; ================

	; GRUNTM (18)
	db "GRUNT@"
	db TRAINERTYPE_NORMAL

	; party
	db 17, RATTATA
	db 17, ZUBAT
	db 17, RATTATA

	db -1 ; end

; ================

	; GRUNTM (19)
	db "GRUNT@"
	db TRAINERTYPE_NORMAL

	; party
	db 18, VENONAT
	db 18, VENONAT

	db -1 ; end

; ================

	; GRUNTM (20)
	db "GRUNT@"
	db TRAINERTYPE_NORMAL

	; party
	db 17, DROWZEE
	db 19, ZUBAT

	db -1 ; end

; ================

	; GRUNTM (21)
	db "GRUNT@"
	db TRAINERTYPE_NORMAL

	; party
	db 16, ZUBAT
	db 17, GRIMER
	db 18, RATTATA

	db -1 ; end

; ================

	; GRUNTM (22)
	db "EXECUTIVE@"
	db TRAINERTYPE_NORMAL

	; party
	db 36, GOLBAT

	db -1 ; end

; ================

	; GRUNTM (23)
	db "EXECUTIVE@"
	db TRAINERTYPE_NORMAL

	; party
	db 30, KOFFING

	db -1 ; end

; ================

	; GRUNTM (24)
	db "GRUNT@"
	db TRAINERTYPE_NORMAL

	; party
	db 25, KOFFING
	db 25, KOFFING

	db -1 ; end

; ================

	; GRUNTM (25)
	db "GRUNT@"
	db TRAINERTYPE_NORMAL

	; party
	db 24, KOFFING
	db 24, MUK

	db -1 ; end

; ================

	; GRUNTM (26)
	db "GRUNT@"
	db TRAINERTYPE_NORMAL

	; party
	db 15, RATTATA
	db 15, RATTATA

	db -1 ; end

; ================

	; GRUNTM (27)
	db "EXECUTIVE@"
	db TRAINERTYPE_NORMAL

	; party
	db 22, ZUBAT

	db -1 ; end

; ================

	; GRUNTM (28)
	db "GRUNT@"
	db TRAINERTYPE_NORMAL

	; party
	db 19, RATICATE

	db -1 ; end

; ================

	; GRUNTM (29)
	db "GRUNT@"
	db TRAINERTYPE_NORMAL

	; party
	db 9, RATTATA
	db 9, RATTATA

	db -1 ; end

; ================

	; GRUNTM (30)
	db "GRUNT@"
	db TRAINERTYPE_NORMAL

	; party
	db 25, GOLBAT
	db 25, GOLBAT
	db 30, ARBOK

	db -1 ; end

; ================

	; GRUNTM (31)
	db "GRUNT@"
	db TRAINERTYPE_NORMAL

	; party
	db 30, GOLBAT

	db -1 ; end

; ================
; ================================


GentlemanGroup:
; ================================
; ================

	; GENTLEMAN (1)
	db "PRESTON@"
	db TRAINERTYPE_NORMAL

	; party
	db 18, GROWLITHE
	db 18, GROWLITHE

	db -1 ; end

; ================

	; GENTLEMAN (2)
	db "EDWARD@"
	db TRAINERTYPE_NORMAL

	; party
	db 33, PERSIAN

	db -1 ; end

; ================

	; GENTLEMAN (3)
	db "GREGORY@"
	db TRAINERTYPE_NORMAL

	; party
	db 37, PIKACHU
	db 33, FLAAFFY

	db -1 ; end

; ================

	; GENTLEMAN (4)
	db "VIRGIL@"
	db TRAINERTYPE_NORMAL

	; party
	db 20, PONYTA

	db -1 ; end

; ================

	; GENTLEMAN (5)
	db "ALFRED@"
	db TRAINERTYPE_NORMAL

	; party
	db 20, NOCTOWL

	db -1 ; end

; ================
; ================================


SkierGroup:
; ================================
; ================

	; SKIER (1)
	db "ROXANNE@"
	db TRAINERTYPE_NORMAL

	; party
	db 28, JYNX

	db -1 ; end

; ================

	; SKIER (2)
	db "CLARISSA@"
	db TRAINERTYPE_NORMAL

	; party
	db 28, DEWGONG

	db -1 ; end

; ================
; ================================


TeacherGroup:
; ================================
; ================

	; TEACHER (1)
	db "COLETTE@"
	db TRAINERTYPE_NORMAL

	; party
	db 36, CLEFAIRY

	db -1 ; end

; ================

	; TEACHER (2)
	db "HILLARY@"
	db TRAINERTYPE_NORMAL

	; party
	db 32, AIPOM
	db 36, CUBONE

	db -1 ; end

; ================

	; TEACHER (3)
	db "SHIRLEY@"
	db TRAINERTYPE_NORMAL

	; party
	db 35, JIGGLYPUFF

	db -1 ; end

; ================
; ================================


SabrinaGroup:
; ================================
; ================

	; SABRINA (1)
	db "SABRINA@"
	db TRAINERTYPE_MOVES

	; party

	db 46, ESPEON
		db SAND_ATTACK
		db QUICK_ATTACK
		db SWIFT
		db PSYCHIC_M

	db 46, MR__MIME
		db BARRIER
		db REFLECT
		db BATON_PASS
		db PSYCHIC_M

	db 48, ALAKAZAM
		db RECOVER
		db FUTURE_SIGHT
		db PSYCHIC_M
		db REFLECT

	db -1 ; end

; ================
; ================================


BugCatcherGroup:
; ================================
; ================

	; BUG_CATCHER (1)
	db "DON@"
	db TRAINERTYPE_NORMAL

	; party
	db 3, CATERPIE
	db 3, CATERPIE

	db -1 ; end

; ================

	; BUG_CATCHER (2)
	db "ROB@"
	db TRAINERTYPE_NORMAL

	; party
	db 32, BEEDRILL
	db 32, BUTTERFREE

	db -1 ; end

; ================

	; BUG_CATCHER (3)
	db "ED@"
	db TRAINERTYPE_NORMAL

	; party
	db 30, BEEDRILL
	db 30, BEEDRILL
	db 30, BEEDRILL

	db -1 ; end

; ================

	; BUG_CATCHER (4)
	db "WADE@"
	db TRAINERTYPE_NORMAL

	; party
	db 2, CATERPIE
	db 2, CATERPIE
	db 3, WEEDLE
	db 2, CATERPIE

	db -1 ; end

; ================

	; BUG_CATCHER (5)
	db "BENNY@"
	db TRAINERTYPE_NORMAL

	; party
	db 7, WEEDLE
	db 9, KAKUNA
	db 12, BEEDRILL

	db -1 ; end

; ================

	; BUG_CATCHER (6)
	db "AL@"
	db TRAINERTYPE_NORMAL

	; party
	db 12, CATERPIE
	db 12, WEEDLE

	db -1 ; end

; ================

	; BUG_CATCHER (7)
	db "JOSH@"
	db TRAINERTYPE_NORMAL

	; party
	db 13, PARAS

	db -1 ; end

; ================

	; BUG_CATCHER (8)
	db "ARNIE@"
	db TRAINERTYPE_NORMAL

	; party
	db 15, VENONAT

	db -1 ; end

; ================

	; BUG_CATCHER (9)
	db "KEN@"
	db TRAINERTYPE_NORMAL

	; party
	db 30, ARIADOS
	db 32, PINSIR

	db -1 ; end

; ================

	; BUG_CATCHER (10)
	db "WADE@"
	db TRAINERTYPE_NORMAL

	; party
	db 9, METAPOD
	db 9, METAPOD
	db 10, KAKUNA
	db 9, METAPOD

	db -1 ; end

; ================

	; BUG_CATCHER (11)
	db "WADE@"
	db TRAINERTYPE_NORMAL

	; party
	db 14, BUTTERFREE
	db 14, BUTTERFREE
	db 15, BEEDRILL
	db 14, BUTTERFREE

	db -1 ; end

; ================

	; BUG_CATCHER (12)
	db "DOUG@"
	db TRAINERTYPE_NORMAL

	; party
	db 34, ARIADOS

	db -1 ; end

; ================

	; BUG_CATCHER (13)
	db "ARNIE@"
	db TRAINERTYPE_NORMAL

	; party
	db 19, VENONAT

	db -1 ; end

; ================

	; BUG_CATCHER (14)
	db "ARNIE@"
	db TRAINERTYPE_MOVES

	; party

	db 28, VENOMOTH
		db DISABLE
		db SUPERSONIC
		db CONFUSION
		db LEECH_LIFE

	db -1 ; end

; ================

	; BUG_CATCHER (15)
	db "WADE@"
	db TRAINERTYPE_MOVES

	; party

	db 24, BUTTERFREE
		db CONFUSION
		db POISONPOWDER
		db SUPERSONIC
		db WHIRLWIND

	db 24, BUTTERFREE
		db CONFUSION
		db STUN_SPORE
		db SUPERSONIC
		db WHIRLWIND

	db 25, BEEDRILL
		db FURY_ATTACK
		db FOCUS_ENERGY
		db TWINEEDLE
		db RAGE

	db 24, BUTTERFREE
		db CONFUSION
		db SLEEP_POWDER
		db SUPERSONIC
		db WHIRLWIND

	db -1 ; end

; ================

	; BUG_CATCHER (16)
	db "WADE@"
	db TRAINERTYPE_MOVES

	; party

	db 30, BUTTERFREE
		db CONFUSION
		db POISONPOWDER
		db SUPERSONIC
		db GUST

	db 30, BUTTERFREE
		db CONFUSION
		db STUN_SPORE
		db SUPERSONIC
		db GUST

	db 32, BEEDRILL
		db FURY_ATTACK
		db PURSUIT
		db TWINEEDLE
		db DOUBLE_TEAM

	db 34, BUTTERFREE
		db PSYBEAM
		db SLEEP_POWDER
		db GUST
		db WHIRLWIND

	db -1 ; end

; ================

	; BUG_CATCHER (17)
	db "ARNIE@"
	db TRAINERTYPE_MOVES

	; party

	db 36, VENOMOTH
		db GUST
		db SUPERSONIC
		db PSYBEAM
		db LEECH_LIFE

	db -1 ; end

; ================

	; BUG_CATCHER (18)
	db "ARNIE@"
	db TRAINERTYPE_MOVES

	; party

	db 40, VENOMOTH
		db GUST
		db SUPERSONIC
		db PSYCHIC_M
		db TOXIC

	db -1 ; end

; ================

	; BUG_CATCHER (19)
	db "WAYNE@"
	db TRAINERTYPE_NORMAL

	; party
	db 8, LEDYBA
	db 10, PARAS

	db -1 ; end

; ================
; ================================


FisherGroup:
; ================================
; ================

	; FISHER (1)
	db "JUSTIN@"
	db TRAINERTYPE_NORMAL

	; party
	db 5, MAGIKARP
	db 5, MAGIKARP
	db 15, MAGIKARP
	db 5, MAGIKARP

	db -1 ; end

; ================

	; FISHER (2)
	db "RALPH@"
	db TRAINERTYPE_NORMAL

	; party
	db 10, GOLDEEN

	db -1 ; end

; ================

	; FISHER (3)
	db "ARNOLD@"
	db TRAINERTYPE_NORMAL

	; party
	db 34, TENTACRUEL

	db -1 ; end

; ================

	; FISHER (4)
	db "KYLE@"
	db TRAINERTYPE_NORMAL

	; party
	db 28, SEAKING
	db 31, POLIWHIRL
	db 31, SEAKING

	db -1 ; end

; ================

	; FISHER (5)
	db "HENRY@"
	db TRAINERTYPE_NORMAL

	; party
	db 8, POLIWAG
	db 8, POLIWAG

	db -1 ; end

; ================

	; FISHER (6)
	db "MARVIN@"
	db TRAINERTYPE_NORMAL

	; party
	db 10, MAGIKARP
	db 10, GYARADOS
	db 15, MAGIKARP
	db 15, GYARADOS

	db -1 ; end

; ================

	; FISHER (7)
	db "TULLY@"
	db TRAINERTYPE_NORMAL

	; party
	db 18, QWILFISH

	db -1 ; end

; ================

	; FISHER (8)
	db "ANDRE@"
	db TRAINERTYPE_NORMAL

	; party
	db 27, GYARADOS

	db -1 ; end

; ================

	; FISHER (9)
	db "RAYMOND@"
	db TRAINERTYPE_NORMAL

	; party
	db 22, MAGIKARP
	db 22, MAGIKARP
	db 22, MAGIKARP
	db 22, MAGIKARP

	db -1 ; end

; ================

	; FISHER (10)
	db "WILTON@"
	db TRAINERTYPE_NORMAL

	; party
	db 23, GOLDEEN
	db 23, GOLDEEN
	db 25, SEAKING

	db -1 ; end

; ================

	; FISHER (11)
	db "EDGAR@"
	db TRAINERTYPE_MOVES

	; party

	db 25, REMORAID
		db LOCK_ON
		db PSYBEAM
		db AURORA_BEAM
		db BUBBLEBEAM

	db 25, REMORAID
		db LOCK_ON
		db PSYBEAM
		db AURORA_BEAM
		db BUBBLEBEAM

	db -1 ; end

; ================

	; FISHER (12)
	db "JONAH@"
	db TRAINERTYPE_NORMAL

	; party
	db 25, SHELLDER
	db 29, OCTILLERY
	db 25, REMORAID
	db 29, CLOYSTER

	db -1 ; end

; ================

	; FISHER (13)
	db "MARTIN@"
	db TRAINERTYPE_NORMAL

	; party
	db 32, REMORAID
	db 32, REMORAID

	db -1 ; end

; ================

	; FISHER (14)
	db "STEPHEN@"
	db TRAINERTYPE_NORMAL

	; party
	db 25, MAGIKARP
	db 25, MAGIKARP
	db 31, QWILFISH
	db 31, TENTACRUEL

	db -1 ; end

; ================

	; FISHER (15)
	db "BARNEY@"
	db TRAINERTYPE_NORMAL

	; party
	db 30, GYARADOS
	db 30, GYARADOS
	db 30, GYARADOS

	db -1 ; end

; ================

	; FISHER (16)
	db "RALPH@"
	db TRAINERTYPE_NORMAL

	; party
	db 17, GOLDEEN

	db -1 ; end

; ================

	; FISHER (17)
	db "RALPH@"
	db TRAINERTYPE_NORMAL

	; party
	db 17, QWILFISH
	db 19, GOLDEEN

	db -1 ; end

; ================

	; FISHER (18)
	db "TULLY@"
	db TRAINERTYPE_NORMAL

	; party
	db 23, QWILFISH

	db -1 ; end

; ================

	; FISHER (19)
	db "TULLY@"
	db TRAINERTYPE_NORMAL

	; party
	db 32, GOLDEEN
	db 32, GOLDEEN
	db 32, QWILFISH

	db -1 ; end

; ================

	; FISHER (20)
	db "WILTON@"
	db TRAINERTYPE_NORMAL

	; party
	db 29, GOLDEEN
	db 29, GOLDEEN
	db 32, SEAKING

	db -1 ; end

; ================

	; FISHER (21)
	db "SCOTT@"
	db TRAINERTYPE_NORMAL

	; party
	db 30, QWILFISH
	db 30, QWILFISH
	db 34, SEAKING

	db -1 ; end

; ================

	; FISHER (22)
	db "WILTON@"
	db TRAINERTYPE_MOVES

	; party

	db 34, SEAKING
		db SUPERSONIC
		db WATERFALL
		db FLAIL
		db FURY_ATTACK

	db 34, SEAKING
		db SUPERSONIC
		db WATERFALL
		db FLAIL
		db FURY_ATTACK

	db 38, REMORAID
		db PSYBEAM
		db AURORA_BEAM
		db BUBBLEBEAM
		db HYPER_BEAM

	db -1 ; end

; ================

	; FISHER (23)
	db "RALPH@"
	db TRAINERTYPE_NORMAL

	; party
	db 30, QWILFISH
	db 32, GOLDEEN

	db -1 ; end

; ================

	; FISHER (24)
	db "RALPH@"
	db TRAINERTYPE_MOVES

	; party

	db 35, QWILFISH
		db TOXIC
		db MINIMIZE
		db SURF
		db PIN_MISSILE

	db 39, SEAKING
		db ENDURE
		db FLAIL
		db FURY_ATTACK
		db WATERFALL

	db -1 ; end

; ================

	; FISHER (25)
	db "TULLY@"
	db TRAINERTYPE_MOVES

	; party

	db 34, SEAKING
		db SUPERSONIC
		db RAIN_DANCE
		db WATERFALL
		db FURY_ATTACK

	db 34, SEAKING
		db SUPERSONIC
		db RAIN_DANCE
		db WATERFALL
		db FURY_ATTACK

	db 37, QWILFISH
		db ROLLOUT
		db SURF
		db PIN_MISSILE
		db TAKE_DOWN

	db -1 ; end

; ================
; ================================


SwimmerMGroup:
; ================================
; ================

	; SWIMMERM (1)
	db "HAROLD@"
	db TRAINERTYPE_NORMAL

	; party
	db 32, REMORAID
	db 30, SEADRA

	db -1 ; end

; ================

	; SWIMMERM (2)
	db "SIMON@"
	db TRAINERTYPE_NORMAL

	; party
	db 20, TENTACOOL
	db 20, TENTACOOL

	db -1 ; end

; ================

	; SWIMMERM (3)
	db "RANDALL@"
	db TRAINERTYPE_NORMAL

	; party
	db 18, SHELLDER
	db 20, WARTORTLE
	db 18, SHELLDER

	db -1 ; end

; ================

	; SWIMMERM (4)
	db "CHARLIE@"
	db TRAINERTYPE_NORMAL

	; party
	db 21, SHELLDER
	db 19, TENTACOOL
	db 19, TENTACRUEL

	db -1 ; end

; ================

	; SWIMMERM (5)
	db "GEORGE@"
	db TRAINERTYPE_NORMAL

	; party
	db 16, TENTACOOL
	db 17, TENTACOOL
	db 16, TENTACOOL
	db 19, STARYU
	db 17, TENTACOOL
	db 19, REMORAID

	db -1 ; end

; ================

	; SWIMMERM (6)
	db "BERKE@"
	db TRAINERTYPE_NORMAL

	; party
	db 23, QWILFISH

	db -1 ; end

; ================

	; SWIMMERM (7)
	db "KIRK@"
	db TRAINERTYPE_NORMAL

	; party
	db 20, GYARADOS
	db 20, GYARADOS

	db -1 ; end

; ================

	; SWIMMERM (8)
	db "MATHEW@"
	db TRAINERTYPE_NORMAL

	; party
	db 23, KRABBY

	db -1 ; end

; ================

	; SWIMMERM (9)
	db "HAL@"
	db TRAINERTYPE_NORMAL

	; party
	db 24, SEEL
	db 25, DEWGONG
	db 24, SEEL

	db -1 ; end

; ================

	; SWIMMERM (10)
	db "PATON@"
	db TRAINERTYPE_NORMAL

	; party
	db 26, PILOSWINE
	db 26, PILOSWINE

	db -1 ; end

; ================

	; SWIMMERM (11)
	db "DARYL@"
	db TRAINERTYPE_NORMAL

	; party
	db 24, SHELLDER
	db 25, CLOYSTER
	db 24, SHELLDER

	db -1 ; end

; ================

	; SWIMMERM (12)
	db "WALTER@"
	db TRAINERTYPE_NORMAL

	; party
	db 15, HORSEA
	db 15, HORSEA
	db 20, SEADRA

	db -1 ; end

; ================

	; SWIMMERM (13)
	db "TONY@"
	db TRAINERTYPE_NORMAL

	; party
	db 13, STARYU
	db 18, STARMIE
	db 16, HORSEA

	db -1 ; end

; ================

	; SWIMMERM (14)
	db "JEROME@"
	db TRAINERTYPE_NORMAL

	; party
	db 26, SEADRA
	db 28, TENTACOOL
	db 30, TENTACRUEL
	db 28, GOLDEEN

	db -1 ; end

; ================

	; SWIMMERM (15)
	db "TUCKER@"
	db TRAINERTYPE_NORMAL

	; party
	db 30, SHELLDER
	db 34, CLOYSTER

	db -1 ; end

; ================

	; SWIMMERM (16)
	db "RICK@"
	db TRAINERTYPE_NORMAL

	; party
	db 13, STARYU
	db 18, STARMIE
	db 16, HORSEA

	db -1 ; end

; ================

	; SWIMMERM (17)
	db "CAMERON@"
	db TRAINERTYPE_NORMAL

	; party
	db 34, MARILL

	db -1 ; end

; ================

	; SWIMMERM (18)
	db "SETH@"
	db TRAINERTYPE_NORMAL

	; party
	db 29, QUAGSIRE
	db 29, OCTILLERY
	db 32, QUAGSIRE

	db -1 ; end

; ================

	; SWIMMERM (19)
	db "JAMES@"
	db TRAINERTYPE_NORMAL

	; party
	db 13, STARYU
	db 18, STARMIE
	db 16, HORSEA

	db -1 ; end

; ================

	; SWIMMERM (20)
	db "LEWIS@"
	db TRAINERTYPE_NORMAL

	; party
	db 13, STARYU
	db 18, STARMIE
	db 16, HORSEA

	db -1 ; end

; ================

	; SWIMMERM (21)
	db "PARKER@"
	db TRAINERTYPE_NORMAL

	; party
	db 32, HORSEA
	db 32, HORSEA
	db 35, SEADRA

	db -1 ; end

; ================
; ================================


SwimmerFGroup:
; ================================
; ================

	; SWIMMERF (1)
	db "ELAINE@"
	db TRAINERTYPE_NORMAL

	; party
	db 21, STARYU

	db -1 ; end

; ================

	; SWIMMERF (2)
	db "PAULA@"
	db TRAINERTYPE_NORMAL

	; party
	db 19, STARYU
	db 19, SHELLDER

	db -1 ; end

; ================

	; SWIMMERF (3)
	db "KAYLEE@"
	db TRAINERTYPE_NORMAL

	; party
	db 18, GOLDEEN
	db 20, GOLDEEN
	db 20, SEAKING

	db -1 ; end

; ================

	; SWIMMERF (4)
	db "SUSIE@"
	db TRAINERTYPE_MOVES

	; party

	db 20, PSYDUCK
		db SCRATCH
		db TAIL_WHIP
		db DISABLE
		db CONFUSION

	db 22, GOLDEEN
		db PECK
		db TAIL_WHIP
		db SUPERSONIC
		db HORN_ATTACK

	db -1 ; end

; ================

	; SWIMMERF (5)
	db "DENISE@"
	db TRAINERTYPE_NORMAL

	; party
	db 22, SEEL

	db -1 ; end

; ================

	; SWIMMERF (6)
	db "KARA@"
	db TRAINERTYPE_NORMAL

	; party
	db 20, STARYU
	db 20, STARMIE

	db -1 ; end

; ================

	; SWIMMERF (7)
	db "WENDY@"
	db TRAINERTYPE_MOVES

	; party

	db 21, HORSEA
		db BUBBLE
		db SMOKESCREEN
		db LEER
		db WATER_GUN

	db 21, HORSEA
		db DRAGON_RAGE
		db SMOKESCREEN
		db LEER
		db WATER_GUN

	db -1 ; end

; ================

	; SWIMMERF (8)
	db "LISA@"
	db TRAINERTYPE_NORMAL

	; party
	db 28, JYNX

	db -1 ; end

; ================

	; SWIMMERF (9)
	db "JILL@"
	db TRAINERTYPE_NORMAL

	; party
	db 28, DEWGONG

	db -1 ; end

; ================

	; SWIMMERF (10)
	db "MARY@"
	db TRAINERTYPE_NORMAL

	; party
	db 20, SEAKING

	db -1 ; end

; ================

	; SWIMMERF (11)
	db "KATIE@"
	db TRAINERTYPE_NORMAL

	; party
	db 33, DEWGONG

	db -1 ; end

; ================

	; SWIMMERF (12)
	db "DAWN@"
	db TRAINERTYPE_NORMAL

	; party
	db 34, SEAKING

	db -1 ; end

; ================

	; SWIMMERF (13)
	db "TARA@"
	db TRAINERTYPE_NORMAL

	; party
	db 20, SEAKING

	db -1 ; end

; ================

	; SWIMMERF (14)
	db "NICOLE@"
	db TRAINERTYPE_NORMAL

	; party
	db 29, MARILL
	db 29, MARILL
	db 32, LAPRAS

	db -1 ; end

; ================

	; SWIMMERF (15)
	db "LORI@"
	db TRAINERTYPE_NORMAL

	; party
	db 32, STARMIE
	db 32, STARMIE

	db -1 ; end

; ================

	; SWIMMERF (16)
	db "JODY@"
	db TRAINERTYPE_NORMAL

	; party
	db 20, SEAKING

	db -1 ; end

; ================

	; SWIMMERF (17)
	db "NIKKI@"
	db TRAINERTYPE_NORMAL

	; party
	db 28, SEEL
	db 28, SEEL
	db 28, SEEL
	db 28, DEWGONG

	db -1 ; end

; ================

	; SWIMMERF (18)
	db "DIANA@"
	db TRAINERTYPE_NORMAL

	; party
	db 37, GOLDUCK

	db -1 ; end

; ================

	; SWIMMERF (19)
	db "BRIANA@"
	db TRAINERTYPE_NORMAL

	; party
	db 35, SEAKING
	db 35, SEAKING

	db -1 ; end

; ================
; ================================


SailorGroup:
; ================================
; ================

	; SAILOR (1)
	db "EUGENE@"
	db TRAINERTYPE_NORMAL

	; party
	db 17, POLIWHIRL
	db 17, RATICATE
	db 19, KRABBY

	db -1 ; end

; ================

	; SAILOR (2)
	db "HUEY@"
	db TRAINERTYPE_NORMAL

	; party
	db 18, POLIWAG
	db 18, POLIWHIRL

	db -1 ; end

; ================

	; SAILOR (3)
	db "TERRELL@"
	db TRAINERTYPE_NORMAL

	; party
	db 20, POLIWHIRL

	db -1 ; end

; ================

	; SAILOR (4)
	db "KENT@"
	db TRAINERTYPE_MOVES

	; party

	db 18, KRABBY
		db BUBBLE
		db LEER
		db VICEGRIP
		db HARDEN

	db 20, KRABBY
		db BUBBLEBEAM
		db LEER
		db VICEGRIP
		db HARDEN

	db -1 ; end

; ================

	; SAILOR (5)
	db "ERNEST@"
	db TRAINERTYPE_NORMAL

	; party
	db 18, MACHOP
	db 18, MACHOP
	db 18, POLIWHIRL

	db -1 ; end

; ================

	; SAILOR (6)
	db "JEFF@"
	db TRAINERTYPE_NORMAL

	; party
	db 32, RATICATE
	db 32, RATICATE

	db -1 ; end

; ================

	; SAILOR (7)
	db "GARRETT@"
	db TRAINERTYPE_NORMAL

	; party
	db 34, KINGLER

	db -1 ; end

; ================

	; SAILOR (8)
	db "KENNETH@"
	db TRAINERTYPE_NORMAL

	; party
	db 28, MACHOP
	db 28, MACHOP
	db 28, POLIWRATH
	db 28, MACHOP

	db -1 ; end

; ================

	; SAILOR (9)
	db "STANLY@"
	db TRAINERTYPE_NORMAL

	; party
	db 31, MACHOP
	db 33, MACHOKE
	db 26, PSYDUCK

	db -1 ; end

; ================

	; SAILOR (10)
	db "HARRY@"
	db TRAINERTYPE_NORMAL

	; party
	db 19, WOOPER

	db -1 ; end

; ================

	; SAILOR (11)
	db "HUEY@"
	db TRAINERTYPE_NORMAL

	; party
	db 28, POLIWHIRL
	db 28, POLIWHIRL

	db -1 ; end

; ================

	; SAILOR (12)
	db "HUEY@"
	db TRAINERTYPE_NORMAL

	; party
	db 34, POLIWHIRL
	db 34, POLIWRATH

	db -1 ; end

; ================

	; SAILOR (13)
	db "HUEY@"
	db TRAINERTYPE_MOVES

	; party

	db 38, POLITOED
		db WHIRLPOOL
		db RAIN_DANCE
		db BODY_SLAM
		db PERISH_SONG

	db 38, POLIWRATH
		db SURF
		db STRENGTH
		db ICE_PUNCH
		db SUBMISSION

	db -1 ; end

; ================
; ================================


SuperNerdGroup:
; ================================
; ================

	; SUPER_NERD (1)
	db "STAN@"
	db TRAINERTYPE_NORMAL

	; party
	db 20, GRIMER

	db -1 ; end

; ================

	; SUPER_NERD (2)
	db "ERIC@"
	db TRAINERTYPE_NORMAL

	; party
	db 11, GRIMER
	db 11, GRIMER

	db -1 ; end

; ================

	; SUPER_NERD (3)
	db "GREGG@"
	db TRAINERTYPE_NORMAL

	; party
	db 20, MAGNEMITE
	db 20, MAGNEMITE
	db 20, MAGNEMITE

	db -1 ; end

; ================

	; SUPER_NERD (4)
	db "JAY@"
	db TRAINERTYPE_NORMAL

	; party
	db 22, KOFFING
	db 22, KOFFING

	db -1 ; end

; ================

	; SUPER_NERD (5)
	db "DAVE@"
	db TRAINERTYPE_NORMAL

	; party
	db 24, DITTO

	db -1 ; end

; ================

	; SUPER_NERD (6)
	db "SAM@"
	db TRAINERTYPE_NORMAL

	; party
	db 34, GRIMER
	db 34, MUK

	db -1 ; end

; ================

	; SUPER_NERD (7)
	db "TOM@"
	db TRAINERTYPE_NORMAL

	; party
	db 32, MAGNEMITE
	db 32, MAGNEMITE
	db 32, MAGNEMITE

	db -1 ; end

; ================

	; SUPER_NERD (8)
	db "PAT@"
	db TRAINERTYPE_NORMAL

	; party
	db 36, PORYGON

	db -1 ; end

; ================

	; SUPER_NERD (9)
	db "SHAWN@"
	db TRAINERTYPE_NORMAL

	; party
	db 31, MAGNEMITE
	db 33, MUK
	db 31, MAGNEMITE

	db -1 ; end

; ================

	; SUPER_NERD (10)
	db "TERU@"
	db TRAINERTYPE_NORMAL

	; party
	db 7, MAGNEMITE
	db 11, VOLTORB
	db 7, MAGNEMITE
	db 9, MAGNEMITE

	db -1 ; end

; ================

	; SUPER_NERD (11)
	db "RUSS@"
	db TRAINERTYPE_NORMAL

	; party
	db 27, MAGNEMITE
	db 27, MAGNEMITE
	db 27, MAGNEMITE

	db -1 ; end

; ================

	; SUPER_NERD (12)
	db "NORTON@"
	db TRAINERTYPE_MOVES

	; party

	db 30, PORYGON
		db CONVERSION
		db CONVERSION2
		db RECOVER
		db TRI_ATTACK

	db -1 ; end

; ================

	; SUPER_NERD (13)
	db "HUGH@"
	db TRAINERTYPE_MOVES

	; party

	db 39, SEADRA
		db SMOKESCREEN
		db TWISTER
		db SURF
		db WATERFALL

	db -1 ; end

; ================

	; SUPER_NERD (14)
	db "MARKUS@"
	db TRAINERTYPE_MOVES

	; party

	db 19, SLOWPOKE
		db CURSE
		db WATER_GUN
		db GROWL
		db STRENGTH

	db -1 ; end

; ================
; ================================


Rival2Group:
; ================================
; ================

	; RIVAL2 (1)
	db "?@"
	db TRAINERTYPE_MOVES

	; party

	db 41, SNEASEL
		db QUICK_ATTACK
		db SCREECH
		db FAINT_ATTACK
		db FURY_CUTTER

	db 42, GOLBAT
		db LEECH_LIFE
		db BITE
		db CONFUSE_RAY
		db WING_ATTACK

	db 41, MAGNETON
		db THUNDERSHOCK
		db SONICBOOM
		db THUNDER_WAVE
		db SWIFT

	db 43, GENGAR
		db MEAN_LOOK
		db CURSE
		db SHADOW_BALL
		db CONFUSE_RAY

	db 43, ALAKAZAM
		db DISABLE
		db RECOVER
		db FUTURE_SIGHT
		db PSYCHIC_M

	db 45, MEGANIUM
		db RAZOR_LEAF
		db POISONPOWDER
		db BODY_SLAM
		db LIGHT_SCREEN

	db -1 ; end

; ================

	; RIVAL2 (2)
	db "?@"
	db TRAINERTYPE_MOVES

	; party

	db 41, SNEASEL
		db QUICK_ATTACK
		db SCREECH
		db FAINT_ATTACK
		db FURY_CUTTER

	db 42, GOLBAT
		db LEECH_LIFE
		db BITE
		db CONFUSE_RAY
		db WING_ATTACK

	db 41, MAGNETON
		db THUNDERSHOCK
		db SONICBOOM
		db THUNDER_WAVE
		db SWIFT

	db 43, GENGAR
		db MEAN_LOOK
		db CURSE
		db SHADOW_BALL
		db CONFUSE_RAY

	db 43, ALAKAZAM
		db DISABLE
		db RECOVER
		db FUTURE_SIGHT
		db PSYCHIC_M

	db 45, TYPHLOSION
		db SMOKESCREEN
		db QUICK_ATTACK
		db FLAME_WHEEL
		db SWIFT

	db -1 ; end

; ================

	; RIVAL2 (3)
	db "?@"
	db TRAINERTYPE_MOVES

	; party

	db 41, SNEASEL
		db QUICK_ATTACK
		db SCREECH
		db FAINT_ATTACK
		db FURY_CUTTER

	db 42, GOLBAT
		db LEECH_LIFE
		db BITE
		db CONFUSE_RAY
		db WING_ATTACK

	db 41, MAGNETON
		db THUNDERSHOCK
		db SONICBOOM
		db THUNDER_WAVE
		db SWIFT

	db 43, GENGAR
		db MEAN_LOOK
		db CURSE
		db SHADOW_BALL
		db CONFUSE_RAY

	db 43, ALAKAZAM
		db DISABLE
		db RECOVER
		db FUTURE_SIGHT
		db PSYCHIC_M

	db 45, FERALIGATR
		db RAGE
		db WATER_GUN
		db SCARY_FACE
		db SLASH

	db -1 ; end

; ================

	; RIVAL2 (4)
	db "?@"
	db TRAINERTYPE_MOVES

	; party

	db 45, SNEASEL
		db QUICK_ATTACK
		db SCREECH
		db FAINT_ATTACK
		db FURY_CUTTER

	db 48, CROBAT
		db TOXIC
		db BITE
		db CONFUSE_RAY
		db WING_ATTACK

	db 45, MAGNETON
		db THUNDER
		db SONICBOOM
		db THUNDER_WAVE
		db SWIFT

	db 46, GENGAR
		db MEAN_LOOK
		db CURSE
		db SHADOW_BALL
		db CONFUSE_RAY

	db 46, ALAKAZAM
		db RECOVER
		db FUTURE_SIGHT
		db PSYCHIC_M
		db REFLECT

	db 50, MEGANIUM
		db GIGA_DRAIN
		db BODY_SLAM
		db LIGHT_SCREEN
		db SAFEGUARD

	db -1 ; end

; ================

	; RIVAL2 (5)
	db "?@"
	db TRAINERTYPE_MOVES

	; party

	db 45, SNEASEL
		db QUICK_ATTACK
		db SCREECH
		db FAINT_ATTACK
		db FURY_CUTTER

	db 48, CROBAT
		db TOXIC
		db BITE
		db CONFUSE_RAY
		db WING_ATTACK

	db 45, MAGNETON
		db THUNDER
		db SONICBOOM
		db THUNDER_WAVE
		db SWIFT

	db 46, GENGAR
		db MEAN_LOOK
		db CURSE
		db SHADOW_BALL
		db CONFUSE_RAY

	db 46, ALAKAZAM
		db RECOVER
		db FUTURE_SIGHT
		db PSYCHIC_M
		db REFLECT

	db 50, TYPHLOSION
		db SMOKESCREEN
		db QUICK_ATTACK
		db FIRE_BLAST
		db SWIFT

	db -1 ; end

; ================

	; RIVAL2 (6)
	db "?@"
	db TRAINERTYPE_MOVES

	; party

	db 45, SNEASEL
		db QUICK_ATTACK
		db SCREECH
		db FAINT_ATTACK
		db FURY_CUTTER

	db 48, CROBAT
		db TOXIC
		db BITE
		db CONFUSE_RAY
		db WING_ATTACK

	db 45, MAGNETON
		db THUNDER
		db SONICBOOM
		db THUNDER_WAVE
		db SWIFT

	db 46, GENGAR
		db MEAN_LOOK
		db CURSE
		db SHADOW_BALL
		db CONFUSE_RAY

	db 46, ALAKAZAM
		db RECOVER
		db FUTURE_SIGHT
		db PSYCHIC_M
		db REFLECT

	db 50, FERALIGATR
		db SURF
		db RAIN_DANCE
		db SLASH
		db SCREECH

	db -1 ; end

; ================
; ================================


GuitaristGroup:
; ================================
; ================

	; GUITARIST (1)
	db "CLYDE@"
	db TRAINERTYPE_NORMAL

	; party
	db 34, ELECTABUZZ

	db -1 ; end

; ================

	; GUITARIST (2)
	db "VINCENT@"
	db TRAINERTYPE_NORMAL

	; party
	db 27, MAGNEMITE
	db 33, VOLTORB
	db 32, MAGNEMITE
	db 32, MAGNEMITE

	db -1 ; end

; ================
; ================================


HikerGroup:
; ================================
; ================

	; HIKER (1)
	db "ANTHONY@"
	db TRAINERTYPE_NORMAL

	; party
	db 16, GEODUDE
	db 18, MACHAMP

	db -1 ; end

; ================

	; HIKER (2)
	db "RUSSELL@"
	db TRAINERTYPE_NORMAL

	; party
	db 4, GEODUDE
	db 6, GEODUDE
	db 8, GEODUDE

	db -1 ; end

; ================

	; HIKER (3)
	db "PHILLIP@"
	db TRAINERTYPE_NORMAL

	; party
	db 23, GEODUDE
	db 23, GEODUDE
	db 23, GRAVELER

	db -1 ; end

; ================

	; HIKER (4)
	db "LEONARD@"
	db TRAINERTYPE_NORMAL

	; party
	db 23, GEODUDE
	db 25, MACHOP

	db -1 ; end

; ================

	; HIKER (5)
	db "ANTHONY@"
	db TRAINERTYPE_NORMAL

	; party
	db 11, GEODUDE
	db 11, MACHOP

	db -1 ; end

; ================

	; HIKER (6)
	db "BENJAMIN@"
	db TRAINERTYPE_NORMAL

	; party
	db 14, DIGLETT
	db 14, GEODUDE
	db 16, DUGTRIO

	db -1 ; end

; ================

	; HIKER (7)
	db "ERIK@"
	db TRAINERTYPE_NORMAL

	; party
	db 24, MACHOP
	db 27, GRAVELER
	db 27, MACHOP

	db -1 ; end

; ================

	; HIKER (8)
	db "MICHAEL@"
	db TRAINERTYPE_NORMAL

	; party
	db 25, GEODUDE
	db 25, GRAVELER
	db 25, GOLEM

	db -1 ; end

; ================

	; HIKER (9)
	db "PARRY@"
	db TRAINERTYPE_NORMAL

	; party
	db 35, ONIX
	db 33, SWINUB

	db -1 ; end

; ================

	; HIKER (10)
	db "TIMOTHY@"
	db TRAINERTYPE_MOVES

	; party

	db 27, DIGLETT
		db MAGNITUDE
		db DIG
		db SAND_ATTACK
		db SLASH

	db 27, DUGTRIO
		db MAGNITUDE
		db DIG
		db SAND_ATTACK
		db SLASH

	db -1 ; end

; ================

	; HIKER (11)
	db "BAILEY@"
	db TRAINERTYPE_NORMAL

	; party
	db 13, GEODUDE
	db 13, GEODUDE
	db 13, GEODUDE
	db 13, GEODUDE
	db 13, GEODUDE

	db -1 ; end

; ================

	; HIKER (12)
	db "ANTHONY@"
	db TRAINERTYPE_NORMAL

	; party
	db 25, GRAVELER
	db 27, GRAVELER
	db 29, MACHOKE

	db -1 ; end

; ================

	; HIKER (13)
	db "TIM@"
	db TRAINERTYPE_NORMAL

	; party
	db 31, GRAVELER
	db 31, GRAVELER
	db 31, GRAVELER

	db -1 ; end

; ================

	; HIKER (14)
	db "NOLAND@"
	db TRAINERTYPE_NORMAL

	; party
	db 31, SANDSLASH
	db 33, GOLEM

	db -1 ; end

; ================

	; HIKER (15)
	db "SIDNEY@"
	db TRAINERTYPE_NORMAL

	; party
	db 34, DUGTRIO
	db 32, ONIX

	db -1 ; end

; ================

	; HIKER (16)
	db "KENNY@"
	db TRAINERTYPE_NORMAL

	; party
	db 27, SANDSLASH
	db 29, GRAVELER
	db 31, GOLEM
	db 29, GRAVELER

	db -1 ; end

; ================

	; HIKER (17)
	db "JIM@"
	db TRAINERTYPE_NORMAL

	; party
	db 35, MACHAMP

	db -1 ; end

; ================

	; HIKER (18)
	db "DANIEL@"
	db TRAINERTYPE_NORMAL

	; party
	db 11, ONIX

	db -1 ; end

; ================

	; HIKER (19)
	db "PARRY@"
	db TRAINERTYPE_MOVES

	; party

	db 35, PILOSWINE
		db EARTHQUAKE
		db BLIZZARD
		db REST
		db TAKE_DOWN

	db 35, DUGTRIO
		db MAGNITUDE
		db DIG
		db MUD_SLAP
		db SLASH

	db 38, STEELIX
		db DIG
		db IRON_TAIL
		db SANDSTORM
		db SLAM

	db -1 ; end

; ================

	; HIKER (20)
	db "PARRY@"
	db TRAINERTYPE_NORMAL

	; party
	db 29, ONIX

	db -1 ; end

; ================

	; HIKER (21)
	db "ANTHONY@"
	db TRAINERTYPE_NORMAL

	; party
	db 30, GRAVELER
	db 30, GRAVELER
	db 32, MACHOKE

	db -1 ; end

; ================

	; HIKER (22)
	db "ANTHONY@"
	db TRAINERTYPE_MOVES

	; party

	db 34, GRAVELER
		db MAGNITUDE
		db SELFDESTRUCT
		db DEFENSE_CURL
		db ROLLOUT

	db 36, GOLEM
		db MAGNITUDE
		db SELFDESTRUCT
		db DEFENSE_CURL
		db ROLLOUT

	db 34, MACHOKE
		db KARATE_CHOP
		db VITAL_THROW
		db HEADBUTT
		db DIG

	db -1 ; end

; ================
; ================================


BikerGroup:
; ================================
; ================

	; BIKER (1)
	db "BENNY@"
	db TRAINERTYPE_NORMAL

	; party
	db 20, KOFFING
	db 20, KOFFING
	db 20, KOFFING

	db -1 ; end

; ================

	; BIKER (2)
	db "KAZU@"
	db TRAINERTYPE_NORMAL

	; party
	db 20, KOFFING
	db 20, KOFFING
	db 20, KOFFING

	db -1 ; end

; ================

	; BIKER (3)
	db "DWAYNE@"
	db TRAINERTYPE_NORMAL

	; party
	db 27, KOFFING
	db 28, KOFFING
	db 29, KOFFING
	db 30, KOFFING

	db -1 ; end

; ================

	; BIKER (4)
	db "HARRIS@"
	db TRAINERTYPE_NORMAL

	; party
	db 34, FLAREON

	db -1 ; end

; ================

	; BIKER (5)
	db "ZEKE@"
	db TRAINERTYPE_NORMAL

	; party
	db 32, KOFFING
	db 32, KOFFING

	db -1 ; end

; ================

	; BIKER (6)
	db "CHARLES@"
	db TRAINERTYPE_NORMAL

	; party
	db 30, KOFFING
	db 30, CHARMELEON
	db 30, WEEZING

	db -1 ; end

; ================

	; BIKER (7)
	db "RILEY@"
	db TRAINERTYPE_NORMAL

	; party
	db 34, WEEZING

	db -1 ; end

; ================

	; BIKER (8)
	db "JOEL@"
	db TRAINERTYPE_NORMAL

	; party
	db 32, MAGMAR
	db 32, MAGMAR

	db -1 ; end

; ================

	; BIKER (9)
	db "GLENN@"
	db TRAINERTYPE_NORMAL

	; party
	db 28, KOFFING
	db 30, MAGMAR
	db 32, WEEZING

	db -1 ; end

; ================
; ================================


BlaineGroup:
; ================================
; ================

	; BLAINE (1)
	db "BLAINE@"
	db TRAINERTYPE_MOVES

	; party

	db 45, MAGCARGO
		db CURSE
		db SMOG
		db FLAMETHROWER
		db ROCK_SLIDE

	db 45, MAGMAR
		db THUNDERPUNCH
		db FIRE_PUNCH
		db SUNNY_DAY
		db CONFUSE_RAY

	db 50, RAPIDASH
		db QUICK_ATTACK
		db FIRE_SPIN
		db FURY_ATTACK
		db FIRE_BLAST

	db -1 ; end

; ================
; ================================


BurglarGroup:
; ================================
; ================

	; BURGLAR (1)
	db "DUNCAN@"
	db TRAINERTYPE_NORMAL

	; party
	db 23, KOFFING
	db 25, MAGMAR
	db 23, KOFFING

	db -1 ; end

; ================

	; BURGLAR (2)
	db "EDDIE@"
	db TRAINERTYPE_MOVES

	; party

	db 26, GROWLITHE
		db ROAR
		db EMBER
		db LEER
		db TAKE_DOWN

	db 24, KOFFING
		db TACKLE
		db SMOG
		db SLUDGE
		db SMOKESCREEN

	db -1 ; end

; ================

	; BURGLAR (3)
	db "COREY@"
	db TRAINERTYPE_NORMAL

	; party
	db 25, KOFFING
	db 28, MAGMAR
	db 25, KOFFING
	db 30, KOFFING

	db -1 ; end

; ================
; ================================


FirebreatherGroup:
; ================================
; ================

	; FIREBREATHER (1)
	db "OTIS@"
	db TRAINERTYPE_NORMAL

	; party
	db 29, MAGMAR
	db 32, WEEZING
	db 29, MAGMAR

	db -1 ; end

; ================

	; FIREBREATHER (2)
	db "DICK@"
	db TRAINERTYPE_NORMAL

	; party
	db 17, CHARMELEON

	db -1 ; end

; ================

	; FIREBREATHER (3)
	db "NED@"
	db TRAINERTYPE_NORMAL

	; party
	db 15, KOFFING
	db 16, GROWLITHE
	db 15, KOFFING

	db -1 ; end

; ================

	; FIREBREATHER (4)
	db "BURT@"
	db TRAINERTYPE_NORMAL

	; party
	db 32, KOFFING
	db 32, SLUGMA

	db -1 ; end

; ================

	; FIREBREATHER (5)
	db "BILL@"
	db TRAINERTYPE_NORMAL

	; party
	db 6, KOFFING
	db 6, KOFFING

	db -1 ; end

; ================

	; FIREBREATHER (6)
	db "WALT@"
	db TRAINERTYPE_NORMAL

	; party
	db 11, MAGMAR
	db 13, MAGMAR

	db -1 ; end

; ================

	; FIREBREATHER (7)
	db "RAY@"
	db TRAINERTYPE_NORMAL

	; party
	db 9, VULPIX

	db -1 ; end

; ================

	; FIREBREATHER (8)
	db "LYLE@"
	db TRAINERTYPE_NORMAL

	; party
	db 28, KOFFING
	db 31, FLAREON
	db 28, KOFFING

	db -1 ; end

; ================
; ================================


JugglerGroup:
; ================================
; ================

	; JUGGLER (1)
	db "IRWIN@"
	db TRAINERTYPE_NORMAL

	; party
	db 2, VOLTORB
	db 6, VOLTORB
	db 10, VOLTORB
	db 14, VOLTORB

	db -1 ; end

; ================

	; JUGGLER (2)
	db "FRITZ@"
	db TRAINERTYPE_NORMAL

	; party
	db 29, MR__MIME
	db 29, MAGMAR
	db 29, MACHOKE

	db -1 ; end

; ================

	; JUGGLER (3)
	db "HORTON@"
	db TRAINERTYPE_NORMAL

	; party
	db 33, ELECTRODE
	db 33, ELECTRODE
	db 33, ELECTRODE
	db 33, ELECTRODE

	db -1 ; end

; ================

	; JUGGLER (4)
	db "IRWIN@"
	db TRAINERTYPE_NORMAL

	; party
	db 6, VOLTORB
	db 10, VOLTORB
	db 14, VOLTORB
	db 18, VOLTORB

	db -1 ; end

; ================

	; JUGGLER (5)
	db "IRWIN@"
	db TRAINERTYPE_NORMAL

	; party
	db 18, VOLTORB
	db 22, VOLTORB
	db 26, VOLTORB
	db 30, ELECTRODE

	db -1 ; end

; ================

	; JUGGLER (6)
	db "IRWIN@"
	db TRAINERTYPE_NORMAL

	; party
	db 18, VOLTORB
	db 22, VOLTORB
	db 26, VOLTORB
	db 30, ELECTRODE

	db -1 ; end

; ================
; ================================


BlackbeltGroup:
; ================================
; ================

	; BLACKBELT_T (1)
	db "KENJI@"
	db TRAINERTYPE_NORMAL

	; party
	db 27, ONIX
	db 30, HITMONLEE
	db 27, ONIX
	db 32, MACHOKE

	db -1 ; end

; ================

	; BLACKBELT_T (2)
	db "YOSHI@"
	db TRAINERTYPE_MOVES

	; party

	db 27, HITMONLEE
		db DOUBLE_KICK
		db MEDITATE
		db JUMP_KICK
		db FOCUS_ENERGY

	db -1 ; end

; ================

	; BLACKBELT_T (3)
	db "KENJI@"
	db TRAINERTYPE_MOVES

	; party

	db 33, ONIX
		db BIND
		db ROCK_THROW
		db TOXIC
		db DIG

	db 38, MACHAMP
		db HEADBUTT
		db SWAGGER
		db THUNDERPUNCH
		db VITAL_THROW

	db 33, STEELIX
		db EARTHQUAKE
		db ROCK_THROW
		db IRON_TAIL
		db SANDSTORM

	db 36, HITMONLEE
		db DOUBLE_TEAM
		db HI_JUMP_KICK
		db MUD_SLAP
		db SWIFT

	db -1 ; end

; ================

	; BLACKBELT_T (4)
	db "LAO@"
	db TRAINERTYPE_MOVES

	; party

	db 27, HITMONCHAN
		db COMET_PUNCH
		db THUNDERPUNCH
		db ICE_PUNCH
		db FIRE_PUNCH

	db -1 ; end

; ================

	; BLACKBELT_T (5)
	db "NOB@"
	db TRAINERTYPE_MOVES

	; party

	db 25, MACHOP
		db LEER
		db FOCUS_ENERGY
		db KARATE_CHOP
		db SEISMIC_TOSS

	db 25, MACHOKE
		db LEER
		db KARATE_CHOP
		db SEISMIC_TOSS
		db ROCK_SLIDE

	db -1 ; end

; ================

	; BLACKBELT_T (6)
	db "KIYO@"
	db TRAINERTYPE_NORMAL

	; party
	db 34, HITMONLEE
	db 34, HITMONCHAN

	db -1 ; end

; ================

	; BLACKBELT_T (7)
	db "LUNG@"
	db TRAINERTYPE_NORMAL

	; party
	db 23, MANKEY
	db 23, MANKEY
	db 25, PRIMEAPE

	db -1 ; end

; ================

	; BLACKBELT_T (8)
	db "KENJI@"
	db TRAINERTYPE_NORMAL

	; party
	db 28, MACHOKE

	db -1 ; end

; ================

	; BLACKBELT_T (9)
	db "WAI@"
	db TRAINERTYPE_NORMAL

	; party
	db 30, MACHOKE
	db 32, MACHOKE
	db 34, MACHOKE

	db -1 ; end

; ================
; ================================


ExecutiveMGroup:
; ================================
; ================

	; EXECUTIVEM (1)
	db "EXECUTIVE@"
	db TRAINERTYPE_MOVES

	; party

	db 33, HOUNDOUR
		db EMBER
		db ROAR
		db BITE
		db FAINT_ATTACK

	db 33, KOFFING
		db TACKLE
		db SLUDGE
		db SMOKESCREEN
		db HAZE

	db 35, HOUNDOOM
		db EMBER
		db SMOG
		db BITE
		db FAINT_ATTACK

	db -1 ; end

; ================

	; EXECUTIVEM (2)
	db "EXECUTIVE@"
	db TRAINERTYPE_MOVES

	; party

	db 36, GOLBAT
		db LEECH_LIFE
		db BITE
		db CONFUSE_RAY
		db WING_ATTACK

	db -1 ; end

; ================

	; EXECUTIVEM (3)
	db "EXECUTIVE@"
	db TRAINERTYPE_MOVES

	; party

	db 30, KOFFING
		db TACKLE
		db SELFDESTRUCT
		db SLUDGE
		db SMOKESCREEN

	db 30, KOFFING
		db TACKLE
		db SELFDESTRUCT
		db SLUDGE
		db SMOKESCREEN

	db 30, KOFFING
		db TACKLE
		db SELFDESTRUCT
		db SLUDGE
		db SMOKESCREEN

	db 32, WEEZING
		db TACKLE
		db EXPLOSION
		db SLUDGE
		db SMOKESCREEN

	db 30, KOFFING
		db TACKLE
		db SELFDESTRUCT
		db SLUDGE
		db SMOKESCREEN

	db 30, KOFFING
		db TACKLE
		db SMOG
		db SLUDGE
		db SMOKESCREEN

	db -1 ; end

; ================

	; EXECUTIVEM (4)
	db "EXECUTIVE@"
	db TRAINERTYPE_NORMAL

	; party
	db 22, ZUBAT
	db 24, RATICATE
	db 22, KOFFING

	db -1 ; end

; ================
; ================================


PsychicGroup:
; ================================
; ================

	; PSYCHIC_T (1)
	db "NATHAN@"
	db TRAINERTYPE_NORMAL

	; party
	db 26, GIRAFARIG

	db -1 ; end

; ================

	; PSYCHIC_T (2)
	db "FRANKLIN@"
	db TRAINERTYPE_NORMAL

	; party
	db 37, KADABRA

	db -1 ; end

; ================

	; PSYCHIC_T (3)
	db "HERMAN@"
	db TRAINERTYPE_NORMAL

	; party
	db 30, EXEGGCUTE
	db 30, EXEGGCUTE
	db 30, EXEGGUTOR

	db -1 ; end

; ================

	; PSYCHIC_T (4)
	db "FIDEL@"
	db TRAINERTYPE_NORMAL

	; party
	db 34, XATU

	db -1 ; end

; ================

	; PSYCHIC_T (5)
	db "GREG@"
	db TRAINERTYPE_MOVES

	; party

	db 17, DROWZEE
		db HYPNOSIS
		db DISABLE
		db DREAM_EATER
		db 0

	db -1 ; end

; ================

	; PSYCHIC_T (6)
	db "NORMAN@"
	db TRAINERTYPE_MOVES

	; party

	db 17, SLOWPOKE
		db TACKLE
		db GROWL
		db WATER_GUN
		db 0

	db 20, SLOWPOKE
		db CURSE
		db BODY_SLAM
		db WATER_GUN
		db CONFUSION

	db -1 ; end

; ================

	; PSYCHIC_T (7)
	db "MARK@"
	db TRAINERTYPE_MOVES

	; party

	db 13, ABRA
		db TELEPORT
		db FLASH
		db 0
		db 0

	db 13, ABRA
		db TELEPORT
		db FLASH
		db 0
		db 0

	db 15, KADABRA
		db TELEPORT
		db KINESIS
		db CONFUSION
		db 0

	db -1 ; end

; ================

	; PSYCHIC_T (8)
	db "PHIL@"
	db TRAINERTYPE_MOVES

	; party

	db 24, NATU
		db LEER
		db NIGHT_SHADE
		db FUTURE_SIGHT
		db CONFUSE_RAY

	db 26, KADABRA
		db DISABLE
		db PSYBEAM
		db RECOVER
		db FUTURE_SIGHT

	db -1 ; end

; ================

	; PSYCHIC_T (9)
	db "RICHARD@"
	db TRAINERTYPE_NORMAL

	; party
	db 36, ESPEON

	db -1 ; end

; ================

	; PSYCHIC_T (10)
	db "GILBERT@"
	db TRAINERTYPE_NORMAL

	; party
	db 30, STARMIE
	db 30, EXEGGCUTE
	db 34, GIRAFARIG

	db -1 ; end

; ================

	; PSYCHIC_T (11)
	db "JARED@"
	db TRAINERTYPE_NORMAL

	; party
	db 32, MR__MIME
	db 32, EXEGGCUTE
	db 35, EXEGGCUTE

	db -1 ; end

; ================

	; PSYCHIC_T (12)
	db "RODNEY@"
	db TRAINERTYPE_NORMAL

	; party
	db 29, DROWZEE
	db 33, HYPNO

	db -1 ; end

; ================
; ================================


PicnickerGroup:
; ================================
; ================

	; PICNICKER (1)
	db "LIZ@"
	db TRAINERTYPE_NORMAL

	; party
	db 9, NIDORAN_F

	db -1 ; end

; ================

	; PICNICKER (2)
	db "GINA@"
	db TRAINERTYPE_NORMAL

	; party
	db 9, HOPPIP
	db 9, HOPPIP
	db 12, BULBASAUR

	db -1 ; end

; ================

	; PICNICKER (3)
	db "BROOKE@"
	db TRAINERTYPE_MOVES

	; party

	db 16, PIKACHU
		db THUNDERSHOCK
		db GROWL
		db QUICK_ATTACK
		db DOUBLE_TEAM

	db -1 ; end

; ================

	; PICNICKER (4)
	db "KIM@"
	db TRAINERTYPE_NORMAL

	; party
	db 15, VULPIX

	db -1 ; end

; ================

	; PICNICKER (5)
	db "CINDY@"
	db TRAINERTYPE_NORMAL

	; party
	db 36, NIDOQUEEN

	db -1 ; end

; ================

	; PICNICKER (6)
	db "HOPE@"
	db TRAINERTYPE_NORMAL

	; party
	db 34, FLAAFFY

	db -1 ; end

; ================

	; PICNICKER (7)
	db "SHARON@"
	db TRAINERTYPE_NORMAL

	; party
	db 31, FURRET
	db 33, RAPIDASH

	db -1 ; end

; ================

	; PICNICKER (8)
	db "DEBRA@"
	db TRAINERTYPE_NORMAL

	; party
	db 33, SEAKING

	db -1 ; end

; ================

	; PICNICKER (9)
	db "GINA@"
	db TRAINERTYPE_NORMAL

	; party
	db 14, HOPPIP
	db 14, HOPPIP
	db 17, IVYSAUR

	db -1 ; end

; ================

	; PICNICKER (10)
	db "ERIN@"
	db TRAINERTYPE_NORMAL

	; party
	db 16, PONYTA
	db 16, PONYTA

	db -1 ; end

; ================

	; PICNICKER (11)
	db "LIZ@"
	db TRAINERTYPE_NORMAL

	; party
	db 15, WEEPINBELL
	db 15, NIDORINA

	db -1 ; end

; ================

	; PICNICKER (12)
	db "LIZ@"
	db TRAINERTYPE_NORMAL

	; party
	db 19, WEEPINBELL
	db 19, NIDORINO
	db 21, NIDOQUEEN

	db -1 ; end

; ================

	; PICNICKER (13)
	db "HEIDI@"
	db TRAINERTYPE_NORMAL

	; party
	db 32, SKIPLOOM
	db 32, SKIPLOOM

	db -1 ; end

; ================

	; PICNICKER (14)
	db "EDNA@"
	db TRAINERTYPE_NORMAL

	; party
	db 30, NIDORINA
	db 34, RAICHU

	db -1 ; end

; ================

	; PICNICKER (15)
	db "GINA@"
	db TRAINERTYPE_NORMAL

	; party
	db 26, SKIPLOOM
	db 26, SKIPLOOM
	db 29, IVYSAUR

	db -1 ; end

; ================

	; PICNICKER (16)
	db "TIFFANY@"
	db TRAINERTYPE_MOVES

	; party

	db 31, CLEFAIRY
		db ENCORE
		db SING
		db DOUBLESLAP
		db MINIMIZE

	db -1 ; end

; ================

	; PICNICKER (17)
	db "TIFFANY@"
	db TRAINERTYPE_MOVES

	; party

	db 37, CLEFAIRY
		db ENCORE
		db DOUBLESLAP
		db MINIMIZE
		db METRONOME

	db -1 ; end

; ================

	; PICNICKER (18)
	db "ERIN@"
	db TRAINERTYPE_NORMAL

	; party
	db 32, PONYTA
	db 32, PONYTA

	db -1 ; end

; ================

	; PICNICKER (19)
	db "TANYA@"
	db TRAINERTYPE_NORMAL

	; party
	db 37, EXEGGUTOR

	db -1 ; end

; ================

	; PICNICKER (20)
	db "TIFFANY@"
	db TRAINERTYPE_MOVES

	; party

	db 20, CLEFAIRY
		db ENCORE
		db SING
		db DOUBLESLAP
		db MINIMIZE

	db -1 ; end

; ================

	; PICNICKER (21)
	db "ERIN@"
	db TRAINERTYPE_MOVES

	; party

	db 36, PONYTA
		db DOUBLE_TEAM
		db STOMP
		db FIRE_SPIN
		db SUNNY_DAY

	db 34, RAICHU
		db SWIFT
		db MUD_SLAP
		db QUICK_ATTACK
		db THUNDERBOLT

	db 36, PONYTA
		db DOUBLE_TEAM
		db STOMP
		db FIRE_SPIN
		db SUNNY_DAY

	db -1 ; end

; ================

	; PICNICKER (22)
	db "LIZ@"
	db TRAINERTYPE_NORMAL

	; party
	db 24, WEEPINBELL
	db 26, NIDORINO
	db 26, NIDOQUEEN

	db -1 ; end

; ================

	; PICNICKER (23)
	db "LIZ@"
	db TRAINERTYPE_MOVES

	; party

	db 30, WEEPINBELL
		db SLEEP_POWDER
		db POISONPOWDER
		db STUN_SPORE
		db SLUDGE_BOMB

	db 32, NIDOKING
		db EARTHQUAKE
		db DOUBLE_KICK
		db POISON_STING
		db IRON_TAIL

	db 32, NIDOQUEEN
		db EARTHQUAKE
		db DOUBLE_KICK
		db TAIL_WHIP
		db BODY_SLAM

	db -1 ; end

; ================

	; PICNICKER (24)
	db "GINA@"
	db TRAINERTYPE_NORMAL

	; party
	db 30, SKIPLOOM
	db 30, SKIPLOOM
	db 32, IVYSAUR

	db -1 ; end

; ================

	; PICNICKER (25)
	db "GINA@"
	db TRAINERTYPE_MOVES

	; party

	db 33, JUMPLUFF
		db STUN_SPORE
		db SUNNY_DAY
		db LEECH_SEED
		db COTTON_SPORE

	db 33, JUMPLUFF
		db SUNNY_DAY
		db SLEEP_POWDER
		db LEECH_SEED
		db COTTON_SPORE

	db 38, VENUSAUR
		db SOLARBEAM
		db RAZOR_LEAF
		db HEADBUTT
		db MUD_SLAP

	db -1 ; end

; ================

	; PICNICKER (26)
	db "TIFFANY@"
	db TRAINERTYPE_MOVES

	; party

	db 43, CLEFAIRY
		db METRONOME
		db ENCORE
		db MOONLIGHT
		db MINIMIZE

	db -1 ; end

; ================
; ================================


CamperGroup:
; ================================
; ================

	; CAMPER (1)
	db "ROLAND@"
	db TRAINERTYPE_NORMAL

	; party
	db 9, NIDORAN_M

	db -1 ; end

; ================

	; CAMPER (2)
	db "TODD@"
	db TRAINERTYPE_NORMAL

	; party
	db 14, PSYDUCK

	db -1 ; end

; ================

	; CAMPER (3)
	db "IVAN@"
	db TRAINERTYPE_NORMAL

	; party
	db 10, DIGLETT
	db 10, ZUBAT
	db 14, DIGLETT

	db -1 ; end

; ================

	; CAMPER (4)
	db "ELLIOT@"
	db TRAINERTYPE_NORMAL

	; party
	db 13, SANDSHREW
	db 15, MARILL

	db -1 ; end

; ================

	; CAMPER (5)
	db "BARRY@"
	db TRAINERTYPE_NORMAL

	; party
	db 36, NIDOKING

	db -1 ; end

; ================

	; CAMPER (6)
	db "LLOYD@"
	db TRAINERTYPE_NORMAL

	; party
	db 34, NIDOKING

	db -1 ; end

; ================

	; CAMPER (7)
	db "DEAN@"
	db TRAINERTYPE_NORMAL

	; party
	db 33, GOLDUCK
	db 31, SANDSLASH

	db -1 ; end

; ================

	; CAMPER (8)
	db "SID@"
	db TRAINERTYPE_NORMAL

	; party
	db 32, DUGTRIO
	db 29, PRIMEAPE
	db 29, POLIWRATH

	db -1 ; end

; ================

	; CAMPER (9)
	db "HARVEY@"
	db TRAINERTYPE_NORMAL

	; party
	db 15, NIDORINO

	db -1 ; end

; ================

	; CAMPER (10)
	db "DALE@"
	db TRAINERTYPE_NORMAL

	; party
	db 15, NIDORINO

	db -1 ; end

; ================

	; CAMPER (11)
	db "TED@"
	db TRAINERTYPE_NORMAL

	; party
	db 17, MANKEY

	db -1 ; end

; ================

	; CAMPER (12)
	db "TODD@"
	db TRAINERTYPE_NORMAL

	; party
	db 17, GEODUDE
	db 17, GEODUDE
	db 23, PSYDUCK

	db -1 ; end

; ================

	; CAMPER (13)
	db "TODD@"
	db TRAINERTYPE_NORMAL

	; party
	db 23, GEODUDE
	db 23, GEODUDE
	db 26, PSYDUCK

	db -1 ; end

; ================

	; CAMPER (14)
	db "THOMAS@"
	db TRAINERTYPE_NORMAL

	; party
	db 33, GRAVELER
	db 36, GRAVELER
	db 40, GOLBAT
	db 42, GOLDUCK

	db -1 ; end

; ================

	; CAMPER (15)
	db "LEROY@"
	db TRAINERTYPE_NORMAL

	; party
	db 33, GRAVELER
	db 36, GRAVELER
	db 40, GOLBAT
	db 42, GOLDUCK

	db -1 ; end

; ================

	; CAMPER (16)
	db "DAVID@"
	db TRAINERTYPE_NORMAL

	; party
	db 33, GRAVELER
	db 36, GRAVELER
	db 40, GOLBAT
	db 42, GOLDUCK

	db -1 ; end

; ================

	; CAMPER (17)
	db "JOHN@"
	db TRAINERTYPE_NORMAL

	; party
	db 33, GRAVELER
	db 36, GRAVELER
	db 40, GOLBAT
	db 42, GOLDUCK

	db -1 ; end

; ================

	; CAMPER (18)
	db "JERRY@"
	db TRAINERTYPE_NORMAL

	; party
	db 37, SANDSLASH

	db -1 ; end

; ================

	; CAMPER (19)
	db "SPENCER@"
	db TRAINERTYPE_NORMAL

	; party
	db 17, SANDSHREW
	db 17, SANDSLASH
	db 19, ZUBAT

	db -1 ; end

; ================

	; CAMPER (20)
	db "TODD@"
	db TRAINERTYPE_NORMAL

	; party
	db 30, GRAVELER
	db 30, GRAVELER
	db 30, SLUGMA
	db 32, PSYDUCK

	db -1 ; end

; ================

	; CAMPER (21)
	db "TODD@"
	db TRAINERTYPE_MOVES

	; party

	db 33, GRAVELER
		db SELFDESTRUCT
		db ROCK_THROW
		db HARDEN
		db MAGNITUDE

	db 33, GRAVELER
		db SELFDESTRUCT
		db ROCK_THROW
		db HARDEN
		db MAGNITUDE

	db 36, MAGCARGO
		db ROCK_THROW
		db HARDEN
		db AMNESIA
		db FLAMETHROWER

	db 34, GOLDUCK
		db DISABLE
		db PSYCHIC_M
		db SURF
		db PSYCH_UP

	db -1 ; end

; ================

	; CAMPER (22)
	db "QUENTIN@"
	db TRAINERTYPE_NORMAL

	; party
	db 30, FEAROW
	db 30, PRIMEAPE
	db 30, TAUROS

	db -1 ; end

; ================
; ================================


ExecutiveFGroup:
; ================================
; ================

	; EXECUTIVEF (1)
	db "EXECUTIVE@"
	db TRAINERTYPE_MOVES

	; party

	db 32, ARBOK
		db WRAP
		db POISON_STING
		db BITE
		db GLARE

	db 32, VILEPLUME
		db ABSORB
		db SWEET_SCENT
		db SLEEP_POWDER
		db ACID

	db 32, MURKROW
		db PECK
		db PURSUIT
		db HAZE
		db NIGHT_SHADE

	db -1 ; end

; ================

	; EXECUTIVEF (2)
	db "EXECUTIVE@"
	db TRAINERTYPE_MOVES

	; party

	db 23, ARBOK
		db WRAP
		db LEER
		db POISON_STING
		db BITE

	db 23, GLOOM
		db ABSORB
		db SWEET_SCENT
		db SLEEP_POWDER
		db ACID

	db 25, MURKROW
		db PECK
		db PURSUIT
		db HAZE
		db 0

	db -1 ; end

; ================
; ================================


SageGroup:
; ================================
; ================

	; SAGE (1)
	db "CHOW@"
	db TRAINERTYPE_NORMAL

	; party
	db 3, BELLSPROUT
	db 3, BELLSPROUT
	db 3, BELLSPROUT

	db -1 ; end

; ================

	; SAGE (2)
	db "NICO@"
	db TRAINERTYPE_NORMAL

	; party
	db 3, BELLSPROUT
	db 3, BELLSPROUT
	db 3, BELLSPROUT

	db -1 ; end

; ================

	; SAGE (3)
	db "JIN@"
	db TRAINERTYPE_NORMAL

	; party
	db 6, BELLSPROUT

	db -1 ; end

; ================

	; SAGE (4)
	db "TROY@"
	db TRAINERTYPE_NORMAL

	; party
	db 7, BELLSPROUT
	db 7, HOOTHOOT

	db -1 ; end

; ================

	; SAGE (5)
	db "JEFFREY@"
	db TRAINERTYPE_NORMAL

	; party
	db 22, HAUNTER

	db -1 ; end

; ================

	; SAGE (6)
	db "PING@"
	db TRAINERTYPE_NORMAL

	; party
	db 16, GASTLY
	db 16, GASTLY
	db 16, GASTLY
	db 16, GASTLY
	db 16, GASTLY

	db -1 ; end

; ================

	; SAGE (7)
	db "EDMOND@"
	db TRAINERTYPE_NORMAL

	; party
	db 3, BELLSPROUT
	db 3, BELLSPROUT
	db 3, BELLSPROUT

	db -1 ; end

; ================

	; SAGE (8)
	db "NEAL@"
	db TRAINERTYPE_NORMAL

	; party
	db 6, BELLSPROUT

	db -1 ; end

; ================

	; SAGE (9)
	db "LI@"
	db TRAINERTYPE_NORMAL

	; party
	db 7, BELLSPROUT
	db 7, BELLSPROUT
	db 10, HOOTHOOT

	db -1 ; end

; ================

	; SAGE (10)
	db "GAKU@"
	db TRAINERTYPE_NORMAL

	; party
	db 32, NOCTOWL
	db 32, FLAREON

	db -1 ; end

; ================

	; SAGE (11)
	db "MASA@"
	db TRAINERTYPE_NORMAL

	; party
	db 32, NOCTOWL
	db 32, JOLTEON

	db -1 ; end

; ================

	; SAGE (12)
	db "KOJI@"
	db TRAINERTYPE_NORMAL

	; party
	db 32, NOCTOWL
	db 32, VAPOREON

	db -1 ; end

; ================
; ================================


MediumGroup:
; ================================
; ================

	; MEDIUM (1)
	db "MARTHA@"
	db TRAINERTYPE_NORMAL

	; party
	db 18, GASTLY
	db 20, HAUNTER
	db 20, GASTLY

	db -1 ; end

; ================

	; MEDIUM (2)
	db "GRACE@"
	db TRAINERTYPE_NORMAL

	; party
	db 20, HAUNTER
	db 20, HAUNTER

	db -1 ; end

; ================

	; MEDIUM (3)
	db "BETHANY@"
	db TRAINERTYPE_NORMAL

	; party
	db 25, HAUNTER

	db -1 ; end

; ================

	; MEDIUM (4)
	db "MARGRET@"
	db TRAINERTYPE_NORMAL

	; party
	db 25, HAUNTER

	db -1 ; end

; ================

	; MEDIUM (5)
	db "ETHEL@"
	db TRAINERTYPE_NORMAL

	; party
	db 25, HAUNTER

	db -1 ; end

; ================

	; MEDIUM (6)
	db "REBECCA@"
	db TRAINERTYPE_NORMAL

	; party
	db 35, DROWZEE
	db 35, HYPNO

	db -1 ; end

; ================

	; MEDIUM (7)
	db "DORIS@"
	db TRAINERTYPE_NORMAL

	; party
	db 34, SLOWPOKE
	db 36, SLOWBRO

	db -1 ; end

; ================
; ================================


BoarderGroup:
; ================================
; ================

	; BOARDER (1)
	db "RONALD@"
	db TRAINERTYPE_NORMAL

	; party
	db 24, SEEL
	db 25, DEWGONG
	db 24, SEEL

	db -1 ; end

; ================

	; BOARDER (2)
	db "BRAD@"
	db TRAINERTYPE_NORMAL

	; party
	db 26, SWINUB
	db 26, SWINUB

	db -1 ; end

; ================

	; BOARDER (3)
	db "DOUGLAS@"
	db TRAINERTYPE_NORMAL

	; party
	db 24, SHELLDER
	db 25, CLOYSTER
	db 24, SHELLDER

	db -1 ; end

; ================
; ================================


PokefanMGroup:
; ================================
; ================

	; POKEFANM (1)
	db "WILLIAM@"
	db TRAINERTYPE_ITEM

	; party
	db 14, RAICHU, BERRY

	db -1 ; end

; ================

	; POKEFANM (2)
	db "DEREK@"
	db TRAINERTYPE_ITEM

	; party
	db 17, PIKACHU, BERRY

	db -1 ; end

; ================

	; POKEFANM (3)
	db "ROBERT@"
	db TRAINERTYPE_ITEM

	; party
	db 33, QUAGSIRE, BERRY

	db -1 ; end

; ================

	; POKEFANM (4)
	db "JOSHUA@"
	db TRAINERTYPE_ITEM

	; party
	db 23, PIKACHU, BERRY
	db 23, PIKACHU, BERRY
	db 23, PIKACHU, BERRY
	db 23, PIKACHU, BERRY
	db 23, PIKACHU, BERRY
	db 23, PIKACHU, BERRY

	db -1 ; end

; ================

	; POKEFANM (5)
	db "CARTER@"
	db TRAINERTYPE_ITEM

	; party
	db 29, BULBASAUR, BERRY
	db 29, CHARMANDER, BERRY
	db 29, SQUIRTLE, BERRY

	db -1 ; end

; ================

	; POKEFANM (6)
	db "TREVOR@"
	db TRAINERTYPE_ITEM

	; party
	db 33, PSYDUCK, BERRY

	db -1 ; end

; ================

	; POKEFANM (7)
	db "BRANDON@"
	db TRAINERTYPE_ITEM

	; party
	db 13, SNUBBULL, BERRY

	db -1 ; end

; ================

	; POKEFANM (8)
	db "JEREMY@"
	db TRAINERTYPE_ITEM

	; party
	db 28, MEOWTH, BERRY
	db 28, MEOWTH, BERRY
	db 28, MEOWTH, BERRY

	db -1 ; end

; ================

	; POKEFANM (9)
	db "COLIN@"
	db TRAINERTYPE_ITEM

	; party
	db 32, DELIBIRD, BERRY

	db -1 ; end

; ================

	; POKEFANM (10)
	db "DEREK@"
	db TRAINERTYPE_ITEM

	; party
	db 19, PIKACHU, BERRY

	db -1 ; end

; ================

	; POKEFANM (11)
	db "DEREK@"
	db TRAINERTYPE_ITEM

	; party
	db 36, PIKACHU, BERRY

	db -1 ; end

; ================

	; POKEFANM (12)
	db "ALEX@"
	db TRAINERTYPE_ITEM

	; party
	db 29, NIDOKING, BERRY
	db 29, SLOWKING, BERRY
	db 29, SEAKING, BERRY

	db -1 ; end

; ================

	; POKEFANM (13)
	db "REX@"
	db TRAINERTYPE_ITEM

	; party
	db 35, PHANPY, BERRY

	db -1 ; end

; ================

	; POKEFANM (14)
	db "ALLAN@"
	db TRAINERTYPE_ITEM

	; party
	db 35, TEDDIURSA, BERRY

	db -1 ; end

; ================
; ================================


KimonoGirlGroup:
; ================================
; ================

	; KIMONO_GIRL (1)
	db "NAOKO@"
	db TRAINERTYPE_NORMAL

	; party
	db 20, SKIPLOOM
	db 20, VULPIX
	db 18, SKIPLOOM

	db -1 ; end

; ================

	; KIMONO_GIRL (2)
	db "NAOKO@"
	db TRAINERTYPE_NORMAL

	; party
	db 17, FLAREON

	db -1 ; end

; ================

	; KIMONO_GIRL (3)
	db "SAYO@"
	db TRAINERTYPE_NORMAL

	; party
	db 17, ESPEON

	db -1 ; end

; ================

	; KIMONO_GIRL (4)
	db "ZUKI@"
	db TRAINERTYPE_NORMAL

	; party
	db 17, UMBREON

	db -1 ; end

; ================

	; KIMONO_GIRL (5)
	db "KUNI@"
	db TRAINERTYPE_NORMAL

	; party
	db 17, VAPOREON

	db -1 ; end

; ================

	; KIMONO_GIRL (6)
	db "MIKI@"
	db TRAINERTYPE_NORMAL

	; party
	db 17, JOLTEON

	db -1 ; end

; ================
; ================================


TwinsGroup:
; ================================
; ================

	; TWINS (1)
	db "AMY & MAY@"
	db TRAINERTYPE_NORMAL

	; party
	db 10, SPINARAK
	db 10, LEDYBA

	db -1 ; end

; ================

	; TWINS (2)
	db "ANN & ANNE@"
	db TRAINERTYPE_MOVES

	; party

	db 16, CLEFAIRY
		db GROWL
		db ENCORE
		db DOUBLESLAP
		db METRONOME

	db 16, JIGGLYPUFF
		db SING
		db DEFENSE_CURL
		db POUND
		db DISABLE

	db -1 ; end

; ================

	; TWINS (3)
	db "ANN & ANNE@"
	db TRAINERTYPE_MOVES

	; party

	db 16, JIGGLYPUFF
		db SING
		db DEFENSE_CURL
		db POUND
		db DISABLE

	db 16, CLEFAIRY
		db GROWL
		db ENCORE
		db DOUBLESLAP
		db METRONOME

	db -1 ; end

; ================

	; TWINS (4)
	db "AMY & MAY@"
	db TRAINERTYPE_NORMAL

	; party
	db 10, LEDYBA
	db 10, SPINARAK

	db -1 ; end

; ================

	; TWINS (5)
	db "JO & ZOE@"
	db TRAINERTYPE_NORMAL

	; party
	db 35, VICTREEBEL
	db 35, VILEPLUME

	db -1 ; end

; ================

	; TWINS (6)
	db "JO & ZOE@"
	db TRAINERTYPE_NORMAL

	; party
	db 35, VILEPLUME
	db 35, VICTREEBEL

	db -1 ; end

; ================

	; TWINS (7)
	db "MEG & PEG@"
	db TRAINERTYPE_NORMAL

	; party
	db 31, TEDDIURSA
	db 31, PHANPY

	db -1 ; end

; ================

	; TWINS (8)
	db "MEG & PEG@"
	db TRAINERTYPE_NORMAL

	; party
	db 31, PHANPY
	db 31, TEDDIURSA

	db -1 ; end

; ================

	; TWINS (9)
	db "LEA & PIA@"
	db TRAINERTYPE_MOVES

	; party

	db 35, DRATINI
		db THUNDER_WAVE
		db TWISTER
		db FLAMETHROWER
		db HEADBUTT

	db 35, DRATINI
		db THUNDER_WAVE
		db TWISTER
		db ICE_BEAM
		db HEADBUTT

	db -1 ; end

; ================

	; TWINS (10)
	db "LEA & PIA@"
	db TRAINERTYPE_MOVES

	; party

	db 38, DRATINI
		db THUNDER_WAVE
		db TWISTER
		db ICE_BEAM
		db HEADBUTT

	db 38, DRATINI
		db THUNDER_WAVE
		db TWISTER
		db FLAMETHROWER
		db HEADBUTT

	db -1 ; end

; ================
; ================================


PokefanFGroup:
; ================================
; ================

	; POKEFANF (1)
	db "BEVERLY@"
	db TRAINERTYPE_ITEM

	; party
	db 14, SNUBBULL, BERRY

	db -1 ; end

; ================

	; POKEFANF (2)
	db "RUTH@"
	db TRAINERTYPE_ITEM

	; party
	db 17, PIKACHU, BERRY

	db -1 ; end

; ================

	; POKEFANF (3)
	db "BEVERLY@"
	db TRAINERTYPE_ITEM

	; party
	db 18, SNUBBULL, BERRY

	db -1 ; end

; ================

	; POKEFANF (4)
	db "BEVERLY@"
	db TRAINERTYPE_ITEM

	; party
	db 30, GRANBULL, BERRY

	db -1 ; end

; ================

	; POKEFANF (5)
	db "GEORGIA@"
	db TRAINERTYPE_ITEM

	; party
	db 23, SENTRET, BERRY
	db 23, SENTRET, BERRY
	db 23, SENTRET, BERRY
	db 28, FURRET, BERRY
	db 23, SENTRET, BERRY

	db -1 ; end

; ================

	; POKEFANF (6)
	db "JAIME@"
	db TRAINERTYPE_ITEM

	; party
	db 16, MEOWTH, BERRY

	db -1 ; end

; ================
; ================================


RedGroup:
; ================================
; ================

	; RED (1)
	db "RED@"
	db TRAINERTYPE_MOVES

	; party

	db 81, PIKACHU
		db CHARM
		db QUICK_ATTACK
		db THUNDERBOLT
		db THUNDER

	db 73, ESPEON
		db MUD_SLAP
		db REFLECT
		db SWIFT
		db PSYCHIC_M

	db 75, SNORLAX
		db AMNESIA
		db SNORE
		db REST
		db BODY_SLAM

	db 77, VENUSAUR
		db SUNNY_DAY
		db GIGA_DRAIN
		db SYNTHESIS
		db SOLARBEAM

	db 77, CHARIZARD
		db FLAMETHROWER
		db WING_ATTACK
		db SLASH
		db FIRE_SPIN

	db 77, BLASTOISE
		db RAIN_DANCE
		db SURF
		db BLIZZARD
		db WHIRLPOOL

	db -1 ; end

; ================
; ================================


BlueGroup:
; ================================
; ================

	; BLUE (1)
	db "BLUE@"
	db TRAINERTYPE_MOVES

	; party

	db 56, PIDGEOT
		db QUICK_ATTACK
		db WHIRLWIND
		db WING_ATTACK
		db MIRROR_MOVE

	db 54, ALAKAZAM
		db DISABLE
		db RECOVER
		db PSYCHIC_M
		db REFLECT

	db 56, RHYDON
		db FURY_ATTACK
		db SANDSTORM
		db ROCK_SLIDE
		db EARTHQUAKE

	db 58, GYARADOS
		db TWISTER
		db HYDRO_PUMP
		db RAIN_DANCE
		db HYPER_BEAM

	db 58, EXEGGUTOR
		db SUNNY_DAY
		db LEECH_SEED
		db EGG_BOMB
		db SOLARBEAM

	db 58, ARCANINE
		db ROAR
		db SWIFT
		db FLAMETHROWER
		db EXTREMESPEED

	db -1 ; end

; ================
; ================================


OfficerGroup:
; ================================
; ================

	; OFFICER (1)
	db "KEITH@"
	db TRAINERTYPE_NORMAL

	; party
	db 17, GROWLITHE

	db -1 ; end

; ================

	; OFFICER (2)
	db "DIRK@"
	db TRAINERTYPE_NORMAL

	; party
	db 14, GROWLITHE
	db 14, GROWLITHE

	db -1 ; end

; ================
; ================================


GruntFGroup:
; ================================
; ================

	; GRUNTF (1)
	db "GRUNT@"
	db TRAINERTYPE_NORMAL

	; party
	db 9, ZUBAT
	db 11, EKANS

	db -1 ; end

; ================

	; GRUNTF (2)
	db "GRUNT@"
	db TRAINERTYPE_NORMAL

	; party
	db 26, ARBOK

	db -1 ; end

; ================

	; GRUNTF (3)
	db "GRUNT@"
	db TRAINERTYPE_NORMAL

	; party
	db 25, GLOOM
	db 25, GLOOM

	db -1 ; end

; ================

	; GRUNTF (4)
	db "GRUNT@"
	db TRAINERTYPE_NORMAL

	; party
	db 21, EKANS
	db 23, ODDISH
	db 21, EKANS
	db 24, GLOOM

	db -1 ; end

; ================

	; GRUNTF (5)
	db "GRUNT@"
	db TRAINERTYPE_MOVES

	; party

	db 18, EKANS
		db WRAP
		db LEER
		db POISON_STING
		db BITE

	db 18, GLOOM
		db ABSORB
		db SWEET_SCENT
		db STUN_SPORE
		db SLEEP_POWDER

	db -1 ; end

; ================
; ================================


MysticalmanGroup:
; ================================
; ================

	; MYSTICALMAN (1)
	db "EUSINE@"
	db TRAINERTYPE_MOVES

	; party

	db 23, DROWZEE
		db DREAM_EATER
		db HYPNOSIS
		db DISABLE
		db CONFUSION

	db 23, HAUNTER
		db LICK
		db HYPNOSIS
		db MEAN_LOOK
		db CURSE

	db 25, ELECTRODE
		db SCREECH
		db SONICBOOM
		db THUNDER
		db ROLLOUT

	db -1 ; end

; ================
; ================================
