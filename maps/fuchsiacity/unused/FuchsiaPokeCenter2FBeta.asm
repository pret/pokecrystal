FuchsiaPokeCenter2FBeta_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

FuchsiaPokeCenter2FBeta_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 1
	warp_def $7, $0, 3, FUCHSIA_POKECENTER_1F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 0
