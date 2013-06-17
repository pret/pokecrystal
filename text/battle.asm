BattleText_0x80730: ; 0x80730
	db $0, $52, " picked up", $4f
	db "¥@"
	deciram $c6ec, $36
	db $0, "!", $58
; 0x80746

WildPokemonAppearedText: ; 0x80746
	db $0, "Wild @"
	text_from_ram $c616
	db $0, $4f
	db "appeared!", $58
; 0x8075c

HookedPokemonAttackedText: ; 0x8075c
	db $0, "The hooked", $4f
	db "@"
	text_from_ram $c616
	db $0, $55
	db "attacked!", $58
; 0x80778

PokemonFellFromTreeText: ; 0x80778
	text_from_ram $c616
	db $0, " fell", $4f
	db "out of the tree!", $58
; 0x80793

WildPokemonAppearedText2: ; 0x80793
	db $0, "Wild @"
	text_from_ram $c616
	db $0, $4f
	db "appeared!", $58
; 0x807a9

WantsToBattleText: ; 0x807a9
	db $0, $3f, $4f
	db "wants to battle!", $58
; 0x807bd

BattleText_0x807bd: ; 0x807bd
	db $0, "Wild @"
	text_from_ram $c616
	db $0, $4f
	db "fled!", $58
; 0x807cf

BattleText_0x807cf: ; 0x807cf
	db $0, "Enemy @"
	text_from_ram $c616
	db $0, $4f
	db "fled!", $58
; 0x807e2

BattleText_0x807e2: ; 0x807e2
	db $0, $5a, $4f
	db "is hurt by poison!", $58
; 0x807f8

BattleText_0x807f8: ; 0x807f8
	db $0, $5a, "'s", $4f
	db "hurt by its burn!", $58
; 0x8080e

BattleText_0x8080e: ; 0x8080e
	db $0, "LEECH SEED saps", $4f
	db $5a, "!", $58
; 0x80822

BattleText_0x80822: ; 0x80822
	db $0, $5a, $4f
	db "has a NIGHTMARE!", $58
; 0x80836

BattleText_0x80836: ; 0x80836
	db $0, $5a, "'s", $4f
	db "hurt by the CURSE!", $58
; 0x8084d

BattleText_0x8084d: ; 0x8084d
	db $0, "The SANDSTORM hits", $4f
	db $5a, "!", $58
; 0x80864

BattleText_0x80864: ; 0x80864
	db $0, $5a, "'s", $4f
	db "PERISH count is @"
	deciram $d265, $11
	db $0, "!", $58
; 0x80880

BattleText_0x80880: ; 0x80880
	db $0, $59, $4f
	db "recovered with", $55
	db "@"
	text_from_ram StringBuffer1
	db $0, ".", $58
; 0x80899

BattleText_0x80899: ; 0x80899
	db $0, $5a, $4f
	db "recovered PP using", $55
	db "@"
	text_from_ram StringBuffer1
	db $0, ".", $58
; 0x808b6

BattleText_0x808b6: ; 0x808b6
	db $0, $59, $4f
	db "was hit by FUTURE", $55
	db "SIGHT!", $58
; 0x808d2

BattleText_0x808d2: ; 0x808d2
	db $0, $5a, "'s", $4f
	db "SAFEGUARD faded!", $58
; 0x808e7

BattleText_0x808e7: ; 0x808e7
	text_from_ram StringBuffer1
	db $0, " #MON's", $4f
	db "LIGHT SCREEN fell!", $58
; 0x80905

BattleText_0x80905: ; 0x80905
	text_from_ram StringBuffer1
	db $0, " #MON's", $4f
	db "REFLECT faded!", $58
; 0x8091f

BattleText_0x8091f: ; 0x8091f
	db $0, "Rain continues to", $4f
	db "fall.", $58
; 0x80938

BattleText_0x80938: ; 0x80938
	db $0, "The sunlight is", $4f
	db "strong.", $58
; 0x80951

BattleText_0x80951: ; 0x80951
	db $0, "The SANDSTORM", $4f
	db "rages.", $58
; 0x80967

BattleText_0x80967: ; 0x80967
	db $0, "The rain stopped.", $58
; 0x8097a

BattleText_0x8097a: ; 0x8097a
	db $0, "The sunlight", $4f
	db "faded.", $58
; 0x8098f

BattleText_0x8098f: ; 0x8098f
	db $0, "The SANDSTORM", $4f
	db "subsided.", $58
; 0x809a8

BattleText_0x809a8: ; 0x809a8
	db $0, "Enemy @"
	text_from_ram $c616
	db $0, $4f
	db "fainted!", $58
; 0x809be

BattleText_0x809be: ; 0x809be
	db $0, $52, " got ¥@"
	deciram $c686, $36
	db $0, $4f
	db "for winning!", $58
; 0x809da

BattleText_0x809da: ; 0x809da
	db $0, $3f, $4f
	db "was defeated!", $58
; 0x809eb

TiedAgainstText: ; 0x809eb
	db $0, "Tied against", $4f
	db $3f, "!", $58
; 0x809fc

BattleText_0x809fc: ; 0x809fc
	db $0, $52, " got ¥@"
	deciram $c686, $36
	db $0, $4f
	db "for winning!", $55
	db "Sent some to MOM!", $58
; 0x80a2a

BattleText_0x80a2a: ; 0x80a2a
	db $0, "Sent half to MOM!", $58
; 0x80a3d

BattleText_0x80a3d: ; 0x80a3d
	db $0, "Sent all to MOM!", $58
; 0x80a4f

BattleText_0x80a4f: ; 0x80a4f
	db $0, $53, ": Huh? I", $4f
	db "should've chosen", $55
	db "your #MON!", $58
; 0x80a75

BattleText_0x80a75: ; 0x80a75
	text_from_ram $c621
	db $0, $4f
	db "fainted!", $58
; 0x80a83

BattleText_0x80a83: ; 0x80a83
	db $0, "Use next #MON?", $57
; 0x80a93

BattleText_0x80a93: ; 0x80a93
	db $0, $53, ": Yes!", $4f
	db "I guess I chose a", $55
	db "good #MON!", $58
; 0x80ab9

LostAgainstText: ; 0x80ab9
	db $0, "Lost against", $4f
	db $3f, "!", $58
; 0x80aca

BattleText_0x80aca: ; 0x80aca
	db $0, $3f, $4f
	db "is about to use", $55
	db "@"
	text_from_ram $c616
	db $0, ".", $51
	db "Will ", $52, $4f
	db "change #MON?", $57
; 0x80af8

BattleText_0x80af8: ; 0x80af8
	db $0, $3f, $4f
	db "sent out", $55
	db "@"
	text_from_ram $c616
	db $0, "!", $57
; 0x80b0b

BattleText_0x80b0b: ; 0x80b0b
	db $0, "There's no will to", $4f
	db "battle!", $58
; 0x80b26

BattleText_0x80b26: ; 0x80b26
	db $0, "An EGG can't", $4f
	db "battle!", $58
; 0x80b3b

BattleText_0x80b3b: ; 0x80b3b
	db $0, "Can't escape!", $58
; 0x80b49

BattleText_0x80b49: ; 0x80b49
	db $0, "No! There's no", $4f
	db "running from a", $55
	db "trainer battle!", $58
; 0x80b77

BattleText_0x80b77: ; 0x80b77
	db $0, "Got away safely!", $58
; 0x80b89

BattleText_0x80b89: ; 0x80b89
	db $0, $5a, $4f
	db "fled using a", $55
	db "@"
	text_from_ram StringBuffer1
	db $0, "!", $58
; 0x80ba0

BattleText_0x80ba0: ; 0x80ba0
	db $0, "Can't escape!", $58
; 0x80bae

BattleText_0x80bae: ; 0x80bae
	db $0, $5a, "'s", $4f
	db "hurt by SPIKES!", $58
; 0x80bc2

RecoveredUsingText: ; 0x80bc2
	db $0, $59, $4f
	db "recovered using a", $55
	db "@"
	text_from_ram StringBuffer1
	db $0, "!", $58
; 0x80bde

BattleText_0x80bde: ; 0x80bde
	db $0, $5a, "'s", $4f
	db "@"
	text_from_ram StringBuffer1
	db $0, $55
	db "activated!", $58
; 0x80bf3

BattleText_0x80bf3: ; 0x80bf3
	db $0, "Items can't be", $4f
	db "used here.", $58
; 0x80c0d

BattleText_0x80c0d: ; 0x80c0d
	text_from_ram $c621
	db $0, $4f
	db "is already out.", $58
; 0x80c22

BattleText_0x80c22: ; 0x80c22
	text_from_ram $c621
	db $0, $4f
	db "can't be recalled!", $58
; 0x80c39

BattleText_0x80c39: ; 0x80c39
	db $0, "There's no PP left", $4f
	db "for this move!", $58
; 0x80c5b

BattleText_0x80c5b: ; 0x80c5b
	db $0, "The move is", $4f
	db "DISABLED!", $58
; 0x80c72

BattleText_0x80c72: ; 0x80c72
	text_from_ram $c621
	db $0, $4f
	db "has no moves left!", $57
; 0x80c8a

BattleText_0x80c8a: ; 0x80c8a
	db $0, $59, "'s", $4f
	db "ENCORE ended!", $58
; 0x80c9c

BattleText_0x80c9c: ; 0x80c9c
	text_from_ram StringBuffer1
	db $0, " grew to", $4f
	db "level @"
	deciram $d143, $13
	db $0, "!@"
	sound0
	db $50
; 0x80cb9

BattleText_0x80cb9: ; 0x80cb9
	db $50
; 0x80cba

BattleText_0x80cba: ; 0x80cba
	db $0, "Wild @"
	text_from_ram $c616
	db $0, $4f
	db "is eating!", $58
; 0x80cd1

BattleText_0x80cd1: ; 0x80cd1
	db $0, "Wild @"
	text_from_ram $c616
	db $0, $4f
	db "is angry!", $58
; 0x80ce7

FastAsleepText: ; 0x80ce7
	db $0, $5a, $4f
	db "is fast asleep!", $58
; 0x80cfa

WokeUpText: ; 0x80cfa
	db $0, $5a, $4f
	db "woke up!", $58
; 0x80d06

FrozenSolidText: ; 0x80d06
	db $0, $5a, $4f
	db "is frozen solid!", $58
; 0x80d1a

FlinchedText: ; 0x80d1a
	db $0, $5a, $4f
	db "flinched!", $58
; 0x80d27

MustRechargeText: ; 0x80d27
	db $0, $5a, $4f
	db "must recharge!", $58
; 0x80d39

DisabledNoMoreText: ; 0x80d39
	db $0, $5a, "'s", $4f
	db "disabled no more!", $58
; 0x80d4f

IsConfusedText: ; 0x80d4f
	db $0, $5a, $4f
	db "is confused!", $58
; 0x80d5f

HurtItselfText: ; 0x80d5f
	db $0, "It hurt itself in", $4f
	db "its confusion!", $58
; 0x80d81

ConfusedNoMoreText: ; 0x80d81
	db $0, $5a, "'s", $4f
	db "confused no more!", $58
; 0x80d97

BecameConfusedText: ; 0x80d97
	db $0, $59, $4f
	db "became confused!", $58
; 0x80dab

BattleText_0x80dab: ; 0x80dab
	db $0, "A @"
	text_from_ram StringBuffer1
	db $0, " rid", $4f
	db $59, $55
	db "of its confusion.", $58
; 0x80dcc

AlreadyConfusedText: ; 0x80dcc
	db $0, $59, "'s", $4f
	db "already confused!", $58
; 0x80de2

BattleText_0x80de2: ; 0x80de2
	db $0, $5a, "'s", $4f
	db "hurt by", $55
	db "@"
	text_from_ram StringBuffer1
	db $0, "!", $58
; 0x80df5

BattleText_0x80df5: ; 0x80df5
	db $0, $5a, $4f
	db "was released from", $55
	db "@"
	text_from_ram StringBuffer1
	db $0, "!", $58
; 0x80e11

UsedBindText: ; 0x80e11
	db $0, $5a, $4f
	db "used BIND on", $55
	db $59, "!", $58
; 0x80e24

WhirlpoolTrapText: ; 0x80e24
	db $0, $59, $4f
	db "was trapped!", $58
; 0x80e34

FireSpinTrapText: ; 0x80e34
	db $0, $59, $4f
	db "was trapped!", $58
; 0x80e44

WrappedByText: ; 0x80e44
	db $0, $59, $4f
	db "was WRAPPED by", $55
	db $5a, "!", $58
; 0x80e59

ClampedByText: ; 0x80e59
	db $0, $59, $4f
	db "was CLAMPED by", $55
	db $5a, "!", $58
; 0x80e6e

StoringEnergyText: ; 0x80e6e
	db $0, $5a, $4f
	db "is storing energy!", $58
; 0x80e84

UnleashedEnergyText: ; 0x80e84
	db $0, $5a, $4f
	db "unleashed energy!", $58
; 0x80e99

HungOnText: ; 0x80e99
	db $0, $59, $4f
	db "hung on with", $55
	db "@"
	text_from_ram StringBuffer1
	db $0, "!", $58
; 0x80eb0

EnduredText: ; 0x80eb0
	db $0, $59, $4f
	db "ENDURED the hit!", $58
; 0x80ec4

InLoveWithText: ; 0x80ec4
	db $0, $5a, $4f
	db "is in love with", $55
	db $59, "!", $58
; 0x80eda

InfatuationText: ; 0x80eda
	db $0, $5a, "'s", $4f
	db "infatuation kept", $55
	db "it from attacking!", $58
; 0x80f02

DisabledMoveText: ; 0x80f02
	db $0, $5a, "'s", $4f
	db "@"
	text_from_ram StringBuffer1
	db $0, " is", $55
	db "DISABLED!", $58
; 0x80f19

LoafingAroundText: ; 0x80f19
	text_from_ram $c621
	db $0, " is", $4f
	db "loafing around.", $58
; 0x80f31

BeganToNapText: ; 0x80f31
	text_from_ram $c621
	db $0, " began", $4f
	db "to nap!", $58
; 0x80f44

WontObeyText: ; 0x80f44
	text_from_ram $c621
	db $0, " won't", $4f
	db "obey!", $58
; 0x80f54

TurnedAwayText: ; 0x80f54
	text_from_ram $c621
	db $0, " turned", $4f
	db "away!", $58
; 0x80f66

IgnoredOrdersText: ; 0x80f66
	text_from_ram $c621
	db $0, " ignored", $4f
	db "orders!", $58
; 0x80f7b

IgnoredSleepingText: ; 0x80f7b
	text_from_ram $c621
	db $0, " ignored", $4f
	db "orders…sleeping!", $58
; 0x80f99

NoPPLeftText: ; 0x80f99
	db $0, "But no PP is left", $4f
	db "for the move!", $58
; 0x80fba

HasNoPPLeftText: ; 0x80fba
	db $0, $5a, $4f
	db "has no PP left for", $55
	db "@"
	text_from_ram $d086
	db $0, "!", $58
; 0x80fd7

WentToSleepText: ; 0x80fd7
	db $0, $5a, $4f
	db "went to sleep!", $57
; 0x80fe9

RestedText: ; 0x80fe9
	db $0, $5a, $4f
	db "fell asleep and", $55
	db "became healthy!", $57
; 0x8100c

RegainedHealthText: ; 0x8100c
	db $0, $5a, $4f
	db "regained health!", $58
; 0x81020

AttackMissedText: ; 0x81020
	db $0, $5a, "'s", $4f
	db "attack missed!", $58
; 0x81033

AttackMissed2Text: ; 0x81033
	db $0, $5a, "'s", $4f
	db "attack missed!", $58
; 0x81046

CrashedText: ; 0x81046
	db $0, $5a, $4f
	db "kept going and", $55
	db "crashed!", $58
; 0x81061

UnaffectedText: ; 0x81061
	db $0, $59, "'s", $4f
	db "unaffected!", $58
; 0x81071

DoesntAffectText: ; 0x81071
	db $0, "It doesn't affect", $4f
	db $59, "!", $58
; 0x81086

CriticalHitText: ; 0x81086
	db $0, "A critical hit!", $58
; 0x81097

OneHitKOText: ; 0x81097
	db $0, "It's a one-hit KO!", $58
; 0x810aa

SuperEffectiveText: ; 0x810aa
	db $0, "It's super-", $4f
	db "effective!", $58
; 0x810c1

NotVeryEffectiveText: ; 0x810c1
	db $0, "It's not very", $4f
	db "effective…", $58
; 0x810da

TookDownWithItText: ; 0x810da
	db $0, $59, $4f
	db "took down with it,", $55
	db $5a, "!", $58
; 0x810f3

RageBuildingText: ; 0x810f3
	db $0, $5a, "'s", $4f
	db "RAGE is building!", $58
; 0x81109

GotAnEncoreText: ; 0x81109
	db $0, $59, $4f
	db "got an ENCORE!", $58
; 0x8111b

SharedPainText: ; 0x8111b
	db $0, "The battlers", $4f
	db "shared pain!", $58
; 0x81136

TookAimText: ; 0x81136
	db $0, $5a, $4f
	db "took aim!", $58
; 0x81143

SketchedText: ; 0x81143
	db $0, $5a, $4f
	db "SKETCHED", $55
	db "@"
	text_from_ram StringBuffer1
	db $0, "!", $58
; 0x81156

DestinyBondEffectText: ; 0x81156
	db $0, $5a, "'s", $4f
	db "trying to take its", $55
	db "opponent with it!", $58
; 0x8117f

SpiteEffectText: ; 0x8117f
	db $0, $59, "'s", $4f
	db "@"
	text_from_ram StringBuffer1
	db $0, " was", $55
	db "reduced by @"
	deciram $d265, $11
	db $0, "!", $58
; 0x811a0

BellChimedText: ; 0x811a0
	db $0, "A bell chimed!", $4f
	db $58
; 0x811b1

FellAsleepText: ; 0x811b1
	db $0, $59, $4f
	db "fell asleep!", $58
; 0x811c1

AlreadyAsleepText: ; 0x811c1
	db $0, $59, "'s", $4f
	db "already asleep!", $58
; 0x811d5

WasPoisonedText: ; 0x811d5
	db $0, $59, $4f
	db "was poisoned!", $58
; 0x811e6

BadlyPoisonedText: ; 0x811e6
	db $0, $59, "'s", $4f
	db "badly poisoned!", $58
; 0x811fa

AlreadyPoisonedText: ; 0x811fa
	db $0, $59, "'s", $4f
	db "already poisoned!", $58
; 0x81210

SuckedHealthText: ; 0x81210
	db $0, "Sucked health from", $4f
	db $59, "!", $58
; 0x81227

DreamEatenText: ; 0x81227
	db $0, $59, "'s", $4f
	db "dream was eaten!", $58
; 0x8123c

WasBurnedText: ; 0x8123c
	db $0, $59, $4f
	db "was burned!", $58
; 0x8124b

DefrostedOpponentText: ; 0x8124b
	db $0, $59, $4f
	db "was defrosted!", $58
; 0x8125d

WasFrozenText: ; 0x8125d
	db $0, $59, $4f
	db "was frozen solid!", $58
; 0x81272

WontRiseAnymoreText: ; 0x81272
	db $0, $5a, "'s", $4f
	db "@"
	text_from_ram $d086
	db $0, " won't", $55
	db "rise anymore!", $58
; 0x8128f

WontDropAnymoreText: ; 0x8128f
	db $0, $59, "'s", $4f
	db "@"
	text_from_ram $d086
	db $0, " won't", $55
	db "drop anymore!", $58
; 0x812ac

FledFromBattleText: ; 0x812ac
	db $0, $5a, $4f
	db "fled from battle!", $58
; 0x812c1

FledInFearText: ; 0x812c1
	db $0, $59, $4f
	db "fled in fear!", $58
; 0x812d2

BlownAwayText: ; 0x812d2
	db $0, $59, $4f
	db "was blown away!", $58
; 0x812e5

PlayerHitTimesText: ; 0x812e5
	db $0, "Hit @"
	deciram $c682, $11
	db $0, " times!", $58
; 0x812f8

EnemyHitTimesText: ; 0x812f8
	db $0, "Hit @"
	deciram $c684, $11
	db $0, " times!", $58
; 0x8130b

MistText: ; 0x8130b
	db $0, $5a, "'s", $4f
	db "shrouded in MIST!", $58
; 0x81321

ProtectedByMistText: ; 0x81321
	db $0, $59, "'s", $4f
	db "protected by MIST.", $58
; 0x81338

GettingPumpedText: ; 0x81338
	interpret_data
	db $0, $5a, "'s", $4f
	db "getting pumped!", $58
; 0x8134d

RecoilText: ; 0x8134d
	db $0, $5a, "'s", $4f
	db "hit with recoil!", $58
; 0x81362

MadeSubstituteText: ; 0x81362
	db $0, $5a, $4f
	db "made a SUBSTITUTE!", $58
; 0x81378

HasSubstituteText: ; 0x81378
	db $0, $5a, $4f
	db "has a SUBSTITUTE!", $58
; 0x8138d

TooWeakSubText: ; 0x8138d
	db $0, "Too weak to make", $4f
	db "a SUBSTITUTE!", $58
; 0x813ad

SubTookDamageText: ; 0x813ad
	db $0, "The SUBSTITUTE", $4f
	db "took damage for", $55
	db $59, "!", $58
; 0x813d0

SubFadedText: ; 0x813d0
	db $0, $59, "'s", $4f
	db "SUBSTITUTE faded!", $58
; 0x813e6

LearnedMoveText: ; 0x813e6
	db $0, $5a, $4f
	db "learned", $55
	db "@"
	text_from_ram StringBuffer1
	db $0, "!", $58
; 0x813f8

WasSeededText: ; 0x813f8
	db $0, $59, $4f
	db "was seeded!", $58
; 0x81407

EvadedText: ; 0x81407
	db $0, $59, $4f
	db "evaded the attack!", $58
; 0x8141d

WasDisabledText: ; 0x8141d
	db $0, $59, "'s", $4f
	db "@"
	text_from_ram StringBuffer1
	db $0, " was", $55
	db "DISABLED!", $58
; 0x81435

CoinsScatteredText: ; 0x81435
	db $0, "Coins scattered", $4f
	db "everywhere!", $58
; 0x81452

TransformedTypeText: ; 0x81452
	db $0, $5a, $4f
	db "transformed into", $55
	db "the @"
	text_from_ram StringBuffer1
	db $0, "-type!", $58
; 0x81476

EliminatedStatsText: ; 0x81476
	db $0, "All stat changes", $4f
	db "were eliminated!", $58
; 0x81499

TransformedText: ; 0x81499
	db $0, $5a, $4f
	db "TRANSFORMED into", $55
	db "@"
	text_from_ram StringBuffer1
	db $0, "!", $58
; 0x814b4

LightScreenEffectText: ; 0x814b4
	db $0, $5a, "'s", $4f
	db "SPCL.DEF rose!", $58
; 0x814c7

ReflectEffectText: ; 0x814c7
	db $0, $5a, "'s", $4f
	db "DEFENSE rose!", $58
; 0x814d9

NothingHappenedText: ; 0x814d9
	db $0, "But nothing", $4f
	db "happened.", $58
; 0x814f0

ButItFailedText: ; 0x814f0
	db $0, "But it failed!", $58
; 0x81500

ItFailedText: ; 0x81500
	db $0, "It failed!", $58
; 0x8150c

DidntAffect1Text: ; 0x8150c
	db $0, "It didn't affect", $4f
	db $59, "!", $58
; 0x81520

DidntAffect2Text: ; 0x81520
	db $0, "It didn't affect", $4f
	db $59, "!", $58
; 0x81534

HPIsFullText: ; 0x81534
	db $0, $5a, "'s", $4f
	db "HP is full!", $58
; 0x81544

DraggedOutText: ; 0x81544
	db $0, $5a, $4f
	db "was dragged out!", $58
; 0x81558

ParalyzedText: ; 0x81558
	db $0, $59, "'s", $4f
	db "paralyzed! Maybe", $55
	db "it can't attack!", $58
; 0x8157d

FullyParalyzedText: ; 0x8157d
	db $0, $5a, "'s", $4f
	db "fully paralyzed!", $58
; 0x81592

AlreadyParalyzedText: ; 0x81592
	db $0, $59, "'s", $4f
	db "already paralyzed!", $58
; 0x815a9

ProtectedByText: ; 0x815a9
	db $0, $59, "'s", $4f
	db "protected by", $55
	db "@"
	text_from_ram StringBuffer1
	db $0, "!", $58
; 0x815c1

MirrorMoveFailedText: ; 0x815c1
	db $0, "The MIRROR MOVE", $4e, "failed!", $58
; 0x815da

StoleText: ; 0x815da
	db $0, $5a, $4f
	db "stole @"
	text_from_ram StringBuffer1
	db $0, $55
	db "from its foe!", $58
; 0x815f7

CantEscapeNowText: ; 0x815f7
	db $0, $59, $4f
	db "can't escape now!", $58
; 0x8160b

StartedNightmareText: ; 0x8160b
	db $0, $59, $4f
	db "started to have a", $55
	db "NIGHTMARE!", $58
; 0x8162b

WasDefrostedText: ; 0x8162b
	db $0, $5a, $4f
	db "was defrosted!", $58
; 0x8163d

PutACurseText: ; 0x8163d
	db $0, $5a, $4f
	db "cut its own HP and", $51
	db "put a CURSE on", $4f
	db $59, "!", $58
; 0x81665

ProtectedItselfText: ; 0x81665
	db $0, $5a, $4f
	db "PROTECTED itself!", $58
; 0x8167a

ProtectingItselfText: ; 0x8167a
	db $0, $59, "'s", $4f
	db "PROTECTING itself!", $57
; 0x81691

SpikesText: ; 0x81691
	db $0, "SPIKES scattered", $4f
	db "all around", $55
	db $59, "!", $58
; 0x816b1

IdentifiedText: ; 0x816b1
	db $0, $5a, $4f
	db "identified", $55
	db $59, "!", $58
; 0x816c2

StartPerishText: ; 0x816c2
	db $0, "Both #MON will", $4f
	db "faint in 3 turns!", $58
; 0x816e4

SandstormBrewedText: ; 0x816e4
	db $0, "A SANDSTORM", $4f
	db "brewed!", $58
; 0x816f9

BracedItselfText: ; 0x816f9
	db $0, $5a, $4f
	db "braced itself!", $58
; 0x8170b

FellInLoveText: ; 0x8170b
	db $0, $59, $4f
	db "fell in love!", $58
; 0x8171c

CoveredByVeilText: ; 0x8171c
	db $0, $5a, "'s", $4f
	db "covered by a veil!", $58
; 0x81733

SafeguardProtectText: ; 0x81733
	db $0, $59, $4f
	db "is protected by", $55
	db "SAFEGUARD!", $58
; 0x81751

MagnitudeText: ; 0x81751
	db $0, "Magnitude @"
	deciram $d265, $11
	db $0, "!", $58
; 0x81764

ReleasedByText: ; 0x81764
	db $0, $5a, $4f
	db "was released by", $55
	db $59, "!", $58
; 0x8177a

ShedLeechSeedText: ; 0x8177a
	db $0, $5a, $4f
	db "shed LEECH SEED!", $58
; 0x8178e

BlewSpikesText: ; 0x8178e
	db $0, $5a, $4f
	db "blew away SPIKES!", $58
; 0x817a3

DownpourText: ; 0x817a3
	db $0, "A downpour", $4f
	db "started!", $58
; 0x817b8

SunGotBrightText: ; 0x817b8
	db $0, "The sunlight got", $4f
	db "bright!", $58
; 0x817d2

BellyDrumText: ; 0x817d2
	db $0, $5a, $4f
	db "cut its HP and", $55
	db "maximized ATTACK!", $58
; 0x817f6

CopiedStatsText: ; 0x817f6
	db $0, $5a, $4f
	db "copied the stat", $51
	db "changes of", $4f
	db $59, "!", $58
; 0x81817

ForesawAttackText: ; 0x81817
	db $0, $5a, $4f
	db "foresaw an attack!", $58
; 0x8182d

BeatUpAttackText: ; 0x8182d
	text_from_ram StringBuffer1
	db $0, "'s", $4f
	db "attack!", $57
; 0x8183b

RefusedGiftText: ; 0x8183b
	db $0, $59, $4f
	db "refused the gift!", $58
; 0x81850

IgnoredOrders2Text: ; 0x81850
	db $0, $5a, $4f
	db "ignored orders!", $58
; 0x81863

BattleText_0x81863: ; 0x81863
	db $0, "Link error…", $51
	db "The battle has", $4f
	db "been canceled…", $58
; 0x8188e

BattleText_0x8188e: ; 0x8188e
	db $0, "There is no time", $4f
	db "left today!", $57
; 0x818ac
