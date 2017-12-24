const_value set 2
	const MOUNTMOONGIFTSHOP_GRAMPS1
	const MOUNTMOONGIFTSHOP_GRAMPS2
	const MOUNTMOONGIFTSHOP_LASS1
	const MOUNTMOONGIFTSHOP_LASS2

MountMoonGiftShop_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

GrampsScript_0x771a8:
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

MountMoonGiftShop_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $3, 3, MOUNT_MOON_SQUARE
	warp_def $7, $4, 3, MOUNT_MOON_SQUARE

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 4
	object_event SPRITE_GRAMPS, 3, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, GrampsScript_0x771a8, -1
	object_event SPRITE_GRAMPS, 2, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, GrampsScript_0x771a8, -1
	object_event SPRITE_LASS, 6, 1, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, MountMoonGiftShopLassScript, -1
	object_event SPRITE_LASS, 4, 5, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, MountMoonGiftShopLassScript, -1
