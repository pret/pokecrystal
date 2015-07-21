IcePathB2FBlackthornSide_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ItemFragment_0x7e646:
	db TM_REST, 1

MapIcePathB2FBlackthornSideSignpostItem0:
	dwb EVENT_ICE_PATH_B2F_BLACKTHORN_SIDE_HIDDEN_ICE_HEAL, ICE_HEAL
	

IcePathB2FBlackthornSide_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $f, $3, 8, GROUP_ICE_PATH_B1F, MAP_ICE_PATH_B1F
	warp_def $3, $3, 2, GROUP_ICE_PATH_B3F, MAP_ICE_PATH_B3F

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 10, 2, SIGNPOST_ITEM, MapIcePathB2FBlackthornSideSignpostItem0

.PersonEvents:
	db 1
	person_event SPRITE_POKE_BALL, 20, 12, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x7e646, EVENT_ICE_PATH_B2F_BLACKTHORN_SIDE_TM_REST
