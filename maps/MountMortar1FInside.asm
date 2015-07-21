MountMortar1FInside_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerPokemaniacMiller:
	trainer EVENT_BEAT_POKEMANIAC_MILLER, POKEMANIAC, MILLER, PokemaniacMillerSeenText, PokemaniacMillerBeatenText, $0000, PokemaniacMillerScript

PokemaniacMillerScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x7debd
	closetext
	loadmovesprites
	end

TrainerSupernerdMarkus:
	trainer EVENT_BEAT_SUPER_NERD_MARKUS, SUPER_NERD, MARKUS, SupernerdMarkusSeenText, SupernerdMarkusBeatenText, $0000, SupernerdMarkusScript

SupernerdMarkusScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x7df97
	closetext
	loadmovesprites
	end

MountMortar1FBoulder:
	jumpstd strengthboulder

ItemFragment_0x7de7c:
	db ESCAPE_ROPE, 1

ItemFragment_0x7de7e:
	db MAX_REVIVE, 1

ItemFragment_0x7de80:
	db HYPER_POTION, 1

ItemFragment_0x7de82:
	db MAX_POTION, 1

ItemFragment_0x7de84:
	db NUGGET, 1

ItemFragment_0x7de86:
	db IRON, 1

ItemFragment_0x7de88:
	db ULTRA_BALL, 1

MapMountMortar1FInsideSignpostItem0:
	dwb EVENT_MOUNT_MORTAR_1F_INSIDE_HIDDEN_MAX_REPEL, MAX_REPEL
	

PokemaniacMillerSeenText:
	text "I'm not losing"
	line "this time!"
	done

PokemaniacMillerBeatenText:
	text "I lost to some"
	line "kid…?"
	done

UnknownText_0x7debd:
	text "A while back, this"
	line "karate dude wanted"

	para "to battle. He was"
	line "ridiculously good."

	para "He just thrashed"
	line "us silly."

	para "He went in deeper"
	line "saying it was for"

	para "his training. I"
	line "wonder how he is?"
	done

SupernerdMarkusSeenText:
	text "Hey! HUGH!"
	done

SupernerdMarkusBeatenText:
	text "I mistook you for"
	line "someone else…"
	done

UnknownText_0x7df97:
	text "I came to explore"
	line "MT.MORTAR, but I"

	para "got separated from"
	line "my partner…"

	para "Did you run into a"
	line "trainer who uses a"

	para "SEADRA that knows"
	line "WATERFALL?"
	done

MountMortar1FInside_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 6
	warp_def $2f, $b, 5, GROUP_MOUNT_MORTAR_1F_OUTSIDE, MAP_MOUNT_MORTAR_1F_OUTSIDE
	warp_def $2f, $1d, 6, GROUP_MOUNT_MORTAR_1F_OUTSIDE, MAP_MOUNT_MORTAR_1F_OUTSIDE
	warp_def $27, $5, 8, GROUP_MOUNT_MORTAR_1F_OUTSIDE, MAP_MOUNT_MORTAR_1F_OUTSIDE
	warp_def $29, $21, 9, GROUP_MOUNT_MORTAR_1F_OUTSIDE, MAP_MOUNT_MORTAR_1F_OUTSIDE
	warp_def $13, $3, 1, GROUP_MOUNT_MORTAR_B1F, MAP_MOUNT_MORTAR_B1F
	warp_def $9, $9, 2, GROUP_MOUNT_MORTAR_2F_INSIDE, MAP_MOUNT_MORTAR_2F_INSIDE

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 11, 30, SIGNPOST_ITEM, MapMountMortar1FInsideSignpostItem0

.PersonEvents:
	db 10
	person_event SPRITE_BOULDER, 47, 25, OW_LEFT | $11, $0, -1, -1, $0, 0, MountMortar1FBoulder, -1
	person_event SPRITE_POKE_BALL, 42, 39, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x7de7c, EVENT_MOUNT_MORTAR_1F_INSIDE_ESCAPE_ROPE
	person_event SPRITE_POKE_BALL, 14, 20, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x7de7e, EVENT_MOUNT_MORTAR_1F_INSIDE_MAX_REVIVE
	person_event SPRITE_POKE_BALL, 31, 14, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x7de80, EVENT_MOUNT_MORTAR_1F_INSIDE_HYPER_POTION
	person_event SPRITE_POKE_BALL, 24, 26, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x7de82, EVENT_MOUNT_MORTAR_1F_INSIDE_MAX_POTION
	person_event SPRITE_POKE_BALL, 23, 39, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x7de84, EVENT_MOUNT_MORTAR_1F_INSIDE_NUGGET
	person_event SPRITE_SUPER_NERD, 47, 37, OW_LEFT | $0, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 3, TrainerPokemaniacMiller, -1
	person_event SPRITE_SUPER_NERD, 32, 28, OW_LEFT | $2, $0, -1, -1, (PAL_OW_BROWN << 4) | $82, 3, TrainerSupernerdMarkus, -1
	person_event SPRITE_POKE_BALL, 20, 12, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x7de86, EVENT_MOUNT_MORTAR_1F_INSIDE_IRON
	person_event SPRITE_POKE_BALL, 21, 21, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x7de88, EVENT_MOUNT_MORTAR_1F_INSIDE_ULTRA_BALL
