const_value set 2
	const ICEPATHB2FMAHOGANYSIDE_BOULDER1
	const ICEPATHB2FMAHOGANYSIDE_BOULDER2
	const ICEPATHB2FMAHOGANYSIDE_BOULDER3
	const ICEPATHB2FMAHOGANYSIDE_BOULDER4
	const ICEPATHB2FMAHOGANYSIDE_POKE_BALL1
	const ICEPATHB2FMAHOGANYSIDE_POKE_BALL2

IcePathB2FMahoganySide_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

BoulderScript_0x7e5a3:
	jumptext UnknownText_0x7e5ad

IcePathB2FMahoganySideFullHeal:
	itemball FULL_HEAL

IcePathB2FMahoganySideMaxPotion:
	itemball MAX_POTION

IcePathB2FMahoganySideHiddenCarbos:
	dwb EVENT_ICE_PATH_B2F_MAHOGANY_SIDE_HIDDEN_CARBOS, CARBOS


UnknownText_0x7e5ad:
	text "It's immovably"
	line "imbedded in ice."
	done

IcePathB2FMahoganySide_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 6
	warp_def $1, $11, 2, ICE_PATH_B1F
	warp_def $b, $9, 1, ICE_PATH_B3F
	warp_def $4, $b, 3, ICE_PATH_B1F
	warp_def $6, $4, 4, ICE_PATH_B1F
	warp_def $c, $4, 5, ICE_PATH_B1F
	warp_def $c, $c, 6, ICE_PATH_B1F

.CoordEvents:
	db 0

.BGEvents:
	db 1
	bg_event 17, 0, BGEVENT_ITEM, IcePathB2FMahoganySideHiddenCarbos

.ObjectEvents:
	db 6
	object_event SPRITE_BOULDER, 3, 11, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BoulderScript_0x7e5a3, EVENT_BOULDER_IN_ICE_PATH_1A
	object_event SPRITE_BOULDER, 7, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BoulderScript_0x7e5a3, EVENT_BOULDER_IN_ICE_PATH_2A
	object_event SPRITE_BOULDER, 12, 3, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BoulderScript_0x7e5a3, EVENT_BOULDER_IN_ICE_PATH_3A
	object_event SPRITE_BOULDER, 13, 12, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BoulderScript_0x7e5a3, EVENT_BOULDER_IN_ICE_PATH_4A
	object_event SPRITE_POKE_BALL, 9, 8, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePathB2FMahoganySideFullHeal, EVENT_ICE_PATH_B2F_MAHOGANY_SIDE_FULL_HEAL
	object_event SPRITE_POKE_BALL, 2, 0, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePathB2FMahoganySideMaxPotion, EVENT_ICE_PATH_B2F_MAHOGANY_SIDE_MAX_POTION
