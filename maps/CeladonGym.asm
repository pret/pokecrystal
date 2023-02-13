	object_const_def
	const CELADONGYM_ERIKA
	const CELADONGYM_LASS1
	const CELADONGYM_LASS2
	const CELADONGYM_BEAUTY
	const CELADONGYM_TWIN1
	const CELADONGYM_TWIN2

CeladonGym_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonGymErikaScript:
	faceplayer
	opentext
	checkflag ENGINE_RAINBOWBADGE
	iftrue .FightDone
	writetext ErikaBeforeBattleText
	waitbutton
	closetext
	winlosstext ErikaBeatenText, 0
	loadtrainer ERIKA, ERIKA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ERIKA
	setevent EVENT_BEAT_LASS_MICHELLE
	setevent EVENT_BEAT_PICNICKER_TANYA
	setevent EVENT_BEAT_BEAUTY_JULIA
	setevent EVENT_BEAT_TWINS_JO_AND_ZOE
	opentext
	writetext PlayerReceivedRainbowBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_RAINBOWBADGE
.FightDone:
	checkevent EVENT_GOT_TM19_GIGA_DRAIN
	iftrue .GotGigaDrain
	writetext ErikaExplainTMText
	promptbutton
	verbosegiveitem TM_GIGA_DRAIN
	iffalse .GotGigaDrain
	setevent EVENT_GOT_TM19_GIGA_DRAIN
.GotGigaDrain:
	writetext ErikaAfterBattleText
	waitbutton
	closetext
	end

TrainerLassMichelle:
	trainer LASS, MICHELLE, EVENT_BEAT_LASS_MICHELLE, LassMichelleSeenText, LassMichelleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassMichelleAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerTanya:
	trainer PICNICKER, TANYA, EVENT_BEAT_PICNICKER_TANYA, PicnickerTanyaSeenText, PicnickerTanyaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerTanyaAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyJulia:
	trainer BEAUTY, JULIA, EVENT_BEAT_BEAUTY_JULIA, BeautyJuliaSeenText, BeautyJuliaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyJuliaAfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsJoAndZoe1:
	trainer TWINS, JOANDZOE1, EVENT_BEAT_TWINS_JO_AND_ZOE, TwinsJoAndZoe1SeenText, TwinsJoAndZoe1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsJoAndZoe1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsJoAndZoe2:
	trainer TWINS, JOANDZOE2, EVENT_BEAT_TWINS_JO_AND_ZOE, TwinsJoAndZoe2SeenText, TwinsJoAndZoe2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsJoAndZoe2AfterBattleText
	waitbutton
	closetext
	end

CeladonGymStatue:
	checkflag ENGINE_RAINBOWBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, ERIKA, ERIKA1
	jumpstd GymStatue2Script

ErikaBeforeBattleText:
	text "ERIKA: Bonjour..."
	line "Belle journée,"
	cont "non?"

	para "C'est beau la vie."

	para "Moi je suis ERIKA,"
	line "CHAMPIONNE de"
	cont "l'ARENE de CELADO-"
	cont "POLE."

	para "...Oh? Tu viens"
	line "de JOHTO?"
	cont "C'est bien..."

	para "...Quoi? Tu veux"
	line "te battre? Mais il"
	cont "faut le dire!!!"

	para "J'vais te casser"
	line "ta face!!!"
	done

ErikaBeatenText:
	text "ERIKA: Oh!"
	line "J'ai perdu..."

	para "Toi t'es un p'tit"
	line "tigre..."

	para "Voilà pour toi: le"
	line "BADGE PRISME..."
	done

PlayerReceivedRainbowBadgeText:
	text "<PLAYER> reçoit"
	line "le BADGE PRISME."
	done

ErikaExplainTMText:
	text "ERIKA: Quel beau"
	line "match."

	para "Je tiens à ce que"
	line "tu acceptes cette"
	cont "belle CT."

	para "C'est la"
	line "GIGA-SANGSUE."

	para "Cette capacité"
	line "draine la moitié"

	para "des dégâts infli-"
	line "gés pour soigner"
	cont "ton #MON."

	para "Tu verras, c'est"
	line "très utile..."
	done

ErikaAfterBattleText:
	text "ERIKA: Perdre"
	line "fait toujours un"
	cont "peu mal mais..."

	para "Combattre un bon"
	line "adversaire est"
	cont "stimulant..."
	done

LassMichelleSeenText:
	text "Ca t'étonne une"
	line "ARENE remplie"
	cont "de filles?"
	done

LassMichelleBeatenText:
	text "Ouiiiiin!"
	done

LassMichelleAfterBattleText:
	text "Je ne faisais pas"
	line "attention!"
	done

PicnickerTanyaSeenText:
	text "Un combat?"
	line "Heu...non."
	cont "..."
	cont "Allez, d'accord!"
	done

PicnickerTanyaBeatenText:
	text "C'est fini?"
	done

PicnickerTanyaAfterBattleText:
	text "T'en as plein des"
	line "BADGES. Comment"

	para "je pouvais gagner,"
	line "moi?!"
	done

BeautyJuliaSeenText:
	text "Tu regardes les"
	line "fleurs ou c'est"
	cont "moi que tu mates?"
	done

BeautyJuliaBeatenText:
	text "C'est pas bien!"
	done

BeautyJuliaAfterBattleText:
	text "Comment devenir"
	line "une belle fille"
	cont "comme ERIKA?"
	done

TwinsJoAndZoe1SeenText:
	text "ERIKA nous a ap-"
	line "pris plein de"
	cont "trucs!"
	done

TwinsJoAndZoe1BeatenText:
	text "Oh... On a perdu."
	done

TwinsJoAndZoe1AfterBattleText:
	text "ERIKA!"
	line "Venge-nous!"
	done

TwinsJoAndZoe2SeenText:
	text "On doit protéger"
	line "la grande ERIKA!"
	done

TwinsJoAndZoe2BeatenText:
	text "Nooooonn...."
	done

TwinsJoAndZoe2AfterBattleText:
	text "ERIKA est bien"
	line "plus forte!"
	done

CeladonGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, CELADON_CITY, 8
	warp_event  5, 17, CELADON_CITY, 8

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, CeladonGymStatue
	bg_event  6, 15, BGEVENT_READ, CeladonGymStatue

	def_object_events
	object_event  5,  3, SPRITE_ERIKA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGymErikaScript, -1
	object_event  7,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLassMichelle, -1
	object_event  2,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerPicnickerTanya, -1
	object_event  3,  5, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBeautyJulia, -1
	object_event  4, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsJoAndZoe1, -1
	object_event  5, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsJoAndZoe2, -1
