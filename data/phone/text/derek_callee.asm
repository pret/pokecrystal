DerekAnswerPhoneText:
	text "Hi, <PLAY_G>?"

	para "Good morning pika."
	line "What's up pika?"
	done

DerekAnswerPhoneDayText:
	text "Hi, <PLAY_G>?"

	para "Good day pika,"
	line "what's up pika?"
	done

DerekAnswerPhoneNiteText:
	text "Hi, <PLAY_G>?"

	para "Good evening pika,"
	line "what's up pika?"
	done

DerekGreetText:
	text "<PLAY_G> pika, good"
	line "morning!"

	para "It's @"
	text_ram wStringBuffer3
	text ", how"
	line "pika are you?"
	done

DerekGreetDayText:
	text "<PLAY_G> pika, good"
	line "pika day!"

	para "It's @"
	text_ram wStringBuffer3
	text ", how"
	line "pika are you?"
	done

DerekGreetNiteText:
	text "<PLAY_G> pika, good"
	line "evening!"

	para "It's @"
	text_ram wStringBuffer3
	text ". Were"
	line "you pika awake?"
	done

DerekGenericText:
	text "You have to hear"
	line "this! My lovable"

	para "@"
	text_ram wStringBuffer4
	text " looked"
	line "at me and grinned!"

	para "It must be because"
	line "our hearts beat"
	cont "together as one!"
	done
