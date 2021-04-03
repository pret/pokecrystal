BillPhoneMornGreetingText:
	text "Good morning!"

	para "This is the POKé-"
	line "MON STORAGE SYSTEM"

	para "ADMINISTRATION"
	line "SERVICE."
	done

BillPhoneDayGreetingText:
	text "Good day!"

	para "This is the POKé-"
	line "MON STORAGE SYSTEM"

	para "ADMINISTRATION"
	line "SERVICE."
	done

BillPhoneNiteGreetingText:
	text "Good evening!"

	para "This is the POKé-"
	line "MON STORAGE SYSTEM"

	para "ADMINISTRATION"
	line "SERVICE."
	done

BillPhoneGenericText:
	text "Who's calling?"

	para "<PLAY_G>, is it?"
	line "Hang on a sec…"

	para "<……>"
	line "<……>"
	done

BillPhoneNotFullText:
	text "Thanks for"
	line "waiting!"

	para "<PLAY_G>, your BOX"
	line "has room for @"
	text_ram wStringBuffer3
	text_start
	cont "more POKéMON."

	para "Get out there and"
	line "fill it up!"
	done

BillPhoneNearlyFullText:
	text "Thanks for"
	line "waiting!"

	para "<PLAY_G>, your BOX"
	line "has room for only"
	cont "@"
	text_ram wStringBuffer3
	text " more POKéMON."

	para "Maybe you should"
	line "switch your BOX."
	done

BillPhoneFullText:
	text "Thanks for"
	line "waiting!"

	para "<PLAY_G>, your BOX"
	line "is full!"

	para "You'll have to"
	line "switch BOXES if"

	para "you want to catch"
	line "more POKéMON."
	done

BillPhoneNewlyFullText:
	text "Hi, <PLAY_G>?"
	line "It's me, BILL!"

	para "Thanks for using"
	line "my STORAGE SYSTEM."

	para "That last POKéMON"
	line "you sent filled"
	cont "your BOX up."

	para "You'll have to"
	line "switch BOXES if"

	para "you want to catch"
	line "more POKéMON."

	para "Bye now!"
	done
