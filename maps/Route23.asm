Route23_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 1
	callback MAPCALLBACK_NEWMAP, .FlyPoint

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

Route23_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def 9, 5, 1, INDIGO_PLATEAU_POKECENTER_1F
	warp_def 10, 5, 2, INDIGO_PLATEAU_POKECENTER_1F
	warp_def 9, 13, 10, VICTORY_ROAD
	warp_def 10, 13, 10, VICTORY_ROAD

.CoordEvents:
	db 0

.BGEvents:
	db 1
	bg_event 11, 7, BGEVENT_READ, IndigoPlateauSign

.ObjectEvents:
	db 0
