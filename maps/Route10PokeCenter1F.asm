Route10PokeCenter1F_MapScriptHeader: ; 0x188bd2
	; trigger count
	db 0

	; callback count
	db 0
; 0x188bd4

UnknownScript_0x188bd4: ; 0x188bd4
	jumpstd $0000
; 0x188bd7

UnknownScript_0x188bd7: ; 0x188bd7
	jumptextfaceplayer UnknownText_0x188bf1
; 0x188bda

UnknownScript_0x188bda: ; 0x188bda
	faceplayer
	loadfont
	checkbit1 $00c9
	iftrue UnknownScript_0x188be8
	2writetext UnknownText_0x188c26
	closetext
	loadmovesprites
	end
; 0x188be8

UnknownScript_0x188be8: ; 0x188be8
	2writetext UnknownText_0x188c9e
	closetext
	loadmovesprites
	end
; 0x188bee

UnknownScript_0x188bee: ; 0x188bee
	jumptextfaceplayer UnknownText_0x188d0c
; 0x188bf1

UnknownText_0x188bf1: ; 0x188bf1
	db $0, "A #MON CENTER", $4f
	db "near a cave?", $51
	db "That's mighty", $4f
	db "convenient.", $57
; 0x188c26

UnknownText_0x188c26: ; 0x188c26
	db $0, "The POWER PLANT's", $4f
	db "MANAGER is looking", $51
	db "for a strong #-", $4f
	db "MON trainer.", $51
	db "He needs help", $4f
	db "getting back", $51
	db "something that", $4f
	db "was stolen.", $57
; 0x188c9e

UnknownText_0x188c9e: ; 0x188c9e
	db $0, "I hear TEAM ROCKET", $4f
	db "got back together", $51
	db "in JOHTO but fell", $4f
	db "apart right away.", $51
	db "I didn't know any-", $4f
	db "thing about that.", $57
; 0x188d0c

UnknownText_0x188d0c: ; 0x188d0c
	db $0, "When you go out-", $4f
	db "side, you can see", $51
	db "the roof of a big", $4f
	db "building.", $51
	db "That's the POWER", $4f
	db "PLANT.", $57
; 0x188d63

Route10PokeCenter1F_MapEventHeader: ; 0x188d63
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $3, 1, GROUP_ROUTE_10_NORTH, MAP_ROUTE_10_NORTH
	warp_def $7, $4, 1, GROUP_ROUTE_10_NORTH, MAP_ROUTE_10_NORTH
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 4
	person_event $37, 5, 7, $6, $0, 255, 255, $0, 0, UnknownScript_0x188bd4, $ffff
	person_event $40, 10, 11, $5, $1, 255, 255, $80, 0, UnknownScript_0x188bd7, $ffff
	person_event $48, 6, 11, $3, $0, 255, 255, $a0, 0, UnknownScript_0x188bda, $ffff
	person_event $24, 7, 5, $6, $0, 255, 255, $0, 0, UnknownScript_0x188bee, $ffff
; 0x188dac

