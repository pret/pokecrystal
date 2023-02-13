	object_const_def
	const GOLDENRODUNDERGROUNDWAREHOUSE_ROCKET1
	const GOLDENRODUNDERGROUNDWAREHOUSE_ROCKET2
	const GOLDENRODUNDERGROUNDWAREHOUSE_ROCKET3
	const GOLDENRODUNDERGROUNDWAREHOUSE_GENTLEMAN
	const GOLDENRODUNDERGROUNDWAREHOUSE_POKE_BALL1
	const GOLDENRODUNDERGROUNDWAREHOUSE_POKE_BALL2
	const GOLDENRODUNDERGROUNDWAREHOUSE_POKE_BALL3

GoldenrodUndergroundWarehouse_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, GoldenrodUndergroundWarehouseResetSwitchesCallback

GoldenrodUndergroundWarehouseResetSwitchesCallback:
	clearevent EVENT_SWITCH_1
	clearevent EVENT_SWITCH_2
	clearevent EVENT_SWITCH_3
	clearevent EVENT_EMERGENCY_SWITCH
	clearevent EVENT_SWITCH_4
	clearevent EVENT_SWITCH_5
	clearevent EVENT_SWITCH_6
	clearevent EVENT_SWITCH_7
	clearevent EVENT_SWITCH_8
	clearevent EVENT_SWITCH_9
	clearevent EVENT_SWITCH_10
	clearevent EVENT_SWITCH_11
	clearevent EVENT_SWITCH_12
	clearevent EVENT_SWITCH_13
	clearevent EVENT_SWITCH_14
	setval 0
	writemem wUndergroundSwitchPositions
	endcallback

TrainerGruntM24:
	trainer GRUNTM, GRUNTM_24, EVENT_BEAT_ROCKET_GRUNTM_24, GruntM24SeenText, GruntM24BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM24AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM14:
	trainer GRUNTM, GRUNTM_14, EVENT_BEAT_ROCKET_GRUNTM_14, GruntM14SeenText, GruntM14BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM14AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM15:
	trainer GRUNTM, GRUNTM_15, EVENT_BEAT_ROCKET_GRUNTM_15, GruntM15SeenText, GruntM15BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM15AfterBattleText
	waitbutton
	closetext
	end

GoldenrodUndergroundWarehouseDirectorScript:
	faceplayer
	opentext
	checkevent EVENT_RECEIVED_CARD_KEY
	iftrue .GotCardKey
	writetext DirectorIntroText
	promptbutton
	verbosegiveitem CARD_KEY
	setevent EVENT_RECEIVED_CARD_KEY
	setevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_1
	clearevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_2
	clearevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_3
	writetext DirectorCardKeyText
	promptbutton
.GotCardKey:
	writetext DirectorAfterText
	waitbutton
	closetext
	end

GoldenrodUndergroundWarehouseMaxEther:
	itemball MAX_ETHER

GoldenrodUndergroundWarehouseTMSleepTalk:
	itemball TM_SLEEP_TALK

GoldenrodUndergroundWarehouseUltraBall:
	itemball ULTRA_BALL

GruntM24SeenText:
	text "Comment t'as fait"
	line "pour arriver ici?"

	para "Bon... Tant pis:"
	line "je dois me débar-"
	cont "rasser de toi."
	done

GruntM24BeatenText:
	text "J'suis fichu..."
	done

GruntM24AfterBattleText:
	text "La TEAM ROCKET"
	line "vivra dans l'at-"
	cont "tente du retour du"
	cont "grand GIOVANNI."

	para "Nous sommes prêts"
	line "à tout."
	done

GruntM14SeenText:
	text "Pas un pas de"
	line "plus!"

	para "Mes ennemis, j'en"
	line "fais de la purée."
	cont "A table!"
	done

GruntM14BeatenText:
	text "Purééééée!"
	done

GruntM14AfterBattleText:
	text "Perdu..."

	para "Pardon..."
	line "GIOVANNI!"
	done

GruntM15SeenText:
	text "Gnyak Gnyak Gnyak!"
	line "J'me souviens de"

	para "toi! Tu m'as battu"
	line "à notre planque!"
	done

GruntM15BeatenText:
	text "Gnyak!"
	line "Heu? Encore??"
	done

GruntM15AfterBattleText:
	text "Gnyaaaaaak!"
	line "J'me souviendrai"
	cont "de toi!"
	done

DirectorIntroText:
	text "DIRECTEUR: Qui?"
	line "Quoi? Tu es là"
	cont "pour me sauver?"

	para "Merci!"

	para "La TOUR RADIO!"

	para "Que se passe-t-il"
	line "là-bas?"

	para "Contrôlée par la"
	line "TEAM ROCKET?"

	para "Tiens. Prends"
	line "cette CARTE MAGN."
	done

DirectorCardKeyText:
	text "DIRECTEUR: Utilise"
	line "cette carte pour"
	cont "ouvrir les volets"
	cont "du 2ème."
	done

DirectorAfterText:
	text "Je t'en supplie..."
	line "Aide-nous."

	para "Dieu seul sait ce"
	line "qu'ils feront en"

	para "contrôlant le"
	line "transmetteur."

	para "Ils pourront même"
	line "manipuler les"

	para "#MON grâce à un"
	line "signal spécial!"

	para "Tu es mon seul"
	line "espoir."

	para "Sauve la TOUR"
	line "RADIO! Pitié!!!"

	para "Sauve tous les"
	line "gentils #MON!"
	done

GoldenrodUndergroundWarehouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2, 12, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 2
	warp_event  3, 12, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 3
	warp_event 17,  2, GOLDENROD_DEPT_STORE_B1F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9,  8, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM24, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  8, 15, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM14, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 14,  3, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerGruntM15, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 12,  8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodUndergroundWarehouseDirectorScript, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 18, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodUndergroundWarehouseMaxEther, EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_MAX_ETHER
	object_event 13,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodUndergroundWarehouseTMSleepTalk, EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_TM_SLEEP_TALK
	object_event  2,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodUndergroundWarehouseUltraBall, EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_ULTRA_BALL
