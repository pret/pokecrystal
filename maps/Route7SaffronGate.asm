Route7SaffronGate_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

OfficerScript_0x73518:
	faceplayer
	loadfont
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x73526
	writetext UnknownText_0x7352c
	closetext
	loadmovesprites
	end

UnknownScript_0x73526:
	writetext UnknownText_0x73592
	closetext
	loadmovesprites
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

Route7SaffronGate_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $4, $0, 1, GROUP_ROUTE_7, MAP_ROUTE_7
	warp_def $5, $0, 2, GROUP_ROUTE_7, MAP_ROUTE_7
	warp_def $4, $9, 10, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY
	warp_def $5, $9, 11, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_OFFICER, 6, 9, OW_UP | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, OfficerScript_0x73518, -1
