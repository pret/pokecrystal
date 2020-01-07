WadeAnswerPhoneText:
	text "Hello? This is"
	line "@"
	text_ram wStringBuffer3
	text " speaking."

	para "Oh. Hi, <PLAY_G>!"
	line "Good morning!"
	done

WadeAnswerPhoneDayText:
	text "Hello? This is"
	line "@"
	text_ram wStringBuffer3
	text " speaking."

	para "Oh, hi, <PLAY_G>!"
	done

WadeAnswerPhoneNiteText:
	text "Hello? This is"
	line "@"
	text_ram wStringBuffer3
	text " speaking."

	para "Oh, hi, <PLAY_G>!"
	line "Good evening!"
	done

WadeGreetText:
	text "<PLAY_G>, good"
	line "morning!"

	para "It's me, @"
	text_ram wStringBuffer3
	text "."
	line "Isn't it nice out?"
	done

WadeGreetDayText:
	text "<PLAY_G>, howdy!"

	para "It's me, @"
	text_ram wStringBuffer3
	text "."
	line "Isn't it nice out?"
	done

WadeGreetNiteText:
	text "Good evening,"
	line "<PLAY_G>!"

	para "It's me, @"
	text_ram wStringBuffer3
	text "."
	line "Were you awake?"
	done

WadeGenericText:
	text "How are your"
	line "#MON doing?"

	para "My #MON have"
	line "too much energy to"

	para "burn. It gets to"
	line "be a problem."

	para "Of all my #MON,"
	line "@"
	text_ram wStringBuffer4
	text " is the"
	cont "hardest to handle."

	para "Working with it is"
	line "exhausting."
	done
