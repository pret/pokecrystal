GoldenrodPokeComCenter2FMobile_MapScriptHeader: ; 0x625cf
	; trigger count
	db 0

	; callback count
	db 0
; 0x625d1

ScientistScript_0x625d1: ; 0x625d1
	jumptextfaceplayer UnknownText_0x62674
; 0x625d4

ScientistScript_0x625d4: ; 0x625d4
	jumptextfaceplayer UnknownText_0x626f9
; 0x625d7

ScientistScript_0x625d7: ; 0x625d7
	jumptextfaceplayer UnknownText_0x62795
; 0x625da

MapGoldenrodPokeComCenter2FMobileSignpost0Script: ; 0x625da
	loadfont
	2writetext UnknownText_0x627ee
	closetext
UnknownScript_0x625df: ; 0x625df
	reloadmappart
	loadmenudata MenuDataHeader_0x62602
	interpretmenu2
	writebackup
	if_equal $1, UnknownScript_0x625f0
	if_equal $2, UnknownScript_0x625f8
	2jump UnknownScript_0x62600
; 0x625f0

UnknownScript_0x625f0: ; 0x625f0
	loadfont
	2writetext UnknownText_0x62828
	closetext
	2jump UnknownScript_0x625df
; 0x625f8

UnknownScript_0x625f8: ; 0x625f8
	loadfont
	2writetext UnknownText_0x628f4
	closetext
	2jump UnknownScript_0x625df
; 0x62600

UnknownScript_0x62600: ; 0x62600
	loadmovesprites
	end
; 0x62602


MenuDataHeader_0x62602: ; 0x62602
	db $40 ; flags
	db 00, 00 ; start coords
	db 08, 15 ; end coords
	dw MenuData2_0x6260a
	db 1 ; default option
; 0x6260a

MenuData2_0x6260a: ; 0x6260a
	db $80 ; flags
	db 3 ; items
	db "# つうしん クラブ@" ; # COM CLUB
	db "モバイルセンター@" ; MOBILE CENTER
	db "やめる@" ; QUIT
; 0x62624


MapGoldenrodPokeComCenter2FMobileSignpost1Script: ; 0x62624
	loadfont
	2writetext UnknownText_0x62989
	closetext
UnknownScript_0x62629: ; 0x62629
	reloadmappart
	loadmenudata $664c
	interpretmenu2
	writebackup
	if_equal $1, UnknownScript_0x6263a
	if_equal $2, UnknownScript_0x62642
	2jump UnknownScript_0x6264a
; 0x6263a

UnknownScript_0x6263a: ; 0x6263a
	loadfont
	2writetext UnknownText_0x629ae
	closetext
	2jump UnknownScript_0x62629
; 0x62642

UnknownScript_0x62642: ; 0x62642
	loadfont
	2writetext UnknownText_0x62a5a
	closetext
	2jump UnknownScript_0x62629
; 0x6264a

UnknownScript_0x6264a: ; 0x6264a
	loadmovesprites
	end
; 0x6264c


MenuDataHeader_0x6264c: ; 0x6264c
	db $40 ; flags
	db 00, 00 ; start coords
	db 08, 15 ; end coords
	dw MenuData2_0x62654
	db 1 ; default option
; 0x62654

MenuData2_0x62654: ; 0x62654
	db $80 ; flags
	db 3 ; items
	db "でんわ",$1f,"つかうとき@" ; Use phone
	db "でんわ",$4a,"つながらないとき@" ; Don't use phone
	db "やめる@" ; QUIT
; 0x62673


MapGoldenrodPokeComCenter2FMobileSignpost2Script: ; 0x62671
	jumptext UnknownText_0x62b26
; 0x62674

UnknownText_0x62674: ; 0x62674
	db $0, "#COM CENTER and", $4f
	db "MOBILE CENTER were", $51
	db "built to satisfy", $4f
	db "demands for trades", $51
	db "and battles with", $4f
	db "trainers far away", $51
	db "and with total", $4f
	db "strangers.", $57
; 0x626f9

UnknownText_0x626f9: ; 0x626f9
	db $0, "When you linked", $4f
	db "with someone by", $51
	db "mobile phone for", $4f
	db "the first time,", $51
	db "weren't you", $4f
	db "impressed?", $51
	db "When my first try", $4f
	db "worked, I was so", $51
	db "impressed that I", $4f
	db "got the shakes!", $57
; 0x62795

UnknownText_0x62795: ; 0x62795
	db $0, "They were able to", $4f
	db "build this huge", $51
	db "facility thanks to", $4f
	db "advances in wire-", $55
	db "less technology.", $57
; 0x627ee

UnknownText_0x627ee: ; 0x627ee
	db $0, "It's a notice", $4f
	db "about where MOBILE", $51
	db "ADAPTERS are to be", $4f
	db "used…", $57
; 0x62828

UnknownText_0x62828: ; 0x62828
	db $0, "There's a #COM", $4f
	db "CLUB upstairs in", $51
	db "any #MON", $4f
	db "CENTER.", $51
	db "There, you can", $4f
	db "battle or trade", $51
	db "with a friend far", $4f
	db "away by using a", $55
	db "MOBILE ADAPTER.", $51
	db "To link up, your", $4f
	db "friend must have", $51
	db "the same kind of", $4f
	db "MOBILE ADAPTER as", $55
	db "you.", $57
; 0x628f4

UnknownText_0x628f4: ; 0x628f4
	db $0, "To use the TRADE", $4f
	db "CORNER or read the", $51
	db "#MON NEWS, you", $4f
	db "need to phone the", $55
	db "MOBILE CENTER.", $51
	db "You must register", $4f
	db "at the MOBILE", $51
	db "CENTER before", $4f
	db "connecting there.", $57
; 0x62989

UnknownText_0x62989: ; 0x62989
	db $0, "It's a notice", $4f
	db "about using the", $55
	db "phone…", $57
; 0x629ae

UnknownText_0x629ae: ; 0x629ae
	db $0, "Please ensure that", $4f
	db "your phone and", $51
	db "MOBILE ADAPTER are", $4f
	db "properly linked.", $51
	db "Please make sure", $4f
	db "the wireless phone", $55
	db "signal is strong.", $51
	db "Don't touch or", $4f
	db "hang up the phone", $55
	db "while linking.", $57
; 0x62a5a

UnknownText_0x62a5a: ; 0x62a5a
	db $0, "If the server is", $4f
	db "busy, it may not", $51
	db "be possible to log", $4f
	db "on.", $51
	db "If so, please call", $4f
	db "back later.", $51
	db "If you are unable", $4f
	db "to log on or don't", $51
	db "understand the", $4f
	db "error messages,", $51
	db "call a support", $4f
	db "center or read the", $55
	db "instructions.", $57
; 0x62b26

UnknownText_0x62b26: ; 0x62b26
	db $0, "The ADMINISTRATION", $4f
	db "OFFICE received an", $55
	db "e-mail. It says…", $51
	db $56, " ", $56, " ", $56, $51
	db "To the #COM", $4f
	db "CENTER staff…", $51
	db "Wireless communi-", $4f
	db "cation has enabled", $51
	db "#MON trainers", $4f
	db "to interact across", $51
	db "the nation. Let's", $4f
	db "keep working for", $51
	db "the day when all", $4f
	db "the trainers in", $51
	db "the world can link", $4f
	db "without barriers!", $51
	db $56, " ", $56, " ", $56, $57
; 0x62c32

GoldenrodPokeComCenter2FMobile_MapEventHeader: ; 0x62c32
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $1f, $0, 3, GROUP_GOLDENROD_POKECENTER_1F, MAP_GOLDENROD_POKECENTER_1F
	warp_def $1f, $1, 3, GROUP_GOLDENROD_POKECENTER_1F, MAP_GOLDENROD_POKECENTER_1F

	; xy triggers
	db 0

	; signposts
	db 3
	signpost 26, 6, $1, MapGoldenrodPokeComCenter2FMobileSignpost0Script
	signpost 28, 6, $1, MapGoldenrodPokeComCenter2FMobileSignpost1Script
	signpost 26, 3, $1, MapGoldenrodPokeComCenter2FMobileSignpost2Script

	; people-events
	db 3
	person_event SPRITE_SCIENTIST, 32, 8, $4, $10, 255, 255, $80, 0, ScientistScript_0x625d1, $ffff
	person_event SPRITE_SCIENTIST, 31, 11, $7, $0, 255, 255, $90, 0, ScientistScript_0x625d4, $ffff
	person_event SPRITE_SCIENTIST, 33, 11, $7, $0, 255, 255, $a0, 0, ScientistScript_0x625d7, $ffff
; 0x62c78

