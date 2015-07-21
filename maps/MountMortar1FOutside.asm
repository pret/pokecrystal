MountMortar1FOutside_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ItemFragment_0x7ddf6:
	db ETHER, 1

ItemFragment_0x7ddf8:
	db REVIVE, 1

MapMountMortar1FOutsideSignpostItem0:
	dwb EVENT_MOUNT_MORTAR_1F_OUTSIDE_HIDDEN_HYPER_POTION, HYPER_POTION
	

MountMortar1FOutside_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 9
	warp_def $21, $3, 3, GROUP_ROUTE_42, MAP_ROUTE_42
	warp_def $21, $11, 4, GROUP_ROUTE_42, MAP_ROUTE_42
	warp_def $21, $25, 5, GROUP_ROUTE_42, MAP_ROUTE_42
	warp_def $5, $11, 1, GROUP_MOUNT_MORTAR_2F_INSIDE, MAP_MOUNT_MORTAR_2F_INSIDE
	warp_def $15, $b, 1, GROUP_MOUNT_MORTAR_1F_INSIDE, MAP_MOUNT_MORTAR_1F_INSIDE
	warp_def $15, $1d, 2, GROUP_MOUNT_MORTAR_1F_INSIDE, MAP_MOUNT_MORTAR_1F_INSIDE
	warp_def $1d, $11, 2, GROUP_MOUNT_MORTAR_B1F, MAP_MOUNT_MORTAR_B1F
	warp_def $d, $7, 3, GROUP_MOUNT_MORTAR_1F_INSIDE, MAP_MOUNT_MORTAR_1F_INSIDE
	warp_def $d, $21, 4, GROUP_MOUNT_MORTAR_1F_INSIDE, MAP_MOUNT_MORTAR_1F_INSIDE

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 22, 25, SIGNPOST_ITEM, MapMountMortar1FOutsideSignpostItem0

.PersonEvents:
	db 2
	person_event SPRITE_POKE_BALL, 19, 17, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x7ddf6, EVENT_MOUNT_MORTAR_1F_OUTSIDE_ETHER
	person_event SPRITE_POKE_BALL, 22, 35, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x7ddf8, EVENT_MOUNT_MORTAR_1F_OUTSIDE_REVIVE
