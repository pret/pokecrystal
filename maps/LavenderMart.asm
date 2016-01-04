const_value set 2
	const LAVENDERMART_CLERK
	const LAVENDERMART_POKEFAN_M
	const LAVENDERMART_ROCKER

LavenderMart_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ClerkScript_0x7eb1c:
	opentext
	pokemart MARTTYPE_STANDARD, MART_LAVENDER
	closetext
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
	warp_def $7, $2, 5, LAVENDER_TOWN
	warp_def $7, $3, 5, LAVENDER_TOWN

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_CLERK, 3, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ClerkScript_0x7eb1c, -1
	person_event SPRITE_POKEFAN_M, 6, 6, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, PokefanMScript_0x7eb23, -1
	person_event SPRITE_ROCKER, 2, 9, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, RockerScript_0x7eb26, -1
