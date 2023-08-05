	object_const_def

SunglowTrail_MapScripts:
	def_scene_scripts

	def_callbacks
PicnicSign: ; [BG-1]
	jumptext PicnicSignText

PicnicSignText: ; [BG-1]
	text "Sunglow Trail"
	line "Picnic Area"
	para "Please do not feed"
	line "the Deerling."
	done

SunglowTrail_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  32,  19, SUNGLOW_CAVE_1F, 1

	def_coord_events

	def_bg_events
	bg_event 14, 34, BGEVENT_READ, PicnicSign ; [BG-1]

	def_object_events