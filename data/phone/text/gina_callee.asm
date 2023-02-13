GinaAnswerPhoneText:
	text "Allô? C'est"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Oh, <PLAY_G>!"
	line "Bonjour!"
	done

GinaAnswerPhoneDayText:
	text "Allô? C'est"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Oh, <PLAY_G>!"
	line "Ca va?"
	done

GinaAnswerPhoneNiteText:
	text "Allô? C'est"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Oh, <PLAY_G>!"
	line "Bonsoir!"
	done

GinaGreetText:
	text "<PLAY_G>?"

	para "C'est @"
	text_ram wStringBuffer3
	text "."
	line "Bonjour!"
	done

GinaGreetDayText:
	text "<PLAY_G>?"

	para "C'est @"
	text_ram wStringBuffer3
	text "."
	line "Je te dérange?"
	done

GinaGreetNiteText:
	text "<PLAY_G>?"

	para "C'est @"
	text_ram wStringBuffer3
	text "."
	line "T'as une minute?"
	done

GinaGenericText:
	text "Tes #MON sont"
	line "toujours aussi"
	cont "puissants?"

	para "J'entraîne à fond"
	line "mon @"
	text_ram wStringBuffer4
	text_start
	cont "tous les jours."
	done
