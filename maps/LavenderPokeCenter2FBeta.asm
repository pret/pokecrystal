LavenderPokeCenter2FBeta_MapScriptHeader: ; 0x7e8bb
	; trigger count
	db 0

	; callback count
	db 0
; 0x7e8bd

LavenderPokeCenter2FBeta_MapEventHeader: ; 0x7e8bd
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $7, $0, 3, GROUP_LAVENDER_POKECENTER_1F, MAP_LAVENDER_POKECENTER_1F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 0
; 0x7e8c8
