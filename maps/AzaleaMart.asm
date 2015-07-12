AzaleaMart_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

ClerkScript_0x18e040:
	loadfont
	pokemart $0, $0003
	loadmovesprites
	end

CooltrainerMScript_0x18e047:
	jumptextfaceplayer UnknownText_0x18e04d

BugCatcherScript_0x18e04a:
	jumptextfaceplayer UnknownText_0x18e0b6

UnknownText_0x18e04d:
	text "There's no GREAT"
	line "BALL here. #"

	para "BALLS will have"
	line "to do."

	para "I wish KURT would"
	line "make me some of"
	cont "his custom BALLS."
	done

UnknownText_0x18e0b6:
	text "A GREAT BALL is"
	line "better for catch-"
	cont "ing #MON than a"
	cont "# BALL."

	para "But KURT's might"
	line "be better some-"
	cont "times."
	done

AzaleaMart_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 3, GROUP_AZALEA_TOWN, MAP_AZALEA_TOWN
	warp_def $7, $3, 3, GROUP_AZALEA_TOWN, MAP_AZALEA_TOWN

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 3
	person_event SPRITE_CLERK, 7, 5, $9, $0, 255, 255, $0, 0, ClerkScript_0x18e040, EVENT_ALWAYS_THERE
	person_event SPRITE_COOLTRAINER_M, 9, 6, $7, $0, 255, 255, $0, 0, CooltrainerMScript_0x18e047, EVENT_ALWAYS_THERE
	person_event SPRITE_BUG_CATCHER, 6, 11, $5, $2, 255, 255, $80, 0, BugCatcherScript_0x18e04a, EVENT_ALWAYS_THERE
