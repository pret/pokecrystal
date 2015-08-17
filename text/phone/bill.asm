BillPhoneMornGreetingText: ; 0x1b4427
	text "Good morning!"

	para "This is the #-"
	line "MON STORAGE SYSTEM"

	para "ADMINISTRATION"
	line "SERVICE."
	done

BillPhoneDayGreetingText: ; 0x1b4470
	text "Good day!"

	para "This is the #-"
	line "MON STORAGE SYSTEM"

	para "ADMINISTRATION"
	line "SERVICE."
	done

BillPhoneNiteGreetingText: ; 0x1b44b5
	text "Good evening!"

	para "This is the #-"
	line "MON STORAGE SYSTEM"

	para "ADMINISTRATION"
	line "SERVICE."
	done

BillPhoneGeneriText: ; 0x1b44fe
	text "Who's calling?"

	para "<PLAY_G>, is it?"
	line "Hang on a sec…"

	para $56
	line $56
	done

BillPhoneNotFullText: ; 0x1b452a
	text "Thanks for"
	line "waiting!"

	para "<PLAY_G>, your BOX"
	line "has room for @"
	text_from_ram StringBuffer3
	text ""
	cont "more #MON."

	para "Get out there and"
	line "fill it up!"
	done

BillPhoneNearlyFullText: ; 0x1b4587
	text "Thanks for"
	line "waiting!"

	para "<PLAY_G>, your BOX"
	line "has room for only"
	cont "@"
	text_from_ram StringBuffer3
	text " more #MON."

	para "Maybe you should"
	line "switch your BOX."
	done

BillPhoneFullText: ; 0x1b45ed
	text "Thanks for"
	line "waiting!"

	para "<PLAY_G>, your BOX"
	line "is full!"

	para "You'll have to"
	line "switch BOXES if"

	para "you want to catch"
	line "more #MON."
	done

BillPhoneNewlyFullText: ; 0x1b4652
	text "Hi, <PLAY_G>?"
	line "It's me, BILL!"

	para "Thanks for using"
	line "my STORAGE SYSTEM."

	para "That last #MON"
	line "you sent filled"
	cont "your BOX up."

	para "You'll have to"
	line "switch BOXES if"

	para "you want to catch"
	line "more #MON."

	para "Bye now!"
	done
