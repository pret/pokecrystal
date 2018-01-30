const_value set 2
	const ROUTE7SAFFRONGATE_OFFICER

Route7SaffronGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OfficerScript_0x73518:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x73526
	writetext UnknownText_0x7352c
	waitbutton
	closetext
	end

UnknownScript_0x73526:
	writetext UnknownText_0x73592
	waitbutton
	closetext
	end

UnknownText_0x7352c:
	text "Did you hear about"
	line "the accident at"
	cont "the POWER PLANT?"

	para "It's located in"
	line "the East, close to"
	cont "LAVENDER TOWN."
	done

UnknownText_0x73592:
	text "I take my GUARD"
	line "job seriously."

	para "Hey! You have a"
	line "#DEX."

	para "OK. You can go"
	line "through."
	done

Route7SaffronGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 0, 4, 1, ROUTE_7
	warp_event 0, 5, 2, ROUTE_7
	warp_event 9, 4, 10, SAFFRON_CITY
	warp_event 9, 5, 11, SAFFRON_CITY

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 5, 2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OfficerScript_0x73518, -1
