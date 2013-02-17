SaffronPokeCenter1F_MapScriptHeader: ; 0x18a47b
	; trigger count
	db 0

	; callback count
	db 0
; 0x18a47d

UnknownScript_0x18a47d: ; 0x18a47d
	jumpstd $0000
; 0x18a480

UnknownScript_0x18a480: ; 0x18a480
	special $00a0
	iftrue UnknownScript_0x18a489
	jumptextfaceplayer UnknownText_0x18a4a3
; 0x18a489

UnknownScript_0x18a489: ; 0x18a489
	jumptextfaceplayer UnknownText_0x18a532
; 0x18a48c

UnknownScript_0x18a48c: ; 0x18a48c
	faceplayer
	loadfont
	checkbit1 $00c9
	iftrue UnknownScript_0x18a49a
	2writetext UnknownText_0x18a5d3
	closetext
	loadmovesprites
	end
; 0x18a49a

UnknownScript_0x18a49a: ; 0x18a49a
	2writetext UnknownText_0x18a62e
	closetext
	loadmovesprites
	end
; 0x18a4a0

UnknownScript_0x18a4a0: ; 0x18a4a0
	jumptextfaceplayer UnknownText_0x18a6c5
; 0x18a4a3

UnknownText_0x18a4a3: ; 0x18a4a3
	db $0, "What are JOHTO's", $4f
	db "#MON CENTERS", $55
	db "like?", $51
	db "…Oh, I see. So", $4f
	db "they're not much", $51
	db "different from the", $4f
	db "ones in KANTO.", $51
	db "I can go to JOHTO", $4f
	db "without worrying,", $55
	db "then!", $57
; 0x18a532

UnknownText_0x18a532: ; 0x18a532
	db $0, "What are JOHTO's", $4f
	db "#MON CENTERS", $55
	db "like?", $51
	db "…Oh, I see.", $4f
	db "So they let you", $51
	db "link with people", $4f
	db "far away?", $51
	db "Then I'll get my", $4f
	db "friend in JOHTO to", $51
	db "catch a MARILL and", $4f
	db "trade it to me!", $57
; 0x18a5d3

UnknownText_0x18a5d3: ; 0x18a5d3
	db $0, "I just happened to", $4f
	db "come through ROCK", $51
	db "TUNNEL. There was", $4f
	db "some commotion at", $55
	db "the POWER PLANT.", $57
; 0x18a62e

UnknownText_0x18a62e: ; 0x18a62e
	db $0, "Caves collapse", $4f
	db "easily.", $51
	db "Several caves have", $4f
	db "disappeared in the", $51
	db "past few years,", $4f
	db "like the one out-", $55
	db "side CERULEAN.", $51
	db "As a pro HIKER,", $4f
	db "that's common", $55
	db "knowledge.", $57
; 0x18a6c5

UnknownText_0x18a6c5: ; 0x18a6c5
	db $0, "SILPH CO.'s HEAD", $4f
	db "OFFICE and the", $51
	db "MAGNET TRAIN STA-", $4f
	db "TION--they're the", $51
	db "places to see in", $4f
	db "SAFFRON.", $57
; 0x18a722

SaffronPokeCenter1F_MapEventHeader: ; 0x18a722
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $3, 4, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY
	warp_def $7, $4, 4, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 4
	person_event $37, 5, 7, $6, $0, 255, 255, $0, 0, UnknownScript_0x18a47d, $ffff
	person_event $29, 6, 11, $2, $11, 255, 255, $a0, 0, UnknownScript_0x18a480, $ffff
	person_event $3a, 10, 12, $8, $0, 255, 255, $80, 0, UnknownScript_0x18a48c, $ffff
	person_event $27, 8, 5, $3, $0, 255, 255, $90, 0, UnknownScript_0x18a4a0, $ffff
; 0x18a76b

