Route10PokeCenter2FBeta_MapScriptHeader: ; 0x188dac
	; trigger count
	db 0

	; callback count
	db 0
; 0x188dae

Route10PokeCenter2FBeta_MapEventHeader: ; 0x188dae
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $7, $0, 3, GROUP_ROUTE_10_POKECENTER_1F, MAP_ROUTE_10_POKECENTER_1F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 0
; 0x188db9
