const_value set 2
	const PEWTERNIDORANSPEECHHOUSE_SUPER_NERD
	const PEWTERNIDORANSPEECHHOUSE_GROWLITHE

PewterNidoranSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

PewterNidoranSpeechHouseSuperNerdScript:
	jumptextfaceplayer PewterNidoranSpeechHouseSuperNerdText

PewterNidoran:
	opentext
	writetext PewterNidoranText
	cry NIDORAN_M
	waitbutton
	closetext
	end

PewterNidoranSpeechHouseSuperNerdText:
	text "NIDORAN, shake!"
	done

PewterNidoranText:
	text "NIDORAN: Gau gau!"
	done

PewterNidoranSpeechHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 1, PEWTER_CITY
	warp_def $7, $3, 1, PEWTER_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 2
	person_event SPRITE_SUPER_NERD, 5, 3, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, PERSONTYPE_SCRIPT, 0, PewterNidoranSpeechHouseSuperNerdScript, -1
	person_event SPRITE_GROWLITHE, 5, 4, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, PewterNidoran, -1
