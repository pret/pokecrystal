const_value set 2
	const RUINSOFALPHINNERCHAMBER_FISHER
	const RUINSOFALPHINNERCHAMBER_TEACHER
	const RUINSOFALPHINNERCHAMBER_GRAMPS

RuinsOfAlphInnerChamber_MapScripts:
.SceneScripts:
	db 2
	scene_script .DummyScene0
	scene_script .UnownAppear

.MapCallbacks:
	db 0

.DummyScene0:
	end

.UnownAppear:
	priorityjump .StrangePresenceScript
	end

.StrangePresenceScript:
	opentext
	writetext RuinsOfAlphStrangePresenceText
	waitbutton
	closetext
	setscene 0
	setevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	clearevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_FISHER
	end

RuinsOfAlphInnerChamberFisherScript:
	jumptextfaceplayer RuinsOfAlphInnerChamberFisherText

RuinsOfAlphInnerChamberTeacherScript:
	jumptextfaceplayer RuinsOfAlphInnerChamberTeacherText

RuinsOfAlphInnerChamberGrampsScript:
	jumptextfaceplayer RuinsOfAlphInnerChamberGrampsText

RuinsOfAlphInnerChamberStatue:
	jumptext RuinsOfAlphInnerChamberStatueText

RuinsOfAlphStrangePresenceText:
	text "There is a strange"
	line "presence here…"
	done

RuinsOfAlphInnerChamberFisherText:
	text "This is a big"
	line "room, but there's"
	cont "nothing here."
	done

RuinsOfAlphInnerChamberTeacherText:
	text "This place has a"
	line "mystical quality"
	cont "to it."

	para "It feels sort of"
	line "ethereal even."
	done

RuinsOfAlphInnerChamberGrampsText:
	text "Ancient buildings"
	line "are often tombs of"
	cont "kings."

	para "Like the pyramids,"
	line "for instance."
	done

RuinsOfAlphInnerChamberStatueText:
	text "It's a replica of"
	line "an ancient #-"
	cont "MON."
	done

RuinsOfAlphInnerChamber_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 9
	warp_def 10, 13, 5, RUINS_OF_ALPH_OUTSIDE
	warp_def 3, 15, 3, RUINS_OF_ALPH_HO_OH_CHAMBER
	warp_def 4, 15, 4, RUINS_OF_ALPH_HO_OH_CHAMBER
	warp_def 15, 3, 3, RUINS_OF_ALPH_KABUTO_CHAMBER
	warp_def 16, 3, 4, RUINS_OF_ALPH_KABUTO_CHAMBER
	warp_def 3, 21, 3, RUINS_OF_ALPH_OMANYTE_CHAMBER
	warp_def 4, 21, 4, RUINS_OF_ALPH_OMANYTE_CHAMBER
	warp_def 15, 24, 3, RUINS_OF_ALPH_AERODACTYL_CHAMBER
	warp_def 16, 24, 4, RUINS_OF_ALPH_AERODACTYL_CHAMBER

.CoordEvents:
	db 0

.BGEvents:
	db 26
	bg_event 2, 3, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 5, 3, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 8, 3, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 11, 3, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 14, 3, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 17, 3, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 2, 8, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 5, 8, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 8, 8, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 11, 8, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 14, 8, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 17, 8, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 2, 13, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 17, 13, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 2, 18, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 5, 18, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 8, 18, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 11, 18, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 14, 18, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 17, 18, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 2, 24, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 5, 24, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 8, 24, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 11, 24, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 14, 24, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 17, 24, BGEVENT_READ, RuinsOfAlphInnerChamberStatue

.ObjectEvents:
	db 3
	object_event 3, 7, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphInnerChamberFisherScript, EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	object_event 14, 13, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphInnerChamberTeacherScript, EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	object_event 11, 19, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphInnerChamberGrampsScript, EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
