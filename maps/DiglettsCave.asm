const_value set 2
	const DIGLETTSCAVE_POKEFAN_M

DiglettsCave_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

DiglettsCavePokefanMScript:
	jumptextfaceplayer DiglettsCavePokefanMText

DiglettsCaveHiddenMaxRevive:
	hiddenitem EVENT_DIGLETTS_CAVE_HIDDEN_MAX_REVIVE, MAX_REVIVE

DiglettsCavePokefanMText:
	text "A bunch of DIGLETT"
	line "popped out of the"

	para "ground! That was"
	line "shocking."
	done

DiglettsCave_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 6
	warp_def 3, 33, 10, VERMILION_CITY
	warp_def 5, 31, 5, DIGLETTS_CAVE
	warp_def 15, 5, 5, ROUTE_2
	warp_def 17, 3, 6, DIGLETTS_CAVE
	warp_def 17, 33, 2, DIGLETTS_CAVE
	warp_def 3, 3, 4, DIGLETTS_CAVE

.CoordEvents:
	db 0

.BGEvents:
	db 1
	bg_event 6, 11, BGEVENT_ITEM, DiglettsCaveHiddenMaxRevive

.ObjectEvents:
	db 1
	object_event 3, 31, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DiglettsCavePokefanMScript, -1
