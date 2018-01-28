SafariZoneFuchsiaGateBeta_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

SafariZoneFuchsiaGateBeta_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_event 4, 0, 1, SAFARI_ZONE_BETA
	warp_event 5, 0, 2, SAFARI_ZONE_BETA
	warp_event 4, 7, 7, FUCHSIA_CITY
	warp_event 5, 7, 7, FUCHSIA_CITY

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 0
