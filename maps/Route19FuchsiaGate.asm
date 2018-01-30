const_value set 2
	const ROUTE19FUCHSIAGATE_OFFICER

Route19FuchsiaGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OfficerScript_0x1ab3f6:
	faceplayer
	opentext
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .RocksCleared
	writetext UnknownText_0x1ab40a
	waitbutton
	closetext
	end

.RocksCleared:
	writetext UnknownText_0x1ab48a
	waitbutton
	closetext
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

Route19FuchsiaGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 4, 0, 10, FUCHSIA_CITY
	warp_event 5, 0, 11, FUCHSIA_CITY
	warp_event 4, 7, 1, ROUTE_19
	warp_event 5, 7, 1, ROUTE_19

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 0, 4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OfficerScript_0x1ab3f6, -1
