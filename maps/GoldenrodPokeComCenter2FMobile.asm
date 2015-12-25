const_value set 2
	const GOLDENRODPOKECOMCENTER2FMOBILE_SCIENTIST1
	const GOLDENRODPOKECOMCENTER2FMOBILE_SCIENTIST2
	const GOLDENRODPOKECOMCENTER2FMOBILE_SCIENTIST3

GoldenrodPokeComCenter2FMobile_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ScientistScript_0x625d1:
	jumptextfaceplayer UnknownText_0x62674

ScientistScript_0x625d4:
	jumptextfaceplayer UnknownText_0x626f9

ScientistScript_0x625d7:
	jumptextfaceplayer UnknownText_0x62795

MapGoldenrodPokeComCenter2FMobileSignpost0Script:
	opentext
	writetext UnknownText_0x627ee
	waitbutton
UnknownScript_0x625df:
	reloadmappart
	loadmenudata MenuDataHeader_0x62602
	verticalmenu
	closewindow
	if_equal $1, UnknownScript_0x625f0
	if_equal $2, UnknownScript_0x625f8
	jump UnknownScript_0x62600

UnknownScript_0x625f0:
	opentext
	writetext UnknownText_0x62828
	waitbutton
	jump UnknownScript_0x625df

UnknownScript_0x625f8:
	opentext
	writetext UnknownText_0x628f4
	waitbutton
	jump UnknownScript_0x625df

UnknownScript_0x62600:
	closetext
	end


MenuDataHeader_0x62602:
	db $40 ; flags
	db 00, 00 ; start coords
	db 08, 15 ; end coords
	dw MenuData2_0x6260a
	db 1 ; default option

MenuData2_0x6260a:
	db $80 ; flags
	db 3 ; items
	db "# つうしん クラブ@" ; # COM CLUB
	db "モバイルセンター@" ; MOBILE CENTER
	db "やめる@" ; QUIT


MapGoldenrodPokeComCenter2FMobileSignpost1Script:
	opentext
	writetext UnknownText_0x62989
	waitbutton
UnknownScript_0x62629:
	reloadmappart
	loadmenudata MenuDataHeader_0x6264c
	verticalmenu
	closewindow
	if_equal $1, UnknownScript_0x6263a
	if_equal $2, UnknownScript_0x62642
	jump UnknownScript_0x6264a

UnknownScript_0x6263a:
	opentext
	writetext UnknownText_0x629ae
	waitbutton
	jump UnknownScript_0x62629

UnknownScript_0x62642:
	opentext
	writetext UnknownText_0x62a5a
	waitbutton
	jump UnknownScript_0x62629

UnknownScript_0x6264a:
	closetext
	end


MenuDataHeader_0x6264c:
	db $40 ; flags
	db 00, 00 ; start coords
	db 08, 15 ; end coords
	dw MenuData2_0x62654
	db 1 ; default option

MenuData2_0x62654:
	db $80 ; flags
	db 3 ; items
	db "でんわ", $1f,"つかうとき@" ; Use phone
	db "でんわ", $4a,"つながらないとき@" ; Don't use phone
	db "やめる@" ; QUIT


MapGoldenrodPokeComCenter2FMobileSignpost2Script:
	jumptext UnknownText_0x62b26

UnknownText_0x62674:
	text "#COM CENTER and"
	line "MOBILE CENTER were"

	para "built to satisfy"
	line "demands for trades"

	para "and battles with"
	line "trainers far away"

	para "and with total"
	line "strangers."
	done

UnknownText_0x626f9:
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

UnknownText_0x62795:
	text "They were able to"
	line "build this huge"

	para "facility thanks to"
	line "advances in wire-"
	cont "less technology."
	done

UnknownText_0x627ee:
	text "It's a notice"
	line "about where MOBILE"

	para "ADAPTERS are to be"
	line "used…"
	done

UnknownText_0x62828:
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

UnknownText_0x628f4:
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

UnknownText_0x62989:
	text "It's a notice"
	line "about using the"
	cont "phone…"
	done

UnknownText_0x629ae:
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

UnknownText_0x62a5a:
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

UnknownText_0x62b26:
	text "The ADMINISTRATION"
	line "OFFICE received an"
	cont "e-mail. It says…"

	para "<......> <......> <......>"

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

	para "<......> <......> <......>"
	done

GoldenrodPokeComCenter2FMobile_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $1f, $0, 3, GOLDENROD_POKECENTER_1F
	warp_def $1f, $1, 3, GOLDENROD_POKECENTER_1F

.XYTriggers:
	db 0

.Signposts:
	db 3
	signpost 26, 6, SIGNPOST_UP, MapGoldenrodPokeComCenter2FMobileSignpost0Script
	signpost 28, 6, SIGNPOST_UP, MapGoldenrodPokeComCenter2FMobileSignpost1Script
	signpost 26, 3, SIGNPOST_UP, MapGoldenrodPokeComCenter2FMobileSignpost2Script

.PersonEvents:
	db 3
	person_event SPRITE_SCIENTIST, 28, 4, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ScientistScript_0x625d1, -1
	person_event SPRITE_SCIENTIST, 27, 7, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ScientistScript_0x625d4, -1
	person_event SPRITE_SCIENTIST, 29, 7, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ScientistScript_0x625d7, -1
