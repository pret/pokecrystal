TrainerClassAttributes: ; 3959c
; entries correspond to trainer classes (see constants/trainer_constants.asm)

; Falkner
	db 0, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Whitney
	db 0, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Bugsy
	db 0, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Morty
	db 0, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Pryce
	db HYPER_POTION, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Jasmine
	db HYPER_POTION, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Chuck
	db FULL_HEAL, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Clair
	db FULL_HEAL, HYPER_POTION ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Rival1
	db 0, 0 ; items
	db 15 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Pokemon Prof
	db 0, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_AGGRESSIVE + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Will
	db MAX_POTION, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Cal
	db 0, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Bruno
	db MAX_POTION, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Karen
	db FULL_HEAL, MAX_POTION ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Koga
	db FULL_HEAL, FULL_RESTORE ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Champion
	db FULL_HEAL, FULL_RESTORE ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Brock
	db HYPER_POTION, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Misty
	db FULL_HEAL, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Lt Surge
	db HYPER_POTION, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Scientist
	db 0, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Erika
	db HYPER_POTION, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Youngster
	db 0, 0 ; items
	db 4 ; base reward
	dw AI_BASIC + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Schoolboy
	db 0, 0 ; items
	db 8 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_OPPORTUNIST + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_OFTEN

; Bird Keeper
	db 0, 0 ; items
	db 6 ; base reward
	dw AI_BASIC + AI_TYPES + AI_OFFENSIVE + AI_OPPORTUNIST + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Lass
	db 0, 0 ; items
	db 6 ; base reward
	dw AI_BASIC + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_OFTEN

; Janine
	db DIRE_HIT, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Cooltrainerm
	db 0, 0 ; items
	db 12 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Cooltrainerf
	db 0, 0 ; items
	db 12 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Beauty
	db 0, 0 ; items
	db 22 ; base reward
	dw AI_BASIC + AI_TYPES + AI_OPPORTUNIST + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Pokemaniac
	db 0, 0 ; items
	db 15 ; base reward
	dw AI_BASIC + AI_SETUP + AI_OFFENSIVE + AI_AGGRESSIVE + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Gruntm
	db 0, 0 ; items
	db 10 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_OPPORTUNIST + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Gentleman
	db 0, 0 ; items
	db 18 ; base reward
	dw AI_BASIC + AI_SETUP + AI_AGGRESSIVE + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Skier
	db 0, 0 ; items
	db 18 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Teacher
	db 0, 0 ; items
	db 18 ; base reward
	dw AI_BASIC + AI_OPPORTUNIST + AI_AGGRESSIVE + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Sabrina
	db HYPER_POTION, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Bug Catcher
	db 0, 0 ; items
	db 4 ; base reward
	dw AI_BASIC + AI_SETUP + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Fisher
	db 0, 0 ; items
	db 10 ; base reward
	dw AI_BASIC + AI_TYPES + AI_OPPORTUNIST + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_OFTEN

; Swimmerm
	db 0, 0 ; items
	db 2 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_OFFENSIVE + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Swimmerf
	db 0, 0 ; items
	db 5 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Sailor
	db 0, 0 ; items
	db 10 ; base reward
	dw AI_BASIC + AI_OFFENSIVE + AI_OPPORTUNIST + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Super Nerd
	db 0, 0 ; items
	db 8 ; base reward
	dw AI_BASIC + AI_TYPES + AI_SMART + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Rival2
	db 0, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Guitarist
	db 0, 0 ; items
	db 8 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Hiker
	db 0, 0 ; items
	db 8 ; base reward
	dw AI_BASIC + AI_OFFENSIVE + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Biker
	db 0, 0 ; items
	db 8 ; base reward
	dw AI_BASIC + AI_TYPES + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Blaine
	db MAX_POTION, FULL_HEAL ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Burglar
	db 0, 0 ; items
	db 22 ; base reward
	dw AI_BASIC + AI_OFFENSIVE + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Firebreather
	db 0, 0 ; items
	db 12 ; base reward
	dw AI_BASIC + AI_SETUP + AI_OFFENSIVE + AI_OPPORTUNIST + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Juggler
	db 0, 0 ; items
	db 10 ; base reward
	dw AI_BASIC + AI_TYPES + AI_SMART + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Blackbelt T
	db 0, 0 ; items
	db 6 ; base reward
	dw AI_BASIC + AI_OFFENSIVE + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Executivem
	db 0, 0 ; items
	db 18 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_SMART + AI_OPPORTUNIST + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Psychic T
	db 0, 0 ; items
	db 8 ; base reward
	dw AI_BASIC + AI_TYPES + AI_OPPORTUNIST + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Picnicker
	db 0, 0 ; items
	db 5 ; base reward
	dw AI_BASIC + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Camper
	db 0, 0 ; items
	db 5 ; base reward
	dw AI_BASIC + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Executivef
	db 0, 0 ; items
	db 18 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_SMART + AI_OPPORTUNIST + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Sage
	db 0, 0 ; items
	db 8 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Medium
	db 0, 0 ; items
	db 10 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Boarder
	db 0, 0 ; items
	db 18 ; base reward
	dw AI_BASIC + AI_TYPES + AI_OPPORTUNIST + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Pokefanm
	db 0, 0 ; items
	db 20 ; base reward
	dw AI_BASIC + AI_TYPES + AI_SMART + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Kimono Girl
	db 0, 0 ; items
	db 18 ; base reward
	dw AI_BASIC + AI_TYPES + AI_OPPORTUNIST + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Twins
	db 0, 0 ; items
	db 5 ; base reward
	dw NO_AI
	dw CONTEXT_USE + SWITCH_OFTEN

; Pokefanf
	db 0, 0 ; items
	db 20 ; base reward
	dw AI_BASIC + AI_TYPES + AI_SMART + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Red
	db FULL_RESTORE, FULL_RESTORE ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Blue
	db FULL_RESTORE, FULL_RESTORE ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Officer
	db 0, 0 ; items
	db 10 ; base reward
	dw AI_BASIC + AI_TYPES + AI_OPPORTUNIST + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Gruntf
	db 0, 0 ; items
	db 10 ; base reward
	dw AI_BASIC + AI_TYPES + AI_OPPORTUNIST + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Mysticalman
	db 0, 0 ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; 39771
