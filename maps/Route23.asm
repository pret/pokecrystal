Route23_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks
	dbw 5, .FlyPoint

.FlyPoint
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

	; warps
	db 4
	warp_def $5, $9, 1, GROUP_INDIGO_PLATEAU_POKECENTER_1F, MAP_INDIGO_PLATEAU_POKECENTER_1F
	warp_def $5, $a, 2, GROUP_INDIGO_PLATEAU_POKECENTER_1F, MAP_INDIGO_PLATEAU_POKECENTER_1F
	warp_def $d, $9, 10, GROUP_VICTORY_ROAD, MAP_VICTORY_ROAD
	warp_def $d, $a, 10, GROUP_VICTORY_ROAD, MAP_VICTORY_ROAD

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 7, 11, SIGNPOST_READ, IndigoPlateauSign

	; people-events
	db 0
