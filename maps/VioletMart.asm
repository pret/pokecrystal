const_value set 2
	const VIOLETMART_CLERK
	const VIOLETMART_GRANNY
	const VIOLETMART_COOLTRAINER_M

VioletMart_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ClerkScript_0x68295:
	opentext
	pokemart MARTTYPE_STANDARD, MART_VIOLET
	closetext
	end

GrannyScript_0x6829c:
	jumptextfaceplayer UnknownText_0x682a2

CooltrainerMScript_0x6829f:
	jumptextfaceplayer UnknownText_0x68323

UnknownText_0x682a2:
	text "When you first"
	line "catch a #MON,"
	cont "it may be weak."

	para "But it will even-"
	line "tually grow to be"
	cont "strong."

	para "It's important to"
	line "treat #MON with"
	cont "love."
	done

UnknownText_0x68323:
	text "#MON can hold"
	line "items like POTION"
	cont "and ANTIDOTE."

	para "But they don't"
	line "appear to know how"

	para "to use manmade"
	line "items."
	done

VioletMart_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 1, VIOLET_CITY
	warp_def $7, $3, 1, VIOLET_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_CLERK, 3, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ClerkScript_0x68295, -1
	person_event SPRITE_GRANNY, 6, 7, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GrannyScript_0x6829c, -1
	person_event SPRITE_COOLTRAINER_M, 2, 5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, CooltrainerMScript_0x6829f, -1
