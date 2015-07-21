CherrygroveMart_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ClerkScript_0x19680a:
	loadfont
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue UnknownScript_0x196817
	pokemart $0, $0000
	loadmovesprites
	end

UnknownScript_0x196817:
	pokemart $0, $0001
	loadmovesprites
	end

CooltrainerMScript_0x19681d:
	faceplayer
	loadfont
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue UnknownScript_0x19682b
	writetext UnknownText_0x196834
	closetext
	loadmovesprites
	end

UnknownScript_0x19682b:
	writetext UnknownText_0x196873
	closetext
	loadmovesprites
	end

YoungsterScript_0x196831:
	jumptextfaceplayer UnknownText_0x1968a0

UnknownText_0x196834:
	text "They're fresh out"
	line "of # BALLS!"

	para "When will they get"
	line "more of them?"
	done

UnknownText_0x196873:
	text "# BALLS are in"
	line "stock! Now I can"
	cont "catch #MON!"
	done

UnknownText_0x1968a0:
	text "When I was walking"
	line "in the grass, a"

	para "bug #MON poi-"
	line "soned my #MON!"

	para "I just kept going,"
	line "but then my"
	cont "#MON fainted."

	para "You should keep an"
	line "ANTIDOTE with you."
	done

CherrygroveMart_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 1, GROUP_CHERRYGROVE_CITY, MAP_CHERRYGROVE_CITY
	warp_def $7, $3, 1, GROUP_CHERRYGROVE_CITY, MAP_CHERRYGROVE_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_CLERK, 7, 5, OW_LEFT | $1, $0, -1, -1, $0, 0, ClerkScript_0x19680a, -1
	person_event SPRITE_COOLTRAINER_M, 10, 11, OW_UP | $1, $2, -1, -1, $0, 0, CooltrainerMScript_0x19681d, -1
	person_event SPRITE_YOUNGSTER, 9, 6, OW_UP | $2, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, YoungsterScript_0x196831, -1
