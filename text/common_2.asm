UnknownText_0x1c0000: ; 1c0000
	db $0, "Oh, no picture?", $4f
	db "Come again, OK?", $57
; 1c0021

UnknownText_0x1c0021: ; 1c0021
	db $0, "An EGG? My talent", $4f
	db "is worth more…", $57
; 1c0043

UnknownText_0x1c0043: ; 1c0043
	db $0, "Hello, hello! I'm", $4f
	db "the NAME RATER.", $51
	db "I rate the names", $4f
	db "of #MON.", $51
	db "Would you like me", $4f
	db "to rate names?", $57
; 1c00a0

UnknownText_0x1c00a0: ; 1c00a0
	db $0, "Which #MON's", $4f
	db "nickname should I", $55
	db "rate for you?", $58
; 1c00cd

UnknownText_0x1c00cd: ; 1c00cd
	db $0, "Hm… @"
	text_from_ram $d073
	db $0, "…", $4f
	db "That's a fairly", $55
	db "decent name.", $51
	db "But, how about a", $4f
	db "slightly better", $55
	db "nickname?", $51
	db "Want me to give it", $4f
	db "a better name?", $57
; 1c0142

UnknownText_0x1c0142: ; 1c0142
	db $0, "All right. What", $4f
	db "name should we", $55
	db "give it, then?", $58
; 1c0171

UnknownText_0x1c0171: ; 1c0171
	db $0, "That's a better", $4f
	db "name than before!", $51
	db "Well done!", $57
; 1c019e

UnknownText_0x1c019e: ; 1c019e
	db $0, "OK, then. Come", $4f
	db "again sometime.", $57
; 1c01be

UnknownText_0x1c01be: ; 1c01be
	db $0, "Hm… @"
	text_from_ram $d073
	db $0, "?", $4f
	db "What a great name!", $55
	db "It's perfect.", $51
	db "Treat @"
	text_from_ram $d073
	db $0, $4f
	db "with loving care.", $57
; 1c0208

UnknownText_0x1c0208: ; 1c0208
	db $0, "Whoa… That's just", $4f
	db "an EGG.", $57
; 1c0222

UnknownText_0x1c0222: ; 1c0222
	db $0, "It might look the", $4f
	db "same as before,", $51
	db "but this new name", $4f
	db "is much better!", $51
	db "Well done!", $57
; 1c0272

UnknownText_0x1c0272: ; 1c0272
	db $0, "All right. This", $4f
	db "#MON is now", $55
	db "named @"
	text_from_ram $d073
	db $0, ".", $58
; 1c029c

UnknownText_0x1c029c: ; 1c029c
	text_from_ram $d073
	db $0, " gained@"
	db "@"
; 1c02a9

UnknownText_0x1c02a9: ; 1c02a9
	db $0, $4f
	db "a boosted", $55
	db "@"
	deciram $d086, $24
	db $0, " EXP. Points!", $58
; 1c02c9

UnknownText_0x1c02c9: ; 1c02c9
	db $0, $4f
	db "@"
	deciram $d086, $24
	db $0, " EXP. Points!", $58
; 1c02df

UnknownText_0x1c02df: ; 1c02df
	db $0, "Go! @"
	db "@"
; 1c02e6

UnknownText_0x1c02e6: ; 1c02e6
	db $0, "Do it! @"
	db "@"
; 1c02f0

UnknownText_0x1c02f0: ; 1c02f0
	db $0, "Go for it,", $4f
	db "@"
	db "@"
; 1c02fe

UnknownText_0x1c02fe: ; 1c02fe
	db $0, "Your foe's weak!", $4f
	db "Get'm, @"
	db "@"
; 1c0317

UnknownText_0x1c0317: ; 1c0317
	text_from_ram $c621
	db $0, "!", $57
; 1c031d

UnknownText_0x1c031d: ; 1c031d
	text_from_ram $c621
	db $0, ",@"
	db "@"
; 1c0324

UnknownText_0x1c0324: ; 1c0324
	db $0, " that's", $4f
	db "enough! Come back!@"
	db "@"
; 1c0340

UnknownText_0x1c0340: ; 1c0340
	db $0, " OK!", $4f
	db "Come back!@"
	db "@"
; 1c0352

UnknownText_0x1c0352: ; 1c0352
	db $0, " good!", $4f
	db "Come back!@"
	db "@"
; 1c0366

UnknownText_0x1c0366: ; 1c0366
	db $0, " come", $4f
	db "back!", $57
; 1c0373

UnknownText_0x1c0373: ; 1c0373
	db $0, "Booted up a TM.", $58
; 1c0384

UnknownText_0x1c0384: ; 1c0384
	db $0, "Booted up an HM.", $58
; 1c0396

UnknownText_0x1c0396: ; 1c0396
	db $0, "It contained", $4f
	db "@"
	text_from_ram $d086
	db $0, ".", $51
	db "Teach @"
	text_from_ram $d086
	db $0, $4f
	db "to a #MON?", $57
; 1c03c2

UnknownText_0x1c03c2: ; 1c03c2
	text_from_ram $d086
	db $0, " is", $4f
	db "not compatible", $55
	db "with @"
	text_from_ram $d073
	db $0, ".", $51
	db "It can't learn", $4f
	db "@"
	text_from_ram $d086
	db $0, ".", $58
; 1c03fa

UnknownText_0x1c03fa: ; 1c03fa
	db $0, "You have no room", $4f
	db "for any more", $55
	db "@"
	text_from_ram $d073
	db $0, "S.", $58
; 1c0421

UnknownText_0x1c0421: ; 1c0421
	db $0, "You received", $4f
	db "@"
	text_from_ram $d073
	db $0, "!", $58
; 1c0436

UnknownText_0x1c0436: ; 1c0436
	db $0, "The link has been", $4f
	db "cancelled.", $58
; 1c0454

UnknownText_0x1c0454: ; 1c0454
	db $0, "Communication", $4f
	db "error.", $58
; 1c046a

UnknownText_0x1c046a: ; 1c046a
	db $0, "Must retrieve GIFT", $4f
	db "at #MON CENTER.", $58
; 1c048e

UnknownText_0x1c048e: ; 1c048e
	db $0, "Your friend isn't", $4f
	db "ready.", $58
; 1c04a7

UnknownText_0x1c04a7: ; 1c04a7
	db $0, "Sorry--only five", $4f
	db "GIFTS a day.", $58
; 1c04c6

UnknownText_0x1c04c6: ; 1c04c6
	db $0, "Sorry. One GIFT", $4f
	db "a day per person.", $58
; 1c04e9

UnknownText_0x1c04e9: ; 1c04e9
	text_from_ram $c903
	db $0, " sent", $4f
	db "@"
	text_from_ram $d073
	db $0, ".", $58
; 1c04fa

UnknownText_0x1c04fa: ; 1c04fa
	text_from_ram $c903
	db $0, " sent", $4f
	db "@"
	text_from_ram $d073
	db $0, $55
	db "to @"
	text_from_ram $c953
	db $0, "'s home.", $58
; 1c051a

UnknownText_0x1c051a: ; 1c051a
	db $0, "Received", $4f
	db "@"
	text_from_ram $c850
	db $0, "'s CARD.", $58
; 1c0531

UnknownText_0x1c0531: ; 1c0531
	text_from_ram $c850
	db $0, "'s CARD was", $4f
	db "listed as no.@"
	deciram $d265, $12
	db $0, ".", $58
; 1c0555

UnknownText_0x1c0555: ; 1c0555
	db $0, "The CARD was not", $4f
	db "registered.", $58
; 1c0573

UnknownText_0x1c0573: ; 1c0573
	db $0, "The link has been", $4f
	db "cancelled.", $58
; 1c0591

UnknownText_0x1c0591: ; 1c0591
	db $0, "Communication", $4f
	db "error.", $58
; 1c05a7

_BadgeRequiredText: ; 1c05a7
	db $0, "Sorry! A new BADGE", $4f
	db "is required.", $58
; 1c05c8

UnknownText_0x1c05c8: ; 1c05c8
	db $0, "Can't use that", $4f
	db "here.", $58
; 1c05dd

UnknownText_0x1c05dd: ; 1c05dd
	text_from_ram $d086
	db $0, " used", $4f
	db "CUT!", $58
; 1c05ec

UnknownText_0x1c05ec: ; 1c05ec
	db $0, "There's nothing to", $4f
	db "CUT here.", $58
; 1c0609

UnknownText_0x1c0609: ; 1c0609
	db $0, "A blinding FLASH", $4f
	db "lights the area!@"
	text_waitbutton
	db "@"
; 1c062e

UnknownText_0x1c062e: ; 1c062e
	db "@"
; 1c062f

_UsedSurfText: ; 1c062f
	text_from_ram $d086
	db $0, " used", $4f
	db "SURF!", $57
; 1c063f

_CantSurfText: ; 1c063f
	db $0, "You can't SURF", $4f
	db "here.", $58
; 1c0654

_AlreadySurfingText: ; 1c0654
	db $0, "You're already", $4f
	db "SURFING.", $58
; 1c066c

_AskSurfText: ; 1c066c
	db $0, "The water is calm.", $4f
	db "Want to SURF?", $57
; 1c068e

UnknownText_0x1c068e: ; 1c068e
	text_from_ram $d086
	db $0, " used", $4f
	db "WATERFALL!", $57
; 1c06a3

UnknownText_0x1c06a3: ; 1c06a3
	db $0, "Wow, it's a huge", $4f
	db "waterfall.", $57
; 1c06bf

UnknownText_0x1c06bf: ; 1c06bf
	db $0, "Do you want to use", $4f
	db "WATERFALL?", $57
; 1c06de

UnknownText_0x1c06de: ; 1c06de
	text_from_ram $d086
	db $0, " used", $4f
	db "DIG!", $57
; 1c06ed

UnknownText_0x1c06ed: ; 1c06ed
	db $0, $52, " used an", $4f
	db "ESCAPE ROPE.", $57
; 1c0705

UnknownText_0x1c0705: ; 1c0705
	db $0, "Can't use that", $4f
	db "here.", $57
; 1c071a

UnknownText_0x1c071a: ; 1c071a
	db $0, "Return to the last", $4f
	db "#MON CENTER.", $57
; 1c073b

UnknownText_0x1c073b: ; 1c073b
	db $0, "Can't use that", $4f
	db "here.", $51
	db $57
; 1c0751

UnknownText_0x1c0751: ; 1c0751
	db $0, "A #MON is using", $4f
	db "STRENGTH already.", $58
; 1c0774

UnknownText_0x1c0774: ; 1c0774
	text_from_ram $d086
	db $0, " used", $4f
	db "STRENGTH!", $57
; 1c0788

UnknownText_0x1c0788: ; 1c0788
	text_from_ram $d073
	db $0, " can", $4f
	db "move boulders.", $58
; 1c07a0

UnknownText_0x1c07a0: ; 1c07a0
	db $0, "A #MON may be", $4f
	db "able to move this.", $51
	db "Want to use", $4f
	db "STRENGTH?", $57
; 1c07d8

UnknownText_0x1c07d8: ; 1c07d8
	db $0, "Boulders may now", $4f
	db "be moved!", $57
; 1c07f4

UnknownText_0x1c07f4: ; 1c07f4
	db $0, "A #MON may be", $4f
	db "able to move this.", $57
; 1c0816

UnknownText_0x1c0816: ; 1c0816
	text_from_ram $d086
	db $0, " used", $4f
	db "WHIRLPOOL!", $58
; 1c082b

UnknownText_0x1c082b: ; 1c082b
	db $0, "It's a vicious", $4f
	db "whirlpool!", $51
	db "A #MON may be", $4f
	db "able to pass it.", $57
; 1c0864

UnknownText_0x1c0864: ; 1c0864
	db $0, "A whirlpool is in", $4f
	db "the way.", $51
	db "Want to use", $4f
	db "WHIRLPOOL?", $57
; 1c0897

UnknownText_0x1c0897: ; 1c0897
	text_from_ram $d086
	db $0, " did a", $4f
	db "HEADBUTT!", $58
; 1c08ac

UnknownText_0x1c08ac: ; 1c08ac
	db $0, "Nope. Nothing…", $57
; 1c08bc

UnknownText_0x1c08bc: ; 1c08bc
	db $0, "A #MON could be", $4f
	db "in this tree.", $51
	db "Want to HEADBUTT", $4f
	db "it?", $57
; 1c08f0

UnknownText_0x1c08f0: ; 1c08f0
	text_from_ram $d086
	db $0, " used", $4f
	db "ROCK SMASH!", $58
; 1c0906

UnknownText_0x1c0906: ; 1c0906
	db $0, "Maybe a #MON", $4f
	db "can break this.", $57
; 1c0924

UnknownText_0x1c0924: ; 1c0924
	db $0, "This rock looks", $4f
	db "breakable.", $51
	db "Want to use ROCK", $4f
	db "SMASH?", $57
; 1c0958

UnknownText_0x1c0958: ; 1c0958
	db $0, "Oh!", $4f
	db "A bite!", $58
; 1c0965

UnknownText_0x1c0965: ; 1c0965
	db $0, "Not even a nibble!", $58
; 1c0979

UnknownText_0x1c0979: ; 1c0979
	db $0, "Looks like there's", $4f
	db "nothing here.", $58
; 1c099a

UnknownText_0x1c099a: ; 1c099a
	db $0, "You can't get off", $4f
	db "here!", $57
; 1c09b2

UnknownText_0x1c09b2: ; 1c09b2
	db $0, $52, " got on the", $4f
	db "@"
	text_from_ram $d086
	db $0, ".", $57
; 1c09c7

UnknownText_0x1c09c7: ; 1c09c7
	db $0, $52, " got off", $4f
	db "the @"
	text_from_ram $d086
	db $0, ".", $57
; 1c09dd

UnknownText_0x1c09dd: ; 1c09dd
	db $0, "This tree can be", $4f
	db "CUT!", $51
	db "Want to use CUT?", $57
; 1c0a05

UnknownText_0x1c0a05: ; 1c0a05
	db $0, "This tree can be", $4f
	db "CUT!", $57
; 1c0a1c

UnknownText_0x1c0a1c: ; 1c0a1c
	db $0, $52, " found", $4f
	db "@"
	text_from_ram $d099
	db $0, "!", $57
; 1c0a2c

UnknownText_0x1c0a2c: ; 1c0a2c
	db $0, "But ", $52, " can't", $4f
	db "carry any more", $55
	db "items.", $57
; 1c0a4e

UnknownText_0x1c0a4e: ; 1c0a4e
	db $0, $52, " is out of", $4f
	db "useable #MON!", $51
	db $52, " whited", $4f
	db "out!", $57
; 1c0a77

UnknownText_0x1c0a77: ; 1c0a77
	db $0, "Yes! ITEMFINDER", $4f
	db "indicates there's", $55
	db "an item nearby.", $58
; 1c0aa9

UnknownText_0x1c0aa9: ; 1c0aa9
	db $0, "Nope! ITEMFINDER", $4f
	db "isn't responding.", $58
; 1c0acc

UnknownText_0x1c0acc: ; 1c0acc
	text_from_ram $d099
	db $0, $4f
	db "fainted!", $58
; 1c0ada

UnknownText_0x1c0ada: ; 1c0ada
	db $0, $52, " is out of", $4f
	db "useable #MON!", $51
	db $52, " whited", $4f
	db "out!", $58
; 1c0b03

UnknownText_0x1c0b03: ; 1c0b03
	text_from_ram $d099
	db $0, " used", $4f
	db "SWEET SCENT!", $57
; 1c0b1a

UnknownText_0x1c0b1a: ; 1c0b1a
	db $0, "Looks like there's", $4f
	db "nothing here…", $57
; 1c0b3b

UnknownText_0x1c0b3b: ; 1c0b3b
	db $0, $52, " sprinkled", $4f
	db "water.", $51
	db "But nothing", $4f
	db "happened…", $57
; 1c0b65

UnknownText_0x1c0b65: ; 1c0b65
	db $0, $52, "'s #MON", $4f
	db "were all healed!", $57
; 1c0b7f

UnknownText_0x1c0b7f: ; 1c0b7f
	db $0, "An EGG can't hold", $4f
	db "an item.", $58
; 1c0b9a

UnknownText_0x1c0b9a: ; 1c0b9a
	db $0, "No items.", $57
; 1c0ba5

UnknownText_0x1c0ba5: ; 1c0ba5
	db $0, "Throw away how", $4f
	db "many?", $57
; 1c0bbb

UnknownText_0x1c0bbb: ; 1c0bbb
	db $0, "Throw away @"
	deciram $d10c, $12
	db $0, $4f
	db "@"
	text_from_ram $d086
	db $0, "(S)?", $57
; 1c0bd8

UnknownText_0x1c0bd8: ; 1c0bd8
	db $0, "Threw away", $4f
	db "@"
	text_from_ram $d086
	db $0, "(S).", $58
; 1c0bee

UnknownText_0x1c0bee: ; 1c0bee
	db $0, "OAK: ", $52, "!", $4f
	db "This isn't the", $55
	db "time to use that!", $58
; 1c0c17

UnknownText_0x1c0c17: ; 1c0c17
	db $0, "You don't have a", $4f
	db "#MON!", $58
; 1c0c2e

UnknownText_0x1c0c2e: ; 1c0c2e
	db $0, "Registered the", $4f
	db "@"
	text_from_ram $d086
	db $0, ".", $58
; 1c0c45

UnknownText_0x1c0c45: ; 1c0c45
	db $0, "You can't register", $4f
	db "that item.", $58
; 1c0c63

UnknownText_0x1c0c63: ; 1c0c63
	db $0, "Where should this", $4f
	db "be moved to?", $57
; 1c0c83

UnknownText_0x1c0c83: ; 1c0c83
	db $0, $57
; 1c0c85

UnknownText_0x1c0c85: ; 1c0c85
	db $0, "You can't use it", $4f
	db "in a battle.", $58
; 1c0ca3

UnknownText_0x1c0ca3: ; 1c0ca3
	db $0, "Are you a boy?", $4f
	db "Or are you a girl?", $57
; 1c0cc6

UnknownText_0x1c0cc6: ; 1c0cc6
	db $0, $5a, "'s", $4f
	db "@"
	text_from_ram $d086
	db "@"
; 1c0ccf

UnknownText_0x1c0ccf: ; 1c0ccf
	db "@"
; 1c0cd0

UnknownText_0x1c0cd0: ; 1c0cd0
	interpret_data
	db $0, $4c, "went way up!", $58
; 1c0ce0

UnknownText_0x1c0ce0: ; 1c0ce0
	db $0, " went up!", $58
; 1c0ceb

UnknownText_0x1c0ceb: ; 1c0ceb
	db $0, $59, "'s", $4f
	db "@"
	text_from_ram $d086
	db "@"
; 1c0cf4

UnknownText_0x1c0cf4: ; 1c0cf4
	db "@"
; 1c0cf5

UnknownText_0x1c0cf5: ; 1c0cf5
	interpret_data
	db $0, $4c, "sharply fell!", $58
; 1c0d06

UnknownText_0x1c0d06: ; 1c0d06
	db $0, " fell!", $58
; 1c0d0e

UnknownText_0x1c0d0e: ; 1c0d0e
	db $0, $5a, "@"
	db "@"
; 1c0d12

UnknownText_0x1c0d12: ; 1c0d12
	db $0, $4f
	db "made a whirlwind!", $58
; 1c0d26

UnknownText_0x1c0d26: ; 1c0d26
	db $0, $4f
	db "took in sunlight!", $58
; 1c0d3a

UnknownText_0x1c0d3a: ; 1c0d3a
	db $0, $4f
	db "lowered its head!", $58
; 1c0d4e

UnknownText_0x1c0d4e: ; 1c0d4e
	db $0, $4f
	db "is glowing!", $58
; 1c0d5c

UnknownText_0x1c0d5c: ; 1c0d5c
	db $0, $4f
	db "flew up high!", $58
; 1c0d6c

UnknownText_0x1c0d6c: ; 1c0d6c
	db $0, $4f
	db "dug a hole!", $58
; 1c0d7a

_ActorNameText: ; 1c0d7a
	db $0, $5a, "@"
	db "@"
; 1c0d7e

_UsedMove1Text: ; 1c0d7e
	db $0, $4f
	db "used @"
	db "@"
; 1c0d87

_UsedMove2Text: ; 1c0d87
	db $0, $4f
	db "used @"
	db "@"
; 1c0d90

_UsedInsteadText: ; 1c0d90
	db $0, "instead,", $55
	db "@"
	db "@"
; 1c0d9c

_MoveNameText: ; 1c0d9c
	text_from_ram StringBuffer2
	db "@"
; 1c0da0

UnknownText_0x1c0da0: ; 1c0da0
	db "@"
; 1c0da1

_EndUsedMove1Text: ; 1c0da1
	db $0, "!", $57
; 1c0da4

_EndUsedMove2Text: ; 1c0da4
	db $0, "!", $57
; 1c0da7

_EndUsedMove3Text: ; 1c0da7
	db $0, "!", $57
; 1c0daa

_EndUsedMove4Text: ; 1c0daa
	db $0, "!", $57
; 1c0dad

_EndUsedMove5Text: ; 1c0dad
	db $0, "!", $57
; 1c0db0

UnknownText_0x1c0db0: ; 1c0db0
	db $0, "Huh?", $51
	db "@"
	db "@"
; 1c0db8

UnknownText_0x1c0db8: ; 1c0db8
	db $0, $57
; 1c0dba

UnknownText_0x1c0dba: ; 1c0dba
	text_from_ram StringBuffer1
	db $0, " came", $4f
	db "out of its EGG!@"
	sound0x02
	text_waitbutton
	db "@"
; 1c0dd7

UnknownText_0x1c0dd7: ; 1c0dd7
	db "@"
; 1c0dd8

UnknownText_0x1c0dd8: ; 1c0dd8
	db $0, "Give a nickname to", $4f
	db "@"
	text_from_ram StringBuffer1
	db $0, "?", $57
; 1c0df3

UnknownText_0x1c0df3: ; 1c0df3
	db $0, "It's @"
	text_from_ram $df2f
	db $0, $4f
	db "that was left with", $55
	db "the DAY-CARE LADY.", $57
; 1c0e24

UnknownText_0x1c0e24: ; 1c0e24
	db $0, "It's @"
	text_from_ram $def6
	db $0, $4f
	db "that was left with", $55
	db "the DAY-CARE MAN.", $57
; 1c0e54

UnknownText_0x1c0e54: ; 1c0e54
	db $0, "It's brimming with", $4f
	db "energy.", $58
; 1c0e6f

UnknownText_0x1c0e6f: ; 1c0e6f
	db $0, "It has no interest", $4f
	db "in @"
	text_from_ram $d073
	db $0, ".", $58
; 1c0e8d

UnknownText_0x1c0e8d: ; 1c0e8d
	db $0, "It appears to care", $4f
	db "for @"
	text_from_ram $d073
	db $0, ".", $58
; 1c0eac

UnknownText_0x1c0eac: ; 1c0eac
	db $0, "It's friendly with", $4f
	db "@"
	text_from_ram $d073
	db $0, ".", $58
; 1c0ec6

UnknownText_0x1c0ec6: ; 1c0ec6
	db $0, "It shows interest", $4f
	db "in @"
	text_from_ram $d073
	db $0, ".", $58
; 1c0ee3

UnknownText_0x1c0ee3: ; 1c0ee3
	db $0, "There's no MAIL", $4f
	db "here.", $58
; 1c0ef9

UnknownText_0x1c0ef9: ; 1c0ef9
	db $0, "The cleared MAIL", $4f
	db "was put away.", $58
; 1c0f19

UnknownText_0x1c0f19: ; 1c0f19
	db $0, "The PACK is full.", $58
; 1c0f2c

UnknownText_0x1c0f2c: ; 1c0f2c
	db $0, "The MAIL's message", $4f
	db "will be lost. OK?", $57
; 1c0f51

UnknownText_0x1c0f51: ; 1c0f51
	db $0, "It's already hold-", $4f
	db "ing an item.", $58
; 1c0f71

UnknownText_0x1c0f71: ; 1c0f71
	db $0, "An EGG can't hold", $4f
	db "any MAIL.", $58
; 1c0f8d

UnknownText_0x1c0f8d: ; 1c0f8d
	db $0, "The MAIL was moved", $4f
	db "from the MAILBOX.", $58
; 1c0fb3

UnknownText_0x1c0fb3: ; 1c0fb3
	db $0, "Yes", $58
; 1c0fb8

UnknownText_0x1c0fb8: ; 1c0fb8
	db $0, "No", $58
; 1c0fbc

UnknownText_0x1c0fbc: ; 1c0fbc
	deciram $cf64, $13
	db $0, " @"
	text_from_ram $d073
	db $0, $4f
	db "Animation type @"
	text_from_ram $d086
	db "@"
; 1c0fdc

UnknownText_0x1c0fdc: ; 1c0fdc
	db "@"
; 1c0fdd

UnknownText_0x1c0fdd: ; 1c0fdd
	db $0, "#MON number?", $57
; 1c0feb

UnknownText_0x1c0feb: ; 1c0feb
	text_from_ram $d073
	db $0, " was", $4f
	db "sent to BILL's PC.", $58
; 1c1006

UnknownText_0x1c1006: ; 1c1006
	db $0, "You gotta have", $4f
	db "#MON to call!", $58
; 1c1024

UnknownText_0x1c1024: ; 1c1024
	db $0, "What?", $57
; 1c102b

UnknownText_0x1c102b: ; 1c102b
	db $0, "There is a #MON", $4f
	db "holding MAIL.", $51
	db "Please remove the", $4f
	db "MAIL.", $58
; 1c1062

UnknownText_0x1c1062: ; 1c1062
	db $0, "You don't have a", $4f
	db "single #MON!", $58
; 1c1080

UnknownText_0x1c1080: ; 1c1080
	db $0, "You can't deposit", $4f
	db "your last #MON!", $58
; 1c10a2

UnknownText_0x1c10a2: ; 1c10a2
	db $0, "You can't take any", $4f
	db "more #MON.", $58
; 1c10c0

UnknownText_0x1c10c0: ; 1c10c0
	db $0, "Caught @"
	text_from_ram $d073
	db $0, "!", $58
; 1c10cf

UnknownText_0x1c10cf: ; 1c10cf
	db $0, "Switch #MON?", $57
; 1c10dd

UnknownText_0x1c10dd: ; 1c10dd
	db $0, "You already caught", $4f
	db "a @"
	text_from_ram $d073
	db $0, ".", $58
; 1c10fa

UnknownText_0x1c10fa: ; 1c10fa
	db $0, "This Bug-Catching", $4f
	db "Contest winner is@"
	interpret_data
	db $0, "…", $51
	db "@"
	text_from_ram $d016
	db $0, ",", $4f
	db "who caught a", $55
	db "@"
	text_from_ram $d073
	db $0, "!@"
	db "@"
; 1c113f

UnknownText_0x1c113f: ; 1c113f
	db $0, $51
	db "The winning score", $4f
	db "was @"
	deciram $d004, $23
	db $0, " points!", $58
; 1c1166

UnknownText_0x1c1166: ; 1c1166
	db $0, "Placing second was", $4f
	db "@"
	text_from_ram $d016
	db $0, ",", $51
	db "who caught a", $4f
	db "@"
	text_from_ram $d073
	db $0, "!@"
	db "@"
; 1c1196

UnknownText_0x1c1196: ; 1c1196
	db $0, $51
	db "The score was", $4f
	db "@"
	deciram $d008, $23
	db $0, " points!", $58
; 1c11b5

UnknownText_0x1c11b5: ; 1c11b5
	db $0, "Placing third was", $4f
	db "@"
	text_from_ram $d016
	db $0, ",", $51
	db "who caught a", $4f
	db "@"
	text_from_ram $d073
	db $0, "!@"
	db "@"
; 1c11e4

UnknownText_0x1c11e4: ; 1c11e4
	db $0, $51
	db "The score was", $4f
	db "@"
	deciram $d00c, $23
	db $0, " points!", $58
; 1c1203

UnknownText_0x1c1203: ; 1c1203
	db $0, "Let me measure", $4f
	db "that MAGIKARP.", $51
	db "…Hm, it measures", $4f
	db "@"
	text_from_ram $d073
	db $0, ".", $58
; 1c123a

UnknownText_0x1c123a: ; 1c123a
	db $0, "CURRENT RECORD", $51
	db "@"
	text_from_ram $d073
	db $0, " caught by", $4f
	db "@"
	text_from_ram $dfea
	text_waitbutton
	db "@"
; 1c1260

UnknownText_0x1c1260: ; 1c1260
	db "@"
; 1c1261

UnknownText_0x1c1261: ; 1c1261
	db $0, "Congratulations!", $51
	db "We have a match", $4f
	db "with the ID number", $51
	db "of @"
	text_from_ram $d073
	db $0, " in", $4f
	db "your party.", $58
; 1c12ae

UnknownText_0x1c12ae: ; 1c12ae
	db $0, "Congratulations!", $51
	db "We have a match", $4f
	db "with the ID number", $51
	db "of @"
	text_from_ram $d073
	db $0, " in", $4f
	db "your PC BOX.", $58
; 1c12fc

UnknownText_0x1c12fc: ; 1c12fc
	db $0, "Give a nickname to", $4f
	db "the @"
	text_from_ram $d073
	db $0, " you", $55
	db "received?", $57
; 1c1328

UnknownText_0x1c1328: ; 1c1328
	db $0, "Bzzzzt! You must", $4f
	db "have a #MON to", $55
	db "use this!", $58
; 1c1353

UnknownText_0x1c1353: ; 1c1353
	db $0, $52, " turned on", $4f
	db "the PC.", $58
; 1c1368

UnknownText_0x1c1368: ; 1c1368
	db $0, "What do you want", $4f
	db "to do?", $57
; 1c1381

UnknownText_0x1c1381: ; 1c1381
	db $0, "How many do you", $4f
	db "want to withdraw?", $57
; 1c13a4

UnknownText_0x1c13a4: ; 1c13a4
	db $0, "Withdrew @"
	deciram $d10c, $12
	db $0, $4f
	db "@"
	text_from_ram $d086
	db $0, "(S).", $58
; 1c13bf

UnknownText_0x1c13bf: ; 1c13bf
	db $0, "There's no room", $4f
	db "for more items.", $58
; 1c13df

UnknownText_0x1c13df: ; 1c13df
	db $0, "No items here!", $58
; 1c13ef

UnknownText_0x1c13ef: ; 1c13ef
	db $0, "How many do you", $4f
	db "want to deposit?", $57
; 1c1411

UnknownText_0x1c1411: ; 1c1411
	db $0, "Deposited @"
	deciram $d10c, $12
	db $0, $4f
	db "@"
	text_from_ram $d086
	db $0, "(S).", $58
; 1c142d

UnknownText_0x1c142d: ; 1c142d
	db $0, "There's no room to", $4f
	db "store items.", $58
; 1c144d

UnknownText_0x1c144d: ; 1c144d
	db $0, $52, " turned on", $4f
	db "the PC.", $58
; 1c1462

UnknownText_0x1c1462: ; 1c1462
	db $0, "Access whose PC?", $57
; 1c1474

UnknownText_0x1c1474: ; 1c1474
	db $0, "BILL's PC", $4f
	db "accessed.", $51
	db "#MON Storage", $4f
	db "System opened.", $58
; 1c14a4

UnknownText_0x1c14a4: ; 1c14a4
	db $0, "Accessed own PC.", $51
	db "Item Storage", $4f
	db "System opened.", $58
; 1c14d2

UnknownText_0x1c14d2: ; 1c14d2
	db $0, "PROF.OAK's PC", $4f
	db "accessed.", $51
	db "#DEX Rating", $4f
	db "System opened.", $58
; 1c1505

UnknownText_0x1c1505: ; 1c1505
	db $0, "…", $4f
	db "Link closed…", $57
; 1c1515

UnknownText_0x1c1515: ; 1c1515
	db $0, "Want to get your", $4f
	db "#DEX rated?", $57
; 1c1533

UnknownText_0x1c1533: ; 1c1533
	db $0, "Current #DEX", $4f
	db "completion level:", $58
; 1c1553

UnknownText_0x1c1553: ; 1c1553
	text_from_ram $d099
	db $0, " #MON seen", $4f
	db "@"
	text_from_ram $d0ac
	db $0, " #MON owned", $51
	db "PROF.OAK's", $4f
	db "Rating:", $57
; 1c1585

UnknownText_0x1c1585: ; 1c1585
	db $0, "Look for #MON", $4f
	db "in grassy areas!", $57
; 1c15a5

UnknownText_0x1c15a5: ; 1c15a5
	db $0, "Good. I see you", $4f
	db "understand how to", $55
	db "use # BALLS.", $57
; 1c15d5

UnknownText_0x1c15d5: ; 1c15d5
	db $0, "You're getting", $4f
	db "good at this.", $51
	db "But you have a", $4f
	db "long way to go.", $57
; 1c1611

UnknownText_0x1c1611: ; 1c1611
	db $0, "You need to fill", $4f
	db "up the #DEX.", $51
	db "Catch different", $4f
	db "kinds of #MON!", $57
; 1c164f

UnknownText_0x1c164f: ; 1c164f
	db $0, "You're trying--I", $4f
	db "can see that.", $51
	db "Your #DEX is", $4f
	db "coming together.", $57
; 1c168c

UnknownText_0x1c168c: ; 1c168c
	db $0, "To evolve, some", $4f
	db "#MON grow,", $51
	db "others use the", $4f
	db "effects of STONES.", $57
; 1c16ca

UnknownText_0x1c16ca: ; 1c16ca
	db $0, "Have you gotten a", $4f
	db "fishing ROD? You", $51
	db "can catch #MON", $4f
	db "by fishing.", $57
; 1c1709

UnknownText_0x1c1709: ; 1c1709
	db $0, "Excellent! You", $4f
	db "seem to like col-", $55
	db "lecting things!", $57
; 1c173b

UnknownText_0x1c173b: ; 1c173b
	db $0, "Some #MON only", $4f
	db "appear during", $51
	db "certain times of", $4f
	db "the day.", $57
; 1c1773

UnknownText_0x1c1773: ; 1c1773
	db $0, "Your #DEX is", $4f
	db "filling up. Keep", $55
	db "up the good work!", $57
; 1c17a4

UnknownText_0x1c17a4: ; 1c17a4
	db $0, "I'm impressed.", $4f
	db "You're evolving", $51
	db "#MON, not just", $4f
	db "catching them.", $57
; 1c17e0

UnknownText_0x1c17e0: ; 1c17e0
	db $0, "Have you met KURT?", $4f
	db "His custom BALLS", $55
	db "should help.", $57
; 1c1812

UnknownText_0x1c1812: ; 1c1812
	db $0, "Wow. You've found", $4f
	db "more #MON than", $51
	db "the last #DEX", $4f
	db "research project.", $57
; 1c1853

UnknownText_0x1c1853: ; 1c1853
	db $0, "Are you trading", $4f
	db "your #MON?", $51
	db "It's tough to do", $4f
	db "this alone!", $57
; 1c188b

UnknownText_0x1c188b: ; 1c188b
	db $0, "Wow! You've hit", $4f
	db "200! Your #DEX", $55
	db "is looking great!", $57
; 1c18bc

UnknownText_0x1c18bc: ; 1c18bc
	db $0, "You've found so", $4f
	db "many #MON!", $51
	db "You've really", $4f
	db "helped my studies!", $57
; 1c18f7

UnknownText_0x1c18f7: ; 1c18f7
	db $0, "Magnificent! You", $4f
	db "could become a", $51
	db "#MON professor", $4f
	db "right now!", $57
; 1c1932

UnknownText_0x1c1932: ; 1c1932
	db $0, "Your #DEX is", $4f
	db "amazing! You're", $51
	db "ready to turn", $4f
	db "professional!", $57
; 1c196b

UnknownText_0x1c196b: ; 1c196b
	db $0, "Whoa! A perfect", $4f
	db "#DEX! I've", $51
	db "dreamt about this!", $4f
	db "Congratulations!", $57
; 1c19aa

UnknownText_0x1c19aa: ; 1c19aa
	db $0, "The link to PROF.", $4f
	db "OAK's PC closed.", $57
; 1c19cd

UnknownText_0x1c19cd: ; 1c19cd
	db $0, "Triple-theme", $4f
	db "trainer ranking!", $51
	db "The SAVE file you", $4f
	db "just sent might", $55
	db "make the rankings!", $51
	db $57
; 1c1a22

UnknownText_0x1c1a22: ; 1c1a22
	db $0, "There is no", $4f
	db "ranking data.", $51
	db "Link to obtain", $4f
	db "ranking data.", $51
	db $57
; 1c1a5b

UnknownText_0x1c1a5b: ; 1c1a5b
	db $0, " , yeah!", $57
; 1c1a65

UnknownText_0x1c1a65: ; 1c1a65
	db $0, "Darn…", $57
; 1c1a6c

UnknownText_0x1c1a6c: ; 1c1a6c
	db $0, "Would you like to", $4f
	db "end the Contest?", $57
; 1c1a90

UnknownText_0x1c1a90: ; 1c1a90
	db $0, "Toss out how many", $4f
	db "@"
	text_from_ram $d086
	db $0, "(S)?", $57
; 1c1aad

UnknownText_0x1c1aad: ; 1c1aad
	db $0, "Throw away @"
	deciram $d10c, $12
	db $0, $4f
	db "@"
	text_from_ram $d086
	db $0, "(S)?", $57
; 1c1aca

UnknownText_0x1c1aca: ; 1c1aca
	db $0, "Discarded", $4f
	db "@"
	text_from_ram $d073
	db $0, "(S).", $58
; 1c1adf

UnknownText_0x1c1adf: ; 1c1adf
	db $0, "That's too impor-", $4f
	db "tant to toss out!", $58
; 1c1b03

UnknownText_0x1c1b03: ; 1c1b03
	db $0, "OAK: ", $52, "!", $4f
	db "This isn't the", $55
	db "time to use that!", $57
; 1c1b2c

UnknownText_0x1c1b2c: ; 1c1b2c
	db $0, "Took @"
	text_from_ram $d050
	db $0, "'s", $4f
	db "@"
	text_from_ram $d073
	db $0, " and", $51
	db "made it hold", $4f
	db "@"
	text_from_ram $d086
	db $0, ".", $58
; 1c1b57

UnknownText_0x1c1b57: ; 1c1b57
	db $0, "Made @"
	text_from_ram $d050
	db $0, $4f
	db "hold @"
	text_from_ram $d086
	db $0, ".", $58
; 1c1b6f

UnknownText_0x1c1b6f: ; 1c1b6f
	db $0, "Please remove the", $4f
	db "MAIL first.", $58
; 1c1b8e

UnknownText_0x1c1b8e: ; 1c1b8e
	text_from_ram $d050
	db $0, " isn't", $4f
	db "holding anything.", $58
; 1c1baa

UnknownText_0x1c1baa: ; 1c1baa
	db $0, "Item storage space", $4f
	db "full.", $58
; 1c1bc4

UnknownText_0x1c1bc4: ; 1c1bc4
	db $0, "Took @"
	text_from_ram $d073
	db $0, $4f
	db "from @"
	text_from_ram $d050
	db $0, ".", $58
; 1c1bdc

UnknownText_0x1c1bdc: ; 1c1bdc
	text_from_ram $d050
	db $0, " is", $4f
	db "already holding", $51
	db "@"
	text_from_ram $d073
	db $0, ".", $4f
	db "Switch items?", $57
; 1c1c09

UnknownText_0x1c1c09: ; 1c1c09
	db $0, "This item can't be", $4f
	db "held.", $58
; 1c1c22

UnknownText_0x1c1c22: ; 1c1c22
	db $0, "The MAIL will lose", $4f
	db "its message. OK?", $57
; 1c1c47

UnknownText_0x1c1c47: ; 1c1c47
	db $0, "MAIL detached from", $4f
	db "@"
	text_from_ram $d073
	db $0, ".", $58
; 1c1c62

UnknownText_0x1c1c62: ; 1c1c62
	db $0, "There's no space", $4f
	db "for removing MAIL.", $58
; 1c1c86

UnknownText_0x1c1c86: ; 1c1c86
	db $0, "Send the removed", $4f
	db "MAIL to your PC?", $57
; 1c1ca9

UnknownText_0x1c1ca9: ; 1c1ca9
	db $0, "Your PC's MAILBOX", $4f
	db "is full.", $58
; 1c1cc4

UnknownText_0x1c1cc4: ; 1c1cc4
	db $0, "The MAIL was sent", $4f
	db "to your PC.", $58
; 1c1ce3

UnknownText_0x1c1ce3: ; 1c1ce3
	db $0, "Not enough HP!", $58
; 1c1cf3

UnknownText_0x1c1cf3: ; 1c1cf3
	db $0, "An item in your", $4f
	db "PACK may be", $51
	db "registered for use", $4f
	db "on SELECT Button.", $57
; 1c1d35

_OakText1: ; 1c1d35
	db $0, "Hello! Sorry to", $4f
	db "keep you waiting!", $51
	db "Welcome to the", $4f
	db "world of #MON!", $51
	db "My name is OAK.", $51
	db "People call me the", $4f
	db "#MON PROF.", $58
; 1c1da4

_OakText2: ; 1c1da4
	db $0, "This world is in-", $4f
	db "habited by crea-", $55
	db "tures that we call", $55
	db "#MON.@"
	db "@"
; 1c1de2

_OakText3: ; 1c1de2
	text_waitbutton
	db "@"
; 1c1de4

UnknownText_0x1c1de4: ; 1c1de4
	db "@"
; 1c1de5

_OakText4: ; 1c1de5
	db $0, "People and #MON", $4f
	db "live together by", $51
	db "supporting each", $4f
	db "other.", $51
	db "Some people play", $4f
	db "with #MON, some", $55
	db "battle with them.", $58
; 1c1e51

_OakText5: ; 1c1e51
	db $0, "But we don't know", $4f
	db "everything about", $55
	db "#MON yet.", $51
	db "There are still", $4f
	db "many mysteries to", $55
	db "solve.", $51
	db "That's why I study", $4f
	db "#MON every day.", $58
; 1c1ec9
