	object_const_def
	const SPROUTTOWER3F_SAGE1
	const SPROUTTOWER3F_SAGE2
	const SPROUTTOWER3F_SAGE3
	const SPROUTTOWER3F_SAGE4
	const SPROUTTOWER3F_POKE_BALL1
	const SPROUTTOWER3F_POKE_BALL2
	const SPROUTTOWER3F_RIVAL

SproutTower3F_MapScripts:
	def_scene_scripts
	scene_script SproutTower3FNoop1Scene, SCENE_SPROUTTOWER3F_RIVAL_ENCOUNTER
	scene_script SproutTower3FNoop2Scene, SCENE_SPROUTTOWER3F_NOOP

	def_callbacks

SproutTower3FNoop1Scene:
	end

SproutTower3FNoop2Scene:
	end

SproutTower3FRivalScene:
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	playsound SFX_TACKLE
	playsound SFX_ELEVATOR
	earthquake 79
	pause 15
	playsound SFX_TACKLE
	playsound SFX_ELEVATOR
	earthquake 79
	applymovement PLAYER, SproutTower3FPlayerApproachesRivalMovement
	applymovement SPROUTTOWER3F_RIVAL, SproutTower3FRivalApproachesElderMovement
	opentext
	writetext SproutTowerElderLecturesRivalText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, SPROUTTOWER3F_RIVAL, 15
	turnobject SPROUTTOWER3F_RIVAL, DOWN
	pause 15
	applymovement SPROUTTOWER3F_RIVAL, SproutTower3FRivalLeavesElderMovement
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext SproutTowerRivalOnlyCareAboutStrongText
	waitbutton
	closetext
	turnobject SPROUTTOWER3F_RIVAL, UP
	opentext
	writetext SproutTowerRivalUsedEscapeRopeText
	pause 15
	closetext
	playsound SFX_WARP_TO
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear SPROUTTOWER3F_RIVAL
	waitsfx
	special FadeInQuickly
	setscene SCENE_SPROUTTOWER3F_NOOP
	special RestartMapMusic
	end

SageLiScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM05_FLASH
	iftrue .GotFlash
	writetext SageLiSeenText
	waitbutton
	closetext
	winlosstext SageLiBeatenText, 0
	loadtrainer SAGE, LI
	startbattle
	reloadmapafterbattle
	opentext
	writetext SageLiTakeThisFlashText
	promptbutton
	verbosegiveitem HM_FLASH
	setevent EVENT_GOT_HM05_FLASH
	setevent EVENT_BEAT_SAGE_LI
	writetext SageLiFlashExplanationText
	waitbutton
	closetext
	end

.GotFlash:
	writetext SageLiAfterBattleText
	waitbutton
	closetext
	end

TrainerSageJin:
	trainer SAGE, JIN, EVENT_BEAT_SAGE_JIN, SageJinSeenText, SageJinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageJinAfterBattleText
	waitbutton
	closetext
	end

TrainerSageTroy:
	trainer SAGE, TROY, EVENT_BEAT_SAGE_TROY, SageTroySeenText, SageTroyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageTroyAfterBattleText
	waitbutton
	closetext
	end

TrainerSageNeal:
	trainer SAGE, NEAL, EVENT_BEAT_SAGE_NEAL, SageNealSeenText, SageNealBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageNealAfterBattleText
	waitbutton
	closetext
	end

SproutTower3FPainting:
	jumptext SproutTower3FPaintingText

SproutTower3FStatue:
	jumptext SproutTower3FStatueText

SproutTower3FPotion:
	itemball POTION

SproutTower3FEscapeRope:
	itemball ESCAPE_ROPE

SproutTower3FPlayerApproachesRivalMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

SproutTower3FRivalApproachesElderMovement:
	step UP
	step_end

SproutTower3FRivalLeavesElderMovement:
	step RIGHT
	step DOWN
	step_end

SproutTowerElderLecturesRivalText:
	text "ANCIEN: Tu es"
	line "sans conteste un"
	cont "bon dresseur."

	para "Comme promis,"
	line "voici ta CS."

	para "Un conseil toute-"
	line "fois: traite tes"

	para "#MON avec plus"
	line "de gentillesse."

	para "Tu es bien trop"
	line "âpre au combat."

	para "Les #MON ne"
	line "sont pas des"
	cont "engins de guerre."
	done

SproutTowerRivalOnlyCareAboutStrongText:
	text "..."
	line "...Pfeuh!"

	para "On l'appelle"
	line "l'ANCIEN mais il"
	cont "est super nul!"

	para "Et il raconte"
	line "n'importe quoi..."

	para "Je ne me ferai"
	line "jamais battre par"

	para "un crétin qui"
	line "conseille d'être"

	para "gentil avec les"
	line "#MON."

	para "Seuls les #MON"
	line "puissants sont"
	cont "importants."

	para "Je me contrefiche"
	line "des #MON mi-"
	cont "gnons et faibles."
	done

SproutTowerRivalUsedEscapeRopeText:
	text "<RIVAL> utilise"
	line "une CORDE SORTIE!"
	done

SageLiSeenText:
	text "Bienvenue à toi,"
	line "mon poussin!"

	para "La TOUR CHETIFLOR"
	line "est un lieu"
	cont "d'entraînement."

	para "Humains et #MON"
	line "y renforcent leurs"

	para "liens pour des"
	line "lendemains qui"
	cont "chantent."

	para "Je serai ton"
	line "adversaire final."

	para "Permets-moi de"
	line "mettre à l'épreuve"

	para "ton amitié envers"
	line "tes #MON!"
	done

SageLiBeatenText:
	text "Ah, excellent!"
	done

SageLiTakeThisFlashText:
	text "Toi et tes #MON"
	line "méritez bien cette"
	cont "nouvelle capacité."

	para "Prends donc cette"
	line "CS FLASH."
	done

SageLiFlashExplanationText:
	text "Le FLASH illumine"
	line "les endroits les"
	cont "plus sombres."

	para "Pour l'utiliser en"
	line "dehors des combats"

	para "il te faudra ce-"
	line "pendant le BADGE"
	cont "de l'ARENE de"
	cont "MAUVILLE."
	done

SageLiAfterBattleText:
	text "Va, vole et"
	line "apprends la vie"
	cont "grâce aux #MON."
	done

SageJinSeenText:
	text "Je m'entraîne pour"
	line "trouver la voie du"
	cont "#MON!"
	done

SageJinBeatenText:
	text "Mon entraînement"
	line "est insuffisant."
	done

SageJinAfterBattleText:
	text "Quand un #MON"
	line "gagne en puissance"
	cont "son dresseur"
	cont "devient plus fort."

	para "Non, attends..."
	line "C'est le contraire"

	para "je crois..."
	line "Je sais plus."
	done

SageTroySeenText:
	text "Montre-moi à quel"
	line "point tu fais"
	cont "confiance à tes"
	cont "#MON."
	done

SageTroyBeatenText:
	text "Ta confiance est"
	line "totale! Bien!"
	done

SageTroyAfterBattleText:
	text "L'ANCIEN n'est"
	line "plus très loin."
	done

SageNealSeenText:
	text "La CS de l'ANCIEN"
	line "éclaire même les"
	cont "sombres cavernes."
	done

SageNealBeatenText:
	text "J'en ai pris plein"
	line "la tête!"
	done

SageNealAfterBattleText:
	text "Que ta voie soit"
	line "douce et claire."
	done

SproutTower3FPaintingText:
	text "Une belle peinture"
	line "d'un majestueux"
	cont "CHETIFLOR."
	done

SproutTower3FStatueText:
	text "Une statue de"
	line "#MON..."

	para "Ca a l'air cher"
	line "et raffiné."
	done

SproutTower3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10, 14, SPROUT_TOWER_2F, 4

	def_coord_events
	coord_event 11,  9, SCENE_SPROUTTOWER3F_RIVAL_ENCOUNTER, SproutTower3FRivalScene

	def_bg_events
	bg_event  8,  1, BGEVENT_READ, SproutTower3FStatue
	bg_event 11,  1, BGEVENT_READ, SproutTower3FStatue
	bg_event  9,  0, BGEVENT_READ, SproutTower3FPainting
	bg_event 10,  0, BGEVENT_READ, SproutTower3FPainting
	bg_event  5, 15, BGEVENT_READ, SproutTower3FStatue
	bg_event 14, 15, BGEVENT_READ, SproutTower3FStatue

	def_object_events
	object_event  8, 13, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSageJin, -1
	object_event  8,  8, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSageTroy, -1
	object_event 10,  2, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SageLiScript, -1
	object_event 11, 11, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSageNeal, -1
	object_event  6, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SproutTower3FPotion, EVENT_SPROUT_TOWER_3F_POTION
	object_event 14,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SproutTower3FEscapeRope, EVENT_SPROUT_TOWER_3F_ESCAPE_ROPE
	object_event 10,  4, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_SPROUT_TOWER
