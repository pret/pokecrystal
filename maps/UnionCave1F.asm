const_value set 2
	const UNIONCAVE1F_POKEFAN_M1
	const UNIONCAVE1F_SUPER_NERD
	const UNIONCAVE1F_POKEFAN_M2
	const UNIONCAVE1F_FISHER1
	const UNIONCAVE1F_FISHER2
	const UNIONCAVE1F_POKE_BALL1
	const UNIONCAVE1F_POKE_BALL2
	const UNIONCAVE1F_POKE_BALL3
	const UNIONCAVE1F_POKE_BALL4

UnionCave1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerPokemaniacLarry:
	trainer EVENT_BEAT_POKEMANIAC_LARRY, POKEMANIAC, LARRY, PokemaniacLarrySeenText, PokemaniacLarryBeatenText, 0, PokemaniacLarryScript

PokemaniacLarryScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x59d31
	waitbutton
	closetext
	end

TrainerHikerRussell:
	trainer EVENT_BEAT_HIKER_RUSSELL, HIKER, RUSSELL, HikerRussellSeenText, HikerRussellBeatenText, 0, HikerRussellScript

HikerRussellScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x59c6c
	waitbutton
	closetext
	end

TrainerHikerDaniel:
	trainer EVENT_BEAT_HIKER_DANIEL, HIKER, DANIEL, HikerDanielSeenText, HikerDanielBeatenText, 0, HikerDanielScript

HikerDanielScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x59dc9
	waitbutton
	closetext
	end

TrainerFirebreatherBill:
	trainer EVENT_BEAT_FIREBREATHER_BILL, FIREBREATHER, BILL, FirebreatherBillSeenText, FirebreatherBillBeatenText, 0, FirebreatherBillScript

FirebreatherBillScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x59e6f
	waitbutton
	closetext
	end

TrainerFirebreatherRay:
	trainer EVENT_BEAT_FIREBREATHER_RAY, FIREBREATHER, RAY, FirebreatherRaySeenText, FirebreatherRayBeatenText, 0, FirebreatherRayScript

FirebreatherRayScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x59efc
	waitbutton
	closetext
	end

UnionCave1FGreatBall:
	itemball GREAT_BALL

UnionCave1FXAttack:
	itemball X_ATTACK

UnionCave1FPotion:
	itemball POTION

UnionCave1FAwakening:
	itemball AWAKENING

UnknownScript_0x59c08:
	jumptext UnknownText_0x59f29

HikerRussellSeenText:
	text "You're headed to"
	line "AZALEA, are you?"

	para "Let my #MON see"
	line "if you are good"
	cont "enough to battle."
	done

HikerRussellBeatenText:
	text "Oh, oh, oh!"
	done

UnknownText_0x59c6c:
	text "All right, then!"
	line "I've decided."

	para "I'm not leaving"
	line "until my #MON"
	cont "get tougher!"
	done

PokemaniacLarrySeenText:
	text "I roam far and"
	line "wide in search of"
	cont "#MON."

	para "Are you looking"
	line "for #MON too?"

	para "Then you're my"
	line "collecting rival!"
	done

PokemaniacLarryBeatenText:
	text "Ugh. My poor #-"
	line "MON…"
	done

UnknownText_0x59d31:
	text "Every Friday, you"
	line "can hear #MON"

	para "roars from deep"
	line "inside the cave."
	done

HikerDanielSeenText:
	text "Whoa! What a"
	line "surprise!"

	para "I didn't expect to"
	line "see anyone here!"
	done

HikerDanielBeatenText:
	text "Whoa! I'm beaten"
	line "big time!"
	done

UnknownText_0x59dc9:
	text "I was conned into"
	line "buying a SLOWPOKE-"
	cont "TAIL."

	para "I feel sorry for"
	line "the poor #MON."
	done

FirebreatherBillSeenText:
	text "ZUBAT's SUPERSONIC"
	line "keeps confusing"
	cont "my #MON."

	para "I'm seriously"
	line "upset about that!"
	done

FirebreatherBillBeatenText:
	text "I flamed out!"
	done

UnknownText_0x59e6f:
	text "On weekends, you"
	line "can hear strange"

	para "roars from deep in"
	line "the cave."
	done

FirebreatherRaySeenText:
	text "If it's light, a"
	line "cave isn't scary."

	para "If you're strong,"
	line "#MON aren't"
	cont "scary."
	done

FirebreatherRayBeatenText:
	text "FLASH!"
	done

UnknownText_0x59efc:
	text "It's my #MON's"
	line "fire that lights"
	cont "up this cave."
	done

UnknownText_0x59f29:
	text "UNION CAVE"
	done

UnionCave1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $13, $5, 3, UNION_CAVE_B1F
	warp_def $21, $3, 4, UNION_CAVE_B1F
	warp_def $1f, $11, 1, ROUTE_33
	warp_def $3, $11, 4, ROUTE_32

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 9
	person_event SPRITE_POKEFAN_M, 6, 3, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 2, TrainerHikerDaniel, -1
	person_event SPRITE_SUPER_NERD, 21, 4, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerPokemaniacLarry, -1
	person_event SPRITE_POKEFAN_M, 8, 11, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 1, TrainerHikerRussell, -1
	person_event SPRITE_FISHER, 27, 15, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 4, TrainerFirebreatherRay, -1
	person_event SPRITE_FISHER, 19, 14, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 4, TrainerFirebreatherBill, -1
	person_event SPRITE_POKE_BALL, 21, 17, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, UnionCave1FGreatBall, EVENT_UNION_CAVE_1F_GREAT_BALL
	person_event SPRITE_POKE_BALL, 2, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, UnionCave1FXAttack, EVENT_UNION_CAVE_1F_X_ATTACK
	person_event SPRITE_POKE_BALL, 17, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, UnionCave1FPotion, EVENT_UNION_CAVE_1F_POTION
	person_event SPRITE_POKE_BALL, 33, 12, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, UnionCave1FAwakening, EVENT_UNION_CAVE_1F_AWAKENING
