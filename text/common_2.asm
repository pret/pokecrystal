_FruitBearingTreeText: ; 0x1bc000
	db $0, "It's a fruit-", $4f
	db "bearing tree.", $57
; 0x1bc01c

_HeyItsFruitText: ; 0x1bc01c
	db $0, "Hey! It's", $4f
	db "@"
	text_from_ram StringBuffer3
	db $0, "!", $57
; 0x1bc02d

_ObtainedFruitText: ; 0x1bc02d
	db $0, "Obtained", $4f
	db "@"
	text_from_ram StringBuffer3
	db $0, "!", $57
; 0x1bc03e

_FruitPackIsFullText: ; 0x1bc03e
	db $0, "But the PACK is", $4f
	db "full…", $57
; 0x1bc055

_NothingHereText: ; 0x1bc055
	db $0, "There's nothing", $4f
	db "here…", $57
; 0x1bc06b

UnknownText_0x1bc06b: ; 0x1bc06b
	db $0, "Which APRICORN", $4f
	db "should I use?", $57
; 0x1bc089

UnknownText_0x1bc089: ; 0x1bc089
	db $0, "How many should I", $4f
	db "make?", $57
; 0x1bc0a2

UnknownText_0x1bc0a2: ; 0x1bc0a2
	text_from_ram $d073
	db $0, $4f
	db "recovered @"
	deciram $d1f3, $23
	db $0, "HP!", $57
; 0x1bc0bb

UnknownText_0x1bc0bb: ; 0x1bc0bb
	text_from_ram $d073
	db $0, "'s", $4f
	db "cured of poison.", $57
; 0x1bc0d2

UnknownText_0x1bc0d2: ; 0x1bc0d2
	text_from_ram $d073
	db $0, "'s", $4f
	db "rid of paralysis.", $57
; 0x1bc0ea

UnknownText_0x1bc0ea: ; 0x1bc0ea
	text_from_ram $d073
	db $0, "'s", $4f
	db "burn was healed.", $57
; 0x1bc101

UnknownText_0x1bc101: ; 0x1bc101
	text_from_ram $d073
	db $0, $4f
	db "was defrosted.", $57
; 0x1bc115

UnknownText_0x1bc115: ; 0x1bc115
	text_from_ram $d073
	db $0, $4f
	db "woke up.", $57
; 0x1bc123

UnknownText_0x1bc123: ; 0x1bc123
	text_from_ram $d073
	db $0, "'s", $4f
	db "health returned.", $57
; 0x1bc13a

UnknownText_0x1bc13a: ; 0x1bc13a
	text_from_ram $d073
	db $0, $4f
	db "is revitalized.", $57
; 0x1bc14f

UnknownText_0x1bc14f: ; 0x1bc14f
	text_from_ram $d073
	db $0, " grew to", $4f
	db "level @"
	deciram $d143, $13
	db $0, "!@"
	sound0
	text_waitbutton
	db "@"
; 0x1bc16d

UnknownText_0x1bc16d: ; 0x1bc16d
	db "@"
; 0x1bc16e

UnknownText_0x1bc16e: ; 0x1bc16e
	text_from_ram $d073
	db $0, " came", $4f
	db "to its senses.", $57
; 0x1bc187

UnknownText_0x1bc187: ; 0x1bc187
	db $0, "Please enter any", $4f
	db "four-digit number.", $57
; 0x1bc1ac

UnknownText_0x1bc1ac: ; 0x1bc1ac
	db $0, "Enter the same", $4f
	db "number to confirm.", $57
; 0x1bc1cf

UnknownText_0x1bc1cf: ; 0x1bc1cf
	db $0, "That's not the", $4f
	db "same number.", $57
; 0x1bc1eb

UnknownText_0x1bc1eb: ; 0x1bc1eb
	db $0, "Your PASSCODE has", $4f
	db "been set.", $51
	db "Enter this number", $4f
	db "next time to open", $55
	db "the CARD FOLDER.", $51
	db $57
; 0x1bc23e

UnknownText_0x1bc23e: ; 0x1bc23e
	db $0, "0000 is invalid!", $51
	db $57
; 0x1bc251

UnknownText_0x1bc251: ; 0x1bc251
	db $0, "Enter the CARD", $4e, "FOLDER PASSCODE.", $57
; 0x1bc272

UnknownText_0x1bc272: ; 0x1bc272
	db $0, "Incorrect", $4f
	db "PASSCODE!", $51
	db $57
; 0x1bc288

UnknownText_0x1bc288: ; 0x1bc288
	db $0, "CARD FOLDER open.@"
	db "@"
; 0x1bc29c

UnknownText_0x1bc29c: ; 0x1bc29c
	db $0, $56, $56, $56, $56, $56, $56, $4f
	db $56, $56, $56, $56, $56, $56, $51
	db "Zzz… Hm? Wha…?", $4f
	db "You woke me up!", $51
	db "Will you check the", $4f
	db "clock for me?", $58
; 0x1bc2eb

UnknownText_0x1bc2eb: ; 0x1bc2eb
	db $0, "What time is it?", $57
; 0x1bc2fd

UnknownText_0x1bc2fd: ; 0x1bc2fd
	db $0, "What?@"
	db "@"
; 0x1bc305

UnknownText_0x1bc305: ; 0x1bc305
	db $0, "?", $57
; 0x1bc308

UnknownText_0x1bc308: ; 0x1bc308
	db $0, "How many minutes?", $57
; 0x1bc31b

UnknownText_0x1bc31b: ; 0x1bc31b
	db $0, "Whoa!@"
	db "@"
; 0x1bc323

UnknownText_0x1bc323: ; 0x1bc323
	db $0, "?", $57
; 0x1bc326

UnknownText_0x1bc326: ; 0x1bc326
	db $0, "!", $4f
	db "I overslept!", $57
; 0x1bc336

UnknownText_0x1bc336: ; 0x1bc336
	db $0, "!", $4f
	db "Yikes! I over-", $55
	db "slept!", $57
; 0x1bc34f

UnknownText_0x1bc34f: ; 0x1bc34f
	db $0, "!", $4f
	db "No wonder it's so", $55
	db "dark!", $57
; 0x1bc369

UnknownText_0x1bc369: ; 0x1bc369
	db $0, "What day is it?", $57
; 0x1bc37a

UnknownText_0x1bc37a: ; 0x1bc37a
	db $0, ", is it?", $57
; 0x1bc384

UnknownText_0x1bc384: ; 0x1bc384
	db $0, "There is nothing", $4f
	db "connected.", $57
; 0x1bc3a1

UnknownText_0x1bc3a1: ; 0x1bc3a1
	db $0, "Check cell phone", $4f
	db "adapter.", $57
; 0x1bc3bc

UnknownText_0x1bc3bc: ; 0x1bc3bc
	db $0, "Check CDMA", $4f
	db "adapter.", $57
; 0x1bc3d1

UnknownText_0x1bc3d1: ; 0x1bc3d1
	db $0, "Check DOCOMO PHS", $4f
	db "adapter.", $57
; 0x1bc3ec

UnknownText_0x1bc3ec: ; 0x1bc3ec
	db $0, "Check DDI PHS", $4f
	db "adapter.", $57
; 0x1bc404

UnknownText_0x1bc404: ; 0x1bc404
	db $0, "Check unlimited", $4f
	db "battle mobile", $55
	db "adapter.", $57
; 0x1bc42c

UnknownText_0x1bc42c: ; 0x1bc42c
	db $0, "The password is:", $4f
	db $57
; 0x1bc43f

UnknownText_0x1bc43f: ; 0x1bc43f
	db $0, "Is this OK?", $57
; 0x1bc44c

UnknownText_0x1bc44c: ; 0x1bc44c
	db $0, "Enter the", $4f
	db "ID no.", $57
; 0x1bc45e

UnknownText_0x1bc45e: ; 0x1bc45e
	db $0, "Enter the", $4f
	db "amount.", $57
; 0x1bc471

UnknownText_0x1bc471: ; 0x1bc471
	db $0, "There's nothing to", $4f
	db "choose.", $58
; 0x1bc48c

UnknownText_0x1bc48c: ; 0x1bc48c
	db $0, "Which side do you", $4f
	db "want to put it on?", $57
; 0x1bc4b2

UnknownText_0x1bc4b2: ; 0x1bc4b2
	db $0, "Which side do you", $4f
	db "want to put away?", $57
; 0x1bc4d7

UnknownText_0x1bc4d7: ; 0x1bc4d7
	db $0, "Put away the", $4f
	db "@"
	text_from_ram $d099
	db $0, ".", $58
; 0x1bc4ec

UnknownText_0x1bc4ec: ; 0x1bc4ec
	db $0, "There's nothing to", $4f
	db "put away.", $58
; 0x1bc509

UnknownText_0x1bc509: ; 0x1bc509
	db $0, "Set up the", $4f
	db "@"
	text_from_ram $d099
	db $0, ".", $58
; 0x1bc51c

UnknownText_0x1bc51c: ; 0x1bc51c
	db $0, "Put away the", $4f
	db "@"
	text_from_ram $d099
	db $0, $51
	db "and set up the", $4f
	db "@"
	text_from_ram $d0ac
	db $0, ".", $58
; 0x1bc546

UnknownText_0x1bc546: ; 0x1bc546
	db $0, "That's already set", $4f
	db "up.", $58
; 0x1bc55d

UnknownText_0x1bc55d: ; 0x1bc55d
	db $0, "It's the TOWN MAP.", $57
; 0x1bc570

UnknownText_0x1bc570: ; 0x1bc570
	db $0, "It's a poster of a", $4f
	db "cute PIKACHU.", $57
; 0x1bc591

UnknownText_0x1bc591: ; 0x1bc591
	db $0, "It's a poster of a", $4f
	db "cute CLEFAIRY.", $57
; 0x1bc5b3

UnknownText_0x1bc5b3: ; 0x1bc5b3
	db $0, "It's a poster of a", $4f
	db "cute JIGGLYPUFF.", $57
; 0x1bc5d7

UnknownText_0x1bc5d7: ; 0x1bc5d7
	db $0, "It's an adorable", $4f
	db "@"
	text_from_ram $d099
	db $0, ".", $57
; 0x1bc5ef

UnknownText_0x1bc5ef: ; 0x1bc5ef
	db $0, "A giant doll! It's", $4f
	db "fluffy and cuddly.", $57
; 0x1bc615

UnknownText_0x1bc615: ; 0x1bc615
	db $0, "Hi, ", $52, "!", $4f
	db "How are you?", $58
; 0x1bc62a

UnknownText_0x1bc62a: ; 0x1bc62a
	db $0, "I found a useful", $4f
	db "item shopping, so", $58
; 0x1bc64e

UnknownText_0x1bc64e: ; 0x1bc64e
	db $0, "I bought it with", $4f
	db "your money. Sorry!", $58
; 0x1bc673

UnknownText_0x1bc673: ; 0x1bc673
	db $0, "It's in your PC.", $4f
	db "You'll like it!", $57
; 0x1bc693

UnknownText_0x1bc693: ; 0x1bc693
	db $0, "While shopping", $4f
	db "today, I saw this", $55
	db "adorable doll, so", $58
; 0x1bc6c7

UnknownText_0x1bc6c7: ; 0x1bc6c7
	db $0, "It's in your room.", $4f
	db "You'll love it!", $57
; 0x1bc6e9

UnknownText_0x1bc6e9: ; 0x1bc6e9
	text_from_ram $c6d1
	db $0, " was", $4f
	db "sent to @"
	text_from_ram $c719
	db $0, ".", $57
; 0x1bc701

UnknownText_0x1bc701: ; 0x1bc701
	db $0, $57
; 0x1bc703

UnknownText_0x1bc703: ; 0x1bc703
	text_from_ram $c719
	db $0, " bids", $4f
	db "farewell to", $57
; 0x1bc719

UnknownText_0x1bc719: ; 0x1bc719
	text_from_ram $c703
	db $0, ".", $57
; 0x1bc71f

UnknownText_0x1bc71f: ; 0x1bc71f
	db $0, "Take good care of", $4f
	db "@"
	text_from_ram $c703
	db $0, ".", $57
; 0x1bc739

UnknownText_0x1bc739: ; 0x1bc739
	db $0, "For @"
	text_from_ram $c6e7
	db $0, "'s", $4f
	db "@"
	text_from_ram $c6d1
	db $0, ",", $57
; 0x1bc74c

UnknownText_0x1bc74c: ; 0x1bc74c
	text_from_ram $c719
	db $0, " sends", $4f
	db "@"
	text_from_ram $c703
	db $0, ".", $57
; 0x1bc75e

UnknownText_0x1bc75e: ; 0x1bc75e
	text_from_ram $c719
	db $0, " will", $4f
	db "trade @"
	text_from_ram $c703
	db "@"
; 0x1bc773

UnknownText_0x1bc773: ; 0x1bc773
	db "@"
; 0x1bc774

UnknownText_0x1bc774: ; 0x1bc774
	db $0, "for @"
	text_from_ram $c6e7
	db $0, "'s", $4f
	db "@"
	text_from_ram $c6d1
	db $0, ".", $57
; 0x1bc787

UnknownText_0x1bc787: ; 0x1bc787
	text_from_ram $c6e7
	db $0, " will", $4f
	db "trade @"
	text_from_ram $c6d1
	db "@"
; 0x1bc79c

UnknownText_0x1bc79c: ; 0x1bc79c
	db "@"
; 0x1bc79d

UnknownText_0x1bc79d: ; 0x1bc79d
	db $0, "for @"
	text_from_ram $c719
	db $0, "'s", $4f
	db "@"
	text_from_ram $c703
	db $0, ".", $57
; 0x1bc7b0

UnknownText_0x1bc7b0: ; 0x1bc7b0
	text_from_ram $c6e7
	db $0, "'s", $4f
	db "@"
	text_from_ram $c6d1
	db $0, " trade…", $57
; 0x1bc7c3

UnknownText_0x1bc7c3: ; 0x1bc7c3
	db $0, "Take good care of", $4f
	db "@"
	text_from_ram $c703
	db $0, ".", $57
; 0x1bc7dd

UnknownText_0x1bc7dd: ; 0x1bc7dd
	text_from_ram $c6e7
	db $0, "'s", $4f
	db "@"
	text_from_ram $c6d1
	db $0, " trade…", $57
; 0x1bc7f0

UnknownText_0x1bc7f0: ; 0x1bc7f0
	db $0, "Take good care of", $4f
	db "@"
	text_from_ram $c703
	db $0, ".", $57
; 0x1bc80a

UnknownText_0x1bc80a: ; 0x1bc80a
	text_from_ram $c703
	db $0, " came", $4f
	db "back!", $57
; 0x1bc81a

UnknownText_0x1bc81a: ; 0x1bc81a
	db $0, $4f
	db "MARY: PROF.OAK'S", $57
; 0x1bc82d

UnknownText_0x1bc82d: ; 0x1bc82d
	db $0, $4f
	db "#MON TALK!", $57
; 0x1bc83a

UnknownText_0x1bc83a: ; 0x1bc83a
	db $0, $4f
	db "With me, MARY!", $57
; 0x1bc84b

UnknownText_0x1bc84b: ; 0x1bc84b
	db $0, $4f
	db "OAK: @"
	text_from_ram $d050
	db "@"
; 0x1bc857

UnknownText_0x1bc857: ; 0x1bc857
	db "@"
; 0x1bc858

UnknownText_0x1bc858: ; 0x1bc858
	db $0, $4f
	db "may be seen around", $57
; 0x1bc86d

UnknownText_0x1bc86d: ; 0x1bc86d
	db $0, $4f
	db "@"
	text_from_ram $d073
	db $0, ".", $57
; 0x1bc876

UnknownText_0x1bc876: ; 0x1bc876
	db $0, $4f
	db "MARY: @"
	text_from_ram $d073
	db $0, "'s", $57
; 0x1bc885

UnknownText_0x1bc885: ; 0x1bc885
	db $0, $4f
	db "sweet and adorably", $57
; 0x1bc89a

UnknownText_0x1bc89a: ; 0x1bc89a
	db $0, $4f
	db "wiggly and slickly", $57
; 0x1bc8af

UnknownText_0x1bc8af: ; 0x1bc8af
	db $0, $4f
	db "aptly named and", $57
; 0x1bc8c1

UnknownText_0x1bc8c1: ; 0x1bc8c1
	db $0, $4f
	db "undeniably kind of", $57
; 0x1bc8d6

UnknownText_0x1bc8d6: ; 0x1bc8d6
	db $0, $4f
	db "so, so unbearably", $57
; 0x1bc8ea

UnknownText_0x1bc8ea: ; 0x1bc8ea
	db $0, $4f
	db "wow, impressively", $57
; 0x1bc8fe

UnknownText_0x1bc8fe: ; 0x1bc8fe
	db $0, $4f
	db "almost poisonously", $57
; 0x1bc913

UnknownText_0x1bc913: ; 0x1bc913
	db $0, $4f
	db "ooh, so sensually", $57
; 0x1bc927

UnknownText_0x1bc927: ; 0x1bc927
	db $0, $4f
	db "so mischievously", $57
; 0x1bc93a

UnknownText_0x1bc93a: ; 0x1bc93a
	db $0, $4f
	db "so very topically", $57
; 0x1bc94e

UnknownText_0x1bc94e: ; 0x1bc94e
	db $0, $4f
	db "sure addictively", $57
; 0x1bc961

UnknownText_0x1bc961: ; 0x1bc961
	db $0, $4f
	db "looks in water is", $57
; 0x1bc975

UnknownText_0x1bc975: ; 0x1bc975
	db $0, $4f
	db "evolution must be", $57
; 0x1bc989

UnknownText_0x1bc989: ; 0x1bc989
	db $0, $4f
	db "provocatively", $57
; 0x1bc999

UnknownText_0x1bc999: ; 0x1bc999
	db $0, $4f
	db "so flipped out and", $57
; 0x1bc9ae

UnknownText_0x1bc9ae: ; 0x1bc9ae
	db $0, $4f
	db "heart-meltingly", $57
; 0x1bc9c0

UnknownText_0x1bc9c0: ; 0x1bc9c0
	db $0, $4f
	db "cute.", $57
; 0x1bc9c8

UnknownText_0x1bc9c8: ; 0x1bc9c8
	db $0, $4f
	db "weird.", $57
; 0x1bc9d1

UnknownText_0x1bc9d1: ; 0x1bc9d1
	db $0, $4f
	db "pleasant.", $57
; 0x1bc9dd

UnknownText_0x1bc9dd: ; 0x1bc9dd
	db $0, $4f
	db "bold, sort of.", $57
; 0x1bc9ee

UnknownText_0x1bc9ee: ; 0x1bc9ee
	db $0, $4f
	db "frightening.", $57
; 0x1bc9fd

UnknownText_0x1bc9fd: ; 0x1bc9fd
	db $0, $4f
	db "suave & debonair!", $57
; 0x1bca11

UnknownText_0x1bca11: ; 0x1bca11
	db $0, $4f
	db "powerful.", $57
; 0x1bca1d

UnknownText_0x1bca1d: ; 0x1bca1d
	db $0, $4f
	db "exciting.", $57
; 0x1bca29

UnknownText_0x1bca29: ; 0x1bca29
	db $0, $4f
	db "groovy!", $57
; 0x1bca33

UnknownText_0x1bca33: ; 0x1bca33
	db $0, $4f
	db "inspiring.", $57
; 0x1bca40

UnknownText_0x1bca40: ; 0x1bca40
	db $0, $4f
	db "friendly.", $57
; 0x1bca4c

UnknownText_0x1bca4c: ; 0x1bca4c
	db $0, $4f
	db "hot, hot, hot!", $57
; 0x1bca5d

UnknownText_0x1bca5d: ; 0x1bca5d
	db $0, $4f
	db "stimulating.", $57
; 0x1bca6c

UnknownText_0x1bca6c: ; 0x1bca6c
	db $0, $4f
	db "guarded.", $57
; 0x1bca77

UnknownText_0x1bca77: ; 0x1bca77
	db $0, $4f
	db "lovely.", $57
; 0x1bca81

UnknownText_0x1bca81: ; 0x1bca81
	db $0, $4f
	db "speedy.", $57
; 0x1bca8b

UnknownText_0x1bca8b: ; 0x1bca8b
	db $0, "#MON", $57
; 0x1bca91

UnknownText_0x1bca91: ; 0x1bca91
	db $0, $4f
	db "@"
	text_from_ram $d073
	db "@"
; 0x1bca98

UnknownText_0x1bca98: ; 0x1bca98
	db "@"
; 0x1bca99

UnknownText_0x1bca99: ; 0x1bca99
	db $0, $4f
	db "BEN: #MON MUSIC", $57
; 0x1bcaab

UnknownText_0x1bcaab: ; 0x1bcaab
	db $0, $4f
	db "CHANNEL!", $57
; 0x1bcab6

UnknownText_0x1bcab6: ; 0x1bcab6
	db $0, $4f
	db "It's me, DJ BEN!", $57
; 0x1bcac8

UnknownText_0x1bcac8: ; 0x1bcac8
	db $0, $4f
	db "FERN: #MUSIC!", $57
; 0x1bcad8

UnknownText_0x1bcad8: ; 0x1bcad8
	db $0, $4f
	db "With DJ FERN!", $57
; 0x1bcae8

UnknownText_0x1bcae8: ; 0x1bcae8
	db $0, $4f
	db "Today's @"
	current_day
	db $0, ",", $57
; 0x1bcaf6

UnknownText_0x1bcaf6: ; 0x1bcaf6
	db $0, $4f
	db "so let us jam to", $57
; 0x1bcb09

UnknownText_0x1bcb09: ; 0x1bcb09
	db $0, $4f
	db "so chill out to", $57
; 0x1bcb1b

UnknownText_0x1bcb1b: ; 0x1bcb1b
	db $0, $4f
	db "#MON March!", $57
; 0x1bcb29

UnknownText_0x1bcb29: ; 0x1bcb29
	db $0, $4f
	db "#MON Lullaby!", $57
; 0x1bcb39

UnknownText_0x1bcb39: ; 0x1bcb39
	db $0, $4f
	db "REED: Yeehaw! How", $57
; 0x1bcb4d

UnknownText_0x1bcb4d: ; 0x1bcb4d
	db $0, $4f
	db "y'all doin' now?", $57
; 0x1bcb60

UnknownText_0x1bcb60: ; 0x1bcb60
	db $0, $4f
	db "Whether you're up", $57
; 0x1bcb73

UnknownText_0x1bcb73: ; 0x1bcb73
	db $0, $4f
	db "or way down low,", $57
; 0x1bcb86

UnknownText_0x1bcb86: ; 0x1bcb86
	db $0, $4f
	db "don't you miss the", $57
; 0x1bcb9a

UnknownText_0x1bcb9a: ; 0x1bcb9a
	db $0, $4f
	db "LUCKY NUMBER SHOW!", $57
; 0x1bcbaf

UnknownText_0x1bcbaf: ; 0x1bcbaf
	db $0, $4f
	db "This week's Lucky", $57
; 0x1bcbc2

UnknownText_0x1bcbc2: ; 0x1bcbc2
	db $0, $4f
	db "Number is @"
	interpret_data
	text_from_ram $d073
	db $0, "!", $57
; 0x1bcbd6

UnknownText_0x1bcbd6: ; 0x1bcbd6
	db $0, $4f
	db "I'll repeat that!", $57
; 0x1bcbe9

UnknownText_0x1bcbe9: ; 0x1bcbe9
	db $0, $4f
	db "Match it and go to", $57
; 0x1bcbfe

UnknownText_0x1bcbfe: ; 0x1bcbfe
	db $0, $4f
	db "the RADIO TOWER!", $57
; 0x1bcc11

UnknownText_0x1bcc11: ; 0x1bcc11
	db $0, $4f
	db "…Repeating myself", $57
; 0x1bcc25

UnknownText_0x1bcc25: ; 0x1bcc25
	db $0, $4f
	db "gets to be a drag…", $57
; 0x1bcc3a

UnknownText_0x1bcc3a: ; 0x1bcc3a
	db $0, $4f
	db "PLACES AND PEOPLE!", $57
; 0x1bcc4f

UnknownText_0x1bcc4f: ; 0x1bcc4f
	db $0, $4f
	db "Brought to you by", $57
; 0x1bcc63

UnknownText_0x1bcc63: ; 0x1bcc63
	db $0, $4f
	db "me, DJ LILY!", $57
; 0x1bcc72

UnknownText_0x1bcc72: ; 0x1bcc72
	db $0, $4f
	db "@"
	text_from_ram $d086
	db $0, " @"
	text_from_ram $d073
	db "@"
; 0x1bcc7f

UnknownText_0x1bcc7f: ; 0x1bcc7f
	db "@"
; 0x1bcc80

UnknownText_0x1bcc80: ; 0x1bcc80
	db $0, $4f
	db "is cute.", $57
; 0x1bcc8b

UnknownText_0x1bcc8b: ; 0x1bcc8b
	db $0, $4f
	db "is sort of lazy.", $57
; 0x1bcc9e

UnknownText_0x1bcc9e: ; 0x1bcc9e
	db $0, $4f
	db "is always happy.", $57
; 0x1bccb1

UnknownText_0x1bccb1: ; 0x1bccb1
	db $0, $4f
	db "is quite noisy.", $57
; 0x1bccc3

UnknownText_0x1bccc3: ; 0x1bccc3
	db $0, $4f
	db "is precocious.", $57
; 0x1bccd4

UnknownText_0x1bccd4: ; 0x1bccd4
	db $0, $4f
	db "is somewhat bold.", $57
; 0x1bcce8

UnknownText_0x1bcce8: ; 0x1bcce8
	db $0, $4f
	db "is too picky!", $57
; 0x1bccf8

UnknownText_0x1bccf8: ; 0x1bccf8
	db $0, $4f
	db "is sort of OK.", $57
; 0x1bcd09

UnknownText_0x1bcd09: ; 0x1bcd09
	db $0, $4f
	db "is just so-so.", $57
; 0x1bcd1a

UnknownText_0x1bcd1a: ; 0x1bcd1a
	db $0, $4f
	db "is actually great.", $57
; 0x1bcd2f

UnknownText_0x1bcd2f: ; 0x1bcd2f
	db $0, $4f
	db "is just my type.", $57
; 0x1bcd42

UnknownText_0x1bcd42: ; 0x1bcd42
	db $0, $4f
	db "is so cool, no?", $57
; 0x1bcd54

UnknownText_0x1bcd54: ; 0x1bcd54
	db $0, $4f
	db "is inspiring!", $57
; 0x1bcd64

UnknownText_0x1bcd64: ; 0x1bcd64
	db $0, $4f
	db "is kind of weird.", $57
; 0x1bcd78

UnknownText_0x1bcd78: ; 0x1bcd78
	db $0, $4f
	db "is right for me?", $57
; 0x1bcd8b

UnknownText_0x1bcd8b: ; 0x1bcd8b
	db $0, $4f
	db "is definitely odd!", $57
; 0x1bcda0

UnknownText_0x1bcda0: ; 0x1bcda0
	db $0, $4f
	db "@"
	text_from_ram $d073
	db "@"
; 0x1bcda7

UnknownText_0x1bcda7: ; 0x1bcda7
	db "@"
; 0x1bcda8

UnknownText_0x1bcda8: ; 0x1bcda8
	db $0, $4f
	db "… …Ahem, we are", $57
; 0x1bcdba

UnknownText_0x1bcdba: ; 0x1bcdba
	db $0, $4f
	db "TEAM ROCKET!", $57
; 0x1bcdc9

UnknownText_0x1bcdc9: ; 0x1bcdc9
	db $0, $4f
	db "After three years", $57
; 0x1bcddd

UnknownText_0x1bcddd: ; 0x1bcddd
	db $0, $4f
	db "of preparation, we", $57
; 0x1bcdf2

UnknownText_0x1bcdf2: ; 0x1bcdf2
	db $0, $4f
	db "have risen again", $57
; 0x1bce05

UnknownText_0x1bce05: ; 0x1bce05
	db $0, $4f
	db "from the ashes!", $57
; 0x1bce17

UnknownText_0x1bce17: ; 0x1bce17
	db $0, $4f
	db "GIOVANNI! @"
	interpret_data
	db $0, "Can you", $57
; 0x1bce2e

UnknownText_0x1bce2e: ; 0x1bce2e
	db $0, $4f
	db "hear?@"
	interpret_data
	db $0, " We did it!", $57
; 0x1bce44

UnknownText_0x1bce44: ; 0x1bce44
	db $0, $4f
	db "@"
	interpret_data
	db $0, "Where is our boss?", $57
; 0x1bce5c

UnknownText_0x1bce5c: ; 0x1bce5c
	db $0, $4f
	db "@"
	interpret_data
	db $0, "Is he listening?", $57
; 0x1bce72

UnknownText_0x1bce72: ; 0x1bce72
	db $0, $4f
	db "BUENA: BUENA here!", $57
; 0x1bce87

UnknownText_0x1bce87: ; 0x1bce87
	db $0, $4f
	db "Today's password!", $57
; 0x1bce9a

UnknownText_0x1bce9a: ; 0x1bce9a
	db $0, $4f
	db "Let me think… It's", $57
; 0x1bceae

UnknownText_0x1bceae: ; 0x1bceae
	db $0, $4f
	db "@"
	text_from_ram $d073
	db $0, "!", $57
; 0x1bceb7

UnknownText_0x1bceb7: ; 0x1bceb7
	db $0, $4f
	db "Don't forget it!", $57
; 0x1bcec9

UnknownText_0x1bcec9: ; 0x1bcec9
	db $0, $4f
	db "I'm in GOLDENROD's", $57
; 0x1bcedc

UnknownText_0x1bcedc: ; 0x1bcedc
	db $0, $4f
	db "RADIO TOWER!", $57
; 0x1bceeb

UnknownText_0x1bceeb: ; 0x1bceeb
	db $0, $4f
	db "BUENA: Oh my…", $57
; 0x1bcefb

UnknownText_0x1bcefb: ; 0x1bcefb
	db $0, $4f
	db "It's midnight! I", $57
; 0x1bcf0d

UnknownText_0x1bcf0d: ; 0x1bcf0d
	db $0, $4f
	db "have to shut down!", $57
; 0x1bcf22

UnknownText_0x1bcf22: ; 0x1bcf22
	db $0, $4f
	db "Thanks for tuning", $57
; 0x1bcf36

UnknownText_0x1bcf36: ; 0x1bcf36
	db $0, $4f
	db "in to the end! But", $57
; 0x1bcf4b

UnknownText_0x1bcf4b: ; 0x1bcf4b
	db $0, $4f
	db "don't stay up too", $57
; 0x1bcf5e

UnknownText_0x1bcf5e: ; 0x1bcf5e
	db $0, $4f
	db "late! Presented to", $57
; 0x1bcf73

UnknownText_0x1bcf73: ; 0x1bcf73
	db $0, $4f
	db "you by DJ BUENA!", $57
; 0x1bcf86

UnknownText_0x1bcf86: ; 0x1bcf86
	db $0, "I'm outta here!", $57
; 0x1bcf96

UnknownText_0x1bcf96: ; 0x1bcf96
	db $0, "…", $57
; 0x1bcf99

UnknownText_0x1bcf99: ; 0x1bcf99
	db $0, $4f
	db $57
; 0x1bcf9c

UnknownText_0x1bcf9c: ; 0x1bcf9c
	db $0, $3f, $4f
	db "withdrew", $55
	db "@"
	text_from_ram $c616
	db $0, "!", $58
; 0x1bcfaf

UnknownText_0x1bcfaf: ; 0x1bcfaf
	db $0, $3f, $4f
	db "used @"
	text_from_ram $d050
	db $0, $55
	db "on @"
	text_from_ram $c616
	db $0, "!", $58
; 0x1bcfc7

UnknownText_0x1bcfc7: ; 0x1bcfc7
	db $0, "That can't be used", $4f
	db "right now.", $58
; 0x1bcfe5

UnknownText_0x1bcfe5: ; 0x1bcfe5
	db $0, "That item can't be", $4f
	db "put in the PACK.", $57
; 0x1bd009

UnknownText_0x1bd009: ; 0x1bd009
	db $0, "The @"
	text_from_ram $d073
	db $0, $4f
	db "was put in the", $55
	db "PACK.", $57
; 0x1bd029

UnknownText_0x1bd029: ; 0x1bd029
	db $0, "Remaining Time", $57
; 0x1bd039

UnknownText_0x1bd039: ; 0x1bd039
	db $0, "Your #MON's HP", $4f
	db "was healed.", $58
; 0x1bd054

UnknownText_0x1bd054: ; 0x1bd054
	db $0, "Warping…", $57
; 0x1bd05e

UnknownText_0x1bd05e: ; 0x1bd05e
	db $0, "Which number", $4f
	db "should be changed?", $57
; 0x1bd07f

UnknownText_0x1bd07f: ; 0x1bd07f
	db $0, "Will you play with", $4f
	db "@"
	text_from_ram $d086
	db $0, "?", $57
; 0x1bd09a

UnknownText_0x1bd09a: ; 0x1bd09a
	db $0, "You need two #-", $4f
	db "MON for breeding.", $58
; 0x1bd0bd

UnknownText_0x1bd0bd: ; 0x1bd0bd
	db $0, "Breeding is not", $4f
	db "possible.", $58
; 0x1bd0d8

UnknownText_0x1bd0d8: ; 0x1bd0d8
	db $0, "The compatibility", $4f
	db "is @"
	deciram $d265, $13
	db $0, ".", $55
	db "Should they breed?", $57
; 0x1bd109

UnknownText_0x1bd109: ; 0x1bd109
	db $0, "There is no EGG.", $4f
	db $58
; 0x1bd11c

UnknownText_0x1bd11c: ; 0x1bd11c
	db $0, "It's going to", $4f
	db "hatch!", $58
; 0x1bd131

UnknownText_0x1bd131: ; 0x1bd131
	db $0, "Test event", $4f
	db "@"
	deciram $d086, $12
	db $0, "?", $57
; 0x1bd145

UnknownText_0x1bd145: ; 0x1bd145
	db $0, "Start!", $57
; 0x1bd14d

UnknownText_0x1bd14d: ; 0x1bd14d
	db $0, "End!", $57
; 0x1bd153

UnknownText_0x1bd153: ; 0x1bd153
	db $0, "For a boy!", $57
; 0x1bd15f

UnknownText_0x1bd15f: ; 0x1bd15f
	db $0, "For a girl!", $57
; 0x1bd16c

UnknownText_0x1bd16c: ; 0x1bd16c
	db $0, "This doesn't", $4f
	db "concern a boy!", $57
; 0x1bd188

UnknownText_0x1bd188: ; 0x1bd188
	db $0, "The BOX is full!", $57
; 0x1bd19a

UnknownText_0x1bd19a: ; 0x1bd19a
	db $0, "A new CARD arrived", $4f
	db "from @"
	text_from_ram $d086
	db $0, ".", $57
; 0x1bd1ba

UnknownText_0x1bd1ba: ; 0x1bd1ba
	db $0, "Put this CARD in", $4f
	db "the CARD FOLDER?", $57
; 0x1bd1dd

UnknownText_0x1bd1dd: ; 0x1bd1dd
	text_from_ram $d086
	db $0, "'s CARD was", $4f
	db "listed as no.@"
	deciram $d073, $12
	db $0, ".", $58
; 0x1bd201

UnknownText_0x1bd201: ; 0x1bd201
	db $0, "Starting link.", $57
; 0x1bd211

UnknownText_0x1bd211: ; 0x1bd211
	db $0, "Link terminated.", $57
; 0x1bd223

UnknownText_0x1bd223: ; 0x1bd223
	db $0, "Closing link.", $57
; 0x1bd232

UnknownText_0x1bd232: ; 0x1bd232
	db $0, "Clear the time", $4f
	db "limit?", $57
; 0x1bd249

UnknownText_0x1bd249: ; 0x1bd249
	db $0, "The time limit was", $4f
	db "cleared.", $57
; 0x1bd266

UnknownText_0x1bd266: ; 0x1bd266
	db $0, "Pick which packet", $4f
	db "as an error?", $57
; 0x1bd286

UnknownText_0x1bd286: ; 0x1bd286
	db $0, "Trading @"
	text_from_ram $d086
	db $0, $4f
	db "for @"
	text_from_ram $d073
	db $0, "…", $57
; 0x1bd2a0

UnknownText_0x1bd2a0: ; 0x1bd2a0
	db $0, "Obtained the", $4f
	db "VOLTORBBADGE!", $57
; 0x1bd2bc

UnknownText_0x1bd2bc: ; 0x1bd2bc
	db $0, "Which floor?", $57
; 0x1bd2ca

UnknownText_0x1bd2ca: ; 0x1bd2ca
	db $0, "ANNOUNCER: BEEEP!", $51
	db "Time's up!", $57
; 0x1bd2e7

UnknownText_0x1bd2e7: ; 0x1bd2e7
	db $0, "ANNOUNCER: The", $4f
	db "Contest is over!", $57
; 0x1bd308

UnknownText_0x1bd308: ; 0x1bd308
	db $0, "REPEL's effect", $4f
	db "wore off.", $57
; 0x1bd321

UnknownText_0x1bd321: ; 0x1bd321
	db $0, $52, " found", $4f
	db "@"
	text_from_ram $d099
	db $0, "!", $57
; 0x1bd331

UnknownText_0x1bd331: ; 0x1bd331
	db $0, "But ", $52, " has", $4f
	db "no space left…", $57
; 0x1bd34b

UnknownText_0x1bd34b: ; 0x1bd34b
	db $0, "I just saw some", $4f
	db "rare @"
	text_from_ram $d073
	db $0, " in", $55
	db "@"
	text_from_ram $d086
	db $0, ".", $51
	db "I'll call you if I", $4f
	db "see another rare", $55
	db "#MON, OK?", $58
; 0x1bd39e

UnknownText_0x1bd39e: ; 0x1bd39e
	db $0, "SAVING RECORD…", $4f
	db "DON'T TURN OFF!", $57
; 0x1bd3be

UnknownText_0x1bd3be: ; 0x1bd3be
	text_from_ram $d47d
	db $0, " received", $4f
	db "@"
	text_from_ram $d073
	db $0, "!@"
	sound0x0F
	text_waitbutton
	db "@"
; 0x1bd3d6

UnknownText_0x1bd3d6: ; 0x1bd3d6
	db "@"
; 0x1bd3d7

UnknownText_0x1bd3d7: ; 0x1bd3d7
	db $0, "You have no coins.", $58
; 0x1bd3eb

UnknownText_0x1bd3eb: ; 0x1bd3eb
	db $0, "You don't have a", $4f
	db "COIN CASE.", $58
; 0x1bd407

UnknownText_0x1bd407: ; 0x1bd407
	db $0, "OK, connect the", $4f
	db "Game Link Cable.", $58
; 0x1bd429

UnknownText_0x1bd429: ; 0x1bd429
	db $0, $52, " traded", $4f
	db "@"
	text_from_ram $d050
	db $0, " for", $55
	db "@"
	text_from_ram $d086
	db $0, ".@"
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
	db $0, "I collect #MON.", $4f
	db "Do you have", $55
	db "@"
	text_from_ram $d073
	db $0, "?", $51
	db "Want to trade it", $4f
	db "for my @"
	text_from_ram $d086
	db $0, "?", $57
; 0x1bd48c

UnknownText_0x1bd48c: ; 0x1bd48c
	db $0, "You don't want to", $4f
	db "trade? Aww…", $57
; 0x1bd4aa

UnknownText_0x1bd4aa: ; 0x1bd4aa
	db $0, "Huh? That's not", $4f
	db "@"
	text_from_ram $d073
	db $0, ". ", $55
	db "What a letdown…", $57
; 0x1bd4d2

UnknownText_0x1bd4d2: ; 0x1bd4d2
	db $0, "Yay! I got myself", $4f
	db "@"
	text_from_ram $d073
	db $0, "!", $55
	db "Thanks!", $57
; 0x1bd4f4

UnknownText_0x1bd4f4: ; 0x1bd4f4
	db $0, "Hi, how's my old", $4f
	db "@"
	text_from_ram $d086
	db $0, " doing?", $57
; 0x1bd512

UnknownText_0x1bd512: ; 0x1bd512
	db $0, "Hi, I'm looking", $4f
	db "for this #MON.", $51
	db "If you have", $4f
	db "@"
	text_from_ram $d073
	db $0, ", would", $51
	db "you trade it for", $4f
	db "my @"
	text_from_ram $d086
	db $0, "?", $57
; 0x1bd565

UnknownText_0x1bd565: ; 0x1bd565
	db $0, "You don't have", $4f
	db "one either?", $51
	db "Gee, that's really", $4f
	db "disappointing…", $57
; 0x1bd5a1

UnknownText_0x1bd5a1: ; 0x1bd5a1
	db $0, "You don't have", $4f
	db "@"
	text_from_ram $d073
	db $0, "? That's", $55
	db "too bad, then.", $57
; 0x1bd5cc

UnknownText_0x1bd5cc: ; 0x1bd5cc
	db $0, "Great! Thank you!", $51
	db "I finally got", $4f
	db "@"
	text_from_ram $d073
	db $0, ".", $57
; 0x1bd5f4

UnknownText_0x1bd5f4: ; 0x1bd5f4
	db $0, "Hi! The @"
	text_from_ram $d050
	db $0, $4f
	db "you traded me is", $55
	db "doing great!", $57
; 0x1bd621

UnknownText_0x1bd621: ; 0x1bd621
	text_from_ram $d050
	db $0, "'s cute,", $4f
	db "but I don't have", $51
	db "it. Do you have", $4f
	db "@"
	text_from_ram $d073
	db $0, "?", $51
	db "Want to trade it", $4f
	db "for my @"
	text_from_ram $d086
	db $0, "?", $57
; 0x1bd673

UnknownText_0x1bd673: ; 0x1bd673
	db $0, "You don't want to", $4f
	db "trade? Oh, darn…", $57
; 0x1bd696

UnknownText_0x1bd696: ; 0x1bd696
	db $0, "That's not", $4f
	db "@"
	text_from_ram $d073
	db $0, ".", $51
	db "Please trade with", $4f
	db "me if you get one.", $57
; 0x1bd6cd

UnknownText_0x1bd6cd: ; 0x1bd6cd
	db $0, "Wow! Thank you!", $4f
	db "I always wanted", $55
	db "@"
	text_from_ram $d050
	db $0, "!", $57
; 0x1bd6f5

UnknownText_0x1bd6f5: ; 0x1bd6f5
	db $0, "How is that", $4f
	db "@"
	text_from_ram $d086
	db $0, " I", $55
	db "traded you doing?", $51
	db "Your @"
	text_from_ram $d050
	db $0, "'s", $4f
	db "so cute!", $57
; 0x1bd731

UnknownText_0x1bd731: ; 0x1bd731
	db $0, "Uh? What happened?", $57
; 0x1bd745

UnknownText_0x1bd745: ; 0x1bd745
	db $0, "Trading is so odd…", $51
	db "I still have a lot", $4f
	db "to learn about it.", $57
; 0x1bd77f

UnknownText_0x1bd77f: ; 0x1bd77f
	db $0, "Wow, that's a cute", $4f
	db "#MON.", $51
	db "Where did you get", $4f
	db "it?", $51
	db "…", $51
	db "So, you're leaving", $4f
	db "on an adventure…", $51
	db "OK!", $4f
	db "I'll help too.", $51
	db "But what can I do", $4f
	db "for you?", $51
	db "I know! I'll save", $4f
	db "money for you.", $51
	db "On a long journey,", $4f
	db "money's important.", $51
	db "Do you want me to", $4f
	db "save your money?", $57
; 0x1bd868

UnknownText_0x1bd868: ; 0x1bd868
	db $0, "OK, I'll take care", $4f
	db "of your money.", $51
	db $56, $56, $56, $58
; 0x1bd88e

UnknownText_0x1bd88e: ; 0x1bd88e
	db $0, "Be careful.", $51
	db "#MON are your", $4f
	db "friends. You need", $55
	db "to work as a team.", $51
	db "Now, go on!", $57
; 0x1bd8da

UnknownText_0x1bd8da: ; 0x1bd8da
	db $0, "Hi! Welcome home!", $4f
	db "You're trying very", $55
	db "hard, I see.", $51
	db "I've kept your", $4f
	db "room tidy.", $51
	db "Or is this about", $4f
	db "your money?", $57
; 0x1bd942

UnknownText_0x1bd942: ; 0x1bd942
	db $0, "What do you want", $4f
	db "to do?", $57
; 0x1bd95b

UnknownText_0x1bd95b: ; 0x1bd95b
	db $0, "How much do you", $4f
	db "want to save?", $57
; 0x1bd97a

UnknownText_0x1bd97a: ; 0x1bd97a
	db $0, "How much do you", $4f
	db "want to take?", $57
; 0x1bd999

UnknownText_0x1bd999: ; 0x1bd999
	db $0, "Do you want to", $4f
	db "save some money?", $57
; 0x1bd9ba

UnknownText_0x1bd9ba: ; 0x1bd9ba
	db $0, "You haven't saved", $4f
	db "that much.", $58
; 0x1bd9d7

UnknownText_0x1bd9d7: ; 0x1bd9d7
	db $0, "You can't take", $4f
	db "that much.", $58
; 0x1bd9f1

UnknownText_0x1bd9f1: ; 0x1bd9f1
	db $0, "You don't have", $4f
	db "that much.", $58
; 0x1bda0b

UnknownText_0x1bda0b: ; 0x1bda0b
	db $0, "You can't save", $4f
	db "that much.", $58
; 0x1bda25

UnknownText_0x1bda25: ; 0x1bda25
	db $0, "OK, I'll save your", $4f
	db "money. Trust me!", $51
	db $52, ", stick", $4f
	db "with it!", $57
; 0x1bda5b

UnknownText_0x1bda5b: ; 0x1bda5b
	db $0, "Your money's safe", $4f
	db "here! Get going!", $57
; 0x1bda7e

UnknownText_0x1bda7e: ; 0x1bda7e
	db $0, $52, ", don't", $4f
	db "give up!", $57
; 0x1bda90

UnknownText_0x1bda90: ; 0x1bda90
	db $0, "Just do what", $4f
	db "you can.", $57
; 0x1bdaa7

UnknownText_0x1bdaa7: ; 0x1bdaa7
	db $0, $57
; 0x1bdaa9

UnknownText_0x1bdaa9: ; 0x1bdaa9
	db $0, "I'm the DAY-CARE", $4f
	db "MAN. Want me to", $55
	db "raise a #MON?", $57
; 0x1bdad8

UnknownText_0x1bdad8: ; 0x1bdad8
	db $0, "I'm the DAY-CARE", $4f
	db "MAN. Do you know", $55
	db "about EGGS?", $51
	db "I was raising", $4f
	db "#MON with my", $55
	db "wife, you see.", $51
	db "We were shocked to", $4f
	db "find an EGG!", $51
	db "How incredible is", $4f
	db "that?", $51
	db "So, want me to", $4f
	db "raise a #MON?", $57
; 0x1bdb85

UnknownText_0x1bdb85: ; 0x1bdb85
	db $0, "I'm the DAY-CARE", $4f
	db "LADY.", $51
	db "Should I raise a", $4f
	db "#MON for you?", $57
; 0x1bdbbb

UnknownText_0x1bdbbb: ; 0x1bdbbb
	db $0, "I'm the DAY-CARE", $4f
	db "LADY. Do you know", $55
	db "about EGGS?", $51
	db "My husband and I", $4f
	db "were raising some", $55
	db "#MON, you see.", $51
	db "We were shocked to", $4f
	db "find an EGG!", $51
	db "How incredible", $4f
	db "could that be?", $51
	db "Should I raise a", $4f
	db "#MON for you?", $57
; 0x1bdc79

UnknownText_0x1bdc79: ; 0x1bdc79
	db $0, "What should I", $4f
	db "raise for you?", $58
; 0x1bdc97

UnknownText_0x1bdc97: ; 0x1bdc97
	db $0, "Oh? But you have", $4f
	db "just one #MON.", $58
; 0x1bdcb8

UnknownText_0x1bdcb8: ; 0x1bdcb8
	db $0, "Sorry, but I can't", $4f
	db "accept an EGG.", $58
; 0x1bdcda

UnknownText_0x1bdcda: ; 0x1bdcda
	db $0, "Remove MAIL before", $4f
	db "you come see me.", $58
; 0x1bdcff

UnknownText_0x1bdcff: ; 0x1bdcff
	db $0, "If you give me", $4f
	db "that, what will", $55
	db "you battle with?", $58
; 0x1bdd30

UnknownText_0x1bdd30: ; 0x1bdd30
	db $0, "OK. I'll raise", $4f
	db "your @"
	text_from_ram $d073
	db $0, ".", $58
; 0x1bdd4b

UnknownText_0x1bdd4b: ; 0x1bdd4b
	db $0, "Come back for it", $4f
	db "later.", $57
; 0x1bdd64

UnknownText_0x1bdd64: ; 0x1bdd64
	db $0, "Are we geniuses or", $4f
	db "what? Want to see", $55
	db "your @"
	text_from_ram $d073
	db $0, "?", $57
; 0x1bdd96

UnknownText_0x1bdd96: ; 0x1bdd96
	db $0, "Your @"
	text_from_ram $d073
	db $0, $4f
	db "has grown a lot.", $51
	db "By level, it's", $4f
	db "grown by @"
	deciram $d087, $13
	db $0, ".", $51
	db "If you want your", $4f
	db "#MON back, it", $55
	db "will cost ¥@"
	deciram $d088, $34
	db $0, ".", $57
; 0x1bde04

UnknownText_0x1bde04: ; 0x1bde04
	db $0, "Perfect! Here's", $4f
	db "your #MON.", $58
; 0x1bde1f

UnknownText_0x1bde1f: ; 0x1bde1f
	db $0, $52, " got back", $4f
	db "@"
	text_from_ram $d073
	db $0, ".", $58
; 0x1bde32

UnknownText_0x1bde32: ; 0x1bde32
	db $0, "Huh? Back already?", $4f
	db "Your @"
	text_from_ram $d073
	db $0, $51
	db "needs a little", $4f
	db "more time with us.", $51
	db "If you want your", $4f
	db "#MON back, it", $55
	db "will cost ¥100.", $57
; 0x1bdea2

UnknownText_0x1bdea2: ; 0x1bdea2
	db $0, "You have no room", $4f
	db "for it.", $58
; 0x1bdebc

UnknownText_0x1bdebc: ; 0x1bdebc
	db $0, "You don't have", $4f
	db "enough money.", $58
; 0x1bded9

UnknownText_0x1bded9: ; 0x1bded9
	db $0, "Oh, fine then.", $58
; 0x1bdee9

UnknownText_0x1bdee9: ; 0x1bdee9
	db $0, "Come again.", $57
; 0x1bdef6

UnknownText_0x1bdef6: ; 0x1bdef6
	db $0, "Not yet…", $57
; 0x1bdf00

UnknownText_0x1bdf00: ; 0x1bdf00
	db $0, "Ah, it's you!", $51
	db "We were raising", $4f
	db "your #MON, and", $51
	db "my goodness, were", $4f
	db "we surprised!", $51
	db "Your #MON had", $4f
	db "an EGG!", $51
	db "We don't know how", $4f
	db "it got there, but", $51
	db "your #MON had", $4f
	db "it. You want it?", $57
; 0x1bdfa5

UnknownText_0x1bdfa5: ; 0x1bdfa5
	db $0, $52, " received", $4f
	db "the EGG!", $57
; 0x1bdfba

UnknownText_0x1bdfba: ; 0x1bdfba
	db $0, "Take good care of", $4f
	db "it.", $57
; 0x1bdfd1

UnknownText_0x1bdfd1: ; 0x1bdfd1
	db $0, "Well then, I'll", $4f
	db "keep it. Thanks!", $57
; 0x1bdff2

UnknownText_0x1bdff2: ; 0x1bdff2
	db $0, "You have no room", $4f
	db "in your party.", $55
	db "Come back later.", $57
; 0x1be024

UnknownText_0x1be024: ; 0x1be024
	db $0, "Which #MON", $4f
	db "should I photo-", $55
	db "graph?", $58
; 0x1be047

UnknownText_0x1be047: ; 0x1be047
	db $0, "All righty. Hold", $4f
	db "still for a bit.", $58
; 0x1be06a

UnknownText_0x1be06a: ; 0x1be06a
	db $0, "Presto! All done.", $4f
	db "Come again, OK?", $57
; 0x1be08d
