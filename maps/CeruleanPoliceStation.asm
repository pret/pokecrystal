const_value set 2
	const CERULEANPOLICESTATION_FISHING_GURU
	const CERULEANPOLICESTATION_POKEFAN_F
	const CERULEANPOLICESTATION_DIGLETT

CeruleanPoliceStation_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

CeruleanPoliceStationFishingGuruScript:
	jumptextfaceplayer CeruleanPoliceStationFishingGuruText

CeruleanPoliceStationPokefanFScript:
	jumptextfaceplayer CeruleanPoliceStationPokefanFText

CeruleanDiglett:
	opentext
	writetext CeruleanDiglettText
	cry DIGLETT
	waitbutton
	closetext
	end

CeruleanPoliceStationFishingGuruText:
	text "I heard that some"
	line "shady character is"
	cont "skulking about."

	para "I won't stand for"
	line "it if he turns out"
	cont "to be a thief."
	done

CeruleanPoliceStationPokefanFText:
	text "We were held up by"
	line "robbers before."
	done

CeruleanDiglettText:
	text "DIGLETT: Dug dug."
	done

CeruleanPoliceStation_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 2, CERULEAN_CITY
	warp_def $7, $3, 2, CERULEAN_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_FISHING_GURU, 1, 5, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, PERSONTYPE_SCRIPT, 0, CeruleanPoliceStationFishingGuruScript, -1
	person_event SPRITE_POKEFAN_F, 4, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, CeruleanPoliceStationPokefanFScript, -1
	person_event SPRITE_DIGLETT, 5, 3, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, PERSONTYPE_SCRIPT, 0, CeruleanDiglett, -1
