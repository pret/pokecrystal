CianwoodGym_MapScriptHeader: ; 0x9d60d
	; trigger count
	db 0

	; callback count
	db 0
; 0x9d60f

ChuckScript_0x9d60f: ; 0x9d60f
	faceplayer
	loadfont
	checkevent EVENT_BEAT_CHUCK
	iftrue UnknownScript_0x9d656
	writetext UnknownText_0x9d6f9
	closetext
	loadmovesprites
	spriteface $2, $3
	loadfont
	writetext UnknownText_0x9d76f
	closetext
	loadmovesprites
	applymovement $7, MovementData_0x9d6f3
	playsound SFX_STRENGTH
	earthquake 80
	disappear $7
	pause 30
	faceplayer
	loadfont
	writetext UnknownText_0x9d78a
	closetext
	loadmovesprites
	winlosstext UnknownText_0x9d7f6, $0000
	loadtrainer CHUCK, 1
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_CHUCK
	loadfont
	writetext UnknownText_0x9d835
	playsound SFX_GET_BADGE
	waitbutton
	setflag $0020
	checkcode $7
	scall UnknownScript_0x9d681
UnknownScript_0x9d656: ; 0x9d656
	checkevent EVENT_GOT_TM01_DYNAMICPUNCH
	iftrue UnknownScript_0x9d67b
	setevent EVENT_BEAT_BLACKBELT_YOSHI
	setevent EVENT_BEAT_BLACKBELT_LAO
	setevent EVENT_BEAT_BLACKBELT_NOB
	setevent EVENT_BEAT_BLACKBELT_LUNG
	writetext UnknownText_0x9d84d
	keeptextopen
	verbosegiveitem TM_01, 1
	iffalse UnknownScript_0x9d67f
	setevent EVENT_GOT_TM01_DYNAMICPUNCH
	writetext UnknownText_0x9d8da
	closetext
	loadmovesprites
	end
; 0x9d67b

UnknownScript_0x9d67b: ; 0x9d67b
	writetext UnknownText_0x9d930
	closetext
UnknownScript_0x9d67f: ; 0x9d67f
	loadmovesprites
	end
; 0x9d681

UnknownScript_0x9d681: ; 0x9d681
	if_equal $7, UnknownScript_0x9d68d
	if_equal $6, UnknownScript_0x9d68a
	end
; 0x9d68a

UnknownScript_0x9d68a: ; 0x9d68a
	jumpstd $0012
; 0x9d68d

UnknownScript_0x9d68d: ; 0x9d68d
	jumpstd $0013
; 0x9d690

TrainerBlackbeltYoshi: ; 0x9d690
	; bit/flag number
	dw $4a5

	; trainer group && trainer id
	db BLACKBELT_T, YOSHI

	; text when seen
	dw BlackbeltYoshiSeenText

	; text when trainer beaten
	dw BlackbeltYoshiBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw BlackbeltYoshiScript
; 0x9d69c

BlackbeltYoshiScript: ; 0x9d69c
	talkaftercancel
	loadfont
	writetext UnknownText_0x9d9fa
	closetext
	loadmovesprites
	end
; 0x9d6a4

TrainerBlackbeltLao: ; 0x9d6a4
	; bit/flag number
	dw $4a7

	; trainer group && trainer id
	db BLACKBELT_T, LAO

	; text when seen
	dw BlackbeltLaoSeenText

	; text when trainer beaten
	dw BlackbeltLaoBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw BlackbeltLaoScript
; 0x9d6b0

BlackbeltLaoScript: ; 0x9d6b0
	talkaftercancel
	loadfont
	writetext UnknownText_0x9da61
	closetext
	loadmovesprites
	end
; 0x9d6b8

TrainerBlackbeltNob: ; 0x9d6b8
	; bit/flag number
	dw $4a8

	; trainer group && trainer id
	db BLACKBELT_T, NOB

	; text when seen
	dw BlackbeltNobSeenText

	; text when trainer beaten
	dw BlackbeltNobBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw BlackbeltNobScript
; 0x9d6c4

BlackbeltNobScript: ; 0x9d6c4
	talkaftercancel
	loadfont
	writetext UnknownText_0x9dac0
	closetext
	loadmovesprites
	end
; 0x9d6cc

TrainerBlackbeltLung: ; 0x9d6cc
	; bit/flag number
	dw $4aa

	; trainer group && trainer id
	db BLACKBELT_T, LUNG

	; text when seen
	dw BlackbeltLungSeenText

	; text when trainer beaten
	dw BlackbeltLungBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw BlackbeltLungScript
; 0x9d6d8

BlackbeltLungScript: ; 0x9d6d8
	talkaftercancel
	loadfont
	writetext UnknownText_0x9db14
	closetext
	loadmovesprites
	end
; 0x9d6e0

BoulderScript_0x9d6e0: ; 0x9d6e0
	jumpstd $000e
; 0x9d6e3

MapCianwoodGymSignpost1Script: ; 0x9d6e3
	checkflag $0020
	iftrue UnknownScript_0x9d6ec
	jumpstd $002d
; 0x9d6ec

UnknownScript_0x9d6ec: ; 0x9d6ec
	trainertotext CHUCK, 1, $1
	jumpstd $002e
; 0x9d6f3

MovementData_0x9d6f3: ; 0x9d6f3
	db $39 ; movement
	big_step_left
	big_step_up
	fast_jump_step_right
	db $38 ; movement
	step_end
; 0x9d6f9

UnknownText_0x9d6f9: ; 0x9d6f9
	text "WAHAHAH!"

	para "So you've come"
	line "this far!"

	para "Let me tell you,"
	line "I'm tough!"

	para "My #MON will"
	line "crush stones and"
	cont "shatter bones!"

	para "Watch this!"
	done
; 0x9d76f

UnknownText_0x9d76f: ; 0x9d76f
	text "CHUCK: Urggh!"
	line "…"

	para "Oooarrgh!"
	done
; 0x9d78a

UnknownText_0x9d78a: ; 0x9d78a
	text "There! Scared now,"
	line "are you?"

	para "What?"
	line "It has nothing to"

	para "do with #MON?"
	line "That's true!"

	para "Come on. We shall"
	line "do battle!"
	done
; 0x9d7f6

UnknownText_0x9d7f6: ; 0x9d7f6
	text "Wha? Huh?"
	line "I lost?"

	para "How about that!"
	line "You're worthy of"
	cont "STORMBADGE!"
	done
; 0x9d835

UnknownText_0x9d835: ; 0x9d835
	text $52, " received"
	line "STORMBADGE."
	done
; 0x9d84d

UnknownText_0x9d84d: ; 0x9d84d
	text "STORMBADGE makes"
	line "all #MON up to"

	para "L70 obey, even"
	line "traded ones."

	para "It also lets your"
	line "#MON use FLY"

	para "when you're not in"
	line "a battle."

	para "Here, take this"
	line "too!"
	done
; 0x9d8da

UnknownText_0x9d8da: ; 0x9d8da
	text "That is DYNAMIC-"
	line "PUNCH."

	para "It doesn't always"
	line "hit, but when it"

	para "does, it causes"
	line "confusion!"
	done
; 0x9d930

UnknownText_0x9d930: ; 0x9d930
	text "WAHAHAH! I enjoyed"
	line "battling you!"

	para "But a loss is a"
	line "loss!"

	para "From now on, I'm"
	line "going to train 24"
	cont "hours a day!"
	done
; 0x9d997

BlackbeltYoshiSeenText: ; 0x9d997
	text "My #MON and I"
	line "are bound togeth-"
	cont "er by friendship."

	para "Our bond will"
	line "never be broken!"
	done
; 0x9d9e9

BlackbeltYoshiBeatenText: ; 0x9d9e9
	text "This isn't real!"
	done
; 0x9d9fa

UnknownText_0x9d9fa: ; 0x9d9fa
	text "You seem to have a"
	line "strong bond with"
	cont "your #MON too!"
	done
; 0x9da2e

BlackbeltLaoSeenText: ; 0x9da2e
	text "We martial artists"
	line "fear nothing!"
	done
; 0x9da50

BlackbeltLaoBeatenText: ; 0x9da50
	text "That's shocking!"
	done
; 0x9da61

UnknownText_0x9da61: ; 0x9da61
	text "Fighting #MON"
	line "are afraid of psy-"
	cont "chics…"
	done
; 0x9da8a

BlackbeltNobSeenText: ; 0x9da8a
	text "Words are useless."
	line "Let your fists do"
	cont "the talking!"
	done
; 0x9dabd

BlackbeltNobBeatenText: ; 0x9dabd
	text "…"
	done
; 0x9dac0

UnknownText_0x9dac0: ; 0x9dac0
	text "I lost! "
	line "I'm speechless!"
	done
; 0x9dad9

BlackbeltLungSeenText: ; 0x9dad9
	text "My raging fists"
	line "will shatter your"
	cont "#MON!"
	done
; 0x9db02

BlackbeltLungBeatenText: ; 0x9db02
	text "I got shattered!"
	done
; 0x9db14

UnknownText_0x9db14: ; 0x9db14
	text "My #MON lost…"
	line "My… my pride is"
	cont "shattered…"
	done
; 0x9db3e

CianwoodGym_MapEventHeader: ; 0x9db3e
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $11, $4, 2, GROUP_CIANWOOD_CITY, MAP_CIANWOOD_CITY
	warp_def $11, $5, 2, GROUP_CIANWOOD_CITY, MAP_CIANWOOD_CITY

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 15, 3, $0, MapCianwoodGymSignpost1Script
	signpost 15, 6, $0, MapCianwoodGymSignpost1Script

	; people-events
	db 9
	person_event SPRITE_CHUCK, 5, 8, $6, $0, 255, 255, $b0, 0, ChuckScript_0x9d60f, $ffff
	person_event SPRITE_BLACK_BELT, 16, 6, $9, $0, 255, 255, $b2, 3, TrainerBlackbeltYoshi, $ffff
	person_event SPRITE_BLACK_BELT, 16, 11, $8, $0, 255, 255, $b2, 3, TrainerBlackbeltLao, $ffff
	person_event SPRITE_BLACK_BELT, 13, 7, $9, $0, 255, 255, $b2, 2, TrainerBlackbeltNob, $ffff
	person_event SPRITE_BLACK_BELT, 9, 9, $8, $0, 255, 255, $b2, 1, TrainerBlackbeltLung, $ffff
	person_event SPRITE_BOULDER, 5, 9, $19, $0, 255, 255, $0, 0, BoulderScript_0x9d6e0, $ffff
	person_event SPRITE_BOULDER, 11, 7, $19, $0, 255, 255, $0, 0, BoulderScript_0x9d6e0, $ffff
	person_event SPRITE_BOULDER, 11, 8, $19, $0, 255, 255, $0, 0, BoulderScript_0x9d6e0, $ffff
	person_event SPRITE_BOULDER, 11, 9, $19, $0, 255, 255, $0, 0, BoulderScript_0x9d6e0, $ffff
; 0x9dbcd
