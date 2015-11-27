const_value set 2
	const MOUNTMORTAR2FINSIDE_POKE_BALL1
	const MOUNTMORTAR2FINSIDE_POKE_BALL2
	const MOUNTMORTAR2FINSIDE_POKE_BALL3
	const MOUNTMORTAR2FINSIDE_POKE_BALL4
	const MOUNTMORTAR2FINSIDE_POKE_BALL5
	const MOUNTMORTAR2FINSIDE_POKE_BALL6
	const MOUNTMORTAR2FINSIDE_SUPER_NERD

MountMortar2FInside_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerSupernerdHugh:
	trainer EVENT_BEAT_SUPER_NERD_HUGH, SUPER_NERD, HUGH, SupernerdHughSeenText, SupernerdHughBeatenText, 0, SupernerdHughScript

SupernerdHughScript:
	end_if_just_battled
	loadfont
	writetext UnknownText_0x7e10e
	waitbutton
	closetext
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
	warp_def $21, $11, 4, MOUNT_MORTAR_1F_OUTSIDE
	warp_def $5, $3, 6, MOUNT_MORTAR_1F_INSIDE

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 8, 24, SIGNPOST_ITEM, MapMountMortar2FInsideSignpostItem0

.PersonEvents:
	db 7
	person_event SPRITE_POKE_BALL, 22, 28, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMFRAGMENT, 0, ItemFragment_0x7e0de, EVENT_MOUNT_MORTAR_2F_INSIDE_MAX_POTION
	person_event SPRITE_POKE_BALL, 33, 2, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMFRAGMENT, 0, ItemFragment_0x7e0e0, EVENT_MOUNT_MORTAR_2F_INSIDE_RARE_CANDY
	person_event SPRITE_POKE_BALL, 17, 19, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMFRAGMENT, 0, ItemFragment_0x7e0e2, EVENT_MOUNT_MORTAR_2F_INSIDE_TM_DEFENSE_CURL
	person_event SPRITE_POKE_BALL, 5, 16, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMFRAGMENT, 0, ItemFragment_0x7e0e4, EVENT_MOUNT_MORTAR_2F_INSIDE_DRAGON_SCALE
	person_event SPRITE_POKE_BALL, 11, 9, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMFRAGMENT, 0, ItemFragment_0x7e0e6, EVENT_MOUNT_MORTAR_2F_INSIDE_ELIXER
	person_event SPRITE_POKE_BALL, 5, 28, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMFRAGMENT, 0, ItemFragment_0x7e0e8, EVENT_MOUNT_MORTAR_2F_INSIDE_ESCAPE_ROPE
	person_event SPRITE_SUPER_NERD, 26, 13, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 2, TrainerSupernerdHugh, -1
