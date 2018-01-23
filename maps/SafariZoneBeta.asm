SafariZoneBeta_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

SafariZoneBeta_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def 9, 23, 1, SAFARI_ZONE_FUCHSIA_GATE_BETA
	warp_def 10, 23, 2, SAFARI_ZONE_FUCHSIA_GATE_BETA

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 0
