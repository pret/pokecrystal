Route19FuchsiaGate_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

OfficerScript_0x1ab3f6:
	faceplayer
	loadfont
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .RocksCleared
	writetext UnknownText_0x1ab40a
	closetext
	loadmovesprites
	end

.RocksCleared
	writetext UnknownText_0x1ab48a
	closetext
	loadmovesprites
	end

UnknownText_0x1ab40a:
	text "CINNABAR's volcano"
	line "erupted."

	para "It hurled boulders"
	line "that cut off ROUTE"
	cont "19 indefinitely."

	para "I wonder if the"
	line "people of CINNABAR"
	cont "are safe…"
	done

UnknownText_0x1ab48a:
	text "No CINNABAR citi-"
	line "zens were injured"

	para "by the eruption."
	line "That's great!"
	done

Route19FuchsiaGate_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $0, $4, 10, GROUP_FUCHSIA_CITY, MAP_FUCHSIA_CITY
	warp_def $0, $5, 11, GROUP_FUCHSIA_CITY, MAP_FUCHSIA_CITY
	warp_def $7, $4, 1, GROUP_ROUTE_19, MAP_ROUTE_19
	warp_def $7, $5, 1, GROUP_ROUTE_19, MAP_ROUTE_19

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_OFFICER, 8, 4, $9, $0, 255, 255, $90, 0, OfficerScript_0x1ab3f6, $ffff
