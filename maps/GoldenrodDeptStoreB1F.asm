GoldenrodDeptStoreB1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 2

	; callbacks

	dbw 1, UnknownScript_0x7d781

	dbw 5, UnknownScript_0x7d7ac

UnknownScript_0x7d781:
	checkevent EVENT_RECEIVED_CARD_KEY
	iftrue UnknownScript_0x7d78a
	jump UnknownScript_0x7d791

UnknownScript_0x7d78a:
	changeblock $10, $4, $d
	jump UnknownScript_0x7d791

UnknownScript_0x7d791:
	checkevent EVENT_WAREHOUSE_LAYOUT_2
	iftrue .Layout2
	checkevent EVENT_WAREHOUSE_LAYOUT_3
	iftrue .Layout3
	changeblock $a, $8, $d
	return

.Layout2
	changeblock $4, $a, $d
	return

.Layout3
	changeblock $a, $c, $d
	return

UnknownScript_0x7d7ac:
	clearevent EVENT_WAREHOUSE_BLOCKED_OFF
	return

BlackBeltScript_0x7d7b0:
	jumptextfaceplayer UnknownText_0x7d7cb

BlackBeltScript_0x7d7b3:
	jumptextfaceplayer UnknownText_0x7d82c

BlackBeltScript_0x7d7b6:
	jumptextfaceplayer UnknownText_0x7d875

MachopScript_0x7d7b9:
	loadfont
	writetext UnknownText_0x7d8bb
	cry MACHOKE
	closetext
	loadmovesprites
	end

ItemFragment_0x7d7c3:
	db ETHER, 1

ItemFragment_0x7d7c5:
	db AMULET_COIN, 1

ItemFragment_0x7d7c7:
	db BURN_HEAL, 1

ItemFragment_0x7d7c9:
	db ULTRA_BALL, 1

UnknownText_0x7d7cb:
	text "Hey, kid! You're"
	line "holding us up!"

	para "Our policy is to"
	line "work behind the"

	para "scenes where no"
	line "one can see us!"
	done

UnknownText_0x7d82c:
	text "I lose my passion"
	line "for work if some-"
	cont "one's watching."

	para "Come on, kid,"
	line "scoot!"
	done

UnknownText_0x7d875:
	text "Oohah! Oohah!"

	para "The stuff on the"
	line "ground's junk."

	para "Take it if you"
	line "want it!"
	done

UnknownText_0x7d8bb:
	text "MACHOKE: Maaacho!"
	done

GoldenrodDeptStoreB1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $2, $11, 3, GROUP_UNDERGROUND_WAREHOUSE, MAP_UNDERGROUND_WAREHOUSE
	warp_def $4, $9, 1, GROUP_GOLDENROD_DEPT_STORE_ELEVATOR, MAP_GOLDENROD_DEPT_STORE_ELEVATOR
	warp_def $4, $a, 2, GROUP_GOLDENROD_DEPT_STORE_ELEVATOR, MAP_GOLDENROD_DEPT_STORE_ELEVATOR

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 8
	person_event SPRITE_POKE_BALL, 19, 14, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x7d7c3, EVENT_GOLDENROD_DEPT_STORE_B1F_ETHER
	person_event SPRITE_POKE_BALL, 6, 18, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x7d7c5, EVENT_GOLDENROD_DEPT_STORE_B1F_AMULET_COIN
	person_event SPRITE_POKE_BALL, 7, 10, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x7d7c7, EVENT_GOLDENROD_DEPT_STORE_B1F_BURN_HEAL
	person_event SPRITE_POKE_BALL, 19, 19, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x7d7c9, EVENT_GOLDENROD_DEPT_STORE_B1F_ULTRA_BALL
	person_event SPRITE_BLACK_BELT, 14, 13, OW_UP | $0, $10, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, BlackBeltScript_0x7d7b0, -1
	person_event SPRITE_BLACK_BELT, 12, 8, OW_DOWN | $3, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, BlackBeltScript_0x7d7b3, -1
	person_event SPRITE_BLACK_BELT, 17, 10, OW_UP | $1, $1, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, BlackBeltScript_0x7d7b6, -1
	person_event SPRITE_MACHOP, 11, 11, OW_UP | $12, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, MachopScript_0x7d7b9, -1
