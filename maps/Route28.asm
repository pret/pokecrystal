Route28_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

Route28Sign:
	jumptext Route28SignText

Route28HiddenRareCandy:
	dwb EVENT_ROUTE_28_HIDDEN_RARE_CANDY, RARE_CANDY


Route28SignText:
	text "ROUTE 28"
	done

Route28_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $3, $7, 1, ROUTE_28_FAMOUS_SPEECH_HOUSE
	warp_def $5, $21, 7, VICTORY_ROAD_GATE

.CoordEvents:
	db 0

.BGEvents:
	db 2
	bg_event 5, 31, BGEVENT_READ, Route28Sign
	bg_event 2, 25, BGEVENT_ITEM, Route28HiddenRareCandy

.ObjectEvents:
	db 0
