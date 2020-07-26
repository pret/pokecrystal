	object_const_def
	const OLIVINEPUNISHMENTSPEECHHOUSE_POKEFAN_M
	const OLIVINEPUNISHMENTSPEECHHOUSE_LASS

OlivinePunishmentSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

OlivinePunishmentSpeechHouseDad:
	jumptextfaceplayer OlivinePunishmentSpeechHouseDadText

OlivinePunishmentSpeechHouseDaughter:
	jumptextfaceplayer OlivinePunishmentSpeechHouseDaughterText

OlivinePunishmentSpeechHouseBookshelf2:
	jumpstd PictureBookshelfScript

OlivinePunishmentSpeechHouseBookshelf1:
	jumpstd MagazineBookshelfScript

OlivinePunishmentSpeechHouseDadText:
	text "Along the way to"
	line "CIANWOOD, there"

	para "are four deserted"
	line "islands."

	para "Bad kids are taken"
	line "to the islands as"
	cont "punishment!"
	done

OlivinePunishmentSpeechHouseDaughterText:
	text "Whenever I get in"
	line "trouble, Daddy"
	cont "always scares me."
	done

OlivinePunishmentSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, OLIVINE_CITY, 5
	warp_event  3,  7, OLIVINE_CITY, 5

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, OlivinePunishmentSpeechHouseBookshelf1
	bg_event  1,  1, BGEVENT_READ, OlivinePunishmentSpeechHouseBookshelf2

	def_object_events
	object_event  1,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePunishmentSpeechHouseDad, -1
	object_event  5,  5, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePunishmentSpeechHouseDaughter, -1
