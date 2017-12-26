SafariZoneFuchsiaGateBeta_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

SafariZoneFuchsiaGateBeta_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $0, $4, 1, SAFARI_ZONE_BETA
	warp_def $0, $5, 2, SAFARI_ZONE_BETA
	warp_def $7, $4, 7, FUCHSIA_CITY
	warp_def $7, $5, 7, FUCHSIA_CITY

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 0
