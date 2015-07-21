OlivinePunishmentSpeechHouse_MapScriptHeader:
.MapTriggers:
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
	warp_def $7, $2, 5, GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY
	warp_def $7, $3, 5, GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 1, 0, SIGNPOST_READ, OlivinePunishmentSpeechHouseBookshelf1
	signpost 1, 1, SIGNPOST_READ, OlivinePunishmentSpeechHouseBookshelf2

.PersonEvents:
	db 2
	person_event SPRITE_POKEFAN_M, 6, 5, OW_DOWN | $3, $0, -1, -1, $0, 0, OlivinePunishmentSpeechHouseDad, -1
	person_event SPRITE_LASS, 9, 9, OW_UP | $1, $2, -1, -1, $0, 0, OlivinePunishmentSpeechHouseDaughter, -1
