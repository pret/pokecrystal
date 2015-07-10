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
	playsound SFX_BOOT_PC
	pause 60
	playsound SFX_SWITCH_POKEMON
	pause 30
	playsound SFX_TALLY
	pause 30
	playsound SFX_TRANSACTION
	pause 30
	spriteface $4, DOWN
	loadfont
	writetext UnknownText_0x59278
	closetext
	loadmovesprites
	applymovement $4, MovementData_0x59274
	loadfont
	writetext UnknownText_0x592fa
	playsound SFX_ITEM
	waitbutton
	setflag $000c
	writetext UnknownText_0x59311
	closetext
	loadmovesprites
	applymovement $4, MovementData_0x59276
	dotrigger $0
	special RestartMapMusic
	end
; 0x591d1

ScientistScript_0x591d1: ; 0x591d1
	faceplayer
	loadfont
	checkcode VAR_UNOWNCOUNT
	if_equal 26, UnknownScript_0x591df
	writetext UnknownText_0x59311
	closetext
	loadmovesprites
	end
; 0x591df

UnknownScript_0x591df: ; 0x591df
	writetext UnknownText_0x5935f
	closetext
	loadmovesprites
	end
; 0x591e5

ScientistScript_0x591e5: ; 0x591e5
	faceplayer
	loadfont
	checkcode VAR_UNOWNCOUNT
	if_equal 26, UnknownScript_0x5920b
	checkflag $000c
	iftrue UnknownScript_0x59205
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue UnknownScript_0x591ff
	writetext UnknownText_0x593ed
	closetext
	loadmovesprites
	end
; 0x591ff

UnknownScript_0x591ff: ; 0x591ff
	writetext UnknownText_0x59478
	closetext
	loadmovesprites
	end
; 0x59205

UnknownScript_0x59205: ; 0x59205
	writetext UnknownText_0x59445
	closetext
	loadmovesprites
	end
; 0x5920b

UnknownScript_0x5920b: ; 0x5920b
	writetext UnknownText_0x594cb
	closetext
	loadmovesprites
	clearevent $078f
	end
; 0x59214

ScientistScript_0x59214: ; 0x59214
	faceplayer
	loadfont
	checkcode VAR_UNOWNCOUNT
	if_equal 26, UnknownScript_0x5922e
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue UnknownScript_0x59228
	writetext UnknownText_0x5954f
	closetext
	loadmovesprites
	end
; 0x59228

UnknownScript_0x59228: ; 0x59228
	writetext UnknownText_0x595cb
	closetext
	loadmovesprites
	end
; 0x5922e

UnknownScript_0x5922e: ; 0x5922e
	writetext UnknownText_0x59769
	closetext
	loadmovesprites
	end
; 0x59234

MapRuinsofAlphResearchCenterSignpost1Script: ; 0x59234
	loadfont
	checkevent $0704
	iftrue UnknownScript_0x59241
	checkcode VAR_UNOWNCOUNT
	if_equal 26, UnknownScript_0x59247
UnknownScript_0x59241: ; 0x59241
	writetext UnknownText_0x597b6
	closetext
	loadmovesprites
	end
; 0x59247

UnknownScript_0x59247: ; 0x59247
	writetext UnknownText_0x597d9
	closetext
	loadmovesprites
	end
; 0x5924d

MapRuinsofAlphResearchCenterSignpost2Script: ; 0x5924d
	loadfont
	checkevent $0704
	iftrue UnknownScript_0x5925a
	checkcode VAR_UNOWNCOUNT
	if_equal 26, UnknownScript_0x59260
UnknownScript_0x5925a: ; 0x5925a
	writetext UnknownText_0x5980e
	closetext
	loadmovesprites
	end
; 0x59260

UnknownScript_0x59260: ; 0x59260
	writetext UnknownText_0x5982d
	closetext
	special Functionc2cd
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
	text "Done!"

	para "I modified your"
	line "#DEX."

	para "I added an"
	line "optional #DEX"

	para "to store UNOWN"
	line "data."

	para "It records them in"
	line "the sequence that"
	cont "they were caught."
	done
; 0x592fa

UnknownText_0x592fa: ; 0x592fa
	text "<PLAYER>'s #DEX"
	line "was upgraded."
	done
; 0x59311

UnknownText_0x59311: ; 0x59311
	text "The UNOWN you"
	line "catch will all be"
	cont "recorded."

	para "Check to see how"
	line "many kinds exist."
	done
; 0x5935f

UnknownText_0x5935f: ; 0x5935f
	text "You caught all the"
	line "UNOWN variations?"

	para "That's a great"
	line "achievement!"

	para "I've set up the"
	line "printer here for"
	cont "handling UNOWN."

	para "Feel free to use"
	line "it anytime."
	done
; 0x593ed

UnknownText_0x593ed: ; 0x593ed
	text "The RUINS are"
	line "about 1500 years"
	cont "old."

	para "But it's not known"
	line "why they were"
	cont "built--or by whom."
	done
; 0x59445

UnknownText_0x59445: ; 0x59445
	text "I wonder how many"
	line "kinds of #MON"
	cont "are in the RUINS?"
	done
; 0x59478

UnknownText_0x59478: ; 0x59478
	text "#MON appeared"
	line "in the RUINS?"

	para "That's incredible"
	line "news!"

	para "We'll need to"
	line "investigate this."
	done
; 0x594cb

UnknownText_0x594cb: ; 0x594cb
	text "Our investigation,"
	line "with your help, is"

	para "giving us insight"
	line "into the RUINS."

	para "The RUINS appear"
	line "to have been built"

	para "as a habitat for"
	line "#MON."
	done
; 0x5954f

UnknownText_0x5954f: ; 0x5954f
	text "There are odd pat-"
	line "terns drawn on the"

	para "walls of the"
	line "RUINS."

	para "They must be the"
	line "keys for unravel-"
	cont "ing the mystery"
	cont "of the RUINS."
	done
; 0x595cb

UnknownText_0x595cb: ; 0x595cb
	text "The strange #-"
	line "MON you saw in the"
	cont "RUINS?"

	para "They appear to be"
	line "very much like the"

	para "drawings on the"
	line "walls there."

	para "Hmm…"

	para "That must mean"
	line "there are many"
	cont "kinds of them…"
	done
; 0x59669

; possibly unused
UnknownText_0x59669: ; 0x59669
	text "We think something"
	line "caused the cryptic"

	para "patterns to appear"
	line "in the RUINS."

	para "We've focused our"
	line "studies on that."
	done
; 0x596d3

; possibly unused
UnknownText_0x596d3: ; 0x596d3
	text "According to my"
	line "research…"

	para "Those mysterious"
	line "patterns appeared"

	para "when the #COM"
	line "CENTER was built."

	para "It must mean that"
	line "radio waves have"

	para "some sort of a"
	line "link…"
	done
; 0x59769

UnknownText_0x59769: ; 0x59769
	text "Why did those"
	line "ancient patterns"

	para "appear on the wall"
	line "now?"

	para "The mystery"
	line "deepens…"
	done
; 0x597b6

UnknownText_0x597b6: ; 0x597b6
	text "RUINS OF ALPH"

	para "Exploration"
	line "Year 10"
	done
; 0x597d9

UnknownText_0x597d9: ; 0x597d9
	text "Mystery #MON"
	line "Name: UNOWN"

	para "A total of 26"
	line "kinds found."
	done
; 0x5980e

UnknownText_0x5980e: ; 0x5980e
	text "This doesn't seem"
	line "to work yet."
	done
; 0x5982d

UnknownText_0x5982d: ; 0x5982d
	text "UNOWN may be"
	line "printed out."
	done
; 0x59848

; possibly unused
UnknownText_0x59848: ; 0x59848
	text "It's a photo of"
	line "the RESEARCH"

	para "CENTER'S founder,"
	line "PROF.SILKTREE."
	done
; 0x59886

UnknownText_0x59886: ; 0x59886
	text "There are many"
	line "academic books."

	para "Ancient Ruins…"
	line "Mysteries of the"
	cont "Ancients…"
	done
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
