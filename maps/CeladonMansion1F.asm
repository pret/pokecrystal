CeladonMansion1F_MapScriptHeader: ; 0x713ed
	; trigger count
	db 0

	; callback count
	db 0
; 0x713ef

CeladonMansionManager:
	jumptextfaceplayer CeladonMansionManagerText

CeladonMansion1FMeowth:
	loadfont
	writetext CeladonMansion1FMeowthText
	cry MEOWTH
	closetext
	loadmovesprites
	end

CeladonMansion1FClefairy:
	loadfont
	writetext CeladonMansion1FClefairyText
	cry CLEFAIRY
	closetext
	loadmovesprites
	end

CeladonMansion1FNidoranF:
	loadfont
	writetext CeladonMansion1FNidoranFText
	cry NIDORAN_F
	closetext
	loadmovesprites
	end

CeladonMansionManagersSuiteSign:
	jumptext CeladonMansionManagersSuiteSignText

CeladonMansion1fBookshelf:
	jumpstd picturebookshelf

CeladonMansionManagerText:
	text "My dear #MON"
	line "keep me company,"

	para "so I don't ever"
	line "feel lonely."

	para "MEOWTH even brings"
	line "money home."
	done

CeladonMansion1FMeowthText:
	text "MEOWTH: Meow!"
	done

CeladonMansion1FClefairyText:
	text "CLEFAIRY: Clef"
	line "cleff!"
	done

CeladonMansion1FNidoranFText:
	text "NIDORAN: Kya"
	line "kyaoo!"
	done

CeladonMansionManagersSuiteSignText:
	text "CELADON MANSION"
	line "MANAGER'S SUITE"
	done

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
	signpost 8, 5, $1, CeladonMansionManagersSuiteSign
	signpost 3, 0, $0, CeladonMansion1fBookshelf
	signpost 3, 2, $0, CeladonMansion1fBookshelf

	; people-events
	db 4
	person_event SPRITE_GRANNY, 9, 5, $3, $0, 255, 255, $0, 0, CeladonMansionManager, $ffff
	person_event SPRITE_GROWLITHE, 10, 6, $16, $0, 255, 255, $0, 0, CeladonMansion1FMeowth, $ffff
	person_event SPRITE_CLEFAIRY, 8, 7, $16, $0, 255, 255, $0, 0, CeladonMansion1FClefairy, $ffff
	person_event SPRITE_GROWLITHE, 8, 8, $16, $2, 255, 255, $90, 0, CeladonMansion1FNidoranF, $ffff
