OlivineCafe_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

SailorScript_0x9c8c1:
	faceplayer
	loadfont
	checkevent EVENT_GOT_HM04_STRENGTH
	iftrue UnknownScript_0x9c8d3
	writetext UnknownText_0x9c8df
	keeptextopen
	verbosegiveitem HM_STRENGTH, 1
	setevent EVENT_GOT_HM04_STRENGTH
UnknownScript_0x9c8d3:
	writetext UnknownText_0x9c965
	closetext
	loadmovesprites
	end

FishingGuruScript_0x9c8d9:
	jumptextfaceplayer UnknownText_0x9c9c5

SailorScript_0x9c8dc:
	jumptextfaceplayer UnknownText_0x9ca09

UnknownText_0x9c8df:
	text "Hah! Your #MON"
	line "sure look like"
	cont "lightweights!"

	para "They don't have"
	line "the power to move"
	cont "boulders aside."

	para "Here, use this"
	line "and teach them"
	cont "STRENGTH!"
	done

UnknownText_0x9c965:
	text "On the sea, the"
	line "only thing you can"

	para "count on is your"
	line "own good self!"

	para "I'm so proud of my"
	line "buff bod!"
	done

UnknownText_0x9c9c5:
	text "OLIVINE CAFE's"
	line "menu is chock full"

	para "of hearty fare for"
	line "beefy SAILORS!"
	done

UnknownText_0x9ca09:
	text "Whenever I roll"
	line "into this town, I"

	para "always visit the"
	line "OLIVINE CAFE."

	para "Everything on the"
	line "menu makes me feel"

	para "stronger. I can't"
	line "stop eating!"
	done

OlivineCafe_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 7, GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY
	warp_def $7, $3, 7, GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_SAILOR, 7, 8, OW_LEFT | $0, $0, -1, -1, $0, 0, SailorScript_0x9c8c1, -1
	person_event SPRITE_FISHING_GURU, 7, 11, OW_UP | $0, $10, -1, -1, $0, 0, FishingGuruScript_0x9c8d9, -1
	person_event SPRITE_SAILOR, 10, 10, OW_UP | $3, $0, -1, -1, $0, 0, SailorScript_0x9c8dc, -1
