Route12SuperRodHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

FishingGuruScript_0x7f484:
	faceplayer
	loadfont
	checkevent EVENT_GOT_SUPER_ROD
	iftrue UnknownScript_0x7f4a0
	writetext UnknownText_0x7f4af
	yesorno
	iffalse UnknownScript_0x7f4a6
	writetext UnknownText_0x7f52f
	keeptextopen
	verbosegiveitem SUPER_ROD, 1
	iffalse UnknownScript_0x7f4aa
	setevent EVENT_GOT_SUPER_ROD
UnknownScript_0x7f4a0:
	writetext UnknownText_0x7f57c
	closetext
	loadmovesprites
	end

UnknownScript_0x7f4a6:
	writetext UnknownText_0x7f5ec
	closetext
UnknownScript_0x7f4aa:
	loadmovesprites
	end

SuperRodHouseBookshelf:
; unused
	jumpstd picturebookshelf

UnknownText_0x7f4af:
	text "I'm the FISHING"
	line "GURU's younger"
	cont "brother."

	para "I can see that you"
	line "like fishing."

	para "There's no doubt"
	line "in my mind at all!"

	para "So? I know I'm"
	line "right."
	done

UnknownText_0x7f52f:
	text "Yes, yes. Just as"
	line "I thought!"

	para "Here, fishing fan!"
	line "Take this--it's a"
	cont "SUPER ROD."
	done

UnknownText_0x7f57c:
	text "Try your hand at"
	line "fishing wherever"
	cont "there is water."

	para "Remember--you can"
	line "catch different"

	para "#MON using"
	line "different RODS."
	done

UnknownText_0x7f5ec:
	text "Huh? My own eyes"
	line "deceived me?"
	done

Route12SuperRodHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 1, GROUP_ROUTE_12, MAP_ROUTE_12
	warp_def $7, $3, 1, GROUP_ROUTE_12, MAP_ROUTE_12

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_FISHING_GURU, 7, 9, OW_UP | $2, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, FishingGuruScript_0x7f484, -1
