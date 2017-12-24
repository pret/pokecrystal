const_value set 2
	const SAFFRONMART_CLERK
	const SAFFRONMART_COOLTRAINER_M
	const SAFFRONMART_COOLTRAINER_F

SaffronMart_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

ClerkScript_0x18a3bf:
	opentext
	pokemart MARTTYPE_STANDARD, MART_SAFFRON
	closetext
	end

SaffronMartCooltrainerMScript:
	jumptextfaceplayer SaffronMartCooltrainerMText

SaffronMartCooltrainerFScript:
	jumptextfaceplayer SaffronMartCooltrainerFText

SaffronMartCooltrainerMText:
	text "There's a big"
	line "RADIO TOWER in"
	cont "LAVENDER."
	done

SaffronMartCooltrainerFText:
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

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 3
	object_event SPRITE_CLERK, 3, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ClerkScript_0x18a3bf, -1
	object_event SPRITE_COOLTRAINER_M, 2, 7, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SaffronMartCooltrainerMScript, -1
	object_event SPRITE_COOLTRAINER_F, 6, 7, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronMartCooltrainerFScript, -1
