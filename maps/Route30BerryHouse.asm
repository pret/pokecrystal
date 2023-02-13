	object_const_def
	const ROUTE30BERRYHOUSE_POKEFAN_M

Route30BerryHouse_MapScripts:
	def_scene_scripts

	def_callbacks

Route30BerryHousePokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BERRY_FROM_ROUTE_30_HOUSE
	iftrue .GotBerry
	writetext Route30BerrySpeechHouseMonEatBerriesText
	promptbutton
	verbosegiveitem BERRY
	iffalse .NoRoom
	setevent EVENT_GOT_BERRY_FROM_ROUTE_30_HOUSE
.GotBerry:
	writetext Route30BerrySpeechHouseCheckTreesText
	waitbutton
.NoRoom:
	closetext
	end

Route30BerryHouseBookshelf:
	jumpstd MagazineBookshelfScript

Route30BerrySpeechHouseMonEatBerriesText:
	text "Tu sais, les #-"
	line "MON mangent des"
	cont "BAIES."

	para "Eh ben mes #MON"
	line "se sont soignés en"
	cont "mangeant une BAIE."

	para "Tiens! Je t'en"
	line "donne une!"
	done

Route30BerrySpeechHouseCheckTreesText:
	text "Regarde dans les"
	line "arbres pour des"
	cont "BAIES."
	done

Route30BerryHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_30, 1
	warp_event  3,  7, ROUTE_30, 1

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, Route30BerryHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, Route30BerryHouseBookshelf

	def_object_events
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route30BerryHousePokefanMScript, -1
