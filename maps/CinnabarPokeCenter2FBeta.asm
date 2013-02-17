CinnabarPokeCenter2FBeta_MapScriptHeader: ; 0x1ab3e7
	; trigger count
	db 0

	; callback count
	db 0
; 0x1ab3e9

CinnabarPokeCenter2FBeta_MapEventHeader: ; 0x1ab3e9
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $7, $0, 3, GROUP_CINNABAR_POKECENTER_1F, MAP_CINNABAR_POKECENTER_1F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 0
; 0x1ab3f4

