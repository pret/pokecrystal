_OakText6::
	text "Heu... C'est quoi"
	line "ton nom?"
	prompt

_OakText7::
	text "<PLAYER>, ta quête"
	line "est sur le point"
	cont "de commencer."

	para "Joies et périls"
	line "paveront ta"
	cont "route..."

	para "Un monde de rêve,"
	line "de dangers et de"

	para "#MON t'attend!"
	line "En avant!"

	para "..."
	line "A plus tard."
	done

_ClockTimeMayBeWrongText::
	text "L'horloge est"
	line "peut-être fausse."

	para "Régler l'heure"
	line "s.v.p."
	prompt

_ClockSetWithControlPadText::
	text "Régler avec la"
	line "manette."

	para "Choix:   Bouton A"
	line "Retour:  Bouton B"
	done

_ClockIsThisOKText::
	text "Est-ce correct?"
	done

_ClockHasResetText::
	text "L'horloge a été"
	line "réinitialisée."
	done

_LinkTimeoutText::
	text "Trop de temps"
	line "s'est écoulé."
	cont "Essayer à nouveau."
	prompt

_LinkTradeCantBattleText::
	text "Vous ne pourrez"
	line "pas combattre si"
	cont "vous échangez ce"
	cont "#MON."
	prompt

_LinkAbnormalMonText::
	text "Le @"
	text_ram wStringBuffer1
	text_start
	line "de votre ami(e) a"
	cont "l'air bizarre!"
	prompt

_LinkAskTradeForText::
	text_ram wBufferTrademonNickname
	text_start
	line "contre @"
	text_ram wStringBuffer1
	text "?"
	done

_MobileBattleMustPickThreeMonText::
	text_start
	done

_MobileBattleMoreInfoText::
	text_start
	done

_MobileBattleRulesText::
	text_start
	done

_WouldYouLikeToMobileBattleText::
	text_start
	done

_WantAQuickMobileBattleText::
	text_start
	done

_WantToRushThroughAMobileBattleText::
	text_start
	done

_PleaseTryAgainTomorrowText::
	text_start
	done

_TryAgainUsingSameSettingsText::
	text_start
	done

_MobileBattleLessThanOneMinuteLeftText::
	text_start
	done

_MobileBattleNoTimeLeftForLinkingText::
	text_start
	done

_PickThreeMonForMobileBattleText::
	text_start
	done

_MobileBattleRemainingTimeText::
	text_start
	done

_WouldYouLikeToSaveTheGameText::
	text "Voulez-vous sauve-"
	line "garder la partie?"
	done

_SavingDontTurnOffThePowerText::
	text "SAUVEGARDE..."
	line "NE PAS ETEINDRE."
	done

_SavedTheGameText::
	text "<PLAYER> sauve"
	line "la partie."
	done

_AlreadyASaveFileText::
	text "Il y a déjà une"
	line "sauvegarde. La"
	cont "remplacer?"
	done

_AnotherSaveFileText::
	text "Il y a une autre"
	line "sauvegarde. La"
	cont "remplacer?"
	done

_SaveFileCorruptedText::
	text "La sauvegarde"
	line "est corrompue!"
	prompt

_ChangeBoxSaveText::
	text "En changeant de"
	line "BOITE #MON,"
	cont "les données sont"
	cont "sauvegardées. OK?"
	done

_MoveMonWOMailSaveText::
	text "A chaque déplace-"
	line "ment de #MON,"
	cont "les données sont"
	cont "sauvegardées. OK?"
	done

_WindowAreaExceededErrorText:: ; unreferenced
	text "L'espace de sauve-"
	line "garde est dépassé."
	done

_WindowPoppingErrorText::
	text "Pas de fenêtre"
	line "pour apparition."
	done

_CorruptedEventText:: ; unreferenced
	text "Cas corrompu!"
	prompt

_ObjectEventText::
	text "Cas objet."
	done

_BGEventText::
	text "Cas BG"
	done

_CoordinatesEventText::
	text "Cas coordonnées"
	done

_ReceivedItemText::
	text "<PLAYER> reçoit"
	line "@"
	text_ram wStringBuffer4
	text "."
	done

_PutItemInPocketText::
	text "<PLAYER> met"
	line "@"
	text_ram wStringBuffer1
	text " dans"
	cont "@"
	text_ram wStringBuffer3
	text "."
	prompt

_PocketIsFullText::
	text_ram wStringBuffer3
	text ":"
	line "complet!"
	prompt

_SeerSeeAllText::
	text "Je sais tout."
	line "Je vois tout."

	para "Je sais tout de"
	line "tes #MON!"
	done

_SeerCantTellAThingText::
	text "Hein? Je n'arrive"
	line "pas à voir!"

	para "Comment ça se fait"
	line "tout ça?"
	done

_SeerNameLocationText::
	text "Hmm... Tu as vu"
	line "@"
	text_ram wSeerNickname
	text " ici:"
	cont "@"
	text_ram wSeerCaughtLocation
	text "!"
	prompt

_SeerTimeLevelText::
	text "Il était"
	line "@"
	text_ram wSeerTimeOfDay
	text "!"

	para "Son niveau: @"
	text_ram wSeerCaughtLevelString
	text "!"

	para "Magie!"
	prompt

_SeerTradeText::
	text "Hmm... @"
	text_ram wSeerNickname
	text_start
	line "vient de @"
	text_ram wSeerOT
	text_start
	cont "et d'un échange?"

	para "A @"
	text_ram wSeerCaughtLocation
	text ","
	line "@"
	text_ram wSeerOT
	text_start
	cont "a vu @"
	text_ram wSeerNickname
	text "!"
	prompt

_SeerNoLocationText::
	text "Quoi!? Incroyable!"

	para "Je comprends pas"
	line "trop pourquoi mais"

	para "c'est incroyable!"
	line "Tu as quelque"
	cont "chose de spécial."

	para "Je ne sais pas où"
	line "tu l'as vu mais"
	cont "c'était au niveau"
	cont "@"
	text_ram wSeerCaughtLevelString
	text "."

	para "Pas mal, non?"
	prompt

_SeerEggText::
	text "Hé!"

	para "C'est un OEUF!"

	para "On ne peut encore"
	line "rien dire dessus."
	done

_SeerDoNothingText::
	text "Pfff! Je savais"
	line "que t'allais dire"
	cont "ça!"
	done

_SeerMoreCareText::
	text "Dis donc..."

	para "Il serait sage de"
	line "prendre plus soin"
	cont "de tes #MON."
	done

_SeerMoreConfidentText::
	text "Dis donc..."

	para "Il a l'air d'avoir"
	line "grandi."

	para "@"
	text_ram wSeerNickname
	text_start
	line "semble avoir"
	cont "confiance en lui."
	done

_SeerMuchStrengthText::
	text "Dis donc..."

	para "@"
	text_ram wSeerNickname
	text_start
	line "semble être"
	cont "plus fort."
	done

_SeerMightyText::
	text "Dis donc..."

	para "Il a l'air d'avoir"
	line "pris du muscle."

	para "@"
	text_ram wSeerNickname
	text_start
	line "semble avoir"
	cont "confiance en lui."
	cont "Il a dû gagner"
	cont "plein de combats!"
	done

_SeerImpressedText::
	text "Dis donc..."

	para "Tes efforts"
	line "m'impressionnent."

	para "Cela faisait long-"
	line "temps que je n'a-"

	para "vais pas vu un"
	line "#MON aussi fort"
	cont "que ce @"
	text_ram wSeerNickname
	text "."

	para "Le voir en combat"
	line "doit être plutôt"
	cont "impressionnant."
	done

_CongratulationsYourPokemonText::
	text "Félicitations!"
	line "Votre @"
	text_ram wStringBuffer2
	text_end

	text_end ; unreferenced

_EvolvedIntoText::
	text_start

	para "évolue en"
	line "@"
	text_ram wStringBuffer1
	text "!"
	done

_StoppedEvolvingText::
	text "Hein? @"
	text_ram wStringBuffer2
	text_start
	line "n'évolue plus!"
	prompt

_EvolvingText::
	text "Quoi? @"
	text_ram wStringBuffer2
	text_start
	line "évolue!"
	done

_MartHowManyText::
	text "Combien?"
	done

_MartFinalPriceText::
	text_decimal wItemQuantityChange, 1, 2
	text " @"
	text_ram wStringBuffer2
	text_start
	line "pour @"
	text_decimal hMoneyTemp, 3, 6
	text "¥."
	done

_HerbShopLadyIntroText::
	text "Bonjour toi."

	para "Je vends des"
	line "herbes médicinales"
	cont "à bon marché."

	para "C'est bien bon"
	line "mais un peu amer."

	para "Ton #MON ne va"
	line "peut-être pas"
	cont "aimer."

	para "Héhéhéhéhé..."
	done

_HerbalLadyHowManyText::
	text "Combien?"
	done

_HerbalLadyFinalPriceText::
	text_decimal wItemQuantityChange, 1, 2
	text " @"
	text_ram wStringBuffer2
	text_start
	line "pour @"
	text_decimal hMoneyTemp, 3, 6
	text "¥."
	done

_HerbalLadyThanksText::
	text "Merci."
	line "Héhéhéhéhé..."
	done

_HerbalLadyPackFullText::
	text "Ton SAC est"
	line "plein."
	done

_HerbalLadyNoMoneyText::
	text "Pas assez de sous!"
	line "Héhéhéhéhéhé!"
	done

_HerbalLadyComeAgainText::
	text "A bientôt!"
	line "Héhéhéhéhéhé..."
	done

_BargainShopIntroText::
	text "Salut! Tu cherches"
	line "une bonne affaire?"

	para "Je vends des ob-"
	line "jets super rares!"

	para "Et un de chaque"
	line "type..."
	done

_BargainShopFinalPriceText::
	text_ram wStringBuffer2
	text " coûte"
	line "@"
	text_decimal hMoneyTemp, 3, 6
	text "¥. Tu veux?"
	done

_BargainShopThanksText::
	text "Merci."
	done

_BargainShopPackFullText::
	text "Oh! Ton SAC"
	line "est super plein."
	done

_BargainShopSoldOutText::
	text "Tu as déjà acheté"
	line "ça. J'en ai"
	cont "plus du tout."
	done

_BargainShopNoFundsText::
	text "Oh! T'as super"
	line "pas de sous."
	done

_BargainShopComeAgainText::
	text "Reviens plus"
	line "tard."
	done

_PharmacyIntroText::
	text "Oui? Besoin d'un"
	line "médicament?"
	done

_PharmacyHowManyText::
	text "Combien?"
	done

_PharmacyFinalPriceText::
	text_decimal wItemQuantityChange, 1, 2
	text " @"
	text_ram wStringBuffer2
	text_start
	line "ça fait @"
	text_decimal hMoneyTemp, 3, 6
	text "¥."
	done

_PharmacyThanksText::
	text "Merci, merci!"
	done

_PharmacyPackFullText::
	text "Tu n'as plus de"
	line "place."
	done

_PharmacyNoMoneyText::
	text "Hein? C'est pas"
	line "assez."
	done

_PharmacyComeAgainText::
	text "Très bien. A la"
	line "prochaine."
	done

_NothingToSellText::
	text "Tu n'as rien"
	line "à vendre."
	prompt

_MartSellHowManyText::
	text "Combien?"
	done

_MartSellPriceText::
	text "J'peux t'en donner"
	line "@"
	text_decimal hMoneyTemp, 3, 6
	text "¥."

	para "Ca te va?"
	done

_MartWelcomeText::
	text "Bienvenue! En quoi"
	line "puis-je t'aider?"
	done

_MartThanksText::
	text "Voilà."
	line "Merci!"
	done

_MartNoMoneyText::
	text "Tu n'as pas assez"
	line "d'argent."
	done

_MartPackFullText::
	text "Tu ne peux plus"
	line "rien porter."
	done

_MartCantBuyText::
	text "Je ne peux pas"
	line "t'acheter ça."
	prompt

_MartComeAgainText::
	text "A la prochaine!"
	done

_MartAskMoreText::
	text "As-tu besoin"
	line "d'autre chose?"
	done

_MartBoughtText::
	text "Reçu: @"
	text_decimal hMoneyTemp, 3, 6
	text "¥"
	line "pour @"
	text_ram wStringBuffer2
	text "."
	done

_SlotsBetHowManyCoinsText::
	text "Combien"
	line "de jetons?"
	done

_SlotsStartText::
	text "GO!"
	done

_SlotsNotEnoughCoinsText::
	text "Pas assez de"
	line "jetons."
	prompt

_SlotsRanOutOfCoinsText::
	text "Zut... plus de"
	line "jetons..."
	done

_SlotsPlayAgainText::
	text "Jouer encore?"
	done

_SlotsLinedUpText::
	text "en ligne!"
	line "@"
	text_ram wStringBuffer2
	text " jetons!"
	done

_SlotsDarnText::
	text "Et zut!"
	done

_MobileStadiumEntryText::
	text_start
	done

_MobileStadiumSuccessText::
	text_start
	done

_MainMenuTimeUnknownText::
	text "Heure inconnue"
	done

_DeleteSavedLoginPasswordText::
	text_start
	done

_DeletedTheLoginPasswordText::
	text_start
	done

_MobilePickThreeMonForBattleText::
	text_start
	prompt

_MobileUseTheseThreeMonText::
	text_start
	done

_MobileOnlyThreeMonMayEnterText::
	text_start
	prompt

_MobileCardFolderIntro1Text::
	text_start
	done

_MobileCardFolderIntro2Text::
	text_start
	done

_MobileCardFolderIntro3Text::
	text_start
	done

_MobileCardFolderIntro4Text::
	text_start
	done

_MobileCardFolderAskDeleteText::
	text_start
	done

_MobileCardFolderDeleteAreYouSureText::
	text_start
	done

_MobileCardFolderDeletedText::
	text_start
	done

_MobileCardFolderAskOpenOldText::
	text_start
	done

_MobileCardFolderAskDeleteOldText::
	text_start
	done

_MobileCardFolderFinishRegisteringCardsText::
	text_start
	done

_PhoneWrongNumberText::
	text "Hein? Pardon!"
	line "Mauvais numéro!"
	done

_PhoneClickText::
	text "Clic!"
	done

_PhoneEllipseText::
	text "<……>"
	done

_PhoneOutOfAreaText::
	text "Ce numéro est hors"
	line "de la zone."
	done

_PhoneJustTalkToThemText::
	text "Va parler à cette"
	line "personne!"
	done

_PhoneThankYouText::
	text "Merci!"
	done

_SpaceSpaceColonText:: ; unreferenced
	text "  :"
	done

_PasswordAskResetText::
	text "Mot de passe OK."
	line "Choisir CONTINUER"
	cont "& réinitialiser"
	cont "les paramètres."
	prompt

_PasswordWrongText::
	text "Mauvais mot de"
	line "passe!"
	prompt

_PasswordAskResetClockText::
	text "Réinitialiser"
	line "l'horloge?"
	done

_PasswordAskEnterText::
	text "Entrer le mot de"
	line "passe."
	done

_ClearAllSaveDataText::
	text "Effacer zone de"
	line "sauvegarde?"
	done

_LearnedMoveText::
	text_ram wMonOrItemNameBuffer
	text " apprend"
	line "@"
	text_ram wStringBuffer2
	text "!@"
	sound_dex_fanfare_50_79
	text_promptbutton
	text_end

	text_end ; unreferenced

_MoveAskForgetText::
	text "Oublier quelle"
	next "capacité?"
	done

_StopLearningMoveText::
	text "Arrêter d'appren-"
	line "dre @"
	text_ram wStringBuffer2
	text "?"
	done

_DidNotLearnMoveText::
	text_ram wMonOrItemNameBuffer
	text_start
	line "n'a pas appris"
	cont "@"
	text_ram wStringBuffer2
	text "."
	prompt

_AskForgetMoveText::
	text_ram wMonOrItemNameBuffer
	text_start
	line "tente d'apprendre"
	cont "@"
	text_ram wStringBuffer2
	text "."

	para "Mais @"
	text_ram wMonOrItemNameBuffer
	text " ne"
	line "peut pas apprendre"
	cont "plus de quatre"
	cont "capacités."

	para "Effacer une"
	line "ancienne capacité"
	cont "pour @"
	text_ram wStringBuffer2
	text "?"
	done

Text_MoveForgetCount::
	text "1, 2 et...@"
	text_pause
	text_end

	text_end ; unreferenced

_MoveForgotText::
	text "Tadaa!@"
	text_pause
	text_start

	para "@"
	text_ram wMonOrItemNameBuffer
	text " oublie"
	line "@"
	text_ram wStringBuffer1
	text "."

	para "Et..."
	prompt

_MoveCantForgetHMText::
	text "Les capacités des"
	line "CS ne peuvent être"
	cont "oubliées."
	prompt

_CardFlipPlayWithThreeCoinsText::
	text "Jouer avec 3"
	line "jetons?"
	done

_CardFlipNotEnoughCoinsText::
	text "Pas assez de"
	line "jetons."
	prompt

_CardFlipChooseACardText::
	text "Choisir une carte."
	done

_CardFlipPlaceYourBetText::
	text "Parier..."
	done

_CardFlipPlayAgainText::
	text "Jouer à nouveau?"
	done

_CardFlipShuffledText::
	text "Les cartes ont été"
	line "mélangées."
	prompt

_CardFlipYeahText::
	text "Ouais!"
	done

_CardFlipDarnText::
	text "Zut..."
	done

_GearTodayText::
	text_today
	text_end

	text_end ; unreferenced

_GearEllipseText::
	text "<……>"
	done

_GearOutOfServiceText::
	text "Vous êtes en"
	line "dehors du réseau."
	prompt

_PokegearAskWhoCallText::
	text "Qui voulez-vous"
	line "appeler?"
	done

_PokegearPressButtonText::
	text "Presser un bouton"
	line "pour sortir."
	done

_PokegearAskDeleteText::
	text "Effacer ce numéro"
	line "enregistré?"
	done

_BuenaAskWhichPrizeText::
	text "Quel prix?"
	done

_BuenaIsThatRightText::
	text_ram wStringBuffer1
	text "?"
	line "C'est ça?"
	done

_BuenaHereYouGoText::
	text "Voilà!"
	prompt

_BuenaNotEnoughPointsText::
	text "Vous n'avez pas"
	line "assez de points."
	prompt

_BuenaNoRoomText::
	text "Vous n'avez pas"
	line "de place."
	prompt

_BuenaComeAgainText::
	text "Oh. Revenez"
	line "plus tard!"
	done

_BTExcuseMeText::
	text "Excusez-moi!"
	prompt

_ExcuseMeYoureNotReadyText::
	text "Pardon mais..."
	line "Vous n'êtes pas"
	cont "prêt(e)."

	para ""
	done

_BattleTowerReturnWhenReadyText::
	text "Revenez une fois"
	line "prêt(e)."
	done

_NeedAtLeastThreeMonText::
	text "Il vous faut au"
	line "moins 3 #MON."
	prompt

_EggDoesNotQualifyText::
	text "Un OEUF ne peut"
	line "être inscrit."
	prompt

_OnlyThreeMonMayBeEnteredText::
	text "Seuls 3 #MON"
	line "peuvent être"
	cont "enregistrés."

	para ""
	done

_TheMonMustAllBeDifferentKindsText::
	text "Les @"
	text_ram wStringBuffer2
	text " #MON"
	line "doivent être de"
	cont "types différents."

	para ""
	done

_TheMonMustNotHoldTheSameItemsText::
	text "Les @"
	text_ram wStringBuffer2
	text " #MON"
	line "ne doivent pas"
	cont "tenir les mêmes"
	cont "objets."

	para ""
	done

_YouCantTakeAnEggText::
	text "On ne peut pas"
	line "prendre d'OEUF!"
	prompt

_BallDodgedText::
	text "Il a évité la"
	line "BALL!"

	para "Ce #MON ne se"
	line "laisse pas faire!"
	prompt

_BallMissedText::
	text "Vous manquez le"
	line "#MON!"
	prompt

_BallBrokeFreeText::
	text "Oh non! Le #MON"
	line "s'est libéré!"
	prompt

_BallAppearedCaughtText::
	text "Raaah! Ca y était"
	line "presque!"
	prompt

_BallAlmostHadItText::
	text "Aaaaaah!"
	line "Presque!"
	prompt

_BallSoCloseText::
	text "Mince! Ca y était"
	line "presque!"
	prompt

Text_BallCaught::
	text "Et hop! @"
	text_ram wEnemyMonNickname
	text_start
	line "est attrapé!@"
	sound_caught_mon
	text_end

	text_end ; unreferenced

_WaitButtonText::
	text_promptbutton
	text_end

	text_end ; unreferenced

_BallSentToPCText::
	text_ram wMonOrItemNameBuffer
	text " est en-"
	line "voyé au PC de LEO."
	prompt

_NewDexDataText::
	text "Le profil de"
	line "@"
	text_ram wEnemyMonNickname
	text " est"
	cont "ajouté au #DEX.@"
	sound_slot_machine_start
	text_promptbutton
	text_end

	text_end ; unreferenced

_AskGiveNicknameText::
	text "Donner un surnom à"
	line "@"
	text_ram wStringBuffer1
	text "?"
	done

_ItemStatRoseText::
	text_ram wStringBuffer2
	text " de"
	line "@"
	text_ram wStringBuffer1
	text " monte."
	prompt

_ItemCantUseOnMonText::
	text "Inutilisable sur"
	line "ce #MON."
	prompt

_RepelUsedEarlierIsStillInEffectText::
	text "Le REPOUSSE utili-"
	line "sé auparavant est"
	cont "toujours effectif."
	prompt

_PlayedFluteText::
	text "Vous jouez de la"
	line "#FLUTE."

	para "Ouais..."
	line "Super musique!"
	prompt

_FluteWakeUpText::
	text "Tous les #MON"
	line "endormis se"
	cont "réveillent."
	prompt

Text_PlayedPokeFlute::
	text "<PLAYER> joue de la"
	line "#FLUTE.@"
	text_promptbutton
	text_end

	text_end ; unreferenced

_BlueCardBalanceText::
	text "Vous avez"
	line "@"
	text_decimal wBlueCardBalance, 1, 2
	text " points."
	done

_CoinCaseCountText::
	text "Jetons:"
	line "@"
	text_decimal wCoins, 2, 4
	text_end

	text_end ; unreferenced

_RaiseThePPOfWhichMoveText::
	text "Monter les PP de"
	line "quelle capacité?"
	done

_RestoreThePPOfWhichMoveText::
	text "Restaurer PP de"
	line "quelle capacité?"
	done

_PPIsMaxedOutText::
	text "PP de @"
	text_ram wStringBuffer2
	text_start
	line "au max."
	prompt

_PPsIncreasedText::
	text "PP de @"
	text_ram wStringBuffer2
	text_start
	line "augmentés."
	prompt

_PPRestoredText::
	text "PP restaurés."
	prompt

_SentTrophyHomeText::
	text "Il y a un trophée"
	line "à l'intérieur!@"
	sound_dex_fanfare_50_79
	text_start

	para "@"
	text_ram wPlayerName
	text " envoie"
	line "le trophée à la"
	cont "maison."
	prompt

_ItemLooksBitterText::
	text "Ca a l'air amer..."
	prompt

_ItemCantUseOnEggText::
	text "C'est inutilisable"
	line "sur un OEUF."
	prompt

_ItemOakWarningText::
	text "CHEN: <PLAYER>!"
	line "Ce n'est pas le"
	cont "moment d'utiliser"
	cont "ce truc!"
	prompt

_ItemBelongsToSomeoneElseText::
	text "Ca appartient à"
	line "quelqu'un d'autre!"
	prompt

_ItemWontHaveEffectText::
	text "Ca n'a aucun"
	line "effet."
	prompt

_BallBlockedText::
	text "Le dresseur"
	line "détourne la BALL!"
	prompt

_BallDontBeAThiefText::
	text "Voler c'est mal!"
	prompt

_NoCyclingText::
	text "Faire du vélo est"
	line "interdit ici."
	prompt

_ItemCantGetOnText::
	text "Impossible de"
	line "monter sur votre"
	cont "@"
	text_ram wStringBuffer1
	text " ici."
	prompt

_BallBoxFullText::
	text "La BOITE #MON"
	line "est pleine. C'est"
	cont "inutilisable pour"
	cont "l'instant."
	prompt

_ItemUsedText::
	text "<PLAYER> utilise:"
	line "@"
	text_ram wStringBuffer2
	text "."
	done

_ItemGotOnText::
	text "<PLAYER> monte sur:@"
	text_low
	text_ram wStringBuffer2
	text "."
	prompt

_ItemGotOffText::
	text "<PLAYER> descend@"
	text_low
	text "de: @"
	text_ram wStringBuffer2
	text "."
	prompt

_KnowsMoveText::
	text_ram wStringBuffer1
	text " connaît"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_MoveKnowsOneText::
	text "Ce #MON ne"
	line "connaît qu'une"
	cont "seule capacité."
	done

_AskDeleteMoveText::
	text "Lui faire oublier"
	line "@"
	text_ram wStringBuffer1
	text "?"
	done

_DeleterForgotMoveText::
	text "Le #MON a ou-"
	line "blié la capacité!"
	done

_DeleterEggText::
	text "Un OEUF n'a pas de"
	line "capacité!"
	done

_DeleterNoComeAgainText::
	text "Ah?"
	line "A la prochaine."
	done

_DeleterAskWhichMoveText::
	text "Quelle capacité"
	line "doit-il oublier?"
	prompt

_DeleterIntroText::
	text "Et oui! Moi j'suis"
	line "le TYPE QUI EFFACE"
	cont "LES CAPACITES!!!"

	para "Je peux persuader"
	line "les #MON"
	cont "d'oublier leurs"
	cont "capacités."

	para "Dois-je m'occuper"
	line "de l'un de tes"
	cont "#MON?"
	done

_DeleterAskWhichMonText::
	text "Quel #MON?"
	prompt

_DSTIsThatOKText::
	text_start
	line "OK?"
	done

_TimeAskOkayText::
	text ","
	line "OK?"
	done

_TimesetAskDSTText::
	text "Veux-tu"
	line "modifier l'heure?"
	done

_TimesetDSTText::
	text "J'avance la"
	line "montre d'une"
	cont "heure."
	prompt

_TimesetAskNotDSTText::
	text "Le changement"
	line "d'heure est-il"
	cont "fini?"
	done

_TimesetNotDSTText::
	text "Je recule la"
	line "montre d'une"
	cont "heure."
	prompt

_TimesetAskAdjustDSTText::
	text "Veux-tu"
	line "ajuster la"

	para "montre au change-"
	line "ment d'heure?"
	done

_MomLostGearBookletText::
	text "J'ai perdu la"
	line "notice du"
	cont "#MATOS."
	cont "Reviens plus tard."
	prompt
