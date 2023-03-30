	object_const_def
	const SALTBREEZEPOKEMONCENTER_NURSE

SaltbreezePokemonCenter_MapScripts:
	def_scene_scripts

	def_callbacks

SaltbreezePokemonCenterNurseScript:
	jumpstd PokecenterNurseScript

SaltbreezePokemonCenter_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11,  9, SALTBREEZE_TOWN, 2
	warp_event 12,  9, SALTBREEZE_TOWN, 2
 
	def_coord_events

	def_bg_events

	def_object_events
	object_event  11,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaltbreezePokemonCenterNurseScript, -1
