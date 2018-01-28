SafariZoneMainOffice_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

SafariZoneMainOffice_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_event 2, 7, 2, FUCHSIA_CITY
	warp_event 3, 7, 2, FUCHSIA_CITY

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 0
