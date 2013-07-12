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
	checkbit1 $0332
	iftrue UnknownScript_0x185c02
	changeblock $a, $8, $32
UnknownScript_0x185c02: ; 0x185c02
	checkbit1 $007b
	iftrue UnknownScript_0x185c0c
	changeblock $6, $e, $9
UnknownScript_0x185c0c: ; 0x185c0c
	return
; 0x185c0d

UnknownScript_0x185c0d: ; 0x185c0d
	spriteface $3, $0
	showemote $0, $3, 15
	applymovement $3, MovementData_0x185cd3
	loadfont
	2writetext UnknownText_0x185ecc
	closetext
	loadmovesprites
	moveperson $3, $9, $e
	dotrigger $1
	end
; 0x185c25

UnknownScript_0x185c25: ; 0x185c25
	showemote $0, $4, 15
	special $006a
	pause 15
	spriteface $4, $3
	pause 15
	applymovement $0, MovementData_0x185ccd
	applymovement $4, MovementData_0x185ccf
	playmusic $001f
	loadfont
	2writetext UnknownText_0x185cd9
	closetext
	loadmovesprites
	checkbit1 $001c
	iftrue UnknownScript_0x185c60
	checkbit1 $001d
	iftrue UnknownScript_0x185c70
	winlosstext UnknownText_0x185d9b, UnknownText_0x185e2c
	setlasttalked $4
	loadtrainer RIVAL1, RIVAL1_9
	startbattle
	reloadmapmusic
	returnafterbattle
	2jump UnknownScript_0x185c80
; 0x185c60

UnknownScript_0x185c60: ; 0x185c60
	winlosstext UnknownText_0x185d9b, UnknownText_0x185e2c
	setlasttalked $4
	loadtrainer RIVAL1, RIVAL1_7
	startbattle
	reloadmapmusic
	returnafterbattle
	2jump UnknownScript_0x185c80
; 0x185c70

UnknownScript_0x185c70: ; 0x185c70
	winlosstext UnknownText_0x185d9b, UnknownText_0x185e2c
	setlasttalked $4
	loadtrainer RIVAL1, RIVAL1_8
	startbattle
	reloadmapmusic
	returnafterbattle
	2jump UnknownScript_0x185c80
; 0x185c80

UnknownScript_0x185c80: ; 0x185c80
	playmusic $0020
	loadfont
	2writetext UnknownText_0x185de2
	closetext
	loadmovesprites
	dotrigger $2
	setbit1 $06c5
	special $006a
	pause 15
	earthquake 50
	showemote $0, $0, 15
	playsound $001f
	waitbutton
	changeblock $a, $8, $25
	reloadmappart
	pause 15
	applymovement $0, MovementData_0x185cd1
	playsound $002f
	showemote $0, $4, 20
	loadfont
	2writetext UnknownText_0x185e75
	closetext
	loadmovesprites
	setbit1 $0332
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

RockScript_0x185cc2: ; 0x185cc2
	jumpstd $000f
; 0x185cc5

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
	db $0, $56, " ", $56, " ", $56, $51
	db "…Oh, it's you.", $51
	db "I came looking for", $4f
	db "some legendary", $51
	db "#MON that they", $4f
	db "say roosts here.", $51
	db "But there's", $4f
	db "nothing here!", $51
	db "Nothing after all", $4f
	db "the trouble of", $51
	db "coming to this", $4f
	db "dump? No way!", $51
	db "It's all your", $4f
	db "fault!", $57
; 0x185d9b

UnknownText_0x185d9b: ; 0x185d9b
	db $0, "…Humph!", $51
	db "This is why I hate", $4f
	db "battling wimps.", $51
	db "There's no", $4f
	db "challenge in it.", $57
; 0x185de2

UnknownText_0x185de2: ; 0x185de2
	db $0, "…Aw, whatever.", $51
	db "You would never be", $4f
	db "able to catch a", $51
	db "legendary #MON", $4f
	db "anyway.", $57
; 0x185e2c

UnknownText_0x185e2c: ; 0x185e2c
	db $0, "…Humph!", $51
	db "This is why I hate", $4f
	db "battling wimps.", $51
	db "It's just a waste", $4f
	db "of my time.", $57
; 0x185e75

UnknownText_0x185e75: ; 0x185e75
	db $0, "Humph!", $51
	db "What are you doing", $4f
	db "falling into a", $51
	db "hole? Some genius", $4f
	db "you are!", $51
	db "Serves you right!", $57
; 0x185ecc

UnknownText_0x185ecc: ; 0x185ecc
	db $0, "EUSINE: My name's", $4f
	db "EUSINE.", $51
	db "I'm on the trail", $4f
	db "of a #MON named", $55
	db "SUICUNE.", $51
	db "And you are…?", $51
	db $52, "? Glad to", $4f
	db "meet you!", $51
	db "I heard rumors", $4f
	db "that SUICUNE is in", $51
	db "this BURNED TOWER,", $4f
	db "so I came to look.", $51
	db "But where exactly", $4f
	db "could it be?", $57
; 0x185f99

UnknownText_0x185f99: ; 0x185f99
	db $0, "EUSINE: I heard", $4f
	db "that SUICUNE is in", $51
	db "this BURNED TOWER,", $4f
	db "so I came to look.", $51
	db "But where exactly", $4f
	db "could it be?", $57
; 0x186002

UnknownText_0x186002: ; 0x186002
	db $0, "MORTY: ECRUTEAK's", $4f
	db "GYM LEADER has to", $51
	db "study what are", $4f
	db "said to be the", $51
	db "legendary #MON", $4f
	db "--SUICUNE, ENTEI", $55
	db "and RAIKOU.", $51
	db "EUSINE is here, so", $4f
	db "I've decided to", $51
	db "investigate the", $4f
	db "TOWER with him.", $57
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
	person_event SPRITE_ROCK, 8, 19, $18, $0, 255, 255, $0, 0, RockScript_0x185cc2, $ffff
	person_event SPRITE_SUPER_NERD, 16, 16, $3, $0, 255, 255, $90, 0, SuperNerdScript_0x185cbc, $0765
	person_event SPRITE_SILVER, 13, 12, $8, $0, 255, 255, $2, 3, ObjectEvent, $06c5
	person_event SPRITE_MORTY, 18, 18, $2, $11, 255, 255, $b0, 0, MortyScript_0x185cbf, $0764
	person_event SPRITE_POKE_BALL, 6, 18, $1, $0, 255, 255, $1, 0, ItemFragment_0x185ccb, $0656
; 0x186151

