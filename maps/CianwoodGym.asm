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
	2writetext UnknownText_0x9d6f9
	closetext
	loadmovesprites
	spriteface $2, $3
	loadfont
	2writetext UnknownText_0x9d76f
	closetext
	loadmovesprites
	applymovement $7, MovementData_0x9d6f3
	playsound $001b
	earthquake 80
	disappear $7
	pause 30
	faceplayer
	loadfont
	2writetext UnknownText_0x9d78a
	closetext
	loadmovesprites
	winlosstext UnknownText_0x9d7f6, $0000
	loadtrainer CHUCK, 1
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_CHUCK
	loadfont
	2writetext UnknownText_0x9d835
	playsound $009c
	waitbutton
	setbit2 $0020
	checkcode $7
	2call UnknownScript_0x9d681
UnknownScript_0x9d656: ; 0x9d656
	checkevent EVENT_GOT_TM01_DYNAMICPUNCH
	iftrue UnknownScript_0x9d67b
	setevent EVENT_BEAT_BLACKBELT_YOSHI
	setevent EVENT_BEAT_BLACKBELT_LAO
	setevent EVENT_BEAT_BLACKBELT_NOB
	setevent EVENT_BEAT_BLACKBELT_LUNG
	2writetext UnknownText_0x9d84d
	keeptextopen
	verbosegiveitem TM_01, 1
	iffalse UnknownScript_0x9d67f
	setevent EVENT_GOT_TM01_DYNAMICPUNCH
	2writetext UnknownText_0x9d8da
	closetext
	loadmovesprites
	end
; 0x9d67b

UnknownScript_0x9d67b: ; 0x9d67b
	2writetext UnknownText_0x9d930
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
	2writetext UnknownText_0x9d9fa
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
	2writetext UnknownText_0x9da61
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
	2writetext UnknownText_0x9dac0
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
	2writetext UnknownText_0x9db14
	closetext
	loadmovesprites
	end
; 0x9d6e0

BoulderScript_0x9d6e0: ; 0x9d6e0
	jumpstd $000e
; 0x9d6e3

MapCianwoodGymSignpost1Script: ; 0x9d6e3
	checkbit2 $0020
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
	db $0, "WAHAHAH!", $51
	db "So you've come", $4f
	db "this far!", $51
	db "Let me tell you,", $4f
	db "I'm tough!", $51
	db "My #MON will", $4f
	db "crush stones and", $55
	db "shatter bones!", $51
	db "Watch this!", $57
; 0x9d76f

UnknownText_0x9d76f: ; 0x9d76f
	db $0, "CHUCK: Urggh!", $4f
	db "…", $51
	db "Oooarrgh!", $57
; 0x9d78a

UnknownText_0x9d78a: ; 0x9d78a
	db $0, "There! Scared now,", $4f
	db "are you?", $51
	db "What?", $4f
	db "It has nothing to", $51
	db "do with #MON?", $4f
	db "That's true!", $51
	db "Come on. We shall", $4f
	db "do battle!", $57
; 0x9d7f6

UnknownText_0x9d7f6: ; 0x9d7f6
	db $0, "Wha? Huh?", $4f
	db "I lost?", $51
	db "How about that!", $4f
	db "You're worthy of", $55
	db "STORMBADGE!", $57
; 0x9d835

UnknownText_0x9d835: ; 0x9d835
	db $0, $52, " received", $4f
	db "STORMBADGE.", $57
; 0x9d84d

UnknownText_0x9d84d: ; 0x9d84d
	db $0, "STORMBADGE makes", $4f
	db "all #MON up to", $51
	db "L70 obey, even", $4f
	db "traded ones.", $51
	db "It also lets your", $4f
	db "#MON use FLY", $51
	db "when you're not in", $4f
	db "a battle.", $51
	db "Here, take this", $4f
	db "too!", $57
; 0x9d8da

UnknownText_0x9d8da: ; 0x9d8da
	db $0, "That is DYNAMIC-", $4f
	db "PUNCH.", $51
	db "It doesn't always", $4f
	db "hit, but when it", $51
	db "does, it causes", $4f
	db "confusion!", $57
; 0x9d930

UnknownText_0x9d930: ; 0x9d930
	db $0, "WAHAHAH! I enjoyed", $4f
	db "battling you!", $51
	db "But a loss is a", $4f
	db "loss!", $51
	db "From now on, I'm", $4f
	db "going to train 24", $55
	db "hours a day!", $57
; 0x9d997

BlackbeltYoshiSeenText: ; 0x9d997
	db $0, "My #MON and I", $4f
	db "are bound togeth-", $55
	db "er by friendship.", $51
	db "Our bond will", $4f
	db "never be broken!", $57
; 0x9d9e9

BlackbeltYoshiBeatenText: ; 0x9d9e9
	db $0, "This isn't real!", $57
; 0x9d9fa

UnknownText_0x9d9fa: ; 0x9d9fa
	db $0, "You seem to have a", $4f
	db "strong bond with", $55
	db "your #MON too!", $57
; 0x9da2e

BlackbeltLaoSeenText: ; 0x9da2e
	db $0, "We martial artists", $4f
	db "fear nothing!", $57
; 0x9da50

BlackbeltLaoBeatenText: ; 0x9da50
	db $0, "That's shocking!", $57
; 0x9da61

UnknownText_0x9da61: ; 0x9da61
	db $0, "Fighting #MON", $4f
	db "are afraid of psy-", $55
	db "chics…", $57
; 0x9da8a

BlackbeltNobSeenText: ; 0x9da8a
	db $0, "Words are useless.", $4f
	db "Let your fists do", $55
	db "the talking!", $57
; 0x9dabd

BlackbeltNobBeatenText: ; 0x9dabd
	db $0, "…", $57
; 0x9dac0

UnknownText_0x9dac0: ; 0x9dac0
	db $0, "I lost! ", $4f
	db "I'm speechless!", $57
; 0x9dad9

BlackbeltLungSeenText: ; 0x9dad9
	db $0, "My raging fists", $4f
	db "will shatter your", $55
	db "#MON!", $57
; 0x9db02

BlackbeltLungBeatenText: ; 0x9db02
	db $0, "I got shattered!", $57
; 0x9db14

UnknownText_0x9db14: ; 0x9db14
	db $0, "My #MON lost…", $4f
	db "My… my pride is", $55
	db "shattered…", $57
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

