const_value set 2
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST1
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST2
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST3

RuinsofAlphResearchCenter_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x59180, 0
	dw UnknownScript_0x59181, 0

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_OBJECTS, UnknownScript_0x59185

UnknownScript_0x59180:
	end

UnknownScript_0x59181:
	priorityjump UnknownScript_0x59192
	end

UnknownScript_0x59185:
	checktriggers
	if_equal $1, UnknownScript_0x5918b
	return

UnknownScript_0x5918b:
	moveperson RUINSOFALPHRESEARCHCENTER_SCIENTIST3, $3, $7
	appear RUINSOFALPHRESEARCHCENTER_SCIENTIST3
	return

UnknownScript_0x59192:
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, MovementData_0x5926f
	playsound SFX_BOOT_PC
	pause 60
	playsound SFX_SWITCH_POKEMON
	pause 30
	playsound SFX_TALLY
	pause 30
	playsound SFX_TRANSACTION
	pause 30
	spriteface RUINSOFALPHRESEARCHCENTER_SCIENTIST3, DOWN
	opentext
	writetext UnknownText_0x59278
	waitbutton
	closetext
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, MovementData_0x59274
	opentext
	writetext UnknownText_0x592fa
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_UNOWN_DEX
	writetext UnknownText_0x59311
	waitbutton
	closetext
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, MovementData_0x59276
	dotrigger $0
	special RestartMapMusic
	end

ScientistScript_0x591d1:
	faceplayer
	opentext
	checkcode VAR_UNOWNCOUNT
	if_equal 26, UnknownScript_0x591df
	writetext UnknownText_0x59311
	waitbutton
	closetext
	end

UnknownScript_0x591df:
	writetext UnknownText_0x5935f
	waitbutton
	closetext
	end

ScientistScript_0x591e5:
	faceplayer
	opentext
	checkcode VAR_UNOWNCOUNT
	if_equal 26, UnknownScript_0x5920b
	checkflag ENGINE_UNOWN_DEX
	iftrue UnknownScript_0x59205
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue UnknownScript_0x591ff
	writetext UnknownText_0x593ed
	waitbutton
	closetext
	end

UnknownScript_0x591ff:
	writetext UnknownText_0x59478
	waitbutton
	closetext
	end

UnknownScript_0x59205:
	writetext UnknownText_0x59445
	waitbutton
	closetext
	end

UnknownScript_0x5920b:
	writetext UnknownText_0x594cb
	waitbutton
	closetext
	clearevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	end

ScientistScript_0x59214:
	faceplayer
	opentext
	checkcode VAR_UNOWNCOUNT
	if_equal 26, UnknownScript_0x5922e
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue UnknownScript_0x59228
	writetext UnknownText_0x5954f
	waitbutton
	closetext
	end

UnknownScript_0x59228:
	writetext UnknownText_0x595cb
	waitbutton
	closetext
	end

UnknownScript_0x5922e:
	writetext UnknownText_0x59769
	waitbutton
	closetext
	end

MapRuinsofAlphResearchCenterSignpost1Script:
	opentext
	checkevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	iftrue UnknownScript_0x59241
	checkcode VAR_UNOWNCOUNT
	if_equal 26, UnknownScript_0x59247
UnknownScript_0x59241:
	writetext UnknownText_0x597b6
	waitbutton
	closetext
	end

UnknownScript_0x59247:
	writetext UnknownText_0x597d9
	waitbutton
	closetext
	end

MapRuinsofAlphResearchCenterSignpost2Script:
	opentext
	checkevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	iftrue UnknownScript_0x5925a
	checkcode VAR_UNOWNCOUNT
	if_equal 26, UnknownScript_0x59260
UnknownScript_0x5925a:
	writetext UnknownText_0x5980e
	waitbutton
	closetext
	end

UnknownScript_0x59260:
	writetext UnknownText_0x5982d
	waitbutton
	special Special_UnownPrinter
	closetext
	end

UnknownScript_0x59269:
	jumptext UnknownText_0x59848

MapRuinsofAlphResearchCenterSignpost0Script:
	jumptext UnknownText_0x59886

MovementData_0x5926f:
	step UP
	step UP
	step LEFT
	turn_head UP
	step_end

MovementData_0x59274:
	step DOWN
	step_end

MovementData_0x59276:
	step UP
	step_end

UnknownText_0x59278:
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

UnknownText_0x592fa:
	text "<PLAYER>'s #DEX"
	line "was upgraded."
	done

UnknownText_0x59311:
	text "The UNOWN you"
	line "catch will all be"
	cont "recorded."

	para "Check to see how"
	line "many kinds exist."
	done

UnknownText_0x5935f:
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

UnknownText_0x593ed:
	text "The RUINS are"
	line "about 1500 years"
	cont "old."

	para "But it's not known"
	line "why they were"
	cont "built--or by whom."
	done

UnknownText_0x59445:
	text "I wonder how many"
	line "kinds of #MON"
	cont "are in the RUINS?"
	done

UnknownText_0x59478:
	text "#MON appeared"
	line "in the RUINS?"

	para "That's incredible"
	line "news!"

	para "We'll need to"
	line "investigate this."
	done

UnknownText_0x594cb:
	text "Our investigation,"
	line "with your help, is"

	para "giving us insight"
	line "into the RUINS."

	para "The RUINS appear"
	line "to have been built"

	para "as a habitat for"
	line "#MON."
	done

UnknownText_0x5954f:
	text "There are odd pat-"
	line "terns drawn on the"

	para "walls of the"
	line "RUINS."

	para "They must be the"
	line "keys for unravel-"
	cont "ing the mystery"
	cont "of the RUINS."
	done

UnknownText_0x595cb:
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

; possibly unused
UnknownText_0x59669:
	text "We think something"
	line "caused the cryptic"

	para "patterns to appear"
	line "in the RUINS."

	para "We've focused our"
	line "studies on that."
	done

; possibly unused
UnknownText_0x596d3:
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

UnknownText_0x59769:
	text "Why did those"
	line "ancient patterns"

	para "appear on the wall"
	line "now?"

	para "The mystery"
	line "deepens…"
	done

UnknownText_0x597b6:
	text "RUINS OF ALPH"

	para "Exploration"
	line "Year 10"
	done

UnknownText_0x597d9:
	text "Mystery #MON"
	line "Name: UNOWN"

	para "A total of 26"
	line "kinds found."
	done

UnknownText_0x5980e:
	text "This doesn't seem"
	line "to work yet."
	done

UnknownText_0x5982d:
	text "UNOWN may be"
	line "printed out."
	done

; possibly unused
UnknownText_0x59848:
	text "It's a photo of"
	line "the RESEARCH"

	para "CENTER'S founder,"
	line "PROF.SILKTREE."
	done

UnknownText_0x59886:
	text "There are many"
	line "academic books."

	para "Ancient Ruins…"
	line "Mysteries of the"
	cont "Ancients…"
	done

RuinsofAlphResearchCenter_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 6, RUINS_OF_ALPH_OUTSIDE
	warp_def $7, $3, 6, RUINS_OF_ALPH_OUTSIDE

.XYTriggers:
	db 0

.Signposts:
	db 3
	signpost 5, 6, SIGNPOST_READ, MapRuinsofAlphResearchCenterSignpost0Script
	signpost 4, 3, SIGNPOST_READ, MapRuinsofAlphResearchCenterSignpost1Script
	signpost 1, 7, SIGNPOST_READ, MapRuinsofAlphResearchCenterSignpost2Script

.PersonEvents:
	db 3
	person_event SPRITE_SCIENTIST, 5, 4, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ScientistScript_0x591e5, -1
	person_event SPRITE_SCIENTIST, 2, 5, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ScientistScript_0x59214, -1
	person_event SPRITE_SCIENTIST, 5, 2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ScientistScript_0x591d1, EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
