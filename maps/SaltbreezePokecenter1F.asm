	object_const_def
	const SALTBREEZEPOKECENTER1F_NURSE

SaltbreezePokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

SaltbreezePokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

SaltbreezePokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, SALTBREEZE_TOWN, 2
	warp_event  4,  7, SALTBREEZE_TOWN, 2
 
	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaltbreezePokecenter1FNurseScript, -1
