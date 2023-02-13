	object_const_def
	const ROUTE34ILEXFORESTGATE_TEACHER1
	const ROUTE34ILEXFORESTGATE_BUTTERFREE
	const ROUTE34ILEXFORESTGATE_LASS
	const ROUTE34ILEXFORESTGATE_TEACHER2

Route34IlexForestGate_MapScripts:
	def_scene_scripts
	scene_const SCENE_ROUTE34ILEXFORESTGATE_TEACHER_BLOCKS_IF_FOREST_IS_RESTLESS

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route34IsForestRestlessCallback

Route34IsForestRestlessCallback:
	checkevent EVENT_FOREST_IS_RESTLESS
	iffalse .Normal
	disappear ROUTE34ILEXFORESTGATE_TEACHER1
	appear ROUTE34ILEXFORESTGATE_TEACHER2
	endcallback

.Normal:
	disappear ROUTE34ILEXFORESTGATE_TEACHER2
	appear ROUTE34ILEXFORESTGATE_TEACHER1
	endcallback

Route34IlexForestGateCelebiEvent:
	checkevent EVENT_FOREST_IS_RESTLESS
	iffalse .skip
	showemote EMOTE_SHOCK, ROUTE34ILEXFORESTGATE_TEACHER2, 20
	turnobject ROUTE34ILEXFORESTGATE_TEACHER2, LEFT
	turnobject PLAYER, RIGHT
	follow PLAYER, ROUTE34ILEXFORESTGATE_TEACHER2
	applymovement PLAYER, Route34IlexForestGateTeacherBlocksPlayerMovement
	stopfollow
	turnobject PLAYER, DOWN
	opentext
	writetext Route34IlexForestGateTeacher_ForestIsRestless
	waitbutton
	closetext
	applymovement ROUTE34ILEXFORESTGATE_TEACHER2, Route34IlexForestGateTeacherReturnsMovement
.skip:
	end

Route34IlexForestGateTeacherScript:
	faceplayer
	opentext
	checkevent EVENT_FOREST_IS_RESTLESS
	iftrue .ForestIsRestless
	checkevent EVENT_GOT_TM12_SWEET_SCENT
	iftrue .GotSweetScent
	writetext Route34IlexForestGateTeacherText
	promptbutton
	verbosegiveitem TM_SWEET_SCENT
	iffalse .NoRoom
	setevent EVENT_GOT_TM12_SWEET_SCENT
.GotSweetScent:
	writetext Route34IlexForestGateTeacher_GotSweetScent
	waitbutton
.NoRoom:
	closetext
	end

.ForestIsRestless:
	writetext Route34IlexForestGateTeacher_ForestIsRestless
	promptbutton
	closetext
	end

Route34IlexForestGateButterfreeScript:
	opentext
	writetext Route34IlexForestGateButterfreeText
	cry BUTTERFREE
	waitbutton
	closetext
	end

Route34IlexForestGateLassScript:
	jumptextfaceplayer Route34IlexForestGateLassText

Route34IlexForestGateTeacherBlocksPlayerMovement:
	step UP
	step UP
	step_end

Route34IlexForestGateTeacherReturnsMovement:
	step DOWN
	step RIGHT
	step_end

Route34IlexForestGateTeacherText:
	text "Oh! Tu fais"
	line "un #DEX?"

	para "Ca doit être dur"
	line "quand les #MON"

	para "ne veulent pas"
	line "apparaître..."
	cont "Prends cette CT."
	done

Route34IlexForestGateTeacher_GotSweetScent:
	text "C'est DOUX PARFUM."

	para "Utilise-le quand"
	line "un #MON peut"
	cont "apparaître."

	para "Le #MON sera"
	line "charmé."
	done

Route34IlexForestGateTeacher_ForestIsRestless:
	text "Il y a un problème"
	line "dans le BOIS AUX"
	cont "CHENES..."

	para "Evite d'y aller"
	line "pour l'instant."
	done

Route34IlexForestGateButterfreeText:
	text "PAPILUSION: Piiii!"
	done

Route34IlexForestGateLassText:
	text "As-tu vu l'autel"
	line "en l'honneur du"
	cont "gardien?"

	para "Il protège le BOIS"
	line "depuis la nuit des"
	cont "temps."

	para "Ca doit être"
	line "un #MON de"
	cont "type PLANTE."
	done

Route34IlexForestGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, ROUTE_34, 1
	warp_event  5,  0, ROUTE_34, 2
	warp_event  4,  7, ILEX_FOREST, 1
	warp_event  5,  7, ILEX_FOREST, 1

	def_coord_events
	coord_event  4,  7, SCENE_ROUTE34ILEXFORESTGATE_TEACHER_BLOCKS_IF_FOREST_IS_RESTLESS, Route34IlexForestGateCelebiEvent

	def_bg_events

	def_object_events
	object_event  9,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route34IlexForestGateTeacherScript, EVENT_ROUTE_34_ILEX_FOREST_GATE_TEACHER_BEHIND_COUNTER
	object_event  9,  4, SPRITE_BUTTERFREE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route34IlexForestGateButterfreeScript, -1
	object_event  3,  4, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route34IlexForestGateLassScript, EVENT_ROUTE_34_ILEX_FOREST_GATE_LASS
	object_event  5,  7, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route34IlexForestGateTeacherScript, EVENT_ROUTE_34_ILEX_FOREST_GATE_TEACHER_IN_WALKWAY
