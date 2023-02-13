BattleText:: ; used only for BANK(BattleText)

BattleText_PlayerPickedUpPayDayMoney:
	text "<PLAYER> obtient"
	line "@"
	text_decimal wPayDayMoney, 3, 6
	text "¥!"
	prompt

WildPokemonAppearedText:
	text "Un @"
	text_ram wEnemyMonNickname
	text_start
	line "sauvage apparaît!"
	prompt

HookedPokemonAttackedText:
	text "Le @"
	text_ram wEnemyMonNickname
	text_start
	line "pêché attaque!"
	prompt

PokemonFellFromTreeText:
	text_ram wEnemyMonNickname
	text_start
	line "tombe de l'arbre!"
	prompt

WildCelebiAppearedText:
	text_ram wEnemyMonNickname
	text " sauvage"
	line "apparaît!"
	prompt

WantsToBattleText::
	text "<ENEMY>"
	line "veut se battre!"
	prompt

BattleText_WildFled:
	text "Le @"
	text_ram wEnemyMonNickname
	text_start
	line "sauvage s'enfuit!"
	prompt

BattleText_EnemyFled:
	text "Le @"
	text_ram wEnemyMonNickname
	text_start
	line "ennemi s'enfuit!"
	prompt

HurtByPoisonText:
	text "<USER>"
	line "souffre du poison!"
	prompt

HurtByBurnText:
	text "<USER>"
	line "brûle!"
	prompt

LeechSeedSapsText:
	text "VAMPIGRAINE draine"
	line "<USER>!"
	prompt

HasANightmareText:
	text "<USER>"
	line "fait un cauchemar!"
	prompt

HurtByCurseText:
	text "<USER>"
	line "est MAUDIT!"
	prompt

SandstormHitsText:
	text "La TEMPETE de"
	line "SABLE touche"
	cont "<USER>!"
	prompt

PerishCountText:
	text "Compte REQUIEM de"
	line "<USER>"
	cont "est de @"
	text_decimal wTextDecimalByte, 1, 1
	text "!"
	prompt

BattleText_TargetRecoveredWithItem:
	text "<TARGET>"
	line "récupère avec"
	cont "@"
	text_ram wStringBuffer1
	text "."
	prompt

BattleText_UserRecoveredPPUsing:
	text "<USER>"
	line "récupère des PP"
	cont "avec @"
	text_ram wStringBuffer1
	text "."
	prompt

BattleText_TargetWasHitByFutureSight:
	text "<TARGET>"
	line "est touché par la"
	cont "PRESCIENCE!"
	prompt

BattleText_SafeguardFaded:
	text "RUNE PROTECT de"
	line "<USER>"
	cont "s'évanouit!"
	prompt

BattleText_MonsLightScreenFell:
	text "MUR LUMIERE de"
	line "#MON @"
	text_ram wStringBuffer1
	text_start
	cont "s'évanouit!"
	prompt

BattleText_MonsReflectFaded:
	text "PROTECTION de"
	line "@"
	text_ram wStringBuffer1
	text " #MON"
	cont "s'évanouit!"
	prompt

BattleText_RainContinuesToFall:
	text "La pluie continue"
	line "de tomber."
	prompt

BattleText_TheSunlightIsStrong:
	text "Les rayons sont"
	line "puissants."
	prompt

BattleText_TheSandstormRages:
	text "La TEMPETE de"
	line "SABLE fait rage."
	prompt

BattleText_TheRainStopped:
	text "La pluie s'est"
	line "arrêtée."
	prompt

BattleText_TheSunlightFaded:
	text "Les rayons"
	line "disparaissent."
	prompt

BattleText_TheSandstormSubsided:
	text "La TEMPETE de"
	line "SABLE se calme."
	prompt

BattleText_EnemyMonFainted:
	text "Le @"
	text_ram wEnemyMonNickname
	text_start
	line "ennemi est K.O!"
	prompt

GotMoneyForWinningText:
	text "<PLAYER> remporte"
	line "@"
	text_decimal wBattleReward, 3, 6
	text "¥!"
	prompt

BattleText_EnemyWasDefeated:
	text "<ENEMY>"
	line "a perdu!"
	prompt

TiedAgainstText:
	text "Egalité avec"
	line "<ENEMY>!"
	prompt

SentSomeToMomText:
	text "<PLAYER> remporte"
	line "@"
	text_decimal wBattleReward, 3, 6
	text "¥!"
	cont "Une partie est"
	cont "envoyée à MAMAN!"
	prompt

SentHalfToMomText:
	text "La moitié est"
	line "envoyée à MAMAN!"
	prompt

SentAllToMomText:
	text "Tout est envoyé"
	line "à MAMAN!"
	prompt

UnusedRivalLossText: ; unreferenced
	text "<RIVAL>: Hein?"
	line "J'aurais dû"
	cont "choisir le tien!"
	prompt

BattleText_MonFainted:
	text_ram wBattleMonNickname
	text_start
	line "est K.O!"
	prompt

BattleText_UseNextMon:
	text "Utiliser le"
	line "#MON suivant?"
	done

UnusedRivalWinText: ; unreferenced
	text "<RIVAL>: Ouais!"
	line "J'ai choisi un"
	cont "bon #MON!"
	prompt

LostAgainstText:
	text "<ENEMY>"
	line "vous a vaincu!"
	prompt

BattleText_EnemyIsAboutToUseWillPlayerChangeMon:
	text "<ENEMY>"
	line "va utiliser"
	cont "@"
	text_ram wEnemyMonNickname
	text "."

	para "Voulez-vous"
	line "changer de PKMN?"
	done

BattleText_EnemySentOut:
	text "<ENEMY>"
	line "envoie"
	cont "@"
	text_ram wEnemyMonNickname
	text "!"
	done

BattleText_TheresNoWillToBattle:
	text "Il ne veut pas"
	line "se battre!"
	prompt

BattleText_AnEGGCantBattle:
	text "Un OEUF ne se bat"
	line "pas, voyons!"
	prompt

BattleText_CantEscape2:
	text "Fuite impossible!"
	prompt

BattleText_TheresNoEscapeFromTrainerBattle:
	text "On ne s'enfuit pas"
	line "d'un combat contre"
	cont "un dresseur!"
	prompt

BattleText_GotAwaySafely:
	text "Vous prenez la"
	line "fuite!"
	prompt

BattleText_UserFledUsingAStringBuffer1:
	text "<USER>"
	line "fuit en utilisant"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_CantEscape:
	text "Fuite impossible!"
	prompt

BattleText_UserHurtBySpikes:
	text "PICOTS frappent"
	line "<USER>!"
	prompt

RecoveredUsingText:
	text "<TARGET>"
	line "récupère avec"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_UsersStringBuffer1Activated:
	text_ram wStringBuffer1
	text " de"
	line "<USER>:"
	cont "activé!"
	prompt

BattleText_ItemsCantBeUsedHere:
	text "Objets inutilisa-"
	line "bles ici."
	prompt

BattleText_MonIsAlreadyOut:
	text_ram wBattleMonNickname
	text " est"
	line "déjà au combat."
	prompt

BattleText_MonCantBeRecalled:
	text_ram wBattleMonNickname
	text " ne"
	line "peut être rappelé!"
	prompt

BattleText_TheresNoPPLeftForThisMove:
	text "Plus de PP pour"
	line "cette capacité!"
	prompt

BattleText_TheMoveIsDisabled:
	text "La capacité est"
	line "ENTRAVEE!"
	prompt

BattleText_MonHasNoMovesLeft:
	text_ram wBattleMonNickname
	text " n'a"
	line "plus de capacités!"
	done

BattleText_TargetsEncoreEnded:
	text "ENCORE de"
	line "<TARGET>"
	cont "achevé!"
	prompt

BattleText_StringBuffer1GrewToLevel:
	text_ram wStringBuffer1
	text " monte"
	line "au niveau @"
	text_decimal wCurPartyLevel, 1, 3
	text "!@"
	sound_dex_fanfare_50_79
	text_end

	text_end ; unreferenced

BattleText_WildMonIsEating:
	text "Le @"
	text_ram wEnemyMonNickname
	text_start
	line "sauvage mange!"
	prompt

BattleText_WildMonIsAngry:
	text "Le @"
	text_ram wEnemyMonNickname
	text " est"
	line "en colère!"
	prompt

FastAsleepText:
	text "<USER>"
	line "dort!"
	prompt

WokeUpText:
	text "<USER>"
	line "se réveille!"
	prompt

FrozenSolidText:
	text "<USER>"
	line "est gelé!"
	prompt

FlinchedText:
	text "<USER>"
	line "a la trouille!"
	prompt

MustRechargeText:
	text "<USER>"
	line "est à plat!"
	prompt

DisabledNoMoreText:
	text "<USER>"
	line "n'est plus"
	cont "entravé!"
	prompt

IsConfusedText:
	text "<USER>"
	line "est confus!"
	prompt

HurtItselfText:
	text "Sa folie lui in-"
	line "flige des dégâts!"
	prompt

ConfusedNoMoreText:
	text "<USER>"
	line "n'est plus confus!"
	prompt

BecameConfusedText:
	text "<TARGET>"
	line "devient confus!"
	prompt

BattleText_ItemHealedConfusion:
	text_ram wStringBuffer1
	text_start
	line "dissipe la folie"
	cont "de"
	cont "<TARGET>."
	prompt

AlreadyConfusedText:
	text "<TARGET>"
	line "est déjà confus!"
	prompt

BattleText_UsersHurtByStringBuffer1:
	text "<USER>"
	line "est blessé par"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_UserWasReleasedFromStringBuffer1:
	text "<USER>"
	line "est libéré de:"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

UsedBindText:
	text "<USER>"
	line "lance ETREINTE sur"
	cont "<TARGET>!"
	prompt

WhirlpoolTrapText:
	text "<TARGET>"
	line "est piégé!"
	prompt

FireSpinTrapText:
	text "<TARGET>"
	line "est piégé!"
	prompt

WrappedByText:
	text "<TARGET>"
	line "est LIGOTE par"
	cont "<USER>!"
	prompt

ClampedByText:
	text "<TARGET>"
	line "dans CLAQUOIR de"
	cont "<USER>!"
	prompt

StoringEnergyText:
	text "<USER>"
	line "se concentre!"
	prompt

UnleashedEnergyText:
	text "<USER>"
	line "envoie la sauce!"
	prompt

HungOnText:
	text "<TARGET>"
	line "protégé par"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

EnduredText:
	text "<TARGET>"
	line "est TENACE face au"
	cont "coup!"
	prompt

InLoveWithText:
	text "<USER>"
	line "est amoureux de"
	cont "<TARGET>!"
	prompt

InfatuationText:
	text "L'amour de"
	line "<USER>"
	cont "le paralyse!"
	prompt

DisabledMoveText:
	text_ram wStringBuffer1
	text " de"
	line "<USER>"
	cont "est sous ENTRAVE!"
	prompt

LoafingAroundText:
	text_ram wBattleMonNickname
	text_start
	line "se promène."
	prompt

BeganToNapText:
	text_ram wBattleMonNickname
	text_start
	line "fait la sieste!"
	prompt

WontObeyText:
	text_ram wBattleMonNickname
	text_start
	line "n'obéit pas!"
	prompt

TurnedAwayText:
	text_ram wBattleMonNickname
	text_start
	line "tourne le dos!"
	prompt

IgnoredOrdersText:
	text_ram wBattleMonNickname
	text_start
	line "vous ignore!"
	prompt

IgnoredSleepingText:
	text_ram wBattleMonNickname
	text " vous"
	line "ignore et pionce!"
	prompt

NoPPLeftText:
	text "Plus de PP pour"
	line "cette capacité!"
	prompt

HasNoPPLeftText:
	text "<USER>"
	line "n'a plus de PP"
	cont "pour @"
	text_ram wStringBuffer2
	text "!"
	prompt

WentToSleepText:
	text "<USER>"
	line "s'endort!"
	done

RestedText:
	text "<USER>"
	line "s'endort et récu-"
	cont "père son énergie!"
	done

RegainedHealthText:
	text "<USER>"
	line "récupère son"
	cont "énergie!"
	prompt

AttackMissedText:
	text "<USER>"
	line "rate son attaque!"
	prompt

AttackMissed2Text:
	text "<USER>"
	line "rate son attaque!"
	prompt

CrashedText:
	text "<USER>"
	line "s'éclate au sol!"
	prompt

UnaffectedText:
	text "<TARGET>"
	line "n'est pas affecté!"
	prompt

DoesntAffectText:
	text "Aucun effet sur"
	line "<TARGET>!"
	prompt

CriticalHitText:
	text "Coup critique!"
	prompt

OneHitKOText:
	text "K.O. en un coup!"
	prompt

SuperEffectiveText:
	text "C'est super"
	line "efficace!"
	prompt

NotVeryEffectiveText:
	text "Ce n'est pas très"
	line "efficace..."
	prompt

TookDownWithItText:
	text "<TARGET>"
	line "emmène au tapis"
	cont "<USER>!"
	prompt

RageBuildingText:
	text "La FRENESIE de"
	line "<USER>"
	cont "augmente!"
	prompt

GotAnEncoreText:
	text "<TARGET>"
	line "en a ENCORE!"
	prompt

SharedPainText:
	text "Les adversaires"
	line "partagent les"
	cont "dégâts!"
	prompt

TookAimText:
	text "<USER>"
	line "vise!"
	prompt

SketchedText:
	text "<USER>"
	line "GRIBOUILLE"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

DestinyBondEffectText:
	text "<USER>"
	line "veut emmener son"
	cont "ennemi au tapis!"
	prompt

SpiteEffectText:
	text_ram wStringBuffer1
	text " de"
	line "<TARGET>"
	cont "baisse de @"
	text_decimal wTextDecimalByte, 1, 1
	text "!"
	prompt

BellChimedText:
	text "Une cloche sonne!"
	line ""
	prompt

FellAsleepText:
	text "<TARGET>"
	line "s'endort!"
	prompt

AlreadyAsleepText:
	text "<TARGET>"
	line "dort déjà!"
	prompt

WasPoisonedText:
	text "<TARGET>"
	line "est empoisonné!"
	prompt

BadlyPoisonedText:
	text "<TARGET>"
	line "est gravement"
	cont "empoisonné!"
	prompt

AlreadyPoisonedText:
	text "<TARGET>"
	line "est déjà"
	cont "empoisonné!"
	prompt

SuckedHealthText:
	text "L'énergie de"
	line "<TARGET>"
	cont "est aspirée!"
	prompt

DreamEatenText:
	text "Le rêve de"
	line "<TARGET>"
	cont "est dévoré!"
	prompt

WasBurnedText:
	text "<TARGET>"
	line "brûle!"
	prompt

DefrostedOpponentText:
	text "<TARGET>"
	line "est dégelé!"
	prompt

WasFrozenText:
	text "<TARGET>"
	line "est gelé!"
	prompt

WontRiseAnymoreText:
	text_ram wStringBuffer2
	text " de"
	line "<USER>"
	cont "n'augmente plus!"
	prompt

WontDropAnymoreText:
	text_ram wStringBuffer2
	text " de"
	line "<TARGET>"
	cont "ne diminue plus!"
	prompt

FledFromBattleText::
	text "<USER>"
	line "s'enfuit!"
	prompt

FledInFearText:
	text "<TARGET>"
	line "a peur et fuit!"
	prompt

BlownAwayText:
	text "<TARGET>"
	line "est soufflé!"
	prompt

PlayerHitTimesText:
	text "Touché @"
	text_decimal wPlayerDamageTaken, 1, 1
	text " fois!"
	prompt

EnemyHitTimesText:
	text "Touché @"
	text_decimal wEnemyDamageTaken, 1, 1
	text " fois!"
	prompt

MistText:
	text "<USER>"
	line "s'entoure d'une"
	cont "BRUME!"
	prompt

ProtectedByMistText:
	text "<TARGET>"
	line "est protégé par"
	cont "la BRUME!"
	prompt

GettingPumpedText:
	text_pause
	text "<USER>"
	line "se concentre!"
	prompt

RecoilText:
	text "<USER>"
	line "se blesse en"
	cont "frappant!"
	prompt

MadeSubstituteText:
	text "<USER>"
	line "crée un CLONE!"
	prompt

HasSubstituteText:
	text "<USER>"
	line "a un CLONE!"
	prompt

TooWeakSubText:
	text "Trop faible pour"
	line "créer un CLONE!"
	prompt

SubTookDamageText:
	text "Le CLONE prend"
	line "les dégâts pour"
	cont "<TARGET>!"
	prompt

SubFadedText:
	text "Le CLONE de"
	line "<TARGET>"
	cont "s'évanouit!"
	prompt

MimicLearnedMoveText:
	text "<USER>"
	line "apprend"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

WasSeededText:
	text "<TARGET>"
	line "est infecté!"
	prompt

EvadedText:
	text "<TARGET>"
	line "évite l'attaque!"
	prompt

WasDisabledText:
	text_ram wStringBuffer1
	text " de"
	line "<TARGET>"
	cont "est sous ENTRAVE!"
	prompt

CoinsScatteredText:
	text "Une pluie de"
	line "pièces!"
	prompt

TransformedTypeText:
	text "<USER>"
	line "se change en type"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

EliminatedStatsText:
	text "Tout changement de"
	line "statut éliminé!"
	prompt

TransformedText:
	text "<USER>"
	line "se transforme en"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

LightScreenEffectText:
	text "La DEF.SPE. de"
	line "<USER>"
	cont "augmente!"
	prompt

ReflectEffectText:
	text "La DEFENSE de"
	line "<USER>"
	cont "augmente!"
	prompt

NothingHappenedText:
	text "Mais rien ne se"
	line "passe."
	prompt

ButItFailedText:
	text "Mais cela échoue!"
	prompt

ItFailedText:
	text "Ca ne marche pas!"
	prompt

DidntAffect1Text:
	text "Ca n'affecte pas"
	line "<TARGET>!"
	prompt

DidntAffect2Text:
	text "Ca n'affecte pas"
	line "<TARGET>!"
	prompt

HPIsFullText:
	text "Points de Vie de"
	line "<USER>"
	cont "au max!"
	prompt

DraggedOutText:
	text "<USER>"
	line "est traîné de"
	cont "force au combat!"
	prompt

ParalyzedText:
	text "<TARGET>"
	line "paralysé! Il peut"
	cont "ne pas attaquer!"
	prompt

FullyParalyzedText:
	text "<USER>"
	line "est totalement"
	cont "paralysé!"
	prompt

AlreadyParalyzedText:
	text "<TARGET>"
	line "est déjà paralysé!"
	prompt

ProtectedByText:
	text "<TARGET>"
	line "est protégé par"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

MirrorMoveFailedText:
	text "La MIMIQUE a"
	next "échoué!"
	prompt

StoleText:
	text "<USER>"
	line "vole @"
	text_ram wStringBuffer1
	text_start
	cont "à son ennemi!"
	prompt

CantEscapeNowText:
	text "<TARGET>"
	line "ne peut pas"
	cont "s'échapper!"
	prompt

StartedNightmareText:
	text "<TARGET>"
	line "commence à"
	cont "CAUCHEMARDER!"
	prompt

WasDefrostedText:
	text "<USER>"
	line "est dégelé!"
	prompt

PutACurseText:
	text "<USER>"
	line "sacrifie ses PV..."

	para "...et MAUDIT"
	line "<TARGET>!"
	prompt

ProtectedItselfText:
	text "<USER>"
	line "se met à l'ABRI!"
	prompt

ProtectingItselfText:
	text "<TARGET>"
	line "s'ABRITE!"
	done

SpikesText:
	text "Des PICOTS s'épar-"
	line "pillent autour de"
	cont "<TARGET>!"
	prompt

IdentifiedText:
	text "<USER>"
	line "identifie"
	cont "<TARGET>!"
	prompt

StartPerishText:
	text "Les deux #MON"
	line "sont K.O. dans..."
	cont "3 tours!!!"
	prompt

SandstormBrewedText:
	text "Une TEMPETE de"
	line "SABLE se prépare!"
	prompt

BracedItselfText:
	text "<USER>"
	line "rassemble ses"
	cont "forces!"
	prompt

FellInLoveText:
	text "<TARGET>"
	line "est amoureux!"
	prompt

CoveredByVeilText:
	text "<USER>"
	line "est sous un voile!"
	prompt

SafeguardProtectText:
	text "<TARGET>"
	line "est protégé par"
	cont "RUNE PROTECT!"
	prompt

MagnitudeText:
	text "Ampleur @"
	text_decimal wTextDecimalByte, 1, 1
	text "!"
	prompt

ReleasedByText:
	text "<USER>"
	line "est relâché par"
	cont "<TARGET>!"
	prompt

ShedLeechSeedText:
	text "<USER>"
	line "lance VAMPIGRAINE!"
	prompt

BlewSpikesText:
	text "<USER>"
	line "lance les PICOTS!"
	prompt

DownpourText:
	text "Une forte pluie"
	line "commence!"
	prompt

SunGotBrightText:
	text "Le soleil brille!"
	prompt

BellyDrumText:
	text "<USER>"
	line "sacrifie ses PV et"
	cont "monte son ATTAQUE"
	cont "au max!"
	prompt

CopiedStatsText:
	text "<USER>"
	line "copie les change-"

	para "ments de statut de"
	line "<TARGET>!"
	prompt

ForesawAttackText:
	text "<USER>"
	line "prévoit une"
	cont "attaque!"
	prompt

BeatUpAttackText:
	text "Attaque de"
	line "@"
	text_ram wStringBuffer1
	text "!"
	done

PresentFailedText:
	text "<TARGET>"
	line "ne veut pas"
	cont "le cadeau!"
	prompt

IgnoredOrders2Text:
	text "<USER>"
	line "ignore les ordres!"
	prompt

BattleText_LinkErrorBattleCanceled:
	text "Erreur Link..."

	para "Le combat est"
	line "annulé..."
	prompt

BattleText_NoTimeLeftToday: ; unreferenced
	text_start
	done
