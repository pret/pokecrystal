BeverlyAnswerPhoneText:
	text "Salut c'est"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Oh! Bonjour,"
	line "<PLAYER>."
	done

BeverlyAnswerPhoneDayText:
	text "Salut c'est"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Oh! Bonjour,"
	line "<PLAYER>."
	done

BeverlyAnswerPhoneNiteText:
	text "Salut c'est"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Oh! Bonsoir,"
	line "<PLAYER>."
	done

BeverlyGreetText:
	text "Salut, <PLAYER>."
	line "Bonjour."

	para "C'est @"
	text_ram wStringBuffer3
	text "."
	line "Tu dormais?"
	done

BeverlyGreetDayText:
	text "Salut <PLAYER>."
	line "C'est @"
	text_ram wStringBuffer3
	text "."

	para "Comment tu vas?"
	done

BeverlyGreetNiteText:
	text "Salut <PLAYER>."
	line "C'est @"
	text_ram wStringBuffer3
	text "."

	para "Tu dormais?"
	done

BeverlyGenericText:
	text "Tes #MON"
	line "sont heureux?"

	para "Mon @"
	text_ram wStringBuffer4
	text_start
	line "est en forme."
	cont "Il bouffe bien."
	done
