const_value set 2
	const DIGLETTSCAVE_POKEFAN_M

DiglettsCave_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

PokefanMScript_0x74002:
	jumptextfaceplayer UnknownText_0x74008

DiglettsCaveHiddenMaxRevive:
	dwb EVENT_DIGLETTS_CAVE_HIDDEN_MAX_REVIVE, MAX_REVIVE


UnknownText_0x74008:
	text "A bunch of DIGLETT"
	line "popped out of the"

	para "ground! That was"
	line "shocking."
	done

DiglettsCave_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 6
	warp_def $21, $3, 10, VERMILION_CITY
	warp_def $1f, $5, 5, DIGLETTS_CAVE
	warp_def $5, $f, 5, ROUTE_2
	warp_def $3, $11, 6, DIGLETTS_CAVE
	warp_def $21, $11, 2, DIGLETTS_CAVE
	warp_def $3, $3, 4, DIGLETTS_CAVE

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 11, 6, SIGNPOST_ITEM, DiglettsCaveHiddenMaxRevive

.PersonEvents:
	db 1
	person_event SPRITE_POKEFAN_M, 31, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PokefanMScript_0x74002, -1
