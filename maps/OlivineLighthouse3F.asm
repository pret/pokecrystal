	object_const_def
	const OLIVINELIGHTHOUSE3F_SAILOR
	const OLIVINELIGHTHOUSE3F_GENTLEMAN
	const OLIVINELIGHTHOUSE3F_YOUNGSTER
	const OLIVINELIGHTHOUSE3F_POKE_BALL

OlivineLighthouse3F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerBirdKeeperTheo:
	trainer BIRD_KEEPER, THEO, EVENT_BEAT_BIRD_KEEPER_THEO, BirdKeeperTheoSeenText, BirdKeeperTheoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperTheoAfterBattleText
	waitbutton
	closetext
	end

TrainerGentlemanPreston:
	trainer GENTLEMAN, PRESTON, EVENT_BEAT_GENTLEMAN_PRESTON, GentlemanPrestonSeenText, GentlemanPrestonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanPrestonAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorTerrell:
	trainer SAILOR, TERRELL, EVENT_BEAT_SAILOR_TERRELL, SailorTerrellSeenText, SailorTerrellBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorTerrellAfterBattleText
	waitbutton
	closetext
	end

OlivineLighthouse3FEther:
	itemball ETHER

BirdKeeperTheoSeenText:
	text "Pourquoi tu es là?"
	line "Qu'est-ce que tu"

	para "veux? Allez..."
	line "Va-t'en!"
	done

BirdKeeperTheoBeatenText:
	text "T'es tenace,"
	line "toi..."
	done

BirdKeeperTheoAfterBattleText:
	text "Comment tu fais"
	line "pour monter?"

	para "Je veux voir le"
	line "#MON malade,"

	para "mais j'arrive pas"
	line "à monter..."
	done

SailorTerrellSeenText:
	text "Les marins sont"
	line "sympa et musclés."
	cont "Et toi?"
	done

SailorTerrellBeatenText:
	text "Pas mal."
	line "C'est bien..."
	done

SailorTerrellAfterBattleText:
	text "Je vais à l'ARENE"
	line "à chaque fois que"
	cont "je viens à"
	cont "OLIVILLE."

	para "Le type des #-"
	line "MON du CHAMPION"

	para "d'ARENE a changé"
	line "récemment."
	done

GentlemanPrestonSeenText:
	text "Je parcours la"
	line "terre en quête"
	cont "d'entraînement."
	cont "En garde!"
	done

GentlemanPrestonBeatenText:
	text "Bon. Je vais errer"
	line "autre part alors."
	done

GentlemanPrestonAfterBattleText:
	text "JASMINE utilisait"
	line "des #MON de la"
	cont "roche comme ONIX."
	done

OlivineLighthouse3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13,  3, OLIVINE_LIGHTHOUSE_4F, 1
	warp_event  5,  3, OLIVINE_LIGHTHOUSE_2F, 2
	warp_event  9,  5, OLIVINE_LIGHTHOUSE_4F, 4
	warp_event 16, 11, OLIVINE_LIGHTHOUSE_2F, 5
	warp_event 17, 11, OLIVINE_LIGHTHOUSE_2F, 6
	warp_event 16,  9, OLIVINE_LIGHTHOUSE_4F, 5
	warp_event 17,  9, OLIVINE_LIGHTHOUSE_4F, 6
	warp_event  8,  3, OLIVINE_LIGHTHOUSE_4F, 7
	warp_event  9,  3, OLIVINE_LIGHTHOUSE_4F, 8

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9,  2, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSailorTerrell, -1
	object_event 13,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerGentlemanPreston, -1
	object_event  3,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperTheo, -1
	object_event  8,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OlivineLighthouse3FEther, EVENT_OLIVINE_LIGHTHOUSE_3F_ETHER
