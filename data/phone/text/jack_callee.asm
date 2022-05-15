JackAnswerPhoneText:
	text "Hello. This is"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Good morning,"
	line "<PLAY_G>!"
	done

JackAnswerPhoneDayText:
	text "Hello. This is"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "How's it going,"
	line "<PLAY_G>?"
	done

JackAnswerPhoneNiteText:
	text "Hello. This is"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Good evening,"
	line "<PLAY_G>!"
	done

JackGreetText:
	text "<PLAY_G>, good"
	line "morning!"

	para "It's me, @"
	text_ram wStringBuffer3
	text "."
	line "How are you doing?"
	done

JackGreetDayText:
	text "<PLAY_G>, howdy!"

	para "It's me, @"
	text_ram wStringBuffer3
	text "."
	line "Isn't it nice out?"
	done

JackGreetNiteText:
	text "<PLAY_G>, good"
	line "evening!"

	para "It's me, @"
	text_ram wStringBuffer3
	text "."
	line "Got a minute?"
	done

JackGenericText:
	text "How are your"
	line "#MON doing?"

	para "My @"
	text_ram wStringBuffer4
	text " is"
	line "so curious, it's a"

	para "problem. Maybe"
	line "it's like me…"
	done
