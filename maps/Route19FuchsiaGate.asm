const_value set 2
	const ROUTE19FUCHSIAGATE_OFFICER

Route19FuchsiaGate_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

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

Route19FuchsiaGate_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $0, $4, 10, FUCHSIA_CITY
	warp_def $0, $5, 11, FUCHSIA_CITY
	warp_def $7, $4, 1, ROUTE_19
	warp_def $7, $5, 1, ROUTE_19

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_OFFICER, 4, 0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, OfficerScript_0x1ab3f6, -1
