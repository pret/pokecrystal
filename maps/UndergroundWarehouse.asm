UndergroundWarehouse_MapScriptHeader: ; 0x7d94b
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 5, UnknownScript_0x7d950
; 0x7d950

UnknownScript_0x7d950: ; 0x7d950
	clearevent EVENT_SWITCH_1
	clearevent EVENT_SWITCH_2
	clearevent EVENT_SWITCH_3
	clearevent EVENT_EMERGENCY_SWITCH
	clearevent EVENT_SWITCH_4
	clearevent EVENT_SWITCH_5
	clearevent EVENT_SWITCH_6
	clearevent EVENT_SWITCH_7
	clearevent EVENT_SWITCH_8
	clearevent EVENT_SWITCH_9
	clearevent EVENT_SWITCH_10
	clearevent EVENT_SWITCH_11
	clearevent EVENT_SWITCH_12
	clearevent EVENT_SWITCH_13
	clearevent EVENT_SWITCH_14
	writebyte $0
	copyvartobyte UndergroundSwitchPositions
	return
; 0x7d983

TrainerGruntM24: ; 0x7d983
	; bit/flag number
	dw $508

	; trainer group && trainer id
	db GRUNTM, 24

	; text when seen
	dw GruntM24SeenText

	; text when trainer beaten
	dw GruntM24BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw GruntM24Script
; 0x7d98f

GruntM24Script: ; 0x7d98f
	talkaftercancel
	loadfont
	2writetext UnknownText_0x7da48
	closetext
	loadmovesprites
	end
; 0x7d997

TrainerGruntM14: ; 0x7d997
	; bit/flag number
	dw $4fe

	; trainer group && trainer id
	db GRUNTM, 14

	; text when seen
	dw GruntM14SeenText

	; text when trainer beaten
	dw GruntM14BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw GruntM14Script
; 0x7d9a3

GruntM14Script: ; 0x7d9a3
	talkaftercancel
	loadfont
	2writetext UnknownText_0x7db01
	closetext
	loadmovesprites
	end
; 0x7d9ab

TrainerGruntM15: ; 0x7d9ab
	; bit/flag number
	dw $4ff

	; trainer group && trainer id
	db GRUNTM, 15

	; text when seen
	dw GruntM15SeenText

	; text when trainer beaten
	dw GruntM15BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw GruntM15Script
; 0x7d9b7

GruntM15Script: ; 0x7d9b7
	talkaftercancel
	loadfont
	2writetext UnknownText_0x7db8e
	closetext
	loadmovesprites
	end
; 0x7d9bf

GentlemanScript_0x7d9bf: ; 0x7d9bf
	faceplayer
	loadfont
	checkevent $004a
	iftrue UnknownScript_0x7d9de
	2writetext UnknownText_0x7dbc6
	keeptextopen
	verbosegiveitem CARD_KEY, 1
	setevent $004a
	setevent $0304
	clearevent $0305
	clearevent $0306
	2writetext UnknownText_0x7dc5b
	keeptextopen
UnknownScript_0x7d9de: ; 0x7d9de
	2writetext UnknownText_0x7dc8d
	closetext
	loadmovesprites
	end
; 0x7d9e4

ItemFragment_0x7d9e4: ; 0x7d9e4
	db MAX_ETHER, 1
; 0x7d9e6

ItemFragment_0x7d9e6: ; 0x7d9e6
	db TM_35, 1
; 0x7d9e8

ItemFragment_0x7d9e8: ; 0x7d9e8
	db ULTRA_BALL, 1
; 0x7d9ea

GruntM24SeenText: ; 0x7d9ea
	text "How did you get"
	line "this far?"

	para "I guess it can't"
	line "be helped. I'll"
	cont "dispose of you."
	done
; 0x7da34

GruntM24BeatenText: ; 0x7da34
	text "I got disposed of…"
	done
; 0x7da48

UnknownText_0x7da48: ; 0x7da48
	text "TEAM ROCKET will"
	line "keep going, wait-"
	cont "ing for the return"
	cont "of GIOVANNI."

	para "We'll do whatever"
	line "it takes."
	done
; 0x7daa7

GruntM14SeenText: ; 0x7daa7
	text "You're not going"
	line "any farther!"

	para "I don't show mercy"
	line "to my enemies, not"
	cont "even brats!"
	done
; 0x7daf6

GruntM14BeatenText: ; 0x7daf6
	text "Blast it!"
	done
; 0x7db01

UnknownText_0x7db01: ; 0x7db01
	text "I lost…"

	para "Please forgive me,"
	line "GIOVANNI!"
	done
; 0x7db27

GruntM15SeenText: ; 0x7db27
	text "Hyuck-hyuck-hyuck!"
	line "I remember you!"

	para "You got me good"
	line "at our hideout!"
	done
; 0x7db6b

GruntM15BeatenText: ; 0x7db6b
	text "Hyuck-hyuck-hyuck!"
	line "So, that's how?"
	done
; 0x7db8e

UnknownText_0x7db8e: ; 0x7db8e
	text "Hyuck-hyuck-hyuck!"
	line "That was a blast!"
	cont "I'll remember you!"
	done
; 0x7dbc6

UnknownText_0x7dbc6: ; 0x7dbc6
	text "DIRECTOR: Who?"
	line "What? You came to"
	cont "rescue me?"

	para "Thank you!"

	para "The RADIO TOWER!"

	para "What's happening"
	line "there?"

	para "Taken over by TEAM"
	line "ROCKET?"

	para "Here. Take this"
	line "CARD KEY."
	done
; 0x7dc5b

UnknownText_0x7dc5b: ; 0x7dc5b
	text "DIRECTOR: Use that"
	line "to open the shut-"
	cont "ters on 3F."
	done
; 0x7dc8d

UnknownText_0x7dc8d: ; 0x7dc8d
	text "I'm begging you to"
	line "help."

	para "There's no telling"
	line "what they'll do if"

	para "they control the"
	line "transmitter."

	para "They may even be"
	line "able to control"

	para "#MON using a"
	line "special signal!"

	para "You're the only"
	line "one I can call on."

	para "Please save the"
	line "RADIO TOWER…"

	para "And all the #-"
	line "MON nationwide!"
	done
; 0x7dd84

UndergroundWarehouse_MapEventHeader: ; 0x7dd84
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $c, $2, 2, GROUP_UNDERGROUND_PATH_SWITCH_ROOM_ENTRANCES, MAP_UNDERGROUND_PATH_SWITCH_ROOM_ENTRANCES
	warp_def $c, $3, 3, GROUP_UNDERGROUND_PATH_SWITCH_ROOM_ENTRANCES, MAP_UNDERGROUND_PATH_SWITCH_ROOM_ENTRANCES
	warp_def $2, $11, 1, GROUP_GOLDENROD_DEPT_STORE_B1F, MAP_GOLDENROD_DEPT_STORE_B1F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 7
	person_event SPRITE_ROCKET, 12, 13, $7, $0, 255, 255, $2, 3, TrainerGruntM24, $06ce
	person_event SPRITE_ROCKET, 19, 12, $7, $0, 255, 255, $2, 3, TrainerGruntM14, $06ce
	person_event SPRITE_ROCKET, 7, 18, $9, $0, 255, 255, $2, 4, TrainerGruntM15, $06ce
	person_event SPRITE_GENTLEMAN, 12, 16, $3, $0, 255, 255, $0, 0, GentlemanScript_0x7d9bf, $06ce
	person_event SPRITE_POKE_BALL, 19, 22, $1, $0, 255, 255, $1, 0, ItemFragment_0x7d9e4, $0679
	person_event SPRITE_POKE_BALL, 13, 17, $1, $0, 255, 255, $1, 0, ItemFragment_0x7d9e6, $067a
	person_event SPRITE_POKE_BALL, 5, 6, $1, $0, 255, 255, $1, 0, ItemFragment_0x7d9e8, $0655
; 0x7ddf4

