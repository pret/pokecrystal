	object_const_def
	const ROUTE2NUGGETHOUSE_FISHER

Route2NuggetHouse_MapScripts:
	def_scene_scripts

	def_callbacks

Route2NuggetHouseFisherScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_NUGGET_FROM_GUY
	iftrue .GotNugget
	writetext Route2NuggetHouseFisherText
	promptbutton
	verbosegiveitem NUGGET
	iffalse .NoRoom
	setevent EVENT_GOT_NUGGET_FROM_GUY
.GotNugget:
	writetext Route2NuggetHouseFisherText_GotNugget
	waitbutton
.NoRoom:
	closetext
	end

Route2NuggetHouseBookshelf: ; unreferenced
	jumpstd DifficultBookshelfScript

Route2NuggetHouseFisherText:
	text "Hé! J'suis content"
	line "de te voir."

	para "Ca fait longtemps"
	line "qu'on ne m'a pas"
	cont "rendu visite."

	para "Et pour la peine,"
	line "je vais t'offrir"
	cont "un p'tit cadeau."
	done

Route2NuggetHouseFisherText_GotNugget:
	text "C'est une PEPITE."

	para "Tu verras, ça vaut"
	line "du pognon!"
	done

Route2NuggetHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_2, 1
	warp_event  3,  7, ROUTE_2, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route2NuggetHouseFisherScript, -1
