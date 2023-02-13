	object_const_def
	const FASTSHIPCABINS_SW_SSW_NW_FISHER
	const FASTSHIPCABINS_SW_SSW_NW_BUG_CATCHER
	const FASTSHIPCABINS_SW_SSW_NW_BEAUTY
	const FASTSHIPCABINS_SW_SSW_NW_ROCKER

FastShipCabins_SW_SSW_NW_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerFirebreatherLyle:
	trainer FIREBREATHER, LYLE, EVENT_BEAT_FIREBREATHER_LYLE, FirebreatherLyleSeenText, FirebreatherLyleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherLyleAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherKen:
	trainer BUG_CATCHER, KEN, EVENT_BEAT_BUG_CATCHER_KEN, BugCatcherKenSeenText, BugCatcherKenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherKenAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyCassie:
	trainer BEAUTY, CASSIE, EVENT_BEAT_BEAUTY_CASSIE, BeautyCassieSeenText, BeautyCassieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyCassieAfterBattleText
	waitbutton
	closetext
	end

TrainerGuitaristClyde:
	trainer GUITARIST, CLYDE, EVENT_BEAT_GUITARIST_CLYDE, GuitaristClydeSeenText, GuitaristClydeBeatenText, 0, .Script

.Script:
	endifjustbattled
	special Mobile_DummyReturnFalse
	iftrue .mobile
	opentext
	writetext GuitaristClydeAfterBattleText
	waitbutton
	closetext
	end

.mobile
	opentext
	writetext GuitaristClydeAfterBattleMobileText
	waitbutton
	closetext
	end

FastShipBed:
	opentext
	writetext FastShipBedText1
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	special StubbedTrainerRankings_Healings
	special HealParty
	playmusic MUSIC_HEAL
	pause 60
	special RestartMapMusic
	special FadeInQuickly
	opentext
	writetext FastShipBedText2
	waitbutton
	closetext
	checkevent EVENT_FAST_SHIP_HAS_ARRIVED
	iftrue .AlreadyArrived
	checkevent EVENT_FAST_SHIP_FOUND_GIRL
	iftrue .CanArrive
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue .CanArrive
.AlreadyArrived:
	end

.CanArrive:
	playsound SFX_ELEVATOR_END
	pause 30
	checkevent EVENT_FAST_SHIP_DESTINATION_OLIVINE
	iftrue .ArrivedOlivine
	opentext
	writetext FastShipArrivedVermilionText
	waitbutton
	closetext
	setevent EVENT_FAST_SHIP_HAS_ARRIVED
	end

.ArrivedOlivine:
	opentext
	writetext FastShipArrivedOlivineText
	waitbutton
	closetext
	setevent EVENT_FAST_SHIP_HAS_ARRIVED
	end

FastShipCabinsNorthwestCabinTrashcan:
	jumpstd TrashCanScript

FirebreatherLyleSeenText:
	text "Je vais à KANTO"
	line "me donner en"
	cont "spectacle!"
	done

FirebreatherLyleBeatenText:
	text "Pfff... Ma flamme"
	line "est minuscule..."
	done

FirebreatherLyleAfterBattleText:
	text "Le feu c'est nul"
	line "sur l'eau, non?"

	para "Ca change rien?"
	line "Vraiment?"
	done

BugCatcherKenSeenText:
	text "Je vais voir ma"
	line "grand-mère pour"
	cont "attraper des"
	cont "insectes!"
	done

BugCatcherKenBeatenText:
	text "Ooh!"
	line "Fort de café!"
	done

BugCatcherKenAfterBattleText:
	text "Il y a plein de"
	line "#MON dans les"
	cont "arbres de JOHTO!"
	done

BeautyCassieSeenText:
	text "J'oublie mes"
	line "malheurs et..."
	cont "COMBAT!"
	done

BeautyCassieBeatenText:
	text "Mon coeur saigne."
	done

BeautyCassieAfterBattleText:
	text "Voyager fait ou-"
	line "blier les peines"
	cont "de coeur."

	para "Mais un BATEAU"
	line "EXPRESS va trop"
	cont "vite!!!"
	done

GuitaristClydeSeenText:
	text "Je vais audition-"
	line "ner à la STATION"

	para "RADIO de DOUBLON-"
	line "VILLE."
	done

GuitaristClydeBeatenText:
	text "Wouh!"
	line "Un bide!"
	done

GuitaristClydeAfterBattleMobileText:
	text "J'allais me lancer"
	line "dans le défi de la"
	cont "TOUR DE COMBAT..."

	para "Je devrais retour-"
	line "ner à CARMIN et"
	cont "m'entraîner..."
	done

GuitaristClydeAfterBattleText:
	text "Au fait..."
	line "C'est quoi le BON"

	para "NUMERO de cette"
	line "semaine?"
	done

FastShipBedText1:
	text "Un lit douillet!"
	line "Hop! Au dodo..."
	done

FastShipBedText2:
	text "Ah... C'est la"
	line "super pêche!"
	done

FastShipArrivedOlivineText:
	text "Le BATEAU EXPRESS"
	line "AQUARIA est arrivé"
	cont "à OLIVILLE."
	done

FastShipArrivedVermilionText:
	text "Le BATEAU EXPRESS"
	line "AQUARIA est arrivé"
	cont "à CARMIN SUR MER."
	done

FastShipCabins_SW_SSW_NW_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  0, FAST_SHIP_1F, 5
	warp_event  2, 19, FAST_SHIP_1F, 6
	warp_event  3, 19, FAST_SHIP_1F, 6
	warp_event  2, 31, FAST_SHIP_1F, 7
	warp_event  3, 31, FAST_SHIP_1F, 7

	def_coord_events

	def_bg_events
	bg_event  7,  1, BGEVENT_READ, FastShipBed
	bg_event  7,  2, BGEVENT_READ, FastShipBed
	bg_event  7,  7, BGEVENT_READ, FastShipCabinsNorthwestCabinTrashcan

	def_object_events
	object_event  1, 15, SPRITE_FISHER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerFirebreatherLyle, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  6, 15, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBugCatcherKen, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  1, 26, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautyCassie, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  3, 28, SPRITE_ROCKER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerGuitaristClyde, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
