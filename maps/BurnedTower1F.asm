BurnedTower1F_MapScriptHeader:
.MapTriggers:
	db 3

	; triggers
	dw UnknownScript_0x185bf2, $0000
	dw UnknownScript_0x185bf6, $0000
	dw UnknownScript_0x185bf7, $0000

.MapCallbacks:
	db 1

	; callbacks

	dbw 1, UnknownScript_0x185bf8

UnknownScript_0x185bf2:
	priorityjump UnknownScript_0x185c0d
	end

UnknownScript_0x185bf6:
	end

UnknownScript_0x185bf7:
	end

UnknownScript_0x185bf8:
	checkevent EVENT_HOLE_IN_BURNED_TOWER
	iftrue .Next
	changeblock $a, $8, $32 ; hole
.Next
	checkevent EVENT_RELEASED_THE_BEASTS
	iftrue .Done
	changeblock $6, $e, $9 ; ladder
.Done
	return

UnknownScript_0x185c0d:
	spriteface $3, DOWN
	showemote EMOTE_SHOCK, $3, 15
	applymovement $3, MovementData_0x185cd3
	loadfont
	writetext UnknownText_0x185ecc
	closetext
	loadmovesprites
	moveperson $3, $9, $e
	dotrigger $1
	end

UnknownScript_0x185c25:
	showemote EMOTE_SHOCK, $4, 15
	special Functionc48f
	pause 15
	spriteface $4, RIGHT
	pause 15
	applymovement $0, MovementData_0x185ccd
	applymovement $4, MovementData_0x185ccf
	playmusic MUSIC_RIVAL_ENCOUNTER
	loadfont
	writetext UnknownText_0x185cd9
	closetext
	loadmovesprites
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue UnknownScript_0x185c60
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue UnknownScript_0x185c70
	winlosstext UnknownText_0x185d9b, UnknownText_0x185e2c
	setlasttalked $4
	loadtrainer RIVAL1, RIVAL1_9
	startbattle
	reloadmapmusic
	returnafterbattle
	jump UnknownScript_0x185c80

UnknownScript_0x185c60:
	winlosstext UnknownText_0x185d9b, UnknownText_0x185e2c
	setlasttalked $4
	loadtrainer RIVAL1, RIVAL1_7
	startbattle
	reloadmapmusic
	returnafterbattle
	jump UnknownScript_0x185c80

UnknownScript_0x185c70:
	winlosstext UnknownText_0x185d9b, UnknownText_0x185e2c
	setlasttalked $4
	loadtrainer RIVAL1, RIVAL1_8
	startbattle
	reloadmapmusic
	returnafterbattle
	jump UnknownScript_0x185c80

UnknownScript_0x185c80:
	playmusic MUSIC_RIVAL_AFTER
	loadfont
	writetext UnknownText_0x185de2
	closetext
	loadmovesprites
	dotrigger $2
	setevent EVENT_RIVAL_BURNED_TOWER
	special Functionc48f
	pause 15
	earthquake 50
	showemote EMOTE_SHOCK, $0, 15
	playsound SFX_ENTER_DOOR
	waitbutton
	changeblock $a, $8, $25
	reloadmappart
	pause 15
	applymovement $0, MovementData_0x185cd1
	playsound SFX_KINESIS
	showemote EMOTE_SHOCK, $4, 20
	loadfont
	writetext UnknownText_0x185e75
	closetext
	loadmovesprites
	setevent EVENT_HOLE_IN_BURNED_TOWER
	pause 15
	warpcheck
	end

SuperNerdScript_0x185cbc:
	jumptextfaceplayer UnknownText_0x185f99

MortyScript_0x185cbf:
	jumptextfaceplayer UnknownText_0x186002

BurnedTower1FRock:
	jumpstd smashrock

MapBurnedTower1FSignpostItem0:
	dwb EVENT_BURNED_TOWER_1F_HIDDEN_ETHER, ETHER
	

MapBurnedTower1FSignpostItem1:
	dwb EVENT_BURNED_TOWER_1F_HIDDEN_ULTRA_BALL, ULTRA_BALL
	

ItemFragment_0x185ccb:
	db HP_UP, 1

MovementData_0x185ccd:
	step_left
	step_end

MovementData_0x185ccf:
	step_right
	step_end

MovementData_0x185cd1:
	db $59 ; movement
	step_end

MovementData_0x185cd3:
	step_down
	step_left
	step_left
	step_left
	step_down
	step_end

UnknownText_0x185cd9:
	text $56, " ", $56, " ", $56

	para "…Oh, it's you."

	para "I came looking for"
	line "some legendary"

	para "#MON that they"
	line "say roosts here."

	para "But there's"
	line "nothing here!"

	para "Nothing after all"
	line "the trouble of"

	para "coming to this"
	line "dump? No way!"

	para "It's all your"
	line "fault!"
	done

UnknownText_0x185d9b:
	text "…Humph!"

	para "This is why I hate"
	line "battling wimps."

	para "There's no"
	line "challenge in it."
	done

UnknownText_0x185de2:
	text "…Aw, whatever."

	para "You would never be"
	line "able to catch a"

	para "legendary #MON"
	line "anyway."
	done

UnknownText_0x185e2c:
	text "…Humph!"

	para "This is why I hate"
	line "battling wimps."

	para "It's just a waste"
	line "of my time."
	done

UnknownText_0x185e75:
	text "Humph!"

	para "What are you doing"
	line "falling into a"

	para "hole? Some genius"
	line "you are!"

	para "Serves you right!"
	done

UnknownText_0x185ecc:
	text "EUSINE: My name's"
	line "EUSINE."

	para "I'm on the trail"
	line "of a #MON named"
	cont "SUICUNE."

	para "And you are…?"

	para "<PLAYER>? Glad to"
	line "meet you!"

	para "I heard rumors"
	line "that SUICUNE is in"

	para "this BURNED TOWER,"
	line "so I came to look."

	para "But where exactly"
	line "could it be?"
	done

UnknownText_0x185f99:
	text "EUSINE: I heard"
	line "that SUICUNE is in"

	para "this BURNED TOWER,"
	line "so I came to look."

	para "But where exactly"
	line "could it be?"
	done

UnknownText_0x186002:
	text "MORTY: ECRUTEAK's"
	line "GYM LEADER has to"

	para "study what are"
	line "said to be the"

	para "legendary #MON"
	line "--SUICUNE, ENTEI"
	cont "and RAIKOU."

	para "EUSINE is here, so"
	line "I've decided to"

	para "investigate the"
	line "TOWER with him."
	done

BurnedTower1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 14
	warp_def $f, $9, 13, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY
	warp_def $f, $a, 13, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY
	warp_def $9, $a, 1, GROUP_BURNED_TOWER_B1F, MAP_BURNED_TOWER_B1F
	warp_def $5, $5, 1, GROUP_BURNED_TOWER_B1F, MAP_BURNED_TOWER_B1F
	warp_def $6, $5, 1, GROUP_BURNED_TOWER_B1F, MAP_BURNED_TOWER_B1F
	warp_def $6, $4, 1, GROUP_BURNED_TOWER_B1F, MAP_BURNED_TOWER_B1F
	warp_def $4, $f, 2, GROUP_BURNED_TOWER_B1F, MAP_BURNED_TOWER_B1F
	warp_def $5, $f, 2, GROUP_BURNED_TOWER_B1F, MAP_BURNED_TOWER_B1F
	warp_def $7, $a, 3, GROUP_BURNED_TOWER_B1F, MAP_BURNED_TOWER_B1F
	warp_def $e, $5, 4, GROUP_BURNED_TOWER_B1F, MAP_BURNED_TOWER_B1F
	warp_def $e, $4, 4, GROUP_BURNED_TOWER_B1F, MAP_BURNED_TOWER_B1F
	warp_def $e, $e, 5, GROUP_BURNED_TOWER_B1F, MAP_BURNED_TOWER_B1F
	warp_def $e, $f, 5, GROUP_BURNED_TOWER_B1F, MAP_BURNED_TOWER_B1F
	warp_def $f, $7, 6, GROUP_BURNED_TOWER_B1F, MAP_BURNED_TOWER_B1F

.XYTriggers:
	db 1
	xy_trigger 1, $9, $b, $0, UnknownScript_0x185c25, $0, $0

.Signposts:
	db 2
	signpost 7, 8, SIGNPOST_ITEM, MapBurnedTower1FSignpostItem0
	signpost 11, 13, SIGNPOST_ITEM, MapBurnedTower1FSignpostItem1

.PersonEvents:
	db 5
	person_event SPRITE_ROCK, 8, 19, OW_LEFT | $10, $0, -1, -1, $0, 0, BurnedTower1FRock, -1
	person_event SPRITE_SUPER_NERD, 16, 16, OW_DOWN | $3, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, SuperNerdScript_0x185cbc, EVENT_BURNED_TOWER_1F_EUSINE
	person_event SPRITE_SILVER, 13, 12, OW_LEFT | $0, $0, -1, -1, $2, 3, ObjectEvent, EVENT_RIVAL_BURNED_TOWER
	person_event SPRITE_MORTY, 18, 18, OW_DOWN | $2, $11, -1, -1, (PAL_OW_BROWN << 4) | $80, 0, MortyScript_0x185cbf, EVENT_BURNED_TOWER_MORTY
	person_event SPRITE_POKE_BALL, 6, 18, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x185ccb, EVENT_BURNED_TOWER_1F_HP_UP
