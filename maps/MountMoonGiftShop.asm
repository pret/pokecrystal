const_value set 2
	const MOUNTMOONGIFTSHOP_GRAMPS1
	const MOUNTMOONGIFTSHOP_GRAMPS2
	const MOUNTMOONGIFTSHOP_LASS1
	const MOUNTMOONGIFTSHOP_LASS2

MountMoonGiftShop_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

GrampsScript_0x771a8:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_MT_MOON
	closetext
	end

LassScript_0x771b0:
	jumptextfaceplayer UnknownText_0x771b3

UnknownText_0x771b3:
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

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 4
	person_event SPRITE_GRAMPS, 3, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 1, 0, PERSONTYPE_SCRIPT, 0, GrampsScript_0x771a8, -1
	person_event SPRITE_GRAMPS, 2, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 2, 0, PERSONTYPE_SCRIPT, 0, GrampsScript_0x771a8, -1
	person_event SPRITE_LASS, 6, 1, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 1, 0, PERSONTYPE_SCRIPT, 0, LassScript_0x771b0, -1
	person_event SPRITE_LASS, 4, 5, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 2, 0, PERSONTYPE_SCRIPT, 0, LassScript_0x771b0, -1
