	object_const_def
	const ROUTE18_YOUNGSTER1
	const ROUTE18_YOUNGSTER2

Route18_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerBirdKeeperBoris:
	trainer BIRD_KEEPER, BORIS, EVENT_BEAT_BIRD_KEEPER_BORIS, BirdKeeperBorisSeenText, BirdKeeperBorisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperBorisAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperBob:
	trainer BIRD_KEEPER, BOB, EVENT_BEAT_BIRD_KEEPER_BOB, BirdKeeperBobSeenText, BirdKeeperBobBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperBobAfterBattleText
	waitbutton
	closetext
	end

Route18Sign:
	jumptext Route18SignText

BirdKeeperBorisSeenText:
	text "Cherche les #-"
	line "MON dans les"

	para "hautes herbes."
	line "Tu le savais déjà?"
	done

BirdKeeperBorisBeatenText:
	text "Aïe!"
	done

BirdKeeperBorisAfterBattleText:
	text "Ca te fait quoi"
	line "d'être balèze?"
	cont "C'est sympa?"
	done

BirdKeeperBobSeenText:
	text "La PISTE CYCLABLE"
	line "est un raccourci"
	cont "vers CELADOPOLE."
	done

BirdKeeperBobBeatenText:
	text "...Fouiii!"
	done

BirdKeeperBobAfterBattleText:
	text "Sans BICYCLETTE,"
	line "tu ne peux pas"

	para "emprunter ce"
	line "raccourci."
	done

Route18SignText:
	text "ROUTE 18"

	para "CELADOPOLE -"
	line "PARMANIE"
	done

Route18_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  6, ROUTE_17_ROUTE_18_GATE, 3
	warp_event  2,  7, ROUTE_17_ROUTE_18_GATE, 4

	def_coord_events

	def_bg_events
	bg_event  9,  5, BGEVENT_READ, Route18Sign

	def_object_events
	object_event  9, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperBoris, -1
	object_event 13,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperBob, -1
