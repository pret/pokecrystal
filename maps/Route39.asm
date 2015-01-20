Route39_MapScriptHeader: ; 0x1a5af3
	; trigger count
	db 0

	; callback count
	db 0
; 0x1a5af5

TaurosScript_0x1a5af5: ; 0x1a5af5
	loadfont
	writetext UnknownText_0x1a5bf9
	cry MILTANK
	closetext
	loadmovesprites
	end
; 0x1a5aff

TrainerPokefanmDerek1: ; 0x1a5aff
	; bit/flag number
	dw $4ce

	; trainer group && trainer id
	db POKEFANM, DEREK1

	; text when seen
	dw PokefanmDerek1SeenText

	; text when trainer beaten
	dw PokefanmDerek1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PokefanmDerek1Script
; 0x1a5b0b

PokefanmDerek1Script: ; 0x1a5b0b
	writecode $17, $1c
	talkaftercancel
	loadfont
	checkflag $0083
	iftrue UnknownScript_0x1a5b4a
	checkcellnum $1c
	iftrue UnknownScript_0x1a5b6e
	checkpoke PIKACHU
	iffalse UnknownScript_0x1a5b5c
	checkevent EVENT_SHOWED_DEREK_PIKACHU
	iftrue UnknownScript_0x1a5b33
	writetext UnknownText_0x1a5cf8
	keeptextopen
	setevent EVENT_SHOWED_DEREK_PIKACHU
	scall UnknownScript_0x1a5b62
	jump UnknownScript_0x1a5b36
; 0x1a5b33

UnknownScript_0x1a5b33: ; 0x1a5b33
	scall UnknownScript_0x1a5b66
UnknownScript_0x1a5b36: ; 0x1a5b36
	askforphonenumber $1c
	if_equal $1, UnknownScript_0x1a5b76
	if_equal $2, UnknownScript_0x1a5b72
	trainertotext POKEFANM, DEREK1, $0
	scall UnknownScript_0x1a5b6a
	jump UnknownScript_0x1a5b6e
; 0x1a5b4a

UnknownScript_0x1a5b4a: ; 0x1a5b4a
	scall UnknownScript_0x1a5b7a
	verbosegiveitem NUGGET, 1
	iffalse UnknownScript_0x1a5b59
	clearflag $0083
	jump UnknownScript_0x1a5b6e
; 0x1a5b59

UnknownScript_0x1a5b59: ; 0x1a5b59
	jump UnknownScript_0x1a5b7e
; 0x1a5b5c

UnknownScript_0x1a5b5c: ; 0x1a5b5c
	writetext UnknownText_0x1a5dec
	closetext
	loadmovesprites
	end
; 0x1a5b62

UnknownScript_0x1a5b62: ; 0x1a5b62
	jumpstd $0019
	end
; 0x1a5b66

UnknownScript_0x1a5b66: ; 0x1a5b66
	jumpstd $001a
	end
; 0x1a5b6a

UnknownScript_0x1a5b6a: ; 0x1a5b6a
	jumpstd $001b
	end
; 0x1a5b6e

UnknownScript_0x1a5b6e: ; 0x1a5b6e
	jumpstd $001c
	end
; 0x1a5b72

UnknownScript_0x1a5b72: ; 0x1a5b72
	jumpstd $001d
	end
; 0x1a5b76

UnknownScript_0x1a5b76: ; 0x1a5b76
	jumpstd $001e
	end
; 0x1a5b7a

UnknownScript_0x1a5b7a: ; 0x1a5b7a
	jumpstd $0020
	end
; 0x1a5b7e

UnknownScript_0x1a5b7e: ; 0x1a5b7e
	jumpstd $0021
	end
; 0x1a5b82

TrainerPokefanfRuth: ; 0x1a5b82
	; bit/flag number
	dw $4da

	; trainer group && trainer id
	db POKEFANF, RUTH

	; text when seen
	dw PokefanfRuthSeenText

	; text when trainer beaten
	dw PokefanfRuthBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PokefanfRuthScript
; 0x1a5b8e

PokefanfRuthScript: ; 0x1a5b8e
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a5db2
	closetext
	loadmovesprites
	end
; 0x1a5b96

TrainerSailorEugene: ; 0x1a5b96
	; bit/flag number
	dw $575

	; trainer group && trainer id
	db SAILOR, EUGENE

	; text when seen
	dw SailorEugeneSeenText

	; text when trainer beaten
	dw SailorEugeneBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SailorEugeneScript
; 0x1a5ba2

SailorEugeneScript: ; 0x1a5ba2
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a5c4d
	closetext
	loadmovesprites
	end
; 0x1a5baa

TrainerPsychicNorman: ; 0x1a5baa
	; bit/flag number
	dw $43f

	; trainer group && trainer id
	db PSYCHIC_T, NORMAN

	; text when seen
	dw PsychicNormanSeenText

	; text when trainer beaten
	dw PsychicNormanBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PsychicNormanScript
; 0x1a5bb6

PsychicNormanScript: ; 0x1a5bb6
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a5e57
	closetext
	loadmovesprites
	end
; 0x1a5bbe

PokefanFScript_0x1a5bbe: ; 0x1a5bbe
	faceplayer
	loadfont
	checktime $4
	iffalse UnknownScript_0x1a5be5
	checkevent $05c2
	iftrue UnknownScript_0x1a5bdf
	writetext UnknownText_0x1a5ee8
	closetext
	loadmovesprites
	winlosstext UnknownText_0x1a5f17, $0000
	loadtrainer POKEFANF, JAIME
	startbattle
	returnafterbattle
	setevent $05c2
	loadmovesprites
	end
; 0x1a5bdf

UnknownScript_0x1a5bdf: ; 0x1a5bdf
	writetext UnknownText_0x1a5f31
	closetext
	loadmovesprites
	end
; 0x1a5be5

UnknownScript_0x1a5be5: ; 0x1a5be5
	writetext UnknownText_0x1a5ec4
	closetext
	loadmovesprites
	end
; 0x1a5beb

MapRoute39Signpost2Script: ; 0x1a5beb
	jumptext UnknownText_0x1a5fe3
; 0x1a5bee

MapRoute39Signpost1Script: ; 0x1a5bee
	jumptext UnknownText_0x1a600a
; 0x1a5bf1

MapRoute39Signpost0Script: ; 0x1a5bf1
	jumptext UnknownText_0x1a6036
; 0x1a5bf4

FruitTreeScript_0x1a5bf4: ; 0x1a5bf4
	fruittree $f
; 0x1a5bf6

MapRoute39SignpostItem3: ; 0x1a5bf6
	dw $00aa
	db NUGGET
	
; 0x1a5bf9

UnknownText_0x1a5bf9: ; 0x1a5bf9
	text "MILTANK: Mooo!"
	done
; 0x1a5c09

SailorEugeneSeenText: ; 0x1a5c09
	text "I just got back to"
	line "OLIVINE."

	para "So how about a"
	line "#MON battle?"
	done
; 0x1a5c42

SailorEugeneBeatenText: ; 0x1a5c42
	text "Awaaargh!"
	done
; 0x1a5c4d

UnknownText_0x1a5c4d: ; 0x1a5c4d
	text "My #MON were"
	line "caught and raised"
	cont "overseas."

	para "They're my compan-"
	line "ions on those long"
	cont "voyages."
	done
; 0x1a5ca5

PokefanmDerek1SeenText: ; 0x1a5ca5
	text "This is a good"
	line "time to brag about"
	cont "my PIKACHU!"
	done
; 0x1a5cd4

PokefanmDerek1BeatenText: ; 0x1a5cd4
	text "I had no time to"
	line "show off PIKACHU…"
	done
; 0x1a5cf8

UnknownText_0x1a5cf8: ; 0x1a5cf8
	text "I'm not listening"
	line "to your bragging!"

	para "We # FANS have"
	line "a policy of not"

	para "listening to other"
	line "people brag!"
	done
; 0x1a5d5b

PokefanfRuthSeenText: ; 0x1a5d5b
	text "Such darling"
	line "#MON."

	para "Let's show our"
	line "#MON together"
	cont "at the same time."
	done
; 0x1a5d9d

PokefanfRuthBeatenText: ; 0x1a5d9d
	text "I don't mind"
	line "losing."
	done
; 0x1a5db2

UnknownText_0x1a5db2: ; 0x1a5db2
	text "Do you know about"
	line "baby #MON?"

	para "I bet they're just"
	line "adorable!"
	done
; 0x1a5dec

UnknownText_0x1a5dec: ; 0x1a5dec
	text "PIKACHU is it!"
	line "Don't you agree?"
	done
; 0x1a5e0c

PsychicNormanSeenText: ; 0x1a5e0c
	text "Let me see what"
	line "your #MON are"
	cont "capable of."
	done
; 0x1a5e37

PsychicNormanBeatenText: ; 0x1a5e37
	text "Ooh, your #MON"
	line "have potential."
	done
; 0x1a5e57

UnknownText_0x1a5e57: ; 0x1a5e57
	text "You know how #-"
	line "MON have different"
	cont "abilities?"

	para "People are like"
	line "that too. Every-"
	cont "one has different"
	cont "potential."
	done
; 0x1a5ec4

UnknownText_0x1a5ec4: ; 0x1a5ec4
	text "Ufufufu… I hope it"
	line "gets dark soon."
	done
; 0x1a5ee8

UnknownText_0x1a5ee8: ; 0x1a5ee8
	text "You came at just"
	line "the right time."

	para "Let's battle."
	done
; 0x1a5f17

UnknownText_0x1a5f17: ; 0x1a5f17
	text "Oh, how disap-"
	line "pointing…"
	done
; 0x1a5f31

UnknownText_0x1a5f31: ; 0x1a5f31
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
; 0x1a5fe3

UnknownText_0x1a5fe3: ; 0x1a5fe3
	text "ROUTE 39"

	para "OLIVINE CITY -"
	line "ECRUTEAK CITY"
	done
; 0x1a600a

UnknownText_0x1a600a: ; 0x1a600a
	text "MOOMOO FARM"

	para "Enjoy Our Fresh"
	line "and Tasty Milk"
	done
; 0x1a6036

UnknownText_0x1a6036: ; 0x1a6036
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
; 0x1a60ba

Route39_MapEventHeader: ; 0x1a60ba
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $3, $1, 1, GROUP_ROUTE_39_BARN, MAP_ROUTE_39_BARN
	warp_def $3, $5, 1, GROUP_ROUTE_39_FARMHOUSE, MAP_ROUTE_39_FARMHOUSE

	; xy triggers
	db 0

	; signposts
	db 4
	signpost 31, 5, $0, MapRoute39Signpost0Script
	signpost 5, 9, $0, MapRoute39Signpost1Script
	signpost 7, 15, $0, MapRoute39Signpost2Script
	signpost 13, 5, $7, MapRoute39SignpostItem3

	; people-events
	db 10
	person_event SPRITE_SAILOR, 33, 17, $8, $0, 255, 255, $92, 5, TrainerSailorEugene, $ffff
	person_event SPRITE_POKEFAN_M, 26, 14, $7, $0, 255, 255, $82, 4, TrainerPokefanmDerek1, $ffff
	person_event SPRITE_POKEFAN_F, 23, 15, $9, $0, 255, 255, $82, 4, TrainerPokefanfRuth, $ffff
	person_event SPRITE_TAUROS, 16, 7, $16, $0, 255, 255, $0, 0, TaurosScript_0x1a5af5, $ffff
	person_event SPRITE_TAUROS, 15, 10, $16, $0, 255, 255, $0, 0, TaurosScript_0x1a5af5, $ffff
	person_event SPRITE_TAUROS, 19, 8, $16, $0, 255, 255, $0, 0, TaurosScript_0x1a5af5, $ffff
	person_event SPRITE_TAUROS, 17, 12, $16, $0, 255, 255, $0, 0, TaurosScript_0x1a5af5, $ffff
	person_event SPRITE_STANDING_YOUNGSTER, 11, 17, $a, $0, 255, 255, $92, 1, TrainerPsychicNorman, $ffff
	person_event SPRITE_FRUIT_TREE, 7, 13, $1, $0, 255, 255, $0, 0, FruitTreeScript_0x1a5bf4, $ffff
	person_event SPRITE_POKEFAN_F, 26, 8, $6, $0, 255, 255, $80, 0, PokefanFScript_0x1a5bbe, $ffff
; 0x1a6160

