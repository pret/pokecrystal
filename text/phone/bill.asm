BillPhoneMornGreetingText: ; 0x1b4427
	db $0, "Good morning!", $51
	db "This is the #-", $4f
	db "MON STORAGE SYSTEM", $51
	db "ADMINISTRATION", $4f
	db "SERVICE.", $57

BillPhoneDayGreetingText: ; 0x1b4470
	db $0, "Good day!", $51
	db "This is the #-", $4f
	db "MON STORAGE SYSTEM", $51
	db "ADMINISTRATION", $4f
	db "SERVICE.", $57

BillPhoneNiteGreetingText: ; 0x1b44b5
	db $0, "Good evening!", $51
	db "This is the #-", $4f
	db "MON STORAGE SYSTEM", $51
	db "ADMINISTRATION", $4f
	db "SERVICE.", $57

BillPhoneGeneriText: ; 0x1b44fe
	db $0, "Who's calling?", $51
	db $14, ", is it?", $4f
	db "Hang on a sec…", $51
	db $56, $4f
	db $56, $57

BillPhoneNotFullText: ; 0x1b452a
	db $0, "Thanks for", $4f
	db "waiting!", $51
	db $14, ", your BOX", $4f
	db "has room for @"
	TX_RAM $d099
	db $0, $55
	db "more #MON.", $51
	db "Get out there and", $4f
	db "fill it up!", $57

BillPhoneNearlyFullText: ; 0x1b4587
	db $0, "Thanks for", $4f
	db "waiting!", $51
	db $14, ", your BOX", $4f
	db "has room for only", $55
	db "@"
	TX_RAM $d099
	db $0, " more #MON.", $51
	db "Maybe you should", $4f
	db "switch your BOX.", $57

BillPhoneFullText: ; 0x1b45ed
	db $0, "Thanks for", $4f
	db "waiting!", $51
	db $14, ", your BOX", $4f
	db "is full!", $51
	db "You'll have to", $4f
	db "switch BOXES if", $51
	db "you want to catch", $4f
	db "more #MON.", $57

BillPhoneNewlyFullText: ; 0x1b4652
	db $0, "Hi, ", $14, "?", $4f
	db "It's me, BILL!", $51
	db "Thanks for using", $4f
	db "my STORAGE SYSTEM.", $51
	db "That last #MON", $4f
	db "you sent filled", $55
	db "your BOX up.", $51
	db "You'll have to", $4f
	db "switch BOXES if", $51
	db "you want to catch", $4f
	db "more #MON.", $51
	db "Bye now!", $57
