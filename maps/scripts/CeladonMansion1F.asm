const_value set 2
	const CELADONMANSION1F_GRANNY
	const CELADONMANSION1F_GROWLITHE1
	const CELADONMANSION1F_CLEFAIRY
	const CELADONMANSION1F_GROWLITHE2

CeladonMansion1F_MapScriptHeader:
.SceneScripts:
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

.CoordEvents:
	db 0

.BGEvents:
	db 3
	bg_event 8, 5, BGEVENT_UP, CeladonMansionManagersSuiteSign
	bg_event 3, 0, BGEVENT_READ, CeladonMansion1fBookshelf
	bg_event 3, 2, BGEVENT_READ, CeladonMansion1fBookshelf

.ObjectEvents:
	db 4
	object_event SPRITE_GRANNY, 5, 1, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonMansionManager, -1
	object_event SPRITE_GROWLITHE, 6, 2, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonMansion1FMeowth, -1
	object_event SPRITE_CLEFAIRY, 4, 3, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonMansion1FClefairy, -1
	object_event SPRITE_GROWLITHE, 4, 4, SPRITEMOVEDATA_POKEMON, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonMansion1FNidoranF, -1
