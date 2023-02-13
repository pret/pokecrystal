	object_const_def
	const SEAFOAMGYM_BLAINE
	const SEAFOAMGYM_GYM_GUIDE

SeafoamGym_MapScripts:
	def_scene_scripts
	scene_script SeafoamGymNoopScene ; unusable

	def_callbacks

SeafoamGymNoopScene:
	end

SeafoamGymBlaineScript:
	faceplayer
	opentext
	checkflag ENGINE_VOLCANOBADGE
	iftrue .FightDone
	writetext BlaineIntroText
	waitbutton
	closetext
	winlosstext BlaineWinLossText, 0
	loadtrainer BLAINE, BLAINE1
	startbattle
	iftrue .ReturnAfterBattle
	appear SEAFOAMGYM_GYM_GUIDE
.ReturnAfterBattle:
	reloadmapafterbattle
	setevent EVENT_BEAT_BLAINE
	opentext
	writetext ReceivedVolcanoBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_VOLCANOBADGE
	writetext BlaineAfterBattleText
	waitbutton
	closetext
	end

.FightDone:
	writetext BlaineFightDoneText
	waitbutton
	closetext
	end

SeafoamGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_SEAFOAM_GYM_GUIDE_ONCE
	iftrue .TalkedToSeafoamGymGuideScript
	writetext SeafoamGymGuideWinText
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_SEAFOAM_GYM_GUIDE_ONCE
	end

.TalkedToSeafoamGymGuideScript:
	writetext SeafoamGymGuideWinText2
	waitbutton
	closetext
	end

BlaineIntroText:
	text "AUGUSTE: Waaah!"

	para "Mon ARENE de CRA-"
	line "MOIS'ILE a brûlé."

	para "Moi et mes #MON"
	line "de feu n'avons"

	para "plus de maison à"
	line "cause du volcan."

	para "Waaah!"

	para "Mais je suis tou-"
	line "jours un CHAMPION!"

	para "Et je fais la loi"
	line "dans cette grotte."

	para "Bats-moi et je te"
	line "donnerai un BADGE."
	cont "Promis!"

	para "J'espère que tu as"
	line "de l'ANTI-BRULE!"
	done

BlaineWinLossText:
	text "AUGUSTE: Bien."
	line "J'ai perdu."

	para "Tu as mérité le"
	line "BADGE VOLCAN!"
	done

ReceivedVolcanoBadgeText:
	text "<PLAYER> reçoit"
	line "le BADGE VOLCAN."
	done

BlaineAfterBattleText:
	text "AUGUSTE: Je perds"
	line "cette fois mais la"

	para "prochaine, je"
	line "serai vainqueur."

	para "Je vais recons-"
	line "truire mon ARENE à"

	para "CRAMOIS'ILE et"
	line "nous combattrons à"
	cont "nouveau."
	done

BlaineFightDoneText:
	text "AUGUSTE: Mes"
	line "#MON de feu"

	para "seront invincibles"
	line "tu verras!"
	done

SeafoamGymGuideWinText:
	text "Yo!"

	para "Hein? C'est déjà"
	line "fini?"

	para "Désolé!"

	para "L'ARENE de CRAMOI-"
	line "S'ILE était fermée"

	para "alors je savais"
	line "pas où te trouver."

	para "Enfin t'es super"
	line "balèze même sans"

	para "mes conseils. Je"
	line "suis très fier!"
	done

SeafoamGymGuideWinText2:
	text "Une ARENE #MON"
	line "peut être n'impor-"

	para "te où tant que le"
	line "CHAMPION est là."

	para "Pas besoin d'un"
	line "toit."
	done

SeafoamGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  5, ROUTE_20, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_BLAINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SeafoamGymBlaineScript, -1
	object_event  6,  5, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SeafoamGymGuideScript, EVENT_SEAFOAM_GYM_GYM_GUIDE
