const_value set 2
	const ROUTE6SAFFRONGATE_OFFICER

Route6SaffronGate_MapScriptHeader:
.MapTriggers:
	db 1

	; triggers
	dw UnknownScript_0x1926e9, 0

.MapCallbacks:
	db 0

UnknownScript_0x1926e9:
	end

OfficerScript_0x1926ea:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x1926f8
	writetext UnknownText_0x1926fe
	waitbutton
	closetext
	end

UnknownScript_0x1926f8:
	writetext UnknownText_0x1927cb
	waitbutton
	closetext
	end

UnknownText_0x1926fe:
	text "Welcome to SAFFRON"
	line "CITY, home of the"
	cont "MAGNET TRAIN!"

	para "…That's what I'd"
	line "normally say, but"

	para "the MAGNET TRAIN"
	line "isn't running now."

	para "It's not getting"
	line "any electricity"

	para "because there's"
	line "something wrong"

	para "with the POWER"
	line "PLANT."
	done

UnknownText_0x1927cb:
	text "The MAGNET TRAIN"
	line "is the most famous"

	para "thing about SAF-"
	line "FRON."
	done

Route6SaffronGate_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $0, $4, 12, SAFFRON_CITY
	warp_def $0, $5, 13, SAFFRON_CITY
	warp_def $7, $4, 2, ROUTE_6
	warp_def $7, $5, 2, ROUTE_6

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_OFFICER, 4, 0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, OfficerScript_0x1926ea, -1
