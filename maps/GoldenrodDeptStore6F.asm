GoldenrodDeptStore6F_MapScriptHeader: ; 0x563f3
	; trigger count
	db 0

	; callback count
	db 0
; 0x563f5

MapGoldenrodDeptStore6FSignpost5Script: ; 0x563f5
	loadfont
	2writetext UnknownText_0x564cb
UnknownScript_0x563f9: ; 0x563f9
	special $0051
	loadmenudata $6478
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
	2jump UnknownScript_0x5645d
; 0x56429

UnknownScript_0x56429: ; 0x56429
	checkmoney $0, 300
	if_equal $2, UnknownScript_0x5646a
	giveitem SODA_POP, $1
	iffalse UnknownScript_0x56471
	takemoney $0, 300
	itemtotext SODA_POP, $0
	2jump UnknownScript_0x5645d
; 0x56443

UnknownScript_0x56443: ; 0x56443
	checkmoney $0, 350
	if_equal $2, UnknownScript_0x5646a
	giveitem LEMONADE, $1
	iffalse UnknownScript_0x56471
	takemoney $0, 350
	itemtotext LEMONADE, $0
	2jump UnknownScript_0x5645d
; 0x5645d

UnknownScript_0x5645d: ; 0x5645d
	pause 10
	playsound $001f
	2writetext UnknownText_0x564ef
	keeptextopen
	itemnotify
	2jump UnknownScript_0x563f9
; 0x5646a

UnknownScript_0x5646a: ; 0x5646a
	2writetext UnknownText_0x56512
	closetext
	2jump UnknownScript_0x563f9
; 0x56471

UnknownScript_0x56471: ; 0x56471
	2writetext UnknownText_0x5652b
	closetext
	2jump UnknownScript_0x563f9
; 0x56478

; menu data
INCBIN "baserom.gbc",$56478,$564bf - $56478

UnknownScript_0x564bf: ; 0x564bf
	jumptextfaceplayer UnknownText_0x5654b
; 0x564c2

UnknownScript_0x564c2: ; 0x564c2
	jumptextfaceplayer UnknownText_0x565ca
; 0x564c5

MapGoldenrodDeptStore6FSignpost0Script: ; 0x564c5
	jumptext UnknownText_0x5661a
; 0x564c8

MapGoldenrodDeptStore6FSignpost1Script: ; 0x564c8
	jumpstd $0014
; 0x564cb

UnknownText_0x564cb: ; 0x564cb
	db $0, "A vending machine!", $4f
	db "Here's the menu.", $57
; 0x564ef

UnknownText_0x564ef: ; 0x564ef
	db $0, "Clang! A can of", $4f
	db "@"
	text_from_ram $d099
	db $0, $55
	db "popped out!", $57
; 0x56512

UnknownText_0x56512: ; 0x56512
	db $0, "Oops, not enough", $4f
	db "money.", $57
; 0x5652b

UnknownText_0x5652b: ; 0x5652b
	db $0, "There's no more", $4f
	db "room for stuff.", $57
; 0x5654b

UnknownText_0x5654b: ; 0x5654b
	db $0, "Do you listen to", $4f
	db "LUCKY CHANNEL?", $51
	db "If you want to", $4f
	db "win, trade #MON", $51
	db "with as many peo-", $4f
	db "ple as possible to", $51
	db "get different ID", $4f
	db "numbers.", $57
; 0x565ca

UnknownText_0x565ca: ; 0x565ca
	db $0, "If you're tired,", $4f
	db "try the vending", $55
	db "machine's drinks.", $51
	db "Your #MON will", $4f
	db "love them too.", $57
; 0x5661a

UnknownText_0x5661a: ; 0x5661a
	db $0, "Take a Break from", $4f
	db "Shopping!", $51
	db "6F TRANQUIL SQUARE", $57
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
	person_event $28, 6, 14, $5, $1, 255, 255, $a0, 0, UnknownScript_0x564bf, $ffff
	person_event $2b, 6, 12, $7, $0, 255, 255, $80, 0, UnknownScript_0x564c2, $ffff
; 0x56697

