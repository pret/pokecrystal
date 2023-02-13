	object_const_def
	const VIOLETMART_CLERK
	const VIOLETMART_GRANNY
	const VIOLETMART_COOLTRAINER_M

VioletMart_MapScripts:
	def_scene_scripts

	def_callbacks

VioletMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_VIOLET
	closetext
	end

VioletMartGrannyScript:
	jumptextfaceplayer VioletMartGrannyText

VioletMartCooltrainerMScript:
	jumptextfaceplayer VioletMartCooltrainerMText

VioletMartGrannyText:
	text "Le premier #MON"
	line "que tu attrapes"
	cont "peut être tout"
	cont "rikiki."

	para "Mais il peut sans"
	line "aucun doute"
	cont "devenir costaud."

	para "C'est la raison"
	line "pour laquelle il"
	cont "est primordial de"
	cont "bercer d'amour ses"
	cont "#MON."
	done

VioletMartCooltrainerMText:
	text "Les #MON"
	line "peuvent porter des"
	cont "objets comme les"
	cont "POTIONS ou les"
	cont "ANTIDOTES."

	para "Mais ils semblent"
	line "ne pas comprendre"

	para "comment les utili-"
	line "ser tout seuls."
	cont "Donne-leur un"
	cont "coup de main!"
	done

VioletMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, VIOLET_CITY, 1
	warp_event  3,  7, VIOLET_CITY, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletMartClerkScript, -1
	object_event  7,  6, SPRITE_GRANNY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletMartGrannyScript, -1
	object_event  5,  2, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletMartCooltrainerMScript, -1
