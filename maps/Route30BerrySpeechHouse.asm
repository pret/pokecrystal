const_value set 2
	const ROUTE30BERRYSPEECHHOUSE_POKEFAN_M

Route30BerrySpeechHouse_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

Route30BerrySpeechPokefanM:
	faceplayer
	opentext
	checkevent EVENT_GOT_BERRY_FROM_ROUTE_30_HOUSE
	iftrue .GotBerry
	writetext Route30BerrySpeechHouseMonEatBerriesText
	buttonsound
	verbosegiveitem BERRY
	iffalse .NoRoom
	setevent EVENT_GOT_BERRY_FROM_ROUTE_30_HOUSE
.GotBerry:
	writetext Route30BerrySpeechHouseCheckTreesText
	waitbutton
.NoRoom:
	closetext
	end

Route30BerrySpeechHouseBookshelf:
	jumpstd magazinebookshelf

Route30BerrySpeechHouseMonEatBerriesText:
	text "You know, #MON"
	line "eat BERRIES."

	para "Well, my #MON"
	line "got healthier by"
	cont "eating a BERRY."

	para "Here. I'll share"
	line "one with you!"
	done

Route30BerrySpeechHouseCheckTreesText:
	text "Check trees for"
	line "BERRIES. They just"
	cont "drop right off."
	done

Route30BerrySpeechHouse_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def 2, 7, 1, ROUTE_30
	warp_def 3, 7, 1, ROUTE_30

.CoordEvents:
	db 0

.BGEvents:
	db 2
	bg_event 0, 1, BGEVENT_READ, Route30BerrySpeechHouseBookshelf
	bg_event 1, 1, BGEVENT_READ, Route30BerrySpeechHouseBookshelf

.ObjectEvents:
	db 1
	object_event 2, 3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route30BerrySpeechPokefanM, -1
