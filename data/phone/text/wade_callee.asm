WadeAnswerPhoneText:
	text "Allô? C'est"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "<PLAY_G>!"
	line "Bonjour!"
	done

WadeAnswerPhoneDayText:
	text "Allô? C'est"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "<PLAY_G>!"
	line "Bonjour!"
	done

WadeAnswerPhoneNiteText:
	text "Allô? C'est"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "<PLAY_G>!"
	line "Bonsoir!"
	done

WadeGreetText:
	text "<PLAY_G>!"
	line "Bonjour!"

	para "C'est @"
	text_ram wStringBuffer3
	text "."
	line "Il fait beau!"
	done

WadeGreetDayText:
	text "<PLAY_G>!"
	line "Bonjour!"

	para "C'est @"
	text_ram wStringBuffer3
	text "."
	line "Il fait beau!"
	done

WadeGreetNiteText:
	text "<PLAY_G>!"
	line "Bonsoir!"

	para "C'est @"
	text_ram wStringBuffer3
	text "."
	line "T'es debout?"
	done

WadeGenericText:
	text "Comment vont"
	line "tes #MON?"

	para "Mes #MON ont"
	line "trop d'énergie."

	para "Ca devient un"
	line "sacré problème."

	para "Parmi eux,"
	line "@"
	text_ram wStringBuffer4
	text " est"
	cont "le plus coriace."

	para "Ca commence à me"
	line "fatiguer."
	done
