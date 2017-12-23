const_value set 2
	const VERMILIONMART_CLERK
	const VERMILIONMART_SUPER_NERD
	const VERMILIONMART_BUENA

VermilionMart_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ClerkScript_0x191f7e:
	opentext
	pokemart MARTTYPE_STANDARD, MART_VERMILION
	closetext
	end

VermilionMartSuperNerdScript:
	jumptextfaceplayer VermilionMartSuperNerdText

VermilionMartBuenaScript:
	jumptextfaceplayer VermilionMartBuenaText

VermilionMartSuperNerdText:
	text "TEAM ROCKET is no"
	line "longer in KANTO."

	para "That alone makes"
	line "me happy."
	done

VermilionMartBuenaText:
	text "I'm thinking about"
	line "going shopping in"
	cont "SAFFRON."
	done

VermilionMart_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 5, VERMILION_CITY
	warp_def $7, $3, 5, VERMILION_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_CLERK, 3, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ClerkScript_0x191f7e, -1
	person_event SPRITE_SUPER_NERD, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, VermilionMartSuperNerdScript, -1
	person_event SPRITE_BUENA, 6, 8, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, PAL_NPC_GREEN, PERSONTYPE_SCRIPT, 0, VermilionMartBuenaScript, -1
