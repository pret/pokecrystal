Route23_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 1
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_INDIGO_PLATEAU
	return

IndigoPlateauSign:
	jumptext IndigoPlateauSignText

IndigoPlateauSignText:
	text "INDIGO PLATEAU"

	para "The Ultimate Goal"
	line "for Trainers!"

	para "#MON LEAGUE HQ"
	done

Route23_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $5, $9, 1, INDIGO_PLATEAU_POKECENTER_1F
	warp_def $5, $a, 2, INDIGO_PLATEAU_POKECENTER_1F
	warp_def $d, $9, 10, VICTORY_ROAD
	warp_def $d, $a, 10, VICTORY_ROAD

.CoordEvents:
	db 0

.BGEvents:
	db 1
	bg_event 7, 11, BGEVENT_READ, IndigoPlateauSign

.ObjectEvents:
	db 0
