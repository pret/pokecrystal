LavenderMart_MapScriptHeader: ; 0x7eb1a
	; trigger count
	db 0

	; callback count
	db 0
; 0x7eb1c

UnknownScript_0x7eb1c: ; 0x7eb1c
	loadfont
	pokemart $0, $0015
	loadmovesprites
	end
; 0x7eb23

UnknownScript_0x7eb23: ; 0x7eb23
	jumptextfaceplayer UnknownText_0x7eb29
; 0x7eb26

UnknownScript_0x7eb26: ; 0x7eb26
	jumptextfaceplayer UnknownText_0x7ebac
; 0x7eb29

UnknownText_0x7eb29: ; 0x7eb29
	db $0, "REPEL is a neces-", $4f
	db "sity if you are", $51
	db "going to explore a", $4f
	db "cave.", $51
	db "Even though I like", $4f
	db "exploring, I still", $51
	db "haven't made it to", $4f
	db "all the caves.", $57
; 0x7ebac

UnknownText_0x7ebac: ; 0x7ebac
	db $0, "I heard about a", $4f
	db "craftsman who", $51
	db "makes custom BALLS", $4f
	db "in the JOHTO town", $51
	db "of AZALEA. I wish", $4f
	db "I had some.", $57
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
	person_event $39, 7, 5, $9, $0, 255, 255, $0, 0, UnknownScript_0x7eb1c, $ffff
	person_event $2d, 10, 10, $5, $2, 255, 255, $80, 0, UnknownScript_0x7eb23, $ffff
	person_event $2c, 6, 13, $3, $0, 255, 255, $0, 0, UnknownScript_0x7eb26, $ffff
; 0x7ec45

