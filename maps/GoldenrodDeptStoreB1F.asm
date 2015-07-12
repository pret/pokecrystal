GoldenrodDeptStoreB1F_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 2

	; callbacks

	dbw 1, UnknownScript_0x7d781

	dbw 5, UnknownScript_0x7d7ac

UnknownScript_0x7d781:
	checkevent EVENT_04A
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

	; warps
	db 3
	warp_def $2, $11, 3, GROUP_UNDERGROUND_WAREHOUSE, MAP_UNDERGROUND_WAREHOUSE
	warp_def $4, $9, 1, GROUP_GOLDENROD_DEPT_STORE_ELEVATOR, MAP_GOLDENROD_DEPT_STORE_ELEVATOR
	warp_def $4, $a, 2, GROUP_GOLDENROD_DEPT_STORE_ELEVATOR, MAP_GOLDENROD_DEPT_STORE_ELEVATOR

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 8
	person_event SPRITE_POKE_BALL, 19, 14, $1, $0, 255, 255, $1, 0, ItemFragment_0x7d7c3, EVENT_675
	person_event SPRITE_POKE_BALL, 6, 18, $1, $0, 255, 255, $1, 0, ItemFragment_0x7d7c5, EVENT_676
	person_event SPRITE_POKE_BALL, 7, 10, $1, $0, 255, 255, $1, 0, ItemFragment_0x7d7c7, EVENT_677
	person_event SPRITE_POKE_BALL, 19, 19, $1, $0, 255, 255, $1, 0, ItemFragment_0x7d7c9, EVENT_678
	person_event SPRITE_BLACK_BELT, 14, 13, $4, $10, 255, 255, $a0, 0, BlackBeltScript_0x7d7b0, EVENT_ALWAYS_THERE
	person_event SPRITE_BLACK_BELT, 12, 8, $3, $0, 255, 255, $80, 0, BlackBeltScript_0x7d7b3, EVENT_ALWAYS_THERE
	person_event SPRITE_BLACK_BELT, 17, 10, $5, $1, 255, 255, $90, 0, BlackBeltScript_0x7d7b6, EVENT_ALWAYS_THERE
	person_event SPRITE_MACHOP, 11, 11, $16, $0, 255, 255, $90, 0, MachopScript_0x7d7b9, EVENT_ALWAYS_THERE
