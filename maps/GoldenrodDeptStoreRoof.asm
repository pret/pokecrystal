const_value set 2
	const GOLDENRODDEPTSTOREROOF_CLERK
	const GOLDENRODDEPTSTOREROOF_POKEFAN_F
	const GOLDENRODDEPTSTOREROOF_FISHER
	const GOLDENRODDEPTSTOREROOF_TWIN
	const GOLDENRODDEPTSTOREROOF_SUPER_NERD
	const GOLDENRODDEPTSTOREROOF_POKEFAN_M
	const GOLDENRODDEPTSTOREROOF_TEACHER
	const GOLDENRODDEPTSTOREROOF_BUG_CATCHER

GoldenrodDeptStoreRoof_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 2

	; callbacks

	dbw MAPCALLBACK_TILES, .CheckSaleChangeBlock

	dbw MAPCALLBACK_OBJECTS, .CheckSaleChangeClerk

.CheckSaleChangeBlock:
	checkflag ENGINE_GOLDENROD_DEPT_STORE_SALE_IS_ON
	iftrue .ChangeBlock
	return

.ChangeBlock:
	changeblock $0, $2, $3f
	changeblock $0, $4, $f
	return

.CheckSaleChangeClerk:
	checkflag ENGINE_GOLDENROD_DEPT_STORE_SALE_IS_ON
	iftrue .ChangeClerk
	setevent EVENT_GOLDENROD_SALE_OFF
	clearevent EVENT_GOLDENROD_SALE_ON
	return

.ChangeClerk:
	clearevent EVENT_GOLDENROD_SALE_OFF
	setevent EVENT_GOLDENROD_SALE_ON
	return

ClerkScript_0x5673f:
	opentext
	pokemart MARTTYPE_ROOFTOP, 0
	closetext
	end

PokefanFScript_0x56746:
	jumptextfaceplayer UnknownText_0x5677f

FisherScript_0x56749:
	faceplayer
	opentext
	writetext UnknownText_0x567d2
	waitbutton
	closetext
	spriteface GOLDENRODDEPTSTOREROOF_FISHER, UP
	end

TwinScript_0x56754:
	jumptextfaceplayer UnknownText_0x56839

SuperNerdScript_0x56757:
	opentext
	writetext UnknownText_0x56867
	waitbutton
	closetext
	spriteface GOLDENRODDEPTSTOREROOF_SUPER_NERD, UP
	opentext
	writetext UnknownText_0x56871
	waitbutton
	closetext
	spriteface GOLDENRODDEPTSTOREROOF_SUPER_NERD, RIGHT
	end

PokefanMScript_0x5676a:
	jumptextfaceplayer UnknownText_0x5688e

TeacherScript_0x5676d:
	jumptextfaceplayer UnknownText_0x56901

BugCatcherScript_0x56770:
	jumptextfaceplayer UnknownText_0x56942

Binoculars1:
	jumptext Binoculars1Text

Binoculars2:
	jumptext Binoculars2Text

Binoculars3:
	jumptext Binoculars3Text

PokeDollVendingMachine:
	jumptext PokeDollVendingMachineText

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

Binoculars1Text:
	text "These binoculars"
	line "let me see far"

	para "away. Maybe I can"
	line "see my own house."

	para "Is it the one with"
	line "the green roof?"
	done

Binoculars2Text:
	text "Hey! Some trainers"
	line "are battling on"
	cont "the road!"

	para "A #MON fired a"
	line "flurry of leaves!"

	para "That makes me feel"
	line "like battling"
	cont "right now!"
	done

Binoculars3Text:
	text "A FISHER caught a"
	line "lot of MAGIKARP…"

	para "They're SPLASHing"
	line "at the same time!"

	para "Look at the water"
	line "going everywhere!"
	done

PokeDollVendingMachineText:
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

.Warps:
	db 1
	warp_def $1, $d, 3, GOLDENROD_DEPT_STORE_6F

.XYTriggers:
	db 0

.Signposts:
	db 4
	signpost 3, 15, SIGNPOST_RIGHT, Binoculars1
	signpost 5, 15, SIGNPOST_RIGHT, Binoculars2
	signpost 6, 15, SIGNPOST_RIGHT, Binoculars3
	signpost 0, 3, SIGNPOST_UP, PokeDollVendingMachine

.PersonEvents:
	db 8
	person_event SPRITE_CLERK, 4, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ClerkScript_0x5673f, EVENT_GOLDENROD_SALE_OFF
	person_event SPRITE_POKEFAN_F, 3, 10, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, PokefanFScript_0x56746, -1
	person_event SPRITE_FISHER, 1, 2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, FisherScript_0x56749, -1
	person_event SPRITE_TWIN, 4, 3, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, TwinScript_0x56754, EVENT_GOLDENROD_SALE_ON
	person_event SPRITE_SUPER_NERD, 6, 14, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, SuperNerdScript_0x56757, EVENT_GOLDENROD_SALE_ON
	person_event SPRITE_POKEFAN_M, 0, 7, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PokefanMScript_0x5676a, EVENT_GOLDENROD_SALE_OFF
	person_event SPRITE_TEACHER, 3, 5, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, TeacherScript_0x5676d, EVENT_GOLDENROD_SALE_OFF
	person_event SPRITE_BUG_CATCHER, 6, 1, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, BugCatcherScript_0x56770, EVENT_GOLDENROD_SALE_OFF
