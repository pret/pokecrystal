	object_const_def
	const ELMSHOUSE_ELMS_WIFE
	const ELMSHOUSE_ELMS_SON

ElmsHouse_MapScripts:
	def_scene_scripts

	def_callbacks

ElmsWife:
	jumptextfaceplayer ElmsWifeText

ElmsSon:
	jumptextfaceplayer ElmsSonText

ElmsHousePC:
	jumptext ElmsHousePCText

ElmsHouseBookshelf:
	jumpstd DifficultBookshelfScript

ElmsWifeText:
	text "Salut <PLAY_G>!"
	line "Mon mari est tou-"

	para "jours occupé..."
	line "J'espère qu'il va"
	cont "bien."

	para "Lorsqu'il travail-"
	line "le, il oublie même"
	cont "de manger."
	done

ElmsSonText:
	text "Quand je serai"
	line "grand, j'aiderai"
	cont "mon papa!"

	para "Je serai un sacré"
	line "professeur #-"
	cont "MON super balèze!"
	done

ElmsHouseLabFoodText: ; unreferenced
	text "Il y a de la"
	line "nourriture ici."
	cont "Ca doit être pour"
	cont "le LABO."
	done

ElmsHousePokemonFoodText: ; unreferenced
	text "Il y a de la"
	line "nourriture ici."
	cont "Ca doit être pour"
	cont "les #MON."
	done

ElmsHousePCText:
	text "Les #MON..."
	line "D'où viennent-ils?"

	para "Où vont-ils?"
	line "Et pourquoi?"

	para "Pourquoi personne"
	line "n'a jamais vu une"
	cont "naissance de"
	cont "#MON?"

	para "Je veux tout"
	line "savoir!"

	para "Je dédie ma vie à"
	line "la recherche!"

	para "…"

	para "C'est une note"
	line "du PROF.ORME."
	done

ElmsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, NEW_BARK_TOWN, 4
	warp_event  3,  7, NEW_BARK_TOWN, 4

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, ElmsHousePC
	bg_event  6,  1, BGEVENT_READ, ElmsHouseBookshelf
	bg_event  7,  1, BGEVENT_READ, ElmsHouseBookshelf

	def_object_events
	object_event  1,  5, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ElmsWife, -1
	object_event  5,  4, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ElmsSon, -1
