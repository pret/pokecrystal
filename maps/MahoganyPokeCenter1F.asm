MahoganyPokeCenter1F_MapScriptHeader: ; 0x19a354
	; trigger count
	db 0

	; callback count
	db 0
; 0x19a356

NurseScript_0x19a356: ; 0x19a356
	jumpstd pokecenternurse
; 0x19a359

PokefanMScript_0x19a359: ; 0x19a359
	jumptextfaceplayer UnknownText_0x19a362
; 0x19a35c

YoungsterScript_0x19a35c: ; 0x19a35c
	jumptextfaceplayer UnknownText_0x19a3b3
; 0x19a35f

CooltrainerFScript_0x19a35f: ; 0x19a35f
	jumptextfaceplayer UnknownText_0x19a418
; 0x19a362

UnknownText_0x19a362: ; 0x19a362
	text "What's this? TEAM"
	line "ROCKET has come"
	cont "back?"

	para "I saw some men in"
	line "black at LAKE OF"
	cont "RAGE…"
	done
; 0x19a3b3

UnknownText_0x19a3b3: ; 0x19a3b3
	text "I stop my #MON"
	line "from evolving too"
	cont "early."

	para "I make them learn"
	line "certain moves be-"
	cont "fore I let them"
	cont "evolve."
	done
; 0x19a418

UnknownText_0x19a418: ; 0x19a418
	text "#MON do become"
	line "stronger when they"

	para "evolve, but they"
	line "also learn moves"
	cont "more slowly."
	done
; 0x19a46a

MahoganyPokeCenter1F_MapEventHeader: ; 0x19a46a
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $3, 4, GROUP_MAHOGANY_TOWN, MAP_MAHOGANY_TOWN
	warp_def $7, $4, 4, GROUP_MAHOGANY_TOWN, MAP_MAHOGANY_TOWN
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 4
	person_event SPRITE_NURSE, 5, 7, $6, $0, 255, 255, $0, 0, NurseScript_0x19a356, $ffff
	person_event SPRITE_POKEFAN_M, 6, 11, $2, $11, 255, 255, $80, 0, PokefanMScript_0x19a359, $ffff
	person_event SPRITE_YOUNGSTER, 7, 5, $9, $0, 255, 255, $a0, 0, YoungsterScript_0x19a35c, $ffff
	person_event SPRITE_COOLTRAINER_F, 7, 6, $8, $0, 255, 255, $0, 0, CooltrainerFScript_0x19a35f, $ffff
; 0x19a4b3
