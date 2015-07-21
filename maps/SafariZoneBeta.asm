SafariZoneBeta_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

SafariZoneBeta_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $17, $9, 1, GROUP_SAFARI_ZONE_FUCHSIA_GATE_BETA, MAP_SAFARI_ZONE_FUCHSIA_GATE_BETA
	warp_def $17, $a, 2, GROUP_SAFARI_ZONE_FUCHSIA_GATE_BETA, MAP_SAFARI_ZONE_FUCHSIA_GATE_BETA

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 0
