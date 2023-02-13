	object_const_def
	const VIOLETKYLESHOUSE_POKEFAN_M
	const VIOLETKYLESHOUSE_KYLE

VioletKylesHouse_MapScripts:
	def_scene_scripts

	def_callbacks

VioletKylesHousePokefanMScript:
	jumptextfaceplayer VioletKylesHousePokefanMText

Kyle:
	faceplayer
	opentext
	trade NPC_TRADE_KYLE
	waitbutton
	closetext
	end

VioletKylesHousePokefanMText:
	text "Un #MON échangé"
	line "grandit plus vite"
	cont "qu'un #MON"
	cont "attrapé."

	para "Mais si tu n'as"
	line "pas le bon BADGE,"

	para "il est possible"
	line "qu'il ne t'obé-"
	cont "isse pas."
	done

VioletKylesHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, VIOLET_CITY, 6
	warp_event  4,  7, VIOLET_CITY, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletKylesHousePokefanMScript, -1
	object_event  6,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Kyle, -1
