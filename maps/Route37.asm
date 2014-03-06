Route37_MapScriptHeader: ; 0x1a8d72
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 2, UnknownScript_0x1a8d77
; 0x1a8d77

UnknownScript_0x1a8d77: ; 0x1a8d77
	checkcode $b
	if_equal SUNDAY, UnknownScript_0x1a8d80
	disappear $6
	return
; 0x1a8d80

UnknownScript_0x1a8d80: ; 0x1a8d80
	appear $6
	return
; 0x1a8d83

TrainerTwinsAnnandanne1: ; 0x1a8d83
	; bit/flag number
	dw $465

	; trainer group && trainer id
	db TWINS, ANNANDANNE1

	; text when seen
	dw TwinsAnnandanne1SeenText

	; text when trainer beaten
	dw TwinsAnnandanne1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw TwinsAnnandanne1Script
; 0x1a8d8f

TwinsAnnandanne1Script: ; 0x1a8d8f
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1a8e62
	closetext
	loadmovesprites
	end
; 0x1a8d97

TrainerTwinsAnnandanne2: ; 0x1a8d97
	; bit/flag number
	dw $465

	; trainer group && trainer id
	db TWINS, ANNANDANNE2

	; text when seen
	dw TwinsAnnandanne2SeenText

	; text when trainer beaten
	dw TwinsAnnandanne2BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw TwinsAnnandanne2Script
; 0x1a8da3

TwinsAnnandanne2Script: ; 0x1a8da3
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1a8eec
	closetext
	loadmovesprites
	end
; 0x1a8dab

TrainerPsychicGreg: ; 0x1a8dab
	; bit/flag number
	dw $43e

	; trainer group && trainer id
	db PSYCHIC_T, GREG

	; text when seen
	dw PsychicGregSeenText

	; text when trainer beaten
	dw PsychicGregBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PsychicGregScript
; 0x1a8db7

PsychicGregScript: ; 0x1a8db7
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1a8f80
	closetext
	loadmovesprites
	end
; 0x1a8dbf

BugCatcherScript_0x1a8dbf: ; 0x1a8dbf
	faceplayer
	loadfont
	checkevent EVENT_GOT_MAGNET_FROM_SUNNY
	iftrue UnknownScript_0x1a8dfa
	checkcode $b
	if_not_equal SUNDAY, UnknownScript_0x1a8e00
	checkevent EVENT_MET_SUNNY_OF_SUNDAY
	iftrue UnknownScript_0x1a8dda
	2writetext UnknownText_0x1a8fc8
	keeptextopen
	setevent EVENT_MET_SUNNY_OF_SUNDAY
UnknownScript_0x1a8dda: ; 0x1a8dda
	checkflag $0063
	iftrue UnknownScript_0x1a8de7
	2writetext UnknownText_0x1a9004
	keeptextopen
	2jump UnknownScript_0x1a8deb
; 0x1a8de7

UnknownScript_0x1a8de7: ; 0x1a8de7
	2writetext UnknownText_0x1a902f
	keeptextopen
UnknownScript_0x1a8deb: ; 0x1a8deb
	verbosegiveitem MAGNET, 1
	iffalse UnknownScript_0x1a8dfe
	setevent EVENT_GOT_MAGNET_FROM_SUNNY
	2writetext UnknownText_0x1a905a
	closetext
	loadmovesprites
	end
; 0x1a8dfa

UnknownScript_0x1a8dfa: ; 0x1a8dfa
	2writetext UnknownText_0x1a90fc
	closetext
UnknownScript_0x1a8dfe: ; 0x1a8dfe
	loadmovesprites
	end
; 0x1a8e00

UnknownScript_0x1a8e00: ; 0x1a8e00
	2writetext UnknownText_0x1a916e
	closetext
	loadmovesprites
	end
; 0x1a8e06

MapRoute37Signpost0Script: ; 0x1a8e06
	jumptext UnknownText_0x1a9197
; 0x1a8e09

FruitTreeScript_0x1a8e09: ; 0x1a8e09
	fruittree $11
; 0x1a8e0b

FruitTreeScript_0x1a8e0b: ; 0x1a8e0b
	fruittree $12
; 0x1a8e0d

FruitTreeScript_0x1a8e0d: ; 0x1a8e0d
	fruittree $13
; 0x1a8e0f

MapRoute37SignpostItem1: ; 0x1a8e0f
	dw $00a9
	db ETHER
	
; 0x1a8e12

TwinsAnnandanne1SeenText: ; 0x1a8e12
	text "ANN: ANNE and I"
	line "are in this to-"
	cont "gether!"
	done
; 0x1a8e3b

TwinsAnnandanne1BeatenText: ; 0x1a8e3b
	text "ANN & ANNE: Nnn… A"
	line "little too strong."
	done
; 0x1a8e62

UnknownText_0x1a8e62: ; 0x1a8e62
	text "ANN: I can tell"
	line "what my sister and"

	para "my #MON are"
	line "thinking."
	done
; 0x1a8e9c

TwinsAnnandanne2SeenText: ; 0x1a8e9c
	text "ANNE: ANN and I"
	line "are in this to-"
	cont "gether!"
	done
; 0x1a8ec5

TwinsAnnandanne2BeatenText: ; 0x1a8ec5
	text "ANN & ANNE: Nnn… A"
	line "little too strong."
	done
; 0x1a8eec

UnknownText_0x1a8eec: ; 0x1a8eec
	text "ANNE: We share the"
	line "same feelings as"
	cont "our #MON."
	done
; 0x1a8f1b

PsychicGregSeenText: ; 0x1a8f1b
	text "#MON can't do a"
	line "thing if they are"
	cont "asleep."

	para "I'll show you how"
	line "scary that is!"
	done
; 0x1a8f65

PsychicGregBeatenText: ; 0x1a8f65
	text "I lost. That's"
	line "pretty sad…"
	done
; 0x1a8f80

UnknownText_0x1a8f80: ; 0x1a8f80
	text "Putting #MON to"
	line "sleep or paralyz-"
	cont "ing them are good"
	cont "battle techniques."
	done
; 0x1a8fc8

UnknownText_0x1a8fc8: ; 0x1a8fc8
	text "SUNNY: Hi!"

	para "I'm SUNNY of Sun-"
	line "day, meaning it's"
	cont "Sunday today!"
	done
; 0x1a9004

UnknownText_0x1a9004: ; 0x1a9004
	text "I was told to give"
	line "you this if I saw"
	cont "you!"
	done
; 0x1a902f

UnknownText_0x1a902f: ; 0x1a902f
	text "I was told to give"
	line "you this if I saw"
	cont "you!"
	done
; 0x1a905a

UnknownText_0x1a905a: ; 0x1a905a
	text "SUNNY: That thing…"

	para "Um…"

	para "… What was it now…"

	para "…"

	para "Oh! I remember"
	line "now!"

	para "A #MON that"
	line "knows electric"

	para "moves should hold"
	line "it."

	para "My sis MONICA said"
	line "it powers up"
	cont "electric moves!"
	done
; 0x1a90fc

UnknownText_0x1a90fc: ; 0x1a90fc
	text "SUNNY: My sisters"
	line "and brothers are"
	cont "MONICA, TUSCANY,"
	cont "WESLEY, ARTHUR,"
	cont "FRIEDA and SANTOS."

	para "They're all older"
	line "than me!"
	done
; 0x1a916e

UnknownText_0x1a916e: ; 0x1a916e
	text "SUNNY: Isn't today"
	line "Sunday?"
	cont "Um… I forgot!"
	done
; 0x1a9197

UnknownText_0x1a9197: ; 0x1a9197
	text "ROUTE 37"
	done
; 0x1a91a1

Route37_MapEventHeader: ; 0x1a91a1
	; filler
	db 0, 0

	; warps
	db 0

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 3, 5, $0, MapRoute37Signpost0Script
	signpost 2, 4, $7, MapRoute37SignpostItem1

	; people-events
	db 7
	person_event SPRITE_WEIRD_TREE, 16, 10, $6, $0, 255, 255, $82, 1, TrainerTwinsAnnandanne1, $ffff
	person_event SPRITE_WEIRD_TREE, 16, 11, $6, $0, 255, 255, $82, 1, TrainerTwinsAnnandanne2, $ffff
	person_event SPRITE_YOUNGSTER, 10, 10, $a, $0, 255, 255, $92, 1, TrainerPsychicGreg, $ffff
	person_event SPRITE_FRUIT_TREE, 9, 17, $1, $0, 255, 255, $0, 0, FruitTreeScript_0x1a8e09, $ffff
	person_event SPRITE_BUG_CATCHER, 12, 20, $2, $11, 255, 255, $0, 0, BugCatcherScript_0x1a8dbf, $075b
	person_event SPRITE_FRUIT_TREE, 9, 20, $1, $0, 255, 255, $0, 0, FruitTreeScript_0x1a8e0b, $ffff
	person_event SPRITE_FRUIT_TREE, 11, 19, $1, $0, 255, 255, $0, 0, FruitTreeScript_0x1a8e0d, $ffff
; 0x1a920c

