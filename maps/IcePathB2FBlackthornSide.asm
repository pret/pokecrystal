const_value set 2
	const ICEPATHB2FBLACKTHORNSIDE_POKE_BALL

IcePathB2FBlackthornSide_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

IcePathB2FBlackthornSideTMRest:
	itemball TM_REST

IcePathB2FBlackthornSideHiddenIceHeal:
	hiddenitem ICE_HEAL, EVENT_ICE_PATH_B2F_BLACKTHORN_SIDE_HIDDEN_ICE_HEAL

IcePathB2FBlackthornSide_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 3, 15, 8, ICE_PATH_B1F
	warp_event 3, 3, 2, ICE_PATH_B3F

	db 0 ; coord events

	db 1 ; bg events
	bg_event 2, 10, BGEVENT_ITEM, IcePathB2FBlackthornSideHiddenIceHeal

	db 1 ; object events
	object_event 8, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePathB2FBlackthornSideTMRest, EVENT_ICE_PATH_B2F_BLACKTHORN_SIDE_TM_REST
