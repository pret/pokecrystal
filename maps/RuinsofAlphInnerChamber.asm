RuinsofAlphInnerChamber_MapScriptHeader: ; 0x58f5f
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x58f69, $0000
	dw UnknownScript_0x58f6a, $0000

	; callback count
	db 0
; 0x58f69

UnknownScript_0x58f69: ; 0x58f69
	end
; 0x58f6a

UnknownScript_0x58f6a: ; 0x58f6a
	priorityjump UnknownScript_0x58f6e
; 0x58f6d

UnknownScript_0x58f6d: ; 0x58f6d
	end
; 0x58f6e

UnknownScript_0x58f6e: ; 0x58f6e
	loadfont
	writetext UnknownText_0x58f89
	closetext
	loadmovesprites
	dotrigger $0
	setevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	clearevent $078e
	end
; 0x58f7d

FisherScript_0x58f7d: ; 0x58f7d
	jumptextfaceplayer UnknownText_0x58fac
; 0x58f80

TeacherScript_0x58f80: ; 0x58f80
	jumptextfaceplayer UnknownText_0x58fda
; 0x58f83

GrampsScript_0x58f83: ; 0x58f83
	jumptextfaceplayer UnknownText_0x59024
; 0x58f86

MapRuinsofAlphInnerChamberSignpost25Script: ; 0x58f86
	jumptext UnknownText_0x59072
; 0x58f89

UnknownText_0x58f89: ; 0x58f89
	text "There is a strange"
	line "presence here…"
	done
; 0x58fac

UnknownText_0x58fac: ; 0x58fac
	text "This is a big"
	line "room, but there's"
	cont "nothing here."
	done
; 0x58fda

UnknownText_0x58fda: ; 0x58fda
	text "This place has a"
	line "mystical quality"
	cont "to it."

	para "It feels sort of"
	line "ethereal even."
	done
; 0x59024

UnknownText_0x59024: ; 0x59024
	text "Ancient buildings"
	line "are often tombs of"
	cont "kings."

	para "Like the pyramids,"
	line "for instance."
	done
; 0x59072

UnknownText_0x59072: ; 0x59072
	text "It's a replica of"
	line "an ancient #-"
	cont "MON."
	done
; 0x59097

RuinsofAlphInnerChamber_MapEventHeader: ; 0x59097
	; filler
	db 0, 0

	; warps
	db 9
	warp_def $d, $a, 5, GROUP_RUINS_OF_ALPH_OUTSIDE, MAP_RUINS_OF_ALPH_OUTSIDE
	warp_def $f, $3, 3, GROUP_RUINS_OF_ALPH_HO_OH_CHAMBER, MAP_RUINS_OF_ALPH_HO_OH_CHAMBER
	warp_def $f, $4, 4, GROUP_RUINS_OF_ALPH_HO_OH_CHAMBER, MAP_RUINS_OF_ALPH_HO_OH_CHAMBER
	warp_def $3, $f, 3, GROUP_RUINS_OF_ALPH_KABUTO_CHAMBER, MAP_RUINS_OF_ALPH_KABUTO_CHAMBER
	warp_def $3, $10, 4, GROUP_RUINS_OF_ALPH_KABUTO_CHAMBER, MAP_RUINS_OF_ALPH_KABUTO_CHAMBER
	warp_def $15, $3, 3, GROUP_RUINS_OF_ALPH_OMANYTE_CHAMBER, MAP_RUINS_OF_ALPH_OMANYTE_CHAMBER
	warp_def $15, $4, 4, GROUP_RUINS_OF_ALPH_OMANYTE_CHAMBER, MAP_RUINS_OF_ALPH_OMANYTE_CHAMBER
	warp_def $18, $f, 3, GROUP_RUINS_OF_ALPH_AERODACTYL_CHAMBER, MAP_RUINS_OF_ALPH_AERODACTYL_CHAMBER
	warp_def $18, $10, 4, GROUP_RUINS_OF_ALPH_AERODACTYL_CHAMBER, MAP_RUINS_OF_ALPH_AERODACTYL_CHAMBER

	; xy triggers
	db 0

	; signposts
	db 26
	signpost 3, 2, $0, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 3, 5, $0, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 3, 8, $0, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 3, 11, $0, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 3, 14, $0, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 3, 17, $0, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 8, 2, $0, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 8, 5, $0, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 8, 8, $0, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 8, 11, $0, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 8, 14, $0, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 8, 17, $0, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 13, 2, $0, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 13, 17, $0, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 18, 2, $0, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 18, 5, $0, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 18, 8, $0, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 18, 11, $0, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 18, 14, $0, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 18, 17, $0, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 24, 2, $0, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 24, 5, $0, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 24, 8, $0, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 24, 11, $0, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 24, 14, $0, MapRuinsofAlphInnerChamberSignpost25Script
	signpost 24, 17, $0, MapRuinsofAlphInnerChamberSignpost25Script

	; people-events
	db 3
	person_event SPRITE_FISHER, 11, 7, $3, $0, 255, 255, $a0, 0, FisherScript_0x58f7d, $0705
	person_event SPRITE_TEACHER, 17, 18, $2, $11, 255, 255, $0, 0, TeacherScript_0x58f80, $0705
	person_event SPRITE_GRAMPS, 23, 15, $7, $0, 255, 255, $b0, 0, GrampsScript_0x58f83, $0705
; 0x59173

