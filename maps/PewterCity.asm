	object_const_def
	const PEWTERCITY_COOLTRAINER_F
	const PEWTERCITY_BUG_CATCHER
	const PEWTERCITY_GRAMPS
	const PEWTERCITY_FRUIT_TREE1
	const PEWTERCITY_FRUIT_TREE2

PewterCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, PewterCityFlypointCallback

PewterCityFlypointCallback:
	setflag ENGINE_FLYPOINT_PEWTER
	endcallback

PewterCityCooltrainerFScript:
	jumptextfaceplayer PewterCityCooltrainerFText

PewterCityBugCatcherScript:
	jumptextfaceplayer PewterCityBugCatcherText

PewterCityGrampsScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SILVER_WING
	iftrue .GotSilverWing
	writetext PewterCityGrampsText
	promptbutton
	verbosegiveitem SILVER_WING
	setevent EVENT_GOT_SILVER_WING
	closetext
	end

.GotSilverWing:
	writetext PewterCityGrampsText_GotSilverWing
	waitbutton
	closetext
	end

PewterCitySign:
	jumptext PewterCitySignText

PewterGymSign:
	jumptext PewterGymSignText

PewterMuseumSign:
	jumptext PewterMuseumSignText

PewterCityMtMoonGiftShopSign:
	jumptext PewterCityMtMoonGiftShopSignText

PewterCityWelcomeSign:
	jumptext PewterCityWelcomeSignText

PewterCityPokecenterSign:
	jumpstd PokecenterSignScript

PewterCityMartSign:
	jumpstd MartSignScript

PewterCityFruitTree1:
	fruittree FRUITTREE_PEWTER_CITY_1

PewterCityFruitTree2:
	fruittree FRUITTREE_PEWTER_CITY_2

PewterCityCooltrainerFText:
	text "As-tu vu l'ARENE"
	line "d'ARGENTA?"

	para "Le CHAMPION a des"
	line "#MON de roche."
	done

PewterCityBugCatcherText:
	text "La nuit, les"
	line "MELOFEE sortent"
	cont "pour jouer au MONT"
	cont "SELENITE."

	para "Mais pas toutes"
	line "les nuits."
	done

PewterCityGrampsText:
	text "Ah, tu viens de"
	line "JOHTO, toi?"

	para "Moi aussi je me"
	line "baladais dans"

	para "JOHTO étant plus"
	line "jeune."

	para "Tu me rappelles"
	line "mes jeunes années."

	para "Tiens. Voilà un"
	line "objet que j'ai"
	cont "trouvé à JOHTO."
	done

PewterCityGrampsText_GotSilverWing:
	text "Découvrir de nou-"
	line "veaux visages, de"
	cont "nouveaux lieux..."

	para "C'est beau de"
	line "voyager."
	done

PewterCitySignText:
	text "ARGENTA"
	line "Grise comme le roc"
	done

PewterGymSignText:
	text "CHAMPION d'ARENE"
	line "d'ARGENTA:"
	cont "PIERRE"

	para "Le dresseur dur"
	line "comme la roche"
	done

PewterMuseumSignText:
	text "Il y a une affiche"
	line "ici..."

	para "Le MUSEE DES"
	line "SCIENCES d'ARGENTA"
	cont "est fermé pour"
	cont "cause de"
	cont "rénovations..."
	done

PewterCityMtMoonGiftShopSignText:
	text "Il y a une affiche"
	line "ici..."

	para "La BOUTIQUE de"
	line "SOUVENIRS du MONT"
	cont "SELENITE est"
	cont "ouverte!"
	done

PewterCityWelcomeSignText:
	text "Bienvenue à"
	line "ARGENTA!"
	done

PewterCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 29, 13, PEWTER_NIDORAN_SPEECH_HOUSE, 1
	warp_event 16, 17, PEWTER_GYM, 1
	warp_event 23, 17, PEWTER_MART, 2
	warp_event 13, 25, PEWTER_POKECENTER_1F, 1
	warp_event  7, 29, PEWTER_SNOOZE_SPEECH_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 25, 23, BGEVENT_READ, PewterCitySign
	bg_event 11, 17, BGEVENT_READ, PewterGymSign
	bg_event 15,  9, BGEVENT_READ, PewterMuseumSign
	bg_event 33, 19, BGEVENT_READ, PewterCityMtMoonGiftShopSign
	bg_event 19, 29, BGEVENT_READ, PewterCityWelcomeSign
	bg_event 14, 25, BGEVENT_READ, PewterCityPokecenterSign
	bg_event 24, 17, BGEVENT_READ, PewterCityMartSign

	def_object_events
	object_event 19, 11, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PewterCityCooltrainerFScript, -1
	object_event 14, 29, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PewterCityBugCatcherScript, -1
	object_event 29, 17, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterCityGrampsScript, -1
	object_event 32,  3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterCityFruitTree1, -1
	object_event 30,  3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterCityFruitTree2, -1
