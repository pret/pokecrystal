GoldenrodFlowerShop_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

TeacherScript_0x5535d:
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue UnknownScript_0x5538f
	checkevent EVENT_GOT_SQUIRTBOTTLE
	iftrue UnknownScript_0x55399
	checkevent EVENT_MET_FLORIA
	iffalse UnknownScript_0x5539f
	checkevent EVENT_0BA
	iffalse UnknownScript_0x5538f
	checkflag ENGINE_PLAINBADGE
	iffalse UnknownScript_0x5539c
	faceplayer
	loadfont
	writetext UnknownText_0x554c2
	keeptextopen
	verbosegiveitem SQUIRTBOTTLE, 1
	setevent EVENT_GOT_SQUIRTBOTTLE
	loadmovesprites
	setevent EVENT_FLORIA_AT_SUDOWOODO
	clearevent EVENT_768
	end

UnknownScript_0x5538f:
	spriteface $2, LEFT
	loadfont
	writetext UnknownText_0x5552e
	closetext
	loadmovesprites
	end

UnknownScript_0x55399:
	jumptextfaceplayer UnknownText_0x5550d

UnknownScript_0x5539c:
	jumptextfaceplayer UnknownText_0x55463

UnknownScript_0x5539f:
	jumptextfaceplayer UnknownText_0x553d4

LassScript_0x553a2:
	faceplayer
	loadfont
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue UnknownScript_0x553c5
	checkevent EVENT_GOT_SQUIRTBOTTLE
	iftrue UnknownScript_0x553bf
	writetext UnknownText_0x55561
	closetext
	loadmovesprites
	setevent EVENT_0BA
	setevent EVENT_768
	clearevent EVENT_FLORIA_AT_SUDOWOODO
	end

UnknownScript_0x553bf:
	writetext UnknownText_0x555e6
	closetext
	loadmovesprites
	end

UnknownScript_0x553c5:
	writetext UnknownText_0x55604
	closetext
	loadmovesprites
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

GoldenrodFlowerShop_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 6, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY
	warp_def $7, $3, 6, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event SPRITE_TEACHER, 8, 6, $9, $0, 255, 255, $0, 0, TeacherScript_0x5535d, -1
	person_event SPRITE_LASS, 10, 9, $2, $11, 255, 255, $90, 0, LassScript_0x553a2, EVENT_768
