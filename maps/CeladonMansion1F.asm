CeladonMansion1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

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

CeladonMansion1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 5
	warp_def $9, $6, 2, GROUP_CELADON_CITY, MAP_CELADON_CITY
	warp_def $9, $7, 2, GROUP_CELADON_CITY, MAP_CELADON_CITY
	warp_def $0, $3, 3, GROUP_CELADON_CITY, MAP_CELADON_CITY
	warp_def $0, $0, 1, GROUP_CELADON_MANSION_2F, MAP_CELADON_MANSION_2F
	warp_def $0, $7, 4, GROUP_CELADON_MANSION_2F, MAP_CELADON_MANSION_2F

.XYTriggers:
	db 0

.Signposts:
	db 3
	signpost 8, 5, SIGNPOST_UP, CeladonMansionManagersSuiteSign
	signpost 3, 0, SIGNPOST_READ, CeladonMansion1fBookshelf
	signpost 3, 2, SIGNPOST_READ, CeladonMansion1fBookshelf

.PersonEvents:
	db 4
	person_event SPRITE_GRANNY, 9, 5, OW_DOWN | $3, $0, -1, -1, $0, 0, CeladonMansionManager, -1
	person_event SPRITE_GROWLITHE, 10, 6, OW_UP | $12, $0, -1, -1, $0, 0, CeladonMansion1FMeowth, -1
	person_event SPRITE_CLEFAIRY, 8, 7, OW_UP | $12, $0, -1, -1, $0, 0, CeladonMansion1FClefairy, -1
	person_event SPRITE_GROWLITHE, 8, 8, OW_UP | $12, $2, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, CeladonMansion1FNidoranF, -1
