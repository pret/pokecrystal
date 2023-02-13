	object_const_def
	const RADIOTOWER1F_RECEPTIONIST
	const RADIOTOWER1F_LASS
	const RADIOTOWER1F_YOUNGSTER
	const RADIOTOWER1F_ROCKET
	const RADIOTOWER1F_LUCKYNUMBERMAN
	const RADIOTOWER1F_CARD_WOMAN

RadioTower1F_MapScripts:
	def_scene_scripts

	def_callbacks

RadioTower1FReceptionistScript:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .Rockets
	writetext RadioTower1FReceptionistWelcomeText
	waitbutton
	closetext
	end

.Rockets:
	writetext RadioTower1FReceptionistNoToursText
	waitbutton
	closetext
	end

RadioTower1FLuckyNumberManScript:
	faceplayer
	opentext
	writetext RadioTower1FLuckyNumberManAskToPlayText
	promptbutton
	special CheckLuckyNumberShowFlag
	iffalse .skip
	special ResetLuckyNumberShowFlag
.skip
	special PrintTodaysLuckyNumber
	checkflag ENGINE_LUCKY_NUMBER_SHOW
	iftrue .GameOver
	writetext RadioTower1FLuckyNumberManThisWeeksIdIsText
	promptbutton
	closetext
	applymovement RADIOTOWER1F_LUCKYNUMBERMAN, RadioTower1FLuckyNumberManGoToPCMovement
	opentext
	writetext RadioTower1FLuckyNumberManCheckIfMatchText
	promptbutton
	waitsfx
	writetext RadioTower1FLuckyNumberManDotDotDotText
	playsound SFX_DEX_FANFARE_20_49
	waitsfx
	promptbutton
	special CheckForLuckyNumberWinners
	closetext
	applymovement RADIOTOWER1F_LUCKYNUMBERMAN, RadioTower1FLuckyNumberManReturnToPlayerMovement
	opentext
	ifequal 1, .FirstPlace
	ifequal 2, .SecondPlace
	ifequal 3, .ThirdPlace
	sjump .NoPrize

.GameOver:
	writetext RadioTower1FLuckyNumberManComeAgainText
	waitbutton
	closetext
	end

.FirstPlace:
	writetext RadioTower1FLuckyNumberManPerfectMatchText
	playsound SFX_1ST_PLACE
	waitsfx
	promptbutton
	giveitem MASTER_BALL
	iffalse .BagFull
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	sjump .GameOver

.SecondPlace:
	writetext RadioTower1FLuckyNumberManOkayMatchText
	playsound SFX_2ND_PLACE
	waitsfx
	promptbutton
	giveitem EXP_SHARE
	iffalse .BagFull
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	sjump .GameOver

.ThirdPlace:
	writetext RadioTower1FLuckyNumberManWeakMatchText
	playsound SFX_3RD_PLACE
	waitsfx
	promptbutton
	giveitem PP_UP
	iffalse .BagFull
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	sjump .GameOver

.NoPrize:
	writetext RadioTower1FLuckyNumberManNoneOfYourIDNumbersMatchText
	waitbutton
	closetext
	end

.BagFull:
	writetext RadioTower1FLuckyNumberManNoRoomForYourPrizeText
	waitbutton
	closetext
	end

RadioTower1FRadioCardWomanScript:
	faceplayer
	opentext
	checkflag ENGINE_RADIO_CARD
	iftrue .GotCard
	writetext RadioTower1FRadioCardWomanOfferQuizText
	yesorno
	iffalse .NoQuiz
	writetext RadioTower1FRadioCardWomanQuestion1Text
	yesorno
	iffalse .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion2Text
	yesorno
	iffalse .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion3Text
	yesorno
	iftrue .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion4Text
	yesorno
	iffalse .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion5Text
	yesorno
	iftrue .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanYouWinText
	promptbutton
	getstring STRING_BUFFER_4, .RadioCardText
	scall .ReceiveItem
	writetext RadioTower1FPokegearIsARadioText
	promptbutton
	setflag ENGINE_RADIO_CARD
.GotCard:
	writetext RadioTower1FRadioCardWomanTuneInText
	waitbutton
	closetext
	end

.RadioCardText:
	db "COUPON RADIO@"

.ReceiveItem:
	jumpstd ReceiveItemScript
	end

.WrongAnswer:
	playsound SFX_WRONG
	writetext RadioTower1FRadioCardWomanWrongAnswerText
	waitbutton
	closetext
	end

.NoQuiz:
	writetext RadioTower1FRadioCardWomanNotTakingQuizText
	waitbutton
	closetext
	end

RadioTower1FLassScript:
	jumptextfaceplayer RadioTower1FLassText

RadioTower1FYoungsterScript:
	jumptextfaceplayer RadioTower1FYoungsterText

TrainerGruntM3:
	trainer GRUNTM, GRUNTM_3, EVENT_BEAT_ROCKET_GRUNTM_3, GruntM3SeenText, GruntM3BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM3AfterBattleText
	waitbutton
	closetext
	end

RadioTower1FDirectory:
	jumptext RadioTower1FDirectoryText

RadioTower1FLuckyChannelSign:
	jumptext RadioTower1FLuckyChannelSignText

RadioTower1FLuckyNumberManGoToPCMovement:
	step RIGHT
	turn_head UP
	step_end

RadioTower1FLuckyNumberManReturnToPlayerMovement:
	step LEFT
	turn_head UP
	step_end

RadioTower1FReceptionistWelcomeText:
	text "Bienvenue!"
	done

RadioTower1FReceptionistNoToursText:
	text "Bonjour."
	line "Il n'y a pas de"
	cont "visite prévue"
	cont "aujourd'hui."
	done

RadioTower1FLuckyNumberManAskToPlayText:
	text "Salut! Es-tu ici"
	line "pour le SHOW du"
	cont "BON NUMERO?"

	para "Veux-tu que je re-"
	line "garde le No. ID de"
	cont "tes #MON?"

	para "Si tu as de la"
	line "chance, tu gagne-"
	cont "ras un prix."
	done

RadioTower1FLuckyNumberManThisWeeksIdIsText:
	text "Le No. ID de cette"
	line "semaine est..."
	cont "@"
	text_ram wStringBuffer3
	text "!"
	done

RadioTower1FLuckyNumberManCheckIfMatchText:
	text "Voyons si cela"
	line "correspond."
	done

RadioTower1FLuckyNumberManDotDotDotText:
	text "<……>"
	line "<……>"
	done

RadioTower1FLuckyNumberManComeAgainText:
	text "A la prochaine"
	line "fois pour un au-"
	cont "tre BON NUMERO."
	done

RadioTower1FLuckyNumberManPerfectMatchText:
	text "Oh! Tes 5 numéros"
	line "correspondent"
	cont "parfaitement!"

	para "Tu es le grand"
	line "vainqueur!"

	para "Tu remportes une"
	line "MASTER BALL!"
	done

RadioTower1FLuckyNumberManOkayMatchText:
	text "Hé! Tes trois der-"
	line "niers numéros"
	cont "correspondent!"

	para "Tu remportes le"
	line "deuxième prix:"
	cont "un MULTI EXP!"
	done

RadioTower1FLuckyNumberManWeakMatchText:
	text "Hé! Tes deux der-"
	line "niers numéros"
	cont "correspondent!"

	para "Tu remportes le"
	line "troisième prix:"
	cont "un PP PLUS!"
	done

RadioTower1FLuckyNumberManNoneOfYourIDNumbersMatchText:
	text "Non! Aucun de tes"
	line "numéros ID ne"
	cont "correspond."
	done

RadioTower1FLuckyNumberManNoRoomForYourPrizeText:
	text "Ton inventaire"
	line "est plein!"

	para "Fais de la place"
	line "et reviens vite."
	done

RadioTower1FRadioCardWomanOfferQuizText:
	text "Nous avons un quiz"
	line "disponible en ce"
	cont "moment."

	para "Réponds à 5 ques-"
	line "tions correctement"
	cont "pour gagner un"
	cont "COUPON RADIO."

	para "Glisse-le dans ton"
	line "#MATOS pour"

	para "écouter la radio"
	line "n'importe quand."

	para "Veux-tu jouer au"
	line "quiz?"
	done

RadioTower1FRadioCardWomanQuestion1Text:
	text "Question 1:"

	para "Y a-t-il un #-"
	line "MON apparaissant"
	cont "uniquement le"
	cont "matin?"
	done

RadioTower1FRadioCardWomanQuestion2Text:
	text "C'est exact!"
	line "Question 2:"

	para "Cette proposition"
	line "est-elle correcte?"

	para "On ne peut pas"
	line "acheter de BAIE à"
	cont "la BOUTIQUE."
	done

RadioTower1FRadioCardWomanQuestion3Text:
	text "Bravo!"
	line "Question 3:"

	para "CS01 contient-elle"
	line "FLASH?"
	done

RadioTower1FRadioCardWomanQuestion4Text:
	text "Tout va bien!"
	line "Question 4:"

	para "ALBERT est-il le"
	line "CHAMPION de MAU-"

	para "VILLE et un utili-"
	line "sateur de #MON"
	cont "oiseaux?"
	done

RadioTower1FRadioCardWomanQuestion5Text:
	text "Encore gagné!"
	line "Voici la dernière"
	cont "question:"

	para "SALAMECHE appa-"
	line "raît-il sur les"

	para "machines à sous au"
	line "CASINO de DOUBLON-"
	cont "VILLE?"
	done

RadioTower1FRadioCardWomanYouWinText:
	text "Bingo! Gagné!"
	line "Félicitations!"

	para "Voici ton prix: un"
	line "COUPON RADIO!"
	done

RadioTower1FPokegearIsARadioText:
	text "Le #MATOS de"
	line "<PLAYER> peut main-"
	cont "tenant servir de"
	cont "radio!"
	done

RadioTower1FRadioCardWomanTuneInText:
	text "Ecoute bien nos"
	line "émissions!!!"
	done

RadioTower1FRadioCardWomanWrongAnswerText:
	text "Oh là làààà!!!"
	line "C'est la mauvaise"

	para "réponse! Essaie"
	line "une autre fois!"
	done

RadioTower1FRadioCardWomanNotTakingQuizText:
	text "Oh. Je vois."
	line "N'hésite pas si tu"
	cont "changes d'avis."
	done

RadioTower1FLassText:
	text "BEN est un super"
	line "DJ!!!"

	para "Sa voix me fait"
	line "super craquer!"
	done

RadioTower1FYoungsterText:
	text "J'adore LULA de la"
	line "CHRONIQUE #MON."

	para "En tout cas j'ado-"
	line "re sa voix..."
	cont "C'est déjà ça."
	done

GruntM3SeenText:
	text "Nous avons enfin"
	line "envahi la TOUR"
	cont "RADIO!"

	para "Vous allez tous"
	line "trembler devant la"

	para "puissance de la"
	line "TEAM ROCKET!"

	para "Ya ha ha ah ah!"
	line "On est méchant!"
	done

GruntM3BeatenText:
	text "Trop fort! Toi"
	line "on t'a à l'oeil!"
	done

GruntM3AfterBattleText:
	text "Trop balèze."

	para "Je dois prévenir"
	line "les autres. Tu es"
	cont "un danger..."
	done

RadioTower1FDirectoryText:
	text "RDC  RECEPTION"
	line "1ER  VENTES"

	para "2EME PERSONNEL"
	line "3EME PRODUCTION"

	para "4EME BUREAU"
	line "     DIRECTION"
	done

RadioTower1FLuckyChannelSignText:
	text "ANTENNE LA CHANCE!"

	para "Gagnez grâce aux"
	line "No. ID de vos"
	cont "#MON!"

	para "Echangez vos #-"
	line "MON pour avoir"
	cont "plus de No. ID!"
	done

RadioTower1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 11
	warp_event  3,  7, GOLDENROD_CITY, 11
	warp_event 15,  0, RADIO_TOWER_2F, 2

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, RadioTower1FDirectory
	bg_event 13,  0, BGEVENT_READ, RadioTower1FLuckyChannelSign

	def_object_events
	object_event  5,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower1FReceptionistScript, -1
	object_event 16,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower1FLassScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 15,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower1FYoungsterScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 14,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM3, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  8,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower1FLuckyNumberManScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 12,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower1FRadioCardWomanScript, EVENT_GOLDENROD_CITY_CIVILIANS
