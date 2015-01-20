GoldenrodDeptStore6F_MapScriptHeader: ; 0x563f3
	; trigger count
	db 0

	; callback count
	db 0
; 0x563f5

MapGoldenrodDeptStore6FSignpost5Script: ; 0x563f5
	loadfont
	writetext UnknownText_0x564cb
UnknownScript_0x563f9: ; 0x563f9
	special $0051
	loadmenudata MenuDataHeader_0x56478
	interpretmenu2
	writebackup
	if_equal $1, UnknownScript_0x5640f
	if_equal $2, UnknownScript_0x56429
	if_equal $3, UnknownScript_0x56443
	loadmovesprites
	end
; 0x5640f

UnknownScript_0x5640f: ; 0x5640f
	checkmoney $0, 200
	if_equal $2, UnknownScript_0x5646a
	giveitem FRESH_WATER, $1
	iffalse UnknownScript_0x56471
	takemoney $0, 200
	itemtotext FRESH_WATER, $0
	jump UnknownScript_0x5645d
; 0x56429

UnknownScript_0x56429: ; 0x56429
	checkmoney $0, 300
	if_equal $2, UnknownScript_0x5646a
	giveitem SODA_POP, $1
	iffalse UnknownScript_0x56471
	takemoney $0, 300
	itemtotext SODA_POP, $0
	jump UnknownScript_0x5645d
; 0x56443

UnknownScript_0x56443: ; 0x56443
	checkmoney $0, 350
	if_equal $2, UnknownScript_0x5646a
	giveitem LEMONADE, $1
	iffalse UnknownScript_0x56471
	takemoney $0, 350
	itemtotext LEMONADE, $0
	jump UnknownScript_0x5645d
; 0x5645d

UnknownScript_0x5645d: ; 0x5645d
	pause 10
	playsound SFX_ENTER_DOOR
	writetext UnknownText_0x564ef
	keeptextopen
	itemnotify
	jump UnknownScript_0x563f9
; 0x5646a

UnknownScript_0x5646a: ; 0x5646a
	writetext UnknownText_0x56512
	closetext
	jump UnknownScript_0x563f9
; 0x56471

UnknownScript_0x56471: ; 0x56471
	writetext UnknownText_0x5652b
	closetext
	jump UnknownScript_0x563f9
; 0x56478


MenuDataHeader_0x56478: ; 0x56478
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 19 ; end coords
	dw MenuData2_0x56480
	db 1 ; default option
; 0x56480

MenuData2_0x56480: ; 0x56480
	db $80 ; flags
	db 4 ; items
	db "FRESH WATER  ¥200@"
	db "SODA POP     ¥300@"
	db "LEMONADE     ¥350@"
	db "CANCEL@"
; 0x564bf


LassScript_0x564bf: ; 0x564bf
	jumptextfaceplayer UnknownText_0x5654b
; 0x564c2

SuperNerdScript_0x564c2: ; 0x564c2
	jumptextfaceplayer UnknownText_0x565ca
; 0x564c5

MapGoldenrodDeptStore6FSignpost0Script: ; 0x564c5
	jumptext UnknownText_0x5661a
; 0x564c8

MapGoldenrodDeptStore6FSignpost1Script: ; 0x564c8
	jumpstd $0014
; 0x564cb

UnknownText_0x564cb: ; 0x564cb
	text "A vending machine!"
	line "Here's the menu."
	done
; 0x564ef

UnknownText_0x564ef: ; 0x564ef
	text "Clang! A can of"
	line "@"
	text_from_ram $d099
	text $55
	db "popped out!"
	done
; 0x56512

UnknownText_0x56512: ; 0x56512
	text "Oops, not enough"
	line "money."
	done
; 0x5652b

UnknownText_0x5652b: ; 0x5652b
	text "There's no more"
	line "room for stuff."
	done
; 0x5654b

UnknownText_0x5654b: ; 0x5654b
	text "Do you listen to"
	line "LUCKY CHANNEL?"

	para "If you want to"
	line "win, trade #MON"

	para "with as many peo-"
	line "ple as possible to"

	para "get different ID"
	line "numbers."
	done
; 0x565ca

UnknownText_0x565ca: ; 0x565ca
	text "If you're tired,"
	line "try the vending"
	cont "machine's drinks."

	para "Your #MON will"
	line "love them too."
	done
; 0x5661a

UnknownText_0x5661a: ; 0x5661a
	text "Take a Break from"
	line "Shopping!"

	para "6F TRANQUIL SQUARE"
	done
; 0x5664a

GoldenrodDeptStore6F_MapEventHeader: ; 0x5664a
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $0, $f, 2, GROUP_GOLDENROD_DEPT_STORE_5F, MAP_GOLDENROD_DEPT_STORE_5F
	warp_def $0, $2, 1, GROUP_GOLDENROD_DEPT_STORE_ELEVATOR, MAP_GOLDENROD_DEPT_STORE_ELEVATOR
	warp_def $0, $d, 1, GROUP_GOLDENROD_DEPT_STORE_ROOF, MAP_GOLDENROD_DEPT_STORE_ROOF

	; xy triggers
	db 0

	; signposts
	db 6
	signpost 0, 14, $0, MapGoldenrodDeptStore6FSignpost0Script
	signpost 0, 3, $0, MapGoldenrodDeptStore6FSignpost1Script
	signpost 1, 8, $1, MapGoldenrodDeptStore6FSignpost5Script
	signpost 1, 9, $1, MapGoldenrodDeptStore6FSignpost5Script
	signpost 1, 10, $1, MapGoldenrodDeptStore6FSignpost5Script
	signpost 1, 11, $1, MapGoldenrodDeptStore6FSignpost5Script

	; people-events
	db 2
	person_event SPRITE_LASS, 6, 14, $5, $1, 255, 255, $a0, 0, LassScript_0x564bf, $ffff
	person_event SPRITE_SUPER_NERD, 6, 12, $7, $0, 255, 255, $80, 0, SuperNerdScript_0x564c2, $ffff
; 0x56697

