BurnedTower1F_MapScriptHeader: ; 0x185be1
	; trigger count
	db 3

	; triggers
	dw UnknownScript_0x185bf2, $0000
	dw UnknownScript_0x185bf6, $0000
	dw UnknownScript_0x185bf7, $0000

	; callback count
	db 1

	; callbacks

	dbw 1, UnknownScript_0x185bf8
; 0x185bf2

UnknownScript_0x185bf2: ; 0x185bf2
	priorityjump UnknownScript_0x185c0d
	end
; 0x185bf6

UnknownScript_0x185bf6: ; 0x185bf6
	end
; 0x185bf7

UnknownScript_0x185bf7: ; 0x185bf7
	end
; 0x185bf8

UnknownScript_0x185bf8: ; 0x185bf8
	checkevent $0332
	iftrue UnknownScript_0x185c02
	changeblock $a, $8, $32
UnknownScript_0x185c02: ; 0x185c02
	checkevent EVENT_RELEASED_THE_BEASTS
	iftrue UnknownScript_0x185c0c
	changeblock $6, $e, $9
UnknownScript_0x185c0c: ; 0x185c0c
	return
; 0x185c0d

UnknownScript_0x185c0d: ; 0x185c0d
	spriteface $3, DOWN
	showemote $0, $3, 15
	applymovement $3, MovementData_0x185cd3
	loadfont
	writetext UnknownText_0x185ecc
	closetext
	loadmovesprites
	moveperson $3, $9, $e
	dotrigger $1
	end
; 0x185c25

UnknownScript_0x185c25: ; 0x185c25
	showemote $0, $4, 15
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
; 0x185c60

UnknownScript_0x185c60: ; 0x185c60
	winlosstext UnknownText_0x185d9b, UnknownText_0x185e2c
	setlasttalked $4
	loadtrainer RIVAL1, RIVAL1_7
	startbattle
	reloadmapmusic
	returnafterbattle
	jump UnknownScript_0x185c80
; 0x185c70

UnknownScript_0x185c70: ; 0x185c70
	winlosstext UnknownText_0x185d9b, UnknownText_0x185e2c
	setlasttalked $4
	loadtrainer RIVAL1, RIVAL1_8
	startbattle
	reloadmapmusic
	returnafterbattle
	jump UnknownScript_0x185c80
; 0x185c80

UnknownScript_0x185c80: ; 0x185c80
	playmusic MUSIC_RIVAL_AFTER
	loadfont
	writetext UnknownText_0x185de2
	closetext
	loadmovesprites
	dotrigger $2
	setevent $06c5
	special Functionc48f
	pause 15
	earthquake 50
	showemote $0, $0, 15
	playsound SFX_ENTER_DOOR
	waitbutton
	changeblock $a, $8, $25
	reloadmappart
	pause 15
	applymovement $0, MovementData_0x185cd1
	playsound SFX_KINESIS
	showemote $0, $4, 20
	loadfont
	writetext UnknownText_0x185e75
	closetext
	loadmovesprites
	setevent $0332
	pause 15
	warpcheck
	end
; 0x185cbc

SuperNerdScript_0x185cbc: ; 0x185cbc
	jumptextfaceplayer UnknownText_0x185f99
; 0x185cbf

MortyScript_0x185cbf: ; 0x185cbf
	jumptextfaceplayer UnknownText_0x186002
; 0x185cc2

BurnedTower1FRock:
	jumpstd smashrock

MapBurnedTower1FSignpostItem0: ; 0x185cc5
	dw $0080
	db ETHER
	
; 0x185cc8

MapBurnedTower1FSignpostItem1: ; 0x185cc8
	dw $00ff
	db ULTRA_BALL
	
; 0x185ccb

ItemFragment_0x185ccb: ; 0x185ccb
	db HP_UP, 1
; 0x185ccd

MovementData_0x185ccd: ; 0x185ccd
	step_left
	step_end
; 0x185ccf

MovementData_0x185ccf: ; 0x185ccf
	step_right
	step_end
; 0x185cd1

MovementData_0x185cd1: ; 0x185cd1
	db $59 ; movement
	step_end
; 0x185cd3

MovementData_0x185cd3: ; 0x185cd3
	step_down
	step_left
	step_left
	step_left
	step_down
	step_end
; 0x185cd9

UnknownText_0x185cd9: ; 0x185cd9
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
; 0x185d9b

UnknownText_0x185d9b: ; 0x185d9b
	text "…Humph!"

	para "This is why I hate"
	line "battling wimps."

	para "There's no"
	line "challenge in it."
	done
; 0x185de2

UnknownText_0x185de2: ; 0x185de2
	text "…Aw, whatever."

	para "You would never be"
	line "able to catch a"

	para "legendary #MON"
	line "anyway."
	done
; 0x185e2c

UnknownText_0x185e2c: ; 0x185e2c
	text "…Humph!"

	para "This is why I hate"
	line "battling wimps."

	para "It's just a waste"
	line "of my time."
	done
; 0x185e75

UnknownText_0x185e75: ; 0x185e75
	text "Humph!"

	para "What are you doing"
	line "falling into a"

	para "hole? Some genius"
	line "you are!"

	para "Serves you right!"
	done
; 0x185ecc

UnknownText_0x185ecc: ; 0x185ecc
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
; 0x185f99

UnknownText_0x185f99: ; 0x185f99
	text "EUSINE: I heard"
	line "that SUICUNE is in"

	para "this BURNED TOWER,"
	line "so I came to look."

	para "But where exactly"
	line "could it be?"
	done
; 0x186002

UnknownText_0x186002: ; 0x186002
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
; 0x1860b2

BurnedTower1F_MapEventHeader: ; 0x1860b2
	; filler
	db 0, 0

	; warps
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

	; xy triggers
	db 1
	xy_trigger 1, $9, $b, $0, UnknownScript_0x185c25, $0, $0

	; signposts
	db 2
	signpost 7, 8, $7, MapBurnedTower1FSignpostItem0
	signpost 11, 13, $7, MapBurnedTower1FSignpostItem1

	; people-events
	db 5
	person_event SPRITE_ROCK, 8, 19, $18, $0, 255, 255, $0, 0, BurnedTower1FRock, $ffff
	person_event SPRITE_SUPER_NERD, 16, 16, $3, $0, 255, 255, $90, 0, SuperNerdScript_0x185cbc, $0765
	person_event SPRITE_SILVER, 13, 12, $8, $0, 255, 255, $2, 3, ObjectEvent, $06c5
	person_event SPRITE_MORTY, 18, 18, $2, $11, 255, 255, $b0, 0, MortyScript_0x185cbf, $0764
	person_event SPRITE_POKE_BALL, 6, 18, $1, $0, 255, 255, $1, 0, ItemFragment_0x185ccb, $0656
; 0x186151
