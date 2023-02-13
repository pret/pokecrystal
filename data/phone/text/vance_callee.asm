VanceAnswerPhoneText:
	text "Oui, allô?"
	line "Ici @"
	text_ram wStringBuffer3
	text "!"

	para "Bonjour, <PLAY_G>!"

	para "Tu aimes les"
	line "#MON oiseaux?"
	done

VanceAnswerPhoneDayText:
	text "Oui, allô?"
	line "Ici @"
	text_ram wStringBuffer3
	text "!"

	para "Bonjour, <PLAY_G>!"

	para "Tu aimes les"
	line "#MON oiseaux?"
	done

VanceAnswerPhoneNiteText:
	text "Oui, allô?"
	line "Ici @"
	text_ram wStringBuffer3
	text "!"

	para "Bonsoir, <PLAY_G>!"

	para "Tu aimes les"
	line "#MON oiseaux?"
	done

VanceGreetText:
	text "Salut,"
	line "<PLAY_G>!"

	para "C'est @"
	text_ram wStringBuffer3
	text "!"
	line "Bonjour!"
	done

VanceGreetDayText:
	text "Salut, <PLAY_G>!"

	para "C'est @"
	text_ram wStringBuffer3
	text "!"
	line "Tu te souviens?"
	done

VanceGreetNiteText:
	text "Bonsoir,"
	line "<PLAY_G>!"

	para "C'est @"
	text_ram wStringBuffer3
	text "!"
	line "T'as une minute?"
	done

VanceGenericText:
	text "Toi et tes #MON"
	line "allez bien?"

	para "Mon @"
	text_ram wStringBuffer4
	text_start
	line "est assez fort"

	para "pour affronter les"
	line "#MON oiseaux"
	cont "légendaires!"
	done
