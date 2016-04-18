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
	opentext
	writetext UnknownText_0x7e10e
	waitbutton
	closetext
	end

MountMortar2FInsideMaxPotion:
	itemball MAX_POTION

MountMortar2FInsideRareCandy:
	itemball RARE_CANDY

MountMortar2FInsideTMDefenseCurl:
	itemball TM_DEFENSE_CURL

MountMortar2FInsideDragonScale:
	itemball DRAGON_SCALE

MountMortar2FInsideElixer:
	itemball ELIXER

MountMortar2FInsideEscapeRope:
	itemball ESCAPE_ROPE

MountMortar2FInsideHiddenFullRestore:
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
	signpost 8, 24, SIGNPOST_ITEM, MountMortar2FInsideHiddenFullRestore

.PersonEvents:
	db 7
	person_event SPRITE_POKE_BALL, 22, 28, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, MountMortar2FInsideMaxPotion, EVENT_MOUNT_MORTAR_2F_INSIDE_MAX_POTION
	person_event SPRITE_POKE_BALL, 33, 2, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, MountMortar2FInsideRareCandy, EVENT_MOUNT_MORTAR_2F_INSIDE_RARE_CANDY
	person_event SPRITE_POKE_BALL, 17, 19, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, MountMortar2FInsideTMDefenseCurl, EVENT_MOUNT_MORTAR_2F_INSIDE_TM_DEFENSE_CURL
	person_event SPRITE_POKE_BALL, 5, 16, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, MountMortar2FInsideDragonScale, EVENT_MOUNT_MORTAR_2F_INSIDE_DRAGON_SCALE
	person_event SPRITE_POKE_BALL, 11, 9, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, MountMortar2FInsideElixer, EVENT_MOUNT_MORTAR_2F_INSIDE_ELIXER
	person_event SPRITE_POKE_BALL, 5, 28, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, MountMortar2FInsideEscapeRope, EVENT_MOUNT_MORTAR_2F_INSIDE_ESCAPE_ROPE
	person_event SPRITE_SUPER_NERD, 26, 13, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 2, TrainerSupernerdHugh, -1
