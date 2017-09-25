const_value set 2
	const ROUTE43_SUPER_NERD1
	const ROUTE43_SUPER_NERD2
	const ROUTE43_SUPER_NERD3
	const ROUTE43_FISHER
	const ROUTE43_LASS
	const ROUTE43_YOUNGSTER
	const ROUTE43_FRUIT_TREE
	const ROUTE43_POKE_BALL

Route43_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_NEWMAP, UnknownScript_0x19d051

UnknownScript_0x19d051:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue UnknownScript_0x19d05c
	domaptrigger ROUTE_43_GATE, $0
	return

UnknownScript_0x19d05c:
	domaptrigger ROUTE_43_GATE, $1
	return

TrainerCamperSpencer:
	trainer EVENT_BEAT_CAMPER_SPENCER, CAMPER, SPENCER, CamperSpencerSeenText, CamperSpencerBeatenText, 0, CamperSpencerScript

CamperSpencerScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19d57e
	waitbutton
	closetext
	end

TrainerPokemaniacBen:
	trainer EVENT_BEAT_POKEMANIAC_BEN, POKEMANIAC, BEN, PokemaniacBenSeenText, PokemaniacBenBeatenText, 0, PokemaniacBenScript

PokemaniacBenScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19d2d2
	waitbutton
	closetext
	end

TrainerPokemaniacBrent1:
	trainer EVENT_BEAT_POKEMANIAC_BRENT, POKEMANIAC, BRENT1, PokemaniacBrent1SeenText, PokemaniacBrent1BeatenText, 0, PokemaniacBrent1Script

PokemaniacBrent1Script:
	writecode VAR_CALLERID, PHONE_POKEMANIAC_BRENT
	end_if_just_battled
	opentext
	checkflag ENGINE_BRENT
	iftrue UnknownScript_0x19d0cf
	checkcellnum PHONE_POKEMANIAC_BRENT
	iftrue UnknownScript_0x19d138
	checkevent EVENT_BRENT_ASKED_FOR_PHONE_NUMBER
	iftrue UnknownScript_0x19d0b8
	writetext UnknownText_0x19d359
	buttonsound
	setevent EVENT_BRENT_ASKED_FOR_PHONE_NUMBER
	scall UnknownScript_0x19d12c
	jump UnknownScript_0x19d0bb

UnknownScript_0x19d0b8:
	scall UnknownScript_0x19d130
UnknownScript_0x19d0bb:
	askforphonenumber PHONE_POKEMANIAC_BRENT
	if_equal $1, UnknownScript_0x19d140
	if_equal $2, UnknownScript_0x19d13c
	trainertotext POKEMANIAC, BRENT1, $0
	scall UnknownScript_0x19d134
	jump UnknownScript_0x19d138

UnknownScript_0x19d0cf:
	scall UnknownScript_0x19d144
	winlosstext PokemaniacBrent1BeatenText, 0
	copybytetovar wBrentFightCount
	if_equal 3, .Fight3
	if_equal 2, .Fight2
	if_equal 1, .Fight1
	if_equal 0, .LoadFight0
.Fight3:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight3
.Fight2:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight2
.Fight1:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer POKEMANIAC, BRENT1
	startbattle
	reloadmapafterbattle
	loadvar wBrentFightCount, 1
	clearflag ENGINE_BRENT
	end

.LoadFight1:
	loadtrainer POKEMANIAC, BRENT2
	startbattle
	reloadmapafterbattle
	loadvar wBrentFightCount, 2
	clearflag ENGINE_BRENT
	end

.LoadFight2:
	loadtrainer POKEMANIAC, BRENT3
	startbattle
	reloadmapafterbattle
	loadvar wBrentFightCount, 3
	clearflag ENGINE_BRENT
	end

.LoadFight3:
	loadtrainer POKEMANIAC, BRENT4
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_BRENT
	end

UnknownScript_0x19d12c:
	jumpstd asknumber1m
	end

UnknownScript_0x19d130:
	jumpstd asknumber2m
	end

UnknownScript_0x19d134:
	jumpstd registerednumberm
	end

UnknownScript_0x19d138:
	jumpstd numberacceptedm
	end

UnknownScript_0x19d13c:
	jumpstd numberdeclinedm
	end

UnknownScript_0x19d140:
	jumpstd phonefullm
	end

UnknownScript_0x19d144:
	jumpstd rematchm
	end

TrainerPokemaniacRon:
	trainer EVENT_BEAT_POKEMANIAC_RON, POKEMANIAC, RON, PokemaniacRonSeenText, PokemaniacRonBeatenText, 0, PokemaniacRonScript

PokemaniacRonScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19d3f8
	waitbutton
	closetext
	end

TrainerFisherMarvin:
	trainer EVENT_BEAT_FISHER_MARVIN, FISHER, MARVIN, FisherMarvinSeenText, FisherMarvinBeatenText, 0, FisherMarvinScript

FisherMarvinScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19d4d3
	waitbutton
	closetext
	end

TrainerPicnickerTiffany3:
	trainer EVENT_BEAT_PICNICKER_TIFFANY, PICNICKER, TIFFANY3, PicnickerTiffany3SeenText, PicnickerTiffany3BeatenText, 0, PicnickerTiffany3Script

PicnickerTiffany3Script:
	writecode VAR_CALLERID, PHONE_PICNICKER_TIFFANY
	end_if_just_battled
	opentext
	checkflag ENGINE_TIFFANY
	iftrue UnknownScript_0x19d1c1
	checkflag ENGINE_TIFFANY_HAS_PINK_BOW
	iftrue UnknownScript_0x19d21e
	checkcellnum PHONE_PICNICKER_TIFFANY
	iftrue UnknownScript_0x19d245
	checkpoke CLEFAIRY
	iffalse UnknownScript_0x19d233
	checkevent EVENT_TIFFANY_ASKED_FOR_PHONE_NUMBER
	iftrue UnknownScript_0x19d1aa
	writetext UnknownText_0x19d618
	buttonsound
	setevent EVENT_TIFFANY_ASKED_FOR_PHONE_NUMBER
	scall UnknownScript_0x19d239
	jump UnknownScript_0x19d1ad

UnknownScript_0x19d1aa:
	scall UnknownScript_0x19d23d
UnknownScript_0x19d1ad:
	askforphonenumber PHONE_PICNICKER_TIFFANY
	if_equal $1, UnknownScript_0x19d24d
	if_equal $2, UnknownScript_0x19d249
	trainertotext PICNICKER, TIFFANY3, $0
	scall UnknownScript_0x19d241
	jump UnknownScript_0x19d245

UnknownScript_0x19d1c1:
	scall UnknownScript_0x19d251
	winlosstext PicnickerTiffany3BeatenText, 0
	copybytetovar wTiffanyFightCount
	if_equal 3, .Fight3
	if_equal 2, .Fight2
	if_equal 1, .Fight1
	if_equal 0, .LoadFight0
.Fight3:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight3
.Fight2:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight2
.Fight1:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer PICNICKER, TIFFANY3
	startbattle
	reloadmapafterbattle
	loadvar wTiffanyFightCount, 1
	clearflag ENGINE_TIFFANY
	end

.LoadFight1:
	loadtrainer PICNICKER, TIFFANY1
	startbattle
	reloadmapafterbattle
	loadvar wTiffanyFightCount, 2
	clearflag ENGINE_TIFFANY
	end

.LoadFight2:
	loadtrainer PICNICKER, TIFFANY2
	startbattle
	reloadmapafterbattle
	loadvar wTiffanyFightCount, 3
	clearflag ENGINE_TIFFANY
	end

.LoadFight3:
	loadtrainer PICNICKER, TIFFANY4
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_TIFFANY
	end

UnknownScript_0x19d21e:
	scall UnknownScript_0x19d255
	verbosegiveitem PINK_BOW
	iffalse UnknownScript_0x19d230
	clearflag ENGINE_TIFFANY_HAS_PINK_BOW
	setevent EVENT_TIFFANY_GAVE_PINK_BOW
	jump UnknownScript_0x19d245

UnknownScript_0x19d230:
	jump UnknownScript_0x19d259

UnknownScript_0x19d233:
	writetext UnknownText_0x19d64b
	waitbutton
	closetext
	end

UnknownScript_0x19d239:
	jumpstd asknumber1f
	end

UnknownScript_0x19d23d:
	jumpstd asknumber2f
	end

UnknownScript_0x19d241:
	jumpstd registerednumberf
	end

UnknownScript_0x19d245:
	jumpstd numberacceptedf
	end

UnknownScript_0x19d249:
	jumpstd numberdeclinedf
	end

UnknownScript_0x19d24d:
	jumpstd phonefullf
	end

UnknownScript_0x19d251:
	jumpstd rematchf
	end

UnknownScript_0x19d255:
	jumpstd giftf
	end

UnknownScript_0x19d259:
	jumpstd packfullf
	end

Route43Sign1:
	jumptext Route43Sign1Text

Route43Sign2:
	jumptext Route43Sign2Text

Route43TrainerTips:
	jumptext Route43TrainerTipsText

FruitTreeScript_0x19d266:
	fruittree FRUITTREE_ROUTE_43

Route43MaxEther:
	itemball MAX_ETHER

PokemaniacBenSeenText:
	text "I love #MON!"

	para "That's why I"
	line "started--and why"

	para "I'll keep on col-"
	line "lecting #MON!"
	done

PokemaniacBenBeatenText:
	text "How could you do"
	line "this to me?"
	done

UnknownText_0x19d2d2:
	text "What else do I"
	line "like besides"
	cont "#MON?"

	para "MARY on the radio."
	line "I bet she's cute!"
	done

PokemaniacBrent1SeenText:
	text "Hey! Do you have"
	line "any rare #MON?"
	done

PokemaniacBrent1BeatenText:
	text "Oh, my poor #-"
	line "MON! Darlings!"
	done

UnknownText_0x19d359:
	text "I'd be happy just"
	line "to own a single"
	cont "rare #MON."
	done

PokemaniacRonSeenText:
	text "Would you get"
	line "this?"

	para "Some <RIVAL> guy"
	line "made fun of my"
	cont "#MON!"

	para "Darn it! My #-"
	line "MON's great!"
	done

PokemaniacRonBeatenText:
	text "My NIDOKING did"
	line "pretty right on!"
	done

UnknownText_0x19d3f8:
	text "It's okay for"
	line "people to like"

	para "different types"
	line "of #MON."

	para "#MON isn't just"
	line "about having the"
	cont "most powerful one."
	done

FisherMarvinSeenText:
	text "I'm in a slump."

	para "Maybe it's the"
	line "gear I'm using."

	para "Let's battle for a"
	line "change of pace!"
	done

FisherMarvinBeatenText:
	text "I lost, but I feel"
	line "better anyway."
	done

UnknownText_0x19d4d3:
	text "KURT's LURE BALL"
	line "is the best for"

	para "catching hooked"
	line "#MON."

	para "It's much more"
	line "effective than a"
	cont "ULTRA BALL."
	done

CamperSpencerSeenText:
	text "I can do so much"
	line "with my #MON--"
	cont "it's super-fun!"
	done

CamperSpencerBeatenText:
	text "Losing isn't fun"
	line "at all…"
	done

UnknownText_0x19d57e:
	text "What is going on"
	line "at LAKE OF RAGE?"

	para "We were planning"
	line "to camp there."
	done

PicnickerTiffany3SeenText:
	text "Are you going to"
	line "LAKE OF RAGE too?"

	para "Let's play for a "
	line "little while!"
	done

PicnickerTiffany3BeatenText:
	text "I played too much!"
	done

UnknownText_0x19d618:
	text "I'm having a pic-"
	line "nic with #MON."

	para "Won't you join us?"
	done

UnknownText_0x19d64b:
	text "Isn't my CLEFAIRY"
	line "just the most"
	cont "adorable thing?"
	done

Route43Sign1Text:
	text "ROUTE 43"

	para "LAKE OF RAGE -"
	line "MAHOGANY TOWN"
	done

Route43Sign2Text:
	text "ROUTE 43"

	para "LAKE OF RAGE -"
	line "MAHOGANY TOWN"
	done

Route43TrainerTipsText:
	text "TRAINER TIPS"

	para "All #MON have"
	line "pros and cons"

	para "depending on their"
	line "types."

	para "If their types"
	line "differ, a higher-"

	para "level #MON may"
	line "lose in battle."

	para "Learn which types"
	line "are strong and"

	para "weak against your"
	line "#MON's type."
	done

Route43_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 5
	warp_def $33, $9, 1, ROUTE_43_MAHOGANY_GATE
	warp_def $33, $a, 2, ROUTE_43_MAHOGANY_GATE
	warp_def $23, $11, 3, ROUTE_43_GATE
	warp_def $1f, $11, 1, ROUTE_43_GATE
	warp_def $1f, $12, 2, ROUTE_43_GATE

.XYTriggers:
	db 0

.Signposts:
	db 3
	signpost 3, 13, SIGNPOST_READ, Route43Sign1
	signpost 49, 11, SIGNPOST_READ, Route43Sign2
	signpost 38, 16, SIGNPOST_READ, Route43TrainerTips

.PersonEvents:
	db 8
	person_event SPRITE_SUPER_NERD, 5, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerPokemaniacBen, -1
	person_event SPRITE_SUPER_NERD, 20, 13, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerPokemaniacBrent1, -1
	person_event SPRITE_SUPER_NERD, 7, 14, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerPokemaniacRon, -1
	person_event SPRITE_FISHER, 16, 4, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 4, TrainerFisherMarvin, -1
	person_event SPRITE_LASS, 25, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 2, TrainerPicnickerTiffany3, -1
	person_event SPRITE_YOUNGSTER, 40, 13, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 3, TrainerCamperSpencer, -1
	person_event SPRITE_FRUIT_TREE, 26, 1, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, FruitTreeScript_0x19d266, -1
	person_event SPRITE_POKE_BALL, 32, 12, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route43MaxEther, EVENT_ROUTE_43_MAX_ETHER
