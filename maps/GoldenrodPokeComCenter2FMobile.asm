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
	text "#COM CENTER and"
	line "MOBILE CENTER were"

	para "built to satisfy"
	line "demands for trades"

	para "and battles with"
	line "trainers far away"

	para "and with total"
	line "strangers."
	done
; 0x626f9

UnknownText_0x626f9: ; 0x626f9
	text "When you linked"
	line "with someone by"

	para "mobile phone for"
	line "the first time,"

	para "weren't you"
	line "impressed?"

	para "When my first try"
	line "worked, I was so"

	para "impressed that I"
	line "got the shakes!"
	done
; 0x62795

UnknownText_0x62795: ; 0x62795
	text "They were able to"
	line "build this huge"

	para "facility thanks to"
	line "advances in wire-"
	cont "less technology."
	done
; 0x627ee

UnknownText_0x627ee: ; 0x627ee
	text "It's a notice"
	line "about where MOBILE"

	para "ADAPTERS are to be"
	line "used…"
	done
; 0x62828

UnknownText_0x62828: ; 0x62828
	text "There's a #COM"
	line "CLUB upstairs in"

	para "any #MON"
	line "CENTER."

	para "There, you can"
	line "battle or trade"

	para "with a friend far"
	line "away by using a"
	cont "MOBILE ADAPTER."

	para "To link up, your"
	line "friend must have"

	para "the same kind of"
	line "MOBILE ADAPTER as"
	cont "you."
	done
; 0x628f4

UnknownText_0x628f4: ; 0x628f4
	text "To use the TRADE"
	line "CORNER or read the"

	para "#MON NEWS, you"
	line "need to phone the"
	cont "MOBILE CENTER."

	para "You must register"
	line "at the MOBILE"

	para "CENTER before"
	line "connecting there."
	done
; 0x62989

UnknownText_0x62989: ; 0x62989
	text "It's a notice"
	line "about using the"
	cont "phone…"
	done
; 0x629ae

UnknownText_0x629ae: ; 0x629ae
	text "Please ensure that"
	line "your phone and"

	para "MOBILE ADAPTER are"
	line "properly linked."

	para "Please make sure"
	line "the wireless phone"
	cont "signal is strong."

	para "Don't touch or"
	line "hang up the phone"
	cont "while linking."
	done
; 0x62a5a

UnknownText_0x62a5a: ; 0x62a5a
	text "If the server is"
	line "busy, it may not"

	para "be possible to log"
	line "on."

	para "If so, please call"
	line "back later."

	para "If you are unable"
	line "to log on or don't"

	para "understand the"
	line "error messages,"

	para "call a support"
	line "center or read the"
	cont "instructions."
	done
; 0x62b26

UnknownText_0x62b26: ; 0x62b26
	text "The ADMINISTRATION"
	line "OFFICE received an"
	cont "e-mail. It says…"

	para $56, " ", $56, " ", $56

	para "To the #COM"
	line "CENTER staff…"

	para "Wireless communi-"
	line "cation has enabled"

	para "#MON trainers"
	line "to interact across"

	para "the nation. Let's"
	line "keep working for"

	para "the day when all"
	line "the trainers in"

	para "the world can link"
	line "without barriers!"

	para $56, " ", $56, " ", $56
	done
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

