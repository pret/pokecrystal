const_value set 2
	const MOUNTMORTAR1FOUTSIDE_POKE_BALL1
	const MOUNTMORTAR1FOUTSIDE_POKE_BALL2

MountMortar1FOutside_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

MountMortar1FOutsideEther:
	itemball ETHER

MountMortar1FOutsideRevive:
	itemball REVIVE

MountMortar1FOutsideHiddenHyperPotion:
	dwb EVENT_MOUNT_MORTAR_1F_OUTSIDE_HIDDEN_HYPER_POTION, HYPER_POTION


MountMortar1FOutside_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 9
	warp_def $21, $3, 3, ROUTE_42
	warp_def $21, $11, 4, ROUTE_42
	warp_def $21, $25, 5, ROUTE_42
	warp_def $5, $11, 1, MOUNT_MORTAR_2F_INSIDE
	warp_def $15, $b, 1, MOUNT_MORTAR_1F_INSIDE
	warp_def $15, $1d, 2, MOUNT_MORTAR_1F_INSIDE
	warp_def $1d, $11, 2, MOUNT_MORTAR_B1F
	warp_def $d, $7, 3, MOUNT_MORTAR_1F_INSIDE
	warp_def $d, $21, 4, MOUNT_MORTAR_1F_INSIDE

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 22, 25, SIGNPOST_ITEM, MountMortar1FOutsideHiddenHyperPotion

.PersonEvents:
	db 2
	person_event SPRITE_POKE_BALL, 15, 13, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, MountMortar1FOutsideEther, EVENT_MOUNT_MORTAR_1F_OUTSIDE_ETHER
	person_event SPRITE_POKE_BALL, 18, 31, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, MountMortar1FOutsideRevive, EVENT_MOUNT_MORTAR_1F_OUTSIDE_REVIVE
