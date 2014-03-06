BattleText_0x80730: ; 0x80730
	text $52, " picked up"
	line "¥@"
	deciram $c6ec, $36
	text "!"
	prompt
; 0x80746

WildPokemonAppearedText: ; 0x80746
	text "Wild @"
	text_from_ram $c616
	db $0
	line "appeared!"
	prompt
; 0x8075c

HookedPokemonAttackedText: ; 0x8075c
	text "The hooked"
	line "@"
	text_from_ram $c616
	text $55
	db "attacked!"
	prompt
; 0x80778

PokemonFellFromTreeText: ; 0x80778
	text_from_ram $c616
	text " fell"
	line "out of the tree!"
	prompt
; 0x80793

WildPokemonAppearedText2: ; 0x80793
	text "Wild @"
	text_from_ram $c616
	db $0
	line "appeared!"
	prompt
; 0x807a9

WantsToBattleText:: ; 0x807a9
	text $3f
	line "wants to battle!"
	prompt
; 0x807bd

BattleText_0x807bd: ; 0x807bd
	text "Wild @"
	text_from_ram $c616
	db $0
	line "fled!"
	prompt
; 0x807cf

BattleText_0x807cf: ; 0x807cf
	text "Enemy @"
	text_from_ram $c616
	db $0
	line "fled!"
	prompt
; 0x807e2

BattleText_0x807e2: ; 0x807e2
	text $5a
	line "is hurt by poison!"
	prompt
; 0x807f8

BattleText_0x807f8: ; 0x807f8
	text $5a, "'s"
	line "hurt by its burn!"
	prompt
; 0x8080e

BattleText_0x8080e: ; 0x8080e
	text "LEECH SEED saps"
	line $5a, "!"
	prompt
; 0x80822

BattleText_0x80822: ; 0x80822
	text $5a
	line "has a NIGHTMARE!"
	prompt
; 0x80836

BattleText_0x80836: ; 0x80836
	text $5a, "'s"
	line "hurt by the CURSE!"
	prompt
; 0x8084d

BattleText_0x8084d: ; 0x8084d
	text "The SANDSTORM hits"
	line $5a, "!"
	prompt
; 0x80864

BattleText_0x80864: ; 0x80864
	text $5a, "'s"
	line "PERISH count is @"
	deciram $d265, $11
	text "!"
	prompt
; 0x80880

BattleText_0x80880: ; 0x80880
	text $59
	line "recovered with"
	cont "@"
	text_from_ram StringBuffer1
	text "."
	prompt
; 0x80899

BattleText_0x80899: ; 0x80899
	text $5a
	line "recovered PP using"
	cont "@"
	text_from_ram StringBuffer1
	text "."
	prompt
; 0x808b6

BattleText_0x808b6: ; 0x808b6
	text $59
	line "was hit by FUTURE"
	cont "SIGHT!"
	prompt
; 0x808d2

BattleText_0x808d2: ; 0x808d2
	text $5a, "'s"
	line "SAFEGUARD faded!"
	prompt
; 0x808e7

BattleText_0x808e7: ; 0x808e7
	text_from_ram StringBuffer1
	text " #MON's"
	line "LIGHT SCREEN fell!"
	prompt
; 0x80905

BattleText_0x80905: ; 0x80905
	text_from_ram StringBuffer1
	text " #MON's"
	line "REFLECT faded!"
	prompt
; 0x8091f

BattleText_0x8091f: ; 0x8091f
	text "Rain continues to"
	line "fall."
	prompt
; 0x80938

BattleText_0x80938: ; 0x80938
	text "The sunlight is"
	line "strong."
	prompt
; 0x80951

BattleText_0x80951: ; 0x80951
	text "The SANDSTORM"
	line "rages."
	prompt
; 0x80967

BattleText_0x80967: ; 0x80967
	text "The rain stopped."
	prompt
; 0x8097a

BattleText_0x8097a: ; 0x8097a
	text "The sunlight"
	line "faded."
	prompt
; 0x8098f

BattleText_0x8098f: ; 0x8098f
	text "The SANDSTORM"
	line "subsided."
	prompt
; 0x809a8

BattleText_0x809a8: ; 0x809a8
	text "Enemy @"
	text_from_ram $c616
	db $0
	line "fainted!"
	prompt
; 0x809be

BattleText_0x809be: ; 0x809be
	text $52, " got ¥@"
	deciram $c686, $36
	db $0
	line "for winning!"
	prompt
; 0x809da

BattleText_0x809da: ; 0x809da
	text $3f
	line "was defeated!"
	prompt
; 0x809eb

TiedAgainstText: ; 0x809eb
	text "Tied against"
	line $3f, "!"
	prompt
; 0x809fc

BattleText_0x809fc: ; 0x809fc
	text $52, " got ¥@"
	deciram $c686, $36
	db $0
	line "for winning!"
	cont "Sent some to MOM!"
	prompt
; 0x80a2a

BattleText_0x80a2a: ; 0x80a2a
	text "Sent half to MOM!"
	prompt
; 0x80a3d

BattleText_0x80a3d: ; 0x80a3d
	text "Sent all to MOM!"
	prompt
; 0x80a4f

BattleText_0x80a4f: ; 0x80a4f
	text $53, ": Huh? I"
	line "should've chosen"
	cont "your #MON!"
	prompt
; 0x80a75

BattleText_0x80a75: ; 0x80a75
	text_from_ram $c621
	db $0
	line "fainted!"
	prompt
; 0x80a83

BattleText_0x80a83: ; 0x80a83
	text "Use next #MON?"
	done
; 0x80a93

BattleText_0x80a93: ; 0x80a93
	text $53, ": Yes!"
	line "I guess I chose a"
	cont "good #MON!"
	prompt
; 0x80ab9

LostAgainstText: ; 0x80ab9
	text "Lost against"
	line $3f, "!"
	prompt
; 0x80aca

BattleText_0x80aca: ; 0x80aca
	text $3f
	line "is about to use"
	cont "@"
	text_from_ram $c616
	text "."

	para "Will ", $52
	line "change #MON?"
	done
; 0x80af8

BattleText_0x80af8: ; 0x80af8
	text $3f
	line "sent out"
	cont "@"
	text_from_ram $c616
	text "!"
	done
; 0x80b0b

BattleText_0x80b0b: ; 0x80b0b
	text "There's no will to"
	line "battle!"
	prompt
; 0x80b26

BattleText_0x80b26: ; 0x80b26
	text "An EGG can't"
	line "battle!"
	prompt
; 0x80b3b

BattleText_0x80b3b: ; 0x80b3b
	text "Can't escape!"
	prompt
; 0x80b49

BattleText_0x80b49: ; 0x80b49
	text "No! There's no"
	line "running from a"
	cont "trainer battle!"
	prompt
; 0x80b77

BattleText_0x80b77: ; 0x80b77
	text "Got away safely!"
	prompt
; 0x80b89

BattleText_0x80b89: ; 0x80b89
	text $5a
	line "fled using a"
	cont "@"
	text_from_ram StringBuffer1
	text "!"
	prompt
; 0x80ba0

BattleText_0x80ba0: ; 0x80ba0
	text "Can't escape!"
	prompt
; 0x80bae

BattleText_0x80bae: ; 0x80bae
	text $5a, "'s"
	line "hurt by SPIKES!"
	prompt
; 0x80bc2

RecoveredUsingText: ; 0x80bc2
	text $59
	line "recovered using a"
	cont "@"
	text_from_ram StringBuffer1
	text "!"
	prompt
; 0x80bde

BattleText_0x80bde: ; 0x80bde
	text $5a, "'s"
	line "@"
	text_from_ram StringBuffer1
	text $55
	db "activated!"
	prompt
; 0x80bf3

BattleText_0x80bf3: ; 0x80bf3
	text "Items can't be"
	line "used here."
	prompt
; 0x80c0d

BattleText_0x80c0d: ; 0x80c0d
	text_from_ram $c621
	db $0
	line "is already out."
	prompt
; 0x80c22

BattleText_0x80c22: ; 0x80c22
	text_from_ram $c621
	db $0
	line "can't be recalled!"
	prompt
; 0x80c39

BattleText_0x80c39: ; 0x80c39
	text "There's no PP left"
	line "for this move!"
	prompt
; 0x80c5b

BattleText_0x80c5b: ; 0x80c5b
	text "The move is"
	line "DISABLED!"
	prompt
; 0x80c72

BattleText_0x80c72: ; 0x80c72
	text_from_ram $c621
	db $0
	line "has no moves left!"
	done
; 0x80c8a

BattleText_0x80c8a: ; 0x80c8a
	text $59, "'s"
	line "ENCORE ended!"
	prompt
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
	text "Wild @"
	text_from_ram $c616
	db $0
	line "is eating!"
	prompt
; 0x80cd1

BattleText_0x80cd1: ; 0x80cd1
	text "Wild @"
	text_from_ram $c616
	db $0
	line "is angry!"
	prompt
; 0x80ce7

FastAsleepText: ; 0x80ce7
	text $5a
	line "is fast asleep!"
	prompt
; 0x80cfa

WokeUpText: ; 0x80cfa
	text $5a
	line "woke up!"
	prompt
; 0x80d06

FrozenSolidText: ; 0x80d06
	text $5a
	line "is frozen solid!"
	prompt
; 0x80d1a

FlinchedText: ; 0x80d1a
	text $5a
	line "flinched!"
	prompt
; 0x80d27

MustRechargeText: ; 0x80d27
	text $5a
	line "must recharge!"
	prompt
; 0x80d39

DisabledNoMoreText: ; 0x80d39
	text $5a, "'s"
	line "disabled no more!"
	prompt
; 0x80d4f

IsConfusedText: ; 0x80d4f
	text $5a
	line "is confused!"
	prompt
; 0x80d5f

HurtItselfText: ; 0x80d5f
	text "It hurt itself in"
	line "its confusion!"
	prompt
; 0x80d81

ConfusedNoMoreText: ; 0x80d81
	text $5a, "'s"
	line "confused no more!"
	prompt
; 0x80d97

BecameConfusedText: ; 0x80d97
	text $59
	line "became confused!"
	prompt
; 0x80dab

BattleText_0x80dab: ; 0x80dab
	text "A @"
	text_from_ram StringBuffer1
	text " rid"
	line $59
	cont "of its confusion."
	prompt
; 0x80dcc

AlreadyConfusedText: ; 0x80dcc
	text $59, "'s"
	line "already confused!"
	prompt
; 0x80de2

BattleText_0x80de2: ; 0x80de2
	text $5a, "'s"
	line "hurt by"
	cont "@"
	text_from_ram StringBuffer1
	text "!"
	prompt
; 0x80df5

BattleText_0x80df5: ; 0x80df5
	text $5a
	line "was released from"
	cont "@"
	text_from_ram StringBuffer1
	text "!"
	prompt
; 0x80e11

UsedBindText: ; 0x80e11
	text $5a
	line "used BIND on"
	cont $59, "!"
	prompt
; 0x80e24

WhirlpoolTrapText: ; 0x80e24
	text $59
	line "was trapped!"
	prompt
; 0x80e34

FireSpinTrapText: ; 0x80e34
	text $59
	line "was trapped!"
	prompt
; 0x80e44

WrappedByText: ; 0x80e44
	text $59
	line "was WRAPPED by"
	cont $5a, "!"
	prompt
; 0x80e59

ClampedByText: ; 0x80e59
	text $59
	line "was CLAMPED by"
	cont $5a, "!"
	prompt
; 0x80e6e

StoringEnergyText: ; 0x80e6e
	text $5a
	line "is storing energy!"
	prompt
; 0x80e84

UnleashedEnergyText: ; 0x80e84
	text $5a
	line "unleashed energy!"
	prompt
; 0x80e99

HungOnText: ; 0x80e99
	text $59
	line "hung on with"
	cont "@"
	text_from_ram StringBuffer1
	text "!"
	prompt
; 0x80eb0

EnduredText: ; 0x80eb0
	text $59
	line "ENDURED the hit!"
	prompt
; 0x80ec4

InLoveWithText: ; 0x80ec4
	text $5a
	line "is in love with"
	cont $59, "!"
	prompt
; 0x80eda

InfatuationText: ; 0x80eda
	text $5a, "'s"
	line "infatuation kept"
	cont "it from attacking!"
	prompt
; 0x80f02

DisabledMoveText: ; 0x80f02
	text $5a, "'s"
	line "@"
	text_from_ram StringBuffer1
	text " is"
	cont "DISABLED!"
	prompt
; 0x80f19

LoafingAroundText: ; 0x80f19
	text_from_ram $c621
	text " is"
	line "loafing around."
	prompt
; 0x80f31

BeganToNapText: ; 0x80f31
	text_from_ram $c621
	text " began"
	line "to nap!"
	prompt
; 0x80f44

WontObeyText: ; 0x80f44
	text_from_ram $c621
	text " won't"
	line "obey!"
	prompt
; 0x80f54

TurnedAwayText: ; 0x80f54
	text_from_ram $c621
	text " turned"
	line "away!"
	prompt
; 0x80f66

IgnoredOrdersText: ; 0x80f66
	text_from_ram $c621
	text " ignored"
	line "orders!"
	prompt
; 0x80f7b

IgnoredSleepingText: ; 0x80f7b
	text_from_ram $c621
	text " ignored"
	line "orders…sleeping!"
	prompt
; 0x80f99

NoPPLeftText: ; 0x80f99
	text "But no PP is left"
	line "for the move!"
	prompt
; 0x80fba

HasNoPPLeftText: ; 0x80fba
	text $5a
	line "has no PP left for"
	cont "@"
	text_from_ram $d086
	text "!"
	prompt
; 0x80fd7

WentToSleepText: ; 0x80fd7
	text $5a
	line "went to sleep!"
	done
; 0x80fe9

RestedText: ; 0x80fe9
	text $5a
	line "fell asleep and"
	cont "became healthy!"
	done
; 0x8100c

RegainedHealthText: ; 0x8100c
	text $5a
	line "regained health!"
	prompt
; 0x81020

AttackMissedText: ; 0x81020
	text $5a, "'s"
	line "attack missed!"
	prompt
; 0x81033

AttackMissed2Text: ; 0x81033
	text $5a, "'s"
	line "attack missed!"
	prompt
; 0x81046

CrashedText: ; 0x81046
	text $5a
	line "kept going and"
	cont "crashed!"
	prompt
; 0x81061

UnaffectedText: ; 0x81061
	text $59, "'s"
	line "unaffected!"
	prompt
; 0x81071

DoesntAffectText: ; 0x81071
	text "It doesn't affect"
	line $59, "!"
	prompt
; 0x81086

CriticalHitText: ; 0x81086
	text "A critical hit!"
	prompt
; 0x81097

OneHitKOText: ; 0x81097
	text "It's a one-hit KO!"
	prompt
; 0x810aa

SuperEffectiveText: ; 0x810aa
	text "It's super-"
	line "effective!"
	prompt
; 0x810c1

NotVeryEffectiveText: ; 0x810c1
	text "It's not very"
	line "effective…"
	prompt
; 0x810da

TookDownWithItText: ; 0x810da
	text $59
	line "took down with it,"
	cont $5a, "!"
	prompt
; 0x810f3

RageBuildingText: ; 0x810f3
	text $5a, "'s"
	line "RAGE is building!"
	prompt
; 0x81109

GotAnEncoreText: ; 0x81109
	text $59
	line "got an ENCORE!"
	prompt
; 0x8111b

SharedPainText: ; 0x8111b
	text "The battlers"
	line "shared pain!"
	prompt
; 0x81136

TookAimText: ; 0x81136
	text $5a
	line "took aim!"
	prompt
; 0x81143

SketchedText: ; 0x81143
	text $5a
	line "SKETCHED"
	cont "@"
	text_from_ram StringBuffer1
	text "!"
	prompt
; 0x81156

DestinyBondEffectText: ; 0x81156
	text $5a, "'s"
	line "trying to take its"
	cont "opponent with it!"
	prompt
; 0x8117f

SpiteEffectText: ; 0x8117f
	text $59, "'s"
	line "@"
	text_from_ram StringBuffer1
	text " was"
	cont "reduced by @"
	deciram $d265, $11
	text "!"
	prompt
; 0x811a0

BellChimedText: ; 0x811a0
	db $0, "A bell chimed!", $4f
	db $58
; 0x811b1

FellAsleepText: ; 0x811b1
	text $59
	line "fell asleep!"
	prompt
; 0x811c1

AlreadyAsleepText: ; 0x811c1
	text $59, "'s"
	line "already asleep!"
	prompt
; 0x811d5

WasPoisonedText: ; 0x811d5
	text $59
	line "was poisoned!"
	prompt
; 0x811e6

BadlyPoisonedText: ; 0x811e6
	text $59, "'s"
	line "badly poisoned!"
	prompt
; 0x811fa

AlreadyPoisonedText: ; 0x811fa
	text $59, "'s"
	line "already poisoned!"
	prompt
; 0x81210

SuckedHealthText: ; 0x81210
	text "Sucked health from"
	line $59, "!"
	prompt
; 0x81227

DreamEatenText: ; 0x81227
	text $59, "'s"
	line "dream was eaten!"
	prompt
; 0x8123c

WasBurnedText: ; 0x8123c
	text $59
	line "was burned!"
	prompt
; 0x8124b

DefrostedOpponentText: ; 0x8124b
	text $59
	line "was defrosted!"
	prompt
; 0x8125d

WasFrozenText: ; 0x8125d
	text $59
	line "was frozen solid!"
	prompt
; 0x81272

WontRiseAnymoreText: ; 0x81272
	text $5a, "'s"
	line "@"
	text_from_ram $d086
	text " won't"
	cont "rise anymore!"
	prompt
; 0x8128f

WontDropAnymoreText: ; 0x8128f
	text $59, "'s"
	line "@"
	text_from_ram $d086
	text " won't"
	cont "drop anymore!"
	prompt
; 0x812ac

FledFromBattleText:: ; 0x812ac
	text $5a
	line "fled from battle!"
	prompt
; 0x812c1

FledInFearText: ; 0x812c1
	text $59
	line "fled in fear!"
	prompt
; 0x812d2

BlownAwayText: ; 0x812d2
	text $59
	line "was blown away!"
	prompt
; 0x812e5

PlayerHitTimesText: ; 0x812e5
	text "Hit @"
	deciram $c682, $11
	text " times!"
	prompt
; 0x812f8

EnemyHitTimesText: ; 0x812f8
	text "Hit @"
	deciram $c684, $11
	text " times!"
	prompt
; 0x8130b

MistText: ; 0x8130b
	text $5a, "'s"
	line "shrouded in MIST!"
	prompt
; 0x81321

ProtectedByMistText: ; 0x81321
	text $59, "'s"
	line "protected by MIST."
	prompt
; 0x81338

GettingPumpedText: ; 0x81338
	interpret_data
	text $5a, "'s"
	line "getting pumped!"
	prompt
; 0x8134d

RecoilText: ; 0x8134d
	text $5a, "'s"
	line "hit with recoil!"
	prompt
; 0x81362

MadeSubstituteText: ; 0x81362
	text $5a
	line "made a SUBSTITUTE!"
	prompt
; 0x81378

HasSubstituteText: ; 0x81378
	text $5a
	line "has a SUBSTITUTE!"
	prompt
; 0x8138d

TooWeakSubText: ; 0x8138d
	text "Too weak to make"
	line "a SUBSTITUTE!"
	prompt
; 0x813ad

SubTookDamageText: ; 0x813ad
	text "The SUBSTITUTE"
	line "took damage for"
	cont $59, "!"
	prompt
; 0x813d0

SubFadedText: ; 0x813d0
	text $59, "'s"
	line "SUBSTITUTE faded!"
	prompt
; 0x813e6

LearnedMoveText: ; 0x813e6
	text $5a
	line "learned"
	cont "@"
	text_from_ram StringBuffer1
	text "!"
	prompt
; 0x813f8

WasSeededText: ; 0x813f8
	text $59
	line "was seeded!"
	prompt
; 0x81407

EvadedText: ; 0x81407
	text $59
	line "evaded the attack!"
	prompt
; 0x8141d

WasDisabledText: ; 0x8141d
	text $59, "'s"
	line "@"
	text_from_ram StringBuffer1
	text " was"
	cont "DISABLED!"
	prompt
; 0x81435

CoinsScatteredText: ; 0x81435
	text "Coins scattered"
	line "everywhere!"
	prompt
; 0x81452

TransformedTypeText: ; 0x81452
	text $5a
	line "transformed into"
	cont "the @"
	text_from_ram StringBuffer1
	text "-type!"
	prompt
; 0x81476

EliminatedStatsText: ; 0x81476
	text "All stat changes"
	line "were eliminated!"
	prompt
; 0x81499

TransformedText: ; 0x81499
	text $5a
	line "TRANSFORMED into"
	cont "@"
	text_from_ram StringBuffer1
	text "!"
	prompt
; 0x814b4

LightScreenEffectText: ; 0x814b4
	text $5a, "'s"
	line "SPCL.DEF rose!"
	prompt
; 0x814c7

ReflectEffectText: ; 0x814c7
	text $5a, "'s"
	line "DEFENSE rose!"
	prompt
; 0x814d9

NothingHappenedText: ; 0x814d9
	text "But nothing"
	line "happened."
	prompt
; 0x814f0

ButItFailedText: ; 0x814f0
	text "But it failed!"
	prompt
; 0x81500

ItFailedText: ; 0x81500
	text "It failed!"
	prompt
; 0x8150c

DidntAffect1Text: ; 0x8150c
	text "It didn't affect"
	line $59, "!"
	prompt
; 0x81520

DidntAffect2Text: ; 0x81520
	text "It didn't affect"
	line $59, "!"
	prompt
; 0x81534

HPIsFullText: ; 0x81534
	text $5a, "'s"
	line "HP is full!"
	prompt
; 0x81544

DraggedOutText: ; 0x81544
	text $5a
	line "was dragged out!"
	prompt
; 0x81558

ParalyzedText: ; 0x81558
	text $59, "'s"
	line "paralyzed! Maybe"
	cont "it can't attack!"
	prompt
; 0x8157d

FullyParalyzedText: ; 0x8157d
	text $5a, "'s"
	line "fully paralyzed!"
	prompt
; 0x81592

AlreadyParalyzedText: ; 0x81592
	text $59, "'s"
	line "already paralyzed!"
	prompt
; 0x815a9

ProtectedByText: ; 0x815a9
	text $59, "'s"
	line "protected by"
	cont "@"
	text_from_ram StringBuffer1
	text "!"
	prompt
; 0x815c1

MirrorMoveFailedText: ; 0x815c1
	text "The MIRROR MOVE", $4e, "failed!"
	prompt
; 0x815da

StoleText: ; 0x815da
	text $5a
	line "stole @"
	text_from_ram StringBuffer1
	text $55
	db "from its foe!"
	prompt
; 0x815f7

CantEscapeNowText: ; 0x815f7
	text $59
	line "can't escape now!"
	prompt
; 0x8160b

StartedNightmareText: ; 0x8160b
	text $59
	line "started to have a"
	cont "NIGHTMARE!"
	prompt
; 0x8162b

WasDefrostedText: ; 0x8162b
	text $5a
	line "was defrosted!"
	prompt
; 0x8163d

PutACurseText: ; 0x8163d
	text $5a
	line "cut its own HP and"

	para "put a CURSE on"
	line $59, "!"
	prompt
; 0x81665

ProtectedItselfText: ; 0x81665
	text $5a
	line "PROTECTED itself!"
	prompt
; 0x8167a

ProtectingItselfText: ; 0x8167a
	text $59, "'s"
	line "PROTECTING itself!"
	done
; 0x81691

SpikesText: ; 0x81691
	text "SPIKES scattered"
	line "all around"
	cont $59, "!"
	prompt
; 0x816b1

IdentifiedText: ; 0x816b1
	text $5a
	line "identified"
	cont $59, "!"
	prompt
; 0x816c2

StartPerishText: ; 0x816c2
	text "Both #MON will"
	line "faint in 3 turns!"
	prompt
; 0x816e4

SandstormBrewedText: ; 0x816e4
	text "A SANDSTORM"
	line "brewed!"
	prompt
; 0x816f9

BracedItselfText: ; 0x816f9
	text $5a
	line "braced itself!"
	prompt
; 0x8170b

FellInLoveText: ; 0x8170b
	text $59
	line "fell in love!"
	prompt
; 0x8171c

CoveredByVeilText: ; 0x8171c
	text $5a, "'s"
	line "covered by a veil!"
	prompt
; 0x81733

SafeguardProtectText: ; 0x81733
	text $59
	line "is protected by"
	cont "SAFEGUARD!"
	prompt
; 0x81751

MagnitudeText: ; 0x81751
	text "Magnitude @"
	deciram $d265, $11
	text "!"
	prompt
; 0x81764

ReleasedByText: ; 0x81764
	text $5a
	line "was released by"
	cont $59, "!"
	prompt
; 0x8177a

ShedLeechSeedText: ; 0x8177a
	text $5a
	line "shed LEECH SEED!"
	prompt
; 0x8178e

BlewSpikesText: ; 0x8178e
	text $5a
	line "blew away SPIKES!"
	prompt
; 0x817a3

DownpourText: ; 0x817a3
	text "A downpour"
	line "started!"
	prompt
; 0x817b8

SunGotBrightText: ; 0x817b8
	text "The sunlight got"
	line "bright!"
	prompt
; 0x817d2

BellyDrumText: ; 0x817d2
	text $5a
	line "cut its HP and"
	cont "maximized ATTACK!"
	prompt
; 0x817f6

CopiedStatsText: ; 0x817f6
	text $5a
	line "copied the stat"

	para "changes of"
	line $59, "!"
	prompt
; 0x81817

ForesawAttackText: ; 0x81817
	text $5a
	line "foresaw an attack!"
	prompt
; 0x8182d

BeatUpAttackText: ; 0x8182d
	text_from_ram StringBuffer1
	text "'s"
	line "attack!"
	done
; 0x8183b

RefusedGiftText: ; 0x8183b
	text $59
	line "refused the gift!"
	prompt
; 0x81850

IgnoredOrders2Text: ; 0x81850
	text $5a
	line "ignored orders!"
	prompt
; 0x81863

BattleText_0x81863: ; 0x81863
	text "Link error…"

	para "The battle has"
	line "been canceled…"
	prompt
; 0x8188e

BattleText_0x8188e: ; 0x8188e
	text "There is no time"
	line "left today!"
	done
; 0x818ac
