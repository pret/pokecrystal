SaffronPokeCenter2FBeta_MapScriptHeader: ; 0x18a76b
	; trigger count
	db 0

	; callback count
	db 0
; 0x18a76d

SaffronPokeCenter2FBeta_MapEventHeader: ; 0x18a76d
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $7, $0, 3, GROUP_SAFFRON_POKECENTER_1F, MAP_SAFFRON_POKECENTER_1F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 0
; 0x18a778
