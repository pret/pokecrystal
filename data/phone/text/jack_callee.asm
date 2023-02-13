JackAnswerPhoneText:
	text "Salut c'est"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Bonjour,"
	line "<PLAY_G>!"
	done

JackAnswerPhoneDayText:
	text "Salut c'est"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Bonjour,"
	line "<PLAY_G>!"
	done

JackAnswerPhoneNiteText:
	text "Salut c'est"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Bonsoir,"
	line "<PLAY_G>!"
	done

JackGreetText:
	text "<PLAY_G>,"
	line "bonjour!"

	para "C'est @"
	text_ram wStringBuffer3
	text "."
	line "Ca va bien?"
	done

JackGreetDayText:
	text "<PLAY_G>, salut!"

	para "C'est @"
	text_ram wStringBuffer3
	text "."
	line "Il fait beau, non?"
	done

JackGreetNiteText:
	text "<PLAY_G>,"
	line "bonsoir!"

	para "C'est @"
	text_ram wStringBuffer3
	text "."
	line "T'as une minute?"
	done

JackGenericText:
	text "Ca va tes"
	line "#MON?"

	para "Mon @"
	text_ram wStringBuffer4
	text_start
	line "est bizarre."

	para "Il est peut-être"
	line "comme moi..."
	done
