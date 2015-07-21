UnknownText_0x1c0000: ; 1c0000
	text "Oh, no picture?"
	line "Come again, OK?"
	done
; 1c0021

UnknownText_0x1c0021: ; 1c0021
	text "An EGG? My talent"
	line "is worth more…"
	done
; 1c0043

UnknownText_0x1c0043: ; 1c0043
	text "Hello, hello! I'm"
	line "the NAME RATER."

	para "I rate the names"
	line "of #MON."

	para "Would you like me"
	line "to rate names?"
	done
; 1c00a0

UnknownText_0x1c00a0: ; 1c00a0
	text "Which #MON's"
	line "nickname should I"
	cont "rate for you?"
	prompt
; 1c00cd

UnknownText_0x1c00cd: ; 1c00cd
	text "Hm… @"
	text_from_ram StringBuffer1
	text "…"
	line "That's a fairly"
	cont "decent name."

	para "But, how about a"
	line "slightly better"
	cont "nickname?"

	para "Want me to give it"
	line "a better name?"
	done
; 1c0142

UnknownText_0x1c0142: ; 1c0142
	text "All right. What"
	line "name should we"
	cont "give it, then?"
	prompt
; 1c0171

UnknownText_0x1c0171: ; 1c0171
	text "That's a better"
	line "name than before!"

	para "Well done!"
	done
; 1c019e

UnknownText_0x1c019e: ; 1c019e
	text "OK, then. Come"
	line "again sometime."
	done
; 1c01be

UnknownText_0x1c01be: ; 1c01be
	text "Hm… @"
	text_from_ram StringBuffer1
	text "?"
	line "What a great name!"
	cont "It's perfect."

	para "Treat @"
	text_from_ram StringBuffer1
	text ""
	line "with loving care."
	done
; 1c0208

UnknownText_0x1c0208: ; 1c0208
	text "Whoa… That's just"
	line "an EGG."
	done
; 1c0222

UnknownText_0x1c0222: ; 1c0222
	text "It might look the"
	line "same as before,"

	para "but this new name"
	line "is much better!"

	para "Well done!"
	done
; 1c0272

UnknownText_0x1c0272: ; 1c0272
	text "All right. This"
	line "#MON is now"
	cont "named @"
	text_from_ram StringBuffer1
	text "."
	prompt
; 1c029c

UnknownText_0x1c029c: ; 1c029c
	text_from_ram StringBuffer1
	text " gained@"
	db "@"
; 1c02a9

UnknownText_0x1c02a9: ; 1c02a9
	text ""
	line "a boosted"
	cont "@"
	deciram StringBuffer2, $24
	text " EXP. Points!"
	prompt
; 1c02c9

UnknownText_0x1c02c9: ; 1c02c9
	text ""
	line "@"
	deciram StringBuffer2, $24
	text " EXP. Points!"
	prompt
; 1c02df

UnknownText_0x1c02df: ; 1c02df
	text "Go! @"
	db "@"
; 1c02e6

UnknownText_0x1c02e6: ; 1c02e6
	text "Do it! @"
	db "@"
; 1c02f0

UnknownText_0x1c02f0: ; 1c02f0
	text "Go for it,"
	line "@"
	db "@"
; 1c02fe

UnknownText_0x1c02fe: ; 1c02fe
	text "Your foe's weak!"
	line "Get'm, @"
	db "@"
; 1c0317

UnknownText_0x1c0317: ; 1c0317
	text_from_ram BattleMonNick
	text "!"
	done
; 1c031d

UnknownText_0x1c031d: ; 1c031d
	text_from_ram BattleMonNick
	text ",@"
	db "@"
; 1c0324

UnknownText_0x1c0324: ; 1c0324
	text " that's"
	line "enough! Come back!@"
	db "@"
; 1c0340

UnknownText_0x1c0340: ; 1c0340
	text " OK!"
	line "Come back!@"
	db "@"
; 1c0352

UnknownText_0x1c0352: ; 1c0352
	text " good!"
	line "Come back!@"
	db "@"
; 1c0366

UnknownText_0x1c0366: ; 1c0366
	text " come"
	line "back!"
	done
; 1c0373

UnknownText_0x1c0373: ; 1c0373
	text "Booted up a TM."
	prompt
; 1c0384

UnknownText_0x1c0384: ; 1c0384
	text "Booted up an HM."
	prompt
; 1c0396

UnknownText_0x1c0396: ; 1c0396
	text "It contained"
	line "@"
	text_from_ram StringBuffer2
	text "."

	para "Teach @"
	text_from_ram StringBuffer2
	text ""
	line "to a #MON?"
	done
; 1c03c2

UnknownText_0x1c03c2: ; 1c03c2
	text_from_ram StringBuffer2
	text " is"
	line "not compatible"
	cont "with @"
	text_from_ram StringBuffer1
	text "."

	para "It can't learn"
	line "@"
	text_from_ram StringBuffer2
	text "."
	prompt
; 1c03fa

UnknownText_0x1c03fa: ; 1c03fa
	text "You have no room"
	line "for any more"
	cont "@"
	text_from_ram StringBuffer1
	text "S."
	prompt
; 1c0421

UnknownText_0x1c0421: ; 1c0421
	text "You received"
	line "@"
	text_from_ram StringBuffer1
	text "!"
	prompt
; 1c0436

UnknownText_0x1c0436: ; 1c0436
	text "The link has been"
	line "cancelled."
	prompt
; 1c0454

UnknownText_0x1c0454: ; 1c0454
	text "Communication"
	line "error."
	prompt
; 1c046a

UnknownText_0x1c046a: ; 1c046a
	text "Must retrieve GIFT"
	line "at #MON CENTER."
	prompt
; 1c048e

UnknownText_0x1c048e: ; 1c048e
	text "Your friend isn't"
	line "ready."
	prompt
; 1c04a7

UnknownText_0x1c04a7: ; 1c04a7
	text "Sorry--only five"
	line "GIFTS a day."
	prompt
; 1c04c6

UnknownText_0x1c04c6: ; 1c04c6
	text "Sorry. One GIFT"
	line "a day per person."
	prompt
; 1c04e9

UnknownText_0x1c04e9: ; 1c04e9
	text_from_ram wc903
	text " sent"
	line "@"
	text_from_ram StringBuffer1
	text "."
	prompt
; 1c04fa

UnknownText_0x1c04fa: ; 1c04fa
	text_from_ram wc903
	text " sent"
	line "@"
	text_from_ram StringBuffer1
	text ""
	cont "to @"
	text_from_ram wc950 + 3
	text "'s home."
	prompt
; 1c051a

UnknownText_0x1c051a: ; 1c051a
	text "Received"
	line "@"
	text_from_ram wc850
	text "'s CARD."
	prompt
; 1c0531

UnknownText_0x1c0531: ; 1c0531
	text_from_ram wc850
	text "'s CARD was"
	line "listed as no.@"
	deciram wd265, $12
	text "."
	prompt
; 1c0555

UnknownText_0x1c0555: ; 1c0555
	text "The CARD was not"
	line "registered."
	prompt
; 1c0573

UnknownText_0x1c0573: ; 1c0573
	text "The link has been"
	line "cancelled."
	prompt
; 1c0591

UnknownText_0x1c0591: ; 1c0591
	text "Communication"
	line "error."
	prompt
; 1c05a7

_BadgeRequiredText: ; 1c05a7
	text "Sorry! A new BADGE"
	line "is required."
	prompt
; 1c05c8

UnknownText_0x1c05c8: ; 1c05c8
	text "Can't use that"
	line "here."
	prompt
; 1c05dd

UnknownText_0x1c05dd: ; 1c05dd
	text_from_ram StringBuffer2
	text " used"
	line "CUT!"
	prompt
; 1c05ec

UnknownText_0x1c05ec: ; 1c05ec
	text "There's nothing to"
	line "CUT here."
	prompt
; 1c0609

UnknownText_0x1c0609: ; 1c0609
	text "A blinding FLASH"
	line "lights the area!@"
	text_waitbutton
	db "@"
; 1c062e

UnknownText_0x1c062e: ; 1c062e
	db "@"
; 1c062f

_UsedSurfText: ; 1c062f
	text_from_ram StringBuffer2
	text " used"
	line "SURF!"
	done
; 1c063f

_CantSurfText: ; 1c063f
	text "You can't SURF"
	line "here."
	prompt
; 1c0654

_AlreadySurfingText: ; 1c0654
	text "You're already"
	line "SURFING."
	prompt
; 1c066c

_AskSurfText: ; 1c066c
	text "The water is calm."
	line "Want to SURF?"
	done
; 1c068e

UnknownText_0x1c068e: ; 1c068e
	text_from_ram StringBuffer2
	text " used"
	line "WATERFALL!"
	done
; 1c06a3

UnknownText_0x1c06a3: ; 1c06a3
	text "Wow, it's a huge"
	line "waterfall."
	done
; 1c06bf

UnknownText_0x1c06bf: ; 1c06bf
	text "Do you want to use"
	line "WATERFALL?"
	done
; 1c06de

UnknownText_0x1c06de: ; 1c06de
	text_from_ram StringBuffer2
	text " used"
	line "DIG!"
	done
; 1c06ed

UnknownText_0x1c06ed: ; 1c06ed
	text "<PLAYER> used an"
	line "ESCAPE ROPE."
	done
; 1c0705

UnknownText_0x1c0705: ; 1c0705
	text "Can't use that"
	line "here."
	done
; 1c071a

UnknownText_0x1c071a: ; 1c071a
	text "Return to the last"
	line "#MON CENTER."
	done
; 1c073b

UnknownText_0x1c073b: ; 1c073b
	text "Can't use that"
	line "here."
	para ""
	done
; 1c0751

UnknownText_0x1c0751: ; 1c0751
	text "A #MON is using"
	line "STRENGTH already."
	prompt
; 1c0774

UnknownText_0x1c0774: ; 1c0774
	text_from_ram StringBuffer2
	text " used"
	line "STRENGTH!"
	done
; 1c0788

UnknownText_0x1c0788: ; 1c0788
	text_from_ram StringBuffer1
	text " can"
	line "move boulders."
	prompt
; 1c07a0

UnknownText_0x1c07a0: ; 1c07a0
	text "A #MON may be"
	line "able to move this."

	para "Want to use"
	line "STRENGTH?"
	done
; 1c07d8

UnknownText_0x1c07d8: ; 1c07d8
	text "Boulders may now"
	line "be moved!"
	done
; 1c07f4

UnknownText_0x1c07f4: ; 1c07f4
	text "A #MON may be"
	line "able to move this."
	done
; 1c0816

UnknownText_0x1c0816: ; 1c0816
	text_from_ram StringBuffer2
	text " used"
	line "WHIRLPOOL!"
	prompt
; 1c082b

UnknownText_0x1c082b: ; 1c082b
	text "It's a vicious"
	line "whirlpool!"

	para "A #MON may be"
	line "able to pass it."
	done
; 1c0864

UnknownText_0x1c0864: ; 1c0864
	text "A whirlpool is in"
	line "the way."

	para "Want to use"
	line "WHIRLPOOL?"
	done
; 1c0897

UnknownText_0x1c0897: ; 1c0897
	text_from_ram StringBuffer2
	text " did a"
	line "HEADBUTT!"
	prompt
; 1c08ac

UnknownText_0x1c08ac: ; 1c08ac
	text "Nope. Nothing…"
	done
; 1c08bc

UnknownText_0x1c08bc: ; 1c08bc
	text "A #MON could be"
	line "in this tree."

	para "Want to HEADBUTT"
	line "it?"
	done
; 1c08f0

UnknownText_0x1c08f0: ; 1c08f0
	text_from_ram StringBuffer2
	text " used"
	line "ROCK SMASH!"
	prompt
; 1c0906

UnknownText_0x1c0906: ; 1c0906
	text "Maybe a #MON"
	line "can break this."
	done
; 1c0924

UnknownText_0x1c0924: ; 1c0924
	text "This rock looks"
	line "breakable."

	para "Want to use ROCK"
	line "SMASH?"
	done
; 1c0958

UnknownText_0x1c0958: ; 1c0958
	text "Oh!"
	line "A bite!"
	prompt
; 1c0965

UnknownText_0x1c0965: ; 1c0965
	text "Not even a nibble!"
	prompt
; 1c0979

UnknownText_0x1c0979: ; 1c0979
	text "Looks like there's"
	line "nothing here."
	prompt
; 1c099a

UnknownText_0x1c099a: ; 1c099a
	text "You can't get off"
	line "here!"
	done
; 1c09b2

UnknownText_0x1c09b2: ; 1c09b2
	text "<PLAYER> got on the"
	line "@"
	text_from_ram StringBuffer2
	text "."
	done
; 1c09c7

UnknownText_0x1c09c7: ; 1c09c7
	text "<PLAYER> got off"
	line "the @"
	text_from_ram StringBuffer2
	text "."
	done
; 1c09dd

UnknownText_0x1c09dd: ; 1c09dd
	text "This tree can be"
	line "CUT!"

	para "Want to use CUT?"
	done
; 1c0a05

UnknownText_0x1c0a05: ; 1c0a05
	text "This tree can be"
	line "CUT!"
	done
; 1c0a1c

UnknownText_0x1c0a1c: ; 1c0a1c
	text "<PLAYER> found"
	line "@"
	text_from_ram StringBuffer3
	text "!"
	done
; 1c0a2c

UnknownText_0x1c0a2c: ; 1c0a2c
	text "But <PLAYER> can't"
	line "carry any more"
	cont "items."
	done
; 1c0a4e

UnknownText_0x1c0a4e: ; 1c0a4e
	text "<PLAYER> is out of"
	line "useable #MON!"

	para "<PLAYER> whited"
	line "out!"
	done
; 1c0a77

UnknownText_0x1c0a77: ; 1c0a77
	text "Yes! ITEMFINDER"
	line "indicates there's"
	cont "an item nearby."
	prompt
; 1c0aa9

UnknownText_0x1c0aa9: ; 1c0aa9
	text "Nope! ITEMFINDER"
	line "isn't responding."
	prompt
; 1c0acc

UnknownText_0x1c0acc: ; 1c0acc
	text_from_ram StringBuffer3
	text ""
	line "fainted!"
	prompt
; 1c0ada

UnknownText_0x1c0ada: ; 1c0ada
	text "<PLAYER> is out of"
	line "useable #MON!"

	para "<PLAYER> whited"
	line "out!"
	prompt
; 1c0b03

UnknownText_0x1c0b03: ; 1c0b03
	text_from_ram StringBuffer3
	text " used"
	line "SWEET SCENT!"
	done
; 1c0b1a

UnknownText_0x1c0b1a: ; 1c0b1a
	text "Looks like there's"
	line "nothing here…"
	done
; 1c0b3b

UnknownText_0x1c0b3b: ; 1c0b3b
	text "<PLAYER> sprinkled"
	line "water."

	para "But nothing"
	line "happened…"
	done
; 1c0b65

UnknownText_0x1c0b65: ; 1c0b65
	text "<PLAYER>'s #MON"
	line "were all healed!"
	done
; 1c0b7f

UnknownText_0x1c0b7f: ; 1c0b7f
	text "An EGG can't hold"
	line "an item."
	prompt
; 1c0b9a

UnknownText_0x1c0b9a: ; 1c0b9a
	text "No items."
	done
; 1c0ba5

UnknownText_0x1c0ba5: ; 1c0ba5
	text "Throw away how"
	line "many?"
	done
; 1c0bbb

UnknownText_0x1c0bbb: ; 1c0bbb
	text "Throw away @"
	deciram wd10c, $12
	text ""
	line "@"
	text_from_ram StringBuffer2
	text "(S)?"
	done
; 1c0bd8

UnknownText_0x1c0bd8: ; 1c0bd8
	text "Threw away"
	line "@"
	text_from_ram StringBuffer2
	text "(S)."
	prompt
; 1c0bee

UnknownText_0x1c0bee: ; 1c0bee
	text "OAK: <PLAYER>!"
	line "This isn't the"
	cont "time to use that!"
	prompt
; 1c0c17

UnknownText_0x1c0c17: ; 1c0c17
	text "You don't have a"
	line "#MON!"
	prompt
; 1c0c2e

UnknownText_0x1c0c2e: ; 1c0c2e
	text "Registered the"
	line "@"
	text_from_ram StringBuffer2
	text "."
	prompt
; 1c0c45

UnknownText_0x1c0c45: ; 1c0c45
	text "You can't register"
	line "that item."
	prompt
; 1c0c63

UnknownText_0x1c0c63: ; 1c0c63
	text "Where should this"
	line "be moved to?"
	done
; 1c0c83

UnknownText_0x1c0c83: ; 1c0c83
	text ""
	done
; 1c0c85

UnknownText_0x1c0c85: ; 1c0c85
	text "You can't use it"
	line "in a battle."
	prompt
; 1c0ca3

UnknownText_0x1c0ca3: ; 1c0ca3
	text "Are you a boy?"
	line "Or are you a girl?"
	done
; 1c0cc6

UnknownText_0x1c0cc6: ; 1c0cc6
	text "<USER>'s"
	line "@"
	text_from_ram StringBuffer2
	db "@"
; 1c0ccf

UnknownText_0x1c0ccf: ; 1c0ccf
	db "@"
; 1c0cd0

UnknownText_0x1c0cd0: ; 1c0cd0
	interpret_data
	text $4c, "went way up!"
	prompt
; 1c0ce0

UnknownText_0x1c0ce0: ; 1c0ce0
	text " went up!"
	prompt
; 1c0ceb

UnknownText_0x1c0ceb: ; 1c0ceb
	text "<TARGET>'s"
	line "@"
	text_from_ram StringBuffer2
	db "@"
; 1c0cf4

UnknownText_0x1c0cf4: ; 1c0cf4
	db "@"
; 1c0cf5

UnknownText_0x1c0cf5: ; 1c0cf5
	interpret_data
	text $4c, "sharply fell!"
	prompt
; 1c0d06

UnknownText_0x1c0d06: ; 1c0d06
	text " fell!"
	prompt
; 1c0d0e

UnknownText_0x1c0d0e: ; 1c0d0e
	text "<USER>@"
	db "@"
; 1c0d12

UnknownText_0x1c0d12: ; 1c0d12
	text ""
	line "made a whirlwind!"
	prompt
; 1c0d26

UnknownText_0x1c0d26: ; 1c0d26
	text ""
	line "took in sunlight!"
	prompt
; 1c0d3a

UnknownText_0x1c0d3a: ; 1c0d3a
	text ""
	line "lowered its head!"
	prompt
; 1c0d4e

UnknownText_0x1c0d4e: ; 1c0d4e
	text ""
	line "is glowing!"
	prompt
; 1c0d5c

UnknownText_0x1c0d5c: ; 1c0d5c
	text ""
	line "flew up high!"
	prompt
; 1c0d6c

UnknownText_0x1c0d6c: ; 1c0d6c
	text ""
	line "dug a hole!"
	prompt
; 1c0d7a

_ActorNameText: ; 1c0d7a
	text "<USER>@"
	db "@"
; 1c0d7e

_UsedMove1Text: ; 1c0d7e
	text ""
	line "used @"
	db "@"
; 1c0d87

_UsedMove2Text: ; 1c0d87
	text ""
	line "used @"
	db "@"
; 1c0d90

_UsedInsteadText: ; 1c0d90
	text "instead,"
	cont "@"
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
	text "!"
	done
; 1c0da4

_EndUsedMove2Text: ; 1c0da4
	text "!"
	done
; 1c0da7

_EndUsedMove3Text: ; 1c0da7
	text "!"
	done
; 1c0daa

_EndUsedMove4Text: ; 1c0daa
	text "!"
	done
; 1c0dad

_EndUsedMove5Text: ; 1c0dad
	text "!"
	done
; 1c0db0

UnknownText_0x1c0db0: ; 1c0db0
	text "Huh?"
	para "@"
	db "@"
; 1c0db8

UnknownText_0x1c0db8: ; 1c0db8
	text ""
	done
; 1c0dba

UnknownText_0x1c0dba: ; 1c0dba
	text_from_ram StringBuffer1
	text " came"
	line "out of its EGG!@"
	sound0x02
	text_waitbutton
	db "@"
; 1c0dd7

UnknownText_0x1c0dd7: ; 1c0dd7
	db "@"
; 1c0dd8

UnknownText_0x1c0dd8: ; 1c0dd8
	text "Give a nickname to"
	line "@"
	text_from_ram StringBuffer1
	text "?"
	done
; 1c0df3

UnknownText_0x1c0df3: ; 1c0df3
	text "It's @"
	text_from_ram wBreedMon2Nick
	text ""
	line "that was left with"
	cont "the DAY-CARE LADY."
	done
; 1c0e24

UnknownText_0x1c0e24: ; 1c0e24
	text "It's @"
	text_from_ram wBreedMon1
	text ""
	line "that was left with"
	cont "the DAY-CARE MAN."
	done
; 1c0e54

UnknownText_0x1c0e54: ; 1c0e54
	text "It's brimming with"
	line "energy."
	prompt
; 1c0e6f

UnknownText_0x1c0e6f: ; 1c0e6f
	text "It has no interest"
	line "in @"
	text_from_ram StringBuffer1
	text "."
	prompt
; 1c0e8d

UnknownText_0x1c0e8d: ; 1c0e8d
	text "It appears to care"
	line "for @"
	text_from_ram StringBuffer1
	text "."
	prompt
; 1c0eac

UnknownText_0x1c0eac: ; 1c0eac
	text "It's friendly with"
	line "@"
	text_from_ram StringBuffer1
	text "."
	prompt
; 1c0ec6

UnknownText_0x1c0ec6: ; 1c0ec6
	text "It shows interest"
	line "in @"
	text_from_ram StringBuffer1
	text "."
	prompt
; 1c0ee3

_EmptyMailboxText: ; 1c0ee3
	text "There's no MAIL"
	line "here."
	prompt
; 1c0ef9

ClearedMailPutAwayText: ; 1c0ef9
	text "The cleared MAIL"
	line "was put away."
	prompt
; 1c0f19

MailPackFullText: ; 1c0f19
	text "The PACK is full."
	prompt
; 1c0f2c

MailMessageLostText: ; 1c0f2c
	text "The MAIL's message"
	line "will be lost. OK?"
	done
; 1c0f51

MailAlreadyHoldingItemText: ; 1c0f51
	text "It's already hold-"
	line "ing an item."
	prompt
; 1c0f71

MailEggText: ; 1c0f71
	text "An EGG can't hold"
	line "any MAIL."
	prompt
; 1c0f8d

MailMovedFromBoxText: ; 1c0f8d
	text "The MAIL was moved"
	line "from the MAILBOX."
	prompt
; 1c0fb3

UnknownText_0x1c0fb3: ; 1c0fb3
	text "Yes"
	prompt
; 1c0fb8

UnknownText_0x1c0fb8: ; 1c0fb8
	text "No"
	prompt
; 1c0fbc

UnknownText_0x1c0fbc: ; 1c0fbc
	deciram wcf64, $13
	text " @"
	text_from_ram StringBuffer1
	text ""
	line "Animation type @"
	text_from_ram StringBuffer2
	db "@"
; 1c0fdc

UnknownText_0x1c0fdc: ; 1c0fdc
	db "@"
; 1c0fdd

UnknownText_0x1c0fdd: ; 1c0fdd
	text "#MON number?"
	done
; 1c0feb

UnknownText_0x1c0feb: ; 1c0feb
	text_from_ram StringBuffer1
	text " was"
	line "sent to BILL's PC."
	prompt
; 1c1006

UnknownText_0x1c1006: ; 1c1006
	text "You gotta have"
	line "#MON to call!"
	prompt
; 1c1024

UnknownText_0x1c1024: ; 1c1024
	text "What?"
	done
; 1c102b

UnknownText_0x1c102b: ; 1c102b
	text "There is a #MON"
	line "holding MAIL."

	para "Please remove the"
	line "MAIL."
	prompt
; 1c1062

UnknownText_0x1c1062: ; 1c1062
	text "You don't have a"
	line "single #MON!"
	prompt
; 1c1080

UnknownText_0x1c1080: ; 1c1080
	text "You can't deposit"
	line "your last #MON!"
	prompt
; 1c10a2

UnknownText_0x1c10a2: ; 1c10a2
	text "You can't take any"
	line "more #MON."
	prompt
; 1c10c0

UnknownText_0x1c10c0: ; 1c10c0
	text "Caught @"
	text_from_ram StringBuffer1
	text "!"
	prompt
; 1c10cf

UnknownText_0x1c10cf: ; 1c10cf
	text "Switch #MON?"
	done
; 1c10dd

UnknownText_0x1c10dd: ; 1c10dd
	text "You already caught"
	line "a @"
	text_from_ram StringBuffer1
	text "."
	prompt
; 1c10fa

ContestJudging_FirstPlaceText: ; 1c10fa
	text "This Bug-Catching"
	line "Contest winner is@"
	interpret_data
	text "…"
	para "@"
	text_from_ram wd016
	text ","
	line "who caught a"
	cont "@"
	text_from_ram StringBuffer1
	text "!@"
	db "@"
; 1c113f

ContestJudging_FirstPlaceScoreText: ; 1c113f
	text ""
	para "The winning score"
	line "was @"
	deciram wd004, $23
	text " points!"
	prompt
; 1c1166

ContestJudging_SecondPlaceText: ; 1c1166
	text "Placing second was"
	line "@"
	text_from_ram wd016
	text ","
	para "who caught a"
	line "@"
	text_from_ram StringBuffer1
	text "!@"
	db "@"
; 1c1196

ContestJudging_SecondPlaceScoreText: ; 1c1196
	text ""
	para "The score was"
	line "@"
	deciram wd008, $23
	text " points!"
	prompt
; 1c11b5

ContestJudging_ThirdPlaceText: ; 1c11b5
	text "Placing third was"
	line "@"
	text_from_ram wd016
	text ","
	para "who caught a"
	line "@"
	text_from_ram StringBuffer1
	text "!@"
	db "@"
; 1c11e4

ContestJudging_ThirdPlaceScoreText: ; 1c11e4
	text ""
	para "The score was"
	line "@"
	deciram wd00c, $23
	text " points!"
	prompt
; 1c1203

UnknownText_0x1c1203: ; 1c1203
	text "Let me measure"
	line "that MAGIKARP."

	para "…Hm, it measures"
	line "@"
	text_from_ram StringBuffer1
	text "."
	prompt
; 1c123a

UnknownText_0x1c123a: ; 1c123a
	text "CURRENT RECORD"
	para "@"
	text_from_ram StringBuffer1
	text " caught by"
	line "@"
	text_from_ram wdfe9 + 1
	text_waitbutton
	db "@"
; 1c1260

UnknownText_0x1c1260: ; 1c1260
	db "@"
; 1c1261

UnknownText_0x1c1261: ; 1c1261
	text "Congratulations!"

	para "We have a match"
	line "with the ID number"

	para "of @"
	text_from_ram StringBuffer1
	text " in"
	line "your party."
	prompt
; 1c12ae

UnknownText_0x1c12ae: ; 1c12ae
	text "Congratulations!"

	para "We have a match"
	line "with the ID number"

	para "of @"
	text_from_ram StringBuffer1
	text " in"
	line "your PC BOX."
	prompt
; 1c12fc

UnknownText_0x1c12fc: ; 1c12fc
	text "Give a nickname to"
	line "the @"
	text_from_ram StringBuffer1
	text " you"
	cont "received?"
	done
; 1c1328

UnknownText_0x1c1328: ; 1c1328
	text "Bzzzzt! You must"
	line "have a #MON to"
	cont "use this!"
	prompt
; 1c1353

UnknownText_0x1c1353: ; 1c1353
	text "<PLAYER> turned on"
	line "the PC."
	prompt
; 1c1368

UnknownText_0x1c1368: ; 1c1368
	text "What do you want"
	line "to do?"
	done
; 1c1381

_KrissPCHowManyWithdrawText: ; 1c1381
	text "How many do you"
	line "want to withdraw?"
	done
; 1c13a4

_KrissPCWithdrewItemsText: ; 1c13a4
	text "Withdrew @"
	deciram wd10c, $12
	text ""
	line "@"
	text_from_ram StringBuffer2
	text "(S)."
	prompt
; 1c13bf

_KrissPCNoRoomWithdrawText: ; 1c13bf
	text "There's no room"
	line "for more items."
	prompt
; 1c13df

UnknownText_0x1c13df: ; 1c13df
	text "No items here!"
	prompt
; 1c13ef

_KrissPCHowManyDepositText: ; 1c13ef
	text "How many do you"
	line "want to deposit?"
	done
; 1c1411

_KrissPCDepositItemsText: ; 1c1411
	text "Deposited @"
	deciram wd10c, $12
	text ""
	line "@"
	text_from_ram StringBuffer2
	text "(S)."
	prompt
; 1c142d

_KrissPCNoRoomDepositText: ; 1c142d
	text "There's no room to"
	line "store items."
	prompt
; 1c144d

UnknownText_0x1c144d: ; 1c144d
	text "<PLAYER> turned on"
	line "the PC."
	prompt
; 1c1462

UnknownText_0x1c1462: ; 1c1462
	text "Access whose PC?"
	done
; 1c1474

UnknownText_0x1c1474: ; 1c1474
	text "BILL's PC"
	line "accessed."

	para "#MON Storage"
	line "System opened."
	prompt
; 1c14a4

UnknownText_0x1c14a4: ; 1c14a4
	text "Accessed own PC."

	para "Item Storage"
	line "System opened."
	prompt
; 1c14d2

UnknownText_0x1c14d2: ; 1c14d2
	text "PROF.OAK's PC"
	line "accessed."

	para "#DEX Rating"
	line "System opened."
	prompt
; 1c1505

UnknownText_0x1c1505: ; 1c1505
	text "…"
	line "Link closed…"
	done
; 1c1515

_OakPCText1: ; 1c1515
	text "Want to get your"
	line "#DEX rated?"
	done
; 1c1533

_OakPCText2: ; 1c1533
	text "Current #DEX"
	line "completion level:"
	prompt
; 1c1553

_OakPCText3: ; 1c1553
	text_from_ram StringBuffer3
	text " #MON seen"
	line "@"
	text_from_ram StringBuffer4
	text " #MON owned"

	para "PROF.OAK's"
	line "Rating:"
	done
; 1c1585

_OakRating01: ; 1c1585
	text "Look for #MON"
	line "in grassy areas!"
	done
; 1c15a5

_OakRating02: ; 1c15a5
	text "Good. I see you"
	line "understand how to"
	cont "use # BALLS."
	done
; 1c15d5

_OakRating03: ; 1c15d5
	text "You're getting"
	line "good at this."

	para "But you have a"
	line "long way to go."
	done
; 1c1611

_OakRating04: ; 1c1611
	text "You need to fill"
	line "up the #DEX."

	para "Catch different"
	line "kinds of #MON!"
	done
; 1c164f

_OakRating05: ; 1c164f
	text "You're trying--I"
	line "can see that."

	para "Your #DEX is"
	line "coming together."
	done
; 1c168c

_OakRating06: ; 1c168c
	text "To evolve, some"
	line "#MON grow,"

	para "others use the"
	line "effects of STONES."
	done
; 1c16ca

_OakRating07: ; 1c16ca
	text "Have you gotten a"
	line "fishing ROD? You"

	para "can catch #MON"
	line "by fishing."
	done
; 1c1709

_OakRating08: ; 1c1709
	text "Excellent! You"
	line "seem to like col-"
	cont "lecting things!"
	done
; 1c173b

_OakRating09: ; 1c173b
	text "Some #MON only"
	line "appear during"

	para "certain times of"
	line "the day."
	done
; 1c1773

_OakRating10: ; 1c1773
	text "Your #DEX is"
	line "filling up. Keep"
	cont "up the good work!"
	done
; 1c17a4

_OakRating11: ; 1c17a4
	text "I'm impressed."
	line "You're evolving"

	para "#MON, not just"
	line "catching them."
	done
; 1c17e0

_OakRating12: ; 1c17e0
	text "Have you met KURT?"
	line "His custom BALLS"
	cont "should help."
	done
; 1c1812

_OakRating13: ; 1c1812
	text "Wow. You've found"
	line "more #MON than"

	para "the last #DEX"
	line "research project."
	done
; 1c1853

_OakRating14: ; 1c1853
	text "Are you trading"
	line "your #MON?"

	para "It's tough to do"
	line "this alone!"
	done
; 1c188b

_OakRating15: ; 1c188b
	text "Wow! You've hit"
	line "200! Your #DEX"
	cont "is looking great!"
	done
; 1c18bc

_OakRating16: ; 1c18bc
	text "You've found so"
	line "many #MON!"

	para "You've really"
	line "helped my studies!"
	done
; 1c18f7

_OakRating17: ; 1c18f7
	text "Magnificent! You"
	line "could become a"

	para "#MON professor"
	line "right now!"
	done
; 1c1932

_OakRating18: ; 1c1932
	text "Your #DEX is"
	line "amazing! You're"

	para "ready to turn"
	line "professional!"
	done
; 1c196b

_OakRating19: ; 1c196b
	text "Whoa! A perfect"
	line "#DEX! I've"

	para "dreamt about this!"
	line "Congratulations!"
	done
; 1c19aa

_OakPCText4: ; 1c19aa
	text "The link to PROF."
	line "OAK's PC closed."
	done
; 1c19cd

UnknownText_0x1c19cd: ; 1c19cd
	text "Triple-theme"
	line "trainer ranking!"
	para "The SAVE file you"
	line "just sent might"
	cont "make the rankings!"
	para ""
	done
; 1c1a22

UnknownText_0x1c1a22: ; 1c1a22
	text "There is no"
	line "ranking data."
	para "Link to obtain"
	line "ranking data."
	para ""
	done
; 1c1a5b

UnknownText_0x1c1a5b: ; 1c1a5b
	text " , yeah!"
	done
; 1c1a65

UnknownText_0x1c1a65: ; 1c1a65
	text "Darn…"
	done
; 1c1a6c

UnknownText_0x1c1a6c: ; 1c1a6c
	text "Would you like to"
	line "end the Contest?"
	done
; 1c1a90

UnknownText_0x1c1a90: ; 1c1a90
	text "Toss out how many"
	line "@"
	text_from_ram StringBuffer2
	text "(S)?"
	done
; 1c1aad

UnknownText_0x1c1aad: ; 1c1aad
	text "Throw away @"
	deciram wd10c, $12
	text ""
	line "@"
	text_from_ram StringBuffer2
	text "(S)?"
	done
; 1c1aca

UnknownText_0x1c1aca: ; 1c1aca
	text "Discarded"
	line "@"
	text_from_ram StringBuffer1
	text "(S)."
	prompt
; 1c1adf

UnknownText_0x1c1adf: ; 1c1adf
	text "That's too impor-"
	line "tant to toss out!"
	prompt
; 1c1b03

UnknownText_0x1c1b03: ; 1c1b03
	text "OAK: <PLAYER>!"
	line "This isn't the"
	cont "time to use that!"
	done
; 1c1b2c

UnknownText_0x1c1b2c: ; 1c1b2c
	text "Took @"
	text_from_ram wd050
	text "'s"
	line "@"
	text_from_ram StringBuffer1
	text " and"

	para "made it hold"
	line "@"
	text_from_ram StringBuffer2
	text "."
	prompt
; 1c1b57

UnknownText_0x1c1b57: ; 1c1b57
	text "Made @"
	text_from_ram wd050
	text ""
	line "hold @"
	text_from_ram StringBuffer2
	text "."
	prompt
; 1c1b6f

UnknownText_0x1c1b6f: ; 1c1b6f
	text "Please remove the"
	line "MAIL first."
	prompt
; 1c1b8e

UnknownText_0x1c1b8e: ; 1c1b8e
	text_from_ram wd050
	text " isn't"
	line "holding anything."
	prompt
; 1c1baa

UnknownText_0x1c1baa: ; 1c1baa
	text "Item storage space"
	line "full."
	prompt
; 1c1bc4

UnknownText_0x1c1bc4: ; 1c1bc4
	text "Took @"
	text_from_ram StringBuffer1
	text ""
	line "from @"
	text_from_ram wd050
	text "."
	prompt
; 1c1bdc

UnknownText_0x1c1bdc: ; 1c1bdc
	text_from_ram wd050
	text " is"
	line "already holding"

	para "@"
	text_from_ram StringBuffer1
	text "."
	line "Switch items?"
	done
; 1c1c09

UnknownText_0x1c1c09: ; 1c1c09
	text "This item can't be"
	line "held."
	prompt
; 1c1c22

UnknownText_0x1c1c22: ; 1c1c22
	text "The MAIL will lose"
	line "its message. OK?"
	done
; 1c1c47

UnknownText_0x1c1c47: ; 1c1c47
	text "MAIL detached from"
	line "@"
	text_from_ram StringBuffer1
	text "."
	prompt
; 1c1c62

UnknownText_0x1c1c62: ; 1c1c62
	text "There's no space"
	line "for removing MAIL."
	prompt
; 1c1c86

UnknownText_0x1c1c86: ; 1c1c86
	text "Send the removed"
	line "MAIL to your PC?"
	done
; 1c1ca9

UnknownText_0x1c1ca9: ; 1c1ca9
	text "Your PC's MAILBOX"
	line "is full."
	prompt
; 1c1cc4

UnknownText_0x1c1cc4: ; 1c1cc4
	text "The MAIL was sent"
	line "to your PC."
	prompt
; 1c1ce3

UnknownText_0x1c1ce3: ; 1c1ce3
	text "Not enough HP!"
	prompt
; 1c1cf3

UnknownText_0x1c1cf3: ; 1c1cf3
	text "An item in your"
	line "PACK may be"

	para "registered for use"
	line "on SELECT Button."
	done
; 1c1d35

_OakText1: ; 1c1d35
	text "Hello! Sorry to"
	line "keep you waiting!"

	para "Welcome to the"
	line "world of #MON!"

	para "My name is OAK."

	para "People call me the"
	line "#MON PROF."
	prompt
; 1c1da4

_OakText2: ; 1c1da4
	text "This world is in-"
	line "habited by crea-"
	cont "tures that we call"
	cont "#MON.@"
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
	text "People and #MON"
	line "live together by"

	para "supporting each"
	line "other."

	para "Some people play"
	line "with #MON, some"
	cont "battle with them."
	prompt
; 1c1e51

_OakText5: ; 1c1e51
	text "But we don't know"
	line "everything about"
	cont "#MON yet."

	para "There are still"
	line "many mysteries to"
	cont "solve."

	para "That's why I study"
	line "#MON every day."
	prompt
; 1c1ec9
