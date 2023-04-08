	object_const_def
	const SALTBREEZEPOKEMONCENTER_NURSE ; [E-1]
	const SALTBREEZEPOKEMONCENTER_MOVE_REMINDER ; [E-2]

SaltbreezePokemonCenter_MapScripts:
	def_scene_scripts

	def_callbacks

SaltbreezePokemonCenterNurseScript: ; [E-1]
	jumpstd PokecenterNurseScript

SaltbreezePokemonCenterMoveReminder: ; [E-2]
	faceplayer
	loadfont
	special MoveReminder
	waitbutton
	closetext
	end

SaltbreezePokemonCenterMoveDeleter:
	faceplayer
	opentext
	special MoveDeletion
	waitbutton
	closetext
	end

SaltbreezePokemonCenter_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11,  9, SALTBREEZE_TOWN, 2
	warp_event 12,  9, SALTBREEZE_TOWN, 2
 
	def_coord_events

	def_bg_events

	def_object_events
	object_event  11, 1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaltbreezePokemonCenterNurseScript, -1 ; [E-1]
	object_event 18,  8, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaltbreezePokemonCenterMoveReminder, -1 ; [E-2]
	object_event 19,  8, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaltbreezePokemonCenterMoveDeleter, -1 ; [E-3]
