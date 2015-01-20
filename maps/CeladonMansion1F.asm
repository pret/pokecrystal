CeladonMansion1F_MapScriptHeader: ; 0x713ed
	; trigger count
	db 0

	; callback count
	db 0
; 0x713ef

GrannyScript_0x713ef: ; 0x713ef
	jumptextfaceplayer UnknownText_0x71416
; 0x713f2

GrowlitheScript_0x713f2: ; 0x713f2
	loadfont
	writetext UnknownText_0x71470
	cry MEOWTH
	closetext
	loadmovesprites
	end
; 0x713fc

ClefairyScript_0x713fc: ; 0x713fc
	loadfont
	writetext UnknownText_0x7147f
	cry CLEFAIRY
	closetext
	loadmovesprites
	end
; 0x71406

GrowlitheScript_0x71406: ; 0x71406
	loadfont
	writetext UnknownText_0x71496
	cry NIDORAN_F
	closetext
	loadmovesprites
	end
; 0x71410

MapCeladonMansion1FSignpost0Script: ; 0x71410
	jumptext UnknownText_0x714ab
; 0x71413

MapCeladonMansion1FSignpost2Script: ; 0x71413
	jumpstd $0002
; 0x71416

UnknownText_0x71416: ; 0x71416
	text "My dear #MON"
	line "keep me company,"

	para "so I don't ever"
	line "feel lonely."

	para "MEOWTH even brings"
	line "money home."
	done
; 0x71470

UnknownText_0x71470: ; 0x71470
	text "MEOWTH: Meow!"
	done
; 0x7147f

UnknownText_0x7147f: ; 0x7147f
	text "CLEFAIRY: Clef"
	line "cleff!"
	done
; 0x71496

UnknownText_0x71496: ; 0x71496
	text "NIDORAN: Kya"
	line "kyaoo!"
	done
; 0x714ab

UnknownText_0x714ab: ; 0x714ab
	text "CELADON MANSION"
	line "MANAGER'S SUITE"
	done
; 0x714cc

CeladonMansion1F_MapEventHeader: ; 0x714cc
	; filler
	db 0, 0

	; warps
	db 5
	warp_def $9, $6, 2, GROUP_CELADON_CITY, MAP_CELADON_CITY
	warp_def $9, $7, 2, GROUP_CELADON_CITY, MAP_CELADON_CITY
	warp_def $0, $3, 3, GROUP_CELADON_CITY, MAP_CELADON_CITY
	warp_def $0, $0, 1, GROUP_CELADON_MANSION_2F, MAP_CELADON_MANSION_2F
	warp_def $0, $7, 4, GROUP_CELADON_MANSION_2F, MAP_CELADON_MANSION_2F

	; xy triggers
	db 0

	; signposts
	db 3
	signpost 8, 5, $1, MapCeladonMansion1FSignpost0Script
	signpost 3, 0, $0, MapCeladonMansion1FSignpost2Script
	signpost 3, 2, $0, MapCeladonMansion1FSignpost2Script

	; people-events
	db 4
	person_event SPRITE_GRANNY, 9, 5, $3, $0, 255, 255, $0, 0, GrannyScript_0x713ef, $ffff
	person_event SPRITE_GROWLITHE, 10, 6, $16, $0, 255, 255, $0, 0, GrowlitheScript_0x713f2, $ffff
	person_event SPRITE_CLEFAIRY, 8, 7, $16, $0, 255, 255, $0, 0, ClefairyScript_0x713fc, $ffff
	person_event SPRITE_GROWLITHE, 8, 8, $16, $2, 255, 255, $90, 0, GrowlitheScript_0x71406, $ffff
; 0x7152e

