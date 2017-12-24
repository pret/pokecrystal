const_value set 2
	const OLIVINEPUNISHMENTSPEECHHOUSE_POKEFAN_M
	const OLIVINEPUNISHMENTSPEECHHOUSE_LASS

OlivinePunishmentSpeechHouse_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

OlivinePunishmentSpeechHouseDad:
	jumptextfaceplayer OlivinePunishmentSpeechHouseDadText

OlivinePunishmentSpeechHouseDaughter:
	jumptextfaceplayer OlivinePunishmentSpeechHouseDaughterText

OlivinePunishmentSpeechHouseBookshelf2:
	jumpstd picturebookshelf

OlivinePunishmentSpeechHouseBookshelf1:
	jumpstd magazinebookshelf

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

OlivinePunishmentSpeechHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 5, OLIVINE_CITY
	warp_def $7, $3, 5, OLIVINE_CITY

.CoordEvents:
	db 0

.BGEvents:
	db 2
	bg_event 1, 0, BGEVENT_READ, OlivinePunishmentSpeechHouseBookshelf1
	bg_event 1, 1, BGEVENT_READ, OlivinePunishmentSpeechHouseBookshelf2

.ObjectEvents:
	db 2
	object_event SPRITE_POKEFAN_M, 2, 1, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePunishmentSpeechHouseDad, -1
	object_event SPRITE_LASS, 5, 5, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePunishmentSpeechHouseDaughter, -1
