LavenderMart_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ClerkScript_0x7eb1c:
	loadfont
	pokemart $0, $0015
	loadmovesprites
	end

PokefanMScript_0x7eb23:
	jumptextfaceplayer UnknownText_0x7eb29

RockerScript_0x7eb26:
	jumptextfaceplayer UnknownText_0x7ebac

UnknownText_0x7eb29:
	text "REPEL is a neces-"
	line "sity if you are"

	para "going to explore a"
	line "cave."

	para "Even though I like"
	line "exploring, I still"

	para "haven't made it to"
	line "all the caves."
	done

UnknownText_0x7ebac:
	text "I heard about a"
	line "craftsman who"

	para "makes custom BALLS"
	line "in the JOHTO town"

	para "of AZALEA. I wish"
	line "I had some."
	done

LavenderMart_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 5, GROUP_LAVENDER_TOWN, MAP_LAVENDER_TOWN
	warp_def $7, $3, 5, GROUP_LAVENDER_TOWN, MAP_LAVENDER_TOWN

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_CLERK, 7, 5, OW_LEFT | $1, $0, -1, -1, $0, 0, ClerkScript_0x7eb1c, -1
	person_event SPRITE_POKEFAN_M, 10, 10, OW_UP | $1, $2, -1, -1, (PAL_OW_RED << 4) | $80, 0, PokefanMScript_0x7eb23, -1
	person_event SPRITE_ROCKER, 6, 13, OW_DOWN | $3, $0, -1, -1, $0, 0, RockerScript_0x7eb26, -1
