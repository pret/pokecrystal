const_value set 2 ; person constants
	const POKECOMCENTERADMINROOMMOBILE_SCIENTIST1
	const POKECOMCENTERADMINROOMMOBILE_SCIENTIST2
	const POKECOMCENTERADMINROOMMOBILE_SCIENTIST3

PokecomCenterAdminRoomMobile_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PokecomCenterAdminRoomMobileScientist1Script:
	jumptextfaceplayer PokecomCenterAdminRoomMobileScientist1Text

PokecomCenterAdminRoomMobileScientist2Script:
	jumptextfaceplayer PokecomCenterAdminRoomMobileScientist2Text

PokecomCenterAdminRoomMobileScientist3Script:
	jumptextfaceplayer PokecomCenterAdminRoomMobileScientist3Text

PokecomCenterAdminRoomMobileSignpost0Script:
	opentext
	writetext UnknownText_0x627ee
	waitbutton
UnknownScript_0x625df:
	reloadmappart
	loadmenuheader MenuHeader_0x62602
	verticalmenu
	closewindow
	if_equal 1, UnknownScript_0x625f0
	if_equal 2, UnknownScript_0x625f8
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

MenuHeader_0x62602:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, 8
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "#　つうしん　クラブ@" ; # COM CLUB
	db "モバイルセンター@" ; MOBILE CENTER
	db "やめる@" ; QUIT

PokecomCenterAdminRoomMobileSignpost1Script:
	opentext
	writetext UnknownText_0x62989
	waitbutton
UnknownScript_0x62629:
	reloadmappart
	loadmenuheader MenuHeader_0x6264c
	verticalmenu
	closewindow
	if_equal 1, UnknownScript_0x6263a
	if_equal 2, UnknownScript_0x62642
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

MenuHeader_0x6264c:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, 8
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "でんわ<WO>つかうとき@" ; Use phone
	db "でんわ<GA>つながらないとき@" ; Don't use phone
	db "やめる@" ; QUIT

PokecomCenterAdminRoomMobileSignpost2Script:
	jumptext UnknownText_0x62b26

PokecomCenterAdminRoomMobileScientist1Text:
	text "#COM CENTER and"
	line "MOBILE CENTER were"

	para "built to satisfy"
	line "demands for trades"

	para "and battles with"
	line "trainers far away"

	para "and with total"
	line "strangers."
	done

PokecomCenterAdminRoomMobileScientist2Text:
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

PokecomCenterAdminRoomMobileScientist3Text:
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

	para "<……> <……> <……>"

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

	para "<……> <……> <……>"
	done

PokecomCenterAdminRoomMobile_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 0, 31, 3, GOLDENROD_POKECENTER_1F
	warp_event 1, 31, 3, GOLDENROD_POKECENTER_1F

	db 0 ; coord events

	db 3 ; bg events
	bg_event 6, 26, BGEVENT_UP, PokecomCenterAdminRoomMobileSignpost0Script
	bg_event 6, 28, BGEVENT_UP, PokecomCenterAdminRoomMobileSignpost1Script
	bg_event 3, 26, BGEVENT_UP, PokecomCenterAdminRoomMobileSignpost2Script

	db 3 ; object events
	object_event 4, 28, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PokecomCenterAdminRoomMobileScientist1Script, -1
	object_event 7, 27, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PokecomCenterAdminRoomMobileScientist2Script, -1
	object_event 7, 29, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PokecomCenterAdminRoomMobileScientist3Script, -1
