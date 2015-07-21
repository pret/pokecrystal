CeladonDeptStore6F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks

	dbw 1, UnknownScript_0x71175

UnknownScript_0x71175:
	changeblock $c, $0, $3
	return

SuperNerdScript_0x7117a:
	jumptextfaceplayer UnknownText_0x712c7

YoungsterScript_0x7117d:
	jumptextfaceplayer UnknownText_0x71310

CeladonVendingMachine:
	loadfont
	writetext CeladonVendingText
.Start
	special Function24ae8
	loadmenudata .MenuData
	interpretmenu2
	writebackup
	if_equal $1, .FreshWater
	if_equal $2, .SodaPop
	if_equal $3, .Lemonade
	loadmovesprites
	end

.FreshWater
	checkmoney $0, 200
	if_equal $2, .NotEnoughMoney
	giveitem FRESH_WATER, $1
	iffalse .NotEnoughSpace
	takemoney $0, 200
	itemtotext FRESH_WATER, $0
	jump .VendItem

.SodaPop
	checkmoney $0, 300
	if_equal $2, .NotEnoughMoney
	giveitem SODA_POP, $1
	iffalse .NotEnoughSpace
	takemoney $0, 300
	itemtotext SODA_POP, $0
	jump .VendItem

.Lemonade
	checkmoney $0, 350
	if_equal $2, .NotEnoughMoney
	giveitem LEMONADE, $1
	iffalse .NotEnoughSpace
	takemoney $0, 350
	itemtotext LEMONADE, $0
	jump .VendItem

.VendItem
	pause 10
	playsound SFX_ENTER_DOOR
	writetext CeladonClangText
	keeptextopen
	itemnotify
	jump .Start

.NotEnoughMoney
	writetext CeladonVendingNoMoneyText
	closetext
	jump .Start

.NotEnoughSpace
	writetext CeladonVendingNoSpaceText
	closetext
	jump .Start

.MenuData
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 19 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2
	db $80 ; flags
	db 4 ; items
	db "FRESH WATER  ¥200@"
	db "SODA POP     ¥300@"
	db "LEMONADE     ¥350@"
	db "CANCEL@"


CeladonDeptStore6FDirectory:
	jumptext CeladonDeptStore6FDirectoryText

UnknownScript_0x7124d:
	jumpstd elevatorbutton

CeladonVendingText:
	text "A vending machine!"
	line "Here's the menu."
	done

CeladonClangText:
	text "Clang!"

	para "@"
	text_from_ram StringBuffer3
	text ""
	line "popped out."
	done

CeladonVendingNoMoneyText:
	text "Oops, not enough"
	line "money…"
	done

CeladonVendingNoSpaceText:
	text "There's no more"
	line "room for stuff…"
	done

UnknownText_0x712c7:
	text "A vending machine"
	line "with a prize rou-"
	cont "lette…"

	para "You never see"
	line "those anymore."
	done

UnknownText_0x71310:
	text "Aww! There's no"
	line "games here!"

	para "I wanted to play…"
	done

CeladonDeptStore6FDirectoryText:
	text "6F: ROOFTOP SQUARE"
	line "VENDING MACHINES"
	done

CeladonDeptStore6F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $0, $f, 2, GROUP_CELADON_DEPT_STORE_5F, MAP_CELADON_DEPT_STORE_5F
	warp_def $0, $2, 1, GROUP_CELADON_DEPT_STORE_ELEVATOR, MAP_CELADON_DEPT_STORE_ELEVATOR

.XYTriggers:
	db 0

.Signposts:
	db 6
	signpost 0, 14, SIGNPOST_READ, CeladonDeptStore6FDirectory
	signpost 0, 3, SIGNPOST_READ, CeladonDeptStore1FElevatorButton
	signpost 1, 8, SIGNPOST_UP, CeladonVendingMachine
	signpost 1, 9, SIGNPOST_UP, CeladonVendingMachine
	signpost 1, 10, SIGNPOST_UP, CeladonVendingMachine
	signpost 1, 11, SIGNPOST_UP, CeladonVendingMachine

.PersonEvents:
	db 2
	person_event SPRITE_SUPER_NERD, 6, 13, OW_UP | $3, $0, -1, -1, $0, 0, SuperNerdScript_0x7117a, -1
	person_event SPRITE_YOUNGSTER, 9, 16, OW_DOWN | $2, $12, -1, -1, (PAL_OW_RED << 4) | $80, 0, YoungsterScript_0x7117d, -1
