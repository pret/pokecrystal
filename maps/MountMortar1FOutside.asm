const_value set 2 ; object constants
	const MOUNTMORTAR1FOUTSIDE_POKE_BALL1
	const MOUNTMORTAR1FOUTSIDE_POKE_BALL2

MountMortar1FOutside_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MountMortar1FOutsideEther:
	itemball ETHER

MountMortar1FOutsideRevive:
	itemball REVIVE

MountMortar1FOutsideHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_MOUNT_MORTAR_1F_OUTSIDE_HIDDEN_HYPER_POTION

MountMortar1FOutside_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event 3, 33, 3, ROUTE_42
	warp_event 17, 33, 4, ROUTE_42
	warp_event 37, 33, 5, ROUTE_42
	warp_event 17, 5, 1, MOUNT_MORTAR_2F_INSIDE
	warp_event 11, 21, 1, MOUNT_MORTAR_1F_INSIDE
	warp_event 29, 21, 2, MOUNT_MORTAR_1F_INSIDE
	warp_event 17, 29, 2, MOUNT_MORTAR_B1F
	warp_event 7, 13, 3, MOUNT_MORTAR_1F_INSIDE
	warp_event 33, 13, 4, MOUNT_MORTAR_1F_INSIDE

	db 0 ; coord events

	db 1 ; bg events
	bg_event 25, 22, BGEVENT_ITEM, MountMortar1FOutsideHiddenHyperPotion

	db 2 ; object events
	object_event 13, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar1FOutsideEther, EVENT_MOUNT_MORTAR_1F_OUTSIDE_ETHER
	object_event 31, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar1FOutsideRevive, EVENT_MOUNT_MORTAR_1F_OUTSIDE_REVIVE
