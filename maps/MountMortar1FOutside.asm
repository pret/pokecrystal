const_value set 2
	const MOUNTMORTAR1FOUTSIDE_POKE_BALL1
	const MOUNTMORTAR1FOUTSIDE_POKE_BALL2

MountMortar1FOutside_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

MountMortar1FOutsideEther:
	itemball ETHER

MountMortar1FOutsideRevive:
	itemball REVIVE

MountMortar1FOutsideHiddenHyperPotion:
	hiddenitem EVENT_MOUNT_MORTAR_1F_OUTSIDE_HIDDEN_HYPER_POTION, HYPER_POTION

MountMortar1FOutside_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 9
	warp_def 3, 33, 3, ROUTE_42
	warp_def 17, 33, 4, ROUTE_42
	warp_def 37, 33, 5, ROUTE_42
	warp_def 17, 5, 1, MOUNT_MORTAR_2F_INSIDE
	warp_def 11, 21, 1, MOUNT_MORTAR_1F_INSIDE
	warp_def 29, 21, 2, MOUNT_MORTAR_1F_INSIDE
	warp_def 17, 29, 2, MOUNT_MORTAR_B1F
	warp_def 7, 13, 3, MOUNT_MORTAR_1F_INSIDE
	warp_def 33, 13, 4, MOUNT_MORTAR_1F_INSIDE

.CoordEvents:
	db 0

.BGEvents:
	db 1
	bg_event 25, 22, BGEVENT_ITEM, MountMortar1FOutsideHiddenHyperPotion

.ObjectEvents:
	db 2
	object_event 13, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar1FOutsideEther, EVENT_MOUNT_MORTAR_1F_OUTSIDE_ETHER
	object_event 31, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar1FOutsideRevive, EVENT_MOUNT_MORTAR_1F_OUTSIDE_REVIVE
