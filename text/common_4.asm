_OakText6: ; 0x1c4000
	db $0, "Now, what did you", $4f
	db "say your name was?", $58
; 0x1c4026

_OakText7: ; 0x1c4026
	db $0, $52, ", are you", $4f
	db "ready?", $51
	db "Your very own", $4f
	db "#MON story is", $55
	db "about to unfold.", $51
	db "You'll face fun", $4f
	db "times and tough", $55
	db "challenges.", $51
	db "A world of dreams", $4f
	db "and adventures", $51
	db "with #MON", $4f
	db "awaits! Let's go!", $51
	db "I'll be seeing you", $4f
	db "later!", $57
; 0x1c40e6

UnknownText_0x1c40e6: ; 0x1c40e6
	db $0, "The clock's time", $4f
	db "may be wrong.", $51
	db "Please reset the", $4f
	db "time.", $58
; 0x1c411c

UnknownText_0x1c411c: ; 0x1c411c
	db $0, "Set with the", $4f
	db "Control Pad.", $51
	db "Confirm: A Button", $4f
	db "Cancel:  B Button", $57
; 0x1c415b

UnknownText_0x1c415b: ; 0x1c415b
	db $0, "Is this OK?", $57
; 0x1c4168

UnknownText_0x1c4168: ; 0x1c4168
	db $0, "The clock has been", $4f
	db "reset.", $57
; 0x1c4183

UnknownText_0x1c4183: ; 0x1c4183
	db $0, "Too much time has", $4f
	db "elapsed. Please", $55
	db "try again.", $58
; 0x1c41b1

UnknownText_0x1c41b1: ; 0x1c41b1
	db $0, "If you trade that", $4f
	db "#MON, you won't", $55
	db "be able to battle.", $58
; 0x1c41e6

UnknownText_0x1c41e6: ; 0x1c41e6
	db $0, "Your friend's", $4f
	db "@"
	text_from_ram $d073
	db $0, " appears", $55
	db "to be abnormal!", $58
; 0x1c4212

UnknownText_0x1c4212: ; 0x1c4212
	db $0, "Trade @"
	text_from_ram $d004
	db $0, $4f
	db "for @"
	text_from_ram $d073
	db $0, "?", $57
; 0x1c422a

UnknownText_0x1c422a: ; 0x1c422a
	db $0, "To enter a mobile", $4f
	db "battle, you must", $51
	db "pick a team of", $4f
	db "three #MON.", $51
	db "Is that OK?", $57
; 0x1c4275

UnknownText_0x1c4275: ; 0x1c4275
	db $0, "Need more info on", $4f
	db "mobile battles?", $57
; 0x1c4298

UnknownText_0x1c4298: ; 0x1c4298
	db $0, "For a mobile", $4f
	db "battle, choose", $55
	db "three #MON.", $51
	db "The maximum daily", $4f
	db "play time is ten", $51
	db "minutes for each", $4f
	db "linked player.", $51
	db "If a battle isn't", $4f
	db "finished within", $51
	db "the time limit,", $4f
	db "the player with", $51
	db "the fewest fainted", $4f
	db "#MON wins.", $51
	db "If tied, the team", $4f
	db "that lost the", $51
	db "least amount of HP", $4f
	db "wins.", $57
; 0x1c439c

UnknownText_0x1c439c: ; 0x1c439c
	db $0, "Today's remaining", $4f
	db "time is @"
	deciram $d086, $12
	db $0, " min.", $51
	db "Would you like to", $4f
	db "battle?", $57
; 0x1c43dc

UnknownText_0x1c43dc: ; 0x1c43dc
	db $0, "There are only @"
	deciram $d086, $12
	db $0, $4f
	db "min. left today.", $51
	db "Want a quick", $4f
	db "battle?", $57
; 0x1c4419

UnknownText_0x1c4419: ; 0x1c4419
	db $0, "There is only", $4f
	db "1 min. left today!", $51
	db "Want to rush", $4f
	db "through a battle?", $57
; 0x1c445a

UnknownText_0x1c445a: ; 0x1c445a
	db $0, "There is less than", $4f
	db "1 min. left today!", $51
	db "Please try again", $4f
	db "tomorrow.", $57
; 0x1c449c

UnknownText_0x1c449c: ; 0x1c449c
	db $0, "Try again using", $4f
	db "the same settings?", $57
; 0x1c44c0

UnknownText_0x1c44c0: ; 0x1c44c0
	db $0, "There is less than", $4f
	db "1 min. left today!", $57
; 0x1c44e7

UnknownText_0x1c44e7: ; 0x1c44e7
	db $0, "No time left for", $4f
	db "linking today.", $57
; 0x1c4508

UnknownText_0x1c4508: ; 0x1c4508
	db $0, "Pick three #MON", $4f
	db "for battle.", $57
; 0x1c4525

UnknownText_0x1c4525: ; 0x1c4525
	db $0, "Today's remaining", $4f
	db "time is @"
	deciram $d086, $12
	db $0, " min.", $57
; 0x1c454b

UnknownText_0x1c454b: ; 0x1c454b
	db $0, "Would you like to", $4f
	db "save the game?", $57
; 0x1c456d

UnknownText_0x1c456d: ; 0x1c456d
	db $0, "SAVING… DON'T TURN", $4f
	db "OFF THE POWER.", $57
; 0x1c4590

UnknownText_0x1c4590: ; 0x1c4590
	db $0, $52, " saved", $4f
	db "the game.", $57
; 0x1c45a3

UnknownText_0x1c45a3: ; 0x1c45a3
	db $0, "There is already a", $4f
	db "save file. Is it", $55
	db "OK to overwrite?", $57
; 0x1c45d9

UnknownText_0x1c45d9: ; 0x1c45d9
	db $0, "There is another", $4f
	db "save file. Is it", $55
	db "OK to overwrite?", $57
; 0x1c460d

UnknownText_0x1c460d: ; 0x1c460d
	db $0, "The save file is", $4f
	db "corrupted!", $58
; 0x1c462a

UnknownText_0x1c462a: ; 0x1c462a
	db $0, "When you change a", $4f
	db "#MON BOX, data", $55
	db "will be saved. OK?", $57
; 0x1c465f

UnknownText_0x1c465f: ; 0x1c465f
	db $0, "Each time you move", $4f
	db "a #MON, data", $55
	db "will be saved. OK?", $57
; 0x1c4693

UnknownText_0x1c4693: ; 0x1c4693
	db $0, "The window save", $4f
	db "area was exceeded.", $57
; 0x1c46b7

UnknownText_0x1c46b7: ; 0x1c46b7
	db $0, "No windows avail-", $4f
	db "able for popping.", $57
; 0x1c46dc

UnknownText_0x1c46dc: ; 0x1c46dc
	db $0, "Corrupted event!", $58
; 0x1c46ee

_ObjectEventText: ; 0x1c46ee
	db $0, "Object event", $57
; 0x1c46fc

UnknownText_0x1c46fc: ; 0x1c46fc
	db $0, "BG event", $57
; 0x1c4706

UnknownText_0x1c4706: ; 0x1c4706
	db $0, "Coordinates event", $57
; 0x1c4719

UnknownText_0x1c4719: ; 0x1c4719
	db $0, $52, " received", $4f
	db "@"
	text_from_ram $d0ac
	db $0, ".", $57
; 0x1c472c

UnknownText_0x1c472c: ; 0x1c472c
	db $0, $52, " put the", $4f
	db "@"
	text_from_ram $d073
	db $0, " in", $55
	db "the @"
	text_from_ram $d099
	db $0, ".", $58
; 0x1c474b

UnknownText_0x1c474b: ; 0x1c474b
	db $0, "The @"
	text_from_ram $d099
	db $0, $4f
	db "is full…", $58
; 0x1c475f

UnknownText_0x1c475f: ; 0x1c475f
	db $0, "I see all.", $4f
	db "I know all…", $51
	db "Certainly, I know", $4f
	db "of your #MON!", $57
; 0x1c4797

UnknownText_0x1c4797: ; 0x1c4797
	db $0, "Whaaaat? I can't", $4f
	db "tell a thing!", $51
	db "How could I not", $4f
	db "know of this?", $57
; 0x1c47d4

UnknownText_0x1c47d4: ; 0x1c47d4
	db $0, "Hm… I see you met", $4f
	db "@"
	text_from_ram $d003
	db $0, " here:", $55
	db "@"
	text_from_ram $d00e
	db $0, "!", $58
; 0x1c47fa

UnknownText_0x1c47fa: ; 0x1c47fa
	db $0, "The time was", $4f
	db "@"
	text_from_ram $d01f
	db $0, "!", $51
	db "Its level was @"
	text_from_ram $d036
	db $0, "!", $51
	db "Am I good or what?", $58
; 0x1c4837

UnknownText_0x1c4837: ; 0x1c4837
	db $0, "Hm… @"
	text_from_ram $d003
	db $0, $4f
	db "came from @"
	text_from_ram $d02a
	db $0, $55
	db "in a trade?", $51
	db "@"
	text_from_ram $d00e
	db $0, $4f
	db "was where @"
	text_from_ram $d02a
	db $0, $55
	db "met @"
	text_from_ram $d003
	db $0, "!", $58
; 0x1c487f

UnknownText_0x1c487f: ; 0x1c487f
	db $0, "What!? Incredible!", $51
	db "I don't understand", $4f
	db "how, but it is", $51
	db "incredible!", $4f
	db "You are special.", $51
	db "I can't tell where", $4f
	db "you met it, but it", $55
	db "was at level @"
	text_from_ram $d036
	db $0, ".", $51
	db "Am I good or what?", $58
; 0x1c491d

UnknownText_0x1c491d: ; 0x1c491d
	db $0, "Hey!", $51
	db "That's an EGG!", $51
	db "You can't say that", $4f
	db "you've met it yet…", $57
; 0x1c4955

UnknownText_0x1c4955: ; 0x1c4955
	db $0, "Fufufu! I saw that", $4f
	db "you'd do nothing!", $57
; 0x1c497a

UnknownText_0x1c497a: ; 0x1c497a
	db $0, "Incidentally…", $51
	db "It would be wise", $4f
	db "to raise your", $51
	db "#MON with a", $4f
	db "little more care.", $57
; 0x1c49c6

UnknownText_0x1c49c6: ; 0x1c49c6
	db $0, "Incidentally…", $51
	db "It seems to have", $4f
	db "grown a little.", $51
	db "@"
	text_from_ram $d003
	db $0, " seems", $4f
	db "to be becoming", $55
	db "more confident.", $57
; 0x1c4a21

UnknownText_0x1c4a21: ; 0x1c4a21
	db $0, "Incidentally…", $51
	db "@"
	text_from_ram $d003
	db $0, " has", $4f
	db "grown. It's gained", $55
	db "much strength.", $57
; 0x1c4a5b

UnknownText_0x1c4a5b: ; 0x1c4a5b
	db $0, "Incidentally…", $51
	db "It certainly has", $4f
	db "grown mighty!", $51
	db "This @"
	text_from_ram $d003
	db $0, $4f
	db "must have come", $51
	db "through numerous", $4f
	db "#MON battles.", $51
	db "It looks brimming", $4f
	db "with confidence.", $57
; 0x1c4ae5

UnknownText_0x1c4ae5: ; 0x1c4ae5
	db $0, "Incidentally…", $51
	db "I'm impressed by", $4f
	db "your dedication.", $51
	db "It's been a long", $4f
	db "time since I've", $51
	db "seen a #MON as", $4f
	db "mighty as this", $55
	db "@"
	text_from_ram $d003
	db $0, ".", $51
	db "I'm sure that", $4f
	db "seeing @"
	text_from_ram $d003
	db $0, $51
	db "in battle would", $4f
	db "excite anyone.", $57
; 0x1c4b92

UnknownText_0x1c4b92: ; 0x1c4b92
	db $0, "Congratulations!", $4f
	db "Your @"
	text_from_ram $d086
	db $50
; 0x1c4bae

UnknownText_0x1c4bae: ; 0x1c4bae
	db $50
; 0x1c4baf

UnknownText_0x1c4baf: ; 0x1c4baf
	db $0, $51
	db "evolved into", $4f
	db "@"
	text_from_ram $d073
	db $0, "!", $57
; 0x1c4bc5

UnknownText_0x1c4bc5: ; 0x1c4bc5
	db $0, "Huh? @"
	text_from_ram $d086
	db $0, $4f
	db "stopped evolving!", $58
; 0x1c4be3

UnknownText_0x1c4be3: ; 0x1c4be3
	db $0, "What? @"
	text_from_ram $d086
	db $0, $4f
	db "is evolving!", $57
; 0x1c4bfd

UnknownText_0x1c4bfd: ; 0x1c4bfd
	db $0, "How many?", $57
; 0x1c4c08

UnknownText_0x1c4c08: ; 0x1c4c08
	deciram $d10c, $12
	db $0, " @"
	text_from_ram $d086
	db $0, "(S)", $4f
	db "will be ¥@"
	deciram $ffc3, $36
	db $0, ".", $57
; 0x1c4c28

UnknownText_0x1c4c28: ; 0x1c4c28
	db $0, "Hello, dear.", $51
	db "I sell inexpensive", $4f
	db "herbal medicine.", $51
	db "They're good, but", $4f
	db "a trifle bitter.", $51
	db "Your #MON may", $4f
	db "not like them.", $51
	db "Hehehehe…", $57
; 0x1c4ca3

UnknownText_0x1c4ca3: ; 0x1c4ca3
	db $0, "How many?", $57
; 0x1c4cae

UnknownText_0x1c4cae: ; 0x1c4cae
	deciram $d10c, $12
	db $0, " @"
	text_from_ram $d086
	db $0, "(S)", $4f
	db "will be ¥@"
	deciram $ffc3, $36
	db $0, ".", $57
; 0x1c4cce

UnknownText_0x1c4cce: ; 0x1c4cce
	db $0, "Thank you, dear.", $4f
	db "Hehehehe…", $57
; 0x1c4cea

UnknownText_0x1c4cea: ; 0x1c4cea
	db $0, "Oh? Your PACK is", $4f
	db "full, dear.", $57
; 0x1c4d08

UnknownText_0x1c4d08: ; 0x1c4d08
	db $0, "Hehehe… You don't", $4f
	db "have the money.", $57
; 0x1c4d2a

UnknownText_0x1c4d2a: ; 0x1c4d2a
	db $0, "Come again, dear.", $4f
	db "Hehehehe…", $57
; 0x1c4d47

UnknownText_0x1c4d47: ; 0x1c4d47
	db $0, "Hiya! Care to see", $4f
	db "some bargains?", $51
	db "I sell rare items", $4f
	db "that nobody else", $51
	db "carries--but only", $4f
	db "one of each item.", $57
; 0x1c4db0

UnknownText_0x1c4db0: ; 0x1c4db0
	text_from_ram $d086
	db $0, " costs", $4f
	db "¥@"
	deciram $ffc3, $36
	db $0, ". Want it?", $57
; 0x1c4dcd

UnknownText_0x1c4dcd: ; 0x1c4dcd
	db $0, "Thanks.", $57
; 0x1c4dd6

UnknownText_0x1c4dd6: ; 0x1c4dd6
	db $0, "Uh-oh, your PACK", $4f
	db "is chock-full.", $57
; 0x1c4df7

UnknownText_0x1c4df7: ; 0x1c4df7
	db $0, "You bought that", $4f
	db "already. I'm all", $55
	db "sold out of it.", $57
; 0x1c4e28

UnknownText_0x1c4e28: ; 0x1c4e28
	db $0, "Uh-oh, you're", $4f
	db "short on funds.", $57
; 0x1c4e46

UnknownText_0x1c4e46: ; 0x1c4e46
	db $0, "Come by again", $4f
	db "sometime.", $57
; 0x1c4e5f

UnknownText_0x1c4e5f: ; 0x1c4e5f
	db $0, "What's up? Need", $4f
	db "some medicine?", $57
; 0x1c4e7e

UnknownText_0x1c4e7e: ; 0x1c4e7e
	db $0, "How many?", $57
; 0x1c4e89

UnknownText_0x1c4e89: ; 0x1c4e89
	deciram $d10c, $12
	db $0, " @"
	text_from_ram $d086
	db $0, "(S)", $4f
	db "will cost ¥@"
	deciram $ffc3, $36
	db $0, ".", $57
; 0x1c4eab

UnknownText_0x1c4eab: ; 0x1c4eab
	db $0, "Thanks much!", $57
; 0x1c4eb9

UnknownText_0x1c4eb9: ; 0x1c4eb9
	db $0, "You don't have any", $4f
	db "more space.", $57
; 0x1c4ed8

UnknownText_0x1c4ed8: ; 0x1c4ed8
	db $0, "Huh? That's not", $4f
	db "enough money.", $57
; 0x1c4ef6

UnknownText_0x1c4ef6: ; 0x1c4ef6
	db $0, "All right.", $4f
	db "See you around.", $57
; 0x1c4f12

UnknownText_0x1c4f12: ; 0x1c4f12
	db $0, "You don't have", $4f
	db "anything to sell.", $58
; 0x1c4f33

UnknownText_0x1c4f33: ; 0x1c4f33
	db $0, "How many?", $57
; 0x1c4f3e

UnknownText_0x1c4f3e: ; 0x1c4f3e
	db $0, "I can pay you", $4f
	db "¥@"
	deciram $ffc3, $36
	db $0, ".", $51
	db "Is that OK?", $57
; 0x1c4f62

UnknownText_0x1c4f62: ; 0x1c4f62
	db $0, "Welcome! How may I", $4f
	db "help you?", $57
; 0x1c4f80

UnknownText_0x1c4f80: ; 0x1c4f80
	db $0, "Here you are.", $4f
	db "Thank you!", $57
; 0x1c4f9a

UnknownText_0x1c4f9a: ; 0x1c4f9a
	db $0, "You don't have", $4f
	db "enough money.", $57
; 0x1c4fb7

UnknownText_0x1c4fb7: ; 0x1c4fb7
	db $0, "You can't carry", $4f
	db "any more items.", $57
; 0x1c4fd7

UnknownText_0x1c4fd7: ; 0x1c4fd7
	db $0, "Sorry, I can't buy", $4f
	db "that from you.", $58
; 0x1c4ff9

UnknownText_0x1c4ff9: ; 0x1c4ff9
	db $0, "Please come again!", $57
; 0x1c500d

UnknownText_0x1c500d: ; 0x1c500d
	db $0, "Can I do anything", $4f
	db "else for you?", $57
; 0x1c502e

UnknownText_0x1c502e: ; 0x1c502e
	db $0, "Got ¥@"
	deciram $ffc3, $36
	db $0, " for", $4f
	db "@"
	text_from_ram $d086
	db $0, "(S).", $57
; 0x1c5049

UnknownText_0x1c5049: ; 0x1c5049
	db $0, "Bet how many", $4f
	db "coins?", $57
; 0x1c505e

UnknownText_0x1c505e: ; 0x1c505e
	db $0, "Start!", $57
; 0x1c5066

UnknownText_0x1c5066: ; 0x1c5066
	db $0, "Not enough", $4f
	db "coins.", $58
; 0x1c5079

UnknownText_0x1c5079: ; 0x1c5079
	db $0, "Darn… Ran out of", $4f
	db "coins…", $57
; 0x1c5092

UnknownText_0x1c5092: ; 0x1c5092
	db $0, "Play again?", $57
; 0x1c509f

UnknownText_0x1c509f: ; 0x1c509f
	db $0, "lined up!", $4f
	db "Won @"
	text_from_ram $d086
	db $0, " coins!", $57
; 0x1c50bb

UnknownText_0x1c50bb: ; 0x1c50bb
	db $0, "Darn!", $57
; 0x1c50c2

_MobileStadiumEntryText: ; 0x1c50c2
	db $0, "Data for use in", $4f
	db "the MOBILE STADIUM", $51
	db "of the N64 #MON", $4f
	db "STADIUM 2 can be", $55
	db "read here.", $51
	db "Read the data?", $57
; 0x1c5121

_MobileStadiumSuccessText: ; 0x1c5121
	db $0, "Data transfer is", $4f
	db "complete.", $51
	db "We hope you enjoy", $4f
	db "MOBILE STADIUM", $51
	db "battles in the N64", $4f
	db "#MON STADIUM 2.", $51
	db $57
; 0x1c5182

UnknownText_0x1c5182: ; 0x1c5182
	db $0, "Clock time unknown", $57
; 0x1c5196

UnknownText_0x1c5196: ; 0x1c5196
	db $0, "Delete the saved", $4f
	db "LOG-IN PASSWORD?", $57
; 0x1c51b9

UnknownText_0x1c51b9: ; 0x1c51b9
	db $0, "Deleted the LOG-IN", $4f
	db "PASSWORD.", $57
; 0x1c51d7

UnknownText_0x1c51d7: ; 0x1c51d7
	db $0, "Pick three #MON", $4f
	db "for battle.", $58
; 0x1c51f4

UnknownText_0x1c51f4: ; 0x1c51f4
	text_from_ram $d006
	db $0, ",", $4f
	db "@"
	text_from_ram $d00c
	db $0, " and", $55
	db "@"
	text_from_ram $d012
	db $0, ".", $51
	db "Use these three?", $57
; 0x1c521c

UnknownText_0x1c521c: ; 0x1c521c
	db $0, "Only three #MON", $4f
	db "may enter.", $58
; 0x1c5238

UnknownText_0x1c5238: ; 0x1c5238
	db $0, "The CARD FOLDER", $4f
	db "stores your and", $51
	db "your friends'", $4f
	db "CARDS.", $51
	db "A CARD contains", $4f
	db "information like", $51
	db "the person's name,", $4f
	db "phone number and", $55
	db "profile.", $51
	db $57
; 0x1c52bc

UnknownText_0x1c52bc: ; 0x1c52bc
	db $0, "This is your CARD.", $51
	db "Once you've", $4f
	db "entered your phone", $51
	db "number, you can", $4f
	db "trade CARDS with", $55
	db "your friends.", $51
	db $57
; 0x1c531e

UnknownText_0x1c531e: ; 0x1c531e
	db $0, "If you have your", $4f
	db "friend's CARD, you", $51
	db "can use it to make", $4f
	db "a call from a", $51
	db "mobile phone on", $4f
	db "the 2nd floor of a", $55
	db "#MON CENTER.", $51
	db $57
; 0x1c5394

UnknownText_0x1c5394: ; 0x1c5394
	db $0, "To safely store", $4f
	db "your collection of", $51
	db "CARDS, you must", $4f
	db "set a PASSCODE for", $55
	db "your CARD FOLDER.", $51
	db $57
; 0x1c53ee

UnknownText_0x1c53ee: ; 0x1c53ee
	db $0, "If the CARD FOLDER", $4f
	db "is deleted, all", $51
	db "its CARDS and the", $4f
	db "PASSCODE will also", $55
	db "be deleted.", $51
	db "Beware--a deleted", $4f
	db "CARD FOLDER can't", $55
	db "be restored.", $51
	db "Want to delete", $4f
	db "your CARD FOLDER?", $57
; 0x1c5494

UnknownText_0x1c5494: ; 0x1c5494
	db $0, "Are you sure you", $4f
	db "want to delete it?", $57
; 0x1c54b9

UnknownText_0x1c54b9: ; 0x1c54b9
	db $0, "The CARD FOLDER", $4f
	db "has been deleted.", $51
	db $57
; 0x1c54dd

UnknownText_0x1c54dd: ; 0x1c54dd
	db $0, "There is an older", $4f
	db "CARD FOLDER from a", $55
	db "previous journey.", $51
	db "Do you want to", $4f
	db "open it?", $57
; 0x1c552d

UnknownText_0x1c552d: ; 0x1c552d
	db $0, "Delete the old", $4f
	db "CARD FOLDER?", $57
; 0x1c554a

UnknownText_0x1c554a: ; 0x1c554a
	db $0, "Finish registering", $4f
	db "CARDS?", $57
; 0x1c5565

UnknownText_0x1c5565: ; 0x1c5565
	db $0, "Huh? Sorry, wrong", $4f
	db "number!", $57
; 0x1c5580

UnknownText_0x1c5580: ; 0x1c5580
	db $0, "Click!", $57
; 0x1c5588

UnknownText_0x1c5588: ; 0x1c5588
	db $0, $56, $57
; 0x1c558b

UnknownText_0x1c558b: ; 0x1c558b
	db $0, "That number is out", $4f
	db "of the area.", $57
; 0x1c55ac

UnknownText_0x1c55ac: ; 0x1c55ac
	db $0, "Just go talk to", $4f
	db "that person!", $57
; 0x1c55ca

UnknownText_0x1c55ca: ; 0x1c55ca
	db $0, "Thank you!", $57
; 0x1c55d6

UnknownText_0x1c55d6: ; 0x1c55d6
	db $0, "  :", $57
; 0x1c55db

UnknownText_0x1c55db: ; 0x1c55db
	db $0, "Password OK.", $4f
	db "Select CONTINUE &", $55
	db "reset settings.", $58
; 0x1c560b

UnknownText_0x1c560b: ; 0x1c560b
	db $0, "Wrong password!", $58
; 0x1c561c

UnknownText_0x1c561c: ; 0x1c561c
	db $0, "Reset the clock?", $57
; 0x1c562e

UnknownText_0x1c562e: ; 0x1c562e
	db $0, "Please enter the", $4f
	db "password.", $57
; 0x1c564a

UnknownText_0x1c564a: ; 0x1c564a
	db $0, "Clear all save", $4f
	db "data?", $57
; 0x1c5660

UnknownText_0x1c5660: ; 0x1c5660
	text_from_ram $d050
	db $0, " learned", $4f
	db "@"
	text_from_ram $d086
	db $0, "!@"
	sound0
	text_waitbutton
	db $50
; 0x1c5677

UnknownText_0x1c5677: ; 0x1c5677
	db $50
; 0x1c5678

UnknownText_0x1c5678: ; 0x1c5678
	db $0, "Which move should", $4e, "be forgotten?", $57
; 0x1c5699

UnknownText_0x1c5699: ; 0x1c5699
	db $0, "Stop learning", $4f
	db "@"
	text_from_ram $d086
	db $0, "?", $57
; 0x1c56af

UnknownText_0x1c56af: ; 0x1c56af
	text_from_ram $d050
	db $0, $4f
	db "did not learn", $55
	db "@"
	text_from_ram $d086
	db $0, ".", $58
; 0x1c56c9

UnknownText_0x1c56c9: ; 0x1c56c9
	text_from_ram $d050
	db $0, " is", $4f
	db "trying to learn", $55
	db "@"
	text_from_ram $d086
	db $0, ".", $51
	db "But @"
	text_from_ram $d050
	db $0, $4f
	db "can't learn more", $55
	db "than four moves.", $51
	db "Delete an older", $4f
	db "move to make room", $55
	db "for @"
	text_from_ram $d086
	db $0, "?", $57
; 0x1c5740

UnknownText_0x1c5740: ; 0x1c5740
	db $0, "1, 2 and…@"
	interpret_data
	db $50
; 0x1c574d

UnknownText_0x1c574d: ; 0x1c574d
	db $50
; 0x1c574e

UnknownText_0x1c574e: ; 0x1c574e
	db $0, " Poof!@"
	interpret_data
	db $0, $51
	db "@"
	text_from_ram $d050
	db $0, " forgot", $4f
	db "@"
	text_from_ram $d073
	db $0, ".", $51
	db "And…", $58
; 0x1c5772

UnknownText_0x1c5772: ; 0x1c5772
	db $0, "HM moves can't be", $4f
	db "forgotten now.", $58
; 0x1c5793

UnknownText_0x1c5793: ; 0x1c5793
	db $0, "Play with three", $4f
	db "coins?", $57
; 0x1c57ab

UnknownText_0x1c57ab: ; 0x1c57ab
	db $0, "Not enough coins…", $58
; 0x1c57be

UnknownText_0x1c57be: ; 0x1c57be
	db $0, "Choose a card.", $57
; 0x1c57ce

UnknownText_0x1c57ce: ; 0x1c57ce
	db $0, "Place your bet.", $57
; 0x1c57df

UnknownText_0x1c57df: ; 0x1c57df
	db $0, "Want to play", $4f
	db "again?", $57
; 0x1c57f4

UnknownText_0x1c57f4: ; 0x1c57f4
	db $0, "The cards have", $4f
	db "been shuffled.", $58
; 0x1c5813

UnknownText_0x1c5813: ; 0x1c5813
	db $0, "Yeah!", $57
; 0x1c581a

UnknownText_0x1c581a: ; 0x1c581a
	db $0, "Darn…", $57
; 0x1c5821

UnknownText_0x1c5821: ; 0x1c5821
	current_day
	db $50
; 0x1c5823

UnknownText_0x1c5823: ; 0x1c5823
	db $50
; 0x1c5824

UnknownText_0x1c5824: ; 0x1c5824
	db $0, $56, $57
; 0x1c5827

UnknownText_0x1c5827: ; 0x1c5827
	db $0, "You're out of the", $4f
	db "service area.", $58
; 0x1c5847

UnknownText_0x1c5847: ; 0x1c5847
	db $0, "Whom do you want", $4f
	db "to call?", $57
; 0x1c5862

UnknownText_0x1c5862: ; 0x1c5862
	db $0, "Press any button", $4f
	db "to exit.", $57
; 0x1c587d

UnknownText_0x1c587d: ; 0x1c587d
	db $0, "Delete this stored", $4f
	db "phone number?", $57
; 0x1c589f

UnknownText_0x1c589f: ; 0x1c589f
	db $0, "Which prize would", $4f
	db "you like?", $57
; 0x1c58bc

UnknownText_0x1c58bc: ; 0x1c58bc
	text_from_ram $d073
	db $0, "?", $4f
	db "Is that right?", $57
; 0x1c58d1

UnknownText_0x1c58d1: ; 0x1c58d1
	db $0, "Here you go!", $51
	db $57
; 0x1c58e0

UnknownText_0x1c58e0: ; 0x1c58e0
	db $0, "You don't have", $4f
	db "enough points.", $51
	db $57
; 0x1c58ff

UnknownText_0x1c58ff: ; 0x1c58ff
	db $0, "You have no room", $4f
	db "for it.", $51
	db $57
; 0x1c591a

UnknownText_0x1c591a: ; 0x1c591a
	db $0, "Oh. Please come", $4f
	db "back again!", $57
; 0x1c5937

UnknownText_0x1c5937: ; 0x1c5937
	db $0, "Excuse me!", $51
	db $57
; 0x1c5944

UnknownText_0x1c5944: ; 0x1c5944
	db $0, "Excuse me.", $4f
	db "You're not ready.", $51
	db $57
; 0x1c5962

UnknownText_0x1c5962: ; 0x1c5962
	db $0, "Please return when", $4f
	db "you're ready.", $57
; 0x1c5983

UnknownText_0x1c5983: ; 0x1c5983
	db $0, "You need at least", $4f
	db "three #MON.", $51
	db $57
; 0x1c59a3

UnknownText_0x1c59a3: ; 0x1c59a3
	db $0, "Sorry, an EGG", $4f
	db "doesn't qualify.", $51
	db $57
; 0x1c59c3

UnknownText_0x1c59c3: ; 0x1c59c3
	db $0, "Only three #MON", $4f
	db "may be entered.", $51
	db $57
; 0x1c59e5

UnknownText_0x1c59e5: ; 0x1c59e5
	db $0, "The @"
	text_from_ram $d086
	db $0, " #MON", $4f
	db "must all be", $55
	db "different kinds.", $51
	db $57
; 0x1c5a13

UnknownText_0x1c5a13: ; 0x1c5a13
	db $0, "The @"
	text_from_ram $d086
	db $0, " #MON", $4f
	db "must not hold the", $55
	db "same items.", $51
	db $57
; 0x1c5a42

UnknownText_0x1c5a42: ; 0x1c5a42
	db $0, "You can't take an", $4f
	db "EGG!", $51
	db $57
; 0x1c5a5a

UnknownText_0x1c5a5a: ; 0x1c5a5a
	db $0, "It dodged the", $4f
	db "thrown BALL!", $51
	db "This #MON", $4f
	db "can't be caught!", $58
; 0x1c5a90

UnknownText_0x1c5a90: ; 0x1c5a90
	db $0, "You missed the", $4f
	db "#MON!", $58
; 0x1c5aa6

UnknownText_0x1c5aa6: ; 0x1c5aa6
	db $0, "Oh no! The #MON", $4f
	db "broke free!", $58
; 0x1c5ac3

UnknownText_0x1c5ac3: ; 0x1c5ac3
	db $0, "Aww! It appeared", $4f
	db "to be caught!", $58
; 0x1c5ae3

UnknownText_0x1c5ae3: ; 0x1c5ae3
	db $0, "Aargh!", $4f
	db "Almost had it!", $58
; 0x1c5afa

UnknownText_0x1c5afa: ; 0x1c5afa
	db $0, "Shoot! It was so", $4f
	db "close too!", $58
; 0x1c5b17

UnknownText_0x1c5b17: ; 0x1c5b17
	db $0, "Gotcha! @"
	text_from_ram $c616
	db $0, $4f
	db "was caught!@"
	sound0x02
	db $50
; 0x1c5b34

UnknownText_0x1c5b34: ; 0x1c5b34
	db $50
; 0x1c5b35

UnknownText_0x1c5b35: ; 0x1c5b35
	text_waitbutton
	db $50
; 0x1c5b37

UnknownText_0x1c5b37: ; 0x1c5b37
	db $50
; 0x1c5b38

UnknownText_0x1c5b38: ; 0x1c5b38
	text_from_ram $d050
	db $0, " was", $4f
	db "sent to BILL's PC.", $58
; 0x1c5b53

UnknownText_0x1c5b53: ; 0x1c5b53
	text_from_ram $c616
	db $0, "'s data", $4f
	db "was newly added to", $55
	db "the #DEX.@"
	sound0x2C
	text_waitbutton
	db $50
; 0x1c5b7e

UnknownText_0x1c5b7e: ; 0x1c5b7e
	db $50
; 0x1c5b7f

UnknownText_0x1c5b7f: ; 0x1c5b7f
	db $0, "Give a nickname to", $4f
	db "@"
	text_from_ram $d073
	db $0, "?", $57
; 0x1c5b9a

UnknownText_0x1c5b9a: ; 0x1c5b9a
	text_from_ram $d073
	db $0, "'s", $4f
	db "@"
	text_from_ram $d086
	db $0, " rose.", $58
; 0x1c5bac

UnknownText_0x1c5bac: ; 0x1c5bac
	db $0, "That can't be used", $4f
	db "on this #MON.", $58
; 0x1c5bcd

UnknownText_0x1c5bcd: ; 0x1c5bcd
	db $0, "The REPEL used", $4f
	db "earlier is still", $55
	db "in effect.", $58
; 0x1c5bf9

UnknownText_0x1c5bf9: ; 0x1c5bf9
	db $0, "Played the #", $4f
	db "FLUTE.", $51
	db "Now, that's a", $4f
	db "catchy tune!", $58
; 0x1c5c28

UnknownText_0x1c5c28: ; 0x1c5c28
	db $0, "All sleeping", $4f
	db "#MON woke up.", $58
; 0x1c5c44

UnknownText_0x1c5c44: ; 0x1c5c44
	db $0, $52, " played the", $4f
	db "# FLUTE.@"
	text_waitbutton
	db $50
; 0x1c5c5d

UnknownText_0x1c5c5d: ; 0x1c5c5d
	db $50
; 0x1c5c5e

UnknownText_0x1c5c5e: ; 0x1c5c5e
	db $0, "You now have", $4f
	db "@"
	deciram $dc4b, $12
	db $0, " points.", $57
; 0x1c5c7b

UnknownText_0x1c5c7b: ; 0x1c5c7b
	db $0, "Coins:", $4f
	db "@"
	deciram $d855, $24
	db $50
; 0x1c5c89

UnknownText_0x1c5c89: ; 0x1c5c89
	db $50
; 0x1c5c8a

UnknownText_0x1c5c8a: ; 0x1c5c8a
	db $0, "Raise the PP of", $4f
	db "which move?", $57
; 0x1c5ca7

UnknownText_0x1c5ca7: ; 0x1c5ca7
	db $0, "Restore the PP of", $4f
	db "which move?", $57
; 0x1c5cc6

UnknownText_0x1c5cc6: ; 0x1c5cc6
	text_from_ram $d086
	db $0, "'s PP", $4f
	db "is maxed out.", $58
; 0x1c5cdd

UnknownText_0x1c5cdd: ; 0x1c5cdd
	text_from_ram $d086
	db $0, "'s PP", $4f
	db "increased.", $58
; 0x1c5cf1

UnknownText_0x1c5cf1: ; 0x1c5cf1
	db $0, "PP was restored.", $58
; 0x1c5d03

UnknownText_0x1c5d03: ; 0x1c5d03
	db $0, "There was a trophy", $4f
	db "inside!@"
	sound0
	db $0, $51
	db "@"
	text_from_ram PlayerName
	db $0, " sent the", $4f
	db "trophy home.", $58
; 0x1c5d3e

UnknownText_0x1c5d3e: ; 0x1c5d3e
	db $0, "It looks bitter…", $58
; 0x1c5d50

UnknownText_0x1c5d50: ; 0x1c5d50
	db $0, "That can't be used", $4f
	db "on an EGG.", $58
; 0x1c5d6e

UnknownText_0x1c5d6e: ; 0x1c5d6e
	db $0, "OAK: ", $52, "!", $4f
	db "This isn't the", $55
	db "time to use that!", $58
; 0x1c5d97

UnknownText_0x1c5d97: ; 0x1c5d97
	db $0, "That belongs to", $4f
	db "someone else!", $58
; 0x1c5db6

UnknownText_0x1c5db6: ; 0x1c5db6
	db $0, "It won't have any", $4f
	db "effect.", $58
; 0x1c5dd0

UnknownText_0x1c5dd0: ; 0x1c5dd0
	db $0, "The trainer", $4f
	db "blocked the BALL!", $58
; 0x1c5def

UnknownText_0x1c5def: ; 0x1c5def
	db $0, "Don't be a thief!", $58
; 0x1c5e01

UnknownText_0x1c5e01: ; 0x1c5e01
	db $0, "Cycling isn't", $4f
	db "allowed here.", $58
; 0x1c5e1d

UnknownText_0x1c5e1d: ; 0x1c5e1d
	db $0, "Can't get on your", $4f
	db "@"
	text_from_ram $d073
	db $0, " now.", $58
; 0x1c5e3a

UnknownText_0x1c5e3a: ; 0x1c5e3a
	db $0, "The #MON BOX", $4f
	db "is full. That", $55
	db "can't be used now.", $58
; 0x1c5e68

UnknownText_0x1c5e68: ; 0x1c5e68
	db $0, $52, " used the@"
	text_dunno1
	text_from_ram $d086
	db $0, ".", $57
; 0x1c5e7b

UnknownText_0x1c5e7b: ; 0x1c5e7b
	db $0, $52, " got on the@"
	text_dunno1
	text_from_ram $d086
	db $0, ".", $58
; 0x1c5e90

UnknownText_0x1c5e90: ; 0x1c5e90
	db $0, $52, " got off@"
	text_dunno1
	db $0, "the @"
	text_from_ram $d086
	db $0, ".", $58
; 0x1c5ea8

UnknownText_0x1c5ea8: ; 0x1c5ea8
	text_from_ram $d073
	db $0, " knows", $4f
	db "@"
	text_from_ram $d086
	db $0, ".", $58
; 0x1c5eba

UnknownText_0x1c5eba: ; 0x1c5eba
	db $0, "That #MON knows", $4f
	db "only one move.", $57
; 0x1c5eda

UnknownText_0x1c5eda: ; 0x1c5eda
	db $0, "Oh, make it forget", $4f
	db "@"
	text_from_ram $d073
	db $0, "?", $57
; 0x1c5ef5

UnknownText_0x1c5ef5: ; 0x1c5ef5
	db $0, "Done! Your #MON", $4f
	db "forgot the move.", $57
; 0x1c5f17

UnknownText_0x1c5f17: ; 0x1c5f17
	db $0, "An EGG doesn't", $4f
	db "know any moves!", $57
; 0x1c5f36

UnknownText_0x1c5f36: ; 0x1c5f36
	db $0, "No? Come visit me", $4f
	db "again.", $57
; 0x1c5f50

UnknownText_0x1c5f50: ; 0x1c5f50
	db $0, "Which move should", $4f
	db "it forget, then?", $58
; 0x1c5f74

UnknownText_0x1c5f74: ; 0x1c5f74
	db $0, "Um… Oh, yes, I'm", $4f
	db "the MOVE DELETER.", $51
	db "I can make #MON", $4f
	db "forget moves.", $51
	db "Shall I make a", $4f
	db "#MON forget?", $57
; 0x1c5fd1

UnknownText_0x1c5fd1: ; 0x1c5fd1
	db $0, "Which #MON?", $58
; 0x1c5fde

UnknownText_0x1c5fde: ; 0x1c5fde
	db $0, " DST,", $4f
	db "is that OK?", $57
; 0x1c5ff1

UnknownText_0x1c5ff1: ; 0x1c5ff1
	db $0, ",", $4f
	db "is that OK?", $57
; 0x1c6000

UnknownText_0x1c6000: ; 0x1c6000
	db $0, "Do you want to", $4f
	db "switch to Daylight", $55
	db "Saving Time?", $57
; 0x1c6030

UnknownText_0x1c6030: ; 0x1c6030
	db $0, "I set the clock", $4f
	db "forward by one", $55
	db "hour.", $58
; 0x1c6056

UnknownText_0x1c6056: ; 0x1c6056
	db $0, "Is Daylight Saving", $4f
	db "Time over?", $57
; 0x1c6075

UnknownText_0x1c6075: ; 0x1c6075
	db $0, "I put the clock", $4f
	db "back one hour.", $58
; 0x1c6095

UnknownText_0x1c6095: ; 0x1c6095
	db $0, "Do you want to", $4f
	db "adjust your clock", $51
	db "for Daylight", $4f
	db "Saving Time?", $57
; 0x1c60d1

UnknownText_0x1c60d1: ; 0x1c60d1
	db $0, "I lost the in-", $4f
	db "struction booklet", $55
	db "for the #GEAR.", $51
	db "Come back again in", $4f
	db "a while.", $58
; 0x1c611e

