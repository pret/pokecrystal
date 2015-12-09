const_value set 2
	const CELADONMANSION1F_GRANNY
	const CELADONMANSION1F_GROWLITHE1
	const CELADONMANSION1F_CLEFAIRY
	const CELADONMANSION1F_GROWLITHE2

CeladonMansion1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

CeladonMansionManager:
	jumptextfaceplayer CeladonMansionManagerText

CeladonMansion1FMeowth:
	opentext
	writetext CeladonMansion1FMeowthText
	cry MEOWTH
	waitbutton
	closetext
	end

CeladonMansion1FClefairy:
	opentext
	writetext CeladonMansion1FClefairyText
	cry CLEFAIRY
	waitbutton
	closetext
	end

CeladonMansion1FNidoranF:
	opentext
	writetext CeladonMansion1FNidoranFText
	cry NIDORAN_F
	waitbutton
	closetext
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
	warp_def $9, $6, 2, CELADON_CITY
	warp_def $9, $7, 2, CELADON_CITY
	warp_def $0, $3, 3, CELADON_CITY
	warp_def $0, $0, 1, CELADON_MANSION_2F
	warp_def $0, $7, 4, CELADON_MANSION_2F

.XYTriggers:
	db 0

.Signposts:
	db 3
	signpost 8, 5, SIGNPOST_UP, CeladonMansionManagersSuiteSign
	signpost 3, 0, SIGNPOST_READ, CeladonMansion1fBookshelf
	signpost 3, 2, SIGNPOST_READ, CeladonMansion1fBookshelf

.PersonEvents:
	db 4
	person_event SPRITE_GRANNY, 5, 1, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CeladonMansionManager, -1
	person_event SPRITE_GROWLITHE, 6, 2, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CeladonMansion1FMeowth, -1
	person_event SPRITE_CLEFAIRY, 4, 3, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CeladonMansion1FClefairy, -1
	person_event SPRITE_GROWLITHE, 4, 4, SPRITEMOVEDATA_POKEMON, 0, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CeladonMansion1FNidoranF, -1
