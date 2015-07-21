MahoganyPokeCenter1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

NurseScript_0x19a356:
	jumpstd pokecenternurse

PokefanMScript_0x19a359:
	jumptextfaceplayer UnknownText_0x19a362

YoungsterScript_0x19a35c:
	jumptextfaceplayer UnknownText_0x19a3b3

CooltrainerFScript_0x19a35f:
	jumptextfaceplayer UnknownText_0x19a418

UnknownText_0x19a362:
	text "What's this? TEAM"
	line "ROCKET has come"
	cont "back?"

	para "I saw some men in"
	line "black at LAKE OF"
	cont "RAGE…"
	done

UnknownText_0x19a3b3:
	text "I stop my #MON"
	line "from evolving too"
	cont "early."

	para "I make them learn"
	line "certain moves be-"
	cont "fore I let them"
	cont "evolve."
	done

UnknownText_0x19a418:
	text "#MON do become"
	line "stronger when they"

	para "evolve, but they"
	line "also learn moves"
	cont "more slowly."
	done

MahoganyPokeCenter1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $7, $3, 4, GROUP_MAHOGANY_TOWN, MAP_MAHOGANY_TOWN
	warp_def $7, $4, 4, GROUP_MAHOGANY_TOWN, MAP_MAHOGANY_TOWN
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 4
	person_event SPRITE_NURSE, 5, 7, OW_UP | $2, $0, -1, -1, $0, 0, NurseScript_0x19a356, -1
	person_event SPRITE_POKEFAN_M, 6, 11, OW_DOWN | $2, $11, -1, -1, (PAL_OW_RED << 4) | $80, 0, PokefanMScript_0x19a359, -1
	person_event SPRITE_YOUNGSTER, 7, 5, OW_LEFT | $1, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, YoungsterScript_0x19a35c, -1
	person_event SPRITE_COOLTRAINER_F, 7, 6, OW_LEFT | $0, $0, -1, -1, $0, 0, CooltrainerFScript_0x19a35f, -1
