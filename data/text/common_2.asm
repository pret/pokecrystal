_NoPhotoText::
	text "Pas de photo?"
	line "A plus tard!"
	done

_EggPhotoText::
	text "Un OEUF? Je peux"
	line "pas faire de l'art"
	cont "avec ça..."
	done

_NameRaterHelloText::
	text "B'jour! Je suis le"
	line "SPECIALISTE des"

	para "NOMS. Je donne mon"
	line "avis sur les noms"
	cont "des #MON."

	para "Veux-tu que je te"
	line "donne mon avis sur"
	cont "tes noms?"
	done

_NameRaterWhichMonText::
	text "Le nom de quel"
	line "#MON veux-tu"
	cont "que j'étudie?"
	prompt

_NameRaterBetterNameText::
	text "Hmm... @"
	text_ram wStringBuffer1
	text "."
	line "C'est un nom"
	cont "ma foi correct."

	para "Mais pourquoi ne"
	line "pas lui donner"
	cont "plus de pêche?"

	para "Veux-tu lui donner"
	line "un autre nom?"
	done

_NameRaterWhatNameText::
	text "OK. Comment"
	line "allons-nous le"
	cont "nommer?"
	prompt

_NameRaterFinishedText::
	text "C'est bien mieux"
	line "qu'avant!"

	para "Bien joué!"
	done

_NameRaterComeAgainText::
	text "OK. Reviens une"
	line "autre fois."
	done

_NameRaterPerfectNameText::
	text "Hmm... @"
	text_ram wStringBuffer1
	text "?"
	line "C'est un super"
	cont "nom! Terrible!"

	para "Prends bien soin"
	line "de @"
	text_ram wStringBuffer1
	text "."
	done

_NameRaterEggText::
	text "Whoa! C'est juste"
	line "un OEUF."
	done

_NameRaterSameNameText::
	text "Ca ressemble un"
	line "peu à l'ancien..."

	para "Mais c'est mieux"
	line "qu'avant!"

	para "Bien joué!"
	done

_NameRaterNamedText::
	text "Parfait. Ce"
	line "#MON s'appelle"
	cont "donc @"
	text_ram wStringBuffer1
	text "."
	prompt

Text_Gained::
	text_ram wStringBuffer1
	text " gagne@"
	text_end

_BoostedExpPointsText::
; BUG: Five-digit experience gain is printed incorrectly (see docs/bugs_and_glitches.md)
	text_start
	line "un bonus de"
	cont "@"
	text_decimal wStringBuffer2, 2, 4
	text " Points EXP!"
	prompt

_ExpPointsText::
; BUG: Five-digit experience gain is printed incorrectly (see docs/bugs_and_glitches.md)
	text_start
	line "@"
	text_decimal wStringBuffer2, 2, 4
	text " Points EXP!"
	prompt

_GoMonText::
	text_ram wBattleMonNickname
	text "! Go!@"
	text_end

_DoItMonText::
	text_ram wBattleMonNickname
	text "! Fonce!@"
	text_end

_GoForItMonText::
	text "En avant,"
	line "@"
	text_ram wBattleMonNickname
	text "!@"
	text_end

_YourFoesWeakGetmMonText::
	text "Attaque,"
	line "@"
	text_ram wBattleMonNickname
	text "!@"
	text_end

_BattleMonNicknameText::
	text_start
	done

_BattleMonNickCommaText::
	text_ram wBattleMonNickname
	text ",@"
	text_end

_ThatsEnoughComeBackText::
	text_start
	line "reviens!@"
	text_end

_OKComeBackText::
	text_start
	line "ça suffit!@"
	text_end

_GoodComeBackText::
	text_start
	line "reviens!@"
	text_end

_ComeBackText::
	text_start
	line "reviens!"
	done

_BootedTMText::
	text "CT activée."
	prompt

_BootedHMText::
	text "CS activée."
	prompt

_ContainedMoveText::
	text "Elle contient"
	line "@"
	text_ram wStringBuffer2
	text "."

	para "Apprendre"
	line "@"
	text_ram wStringBuffer2
	text_start
	cont "à un #MON?"
	done

_TMHMNotCompatibleText::
	text_ram wStringBuffer2
	text " n'est"
	line "pas compatible"
	cont "avec @"
	text_ram wStringBuffer1
	text "."

	para "Il ne peut pas"
	line "apprendre"
	cont "@"
	text_ram wStringBuffer2
	text "."
	prompt

_NoRoomTMHMText::
	text "Plus de place"
	line "pour:"
	cont "@"
	text_ram wStringBuffer1
	text "."
	prompt

_ReceivedTMHMText::
	text "Vous obtenez"
	line "@"
	text_ram wStringBuffer1
	text "!"
	prompt

_MysteryGiftCanceledText::
	text "La connexion a"
	line "été perdue."
	prompt

_MysteryGiftCommErrorText::
	text "Erreur"
	line "communication."
	prompt

_RetrieveMysteryGiftText::
	text "CADEAU à récupérer"
	line "au CENTRE #MON."
	prompt

_YourFriendIsNotReadyText::
	text "Votre ami(e) n'est"
	line "pas prêt(e)."
	prompt

_MysteryGiftFiveADayText::
	text "Seulement 5"
	line "CADEAUX par jour."
	prompt

_MysteryGiftOneADayText::
	text "Seulement 1 CADEAU"
	line "par jour et par"
	cont "personne."
	prompt

_MysteryGiftSentText::
	text_ram wMysteryGiftPartnerName
	text " envoie"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_MysteryGiftSentHomeText::
	text_ram wMysteryGiftPartnerName
	text " envoie"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "chez @"
	text_ram wMysteryGiftPlayerName
	text "."
	prompt

_NameCardReceivedCardText::
	text_start
	prompt

_NameCardListedCardText::
	text_start
	prompt

_NameCardNotRegisteredCardText::
	text_start
	prompt

_NameCardLinkCancelledText::
	text "La connexion a"
	line "été perdue."
	prompt

_NameCardLinkCommErrorText::
	text "Erreur"
	line "communication."
	prompt

_BadgeRequiredText::
	text "Un BADGE est"
	line "requis."
	prompt

_CantUseItemText::
	text "Impossible d'uti-"
	line "liser ça ici."
	prompt

_UseCutText::
	text_ram wStringBuffer2
	text_start
	line "lance COUPE!"
	prompt

_CutNothingText::
	text "Il n'y a rien"
	line "à COUPER ici."
	prompt

_BlindingFlashText::
	text "Un FLASH illumine"
	line "les environs!@"
	text_promptbutton
	text_end

	text_end ; unreferenced

_UsedSurfText::
	text_ram wStringBuffer2
	text_start
	line "lance SURF!"
	done

_CantSurfText::
	text "On ne peut pas"
	line "SURFER ici."
	prompt

_AlreadySurfingText::
	text "Vous êtes déjà en"
	line "train de SURFER!"
	prompt

_AskSurfText::
	text "L'eau est calme..."
	line "Un coup de SURF?"
	done

_UseWaterfallText::
	text_ram wStringBuffer2
	text_start
	line "lance CASCADE!"
	done

_HugeWaterfallText::
	text "Oh! Une énorme"
	line "cascade."
	done

_AskWaterfallText::
	text "Voulez-vous uti-"
	line "liser CASCADE?"
	done

_UseDigText::
	text_ram wStringBuffer2
	text_start
	line "lance TUNNEL!"
	done

_UseEscapeRopeText::
	text "<PLAYER> utilise"
	line "une CORDE SORTIE."
	done

_CantUseDigText::
	text "Impossible d'uti-"
	line "liser ça ici."
	done

_TeleportReturnText::
	text "Retour au dernier"
	line "CENTRE #MON."
	done

_CantUseTeleportText::
	text "Impossible d'uti-"
	line "liser ça ici."
	prompt

_AlreadyUsingStrengthText::
	text "Un #MON utilise"
	line "déjà FORCE."
	prompt

_UseStrengthText::
	text_ram wStringBuffer2
	text_start
	line "lance FORCE!"
	done

_MoveBoulderText::
	text_ram wStringBuffer1
	text " peut"
	line "déplacer les"
	cont "rochers."
	prompt

_AskStrengthText::
	text "Un #MON peut"
	line "déplacer ça."

	para "Voulez-vous utili-"
	line "ser FORCE?"
	done

_BouldersMoveText::
	text "Les rochers peu-"
	line "vent être mainte-"
	cont "nant déplacés!"
	done

_BouldersMayMoveText::
	text "Un #MON peut"
	line "déplacer ceci."
	done

_UseWhirlpoolText::
	text_ram wStringBuffer2
	text_start
	line "lance SIPHON!"
	prompt

_MayPassWhirlpoolText::
	text "C'est un terrible"
	line "siphon!"

	para "Un #MON peut"
	line "le traverser."
	done

_AskWhirlpoolText::
	text "Un siphon est sur"
	line "la route."

	para "Lancer"
	line "SIPHON?"
	done

_UseHeadbuttText::
	text_ram wStringBuffer2
	text " donne"
	line "un COUP D'BOULE!"
	prompt

_HeadbuttNothingText::
	text "Non. Rien..."
	done

_AskHeadbuttText::
	text "Un #MON peut"
	line "être dans l'arbre."

	para "Voulez-vous donner"
	line "un COUP D'BOULE?"
	done

_UseRockSmashText::
	text_ram wStringBuffer2
	text_start
	line "lance ECLATE-ROC!"
	prompt

_MaySmashText::
	text "Un #MON peut"
	line "le briser."
	done

_AskRockSmashText::
	text "Ce rocher a l'air"
	line "cassable."

	para "Voulez-vous utili-"
	line "ser ECLATE-ROC?"
	done

_RodBiteText::
	text "Oh!"
	line "Ca mord!"
	prompt

_RodNothingText::
	text "Rien du tout!"
	prompt

_UnusedNothingHereText::
	text "Il n'y a rien"
	line "dans le coin."
	prompt

_CantGetOffBikeText::
	text "Vous ne pouvez"
	line "pas descendre ici!"
	done

_GotOnBikeText::
	text "<PLAYER> monte sur:"
	line "@"
	text_ram wStringBuffer2
	text "."
	done

_GotOffBikeText::
	text "<PLAYER> descend"
	line "de: @"
	text_ram wStringBuffer2
	text "."
	done

_AskCutText::
	text "Cet arbre peut"
	line "être COUPE!"

	para "Lancer COUPE?"
	done

_CanCutText::
	text "Cet arbre peut"
	line "être COUPE!"
	done

_FoundItemText::
	text "<PLAYER> trouve"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_CantCarryItemText::
	text "Mais <PLAYER> ne"
	line "peut plus rien"
	cont "porter!"
	done

_WhitedOutText::
	text "<PLAYER> n'a plus"
	line "de #MON en"
	cont "forme!"

	para "<PLAYER> est"
	line "hors-jeu!"
	done

_ItemfinderItemNearbyText::
	text "Le CHERCH'OBJET"
	line "indique la présen-"
	cont "ce d'un objet!"
	prompt

_ItemfinderNopeText::
	text "Le CHERCH'OBJET"
	line "n'a rien trouvé..."
	cont "Dommage!"
	prompt

_PoisonFaintText::
	text_ram wStringBuffer3
	text_start
	line "est K.O!"
	prompt

_PoisonWhiteoutText::
	text "<PLAYER> n'a plus"
	line "de #MON en"
	cont "forme!"

	para "<PLAYER> est"
	line "hors-jeu!"
	prompt

_UseSweetScentText::
	text_ram wStringBuffer3
	text_start
	line "lance DOUX PARFUM!"
	done

_SweetScentNothingText::
	text "Il n'y a rien"
	line "dans le coin..."
	done

_SquirtbottleNothingText::
	text "<PLAYER> fait"
	line "jaillir de l'eau."

	para "Mais rien ne"
	line "se passe..."
	done

_UseSacredAshText::
	text "Les #MON de"
	line "<PLAYER> sont tous"
	cont "soignés!"
	done

_AnEggCantHoldAnItemText::
	text "Un OEUF ne peut"
	line "rien porter."
	prompt

_PackNoItemText::
	text "Aucun objet."
	done

_AskThrowAwayText::
	text "En jeter"
	line "combien?"
	done

_AskQuantityThrowAwayText::
	text "Jeter @"
	text_decimal wItemQuantityChange, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

_ThrewAwayText::
	text_ram wStringBuffer2
	text_start
	line "à la poubelle!"
	prompt

_OakThisIsntTheTimeText::
	text "CHEN: <PLAYER>!"
	line "Ce n'est pas le"
	cont "moment d'utiliser"
	cont "ce truc!"
	prompt

_YouDontHaveAMonText::
	text "Vous n'avez pas"
	line "de #MON!"
	prompt

_RegisteredItemText::
	text_ram wStringBuffer2
	text_start
	line "enregistré(e)."
	prompt

_CantRegisterText::
	text "On ne peut enre-"
	line "gistrer cet objet."
	prompt

_AskItemMoveText::
	text "Où déplacer"
	line "ceci?"
	done

_PackEmptyText::
	text_start
	done

_YouCantUseItInABattleText::
	text "C'est inutilisable"
	line "en combat."
	prompt

_AreYouABoyOrAreYouAGirlText::
	text "Etes-vous un gar-"
	line "çon ou une fille?"
	done

Text_BattleEffectActivate::
	text_ram wStringBuffer2
	text " de"
	line "<USER>@"
	text_end

_BattleStatWentWayUpText::
	text_pause
	text "<SCROLL>monte à fond!"
	prompt

_BattleStatWentUpText::
	text_start
	cont "augmente!"
	prompt

Text_BattleFoeEffectActivate::
	text_ram wStringBuffer2
	text " de"
	line "<TARGET>@"
	text_end

_BattleStatSharplyFellText::
	text_pause
	text "<SCROLL>diminue à fond!"
	prompt

_BattleStatFellText::
	text_start
	cont "diminue!"
	prompt

Text_BattleUser::
	text "<USER>@"
	text_end

_BattleMadeWhirlwindText::
	text_start
	line "crée un cyclone!"
	prompt

_BattleTookSunlightText::
	text_start
	line "rayonne!"
	prompt

_BattleLoweredHeadText::
	text_start
	line "baisse la tête!"
	prompt

_BattleGlowingText::
	text_start
	line "brille!"
	prompt

_BattleFlewText::
	text_start
	line "s'envole!"
	prompt

_BattleDugText::
	text_start
	line "creuse un trou!"
	prompt

_ActorNameText::
	text "<USER>@"
	text_end

_UsedMove1Text::
	text_start
	line "lance"
	cont "@"
	text_end

_UsedMove2Text::
	text_start
	line "lance"
	cont "@"
	text_end

_UsedInsteadText::
	text "à la place,"
	cont "@"
	text_end

_MoveNameText::
	text_ram wStringBuffer2
	text_end

	text_end ; unreferenced

_EndUsedMove1Text::
	text "!"
	done

_EndUsedMove2Text::
	text "!"
	done

_EndUsedMove3Text::
	text "!"
	done

_EndUsedMove4Text::
	text "!"
	done

_EndUsedMove5Text::
	text "!"
	done

Text_BreedHuh::
	text "Hein?"

	para "@"
	text_end

_BreedClearboxText::
	text_start
	done

_BreedEggHatchText::
	text_ram wStringBuffer1
	text " sort"
	line "de son OEUF!@"
	sound_caught_mon
	text_promptbutton
	text_end

	text_end ; unreferenced

_BreedAskNicknameText::
	text "Donner un surnom"
	line "à @"
	text_ram wStringBuffer1
	text "?"
	done

_LeftWithDayCareLadyText::
	text "C'est @"
	text_ram wBreedMon2Nickname
	text_start
	line "qui a été laissé"
	cont "chez la dame de la"
	cont "PENSION."
	done

_LeftWithDayCareManText::
	text "C'est @"
	text_ram wBreedMon1Nickname
	text_start
	line "qui a été laissé"
	cont "chez l'homme de la"
	cont "PENSION."
	done

_BreedBrimmingWithEnergyText::
	text "Il déborde"
	line "d'énergie."
	prompt

_BreedNoInterestText::
	text "Il se fiche de"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_BreedAppearsToCareForText::
	text "Il aime bien"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_BreedFriendlyText::
	text "Il est amical avec"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_BreedShowsInterestText::
	text "Il s'intéresse à"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_EmptyMailboxText::
	text "Il n'y a pas de"
	line "LETTRE ici."
	prompt

_MailClearedPutAwayText::
	text "Le COURRIER a été"
	line "rangé."
	prompt

_MailPackFullText::
	text "Le SAC est plein."
	prompt

_MailMessageLostText::
	text "Le message de la"
	line "LETTRE sera perdu."
	cont "OK?"
	done

_MailAlreadyHoldingItemText::
	text "Il porte déjà"
	line "un objet."
	prompt

_MailEggText::
	text "Un OEUF ne peut"
	line "porter une LETTRE!"
	prompt

_MailMovedFromBoxText::
	text "Cette LETTRE vient"
	line "de la BOITE AUX"
	cont "LETTRES."
	prompt

_YesPromptText:: ; unreferenced
	text "Oui"
	prompt

_NoPromptText:: ; unreferenced
	text "Non"
	prompt

_AnimationTypeText:: ; unreferenced
	text_decimal wcf64, 1, 3
	text " @"
	text_ram wStringBuffer1
	text_start
	line "Type animation @"
	text_ram wStringBuffer2
	text_end

	text_end ; unreferenced

_MonNumberText:: ; unreferenced
	text "Numéro #MON?"
	done

_WasSentToBillsPCText::
	text_ram wStringBuffer1
	text_start
	line "va au PC de LEO."
	prompt

_PCGottaHavePokemonText::
	text "Il faut des"
	line "#MON à appeler!"
	prompt

_PCWhatText::
	text "Que faire?"
	done

_PCMonHoldingMailText::
	text "Il y a un #MON"
	line "tenant une LETTRE."

	para "Enlevez la LETTRE"
	line "s'il vous plaît."
	prompt

_PCNoSingleMonText::
	text "Vous n'avez aucun"
	line "#MON!"
	prompt

_PCCantDepositLastMonText::
	text "Vous ne pouvez"
	line "déposer le dernier"
	cont "#MON!"
	prompt

_PCCantTakeText::
	text "Vous ne pouvez"
	line "prendre plus de"
	cont "#MON."
	prompt

_ContestCaughtMonText::
	text_ram wStringBuffer1
	text_start
	line "capturé!"
	prompt

_ContestAskSwitchText::
	text "Changer de"
	line "#MON?"
	done

_ContestAlreadyCaughtText::
	text "Vous avez déjà"
	line "un @"
	text_ram wStringBuffer1
	text "."
	prompt

_ContestJudging_FirstPlaceText::
	text "Le gagnant du"
	line "Concours de"
	cont "Capture est@"
	text_pause
	text "..."

	para "@"
	text_ram wBugContestWinnerName
	text ","
	line "qui a capturé un"
	cont "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

_ContestJudging_FirstPlaceScoreText::
	text_start

	para "Le score gagnant"
	line "est de @"
	text_decimal wBugContestFirstPlaceScore, 2, 3
	text " pts!"
	prompt

_ContestJudging_SecondPlaceText::
	text "En deuxième place:"
	line "@"
	text_ram wBugContestWinnerName
	text ","

	para "qui a capturé un"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

_ContestJudging_SecondPlaceScoreText::
	text_start

	para "Le score est de"
	line "@"
	text_decimal wBugContestSecondPlaceScore, 2, 3
	text " points!"
	prompt

_ContestJudging_ThirdPlaceText::
	text "En troisième:"
	line "@"
	text_ram wBugContestWinnerName
	text ","

	para "qui a capturé un"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

_ContestJudging_ThirdPlaceScoreText::
	text_start

	para "Le score est de"
	line "@"
	text_decimal wBugContestThirdPlaceScore, 2, 3
	text " points!"
	prompt

_MagikarpGuruMeasureText::
	text "Je vais mesurer"
	line "ce MAGICARPE."

	para "Hmm... Il mesure"
	line "@"
	text_ram wStringBuffer1
	text "cm."
	prompt

_KarpGuruRecordText::
	text "RECORD ACTUEL"

	para "@"
	text_ram wStringBuffer1
	text "cm par"
	line "@"
	text_ram wMagikarpRecordHoldersName
	text_promptbutton
	text_end

	text_end ; unreferenced

_LuckyNumberMatchPartyText::
	text "Félicitations!"

	para "Le No. ID de votre"
	line "@"
	text_ram wStringBuffer1
	text " dans"

	para "votre équipe"
	line "correspond."
	prompt

_LuckyNumberMatchPCText::
	text "Félicitations!"

	para "Le No. ID de votre"
	line "@"
	text_ram wStringBuffer1
	text " dans"

	para "votre BOITE PC"
	line "correspond."
	prompt

_CaughtAskNicknameText::
	text "Donner un surnom"
	line "au @"
	text_ram wStringBuffer1
	text_start
	cont "reçu?"
	done

_PokecenterPCCantUseText::
	text "Bzzzzt! Il faut un"
	line "#MON pour"
	cont "utiliser ça!"
	prompt

_PlayersPCTurnOnText::
	text "<PLAYER> allume"
	line "le PC."
	prompt

_PlayersPCAskWhatDoText::
	text "Que voulez-vous"
	line "faire?"
	done

_PlayersPCHowManyWithdrawText::
	text "Combien voulez-"
	line "vous en retirer?"
	done

_PlayersPCWithdrewItemsText::
	text "Retiré @"
	text_decimal wItemQuantityChange, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_PlayersPCNoRoomWithdrawText::
	text "Pas de place pour"
	line "plus d'objets."
	prompt

_PlayersPCNoItemsText::
	text "Pas d'objets ici!"
	prompt

_PlayersPCHowManyDepositText::
	text "Combien voulez-"
	line "vous en déposer?"
	done

_PlayersPCDepositItemsText::
	text "Déposé @"
	text_decimal wItemQuantityChange, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_PlayersPCNoRoomDepositText::
	text "Plus de place pour"
	line "garder des objets."
	prompt

_PokecenterPCTurnOnText::
	text "<PLAYER> allume"
	line "le PC."
	prompt

_PokecenterPCWhoseText::
	text "Accéder à quel PC?"
	done

_PokecenterBillsPCText::
	text "PC de LEO"
	line "connecté."

	para "Gestion Stocks"
	line "de #MON."
	prompt

_PokecenterPlayersPCText::
	text "PC personnel"
	line "connecté."

	para "Gestion Stocks"
	line "d'objets."
	prompt

_PokecenterOaksPCText::
	text "PC du PROF.CHEN"
	line "connecté."

	para "Evaluation du"
	line "#DEX."
	prompt

_PokecenterPCOaksClosedText::
	text "..."
	line "Déconnexion..."
	done

_OakPCText1::
	text "Veux-tu que j'éva-"
	line "lue ton #DEX?"
	done

_OakPCText2::
	text "Niveau #DEX"
	line "actuel:"
	prompt

_OakPCText3::
	text_ram wStringBuffer3
	text " #MON vus"
	line "@"
	text_ram wStringBuffer4
	text " #MON pris"

	para "Evaluation"
	line "PROF.CHEN:"
	done

_OakRating01::
	text "Cherche des #-"
	line "MON dans les"
	cont "hautes herbes!"
	done

_OakRating02::
	text "Bien. Je vois que"
	line "tu sais te servir"
	cont "des # BALLS."
	done

_OakRating03::
	text "Tu t'améliores"
	line "mais il te reste"

	para "beaucoup de choses"
	line "à découvrir."
	done

_OakRating04::
	text "Tu dois remplir"
	line "ton #DEX."

	para "Attrape plusieurs"
	line "types de #MON!"
	done

_OakRating05::
	text "Tu te donnes du"
	line "mal, ça se voit."

	para "Ton #DEX se"
	line "remplit doucement."
	done

_OakRating06::
	text "Certains #MON"
	line "évoluent seuls,"

	para "d'autres ont be-"
	line "soin de PIERRES."
	done

_OakRating07::
	text "Est-ce que tu as"
	line "une CANNE? Tu"

	para "peux pêcher des"
	line "#MON!"
	done

_OakRating08::
	text "Super! Tu aimes"
	line "collectionner"
	cont "des trucs, hein?"
	done

_OakRating09::
	text "Certains #MON"
	line "n'apparaissent"

	para "qu'à certains"
	line "moments de la"
	cont "journée."
	done

_OakRating10::
	text "Ton #DEX se"
	line "remplit. C'est"
	cont "bien!"
	done

_OakRating11::
	text "Impressionnant!"
	line "Tu fais évoluer"

	para "tes #MON!"
	line "Bravo!"
	done

_OakRating12::
	text "Tu connais"
	line "FARGAS? Il fabri-"
	cont "que des BALLS!"
	done

_OakRating13::
	text "Oh! Tu as trouvé"
	line "plus de #MON"

	para "qu'au dernier"
	line "recensement du"
	cont "#DEX."
	done

_OakRating14::
	text "Echanges-tu tes"
	line "#MON? Il"

	para "faut se faire"
	line "des amis!"
	done

_OakRating15::
	text "Whoa! T'as passé"
	line "la barre des 200!"
	cont "Ton #DEX est"
	cont "mortel!"
	done

_OakRating16::
	text "Tu as trouvé tant"
	line "de #MON!"

	para "Tu aides vraiment"
	line "mes recherches!"
	done

_OakRating17::
	text "Magnifique! Tu"
	line "peux devenir un"

	para "PROF. #MON"
	line "dès maintenant!"
	done

_OakRating18::
	text "Ton #DEX est"
	line "incroyable! Tu"

	para "vas devenir un"
	line "professionnel!"
	done

_OakRating19::
	text "Whoa! Un #DEX"
	line "parfait! Mon rêve"

	para "devient réalité!"
	line "Bravo! Bravo!"
	done

_OakPCText4::
	text "Connexion au PC du"
	line "PROF.CHEN coupée."
	done

_TrainerRankingExplanationText:: ; unreferenced
	text_start
	done

_TrainerRankingNoDataText:: ; unreferenced
	text_start
	done

_MemoryGameYeahText::
	text ", ouais!"
	done

_MemoryGameDarnText::
	text "Zut..."
	done

_StartMenuContestEndText::
	text "Voulez-vous arrê-"
	line "ter le concours?"
	done

_ItemsTossOutHowManyText::
	text "Jeter combien de"
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

_ItemsThrowAwayText::
	text "Jeter @"
	text_decimal wItemQuantityChange, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

_ItemsDiscardedText::
	text_ram wStringBuffer1
	text_start
	line "à la poubelle."
	prompt

_ItemsTooImportantText::
	text "C'est trop"
	line "important!"
	prompt

_ItemsOakWarningText::
	text "CHEN: <PLAYER>!"
	line "Ce n'est pas le"
	cont "moment d'utiliser"
	cont "ce truc!"
	done

_PokemonSwapItemText::
	text "Pris @"
	text_ram wStringBuffer1
	text_start
	line "de @"
	text_ram wMonOrItemNameBuffer
	text " et"

	para "fait tenir"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_PokemonHoldItemText::
	text_ram wMonOrItemNameBuffer
	text " tient"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_PokemonRemoveMailText::
	text "Enlever la"
	line "LETTRE d'abord."
	prompt

_PokemonNotHoldingText::
	text_ram wMonOrItemNameBuffer
	text " ne"
	line "tient rien."
	prompt

_ItemStorageFullText::
	text "Espace de stockage"
	line "d'objets complet."
	prompt

_PokemonTookItemText::
	text "Pris @"
	text_ram wStringBuffer1
	text_start
	line "de @"
	text_ram wMonOrItemNameBuffer
	text "."
	prompt

_PokemonAskSwapItemText::
	text_ram wMonOrItemNameBuffer
	text_start
	line "tient déjà"

	para "@"
	text_ram wStringBuffer1
	text "."
	line "Changer d'objet?"
	done

_ItemCantHeldText::
	text "Cet objet ne peut"
	line "être tenu."
	prompt

_MailLoseMessageText::
	text "La LETTRE perdra"
	line "son message. OK?"
	done

_MailDetachedText::
	text "LETTRE enlevée de"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_MailNoSpaceText::
	text "Pas de place pour"
	line "enlever la LETTRE."
	prompt

_MailAskSendToPCText::
	text "Envoyer la LETTRE"
	line "enlevée au PC?"
	done

_MailboxFullText::
	text "La BOITE AUX LET-"
	line "TRES du PC est"
	cont "pleine."
	prompt

_MailSentToPCText::
	text "La LETTRE a été"
	line "envoyée au PC."
	prompt

_PokemonNotEnoughHPText::
	text "Pas assez de PV!"
	prompt

_MayRegisterItemText::
	text "Un objet du SAC"
	line "peut être enregis-"

	para "tré comme fonction"
	line "du bouton SELECT."
	done

_OakText1::
	text "Bonjour! Désolé de"
	line "l'attente!"

	para "Bienvenue dans le"
	line "monde de #MON!"

	para "Mon nom est CHEN."

	para "Mais on m'appelle"
	line "le PROF.#MON."
	prompt

_OakText2::
	text "Ce monde est peu-"
	line "plé de créatures"
	cont "appelées #MON.@"
	text_end

_OakText3::
	text_promptbutton
	text_end

	text_end ; unreferenced

_OakText4::
	text "Humains et #MON"
	line "vivent en parfaite"
	cont "harmonie..."

	para "Certains jouent"
	line "avec les #MON,"
	cont "d'autres font des"
	cont "combats avec eux."
	prompt

_OakText5::
	text "Mais il reste"
	line "beaucoup à appren-"
	cont "dre sur nos amis"
	cont "les #MON."

	para "De nombreux mystè-"
	line "res planent à leur"
	cont "sujet."

	para "Et c'est pourquoi"
	line "j'étudie les"
	cont "#MON tous les"
	cont "jours."
	prompt
