MountMortar2FInside_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerSupernerdHugh:
	trainer EVENT_BEAT_SUPER_NERD_HUGH, SUPER_NERD, HUGH, SupernerdHughSeenText, SupernerdHughBeatenText, $0000, SupernerdHughScript

SupernerdHughScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x7e10e
	closetext
	loadmovesprites
	end

ItemFragment_0x7e0de:
	db MAX_POTION, 1

ItemFragment_0x7e0e0:
	db RARE_CANDY, 1

ItemFragment_0x7e0e2:
	db TM_DEFENSE_CURL, 1

ItemFragment_0x7e0e4:
	db DRAGON_SCALE, 1

ItemFragment_0x7e0e6:
	db ELIXER, 1

ItemFragment_0x7e0e8:
	db ESCAPE_ROPE, 1

MapMountMortar2FInsideSignpostItem0:
	dwb EVENT_MOUNT_MORTAR_2F_INSIDE_HIDDEN_FULL_RESTORE, FULL_RESTORE
	

SupernerdHughSeenText:
	text "Yo! MARKUS!"
	done

SupernerdHughBeatenText:
	text "Sorry, my mistake."
	done

UnknownText_0x7e10e:
	text "I'm investigating"
	line "MT.MORTAR, but my"
	cont "pal's gone AWOL."

	para "Have you seen a"
	line "trainer who has a"

	para "SLOWPOKE that can"
	line "use STRENGTH?"
	done

MountMortar2FInside_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $21, $11, 4, GROUP_MOUNT_MORTAR_1F_OUTSIDE, MAP_MOUNT_MORTAR_1F_OUTSIDE
	warp_def $5, $3, 6, GROUP_MOUNT_MORTAR_1F_INSIDE, MAP_MOUNT_MORTAR_1F_INSIDE

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 8, 24, SIGNPOST_ITEM, MapMountMortar2FInsideSignpostItem0

.PersonEvents:
	db 7
	person_event SPRITE_POKE_BALL, 26, 32, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x7e0de, EVENT_MOUNT_MORTAR_2F_INSIDE_MAX_POTION
	person_event SPRITE_POKE_BALL, 37, 6, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x7e0e0, EVENT_MOUNT_MORTAR_2F_INSIDE_RARE_CANDY
	person_event SPRITE_POKE_BALL, 21, 23, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x7e0e2, EVENT_MOUNT_MORTAR_2F_INSIDE_TM_DEFENSE_CURL
	person_event SPRITE_POKE_BALL, 9, 20, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x7e0e4, EVENT_MOUNT_MORTAR_2F_INSIDE_DRAGON_SCALE
	person_event SPRITE_POKE_BALL, 15, 13, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x7e0e6, EVENT_MOUNT_MORTAR_2F_INSIDE_ELIXER
	person_event SPRITE_POKE_BALL, 9, 32, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x7e0e8, EVENT_MOUNT_MORTAR_2F_INSIDE_ESCAPE_ROPE
	person_event SPRITE_SUPER_NERD, 30, 17, OW_LEFT | $2, $0, -1, -1, (PAL_OW_BROWN << 4) | $82, 2, TrainerSupernerdHugh, -1
