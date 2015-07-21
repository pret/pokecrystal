Route39_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TaurosScript_0x1a5af5:
	loadfont
	writetext UnknownText_0x1a5bf9
	cry MILTANK
	closetext
	loadmovesprites
	end

TrainerPokefanmDerek1:
	trainer EVENT_BEAT_POKEFANM_DEREK, POKEFANM, DEREK1, PokefanmDerek1SeenText, PokefanmDerek1BeatenText, $0000, PokefanmDerek1Script

PokefanmDerek1Script:
	writecode VAR_CALLERID, PHONE_POKEFANM_DEREK
	talkaftercancel
	loadfont
	checkflag ENGINE_DEREK_HAS_NUGGET
	iftrue UnknownScript_0x1a5b4a
	checkcellnum PHONE_POKEFANM_DEREK
	iftrue UnknownScript_0x1a5b6e
	checkpoke PIKACHU
	iffalse UnknownScript_0x1a5b5c
	checkevent EVENT_DEREK_ASKED_FOR_PHONE_NUMBER
	iftrue UnknownScript_0x1a5b33
	writetext UnknownText_0x1a5cf8
	keeptextopen
	setevent EVENT_DEREK_ASKED_FOR_PHONE_NUMBER
	scall UnknownScript_0x1a5b62
	jump UnknownScript_0x1a5b36

UnknownScript_0x1a5b33:
	scall UnknownScript_0x1a5b66
UnknownScript_0x1a5b36:
	askforphonenumber PHONE_POKEFANM_DEREK
	if_equal $1, UnknownScript_0x1a5b76
	if_equal $2, UnknownScript_0x1a5b72
	trainertotext POKEFANM, DEREK1, $0
	scall UnknownScript_0x1a5b6a
	jump UnknownScript_0x1a5b6e

UnknownScript_0x1a5b4a:
	scall UnknownScript_0x1a5b7a
	verbosegiveitem NUGGET, 1
	iffalse UnknownScript_0x1a5b59
	clearflag ENGINE_DEREK_HAS_NUGGET
	jump UnknownScript_0x1a5b6e

UnknownScript_0x1a5b59:
	jump UnknownScript_0x1a5b7e

UnknownScript_0x1a5b5c:
	writetext UnknownText_0x1a5dec
	closetext
	loadmovesprites
	end

UnknownScript_0x1a5b62:
	jumpstd asknumber1m
	end

UnknownScript_0x1a5b66:
	jumpstd asknumber2m
	end

UnknownScript_0x1a5b6a:
	jumpstd registerednumberm
	end

UnknownScript_0x1a5b6e:
	jumpstd numberacceptedm
	end

UnknownScript_0x1a5b72:
	jumpstd numberdeclinedm
	end

UnknownScript_0x1a5b76:
	jumpstd phonefullm
	end

UnknownScript_0x1a5b7a:
	jumpstd giftm
	end

UnknownScript_0x1a5b7e:
	jumpstd packfullm
	end

TrainerPokefanfRuth:
	trainer EVENT_BEAT_POKEFANF_RUTH, POKEFANF, RUTH, PokefanfRuthSeenText, PokefanfRuthBeatenText, $0000, PokefanfRuthScript

PokefanfRuthScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a5db2
	closetext
	loadmovesprites
	end

TrainerSailorEugene:
	trainer EVENT_BEAT_SAILOR_EUGENE, SAILOR, EUGENE, SailorEugeneSeenText, SailorEugeneBeatenText, $0000, SailorEugeneScript

SailorEugeneScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a5c4d
	closetext
	loadmovesprites
	end

TrainerPsychicNorman:
	trainer EVENT_BEAT_PSYCHIC_NORMAN, PSYCHIC_T, NORMAN, PsychicNormanSeenText, PsychicNormanBeatenText, $0000, PsychicNormanScript

PsychicNormanScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a5e57
	closetext
	loadmovesprites
	end

PokefanFScript_0x1a5bbe:
	faceplayer
	loadfont
	checknite
	iffalse UnknownScript_0x1a5be5
	checkevent EVENT_BEAT_POKEFANF_JAIME
	iftrue UnknownScript_0x1a5bdf
	writetext UnknownText_0x1a5ee8
	closetext
	loadmovesprites
	winlosstext UnknownText_0x1a5f17, $0000
	loadtrainer POKEFANF, JAIME
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_POKEFANF_JAIME
	loadmovesprites
	end

UnknownScript_0x1a5bdf:
	writetext UnknownText_0x1a5f31
	closetext
	loadmovesprites
	end

UnknownScript_0x1a5be5:
	writetext UnknownText_0x1a5ec4
	closetext
	loadmovesprites
	end

MapRoute39Signpost2Script:
	jumptext UnknownText_0x1a5fe3

MapRoute39Signpost1Script:
	jumptext UnknownText_0x1a600a

MapRoute39Signpost0Script:
	jumptext UnknownText_0x1a6036

FruitTreeScript_0x1a5bf4:
	fruittree $f

MapRoute39SignpostItem3:
	dwb EVENT_ROUTE_39_HIDDEN_NUGGET, NUGGET
	

UnknownText_0x1a5bf9:
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

UnknownText_0x1a5c4d:
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

UnknownText_0x1a5cf8:
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

UnknownText_0x1a5db2:
	text "Do you know about"
	line "baby #MON?"

	para "I bet they're just"
	line "adorable!"
	done

UnknownText_0x1a5dec:
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

UnknownText_0x1a5e57:
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

UnknownText_0x1a5fe3:
	text "ROUTE 39"

	para "OLIVINE CITY -"
	line "ECRUTEAK CITY"
	done

UnknownText_0x1a600a:
	text "MOOMOO FARM"

	para "Enjoy Our Fresh"
	line "and Tasty Milk"
	done

UnknownText_0x1a6036:
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
	warp_def $3, $1, 1, GROUP_ROUTE_39_BARN, MAP_ROUTE_39_BARN
	warp_def $3, $5, 1, GROUP_ROUTE_39_FARMHOUSE, MAP_ROUTE_39_FARMHOUSE

.XYTriggers:
	db 0

.Signposts:
	db 4
	signpost 31, 5, SIGNPOST_READ, MapRoute39Signpost0Script
	signpost 5, 9, SIGNPOST_READ, MapRoute39Signpost1Script
	signpost 7, 15, SIGNPOST_READ, MapRoute39Signpost2Script
	signpost 13, 5, SIGNPOST_ITEM, MapRoute39SignpostItem3

.PersonEvents:
	db 10
	person_event SPRITE_SAILOR, 33, 17, OW_LEFT | $0, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 5, TrainerSailorEugene, -1
	person_event SPRITE_POKEFAN_M, 26, 14, OW_UP | $3, $0, -1, -1, (PAL_OW_RED << 4) | $82, 4, TrainerPokefanmDerek1, -1
	person_event SPRITE_POKEFAN_F, 23, 15, OW_LEFT | $1, $0, -1, -1, (PAL_OW_RED << 4) | $82, 4, TrainerPokefanfRuth, -1
	person_event SPRITE_TAUROS, 16, 7, OW_UP | $12, $0, -1, -1, $0, 0, TaurosScript_0x1a5af5, -1
	person_event SPRITE_TAUROS, 15, 10, OW_UP | $12, $0, -1, -1, $0, 0, TaurosScript_0x1a5af5, -1
	person_event SPRITE_TAUROS, 19, 8, OW_UP | $12, $0, -1, -1, $0, 0, TaurosScript_0x1a5af5, -1
	person_event SPRITE_TAUROS, 17, 12, OW_UP | $12, $0, -1, -1, $0, 0, TaurosScript_0x1a5af5, -1
	person_event SPRITE_STANDING_YOUNGSTER, 11, 17, OW_LEFT | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 1, TrainerPsychicNorman, -1
	person_event SPRITE_FRUIT_TREE, 7, 13, OW_DOWN | $1, $0, -1, -1, $0, 0, FruitTreeScript_0x1a5bf4, -1
	person_event SPRITE_POKEFAN_F, 26, 8, OW_UP | $2, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, PokefanFScript_0x1a5bbe, -1
