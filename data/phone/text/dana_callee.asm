DanaAnswerPhoneText:
	text_ram wStringBuffer3
	text_start
	line "à l'appareil."

	para "C'est <PLAY_G>!"
	done

DanaAnswerPhoneDayText:
	text_ram wStringBuffer3
	text_start
	line "à l'appareil."

	para "C'est <PLAY_G>!"
	done

DanaAnswerPhoneNiteText:
	text_ram wStringBuffer3
	text_start
	line "à l'appareil."

	para "<PLAY_G>, ça va?"
	done

DanaGreetText:
	text "<PLAY_G>?"

	para "C'est moi!"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

DanaGreetDayText:
	text "<PLAY_G>?"

	para "C'est moi!"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

DanaGreetNiteText:
	text "<PLAY_G>?"

	para "C'est moi!"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

DanaGenericText:
	text "Mon @"
	text_ram wStringBuffer4
	text_start
	line "est si actif, que"

	para "ça m'file la"
	line "trouille."

	para "Et tes #MON,"
	line "ça va?"
	done
