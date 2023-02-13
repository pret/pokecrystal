MomPhoneGreetingText:
	text "Bonjour?"

	para "Oh, salut,"
	line "<PLAYER>!"
	cont "Ca bosse dur?"
	done

MomPhoneLandmarkText:
	text "Oh, tu es vers"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Il y a"
	line "@"
	text_ram wStringBuffer4
	text_start
	cont "par-là, non?"
	done

MomPhoneGenericAreaText:
	text "Tu es vers"
	line "@"
	text_ram wStringBuffer3
	text "?"

	para "Je ne connais pas"
	line "ce coin. Tu as de"
	cont "la chance <PLAYER>."
	done

MomPhoneNewBarkText:
	text "Quoi? Tu es vers"
	line "@"
	text_ram wStringBuffer3
	text "?"

	para "Passe voir ta"
	line "maman des fois!"
	done

MomPhoneCherrygroveText:
	text "Tu visites"
	line "@"
	text_ram wStringBuffer3
	text "?"

	para "Tu passes à la"
	line "maison manger un"
	cont "morceau?"
	done

MomOtherAreaText:
	text "Oh! Tu es vers"
	line "@"
	text_ram wStringBuffer3
	text "?"

	para "Bonne chance pour"
	line "ta quête #MON!"
	done

MomDeterminedText:
	text "Ca a l'air vrai-"
	line "ment coriace."

	para "Mais <PLAYER>, je"
	line "sais que tu as du"

	para "courage. Tout"
	line "ira bien, pas"
	cont "vrai?"
	done

MomCheckBalanceText:
	text "A propos, tu as"
	line "économisé @"
	text_ram wStringBuffer3
	text "¥."

	para "Veux-tu continuer"
	line "à économiser?"
	done

MomImportantToSaveText:
	text "C'est important"
	line "d'économiser."
	done

MomYoureNotSavingText:
	text "Oh, <PLAYER>,"
	line "tu n'as pas écono-"

	para "misé d'argent."
	line "Veux-tu économiser"
	cont "de l'argent?"
	done

MomYouveSavedText:
	text "A propos, tu as"
	line "économisé @"
	text_ram wStringBuffer3
	text "¥."

	para "Tu veux recom-"
	line "mencer à écono-"
	cont "miser?"
	done

MomOKIllSaveText:
	text "OK. Je vais garder"
	line "ton argent."
	done

MomPhoneWontSaveMoneyText:
	text "OK. Je ne garde"
	line "pas ton argent."
	done

MomPhoneHangUpText:
	text "<PLAYER>, continue"
	line "comme ça! Je suis"
	cont "avec toi, poussin!"
	done

MomPhoneNoPokemonText:
	text "Allô?"

	para "Bonjour <PLAYER>!"
	line "Le PROF.ORME"
	cont "t'attend, non?"
	done

MomPhoneNoPokedexText:
	text "Allô?"

	para "Bonjour <PLAYER>!"
	line "Le PROF.ORME"
	cont "compte sur toi!"
	cont "C'est bien!"
	done

MomPhoneNoGymQuestText:
	text "Allô?"

	para "Salut, <PLAYER>!"
	line "Si ta course est"

	para "finie, rentre à la"
	line "maison."
	done

MomPhoneLectureText:
	text "Allô?"

	para "…… <PLAYER>?"
	line "Le PROF.ORME dit"

	para "que tu fais un"
	line "long voyage."

	para "Tu aurais pu me le"
	line "dire..."

	para "Et l'argent?"
	line "Dois-je"
	cont "économiser?"
	done
