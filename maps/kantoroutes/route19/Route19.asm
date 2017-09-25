const_value set 2
	const ROUTE19_SWIMMER_GIRL
	const ROUTE19_SWIMMER_GUY1
	const ROUTE19_SWIMMER_GUY2
	const ROUTE19_SWIMMER_GUY3
	const ROUTE19_FISHER1
	const ROUTE19_FISHER2

Route19_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_TILES, .ClearRocks

.ClearRocks:
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .Done
	changeblock $6, $6, $7a
	changeblock $8, $6, $7a
	changeblock $a, $6, $7a
	changeblock $c, $8, $7a
	changeblock $4, $8, $7a
	changeblock $a, $a, $7a
.Done:
	return

TrainerSwimmerfDawn:
	trainer EVENT_BEAT_SWIMMERF_DAWN, SWIMMERF, DAWN, SwimmerfDawnSeenText, SwimmerfDawnBeatenText, 0, SwimmerfDawnScript

SwimmerfDawnScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19ebad
	waitbutton
	closetext
	end

TrainerSwimmermHarold:
	trainer EVENT_BEAT_SWIMMERM_HAROLD, SWIMMERM, HAROLD, SwimmermHaroldSeenText, SwimmermHaroldBeatenText, 0, SwimmermHaroldScript

SwimmermHaroldScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19eab4
	waitbutton
	closetext
	end

TrainerSwimmermJerome:
	trainer EVENT_BEAT_SWIMMERM_JEROME, SWIMMERM, JEROME, SwimmermJeromeSeenText, SwimmermJeromeBeatenText, 0, SwimmermJeromeScript

SwimmermJeromeScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19ec7e
	waitbutton
	closetext
	end

TrainerSwimmermTucker:
	trainer EVENT_BEAT_SWIMMERM_TUCKER, SWIMMERM, TUCKER, SwimmermTuckerSeenText, SwimmermTuckerBeatenText, 0, SwimmermTuckerScript

SwimmermTuckerScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19eb3b
	waitbutton
	closetext
	end

FisherScript_0x19ea4d:
	faceplayer
	opentext
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue UnknownScript_0x19ea5b
	writetext UnknownText_0x19ecaf
	waitbutton
	closetext
	end

UnknownScript_0x19ea5b:
	writetext UnknownText_0x19ed24
	waitbutton
	closetext
	end

FisherScript_0x19ea61:
	faceplayer
	opentext
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .RocksCleared
	writetext Route19FisherText1
	waitbutton
	closetext
	end

.RocksCleared:
	writetext Route19FisherText2
	waitbutton
	closetext
	end

Route19Sign:
	jumptext Route19SignText

CarefulSwimmingSign:
	jumptext CarefulSwimmingSignText

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

Route19FisherText1:
	text "Who knows how long"
	line "it would take to"
	cont "move this boulder…"
	done

Route19FisherText2:
	text "The roadwork is"
	line "finally finished."

	para "Now I can go"
	line "fishing again."
	done

Route19SignText:
	text "ROUTE 19"

	para "FUCHSIA CITY -"
	line "SEAFOAM ISLANDS"
	done

CarefulSwimmingSignText:
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
	warp_def $3, $7, 3, ROUTE_19___FUCHSIA_GATE

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 13, 11, SIGNPOST_READ, Route19Sign
	signpost 1, 11, SIGNPOST_READ, CarefulSwimmingSign

.PersonEvents:
	db 6
	person_event SPRITE_SWIMMER_GIRL, 23, 9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 0, TrainerSwimmerfDawn, -1
	person_event SPRITE_SWIMMER_GUY, 28, 13, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 3, TrainerSwimmermHarold, -1
	person_event SPRITE_SWIMMER_GUY, 17, 11, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 3, TrainerSwimmermJerome, -1
	person_event SPRITE_SWIMMER_GUY, 23, 8, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 0, TrainerSwimmermTucker, -1
	person_event SPRITE_FISHER, 5, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 1, FisherScript_0x19ea4d, -1
	person_event SPRITE_FISHER, 5, 11, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 1, FisherScript_0x19ea61, -1
