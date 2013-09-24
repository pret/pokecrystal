Route40_MapScriptHeader: ; 0x1a6160
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 2, UnknownScript_0x1a6165
; 0x1a6165

UnknownScript_0x1a6165: ; 0x1a6165
	clearevent $07cf
	checkcode $b
	if_equal MONDAY, UnknownScript_0x1a6171
	disappear $a
	return
; 0x1a6171

UnknownScript_0x1a6171: ; 0x1a6171
	appear $a
	return
; 0x1a6174

TrainerSwimmerfElaine: ; 0x1a6174
	; bit/flag number
	dw $3e8

	; trainer group && trainer id
	db SWIMMERF, ELAINE

	; text when seen
	dw SwimmerfElaineSeenText

	; text when trainer beaten
	dw SwimmerfElaineBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmerfElaineScript
; 0x1a6180

SwimmerfElaineScript: ; 0x1a6180
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1a637b
	closetext
	loadmovesprites
	end
; 0x1a6188

TrainerSwimmerfPaula: ; 0x1a6188
	; bit/flag number
	dw $3e9

	; trainer group && trainer id
	db SWIMMERF, PAULA

	; text when seen
	dw SwimmerfPaulaSeenText

	; text when trainer beaten
	dw SwimmerfPaulaBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmerfPaulaScript
; 0x1a6194

SwimmerfPaulaScript: ; 0x1a6194
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1a63f5
	closetext
	loadmovesprites
	end
; 0x1a619c

TrainerSwimmermSimon: ; 0x1a619c
	; bit/flag number
	dw $595

	; trainer group && trainer id
	db SWIMMERM, SIMON

	; text when seen
	dw SwimmermSimonSeenText

	; text when trainer beaten
	dw SwimmermSimonBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmermSimonScript
; 0x1a61a8

SwimmermSimonScript: ; 0x1a61a8
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1a6282
	closetext
	loadmovesprites
	end
; 0x1a61b0

TrainerSwimmermRandall: ; 0x1a61b0
	; bit/flag number
	dw $596

	; trainer group && trainer id
	db SWIMMERM, RANDALL

	; text when seen
	dw SwimmermRandallSeenText

	; text when trainer beaten
	dw SwimmermRandallBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmermRandallScript
; 0x1a61bc

SwimmermRandallScript: ; 0x1a61bc
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1a62fa
	closetext
	loadmovesprites
	end
; 0x1a61c4

LassScript_0x1a61c4: ; 0x1a61c4
	jumptextfaceplayer UnknownText_0x1a6429
; 0x1a61c7

PokefanMScript_0x1a61c7: ; 0x1a61c7
	special $00a0
	iftrue UnknownScript_0x1a61d0
	jumptextfaceplayer UnknownText_0x1a646a
; 0x1a61d0

UnknownScript_0x1a61d0: ; 0x1a61d0
	jumptextfaceplayer UnknownText_0x1a649b
; 0x1a61d3

LassScript_0x1a61d3: ; 0x1a61d3
	jumptextfaceplayer UnknownText_0x1a64e6
; 0x1a61d6

StandingYoungsterScript_0x1a61d6: ; 0x1a61d6
	jumptextfaceplayer UnknownText_0x1a6564
; 0x1a61d9

BuenaScript_0x1a61d9: ; 0x1a61d9
	faceplayer
	loadfont
	checkevent EVENT_GOT_SHARP_BEAK_FROM_MONICA
	iftrue UnknownScript_0x1a6207
	checkcode $b
	if_not_equal MONDAY, UnknownScript_0x1a620d
	checkevent EVENT_MET_MONICA_OF_MONDAY
	iftrue UnknownScript_0x1a61f4
	2writetext UnknownText_0x1a6606
	keeptextopen
	setevent EVENT_MET_MONICA_OF_MONDAY
UnknownScript_0x1a61f4: ; 0x1a61f4
	2writetext UnknownText_0x1a6636
	keeptextopen
	verbosegiveitem SHARP_BEAK, 1
	iffalse UnknownScript_0x1a620b
	setevent EVENT_GOT_SHARP_BEAK_FROM_MONICA
	2writetext UnknownText_0x1a666c
	closetext
	loadmovesprites
	end
; 0x1a6207

UnknownScript_0x1a6207: ; 0x1a6207
	2writetext UnknownText_0x1a66dc
	closetext
UnknownScript_0x1a620b: ; 0x1a620b
	loadmovesprites
	end
; 0x1a620d

UnknownScript_0x1a620d: ; 0x1a620d
	2writetext UnknownText_0x1a6737
	closetext
	loadmovesprites
	end
; 0x1a6213

MapRoute40Signpost0Script: ; 0x1a6213
	jumptext UnknownText_0x1a6767
; 0x1a6216

RockScript_0x1a6216: ; 0x1a6216
	jumpstd $000f
; 0x1a6219

MapRoute40SignpostItem1: ; 0x1a6219
	dw $00ab
	db HYPER_POTION
; 0x1a621c

MovementData_0x1a621c: ; 0x1a621c
	step_right
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end
; 0x1a6224

MovementData_0x1a6224: ; 0x1a6224
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end
; 0x1a622a

MovementData_0x1a622a: ; 0x1a622a
	step_up
	step_up
	step_up
	step_up
	step_end
; 0x1a622f

SwimmermSimonSeenText: ; 0x1a622f
	db $0, "You have to warm", $4f
	db "up before going", $55
	db "into the water.", $51
	db "That's basic.", $57
; 0x1a626e

SwimmermSimonBeatenText: ; 0x1a626e
	db $0, "OK! Uncle! I give!", $57
; 0x1a6282

UnknownText_0x1a6282: ; 0x1a6282
	db $0, "CIANWOOD CITY is", $4f
	db "a good distance", $55
	db "away from here.", $57
; 0x1a62b4

SwimmermRandallSeenText: ; 0x1a62b4
	db $0, "Hey, you're young", $4f
	db "and fit!", $51
	db "Don't ride your", $4f
	db "#MON! Swim!", $57
; 0x1a62ea

SwimmermRandallBeatenText: ; 0x1a62ea
	db $0, "Uh-oh. I lost…", $57
; 0x1a62fa

UnknownText_0x1a62fa: ; 0x1a62fa
	db $0, "Swimming exercises", $4f
	db "your entire body.", $55
	db "It's healthy.", $57
; 0x1a632d

SwimmerfElaineSeenText: ; 0x1a632d
	db $0, "Are you going to", $4f
	db "CIANWOOD?", $51
	db "How about a quick", $4f
	db "battle first?", $57
; 0x1a6369

SwimmerfElaineBeatenText: ; 0x1a6369
	db $0, "I lost that one!", $57
; 0x1a637b

UnknownText_0x1a637b: ; 0x1a637b
	db $0, "I'd say I'm a bet-", $4f
	db "ter swimmer than", $55
	db "you. Yeah!", $57
; 0x1a63a9

SwimmerfPaulaSeenText: ; 0x1a63a9
	db $0, "No inner tube for", $4f
	db "me.", $51
	db "I'm hanging on to", $4f
	db "a sea #MON!", $57
; 0x1a63dd

SwimmerfPaulaBeatenText: ; 0x1a63dd
	db $0, "Ooh, I'm feeling", $4f
	db "dizzy!", $57
; 0x1a63f5

UnknownText_0x1a63f5: ; 0x1a63f5
	db $0, "While I float like", $4f
	db "this, the waves", $55
	db "carry me along.", $57
; 0x1a6429

UnknownText_0x1a6429: ; 0x1a6429
	db $0, "Although you can't", $4f
	db "see it from here,", $51
	db "CIANWOOD is across", $4f
	db "the sea.", $57
; 0x1a646a

UnknownText_0x1a646a: ; 0x1a646a
	db $0, "Hm! There's a big", $4f
	db "building up ahead!", $51
	db "What is it?", $57
; 0x1a649b

UnknownText_0x1a649b: ; 0x1a649b
	db $0, "Hm! Look at all", $4f
	db "those serious-", $55
	db "looking trainers", $55
	db "streaming in.", $51
	db "What? What?", $57
; 0x1a64e6

UnknownText_0x1a64e6: ; 0x1a64e6
	db $0, "I came to OLIVINE", $4f
	db "by ship to see the", $51
	db "sights and soak up", $4f
	db "the atmosphere.", $51
	db "Being a port, it", $4f
	db "feels so different", $55
	db "from a big city.", $57
; 0x1a6564

UnknownText_0x1a6564: ; 0x1a6564
	db $0, "Have you gone to", $4f
	db "the BATTLE TOWER?", $51
	db "I think a lot of", $4f
	db "tough trainers", $51
	db "have gathered", $4f
	db "there already.", $51
	db "But since you have", $4f
	db "so many BADGES,", $51
	db "you shouldn't do", $4f
	db "badly at all.", $57
; 0x1a6606

UnknownText_0x1a6606: ; 0x1a6606
	db $0, "MONICA: Glad to", $4f
	db "meet you. I'm", $51
	db "MONICA of Monday.", $57
; 0x1a6636

UnknownText_0x1a6636: ; 0x1a6636
	db $0, "As a token of our", $4f
	db "friendship, I have", $55
	db "a gift for you!", $57
; 0x1a666c

UnknownText_0x1a666c: ; 0x1a666c
	db $0, "MONICA: It's an", $4f
	db "item that raises", $51
	db "the power of fly-", $4f
	db "ing-type moves.", $51
	db "You should equip a", $4f
	db "bird #MON with", $55
	db "that item.", $57
; 0x1a66dc

UnknownText_0x1a66dc: ; 0x1a66dc
	db $0, "MONICA: My broth-", $4f
	db "ers and sisters", $51
	db "are all over the", $4f
	db "place.", $51
	db "See if you could", $4f
	db "find them all!", $57
; 0x1a6737

UnknownText_0x1a6737: ; 0x1a6737
	db $0, "MONICA: I don't", $4f
	db "think today is", $55
	db "Monday. How sad…", $57
; 0x1a6767

UnknownText_0x1a6767: ; 0x1a6767
	db $0, "ROUTE 40", $51
	db "CIANWOOD CITY -", $4f
	db "OLIVINE CITY", $57
; 0x1a678e

Route40_MapEventHeader: ; 0x1a678e
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $5, $9, 1, GROUP_ROUTE_40_BATTLE_TOWER_GATE, MAP_ROUTE_40_BATTLE_TOWER_GATE

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 10, 14, $0, MapRoute40Signpost0Script
	signpost 8, 7, $7, MapRoute40SignpostItem1

	; people-events
	db 12
	person_event SPRITE_OLIVINE_RIVAL, 19, 18, $9, $0, 255, 255, $82, 4, TrainerSwimmermSimon, $ffff
	person_event SPRITE_OLIVINE_RIVAL, 34, 22, $8, $0, 255, 255, $82, 5, TrainerSwimmermRandall, $ffff
	person_event SPRITE_SWIMMER_GIRL, 23, 7, $9, $0, 255, 255, $a2, 4, TrainerSwimmerfElaine, $ffff
	person_event SPRITE_SWIMMER_GIRL, 29, 14, $1f, $0, 255, 255, $a2, 3, TrainerSwimmerfPaula, $ffff
	person_event SPRITE_ROCK, 15, 11, $18, $0, 255, 255, $0, 0, RockScript_0x1a6216, $ffff
	person_event SPRITE_ROCK, 13, 10, $18, $0, 255, 255, $0, 0, RockScript_0x1a6216, $ffff
	person_event SPRITE_ROCK, 12, 11, $18, $0, 255, 255, $0, 0, RockScript_0x1a6216, $ffff
	person_event SPRITE_LASS, 17, 15, $6, $0, 255, 255, $0, 0, LassScript_0x1a61c4, $ffff
	person_event SPRITE_BUENA, 14, 12, $3, $0, 255, 255, $0, 0, BuenaScript_0x1a61d9, $075e
	person_event SPRITE_POKEFAN_M, 10, 11, $9, $0, 255, 255, $0, 0, PokefanMScript_0x1a61c7, $ffff
	person_event SPRITE_LASS, 8, 17, $3, $0, 255, 255, $a0, 0, LassScript_0x1a61d3, $ffff
	person_event SPRITE_STANDING_YOUNGSTER, 13, 20, $3, $0, 255, 255, $90, 0, StandingYoungsterScript_0x1a61d6, $07cf
; 0x1a683f

