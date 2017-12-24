const_value set 2
	const PEWTERNIDORANSPEECHHOUSE_SUPER_NERD
	const PEWTERNIDORANSPEECHHOUSE_GROWLITHE

PewterNidoranSpeechHouse_MapScriptHeader:
.SceneScripts:
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

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 2
	object_event SPRITE_SUPER_NERD, 5, 3, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PewterNidoranSpeechHouseSuperNerdScript, -1
	object_event SPRITE_GROWLITHE, 5, 4, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterNidoran, -1
