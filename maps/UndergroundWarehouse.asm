UndergroundWarehouse_MapScriptHeader: ; 0x7d94b
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 5, UnknownScript_0x7d950
; 0x7d950

UnknownScript_0x7d950: ; 0x7d950
	clearbit1 $02d3
	clearbit1 $02d4
	clearbit1 $02d5
	clearbit1 $02d6
	clearbit1 $02d7
	clearbit1 $02d8
	clearbit1 $02d9
	clearbit1 $02da
	clearbit1 $02db
	clearbit1 $02dc
	clearbit1 $02dd
	clearbit1 $02de
	clearbit1 $02df
	clearbit1 $02e0
	clearbit1 $02e1
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
	checkbit1 $004a
	iftrue UnknownScript_0x7d9de
	2writetext UnknownText_0x7dbc6
	keeptextopen
	verbosegiveitem CARD_KEY, 1
	setbit1 $004a
	setbit1 $0304
	clearbit1 $0305
	clearbit1 $0306
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
	db $0, "How did you get", $4f
	db "this far?", $51
	db "I guess it can't", $4f
	db "be helped. I'll", $55
	db "dispose of you.", $57
; 0x7da34

GruntM24BeatenText: ; 0x7da34
	db $0, "I got disposed of…", $57
; 0x7da48

UnknownText_0x7da48: ; 0x7da48
	db $0, "TEAM ROCKET will", $4f
	db "keep going, wait-", $55
	db "ing for the return", $55
	db "of GIOVANNI.", $51
	db "We'll do whatever", $4f
	db "it takes.", $57
; 0x7daa7

GruntM14SeenText: ; 0x7daa7
	db $0, "You're not going", $4f
	db "any farther!", $51
	db "I don't show mercy", $4f
	db "to my enemies, not", $55
	db "even brats!", $57
; 0x7daf6

GruntM14BeatenText: ; 0x7daf6
	db $0, "Blast it!", $57
; 0x7db01

UnknownText_0x7db01: ; 0x7db01
	db $0, "I lost…", $51
	db "Please forgive me,", $4f
	db "GIOVANNI!", $57
; 0x7db27

GruntM15SeenText: ; 0x7db27
	db $0, "Hyuck-hyuck-hyuck!", $4f
	db "I remember you!", $51
	db "You got me good", $4f
	db "at our hideout!", $57
; 0x7db6b

GruntM15BeatenText: ; 0x7db6b
	db $0, "Hyuck-hyuck-hyuck!", $4f
	db "So, that's how?", $57
; 0x7db8e

UnknownText_0x7db8e: ; 0x7db8e
	db $0, "Hyuck-hyuck-hyuck!", $4f
	db "That was a blast!", $55
	db "I'll remember you!", $57
; 0x7dbc6

UnknownText_0x7dbc6: ; 0x7dbc6
	db $0, "DIRECTOR: Who?", $4f
	db "What? You came to", $55
	db "rescue me?", $51
	db "Thank you!", $51
	db "The RADIO TOWER!", $51
	db "What's happening", $4f
	db "there?", $51
	db "Taken over by TEAM", $4f
	db "ROCKET?", $51
	db "Here. Take this", $4f
	db "CARD KEY.", $57
; 0x7dc5b

UnknownText_0x7dc5b: ; 0x7dc5b
	db $0, "DIRECTOR: Use that", $4f
	db "to open the shut-", $55
	db "ters on 3F.", $57
; 0x7dc8d

UnknownText_0x7dc8d: ; 0x7dc8d
	db $0, "I'm begging you to", $4f
	db "help.", $51
	db "There's no telling", $4f
	db "what they'll do if", $51
	db "they control the", $4f
	db "transmitter.", $51
	db "They may even be", $4f
	db "able to control", $51
	db "#MON using a", $4f
	db "special signal!", $51
	db "You're the only", $4f
	db "one I can call on.", $51
	db "Please save the", $4f
	db "RADIO TOWER…", $51
	db "And all the #-", $4f
	db "MON nationwide!", $57
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

