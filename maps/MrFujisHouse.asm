MrFujisHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

SuperNerdScript_0x7e8ca:
	jumptextfaceplayer UnknownText_0x7e8f1

LassScript_0x7e8cd:
	jumptextfaceplayer UnknownText_0x7e940

MrFujisPsyduck:
	loadfont
	writetext MrFujisPsyduckText
	cry PSYDUCK
	closetext
	loadmovesprites
	end

MrFujisNidorino:
	loadfont
	writetext MrFujisNidorinoText
	cry NIDORINO
	closetext
	loadmovesprites
	end

MrFujisPidgey:
	loadfont
	writetext MrFujisPidgeyText
	cry PIDGEY
	closetext
	loadmovesprites
	end

MrFujisHouseBookshelf:
	jumpstd difficultbookshelf

UnknownText_0x7e8f1:
	text "MR.FUJI does live"
	line "here, but he's not"

	para "home now."

	para "He should be at"
	line "the SOUL HOUSE."
	done

UnknownText_0x7e940:
	text "Some cold-hearted"
	line "people stop caring"
	cont "for their #MON."

	para "Grandpa takes in"
	line "the poor homeless"

	para "#MON and takes"
	line "care of them."
	done

MrFujisPsyduckText:
	text "PSYDUCK: Gu-guwa?"
	done

MrFujisNidorinoText:
	text "NIDORINO: Gyun!"
	done

MrFujisPidgeyText:
	text "PIDGEY: Pijji!"
	done

MrFujisHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 2, GROUP_LAVENDER_TOWN, MAP_LAVENDER_TOWN
	warp_def $7, $3, 2, GROUP_LAVENDER_TOWN, MAP_LAVENDER_TOWN

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 1, 0, SIGNPOST_READ, MrFujisHouseBookshelf
	signpost 1, 1, SIGNPOST_READ, MrFujisHouseBookshelf

.PersonEvents:
	db 5
	person_event SPRITE_SUPER_NERD, 5, 8, OW_UP | $2, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, SuperNerdScript_0x7e8ca, -1
	person_event SPRITE_LASS, 8, 7, OW_DOWN | $2, $11, -1, -1, $0, 0, LassScript_0x7e8cd, -1
	person_event SPRITE_RHYDON, 8, 11, OW_UP | $12, $0, -1, -1, $0, 0, MrFujisPsyduck, -1
	person_event SPRITE_GROWLITHE, 9, 9, OW_UP | $12, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, MrFujisNidorino, -1
	person_event SPRITE_MOLTRES, 7, 5, OW_UP | $12, $0, -1, -1, (PAL_OW_BROWN << 4) | $80, 0, MrFujisPidgey, -1
