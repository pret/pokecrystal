engine_flag: MACRO
	dwb \1, 1 << \2
ENDM

EngineFlags: ; 80462
	; location, bit
	; (all locations are in WRAM bank 1)

	; pokegear
	engine_flag wPokegearFlags, 1 ; radio card       ; $0
	engine_flag wPokegearFlags, 0 ; map card
	engine_flag wPokegearFlags, 2 ; phone card
	engine_flag wPokegearFlags, 3 ; expn card
	engine_flag wPokegearFlags, 7 ; on/off

	;   wDayCareMan, 7 ; day-care 1 on
	engine_flag wDayCareMan, 6 ; egg is ready
	;   wDayCareMan, 5 ; monster 1 and 2 are compatible
	engine_flag wDayCareMan, 0 ; monster 1 in day-care

	;   wDayCareLady, 7 = day-care 2 on
	engine_flag wDayCareLady, 0 ; monster 2 in day-care

	engine_flag wMomSavingMoney, 0 ; mom saving money ; $8
	engine_flag wMomSavingMoney, 7 ; dst

	engine_flag wUnusedTwoDayTimerOn, 0 ; unused, possibly related to a 2-day timer

	engine_flag wStatusFlags, 0 ; pokedex
	engine_flag wStatusFlags, 1 ; unown dex
	engine_flag wStatusFlags, 3 ; pokerus
	engine_flag wStatusFlags, 4 ; rocket signal on ch20
	engine_flag wStatusFlags, 6 ; credits skip
	engine_flag wStatusFlags, 7 ; bug contest on   ; $10
	engine_flag wStatusFlags2, 2 ; bug contest timer
	engine_flag wStatusFlags2, 1 ; safari zone?
	engine_flag wStatusFlags2, 0 ; rockets in radio tower
	engine_flag wStatusFlags2, 4 ; bike shop call enabled (1024 bike steps reqd)
	engine_flag wStatusFlags2, 5 ; give pokerus
	engine_flag wStatusFlags2, 6 ; berry -> berry juice when trading?
	engine_flag wStatusFlags2, 7 ; rockets in mahogany

	engine_flag wBikeFlags, 0 ; strength active  ; $18
	engine_flag wBikeFlags, 1 ; always on bike (cant surf)
	engine_flag wBikeFlags, 2 ; downhill (cycling road)

	engine_flag wJohtoBadges, 0 ; zephyrbadge
	engine_flag wJohtoBadges, 1 ; hivebadge
	engine_flag wJohtoBadges, 2 ; plainbadge
	engine_flag wJohtoBadges, 3 ; fogbadge
	engine_flag wJohtoBadges, 4 ; mineralbadge
	engine_flag wJohtoBadges, 5 ; stormbadge ; $20
	engine_flag wJohtoBadges, 6 ; glacierbadge
	engine_flag wJohtoBadges, 7 ; risingbadge

	engine_flag wKantoBadges, 0 ; boulderbadge
	engine_flag wKantoBadges, 1 ; cascadebadge
	engine_flag wKantoBadges, 2 ; thunderbadge
	engine_flag wKantoBadges, 3 ; rainbowbadge
	engine_flag wKantoBadges, 4 ; soulbadge
	engine_flag wKantoBadges, 5 ; marshbadge ; $28
	engine_flag wKantoBadges, 6 ; volcanobadge
	engine_flag wKantoBadges, 7 ; earthbadge

	; unown sets
	engine_flag wUnlockedUnowns, 0 ; 1
	engine_flag wUnlockedUnowns, 1 ; 2
	engine_flag wUnlockedUnowns, 2 ; 3
	engine_flag wUnlockedUnowns, 3 ; 4
	engine_flag wUnlockedUnowns, 4 ; 5
	engine_flag wUnlockedUnowns, 5 ; 6       ; $30
	engine_flag wUnlockedUnowns, 6 ; 7
	engine_flag wUnlockedUnowns, 7 ; 8

	; fly
	engine_flag wVisitedSpawns, 0     ; your house
	engine_flag wVisitedSpawns, 1     ; viridian pokecenter
	engine_flag wVisitedSpawns, 2     ; pallet
	engine_flag wVisitedSpawns, 3     ; viridian
	engine_flag wVisitedSpawns, 4     ; pewter
	engine_flag wVisitedSpawns, 5     ; cerulean ; $38
	engine_flag wVisitedSpawns, 6     ; rock tunnel
	engine_flag wVisitedSpawns, 7     ; vermilion
	engine_flag wVisitedSpawns + 1, 0 ; lavender
	engine_flag wVisitedSpawns + 1, 1 ; saffron
	engine_flag wVisitedSpawns + 1, 2 ; celadon
	engine_flag wVisitedSpawns + 1, 3 ; fuchsia
	engine_flag wVisitedSpawns + 1, 4 ; cinnabar
	engine_flag wVisitedSpawns + 1, 5 ; indigo plateau ; $40
	engine_flag wVisitedSpawns + 1, 6 ; new bark
	engine_flag wVisitedSpawns + 1, 7 ; cherrygrove
	engine_flag wVisitedSpawns + 2, 0 ; violet
	                                  ; union cave
	engine_flag wVisitedSpawns + 2, 2 ; azalea
	engine_flag wVisitedSpawns + 2, 3 ; cianwood
	engine_flag wVisitedSpawns + 2, 4 ; goldenrod
	engine_flag wVisitedSpawns + 2, 5 ; olivine
	engine_flag wVisitedSpawns + 2, 6 ; ecruteak  ; $48
	engine_flag wVisitedSpawns + 2, 7 ; mahogany
	engine_flag wVisitedSpawns + 3, 0 ; lake of rage
	engine_flag wVisitedSpawns + 3, 1 ; blackthorn
	engine_flag wVisitedSpawns + 3, 2 ; silver cave
	                                  ; fast ship
	engine_flag wVisitedSpawns + 3, 4 ; unused

	engine_flag wLuckyNumberShowFlag, 0 ; lucky number show
	engine_flag wStatusFlags2, 3 ; ????

	engine_flag wDailyFlags, 0 ; kurt making balls  ; $50
	engine_flag wDailyFlags, 1 ; ????
	engine_flag wDailyFlags, 2 ; special wilddata?
	engine_flag wDailyFlags, 3 ; time capsule (24h wait)
	engine_flag wDailyFlags, 4 ; all fruit trees
	engine_flag wDailyFlags, 5 ; shuckle given
	engine_flag wDailyFlags, 6 ; goldenrod underground merchant closed
	engine_flag wDailyFlags, 7 ; fought in trainer hall today

	engine_flag wWeeklyFlags, 0 ; mt moon square clefairy  ; $58
	engine_flag wWeeklyFlags, 1 ; union cave lapras
	engine_flag wWeeklyFlags, 2 ; goldenrod underground haircut used
	engine_flag wWeeklyFlags, 3 ; goldenrod mall happiness event floor05 object07
	engine_flag wWeeklyFlags, 4 ; tea in blues house
	engine_flag wWeeklyFlags, 5 ; indigo plateau rival fight
	engine_flag wWeeklyFlags, 6 ; move tutor
	engine_flag wWeeklyFlags, 7 ; buenas password

	engine_flag wSwarmFlags, 0 ; buenas password 2
	engine_flag wSwarmFlags, 1 ; goldenrod dept store sale is on

	engine_flag wGameTimerPause, 7 ; $62

	engine_flag wPlayerGender, 0 ; player is female

	engine_flag wCelebiEvent, 2 ; have gs ball after kurt examined it

	; rematches
	engine_flag wDailyRematchFlags, 0 ; jack
	engine_flag wDailyRematchFlags, 1 ; huey
	engine_flag wDailyRematchFlags, 2 ; gaven
	engine_flag wDailyRematchFlags, 3 ; beth  ; $68
	engine_flag wDailyRematchFlags, 4 ; jose
	engine_flag wDailyRematchFlags, 5 ; reena
	engine_flag wDailyRematchFlags, 6 ; joey
	engine_flag wDailyRematchFlags, 7 ; wade
	engine_flag wDailyRematchFlags + 1, 0 ; ralph
	engine_flag wDailyRematchFlags + 1, 1 ; liz
	engine_flag wDailyRematchFlags + 1, 2 ; anthony
	engine_flag wDailyRematchFlags + 1, 3 ; todd  ; $70
	engine_flag wDailyRematchFlags + 1, 4 ; gina
	engine_flag wDailyRematchFlags + 1, 5 ; arnie
	engine_flag wDailyRematchFlags + 1, 6 ; alan
	engine_flag wDailyRematchFlags + 1, 7 ; dana
	engine_flag wDailyRematchFlags + 2, 0 ; chad
	engine_flag wDailyRematchFlags + 2, 1 ; tully
	engine_flag wDailyRematchFlags + 2, 2 ; brent
	engine_flag wDailyRematchFlags + 2, 3 ; tiffany  ; $78
	engine_flag wDailyRematchFlags + 2, 4 ; vance
	engine_flag wDailyRematchFlags + 2, 5 ; wilton
	engine_flag wDailyRematchFlags + 2, 6 ; parry
	engine_flag wDailyRematchFlags + 2, 7 ; erin

	engine_flag wDailyPhoneItemFlags, 0 ; beverly has nugget
	engine_flag wDailyPhoneItemFlags, 1 ; jose has star piece
	engine_flag wDailyPhoneItemFlags, 2 ; wade has item (see EVENT_WADE_HAS_*** in constants/event_flags.asm)
	engine_flag wDailyPhoneItemFlags, 3 ; gina has leaf stone  ; $80
	engine_flag wDailyPhoneItemFlags, 4 ; alan has fire stone
	engine_flag wDailyPhoneItemFlags, 5 ; liz has thunderstone
	engine_flag wDailyPhoneItemFlags, 6 ; derek has nugget
	engine_flag wDailyPhoneItemFlags, 7 ; tully has water stone

	engine_flag wDailyPhoneItemFlags + 1, 0 ; tiffany has pink bow
	engine_flag wDailyPhoneItemFlags + 1, 1 ; wilton has item (see EVENT_WILTON_HAS_*** in constants/event_flags.asm)

	engine_flag wDailyPhoneTimeOfDayFlags, 0
	engine_flag wDailyPhoneTimeOfDayFlags, 1  ; $88
	engine_flag wDailyPhoneTimeOfDayFlags, 2
	engine_flag wDailyPhoneTimeOfDayFlags, 3
	engine_flag wDailyPhoneTimeOfDayFlags, 4
	engine_flag wDailyPhoneTimeOfDayFlags, 5
	engine_flag wDailyPhoneTimeOfDayFlags, 6
	engine_flag wDailyPhoneTimeOfDayFlags, 7

	engine_flag wDailyPhoneTimeOfDayFlags + 1, 0
	engine_flag wDailyPhoneTimeOfDayFlags + 1, 1  ; $90
	engine_flag wDailyPhoneTimeOfDayFlags + 1, 2
	engine_flag wDailyPhoneTimeOfDayFlags + 1, 3
	engine_flag wDailyPhoneTimeOfDayFlags + 1, 4
	engine_flag wDailyPhoneTimeOfDayFlags + 1, 5
	engine_flag wDailyPhoneTimeOfDayFlags + 1, 6
	engine_flag wDailyPhoneTimeOfDayFlags + 1, 7

	engine_flag wDailyPhoneTimeOfDayFlags + 2, 0
	engine_flag wDailyPhoneTimeOfDayFlags + 2, 1  ; $98
	engine_flag wDailyPhoneTimeOfDayFlags + 2, 2
	engine_flag wDailyPhoneTimeOfDayFlags + 2, 3
	engine_flag wDailyPhoneTimeOfDayFlags + 2, 4
	engine_flag wDailyPhoneTimeOfDayFlags + 2, 5
	engine_flag wDailyPhoneTimeOfDayFlags + 2, 6
	engine_flag wDailyPhoneTimeOfDayFlags + 2, 7

	engine_flag wPlayerSpriteSetupFlags, 2 ; female player has been transformed into male

	engine_flag wSwarmFlags, 2 ; dunsparce swarm   ; $a0
	engine_flag wSwarmFlags, 3 ; yanma swarm

; 80648
