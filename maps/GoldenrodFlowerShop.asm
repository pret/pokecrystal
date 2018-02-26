	const_def 2 ; object constants
	const GOLDENRODFLOWERSHOP_TEACHER
	const GOLDENRODFLOWERSHOP_FLORIA

GoldenrodFlowerShop_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FlowerShopTeacherScript:
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue .Lalala
	checkevent EVENT_GOT_SQUIRTBOTTLE
	iftrue .GotSquirtbottle
	checkevent EVENT_MET_FLORIA
	iffalse .HaventMetFloria
	checkevent EVENT_TALKED_TO_FLORIA_AT_FLOWER_SHOP
	iffalse .Lalala
	checkflag ENGINE_PLAINBADGE
	iffalse .NoPlainBadge
	faceplayer
	opentext
	writetext UnknownText_0x554c2
	buttonsound
	verbosegiveitem SQUIRTBOTTLE
	setevent EVENT_GOT_SQUIRTBOTTLE
	closetext
	setevent EVENT_FLORIA_AT_SUDOWOODO
	clearevent EVENT_FLORIA_AT_FLOWER_SHOP
	end

.Lalala:
	turnobject GOLDENRODFLOWERSHOP_TEACHER, LEFT
	opentext
	writetext UnknownText_0x5552e
	waitbutton
	closetext
	end

.GotSquirtbottle:
	jumptextfaceplayer UnknownText_0x5550d

.NoPlainBadge:
	jumptextfaceplayer UnknownText_0x55463

.HaventMetFloria:
	jumptextfaceplayer UnknownText_0x553d4

FlowerShopFloriaScript:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue .FoughtSudowoodo
	checkevent EVENT_GOT_SQUIRTBOTTLE
	iftrue .GotSquirtbottle
	writetext UnknownText_0x55561
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_FLORIA_AT_FLOWER_SHOP
	setevent EVENT_FLORIA_AT_FLOWER_SHOP
	clearevent EVENT_FLORIA_AT_SUDOWOODO
	end

.GotSquirtbottle:
	writetext UnknownText_0x555e6
	waitbutton
	closetext
	end

.FoughtSudowoodo:
	writetext UnknownText_0x55604
	waitbutton
	closetext
	end

FlowerShopShelf1:
; unused
	jumpstd picturebookshelf

FlowerShopShelf2:
; unused
	jumpstd magazinebookshelf

FlowerShopRadio:
; unused
	jumpstd radio2

UnknownText_0x553d4:
	text "Have you seen that"
	line "wiggly tree that's"

	para "growing on ROUTE"
	line "36?"

	para "My little sister"
	line "got all excited"

	para "and went to see"
	line "it…"

	para "I'm worried… Isn't"
	line "it dangerous?"
	done

UnknownText_0x55463:
	text "Do you want to"
	line "borrow the water"

	para "bottle too?"
	line "I don't want you"

	para "doing anything"
	line "dangerous with it."
	done

UnknownText_0x554c2:
	text "Oh, you're better"
	line "than WHITNEY…"

	para "You'll be OK,"
	line "then. Here's the"
	cont "SQUIRTBOTTLE!"
	done

UnknownText_0x5550d:
	text "Don't do anything"
	line "too dangerous!"
	done

UnknownText_0x5552e:
	text "Lalala lalalala."
	line "Have plenty of"
	cont "water, my lovely!"
	done

UnknownText_0x55561:
	text "When I told my sis"
	line "about the jiggly"

	para "tree, she told me"
	line "it's dangerous."

	para "If I beat WHITNEY,"
	line "I wonder if she'll"

	para "lend me her water"
	line "bottle…"
	done

UnknownText_0x555e6:
	text "Wow, you beat"
	line "WHITNEY? Cool!"
	done

UnknownText_0x55604:
	text "So it really was a"
	line "#MON!"
	done

GoldenrodFlowerShop_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, GOLDENROD_CITY, 6
	warp_event  3,  7, GOLDENROD_CITY, 6

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FlowerShopTeacherScript, -1
	object_event  5,  6, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FlowerShopFloriaScript, EVENT_FLORIA_AT_FLOWER_SHOP
