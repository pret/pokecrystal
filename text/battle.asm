BattleText_PlayerPickedUpPayDayMoney: ; 0x80730
	text "<PLAYER> picked up"
	line "¥@"
	deciram wPayDayMoney, 3, 6
	text "!"
	prompt
; 0x80746

WildPokemonAppearedText: ; 0x80746
	text "Wild @"
	text_from_ram EnemyMonNick
	text ""
	line "appeared!"
	prompt
; 0x8075c

HookedPokemonAttackedText: ; 0x8075c
	text "The hooked"
	line "@"
	text_from_ram EnemyMonNick
	text ""
	cont "attacked!"
	prompt
; 0x80778

PokemonFellFromTreeText: ; 0x80778
	text_from_ram EnemyMonNick
	text " fell"
	line "out of the tree!"
	prompt
; 0x80793

WildCelebiAppearedText: ; 0x80793
	text "Wild @"
	text_from_ram EnemyMonNick
	text ""
	line "appeared!"
	prompt
; 0x807a9

WantsToBattleText:: ; 0x807a9
	text "<ENEMY>"
	line "wants to battle!"
	prompt
; 0x807bd

BattleText_WildFled: ; 0x807bd
	text "Wild @"
	text_from_ram EnemyMonNick
	text ""
	line "fled!"
	prompt
; 0x807cf

BattleText_EnemyFled: ; 0x807cf
	text "Enemy @"
	text_from_ram EnemyMonNick
	text ""
	line "fled!"
	prompt
; 0x807e2

HurtByPoisonText: ; 0x807e2
	text "<USER>"
	line "is hurt by poison!"
	prompt
; 0x807f8

HurtByBurnText: ; 0x807f8
	text "<USER>'s"
	line "hurt by its burn!"
	prompt
; 0x8080e

LeechSeedSapsText: ; 0x8080e
	text "LEECH SEED saps"
	line "<USER>!"
	prompt
; 0x80822

HasANightmareText: ; 0x80822
	text "<USER>"
	line "has a NIGHTMARE!"
	prompt
; 0x80836

HurtByCurseText: ; 0x80836
	text "<USER>'s"
	line "hurt by the CURSE!"
	prompt
; 0x8084d

SandstormHitsText: ; 0x8084d
	text "The SANDSTORM hits"
	line "<USER>!"
	prompt
; 0x80864

PerishCountText: ; 0x80864
	text "<USER>'s"
	line "PERISH count is @"
	deciram wd265, 1, 1
	text "!"
	prompt
; 0x80880

BattleText_TargetRecoveredWithItem: ; 0x80880
	text "<TARGET>"
	line "recovered with"
	cont "@"
	text_from_ram StringBuffer1
	text "."
	prompt
; 0x80899

BattleText_UserRecoveredPPUsing: ; 0x80899
	text "<USER>"
	line "recovered PP using"
	cont "@"
	text_from_ram StringBuffer1
	text "."
	prompt
; 0x808b6

BattleText_TargetWasHitByFutureSight: ; 0x808b6
	text "<TARGET>"
	line "was hit by FUTURE"
	cont "SIGHT!"
	prompt
; 0x808d2

BattleText_SafeguardFaded: ; 0x808d2
	text "<USER>'s"
	line "SAFEGUARD faded!"
	prompt
; 0x808e7

BattleText_PkmnLightScreenFell: ; 0x808e7
	text_from_ram StringBuffer1
	text " #MON's"
	line "LIGHT SCREEN fell!"
	prompt
; 0x80905

BattleText_PkmnReflectFaded: ; 0x80905
	text_from_ram StringBuffer1
	text " #MON's"
	line "REFLECT faded!"
	prompt
; 0x8091f

BattleText_RainContinuesToFall: ; 0x8091f
	text "Rain continues to"
	line "fall."
	prompt
; 0x80938

BattleText_TheSunlightIsStrong: ; 0x80938
	text "The sunlight is"
	line "strong."
	prompt
; 0x80951

BattleText_TheSandstormRages: ; 0x80951
	text "The SANDSTORM"
	line "rages."
	prompt
; 0x80967

BattleText_TheRainStopped: ; 0x80967
	text "The rain stopped."
	prompt
; 0x8097a

BattleText_TheSunlightFaded: ; 0x8097a
	text "The sunlight"
	line "faded."
	prompt
; 0x8098f

BattleText_TheSandstormSubsided: ; 0x8098f
	text "The SANDSTORM"
	line "subsided."
	prompt
; 0x809a8

BattleText_EnemyPkmnFainted: ; 0x809a8
	text "Enemy @"
	text_from_ram EnemyMonNick
	text ""
	line "fainted!"
	prompt
; 0x809be

GotMoneyForWinningText:
	text "<PLAYER> got ¥@"
	deciram wBattleReward, 3, 6
	text ""
	line "for winning!"
	prompt

BattleText_EnemyWasDefeated: ; 0x809da
	text "<ENEMY>"
	line "was defeated!"
	prompt
; 0x809eb

TiedAgainstText: ; 0x809eb
	text "Tied against"
	line "<ENEMY>!"
	prompt
; 0x809fc

SentSomeToMomText:
	text "<PLAYER> got ¥@"
	deciram wBattleReward, 3, 6
	text ""
	line "for winning!"
	cont "Sent some to MOM!"
	prompt

SentHalfToMomText:
	text "Sent half to MOM!"
	prompt

SentAllToMomText:
	text "Sent all to MOM!"
	prompt

BattleText_0x80a4f: ; 0x80a4f
	text "<RIVAL>: Huh? I"
	line "should've chosen"
	cont "your #MON!"
	prompt
; 0x80a75

BattleText_PkmnFainted: ; 0x80a75
	text_from_ram BattleMonNick
	text ""
	line "fainted!"
	prompt
; 0x80a83

BattleText_UseNextMon: ; 0x80a83
	text "Use next #MON?"
	done
; 0x80a93

BattleText_0x80a93: ; 0x80a93
	text "<RIVAL>: Yes!"
	line "I guess I chose a"
	cont "good #MON!"
	prompt
; 0x80ab9

LostAgainstText: ; 0x80ab9
	text "Lost against"
	line "<ENEMY>!"
	prompt
; 0x80aca

BattleText_EnemyIsAboutToUseWillPlayerChangePkmn: ; 0x80aca
	text "<ENEMY>"
	line "is about to use"
	cont "@"
	text_from_ram EnemyMonNick
	text "."

	para "Will <PLAYER>"
	line "change #MON?"
	done
; 0x80af8

BattleText_EnemySentOut: ; 0x80af8
	text "<ENEMY>"
	line "sent out"
	cont "@"
	text_from_ram EnemyMonNick
	text "!"
	done
; 0x80b0b

BattleText_TheresNoWillToBattle: ; 0x80b0b
	text "There's no will to"
	line "battle!"
	prompt
; 0x80b26

BattleText_AnEGGCantBattle: ; 0x80b26
	text "An EGG can't"
	line "battle!"
	prompt
; 0x80b3b

BattleText_CantEscape2: ; 0x80b3b
	text "Can't escape!"
	prompt
; 0x80b49

BattleText_TheresNoEscapeFromTrainerBattle: ; 0x80b49
	text "No! There's no"
	line "running from a"
	cont "trainer battle!"
	prompt

BattleText_GotAwaySafely: ; 0x80b77
	text "Got away safely!"
	prompt

BattleText_UserFledUsingAStringBuffer1: ; 0x80b89
	text "<USER>"
	line "fled using a"
	cont "@"
	text_from_ram StringBuffer1
	text "!"
	prompt
; 0x80ba0

BattleText_CantEscape: ; 0x80ba0
	text "Can't escape!"
	prompt
; 0x80bae

BattleText_UserHurtBySpikes: ; 0x80bae
	text "<USER>'s"
	line "hurt by SPIKES!"
	prompt
; 0x80bc2

RecoveredUsingText: ; 0x80bc2
	text "<TARGET>"
	line "recovered using a"
	cont "@"
	text_from_ram StringBuffer1
	text "!"
	prompt
; 0x80bde

BattleText_UsersStringBuffer1Activated: ; 0x80bde
	text "<USER>'s"
	line "@"
	text_from_ram StringBuffer1
	text ""
	cont "activated!"
	prompt
; 0x80bf3

BattleText_ItemsCantBeUsedHere: ; 0x80bf3
	text "Items can't be"
	line "used here."
	prompt
; 0x80c0d

BattleText_PkmnIsAlreadyOut: ; 0x80c0d
	text_from_ram BattleMonNick
	text ""
	line "is already out."
	prompt
; 0x80c22

BattleText_PkmnCantBeRecalled: ; 0x80c22
	text_from_ram BattleMonNick
	text ""
	line "can't be recalled!"
	prompt
; 0x80c39

BattleText_TheresNoPPLeftForThisMove: ; 0x80c39
	text "There's no PP left"
	line "for this move!"
	prompt
; 0x80c5b

BattleText_TheMoveIsDisabled: ; 0x80c5b
	text "The move is"
	line "DISABLED!"
	prompt
; 0x80c72

BattleText_PkmnHasNoMovesLeft: ; 0x80c72
	text_from_ram BattleMonNick
	text ""
	line "has no moves left!"
	done
; 0x80c8a

BattleText_TargetsEncoreEnded: ; 0x80c8a
	text "<TARGET>'s"
	line "ENCORE ended!"
	prompt
; 0x80c9c

BattleText_StringBuffer1GrewToLevel: ; 0x80c9c
	text_from_ram StringBuffer1
	text " grew to"
	line "level @"
	deciram CurPartyLevel, 1, 3
	text "!@"
	sound_dex_fanfare_50_79
	db "@@"
; 0x80cb9

BattleText_WildPkmnIsEating: ; 0x80cba
	text "Wild @"
	text_from_ram EnemyMonNick
	text ""
	line "is eating!"
	prompt
; 0x80cd1

BattleText_WildPkmnIsAngry: ; 0x80cd1
	text "Wild @"
	text_from_ram EnemyMonNick
	text ""
	line "is angry!"
	prompt
; 0x80ce7

FastAsleepText: ; 0x80ce7
	text "<USER>"
	line "is fast asleep!"
	prompt
; 0x80cfa

WokeUpText: ; 0x80cfa
	text "<USER>"
	line "woke up!"
	prompt
; 0x80d06

FrozenSolidText: ; 0x80d06
	text "<USER>"
	line "is frozen solid!"
	prompt
; 0x80d1a

FlinchedText: ; 0x80d1a
	text "<USER>"
	line "flinched!"
	prompt
; 0x80d27

MustRechargeText: ; 0x80d27
	text "<USER>"
	line "must recharge!"
	prompt
; 0x80d39

DisabledNoMoreText: ; 0x80d39
	text "<USER>'s"
	line "disabled no more!"
	prompt
; 0x80d4f

IsConfusedText: ; 0x80d4f
	text "<USER>"
	line "is confused!"
	prompt
; 0x80d5f

HurtItselfText: ; 0x80d5f
	text "It hurt itself in"
	line "its confusion!"
	prompt
; 0x80d81

ConfusedNoMoreText: ; 0x80d81
	text "<USER>'s"
	line "confused no more!"
	prompt
; 0x80d97

BecameConfusedText: ; 0x80d97
	text "<TARGET>"
	line "became confused!"
	prompt
; ItemHealedConfusion

BattleText_ItemHealedConfusion: ; ItemHealedConfusion
	text "A @"
	text_from_ram StringBuffer1
	text " rid"
	line "<TARGET>"
	cont "of its confusion."
	prompt
; 0x80dcc

AlreadyConfusedText: ; 0x80dcc
	text "<TARGET>'s"
	line "already confused!"
	prompt
; 0x80de2

BattleText_UsersHurtByStringBuffer1: ; 0x80de2
	text "<USER>'s"
	line "hurt by"
	cont "@"
	text_from_ram StringBuffer1
	text "!"
	prompt
; 0x80df5

BattleText_UserWasReleasedFromStringBuffer1: ; 0x80df5
	text "<USER>"
	line "was released from"
	cont "@"
	text_from_ram StringBuffer1
	text "!"
	prompt
; 0x80e11

UsedBindText: ; 0x80e11
	text "<USER>"
	line "used BIND on"
	cont "<TARGET>!"
	prompt
; 0x80e24

WhirlpoolTrapText: ; 0x80e24
	text "<TARGET>"
	line "was trapped!"
	prompt
; 0x80e34

FireSpinTrapText: ; 0x80e34
	text "<TARGET>"
	line "was trapped!"
	prompt
; 0x80e44

WrappedByText: ; 0x80e44
	text "<TARGET>"
	line "was WRAPPED by"
	cont "<USER>!"
	prompt
; 0x80e59

ClampedByText: ; 0x80e59
	text "<TARGET>"
	line "was CLAMPED by"
	cont "<USER>!"
	prompt
; 0x80e6e

StoringEnergyText: ; 0x80e6e
	text "<USER>"
	line "is storing energy!"
	prompt
; 0x80e84

UnleashedEnergyText: ; 0x80e84
	text "<USER>"
	line "unleashed energy!"
	prompt
; 0x80e99

HungOnText: ; 0x80e99
	text "<TARGET>"
	line "hung on with"
	cont "@"
	text_from_ram StringBuffer1
	text "!"
	prompt
; 0x80eb0

EnduredText: ; 0x80eb0
	text "<TARGET>"
	line "ENDURED the hit!"
	prompt
; 0x80ec4

InLoveWithText: ; 0x80ec4
	text "<USER>"
	line "is in love with"
	cont "<TARGET>!"
	prompt
; 0x80eda

InfatuationText: ; 0x80eda
	text "<USER>'s"
	line "infatuation kept"
	cont "it from attacking!"
	prompt
; 0x80f02

DisabledMoveText: ; 0x80f02
	text "<USER>'s"
	line "@"
	text_from_ram StringBuffer1
	text " is"
	cont "DISABLED!"
	prompt
; 0x80f19

LoafingAroundText: ; 0x80f19
	text_from_ram BattleMonNick
	text " is"
	line "loafing around."
	prompt
; 0x80f31

BeganToNapText: ; 0x80f31
	text_from_ram BattleMonNick
	text " began"
	line "to nap!"
	prompt
; 0x80f44

WontObeyText: ; 0x80f44
	text_from_ram BattleMonNick
	text " won't"
	line "obey!"
	prompt
; 0x80f54

TurnedAwayText: ; 0x80f54
	text_from_ram BattleMonNick
	text " turned"
	line "away!"
	prompt
; 0x80f66

IgnoredOrdersText: ; 0x80f66
	text_from_ram BattleMonNick
	text " ignored"
	line "orders!"
	prompt
; 0x80f7b

IgnoredSleepingText: ; 0x80f7b
	text_from_ram BattleMonNick
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
	text "<USER>"
	line "has no PP left for"
	cont "@"
	text_from_ram StringBuffer2
	text "!"
	prompt
; 0x80fd7

WentToSleepText: ; 0x80fd7
	text "<USER>"
	line "went to sleep!"
	done
; 0x80fe9

RestedText: ; 0x80fe9
	text "<USER>"
	line "fell asleep and"
	cont "became healthy!"
	done
; 0x8100c

RegainedHealthText: ; 0x8100c
	text "<USER>"
	line "regained health!"
	prompt
; 0x81020

AttackMissedText: ; 0x81020
	text "<USER>'s"
	line "attack missed!"
	prompt
; 0x81033

AttackMissed2Text: ; 0x81033
	text "<USER>'s"
	line "attack missed!"
	prompt
; 0x81046

CrashedText: ; 0x81046
	text "<USER>"
	line "kept going and"
	cont "crashed!"
	prompt
; 0x81061

UnaffectedText: ; 0x81061
	text "<TARGET>'s"
	line "unaffected!"
	prompt
; 0x81071

DoesntAffectText: ; 0x81071
	text "It doesn't affect"
	line "<TARGET>!"
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
	text "<TARGET>"
	line "took down with it,"
	cont "<USER>!"
	prompt
; 0x810f3

RageBuildingText: ; 0x810f3
	text "<USER>'s"
	line "RAGE is building!"
	prompt
; 0x81109

GotAnEncoreText: ; 0x81109
	text "<TARGET>"
	line "got an ENCORE!"
	prompt
; 0x8111b

SharedPainText: ; 0x8111b
	text "The battlers"
	line "shared pain!"
	prompt
; 0x81136

TookAimText: ; 0x81136
	text "<USER>"
	line "took aim!"
	prompt
; 0x81143

SketchedText: ; 0x81143
	text "<USER>"
	line "SKETCHED"
	cont "@"
	text_from_ram StringBuffer1
	text "!"
	prompt
; 0x81156

DestinyBondEffectText: ; 0x81156
	text "<USER>'s"
	line "trying to take its"
	cont "opponent with it!"
	prompt
; 0x8117f

SpiteEffectText: ; 0x8117f
	text "<TARGET>'s"
	line "@"
	text_from_ram StringBuffer1
	text " was"
	cont "reduced by @"
	deciram wd265, 1, 1
	text "!"
	prompt
; 0x811a0

BellChimedText: ; 0x811a0
	text "A bell chimed!"
	line ""
	prompt
; 0x811b1

FellAsleepText: ; 0x811b1
	text "<TARGET>"
	line "fell asleep!"
	prompt
; 0x811c1

AlreadyAsleepText: ; 0x811c1
	text "<TARGET>'s"
	line "already asleep!"
	prompt
; 0x811d5

WasPoisonedText: ; 0x811d5
	text "<TARGET>"
	line "was poisoned!"
	prompt
; 0x811e6

BadlyPoisonedText: ; 0x811e6
	text "<TARGET>'s"
	line "badly poisoned!"
	prompt
; 0x811fa

AlreadyPoisonedText: ; 0x811fa
	text "<TARGET>'s"
	line "already poisoned!"
	prompt
; 0x81210

SuckedHealthText: ; 0x81210
	text "Sucked health from"
	line "<TARGET>!"
	prompt
; 0x81227

DreamEatenText: ; 0x81227
	text "<TARGET>'s"
	line "dream was eaten!"
	prompt
; 0x8123c

WasBurnedText: ; 0x8123c
	text "<TARGET>"
	line "was burned!"
	prompt
; 0x8124b

DefrostedOpponentText: ; 0x8124b
	text "<TARGET>"
	line "was defrosted!"
	prompt
; 0x8125d

WasFrozenText: ; 0x8125d
	text "<TARGET>"
	line "was frozen solid!"
	prompt
; 0x81272

WontRiseAnymoreText: ; 0x81272
	text "<USER>'s"
	line "@"
	text_from_ram StringBuffer2
	text " won't"
	cont "rise anymore!"
	prompt
; 0x8128f

WontDropAnymoreText: ; 0x8128f
	text "<TARGET>'s"
	line "@"
	text_from_ram StringBuffer2
	text " won't"
	cont "drop anymore!"
	prompt
; 0x812ac

FledFromBattleText:: ; 0x812ac
	text "<USER>"
	line "fled from battle!"
	prompt
; 0x812c1

FledInFearText: ; 0x812c1
	text "<TARGET>"
	line "fled in fear!"
	prompt
; 0x812d2

BlownAwayText: ; 0x812d2
	text "<TARGET>"
	line "was blown away!"
	prompt
; 0x812e5

PlayerHitTimesText: ; 0x812e5
	text "Hit @"
	deciram PlayerDamageTaken, 1, 1
	text " times!"
	prompt
; 0x812f8

EnemyHitTimesText: ; 0x812f8
	text "Hit @"
	deciram EnemyDamageTaken, 1, 1
	text " times!"
	prompt
; 0x8130b

MistText: ; 0x8130b
	text "<USER>'s"
	line "shrouded in MIST!"
	prompt
; 0x81321

ProtectedByMistText: ; 0x81321
	text "<TARGET>'s"
	line "protected by MIST."
	prompt
; 0x81338

GettingPumpedText: ; 0x81338
	interpret_data
	text "<USER>'s"
	line "getting pumped!"
	prompt
; 0x8134d

RecoilText: ; 0x8134d
	text "<USER>'s"
	line "hit with recoil!"
	prompt
; 0x81362

MadeSubstituteText: ; 0x81362
	text "<USER>"
	line "made a SUBSTITUTE!"
	prompt
; 0x81378

HasSubstituteText: ; 0x81378
	text "<USER>"
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
	cont "<TARGET>!"
	prompt
; 0x813d0

SubFadedText: ; 0x813d0
	text "<TARGET>'s"
	line "SUBSTITUTE faded!"
	prompt
; 0x813e6

LearnedMoveText: ; 0x813e6
	text "<USER>"
	line "learned"
	cont "@"
	text_from_ram StringBuffer1
	text "!"
	prompt
; 0x813f8

WasSeededText: ; 0x813f8
	text "<TARGET>"
	line "was seeded!"
	prompt
; 0x81407

EvadedText: ; 0x81407
	text "<TARGET>"
	line "evaded the attack!"
	prompt
; 0x8141d

WasDisabledText: ; 0x8141d
	text "<TARGET>'s"
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
	text "<USER>"
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
	text "<USER>"
	line "TRANSFORMED into"
	cont "@"
	text_from_ram StringBuffer1
	text "!"
	prompt
; 0x814b4

LightScreenEffectText: ; 0x814b4
	text "<USER>'s"
	line "SPCL.DEF rose!"
	prompt
; 0x814c7

ReflectEffectText: ; 0x814c7
	text "<USER>'s"
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
	line "<TARGET>!"
	prompt
; 0x81520

DidntAffect2Text: ; 0x81520
	text "It didn't affect"
	line "<TARGET>!"
	prompt
; 0x81534

HPIsFullText: ; 0x81534
	text "<USER>'s"
	line "HP is full!"
	prompt
; 0x81544

DraggedOutText: ; 0x81544
	text "<USER>"
	line "was dragged out!"
	prompt
; 0x81558

ParalyzedText: ; 0x81558
	text "<TARGET>'s"
	line "paralyzed! Maybe"
	cont "it can't attack!"
	prompt
; 0x8157d

FullyParalyzedText: ; 0x8157d
	text "<USER>'s"
	line "fully paralyzed!"
	prompt
; 0x81592

AlreadyParalyzedText: ; 0x81592
	text "<TARGET>'s"
	line "already paralyzed!"
	prompt
; 0x815a9

ProtectedByText: ; 0x815a9
	text "<TARGET>'s"
	line "protected by"
	cont "@"
	text_from_ram StringBuffer1
	text "!"
	prompt
; 0x815c1

MirrorMoveFailedText: ; 0x815c1
	text "The MIRROR MOVE"
	next "failed!"
	prompt
; 0x815da

StoleText: ; 0x815da
	text "<USER>"
	line "stole @"
	text_from_ram StringBuffer1
	text ""
	cont "from its foe!"
	prompt
; 0x815f7

CantEscapeNowText: ; 0x815f7
	text "<TARGET>"
	line "can't escape now!"
	prompt
; 0x8160b

StartedNightmareText: ; 0x8160b
	text "<TARGET>"
	line "started to have a"
	cont "NIGHTMARE!"
	prompt
; 0x8162b

WasDefrostedText: ; 0x8162b
	text "<USER>"
	line "was defrosted!"
	prompt
; 0x8163d

PutACurseText: ; 0x8163d
	text "<USER>"
	line "cut its own HP and"

	para "put a CURSE on"
	line "<TARGET>!"
	prompt
; 0x81665

ProtectedItselfText: ; 0x81665
	text "<USER>"
	line "PROTECTED itself!"
	prompt
; 0x8167a

ProtectingItselfText: ; 0x8167a
	text "<TARGET>'s"
	line "PROTECTING itself!"
	done
; 0x81691

SpikesText: ; 0x81691
	text "SPIKES scattered"
	line "all around"
	cont "<TARGET>!"
	prompt
; 0x816b1

IdentifiedText: ; 0x816b1
	text "<USER>"
	line "identified"
	cont "<TARGET>!"
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
	text "<USER>"
	line "braced itself!"
	prompt
; 0x8170b

FellInLoveText: ; 0x8170b
	text "<TARGET>"
	line "fell in love!"
	prompt
; 0x8171c

CoveredByVeilText: ; 0x8171c
	text "<USER>'s"
	line "covered by a veil!"
	prompt
; 0x81733

SafeguardProtectText: ; 0x81733
	text "<TARGET>"
	line "is protected by"
	cont "SAFEGUARD!"
	prompt
; 0x81751

MagnitudeText: ; 0x81751
	text "Magnitude @"
	deciram wd265, 1, 1
	text "!"
	prompt
; 0x81764

ReleasedByText: ; 0x81764
	text "<USER>"
	line "was released by"
	cont "<TARGET>!"
	prompt
; 0x8177a

ShedLeechSeedText: ; 0x8177a
	text "<USER>"
	line "shed LEECH SEED!"
	prompt
; 0x8178e

BlewSpikesText: ; 0x8178e
	text "<USER>"
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
	text "<USER>"
	line "cut its HP and"
	cont "maximized ATTACK!"
	prompt
; 0x817f6

CopiedStatsText: ; 0x817f6
	text "<USER>"
	line "copied the stat"

	para "changes of"
	line "<TARGET>!"
	prompt
; 0x81817

ForesawAttackText: ; 0x81817
	text "<USER>"
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
	text "<TARGET>"
	line "refused the gift!"
	prompt
; 0x81850

IgnoredOrders2Text: ; 0x81850
	text "<USER>"
	line "ignored orders!"
	prompt
; 0x81863

BattleText_LinkErrorBattleCanceled: ; 0x81863
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
