	object_const_def
	const ROUTE19_SWIMMER_GIRL
	const ROUTE19_SWIMMER_GUY1
	const ROUTE19_SWIMMER_GUY2
	const ROUTE19_SWIMMER_GUY3
	const ROUTE19_FISHER1
	const ROUTE19_FISHER2

Route19_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, Route19ClearRocksCallback

Route19ClearRocksCallback:
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .Done
	changeblock  6,  6, $7a ; rock
	changeblock  8,  6, $7a ; rock
	changeblock 10,  6, $7a ; rock
	changeblock 12,  8, $7a ; rock
	changeblock  4,  8, $7a ; rock
	changeblock 10, 10, $7a ; rock
.Done:
	endcallback

TrainerSwimmerfDawn:
	trainer SWIMMERF, DAWN, EVENT_BEAT_SWIMMERF_DAWN, SwimmerfDawnSeenText, SwimmerfDawnBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfDawnAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermHarold:
	trainer SWIMMERM, HAROLD, EVENT_BEAT_SWIMMERM_HAROLD, SwimmermHaroldSeenText, SwimmermHaroldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermHaroldAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermJerome:
	trainer SWIMMERM, JEROME, EVENT_BEAT_SWIMMERM_JEROME, SwimmermJeromeSeenText, SwimmermJeromeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermJeromeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermTucker:
	trainer SWIMMERM, TUCKER, EVENT_BEAT_SWIMMERM_TUCKER, SwimmermTuckerSeenText, SwimmermTuckerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermTuckerAfterBattleText
	waitbutton
	closetext
	end

Route19Fisher1Script:
	faceplayer
	opentext
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .RocksCleared
	writetext Route19Fisher1Text
	waitbutton
	closetext
	end

.RocksCleared:
	writetext Route19Fisher1Text_RocksCleared
	waitbutton
	closetext
	end

Route19Fisher2Script:
	faceplayer
	opentext
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .RocksCleared
	writetext Route19Fisher2Text
	waitbutton
	closetext
	end

.RocksCleared:
	writetext Route19Fisher2Text_RocksCleared
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

SwimmermHaroldAfterBattleText:
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

SwimmermTuckerAfterBattleText:
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

SwimmerfDawnAfterBattleText:
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

SwimmermJeromeAfterBattleText:
	text "I might be bad at"
	line "swimming, but I"
	cont "love the sea."
	done

Route19Fisher1Text:
	text "Sorry. This road"
	line "is closed for"
	cont "construction."

	para "If you want to get"
	line "to CINNABAR, you'd"

	para "better go south"
	line "from PALLET TOWN."
	done

Route19Fisher1Text_RocksCleared:
	text "I'm all sweaty."
	line "Time for a swim!"
	done

Route19Fisher2Text:
	text "Who knows how long"
	line "it would take to"
	cont "move this boulder…"
	done

Route19Fisher2Text_RocksCleared:
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

Route19_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  3, ROUTE_19_FUCHSIA_GATE, 3

	def_coord_events

	def_bg_events
	bg_event 11, 13, BGEVENT_READ, Route19Sign
	bg_event 11,  1, BGEVENT_READ, CarefulSwimmingSign

	def_object_events
	object_event  9, 23, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerSwimmerfDawn, -1
	object_event 13, 28, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermHarold, -1
	object_event 11, 17, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermJerome, -1
	object_event  8, 23, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerSwimmermTucker, -1
	object_event  9,  5, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 1, Route19Fisher1Script, -1
	object_event 11,  5, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, Route19Fisher2Script, -1
