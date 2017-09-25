Route6UndergroundEntrance_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

Route6UndergroundEntrance_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $7, $3, 1, ROUTE_6
	warp_def $7, $4, 1, ROUTE_6
	warp_def $3, $4, 2, UNDERGROUND

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 0
