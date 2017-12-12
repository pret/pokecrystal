const_value set 2
	const ROUTE39_SAILOR
	const ROUTE39_POKEFAN_M
	const ROUTE39_POKEFAN_F1
	const ROUTE39_MILTANK1
	const ROUTE39_MILTANK2
	const ROUTE39_MILTANK3
	const ROUTE39_MILTANK4
	const ROUTE39_PSYCHIC_NORMAN
	const ROUTE39_FRUIT_TREE
	const ROUTE39_POKEFAN_F2

Route39_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

Route39Miltank:
	opentext
	writetext Route39MiltankText
	cry MILTANK
	waitbutton
	closetext
	end

TrainerPokefanmDerek1:
	trainer EVENT_BEAT_POKEFANM_DEREK, POKEFANM, DEREK1, PokefanmDerek1SeenText, PokefanmDerek1BeatenText, 0, PokefanmDerek1Script

PokefanmDerek1Script:
	writecode VAR_CALLERID, PHONE_POKEFANM_DEREK
	end_if_just_battled
	opentext
	checkflag ENGINE_DEREK_HAS_NUGGET
	iftrue PokefanMDerekHasNugget
	checkcellnum PHONE_POKEFANM_DEREK
	iftrue PokefanMDerekAccepted
	checkpoke PIKACHU
	iffalse PokefanMDerekWantsPikachu
	checkevent EVENT_DEREK_ASKED_FOR_PHONE_NUMBER
	iftrue PokefanMDerekWantsYourNumber
	writetext PokefanMDerekText_NotBragging
	buttonsound
	setevent EVENT_DEREK_ASKED_FOR_PHONE_NUMBER
	scall PokefanMDerekAsksNumber1
	jump PokefanMDerekAsksForPhoneNumber

PokefanMDerekWantsYourNumber:
	scall PokefanMDerekAsksNumber2
PokefanMDerekAsksForPhoneNumber:
	askforphonenumber PHONE_POKEFANM_DEREK
	if_equal $1, PokefanMDerekPhoneFull
	if_equal $2, PokefanMDerekDeclined
	trainertotext POKEFANM, DEREK1, $0
	scall PokefanMDerekRegistered
	jump PokefanMDerekAccepted

PokefanMDerekHasNugget:
	scall PokefanMDerekGift
	verbosegiveitem NUGGET
	iffalse .PackFull
	clearflag ENGINE_DEREK_HAS_NUGGET
	jump PokefanMDerekAccepted

.PackFull:
	jump PackIsFull

PokefanMDerekWantsPikachu:
	writetext PokefanMDerekText_PikachuIsIt
	waitbutton
	closetext
	end

PokefanMDerekAsksNumber1:
	jumpstd asknumber1m
	end

PokefanMDerekAsksNumber2:
	jumpstd asknumber2m
	end

PokefanMDerekRegistered:
	jumpstd registerednumberm
	end

PokefanMDerekAccepted:
	jumpstd numberacceptedm
	end

PokefanMDerekDeclined:
	jumpstd numberdeclinedm
	end

PokefanMDerekPhoneFull:
	jumpstd phonefullm
	end

PokefanMDerekGift:
	jumpstd giftm
	end

PackIsFull:
	jumpstd packfullm
	end

TrainerPokefanfRuth:
	trainer EVENT_BEAT_POKEFANF_RUTH, POKEFANF, RUTH, PokefanfRuthSeenText, PokefanfRuthBeatenText, 0, PokefanfRuthScript

PokefanfRuthScript:
	end_if_just_battled
	opentext
	writetext PokefanfRuthAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorEugene:
	trainer EVENT_BEAT_SAILOR_EUGENE, SAILOR, EUGENE, SailorEugeneSeenText, SailorEugeneBeatenText, 0, SailorEugeneScript

SailorEugeneScript:
	end_if_just_battled
	opentext
	writetext SailorEugeneAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicNorman:
	trainer EVENT_BEAT_PSYCHIC_NORMAN, PSYCHIC_T, NORMAN, PsychicNormanSeenText, PsychicNormanBeatenText, 0, PsychicNormanScript

PsychicNormanScript:
	end_if_just_battled
	opentext
	writetext PsychicNormanAfterBattleText
	waitbutton
	closetext
	end

PokefanFScript_0x1a5bbe:
	faceplayer
	opentext
	checknite
	iffalse UnknownScript_0x1a5be5
	checkevent EVENT_BEAT_POKEFANF_JAIME
	iftrue UnknownScript_0x1a5bdf
	writetext UnknownText_0x1a5ee8
	waitbutton
	closetext
	winlosstext UnknownText_0x1a5f17, 0
	loadtrainer POKEFANF, JAIME
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_POKEFANF_JAIME
	closetext
	end

UnknownScript_0x1a5bdf:
	writetext UnknownText_0x1a5f31
	waitbutton
	closetext
	end

UnknownScript_0x1a5be5:
	writetext UnknownText_0x1a5ec4
	waitbutton
	closetext
	end

Route39Sign:
	jumptext Route39SignText

MoomooFarmSign:
	jumptext MoomooFarmSignText

Route39TrainerTips:
	jumptext Route39TrainerTipsText

FruitTreeScript_0x1a5bf4:
	fruittree FRUITTREE_ROUTE_39

Route39HiddenNugget:
	dwb EVENT_ROUTE_39_HIDDEN_NUGGET, NUGGET


Route39MiltankText:
	text "MILTANK: Mooo!"
	done

SailorEugeneSeenText:
	text "I just got back to"
	line "OLIVINE."

	para "So how about a"
	line "#MON battle?"
	done

SailorEugeneBeatenText:
	text "Awaaargh!"
	done

SailorEugeneAfterBattleText:
	text "My #MON were"
	line "caught and raised"
	cont "overseas."

	para "They're my compan-"
	line "ions on those long"
	cont "voyages."
	done

PokefanmDerek1SeenText:
	text "This is a good"
	line "time to brag about"
	cont "my PIKACHU!"
	done

PokefanmDerek1BeatenText:
	text "I had no time to"
	line "show off PIKACHU…"
	done

PokefanMDerekText_NotBragging:
	text "I'm not listening"
	line "to your bragging!"

	para "We # FANS have"
	line "a policy of not"

	para "listening to other"
	line "people brag!"
	done

PokefanfRuthSeenText:
	text "Such darling"
	line "#MON."

	para "Let's show our"
	line "#MON together"
	cont "at the same time."
	done

PokefanfRuthBeatenText:
	text "I don't mind"
	line "losing."
	done

PokefanfRuthAfterBattleText:
	text "Do you know about"
	line "baby #MON?"

	para "I bet they're just"
	line "adorable!"
	done

PokefanMDerekText_PikachuIsIt:
	text "PIKACHU is it!"
	line "Don't you agree?"
	done

PsychicNormanSeenText:
	text "Let me see what"
	line "your #MON are"
	cont "capable of."
	done

PsychicNormanBeatenText:
	text "Ooh, your #MON"
	line "have potential."
	done

PsychicNormanAfterBattleText:
	text "You know how #-"
	line "MON have different"
	cont "abilities?"

	para "People are like"
	line "that too. Every-"
	cont "one has different"
	cont "potential."
	done

UnknownText_0x1a5ec4:
	text "Ufufufu… I hope it"
	line "gets dark soon."
	done

UnknownText_0x1a5ee8:
	text "You came at just"
	line "the right time."

	para "Let's battle."
	done

UnknownText_0x1a5f17:
	text "Oh, how disap-"
	line "pointing…"
	done

UnknownText_0x1a5f31:
	text "I met my MEOWTH at"
	line "night, right here"
	cont "on ROUTE 39."

	para "I'm not sure why,"
	line "but it seems to"

	para "like it when I"
	line "train here."

	para "It seems to become"
	line "friendlier by"

	para "training here than"
	line "anywhere else."
	done

Route39SignText:
	text "ROUTE 39"

	para "OLIVINE CITY -"
	line "ECRUTEAK CITY"
	done

MoomooFarmSignText:
	text "MOOMOO FARM"

	para "Enjoy Our Fresh"
	line "and Tasty Milk"
	done

Route39TrainerTipsText:
	text "TRAINER TIPS"

	para "Use HEADBUTT on"
	line "trees to shake"
	cont "#MON out."

	para "Different kinds of"
	line "#MON drop out"
	cont "of trees."

	para "Use HEADBUTT on"
	line "any tree you see!"
	done

Route39_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $3, $1, 1, ROUTE_39_BARN
	warp_def $3, $5, 1, ROUTE_39_FARMHOUSE

.XYTriggers:
	db 0

.Signposts:
	db 4
	signpost 31, 5, SIGNPOST_READ, Route39TrainerTips
	signpost 5, 9, SIGNPOST_READ, MoomooFarmSign
	signpost 7, 15, SIGNPOST_READ, Route39Sign
	signpost 13, 5, SIGNPOST_ITEM, Route39HiddenNugget

.PersonEvents:
	db 10
	person_event SPRITE_SAILOR, 29, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, PERSONTYPE_TRAINER, 5, TrainerSailorEugene, -1
	person_event SPRITE_POKEFAN_M, 22, 10, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, PERSONTYPE_TRAINER, 4, TrainerPokefanmDerek1, -1
	person_event SPRITE_POKEFAN_F, 19, 11, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, PERSONTYPE_TRAINER, 4, TrainerPokefanfRuth, -1
	person_event SPRITE_TAUROS, 12, 3, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route39Miltank, -1
	person_event SPRITE_TAUROS, 11, 6, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route39Miltank, -1
	person_event SPRITE_TAUROS, 15, 4, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route39Miltank, -1
	person_event SPRITE_TAUROS, 13, 8, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route39Miltank, -1
	person_event SPRITE_STANDING_YOUNGSTER, 7, 13, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, PERSONTYPE_TRAINER, 1, TrainerPsychicNorman, -1
	person_event SPRITE_FRUIT_TREE, 3, 9, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, FruitTreeScript_0x1a5bf4, -1
	person_event SPRITE_POKEFAN_F, 22, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, PokefanFScript_0x1a5bbe, -1
