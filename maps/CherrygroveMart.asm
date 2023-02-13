	object_const_def
	const CHERRYGROVEMART_CLERK
	const CHERRYGROVEMART_COOLTRAINER_M
	const CHERRYGROVEMART_YOUNGSTER

CherrygroveMart_MapScripts:
	def_scene_scripts

	def_callbacks

CherrygroveMartClerkScript:
	opentext
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .PokeBallsInStock
	pokemart MARTTYPE_STANDARD, MART_CHERRYGROVE
	closetext
	end

.PokeBallsInStock:
	pokemart MARTTYPE_STANDARD, MART_CHERRYGROVE_DEX
	closetext
	end

CherrygroveMartCooltrainerMScript:
	faceplayer
	opentext
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .PokeBallsInStock
	writetext CherrygroveMartCooltrainerMText
	waitbutton
	closetext
	end

.PokeBallsInStock:
	writetext CherrygroveMartCooltrainerMText_PokeBallsInStock
	waitbutton
	closetext
	end

CherrygroveMartYoungsterScript:
	jumptextfaceplayer CherrygroveMartYoungsterText

CherrygroveMartCooltrainerMText:
	text "Ils n'ont plus de"
	line "# BALLS!"

	para "A quand l'arrivage"
	line "de bonnes"
	cont "# BALLS?"
	done

CherrygroveMartCooltrainerMText_PokeBallsInStock:
	text "Les # BALLS"
	line "sont arrivées!"
	cont "C'est reparti! Les"
	cont "#MON n'ont"
	cont "qu'à bien se"
	cont "tenir!"
	done

CherrygroveMartYoungsterText:
	text "Je marchais dans"
	line "l'herbe et un"

	para "#MON insecte"
	line "a empoisonné mon"
	cont "#MON!"

	para "J'ai continué mon"
	line "chemin mais mon"
	cont "#MON s'est"
	cont "évanoui."

	para "Tu devrais garder"
	line "un ANTIDOTE avec"
	cont "toi."
	done

CherrygroveMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CHERRYGROVE_CITY, 1
	warp_event  3,  7, CHERRYGROVE_CITY, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveMartClerkScript, -1
	object_event  7,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveMartCooltrainerMScript, -1
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CherrygroveMartYoungsterScript, -1
