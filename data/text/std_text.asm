NurseMornText:
	text "Bien le bonjour!"
	line "Bienvenue au"
	cont "CENTRE #MON."
	done

NurseDayText:
	text "Salut!"
	line "Bienvenue au"
	cont "CENTRE #MON."
	done

NurseNiteText:
	text "Bonsoir!"
	line "Bienvenue au"
	cont "CENTRE #MON."
	done

PokeComNurseMornText:
	text "Bonjour!"

	para "Voici le CENTRE de"
	line "COMMUNICATION"

	para "#MON... Ou"
	line "CENTRE #COM."
	done

PokeComNurseDayText:
	text "Bonjour!"

	para "Voici le CENTRE de"
	line "COMMUNICATION"

	para "#MON... Ou"
	line "CENTRE #COM."
	done

PokeComNurseNiteText:
	text "Vous êtes debout"
	line "bien tard!"

	para "Voici le CENTRE de"
	line "COMMUNICATION"

	para "#MON... Ou"
	line "CENTRE #COM."
	done

NurseAskHealText:
	text "Nous pouvons"
	line "soigner vos"
	cont "#MON."

	para "Voulez-vous les"
	line "soigner?"
	done

NurseTakePokemonText:
	text "OK, puis-je voir"
	line "vos #MON?"
	done

NurseReturnPokemonText:
	text "Merci d'avoir"
	line "attendu."

	para "Vos #MON sont"
	line "en super forme."
	done

NurseGoodbyeText:
	text "Encore merci et"
	line "à bientôt!"
	done

; not used
	text "Encore merci et"
	line "à bientôt!"
	done

NursePokerusText:
	text "On dirait que de"
	line "petites formes de"

	para "vie sont collées à"
	line "vos #MON."

	para "Vos #MON sont"
	line "apparemment en"
	cont "bonne santé."

	para "Mais on ne peut"
	line "pas vous en dire"

	para "plus dans un"
	line "CENTRE #MON."
	done

PokeComNursePokerusText:
	text "On dirait que de"
	line "petites formes de"

	para "vie sont collées à"
	line "vos #MON."

	para "Vos #MON sont"
	line "apparemment en"
	cont "bonne santé."

	para "Mais on ne peut"
	line "pas vous en dire"
	cont "plus..."
	done

DifficultBookshelfText:
	text "C'est rempli de"
	line "livres compliqués."
	done

PictureBookshelfText:
	text "Une collection de"
	line "livres d'images"
	cont "#MON!"
	done

MagazineBookshelfText:
	text "Magazines #MON…"
	line "STYLO #MON,"

	para "CAHIER #MON,"
	line "GRAPH #MON..."
	done

TeamRocketOathText:
	text "SERMENT ROCKET"

	para "Voler les #MON"
	line "pour le pognon!"

	para "Exploiter les"
	line "#MON pour le"
	cont "pognon!"

	para "Les #MON aident"
	line "à la gloire de la"
	cont "TEAM ROCKET!"
	done

IncenseBurnerText:
	text "C'est quoi donc?"

	para "Oh, c'est un"
	line "brûleur d'encens!"
	done

MerchandiseShelfText:
	text "Tout plein de"
	line "trucs #MON!"
	done

LookTownMapText:
	text "C'est la CARTE."
	done

WindowText:
	text "Oh..."
	line "Que c'est beau!"
	done

TVText:
	text "C'est la TV."
	done

HomepageText:
	text "JOURNAL #MON:"
	line "HOME PAGE…"

	para "Ce n'est pas"
	line "mis à jour…"
	done

; not used
	text "#MON RADIO!"

	para "Appelez-nous et"
	line "faites passer un"
	cont "tube!"
	done

TrashCanText:
	text "Il n'y a rien"
	line "là-dedans…"
	done

; not used
	text "Un #MON"
	line "pourrait sûrement"
	cont "déplacer ça."
	done

; not used
	text "Un #MON"
	line "pourrait peut-être"
	cont "casser ça."
	done

PokecenterSignText:
	text "Soignez donc vos"
	line "#MON au... "
	cont "CENTRE #MON!!!"
	done

MartSignText:
	text "Pour tout acheter,"
	line "pour tout trouver:"

	para "BOUTIQUE #MON!"
	done

ContestResults_ReadyToJudgeText:
	text "On va maintenant"
	line "juger vos #MON"
	cont "capturés."

	para "<……>"
	line "<……>"

	para "Nous avons choisi"
	line "les vainqueurs!"

	para "Vous êtes prêts?"
	done

ContestResults_PlayerWonAPrizeText:
	text "Le No. @"
	text_ram wStringBuffer3
	text_start
	line "<PLAYER> gagne:"
	cont "@"
	text_ram wStringBuffer4
	text "!"
	done

ReceivedItemText:
	text "<PLAYER> reçoit"
	line "@"
	text_ram wStringBuffer4
	text "."
	done

ContestResults_JoinUsNextTimeText:
	text "A la prochaine"
	line "pour un autre"
	cont "concours!"
	done

ContestResults_ConsolationPrizeText:
	text "Tout le monde"
	line "gagne une BAIE en"
	cont "lot de"
	cont "consolation!"
	done

ContestResults_DidNotWinText:
	text "Faites mieux la"
	line "prochaine fois."
	done

ContestResults_ReturnPartyText:
	text "Voici les #MON"
	line "que nous gardions"

	para "pour vous."
	line "Merci bien!"
	done

ContestResults_PartyFullText:
	text "Equipe pleine! Le"
	line "#MON est envoyé"

	para "dans la BOITE du"
	line "PC de LEO."
	done

GymStatue_CityGymText:
	text_ram wStringBuffer3
	text_start
	line "ARENE #MON"
	done

GymStatue_WinningTrainersText:
	text "CHAMPION:"
	line "@"
	text_ram wStringBuffer4
	text_start
	para "DRESSEURS"
	line "VAINQUEURS:"
	cont "<PLAYER>"
	done

CoinVendor_WelcomeText:
	text "Bienvenue au"
	line "CASINO."
	done

CoinVendor_NoCoinCaseText:
	text "Voulez-vous des"
	line "jetons?"

	para "Mais...! Vous"
	line "n'avez pas de"
	cont "BOITE JETON!"
	done

CoinVendor_IntroText:
	text "Voulez-vous des"
	line "jetons?"

	para "C'est 1000¥ pour"
	line "50 jetons. Ca vous"
	cont "tente toujours?"
	done

CoinVendor_Buy50CoinsText:
	text "Merci!"
	line "Voici 50 jetons."
	done

CoinVendor_Buy500CoinsText:
	text "Merci! Voici"
	line "500 jetons."
	done

CoinVendor_NotEnoughMoneyText:
	text "Vous n'avez pas"
	line "assez de sous."
	done

CoinVendor_CoinCaseFullText:
	text "Houlà! Votre BOITE"
	line "JETON est pleine."
	done

CoinVendor_CancelText:
	text "Pas de jetons?"
	line "Alors à bientôt!"
	done

BugContestPrizeNoRoomText:
	text "Votre SAC"
	line "est plein!!!"

	para "Nous allons garder"
	line "ceci pour vous."

	para "Faites de la place"
	line "et revenez."
	done

HappinessText3:
	text "Woah! Toi et ton"
	line "#MON êtes"
	cont "super proches!"
	done

HappinessText2:
	text "Les #MON de-"
	line "viennent plus ami-"

	para "caux en passant du"
	line "temps avec eux."
	done

HappinessText1:
	text "Tu n'as pas"
	line "apprivoisé ton"
	cont "#MON."

	para "Si tu n'es pas"
	line "sympa, il fera la"
	cont "tête."
	done

RegisteredNumber1Text:
	text "<PLAYER> enregistre"
	line "le No. de @"
	text_ram wStringBuffer3
	text "."
	done

RegisteredNumber2Text:
	text "<PLAYER> enregistre"
	line "le No. de @"
	text_ram wStringBuffer3
	text "."
	done
