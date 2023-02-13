	object_const_def
	const CINNABARISLAND_BLUE

CinnabarIsland_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CinnabarIslandFlypointCallback

CinnabarIslandFlypointCallback:
	setflag ENGINE_FLYPOINT_CINNABAR
	endcallback

CinnabarIslandBlue:
	faceplayer
	opentext
	writetext CinnabarIslandBlueText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	applymovement CINNABARISLAND_BLUE, CinnabarIslandBlueTeleport
	disappear CINNABARISLAND_BLUE
	clearevent EVENT_VIRIDIAN_GYM_BLUE
	end

CinnabarIslandGymSign:
	jumptext CinnabarIslandGymSignText

CinnabarIslandSign:
	jumptext CinnabarIslandSignText

CinnabarIslandPokecenterSign:
	jumpstd PokecenterSignScript

CinnabarIslandHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_CINNABAR_ISLAND_HIDDEN_RARE_CANDY

CinnabarIslandBlueTeleport:
	teleport_from
	step_end

CinnabarIslandBlueText:
	text "T'es qui toi?"

	para "T'es dresseur,"
	line "ça se voit..."

	para "Moi c'est BLUE."

	para "J'ai été un MAITRE"
	line "pendant un temps."

	para "Enfin, pendant"
	line "quelques minutes."

	para "Juste avant que"
	line "RED me batte..."

	para "Je le hais ce"
	line "type..."

	para "Bon tu veux quoi?"
	line "Tu veux t'battre?"

	para "Désolé mais j'ai"
	line "pas la tête à ça."

	para "Regarde autour"
	line "de toi..."

	para "Un volcan explose"
	line "et une ville"

	para "disparaît d'un"
	line "coup."

	para "Faire du POKé POKé"
	line "c'est bien joli"

	para "mais on peut se"
	line "faire balayer par"

	para "une catastrophe"
	line "naturelle à tout"
	cont "moment..."

	para "..."

	para "C'est comme ça."
	line "On y peut rien."

	para "Mais bon. J'suis"
	line "quand même un"
	cont "dresseur."

	para "Et un balèze en"
	line "plus. J'te l'avais"
	cont "dit, non?"

	para "Si tu cherches un"
	line "bon combat, viens"
	cont "à l'ARENE de"
	cont "JADIELLE."

	para "Et ça sera ta"
	line "p'tite fête."
	done

CinnabarIslandGymSignText:
	text "Il y a un mot..."

	para "L'ARENE de CRAMOI-"
	line "S'ILE est déplacée"
	cont "aux ILES ECUME."

	para "AUGUSTE"
	done

CinnabarIslandSignText:
	text "CRAMOIS'ILE"

	para "Rouge comme le feu"
	done

CinnabarIsland_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11, 11, CINNABAR_POKECENTER_1F, 1

	def_coord_events

	def_bg_events
	bg_event 12, 11, BGEVENT_READ, CinnabarIslandPokecenterSign
	bg_event  9, 11, BGEVENT_READ, CinnabarIslandGymSign
	bg_event  7,  7, BGEVENT_READ, CinnabarIslandSign
	bg_event  9,  1, BGEVENT_ITEM, CinnabarIslandHiddenRareCandy

	def_object_events
	object_event  9,  6, SPRITE_BLUE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CinnabarIslandBlue, EVENT_BLUE_IN_CINNABAR
