	object_const_def
	const SILVERCAVEITEMROOMS_POKE_BALL1
	const SILVERCAVEITEMROOMS_POKE_BALL2
	const SILVERCAVEITEMROOMS_MEW

SilverCaveItemRooms_MapScripts:
	def_scene_scripts

	def_callbacks

SilverCaveItemRoomsMaxRevive:
	itemball MAX_REVIVE

SilverCaveItemRoomsFullRestore:
	itemball FULL_RESTORE
	
SilverCaveItemRoomsMew:
    faceplayer
	opentext
	writetext MewText
	cry MEW
	pause 15
	closetext
	setevent EVENT_FOUGHT_MEW
	loadvar VAR_BATTLETYPE, BATTLETYPE_SUICUNE
	loadwildmon MEW, 95
	startbattle
	disappear SILVERCAVEITEMROOMS_MEW
	reloadmapafterbattle
	end
	
MewText: 
    text "Myuu…"
	done 

SilverCaveItemRooms_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13,  3, SILVER_CAVE_ROOM_2, 3
	warp_event  7, 15, SILVER_CAVE_ROOM_2, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveItemRoomsMaxRevive, EVENT_SILVER_CAVE_ITEM_ROOMS_MAX_REVIVE
	object_event 15, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveItemRoomsFullRestore, EVENT_SILVER_CAVE_ITEM_ROOMS_FULL_RESTORE
	object_event  5,  8, SPRITE_MEW, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SilverCaveItemRoomsMew, EVENT_SILVER_CAVE_ITEM_ROOMS_MEW
