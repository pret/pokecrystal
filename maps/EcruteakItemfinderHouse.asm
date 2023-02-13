	object_const_def
	const ECRUTEAKITEMFINDERHOUSE_COOLTRAINER_M
	const ECRUTEAKITEMFINDERHOUSE_POKEDEX

EcruteakItemfinderHouse_MapScripts:
	def_scene_scripts

	def_callbacks

EcruteakItemfinderGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_ITEMFINDER
	iftrue .itemfinder
	writetext EcruteakItemfinderAdventureText
	yesorno
	iffalse .no
	writetext EcruteakItemfinderTrueSpiritText
	promptbutton
	verbosegiveitem ITEMFINDER
	setevent EVENT_GOT_ITEMFINDER
.itemfinder:
	writetext ItemfinderExplanationText
	waitbutton
	closetext
	end

.no:
	writetext EcruteakItemfinderToEachHisOwnText
	waitbutton
	closetext
	end

EcruteakHistoryBook:
	opentext
	writetext EcruteakHistoryBookText
	yesorno
	iftrue .ReadBook
	closetext
	end

.ReadBook:
	writetext EcruteakTwoTowersText
	yesorno
	iftrue .KeepReading
	closetext
	end

.KeepReading:
	writetext EcruteakThreeMonText
	waitbutton
	closetext
	end

ItemFinderHouseRadio:
	jumpstd Radio2Script

EcruteakItemfinderAdventureText:
	text "Ah! Tu fais les"
	line "400 coups avec tes"
	cont "#MON?"

	para "Mais qu'est-ce"
	line "qu'une aventure"
	cont "sans une chasse au"
	cont "trésor?"

	para "J'ai bon ou j'ai"
	line "bon?"
	done

EcruteakItemfinderTrueSpiritText:
	text "C'est cool, tu"
	line "comprends le vrai"

	para "esprit de l'aven-"
	line "ture."

	para "Et moi, j'aime ça!"
	line "Prends ça avec"
	cont "toi."
	done

ItemfinderExplanationText:
	text "Il y a beaucoup"
	line "d'objets cachés"
	cont "par terre."

	para "Utilise CHERCH'"
	line "OBJET pour voir"

	para "s'il y a un objet"
	line "par terre près de"
	cont "toi."

	para "Ca ne te montre"
	line "pas l'endroit"

	para "exact mais c'est"
	line "sûrement dans les"
	cont "environs."

	para "Ah oui, j'ai en-"
	line "tendu dire qu'il y"

	para "a des objets dans"
	line "la TOUR CENDREE"
	cont "de ROSALIA."
	done

EcruteakItemfinderToEachHisOwnText:
	text "Oh... Chacun pour"
	line "soi je parie."
	done

EcruteakHistoryBookText:
	text "HISTOIRE de"
	line "ROSALIA"

	para "Désirez-vous lire?"
	done

EcruteakTwoTowersText:
	text "Il existait deux"
	line "tours à ROSALIA."

	para "Chacune d'elle"
	line "était le perchoir"
	cont "d'un puissant"
	cont "#MON volant."

	para "Mais l'une des"
	line "tours a complète-"
	cont "ment brûlé."

	para "Les deux #MON"
	line "n'ont jamais été"
	cont "revus depuis..."

	para "Continuer à lire?"
	done

EcruteakThreeMonText:
	text "ROSALIA était"
	line "aussi la demeure"

	para "de trois #MON"
	line "qui couraient"
	cont "autour de la"
	cont "ville."

	para "Ils étaient soi-"
	line "disant nés de"

	para "l'eau, de la"
	line "foudre et du feu."

	para "Mais ils ne"
	line "pouvaient pas"
	cont "contenir toute"
	cont "leur puissance."

	para "C'est la raison"
	line "pour laquelle ils"

	para "couraient sans"
	line "cesse."
	done

EcruteakItemfinderHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, ECRUTEAK_CITY, 11
	warp_event  4,  7, ECRUTEAK_CITY, 11

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, ItemFinderHouseRadio

	def_object_events
	object_event  2,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakItemfinderGuy, -1
	object_event  3,  3, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakHistoryBook, -1
