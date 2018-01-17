Route28_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

Route28Sign:
	jumptext Route28SignText

Route28HiddenRareCandy:
	hiddenitem EVENT_ROUTE_28_HIDDEN_RARE_CANDY, RARE_CANDY

Route28SignText:
	text "ROUTE 28"
	done

Route28_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def 7, 3, 1, ROUTE_28_FAMOUS_SPEECH_HOUSE
	warp_def 33, 5, 7, VICTORY_ROAD_GATE

.CoordEvents:
	db 0

.BGEvents:
	db 2
	bg_event 31, 5, BGEVENT_READ, Route28Sign
	bg_event 25, 2, BGEVENT_ITEM, Route28HiddenRareCandy

.ObjectEvents:
	db 0
