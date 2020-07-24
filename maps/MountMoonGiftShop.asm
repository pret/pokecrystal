	object_const_def
	const MOUNTMOONGIFTSHOP_GRAMPS1 ; morning only
	const MOUNTMOONGIFTSHOP_GRAMPS2 ; day only
	const MOUNTMOONGIFTSHOP_LASS1 ; morning only
	const MOUNTMOONGIFTSHOP_LASS2 ; day only

MountMoonGiftShop_MapScripts:
	def_scene_scripts

	def_callbacks

MountMoonGiftShopClerkScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_MT_MOON
	closetext
	end

MountMoonGiftShopLassScript:
	jumptextfaceplayer MountMoonGiftShopLassText

MountMoonGiftShopLassText:
	text "When the sun goes"
	line "down, CLEFAIRY"
	cont "come out to play."
	done

MountMoonGiftShop_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, MOUNT_MOON_SQUARE, 3
	warp_event  4,  7, MOUNT_MOON_SQUARE, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, MountMoonGiftShopClerkScript, -1
	object_event  1,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, MountMoonGiftShopClerkScript, -1
	object_event  1,  6, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, MountMoonGiftShopLassScript, -1
	object_event  5,  4, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, MountMoonGiftShopLassScript, -1
