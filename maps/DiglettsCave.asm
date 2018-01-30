const_value set 2
	const DIGLETTSCAVE_POKEFAN_M

DiglettsCave_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DiglettsCavePokefanMScript:
	jumptextfaceplayer DiglettsCavePokefanMText

DiglettsCaveHiddenMaxRevive:
	hiddenitem MAX_REVIVE, EVENT_DIGLETTS_CAVE_HIDDEN_MAX_REVIVE

DiglettsCavePokefanMText:
	text "A bunch of DIGLETT"
	line "popped out of the"

	para "ground! That was"
	line "shocking."
	done

DiglettsCave_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event 3, 33, 10, VERMILION_CITY
	warp_event 5, 31, 5, DIGLETTS_CAVE
	warp_event 15, 5, 5, ROUTE_2
	warp_event 17, 3, 6, DIGLETTS_CAVE
	warp_event 17, 33, 2, DIGLETTS_CAVE
	warp_event 3, 3, 4, DIGLETTS_CAVE

	db 0 ; coord events

	db 1 ; bg events
	bg_event 6, 11, BGEVENT_ITEM, DiglettsCaveHiddenMaxRevive

	db 1 ; object events
	object_event 3, 31, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DiglettsCavePokefanMScript, -1
