DayCare_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks

	dbw 2, UnknownScript_0x62f7b

UnknownScript_0x62f7b:
	checkflag ENGINE_DAYCARE_MONS_ARE_COMPATIBLE
	iftrue UnknownScript_0x62f88
	clearevent EVENT_DAYCARE_MAN_IN_DAYCARE
	setevent EVENT_DAYCARE_MAN_ON_ROUTE_34
	return

UnknownScript_0x62f88:
	setevent EVENT_DAYCARE_MAN_IN_DAYCARE
	clearevent EVENT_DAYCARE_MAN_ON_ROUTE_34
	return

GrampsScript_0x62f8f:
	faceplayer
	loadfont
	checkevent EVENT_GOT_ODD_EGG
	iftrue UnknownScript_0x62fbd
	writetext UnknownText_0x630ce
	keeptextopen
	loadmovesprites
	checkcode VAR_PARTYCOUNT
	if_equal $6, UnknownScript_0x62fb6
	special Function117656
	loadfont
	writetext UnknownText_0x631ae
	playsound SFX_KEY_ITEM
	waitbutton
	writetext UnknownText_0x631c3
	closetext
	loadmovesprites
	setevent EVENT_GOT_ODD_EGG
	end

UnknownScript_0x62fb6:
	loadfont
	writetext UnknownText_0x63237
	closetext
	loadmovesprites
	end

UnknownScript_0x62fbd:
	special Special_DayCareMan
	closetext
	loadmovesprites
	end

GrannyScript_0x62fc3:
	faceplayer
	loadfont
	checkflag ENGINE_DAYCARE_MONS_ARE_COMPATIBLE
	iftrue UnknownScript_0x62fd1
	special Special_DayCareLady
	closetext
	loadmovesprites
	end

UnknownScript_0x62fd1:
	writetext UnknownText_0x62fda
	closetext
	loadmovesprites
	end

DayCareBookshelf:
	jumpstd difficultbookshelf

UnknownText_0x62fda:
	text "Gramps was looking"
	line "for you."
	done

UnknownText_0x62ff7:
	text "I'm the DAY-CARE"
	line "MAN."

	para "There's something"
	line "new in GOLDENROD"

	para "called the TRADE"
	line "CORNER."

	para "I was given an EGG"
	line "TICKET that can be"

	para "traded in for a"
	line "ODD EGG."

	para "But since we run a"
	line "DAY-CARE, we don't"

	para "need it. You may"
	line "as well have it."
	done

UnknownText_0x630ce:
	text "I'm the DAY-CARE"
	line "MAN."

	para "Do you know about"
	line "EGGS?"

	para "I was raising"
	line "#MON with my"
	cont "wife, you see."

	para "We were shocked to"
	line "find an EGG!"

	para "How incredible is"
	line "that?"

	para "Well, wouldn't you"
	line "like this EGG?"

	para "Then fine, this is"
	line "yours to keep!"
	done

UnknownText_0x631a1:
	text "Come again."
	done

UnknownText_0x631ae:
	text "<PLAYER> received"
	line "ODD EGG!"
	done

UnknownText_0x631c3:
	text "I found that when"
	line "I was caring for"

	para "someone's #MON"
	line "before."

	para "But the trainer"
	line "didn't want the"

	para "EGG, so I'd kept"
	line "it around."
	done

UnknownText_0x63237:
	text "You've no room for"
	line "this."
	done

DayCare_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $5, $0, 3, GROUP_ROUTE_34, MAP_ROUTE_34
	warp_def $6, $0, 4, GROUP_ROUTE_34, MAP_ROUTE_34
	warp_def $7, $2, 5, GROUP_ROUTE_34, MAP_ROUTE_34
	warp_def $7, $3, 5, GROUP_ROUTE_34, MAP_ROUTE_34

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 1, 0, SIGNPOST_READ, DayCareBookshelf
	signpost 1, 1, SIGNPOST_READ, DayCareBookshelf

.PersonEvents:
	db 2
	person_event SPRITE_GRAMPS, 7, 6, OW_LEFT | $1, $0, -1, -1, $0, 0, GrampsScript_0x62f8f, EVENT_DAYCARE_MAN_IN_DAYCARE
	person_event SPRITE_GRANNY, 7, 9, OW_LEFT | $0, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, GrannyScript_0x62fc3, -1
