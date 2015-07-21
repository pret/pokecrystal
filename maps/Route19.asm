Route19_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks

	dbw 1, .ClearRocks

.ClearRocks
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .Done
	changeblock $6, $6, $7a
	changeblock $8, $6, $7a
	changeblock $a, $6, $7a
	changeblock $c, $8, $7a
	changeblock $4, $8, $7a
	changeblock $a, $a, $7a
.Done
	return

TrainerSwimmerfDawn:
	trainer EVENT_BEAT_SWIMMERF_DAWN, SWIMMERF, DAWN, SwimmerfDawnSeenText, SwimmerfDawnBeatenText, $0000, SwimmerfDawnScript

SwimmerfDawnScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x19ebad
	closetext
	loadmovesprites
	end

TrainerSwimmermHarold:
	trainer EVENT_BEAT_SWIMMERM_HAROLD, SWIMMERM, HAROLD, SwimmermHaroldSeenText, SwimmermHaroldBeatenText, $0000, SwimmermHaroldScript

SwimmermHaroldScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x19eab4
	closetext
	loadmovesprites
	end

TrainerSwimmermJerome:
	trainer EVENT_BEAT_SWIMMERM_JEROME, SWIMMERM, JEROME, SwimmermJeromeSeenText, SwimmermJeromeBeatenText, $0000, SwimmermJeromeScript

SwimmermJeromeScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x19ec7e
	closetext
	loadmovesprites
	end

TrainerSwimmermTucker:
	trainer EVENT_BEAT_SWIMMERM_TUCKER, SWIMMERM, TUCKER, SwimmermTuckerSeenText, SwimmermTuckerBeatenText, $0000, SwimmermTuckerScript

SwimmermTuckerScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x19eb3b
	closetext
	loadmovesprites
	end

FisherScript_0x19ea4d:
	faceplayer
	loadfont
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue UnknownScript_0x19ea5b
	writetext UnknownText_0x19ecaf
	closetext
	loadmovesprites
	end

UnknownScript_0x19ea5b:
	writetext UnknownText_0x19ed24
	closetext
	loadmovesprites
	end

FisherScript_0x19ea61:
	faceplayer
	loadfont
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue UnknownScript_0x19ea6f
	writetext UnknownText_0x19ed45
	closetext
	loadmovesprites
	end

UnknownScript_0x19ea6f:
	writetext UnknownText_0x19ed7d
	closetext
	loadmovesprites
	end

MapRoute19Signpost0Script:
	jumptext UnknownText_0x19edbc

MapRoute19Signpost1Script:
	jumptext UnknownText_0x19ede5

SwimmermHaroldSeenText:
	text "Have you ever gone"
	line "swimming in the"
	cont "sea at night?"
	done

SwimmermHaroldBeatenText:
	text "Glub…"
	done

UnknownText_0x19eab4:
	text "At night, the sea"
	line "turns black. It"

	para "feels like it will"
	line "swallow you up."
	done

SwimmermTuckerSeenText:
	text "Pant, pant…"
	line "Just… a little…"

	para "farther… to…"
	line "FUCHSIA…"
	done

SwimmermTuckerBeatenText:
	text "I'm drowning!"
	done

UnknownText_0x19eb3b:
	text "I… asked my girl-"
	line "friend to swim to"
	cont "FUCHSIA… Gasp…"
	done

SwimmerfDawnSeenText:
	text "I'm disgusted by"
	line "wimpy people!"
	done

SwimmerfDawnBeatenText:
	text "I could beat you"
	line "at swimming…"
	done

UnknownText_0x19ebad:
	text "It's a quick swim"
	line "between FUCHSIA"

	para "and SEAFOAM IS-"
	line "LANDS…"

	para "Sheesh, some big"
	line "man my boyfriend"

	para "is! What a wimp!"
	done

SwimmermJeromeSeenText:
	text "Swimming?"
	line "I'm lousy at it."

	para "I'm just splashing"
	line "around in these"
	cont "shallow waters."
	done

SwimmermJeromeBeatenText:
	text "I thought I could"
	line "win."
	done

UnknownText_0x19ec7e:
	text "I might be bad at"
	line "swimming, but I"
	cont "love the sea."
	done

UnknownText_0x19ecaf:
	text "Sorry. This road"
	line "is closed for"
	cont "construction."

	para "If you want to get"
	line "to CINNABAR, you'd"

	para "better go south"
	line "from PALLET TOWN."
	done

UnknownText_0x19ed24:
	text "I'm all sweaty."
	line "Time for a swim!"
	done

UnknownText_0x19ed45:
	text "Who knows how long"
	line "it would take to"
	cont "move this boulder…"
	done

UnknownText_0x19ed7d:
	text "The roadwork is"
	line "finally finished."

	para "Now I can go"
	line "fishing again."
	done

UnknownText_0x19edbc:
	text "ROUTE 19"

	para "FUCHSIA CITY -"
	line "SEAFOAM ISLANDS"
	done

UnknownText_0x19ede5:
	text "Please be careful"
	line "if you are swim-"
	cont "ming to SEAFOAM"
	cont "ISLANDS."

	para "FUCHSIA POLICE"
	done

Route19_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 1
	warp_def $3, $7, 3, GROUP_ROUTE_19___FUCHSIA_GATE, MAP_ROUTE_19___FUCHSIA_GATE

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 13, 11, SIGNPOST_READ, MapRoute19Signpost0Script
	signpost 1, 11, SIGNPOST_READ, MapRoute19Signpost1Script

.PersonEvents:
	db 6
	person_event SPRITE_SWIMMER_GIRL, 27, 13, OW_LEFT | $0, $0, -1, -1, (PAL_OW_GREEN << 4) | $82, 0, TrainerSwimmerfDawn, -1
	person_event SPRITE_SWIMMER_GUY, 32, 17, OW_LEFT | $2, $0, -1, -1, (PAL_OW_RED << 4) | $82, 3, TrainerSwimmermHarold, -1
	person_event SPRITE_SWIMMER_GUY, 21, 15, OW_LEFT | $2, $0, -1, -1, (PAL_OW_RED << 4) | $82, 3, TrainerSwimmermJerome, -1
	person_event SPRITE_SWIMMER_GUY, 27, 12, OW_UP | $3, $0, -1, -1, (PAL_OW_RED << 4) | $82, 0, TrainerSwimmermTucker, -1
	person_event SPRITE_FISHER, 9, 13, OW_UP | $2, $0, -1, -1, (PAL_OW_RED << 4) | $80, 1, FisherScript_0x19ea4d, -1
	person_event SPRITE_FISHER, 9, 15, OW_UP | $1, $1, -1, -1, (PAL_OW_BLUE << 4) | $80, 1, FisherScript_0x19ea61, -1
