CherrygroveGymSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

PokefanMScript_0x196ae1:
	jumptextfaceplayer UnknownText_0x196aea

BugCatcherScript_0x196ae4:
	jumptextfaceplayer UnknownText_0x196b65

CherrygroveGymSpeechHouseBookshelf:
	jumpstd picturebookshelf

UnknownText_0x196aea:
	text "You're trying to"
	line "see how good you"

	para "are as a #MON"
	line "trainer?"

	para "You better visit"
	line "the #MON GYMS"

	para "all over JOHTO and"
	line "collect BADGES."
	done

UnknownText_0x196b65:
	text "When I get older,"
	line "I'm going to be a"
	cont "GYM LEADER!"

	para "I make my #MON"
	line "battle with my"

	para "friend's to make"
	line "them tougher!"
	done

CherrygroveGymSpeechHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 3, CHERRYGROVE_CITY
	warp_def $7, $3, 3, CHERRYGROVE_CITY

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 1, 0, SIGNPOST_READ, CherrygroveGymSpeechHouseBookshelf
	signpost 1, 1, SIGNPOST_READ, CherrygroveGymSpeechHouseBookshelf

.PersonEvents:
	db 2
	person_event SPRITE_POKEFAN_M, 3 + 4, 2 + 4, $6, 0, 0, -1, -1, 0, 0, 0, PokefanMScript_0x196ae1, -1
	person_event SPRITE_BUG_CATCHER, 5 + 4, 5 + 4, $5, 0, 1, -1, -1, (1 << 3) | PAL_OW_RED, 0, 0, BugCatcherScript_0x196ae4, -1
