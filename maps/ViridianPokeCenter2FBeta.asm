ViridianPokeCenter2FBeta_MapScriptHeader: ; 0x9b838
	; trigger count
	db 0

	; callback count
	db 0
; 0x9b83a

ViridianPokeCenter2FBeta_MapEventHeader: ; 0x9b83a
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $7, $0, 3, GROUP_VIRIDIAN_POKECENTER_1F, MAP_VIRIDIAN_POKECENTER_1F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 0
; 0x9b845

