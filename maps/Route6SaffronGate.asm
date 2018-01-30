const_value set 2
	const ROUTE6SAFFRONGATE_OFFICER

Route6SaffronGate_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
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

Route6SaffronGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 4, 0, 12, SAFFRON_CITY
	warp_event 5, 0, 13, SAFFRON_CITY
	warp_event 4, 7, 2, ROUTE_6
	warp_event 5, 7, 2, ROUTE_6

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 0, 4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OfficerScript_0x1926ea, -1
