Route39_MapScriptHeader: ; 0x1a5af3
	; trigger count
	db 0

	; callback count
	db 0
; 0x1a5af5

TaurosScript_0x1a5af5: ; 0x1a5af5
	loadfont
	2writetext UnknownText_0x1a5bf9
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
	checkbit2 $0083
	iftrue UnknownScript_0x1a5b4a
	checkcellnum $1c
	iftrue UnknownScript_0x1a5b6e
	checkpoke PIKACHU
	iffalse UnknownScript_0x1a5b5c
	checkbit1 $028d
	iftrue UnknownScript_0x1a5b33
	2writetext UnknownText_0x1a5cf8
	keeptextopen
	setbit1 $028d
	2call UnknownScript_0x1a5b62
	2jump UnknownScript_0x1a5b36
; 0x1a5b33

UnknownScript_0x1a5b33: ; 0x1a5b33
	2call UnknownScript_0x1a5b66
UnknownScript_0x1a5b36: ; 0x1a5b36
	askforphonenumber $1c
	if_equal $1, UnknownScript_0x1a5b76
	if_equal $2, UnknownScript_0x1a5b72
	trainertotext POKEFANM, DEREK1, $0
	2call UnknownScript_0x1a5b6a
	2jump UnknownScript_0x1a5b6e
; 0x1a5b4a

UnknownScript_0x1a5b4a: ; 0x1a5b4a
	2call UnknownScript_0x1a5b7a
	verbosegiveitem NUGGET, 1
	iffalse UnknownScript_0x1a5b59
	clearbit2 $0083
	2jump UnknownScript_0x1a5b6e
; 0x1a5b59

UnknownScript_0x1a5b59: ; 0x1a5b59
	2jump UnknownScript_0x1a5b7e
; 0x1a5b5c

UnknownScript_0x1a5b5c: ; 0x1a5b5c
	2writetext UnknownText_0x1a5dec
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
	2writetext UnknownText_0x1a5db2
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
	2writetext UnknownText_0x1a5c4d
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
	2writetext UnknownText_0x1a5e57
	closetext
	loadmovesprites
	end
; 0x1a5bbe

PokefanFScript_0x1a5bbe: ; 0x1a5bbe
	faceplayer
	loadfont
	checktime $4
	iffalse UnknownScript_0x1a5be5
	checkbit1 $05c2
	iftrue UnknownScript_0x1a5bdf
	2writetext UnknownText_0x1a5ee8
	closetext
	loadmovesprites
	winlosstext UnknownText_0x1a5f17, $0000
	loadtrainer POKEFANF, JAIME
	startbattle
	returnafterbattle
	setbit1 $05c2
	loadmovesprites
	end
; 0x1a5bdf

UnknownScript_0x1a5bdf: ; 0x1a5bdf
	2writetext UnknownText_0x1a5f31
	closetext
	loadmovesprites
	end
; 0x1a5be5

UnknownScript_0x1a5be5: ; 0x1a5be5
	2writetext UnknownText_0x1a5ec4
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
	db $0, "MILTANK: Mooo!", $57
; 0x1a5c09

SailorEugeneSeenText: ; 0x1a5c09
	db $0, "I just got back to", $4f
	db "OLIVINE.", $51
	db "So how about a", $4f
	db "#MON battle?", $57
; 0x1a5c42

SailorEugeneBeatenText: ; 0x1a5c42
	db $0, "Awaaargh!", $57
; 0x1a5c4d

UnknownText_0x1a5c4d: ; 0x1a5c4d
	db $0, "My #MON were", $4f
	db "caught and raised", $55
	db "overseas.", $51
	db "They're my compan-", $4f
	db "ions on those long", $55
	db "voyages.", $57
; 0x1a5ca5

PokefanmDerek1SeenText: ; 0x1a5ca5
	db $0, "This is a good", $4f
	db "time to brag about", $55
	db "my PIKACHU!", $57
; 0x1a5cd4

PokefanmDerek1BeatenText: ; 0x1a5cd4
	db $0, "I had no time to", $4f
	db "show off PIKACHU…", $57
; 0x1a5cf8

UnknownText_0x1a5cf8: ; 0x1a5cf8
	db $0, "I'm not listening", $4f
	db "to your bragging!", $51
	db "We # FANS have", $4f
	db "a policy of not", $51
	db "listening to other", $4f
	db "people brag!", $57
; 0x1a5d5b

PokefanfRuthSeenText: ; 0x1a5d5b
	db $0, "Such darling", $4f
	db "#MON.", $51
	db "Let's show our", $4f
	db "#MON together", $55
	db "at the same time.", $57
; 0x1a5d9d

PokefanfRuthBeatenText: ; 0x1a5d9d
	db $0, "I don't mind", $4f
	db "losing.", $57
; 0x1a5db2

UnknownText_0x1a5db2: ; 0x1a5db2
	db $0, "Do you know about", $4f
	db "baby #MON?", $51
	db "I bet they're just", $4f
	db "adorable!", $57
; 0x1a5dec

UnknownText_0x1a5dec: ; 0x1a5dec
	db $0, "PIKACHU is it!", $4f
	db "Don't you agree?", $57
; 0x1a5e0c

PsychicNormanSeenText: ; 0x1a5e0c
	db $0, "Let me see what", $4f
	db "your #MON are", $55
	db "capable of.", $57
; 0x1a5e37

PsychicNormanBeatenText: ; 0x1a5e37
	db $0, "Ooh, your #MON", $4f
	db "have potential.", $57
; 0x1a5e57

UnknownText_0x1a5e57: ; 0x1a5e57
	db $0, "You know how #-", $4f
	db "MON have different", $55
	db "abilities?", $51
	db "People are like", $4f
	db "that too. Every-", $55
	db "one has different", $55
	db "potential.", $57
; 0x1a5ec4

UnknownText_0x1a5ec4: ; 0x1a5ec4
	db $0, "Ufufufu… I hope it", $4f
	db "gets dark soon.", $57
; 0x1a5ee8

UnknownText_0x1a5ee8: ; 0x1a5ee8
	db $0, "You came at just", $4f
	db "the right time.", $51
	db "Let's battle.", $57
; 0x1a5f17

UnknownText_0x1a5f17: ; 0x1a5f17
	db $0, "Oh, how disap-", $4f
	db "pointing…", $57
; 0x1a5f31

UnknownText_0x1a5f31: ; 0x1a5f31
	db $0, "I met my MEOWTH at", $4f
	db "night, right here", $55
	db "on ROUTE 39.", $51
	db "I'm not sure why,", $4f
	db "but it seems to", $51
	db "like it when I", $4f
	db "train here.", $51
	db "It seems to become", $4f
	db "friendlier by", $51
	db "training here than", $4f
	db "anywhere else.", $57
; 0x1a5fe3

UnknownText_0x1a5fe3: ; 0x1a5fe3
	db $0, "ROUTE 39", $51
	db "OLIVINE CITY -", $4f
	db "ECRUTEAK CITY", $57
; 0x1a600a

UnknownText_0x1a600a: ; 0x1a600a
	db $0, "MOOMOO FARM", $51
	db "Enjoy Our Fresh", $4f
	db "and Tasty Milk", $57
; 0x1a6036

UnknownText_0x1a6036: ; 0x1a6036
	db $0, "TRAINER TIPS", $51
	db "Use HEADBUTT on", $4f
	db "trees to shake", $55
	db "#MON out.", $51
	db "Different kinds of", $4f
	db "#MON drop out", $55
	db "of trees.", $51
	db "Use HEADBUTT on", $4f
	db "any tree you see!", $57
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

