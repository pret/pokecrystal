LavenderMart_MapScriptHeader: ; 0x7eb1a
	; trigger count
	db 0

	; callback count
	db 0
; 0x7eb1c

ClerkScript_0x7eb1c: ; 0x7eb1c
	loadfont
	pokemart $0, $0015
	loadmovesprites
	end
; 0x7eb23

PokefanMScript_0x7eb23: ; 0x7eb23
	jumptextfaceplayer UnknownText_0x7eb29
; 0x7eb26

RockerScript_0x7eb26: ; 0x7eb26
	jumptextfaceplayer UnknownText_0x7ebac
; 0x7eb29

UnknownText_0x7eb29: ; 0x7eb29
	text "REPEL is a neces-"
	line "sity if you are"

	para "going to explore a"
	line "cave."

	para "Even though I like"
	line "exploring, I still"

	para "haven't made it to"
	line "all the caves."
	done
; 0x7ebac

UnknownText_0x7ebac: ; 0x7ebac
	text "I heard about a"
	line "craftsman who"

	para "makes custom BALLS"
	line "in the JOHTO town"

	para "of AZALEA. I wish"
	line "I had some."
	done
; 0x7ec0e

LavenderMart_MapEventHeader: ; 0x7ec0e
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 5, GROUP_LAVENDER_TOWN, MAP_LAVENDER_TOWN
	warp_def $7, $3, 5, GROUP_LAVENDER_TOWN, MAP_LAVENDER_TOWN

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 3
	person_event SPRITE_CLERK, 7, 5, $9, $0, 255, 255, $0, 0, ClerkScript_0x7eb1c, $ffff
	person_event SPRITE_POKEFAN_M, 10, 10, $5, $2, 255, 255, $80, 0, PokefanMScript_0x7eb23, $ffff
	person_event SPRITE_ROCKER, 6, 13, $3, $0, 255, 255, $0, 0, RockerScript_0x7eb26, $ffff
; 0x7ec45

