_FruitBearingTreeText: ; 0x1bc000
	text "It's a fruit-"
	line "bearing tree."
	done
; 0x1bc01c

_HeyItsFruitText: ; 0x1bc01c
	text "Hey! It's"
	line "@"
	text_from_ram StringBuffer3
	text "!"
	done
; 0x1bc02d

_ObtainedFruitText: ; 0x1bc02d
	text "Obtained"
	line "@"
	text_from_ram StringBuffer3
	text "!"
	done
; 0x1bc03e

_FruitPackIsFullText: ; 0x1bc03e
	text "But the PACK is"
	line "full…"
	done
; 0x1bc055

_NothingHereText: ; 0x1bc055
	text "There's nothing"
	line "here…"
	done
; 0x1bc06b

UnknownText_0x1bc06b: ; 0x1bc06b
	text "Which APRICORN"
	line "should I use?"
	done
; 0x1bc089

UnknownText_0x1bc089: ; 0x1bc089
	text "How many should I"
	line "make?"
	done
; 0x1bc0a2

UnknownText_0x1bc0a2: ; 0x1bc0a2
	text_from_ram StringBuffer1
	text ""
	line "recovered @"
	deciram wd1f3, $23
	text "HP!"
	done
; 0x1bc0bb

UnknownText_0x1bc0bb: ; 0x1bc0bb
	text_from_ram StringBuffer1
	text "'s"
	line "cured of poison."
	done
; 0x1bc0d2

UnknownText_0x1bc0d2: ; 0x1bc0d2
	text_from_ram StringBuffer1
	text "'s"
	line "rid of paralysis."
	done
; 0x1bc0ea

UnknownText_0x1bc0ea: ; 0x1bc0ea
	text_from_ram StringBuffer1
	text "'s"
	line "burn was healed."
	done
; 0x1bc101

UnknownText_0x1bc101: ; 0x1bc101
	text_from_ram StringBuffer1
	text ""
	line "was defrosted."
	done
; 0x1bc115

UnknownText_0x1bc115: ; 0x1bc115
	text_from_ram StringBuffer1
	text ""
	line "woke up."
	done
; 0x1bc123

UnknownText_0x1bc123: ; 0x1bc123
	text_from_ram StringBuffer1
	text "'s"
	line "health returned."
	done
; 0x1bc13a

UnknownText_0x1bc13a: ; 0x1bc13a
	text_from_ram StringBuffer1
	text ""
	line "is revitalized."
	done
; 0x1bc14f

UnknownText_0x1bc14f: ; 0x1bc14f
	text_from_ram StringBuffer1
	text " grew to"
	line "level @"
	deciram CurPartyLevel, $13
	text "!@"
	sound0
	text_waitbutton
	db "@"
; 0x1bc16d

UnknownText_0x1bc16d: ; 0x1bc16d
	db "@"
; 0x1bc16e

UnknownText_0x1bc16e: ; 0x1bc16e
	text_from_ram StringBuffer1
	text " came"
	line "to its senses."
	done
; 0x1bc187

UnknownText_0x1bc187: ; 0x1bc187
	text "Please enter any"
	line "four-digit number."
	done
; 0x1bc1ac

UnknownText_0x1bc1ac: ; 0x1bc1ac
	text "Enter the same"
	line "number to confirm."
	done
; 0x1bc1cf

UnknownText_0x1bc1cf: ; 0x1bc1cf
	text "That's not the"
	line "same number."
	done
; 0x1bc1eb

UnknownText_0x1bc1eb: ; 0x1bc1eb
	text "Your PASSCODE has"
	line "been set."
	para "Enter this number"
	line "next time to open"
	cont "the CARD FOLDER."
	para ""
	done
; 0x1bc23e

UnknownText_0x1bc23e: ; 0x1bc23e
	text "0000 is invalid!"
	para ""
	done
; 0x1bc251

UnknownText_0x1bc251: ; 0x1bc251
	text "Enter the CARD"
	next "FOLDER PASSCODE."
	done
; 0x1bc272

UnknownText_0x1bc272: ; 0x1bc272
	text "Incorrect"
	line "PASSCODE!"
	para ""
	done
; 0x1bc288

UnknownText_0x1bc288: ; 0x1bc288
	text "CARD FOLDER open.@"
	db "@"
; 0x1bc29c

UnknownText_0x1bc29c: ; 0x1bc29c
	text $56, $56, $56, $56, $56, $56
	line $56, $56, $56, $56, $56, $56

	para "Zzz… Hm? Wha…?"
	line "You woke me up!"

	para "Will you check the"
	line "clock for me?"
	prompt
; 0x1bc2eb

UnknownText_0x1bc2eb: ; 0x1bc2eb
	text "What time is it?"
	done
; 0x1bc2fd

UnknownText_0x1bc2fd: ; 0x1bc2fd
	text "What?@"
	db "@"
; 0x1bc305

UnknownText_0x1bc305: ; 0x1bc305
	text "?"
	done
; 0x1bc308

UnknownText_0x1bc308: ; 0x1bc308
	text "How many minutes?"
	done
; 0x1bc31b

UnknownText_0x1bc31b: ; 0x1bc31b
	text "Whoa!@"
	db "@"
; 0x1bc323

UnknownText_0x1bc323: ; 0x1bc323
	text "?"
	done
; 0x1bc326

UnknownText_0x1bc326: ; 0x1bc326
	text "!"
	line "I overslept!"
	done
; 0x1bc336

UnknownText_0x1bc336: ; 0x1bc336
	text "!"
	line "Yikes! I over-"
	cont "slept!"
	done
; 0x1bc34f

UnknownText_0x1bc34f: ; 0x1bc34f
	text "!"
	line "No wonder it's so"
	cont "dark!"
	done
; 0x1bc369

UnknownText_0x1bc369: ; 0x1bc369
	text "What day is it?"
	done
; 0x1bc37a

UnknownText_0x1bc37a: ; 0x1bc37a
	text ", is it?"
	done
; 0x1bc384

UnknownText_0x1bc384: ; 0x1bc384
	text "There is nothing"
	line "connected."
	done
; 0x1bc3a1

UnknownText_0x1bc3a1: ; 0x1bc3a1
	text "Check cell phone"
	line "adapter."
	done
; 0x1bc3bc

UnknownText_0x1bc3bc: ; 0x1bc3bc
	text "Check CDMA"
	line "adapter."
	done
; 0x1bc3d1

UnknownText_0x1bc3d1: ; 0x1bc3d1
	text "Check DOCOMO PHS"
	line "adapter."
	done
; 0x1bc3ec

UnknownText_0x1bc3ec: ; 0x1bc3ec
	text "Check DDI PHS"
	line "adapter."
	done
; 0x1bc404

UnknownText_0x1bc404: ; 0x1bc404
	text "Check unlimited"
	line "battle mobile"
	cont "adapter."
	done
; 0x1bc42c

UnknownText_0x1bc42c: ; 0x1bc42c
	text "The password is:"
	line ""
	done
; 0x1bc43f

UnknownText_0x1bc43f: ; 0x1bc43f
	text "Is this OK?"
	done
; 0x1bc44c

UnknownText_0x1bc44c: ; 0x1bc44c
	text "Enter the"
	line "ID no."
	done
; 0x1bc45e

UnknownText_0x1bc45e: ; 0x1bc45e
	text "Enter the"
	line "amount."
	done
; 0x1bc471

UnknownText_0x1bc471: ; 0x1bc471
	text "There's nothing to"
	line "choose."
	prompt
; 0x1bc48c

UnknownText_0x1bc48c: ; 0x1bc48c
	text "Which side do you"
	line "want to put it on?"
	done
; 0x1bc4b2

UnknownText_0x1bc4b2: ; 0x1bc4b2
	text "Which side do you"
	line "want to put away?"
	done
; 0x1bc4d7

UnknownText_0x1bc4d7: ; 0x1bc4d7
	text "Put away the"
	line "@"
	text_from_ram StringBuffer3
	text "."
	prompt
; 0x1bc4ec

UnknownText_0x1bc4ec: ; 0x1bc4ec
	text "There's nothing to"
	line "put away."
	prompt
; 0x1bc509

UnknownText_0x1bc509: ; 0x1bc509
	text "Set up the"
	line "@"
	text_from_ram StringBuffer3
	text "."
	prompt
; 0x1bc51c

UnknownText_0x1bc51c: ; 0x1bc51c
	text "Put away the"
	line "@"
	text_from_ram StringBuffer3
	text ""
	para "and set up the"
	line "@"
	text_from_ram StringBuffer4
	text "."
	prompt
; 0x1bc546

UnknownText_0x1bc546: ; 0x1bc546
	text "That's already set"
	line "up."
	prompt
; 0x1bc55d

UnknownText_0x1bc55d: ; 0x1bc55d
	text "It's the TOWN MAP."
	done
; 0x1bc570

UnknownText_0x1bc570: ; 0x1bc570
	text "It's a poster of a"
	line "cute PIKACHU."
	done
; 0x1bc591

UnknownText_0x1bc591: ; 0x1bc591
	text "It's a poster of a"
	line "cute CLEFAIRY."
	done
; 0x1bc5b3

UnknownText_0x1bc5b3: ; 0x1bc5b3
	text "It's a poster of a"
	line "cute JIGGLYPUFF."
	done
; 0x1bc5d7

UnknownText_0x1bc5d7: ; 0x1bc5d7
	text "It's an adorable"
	line "@"
	text_from_ram StringBuffer3
	text "."
	done
; 0x1bc5ef

UnknownText_0x1bc5ef: ; 0x1bc5ef
	text "A giant doll! It's"
	line "fluffy and cuddly."
	done
; 0x1bc615

UnknownText_0x1bc615: ; 0x1bc615
	text "Hi, <PLAYER>!"
	line "How are you?"
	prompt
; 0x1bc62a

UnknownText_0x1bc62a: ; 0x1bc62a
	text "I found a useful"
	line "item shopping, so"
	prompt
; 0x1bc64e

UnknownText_0x1bc64e: ; 0x1bc64e
	text "I bought it with"
	line "your money. Sorry!"
	prompt
; 0x1bc673

UnknownText_0x1bc673: ; 0x1bc673
	text "It's in your PC."
	line "You'll like it!"
	done
; 0x1bc693

UnknownText_0x1bc693: ; 0x1bc693
	text "While shopping"
	line "today, I saw this"
	cont "adorable doll, so"
	prompt
; 0x1bc6c7

UnknownText_0x1bc6c7: ; 0x1bc6c7
	text "It's in your room."
	line "You'll love it!"
	done
; 0x1bc6e9

UnknownText_0x1bc6e9: ; 0x1bc6e9
	text_from_ram wc6d1
	text " was"
	line "sent to @"
	text_from_ram wc719
	text "."
	done
; 0x1bc701

UnknownText_0x1bc701: ; 0x1bc701
	text ""
	done
; 0x1bc703

UnknownText_0x1bc703: ; 0x1bc703
	text_from_ram wc719
	text " bids"
	line "farewell to"
	done
; 0x1bc719

UnknownText_0x1bc719: ; 0x1bc719
	text_from_ram wc703
	text "."
	done
; 0x1bc71f

UnknownText_0x1bc71f: ; 0x1bc71f
	text "Take good care of"
	line "@"
	text_from_ram wc703
	text "."
	done
; 0x1bc739

UnknownText_0x1bc739: ; 0x1bc739
	text "For @"
	text_from_ram wc6e7
	text "'s"
	line "@"
	text_from_ram wc6d1
	text ","
	done
; 0x1bc74c

UnknownText_0x1bc74c: ; 0x1bc74c
	text_from_ram wc719
	text " sends"
	line "@"
	text_from_ram wc703
	text "."
	done
; 0x1bc75e

UnknownText_0x1bc75e: ; 0x1bc75e
	text_from_ram wc719
	text " will"
	line "trade @"
	text_from_ram wc703
	db "@"
; 0x1bc773

UnknownText_0x1bc773: ; 0x1bc773
	db "@"
; 0x1bc774

UnknownText_0x1bc774: ; 0x1bc774
	text "for @"
	text_from_ram wc6e7
	text "'s"
	line "@"
	text_from_ram wc6d1
	text "."
	done
; 0x1bc787

UnknownText_0x1bc787: ; 0x1bc787
	text_from_ram wc6e7
	text " will"
	line "trade @"
	text_from_ram wc6d1
	db "@"
; 0x1bc79c

UnknownText_0x1bc79c: ; 0x1bc79c
	db "@"
; 0x1bc79d

UnknownText_0x1bc79d: ; 0x1bc79d
	text "for @"
	text_from_ram wc719
	text "'s"
	line "@"
	text_from_ram wc703
	text "."
	done
; 0x1bc7b0

UnknownText_0x1bc7b0: ; 0x1bc7b0
	text_from_ram wc6e7
	text "'s"
	line "@"
	text_from_ram wc6d1
	text " trade…"
	done
; 0x1bc7c3

UnknownText_0x1bc7c3: ; 0x1bc7c3
	text "Take good care of"
	line "@"
	text_from_ram wc703
	text "."
	done
; 0x1bc7dd

UnknownText_0x1bc7dd: ; 0x1bc7dd
	text_from_ram wc6e7
	text "'s"
	line "@"
	text_from_ram wc6d1
	text " trade…"
	done
; 0x1bc7f0

UnknownText_0x1bc7f0: ; 0x1bc7f0
	text "Take good care of"
	line "@"
	text_from_ram wc703
	text "."
	done
; 0x1bc80a

UnknownText_0x1bc80a: ; 0x1bc80a
	text_from_ram wc703
	text " came"
	line "back!"
	done
; 0x1bc81a

UnknownText_0x1bc81a: ; 0x1bc81a
	text ""
	line "MARY: PROF.OAK'S"
	done
; 0x1bc82d

UnknownText_0x1bc82d: ; 0x1bc82d
	text ""
	line "#MON TALK!"
	done
; 0x1bc83a

UnknownText_0x1bc83a: ; 0x1bc83a
	text ""
	line "With me, MARY!"
	done
; 0x1bc84b

UnknownText_0x1bc84b: ; 0x1bc84b
	text ""
	line "OAK: @"
	text_from_ram wd050
	db "@"
; 0x1bc857

UnknownText_0x1bc857: ; 0x1bc857
	db "@"
; 0x1bc858

UnknownText_0x1bc858: ; 0x1bc858
	text ""
	line "may be seen around"
	done
; 0x1bc86d

UnknownText_0x1bc86d: ; 0x1bc86d
	text ""
	line "@"
	text_from_ram StringBuffer1
	text "."
	done
; 0x1bc876

UnknownText_0x1bc876: ; 0x1bc876
	text ""
	line "MARY: @"
	text_from_ram StringBuffer1
	text "'s"
	done
; 0x1bc885

UnknownText_0x1bc885: ; 0x1bc885
	text ""
	line "sweet and adorably"
	done
; 0x1bc89a

UnknownText_0x1bc89a: ; 0x1bc89a
	text ""
	line "wiggly and slickly"
	done
; 0x1bc8af

UnknownText_0x1bc8af: ; 0x1bc8af
	text ""
	line "aptly named and"
	done
; 0x1bc8c1

UnknownText_0x1bc8c1: ; 0x1bc8c1
	text ""
	line "undeniably kind of"
	done
; 0x1bc8d6

UnknownText_0x1bc8d6: ; 0x1bc8d6
	text ""
	line "so, so unbearably"
	done
; 0x1bc8ea

UnknownText_0x1bc8ea: ; 0x1bc8ea
	text ""
	line "wow, impressively"
	done
; 0x1bc8fe

UnknownText_0x1bc8fe: ; 0x1bc8fe
	text ""
	line "almost poisonously"
	done
; 0x1bc913

UnknownText_0x1bc913: ; 0x1bc913
	text ""
	line "ooh, so sensually"
	done
; 0x1bc927

UnknownText_0x1bc927: ; 0x1bc927
	text ""
	line "so mischievously"
	done
; 0x1bc93a

UnknownText_0x1bc93a: ; 0x1bc93a
	text ""
	line "so very topically"
	done
; 0x1bc94e

UnknownText_0x1bc94e: ; 0x1bc94e
	text ""
	line "sure addictively"
	done
; 0x1bc961

UnknownText_0x1bc961: ; 0x1bc961
	text ""
	line "looks in water is"
	done
; 0x1bc975

UnknownText_0x1bc975: ; 0x1bc975
	text ""
	line "evolution must be"
	done
; 0x1bc989

UnknownText_0x1bc989: ; 0x1bc989
	text ""
	line "provocatively"
	done
; 0x1bc999

UnknownText_0x1bc999: ; 0x1bc999
	text ""
	line "so flipped out and"
	done
; 0x1bc9ae

UnknownText_0x1bc9ae: ; 0x1bc9ae
	text ""
	line "heart-meltingly"
	done
; 0x1bc9c0

UnknownText_0x1bc9c0: ; 0x1bc9c0
	text ""
	line "cute."
	done
; 0x1bc9c8

UnknownText_0x1bc9c8: ; 0x1bc9c8
	text ""
	line "weird."
	done
; 0x1bc9d1

UnknownText_0x1bc9d1: ; 0x1bc9d1
	text ""
	line "pleasant."
	done
; 0x1bc9dd

UnknownText_0x1bc9dd: ; 0x1bc9dd
	text ""
	line "bold, sort of."
	done
; 0x1bc9ee

UnknownText_0x1bc9ee: ; 0x1bc9ee
	text ""
	line "frightening."
	done
; 0x1bc9fd

UnknownText_0x1bc9fd: ; 0x1bc9fd
	text ""
	line "suave & debonair!"
	done
; 0x1bca11

UnknownText_0x1bca11: ; 0x1bca11
	text ""
	line "powerful."
	done
; 0x1bca1d

UnknownText_0x1bca1d: ; 0x1bca1d
	text ""
	line "exciting."
	done
; 0x1bca29

UnknownText_0x1bca29: ; 0x1bca29
	text ""
	line "groovy!"
	done
; 0x1bca33

UnknownText_0x1bca33: ; 0x1bca33
	text ""
	line "inspiring."
	done
; 0x1bca40

UnknownText_0x1bca40: ; 0x1bca40
	text ""
	line "friendly."
	done
; 0x1bca4c

UnknownText_0x1bca4c: ; 0x1bca4c
	text ""
	line "hot, hot, hot!"
	done
; 0x1bca5d

UnknownText_0x1bca5d: ; 0x1bca5d
	text ""
	line "stimulating."
	done
; 0x1bca6c

UnknownText_0x1bca6c: ; 0x1bca6c
	text ""
	line "guarded."
	done
; 0x1bca77

UnknownText_0x1bca77: ; 0x1bca77
	text ""
	line "lovely."
	done
; 0x1bca81

UnknownText_0x1bca81: ; 0x1bca81
	text ""
	line "speedy."
	done
; 0x1bca8b

UnknownText_0x1bca8b: ; 0x1bca8b
	text "#MON"
	done
; 0x1bca91

UnknownText_0x1bca91: ; 0x1bca91
	text ""
	line "@"
	text_from_ram StringBuffer1
	db "@"
; 0x1bca98

UnknownText_0x1bca98: ; 0x1bca98
	db "@"
; 0x1bca99

UnknownText_0x1bca99: ; 0x1bca99
	text ""
	line "BEN: #MON MUSIC"
	done
; 0x1bcaab

UnknownText_0x1bcaab: ; 0x1bcaab
	text ""
	line "CHANNEL!"
	done
; 0x1bcab6

UnknownText_0x1bcab6: ; 0x1bcab6
	text ""
	line "It's me, DJ BEN!"
	done
; 0x1bcac8

UnknownText_0x1bcac8: ; 0x1bcac8
	text ""
	line "FERN: #MUSIC!"
	done
; 0x1bcad8

UnknownText_0x1bcad8: ; 0x1bcad8
	text ""
	line "With DJ FERN!"
	done
; 0x1bcae8

UnknownText_0x1bcae8: ; 0x1bcae8
	text ""
	line "Today's @"
	current_day
	text ","
	done
; 0x1bcaf6

UnknownText_0x1bcaf6: ; 0x1bcaf6
	text ""
	line "so let us jam to"
	done
; 0x1bcb09

UnknownText_0x1bcb09: ; 0x1bcb09
	text ""
	line "so chill out to"
	done
; 0x1bcb1b

UnknownText_0x1bcb1b: ; 0x1bcb1b
	text ""
	line "#MON March!"
	done
; 0x1bcb29

UnknownText_0x1bcb29: ; 0x1bcb29
	text ""
	line "#MON Lullaby!"
	done
; 0x1bcb39

UnknownText_0x1bcb39: ; 0x1bcb39
	text ""
	line "REED: Yeehaw! How"
	done
; 0x1bcb4d

UnknownText_0x1bcb4d: ; 0x1bcb4d
	text ""
	line "y'all doin' now?"
	done
; 0x1bcb60

UnknownText_0x1bcb60: ; 0x1bcb60
	text ""
	line "Whether you're up"
	done
; 0x1bcb73

UnknownText_0x1bcb73: ; 0x1bcb73
	text ""
	line "or way down low,"
	done
; 0x1bcb86

UnknownText_0x1bcb86: ; 0x1bcb86
	text ""
	line "don't you miss the"
	done
; 0x1bcb9a

UnknownText_0x1bcb9a: ; 0x1bcb9a
	text ""
	line "LUCKY NUMBER SHOW!"
	done
; 0x1bcbaf

UnknownText_0x1bcbaf: ; 0x1bcbaf
	text ""
	line "This week's Lucky"
	done
; 0x1bcbc2

UnknownText_0x1bcbc2: ; 0x1bcbc2
	text ""
	line "Number is @"
	interpret_data
	text_from_ram StringBuffer1
	text "!"
	done
; 0x1bcbd6

UnknownText_0x1bcbd6: ; 0x1bcbd6
	text ""
	line "I'll repeat that!"
	done
; 0x1bcbe9

UnknownText_0x1bcbe9: ; 0x1bcbe9
	text ""
	line "Match it and go to"
	done
; 0x1bcbfe

UnknownText_0x1bcbfe: ; 0x1bcbfe
	text ""
	line "the RADIO TOWER!"
	done
; 0x1bcc11

UnknownText_0x1bcc11: ; 0x1bcc11
	text ""
	line "…Repeating myself"
	done
; 0x1bcc25

UnknownText_0x1bcc25: ; 0x1bcc25
	text ""
	line "gets to be a drag…"
	done
; 0x1bcc3a

UnknownText_0x1bcc3a: ; 0x1bcc3a
	text ""
	line "PLACES AND PEOPLE!"
	done
; 0x1bcc4f

UnknownText_0x1bcc4f: ; 0x1bcc4f
	text ""
	line "Brought to you by"
	done
; 0x1bcc63

UnknownText_0x1bcc63: ; 0x1bcc63
	text ""
	line "me, DJ LILY!"
	done
; 0x1bcc72

UnknownText_0x1bcc72: ; 0x1bcc72
	text ""
	line "@"
	text_from_ram StringBuffer2
	text " @"
	text_from_ram StringBuffer1
	db "@"
; 0x1bcc7f

UnknownText_0x1bcc7f: ; 0x1bcc7f
	db "@"
; 0x1bcc80

UnknownText_0x1bcc80: ; 0x1bcc80
	text ""
	line "is cute."
	done
; 0x1bcc8b

UnknownText_0x1bcc8b: ; 0x1bcc8b
	text ""
	line "is sort of lazy."
	done
; 0x1bcc9e

UnknownText_0x1bcc9e: ; 0x1bcc9e
	text ""
	line "is always happy."
	done
; 0x1bccb1

UnknownText_0x1bccb1: ; 0x1bccb1
	text ""
	line "is quite noisy."
	done
; 0x1bccc3

UnknownText_0x1bccc3: ; 0x1bccc3
	text ""
	line "is precocious."
	done
; 0x1bccd4

UnknownText_0x1bccd4: ; 0x1bccd4
	text ""
	line "is somewhat bold."
	done
; 0x1bcce8

UnknownText_0x1bcce8: ; 0x1bcce8
	text ""
	line "is too picky!"
	done
; 0x1bccf8

UnknownText_0x1bccf8: ; 0x1bccf8
	text ""
	line "is sort of OK."
	done
; 0x1bcd09

UnknownText_0x1bcd09: ; 0x1bcd09
	text ""
	line "is just so-so."
	done
; 0x1bcd1a

UnknownText_0x1bcd1a: ; 0x1bcd1a
	text ""
	line "is actually great."
	done
; 0x1bcd2f

UnknownText_0x1bcd2f: ; 0x1bcd2f
	text ""
	line "is just my type."
	done
; 0x1bcd42

UnknownText_0x1bcd42: ; 0x1bcd42
	text ""
	line "is so cool, no?"
	done
; 0x1bcd54

UnknownText_0x1bcd54: ; 0x1bcd54
	text ""
	line "is inspiring!"
	done
; 0x1bcd64

UnknownText_0x1bcd64: ; 0x1bcd64
	text ""
	line "is kind of weird."
	done
; 0x1bcd78

UnknownText_0x1bcd78: ; 0x1bcd78
	text ""
	line "is right for me?"
	done
; 0x1bcd8b

UnknownText_0x1bcd8b: ; 0x1bcd8b
	text ""
	line "is definitely odd!"
	done
; 0x1bcda0

UnknownText_0x1bcda0: ; 0x1bcda0
	text ""
	line "@"
	text_from_ram StringBuffer1
	db "@"
; 0x1bcda7

UnknownText_0x1bcda7: ; 0x1bcda7
	db "@"
; 0x1bcda8

UnknownText_0x1bcda8: ; 0x1bcda8
	text ""
	line "… …Ahem, we are"
	done
; 0x1bcdba

UnknownText_0x1bcdba: ; 0x1bcdba
	text ""
	line "TEAM ROCKET!"
	done
; 0x1bcdc9

UnknownText_0x1bcdc9: ; 0x1bcdc9
	text ""
	line "After three years"
	done
; 0x1bcddd

UnknownText_0x1bcddd: ; 0x1bcddd
	text ""
	line "of preparation, we"
	done
; 0x1bcdf2

UnknownText_0x1bcdf2: ; 0x1bcdf2
	text ""
	line "have risen again"
	done
; 0x1bce05

UnknownText_0x1bce05: ; 0x1bce05
	text ""
	line "from the ashes!"
	done
; 0x1bce17

UnknownText_0x1bce17: ; 0x1bce17
	text ""
	line "GIOVANNI! @"
	interpret_data
	text "Can you"
	done
; 0x1bce2e

UnknownText_0x1bce2e: ; 0x1bce2e
	text ""
	line "hear?@"
	interpret_data
	text " We did it!"
	done
; 0x1bce44

UnknownText_0x1bce44: ; 0x1bce44
	text ""
	line "@"
	interpret_data
	text "Where is our boss?"
	done
; 0x1bce5c

UnknownText_0x1bce5c: ; 0x1bce5c
	text ""
	line "@"
	interpret_data
	text "Is he listening?"
	done
; 0x1bce72

UnknownText_0x1bce72: ; 0x1bce72
	text ""
	line "BUENA: BUENA here!"
	done
; 0x1bce87

UnknownText_0x1bce87: ; 0x1bce87
	text ""
	line "Today's password!"
	done
; 0x1bce9a

UnknownText_0x1bce9a: ; 0x1bce9a
	text ""
	line "Let me think… It's"
	done
; 0x1bceae

UnknownText_0x1bceae: ; 0x1bceae
	text ""
	line "@"
	text_from_ram StringBuffer1
	text "!"
	done
; 0x1bceb7

UnknownText_0x1bceb7: ; 0x1bceb7
	text ""
	line "Don't forget it!"
	done
; 0x1bcec9

UnknownText_0x1bcec9: ; 0x1bcec9
	text ""
	line "I'm in GOLDENROD's"
	done
; 0x1bcedc

UnknownText_0x1bcedc: ; 0x1bcedc
	text ""
	line "RADIO TOWER!"
	done
; 0x1bceeb

UnknownText_0x1bceeb: ; 0x1bceeb
	text ""
	line "BUENA: Oh my…"
	done
; 0x1bcefb

UnknownText_0x1bcefb: ; 0x1bcefb
	text ""
	line "It's midnight! I"
	done
; 0x1bcf0d

UnknownText_0x1bcf0d: ; 0x1bcf0d
	text ""
	line "have to shut down!"
	done
; 0x1bcf22

UnknownText_0x1bcf22: ; 0x1bcf22
	text ""
	line "Thanks for tuning"
	done
; 0x1bcf36

UnknownText_0x1bcf36: ; 0x1bcf36
	text ""
	line "in to the end! But"
	done
; 0x1bcf4b

UnknownText_0x1bcf4b: ; 0x1bcf4b
	text ""
	line "don't stay up too"
	done
; 0x1bcf5e

UnknownText_0x1bcf5e: ; 0x1bcf5e
	text ""
	line "late! Presented to"
	done
; 0x1bcf73

UnknownText_0x1bcf73: ; 0x1bcf73
	text ""
	line "you by DJ BUENA!"
	done
; 0x1bcf86

UnknownText_0x1bcf86: ; 0x1bcf86
	text "I'm outta here!"
	done
; 0x1bcf96

UnknownText_0x1bcf96: ; 0x1bcf96
	text "…"
	done
; 0x1bcf99

UnknownText_0x1bcf99: ; 0x1bcf99
	text ""
	line ""
	done
; 0x1bcf9c

UnknownText_0x1bcf9c: ; 0x1bcf9c
	text "<ENEMY>"
	line "withdrew"
	cont "@"
	text_from_ram EnemyMonNick
	text "!"
	prompt
; 0x1bcfaf

UnknownText_0x1bcfaf: ; 0x1bcfaf
	text "<ENEMY>"
	line "used @"
	text_from_ram wd050
	text ""
	cont "on @"
	text_from_ram EnemyMonNick
	text "!"
	prompt
; 0x1bcfc7

UnknownText_0x1bcfc7: ; 0x1bcfc7
	text "That can't be used"
	line "right now."
	prompt
; 0x1bcfe5

UnknownText_0x1bcfe5: ; 0x1bcfe5
	text "That item can't be"
	line "put in the PACK."
	done
; 0x1bd009

UnknownText_0x1bd009: ; 0x1bd009
	text "The @"
	text_from_ram StringBuffer1
	text ""
	line "was put in the"
	cont "PACK."
	done
; 0x1bd029

UnknownText_0x1bd029: ; 0x1bd029
	text "Remaining Time"
	done
; 0x1bd039

UnknownText_0x1bd039: ; 0x1bd039
	text "Your #MON's HP"
	line "was healed."
	prompt
; 0x1bd054

UnknownText_0x1bd054: ; 0x1bd054
	text "Warping…"
	done
; 0x1bd05e

UnknownText_0x1bd05e: ; 0x1bd05e
	text "Which number"
	line "should be changed?"
	done
; 0x1bd07f

UnknownText_0x1bd07f: ; 0x1bd07f
	text "Will you play with"
	line "@"
	text_from_ram StringBuffer2
	text "?"
	done
; 0x1bd09a

UnknownText_0x1bd09a: ; 0x1bd09a
	text "You need two #-"
	line "MON for breeding."
	prompt
; 0x1bd0bd

UnknownText_0x1bd0bd: ; 0x1bd0bd
	text "Breeding is not"
	line "possible."
	prompt
; 0x1bd0d8

UnknownText_0x1bd0d8: ; 0x1bd0d8
	text "The compatibility"
	line "is @"
	deciram wd265, $13
	text "."
	cont "Should they breed?"
	done
; 0x1bd109

UnknownText_0x1bd109: ; 0x1bd109
	text "There is no EGG."
	line ""
	prompt
; 0x1bd11c

UnknownText_0x1bd11c: ; 0x1bd11c
	text "It's going to"
	line "hatch!"
	prompt
; 0x1bd131

UnknownText_0x1bd131: ; 0x1bd131
	text "Test event"
	line "@"
	deciram StringBuffer2, $12
	text "?"
	done
; 0x1bd145

UnknownText_0x1bd145: ; 0x1bd145
	text "Start!"
	done
; 0x1bd14d

UnknownText_0x1bd14d: ; 0x1bd14d
	text "End!"
	done
; 0x1bd153

UnknownText_0x1bd153: ; 0x1bd153
	text "For a boy!"
	done
; 0x1bd15f

UnknownText_0x1bd15f: ; 0x1bd15f
	text "For a girl!"
	done
; 0x1bd16c

UnknownText_0x1bd16c: ; 0x1bd16c
	text "This doesn't"
	line "concern a boy!"
	done
; 0x1bd188

UnknownText_0x1bd188: ; 0x1bd188
	text "The BOX is full!"
	done
; 0x1bd19a

UnknownText_0x1bd19a: ; 0x1bd19a
	text "A new CARD arrived"
	line "from @"
	text_from_ram StringBuffer2
	text "."
	done
; 0x1bd1ba

UnknownText_0x1bd1ba: ; 0x1bd1ba
	text "Put this CARD in"
	line "the CARD FOLDER?"
	done
; 0x1bd1dd

UnknownText_0x1bd1dd: ; 0x1bd1dd
	text_from_ram StringBuffer2
	text "'s CARD was"
	line "listed as no.@"
	deciram StringBuffer1, $12
	text "."
	prompt
; 0x1bd201

UnknownText_0x1bd201: ; 0x1bd201
	text "Starting link."
	done
; 0x1bd211

UnknownText_0x1bd211: ; 0x1bd211
	text "Link terminated."
	done
; 0x1bd223

UnknownText_0x1bd223: ; 0x1bd223
	text "Closing link."
	done
; 0x1bd232

UnknownText_0x1bd232: ; 0x1bd232
	text "Clear the time"
	line "limit?"
	done
; 0x1bd249

UnknownText_0x1bd249: ; 0x1bd249
	text "The time limit was"
	line "cleared."
	done
; 0x1bd266

UnknownText_0x1bd266: ; 0x1bd266
	text "Pick which packet"
	line "as an error?"
	done
; 0x1bd286

UnknownText_0x1bd286: ; 0x1bd286
	text "Trading @"
	text_from_ram StringBuffer2
	text ""
	line "for @"
	text_from_ram StringBuffer1
	text "…"
	done
; 0x1bd2a0

UnknownText_0x1bd2a0: ; 0x1bd2a0
	text "Obtained the"
	line "VOLTORBBADGE!"
	done
; 0x1bd2bc

UnknownText_0x1bd2bc: ; 0x1bd2bc
	text "Which floor?"
	done
; 0x1bd2ca

UnknownText_0x1bd2ca: ; 0x1bd2ca
	text "ANNOUNCER: BEEEP!"

	para "Time's up!"
	done
; 0x1bd2e7

UnknownText_0x1bd2e7: ; 0x1bd2e7
	text "ANNOUNCER: The"
	line "Contest is over!"
	done
; 0x1bd308

UnknownText_0x1bd308: ; 0x1bd308
	text "REPEL's effect"
	line "wore off."
	done
; 0x1bd321

UnknownText_0x1bd321: ; 0x1bd321
	text "<PLAYER> found"
	line "@"
	text_from_ram StringBuffer3
	text "!"
	done
; 0x1bd331

UnknownText_0x1bd331: ; 0x1bd331
	text "But <PLAYER> has"
	line "no space left…"
	done
; 0x1bd34b

UnknownText_0x1bd34b: ; 0x1bd34b
	text "I just saw some"
	line "rare @"
	text_from_ram StringBuffer1
	text " in"
	cont "@"
	text_from_ram StringBuffer2
	text "."

	para "I'll call you if I"
	line "see another rare"
	cont "#MON, OK?"
	prompt
; 0x1bd39e

UnknownText_0x1bd39e: ; 0x1bd39e
	text "SAVING RECORD…"
	line "DON'T TURN OFF!"
	done
; 0x1bd3be

UnknownText_0x1bd3be: ; 0x1bd3be
	text_from_ram PlayerName
	text " received"
	line "@"
	text_from_ram StringBuffer1
	text "!@"
	sound0x0F
	text_waitbutton
	db "@"
; 0x1bd3d6

UnknownText_0x1bd3d6: ; 0x1bd3d6
	db "@"
; 0x1bd3d7

UnknownText_0x1bd3d7: ; 0x1bd3d7
	text "You have no coins."
	prompt
; 0x1bd3eb

UnknownText_0x1bd3eb: ; 0x1bd3eb
	text "You don't have a"
	line "COIN CASE."
	prompt
; 0x1bd407

UnknownText_0x1bd407: ; 0x1bd407
	text "OK, connect the"
	line "Game Link Cable."
	prompt
; 0x1bd429

UnknownText_0x1bd429: ; 0x1bd429
	text "<PLAYER> traded"
	line "@"
	text_from_ram wd050
	text " for"
	cont "@"
	text_from_ram StringBuffer2
	text ".@"
	db "@"
; 0x1bd445

UnknownText_0x1bd445: ; 0x1bd445
	sound0x0A
	interpret_data
	db "@"
; 0x1bd448

UnknownText_0x1bd448: ; 0x1bd448
	db "@"
; 0x1bd449

UnknownText_0x1bd449: ; 0x1bd449
	text "I collect #MON."
	line "Do you have"
	cont "@"
	text_from_ram StringBuffer1
	text "?"

	para "Want to trade it"
	line "for my @"
	text_from_ram StringBuffer2
	text "?"
	done
; 0x1bd48c

UnknownText_0x1bd48c: ; 0x1bd48c
	text "You don't want to"
	line "trade? Aww…"
	done
; 0x1bd4aa

UnknownText_0x1bd4aa: ; 0x1bd4aa
	text "Huh? That's not"
	line "@"
	text_from_ram StringBuffer1
	text ". "
	cont "What a letdown…"
	done
; 0x1bd4d2

UnknownText_0x1bd4d2: ; 0x1bd4d2
	text "Yay! I got myself"
	line "@"
	text_from_ram StringBuffer1
	text "!"
	cont "Thanks!"
	done
; 0x1bd4f4

UnknownText_0x1bd4f4: ; 0x1bd4f4
	text "Hi, how's my old"
	line "@"
	text_from_ram StringBuffer2
	text " doing?"
	done
; 0x1bd512

UnknownText_0x1bd512: ; 0x1bd512
	text "Hi, I'm looking"
	line "for this #MON."

	para "If you have"
	line "@"
	text_from_ram StringBuffer1
	text ", would"

	para "you trade it for"
	line "my @"
	text_from_ram StringBuffer2
	text "?"
	done
; 0x1bd565

UnknownText_0x1bd565: ; 0x1bd565
	text "You don't have"
	line "one either?"

	para "Gee, that's really"
	line "disappointing…"
	done
; 0x1bd5a1

UnknownText_0x1bd5a1: ; 0x1bd5a1
	text "You don't have"
	line "@"
	text_from_ram StringBuffer1
	text "? That's"
	cont "too bad, then."
	done
; 0x1bd5cc

UnknownText_0x1bd5cc: ; 0x1bd5cc
	text "Great! Thank you!"

	para "I finally got"
	line "@"
	text_from_ram StringBuffer1
	text "."
	done
; 0x1bd5f4

UnknownText_0x1bd5f4: ; 0x1bd5f4
	text "Hi! The @"
	text_from_ram wd050
	text ""
	line "you traded me is"
	cont "doing great!"
	done
; 0x1bd621

UnknownText_0x1bd621: ; 0x1bd621
	text_from_ram wd050
	text "'s cute,"
	line "but I don't have"

	para "it. Do you have"
	line "@"
	text_from_ram StringBuffer1
	text "?"

	para "Want to trade it"
	line "for my @"
	text_from_ram StringBuffer2
	text "?"
	done
; 0x1bd673

UnknownText_0x1bd673: ; 0x1bd673
	text "You don't want to"
	line "trade? Oh, darn…"
	done
; 0x1bd696

UnknownText_0x1bd696: ; 0x1bd696
	text "That's not"
	line "@"
	text_from_ram StringBuffer1
	text "."

	para "Please trade with"
	line "me if you get one."
	done
; 0x1bd6cd

UnknownText_0x1bd6cd: ; 0x1bd6cd
	text "Wow! Thank you!"
	line "I always wanted"
	cont "@"
	text_from_ram wd050
	text "!"
	done
; 0x1bd6f5

UnknownText_0x1bd6f5: ; 0x1bd6f5
	text "How is that"
	line "@"
	text_from_ram StringBuffer2
	text " I"
	cont "traded you doing?"

	para "Your @"
	text_from_ram wd050
	text "'s"
	line "so cute!"
	done
; 0x1bd731

UnknownText_0x1bd731: ; 0x1bd731
	text "Uh? What happened?"
	done
; 0x1bd745

UnknownText_0x1bd745: ; 0x1bd745
	text "Trading is so odd…"

	para "I still have a lot"
	line "to learn about it."
	done
; 0x1bd77f

UnknownText_0x1bd77f: ; 0x1bd77f
	text "Wow, that's a cute"
	line "#MON."

	para "Where did you get"
	line "it?"

	para "…"

	para "So, you're leaving"
	line "on an adventure…"

	para "OK!"
	line "I'll help too."

	para "But what can I do"
	line "for you?"

	para "I know! I'll save"
	line "money for you."

	para "On a long journey,"
	line "money's important."

	para "Do you want me to"
	line "save your money?"
	done
; 0x1bd868

UnknownText_0x1bd868: ; 0x1bd868
	text "OK, I'll take care"
	line "of your money."
	para $56, $56, $56
	prompt
; 0x1bd88e

UnknownText_0x1bd88e: ; 0x1bd88e
	text "Be careful."

	para "#MON are your"
	line "friends. You need"
	cont "to work as a team."

	para "Now, go on!"
	done
; 0x1bd8da

UnknownText_0x1bd8da: ; 0x1bd8da
	text "Hi! Welcome home!"
	line "You're trying very"
	cont "hard, I see."

	para "I've kept your"
	line "room tidy."

	para "Or is this about"
	line "your money?"
	done
; 0x1bd942

UnknownText_0x1bd942: ; 0x1bd942
	text "What do you want"
	line "to do?"
	done
; 0x1bd95b

UnknownText_0x1bd95b: ; 0x1bd95b
	text "How much do you"
	line "want to save?"
	done
; 0x1bd97a

UnknownText_0x1bd97a: ; 0x1bd97a
	text "How much do you"
	line "want to take?"
	done
; 0x1bd999

UnknownText_0x1bd999: ; 0x1bd999
	text "Do you want to"
	line "save some money?"
	done
; 0x1bd9ba

UnknownText_0x1bd9ba: ; 0x1bd9ba
	text "You haven't saved"
	line "that much."
	prompt
; 0x1bd9d7

UnknownText_0x1bd9d7: ; 0x1bd9d7
	text "You can't take"
	line "that much."
	prompt
; 0x1bd9f1

UnknownText_0x1bd9f1: ; 0x1bd9f1
	text "You don't have"
	line "that much."
	prompt
; 0x1bda0b

UnknownText_0x1bda0b: ; 0x1bda0b
	text "You can't save"
	line "that much."
	prompt
; 0x1bda25

UnknownText_0x1bda25: ; 0x1bda25
	text "OK, I'll save your"
	line "money. Trust me!"

	para "<PLAYER>, stick"
	line "with it!"
	done
; 0x1bda5b

UnknownText_0x1bda5b: ; 0x1bda5b
	text "Your money's safe"
	line "here! Get going!"
	done
; 0x1bda7e

UnknownText_0x1bda7e: ; 0x1bda7e
	text "<PLAYER>, don't"
	line "give up!"
	done
; 0x1bda90

UnknownText_0x1bda90: ; 0x1bda90
	text "Just do what"
	line "you can."
	done
; 0x1bdaa7

UnknownText_0x1bdaa7: ; 0x1bdaa7
	text ""
	done
; 0x1bdaa9

UnknownText_0x1bdaa9: ; 0x1bdaa9
	text "I'm the DAY-CARE"
	line "MAN. Want me to"
	cont "raise a #MON?"
	done
; 0x1bdad8

UnknownText_0x1bdad8: ; 0x1bdad8
	text "I'm the DAY-CARE"
	line "MAN. Do you know"
	cont "about EGGS?"

	para "I was raising"
	line "#MON with my"
	cont "wife, you see."

	para "We were shocked to"
	line "find an EGG!"

	para "How incredible is"
	line "that?"

	para "So, want me to"
	line "raise a #MON?"
	done
; 0x1bdb85

UnknownText_0x1bdb85: ; 0x1bdb85
	text "I'm the DAY-CARE"
	line "LADY."

	para "Should I raise a"
	line "#MON for you?"
	done
; 0x1bdbbb

UnknownText_0x1bdbbb: ; 0x1bdbbb
	text "I'm the DAY-CARE"
	line "LADY. Do you know"
	cont "about EGGS?"

	para "My husband and I"
	line "were raising some"
	cont "#MON, you see."

	para "We were shocked to"
	line "find an EGG!"

	para "How incredible"
	line "could that be?"

	para "Should I raise a"
	line "#MON for you?"
	done
; 0x1bdc79

UnknownText_0x1bdc79: ; 0x1bdc79
	text "What should I"
	line "raise for you?"
	prompt
; 0x1bdc97

UnknownText_0x1bdc97: ; 0x1bdc97
	text "Oh? But you have"
	line "just one #MON."
	prompt
; 0x1bdcb8

UnknownText_0x1bdcb8: ; 0x1bdcb8
	text "Sorry, but I can't"
	line "accept an EGG."
	prompt
; 0x1bdcda

UnknownText_0x1bdcda: ; 0x1bdcda
	text "Remove MAIL before"
	line "you come see me."
	prompt
; 0x1bdcff

UnknownText_0x1bdcff: ; 0x1bdcff
	text "If you give me"
	line "that, what will"
	cont "you battle with?"
	prompt
; 0x1bdd30

UnknownText_0x1bdd30: ; 0x1bdd30
	text "OK. I'll raise"
	line "your @"
	text_from_ram StringBuffer1
	text "."
	prompt
; 0x1bdd4b

UnknownText_0x1bdd4b: ; 0x1bdd4b
	text "Come back for it"
	line "later."
	done
; 0x1bdd64

UnknownText_0x1bdd64: ; 0x1bdd64
	text "Are we geniuses or"
	line "what? Want to see"
	cont "your @"
	text_from_ram StringBuffer1
	text "?"
	done
; 0x1bdd96

UnknownText_0x1bdd96: ; 0x1bdd96
	text "Your @"
	text_from_ram StringBuffer1
	text ""
	line "has grown a lot."

	para "By level, it's"
	line "grown by @"
	deciram StringBuffer2 + 1, $13
	text "."

	para "If you want your"
	line "#MON back, it"
	cont "will cost ¥@"
	deciram StringBuffer2 + 2, $34
	text "."
	done
; 0x1bde04

UnknownText_0x1bde04: ; 0x1bde04
	text "Perfect! Here's"
	line "your #MON."
	prompt
; 0x1bde1f

UnknownText_0x1bde1f: ; 0x1bde1f
	text "<PLAYER> got back"
	line "@"
	text_from_ram StringBuffer1
	text "."
	prompt
; 0x1bde32

UnknownText_0x1bde32: ; 0x1bde32
	text "Huh? Back already?"
	line "Your @"
	text_from_ram StringBuffer1
	text ""
	para "needs a little"
	line "more time with us."

	para "If you want your"
	line "#MON back, it"
	cont "will cost ¥100."
	done
; 0x1bdea2

UnknownText_0x1bdea2: ; 0x1bdea2
	text "You have no room"
	line "for it."
	prompt
; 0x1bdebc

UnknownText_0x1bdebc: ; 0x1bdebc
	text "You don't have"
	line "enough money."
	prompt
; 0x1bded9

UnknownText_0x1bded9: ; 0x1bded9
	text "Oh, fine then."
	prompt
; 0x1bdee9

UnknownText_0x1bdee9: ; 0x1bdee9
	text "Come again."
	done
; 0x1bdef6

UnknownText_0x1bdef6: ; 0x1bdef6
	text "Not yet…"
	done
; 0x1bdf00

UnknownText_0x1bdf00: ; 0x1bdf00
	text "Ah, it's you!"

	para "We were raising"
	line "your #MON, and"

	para "my goodness, were"
	line "we surprised!"

	para "Your #MON had"
	line "an EGG!"

	para "We don't know how"
	line "it got there, but"

	para "your #MON had"
	line "it. You want it?"
	done
; 0x1bdfa5

UnknownText_0x1bdfa5: ; 0x1bdfa5
	text "<PLAYER> received"
	line "the EGG!"
	done
; 0x1bdfba

UnknownText_0x1bdfba: ; 0x1bdfba
	text "Take good care of"
	line "it."
	done
; 0x1bdfd1

UnknownText_0x1bdfd1: ; 0x1bdfd1
	text "Well then, I'll"
	line "keep it. Thanks!"
	done
; 0x1bdff2

UnknownText_0x1bdff2: ; 0x1bdff2
	text "You have no room"
	line "in your party."
	cont "Come back later."
	done
; 0x1be024

UnknownText_0x1be024: ; 0x1be024
	text "Which #MON"
	line "should I photo-"
	cont "graph?"
	prompt
; 0x1be047

UnknownText_0x1be047: ; 0x1be047
	text "All righty. Hold"
	line "still for a bit."
	prompt
; 0x1be06a

UnknownText_0x1be06a: ; 0x1be06a
	text "Presto! All done."
	line "Come again, OK?"
	done
; 0x1be08d
