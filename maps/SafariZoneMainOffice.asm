SafariZoneMainOffice_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

SafariZoneMainOffice_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 2, FUCHSIA_CITY
	warp_def $7, $3, 2, FUCHSIA_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 0
