GoldenrodDeptStoreRoof_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 2

	; callbacks

	dbw 1, UnknownScript_0x5671b

	dbw 2, UnknownScript_0x5672b

UnknownScript_0x5671b:
	checkflag $0061
	iftrue UnknownScript_0x56722
	return

UnknownScript_0x56722:
	changeblock $0, $2, $3f
	changeblock $0, $4, $f
	return

UnknownScript_0x5672b:
	checkflag $0061
	iftrue UnknownScript_0x56738
	setevent $06f0
	clearevent $06f1
	return

UnknownScript_0x56738:
	clearevent $06f0
	setevent $06f1
	return

ClerkScript_0x5673f:
	loadfont
	pokemart $4, $0000
	loadmovesprites
	end

PokefanFScript_0x56746:
	jumptextfaceplayer UnknownText_0x5677f

FisherScript_0x56749:
	faceplayer
	loadfont
	writetext UnknownText_0x567d2
	closetext
	loadmovesprites
	spriteface $4, UP
	end

TwinScript_0x56754:
	jumptextfaceplayer UnknownText_0x56839

SuperNerdScript_0x56757:
	loadfont
	writetext UnknownText_0x56867
	closetext
	loadmovesprites
	spriteface $6, UP
	loadfont
	writetext UnknownText_0x56871
	closetext
	loadmovesprites
	spriteface $6, RIGHT
	end

PokefanMScript_0x5676a:
	jumptextfaceplayer UnknownText_0x5688e

TeacherScript_0x5676d:
	jumptextfaceplayer UnknownText_0x56901

BugCatcherScript_0x56770:
	jumptextfaceplayer UnknownText_0x56942

MapGoldenrodDeptStoreRoofSignpost0Script:
	jumptext UnknownText_0x569c3

MapGoldenrodDeptStoreRoofSignpost1Script:
	jumptext UnknownText_0x56a2b

MapGoldenrodDeptStoreRoofSignpost2Script:
	jumptext UnknownText_0x56aa6

MapGoldenrodDeptStoreRoofSignpost3Script:
	jumptext UnknownText_0x56b11

UnknownText_0x5677f:
	text "Whew, I'm tired."

	para "I sometimes come"
	line "up to the rooftop"

	para "to take a break"
	line "from shopping."
	done

UnknownText_0x567d2:
	text "Pardon? Who says"
	line "an adult can't get"
	cont "into this?"

	para "I'm going to be"
	line "back every day to"

	para "collect all the"
	line "dolls!"
	done

UnknownText_0x56839:
	text "They have bargain"
	line "sales here every"
	cont "so often."
	done

UnknownText_0x56867:
	text "Oh, wow!"
	done

UnknownText_0x56871:
	text "Will you quit"
	line "bothering me?"
	done

UnknownText_0x5688e:
	text "There's something"
	line "I really want, but"

	para "I don't have the"
	line "necessary cash…"

	para "Maybe I'll sell"
	line "off the BERRIES"
	cont "I've collected…"
	done

UnknownText_0x56901:
	text "Oh, everything is"
	line "so cheap!"

	para "I bought so much,"
	line "my PACK's crammed!"
	done

UnknownText_0x56942:
	text "My #MON always"
	line "get paralyzed or"

	para "poisoned when the"
	line "chips are down…"

	para "So I came to buy"
	line "some FULL HEAL."

	para "I wonder if"
	line "there's any left?"
	done

UnknownText_0x569c3:
	text "These binoculars"
	line "let me see far"

	para "away. Maybe I can"
	line "see my own house."

	para "Is it the one with"
	line "the green roof?"
	done

UnknownText_0x56a2b:
	text "Hey! Some trainers"
	line "are battling on"
	cont "the road!"

	para "A #MON fired a"
	line "flurry of leaves!"

	para "That makes me feel"
	line "like battling"
	cont "right now!"
	done

UnknownText_0x56aa6:
	text "A FISHER caught a"
	line "lot of MAGIKARP…"

	para "They're SPLASHing"
	line "at the same time!"

	para "Look at the water"
	line "going everywhere!"
	done

UnknownText_0x56b11:
	text "A vending machine"
	line "for #MON dolls?"

	para "Insert money, then"
	line "turn the crank…"

	para "But it's almost"
	line "empty…"
	done

GoldenrodDeptStoreRoof_MapEventHeader:
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
