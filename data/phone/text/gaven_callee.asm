GavenAnswerPhoneText:
	text "Hello, this is"
	line "@"
	text_ram wStringBuffer3
	text " speaking…"

	para "Hi, <PLAY_G>!"
	line "Good morning!"
	done

GavenAnswerPhoneDayText:
	text "Hello, this is"
	line "@"
	text_ram wStringBuffer3
	text " speaking…"

	para "Hi, <PLAY_G>!"
	done

GavenAnswerPhoneNiteText:
	text "Hello, this is"
	line "@"
	text_ram wStringBuffer3
	text " speaking…"

	para "Hi, <PLAY_G>!"
	line "Good evening!"
	done

GavenGreetText:
	text "<PLAY_G>, good"
	line "morning!"

	para "It's me, @"
	text_ram wStringBuffer3
	text "."
	line "How are you doing?"
	done

GavenGreetDayText:
	text "Hi, <PLAY_G>!"

	para "It's me, @"
	text_ram wStringBuffer3
	text "."
	line "How are you doing?"
	done

GavenGreetNiteText:
	text "<PLAY_G>, good"
	line "evening!"

	para "It's me, @"
	text_ram wStringBuffer3
	text "."
	line "How are you doing?"
	done

GavenGenericText:
	text "How are your"
	line "#MON doing?"

	para "My @"
	text_ram wStringBuffer4
	text "'s"
	line "doing as great as"
	cont "ever."

	para "Let's keep at it"
	line "and become #MON"
	cont "CHAMPS!"
	done
