IcePathB2FBlackthornSide_MapScriptHeader: ; 0x7e644
	; trigger count
	db 0

	; callback count
	db 0
; 0x7e646

ItemFragment_0x7e646: ; 0x7e646
	db TM_REST, 1
; 0x7e648

MapIcePathB2FBlackthornSideSignpostItem0: ; 0x7e648
	dw $0096
	db ICE_HEAL
	
; 0x7e64b

IcePathB2FBlackthornSide_MapEventHeader: ; 0x7e64b
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $f, $3, 8, GROUP_ICE_PATH_B1F, MAP_ICE_PATH_B1F
	warp_def $3, $3, 2, GROUP_ICE_PATH_B3F, MAP_ICE_PATH_B3F

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 10, 2, $7, MapIcePathB2FBlackthornSideSignpostItem0

	; people-events
	db 1
	person_event SPRITE_POKE_BALL, 20, 12, $1, $0, 255, 255, $1, 0, ItemFragment_0x7e646, $068d
; 0x7e66d
