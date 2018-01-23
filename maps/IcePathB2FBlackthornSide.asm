const_value set 2
	const ICEPATHB2FBLACKTHORNSIDE_POKE_BALL

IcePathB2FBlackthornSide_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

IcePathB2FBlackthornSideTMRest:
	itemball TM_REST

IcePathB2FBlackthornSideHiddenIceHeal:
	hiddenitem EVENT_ICE_PATH_B2F_BLACKTHORN_SIDE_HIDDEN_ICE_HEAL, ICE_HEAL

IcePathB2FBlackthornSide_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def 3, 15, 8, ICE_PATH_B1F
	warp_def 3, 3, 2, ICE_PATH_B3F

.CoordEvents:
	db 0

.BGEvents:
	db 1
	bg_event 2, 10, BGEVENT_ITEM, IcePathB2FBlackthornSideHiddenIceHeal

.ObjectEvents:
	db 1
	object_event 8, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePathB2FBlackthornSideTMRest, EVENT_ICE_PATH_B2F_BLACKTHORN_SIDE_TM_REST
