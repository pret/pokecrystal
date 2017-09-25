const_value set 2
	const MRFUJISHOUSE_SUPER_NERD
	const MRFUJISHOUSE_LASS
	const MRFUJISHOUSE_PSYDUCK
	const MRFUJISHOUSE_NIDORINO
	const MRFUJISHOUSE_PIDGEY

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
	opentext
	writetext MrFujisPsyduckText
	cry PSYDUCK
	waitbutton
	closetext
	end

MrFujisNidorino:
	opentext
	writetext MrFujisNidorinoText
	cry NIDORINO
	waitbutton
	closetext
	end

MrFujisPidgey:
	opentext
	writetext MrFujisPidgeyText
	cry PIDGEY
	waitbutton
	closetext
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
	warp_def $7, $2, 2, LAVENDER_TOWN
	warp_def $7, $3, 2, LAVENDER_TOWN

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 1, 0, SIGNPOST_READ, MrFujisHouseBookshelf
	signpost 1, 1, SIGNPOST_READ, MrFujisHouseBookshelf

.PersonEvents:
	db 5
	person_event SPRITE_SUPER_NERD, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, SuperNerdScript_0x7e8ca, -1
	person_event SPRITE_LASS, 4, 3, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, LassScript_0x7e8cd, -1
	person_event SPRITE_RHYDON, 4, 7, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MrFujisPsyduck, -1
	person_event SPRITE_GROWLITHE, 5, 5, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, MrFujisNidorino, -1
	person_event SPRITE_MOLTRES, 3, 1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, MrFujisPidgey, -1
