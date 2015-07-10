MountMoonGiftShop_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

GrampsScript_0x771a8:
	faceplayer
	loadfont
	pokemart $0, $001f
	loadmovesprites
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

	; warps
	db 2
	warp_def $7, $3, 3, GROUP_MOUNT_MOON_SQUARE, MAP_MOUNT_MOON_SQUARE
	warp_def $7, $4, 3, GROUP_MOUNT_MOON_SQUARE, MAP_MOUNT_MOON_SQUARE

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 4
	person_event SPRITE_GRAMPS, 7, 8, $6, $0, 255, 1, $0, 0, GrampsScript_0x771a8, $ffff
	person_event SPRITE_GRAMPS, 6, 5, $9, $0, 255, 2, $0, 0, GrampsScript_0x771a8, $ffff
	person_event SPRITE_LASS, 10, 5, $5, $1, 255, 1, $0, 0, LassScript_0x771b0, $ffff
	person_event SPRITE_LASS, 8, 9, $4, $10, 255, 2, $0, 0, LassScript_0x771b0, $ffff
