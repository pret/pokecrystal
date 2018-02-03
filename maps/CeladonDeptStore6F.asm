const_value set 2
	const CELADONDEPTSTORE6F_SUPER_NERD
	const CELADONDEPTSTORE6F_YOUNGSTER

CeladonDeptStore6F_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 1
	callback MAPCALLBACK_TILES, .HideRooftopStairs

.HideRooftopStairs:
	changeblock 12, 0, $03 ; wall
	return

CeladonDeptStore6FSuperNerdScript:
	jumptextfaceplayer CeladonDeptStore6FSuperNerdText

CeladonDeptStore6FYoungsterScript:
	jumptextfaceplayer CeladonDeptStore6FYoungsterText

CeladonDeptStore6FVendingMachine:
	opentext
	writetext CeladonVendingText
.Start:
	special Special_PlaceMoneyTopRight
	loadmenudata .MenuData
	verticalmenu
	closewindow
	if_equal 1, .FreshWater
	if_equal 2, .SodaPop
	if_equal 3, .Lemonade
	closetext
	end

.FreshWater:
	checkmoney YOUR_MONEY, 200
	if_equal HAVE_LESS, .NotEnoughMoney
	giveitem FRESH_WATER
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 200
	itemtotext FRESH_WATER, MEM_BUFFER_0
	jump .VendItem

.SodaPop:
	checkmoney YOUR_MONEY, 300
	if_equal HAVE_LESS, .NotEnoughMoney
	giveitem SODA_POP
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 300
	itemtotext SODA_POP, MEM_BUFFER_0
	jump .VendItem

.Lemonade:
	checkmoney YOUR_MONEY, 350
	if_equal HAVE_LESS, .NotEnoughMoney
	giveitem LEMONADE
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 350
	itemtotext LEMONADE, MEM_BUFFER_0
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
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "FRESH WATER  ¥200@"
	db "SODA POP     ¥300@"
	db "LEMONADE     ¥350@"
	db "CANCEL@"

CeladonDeptStore6FDirectory:
	jumptext CeladonDeptStore6FDirectoryText

; unused
CeladonDeptStore6FElevatorButton:
	jumpstd elevatorbutton

CeladonVendingText:
	text "A vending machine!"
	line "Here's the menu."
	done

CeladonClangText:
	text "Clang!"

	para "@"
	text_from_ram wStringBuffer3
	text_start
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

CeladonDeptStore6FSuperNerdText:
	text "A vending machine"
	line "with a prize rou-"
	cont "lette…"

	para "You never see"
	line "those anymore."
	done

CeladonDeptStore6FYoungsterText:
	text "Aww! There's no"
	line "games here!"

	para "I wanted to play…"
	done

CeladonDeptStore6FDirectoryText:
	text "6F: ROOFTOP SQUARE"
	line "VENDING MACHINES"
	done

CeladonDeptStore6F_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def 15, 0, 2, CELADON_DEPT_STORE_5F
	warp_def 2, 0, 1, CELADON_DEPT_STORE_ELEVATOR

.CoordEvents:
	db 0

.BGEvents:
	db 6
	bg_event 14, 0, BGEVENT_READ, CeladonDeptStore6FDirectory
	bg_event 3, 0, BGEVENT_READ, CeladonDeptStore1FElevatorButton
	bg_event 8, 1, BGEVENT_UP, CeladonDeptStore6FVendingMachine
	bg_event 9, 1, BGEVENT_UP, CeladonDeptStore6FVendingMachine
	bg_event 10, 1, BGEVENT_UP, CeladonDeptStore6FVendingMachine
	bg_event 11, 1, BGEVENT_UP, CeladonDeptStore6FVendingMachine

.ObjectEvents:
	db 2
	object_event 9, 2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore6FSuperNerdScript, -1
	object_event 12, 5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore6FYoungsterScript, -1
