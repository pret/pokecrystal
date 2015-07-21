item_attribute: macro
	; price, effect, param, permissions, pocket, battle permissions
	dw \1
	db \2, \3, \4, \5, \6
	endm

Item1Attributes:

; MASTER BALL
	item_attribute 0, NONE, 0, CANT_SELECT, BALL, $06

Item2Attributes:

; ULTRA BALL
	item_attribute 1200, NONE, 0, CANT_SELECT, BALL, $06

; BRIGHTPOWDER
	item_attribute 10, HELD_BRIGHTPOWDER, 20, CANT_SELECT, ITEM, $00

; GREAT BALL
	item_attribute 600, NONE, 0, CANT_SELECT, BALL, $06

; # BALL
	item_attribute 200, NONE, 0, CANT_SELECT, BALL, $06

; TERU-SAMA
	item_attribute $9999, NONE, 0, 0, ITEM, $00

; BICYCLE
	item_attribute 0, NONE, 0, CANT_TOSS, KEY_ITEM, $60

; MOON STONE
	item_attribute 0, NONE, 0, CANT_SELECT, ITEM, $50

; ANTIDOTE
	item_attribute 100, NONE, 0, CANT_SELECT, ITEM, $55

; BURN HEAL
	item_attribute 250, NONE, 0, CANT_SELECT, ITEM, $55

; ICE HEAL
	item_attribute 250, NONE, 0, CANT_SELECT, ITEM, $55

; AWAKENING
	item_attribute 250, NONE, 0, CANT_SELECT, ITEM, $55

; PARLYZ HEAL
	item_attribute 200, NONE, 0, CANT_SELECT, ITEM, $55

; FULL RESTORE
	item_attribute 3000, NONE, -1, CANT_SELECT, ITEM, $55

; MAX POTION
	item_attribute 2500, NONE, -1, CANT_SELECT, ITEM, $55

; HYPER POTION
	item_attribute 1200, NONE, 200, CANT_SELECT, ITEM, $55

; SUPER POTION
	item_attribute 700, NONE, 50, CANT_SELECT, ITEM, $55

; POTION
	item_attribute 300, NONE, 20, CANT_SELECT, ITEM, $55

; ESCAPE ROPE
	item_attribute 550, NONE, 0, CANT_SELECT, ITEM, $60

; REPEL
	item_attribute 350, NONE, 0, CANT_SELECT, ITEM, $40

; MAX ELIXER
	item_attribute 4500, NONE, -1, CANT_SELECT, ITEM, $55

; FIRE STONE
	item_attribute 2100, NONE, 0, CANT_SELECT, ITEM, $50

; THUNDERSTONE
	item_attribute 2100, NONE, 0, CANT_SELECT, ITEM, $50

; WATER STONE
	item_attribute 2100, NONE, 0, CANT_SELECT, ITEM, $50

; TERU-SAMA
	item_attribute $9999, NONE, 0, 0, ITEM, $00

; HP UP
	item_attribute 9800, NONE, 0, CANT_SELECT, ITEM, $50

; PROTEIN
	item_attribute 9800, NONE, 0, CANT_SELECT, ITEM, $50

; IRON
	item_attribute 9800, NONE, 0, CANT_SELECT, ITEM, $50

; CARBOS
	item_attribute 9800, NONE, 0, CANT_SELECT, ITEM, $50

; LUCKY PUNCH
	item_attribute 10, NONE, 0, CANT_SELECT, ITEM, $00

; CALCIUM
	item_attribute 9800, NONE, 0, CANT_SELECT, ITEM, $50

; RARE CANDY
	item_attribute 4800, NONE, 0, CANT_SELECT, ITEM, $50

; X ACCURACY
	item_attribute 950, NONE, 0, CANT_SELECT, ITEM, $06

; LEAF STONE
	item_attribute 2100, NONE, 0, CANT_SELECT, ITEM, $50

; METAL POWDER
	item_attribute 10, HELD_METAL_POWDER, 10, CANT_SELECT, ITEM, $00

; NUGGET
	item_attribute 10000, NONE, 0, CANT_SELECT, ITEM, $00

; # DOLL
	item_attribute 1000, NONE, 0, CANT_SELECT, ITEM, $06

; FULL HEAL
	item_attribute 600, NONE, 0, CANT_SELECT, ITEM, $55

; REVIVE
	item_attribute 1500, NONE, 0, CANT_SELECT, ITEM, $55

; MAX REVIVE
	item_attribute 4000, NONE, 0, CANT_SELECT, ITEM, $55

; GUARD SPEC.
	item_attribute 700, NONE, 0, CANT_SELECT, ITEM, $06

; SUPER REPEL
	item_attribute 500, NONE, 0, CANT_SELECT, ITEM, $40

; MAX REPEL
	item_attribute 700, NONE, 0, CANT_SELECT, ITEM, $40

; DIRE HIT
	item_attribute 650, NONE, 0, CANT_SELECT, ITEM, $06

; TERU-SAMA
	item_attribute $9999, NONE, 0, 0, ITEM, $00

; FRESH WATER
	item_attribute 200, NONE, 50, CANT_SELECT, ITEM, $55

; SODA POP
	item_attribute 300, NONE, 60, CANT_SELECT, ITEM, $55

; LEMONADE
	item_attribute 350, NONE, 80, CANT_SELECT, ITEM, $55

; X ATTACK
	item_attribute 500, NONE, 0, CANT_SELECT, ITEM, $06

; TERU-SAMA
	item_attribute $9999, NONE, 0, 0, ITEM, $00

; X DEFEND
	item_attribute 550, NONE, 0, CANT_SELECT, ITEM, $06

; X SPEED
	item_attribute 350, NONE, 0, CANT_SELECT, ITEM, $06

; X SPECIAL
	item_attribute 350, NONE, 0, CANT_SELECT, ITEM, $06

; COIN CASE
	item_attribute 0, NONE, 0, CANT_SELECT | CANT_TOSS, KEY_ITEM, $40

; ITEMFINDER
	item_attribute 0, NONE, 0, CANT_TOSS, KEY_ITEM, $60

; TERU-SAMA
	item_attribute $9999, NONE, 0, 0, ITEM, $00

; EXP.SHARE
	item_attribute 3000, NONE, 0, CANT_SELECT, ITEM, $00

; OLD ROD
	item_attribute 0, NONE, 0, CANT_TOSS, KEY_ITEM, $60

; GOOD ROD
	item_attribute 0, NONE, 0, CANT_TOSS, KEY_ITEM, $60

; SILVER LEAF
	item_attribute 1000, NONE, 0, CANT_SELECT, ITEM, $00

; SUPER ROD
	item_attribute 0, NONE, 0, CANT_TOSS, KEY_ITEM, $60

; PP UP
	item_attribute 9800, NONE, 0, CANT_SELECT, ITEM, $50

; ETHER
	item_attribute 1200, NONE, 10, CANT_SELECT, ITEM, $55

; MAX ETHER
	item_attribute 2000, NONE, -1, CANT_SELECT, ITEM, $55

; ELIXER
	item_attribute 3000, NONE, 10, CANT_SELECT, ITEM, $55

; RED SCALE
	item_attribute 0, NONE, 0, CANT_SELECT | CANT_TOSS, KEY_ITEM, $00

; SECRETPOTION
	item_attribute 0, NONE, 0, CANT_SELECT | CANT_TOSS, KEY_ITEM, $00

; S.S.TICKET
	item_attribute 0, NONE, 0, CANT_SELECT | CANT_TOSS, KEY_ITEM, $00

; MYSTERY EGG
	item_attribute 0, NONE, 0, CANT_SELECT | CANT_TOSS, KEY_ITEM, $00

; CLEAR BELL
	item_attribute 0, NONE, 0, CANT_SELECT | CANT_TOSS, KEY_ITEM, $00

; SILVER WING
	item_attribute 0, NONE, 0, CANT_SELECT | CANT_TOSS, KEY_ITEM, $00

; MOOMOO MILK
	item_attribute 500, NONE, 100, CANT_SELECT, ITEM, $55

; QUICK CLAW
	item_attribute 100, HELD_QUICK_CLAW, 60, CANT_SELECT, ITEM, $00

; PSNCUREBERRY
	item_attribute 10, HELD_HEAL_POISON, 0, CANT_SELECT, ITEM, $55

; GOLD LEAF
	item_attribute 1000, NONE, 0, CANT_SELECT, ITEM, $00

; SOFT SAND
	item_attribute 100, HELD_GROUND_BOOST, 10, CANT_SELECT, ITEM, $00

; SHARP BEAK
	item_attribute 100, HELD_FLYING_BOOST, 10, CANT_SELECT, ITEM, $00

; PRZCUREBERRY
	item_attribute 10, HELD_HEAL_PARALYZE, 0, CANT_SELECT, ITEM, $55

; BURNT BERRY
	item_attribute 10, HELD_HEAL_FREEZE, 0, CANT_SELECT, ITEM, $55

; ICE BERRY
	item_attribute 10, HELD_HEAL_BURN, 0, CANT_SELECT, ITEM, $55

; POISON BARB
	item_attribute 100, HELD_POISON_BOOST, 10, CANT_SELECT, ITEM, $00

; KING'S ROCK
	item_attribute 100, HELD_TRADE_EVOLVE, 30, CANT_SELECT, ITEM, $00

; BITTER BERRY
	item_attribute 10, HELD_HEAL_CONFUSION, 0, CANT_SELECT, ITEM, $05

; MINT BERRY
	item_attribute 10, HELD_HEAL_SLEEP, 0, CANT_SELECT, ITEM, $55

; RED APRICORN
	item_attribute 200, NONE, 0, CANT_SELECT, ITEM, $00

; TINYMUSHROOM
	item_attribute 500, NONE, 0, CANT_SELECT, ITEM, $00

; BIG MUSHROOM
	item_attribute 5000, NONE, 0, CANT_SELECT, ITEM, $00

; SILVERPOWDER
	item_attribute 100, HELD_BUG_BOOST, 10, CANT_SELECT, ITEM, $00

; BLU APRICORN
	item_attribute 200, NONE, 0, CANT_SELECT, ITEM, $00

; TERU-SAMA
	item_attribute $9999, NONE, 0, 0, ITEM, $00

; AMULET COIN
	item_attribute 100, HELD_AMULET_COIN, 10, CANT_SELECT, ITEM, $00

; YLW APRICORN
	item_attribute 200, NONE, 0, CANT_SELECT, ITEM, $00

; GRN APRICORN
	item_attribute 200, NONE, 0, CANT_SELECT, ITEM, $00

; CLEANSE TAG
	item_attribute 200, HELD_CLEANSE_TAG, 0, CANT_SELECT, ITEM, $00

; MYSTIC WATER
	item_attribute 100, HELD_WATER_BOOST, 10, CANT_SELECT, ITEM, $00

; TWISTEDSPOON
	item_attribute 100, HELD_PSYCHIC_BOOST, 10, CANT_SELECT, ITEM, $00

; WHT APRICORN
	item_attribute 200, NONE, 0, CANT_SELECT, ITEM, $00

; BLACKBELT
	item_attribute 100, HELD_FIGHTING_BOOST, 10, CANT_SELECT, ITEM, $00

; BLK APRICORN
	item_attribute 200, NONE, 0, CANT_SELECT, ITEM, $00

; TERU-SAMA
	item_attribute $9999, NONE, 0, 0, ITEM, $00

; PNK APRICORN
	item_attribute 200, NONE, 0, CANT_SELECT, ITEM, $00

; BLACKGLASSES
	item_attribute 100, HELD_DARK_BOOST, 10, CANT_SELECT, ITEM, $00

; SLOWPOKETAIL
	item_attribute 9800, NONE, 0, CANT_SELECT, ITEM, $00

; PINK BOW
	item_attribute 100, HELD_NORMAL_BOOST, 10, CANT_SELECT, ITEM, $00

; STICK
	item_attribute 200, NONE, 0, CANT_SELECT, ITEM, $00

; SMOKE BALL
	item_attribute 200, HELD_ESCAPE, 0, CANT_SELECT, ITEM, $00

; NEVERMELTICE
	item_attribute 100, HELD_ICE_BOOST, 10, CANT_SELECT, ITEM, $00

; MAGNET
	item_attribute 100, HELD_ELECTRIC_BOOST, 10, CANT_SELECT, ITEM, $00

; MIRACLEBERRY
	item_attribute 10, HELD_HEAL_STATUS, 0, CANT_SELECT, ITEM, $55

; PEARL
	item_attribute 1400, NONE, 0, CANT_SELECT, ITEM, $00

; BIG PEARL
	item_attribute 7500, NONE, 0, CANT_SELECT, ITEM, $00

; EVERSTONE
	item_attribute 200, NONE, 0, CANT_SELECT, ITEM, $00

; SPELL TAG
	item_attribute 100, HELD_GHOST_BOOST, 10, CANT_SELECT, ITEM, $00

; RAGECANDYBAR
	item_attribute 300, NONE, 20, CANT_SELECT, ITEM, $55

; GS BALL
	item_attribute 0, NONE, 0, CANT_SELECT | CANT_TOSS, KEY_ITEM, $00

; BLUE CARD
	item_attribute 0, NONE, 0, CANT_SELECT | CANT_TOSS, KEY_ITEM, $40

; MIRACLE SEED
	item_attribute 100, HELD_GRASS_BOOST, 10, CANT_SELECT, ITEM, $00

; THICK CLUB
	item_attribute 500, NONE, 0, CANT_SELECT, ITEM, $00

; FOCUS BAND
	item_attribute 200, HELD_FOCUS_BAND, 30, CANT_SELECT, ITEM, $00

; TERU-SAMA
	item_attribute $9999, NONE, 0, 0, ITEM, $00

; ENERGYPOWDER
	item_attribute 500, NONE, 0, CANT_SELECT, ITEM, $55

; ENERGY ROOT
	item_attribute 800, NONE, 0, CANT_SELECT, ITEM, $55

; HEAL POWDER
	item_attribute 450, NONE, 0, CANT_SELECT, ITEM, $55

; REVIVAL HERB
	item_attribute 2800, NONE, 0, CANT_SELECT, ITEM, $55

; HARD STONE
	item_attribute 100, HELD_ROCK_BOOST, 10, CANT_SELECT, ITEM, $00

; LUCKY EGG
	item_attribute 200, NONE, 0, CANT_SELECT, ITEM, $00

; CARD KEY
	item_attribute 0, NONE, 0, CANT_SELECT | CANT_TOSS, KEY_ITEM, $60

; MACHINE PART
	item_attribute 0, NONE, 0, CANT_SELECT | CANT_TOSS, KEY_ITEM, $00

; EGG TICKET
	item_attribute 0, NONE, 0, CANT_SELECT | CANT_TOSS, KEY_ITEM, $00

; LOST ITEM
	item_attribute 0, NONE, 0, CANT_SELECT | CANT_TOSS, KEY_ITEM, $00

; STARDUST
	item_attribute 2000, NONE, 0, CANT_SELECT, ITEM, $00

; STAR PIECE
	item_attribute 9800, NONE, 0, CANT_SELECT, ITEM, $00

; BASEMENT KEY
	item_attribute 0, NONE, 0, CANT_SELECT | CANT_TOSS, KEY_ITEM, $60

; PASS
	item_attribute 0, NONE, 0, CANT_SELECT | CANT_TOSS, KEY_ITEM, $00

; TERU-SAMA
	item_attribute $9999, NONE, 0, 0, ITEM, $00

; TERU-SAMA
	item_attribute $9999, NONE, 0, 0, ITEM, $00

; TERU-SAMA
	item_attribute $9999, NONE, 0, 0, ITEM, $00

; CHARCOAL
	item_attribute 9800, HELD_FIRE_BOOST, 10, CANT_SELECT, ITEM, $00

; BERRY JUICE
	item_attribute 100, HELD_BERRY, 20, CANT_SELECT, ITEM, $55

; SCOPE LENS
	item_attribute 200, HELD_CRITICAL_UP, 0, CANT_SELECT, ITEM, $00

; TERU-SAMA
	item_attribute $9999, NONE, 0, 0, ITEM, $00

; TERU-SAMA
	item_attribute $9999, NONE, 0, 0, ITEM, $00

; METAL COAT
	item_attribute 100, HELD_STEEL_BOOST, 10, CANT_SELECT, ITEM, $00

; DRAGON FANG
	item_attribute 100, NONE, 0, CANT_SELECT, ITEM, $00

; TERU-SAMA
	item_attribute $9999, NONE, 0, 0, ITEM, $00

; LEFTOVERS
	item_attribute 200, HELD_LEFTOVERS, 10, CANT_SELECT, ITEM, $00

; TERU-SAMA
	item_attribute $9999, NONE, 0, 0, ITEM, $00

; TERU-SAMA
	item_attribute $9999, NONE, 0, 0, ITEM, $00

; TERU-SAMA
	item_attribute $9999, NONE, 0, 0, ITEM, $00

; MYSTERYBERRY
	item_attribute 10, HELD_RESTORE_PP, -1, CANT_SELECT, ITEM, $55

; DRAGON SCALE
	item_attribute 2100, HELD_DRAGON_BOOST, 10, CANT_SELECT, ITEM, $00

; BERSERK GENE
	item_attribute 200, NONE, 0, CANT_SELECT, ITEM, $00

; TERU-SAMA
	item_attribute $9999, NONE, 0, 0, ITEM, $00

; TERU-SAMA
	item_attribute $9999, NONE, 0, 0, ITEM, $00

; TERU-SAMA
	item_attribute $9999, NONE, 0, 0, ITEM, $00

; SACRED ASH
	item_attribute 200, NONE, 0, CANT_SELECT, ITEM, $60

; HEAVY BALL
	item_attribute 150, NONE, 0, CANT_SELECT, BALL, $06

; FLOWER MAIL
	item_attribute 50, NONE, 0, CANT_SELECT, ITEM, $00

; LEVEL BALL
	item_attribute 150, NONE, 0, CANT_SELECT, BALL, $06

; LURE BALL
	item_attribute 150, NONE, 0, CANT_SELECT, BALL, $06

; FAST BALL
	item_attribute 150, NONE, 0, CANT_SELECT, BALL, $06

; TERU-SAMA
	item_attribute $9999, NONE, 0, 0, ITEM, $00

; LIGHT BALL
	item_attribute 100, NONE, 0, CANT_SELECT, ITEM, $00

; FRIEND BALL
	item_attribute 150, NONE, 0, CANT_SELECT, BALL, $06

; MOON BALL
	item_attribute 150, NONE, 0, CANT_SELECT, BALL, $06

; LOVE BALL
	item_attribute 150, NONE, 0, CANT_SELECT, BALL, $06

; NORMAL BOX
	item_attribute 10, NONE, 0, CANT_SELECT, ITEM, $40

; GORGEOUS BOX
	item_attribute 10, NONE, 0, CANT_SELECT, ITEM, $40

; SUN STONE
	item_attribute 2100, NONE, 0, CANT_SELECT, ITEM, $50

; POLKADOT BOW
	item_attribute 100, HELD_NORMAL_BOOST, 10, CANT_SELECT, ITEM, $00

; TERU-SAMA
	item_attribute $9999, NONE, 0, 0, ITEM, $00

; UP-GRADE
	item_attribute 2100, NONE, 0, CANT_SELECT, ITEM, $00

; BERRY
	item_attribute 10, HELD_BERRY, 10, CANT_SELECT, ITEM, $55

; GOLD BERRY
	item_attribute 10, HELD_BERRY, 30, CANT_SELECT, ITEM, $55

; SQUIRTBOTTLE
	item_attribute 0, NONE, 0, CANT_SELECT | CANT_TOSS, KEY_ITEM, $60

; TERU-SAMA
	item_attribute $9999, NONE, 0, 0, ITEM, $00

; PARK BALL
	item_attribute 0, NONE, 0, CANT_SELECT, BALL, $06

; RAINBOW WING
	item_attribute 0, NONE, 0, CANT_SELECT | CANT_TOSS, KEY_ITEM, $00

; TERU-SAMA
	item_attribute $9999, NONE, 0, 0, ITEM, $00

; BRICK PIECE
	item_attribute 50, NONE, 0, CANT_SELECT, ITEM, $00

; SURF MAIL
	item_attribute 50, NONE, 0, CANT_SELECT, ITEM, $00

; LITEBLUEMAIL
	item_attribute 50, NONE, 0, CANT_SELECT, ITEM, $00

; PORTRAITMAIL
	item_attribute 50, NONE, 0, CANT_SELECT, ITEM, $00

; LOVELY MAIL
	item_attribute 50, NONE, 0, CANT_SELECT, ITEM, $00

; EON MAIL
	item_attribute 50, NONE, 0, CANT_SELECT, ITEM, $00

; MORPH MAIL
	item_attribute 50, NONE, 0, CANT_SELECT, ITEM, $00

; BLUESKY MAIL
	item_attribute 50, NONE, 0, CANT_SELECT, ITEM, $00

; MUSIC MAIL
	item_attribute 50, NONE, 0, CANT_SELECT, ITEM, $00

; MIRAGE MAIL
	item_attribute 50, NONE, 0, CANT_SELECT, ITEM, $00

; TERU-SAMA
	item_attribute $9999, NONE, 0, 0, ITEM, $00

; TM01
	item_attribute 3000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM02
	item_attribute 2000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM03
	item_attribute 3000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM04
	item_attribute 2000, NONE, 0, CANT_SELECT, TM_HM, $50

; TERU-SAMA
	item_attribute $9999, NONE, 0, 0, ITEM, $00

; TM05
	item_attribute 1000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM06
	item_attribute 3000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM07
	item_attribute 2000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM08
	item_attribute 1000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM09
	item_attribute 1000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM10
	item_attribute 3000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM11
	item_attribute 2000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM12
	item_attribute 1000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM13
	item_attribute 1000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM14
	item_attribute 3000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM15
	item_attribute 3000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM16
	item_attribute 3000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM17
	item_attribute 3000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM18
	item_attribute 2000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM19
	item_attribute 3000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM20
	item_attribute 3000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM21
	item_attribute 1000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM22
	item_attribute 3000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM23
	item_attribute 3000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM24
	item_attribute 3000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM25
	item_attribute 2000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM26
	item_attribute 3000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM27
	item_attribute 1000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM28
	item_attribute 2000, NONE, 0, CANT_SELECT, TM_HM, $50

; TERU-SAMA
	item_attribute $9999, NONE, 0, 0, ITEM, $00

; TM29
	item_attribute 2000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM30
	item_attribute 3000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM31
	item_attribute 3000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM32
	item_attribute 2000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM33
	item_attribute 3000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM34
	item_attribute 1000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM35
	item_attribute 1000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM36
	item_attribute 1000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM37
	item_attribute 2000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM38
	item_attribute 2000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM39
	item_attribute 2000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM40
	item_attribute 1000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM41
	item_attribute 3000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM42
	item_attribute 3000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM43
	item_attribute 1000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM44
	item_attribute 3000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM45
	item_attribute 3000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM46
	item_attribute 3000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM47
	item_attribute 3000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM48
	item_attribute 3000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM49
	item_attribute 3000, NONE, 0, CANT_SELECT, TM_HM, $50

; TM50
	item_attribute 2000, NONE, 0, CANT_SELECT, TM_HM, $50

; HM01
	item_attribute 0, NONE, 0, CANT_SELECT | CANT_TOSS, TM_HM, $50

; HM02
	item_attribute 0, NONE, 0, CANT_SELECT | CANT_TOSS, TM_HM, $50

; HM03
	item_attribute 0, NONE, 0, CANT_SELECT | CANT_TOSS, TM_HM, $50

; HM04
	item_attribute 0, NONE, 0, CANT_SELECT | CANT_TOSS, TM_HM, $50

; HM05
	item_attribute 0, NONE, 0, CANT_SELECT | CANT_TOSS, TM_HM, $50

; HM06
	item_attribute 0, NONE, 0, CANT_SELECT | CANT_TOSS, TM_HM, $50

; HM07
	item_attribute 0, NONE, 0, CANT_SELECT | CANT_TOSS, TM_HM, $50

; TERU-SAMA
	item_attribute $9999, NONE, 0, 0, ITEM, $00

; TERU-SAMA
	item_attribute $9999, NONE, 0, 0, ITEM, $00

; TERU-SAMA
	item_attribute $9999, NONE, 0, 0, ITEM, $00

; TERU-SAMA
	item_attribute $9999, NONE, 0, 0, ITEM, $00

; TERU-SAMA
	item_attribute $9999, NONE, 0, 0, ITEM, $00

; TERU-SAMA
	item_attribute $9999, NONE, 0, 0, ITEM, $00

; ?
	item_attribute $9999, NONE, 0, 0, ITEM, $00
