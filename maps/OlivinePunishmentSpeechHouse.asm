OlivinePunishmentSpeechHouse_MapScriptHeader:
	; trigger count
	db 0

	; callback count
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

	; warps
	db 2
	warp_def $7, $2, 5, GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY
	warp_def $7, $3, 5, GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 0, $0, OlivinePunishmentSpeechHouseBookshelf1
	signpost 1, 1, $0, OlivinePunishmentSpeechHouseBookshelf2

	; people-events
	db 2
	person_event SPRITE_POKEFAN_M, 6, 5, $3, $0, 255, 255, $0, 0, OlivinePunishmentSpeechHouseDad, -1
	person_event SPRITE_LASS, 9, 9, $5, $2, 255, 255, $0, 0, OlivinePunishmentSpeechHouseDaughter, -1
