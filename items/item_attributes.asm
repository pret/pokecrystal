item_attribute: MACRO
	dw \1
	db \2, \3, \4, \5
	dn \6, \7
ENDM

Item1Attributes:

; MASTER BALL
	item_attribute     0, NONE,                 0,             CANT_SELECT, BALL,     ITEMMENU_NOUSE,   ITEMCONTEXT_BATTLEONLY

Item2Attributes:

; ULTRA BALL
	item_attribute  1200, NONE,                 0,             CANT_SELECT, BALL,     ITEMMENU_NOUSE,   ITEMCONTEXT_BATTLEONLY

; BRIGHTPOWDER
	item_attribute    10, HELD_BRIGHTPOWDER,   20,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; GREAT BALL
	item_attribute   600, NONE,                 0,             CANT_SELECT, BALL,     ITEMMENU_NOUSE,   ITEMCONTEXT_BATTLEONLY

; # BALL
	item_attribute   200, NONE,                 0,             CANT_SELECT, BALL,     ITEMMENU_NOUSE,   ITEMCONTEXT_BATTLEONLY

; TERU-SAMA
	item_attribute $9999, NONE,                 0,                       0, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; BICYCLE
	item_attribute     0, NONE,                 0,               CANT_TOSS, KEY_ITEM, ITEMMENU_FIELD,   ITEMCONTEXT_NOTINBATTLE

; MOON STONE
	item_attribute     0, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; ANTIDOTE
	item_attribute   100, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_BATTLEANDFIELD

; BURN HEAL
	item_attribute   250, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_BATTLEANDFIELD

; ICE HEAL
	item_attribute   250, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_BATTLEANDFIELD

; AWAKENING
	item_attribute   250, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_BATTLEANDFIELD

; PARLYZ HEAL
	item_attribute   200, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_BATTLEANDFIELD

; FULL RESTORE
	item_attribute  3000, NONE,                -1,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_BATTLEANDFIELD

; MAX POTION
	item_attribute  2500, NONE,                -1,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_BATTLEANDFIELD

; HYPER POTION
	item_attribute  1200, NONE,               200,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_BATTLEANDFIELD

; SUPER POTION
	item_attribute   700, NONE,                50,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_BATTLEANDFIELD

; POTION
	item_attribute   300, NONE,                20,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_BATTLEANDFIELD

; ESCAPE ROPE
	item_attribute   550, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_FIELD,   ITEMCONTEXT_NOTINBATTLE

; REPEL
	item_attribute   350, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_CURRENT, ITEMCONTEXT_NOTINBATTLE

; MAX ELIXER
	item_attribute  4500, NONE,                -1,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_BATTLEANDFIELD

; FIRE STONE
	item_attribute  2100, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; THUNDERSTONE
	item_attribute  2100, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; WATER STONE
	item_attribute  2100, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TERU-SAMA
	item_attribute $9999, NONE,                 0,                       0, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; HP UP
	item_attribute  9800, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; PROTEIN
	item_attribute  9800, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; IRON
	item_attribute  9800, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; CARBOS
	item_attribute  9800, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; LUCKY PUNCH
	item_attribute    10, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; CALCIUM
	item_attribute  9800, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; RARE CANDY
	item_attribute  4800, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; X ACCURACY
	item_attribute   950, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_BATTLEONLY

; LEAF STONE
	item_attribute  2100, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; METAL POWDER
	item_attribute    10, HELD_METAL_POWDER,   10,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; NUGGET
	item_attribute 10000, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; # DOLL
	item_attribute  1000, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_BATTLEONLY

; FULL HEAL
	item_attribute   600, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_BATTLEANDFIELD

; REVIVE
	item_attribute  1500, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_BATTLEANDFIELD

; MAX REVIVE
	item_attribute  4000, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_BATTLEANDFIELD

; GUARD SPEC.
	item_attribute   700, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_BATTLEONLY

; SUPER REPEL
	item_attribute   500, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_CURRENT, ITEMCONTEXT_NOTINBATTLE

; MAX REPEL
	item_attribute   700, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_CURRENT, ITEMCONTEXT_NOTINBATTLE

; DIRE HIT
	item_attribute   650, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_BATTLEONLY

; TERU-SAMA
	item_attribute $9999, NONE,                 0,                       0, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; FRESH WATER
	item_attribute   200, NONE,                50,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_BATTLEANDFIELD

; SODA POP
	item_attribute   300, NONE,                60,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_BATTLEANDFIELD

; LEMONADE
	item_attribute   350, NONE,                80,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_BATTLEANDFIELD

; X ATTACK
	item_attribute   500, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_BATTLEONLY

; TERU-SAMA
	item_attribute $9999, NONE,                 0,                       0, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; X DEFEND
	item_attribute   550, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_BATTLEONLY

; X SPEED
	item_attribute   350, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_BATTLEONLY

; X SPECIAL
	item_attribute   350, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_BATTLEONLY

; COIN CASE
	item_attribute     0, NONE,                 0, CANT_SELECT | CANT_TOSS, KEY_ITEM, ITEMMENU_CURRENT, ITEMCONTEXT_NOTINBATTLE

; ITEMFINDER
	item_attribute     0, NONE,                 0,               CANT_TOSS, KEY_ITEM, ITEMMENU_FIELD,   ITEMCONTEXT_NOTINBATTLE

; TERU-SAMA
	item_attribute $9999, NONE,                 0,                       0, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; EXP.SHARE
	item_attribute  3000, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; OLD ROD
	item_attribute     0, NONE,                 0,               CANT_TOSS, KEY_ITEM, ITEMMENU_FIELD,   ITEMCONTEXT_NOTINBATTLE

; GOOD ROD
	item_attribute     0, NONE,                 0,               CANT_TOSS, KEY_ITEM, ITEMMENU_FIELD,   ITEMCONTEXT_NOTINBATTLE

; SILVER LEAF
	item_attribute  1000, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; SUPER ROD
	item_attribute     0, NONE,                 0,               CANT_TOSS, KEY_ITEM, ITEMMENU_FIELD,   ITEMCONTEXT_NOTINBATTLE

; PP UP
	item_attribute  9800, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; ETHER
	item_attribute  1200, NONE,                10,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_BATTLEANDFIELD

; MAX ETHER
	item_attribute  2000, NONE,                -1,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_BATTLEANDFIELD

; ELIXER
	item_attribute  3000, NONE,                10,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_BATTLEANDFIELD

; RED SCALE
	item_attribute     0, NONE,                 0, CANT_SELECT | CANT_TOSS, KEY_ITEM, ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; SECRETPOTION
	item_attribute     0, NONE,                 0, CANT_SELECT | CANT_TOSS, KEY_ITEM, ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; S.S.TICKET
	item_attribute     0, NONE,                 0, CANT_SELECT | CANT_TOSS, KEY_ITEM, ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; MYSTERY EGG
	item_attribute     0, NONE,                 0, CANT_SELECT | CANT_TOSS, KEY_ITEM, ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; CLEAR BELL
	item_attribute     0, NONE,                 0, CANT_SELECT | CANT_TOSS, KEY_ITEM, ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; SILVER WING
	item_attribute     0, NONE,                 0, CANT_SELECT | CANT_TOSS, KEY_ITEM, ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; MOOMOO MILK
	item_attribute   500, NONE,               100,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_BATTLEANDFIELD

; QUICK CLAW
	item_attribute   100, HELD_QUICK_CLAW,     60,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; PSNCUREBERRY
	item_attribute    10, HELD_HEAL_POISON,     0,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_BATTLEANDFIELD

; GOLD LEAF
	item_attribute  1000, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; SOFT SAND
	item_attribute   100, HELD_GROUND_BOOST,   10,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; SHARP BEAK
	item_attribute   100, HELD_FLYING_BOOST,   10,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; PRZCUREBERRY
	item_attribute    10, HELD_HEAL_PARALYZE,   0,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_BATTLEANDFIELD

; BURNT BERRY
	item_attribute    10, HELD_HEAL_FREEZE,     0,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_BATTLEANDFIELD

; ICE BERRY
	item_attribute    10, HELD_HEAL_BURN,       0,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_BATTLEANDFIELD

; POISON BARB
	item_attribute   100, HELD_POISON_BOOST,   10,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; KING'S ROCK
	item_attribute   100, HELD_TRADE_EVOLVE,   30,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; BITTER BERRY
	item_attribute    10, HELD_HEAL_CONFUSION,  0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_BATTLEANDFIELD

; MINT BERRY
	item_attribute    10, HELD_HEAL_SLEEP,      0,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_BATTLEANDFIELD

; RED APRICORN
	item_attribute   200, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; TINYMUSHROOM
	item_attribute   500, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; BIG MUSHROOM
	item_attribute  5000, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; SILVERPOWDER
	item_attribute   100, HELD_BUG_BOOST,      10,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; BLU APRICORN
	item_attribute   200, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; TERU-SAMA
	item_attribute $9999, NONE,                 0,                       0, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; AMULET COIN
	item_attribute   100, HELD_AMULET_COIN,    10,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; YLW APRICORN
	item_attribute   200, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; GRN APRICORN
	item_attribute   200, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; CLEANSE TAG
	item_attribute   200, HELD_CLEANSE_TAG,     0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; MYSTIC WATER
	item_attribute   100, HELD_WATER_BOOST,    10,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; TWISTEDSPOON
	item_attribute   100, HELD_PSYCHIC_BOOST,  10,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; WHT APRICORN
	item_attribute   200, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; BLACKBELT
	item_attribute   100, HELD_FIGHTING_BOOST, 10,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; BLK APRICORN
	item_attribute   200, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; TERU-SAMA
	item_attribute $9999, NONE,                 0,                       0, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; PNK APRICORN
	item_attribute   200, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; BLACKGLASSES
	item_attribute   100, HELD_DARK_BOOST,     10,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; SLOWPOKETAIL
	item_attribute  9800, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; PINK BOW
	item_attribute   100, HELD_NORMAL_BOOST,   10,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; STICK
	item_attribute   200, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; SMOKE BALL
	item_attribute   200, HELD_ESCAPE,          0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; NEVERMELTICE
	item_attribute   100, HELD_ICE_BOOST,      10,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; MAGNET
	item_attribute   100, HELD_ELECTRIC_BOOST, 10,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; MIRACLEBERRY
	item_attribute    10, HELD_HEAL_STATUS,     0,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_BATTLEANDFIELD

; PEARL
	item_attribute  1400, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; BIG PEARL
	item_attribute  7500, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; EVERSTONE
	item_attribute   200, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; SPELL TAG
	item_attribute   100, HELD_GHOST_BOOST,    10,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; RAGECANDYBAR
	item_attribute   300, NONE,                20,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_BATTLEANDFIELD

; GS BALL
	item_attribute     0, NONE,                 0, CANT_SELECT | CANT_TOSS, KEY_ITEM, ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; BLUE CARD
	item_attribute     0, NONE,                 0, CANT_SELECT | CANT_TOSS, KEY_ITEM, ITEMMENU_CURRENT, ITEMCONTEXT_NOTINBATTLE

; MIRACLE SEED
	item_attribute   100, HELD_GRASS_BOOST,    10,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; THICK CLUB
	item_attribute   500, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; FOCUS BAND
	item_attribute   200, HELD_FOCUS_BAND,     30,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; TERU-SAMA
	item_attribute $9999, NONE,                 0,                       0, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; ENERGYPOWDER
	item_attribute   500, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_BATTLEANDFIELD

; ENERGY ROOT
	item_attribute   800, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_BATTLEANDFIELD

; HEAL POWDER
	item_attribute   450, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_BATTLEANDFIELD

; REVIVAL HERB
	item_attribute  2800, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_BATTLEANDFIELD

; HARD STONE
	item_attribute   100, HELD_ROCK_BOOST,     10,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; LUCKY EGG
	item_attribute   200, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; CARD KEY
	item_attribute     0, NONE,                 0, CANT_SELECT | CANT_TOSS, KEY_ITEM, ITEMMENU_FIELD,   ITEMCONTEXT_NOTINBATTLE

; MACHINE PART
	item_attribute     0, NONE,                 0, CANT_SELECT | CANT_TOSS, KEY_ITEM, ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; EGG TICKET
	item_attribute     0, NONE,                 0, CANT_SELECT | CANT_TOSS, KEY_ITEM, ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; LOST ITEM
	item_attribute     0, NONE,                 0, CANT_SELECT | CANT_TOSS, KEY_ITEM, ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; STARDUST
	item_attribute  2000, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; STAR PIECE
	item_attribute  9800, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; BASEMENT KEY
	item_attribute     0, NONE,                 0, CANT_SELECT | CANT_TOSS, KEY_ITEM, ITEMMENU_FIELD,   ITEMCONTEXT_NOTINBATTLE

; PASS
	item_attribute     0, NONE,                 0, CANT_SELECT | CANT_TOSS, KEY_ITEM, ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; TERU-SAMA
	item_attribute $9999, NONE,                 0,                       0, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; TERU-SAMA
	item_attribute $9999, NONE,                 0,                       0, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; TERU-SAMA
	item_attribute $9999, NONE,                 0,                       0, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; CHARCOAL
	item_attribute  9800, HELD_FIRE_BOOST,     10,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; BERRY JUICE
	item_attribute   100, HELD_BERRY,          20,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_BATTLEANDFIELD

; SCOPE LENS
	item_attribute   200, HELD_CRITICAL_UP,     0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; TERU-SAMA
	item_attribute $9999, NONE,                 0,                       0, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; TERU-SAMA
	item_attribute $9999, NONE,                 0,                       0, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; METAL COAT
	item_attribute   100, HELD_STEEL_BOOST,    10,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; DRAGON FANG
	item_attribute   100, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; TERU-SAMA
	item_attribute $9999, NONE,                 0,                       0, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; LEFTOVERS
	item_attribute   200, HELD_LEFTOVERS,      10,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; TERU-SAMA
	item_attribute $9999, NONE,                 0,                       0, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; TERU-SAMA
	item_attribute $9999, NONE,                 0,                       0, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; TERU-SAMA
	item_attribute $9999, NONE,                 0,                       0, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; MYSTERYBERRY
	item_attribute    10, HELD_RESTORE_PP,     -1,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_BATTLEANDFIELD

; DRAGON SCALE
	item_attribute  2100, HELD_DRAGON_BOOST,   10,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; BERSERK GENE
	item_attribute   200, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; TERU-SAMA
	item_attribute $9999, NONE,                 0,                       0, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; TERU-SAMA
	item_attribute $9999, NONE,                 0,                       0, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; TERU-SAMA
	item_attribute $9999, NONE,                 0,                       0, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; SACRED ASH
	item_attribute   200, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_FIELD,   ITEMCONTEXT_NOTINBATTLE

; HEAVY BALL
	item_attribute   150, NONE,                 0,             CANT_SELECT, BALL,     ITEMMENU_NOUSE,   ITEMCONTEXT_BATTLEONLY

; FLOWER MAIL
	item_attribute    50, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; LEVEL BALL
	item_attribute   150, NONE,                 0,             CANT_SELECT, BALL,     ITEMMENU_NOUSE,   ITEMCONTEXT_BATTLEONLY

; LURE BALL
	item_attribute   150, NONE,                 0,             CANT_SELECT, BALL,     ITEMMENU_NOUSE,   ITEMCONTEXT_BATTLEONLY

; FAST BALL
	item_attribute   150, NONE,                 0,             CANT_SELECT, BALL,     ITEMMENU_NOUSE,   ITEMCONTEXT_BATTLEONLY

; TERU-SAMA
	item_attribute $9999, NONE,                 0,                       0, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; LIGHT BALL
	item_attribute   100, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; FRIEND BALL
	item_attribute   150, NONE,                 0,             CANT_SELECT, BALL,     ITEMMENU_NOUSE,   ITEMCONTEXT_BATTLEONLY

; MOON BALL
	item_attribute   150, NONE,                 0,             CANT_SELECT, BALL,     ITEMMENU_NOUSE,   ITEMCONTEXT_BATTLEONLY

; LOVE BALL
	item_attribute   150, NONE,                 0,             CANT_SELECT, BALL,     ITEMMENU_NOUSE,   ITEMCONTEXT_BATTLEONLY

; NORMAL BOX
	item_attribute    10, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_CURRENT, ITEMCONTEXT_NOTINBATTLE

; GORGEOUS BOX
	item_attribute    10, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_CURRENT, ITEMCONTEXT_NOTINBATTLE

; SUN STONE
	item_attribute  2100, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; POLKADOT BOW
	item_attribute   100, HELD_NORMAL_BOOST,   10,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; TERU-SAMA
	item_attribute $9999, NONE,                 0,                       0, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; UP-GRADE
	item_attribute  2100, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; BERRY
	item_attribute    10, HELD_BERRY,          10,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_BATTLEANDFIELD

; GOLD BERRY
	item_attribute    10, HELD_BERRY,          30,             CANT_SELECT, ITEM,     ITEMMENU_PARTY,   ITEMCONTEXT_BATTLEANDFIELD

; SQUIRTBOTTLE
	item_attribute     0, NONE,                 0, CANT_SELECT | CANT_TOSS, KEY_ITEM, ITEMMENU_FIELD,   ITEMCONTEXT_NOTINBATTLE

; TERU-SAMA
	item_attribute $9999, NONE,                 0,                       0, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; PARK BALL
	item_attribute     0, NONE,                 0,             CANT_SELECT, BALL,     ITEMMENU_NOUSE,   ITEMCONTEXT_BATTLEONLY

; RAINBOW WING
	item_attribute     0, NONE,                 0, CANT_SELECT | CANT_TOSS, KEY_ITEM, ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; TERU-SAMA
	item_attribute $9999, NONE,                 0,                       0, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; BRICK PIECE
	item_attribute    50, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; SURF MAIL
	item_attribute    50, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; LITEBLUEMAIL
	item_attribute    50, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; PORTRAITMAIL
	item_attribute    50, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; LOVELY MAIL
	item_attribute    50, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; EON MAIL
	item_attribute    50, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; MORPH MAIL
	item_attribute    50, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; BLUESKY MAIL
	item_attribute    50, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; MUSIC MAIL
	item_attribute    50, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; MIRAGE MAIL
	item_attribute    50, NONE,                 0,             CANT_SELECT, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; TERU-SAMA
	item_attribute $9999, NONE,                 0,                       0, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; TM01
	item_attribute  3000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM02
	item_attribute  2000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM03
	item_attribute  3000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM04
	item_attribute  2000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TERU-SAMA
	item_attribute $9999, NONE,                 0,                       0, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; TM05
	item_attribute  1000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM06
	item_attribute  3000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM07
	item_attribute  2000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM08
	item_attribute  1000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM09
	item_attribute  1000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM10
	item_attribute  3000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM11
	item_attribute  2000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM12
	item_attribute  1000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM13
	item_attribute  1000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM14
	item_attribute  3000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM15
	item_attribute  3000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM16
	item_attribute  3000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM17
	item_attribute  3000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM18
	item_attribute  2000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM19
	item_attribute  3000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM20
	item_attribute  3000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM21
	item_attribute  1000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM22
	item_attribute  3000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM23
	item_attribute  3000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM24
	item_attribute  3000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM25
	item_attribute  2000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM26
	item_attribute  3000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM27
	item_attribute  1000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM28
	item_attribute  2000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TERU-SAMA
	item_attribute $9999, NONE,                 0,                       0, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; TM29
	item_attribute  2000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM30
	item_attribute  3000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM31
	item_attribute  3000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM32
	item_attribute  2000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM33
	item_attribute  3000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM34
	item_attribute  1000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM35
	item_attribute  1000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM36
	item_attribute  1000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM37
	item_attribute  2000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM38
	item_attribute  2000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM39
	item_attribute  2000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM40
	item_attribute  1000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM41
	item_attribute  3000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM42
	item_attribute  3000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM43
	item_attribute  1000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM44
	item_attribute  3000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM45
	item_attribute  3000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM46
	item_attribute  3000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM47
	item_attribute  3000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM48
	item_attribute  3000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM49
	item_attribute  3000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TM50
	item_attribute  2000, NONE,                 0,             CANT_SELECT, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; HM01
	item_attribute     0, NONE,                 0, CANT_SELECT | CANT_TOSS, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; HM02
	item_attribute     0, NONE,                 0, CANT_SELECT | CANT_TOSS, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; HM03
	item_attribute     0, NONE,                 0, CANT_SELECT | CANT_TOSS, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; HM04
	item_attribute     0, NONE,                 0, CANT_SELECT | CANT_TOSS, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; HM05
	item_attribute     0, NONE,                 0, CANT_SELECT | CANT_TOSS, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; HM06
	item_attribute     0, NONE,                 0, CANT_SELECT | CANT_TOSS, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; HM07
	item_attribute     0, NONE,                 0, CANT_SELECT | CANT_TOSS, TM_HM,    ITEMMENU_PARTY,   ITEMCONTEXT_NOTINBATTLE

; TERU-SAMA
	item_attribute $9999, NONE,                 0,                       0, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; TERU-SAMA
	item_attribute $9999, NONE,                 0,                       0, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; TERU-SAMA
	item_attribute $9999, NONE,                 0,                       0, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; TERU-SAMA
	item_attribute $9999, NONE,                 0,                       0, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; TERU-SAMA
	item_attribute $9999, NONE,                 0,                       0, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; TERU-SAMA
	item_attribute $9999, NONE,                 0,                       0, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE

; ?
	item_attribute $9999, NONE,                 0,                       0, ITEM,     ITEMMENU_NOUSE,   ITEMCONTEXT_NOTINBATTLE
