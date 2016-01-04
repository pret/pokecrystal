const_value set 2
	const SAFFRONMART_CLERK
	const SAFFRONMART_COOLTRAINER_M
	const SAFFRONMART_COOLTRAINER_F

SaffronMart_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ClerkScript_0x18a3bf:
	opentext
	pokemart MARTTYPE_STANDARD, MART_SAFFRON
	closetext
	end

CooltrainerMScript_0x18a3c6:
	jumptextfaceplayer UnknownText_0x18a3cc

CooltrainerFScript_0x18a3c9:
	jumptextfaceplayer UnknownText_0x18a3f3

UnknownText_0x18a3cc:
	text "There's a big"
	line "RADIO TOWER in"
	cont "LAVENDER."
	done

UnknownText_0x18a3f3:
	text "I want to become"
	line "stronger, but I'm"
	cont "not good yet…"

	para "Could you show me"
	line "how sometime?"
	done

SaffronMart_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 3, SAFFRON_CITY
	warp_def $7, $3, 3, SAFFRON_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_CLERK, 3, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ClerkScript_0x18a3bf, -1
	person_event SPRITE_COOLTRAINER_M, 2, 7, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, CooltrainerMScript_0x18a3c6, -1
	person_event SPRITE_COOLTRAINER_F, 6, 7, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, CooltrainerFScript_0x18a3c9, -1
