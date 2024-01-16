	object_const_def
	const ICEPATHB3F_POKE_BALL
	const ICEPATHB3F_ROCK
	const ICEPATHB3F_ARTICUNO

IcePathB3F_MapScripts:
	def_scene_scripts

	def_callbacks

IcePathB3FNevermeltice:
	itemball NEVERMELTICE

IcePathB3FRock:
	jumpstd SmashRockScript
	
IcePathB3FArticuno:
    faceplayer
	opentext
	writetext ArticunoText
	cry ARTICUNO
	pause 15
	closetext
	setevent EVENT_FOUGHT_ARTICUNO
	loadvar VAR_BATTLETYPE, BATTLETYPE_SUICUNE
	loadwildmon ARTICUNO, 55
	startbattle
	disappear ICEPATHB3F_ARTICUNO
	reloadmapafterbattle
	end

ArticunoText:
    text "Gyaoo!"
	done

IcePathB3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  5, ICE_PATH_B2F_MAHOGANY_SIDE, 2
	warp_event 15,  5, ICE_PATH_B2F_BLACKTHORN_SIDE, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePathB3FNevermeltice, EVENT_ICE_PATH_B3F_NEVERMELTICE
	object_event  6,  6, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePathB3FRock, -1
	object_event  7, 12, SPRITE_ARTICUNO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, IcePathB3FArticuno, EVENT_ICE_PATH_3BF_ARTICUNO
