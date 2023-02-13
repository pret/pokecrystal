	object_const_def
	const SOULHOUSE_MRFUJI
	const SOULHOUSE_TEACHER
	const SOULHOUSE_LASS
	const SOULHOUSE_GRANNY

SoulHouse_MapScripts:
	def_scene_scripts

	def_callbacks

MrFuji:
	jumptextfaceplayer MrFujiText

SoulHouseTeacherScript:
	jumptextfaceplayer SoulHouseTeacherText

SoulHouseLassScript:
	jumptextfaceplayer SoulHouseLassText

SoulHouseGrannyScript:
	jumptextfaceplayer SoulHouseGrannyText

MrFujiText:
	text "M.FUJI:"
	line "Bienvenue à toi."

	para "Hmm... Tu as l'air"
	line "d'être un dresseur"

	para "de #MON doux"
	line "et attentionné."

	para "Ceux qui aiment"
	line "les #MON vien-"

	para "nent ici saluer"
	line "leur âme."

	para "Tu peux présenter"
	line "ici tes condoléan-"
	cont "ces."

	para "Cela leur fera"
	line "plaisir."
	done

SoulHouseTeacherText:
	text "Il y a d'autres"
	line "tombes de #MON"
	cont "ici, je crois."

	para "Beaucoup de pièces"
	line "ne sont réservées"
	cont "qu'à M.FUJI."
	done

SoulHouseLassText:
	text "J'suis venue avec"
	line "ma môman pour voir"
	cont "les tombes de"
	cont "#MON..."
	done

SoulHouseGrannyText:
	text "Les #MON que"
	line "j'ai perdus..."

	para "Je les aimais com-"
	line "me mes petits-"
	cont "enfants..."
	done

SoulHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, LAVENDER_TOWN, 6
	warp_event  5,  7, LAVENDER_TOWN, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MrFuji, -1
	object_event  7,  3, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SoulHouseTeacherScript, -1
	object_event  2,  5, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SoulHouseLassScript, -1
	object_event  1,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SoulHouseGrannyScript, -1
