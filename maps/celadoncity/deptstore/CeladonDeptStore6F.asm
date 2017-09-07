const_value set 2
	const CELADONDEPTSTORE6F_SUPER_NERD
	const CELADONDEPTSTORE6F_YOUNGSTER

CeladonDeptStore6F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_TILES, .Callback

.Callback:
	changeblock $c, $0, $3
	return

SuperNerdScript_0x7117a:
	jumptextfaceplayer UnknownText_0x712c7

YoungsterScript_0x7117d:
	jumptextfaceplayer UnknownText_0x71310

CeladonVendingMachine:
	opentext
	writetext CeladonVendingText
.Start:
	special PlaceMoneyTopRight
	loadmenudata .MenuData
	verticalmenu
	closewindow
	if_equal $1, .FreshWater
	if_equal $2, .SodaPop
	if_equal $3, .Lemonade
	closetext
	end

.FreshWater:
	checkmoney $0, 200
	if_equal $2, .NotEnoughMoney
	giveitem FRESH_WATER
	iffalse .NotEnoughSpace
	takemoney $0, 200
	itemtotext FRESH_WATER, $0
	jump .VendItem

.SodaPop:
	checkmoney $0, 300
	if_equal $2, .NotEnoughMoney
	giveitem SODA_POP
	iffalse .NotEnoughSpace
	takemoney $0, 300
	itemtotext SODA_POP, $0
	jump .VendItem

.Lemonade:
	checkmoney $0, 350
	if_equal $2, .NotEnoughMoney
	giveitem LEMONADE
	iffalse .NotEnoughSpace
	takemoney $0, 350
	itemtotext LEMONADE, $0
	jump .VendItem

.VendItem:
	pause 10
	playsound SFX_ENTER_DOOR
	writetext CeladonClangText
	buttonsound
	itemnotify
	jump .Start

.NotEnoughMoney:
	writetext CeladonVendingNoMoneyText
	waitbutton
	jump .Start

.NotEnoughSpace:
	writetext CeladonVendingNoSpaceText
	waitbutton
	jump .Start

.MenuData:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 19 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
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
	warp_def $0, $f, 2, CELADON_DEPT_STORE_5F
	warp_def $0, $2, 1, CELADON_DEPT_STORE_ELEVATOR

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
	person_event SPRITE_SUPER_NERD, 2, 9, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SuperNerdScript_0x7117a, -1
	person_event SPRITE_YOUNGSTER, 5, 12, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x7117d, -1
