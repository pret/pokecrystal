	object_const_def
	const ROUTE15FUCHSIAGATE_OFFICER

Route15FuchsiaGate_MapScripts:
	def_scene_scripts

	def_callbacks

Route15FuchsiaGateOfficerScript:
	jumptextfaceplayer Route15FuchsiaGateOfficerText

Route15FuchsiaGateOfficerText:
	text "You're working on"
	line "a #DEX? That's"

	para "really something."
	line "Don't give up!"
	done

Route15FuchsiaGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  4, FUCHSIA_CITY, 8
	warp_event  0,  5, FUCHSIA_CITY, 9
	warp_event  9,  4, ROUTE_15, 1
	warp_event  9,  5, ROUTE_15, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route15FuchsiaGateOfficerScript, -1
