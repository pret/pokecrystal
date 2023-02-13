CeladonMansion2F_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonMansion2FComputer:
	jumptext CeladonMansion2FComputerText

CeladonMansion2FMeetingRoomSign:
	jumptext CeladonMansion2FMeetingRoomSignText

CeladonMansion2FBookshelf:
	jumpstd DifficultBookshelfScript

CeladonMansion2FComputerText:
	text "<PLAYER> allume"
	line "le PC."

	para "…"

	para "Quelqu'un était en"
	line "train d'écrire un"
	cont "e-mail..."

	para "...J'espère que"
	line "vous viendrez à"
	cont "KANTO."

	para "Vous verrez à quel"
	line "point les choses"
	cont "ont changé ici."

	para "Vous verrez même"
	line "des #MON qui"

	para "n'existent pas à"
	line "JOHTO."

	para "Pour le PRODUCTEUR"

	para "..."
	done

CeladonMansion2FMeetingRoomSignText:
	text "GAME FREAK"
	line "SALLE de REUNION"
	done

CeladonMansion2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  0, CELADON_MANSION_1F, 4
	warp_event  1,  0, CELADON_MANSION_3F, 2
	warp_event  6,  0, CELADON_MANSION_3F, 3
	warp_event  7,  0, CELADON_MANSION_1F, 5

	def_coord_events

	def_bg_events
	bg_event  0,  3, BGEVENT_READ, CeladonMansion2FComputer
	bg_event  5,  8, BGEVENT_UP, CeladonMansion2FMeetingRoomSign
	bg_event  2,  3, BGEVENT_READ, CeladonMansion2FBookshelf

	def_object_events
