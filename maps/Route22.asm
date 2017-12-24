Route22_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

VictoryRoadEntranceSign:
	jumptext VictoryRoadEntranceSignText

VictoryRoadEntranceSignText:
	text "#MON LEAGUE"

	para "VICTORY ROAD"
	line "ENTRANCE"
	done

Route22_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 1
	warp_def $5, $d, 1, VICTORY_ROAD_GATE

.CoordEvents:
	db 0

.BGEvents:
	db 1
	bg_event 7, 15, BGEVENT_READ, VictoryRoadEntranceSign

.ObjectEvents:
	db 0
