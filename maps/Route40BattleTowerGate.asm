	object_const_def
	const ROUTE40BATTLETOWERGATE_ROCKER
	const ROUTE40BATTLETOWERGATE_TWIN

Route40BattleTowerGate_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, RouteBattleTowerGateShowSailorCallback

RouteBattleTowerGateShowSailorCallback:
	clearevent EVENT_BATTLE_TOWER_OPEN_CIVILIANS
	endcallback

Route40BattleTowerGateRockerScript:
	jumptextfaceplayer Route40BattleTowerGateRockerText

Route40BattleTowerGateTwinScript:
	jumptextfaceplayer Route40BattleTowerGateTwinText

Route40BattleTowerGateUnusedText1: ; unreferenced
	text "Tu es aussi ici"
	line "pour la TOUR DE"
	cont "COMBAT?"

	para "Mais tu ne peux"
	line "pas y entrer je"
	cont "parie..."
	done

Route40BattleTowerGateUnusedText2: ; unreferenced
	text "La TOUR DE COMBAT"
	line "a ouvert ses"
	cont "portes."

	para "Je veux y aller"
	line "mais..."
	cont "J'ai peur."
	done

Route40BattleTowerGateRockerText:
	text "Tu vas à la TOUR"
	line "DE COMBAT?"

	para "Si tu gagnes plein"
	line "de fois, tu peux"

	para "remporter des"
	line "trucs spéciaux."
	done

Route40BattleTowerGateUnusedText3: ; unreferenced
	text "Je vais entraîner"
	line "mes #MON avant"

	para "de me lancer vers"
	line "la TOUR DE COMBAT."
	done

Route40BattleTowerGateTwinText:
	text "Mes #MON ont"
	line "tous des niveaux"
	cont "différents..."

	para "Je dois les"
	line "entraîner!"
	done

Route40BattleTowerGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, ROUTE_40, 1
	warp_event  5,  7, ROUTE_40, 1
	warp_event  4,  0, BATTLE_TOWER_OUTSIDE, 1
	warp_event  5,  0, BATTLE_TOWER_OUTSIDE, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  3, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route40BattleTowerGateRockerScript, EVENT_BATTLE_TOWER_OPEN_CIVILIANS
	object_event  7,  5, SPRITE_TWIN, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route40BattleTowerGateTwinScript, -1
