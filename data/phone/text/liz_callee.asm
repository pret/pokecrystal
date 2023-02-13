LizAnswerPhoneText:
	text_ram wStringBuffer3
	text_start
	line "à l'appareil."

	para "Oh, <PLAY_G>."
	line "Bonjour."
	done

LizAnswerPhoneDayText:
	text_ram wStringBuffer3
	text_start
	line "à l'appareil."

	para "Oh, <PLAY_G>."
	line "Ca va?"
	done

LizAnswerPhoneNiteText:
	text_ram wStringBuffer3
	text_start
	line "à l'appareil."

	para "Oh, <PLAY_G>."
	line "Bonsoir."
	done

LizGreetText:
	text "Bonjour,"
	line "<PLAY_G>."

	para "C'est @"
	text_ram wStringBuffer3
	text "."
	line "Tu dormais?"
	done

LizGreetDayText:
	text "Bonjour,"
	line "<PLAY_G>."

	para "C'est @"
	text_ram wStringBuffer3
	text "."
	line "Ca va bien?"
	done

LizGreetNiteText:
	text "Bonsoir,"
	line "<PLAY_G>."

	para "C'est @"
	text_ram wStringBuffer3
	text "."
	line "T'étais debout?"
	done

LizGenericText:
	text "J'ai du temps a-"
	line "lors je t'appelle."

	para "Au fait, comment"
	line "vont tes #MON?"

	para "Moi j'emmène mon"
	line "@"
	text_ram wStringBuffer4
	text " au"

	para "CENTRE #MON"
	line "de MAUVILLE tous"
	cont "les jours!"

	para "La réceptionniste"
	line "est mon amie!"
	done
