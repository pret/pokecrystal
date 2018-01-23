Route22_MapScripts:
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

Route22_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 1
	warp_def 13, 5, 1, VICTORY_ROAD_GATE

.CoordEvents:
	db 0

.BGEvents:
	db 1
	bg_event 15, 7, BGEVENT_READ, VictoryRoadEntranceSign

.ObjectEvents:
	db 0
