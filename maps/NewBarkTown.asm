NewBarkTown_MapScriptHeader: ; 0x1a8000
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x1a800d, $0000
	dw UnknownScript_0x1a800e, $0000

	; callback count
	db 1

	; callbacks

	dbw 5, UnknownScript_0x1a800f
; 0x1a800d

UnknownScript_0x1a800d: ; 0x1a800d
	end
; 0x1a800e

UnknownScript_0x1a800e: ; 0x1a800e
	end
; 0x1a800f

UnknownScript_0x1a800f: ; 0x1a800f
	setbit2 $0041
	clearbit1 $0076
	return
; 0x1a8016

UnknownScript_0x1a8016: ; 0x1a8016
	playmusic $004e
	spriteface $2, $2
	loadfont
	2writetext UnknownText_0x1a8134
	closetext
	loadmovesprites
	spriteface $0, $3
	applymovement $2, MovementData_0x1a80d4
	loadfont
	2writetext UnknownText_0x1a813e
	closetext
	loadmovesprites
	follow $2, $0
	applymovement $2, MovementData_0x1a80e0
	stopfollow
	loadfont
	2writetext UnknownText_0x1a815e
	closetext
	loadmovesprites
	special $003d
	end
; 0x1a8041

UnknownScript_0x1a8041: ; 0x1a8041
	playmusic $004e
	spriteface $2, $2
	loadfont
	2writetext UnknownText_0x1a8134
	closetext
	loadmovesprites
	spriteface $0, $3
	applymovement $2, MovementData_0x1a80d9
	spriteface $0, $1
	loadfont
	2writetext UnknownText_0x1a813e
	closetext
	loadmovesprites
	follow $2, $0
	applymovement $2, MovementData_0x1a80e6
	stopfollow
	loadfont
	2writetext UnknownText_0x1a815e
	closetext
	loadmovesprites
	special $003d
	end
; 0x1a806f

TeacherScript_0x1a806f: ; 0x1a806f
	faceplayer
	loadfont
	checkbit1 $0040
	iftrue UnknownScript_0x1a8095
	checkbit1 $001f
	iftrue UnknownScript_0x1a808f
	checkbit1 $001a
	iftrue UnknownScript_0x1a8089
	2writetext UnknownText_0x1a80f7
	closetext
	loadmovesprites
	end
; 0x1a8089

UnknownScript_0x1a8089: ; 0x1a8089
	2writetext UnknownText_0x1a81c4
	closetext
	loadmovesprites
	end
; 0x1a808f

UnknownScript_0x1a808f: ; 0x1a808f
	2writetext UnknownText_0x1a81f2
	closetext
	loadmovesprites
	end
; 0x1a8095

UnknownScript_0x1a8095: ; 0x1a8095
	2writetext UnknownText_0x1a8236
	closetext
	loadmovesprites
	end
; 0x1a809b

FisherScript_0x1a809b: ; 0x1a809b
	jumptextfaceplayer UnknownText_0x1a8274
; 0x1a809e

SilverScript_0x1a809e: ; 0x1a809e
	loadfont
	2writetext UnknownText_0x1a82a6
	closetext
	loadmovesprites
	spriteface $4, $2
	loadfont
	2writetext UnknownText_0x1a82cd
	closetext
	loadmovesprites
	follow $0, $4
	applymovement $0, MovementData_0x1a80ed
	stopfollow
	pause 5
	spriteface $4, $0
	pause 5
	playsound $0041
	applymovement $0, MovementData_0x1a80f0
	applymovement $4, MovementData_0x1a80f5
	end
; 0x1a80c8

MapNewBarkTownSignpost0Script: ; 0x1a80c8
	jumptext UnknownText_0x1a82e8
; 0x1a80cb

MapNewBarkTownSignpost1Script: ; 0x1a80cb
	jumptext UnknownText_0x1a8328
; 0x1a80ce

MapNewBarkTownSignpost2Script: ; 0x1a80ce
	jumptext UnknownText_0x1a8332
; 0x1a80d1

MapNewBarkTownSignpost3Script: ; 0x1a80d1
	jumptext UnknownText_0x1a8340
; 0x1a80d4

MovementData_0x1a80d4: ; 0x1a80d4
	step_left
	step_left
	step_left
	step_left
	step_end
; 0x1a80d9

MovementData_0x1a80d9: ; 0x1a80d9
	step_left
	step_left
	step_left
	step_left
	step_left
	turn_head_down
	step_end
; 0x1a80e0

MovementData_0x1a80e0: ; 0x1a80e0
	step_right
	step_right
	step_right
	step_right
	turn_head_left
	step_end
; 0x1a80e6

MovementData_0x1a80e6: ; 0x1a80e6
	step_right
	step_right
	step_right
	step_right
	step_right
	turn_head_left
	step_end
; 0x1a80ed

MovementData_0x1a80ed: ; 0x1a80ed
	turn_head_up
	step_down
	step_end
; 0x1a80f0

MovementData_0x1a80f0: ; 0x1a80f0
	turn_head_up
	fix_facing
	jump_step_down
	remove_fixed_facing
	step_end
; 0x1a80f5

MovementData_0x1a80f5: ; 0x1a80f5
	step_right
	step_end
; 0x1a80f7

UnknownText_0x1a80f7: ; 0x1a80f7
	db $0, "Wow, your #GEAR", $4f
	db "is impressive!", $51
	db "Did your mom get", $4f
	db "it for you?", $57
; 0x1a8134

UnknownText_0x1a8134: ; 0x1a8134
	db $0, "Wait, ", $14, "!", $57
; 0x1a813e

UnknownText_0x1a813e: ; 0x1a813e
	db $0, "What do you think", $4f
	db "you're doing?", $57
; 0x1a815e

UnknownText_0x1a815e: ; 0x1a815e
	db $0, "It's dangerous to", $4f
	db "go out without a", $55
	db "#MON!", $51
	db "Wild #MON", $4f
	db "jump out of the", $51
	db "grass on the way", $4f
	db "to the next town.", $57
; 0x1a81c4

UnknownText_0x1a81c4: ; 0x1a81c4
	db $0, "Oh! Your #MON", $4f
	db "is adorable!", $55
	db "I wish I had one!", $57
; 0x1a81f2

UnknownText_0x1a81f2: ; 0x1a81f2
	db $0, "Hi, ", $14, "!", $4f
	db "Leaving again?", $51
	db "You should tell", $4f
	db "your mom if you", $55
	db "are leaving.", $57
; 0x1a8236

UnknownText_0x1a8236: ; 0x1a8236
	db $0, "Call your mom on", $4f
	db "your #GEAR to", $51
	db "let her know how", $4f
	db "you're doing.", $57
; 0x1a8274

UnknownText_0x1a8274: ; 0x1a8274
	db $0, "Yo, ", $52, "!", $51
	db "I hear PROF.ELM", $4f
	db "discovered some", $55
	db "new #MON.", $57
; 0x1a82a6

UnknownText_0x1a82a6: ; 0x1a82a6
	db $0, $56, $51
	db "So this is the", $4f
	db "famous ELM #MON", $55
	db "LAB…", $57
; 0x1a82cd

UnknownText_0x1a82cd: ; 0x1a82cd
	db $0, "…What are you", $4f
	db "staring at?", $57
; 0x1a82e8

UnknownText_0x1a82e8: ; 0x1a82e8
	db $0, "NEW BARK TOWN", $51
	db "The Town Where the", $4f
	db "Winds of a New", $55
	db "Beginning Blow", $57
; 0x1a8328

UnknownText_0x1a8328: ; 0x1a8328
	db $0, $52, "'s House", $57
; 0x1a8332

UnknownText_0x1a8332: ; 0x1a8332
	db $0, "ELM #MON LAB", $57
; 0x1a8340

UnknownText_0x1a8340: ; 0x1a8340
	db $0, "ELM'S HOUSE", $57
; 0x1a834d

NewBarkTown_MapEventHeader: ; 0x1a834d
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $3, $6, 1, GROUP_ELMS_LAB, MAP_ELMS_LAB
	warp_def $5, $d, 1, GROUP_KRISS_HOUSE_1F, MAP_KRISS_HOUSE_1F
	warp_def $b, $3, 1, GROUP_KRISS_NEIGHBORS_HOUSE, MAP_KRISS_NEIGHBORS_HOUSE
	warp_def $d, $b, 1, GROUP_ELMS_HOUSE, MAP_ELMS_HOUSE

	; xy triggers
	db 2
	xy_trigger 0, $8, $1, $0, UnknownScript_0x1a8016, $0, $0
	xy_trigger 0, $9, $1, $0, UnknownScript_0x1a8041, $0, $0

	; signposts
	db 4
	signpost 8, 8, $0, MapNewBarkTownSignpost0Script
	signpost 5, 11, $0, MapNewBarkTownSignpost1Script
	signpost 3, 3, $0, MapNewBarkTownSignpost2Script
	signpost 13, 9, $0, MapNewBarkTownSignpost3Script

	; people-events
	db 3
	person_event SPRITE_TEACHER, 12, 10, $3, $1, 255, 255, $0, 0, TeacherScript_0x1a806f, $ffff
	person_event SPRITE_FISHER, 13, 16, $4, $10, 255, 255, $a0, 0, FisherScript_0x1a809b, $ffff
	person_event SPRITE_SILVER, 6, 7, $9, $0, 255, 255, $0, 0, SilverScript_0x1a809e, $06bd
; 0x1a83b2

