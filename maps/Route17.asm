	object_const_def
	const ROUTE17_BIKER1
	const ROUTE17_BIKER2
	const ROUTE17_BIKER3
	const ROUTE17_BIKER4

Route17_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route17AlwaysOnBikeCallback

Route17AlwaysOnBikeCallback:
	setflag ENGINE_ALWAYS_ON_BIKE
	setflag ENGINE_DOWNHILL
	endcallback

TrainerBikerCharles:
	trainer BIKER, CHARLES, EVENT_BEAT_BIKER_CHARLES, BikerCharlesSeenText, BikerCharlesBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerCharlesAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerRiley:
	trainer BIKER, RILEY, EVENT_BEAT_BIKER_RILEY, BikerRileySeenText, BikerRileyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerRileyAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerJoel:
	trainer BIKER, JOEL, EVENT_BEAT_BIKER_JOEL, BikerJoelSeenText, BikerJoelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerJoelAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerGlenn:
	trainer BIKER, GLENN, EVENT_BEAT_BIKER_GLENN, BikerGlennSeenText, BikerGlennBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerGlennAfterBattleText
	waitbutton
	closetext
	end

Route17HiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_ROUTE_17_HIDDEN_MAX_ETHER

Route17HiddenMaxElixer:
	hiddenitem MAX_ELIXER, EVENT_ROUTE_17_HIDDEN_MAX_ELIXER

BikerRileySeenText:
	text "Hé, toi!"
	line "T'es de JOHTO?"
	done

BikerRileyBeatenText:
	text "Graaaaaah!"
	done

BikerRileyAfterBattleText:
	text "Pas la peine de"
	line "crâner!"
	done

BikerJoelSeenText:
	text "Oh! Elle est cool"
	line "ta BICYCLETTE!"
	done

BikerJoelBeatenText:
	text "Par contre, toi..."
	line "T'es pas cool."
	done

BikerJoelAfterBattleText:
	text "Moi j'ai trop la"
	line "classe. T'as vu"
	cont "mes fringues?"

	para "J'suis trop"
	line "relax."
	done

BikerGlennSeenText:
	text "Hé! Ca te dit un"
	line "chtit combat?"
	done

BikerGlennBeatenText:
	text "Ayaah! Toi t'es"
	line "pas naze!"
	done

BikerGlennAfterBattleText:
	text "Conduire sans les"
	line "mains, c'est la"
	cont "classe."
	done

BikerCharlesSeenText:
	text "Nous on est des"
	line "durs! Des vrais!"
	done

BikerCharlesBeatenText:
	text "Arrrgh!"
	line "Trop dur!"
	done

BikerCharlesAfterBattleText:
	text "Conduis doucement,"
	line "c'est plus"
	cont "prudent!"
	done

Route17_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17, 82, ROUTE_17_ROUTE_18_GATE, 1
	warp_event 17, 83, ROUTE_17_ROUTE_18_GATE, 2

	def_coord_events

	def_bg_events
	bg_event  9, 54, BGEVENT_ITEM, Route17HiddenMaxEther
	bg_event  8, 77, BGEVENT_ITEM, Route17HiddenMaxElixer

	def_object_events
	object_event  4, 17, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerBikerRiley, -1
	object_event  9, 68, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerBikerJoel, -1
	object_event  3, 53, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBikerGlenn, -1
	object_event  6, 80, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerBikerCharles, -1
