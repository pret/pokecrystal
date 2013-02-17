LavenderPokeCenter1F_MapScriptHeader: ; 0x7e69e
	; trigger count
	db 0

	; callback count
	db 0
; 0x7e6a0

UnknownScript_0x7e6a0: ; 0x7e6a0
	jumpstd $0000
; 0x7e6a3

UnknownScript_0x7e6a3: ; 0x7e6a3
	jumptextfaceplayer UnknownText_0x7e6bd
; 0x7e6a6

UnknownScript_0x7e6a6: ; 0x7e6a6
	jumptextfaceplayer UnknownText_0x7e710
; 0x7e6a9

UnknownScript_0x7e6a9: ; 0x7e6a9
	faceplayer
	loadfont
	checkbit1 $00c9
	iftrue UnknownScript_0x7e6b7
	2writetext UnknownText_0x7e779
	closetext
	loadmovesprites
	end
; 0x7e6b7

UnknownScript_0x7e6b7: ; 0x7e6b7
	2writetext UnknownText_0x7e7ed
	closetext
	loadmovesprites
	end
; 0x7e6bd

UnknownText_0x7e6bd: ; 0x7e6bd
	db $0, "To the north of", $4f
	db "LAVENDER is ROCK", $51
	db "TUNNEL. Go through", $4f
	db "it to get to the", $55
	db "POWER PLANT.", $57
; 0x7e710

UnknownText_0x7e710: ; 0x7e710
	db $0, "There's a radio", $4f
	db "program that plays", $55
	db "# FLUTE music.", $51
	db "Oh? Ah, your radio", $4f
	db "needs an EXPN CARD", $55
	db "to tune into it.", $57
; 0x7e779

UnknownText_0x7e779: ; 0x7e779
	db $0, "If the POWER PLANT", $4f
	db "isn't running, the", $51
	db "MAGNET TRAIN won't", $4f
	db "run either…", $51
	db "It also means the", $4f
	db "RADIO STATION", $55
	db "can't broadcast…", $57
; 0x7e7ed

UnknownText_0x7e7ed: ; 0x7e7ed
	db $0, "The DIRECTOR of", $4f
	db "the RADIO STATION", $55
	db "sure was happy.", $51
	db "He said they're", $4f
	db "back on the air", $51
	db "because the POWER", $4f
	db "PLANT is running", $55
	db "smoothly again.", $57
; 0x7e872

LavenderPokeCenter1F_MapEventHeader: ; 0x7e872
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $3, 1, GROUP_LAVENDER_TOWN, MAP_LAVENDER_TOWN
	warp_def $7, $4, 1, GROUP_LAVENDER_TOWN, MAP_LAVENDER_TOWN
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 4
	person_event $37, 5, 7, $6, $0, 255, 255, $0, 0, UnknownScript_0x7e6a0, $ffff
	person_event $40, 10, 11, $5, $1, 255, 255, $0, 0, UnknownScript_0x7e6a3, $ffff
	person_event $29, 7, 9, $6, $0, 255, 255, $a0, 0, UnknownScript_0x7e6a6, $ffff
	person_event $27, 9, 5, $4, $10, 255, 255, $80, 0, UnknownScript_0x7e6a9, $ffff
; 0x7e8bb

