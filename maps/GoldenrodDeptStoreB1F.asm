const_value set 2
	const GOLDENRODDEPTSTOREB1F_POKE_BALL1
	const GOLDENRODDEPTSTOREB1F_POKE_BALL2
	const GOLDENRODDEPTSTOREB1F_POKE_BALL3
	const GOLDENRODDEPTSTOREB1F_POKE_BALL4
	const GOLDENRODDEPTSTOREB1F_BLACK_BELT1
	const GOLDENRODDEPTSTOREB1F_BLACK_BELT2
	const GOLDENRODDEPTSTOREB1F_BLACK_BELT3
	const GOLDENRODDEPTSTOREB1F_MACHOP

GoldenrodDeptStoreB1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 2

	; callbacks

	dbw MAPCALLBACK_TILES, UnknownScript_0x7d781

	dbw MAPCALLBACK_NEWMAP, UnknownScript_0x7d7ac

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

.Layout2:
	changeblock $4, $a, $d
	return

.Layout3:
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
	opentext
	writetext UnknownText_0x7d8bb
	cry MACHOKE
	waitbutton
	closetext
	end

GoldenrodDeptStoreB1FEther:
	itemball ETHER

GoldenrodDeptStoreB1FAmuletCoin:
	itemball AMULET_COIN

GoldenrodDeptStoreB1FBurnHeal:
	itemball BURN_HEAL

GoldenrodDeptStoreB1FUltraBall:
	itemball ULTRA_BALL

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
	warp_def $2, $11, 3, UNDERGROUND_WAREHOUSE
	warp_def $4, $9, 1, GOLDENROD_DEPT_STORE_ELEVATOR
	warp_def $4, $a, 2, GOLDENROD_DEPT_STORE_ELEVATOR

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 8
	person_event SPRITE_POKE_BALL, 15, 10, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, GoldenrodDeptStoreB1FEther, EVENT_GOLDENROD_DEPT_STORE_B1F_ETHER
	person_event SPRITE_POKE_BALL, 2, 14, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, GoldenrodDeptStoreB1FAmuletCoin, EVENT_GOLDENROD_DEPT_STORE_B1F_AMULET_COIN
	person_event SPRITE_POKE_BALL, 3, 6, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, GoldenrodDeptStoreB1FBurnHeal, EVENT_GOLDENROD_DEPT_STORE_B1F_BURN_HEAL
	person_event SPRITE_POKE_BALL, 15, 15, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, GoldenrodDeptStoreB1FUltraBall, EVENT_GOLDENROD_DEPT_STORE_B1F_ULTRA_BALL
	person_event SPRITE_BLACK_BELT, 10, 9, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, BlackBeltScript_0x7d7b0, -1
	person_event SPRITE_BLACK_BELT, 8, 4, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, BlackBeltScript_0x7d7b3, -1
	person_event SPRITE_BLACK_BELT, 13, 6, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BlackBeltScript_0x7d7b6, -1
	person_event SPRITE_MACHOP, 7, 7, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, MachopScript_0x7d7b9, -1
