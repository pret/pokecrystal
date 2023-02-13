	object_const_def
	const OLIVINELIGHTHOUSE4F_SAILOR
	const OLIVINELIGHTHOUSE4F_LASS

OlivineLighthouse4F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerLassConnie:
	trainer LASS, CONNIE1, EVENT_BEAT_LASS_CONNIE, LassConnie1SeenText, LassConnie1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassConnie1AfterBattleText
	waitbutton
	closetext
	end

TrainerSailorKent:
	trainer SAILOR, KENT, EVENT_BEAT_SAILOR_KENT, SailorKentSeenText, SailorKentBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorKentAfterBattleText
	waitbutton
	closetext
	end

SailorKentSeenText:
	text "JASMINE doit"
	line "s'inquiéter à pro-"
	cont "pos du #MON."

	para "Elle ne sourit"
	line "même plus."
	done

SailorKentBeatenText:
	text "Moi non plus..."
	line "J'souris plus..."
	done

SailorKentAfterBattleText:
	text "Au fait, je crois"
	line "qu'il y a une bon-"

	para "ne PHARMACIE à"
	line "IRISIA."
	done

LassConnie1SeenText:
	text "JASMINE est la"
	line "CHAMPIONNE de"
	cont "cette ville."

	para "Et moi j'suis plus"
	line "forte qu'elle."

	para "Et ça... Tu vas"
	line "le comprendre!"
	done

LassConnie1BeatenText:
	text "Aaah! Mes #MON!"
	done

LassConnie1AfterBattleText:
	text "Chaque dresseur"
	line "est responsable de"
	cont "la santé de ses"
	cont "#MON."

	para "Je prie pour le"
	line "#MON, ainsi"

	para "JASMINE reviendra"
	line "à l'ARENE."
	done

OlivineLighthouse4F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13,  3, OLIVINE_LIGHTHOUSE_3F, 1
	warp_event  3,  5, OLIVINE_LIGHTHOUSE_5F, 2
	warp_event  9,  7, OLIVINE_LIGHTHOUSE_5F, 3
	warp_event  9,  5, OLIVINE_LIGHTHOUSE_3F, 3
	warp_event 16,  9, OLIVINE_LIGHTHOUSE_3F, 6
	warp_event 17,  9, OLIVINE_LIGHTHOUSE_3F, 7
	warp_event  8,  3, OLIVINE_LIGHTHOUSE_3F, 8
	warp_event  9,  3, OLIVINE_LIGHTHOUSE_3F, 9
	warp_event 16,  7, OLIVINE_LIGHTHOUSE_5F, 4
	warp_event 17,  7, OLIVINE_LIGHTHOUSE_5F, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7, 14, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSailorKent, -1
	object_event 11,  2, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLassConnie, -1
