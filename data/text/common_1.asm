_FruitBearingTreeText::
	text "C'est un arbre à"
	line "fruits."
	done

_HeyItsFruitText::
	text "Hé! C'est un(e)"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_ObtainedFruitText::
	text "Obtenu:"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_FruitPackIsFullText::
	text "Mais le SAC"
	line "est plein..."
	done

_NothingHereText::
	text "Il n'y a rien"
	line "ici..."
	done

_WhichApricornText::
	text "Quel NOIGRUME"
	line "dois-je utiliser?"
	done

_HowManyShouldIMakeText::
	text "Combien dois-je"
	line "en créer?"
	done

_RecoveredSomeHPText::
	text_ram wStringBuffer1
	text_start
	line "regagne @"
	text_decimal wCurHPAnimDeltaHP, 2, 3
	text "PV!"
	done

_CuredOfPoisonText::
	text_ram wStringBuffer1
	text " n'est"
	line "plus empoisonné."
	done

_RidOfParalysisText::
	text_ram wStringBuffer1
	text " n'est"
	line "plus paralysé."
	done

_BurnWasHealedText::
	text_ram wStringBuffer1
	text_start
	line "ne brûle plus."
	done

_WasDefrostedText::
	text_ram wStringBuffer1
	text_start
	line "n'est plus gelé."
	done

_WokeUpText::
	text_ram wStringBuffer1
	text_start
	line "se réveille."
	done

_HealthReturnedText::
	text_ram wStringBuffer1
	text " regagne"
	line "son énergie."
	done

_RevitalizedText::
	text_ram wStringBuffer1
	text " est"
	line "revitalisé."
	done

_GrewToLevelText::
	text_ram wStringBuffer1
	text " monte"
	line "au niveau @"
	text_decimal wCurPartyLevel, 1, 3
	text "!@"
	sound_dex_fanfare_50_79 ; plays SFX_DEX_FANFARE_50_79, identical to SFX_LEVEL_UP
	text_promptbutton
	text_end

	text_end ; unreferenced

_CameToItsSensesText::
	text_ram wStringBuffer1
	text " revient"
	line "à lui."
	done

_EnterNewPasscodeText::
	text "Entrez un nombre"
	line "à 4 chiffres."
	done

_ConfirmPasscodeText::
	text "Entrez le même No."
	line "pour confirmation."
	done

_PasscodesNotSameText::
	text "Ce n'est pas le"
	line "même numéro."
	done

_PasscodeSetText::
	text "CODE SECRET"
	line "défini."

	para "Entrez ce No. la"
	line "prochaine fois"
	cont "pour ouvrir le"
	cont "FICHIER CARTE."

	para ""
	done

_FourZerosInvalidText::
	text "0000 invalide!"
	prompt

_EnterPasscodeText::
	text "Entrez le CODE du"
	next "FICHIER CARTE."
	done

_IncorrectPasscodeText::
	text "CODE SECRET"
	line "incorrect!"
	prompt

_CardFolderOpenText::
	text "FICHIER CARTE"
	line "ouvert.@"
	text_end

_OakTimeWokeUpText::
	text "<……><……><……><……><……><……>"
	line "<……><……><……><……><……><……>"

	para "Zzz...Hm? Quoi...?"
	line "Tu m'as réveillé!"

	para "Mais quelle heure"
	line "est-il?"
	prompt

_OakTimeWhatTimeIsItText::
	text "Quelle heure"
	line "est-il?"
	done

_OakTimeWhatHoursText::
	text "Quoi?@"
	text_end

_OakTimeHoursQuestionMarkText::
	text "?"
	done

_OakTimeHowManyMinutesText::
	text "Combien de"
	line "minutes?"
	done

_OakTimeWhoaMinutesText::
	text "Whoa!@"
	text_end

_OakTimeMinutesQuestionMarkText::
	text "?"
	done

_OakTimeOversleptText::
	text "!"
	line "J'suis en retard!"
	done

_OakTimeYikesText::
	text "!"
	line "Non! J'suis en"
	cont "retard!"
	done

_OakTimeSoDarkText::
	text "!"
	line "C'est normal qu'il"
	cont "fasse nuit!"
	done

_OakTimeWhatDayIsItText::
	text "Quel jour?"
	done

_OakTimeIsItText::
	text "?"
	done

; Mobile Adapter

_ThereIsNothingConnectedText:: ; unreferenced
	text "Rien n'est"
	line "connecté."
	done

_CheckCellPhoneAdapterText:: ; unreferenced
	text_start
	done

_CheckCDMAAdapterText:: ; unreferenced
	text_start
	done

_CheckDOCOMOPHSAdapterText:: ; unreferenced
	text_start
	done

_CheckDDIPHSAdapterText:: ; unreferenced
	text_start
	done

_CheckMobileAdapterText:: ; unreferenced
	text_start
	done

; Mobile Adapter End

_ThePasswordIsText:: ; unreferenced
	text "Mot de passe:"
	line ""
	done

_IsThisOKText:: ; unreferenced
	text "OK?"
	done

_EnterTheIDNoText:: ; unreferenced
	text "Entrer le"
	line "no. ID."
	done

_EnterTheAmountText:: ; unreferenced
	text "Entrer le"
	line "montant."
	done

_NothingToChooseText::
	text "Il n'y a rien"
	line "à choisir."
	prompt

_WhichSidePutOnText::
	text "Mettre de quel"
	line "côté?"
	done

_WhichSidePutAwayText::
	text "Ranger de quel"
	line "côté?"
	done

_PutAwayTheDecoText::
	text "Rangé:"
	line "@"
	text_ram wStringBuffer3
	text "."
	prompt

_NothingToPutAwayText::
	text "Il n'y a rien"
	line "à ranger."
	prompt

_SetUpTheDecoText::
	text "Installé:"
	line "@"
	text_ram wStringBuffer3
	text "."
	prompt

_PutAwayAndSetUpText::
	text "Rangé:"
	line "@"
	text_ram wStringBuffer3
	text_start

	para "et installé:"
	line "@"
	text_ram wStringBuffer4
	text "."
	prompt

_AlreadySetUpText::
	text "C'est déjà"
	line "installé."
	prompt

_LookTownMapText::
	text "C'est la CARTE."
	done

_LookPikachuPosterText::
	text "C'est un poster du"
	line "mignon PIKACHU."
	done

_LookClefairyPosterText::
	text "C'est un poster du"
	line "mignon MELOFEE."
	done

_LookJigglypuffPosterText::
	text "C'est un poster du"
	line "mignon RONDOUDOU."
	done

_LookAdorableDecoText::
	text "Un(e) superbe"
	line "@"
	text_ram wStringBuffer3
	text "."
	done

_LookGiantDecoText::
	text "Une poupée géante!"
	line "C'est super doux."
	done

_MomHiHowAreYouText::
	text "Salut, <PLAYER>!"
	line "Ca va bien?"
	prompt

_MomFoundAnItemText::
	text "J'ai trouvé un bel"
	line "objet à acheter..."
	prompt

_MomBoughtWithYourMoneyText::
	text "Alors j'ai dépensé"
	line "tes sous. Désolée!"
	prompt

_MomItsInPCText::
	text "C'est dans ton PC."
	line "Ca va te plaire!"
	done

_MomFoundADollText::
	text "En faisant les"
	line "courses j'ai vu"
	cont "cette superbe"
	cont "poupée, alors..."
	prompt

_MomItsInYourRoomText::
	text "Elle est dans ta"
	line "chambre!"
	done

_MonWasSentToText::
	text_ram wPlayerTrademonSpeciesName
	text " est"
	line "envoyé à @"
	text_ram wOTTrademonSenderName
	text "."
	done

_MonNameSentToText::
	text_start
	done

_BidsFarewellToMonText::
	text_ram wOTTrademonSenderName
	text " dit"
	line "adieu à"
	done

_MonNameBidsFarewellText::
	text_ram wOTTrademonSpeciesName
	text "."
	done

_TakeGoodCareOfMonText::
	text "Prends soin de"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_ForYourMonSendsText::
	text "Contre @"
	text_ram wPlayerTrademonSpeciesName
	text_start
	line "de @"
	text_ram wPlayerTrademonSenderName
	text ","
	done

_OTSendsText::
	text_ram wOTTrademonSenderName
	text " envoie"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_WillTradeText::
	text_ram wOTTrademonSenderName
	text " va échan-"
	line "ger @"
	text_ram wOTTrademonSpeciesName
	text_end

	text_end ; unreferenced

_ForYourMonWillTradeText::
	text "contre @"
	text_ram wPlayerTrademonSpeciesName
	text_start
	line "de @"
	text_ram wPlayerTrademonSenderName
	text "."
	done

_MobilePlayerWillTradeMonText::
	text_ram wPlayerTrademonSenderName
	text " va échan-"
	line "ger @"
	text_ram wPlayerTrademonSpeciesName
	text_end

	text_end ; unreferenced

_MobileForPartnersMonText::
	text "contre @"
	text_ram wOTTrademonSpeciesName
	text_start
	line "de @"
	text_ram wOTTrademonSenderName
	text "."
	done

_MobilePlayersMonTradeText::
	text "Echange @"
	text_ram wPlayerTrademonSpeciesName
	text_start
	line "de @"
	text_ram wPlayerTrademonSenderName
	text "…"
	done

_MobileTakeGoodCareOfMonText::
	text "Prends soin de"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_MobilePlayersMonTrade2Text::
	text "Echange @"
	text_ram wPlayerTrademonSpeciesName
	text_start
	line "de @"
	text_ram wPlayerTrademonSenderName
	text "…"
	done

_MobileTakeGoodCareOfText::
	text "Prends soin de"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_MobileTradeCameBackText::
	text_ram wOTTrademonSpeciesName
	text_start
	line "revient!"
	done

; Oak's Pokémon Talk

_OPT_IntroText1::
	text_start
	line "LULA: CHRONIQUE"
	done

_OPT_IntroText2::
	text_start
	line "DU PROF.CHEN!"
	done

_OPT_IntroText3::
	text_start
	line "Avec moi, LULA!"
	done

_OPT_OakText1::
	text_start
	line "CHEN: @"
	text_ram wMonOrItemNameBuffer
	text_end

	text_end ; unreferenced

_OPT_OakText2::
	text_start
	line "est près de:"
	done

_OPT_OakText3::
	text_start
	line "@"
	text_ram wStringBuffer1
	text "."
	done

_OPT_MaryText1::
	text_start
	line "LULA: @"
	text_ram wStringBuffer1
	text_end

	text_end ; unreferenced

_OPT_SweetAdorablyText::
	text_start
	line "est adorable et"
	done

_OPT_WigglySlicklyText::
	text_start
	line "est mou et"
	done

_OPT_AptlyNamedText::
	text_start
	line "bien nommé et"
	done

_OPT_UndeniablyKindOfText::
	text_start
	line "est vraiment"
	done

_OPT_UnbearablyText::
	text_start
	line "est très"
	done

_OPT_WowImpressivelyText::
	text_start
	line "est super"
	done

_OPT_AlmostPoisonouslyText::
	text_start
	line "est toxique et"
	done

_OPT_SensuallyText::
	text_start
	line "est sensuel et"
	done

_OPT_MischievouslyText::
	text_start
	line "est vicieux et"
	done

_OPT_TopicallyText::
	text_start
	line "est célèbre et"
	done

_OPT_AddictivelyText::
	text_start
	line "est très"
	done

_OPT_LooksInWaterText::
	text_start
	line "dans l'eau est"
	done

_OPT_EvolutionMustBeText::
	text_start
	line "évolué est"
	done

_OPT_ProvocativelyText::
	text_start
	line "est provoquant et"
	done

_OPT_FlippedOutText::
	text_start
	line "est fou et"
	done

_OPT_HeartMeltinglyText::
	text_start
	line "est tellement"
	done

_OPT_CuteText::
	text_start
	line "mignon."
	done

_OPT_WeirdText::
	text_start
	line "bizarre."
	done

_OPT_PleasantText::
	text_start
	line "agréable."
	done

_OPT_BoldSortOfText::
	text_start
	line "courageux."
	done

_OPT_FrighteningText::
	text_start
	line "effrayant."
	done

_OPT_SuaveDebonairText::
	text_start
	line "rapide!"
	done

_OPT_PowerfulText::
	text_start
	line "puissant."
	done

_OPT_ExcitingText::
	text_start
	line "vigoureux."
	done

_OPT_GroovyText::
	text_start
	line "cool!"
	done

_OPT_InspiringText::
	text_start
	line "exaltant."
	done

_OPT_FriendlyText::
	text_start
	line "amical."
	done

_OPT_HotHotHotText::
	text_start
	line "chaud!"
	done

_OPT_StimulatingText::
	text_start
	line "stimulant."
	done

_OPT_GuardedText::
	text_start
	line "protégé."
	done

_OPT_LovelyText::
	text_start
	line "gracieux."
	done

_OPT_SpeedyText::
	text_start
	line "rapide."
	done

_OPT_PokemonChannelText::
	text "#MON"
	done

_PokedexShowText::
	text_start
	line "@"
	text_ram wStringBuffer1
	text_end

	text_end ; unreferenced

; Pokémon Music Channel / Pokémusic

_BenIntroText1::
	text_start
	line "BEN: ANTENNE"
	done

_BenIntroText2::
	text_start
	line "MUSIQUE PKMN!"
	done

_BenIntroText3::
	text_start
	line "C'est moi, DJ BEN!"
	done

_FernIntroText1::
	text_start
	line "SEB: #MUSIQUE!"
	done

_FernIntroText2::
	text_start
	line "Avec DJ SEB!"
	done

_BenFernText1::
	text_start
	line "Ce @"
	text_today
	text ","
	done

_BenFernText2A::
	text_start
	line "on s'écoute"
	done

_BenFernText2B::
	text_start
	line "on s'la donne avec"
	done

_BenFernText3A::
	text_start
	line "la fanfare PKMN!"
	done

_BenFernText3B::
	text_start
	line "la berceuse PKMN!"
	done

; Lucky Channel

_LC_Text1::
	text_start
	line "SAM: Yeah! Comment"
	done

_LC_Text2::
	text_start
	line "ça gaze les gars?"
	done

_LC_Text3::
	text_start
	line "Si t'as la pêche"
	done

_LC_Text4::
	text_start
	line "ou pas le moral,"
	done

_LC_Text5::
	text_start
	line "ne rate jamais le"
	done

_LC_Text6::
	text_start
	line "BON NUMERO!"
	done

_LC_Text7::
	text_start
	line "Cette semaine le"
	done

_LC_Text8::
	text_start
	line "No. est @"
	text_pause
	text_ram wStringBuffer1
	text "!"
	done

_LC_Text9::
	text_start
	line "Je répète..."
	done

_LC_Text10::
	text_start
	line "Gagne et va vite"
	done

_LC_Text11::
	text_start
	line "à la TOUR RADIO!"
	done

_LC_DragText1::
	text_start
	line "J'aime pas trop"
	done

_LC_DragText2::
	text_start
	line "répéter..."
	done

; Places and People

_PnP_Text1::
	text_start
	line "SOCIO FM!"
	done

_PnP_Text2::
	text_start
	line "Présenté par"
	done

_PnP_Text3::
	text_start
	line "moi, DJ PETRA!"
	done

_PnP_Text4::
	text_start
	line "@"
	text_ram wStringBuffer1
	text " @"
	text_ram wStringBuffer2
	text_end

	text_end ; unreferenced

_PnP_CuteText::
	text_start
	line "est adorable."
	done

_PnP_LazyText::
	text_start
	line "est cool."
	done

_PnP_HappyText::
	text_start
	line "est en joie."
	done

_PnP_NoisyText::
	text_start
	line "fait du bruit."
	done

_PnP_PrecociousText::
	text_start
	line "est calme."
	done

_PnP_BoldText::
	text_start
	line "est difficile."
	done

_PnP_PickyText::
	text_start
	line "est difficile!"
	done

_PnP_SortOfOKText::
	text_start
	line "est pas mal."
	done

_PnP_SoSoText::
	text_start
	line "est OK."
	done

_PnP_GreatText::
	text_start
	line "est super!"
	done

_PnP_MyTypeText::
	text_start
	line "est trop cool."
	done

_PnP_CoolText::
	text_start
	line "est cool, non?"
	done

_PnP_InspiringText::
	text_start
	line "est terrible!"
	done

_PnP_WeirdText::
	text_start
	line "est étrange."
	done

_PnP_RightForMeText::
	text_start
	line "est formidable."
	done

_PnP_OddText::
	text_start
	line "est bizarre!"
	done

_PnP_Text5::
	text_start
	line "@"
	text_ram wStringBuffer1
	text_end

	text_end ; unreferenced

_RocketRadioText1::
	text_start
	line "...Heu...on est"
	done

_RocketRadioText2::
	text_start
	line "la TEAM ROCKET!"
	done

_RocketRadioText3::
	text_start
	line "Après trois ans"
	done

_RocketRadioText4::
	text_start
	line "d'attente, on"
	done

_RocketRadioText5::
	text_start
	line "est de retour"
	done

_RocketRadioText6::
	text_start
	line "pour de bon!"
	done

_RocketRadioText7::
	text_start
	line "GIOVANNI! @"
	text_pause
	text "Chef!"
	done

_RocketRadioText8::
	text_start
	line "On a réussi!"
	done

_RocketRadioText9::
	text_start
	line "@"
	text_pause
	text "Où est notre chef?"
	done

_RocketRadioText10::
	text_start
	line "@"
	text_pause
	text "Il nous écoute?"
	done

_BuenaRadioText1::
	text_start
	line "BUENA: Ici BUENA!"
	done

_BuenaRadioText2::
	text_start
	line "Le mot de passe!"
	done

_BuenaRadioText3::
	text_start
	line "C'est..."
	done

_BuenaRadioText4::
	text_start
	line "@"
	text_ram wStringBuffer1
	text "!"
	done

_BuenaRadioText5::
	text_start
	line "Souvenez-vous en!"
	done

_BuenaRadioText6::
	text_start
	line "Je suis à la RADIO"
	done

_BuenaRadioText7::
	text_start
	line "de DOUBLONVILLE!"
	done

_BuenaRadioMidnightText1::
	text_start
	line "BUENA: Oh…"
	done

_BuenaRadioMidnightText2::
	text_start
	line "Il est minuit!"
	done

_BuenaRadioMidnightText3::
	text_start
	line "C'est la fin!"
	done

_BuenaRadioMidnightText4::
	text_start
	line "Merci d'avoir"
	done

_BuenaRadioMidnightText5::
	text_start
	line "écouté aujourd'hui"
	done

_BuenaRadioMidnightText6::
	text_start
	line "et allez au dodo!"
	done

_BuenaRadioMidnightText7::
	text_start
	line "C'était DJ BUENA"
	done

_BuenaRadioMidnightText8::
	text_start
	line "en direct!"
	done

_BuenaRadioMidnightText9::
	text_start
	line "Au revoir!"
	done

_BuenaRadioMidnightText10::
	text_start
	line "…"
	done

_BuenaOffTheAirText::
	text_start
	line ""
	done

_EnemyWithdrewText::
	text "<ENEMY>"
	line "retire"
	cont "@"
	text_ram wEnemyMonNickname
	text "!"
	prompt

_EnemyUsedOnText::
	text "<ENEMY>"
	line "utilise"
	cont "@"
	text_ram wMonOrItemNameBuffer
	text " sur"
	cont "@"
	text_ram wEnemyMonNickname
	text "!"
	prompt

_ThatCantBeUsedRightNowText:: ; unreferenced
	text "C'est inutilisable"
	line "pour l'instant."
	prompt

_ThatItemCantBePutInThePackText:: ; unreferenced
	text "Cet objet n'entre"
	line "pas dans le SAC."
	done

_TheItemWasPutInThePackText:: ; unreferenced
	text_ram wStringBuffer1
	text_start
	line "va dans le SAC."
	done

_RemainingTimeText:: ; unreferenced
	text "Temps restant"
	done

_YourMonsHPWasHealedText:: ; unreferenced
	text "PV du #MON"
	line "restaurés."
	prompt

_WarpingText:: ; unreferenced
	text "Téléportation..."
	done

_ChangeWhichNumberText:: ; unreferenced
	text "Quel chiffre doit"
	line "être modifié?"
	done

_WillYouPlayWithMonText:: ; unreferenced
	text "Jouer avec"
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

_YouNeedTwoMonForBreedingText:: ; unreferenced
	text "Il faut 2 #MON"
	line "pour l'élevage."
	prompt

_BreedingIsNotPossibleText:: ; unreferenced
	text "Elevage"
	line "impossible."
	prompt

_CompatibilityShouldTheyBreedText:: ; unreferenced
	text "L'entente est de"
	line "@"
	text_decimal wBreedingCompatibility, 1, 3
	text "."
	cont "Les accoupler?"
	done

_ThereIsNoEggText:: ; unreferenced
	text "Pas d'OEUF."
	line ""
	prompt

_ItsGoingToHatchText:: ; unreferenced
	text "Il va éclore!"
	prompt

_TestEventText:: ; unreferenced
	text "Tester"
	line "@"
	text_decimal wStringBuffer2, 1, 2
	text "?"
	done

_StartText:: ; unreferenced
	text "C'est parti!"
	done

_EndText:: ; unreferenced
	text "C'est fini!"
	done

_ForABoyText:: ; unreferenced
	text "Pour un garçon!"
	done

_ForAGirlText:: ; unreferenced
	text "Pour une fille!"
	done

_DoesntConcernABoyText:: ; unreferenced
	text "Ce n'est pas pour"
	line "un garçon!"
	done

_TheBoxIsFullText:: ; unreferenced
	text "BOITE pleine!"
	done

; Mobile Adapter

_NewCardArrivedText::
	text_start
	done

_PutCardInCardFolderText::
	text_start
	done

_CardWasListedText::
	text_start
	prompt

_StartingLinkText::
	text_start
	done

_LinkTerminatedText::
	text_start
	done

_ClosingLinkText::
	text_start
	done

_ClearTimeLimitText:: ; unreferenced
	text_start
	done

_TimeLimitWasClearedText:: ; unreferenced
	text_start
	done

_PickErrorPacketText:: ; unreferenced
	text_start
	done

_TradingMonForOTMonText::
	text "Echange @"
	text_ram wStringBuffer2
	text_start
	line "contre @"
	text_ram wStringBuffer1
	text "…"
	done

; Mobile Adapter End

_ObtainedTheVoltorbBadgeText:: ; unreferenced
	text "VOLTORBBADGE"
	line "obtenu!"
	done

_AskFloorElevatorText::
	text "Quel étage?"
	done

_BugCatchingContestTimeUpText::
	text "PRESENTATEUR: BIP!"

	para "Temps écoulé!"
	done

_BugCatchingContestIsOverText::
	text "PRESENTATEUR: Le"
	line "concours est fini!"
	done

_RepelWoreOffText::
	text "Effet du REPOUSSE"
	line "terminé."
	done

_PlayerFoundItemText::
	text "<PLAYER> trouve"
	line "@"
	text_ram wStringBuffer3
	text "."
	done

_ButNoSpaceText::
	text "Mais <PLAYER> n'a"
	line "plus de place..."
	done

_JustSawSomeRareMonText::
	text "J'ai vu un"
	line "@"
	text_ram wStringBuffer1
	text " rare"
	cont "vers @"
	text_ram wStringBuffer2
	text "."

	para "Je t'appelle si je"
	line "vois un autre"
	cont "#MON rare, OK?"
	prompt

_SavingRecordText::
	text "SAUVEGARDE..."
	line "NE PAS ETEINDRE!"
	done

_ReceiveItemText::
	text_ram wPlayerName
	text " reçoit"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	sound_item
	text_promptbutton
	text_end

	text_end ; unreferenced

_NoCoinsText::
	text "Vous n'avez pas de"
	line "jetons."
	prompt

_NoCoinCaseText::
	text "Vous n'avez pas de"
	line "BOITE JETON."
	prompt

_NPCTradeCableText::
	text "OK, connectez le"
	line "Câble Game Link."
	prompt

Text_NPCTraded::
	text "<PLAYER> échange"
	line "@"
	text_ram wStringBuffer2
	text " contre"
	cont "@"
	text_ram wMonOrItemNameBuffer
	text ".@"
	text_end

_NPCTradeFanfareText::
	sound_dex_fanfare_80_109
	text_pause
	text_end

	text_end ; unreferenced

_NPCTradeIntroText1::
	text "Je collectionne"
	line "les #MON. As-tu"
	cont "@"
	text_ram wStringBuffer1
	text "?"

	para "Tu veux l'échanger"
	line "contre @"
	text_ram wStringBuffer2
	text "?"
	done

_NPCTradeCancelText1::
	text "Pas d'échange?"
	line "Maiiiiiis!!!"
	done

_NPCTradeWrongText1::
	text "Hein? C'est pas"
	line "@"
	text_ram wStringBuffer1
	text ". "
	cont "Tu plaisantes...?"
	done

_NPCTradeCompleteText1::
	text "Ouais! J'ai un"
	line "@"
	text_ram wStringBuffer1
	text "!"
	cont "Cool!"
	done

_NPCTradeAfterText1::
	text "Comment va mon"
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

_NPCTradeIntroText2::
	text "Salut! Je cherche"
	line "ce #MON."

	para "Si tu as"
	line "@"
	text_ram wStringBuffer1
	text ","

	para "peux-tu l'échanger"
	line "contre @"
	text_ram wStringBuffer2
	text "?"
	done

_NPCTradeCancelText2::
	text "T'en as pas non"
	line "plus?"

	para "Pfff...."
	line "Et zut..."
	done

_NPCTradeWrongText2::
	text "Tu n'as pas"
	line "@"
	text_ram wStringBuffer1
	text "?"
	cont "C'est dommage."
	done

_NPCTradeCompleteText2::
	text "Cool! Merci!"

	para "J'ai enfin"
	line "@"
	text_ram wStringBuffer1
	text "."
	done

_NPCTradeAfterText2::
	text "Salut! @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "est en pleine for-"
	cont "me! Merci encore!"
	done

_NPCTradeIntroText3::
	text_ram wMonOrItemNameBuffer
	text " est"
	line "mignon mais je"

	para "l'ai pas. Toi t'as"
	line "@"
	text_ram wStringBuffer1
	text "?"

	para "Tu veux l'échanger"
	line "contre @"
	text_ram wStringBuffer2
	text "?"
	done

_NPCTradeCancelText3::
	text "Tu veux pas échan-"
	line "ger? Bah mince..."
	done

_NPCTradeWrongText3::
	text "C'est pas"
	line "@"
	text_ram wStringBuffer1
	text "."

	para "Amène-m'en un, par"
	line "pitié!!!"
	done

_NPCTradeCompleteText3::
	text "Woah! Merci!"
	line "Je voulais tant un"
	cont "@"
	text_ram wMonOrItemNameBuffer
	text "!"
	done

_NPCTradeAfterText3::
	text "Comment va mon"
	line "@"
	text_ram wStringBuffer2
	text "?"
	cont "Toujours la pêche?"

	para "Ton @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "est si mignon!"
	done

_NPCTradeCompleteText4::
	text "Bah alors?"
	done

_NPCTradeAfterText4::
	text "Echanger c'est"
	line "trop bizarre..."

	para "J'ai beaucoup à"
	line "apprendre."
	done

_MomLeavingText1::
	text "Oh! Quel joli"
	line "#MON."

	para "Où l'as-tu trouvé?"
	line "Hein? Où ça?"

	para "........."

	para "Alors t'aimes"
	line "l'aventure, quoi."

	para "OK!"
	line "J'vais t'aider."

	para "Mais..."
	line "Que faire?"

	para "Je sais! Je vais"
	line "économiser pour"
	cont "toi."

	para "L'argent, c'est"
	line "important."

	para "Veux-tu que j'éco-"
	line "nomise pour toi?"
	done

_MomLeavingText2::
	text "OK, je vais m'oc-"
	line "cuper de tes sous."

	para ".................."
	prompt

_MomLeavingText3::
	text "Fais attention."

	para "Les #MON sont"
	line "tes amis. Il faut"
	cont "les aimer aussi."

	para "En route!"
	done

_MomIsThisAboutYourMoneyText::
	text "Bienvenue!"
	line "Tu fais des"
	cont "efforts... C'est"
	cont "dur l'aventure!"

	para "J'ai rangé ta"
	line "chambre."

	para "Est-ce à propos"
	line "de l'argent?"
	done

_MomBankWhatDoYouWantToDoText::
	text "Que veux-tu"
	line "faire?"
	done

_MomStoreMoneyText::
	text "Combien veux-tu"
	line "économiser?"
	done

_MomTakeMoneyText::
	text "Combien veux-tu"
	line "prendre?"
	done

_MomSaveMoneyText::
	text "Veux-tu économiser"
	line "de l'argent?"
	done

_MomHaventSavedThatMuchText::
	text "Tu n'as pas écono-"
	line "misé autant."
	prompt

_MomNotEnoughRoomInWalletText::
	text "Tu ne peux en"
	line "prendre autant."
	prompt

_MomInsufficientFundsInWalletText::
	text "Tu n'en as pas"
	line "autant."
	prompt

_MomNotEnoughRoomInBankText::
	text "Tu ne peux en"
	line "économiser autant."
	prompt

_MomStartSavingMoneyText::
	text "OK, je vais écono-"
	line "miser ton argent."
	cont "Aie confiance!"

	para "<PLAYER>,"
	line "tiens bon!"
	done

_MomStoredMoneyText::
	text "Je m'occupe de tes"
	line "sous! Va!"
	done

_MomTakenMoneyText::
	text "<PLAYER>,"
	line "courage!"
	done

_MomJustDoWhatYouCanText::
	text "Fais de ton"
	line "mieux."
	done

_DaycareDummyText::
	text_start
	done

_DayCareManIntroText::
	text "Je m'occupe de la"
	line "PENSION. Veux-tu"
	cont "que j'entraîne un"
	cont "#MON?"
	done

_DayCareManIntroEggText::
	text "Je m'occupe de la"
	line "PENSION. Connais-"
	cont "tu les OEUFS?"

	para "J'élevais des"
	line "#MON avec"
	cont "ma femme et..."

	para "Surprise! On a"
	line "trouvé un OEUF!"

	para "C'est super dingue"
	line "comme truc!"

	para "Alors tu veux que"
	line "j'entraîne un"
	cont "#MON?"
	done

_DayCareLadyIntroText::
	text "Je suis la femme"
	line "du type qui"
	cont "s'occupe de la"
	cont "PENSION."

	para "Veux-tu que"
	line "j'entraîne un"
	cont "#MON?"
	done

_DayCareLadyIntroEggText::
	text "Je suis la femme"
	line "du type qui"
	cont "s'occupe de la"
	cont "PENSION. Connais-"
	cont "tu les OEUFS?"

	para "J'élevais des"
	line "#MON avec"
	cont "mon mari et..."

	para "Surprise! On a"
	line "trouvé un OEUF!"

	para "C'est super dingue"
	line "comme truc!"

	para "Alors tu veux que"
	line "j'entraîne un"
	cont "#MON?"
	done

_WhatShouldIRaiseText::
	text "Qui veux-tu que"
	line "j'entraîne?"
	prompt

_OnlyOneMonText::
	text "Oh? Mais tu n'as"
	line "qu'un #MON."
	prompt

_CantAcceptEggText::
	text "Ah... Je n'accepte"
	line "pas les OEUFS."
	prompt

_RemoveMailText::
	text "Enlève les LETTRES"
	line "avant de me voir."
	prompt

_LastHealthyMonText::
	text "Si tu me le donnes"
	line "qui va combattre"
	cont "pour toi?"
	prompt

_IllRaiseYourMonText::
	text "Entendu. Je vais"
	line "entraîner ton"
	cont "@"
	text_ram wStringBuffer1
	text "."
	prompt

_ComeBackLaterText::
	text "Reviens le prendre"
	line "plus tard."
	done

_AreWeGeniusesText::
	text "On est trop bon!"
	line "Tu veux voir"
	cont "ton @"
	text_ram wStringBuffer1
	text "?"
	done

_YourMonHasGrownText::
	text "Ton @"
	text_ram wStringBuffer1
	text_start
	line "a bien grandi."

	para "Il a gagné"
	line "@"
	text_decimal wStringBuffer2 + 1, 1, 3
	text " niveau(x)."

	para "Si tu veux récupé-"
	line "rer ton #MON,"
	cont "tu dois payer"
	cont "@"
	text_decimal wStringBuffer2 + 2, 3, 4
	text "¥."
	done

_PerfectHeresYourMonText::
	text "Parfait! Voilà"
	line "ton #MON."
	prompt

_GotBackMonText::
	text "<PLAYER> récupère"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_BackAlreadyText::
	text "Hein? Déjà?"
	line "Ton @"
	text_ram wStringBuffer1
	text_start
	para "a besoin de plus"
	line "de temps! Pour"

	para "récupérer ton"
	line "#MON, tu dois"
	cont "payer 100¥."
	done

_HaveNoRoomText::
	text "Tu n'as pas de"
	line "place."
	prompt

_NotEnoughMoneyText::
	text "Tu n'as pas assez"
	line "d'argent."
	prompt

_OhFineThenText::
	text "Très bien."
	prompt

_ComeAgainText::
	text "A bientôt."
	done

_NotYetText::
	text "Pas encore..."
	done

_FoundAnEggText::
	text "Ah, c'est toi!"

	para "On entraînait ton"
	line "#MON, et..."
	cont "Surprise totale!"

	para "Ton #MON a"
	line "pondu un OEUF!"

	para "On sait pas trop"
	line "comment mais..."

	para "Il est là en tout"
	line "cas. Tu le veux?"
	done

_ReceivedEggText::
	text "<PLAYER> reçoit"
	line "l'OEUF!"
	done

_TakeGoodCareOfEggText::
	text "Prends-en soin!"
	done

_IllKeepItThanksText::
	text "Bon ben..."
	line "J'le garde. Merci!"
	done

_NoRoomForEggText::
	text "Tu n'as pas de"
	line "place dans ton"
	cont "équipe..."
	done

_WhichMonPhotoText::
	text "Quel #MON"
	line "dois-je photogra-"
	cont "phier?"
	prompt

_HoldStillText::
	text "Parfait. Parfait."
	line "On ne bouge plus."
	prompt

_PrestoAllDoneText::
	text "Fini! Terminé!"
	line "A bientôt!"
	done
