TinTower1F_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x18502a, $0000
	dw UnknownScript_0x18502e, $0000

.MapCallbacks:
	db 2

	; callbacks

	dbw 2, UnknownScript_0x18502f

	dbw 1, UnknownScript_0x185084

UnknownScript_0x18502a:
	priorityjump UnknownScript_0x18508f
	end

UnknownScript_0x18502e:
	end

UnknownScript_0x18502f:
	checkevent EVENT_GOT_RAINBOW_WING
	iftrue UnknownScript_0x185047
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse UnknownScript_0x185050
	special SpecialBeastsCheck
	iffalse UnknownScript_0x185050
	clearevent EVENT_TIN_TOWER_1F_WISE_TRIO_2
	setevent EVENT_TIN_TOWER_1F_WISE_TRIO_1
UnknownScript_0x185047:
	checkevent EVENT_FOUGHT_HO_OH
	iffalse UnknownScript_0x18504f
	appear $5
UnknownScript_0x18504f:
	return

UnknownScript_0x185050:
	checkevent EVENT_FOUGHT_SUICUNE
	iftrue UnknownScript_0x185077
	appear $2
	writebyte RAIKOU
	special SpecialMonCheck
	iftrue UnknownScript_0x185065
	appear $3
	jump UnknownScript_0x185067

UnknownScript_0x185065:
	disappear $3
UnknownScript_0x185067:
	writebyte ENTEI
	special SpecialMonCheck
	iftrue UnknownScript_0x185074
	appear $4
	jump UnknownScript_0x185076

UnknownScript_0x185074:
	disappear $4
UnknownScript_0x185076:
	return

UnknownScript_0x185077:
	disappear $2
	disappear $3
	disappear $4
	clearevent EVENT_TIN_TOWER_1F_WISE_TRIO_1
	setevent EVENT_TIN_TOWER_1F_WISE_TRIO_2
	return

UnknownScript_0x185084:
	checkevent EVENT_GOT_RAINBOW_WING
	iftrue UnknownScript_0x18508e
	changeblock $a, $2, $9
UnknownScript_0x18508e:
	return

UnknownScript_0x18508f:
	applymovement $0, MovementData_0x1851cb
	pause 15
	writebyte RAIKOU
	special SpecialMonCheck
	iftrue UnknownScript_0x1850b6
	applymovement $3, MovementData_0x1851d0
	spriteface $0, LEFT
	cry RAIKOU
	pause 10
	playsound SFX_WARP_FROM
	applymovement $3, MovementData_0x1851d4
	disappear $3
	playsound SFX_EXIT_BUILDING
	waitbutton
UnknownScript_0x1850b6:
	writebyte ENTEI
	special SpecialMonCheck
	iftrue UnknownScript_0x1850d7
	applymovement $4, MovementData_0x1851da
	spriteface $0, RIGHT
	cry ENTEI
	pause 10
	playsound SFX_WARP_FROM
	applymovement $4, MovementData_0x1851de
	disappear $4
	playsound SFX_EXIT_BUILDING
	waitbutton
UnknownScript_0x1850d7:
	spriteface $0, UP
	pause 10
	applymovement $0, MovementData_0x1851e8
	applymovement $2, MovementData_0x1851e4
	cry SUICUNE
	pause 20
	loadpokedata SUICUNE, 40
	writecode VAR_BATTLETYPE, BATTLETYPE_SUICUNE
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
	spriteface $0, DOWN
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
	spriteface $0, RIGHT
	loadfont
	writetext UnknownText_0x185203
	closetext
	loadmovesprites
	applymovement $5, MovementData_0x1851f1
	playsound SFX_EXIT_BUILDING
	disappear $5
	waitbutton
	special Functionc48f
	pause 20
	playmapmusic
	end

SageScript_0x185173:
	jumptextfaceplayer UnknownText_0x185386

SageScript_0x185176:
	jumptextfaceplayer UnknownText_0x185433

SageScript_0x185179:
	jumptextfaceplayer UnknownText_0x185544

SageScript_0x18517c:
	checkevent EVENT_FOUGHT_HO_OH
	iftrue UnknownScript_0x185185
	jumptextfaceplayer UnknownText_0x1855ee

UnknownScript_0x185185:
	jumptextfaceplayer UnknownText_0x185765

SageScript_0x185188:
	faceplayer
	loadfont
	checkevent EVENT_FOUGHT_HO_OH
	iftrue UnknownScript_0x1851b6
	checkevent EVENT_GOT_RAINBOW_WING
	iftrue UnknownScript_0x1851b0
	writetext UnknownText_0x185629
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
UnknownScript_0x1851b0:
	writetext UnknownText_0x18564a
	closetext
	loadmovesprites
	end

UnknownScript_0x1851b6:
	writetext UnknownText_0x185803
	closetext
	loadmovesprites
	end

SageScript_0x1851bc:
	checkevent EVENT_FOUGHT_HO_OH
	iftrue UnknownScript_0x1851c5
	jumptextfaceplayer UnknownText_0x185654

UnknownScript_0x1851c5:
	jumptextfaceplayer UnknownText_0x1858d0

SuperNerdScript_0x1851c8:
	jumptextfaceplayer UnknownText_0x1856a3

MovementData_0x1851cb:
	slow_step_up
	slow_step_up
	slow_step_up
	slow_step_up
	step_end

MovementData_0x1851d0:
	db $39 ; movement
	fast_jump_step_down
	db $38 ; movement
	step_end

MovementData_0x1851d4:
	db $39 ; movement
	fast_jump_step_down
	fast_jump_step_right
	fast_jump_step_down
	db $38 ; movement
	step_end

MovementData_0x1851da:
	db $39 ; movement
	fast_jump_step_down
	db $38 ; movement
	step_end

MovementData_0x1851de:
	db $39 ; movement
	fast_jump_step_down
	fast_jump_step_left
	fast_jump_step_down
	db $38 ; movement
	step_end

MovementData_0x1851e4:
	db $39 ; movement
	fast_jump_step_down
	db $38 ; movement
	step_end

MovementData_0x1851e8:
	fix_facing
	big_step_down
	remove_fixed_facing
	step_end

MovementData_0x1851ec:
	step_up
	step_up
	step_up
	turn_head_left
	step_end

MovementData_0x1851f1:
	step_down
	step_down
	step_down
	step_end

MovementData_0x1851f5:
	step_up
	step_up
	step_left
	step_left
	turn_head_up
	step_end

MovementData_0x1851fb:
	step_up
	step_up
	step_end

MovementData_0x1851fe:
	step_up
	step_right
	step_right
	step_up
	step_end

UnknownText_0x185203:
	text "EUSINE: Awesome!"
	line "Too awesome, even!"

	para "I've never seen a"
	line "battle that great."

	para "That was truly"
	line "inspiring to see."

	para "SUICUNE was tough,"
	line "but you were even"

	para "more incredible,"
	line "<PLAYER>."

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

	para "Later, <PLAYER>!"
	done

UnknownText_0x185386:
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

UnknownText_0x185433:
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

UnknownText_0x185544:
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

UnknownText_0x1855ee:
	text "HO-OH appears to"
	line "have descended"

	para "upon this, the TIN"
	line "TOWER!"
	done

UnknownText_0x185629:
	text "This will protect"
	line "you. Take it."
	done

UnknownText_0x18564a:
	text "Now, go."
	done

UnknownText_0x185654:
	text "I believe you are"
	line "being tested."

	para "Free your mind"
	line "from uncertainty,"
	cont "and advance."
	done

UnknownText_0x1856a3:
	text "I knew it."

	para "I knew you'd get"
	line "to see the #MON"

	para "of rainbow colors,"
	line "<PLAYER>."

	para "It happened just"
	line "as I envisioned."

	para "My research isn't"
	line "bad, I might say."

	para "I'm going to keep"
	line "studying #MON"

	para "to become a famous"
	line "#MANIAC!"
	done

UnknownText_0x185765:
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

UnknownText_0x185803:
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

UnknownText_0x1858d0:
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

TinTower1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $f, $9, 12, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY
	warp_def $f, $a, 12, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY
	warp_def $2, $a, 2, GROUP_TIN_TOWER_2F, MAP_TIN_TOWER_2F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 10
	person_event SPRITE_SUICUNE, 13, 13, OW_DOWN | $1, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, ObjectEvent, EVENT_TIN_TOWER_1F_SUICUNE
	person_event SPRITE_RAIKOU, 13, 11, OW_DOWN | $1, $0, -1, -1, (PAL_OW_BROWN << 4) | $80, 0, ObjectEvent, EVENT_TIN_TOWER_1F_RAIKOU
	person_event SPRITE_ENTEI, 13, 16, OW_DOWN | $1, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, ObjectEvent, EVENT_TIN_TOWER_1F_ENTEI
	person_event SPRITE_SUPER_NERD, 7, 12, OW_DOWN | $3, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, SuperNerdScript_0x1851c8, EVENT_TIN_TOWER_1F_EUSINE
	person_event SPRITE_SAGE, 13, 9, OW_DOWN | $3, $0, -1, -1, $0, 0, SageScript_0x185173, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	person_event SPRITE_SAGE, 15, 15, OW_DOWN | $3, $0, -1, -1, $0, 0, SageScript_0x185176, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	person_event SPRITE_SAGE, 10, 18, OW_DOWN | $3, $0, -1, -1, $0, 0, SageScript_0x185179, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	person_event SPRITE_SAGE, 6, 8, OW_UP | $0, $10, -1, -1, $0, 0, SageScript_0x18517c, EVENT_TIN_TOWER_1F_WISE_TRIO_2
	person_event SPRITE_SAGE, 5, 13, OW_UP | $2, $0, -1, -1, $0, 0, SageScript_0x185188, EVENT_TIN_TOWER_1F_WISE_TRIO_2
	person_event SPRITE_SAGE, 6, 18, OW_UP | $1, $1, -1, -1, $0, 0, SageScript_0x1851bc, EVENT_TIN_TOWER_1F_WISE_TRIO_2
