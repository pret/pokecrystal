Route32PokeCenter1F_MapScriptHeader: ; 0x69b50
	; trigger count
	db 0

	; callback count
	db 0
; 0x69b52

NurseScript_0x69b52: ; 0x69b52
	jumpstd $0000
; 0x69b55

FishingGuruScript_0x69b55: ; 0x69b55
	faceplayer
	loadfont
	checkbit1 $0017
	iftrue UnknownScript_0x69b7a
	2writetext UnknownText_0x69b83
	yesorno
	iffalse UnknownScript_0x69b74
	2writetext UnknownText_0x69be8
	keeptextopen
	verbosegiveitem OLD_ROD, 1
	2writetext UnknownText_0x69c1b
	closetext
	loadmovesprites
	setbit1 $0017
	end
; 0x69b74

UnknownScript_0x69b74: ; 0x69b74
	2writetext UnknownText_0x69c6c
	closetext
	loadmovesprites
	end
; 0x69b7a

UnknownScript_0x69b7a: ; 0x69b7a
	2writetext UnknownText_0x69c8d
	closetext
	loadmovesprites
	end
; 0x69b80

CooltrainerFScript_0x69b80: ; 0x69b80
	jumptextfaceplayer UnknownText_0x69cac
; 0x69b83

UnknownText_0x69b83: ; 0x69b83
	db $0, "This is a great", $4f
	db "fishing spot.", $51
	db "You saw people", $4f
	db "fishing? How", $55
	db "about you?", $51
	db "Would you like one", $4f
	db "of my RODS?", $57
; 0x69be8

UnknownText_0x69be8: ; 0x69be8
	db $0, "Heh, that's good", $4f
	db "to hear.", $51
	db "Now you're an", $4f
	db "angler too!", $57
; 0x69c1b

UnknownText_0x69c1b: ; 0x69c1b
	db $0, "Fishing is great!", $51
	db "If there's water,", $4f
	db "be it the sea or a", $51
	db "stream, try out", $4f
	db "your ROD.", $57
; 0x69c6c

UnknownText_0x69c6c: ; 0x69c6c
	db $0, "Oh. That's rather", $4f
	db "disappointing…", $57
; 0x69c8d

UnknownText_0x69c8d: ; 0x69c8d
	db $0, "Yo, kid. How are", $4f
	db "they biting?", $57
; 0x69cac

UnknownText_0x69cac: ; 0x69cac
	db $0, "What should I make", $4f
	db "my #MON hold?", $51
	db "Maybe an item that", $4f
	db "increases ATTACK", $55
	db "power…", $57
; 0x69cf9

Route32PokeCenter1F_MapEventHeader: ; 0x69cf9
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $3, 1, GROUP_ROUTE_32, MAP_ROUTE_32
	warp_def $7, $4, 1, GROUP_ROUTE_32, MAP_ROUTE_32
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 3
	person_event SPRITE_NURSE, 5, 7, $6, $0, 255, 255, $0, 0, NurseScript_0x69b52, $ffff
	person_event SPRITE_FISHING_GURU, 8, 5, $6, $0, 255, 255, $a0, 0, FishingGuruScript_0x69b55, $ffff
	person_event SPRITE_COOLTRAINER_F, 6, 10, $6, $0, 255, 255, $80, 0, CooltrainerFScript_0x69b80, $ffff
; 0x69d35

