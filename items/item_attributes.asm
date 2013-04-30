Item1Attributes:

; MASTER BALL
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db BALL
	db $06 ; ball

Item2Attributes:

; ULTRA BALL
	dw 1200 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db BALL
	db $06 ; ball

; BRIGHTPOWDER
	dw 10 ; price
	db HELD_BRIGHTPOWDER ; effect
	db 20 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; GREAT BALL
	dw 600 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db BALL
	db $06 ; ball

; # BALL
	dw 200 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db BALL
	db $06 ; ball

; TERU-SAMA
	dw 39321 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	db $00 ; can't use

; BICYCLE
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_TOSS
	db KEY_ITEM
	db $60 ; overworld

; MOON STONE
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $50 ; party menu

; ANTIDOTE
	dw 100 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $55 ; heal menu

; BURN HEAL
	dw 250 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $55 ; heal menu

; ICE HEAL
	dw 250 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $55 ; heal menu

; AWAKENING
	dw 250 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $55 ; heal menu

; PARLYZ HEAL
	dw 200 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $55 ; heal menu

; FULL RESTORE
	dw 3000 ; price
	db NONE ; effect
	db 255 ; param
	db CANT_SELECT
	db ITEM
	db $55 ; heal menu

; MAX POTION
	dw 2500 ; price
	db NONE ; effect
	db 255 ; param
	db CANT_SELECT
	db ITEM
	db $55 ; heal menu

; HYPER POTION
	dw 1200 ; price
	db NONE ; effect
	db 200 ; param
	db CANT_SELECT
	db ITEM
	db $55 ; heal menu

; SUPER POTION
	dw 700 ; price
	db NONE ; effect
	db 50 ; param
	db CANT_SELECT
	db ITEM
	db $55 ; heal menu

; POTION
	dw 300 ; price
	db NONE ; effect
	db 20 ; param
	db CANT_SELECT
	db ITEM
	db $55 ; heal menu

; ESCAPE ROPE
	dw 550 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $60 ; overworld

; REPEL
	dw 350 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $40 ; current menu

; MAX ELIXER
	dw 4500 ; price
	db NONE ; effect
	db 255 ; param
	db CANT_SELECT
	db ITEM
	db $55 ; heal menu

; FIRE STONE
	dw 2100 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $50 ; party menu

; THUNDERSTONE
	dw 2100 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $50 ; party menu

; WATER STONE
	dw 2100 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $50 ; party menu

; TERU-SAMA
	dw 39321 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	db $00 ; can't use

; HP UP
	dw 9800 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $50 ; party menu

; PROTEIN
	dw 9800 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $50 ; party menu

; IRON
	dw 9800 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $50 ; party menu

; CARBOS
	dw 9800 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $50 ; party menu

; LUCKY PUNCH
	dw 10 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; CALCIUM
	dw 9800 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $50 ; party menu

; RARE CANDY
	dw 4800 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $50 ; party menu

; X ACCURACY
	dw 950 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $06 ; ball

; LEAF STONE
	dw 2100 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $50 ; party menu

; METAL POWDER
	dw 10 ; price
	db HELD_METAL_POWDER ; effect
	db 10 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; NUGGET
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; # DOLL
	dw 1000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $06 ; ball

; FULL HEAL
	dw 600 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $55 ; heal menu

; REVIVE
	dw 1500 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $55 ; heal menu

; MAX REVIVE
	dw 4000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $55 ; heal menu

; GUARD SPEC.
	dw 700 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $06 ; ball

; SUPER REPEL
	dw 500 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $40 ; current menu

; MAX REPEL
	dw 700 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $40 ; current menu

; DIRE HIT
	dw 650 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $06 ; ball

; TERU-SAMA
	dw 39321 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	db $00 ; can't use

; FRESH WATER
	dw 200 ; price
	db NONE ; effect
	db 50 ; param
	db CANT_SELECT
	db ITEM
	db $55 ; heal menu

; SODA POP
	dw 300 ; price
	db NONE ; effect
	db 60 ; param
	db CANT_SELECT
	db ITEM
	db $55 ; heal menu

; LEMONADE
	dw 350 ; price
	db NONE ; effect
	db 80 ; param
	db CANT_SELECT
	db ITEM
	db $55 ; heal menu

; X ATTACK
	dw 500 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $06 ; ball

; TERU-SAMA
	dw 39321 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	db $00 ; can't use

; X DEFEND
	dw 550 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $06 ; ball

; X SPEED
	dw 350 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $06 ; ball

; X SPECIAL
	dw 350 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $06 ; ball

; COIN CASE
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db KEY_ITEM
	db $40 ; current menu

; ITEMFINDER
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_TOSS
	db KEY_ITEM
	db $60 ; overworld

; TERU-SAMA
	dw 39321 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	db $00 ; can't use

; EXP.SHARE
	dw 3000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; OLD ROD
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_TOSS
	db KEY_ITEM
	db $60 ; overworld

; GOOD ROD
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_TOSS
	db KEY_ITEM
	db $60 ; overworld

; SILVER LEAF
	dw 1000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; SUPER ROD
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_TOSS
	db KEY_ITEM
	db $60 ; overworld

; PP UP
	dw 9800 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $50 ; party menu

; ETHER
	dw 1200 ; price
	db NONE ; effect
	db 10 ; param
	db CANT_SELECT
	db ITEM
	db $55 ; heal menu

; MAX ETHER
	dw 2000 ; price
	db NONE ; effect
	db 255 ; param
	db CANT_SELECT
	db ITEM
	db $55 ; heal menu

; ELIXER
	dw 3000 ; price
	db NONE ; effect
	db 10 ; param
	db CANT_SELECT
	db ITEM
	db $55 ; heal menu

; RED SCALE
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db KEY_ITEM
	db $00 ; can't use

; SECRETPOTION
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db KEY_ITEM
	db $00 ; can't use

; S.S.TICKET
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db KEY_ITEM
	db $00 ; can't use

; MYSTERY EGG
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db KEY_ITEM
	db $00 ; can't use

; CLEAR BELL
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db KEY_ITEM
	db $00 ; can't use

; SILVER WING
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db KEY_ITEM
	db $00 ; can't use

; MOOMOO MILK
	dw 500 ; price
	db NONE ; effect
	db 100 ; param
	db CANT_SELECT
	db ITEM
	db $55 ; heal menu

; QUICK CLAW
	dw 100 ; price
	db HELD_QUICK_CLAW ; effect
	db 60 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; PSNCUREBERRY
	dw 10 ; price
	db HELD_HEAL_POISON ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $55 ; heal menu

; GOLD LEAF
	dw 1000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; SOFT SAND
	dw 100 ; price
	db HELD_GROUND_BOOST ; effect
	db 10 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; SHARP BEAK
	dw 100 ; price
	db HELD_FLYING_BOOST ; effect
	db 10 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; PRZCUREBERRY
	dw 10 ; price
	db HELD_HEAL_PARALYZE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $55 ; heal menu

; BURNT BERRY
	dw 10 ; price
	db HELD_HEAL_FREEZE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $55 ; heal menu

; ICE BERRY
	dw 10 ; price
	db HELD_HEAL_BURN ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $55 ; heal menu

; POISON BARB
	dw 100 ; price
	db HELD_POISON_BOOST ; effect
	db 10 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; KING'S ROCK
	dw 100 ; price
	db HELD_TRADE_EVOLVE ; effect
	db 30 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; BITTER BERRY
	dw 10 ; price
	db HELD_HEAL_CONFUSION ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $05 ; heal menu (battle only)

; MINT BERRY
	dw 10 ; price
	db HELD_HEAL_SLEEP ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $55 ; heal menu

; RED APRICORN
	dw 200 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; TINYMUSHROOM
	dw 500 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; BIG MUSHROOM
	dw 5000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; SILVERPOWDER
	dw 100 ; price
	db HELD_BUG_BOOST ; effect
	db 10 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; BLU APRICORN
	dw 200 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; TERU-SAMA
	dw 39321 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	db $00 ; can't use

; AMULET COIN
	dw 100 ; price
	db HELD_AMULET_COIN ; effect
	db 10 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; YLW APRICORN
	dw 200 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; GRN APRICORN
	dw 200 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; CLEANSE TAG
	dw 200 ; price
	db HELD_CLEANSE_TAG ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; MYSTIC WATER
	dw 100 ; price
	db HELD_WATER_BOOST ; effect
	db 10 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; TWISTEDSPOON
	dw 100 ; price
	db HELD_PSYCHIC_BOOST ; effect
	db 10 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; WHT APRICORN
	dw 200 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; BLACKBELT
	dw 100 ; price
	db HELD_FIGHTING_BOOST ; effect
	db 10 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; BLK APRICORN
	dw 200 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; TERU-SAMA
	dw 39321 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	db $00 ; can't use

; PNK APRICORN
	dw 200 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; BLACKGLASSES
	dw 100 ; price
	db HELD_DARK_BOOST ; effect
	db 10 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; SLOWPOKETAIL
	dw 9800 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; PINK BOW
	dw 100 ; price
	db HELD_NORMAL_BOOST ; effect
	db 10 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; STICK
	dw 200 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; SMOKE BALL
	dw 200 ; price
	db HELD_ESCAPE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; NEVERMELTICE
	dw 100 ; price
	db HELD_ICE_BOOST ; effect
	db 10 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; MAGNET
	dw 100 ; price
	db HELD_ELECTRIC_BOOST ; effect
	db 10 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; MIRACLEBERRY
	dw 10 ; price
	db HELD_HEAL_STATUS ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $55 ; heal menu

; PEARL
	dw 1400 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; BIG PEARL
	dw 7500 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; EVERSTONE
	dw 200 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; SPELL TAG
	dw 100 ; price
	db HELD_GHOST_BOOST ; effect
	db 10 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; RAGECANDYBAR
	dw 300 ; price
	db NONE ; effect
	db 20 ; param
	db CANT_SELECT
	db ITEM
	db $55 ; heal menu

; GS BALL
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db KEY_ITEM
	db $00 ; can't use

; BLUE CARD
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db KEY_ITEM
	db $40 ; current menu

; MIRACLE SEED
	dw 100 ; price
	db HELD_GRASS_BOOST ; effect
	db 10 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; THICK CLUB
	dw 500 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; FOCUS BAND
	dw 200 ; price
	db HELD_FOCUS_BAND ; effect
	db 30 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; TERU-SAMA
	dw 39321 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	db $00 ; can't use

; ENERGYPOWDER
	dw 500 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $55 ; heal menu

; ENERGY ROOT
	dw 800 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $55 ; heal menu

; HEAL POWDER
	dw 450 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $55 ; heal menu

; REVIVAL HERB
	dw 2800 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $55 ; heal menu

; HARD STONE
	dw 100 ; price
	db HELD_ROCK_BOOST ; effect
	db 10 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; LUCKY EGG
	dw 200 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; CARD KEY
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db KEY_ITEM
	db $60 ; overworld

; MACHINE PART
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db KEY_ITEM
	db $00 ; can't use

; EGG TICKET
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db KEY_ITEM
	db $00 ; can't use

; LOST ITEM
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db KEY_ITEM
	db $00 ; can't use

; STARDUST
	dw 2000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; STAR PIECE
	dw 9800 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; BASEMENT KEY
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db KEY_ITEM
	db $60 ; overworld

; PASS
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db KEY_ITEM
	db $00 ; can't use

; TERU-SAMA
	dw 39321 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	db $00 ; can't use

; TERU-SAMA
	dw 39321 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	db $00 ; can't use

; TERU-SAMA
	dw 39321 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	db $00 ; can't use

; CHARCOAL
	dw 9800 ; price
	db HELD_FIRE_BOOST ; effect
	db 10 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; BERRY JUICE
	dw 100 ; price
	db HELD_BERRY ; effect
	db 20 ; param
	db CANT_SELECT
	db ITEM
	db $55 ; heal menu

; SCOPE LENS
	dw 200 ; price
	db HELD_CRITICAL_UP ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; TERU-SAMA
	dw 39321 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	db $00 ; can't use

; TERU-SAMA
	dw 39321 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	db $00 ; can't use

; METAL COAT
	dw 100 ; price
	db HELD_STEEL_BOOST ; effect
	db 10 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; DRAGON FANG
	dw 100 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; TERU-SAMA
	dw 39321 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	db $00 ; can't use

; LEFTOVERS
	dw 200 ; price
	db HELD_LEFTOVERS ; effect
	db 10 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; TERU-SAMA
	dw 39321 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	db $00 ; can't use

; TERU-SAMA
	dw 39321 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	db $00 ; can't use

; TERU-SAMA
	dw 39321 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	db $00 ; can't use

; MYSTERYBERRY
	dw 10 ; price
	db HELD_RESTORE_PP ; effect
	db 255 ; param
	db CANT_SELECT
	db ITEM
	db $55 ; heal menu

; DRAGON SCALE
	dw 2100 ; price
	db HELD_DRAGON_BOOST ; effect
	db 10 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; BERSERK GENE
	dw 200 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; TERU-SAMA
	dw 39321 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	db $00 ; can't use

; TERU-SAMA
	dw 39321 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	db $00 ; can't use

; TERU-SAMA
	dw 39321 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	db $00 ; can't use

; SACRED ASH
	dw 200 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $60 ; overworld

; HEAVY BALL
	dw 150 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db BALL
	db $06 ; ball

; FLOWER MAIL
	dw 50 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; LEVEL BALL
	dw 150 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db BALL
	db $06 ; ball

; LURE BALL
	dw 150 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db BALL
	db $06 ; ball

; FAST BALL
	dw 150 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db BALL
	db $06 ; ball

; TERU-SAMA
	dw 39321 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	db $00 ; can't use

; LIGHT BALL
	dw 100 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; FRIEND BALL
	dw 150 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db BALL
	db $06 ; ball

; MOON BALL
	dw 150 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db BALL
	db $06 ; ball

; LOVE BALL
	dw 150 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db BALL
	db $06 ; ball

; NORMAL BOX
	dw 10 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $40 ; current menu

; GORGEOUS BOX
	dw 10 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $40 ; current menu

; SUN STONE
	dw 2100 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $50 ; party menu

; POLKADOT BOW
	dw 100 ; price
	db HELD_NORMAL_BOOST ; effect
	db 10 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; TERU-SAMA
	dw 39321 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	db $00 ; can't use

; UP-GRADE
	dw 2100 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; BERRY
	dw 10 ; price
	db HELD_BERRY ; effect
	db 10 ; param
	db CANT_SELECT
	db ITEM
	db $55 ; heal menu

; GOLD BERRY
	dw 10 ; price
	db HELD_BERRY ; effect
	db 30 ; param
	db CANT_SELECT
	db ITEM
	db $55 ; heal menu

; SQUIRTBOTTLE
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db KEY_ITEM
	db $60 ; overworld

; TERU-SAMA
	dw 39321 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	db $00 ; can't use

; PARK BALL
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db BALL
	db $06 ; ball

; RAINBOW WING
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db KEY_ITEM
	db $00 ; can't use

; TERU-SAMA
	dw 39321 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	db $00 ; can't use

; BRICK PIECE
	dw 50 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; SURF MAIL
	dw 50 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; LITEBLUEMAIL
	dw 50 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; PORTRAITMAIL
	dw 50 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; LOVELY MAIL
	dw 50 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; EON MAIL
	dw 50 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; MORPH MAIL
	dw 50 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; BLUESKY MAIL
	dw 50 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; MUSIC MAIL
	dw 50 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; MIRAGE MAIL
	dw 50 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	db $00 ; can't use

; TERU-SAMA
	dw 39321 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	db $00 ; can't use

; TM01
	dw 3000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM02
	dw 2000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM03
	dw 3000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM04
	dw 2000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TERU-SAMA
	dw 39321 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	db $00 ; can't use

; TM05
	dw 1000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM06
	dw 3000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM07
	dw 2000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM08
	dw 1000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM09
	dw 1000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM10
	dw 3000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM11
	dw 2000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM12
	dw 1000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM13
	dw 1000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM14
	dw 3000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM15
	dw 3000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM16
	dw 3000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM17
	dw 3000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM18
	dw 2000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM19
	dw 3000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM20
	dw 3000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM21
	dw 1000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM22
	dw 3000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM23
	dw 3000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM24
	dw 3000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM25
	dw 2000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM26
	dw 3000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM27
	dw 1000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM28
	dw 2000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TERU-SAMA
	dw 39321 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	db $00 ; can't use

; TM29
	dw 2000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM30
	dw 3000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM31
	dw 3000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM32
	dw 2000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM33
	dw 3000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM34
	dw 1000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM35
	dw 1000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM36
	dw 1000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM37
	dw 2000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM38
	dw 2000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM39
	dw 2000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM40
	dw 1000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM41
	dw 3000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM42
	dw 3000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM43
	dw 1000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM44
	dw 3000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM45
	dw 3000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM46
	dw 3000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM47
	dw 3000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM48
	dw 3000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM49
	dw 3000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; TM50
	dw 2000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db TM_HM
	db $50 ; party menu

; HM01
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	db $50 ; party menu

; HM02
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	db $50 ; party menu

; HM03
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	db $50 ; party menu

; HM04
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	db $50 ; party menu

; HM05
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	db $50 ; party menu

; HM06
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	db $50 ; party menu

; HM07
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	db $50 ; party menu

; TERU-SAMA
	dw 39321 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	db $00 ; can't use

; TERU-SAMA
	dw 39321 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	db $00 ; can't use

; TERU-SAMA
	dw 39321 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	db $00 ; can't use

; TERU-SAMA
	dw 39321 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	db $00 ; can't use

; TERU-SAMA
	dw 39321 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	db $00 ; can't use

; TERU-SAMA
	dw 39321 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	db $00 ; can't use

; ?
	dw 39321 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	db $00 ; can't use


