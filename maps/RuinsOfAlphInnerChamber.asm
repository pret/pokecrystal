const_value set 2
	const RUINSOFALPHINNERCHAMBER_FISHER
	const RUINSOFALPHINNERCHAMBER_TEACHER
	const RUINSOFALPHINNERCHAMBER_GRAMPS

RuinsOfAlphInnerChamber_MapScriptHeader:
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
	setscene $0
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

RuinsOfAlphInnerChamber_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 9
	warp_def $d, $a, 5, RUINS_OF_ALPH_OUTSIDE
	warp_def $f, $3, 3, RUINS_OF_ALPH_HO_OH_CHAMBER
	warp_def $f, $4, 4, RUINS_OF_ALPH_HO_OH_CHAMBER
	warp_def $3, $f, 3, RUINS_OF_ALPH_KABUTO_CHAMBER
	warp_def $3, $10, 4, RUINS_OF_ALPH_KABUTO_CHAMBER
	warp_def $15, $3, 3, RUINS_OF_ALPH_OMANYTE_CHAMBER
	warp_def $15, $4, 4, RUINS_OF_ALPH_OMANYTE_CHAMBER
	warp_def $18, $f, 3, RUINS_OF_ALPH_AERODACTYL_CHAMBER
	warp_def $18, $10, 4, RUINS_OF_ALPH_AERODACTYL_CHAMBER

.CoordEvents:
	db 0

.BGEvents:
	db 26
	bg_event 3, 2, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 3, 5, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 3, 8, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 3, 11, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 3, 14, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 3, 17, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 8, 2, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 8, 5, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 8, 8, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 8, 11, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 8, 14, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 8, 17, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 13, 2, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 13, 17, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 18, 2, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 18, 5, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 18, 8, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 18, 11, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 18, 14, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 18, 17, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 24, 2, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 24, 5, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 24, 8, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 24, 11, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 24, 14, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 24, 17, BGEVENT_READ, RuinsOfAlphInnerChamberStatue

.ObjectEvents:
	db 3
	object_event SPRITE_FISHER, 7, 3, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphInnerChamberFisherScript, EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	object_event SPRITE_TEACHER, 13, 14, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphInnerChamberTeacherScript, EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	object_event SPRITE_GRAMPS, 19, 11, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphInnerChamberGrampsScript, EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
