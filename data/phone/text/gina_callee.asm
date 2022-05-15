GinaAnswerPhoneText:
	text "Hello? This is"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Oh, <PLAY_G>!"
	line "Good morning!"
	done

GinaAnswerPhoneDayText:
	text "Hello? This is"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Oh, <PLAY_G>!"
	line "Hi, how are you?"
	done

GinaAnswerPhoneNiteText:
	text "Hello? This is"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Oh, <PLAY_G>!"
	line "Good evening!"
	done

GinaGreetText:
	text "<PLAY_G>?"

	para "It's @"
	text_ram wStringBuffer3
	text "."
	line "Good morning!"
	done

GinaGreetDayText:
	text "<PLAY_G>?"

	para "It's @"
	text_ram wStringBuffer3
	text ". Is"
	line "this a bad time?"
	done

GinaGreetNiteText:
	text "<PLAY_G>?"

	para "It's @"
	text_ram wStringBuffer3
	text "."
	line "Got time to chat?"
	done

GinaGenericText:
	text "Are your #MON"
	line "still tough?"

	para "I train every day"
	line "with @"
	text_ram wStringBuffer4
	text "."
	done
