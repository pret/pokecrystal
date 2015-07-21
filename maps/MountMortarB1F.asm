MountMortarB1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

BlackBeltScript_0x7e1f6:
	faceplayer
	loadfont
	checkevent EVENT_GOT_TYROGUE_FROM_KIYO
	iftrue UnknownScript_0x7e231
	checkevent EVENT_BEAT_BLACKBELT_KIYO
	iftrue UnknownScript_0x7e217
	writetext UnknownText_0x7e24d
	closetext
	loadmovesprites
	winlosstext UnknownText_0x7e2a9, $0000
	loadtrainer BLACKBELT_T, KIYO
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_BLACKBELT_KIYO
	loadfont
UnknownScript_0x7e217:
	writetext UnknownText_0x7e2c0
	keeptextopen
	waitbutton
	checkcode VAR_PARTYCOUNT
	if_equal $6, UnknownScript_0x7e237
	writetext UnknownText_0x7e355
	playsound SFX_CAUGHT_MON
	waitbutton
	givepoke TYROGUE, 10, 0, 0
	setevent EVENT_GOT_TYROGUE_FROM_KIYO
UnknownScript_0x7e231:
	writetext UnknownText_0x7e36a
	closetext
	loadmovesprites
	end

UnknownScript_0x7e237:
	writetext UnknownText_0x7e3df
	closetext
	loadmovesprites
	end

MountMortarB1FBoulder:
	jumpstd strengthboulder

ItemFragment_0x7e240:
	db HYPER_POTION, 1

ItemFragment_0x7e242:
	db CARBOS, 1

ItemFragment_0x7e244:
	db FULL_RESTORE, 1

ItemFragment_0x7e246:
	db MAX_ETHER, 1

ItemFragment_0x7e248:
	db PP_UP, 1

MapMountMortarB1FSignpostItem0:
	dwb EVENT_MOUNT_MORTAR_B1F_HIDDEN_MAX_REVIVE, MAX_REVIVE
	

UnknownText_0x7e24d:
	text "Hey!"

	para "I am the KARATE"
	line "KING!"

	para "I train alone here"
	line "in the dark!"

	para "You!"
	line "Battle with me!"

	para "Hwaaarggh!"
	done

UnknownText_0x7e2a9:
	text "Waaaarggh!"
	line "I'm beaten!"
	done

UnknownText_0x7e2c0:
	text "I… I'm crushed…"

	para "My training is"
	line "still not enough…"

	para "But a loss is a"
	line "loss. I admit it."

	para "As proof that you"
	line "defeated me, I'll"

	para "give you a rare"
	line "fighting #MON."
	done

UnknownText_0x7e355:
	text "<PLAYER> received"
	line "TYROGUE."
	done

UnknownText_0x7e36a:
	text "TYROGUE is a"
	line "fighting-type."

	para "It evolves into a"
	line "tougher #MON."

	para "Keep up the hard"
	line "work. I'll keep"
	cont "training too."

	para "Farewell!"
	done

UnknownText_0x7e3df:
	text "You have no room"
	line "in your party!"
	done

MountMortarB1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $3, $3, 5, GROUP_MOUNT_MORTAR_1F_INSIDE, MAP_MOUNT_MORTAR_1F_INSIDE
	warp_def $1d, $13, 7, GROUP_MOUNT_MORTAR_1F_OUTSIDE, MAP_MOUNT_MORTAR_1F_OUTSIDE

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 6, 4, SIGNPOST_ITEM, MapMountMortarB1FSignpostItem0

.PersonEvents:
	db 7
	person_event SPRITE_POKE_BALL, 16, 33, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x7e240, EVENT_MOUNT_MORTAR_B1F_HYPER_POTION
	person_event SPRITE_POKE_BALL, 20, 8, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x7e242, EVENT_MOUNT_MORTAR_B1F_CARBOS
	person_event SPRITE_BOULDER, 14, 13, OW_LEFT | $11, $0, -1, -1, $0, 0, MountMortarB1FBoulder, -1
	person_event SPRITE_BLACK_BELT, 8, 20, OW_UP | $2, $0, -1, -1, (PAL_OW_BROWN << 4) | $80, 0, BlackBeltScript_0x7e1f6, -1
	person_event SPRITE_POKE_BALL, 28, 38, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x7e244, EVENT_MOUNT_MORTAR_B1F_FULL_RESTORE
	person_event SPRITE_POKE_BALL, 7, 36, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x7e246, EVENT_MOUNT_MORTAR_B1F_MAX_ETHER
	person_event SPRITE_POKE_BALL, 30, 25, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x7e248, EVENT_MOUNT_MORTAR_B1F_PP_UP
