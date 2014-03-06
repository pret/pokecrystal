CeladonDeptStore6F_MapScriptHeader: ; 0x71170
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 1, UnknownScript_0x71175
; 0x71175

UnknownScript_0x71175: ; 0x71175
	changeblock $c, $0, $3
	return
; 0x7117a

SuperNerdScript_0x7117a: ; 0x7117a
	jumptextfaceplayer UnknownText_0x712c7
; 0x7117d

YoungsterScript_0x7117d: ; 0x7117d
	jumptextfaceplayer UnknownText_0x71310
; 0x71180

MapCeladonDeptStore6FSignpost5Script: ; 0x71180
	loadfont
	2writetext UnknownText_0x71250
UnknownScript_0x71184: ; 0x71184
	special $0051
	loadmenudata MenuDataHeader_0x71203
	interpretmenu2
	writebackup
	if_equal $1, UnknownScript_0x7119a
	if_equal $2, UnknownScript_0x711b4
	if_equal $3, UnknownScript_0x711ce
	loadmovesprites
	end
; 0x7119a

UnknownScript_0x7119a: ; 0x7119a
	checkmoney $0, 200
	if_equal $2, UnknownScript_0x711f5
	giveitem FRESH_WATER, $1
	iffalse UnknownScript_0x711fc
	takemoney $0, 200
	itemtotext FRESH_WATER, $0
	2jump UnknownScript_0x711e8
; 0x711b4

UnknownScript_0x711b4: ; 0x711b4
	checkmoney $0, 300
	if_equal $2, UnknownScript_0x711f5
	giveitem SODA_POP, $1
	iffalse UnknownScript_0x711fc
	takemoney $0, 300
	itemtotext SODA_POP, $0
	2jump UnknownScript_0x711e8
; 0x711ce

UnknownScript_0x711ce: ; 0x711ce
	checkmoney $0, 350
	if_equal $2, UnknownScript_0x711f5
	giveitem LEMONADE, $1
	iffalse UnknownScript_0x711fc
	takemoney $0, 350
	itemtotext LEMONADE, $0
	2jump UnknownScript_0x711e8
; 0x711e8

UnknownScript_0x711e8: ; 0x711e8
	pause 10
	playsound $001f
	2writetext UnknownText_0x71274
	keeptextopen
	itemnotify
	2jump UnknownScript_0x71184
; 0x711f5

UnknownScript_0x711f5: ; 0x711f5
	2writetext UnknownText_0x7128e
	closetext
	2jump UnknownScript_0x71184
; 0x711fc

UnknownScript_0x711fc: ; 0x711fc
	2writetext UnknownText_0x712a7
	closetext
	2jump UnknownScript_0x71184
; 0x71203


MenuDataHeader_0x71203: ; 0x71203
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 19 ; end coords
	dw MenuData2_0x7120b
	db 1 ; default option
; 0x7120b

MenuData2_0x7120b: ; 0x7120b
	db $80 ; flags
	db 4 ; items
	db "FRESH WATER  ¥200@"
	db "SODA POP     ¥300@"
	db "LEMONADE     ¥350@"
	db "CANCEL@"
; 0x71249


MapCeladonDeptStore6FSignpost0Script: ; 0x7124a
	jumptext UnknownText_0x7133e
; 0x7124d

UnknownScript_0x7124d: ; 0x7124d
	jumpstd $0014
; 0x71250

UnknownText_0x71250: ; 0x71250
	text "A vending machine!"
	line "Here's the menu."
	done
; 0x71274

UnknownText_0x71274: ; 0x71274
	text "Clang!"

	para "@"
	text_from_ram $d099
	db $0
	line "popped out."
	done
; 0x7128e

UnknownText_0x7128e: ; 0x7128e
	text "Oops, not enough"
	line "money…"
	done
; 0x712a7

UnknownText_0x712a7: ; 0x712a7
	text "There's no more"
	line "room for stuff…"
	done
; 0x712c7

UnknownText_0x712c7: ; 0x712c7
	text "A vending machine"
	line "with a prize rou-"
	cont "lette…"

	para "You never see"
	line "those anymore."
	done
; 0x71310

UnknownText_0x71310: ; 0x71310
	text "Aww! There's no"
	line "games here!"

	para "I wanted to play…"
	done
; 0x7133e

UnknownText_0x7133e: ; 0x7133e
	text "6F: ROOFTOP SQUARE"
	line "VENDING MACHINES"
	done
; 0x71363

CeladonDeptStore6F_MapEventHeader: ; 0x71363
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $0, $f, 2, GROUP_CELADON_DEPT_STORE_5F, MAP_CELADON_DEPT_STORE_5F
	warp_def $0, $2, 1, GROUP_CELADON_DEPT_STORE_ELEVATOR, MAP_CELADON_DEPT_STORE_ELEVATOR

	; xy triggers
	db 0

	; signposts
	db 6
	signpost 0, 14, $0, MapCeladonDeptStore6FSignpost0Script
	signpost 0, 3, $0, MapCeladonDeptStore6FSignpost1Script
	signpost 1, 8, $1, MapCeladonDeptStore6FSignpost5Script
	signpost 1, 9, $1, MapCeladonDeptStore6FSignpost5Script
	signpost 1, 10, $1, MapCeladonDeptStore6FSignpost5Script
	signpost 1, 11, $1, MapCeladonDeptStore6FSignpost5Script

	; people-events
	db 2
	person_event SPRITE_SUPER_NERD, 6, 13, $7, $0, 255, 255, $0, 0, SuperNerdScript_0x7117a, $ffff
	person_event SPRITE_YOUNGSTER, 9, 16, $2, $12, 255, 255, $80, 0, YoungsterScript_0x7117d, $ffff
; 0x713ab

