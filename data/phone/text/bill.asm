BillPhoneMornGreetingText:
	text "Bonjour!"

	para "Voici le SERVICE"
	line "D'ADMINISTRATION"

	para "DU SYSTEME DE"
	line "STOCKAGE DE"
	cont "#MON."
	done

BillPhoneDayGreetingText:
	text "Bonjour!"

	para "Voici le SERVICE"
	line "D'ADMINISTRATION"

	para "DU SYSTEME DE"
	line "STOCKAGE DE"
	cont "#MON."
	done

BillPhoneNiteGreetingText:
	text "Bonsoir!"

	para "Voici le SERVICE"
	line "D'ADMINISTRATION"

	para "DU SYSTEME DE"
	line "STOCKAGE DE"
	cont "#MON."
	done

BillPhoneGenericText:
	text "Qui est-ce?"

	para "<PLAY_G>?"
	line "Une seconde..."

	para "<……>"
	line "<……>"
	done

BillPhoneNotFullText:
	text "Merci d'avoir"
	line "attendu!"

	para "<PLAY_G>, ta BOITE"
	line "a de la place pour"
	cont "encore @"
	text_ram wStringBuffer3
	text_start
	cont "#MON."

	para "Va en choper!"
	done

BillPhoneNearlyFullText:
	text "Merci d'avoir"
	line "attendu!"

	para "<PLAY_G>, ta BOITE"
	line "a de la place pour"
	cont "encore @"
	text_ram wStringBuffer3
	text_start
	cont "#MON."

	para "Tu devrais changer"
	line "de BOITE."
	done

BillPhoneFullText:
	text "Merci d'avoir"
	line "attendu!"

	para "<PLAY_G>, ta BOITE"
	line "est pleine!"

	para "Tu devrais changer"
	line "de BOITE pour"
	cont "attraper d'autres"
	cont "#MON."
	done

BillPhoneNewlyFullText:
	text "<PLAY_G>?"
	line "C'est moi! LEO!"

	para "Merci d'utiliser"
	line "le SYSTEME de"
	cont "STOCKAGE."

	para "Le dernier #MON"
	line "envoyé a rempli"
	cont "ta BOITE."

	para "Il faut changer de"
	line "BOITE pour attra-"

	para "per d'autres"
	line "#MON."

	para "Salut!"
	done
