Route30_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

YoungsterScript_0x1a1673:
	waitbutton
	playmusic MUSIC_JOHTO_TRAINER_BATTLE
	loadfont
	writetext UnknownText_0x1a1806
	pause 30
	loadmovesprites
	playsound SFX_TACKLE
	applymovement $8, MovementData_0x1a17fe
	loadfont
	faceplayer
	writetext UnknownText_0x1a181c
	closetext
	spriteface $2, UP
	loadmovesprites
	playsound SFX_TACKLE
	applymovement $7, MovementData_0x1a1802
	special RestartMapMusic
	end

TrainerYoungsterJoey:
	; bit/flag number
	dw EVENT_BEAT_YOUNGSTER_JOEY

	; trainer group && trainer id
	db YOUNGSTER, JOEY1

	; text when seen
	dw YoungsterJoey1SeenText

	; text when trainer beaten
	dw YoungsterJoey1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw YoungsterJoey1Script

YoungsterJoey1Script:
	writecode VAR_CALLERID, $f
	talkaftercancel
	loadfont
	checkflag $006b
	iftrue UnknownScript_0x1a16e0
	checkcellnum $f
	iftrue UnknownScript_0x1a178f
	checkevent $0273
	iftrue UnknownScript_0x1a16c9
	writetext UnknownText_0x1a18c2
	keeptextopen
	setevent $0273
	scall UnknownScript_0x1a1783
	jump UnknownScript_0x1a16cc

UnknownScript_0x1a16c9:
	scall UnknownScript_0x1a1787
UnknownScript_0x1a16cc:
	askforphonenumber $f
	if_equal $1, UnknownScript_0x1a1797
	if_equal $2, UnknownScript_0x1a1793
	trainertotext YOUNGSTER, JOEY1, $0
	scall UnknownScript_0x1a178b
	jump UnknownScript_0x1a178f

UnknownScript_0x1a16e0:
	scall UnknownScript_0x1a179b
	winlosstext YoungsterJoey1BeatenText, $0000
	copybytetovar wd9f9
	if_equal $4, UnknownScript_0x1a16ff
	if_equal $3, UnknownScript_0x1a1705
	if_equal $2, UnknownScript_0x1a170b
	if_equal $1, UnknownScript_0x1a1711
	if_equal $0, UnknownScript_0x1a1717
UnknownScript_0x1a16ff:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue UnknownScript_0x1a174b
UnknownScript_0x1a1705:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue UnknownScript_0x1a173e
UnknownScript_0x1a170b:
	checkflag $0047
	iftrue UnknownScript_0x1a1731
UnknownScript_0x1a1711:
	checkflag $0046
	iftrue UnknownScript_0x1a1724
UnknownScript_0x1a1717:
	loadtrainer YOUNGSTER, JOEY1
	startbattle
	returnafterbattle
	loadvar wd9f9, $1
	clearflag $006b
	end

UnknownScript_0x1a1724:
	loadtrainer YOUNGSTER, JOEY2
	startbattle
	returnafterbattle
	loadvar wd9f9, $2
	clearflag $006b
	end

UnknownScript_0x1a1731:
	loadtrainer YOUNGSTER, JOEY3
	startbattle
	returnafterbattle
	loadvar wd9f9, $3
	clearflag $006b
	end

UnknownScript_0x1a173e:
	loadtrainer YOUNGSTER, JOEY4
	startbattle
	returnafterbattle
	loadvar wd9f9, $4
	clearflag $006b
	end

UnknownScript_0x1a174b:
	loadtrainer YOUNGSTER, JOEY5
	startbattle
	returnafterbattle
	clearflag $006b
	checkevent EVENT_JOEY_HP_UP
	iftrue UnknownScript_0x1a176f
	checkevent $0266
	iftrue UnknownScript_0x1a176e
	scall UnknownScript_0x1a17a6
	verbosegiveitem HP_UP, 1
	iffalse UnknownScript_0x1a179f
	setevent $0266
	jump UnknownScript_0x1a178f

UnknownScript_0x1a176e:
	end

UnknownScript_0x1a176f:
	loadfont
	writetext UnknownText_0x1a1bc0
	closetext
	verbosegiveitem HP_UP, 1
	iffalse UnknownScript_0x1a179f
	clearevent EVENT_JOEY_HP_UP
	setevent $0266
	jump UnknownScript_0x1a178f

UnknownScript_0x1a1783:
	jumpstd asknumber1m
	end

UnknownScript_0x1a1787:
	jumpstd asknumber2m
	end

UnknownScript_0x1a178b:
	jumpstd registerednumberm
	end

UnknownScript_0x1a178f:
	jumpstd numberacceptedm
	end

UnknownScript_0x1a1793:
	jumpstd numberdeclinedm
	end

UnknownScript_0x1a1797:
	jumpstd phonefullm
	end

UnknownScript_0x1a179b:
	jumpstd rematchm
	end

UnknownScript_0x1a179f:
	setevent EVENT_JOEY_HP_UP
	jumpstd packfullm
	end

UnknownScript_0x1a17a6:
	jumpstd rematchgiftm
	end

TrainerYoungsterMikey:
	; bit/flag number
	dw EVENT_BEAT_YOUNGSTER_MIKEY

	; trainer group && trainer id
	db YOUNGSTER, MIKEY

	; text when seen
	dw YoungsterMikeySeenText

	; text when trainer beaten
	dw YoungsterMikeyBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw YoungsterMikeyScript

YoungsterMikeyScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a197d
	closetext
	loadmovesprites
	end

TrainerBug_catcherDon:
	; bit/flag number
	dw EVENT_BEAT_BUG_CATCHER_DON

	; trainer group && trainer id
	db BUG_CATCHER, DON

	; text when seen
	dw Bug_catcherDonSeenText

	; text when trainer beaten
	dw Bug_catcherDonBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Bug_catcherDonScript

Bug_catcherDonScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a1a1c
	closetext
	loadmovesprites
	end

YoungsterScript_0x1a17d2:
	faceplayer
	loadfont
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue UnknownScript_0x1a17e0
	writetext UnknownText_0x1a1a6a
	closetext
	loadmovesprites
	end

UnknownScript_0x1a17e0:
	writetext UnknownText_0x1a1a94
	closetext
	loadmovesprites
	end

CooltrainerFScript_0x1a17e6:
	jumptextfaceplayer UnknownText_0x1a1ac4

MapRoute30Signpost0Script:
	jumptext UnknownText_0x1a1b0b

MapRoute30Signpost1Script:
	jumptext UnknownText_0x1a1b34

MapRoute30Signpost2Script:
	jumptext UnknownText_0x1a1b55

MapRoute30Signpost3Script:
	jumptext UnknownText_0x1a1b66

ItemFragment_0x1a17f5:
	db ANTIDOTE, 1

FruitTreeScript_0x1a17f7:
	fruittree $2

FruitTreeScript_0x1a17f9:
	fruittree $5

MapRoute30SignpostItem4:
	dw $00a4
	db POTION
	

MovementData_0x1a17fe:
	fix_facing
	big_step_up
	big_step_down
	step_end

MovementData_0x1a1802:
	fix_facing
	big_step_down
	big_step_up
	step_end

UnknownText_0x1a1806:
	text "Go, RATTATA!"

	para "TACKLE!"
	done

UnknownText_0x1a181c:
	text "What? This is a"
	line "big battle!"
	cont "Leave me alone!"
	done

YoungsterJoey1SeenText:
	text "I just lost, so"
	line "I'm trying to find"
	cont "more #MON."

	para "Wait! You look"
	line "weak! Come on,"
	cont "let's battle!"
	done

YoungsterJoey1BeatenText:
	text "Ack! I lost again!"
	line "Doggone it!"
	done

UnknownText_0x1a18c2:
	text "Do I have to have"
	line "more #MON in"

	para "order to battle"
	line "better?"

	para "No! I'm sticking"
	line "with this one no"
	cont "matter what!"
	done

YoungsterMikeySeenText:
	text "You're a #MON"
	line "trainer, right?"

	para "Then you have to"
	line "battle!"
	done

YoungsterMikeyBeatenText:
	text "That's strange."
	line "I won before."
	done

UnknownText_0x1a197d:
	text "Becoming a good"
	line "trainer is really"
	cont "tough."

	para "I'm going to bat-"
	line "tle other people"
	cont "to get better."
	done

Bug_catcherDonSeenText:
	text "Instead of a bug"
	line "#MON, I found"
	cont "a trainer!"
	done

Bug_catcherDonBeatenText:
	text "Argh! You're too"
	line "strong!"
	done

UnknownText_0x1a1a1c:
	text "I ran out of #"
	line "BALLS while I was"
	cont "catching #MON."

	para "I should've bought"
	line "some more…"
	done

UnknownText_0x1a1a6a:
	text "MR.#MON's"
	line "house? It's a bit"
	cont "farther ahead."
	done

UnknownText_0x1a1a94:
	text "Everyone's having"
	line "fun battling!"
	cont "You should too!"
	done

UnknownText_0x1a1ac4:
	text "I'm not a trainer."

	para "But if you look"
	line "one in the eyes,"
	cont "prepare to battle."
	done

UnknownText_0x1a1b0b:
	text "ROUTE 30"

	para "VIOLET CITY -"
	line "CHERRYGROVE CITY"
	done

UnknownText_0x1a1b34:
	text "MR.#MON'S HOUSE"
	line "STRAIGHT AHEAD!"
	done

UnknownText_0x1a1b55:
	text "MR.#MON'S HOUSE"
	done

UnknownText_0x1a1b66:
	text "TRAINER TIPS"

	para "No stealing other"
	line "people's #MON!"

	para "# BALLS are to"
	line "be thrown only at"
	cont "wild #MON!"
	done

UnknownText_0x1a1bc0:
	text "I lost again…"
	line "Gee, you're tough!"

	para "Oh yeah, I almost"
	line "forgot that I had"
	cont "to give you this."

	para "Use it to get even"
	line "tougher, OK?"

	para "I'm going to get"
	line "tougher too."
	done

Route30_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $27, $7, 1, GROUP_ROUTE_30_BERRY_SPEECH_HOUSE, MAP_ROUTE_30_BERRY_SPEECH_HOUSE
	warp_def $5, $11, 1, GROUP_MR_POKEMONS_HOUSE, MAP_MR_POKEMONS_HOUSE

	; xy triggers
	db 0

	; signposts
	db 5
	signpost 43, 9, $0, MapRoute30Signpost0Script
	signpost 29, 13, $0, MapRoute30Signpost1Script
	signpost 5, 15, $0, MapRoute30Signpost2Script
	signpost 21, 3, $0, MapRoute30Signpost3Script
	signpost 9, 14, $7, MapRoute30SignpostItem4

	; people-events
	db 11
	person_event SPRITE_YOUNGSTER, 30, 9, $7, $0, 255, 255, $90, 0, YoungsterScript_0x1a1673, $0714
	person_event SPRITE_YOUNGSTER, 32, 6, $9, $0, 255, 255, $92, 3, TrainerYoungsterJoey, $0715
	person_event SPRITE_YOUNGSTER, 27, 9, $6, $0, 255, 255, $92, 1, TrainerYoungsterMikey, $ffff
	person_event SPRITE_BUG_CATCHER, 11, 5, $6, $0, 255, 255, $b2, 3, TrainerBug_catcherDon, $ffff
	person_event SPRITE_YOUNGSTER, 34, 11, $5, $1, 255, 255, $80, 0, YoungsterScript_0x1a17d2, $ffff
	person_event SPRITE_MONSTER, 28, 9, $6, $0, 255, 255, $80, 0, ObjectEvent, $0714
	person_event SPRITE_MONSTER, 29, 9, $7, $0, 255, 255, $90, 0, ObjectEvent, $0714
	person_event SPRITE_FRUIT_TREE, 43, 9, $1, $0, 255, 255, $0, 0, FruitTreeScript_0x1a17f7, $ffff
	person_event SPRITE_FRUIT_TREE, 9, 15, $1, $0, 255, 255, $0, 0, FruitTreeScript_0x1a17f9, $ffff
	person_event SPRITE_COOLTRAINER_F, 17, 6, $6, $0, 255, 255, $0, 0, CooltrainerFScript_0x1a17e6, $ffff
	person_event SPRITE_POKE_BALL, 39, 12, $1, $0, 255, 255, $1, 0, ItemFragment_0x1a17f5, $07b8
