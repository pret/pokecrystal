const_value set 2
	const RUINSOFALPHINNERCHAMBER_FISHER
	const RUINSOFALPHINNERCHAMBER_TEACHER
	const RUINSOFALPHINNERCHAMBER_GRAMPS

RuinsofAlphInnerChamber_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x58f69, 0
	dw UnknownScript_0x58f6a, 0

.MapCallbacks:
	db 0

UnknownScript_0x58f69:
	end

UnknownScript_0x58f6a:
	priorityjump UnknownScript_0x58f6e

UnknownScript_0x58f6d:
	end

UnknownScript_0x58f6e:
	opentext
	writetext UnknownText_0x58f89
	waitbutton
	closetext
	dotrigger $0
	setevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	clearevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_FISHER
	end

FisherScript_0x58f7d:
	jumptextfaceplayer UnknownText_0x58fac

TeacherScript_0x58f80:
	jumptextfaceplayer UnknownText_0x58fda

GrampsScript_0x58f83:
	jumptextfaceplayer UnknownText_0x59024

MapRuinsofAlphInnerChamberSignpost25Script:
	jumptext UnknownText_0x59072

UnknownText_0x58f89:
	text "There is a strange"
	line "presence here…"
	done

UnknownText_0x58fac:
	text "This is a big"
	line "room, but there's"
	cont "nothing here."
	done

UnknownText_0x58fda:
	text "This place has a"
	line "mystical quality"
	cont "to it."

	para "It feels sort of"
	line "ethereal even."
	done

UnknownText_0x59024:
	text "Ancient buildings"
	line "are often tombs of"
	cont "kings."

	para "Like the pyramids,"
	line "for instance."
	done

UnknownText_0x59072:
	text "It's a replica of"
	line "an ancient #-"
	cont "MON."
	done

RuinsofAlphInnerChamber_MapEventHeader:
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

.XYTriggers:
	db 0

.Signposts:
	db 26
	signpost 3, 2, SIGNPOST_READ, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 3, 5, SIGNPOST_READ, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 3, 8, SIGNPOST_READ, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 3, 11, SIGNPOST_READ, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 3, 14, SIGNPOST_READ, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 3, 17, SIGNPOST_READ, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 8, 2, SIGNPOST_READ, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 8, 5, SIGNPOST_READ, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 8, 8, SIGNPOST_READ, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 8, 11, SIGNPOST_READ, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 8, 14, SIGNPOST_READ, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 8, 17, SIGNPOST_READ, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 13, 2, SIGNPOST_READ, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 13, 17, SIGNPOST_READ, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 18, 2, SIGNPOST_READ, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 18, 5, SIGNPOST_READ, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 18, 8, SIGNPOST_READ, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 18, 11, SIGNPOST_READ, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 18, 14, SIGNPOST_READ, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 18, 17, SIGNPOST_READ, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 24, 2, SIGNPOST_READ, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 24, 5, SIGNPOST_READ, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 24, 8, SIGNPOST_READ, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 24, 11, SIGNPOST_READ, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 24, 14, SIGNPOST_READ, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 24, 17, SIGNPOST_READ, MapRuinsofAlphInnerChamberSignpost25Script

.PersonEvents:
	db 3
	person_event SPRITE_FISHER, 7, 3, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, FisherScript_0x58f7d, EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	person_event SPRITE_TEACHER, 13, 14, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, TeacherScript_0x58f80, EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	person_event SPRITE_GRAMPS, 19, 11, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, GrampsScript_0x58f83, EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
