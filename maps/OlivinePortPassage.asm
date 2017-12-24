const_value set 2
	const OLIVINEPORTPASSAGE_POKEFAN_M

OlivinePortPassage_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

OlivinePortPassagePokefanMScript:
	jumptextfaceplayer OlivinePortPassagePokefanMText

OlivinePortPassagePokefanMText:
	text "FAST SHIP S.S.AQUA"
	line "sails to KANTO on"

	para "Mondays and Fri-"
	line "days."
	done

OlivinePortPassage_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 5
	warp_def $0, $f, 10, OLIVINE_CITY
	warp_def $0, $10, 11, OLIVINE_CITY
	warp_def $4, $f, 4, OLIVINE_PORT_PASSAGE
	warp_def $2, $3, 3, OLIVINE_PORT_PASSAGE
	warp_def $e, $3, 1, OLIVINE_PORT

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 1
	object_event SPRITE_POKEFAN_M, 1, 17, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePortPassagePokefanMScript, EVENT_OLIVINE_PORT_PASSAGE_POKEFAN_M
