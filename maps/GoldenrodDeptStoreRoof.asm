GoldenrodDeptStoreRoof_MapScriptHeader: ; 0x56713
	; trigger count
	db 0

	; callback count
	db 2

	; callbacks

	dbw 1, UnknownScript_0x5671b

	dbw 2, UnknownScript_0x5672b
; 0x5671b

UnknownScript_0x5671b: ; 0x5671b
	checkbit2 $0061
	iftrue UnknownScript_0x56722
	return
; 0x56722

UnknownScript_0x56722: ; 0x56722
	changeblock $0, $2, $3f
	changeblock $0, $4, $f
	return
; 0x5672b

UnknownScript_0x5672b: ; 0x5672b
	checkbit2 $0061
	iftrue UnknownScript_0x56738
	setbit1 $06f0
	clearbit1 $06f1
	return
; 0x56738

UnknownScript_0x56738: ; 0x56738
	clearbit1 $06f0
	setbit1 $06f1
	return
; 0x5673f

UnknownScript_0x5673f: ; 0x5673f
	loadfont
	pokemart $4, $0000
	loadmovesprites
	end
; 0x56746

UnknownScript_0x56746: ; 0x56746
	jumptextfaceplayer UnknownText_0x5677f
; 0x56749

UnknownScript_0x56749: ; 0x56749
	faceplayer
	loadfont
	2writetext UnknownText_0x567d2
	closetext
	loadmovesprites
	spriteface $4, $1
	end
; 0x56754

UnknownScript_0x56754: ; 0x56754
	jumptextfaceplayer UnknownText_0x56839
; 0x56757

UnknownScript_0x56757: ; 0x56757
	loadfont
	2writetext UnknownText_0x56867
	closetext
	loadmovesprites
	spriteface $6, $1
	loadfont
	2writetext UnknownText_0x56871
	closetext
	loadmovesprites
	spriteface $6, $3
	end
; 0x5676a

UnknownScript_0x5676a: ; 0x5676a
	jumptextfaceplayer UnknownText_0x5688e
; 0x5676d

UnknownScript_0x5676d: ; 0x5676d
	jumptextfaceplayer UnknownText_0x56901
; 0x56770

UnknownScript_0x56770: ; 0x56770
	jumptextfaceplayer UnknownText_0x56942
; 0x56773

MapGoldenrodDeptStoreRoofSignpost0Script: ; 0x56773
	jumptext UnknownText_0x569c3
; 0x56776

MapGoldenrodDeptStoreRoofSignpost1Script: ; 0x56776
	jumptext UnknownText_0x56a2b
; 0x56779

MapGoldenrodDeptStoreRoofSignpost2Script: ; 0x56779
	jumptext UnknownText_0x56aa6
; 0x5677c

MapGoldenrodDeptStoreRoofSignpost3Script: ; 0x5677c
	jumptext UnknownText_0x56b11
; 0x5677f

UnknownText_0x5677f: ; 0x5677f
	db $0, "Whew, I'm tired.", $51
	db "I sometimes come", $4f
	db "up to the rooftop", $51
	db "to take a break", $4f
	db "from shopping.", $57
; 0x567d2

UnknownText_0x567d2: ; 0x567d2
	db $0, "Pardon? Who says", $4f
	db "an adult can't get", $55
	db "into this?", $51
	db "I'm going to be", $4f
	db "back every day to", $51
	db "collect all the", $4f
	db "dolls!", $57
; 0x56839

UnknownText_0x56839: ; 0x56839
	db $0, "They have bargain", $4f
	db "sales here every", $55
	db "so often.", $57
; 0x56867

UnknownText_0x56867: ; 0x56867
	db $0, "Oh, wow!", $57
; 0x56871

UnknownText_0x56871: ; 0x56871
	db $0, "Will you quit", $4f
	db "bothering me?", $57
; 0x5688e

UnknownText_0x5688e: ; 0x5688e
	db $0, "There's something", $4f
	db "I really want, but", $51
	db "I don't have the", $4f
	db "necessary cash…", $51
	db "Maybe I'll sell", $4f
	db "off the BERRIES", $55
	db "I've collected…", $57
; 0x56901

UnknownText_0x56901: ; 0x56901
	db $0, "Oh, everything is", $4f
	db "so cheap!", $51
	db "I bought so much,", $4f
	db "my PACK's crammed!", $57
; 0x56942

UnknownText_0x56942: ; 0x56942
	db $0, "My #MON always", $4f
	db "get paralyzed or", $51
	db "poisoned when the", $4f
	db "chips are down…", $51
	db "So I came to buy", $4f
	db "some FULL HEAL.", $51
	db "I wonder if", $4f
	db "there's any left?", $57
; 0x569c3

UnknownText_0x569c3: ; 0x569c3
	db $0, "These binoculars", $4f
	db "let me see far", $51
	db "away. Maybe I can", $4f
	db "see my own house.", $51
	db "Is it the one with", $4f
	db "the green roof?", $57
; 0x56a2b

UnknownText_0x56a2b: ; 0x56a2b
	db $0, "Hey! Some trainers", $4f
	db "are battling on", $55
	db "the road!", $51
	db "A #MON fired a", $4f
	db "flurry of leaves!", $51
	db "That makes me feel", $4f
	db "like battling", $55
	db "right now!", $57
; 0x56aa6

UnknownText_0x56aa6: ; 0x56aa6
	db $0, "A FISHER caught a", $4f
	db "lot of MAGIKARP…", $51
	db "They're SPLASHing", $4f
	db "at the same time!", $51
	db "Look at the water", $4f
	db "going everywhere!", $57
; 0x56b11

UnknownText_0x56b11: ; 0x56b11
	db $0, "A vending machine", $4f
	db "for #MON dolls?", $51
	db "Insert money, then", $4f
	db "turn the crank…", $51
	db "But it's almost", $4f
	db "empty…", $57
; 0x56b6d

GoldenrodDeptStoreRoof_MapEventHeader: ; 0x56b6d
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $1, $d, 3, GROUP_GOLDENROD_DEPT_STORE_6F, MAP_GOLDENROD_DEPT_STORE_6F

	; xy triggers
	db 0

	; signposts
	db 4
	signpost 3, 15, $3, MapGoldenrodDeptStoreRoofSignpost0Script
	signpost 5, 15, $3, MapGoldenrodDeptStoreRoofSignpost1Script
	signpost 6, 15, $3, MapGoldenrodDeptStoreRoofSignpost2Script
	signpost 0, 3, $1, MapGoldenrodDeptStoreRoofSignpost3Script

	; people-events
	db 8
	person_event $39, 8, 5, $9, $0, 255, 255, $0, 0, UnknownScript_0x5673f, $06f0
	person_event $2e, 7, 14, $5, $1, 255, 255, $80, 0, UnknownScript_0x56746, $ffff
	person_event $3a, 5, 6, $7, $0, 255, 255, $90, 0, UnknownScript_0x56749, $ffff
	person_event $26, 8, 7, $2, $11, 255, 255, $a0, 0, UnknownScript_0x56754, $06f1
	person_event $2b, 10, 18, $9, $0, 255, 255, $a0, 0, UnknownScript_0x56757, $06f1
	person_event $2d, 4, 11, $5, $1, 255, 255, $0, 0, UnknownScript_0x5676a, $06f0
	person_event $29, 7, 9, $2, $11, 255, 255, $a0, 0, UnknownScript_0x5676d, $06f0
	person_event $25, 10, 5, $7, $0, 255, 255, $80, 0, UnknownScript_0x56770, $06f0
; 0x56bf4

