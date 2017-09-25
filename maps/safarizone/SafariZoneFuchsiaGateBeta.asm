SafariZoneFuchsiaGateBeta_MapScriptHeader:
.MapTriggers:
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

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 0
