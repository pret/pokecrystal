RuinsofAlphResearchCenter_MapScriptHeader: ; 0x59173
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x59180, $0000
	dw UnknownScript_0x59181, $0000

	; callback count
	db 1

	; callbacks

	dbw 2, UnknownScript_0x59185
; 0x59180

UnknownScript_0x59180: ; 0x59180
	end
; 0x59181

UnknownScript_0x59181: ; 0x59181
	priorityjump UnknownScript_0x59192
	end
; 0x59185

UnknownScript_0x59185: ; 0x59185
	checktriggers
	if_equal $1, UnknownScript_0x5918b
	return
; 0x5918b

UnknownScript_0x5918b: ; 0x5918b
	moveperson $4, $3, $7
	appear $4
	return
; 0x59192

UnknownScript_0x59192: ; 0x59192
	applymovement $4, MovementData_0x5926f
	playsound $000d
	pause 60
	playsound $0020
	pause 30
	playsound $0021
	pause 30
	playsound $0022
	pause 30
	spriteface $4, $0
	loadfont
	2writetext UnknownText_0x59278
	closetext
	loadmovesprites
	applymovement $4, MovementData_0x59274
	loadfont
	2writetext UnknownText_0x592fa
	playsound $0001
	waitbutton
	setbit2 $000c
	2writetext UnknownText_0x59311
	closetext
	loadmovesprites
	applymovement $4, MovementData_0x59276
	dotrigger $0
	special $003d
	end
; 0x591d1

ScientistScript_0x591d1: ; 0x591d1
	faceplayer
	loadfont
	checkcode $e
	if_equal 26, UnknownScript_0x591df
	2writetext UnknownText_0x59311
	closetext
	loadmovesprites
	end
; 0x591df

UnknownScript_0x591df: ; 0x591df
	2writetext UnknownText_0x5935f
	closetext
	loadmovesprites
	end
; 0x591e5

ScientistScript_0x591e5: ; 0x591e5
	faceplayer
	loadfont
	checkcode $e
	if_equal 26, UnknownScript_0x5920b
	checkbit2 $000c
	iftrue UnknownScript_0x59205
	checkbit1 $002e
	iftrue UnknownScript_0x591ff
	2writetext UnknownText_0x593ed
	closetext
	loadmovesprites
	end
; 0x591ff

UnknownScript_0x591ff: ; 0x591ff
	2writetext UnknownText_0x59478
	closetext
	loadmovesprites
	end
; 0x59205

UnknownScript_0x59205: ; 0x59205
	2writetext UnknownText_0x59445
	closetext
	loadmovesprites
	end
; 0x5920b

UnknownScript_0x5920b: ; 0x5920b
	2writetext UnknownText_0x594cb
	closetext
	loadmovesprites
	clearbit1 $078f
	end
; 0x59214

ScientistScript_0x59214: ; 0x59214
	faceplayer
	loadfont
	checkcode $e
	if_equal 26, UnknownScript_0x5922e
	checkbit1 $002e
	iftrue UnknownScript_0x59228
	2writetext UnknownText_0x5954f
	closetext
	loadmovesprites
	end
; 0x59228

UnknownScript_0x59228: ; 0x59228
	2writetext UnknownText_0x595cb
	closetext
	loadmovesprites
	end
; 0x5922e

UnknownScript_0x5922e: ; 0x5922e
	2writetext UnknownText_0x59769
	closetext
	loadmovesprites
	end
; 0x59234

MapRuinsofAlphResearchCenterSignpost1Script: ; 0x59234
	loadfont
	checkbit1 $0704
	iftrue UnknownScript_0x59241
	checkcode $e
	if_equal 26, UnknownScript_0x59247
UnknownScript_0x59241: ; 0x59241
	2writetext UnknownText_0x597b6
	closetext
	loadmovesprites
	end
; 0x59247

UnknownScript_0x59247: ; 0x59247
	2writetext UnknownText_0x597d9
	closetext
	loadmovesprites
	end
; 0x5924d

MapRuinsofAlphResearchCenterSignpost2Script: ; 0x5924d
	loadfont
	checkbit1 $0704
	iftrue UnknownScript_0x5925a
	checkcode $e
	if_equal 26, UnknownScript_0x59260
UnknownScript_0x5925a: ; 0x5925a
	2writetext UnknownText_0x5980e
	closetext
	loadmovesprites
	end
; 0x59260

UnknownScript_0x59260: ; 0x59260
	2writetext UnknownText_0x5982d
	closetext
	special $0027
	loadmovesprites
	end
; 0x59269

UnknownScript_0x59269: ; 0x59269
	jumptext UnknownText_0x59848
; 0x5926c

MapRuinsofAlphResearchCenterSignpost0Script: ; 0x5926c
	jumptext UnknownText_0x59886
; 0x5926f

MovementData_0x5926f: ; 0x5926f
	step_up
	step_up
	step_left
	turn_head_up
	step_end
; 0x59274

MovementData_0x59274: ; 0x59274
	step_down
	step_end
; 0x59276

MovementData_0x59276: ; 0x59276
	step_up
	step_end
; 0x59278

UnknownText_0x59278: ; 0x59278
	db $0, "Done!", $51
	db "I modified your", $4f
	db "#DEX.", $51
	db "I added an", $4f
	db "optional #DEX", $51
	db "to store UNOWN", $4f
	db "data.", $51
	db "It records them in", $4f
	db "the sequence that", $55
	db "they were caught.", $57
; 0x592fa

UnknownText_0x592fa: ; 0x592fa
	db $0, $52, "'s #DEX", $4f
	db "was upgraded.", $57
; 0x59311

UnknownText_0x59311: ; 0x59311
	db $0, "The UNOWN you", $4f
	db "catch will all be", $55
	db "recorded.", $51
	db "Check to see how", $4f
	db "many kinds exist.", $57
; 0x5935f

UnknownText_0x5935f: ; 0x5935f
	db $0, "You caught all the", $4f
	db "UNOWN variations?", $51
	db "That's a great", $4f
	db "achievement!", $51
	db "I've set up the", $4f
	db "printer here for", $55
	db "handling UNOWN.", $51
	db "Feel free to use", $4f
	db "it anytime.", $57
; 0x593ed

UnknownText_0x593ed: ; 0x593ed
	db $0, "The RUINS are", $4f
	db "about 1500 years", $55
	db "old.", $51
	db "But it's not known", $4f
	db "why they were", $55
	db "built--or by whom.", $57
; 0x59445

UnknownText_0x59445: ; 0x59445
	db $0, "I wonder how many", $4f
	db "kinds of #MON", $55
	db "are in the RUINS?", $57
; 0x59478

UnknownText_0x59478: ; 0x59478
	db $0, "#MON appeared", $4f
	db "in the RUINS?", $51
	db "That's incredible", $4f
	db "news!", $51
	db "We'll need to", $4f
	db "investigate this.", $57
; 0x594cb

UnknownText_0x594cb: ; 0x594cb
	db $0, "Our investigation,", $4f
	db "with your help, is", $51
	db "giving us insight", $4f
	db "into the RUINS.", $51
	db "The RUINS appear", $4f
	db "to have been built", $51
	db "as a habitat for", $4f
	db "#MON.", $57
; 0x5954f

UnknownText_0x5954f: ; 0x5954f
	db $0, "There are odd pat-", $4f
	db "terns drawn on the", $51
	db "walls of the", $4f
	db "RUINS.", $51
	db "They must be the", $4f
	db "keys for unravel-", $55
	db "ing the mystery", $55
	db "of the RUINS.", $57
; 0x595cb

UnknownText_0x595cb: ; 0x595cb
	db $0, "The strange #-", $4f
	db "MON you saw in the", $55
	db "RUINS?", $51
	db "They appear to be", $4f
	db "very much like the", $51
	db "drawings on the", $4f
	db "walls there.", $51
	db "Hmm…", $51
	db "That must mean", $4f
	db "there are many", $55
	db "kinds of them…", $57
; 0x59669

; possibly unused
UnknownText_0x59669: ; 0x59669
	db $0, "We think something", $4f
	db "caused the cryptic", $51
	db "patterns to appear", $4f
	db "in the RUINS.", $51
	db "We've focused our", $4f
	db "studies on that.", $57
; 0x596d3

; possibly unused
UnknownText_0x596d3: ; 0x596d3
	db $0, "According to my", $4f
	db "research…", $51
	db "Those mysterious", $4f
	db "patterns appeared", $51
	db "when the #COM", $4f
	db "CENTER was built.", $51
	db "It must mean that", $4f
	db "radio waves have", $51
	db "some sort of a", $4f
	db "link…", $57
; 0x59769

UnknownText_0x59769: ; 0x59769
	db $0, "Why did those", $4f
	db "ancient patterns", $51
	db "appear on the wall", $4f
	db "now?", $51
	db "The mystery", $4f
	db "deepens…", $57
; 0x597b6

UnknownText_0x597b6: ; 0x597b6
	db $0, "RUINS OF ALPH", $51
	db "Exploration", $4f
	db "Year 10", $57
; 0x597d9

UnknownText_0x597d9: ; 0x597d9
	db $0, "Mystery #MON", $4f
	db "Name: UNOWN", $51
	db "A total of 26", $4f
	db "kinds found.", $57
; 0x5980e

UnknownText_0x5980e: ; 0x5980e
	db $0, "This doesn't seem", $4f
	db "to work yet.", $57
; 0x5982d

UnknownText_0x5982d: ; 0x5982d
	db $0, "UNOWN may be", $4f
	db "printed out.", $57
; 0x59848

; possibly unused
UnknownText_0x59848: ; 0x59848
	db $0, "It's a photo of", $4f
	db "the RESEARCH", $51
	db "CENTER'S founder,", $4f
	db "PROF.SILKTREE.", $57
; 0x59886

UnknownText_0x59886: ; 0x59886
	db $0, "There are many", $4f
	db "academic books.", $51
	db "Ancient Ruins…", $4f
	db "Mysteries of the", $55
	db "Ancients…", $57
; 0x598d0

RuinsofAlphResearchCenter_MapEventHeader: ; 0x598d0
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 6, GROUP_RUINS_OF_ALPH_OUTSIDE, MAP_RUINS_OF_ALPH_OUTSIDE
	warp_def $7, $3, 6, GROUP_RUINS_OF_ALPH_OUTSIDE, MAP_RUINS_OF_ALPH_OUTSIDE

	; xy triggers
	db 0

	; signposts
	db 3
	signpost 5, 6, $0, MapRuinsofAlphResearchCenterSignpost0Script
	signpost 4, 3, $0, MapRuinsofAlphResearchCenterSignpost1Script
	signpost 1, 7, $0, MapRuinsofAlphResearchCenterSignpost2Script

	; people-events
	db 3
	person_event SPRITE_SCIENTIST, 9, 8, $7, $0, 255, 255, $90, 0, ScientistScript_0x591e5, $ffff
	person_event SPRITE_SCIENTIST, 6, 9, $2, $12, 255, 255, $90, 0, ScientistScript_0x59214, $ffff
	person_event SPRITE_SCIENTIST, 9, 6, $7, $0, 255, 255, $90, 0, ScientistScript_0x591d1, $0704
; 0x59916

