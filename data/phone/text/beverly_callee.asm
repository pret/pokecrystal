BeverlyAnswerPhoneText:
	text "Hello, this is"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Oh! Good morning,"
	line "<PLAYER>."
	done

BeverlyAnswerPhoneDayText:
	text "Hello, this is"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Oh! Good day,"
	line "<PLAYER>."
	done

BeverlyAnswerPhoneNiteText:
	text "Hello, this is"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Oh! Good evening,"
	line "<PLAYER>."
	done

BeverlyGreetText:
	text "Hello, <PLAYER>."
	line "Good morning."

	para "This is @"
	text_ram wStringBuffer3
	text "."
	line "Were you asleep?"
	done

BeverlyGreetDayText:
	text "Hi, <PLAYER>."
	line "This is @"
	text_ram wStringBuffer3
	text "."

	para "How are you doing?"
	done

BeverlyGreetNiteText:
	text "Hi, <PLAYER>."
	line "This is @"
	text_ram wStringBuffer3
	text "."

	para "Were you awake?"
	done

BeverlyGenericText:
	text "Keeping your"
	line "#MON happy?"

	para "My @"
	text_ram wStringBuffer4
	text " is"
	line "healthy. It eats a"
	cont "lot every day."
	done
