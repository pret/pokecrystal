	object_const_def
	const BATTLETOWEROUTSIDE_STANDING_YOUNGSTER
	const BATTLETOWEROUTSIDE_BEAUTY
	const BATTLETOWEROUTSIDE_SAILOR
	const BATTLETOWEROUTSIDE_LASS

BattleTowerOutside_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, BattleTowerOutsideNoopCallback
	callback MAPCALLBACK_OBJECTS, BattleTowerOutsideShowCiviliansCallback

BattleTowerOutsideNoopCallback:
	endcallback

BattleTowerOutsideShowCiviliansCallback:
	clearevent EVENT_BATTLE_TOWER_OPEN_CIVILIANS
	endcallback

BattleTowerOutsideYoungsterScript:
	jumptextfaceplayer BattleTowerOutsideYoungsterText

BattleTowerOutsideBeautyScript:
	jumptextfaceplayer BattleTowerOutsideBeautyText

BattleTowerOutsideSailorScript:
	jumptextfaceplayer BattleTowerOutsideSailorText

BattleTowerOutsideSign:
	jumptext BattleTowerOutsideSignText

BattleTowerOutsideYoungsterText_NotYetOpen: ; unreferenced
	text "Mazette! Elle est"
	line "grande cette TOUR"
	cont "DE COMBAT!"
	done

BattleTowerOutsideYoungsterText_Mobile: ; unreferenced
	text "La TOUR DE COMBAT"
	line "est géante!"

	para "Vu qu'il y a tout"
	line "plein de dresseurs"

	para "à l'intérieur, il"
	line "doit y avoir une"

	para "multitude de"
	line "#MON."
	done

BattleTowerOutsideYoungsterText:
	text "Foui! C'est grand"
	line "la TOUR DE COMBAT!"

	para "Il doit y avoir"
	line "plein de #MON"
	cont "différents!"
	done

BattleTowerOutsideBeautyText_NotYetOpen: ; unreferenced
	text "Kesski fabriquent"
	line "tous ici?"

	para "Y'aurait encore"
	line "une histoire de"

	para "baston que ça"
	line "m'étonnerait pas."
	done

BattleTowerOutsideBeautyText:
	text "On ne peut utili-"
	line "ser que 3 #MON."

	para "C'est dur de faire"
	line "un choix..."
	done

BattleTowerOutsideSailorText_Mobile: ; unreferenced
	text "Hin hin hin..."
	line "J'ai pris une"
	cont "perm' pour venir"
	cont "ici..."

	para "Je vais devenir"
	line "un CHAMPION!"
	cont "Un vrai de vrai!"
	done

BattleTowerOutsideSailorText:
	text "J'ai pris une"
	line "perm'."

	para "Je dois gagner!"
	line "Oh que oui!"
	done

BattleTowerOutsideSignText_NotYetOpen: ; unreferenced
; originally shown when the Battle Tower was closed
	text "TOUR DE COMBAT"
	done

BattleTowerOutsideSignText:
	text "TOUR DE COMBAT"

	para "Le méga défi de"
	line "tout dresseur!"
	done

BattleTowerOutsideText_DoorsClosed: ; unreferenced
; originally shown when the Battle Tower was closed
	text "Les portes de la"
	line "TOUR DE COMBAT"
	cont "sont fermées..."
	done

BattleTowerOutsideText_DoorsOpen: ; unreferenced
; originally shown after the Battle Tower opened
	text "C'est ouvert!"
	done

BattleTowerOutside_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8, 21, ROUTE_40_BATTLE_TOWER_GATE, 3
	warp_event  9, 21, ROUTE_40_BATTLE_TOWER_GATE, 4
	warp_event  8,  9, BATTLE_TOWER_1F, 1
	warp_event  9,  9, BATTLE_TOWER_1F, 2

	def_coord_events

	def_bg_events
	bg_event 10, 10, BGEVENT_READ, BattleTowerOutsideSign

	def_object_events
	object_event  6, 12, SPRITE_STANDING_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideYoungsterScript, -1
	object_event 13, 11, SPRITE_BEAUTY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideBeautyScript, -1
	object_event 12, 18, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideSailorScript, EVENT_BATTLE_TOWER_OPEN_CIVILIANS
	object_event 12, 24, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
