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
	text "As-tu déjà"
	line "nagé au clair"
	cont "de lune?"
	done

SwimmermHaroldBeatenText:
	text "Glub..."
	done

SwimmermHaroldAfterBattleText:
	text "Un bain de minuit,"
	line "c'est trop génial."
	done

SwimmermTuckerSeenText:
	text "Pfff...pfff..."
	line "PARMANIE..n'est.."

	para "plus...très..."
	line "loin...!"
	done

SwimmermTuckerBeatenText:
	text "Je me noie!"
	done

SwimmermTuckerAfterBattleText:
	text "J'ai demandé à ma"
	line "copine de nager"
	cont "jusqu'à PARMANIE."
	done

SwimmerfDawnSeenText:
	text "Nyaaaaah!"
	done

SwimmerfDawnBeatenText:
	text "Je nage plus vite"
	line "que toi."
	done

SwimmerfDawnAfterBattleText:
	text "PARMANIE et les"
	line "ILES ECUME sont à"

	para "deux coups de"
	line "brasse..."

	para "Mon oeil ouais!"
	line "Quel crétin mon"

	para "copain!"
	done

SwimmermJeromeSeenText:
	text "Nager?"
	line "Je déteste ça."

	para "Je patauge."
	line "J'éclabousse."
	cont "C'est super."
	done

SwimmermJeromeBeatenText:
	text "J'ai cru pouvoir"
	line "gagner."
	done

SwimmermJeromeAfterBattleText:
	text "J'aime pas nager"
	line "mais j'adore la"
	cont "mer."
	done

Route19Fisher1Text:
	text "Cette route est"
	line "fermée pour cause"
	cont "de travaux."

	para "Pour aller à"
	line "CRAMOIS'ILE, va au"

	para "Sud de BOURG"
	line "PALETTE."
	done

Route19Fisher1Text_RocksCleared:
	text "J'transpire."
	line "Allez! A l'eau!"
	done

Route19Fisher2Text:
	text "Combien de temps"
	line "cela prendrait-il"
	cont "de bouger ce"
	cont "rocher?"
	done

Route19Fisher2Text_RocksCleared:
	text "Les travaux sont"
	line "enfin finis."

	para "J'peux pêcher!"
	line "Youkiii!"
	done

Route19SignText:
	text "ROUTE 19"

	para "PARMANIE -"
	line "ILES ECUME"
	done

CarefulSwimmingSignText:
	text "Nagez prudemment"
	line "si vous vous"
	cont "dirigez vers les"
	cont "ILES ECUME."

	para "POLICE de PARMANIE"
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
