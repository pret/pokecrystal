FightingDojo_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

BlackBeltScript_0x189b61:
	jumptextfaceplayer UnknownText_0x189b6c

MapFightingDojoSignpost0Script:
	jumptext UnknownText_0x189bc0

MapFightingDojoSignpost1Script:
	jumptext UnknownText_0x189be0

ItemFragment_0x189b6a:
	db FOCUS_BAND, 1

UnknownText_0x189b6c:
	text "Hello!"

	para "KARATE KING, the"
	line "FIGHTING DOJO's"

	para "master, is in a"
	line "cave in JOHTO for"
	cont "training."
	done

UnknownText_0x189bc0:
	text "What goes around"
	line "comes around!"
	done

UnknownText_0x189be0:
	text "Enemies on every"
	line "side!"
	done

FightingDojo_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $b, $4, 1, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY
	warp_def $b, $5, 1, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 0, 4, $0, MapFightingDojoSignpost0Script
	signpost 0, 5, $0, MapFightingDojoSignpost1Script

	; people-events
	db 2
	person_event SPRITE_BLACK_BELT, 8, 8, $6, $0, 255, 255, $90, 0, BlackBeltScript_0x189b61, -1
	person_event SPRITE_POKE_BALL, 5, 7, $1, $0, 255, 255, $1, 0, ItemFragment_0x189b6a, EVENT_PICKED_UP_FOCUS_BAND
