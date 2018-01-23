const_value set 2
	const ICEPATHB2FMAHOGANYSIDE_BOULDER1
	const ICEPATHB2FMAHOGANYSIDE_BOULDER2
	const ICEPATHB2FMAHOGANYSIDE_BOULDER3
	const ICEPATHB2FMAHOGANYSIDE_BOULDER4
	const ICEPATHB2FMAHOGANYSIDE_POKE_BALL1
	const ICEPATHB2FMAHOGANYSIDE_POKE_BALL2

IcePathB2FMahoganySide_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

IcePathB2FMahoganySideBoulder:
	jumptext IcePathB2FMahoganySideBoulderText

IcePathB2FMahoganySideFullHeal:
	itemball FULL_HEAL

IcePathB2FMahoganySideMaxPotion:
	itemball MAX_POTION

IcePathB2FMahoganySideHiddenCarbos:
	hiddenitem EVENT_ICE_PATH_B2F_MAHOGANY_SIDE_HIDDEN_CARBOS, CARBOS

IcePathB2FMahoganySideBoulderText:
	text "It's immovably"
	line "imbedded in ice."
	done

IcePathB2FMahoganySide_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 6
	warp_def 17, 1, 2, ICE_PATH_B1F
	warp_def 9, 11, 1, ICE_PATH_B3F
	warp_def 11, 4, 3, ICE_PATH_B1F
	warp_def 4, 6, 4, ICE_PATH_B1F
	warp_def 4, 12, 5, ICE_PATH_B1F
	warp_def 12, 12, 6, ICE_PATH_B1F

.CoordEvents:
	db 0

.BGEvents:
	db 1
	bg_event 0, 17, BGEVENT_ITEM, IcePathB2FMahoganySideHiddenCarbos

.ObjectEvents:
	db 6
	object_event 11, 3, SPRITE_BOULDER, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePathB2FMahoganySideBoulder, EVENT_BOULDER_IN_ICE_PATH_1A
	object_event 4, 7, SPRITE_BOULDER, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePathB2FMahoganySideBoulder, EVENT_BOULDER_IN_ICE_PATH_2A
	object_event 3, 12, SPRITE_BOULDER, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePathB2FMahoganySideBoulder, EVENT_BOULDER_IN_ICE_PATH_3A
	object_event 12, 13, SPRITE_BOULDER, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePathB2FMahoganySideBoulder, EVENT_BOULDER_IN_ICE_PATH_4A
	object_event 8, 9, SPRITE_POKE_BALL, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePathB2FMahoganySideFullHeal, EVENT_ICE_PATH_B2F_MAHOGANY_SIDE_FULL_HEAL
	object_event 0, 2, SPRITE_POKE_BALL, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePathB2FMahoganySideMaxPotion, EVENT_ICE_PATH_B2F_MAHOGANY_SIDE_MAX_POTION
