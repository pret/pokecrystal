const_value set 2
	const TINTOWER1F_SUICUNE
	const TINTOWER1F_RAIKOU
	const TINTOWER1F_ENTEI
	const TINTOWER1F_EUSINE
	const TINTOWER1F_SAGE1
	const TINTOWER1F_SAGE2
	const TINTOWER1F_SAGE3
	const TINTOWER1F_SAGE4
	const TINTOWER1F_SAGE5
	const TINTOWER1F_SAGE6

TinTower1F_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x18502a, 0
	dw UnknownScript_0x18502e, 0

.MapCallbacks:
	db 2

	; callbacks

	dbw MAPCALLBACK_OBJECTS, UnknownScript_0x18502f

	dbw MAPCALLBACK_TILES, TinTowerStairsCallback

UnknownScript_0x18502a:
	priorityjump SuicuneBattle
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
	iffalse .Done
	appear TINTOWER1F_EUSINE
.Done:
	return

UnknownScript_0x185050:
	checkevent EVENT_FOUGHT_SUICUNE
	iftrue UnknownScript_0x185077
	appear TINTOWER1F_SUICUNE
	writebyte RAIKOU
	special SpecialMonCheck
	iftrue UnknownScript_0x185065
	appear TINTOWER1F_RAIKOU
	jump UnknownScript_0x185067

UnknownScript_0x185065:
	disappear TINTOWER1F_RAIKOU
UnknownScript_0x185067:
	writebyte ENTEI
	special SpecialMonCheck
	iftrue UnknownScript_0x185074
	appear TINTOWER1F_ENTEI
	jump UnknownScript_0x185076

UnknownScript_0x185074:
	disappear TINTOWER1F_ENTEI
UnknownScript_0x185076:
	return

UnknownScript_0x185077:
	disappear TINTOWER1F_SUICUNE
	disappear TINTOWER1F_RAIKOU
	disappear TINTOWER1F_ENTEI
	clearevent EVENT_TIN_TOWER_1F_WISE_TRIO_1
	setevent EVENT_TIN_TOWER_1F_WISE_TRIO_2
	return

TinTowerStairsCallback:
	checkevent EVENT_GOT_RAINBOW_WING
	iftrue .NoChange
	changeblock $a, $2, $9
.NoChange:
	return

SuicuneBattle:
	applymovement PLAYER, TinTowerPlayerMovement1
	pause 15
	writebyte RAIKOU
	special SpecialMonCheck
	iftrue .Next1 ; if player caught Raikou, he doesn't appear in Tin Tower
	applymovement TINTOWER1F_RAIKOU, TinTowerRaikouMovement1
	spriteface PLAYER, LEFT
	cry RAIKOU
	pause 10
	playsound SFX_WARP_FROM
	applymovement TINTOWER1F_RAIKOU, TinTowerRaikouMovement2
	disappear TINTOWER1F_RAIKOU
	playsound SFX_EXIT_BUILDING
	waitsfx
.Next1:
	writebyte ENTEI
	special SpecialMonCheck
	iftrue .Next2 ; if player caught Entei, he doesn't appear in Tin Tower
	applymovement TINTOWER1F_ENTEI, TinTowerEnteiMovement1
	spriteface PLAYER, RIGHT
	cry ENTEI
	pause 10
	playsound SFX_WARP_FROM
	applymovement TINTOWER1F_ENTEI, TinTowerEnteiMovement2
	disappear TINTOWER1F_ENTEI
	playsound SFX_EXIT_BUILDING
	waitsfx
.Next2:
	spriteface PLAYER, UP
	pause 10
	applymovement PLAYER, TinTowerPlayerMovement2
	applymovement TINTOWER1F_SUICUNE, TinTowerSuicuneMovement
	cry SUICUNE
	pause 20
	loadwildmon SUICUNE, 40
	writecode VAR_BATTLETYPE, BATTLETYPE_SUICUNE
	startbattle
	dontrestartmapmusic
	disappear TINTOWER1F_SUICUNE
	setevent EVENT_FOUGHT_SUICUNE
	setevent EVENT_SAW_SUICUNE_ON_ROUTE_42
	domaptrigger ROUTE_42, $0
	setevent EVENT_SAW_SUICUNE_ON_ROUTE_36
	domaptrigger ROUTE_36, $0
	setevent EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
	domaptrigger CIANWOOD_CITY, $0
	dotrigger $1
	clearevent EVENT_SET_WHEN_FOUGHT_HO_OH
	reloadmapafterbattle
	pause 20
	spriteface PLAYER, DOWN
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	playsound SFX_ENTER_DOOR
	moveperson TINTOWER1F_EUSINE, $a, $f
	appear TINTOWER1F_EUSINE
	applymovement TINTOWER1F_EUSINE, MovementData_0x1851ec
	playsound SFX_ENTER_DOOR
	moveperson TINTOWER1F_SAGE1, $9, $f
	appear TINTOWER1F_SAGE1
	applymovement TINTOWER1F_SAGE1, MovementData_0x1851f5
	playsound SFX_ENTER_DOOR
	moveperson TINTOWER1F_SAGE2, $9, $f
	appear TINTOWER1F_SAGE2
	applymovement TINTOWER1F_SAGE2, MovementData_0x1851fb
	playsound SFX_ENTER_DOOR
	moveperson TINTOWER1F_SAGE3, $9, $f
	appear TINTOWER1F_SAGE3
	applymovement TINTOWER1F_SAGE3, MovementData_0x1851fe
	moveperson TINTOWER1F_SAGE1, $7, $d
	moveperson TINTOWER1F_SAGE2, $9, $d
	moveperson TINTOWER1F_SAGE3, $b, $d
	spriteface PLAYER, RIGHT
	opentext
	writetext TinTowerEusineSuicuneText
	waitbutton
	closetext
	applymovement TINTOWER1F_EUSINE, MovementData_0x1851f1
	playsound SFX_EXIT_BUILDING
	disappear TINTOWER1F_EUSINE
	waitsfx
	special Special_FadeOutMusic
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
	opentext
	checkevent EVENT_FOUGHT_HO_OH
	iftrue UnknownScript_0x1851b6
	checkevent EVENT_GOT_RAINBOW_WING
	iftrue UnknownScript_0x1851b0
	writetext UnknownText_0x185629
	buttonsound
	verbosegiveitem RAINBOW_WING
	closetext
	refreshscreen $0
	earthquake 72
	waitsfx
	playsound SFX_STRENGTH
	changeblock $a, $2, $20
	reloadmappart
	setevent EVENT_GOT_RAINBOW_WING
	closetext
	opentext
UnknownScript_0x1851b0:
	writetext UnknownText_0x18564a
	waitbutton
	closetext
	end

UnknownScript_0x1851b6:
	writetext UnknownText_0x185803
	waitbutton
	closetext
	end

SageScript_0x1851bc:
	checkevent EVENT_FOUGHT_HO_OH
	iftrue UnknownScript_0x1851c5
	jumptextfaceplayer UnknownText_0x185654

UnknownScript_0x1851c5:
	jumptextfaceplayer UnknownText_0x1858d0

TinTowerEusine:
	jumptextfaceplayer TinTowerEusineHoOhText

TinTowerPlayerMovement1:
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

TinTowerRaikouMovement1:
	set_sliding
	fast_jump_step DOWN
	remove_sliding
	step_end

TinTowerRaikouMovement2:
	set_sliding
	fast_jump_step DOWN
	fast_jump_step RIGHT
	fast_jump_step DOWN
	remove_sliding
	step_end

TinTowerEnteiMovement1:
	set_sliding
	fast_jump_step DOWN
	remove_sliding
	step_end

TinTowerEnteiMovement2:
	set_sliding
	fast_jump_step DOWN
	fast_jump_step LEFT
	fast_jump_step DOWN
	remove_sliding
	step_end

TinTowerSuicuneMovement:
	set_sliding
	fast_jump_step DOWN
	remove_sliding
	step_end

TinTowerPlayerMovement2:
	fix_facing
	big_step DOWN
	remove_fixed_facing
	step_end

MovementData_0x1851ec:
	step UP
	step UP
	step UP
	turn_head LEFT
	step_end

MovementData_0x1851f1:
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_0x1851f5:
	step UP
	step UP
	step LEFT
	step LEFT
	turn_head UP
	step_end

MovementData_0x1851fb:
	step UP
	step UP
	step_end

MovementData_0x1851fe:
	step UP
	step RIGHT
	step RIGHT
	step UP
	step_end

TinTowerEusineSuicuneText:
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

TinTowerEusineHoOhText:
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
	warp_def $f, $9, 12, ECRUTEAK_CITY
	warp_def $f, $a, 12, ECRUTEAK_CITY
	warp_def $2, $a, 2, TIN_TOWER_2F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 10
	person_event SPRITE_SUICUNE, 9, 9, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TIN_TOWER_1F_SUICUNE
	person_event SPRITE_RAIKOU, 9, 7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TIN_TOWER_1F_RAIKOU
	person_event SPRITE_ENTEI, 9, 12, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TIN_TOWER_1F_ENTEI
	person_event SPRITE_SUPER_NERD, 3, 8, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TinTowerEusine, EVENT_TIN_TOWER_1F_EUSINE
	person_event SPRITE_SAGE, 9, 5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SageScript_0x185173, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	person_event SPRITE_SAGE, 11, 11, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SageScript_0x185176, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	person_event SPRITE_SAGE, 6, 14, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SageScript_0x185179, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	person_event SPRITE_SAGE, 2, 4, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SageScript_0x18517c, EVENT_TIN_TOWER_1F_WISE_TRIO_2
	person_event SPRITE_SAGE, 1, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SageScript_0x185188, EVENT_TIN_TOWER_1F_WISE_TRIO_2
	person_event SPRITE_SAGE, 2, 14, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SageScript_0x1851bc, EVENT_TIN_TOWER_1F_WISE_TRIO_2
