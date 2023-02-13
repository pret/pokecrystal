	object_const_def
	const ROUTE15_YOUNGSTER1
	const ROUTE15_YOUNGSTER2
	const ROUTE15_YOUNGSTER3
	const ROUTE15_YOUNGSTER4
	const ROUTE15_TEACHER1
	const ROUTE15_TEACHER2
	const ROUTE15_POKE_BALL

Route15_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerTeacherColette:
	trainer TEACHER, COLETTE, EVENT_BEAT_TEACHER_COLETTE, TeacherColetteSeenText, TeacherColetteBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherColetteAfterBattleText
	waitbutton
	closetext
	end

TrainerTeacherHillary:
	trainer TEACHER, HILLARY, EVENT_BEAT_TEACHER_HILLARY, TeacherHillarySeenText, TeacherHillaryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherHillaryAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyKipp:
	trainer SCHOOLBOY, KIPP, EVENT_BEAT_SCHOOLBOY_KIP, SchoolboyKippSeenText, SchoolboyKippBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyKippAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyTommy:
	trainer SCHOOLBOY, TOMMY, EVENT_BEAT_SCHOOLBOY_TOMMY, SchoolboyTommySeenText, SchoolboyTommyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyTommyAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyJohnny:
	trainer SCHOOLBOY, JOHNNY, EVENT_BEAT_SCHOOLBOY_JOHNNY, SchoolboyJohnnySeenText, SchoolboyJohnnyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyJohnnyAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyBilly:
	trainer SCHOOLBOY, BILLY, EVENT_BEAT_SCHOOLBOY_BILLY, SchoolboyBillySeenText, SchoolboyBillyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyBillyAfterBattleText
	waitbutton
	closetext
	end

Route15Sign:
	jumptext Route15SignText

Route15PPUp:
	itemball PP_UP

TeacherColetteSeenText:
	text "Il est où ton"
	line "cahier?"
	cont "Et ta trousse?"
	done

TeacherColetteBeatenText:
	text "Kyaaah!"
	done

TeacherColetteAfterBattleText:
	text "Etre professeur ça"
	line "laisse des traces."
	done

TeacherHillarySeenText:
	text "Avoir son matériel"
	line "est important."

	para "Comme les dictées"
	line "et les devoirs."
	done

TeacherHillaryBeatenText:
	text "Perdre c'est mal."
	line "Pfff..."
	done

TeacherHillaryAfterBattleText:
	text "Un esprit sain"
	line "dans un corps"
	cont "sain..."
	done

SchoolboyKippSeenText:
	text "Un p'tit combat"
	line "et j'appelle ma"
	cont "maman."
	done

SchoolboyKippBeatenText:
	text "Allô maman?"
	line "J'ai perdu!"
	done

SchoolboyKippAfterBattleText:
	text "Maman s'inquiète"
	line "beaucoup pour moi."

	para "Alors je dois lui"
	line "téléphoner..."
	done

SchoolboyTommySeenText:
	text "COOOOMBAAAAT!"
	line "HA HA HA HA!"
	done

SchoolboyTommyBeatenText:
	text "Heu..."
	line "Copain?"
	done

SchoolboyTommyAfterBattleText:
	text "Trop fort!"
	line "On devient potes?"
	cont "Allez!!!"
	done

SchoolboyJohnnySeenText:
	text "On va étudier à la"
	line "TOUR RADIO de"

	para "LAVANVILLE..."
	line "Génial, non?"
	done

SchoolboyJohnnyBeatenText:
	text "T'es pas sympa,"
	line "toi!"
	done

SchoolboyJohnnyAfterBattleText:
	text "Marcher c'est"
	line "crevant..."
	cont "Je fais une pause."
	done

SchoolboyBillySeenText:
	text "J'aime la purée!"
	line "Combat!"
	done

SchoolboyBillyBeatenText:
	text "...."
	line "Super."
	done

SchoolboyBillyAfterBattleText:
	text "J'aime le lard et"
	line "le jambon, et tout"
	cont "ce qu'il y a dans"
	cont "le cochon!"
	done

Route15SignText:
	text "ROUTE 15"

	para "PARMANIE -"
	line "LAVANVILLE"
	done

Route15_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  4, ROUTE_15_FUCHSIA_GATE, 3
	warp_event  2,  5, ROUTE_15_FUCHSIA_GATE, 4

	def_coord_events

	def_bg_events
	bg_event 19,  9, BGEVENT_READ, Route15Sign

	def_object_events
	object_event 10, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSchoolboyKipp, -1
	object_event 15, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyTommy, -1
	object_event 33, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyJohnny, -1
	object_event 27, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyBilly, -1
	object_event 30, 12, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerTeacherColette, -1
	object_event 20, 10, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerTeacherHillary, -1
	object_event 12,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route15PPUp, EVENT_ROUTE_15_PP_UP
