	object_const_def
	const SLOWPOKEWELLB1F_ROCKET1
	const SLOWPOKEWELLB1F_ROCKET2
	const SLOWPOKEWELLB1F_ROCKET3
	const SLOWPOKEWELLB1F_ROCKET_GIRL
	const SLOWPOKEWELLB1F_SLOWPOKE1
	const SLOWPOKEWELLB1F_SLOWPOKE2
	const SLOWPOKEWELLB1F_KURT
	const SLOWPOKEWELLB1F_BOULDER
	const SLOWPOKEWELLB1F_POKE_BALL

SlowpokeWellB1F_MapScripts:
	def_scene_scripts

	def_callbacks

SlowpokeWellB1FKurtScript:
	jumptextfaceplayer SlowpokeWellB1FKurtText

TrainerGruntM29:
	trainer GRUNTM, GRUNTM_29, EVENT_BEAT_ROCKET_GRUNTM_29, GruntM29SeenText, GruntM29BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM29AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM1:
	trainer GRUNTM, GRUNTM_1, EVENT_BEAT_ROCKET_GRUNTM_1, GruntM1SeenText, GruntM1BeatenText, 0, .Script

.Script:
	opentext
	writetext TrainerGruntM1WhenTalkText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear SLOWPOKEWELLB1F_ROCKET1
	disappear SLOWPOKEWELLB1F_ROCKET2
	disappear SLOWPOKEWELLB1F_ROCKET3
	disappear SLOWPOKEWELLB1F_ROCKET_GIRL
	pause 15
	special FadeInQuickly
	disappear SLOWPOKEWELLB1F_KURT
	moveobject SLOWPOKEWELLB1F_KURT, 11, 6
	appear SLOWPOKEWELLB1F_KURT
	applymovement SLOWPOKEWELLB1F_KURT, KurtSlowpokeWellVictoryMovementData
	turnobject PLAYER, RIGHT
	opentext
	writetext KurtLeaveSlowpokeWellText
	waitbutton
	closetext
	setevent EVENT_CLEARED_SLOWPOKE_WELL
	variablesprite SPRITE_AZALEA_ROCKET, SPRITE_RIVAL
	setmapscene AZALEA_TOWN, SCENE_AZALEATOWN_RIVAL_BATTLE
	clearevent EVENT_ILEX_FOREST_APPRENTICE
	clearevent EVENT_ILEX_FOREST_FARFETCHD
	setevent EVENT_CHARCOAL_KILN_FARFETCH_D
	setevent EVENT_CHARCOAL_KILN_APPRENTICE
	setevent EVENT_SLOWPOKE_WELL_SLOWPOKES
	setevent EVENT_SLOWPOKE_WELL_KURT
	clearevent EVENT_AZALEA_TOWN_SLOWPOKES
	clearevent EVENT_KURTS_HOUSE_SLOWPOKE
	clearevent EVENT_KURTS_HOUSE_KURT_1
	special FadeOutPalettes
	special HealParty
	pause 15
	warp KURTS_HOUSE, 3, 3
	end

TrainerGruntM2:
	trainer GRUNTM, GRUNTM_2, EVENT_BEAT_ROCKET_GRUNTM_2, GruntM2SeenText, GruntM2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM2AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntF1:
	trainer GRUNTF, GRUNTF_1, EVENT_BEAT_ROCKET_GRUNTF_1, GruntF1SeenText, GruntF1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF1AfterBattleText
	waitbutton
	closetext
	end

SlowpokeWellB1FSlowpokeWithMailScript:
	faceplayer
	opentext
	cry SLOWPOKE
	writetext SlowpokeWellB1FSlowpokeWithMailText
	yesorno
	iftrue .ReadMail
	closetext
	end

.ReadMail:
	writetext SlowpokeWellB1FSlowpokeMailText
	waitbutton
	closetext
	end

SlowpokeWellB1FTaillessSlowpokeScript:
	faceplayer
	opentext
	writetext SlowpokeWellB1FTaillessSlowpokeText
	cry SLOWPOKE
	waitbutton
	closetext
	end

SlowpokeWellB1FBoulder:
	jumpstd StrengthBoulderScript

SlowpokeWellB1FSuperPotion:
	itemball SUPER_POTION

KurtSlowpokeWellVictoryMovementData:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step_sleep 8
	step_sleep 8
	step_sleep 8
	step LEFT
	step UP
	step UP
	step_sleep 8
	step_sleep 8
	step_sleep 8
	turn_head LEFT
	step_end

SlowpokeWellB1FKurtText:
	text "FARGAS: Salut,"
	line "<PLAYER>!"

	para "Le garde a"
	line "décampé quand je"
	cont "lui ai crié"
	cont "dessus..."

	para "Et puis je suis"
	line "descendu dans le"
	cont "PUITS."

	para "Et ben j'me suis"
	line "planté et... Je"
	cont "peux plus bouger."

	para "Pfff! Si j'étais"
	line "en forme, mes"

	para "#MON les au-"
	line "raient punis..."

	para "C'est vraiment"
	line "trop bête."

	para "<PLAYER>, va leur"
	line "mettre une raclée"
	cont "à ma place!"
	done

KurtLeaveSlowpokeWellText:
	text "FARGAS: Bravo,"
	line "<PLAYER>!"

	para "La TEAM ROCKET a"
	line "décampé."

	para "Mon dos va mieux."
	line "Allez..."
	cont "On se casse."
	done

GruntM29SeenText:
	text "Grrah! Je montais"
	line "la garde quand un"

	para "vieux dingue est"
	line "venu me crier"
	cont "dessus."

	para "Il m'a fichu une"
	line "telle trouille que"
	cont "je suis tombé ici."

	para "... Tu sais quoi?"
	line "Je vais calmer mes"
	cont "nerfs sur ta face!"
	done

GruntM29BeatenText:
	text "Grrah! C'est pas"
	line "mon jour!"
	done

GruntM29AfterBattleText:
	text "Bah... Bien sûr"
	line "qu'on vend des"

	para "queues de RAMOLOSS"
	line "volées."

	para "On ferait n'impor-"
	line "te quoi pour le"
	cont "pognon."

	para "Et oui! La TEAM"
	line "ROCKET c'est pas"

	para "d'la rigolade! On"
	line "est des méchants!"
	done

GruntM1SeenText:
	text "Kesstu veux?"

	para "Si tu viens nous"
	line "embêter, ça va"
	cont "barder!"
	done

GruntM1BeatenText:
	text "Attends voir la"
	line "prochaine fois!"
	done

TrainerGruntM1WhenTalkText:
	text "La TEAM ROCKET a"
	line "été dissoute il y"
	cont "a trois ans..."

	para "Mais on a continué"
	line "nos p'tites affai-"
	cont "res dans l'ombre."

	para "Et à partir d'au-"
	line "jourd'hui... On va"
	cont "tout faire sauter!"
	done

GruntM2SeenText:
	text "Arrêter de voler"
	line "les QUEUES de"
	cont "RAMOLOSS?"

	para "Et notre réputa-"
	line "tion, tu y as"
	cont "pensé?"
	done

GruntM2BeatenText:
	text "Heu..."
	line "Trop fort..."
	done

GruntM2AfterBattleText:
	text "On a besoin de"
	line "sous à la TEAM"
	cont "ROCKET..."

	para "C'est pas facile"
	line "d'être un SBIRE!"
	done

GruntF1SeenText:
	text "Arrêter de voler"
	line "les QUEUES?"

	para "C'est ça, oui..."
	line "T'as raison..."
	done

GruntF1BeatenText:
	text "Sale môme!"
	done

GruntF1AfterBattleText:
	text "Les QUEUES de"
	line "RAMOLOSS?"
	cont "Ca repousse vite!"

	para "Alors on peut les"
	line "vendre, non?"
	done

SlowpokeWellB1FSlowpokeWithMailText:
	text "Un RAMOLOSS sans"
	line "QUEUE..."

	para "Hein? Il a une"
	line "LETTRE. On la lit?"
	done

SlowpokeWellB1FSlowpokeMailText:
	text "<PLAYER> lit la"
	line "LETTRE."

	para "Sois sage et occu-"
	line "pe-toi bien de la"

	para "maison avec pépé"
	line "et RAMOLOSS."

	para "Bisous. Papa."
	done

SlowpokeWellB1FTaillessSlowpokeText:
	text "Un RAMOLOSS à la"
	line "queue coupée..."
	done

SlowpokeWellB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17, 15, AZALEA_TOWN, 6
	warp_event  7, 11, SLOWPOKE_WELL_B2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 15,  7, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM29, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  5,  2, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerGruntM1, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  5,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerGruntM2, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event 10,  4, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerGruntF1, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  7,  4, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FSlowpokeWithMailScript, EVENT_SLOWPOKE_WELL_SLOWPOKES
	object_event  6,  2, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FTaillessSlowpokeScript, EVENT_SLOWPOKE_WELL_SLOWPOKES
	object_event 16, 14, SPRITE_KURT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FKurtScript, EVENT_SLOWPOKE_WELL_KURT
	object_event  3,  2, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FBoulder, -1
	object_event 10,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SlowpokeWellB1FSuperPotion, EVENT_SLOWPOKE_WELL_B1F_SUPER_POTION
