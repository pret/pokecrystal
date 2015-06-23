FuchsiaPokeCenter2FBeta_MapScriptHeader: ; 0x1965b7
	; trigger count
	db 0

	; callback count
	db 0
; 0x1965b9

FuchsiaPokeCenter2FBeta_MapEventHeader: ; 0x1965b9
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $7, $0, 3, GROUP_FUCHSIA_POKECENTER_1F, MAP_FUCHSIA_POKECENTER_1F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 0
; 0x1965c4
