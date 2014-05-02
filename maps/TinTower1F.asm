TinTower1F_MapScriptHeader: ; 0x18501a
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x18502a, $0000
	dw UnknownScript_0x18502e, $0000

	; callback count
	db 2

	; callbacks

	dbw 2, UnknownScript_0x18502f

	dbw 1, UnknownScript_0x185084
; 0x18502a

UnknownScript_0x18502a: ; 0x18502a
	priorityjump UnknownScript_0x18508f
	end
; 0x18502e

UnknownScript_0x18502e: ; 0x18502e
	end
; 0x18502f

UnknownScript_0x18502f: ; 0x18502f
	checkevent EVENT_GOT_RAINBOW_WING
	iftrue UnknownScript_0x185047
	checkevent $0044
	iffalse UnknownScript_0x185050
	special $0096
	iffalse UnknownScript_0x185050
	clearevent $07c5
	setevent $07b6
UnknownScript_0x185047: ; 0x185047
	checkevent EVENT_FOUGHT_HO_OH
	iffalse UnknownScript_0x18504f
	appear $5
UnknownScript_0x18504f: ; 0x18504f
	return
; 0x185050

UnknownScript_0x185050: ; 0x185050
	checkevent EVENT_FOUGHT_SUICUNE
	iftrue UnknownScript_0x185077
	appear $2
	writebyte RAIKOU
	special $0097
	iftrue UnknownScript_0x185065
	appear $3
	2jump UnknownScript_0x185067
; 0x185065

UnknownScript_0x185065: ; 0x185065
	disappear $3
UnknownScript_0x185067: ; 0x185067
	writebyte ENTEI
	special $0097
	iftrue UnknownScript_0x185074
	appear $4
	2jump UnknownScript_0x185076
; 0x185074

UnknownScript_0x185074: ; 0x185074
	disappear $4
UnknownScript_0x185076: ; 0x185076
	return
; 0x185077

UnknownScript_0x185077: ; 0x185077
	disappear $2
	disappear $3
	disappear $4
	clearevent $07b6
	setevent $07c5
	return
; 0x185084

UnknownScript_0x185084: ; 0x185084
	checkevent EVENT_GOT_RAINBOW_WING
	iftrue UnknownScript_0x18508e
	changeblock $a, $2, $9
UnknownScript_0x18508e: ; 0x18508e
	return
; 0x18508f

UnknownScript_0x18508f: ; 0x18508f
	applymovement $0, MovementData_0x1851cb
	pause 15
	writebyte RAIKOU
	special $0097
	iftrue UnknownScript_0x1850b6
	applymovement $3, MovementData_0x1851d0
	spriteface $0, $2
	cry RAIKOU
	pause 10
	playsound SFX_WARP_FROM
	applymovement $3, MovementData_0x1851d4
	disappear $3
	playsound SFX_EXIT_BUILDING
	waitbutton
UnknownScript_0x1850b6: ; 0x1850b6
	writebyte ENTEI
	special $0097
	iftrue UnknownScript_0x1850d7
	applymovement $4, MovementData_0x1851da
	spriteface $0, $3
	cry ENTEI
	pause 10
	playsound SFX_WARP_FROM
	applymovement $4, MovementData_0x1851de
	disappear $4
	playsound SFX_EXIT_BUILDING
	waitbutton
UnknownScript_0x1850d7: ; 0x1850d7
	spriteface $0, $1
	pause 10
	applymovement $0, MovementData_0x1851e8
	applymovement $2, MovementData_0x1851e4
	cry SUICUNE
	pause 20
	loadpokedata SUICUNE, 40
	writecode $3, $c
	startbattle
	reloadmapmusic
	disappear $2
	setevent EVENT_FOUGHT_SUICUNE
	setevent EVENT_SAW_SUICUNE_ON_ROUTE_42
	domaptrigger GROUP_ROUTE_42, MAP_ROUTE_42, $0
	setevent EVENT_SAW_SUICUNE_ON_ROUTE_36
	domaptrigger GROUP_ROUTE_36, MAP_ROUTE_36, $0
	setevent EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
	domaptrigger GROUP_CIANWOOD_CITY, MAP_CIANWOOD_CITY, $0
	dotrigger $1
	clearevent EVENT_SET_WHEN_FOUGHT_HO_OH
	returnafterbattle
	pause 20
	spriteface $0, $0
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	playsound SFX_ENTER_DOOR
	moveperson $5, $a, $f
	appear $5
	applymovement $5, MovementData_0x1851ec
	playsound SFX_ENTER_DOOR
	moveperson $6, $9, $f
	appear $6
	applymovement $6, MovementData_0x1851f5
	playsound SFX_ENTER_DOOR
	moveperson $7, $9, $f
	appear $7
	applymovement $7, MovementData_0x1851fb
	playsound SFX_ENTER_DOOR
	moveperson $8, $9, $f
	appear $8
	applymovement $8, MovementData_0x1851fe
	moveperson $6, $7, $d
	moveperson $7, $9, $d
	moveperson $8, $b, $d
	spriteface $0, $3
	loadfont
	2writetext UnknownText_0x185203
	closetext
	loadmovesprites
	applymovement $5, MovementData_0x1851f1
	playsound SFX_EXIT_BUILDING
	disappear $5
	waitbutton
	special $006a
	pause 20
	playmapmusic
	end
; 0x185173

SageScript_0x185173: ; 0x185173
	jumptextfaceplayer UnknownText_0x185386
; 0x185176

SageScript_0x185176: ; 0x185176
	jumptextfaceplayer UnknownText_0x185433
; 0x185179

SageScript_0x185179: ; 0x185179
	jumptextfaceplayer UnknownText_0x185544
; 0x18517c

SageScript_0x18517c: ; 0x18517c
	checkevent EVENT_FOUGHT_HO_OH
	iftrue UnknownScript_0x185185
	jumptextfaceplayer UnknownText_0x1855ee
; 0x185185

UnknownScript_0x185185: ; 0x185185
	jumptextfaceplayer UnknownText_0x185765
; 0x185188

SageScript_0x185188: ; 0x185188
	faceplayer
	loadfont
	checkevent EVENT_FOUGHT_HO_OH
	iftrue UnknownScript_0x1851b6
	checkevent EVENT_GOT_RAINBOW_WING
	iftrue UnknownScript_0x1851b0
	2writetext UnknownText_0x185629
	keeptextopen
	verbosegiveitem RAINBOW_WING, 1
	loadmovesprites
	refreshscreen $0
	earthquake 72
	waitbutton
	playsound SFX_STRENGTH
	changeblock $a, $2, $20
	reloadmappart
	setevent EVENT_GOT_RAINBOW_WING
	loadmovesprites
	loadfont
UnknownScript_0x1851b0: ; 0x1851b0
	2writetext UnknownText_0x18564a
	closetext
	loadmovesprites
	end
; 0x1851b6

UnknownScript_0x1851b6: ; 0x1851b6
	2writetext UnknownText_0x185803
	closetext
	loadmovesprites
	end
; 0x1851bc

SageScript_0x1851bc: ; 0x1851bc
	checkevent EVENT_FOUGHT_HO_OH
	iftrue UnknownScript_0x1851c5
	jumptextfaceplayer UnknownText_0x185654
; 0x1851c5

UnknownScript_0x1851c5: ; 0x1851c5
	jumptextfaceplayer UnknownText_0x1858d0
; 0x1851c8

SuperNerdScript_0x1851c8: ; 0x1851c8
	jumptextfaceplayer UnknownText_0x1856a3
; 0x1851cb

MovementData_0x1851cb: ; 0x1851cb
	slow_step_up
	slow_step_up
	slow_step_up
	slow_step_up
	step_end
; 0x1851d0

MovementData_0x1851d0: ; 0x1851d0
	db $39 ; movement
	fast_jump_step_down
	db $38 ; movement
	step_end
; 0x1851d4

MovementData_0x1851d4: ; 0x1851d4
	db $39 ; movement
	fast_jump_step_down
	fast_jump_step_right
	fast_jump_step_down
	db $38 ; movement
	step_end
; 0x1851da

MovementData_0x1851da: ; 0x1851da
	db $39 ; movement
	fast_jump_step_down
	db $38 ; movement
	step_end
; 0x1851de

MovementData_0x1851de: ; 0x1851de
	db $39 ; movement
	fast_jump_step_down
	fast_jump_step_left
	fast_jump_step_down
	db $38 ; movement
	step_end
; 0x1851e4

MovementData_0x1851e4: ; 0x1851e4
	db $39 ; movement
	fast_jump_step_down
	db $38 ; movement
	step_end
; 0x1851e8

MovementData_0x1851e8: ; 0x1851e8
	fix_facing
	big_step_down
	remove_fixed_facing
	step_end
; 0x1851ec

MovementData_0x1851ec: ; 0x1851ec
	step_up
	step_up
	step_up
	turn_head_left
	step_end
; 0x1851f1

MovementData_0x1851f1: ; 0x1851f1
	step_down
	step_down
	step_down
	step_end
; 0x1851f5

MovementData_0x1851f5: ; 0x1851f5
	step_up
	step_up
	step_left
	step_left
	turn_head_up
	step_end
; 0x1851fb

MovementData_0x1851fb: ; 0x1851fb
	step_up
	step_up
	step_end
; 0x1851fe

MovementData_0x1851fe: ; 0x1851fe
	step_up
	step_right
	step_right
	step_up
	step_end
; 0x185203

UnknownText_0x185203: ; 0x185203
	text "EUSINE: Awesome!"
	line "Too awesome, even!"

	para "I've never seen a"
	line "battle that great."

	para "That was truly"
	line "inspiring to see."

	para "SUICUNE was tough,"
	line "but you were even"

	para "more incredible,"
	line $52, "."

	para "I heard SUICUNE's"
	line "mystic power"

	para "summons a rainbow-"
	line "colored #MON."

	para "Maybe, just maybe,"
	line "what went on today"

	para "will cause that"
	line "#MON to appear."

	para "I'm going to study"
	line "the legends more."

	para "Thanks for showing"
	line "me that fantastic"
	cont "battle."

	para "Later, ", $52, "!"
	done
; 0x185386

UnknownText_0x185386: ; 0x185386
	text "According to"
	line "legend…"

	para "When the souls of"
	line "#MON and humans"

	para "commune, from the"
	line "heavens descends a"

	para "#MON of rainbow"
	line "colors…"

	para "Could it mean the"
	line "legendary #MON"

	para "are testing us"
	line "humans?"
	done
; 0x185433

UnknownText_0x185433: ; 0x185433
	text "When the BRASS"
	line "TOWER burned down,"

	para "three nameless"
	line "#MON were said"

	para "to have perished."
	line "It was tragic."

	para "However…"

	para "A rainbow-colored"
	line "#MON…"

	para "In other words…"

	para "HO-OH descended"
	line "from the sky and"

	para "gave new life to"
	line "the three #MON."

	para "They are…"

	para "SUICUNE, ENTEI and"
	line "RAIKOU."

	para "That is what they"
	line "say."
	done
; 0x185544

UnknownText_0x185544: ; 0x185544
	text "The two TOWERS are"
	line "said to have been"

	para "built to foster"
	line "friendship and"

	para "hope between #-"
	line "MON and people."

	para "That was 700 years"
	line "ago, but the ideal"

	para "still remains"
	line "important today."
	done
; 0x1855ee

UnknownText_0x1855ee: ; 0x1855ee
	text "HO-OH appears to"
	line "have descended"

	para "upon this, the TIN"
	line "TOWER!"
	done
; 0x185629

UnknownText_0x185629: ; 0x185629
	text "This will protect"
	line "you. Take it."
	done
; 0x18564a

UnknownText_0x18564a: ; 0x18564a
	text "Now, go."
	done
; 0x185654

UnknownText_0x185654: ; 0x185654
	text "I believe you are"
	line "being tested."

	para "Free your mind"
	line "from uncertainty,"
	cont "and advance."
	done
; 0x1856a3

UnknownText_0x1856a3: ; 0x1856a3
	text "I knew it."

	para "I knew you'd get"
	line "to see the #MON"

	para "of rainbow colors,"
	line $52, "."

	para "It happened just"
	line "as I envisioned."

	para "My research isn't"
	line "bad, I might say."

	para "I'm going to keep"
	line "studying #MON"

	para "to become a famous"
	line "#MANIAC!"
	done
; 0x185765

UnknownText_0x185765: ; 0x185765
	text "The legendary"
	line "#MON are said"

	para "to embody three"
	line "powers…"

	para "The lightning that"
	line "struck the TOWER."

	para "The fire that"
	line "burned the TOWER."

	para "And the rain that"
	line "put out the fire…"
	done
; 0x185803

UnknownText_0x185803: ; 0x185803
	text "When the legendary"
	line "#MON appeared…"

	para "They struck terror"
	line "in those who saw"
	cont "their rise."

	para "And…"

	para "Some even took to"
	line "futile attacks."

	para "The legendary"
	line "#MON, knowing"

	para "their own power,"
	line "fled, ignoring the"
	cont "frightened people."
	done
; 0x1858d0

UnknownText_0x1858d0: ; 0x1858d0
	text "Of the legendary"
	line "#MON, SUICUNE"

	para "is said to be the"
	line "closest to HO-OH."

	para "I hear there may"
	line "also be a link to"

	para "#MON known as"
	line "UNOWN."

	para "The #MON UNOWN"
	line "must be sharing a"

	para "cooperative bond"
	line "with SUICUNE."
	done
; 0x18598c

TinTower1F_MapEventHeader: ; 0x18598c
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $f, $9, 12, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY
	warp_def $f, $a, 12, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY
	warp_def $2, $a, 2, GROUP_TIN_TOWER_2F, MAP_TIN_TOWER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 10
	person_event SPRITE_SUICUNE, 13, 13, $1, $0, 255, 255, $90, 0, ObjectEvent, $07b2
	person_event SPRITE_RAIKOU, 13, 11, $1, $0, 255, 255, $b0, 0, ObjectEvent, $07b4
	person_event SPRITE_ENTEI, 13, 16, $1, $0, 255, 255, $80, 0, ObjectEvent, $07b3
	person_event SPRITE_SUPER_NERD, 7, 12, $3, $0, 255, 255, $90, 0, SuperNerdScript_0x1851c8, $07b5
	person_event SPRITE_SAGE, 13, 9, $3, $0, 255, 255, $0, 0, SageScript_0x185173, $07b6
	person_event SPRITE_SAGE, 15, 15, $3, $0, 255, 255, $0, 0, SageScript_0x185176, $07b6
	person_event SPRITE_SAGE, 10, 18, $3, $0, 255, 255, $0, 0, SageScript_0x185179, $07b6
	person_event SPRITE_SAGE, 6, 8, $4, $10, 255, 255, $0, 0, SageScript_0x18517c, $07c5
	person_event SPRITE_SAGE, 5, 13, $6, $0, 255, 255, $0, 0, SageScript_0x185188, $07c5
	person_event SPRITE_SAGE, 6, 18, $5, $1, 255, 255, $0, 0, SageScript_0x1851bc, $07c5
; 0x185a23

