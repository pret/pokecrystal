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
	checkflag $0061
	iftrue UnknownScript_0x56722
	return
; 0x56722

UnknownScript_0x56722: ; 0x56722
	changeblock $0, $2, $3f
	changeblock $0, $4, $f
	return
; 0x5672b

UnknownScript_0x5672b: ; 0x5672b
	checkflag $0061
	iftrue UnknownScript_0x56738
	setevent $06f0
	clearevent $06f1
	return
; 0x56738

UnknownScript_0x56738: ; 0x56738
	clearevent $06f0
	setevent $06f1
	return
; 0x5673f

ClerkScript_0x5673f: ; 0x5673f
	loadfont
	pokemart $4, $0000
	loadmovesprites
	end
; 0x56746

PokefanFScript_0x56746: ; 0x56746
	jumptextfaceplayer UnknownText_0x5677f
; 0x56749

FisherScript_0x56749: ; 0x56749
	faceplayer
	loadfont
	writetext UnknownText_0x567d2
	closetext
	loadmovesprites
	spriteface $4, $1
	end
; 0x56754

TwinScript_0x56754: ; 0x56754
	jumptextfaceplayer UnknownText_0x56839
; 0x56757

SuperNerdScript_0x56757: ; 0x56757
	loadfont
	writetext UnknownText_0x56867
	closetext
	loadmovesprites
	spriteface $6, $1
	loadfont
	writetext UnknownText_0x56871
	closetext
	loadmovesprites
	spriteface $6, $3
	end
; 0x5676a

PokefanMScript_0x5676a: ; 0x5676a
	jumptextfaceplayer UnknownText_0x5688e
; 0x5676d

TeacherScript_0x5676d: ; 0x5676d
	jumptextfaceplayer UnknownText_0x56901
; 0x56770

BugCatcherScript_0x56770: ; 0x56770
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
	text "Whew, I'm tired."

	para "I sometimes come"
	line "up to the rooftop"

	para "to take a break"
	line "from shopping."
	done
; 0x567d2

UnknownText_0x567d2: ; 0x567d2
	text "Pardon? Who says"
	line "an adult can't get"
	cont "into this?"

	para "I'm going to be"
	line "back every day to"

	para "collect all the"
	line "dolls!"
	done
; 0x56839

UnknownText_0x56839: ; 0x56839
	text "They have bargain"
	line "sales here every"
	cont "so often."
	done
; 0x56867

UnknownText_0x56867: ; 0x56867
	text "Oh, wow!"
	done
; 0x56871

UnknownText_0x56871: ; 0x56871
	text "Will you quit"
	line "bothering me?"
	done
; 0x5688e

UnknownText_0x5688e: ; 0x5688e
	text "There's something"
	line "I really want, but"

	para "I don't have the"
	line "necessary cash…"

	para "Maybe I'll sell"
	line "off the BERRIES"
	cont "I've collected…"
	done
; 0x56901

UnknownText_0x56901: ; 0x56901
	text "Oh, everything is"
	line "so cheap!"

	para "I bought so much,"
	line "my PACK's crammed!"
	done
; 0x56942

UnknownText_0x56942: ; 0x56942
	text "My #MON always"
	line "get paralyzed or"

	para "poisoned when the"
	line "chips are down…"

	para "So I came to buy"
	line "some FULL HEAL."

	para "I wonder if"
	line "there's any left?"
	done
; 0x569c3

UnknownText_0x569c3: ; 0x569c3
	text "These binoculars"
	line "let me see far"

	para "away. Maybe I can"
	line "see my own house."

	para "Is it the one with"
	line "the green roof?"
	done
; 0x56a2b

UnknownText_0x56a2b: ; 0x56a2b
	text "Hey! Some trainers"
	line "are battling on"
	cont "the road!"

	para "A #MON fired a"
	line "flurry of leaves!"

	para "That makes me feel"
	line "like battling"
	cont "right now!"
	done
; 0x56aa6

UnknownText_0x56aa6: ; 0x56aa6
	text "A FISHER caught a"
	line "lot of MAGIKARP…"

	para "They're SPLASHing"
	line "at the same time!"

	para "Look at the water"
	line "going everywhere!"
	done
; 0x56b11

UnknownText_0x56b11: ; 0x56b11
	text "A vending machine"
	line "for #MON dolls?"

	para "Insert money, then"
	line "turn the crank…"

	para "But it's almost"
	line "empty…"
	done
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
	person_event SPRITE_CLERK, 8, 5, $9, $0, 255, 255, $0, 0, ClerkScript_0x5673f, $06f0
	person_event SPRITE_POKEFAN_F, 7, 14, $5, $1, 255, 255, $80, 0, PokefanFScript_0x56746, $ffff
	person_event SPRITE_FISHER, 5, 6, $7, $0, 255, 255, $90, 0, FisherScript_0x56749, $ffff
	person_event SPRITE_TWIN, 8, 7, $2, $11, 255, 255, $a0, 0, TwinScript_0x56754, $06f1
	person_event SPRITE_SUPER_NERD, 10, 18, $9, $0, 255, 255, $a0, 0, SuperNerdScript_0x56757, $06f1
	person_event SPRITE_POKEFAN_M, 4, 11, $5, $1, 255, 255, $0, 0, PokefanMScript_0x5676a, $06f0
	person_event SPRITE_TEACHER, 7, 9, $2, $11, 255, 255, $a0, 0, TeacherScript_0x5676d, $06f0
	person_event SPRITE_BUG_CATCHER, 10, 5, $7, $0, 255, 255, $80, 0, BugCatcherScript_0x56770, $06f0
; 0x56bf4

