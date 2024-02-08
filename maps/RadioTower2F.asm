DEF BLUE_CARD_POINT_CAP EQU 30

	object_const_def
	const RADIOTOWER2F_SUPER_NERD
	const RADIOTOWER2F_TEACHER
	const RADIOTOWER2F_ROCKET1
	const RADIOTOWER2F_ROCKET2
	const RADIOTOWER2F_ROCKET3
	const RADIOTOWER2F_ROCKET_GIRL
	const RADIOTOWER2F_BLACK_BELT1
	const RADIOTOWER2F_BLACK_BELT2
	const RADIOTOWER2F_JIGGLYPUFF
	const RADIOTOWER2F_BUENA
	const RADIOTOWER2F_RECEPTIONIST

RadioTower2F_MapScripts:
	def_scene_scripts

	def_callbacks

RadioTower2FNoopScene: ; unreferenced
	end

RadioTower2FSuperNerdScript:
	jumptextfaceplayer RadioTower2FSuperNerdText

RadioTower2FTeacherScript:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .Rockets
	writetext RadioTower2FTeacherText
	waitbutton
	closetext
	end

.Rockets:
	writetext RadioTower2FTeacherText_Rockets
	waitbutton
	closetext
	end

RadioTowerJigglypuff:
	opentext
	writetext RadioTowerJigglypuffText
	cry JIGGLYPUFF
	waitbutton
	closetext
	end

RadioTower2FBlackBelt1Script:
	jumptextfaceplayer RadioTower2FBlackBelt1Text

RadioTower2FBlackBelt2Script:
	jumptextfaceplayer RadioTower2FBlackBelt2Text

TrainerGruntM4:
	trainer GRUNTM, GRUNTM_4, EVENT_BEAT_ROCKET_GRUNTM_4, GruntM4SeenText, GruntM4BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM4AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM5:
	trainer GRUNTM, GRUNTM_5, EVENT_BEAT_ROCKET_GRUNTM_5, GruntM5SeenText, GruntM5BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM5AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM6:
	trainer GRUNTM, GRUNTM_6, EVENT_BEAT_ROCKET_GRUNTM_6, GruntM6SeenText, GruntM6BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM6AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntF2:
	trainer GRUNTF, GRUNTF_2, EVENT_BEAT_ROCKET_GRUNTF_2, GruntF2SeenText, GruntF2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF2AfterBattleText
	waitbutton
	closetext
	end

Buena:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover
	checkevent EVENT_MET_BUENA
	iffalse .Introduction
	checkflag ENGINE_BUENAS_PASSWORD_2
	iftrue .PlayedAlready
	readvar VAR_HOUR
	ifless NITE_HOUR, .TooEarly
	checkflag ENGINE_BUENAS_PASSWORD
	iffalse .TuneIn
	checkitem BLUE_CARD
	iffalse .NoBlueCard
	readvar VAR_BLUECARDBALANCE
	ifequal BLUE_CARD_POINT_CAP, .BlueCardCapped0
	playmusic MUSIC_BUENAS_PASSWORD
	writetext RadioTower2FBuenaDoYouKnowPasswordText
	special AskRememberPassword
	iffalse .ForgotPassword
	writetext RadioTower2FBuenaJoinTheShowText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	readvar VAR_FACING
	ifnotequal RIGHT, .DontNeedToMove
	applymovement PLAYER, RadioTower2FPlayerWalksToMicrophoneMovement
.DontNeedToMove:
	turnobject PLAYER, RIGHT
	opentext
	writetext RadioTower2FBuenaEveryoneSayPasswordText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, DOWN
	reanchormap
	special BuenasPassword
	closetext
	iffalse .WrongAnswer
	opentext
	writetext RadioTower2FBuenaCorrectAnswerText
	waitbutton
	closetext
	readvar VAR_BLUECARDBALANCE
	addval 1
	writevar VAR_BLUECARDBALANCE
	waitsfx
	playsound SFX_TRANSACTION
	setflag ENGINE_BUENAS_PASSWORD_2
	pause 20
	turnobject RADIOTOWER2F_BUENA, RIGHT
	opentext
	writetext RadioTower2FBuenaThanksForComingText
	waitbutton
	closetext
	special FadeOutMusic
	pause 20
	special RestartMapMusic
	readvar VAR_BLUECARDBALANCE
	ifequal BLUE_CARD_POINT_CAP, .BlueCardCapped1
	end

.Introduction:
	writetext RadioTower2FBuenaShowIntroductionText
	promptbutton
	setevent EVENT_MET_BUENA
	verbosegiveitem BLUE_CARD
.TuneIn:
	writetext RadioTower2FBuenaTuneInToMyShowText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered0
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftrue .OfferedNumberBefore
.Registered0:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.ForgotPassword:
	writetext RadioTower2FBuenaComeBackAfterListeningText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	special FadeOutMusic
	pause 20
	special RestartMapMusic
	end

.PlayedAlready:
	writetext RadioTower2FBuenaAlreadyPlayedText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered1
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftrue .OfferedNumberBefore
.Registered1:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	pause 10
	end

.WrongAnswer:
	setflag ENGINE_BUENAS_PASSWORD_2
	opentext
	writetext RadioTower2FBuenaDidYouForgetText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	pause 20
	opentext
	writetext RadioTower2FBuenaThanksForComingText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	special FadeOutMusic
	pause 20
	special RestartMapMusic
	end

.MidRocketTakeover:
	writetext RadioTower2FBuenaPasswordIsHelpText
	waitbutton
	closetext
	end

.NoBlueCard:
	writetext RadioTower2FBuenaNoBlueCardText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered2
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftrue .OfferedNumberBefore
.Registered2:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.BlueCardCapped0:
	writetext RadioTower2FBuenaCardIsFullText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered3
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftrue .OfferedNumberBefore
.Registered3:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.TooEarly:
	writetext RadioTower2FBuenaTuneInAfterSixText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered4
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftrue .OfferedNumberBefore
.Registered4:
	end

.BlueCardCapped1:
	checkcellnum PHONE_BUENA
	iftrue .HasNumber
	pause 20
	turnobject RADIOTOWER2F_BUENA, DOWN
	pause 15
	turnobject PLAYER, UP
	pause 15
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftrue .OfferedNumberBefore
	showemote EMOTE_SHOCK, RADIOTOWER2F_BUENA, 15
	setevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	setevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	opentext
	writetext RadioTower2FBuenaOfferPhoneNumberText
	sjump .AskForNumber

.OfferedNumberBefore:
	opentext
	writetext RadioTower2FBuenaOfferNumberAgainText
.AskForNumber:
	askforphonenumber PHONE_BUENA
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	writetext RadioTower2FRegisteredBuenasNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	promptbutton
	writetext RadioTower2FBuenaCallMeText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	addcellnum PHONE_BUENA
	end

.NumberDeclined:
	writetext RadioTower2FBuenaSadRejectedText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.PhoneFull:
	writetext RadioTower2FBuenaYourPhoneIsFullText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
.HasNumber:
	end

RadioTowerBuenaPrizeReceptionist:
	faceplayer
	opentext
	checkitem BLUE_CARD
	iffalse .NoCard
	writetext RadioTower2FBuenaReceptionistPointsForPrizesText
	promptbutton
	special BuenaPrize
	closetext
	end

.NoCard:
	writetext RadioTower2FBuenaReceptionistNoCardText
	waitbutton
	closetext
	end

RadioTower2FSalesSign:
	jumptext RadioTower2FSalesSignText

RadioTower2FOaksPKMNTalkSign:
	jumptext RadioTower2FOaksPKMNTalkSignText

RadioTower2FPokemonRadioSign:
	jumptext RadioTower2FPokemonRadioSignText

RadioTower2FBookshelf:
	jumpstd MagazineBookshelfScript

RadioTower2FPlayerWalksToMicrophoneMovement:
	slow_step DOWN
	slow_step RIGHT
	step_end

RadioTower2FSuperNerdText:
	text "Ecoutez la radio"
	line "n'importe où!"
	cont "A bientôt!"
	done

RadioTower2FTeacherText:
	text "Les berceuses de"
	line "la radio peuvent"
	cont "endormir les"
	cont "#MON."
	done

RadioTower2FTeacherText_Rockets:
	text "Pourquoi veulent-"
	line "ils contrôler la"
	cont "TOUR RADIO?"
	done

RadioTowerJigglypuffText:
	text "RONDOUDOU:"
	line "Douuu..."
	done

RadioTower2FBlackBelt1Text:
	text "Cet accès est ré-"
	line "servé au personnel"
	cont "autorisé."

	para "Cette mesure vient"
	line "d'être appliquée."

	para "Le DIRECTEUR ne"
	line "va pas bien..."
	done

RadioTower2FBlackBelt2Text:
	text "Vous pouvez vous"
	line "balader."

	para "Le DIRECTEUR est"
	line "agréable. Comme"
	cont "avant, quoi."
	done

GruntM4SeenText:
	text "Il y a trois ans,"
	line "la TEAM ROCKET a"
	cont "été obligée de se"
	cont "dissoudre."

	para "Mais nous revenons"
	line "en force!"
	done

GruntM4BeatenText:
	text "Gueuh! T'es pas"
	line "cool, toi!"
	done

GruntM4AfterBattleText:
	text "On te laissera pas"
	line "nous empêcher de"
	cont "tout casser!"
	done

GruntM5SeenText:
	text "On est la TEAM"
	line "ROCKET, on est les"
	cont "exploiteurs de"
	cont "#MON!"

	para "On est des pas"
	line "beaux méchants qui"
	cont "font peur! Grrr."
	cont "T'as peur, là?"
	done

GruntM5BeatenText:
	text "Tu te crois"
	line "balèze?"
	done

GruntM5AfterBattleText:
	text "On est pas juste"
	line "super méchant. On"
	cont "fait c'qu'on veut."
	done

GruntM6SeenText:
	text "Hé! Dégage!"
	done

GruntM6BeatenText:
	text "Pfff. J'abandonne."
	done

GruntM6AfterBattleText:
	text "Nos CAIDS sont en"
	line "train de contrôler"
	cont "cet endroit."

	para "Ils ont un super"
	line "plan en tête. Je"
	cont "me demande ce que"
	cont "c'est..."
	done

GruntF2SeenText:
	text "Hahaha!"

	para "Très ennuyeux."
	line "C'était trop fa-"

	para "cile d'envahir cet"
	line "endroit!"

	para "Allez les petits!"
	line "Faites-moi encore"
	cont "rire!"
	done

GruntF2BeatenText:
	text "Qu-qui t'es toi?"
	done

GruntF2AfterBattleText:
	text "Tu as gagné. Je ne"
	line "l'oublierai pas!"
	done

RadioTower2FBuenaShowIntroductionText:
	text "BUENA: Salut!"
	line "Je suis BUENA!"

	para "Connais-tu l'émis-"
	line "sion LE MOT DE"
	cont "PASSE?"

	para "Si tu peux me"
	line "donner le mot de"

	para "passe de l'émis-"
	line "sion, tu remportes"
	cont "des points."

	para "Gagne plein de"
	line "points et échange-"

	para "les à la jolie"
	line "fille à côté con-"

	para "tre de fabuleux"
	line "prix!"

	para "Voilà!"

	para "Ta carte à points"
	line "personnelle!"
	done

RadioTower2FBuenaTuneInToMyShowText:
	text "BUENA: Ecoutez"
	line "tous l'émission"
	cont "du MOT DE PASSE!"
	done

RadioTower2FBuenaDoYouKnowPasswordText:
	text "BUENA: Bonjour!"
	line "As-tu écouté mon"
	cont "émission?"

	para "Te souviens-tu du"
	line "mot de passe d'au-"
	cont "jourd'hui?"
	done

RadioTower2FBuenaJoinTheShowText:
	text "BUENA: Oh!"
	line "Merci!"

	para "Quel est ton nom,"
	line "déjà?"

	para "...<PLAY_G>, OK!"

	para "Viens, <PLAY_G>."
	line "Tu es en direct."
	done

RadioTower2FBuenaEveryoneSayPasswordText:
	text "BUENA: Tout le"
	line "monde est prêt?"

	para "Il faut crier le"
	line "mot de passe d'au-"

	para "jourd'hui pour"
	line "<PLAY_G>!"
	done

RadioTower2FBuenaComeBackAfterListeningText:
	text "BUENA: Reviens"
	line "après avoir écouté"

	para "mon émission, OK?"
	line "A plus tard!"
	done

RadioTower2FBuenaAlreadyPlayedText:
	text "BUENA: Désolée..."

	para "Tu n'as qu'un"
	line "essai par jour."

	para "Reviens donc"
	line "demain!"
	done

RadioTower2FBuenaCorrectAnswerText:
	text "BUENA: OUAIIIS!"
	line "C'est exact!"

	para "Tu as donc écouté"
	line "mon émission!"

	para "Tu as gagné un"
	line "point! Bravo!"
	done

RadioTower2FBuenaDidYouForgetText:
	text "BUENA: ..."
	line "Pas du tout."

	para "Tu as oublié le"
	line "mot de passe?"
	done

RadioTower2FBuenaThanksForComingText:
	text "BUENA: Notre"
	line "candidat était"

	para "<PLAY_G>."
	line "Merci!"

	para "Suivez tous ma"
	line "super émission!"
	done

RadioTower2FBuenaPasswordIsHelpText:
	text "BUENA: De quoi?"
	line "Le mot de passe?"

	para "AU SECOURS!"
	done

RadioTower2FBuenaCardIsFullText:
	text "BUENA: Ta carte"
	line "est pleine."

	para "Va donc empocher"
	line "un prix!"
	done

RadioTower2FBuenaTuneInAfterSixText:
	text "BUENA: Ecoutez le"
	line "MOT DE PASSE tous"

	para "les soirs de 18"
	line "heures à minuit!"

	para "Ecoutez et venez!"
	done

RadioTower2FBuenaNoBlueCardText:
	text "BUENA: Oh? Tu n'as"
	line "pas amené ta"
	cont "CARTE BLEUE?"

	para "Je ne peux pas te"
	line "donner de points"
	cont "dans ce cas."
	done

RadioTower2FBuenaOfferPhoneNumberText:
	text "BUENA: Oh! Ta"
	line "CARTE BLEUE a un"

	para "total de {d:BLUE_CARD_POINT_CAP} pts"
	line "aujourd'hui!"

	para "Hmmm... Il n'y a"
	line "pas de prix spé-"
	cont "cial mais..."

	para "Tu viens si sou-"
	line "vent, <PLAY_G>."

	para "Je dois faire"
	line "quelque chose!"

	para "Tu veux mon numéro"
	line "de téléphone?"
	done

RadioTower2FBuenaOfferNumberAgainText:
	text "BUENA: <PLAY_G>,"
	line "veux-tu mon numéro"
	cont "de téléphone?"
	done

RadioTower2FRegisteredBuenasNumberText:
	text "<PLAYER> enregistre"
	line "le No. de BUENA."
	done

RadioTower2FBuenaCallMeText:
	text "BUENA: Appelle-moi"
	line "vite!"
	done

RadioTower2FBuenaSadRejectedText:
	text "BUENA:..."
	line "C'est spécial..."
	done

RadioTower2FBuenaYourPhoneIsFullText:
	text "BUENA: <PLAY_G>,"
	line "il n'y a plus de"

	para "place sur ton"
	line "téléphone..."
	done

RadioTower2FBuenaReceptionistPointsForPrizesText:
	text "Tu peux échanger"
	line "tes points contre"
	cont "un fabuleux prix!"
	done

RadioTower2FBuenaReceptionistNoCardText:
	text "Tu ne peux pas"
	line "échanger tes"
	cont "points sans ta"
	cont "CARTE BLEUE."

	para "N'oublie pas ta"
	line "CARTE BLEUE!"
	done

RadioTower2FSalesSignText:
	text "1ER VENTES"
	done

RadioTower2FOaksPKMNTalkSignText:
	text "CHRONIQUE #MON"
	line "DU PROF.CHEN"

	para "L'émission star"
	line "à l'antenne!"
	done

RadioTower2FPokemonRadioSignText:
	text "Pour chacune"
	line "Pour chacun"
	cont "Le soir"
	cont "Comme le matin"
	cont "RADIO #MON"
	cont "C'est bien..."
	done

RadioTower2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_3F, 1
	warp_event 15,  0, RADIO_TOWER_1F, 3

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, RadioTower2FSalesSign
	bg_event  5,  0, BGEVENT_READ, RadioTower2FOaksPKMNTalkSign
	bg_event  9,  1, BGEVENT_READ, RadioTower2FBookshelf
	bg_event 10,  1, BGEVENT_READ, RadioTower2FBookshelf
	bg_event 11,  1, BGEVENT_READ, RadioTower2FBookshelf
	bg_event 13,  0, BGEVENT_READ, RadioTower2FPokemonRadioSign

	def_object_events
	object_event  6,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower2FSuperNerdScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 17,  2, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower2FTeacherScript, -1
	object_event  1,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM4, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  8,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM5, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  4,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerGruntM6, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 10,  5, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerGruntF2, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  0,  1, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower2FBlackBelt1Script, EVENT_RADIO_TOWER_BLACKBELT_BLOCKS_STAIRS
	object_event  1,  1, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower2FBlackBelt2Script, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event 12,  1, SPRITE_JIGGLYPUFF, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTowerJigglypuff, -1
	object_event 14,  5, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Buena, -1
	object_event 12,  7, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTowerBuenaPrizeReceptionist, EVENT_GOLDENROD_CITY_CIVILIANS
