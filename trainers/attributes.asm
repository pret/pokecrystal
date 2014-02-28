
AI_STATUS_RED    EQU 1 << 0
AI_STAT_MODS_RED EQU 1 << 1
AI_TYPES_RED     EQU 1 << 2
AI_OFFENSIVE     EQU 1 << 3
AI_SMART         EQU 1 << 4
AI_OPPORTUNIST   EQU 1 << 5
AI_AGGRESSIVE    EQU 1 << 6
AI_CAUTIOUS      EQU 1 << 7
AI_STATUS_IMMUNE EQU 1 << 8
AI_RISKY         EQU 1 << 9
AI_10            EQU 1 << 10
AI_11            EQU 1 << 11
AI_12            EQU 1 << 12
AI_13            EQU 1 << 13
AI_14            EQU 1 << 14
AI_15            EQU 1 << 15


TrainerClassAttributes: ; 3959c

; Falkner
	db NONE, NONE ; items
	db 25 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_SMART | AI_AGGRESSIVE | AI_CAUTIOUS | AI_STATUS_IMMUNE | AI_RISKY
	db $44, $00

; Whitney
	db NONE, NONE ; items
	db 25 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_SMART | AI_AGGRESSIVE | AI_CAUTIOUS | AI_STATUS_IMMUNE | AI_RISKY
	db $44, $00

; Bugsy
	db NONE, NONE ; items
	db 25 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_SMART | AI_AGGRESSIVE | AI_CAUTIOUS | AI_STATUS_IMMUNE | AI_RISKY
	db $44, $00

; Morty
	db NONE, NONE ; items
	db 25 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_SMART | AI_AGGRESSIVE | AI_CAUTIOUS | AI_STATUS_IMMUNE | AI_RISKY
	db $44, $00

; Pryce
	db HYPER_POTION, NONE ; items
	db 25 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_SMART | AI_AGGRESSIVE | AI_CAUTIOUS | AI_STATUS_IMMUNE | AI_RISKY
	db $44, $00

; Jasmine
	db HYPER_POTION, NONE ; items
	db 25 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_SMART | AI_AGGRESSIVE | AI_CAUTIOUS | AI_STATUS_IMMUNE | AI_RISKY
	db $44, $00

; Chuck
	db FULL_HEAL, NONE ; items
	db 25 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_SMART | AI_AGGRESSIVE | AI_CAUTIOUS | AI_STATUS_IMMUNE | AI_RISKY
	db $44, $00

; Clair
	db FULL_HEAL, HYPER_POTION ; items
	db 25 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_SMART | AI_AGGRESSIVE | AI_CAUTIOUS | AI_STATUS_IMMUNE | AI_RISKY
	db $44, $00

; Rival1
	db NONE, NONE ; items
	db 15 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_SMART | AI_AGGRESSIVE | AI_CAUTIOUS | AI_STATUS_IMMUNE | AI_RISKY
	db $44, $00

; Pokemon Prof
	db NONE, NONE ; items
	db 25 ; base reward
	dw AI_STATUS_RED | AI_AGGRESSIVE | AI_STATUS_IMMUNE
	db $44, $00

; Will
	db MAX_POTION, NONE ; items
	db 25 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_SMART | AI_AGGRESSIVE | AI_CAUTIOUS | AI_STATUS_IMMUNE | AI_RISKY
	db $44, $00

; Cal
	db NONE, NONE ; items
	db 25 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_SMART | AI_AGGRESSIVE | AI_CAUTIOUS | AI_STATUS_IMMUNE | AI_RISKY
	db $44, $00

; Bruno
	db MAX_POTION, NONE ; items
	db 25 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_SMART | AI_AGGRESSIVE | AI_CAUTIOUS | AI_STATUS_IMMUNE | AI_RISKY
	db $44, $00

; Karen
	db FULL_HEAL, MAX_POTION ; items
	db 25 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_SMART | AI_AGGRESSIVE | AI_CAUTIOUS | AI_STATUS_IMMUNE | AI_RISKY
	db $44, $00

; Koga
	db FULL_HEAL, FULL_RESTORE ; items
	db 25 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_SMART | AI_AGGRESSIVE | AI_CAUTIOUS | AI_STATUS_IMMUNE | AI_RISKY
	db $44, $00

; Champion
	db FULL_HEAL, FULL_RESTORE ; items
	db 25 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_SMART | AI_AGGRESSIVE | AI_CAUTIOUS | AI_STATUS_IMMUNE | AI_RISKY
	db $44, $00

; Brock
	db HYPER_POTION, NONE ; items
	db 25 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_SMART | AI_AGGRESSIVE | AI_CAUTIOUS | AI_STATUS_IMMUNE | AI_RISKY
	db $44, $00

; Misty
	db FULL_HEAL, NONE ; items
	db 25 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_SMART | AI_AGGRESSIVE | AI_CAUTIOUS | AI_STATUS_IMMUNE | AI_RISKY
	db $44, $00

; Lt Surge
	db HYPER_POTION, NONE ; items
	db 25 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_SMART | AI_AGGRESSIVE | AI_CAUTIOUS | AI_STATUS_IMMUNE | AI_RISKY
	db $44, $00

; Scientist
	db NONE, NONE ; items
	db 25 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_TYPES_RED | AI_STATUS_IMMUNE | AI_RISKY
	db $44, $00

; Erika
	db HYPER_POTION, NONE ; items
	db 25 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_SMART | AI_AGGRESSIVE | AI_CAUTIOUS | AI_STATUS_IMMUNE | AI_RISKY
	db $44, $00

; Youngster
	db NONE, NONE ; items
	db 4 ; base reward
	dw AI_STATUS_RED | AI_STATUS_IMMUNE
	db $44, $00

; Schoolboy
	db NONE, NONE ; items
	db 8 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_TYPES_RED | AI_OPPORTUNIST | AI_CAUTIOUS | AI_STATUS_IMMUNE
	db $41, $00

; Bird Keeper
	db NONE, NONE ; items
	db 6 ; base reward
	dw AI_STATUS_RED | AI_TYPES_RED | AI_OFFENSIVE | AI_OPPORTUNIST | AI_STATUS_IMMUNE
	db $44, $00

; Lass
	db NONE, NONE ; items
	db 6 ; base reward
	dw AI_STATUS_RED | AI_CAUTIOUS | AI_STATUS_IMMUNE
	db $41, $00

; Janine
	db DIRE_HIT, NONE ; items
	db 25 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_SMART | AI_AGGRESSIVE | AI_CAUTIOUS | AI_STATUS_IMMUNE | AI_RISKY
	db $44, $00

; Cooltrainerm
	db NONE, NONE ; items
	db 12 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_SMART | AI_AGGRESSIVE | AI_CAUTIOUS | AI_STATUS_IMMUNE | AI_RISKY
	db $44, $00

; Cooltrainerf
	db NONE, NONE ; items
	db 12 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_SMART | AI_AGGRESSIVE | AI_CAUTIOUS | AI_STATUS_IMMUNE | AI_RISKY
	db $44, $00

; Beauty
	db NONE, NONE ; items
	db 22 ; base reward
	dw AI_STATUS_RED | AI_TYPES_RED | AI_OPPORTUNIST | AI_CAUTIOUS | AI_STATUS_IMMUNE
	db $44, $00

; Pokemaniac
	db NONE, NONE ; items
	db 15 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_OFFENSIVE | AI_AGGRESSIVE | AI_STATUS_IMMUNE
	db $44, $00

; Gruntm
	db NONE, NONE ; items
	db 10 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_TYPES_RED | AI_OPPORTUNIST | AI_CAUTIOUS | AI_STATUS_IMMUNE | AI_RISKY
	db $44, $00

; Gentleman
	db NONE, NONE ; items
	db 18 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_AGGRESSIVE | AI_STATUS_IMMUNE
	db $44, $00

; Skier
	db NONE, NONE ; items
	db 18 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_TYPES_RED | AI_STATUS_IMMUNE | AI_RISKY
	db $44, $00

; Teacher
	db NONE, NONE ; items
	db 18 ; base reward
	dw AI_STATUS_RED | AI_OPPORTUNIST | AI_AGGRESSIVE | AI_STATUS_IMMUNE
	db $44, $00

; Sabrina
	db HYPER_POTION, NONE ; items
	db 25 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_SMART | AI_AGGRESSIVE | AI_CAUTIOUS | AI_STATUS_IMMUNE | AI_RISKY
	db $44, $00

; Bug Catcher
	db NONE, NONE ; items
	db 4 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_STATUS_IMMUNE
	db $44, $00

; Fisher
	db NONE, NONE ; items
	db 10 ; base reward
	dw AI_STATUS_RED | AI_TYPES_RED | AI_OPPORTUNIST | AI_CAUTIOUS | AI_STATUS_IMMUNE
	db $41, $00

; Swimmerm
	db NONE, NONE ; items
	db 2 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_TYPES_RED | AI_OFFENSIVE | AI_STATUS_IMMUNE
	db $44, $00

; Swimmerf
	db NONE, NONE ; items
	db 5 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_TYPES_RED | AI_CAUTIOUS | AI_STATUS_IMMUNE
	db $44, $00

; Sailor
	db NONE, NONE ; items
	db 10 ; base reward
	dw AI_STATUS_RED | AI_OFFENSIVE | AI_OPPORTUNIST | AI_STATUS_IMMUNE
	db $44, $00

; Super Nerd
	db NONE, NONE ; items
	db 8 ; base reward
	dw AI_STATUS_RED | AI_TYPES_RED | AI_SMART | AI_STATUS_IMMUNE
	db $44, $00

; Rival2
	db NONE, NONE ; items
	db 25 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_SMART | AI_AGGRESSIVE | AI_CAUTIOUS | AI_STATUS_IMMUNE | AI_RISKY
	db $44, $00

; Guitarist
	db NONE, NONE ; items
	db 8 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_TYPES_RED | AI_CAUTIOUS | AI_STATUS_IMMUNE
	db $44, $00

; Hiker
	db NONE, NONE ; items
	db 8 ; base reward
	dw AI_STATUS_RED | AI_OFFENSIVE | AI_STATUS_IMMUNE
	db $44, $00

; Biker
	db NONE, NONE ; items
	db 8 ; base reward
	dw AI_STATUS_RED | AI_TYPES_RED | AI_STATUS_IMMUNE | AI_RISKY
	db $44, $00

; Blaine
	db MAX_POTION, FULL_HEAL ; items
	db 25 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_SMART | AI_AGGRESSIVE | AI_CAUTIOUS | AI_STATUS_IMMUNE | AI_RISKY
	db $44, $00

; Burglar
	db NONE, NONE ; items
	db 22 ; base reward
	dw AI_STATUS_RED | AI_OFFENSIVE | AI_CAUTIOUS | AI_STATUS_IMMUNE
	db $44, $00

; Firebreather
	db NONE, NONE ; items
	db 12 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_OFFENSIVE | AI_OPPORTUNIST | AI_STATUS_IMMUNE
	db $44, $00

; Juggler
	db NONE, NONE ; items
	db 10 ; base reward
	dw AI_STATUS_RED | AI_TYPES_RED | AI_SMART | AI_STATUS_IMMUNE
	db $44, $00

; Blackbelt T
	db NONE, NONE ; items
	db 6 ; base reward
	dw AI_STATUS_RED | AI_OFFENSIVE | AI_STATUS_IMMUNE | AI_RISKY
	db $44, $00

; Executivem
	db NONE, NONE ; items
	db 18 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_TYPES_RED | AI_SMART | AI_OPPORTUNIST | AI_CAUTIOUS | AI_STATUS_IMMUNE | AI_RISKY
	db $44, $00

; Psychic T
	db NONE, NONE ; items
	db 8 ; base reward
	dw AI_STATUS_RED | AI_TYPES_RED | AI_OPPORTUNIST | AI_CAUTIOUS | AI_STATUS_IMMUNE
	db $44, $00

; Picnicker
	db NONE, NONE ; items
	db 5 ; base reward
	dw AI_STATUS_RED | AI_CAUTIOUS | AI_STATUS_IMMUNE
	db $44, $00

; Camper
	db NONE, NONE ; items
	db 5 ; base reward
	dw AI_STATUS_RED | AI_CAUTIOUS | AI_STATUS_IMMUNE
	db $44, $00

; Executivef
	db NONE, NONE ; items
	db 18 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_TYPES_RED | AI_SMART | AI_OPPORTUNIST | AI_CAUTIOUS | AI_STATUS_IMMUNE | AI_RISKY
	db $44, $00

; Sage
	db NONE, NONE ; items
	db 8 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_TYPES_RED | AI_CAUTIOUS | AI_STATUS_IMMUNE | AI_RISKY
	db $44, $00

; Medium
	db NONE, NONE ; items
	db 10 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_TYPES_RED | AI_CAUTIOUS | AI_STATUS_IMMUNE | AI_RISKY
	db $44, $00

; Boarder
	db NONE, NONE ; items
	db 18 ; base reward
	dw AI_STATUS_RED | AI_TYPES_RED | AI_OPPORTUNIST | AI_STATUS_IMMUNE
	db $44, $00

; Pokefanm
	db NONE, NONE ; items
	db 20 ; base reward
	dw AI_STATUS_RED | AI_TYPES_RED | AI_SMART | AI_STATUS_IMMUNE
	db $44, $00

; Kimono Girl
	db NONE, NONE ; items
	db 18 ; base reward
	dw AI_STATUS_RED | AI_TYPES_RED | AI_OPPORTUNIST | AI_CAUTIOUS | AI_STATUS_IMMUNE
	db $44, $00

; Twins
	db NONE, NONE ; items
	db 5 ; base reward
	dw NONE
	db $41, $00

; Pokefanf
	db NONE, NONE ; items
	db 20 ; base reward
	dw AI_STATUS_RED | AI_TYPES_RED | AI_SMART | AI_STATUS_IMMUNE
	db $44, $00

; Red
	db FULL_RESTORE, FULL_RESTORE ; items
	db 25 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_SMART | AI_AGGRESSIVE | AI_CAUTIOUS | AI_STATUS_IMMUNE | AI_RISKY
	db $44, $00

; Blue
	db FULL_RESTORE, FULL_RESTORE ; items
	db 25 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_SMART | AI_AGGRESSIVE | AI_CAUTIOUS | AI_STATUS_IMMUNE | AI_RISKY
	db $44, $00

; Officer
	db NONE, NONE ; items
	db 10 ; base reward
	dw AI_STATUS_RED | AI_TYPES_RED | AI_OPPORTUNIST | AI_STATUS_IMMUNE
	db $44, $00

; Gruntf
	db NONE, NONE ; items
	db 10 ; base reward
	dw AI_STATUS_RED | AI_TYPES_RED | AI_OPPORTUNIST | AI_CAUTIOUS | AI_STATUS_IMMUNE | AI_RISKY
	db $44, $00

; Mysticalman
	db NONE, NONE ; items
	db 25 ; base reward
	dw AI_STATUS_RED | AI_STAT_MODS_RED | AI_SMART | AI_AGGRESSIVE | AI_CAUTIOUS | AI_STATUS_IMMUNE | AI_RISKY
	db $44, $00

; 39771

