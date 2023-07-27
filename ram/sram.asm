SECTION "Scratch", SRAM

sScratch:: ds $60 tiles


SECTION "SRAM Bank 0", SRAM

sPartyMail::
; sPartyMon1Mail - sPartyMon6Mail
for n, 1, PARTY_LENGTH + 1
sPartyMon{d:n}Mail:: mailmsg sPartyMon{d:n}Mail
endr

sPartyMailBackup::
; sPartyMon1MailBackup - sPartyMon6MailBackup
for n, 1, PARTY_LENGTH + 1
sPartyMon{d:n}MailBackup:: mailmsg sPartyMon{d:n}MailBackup
endr

sMailboxCount:: db
sMailboxes::
; sMailbox1 - sMailbox10
for n, 1, MAILBOX_CAPACITY + 1
sMailbox{d:n}:: mailmsg sMailbox{d:n}
endr

sMailboxCountBackup:: db
sMailboxesBackup::
; sMailbox1Backup - sMailbox10Backup
for n, 1, MAILBOX_CAPACITY + 1
sMailbox{d:n}Backup:: mailmsg sMailbox{d:n}Backup
endr

sMysteryGiftData::
sMysteryGiftItem:: db
sMysteryGiftUnlocked:: db
sBackupMysteryGiftItem:: db
sNumDailyMysteryGiftPartnerIDs:: db
sDailyMysteryGiftPartnerIDs:: ds MAX_MYSTERY_GIFT_PARTNERS * 2
sMysteryGiftDecorationsReceived:: flag_array NUM_NON_TROPHY_DECOS
	ds 4
sMysteryGiftTimer:: dw
	ds 1
sMysteryGiftTrainerHouseFlag:: db
sMysteryGiftPartnerName:: ds NAME_LENGTH
sMysteryGiftUnusedFlag:: db
sMysteryGiftTrainer:: ds wMysteryGiftTrainerEnd - wMysteryGiftTrainer
sBackupMysteryGiftItemEnd::

	ds $30

sRTCStatusFlags:: db
	ds 7
sLuckyNumberDay:: db
sLuckyIDNumber::  dw


SECTION "Backup Save", SRAM

sBackupOptions:: ds wOptionsEnd - wOptions

sBackupCheckValue1:: db ; loaded with SAVE_CHECK_VALUE_1, used to check save corruption

sBackupGameData::
sBackupPlayerData::  ds wPlayerDataEnd - wPlayerData
sBackupCurMapData::  ds wCurMapDataEnd - wCurMapData
sBackupPokemonData:: ds wPokemonDataEnd - wPokemonData
sBackupGameDataEnd::

	ds $18a

sBackupChecksum:: dw

sBackupCheckValue2:: db ; loaded with SAVE_CHECK_VALUE_2, used to check save corruption

sStackTop:: dw

if DEF(_DEBUG)
sRTCHaltCheckValue:: dw
sSkipBattle:: db
sDebugTimeCyclesSinceLastCall:: db
sOpenedInvalidSRAM:: db
sIsBugMon:: db
endc


SECTION "Save", SRAM

sOptions:: ds wOptionsEnd - wOptions

sCheckValue1:: db ; loaded with SAVE_CHECK_VALUE_1, used to check save corruption

sGameData::
sPlayerData::  ds wPlayerDataEnd - wPlayerData
sCurMapData::  ds wCurMapDataEnd - wCurMapData
sPokemonData:: ds wPokemonDataEnd - wPokemonData
sGameDataEnd::

	ds $18a

sChecksum:: dw

sCheckValue2:: db ; loaded with SAVE_CHECK_VALUE_2, used to check save corruption


SECTION "Active Box", SRAM

sBox:: box sBox

	ds $100


SECTION "Link Battle Data", SRAM

sLinkBattleStats::
sLinkBattleWins::   dw
sLinkBattleLosses:: dw
sLinkBattleDraws::  dw

sLinkBattleRecord::
; sLinkBattleRecord1 - sLinkBattleRecord5
for n, 1, NUM_LINK_BATTLE_RECORDS + 1
sLinkBattleRecord{d:n}:: link_battle_record sLinkBattleRecord{d:n}
endr
sLinkBattleStatsEnd::


SECTION "SRAM Hall of Fame", SRAM

sHallOfFame::
; sHallOfFame1 - sHallOfFame30
for n, 1, NUM_HOF_TEAMS + 1
sHallOfFame{d:n}:: hall_of_fame sHallOfFame{d:n}
endr
sHallOfFameEnd::


SECTION "SRAM Crystal Data", SRAM

sGSBallFlag:: db

sCrystalData:: ds wCrystalDataEnd - wCrystalData

sGSBallFlagBackup:: db


SECTION "SRAM Battle Tower", SRAM

; Battle Tower data must be in SRAM because you can save and leave between battles
sBattleTowerChallengeState::
; 0: normal
; 2: battle tower
	db

sNrOfBeatenBattleTowerTrainers:: db
sBTChoiceOfLevelGroup:: db
; Battle Tower trainers are saved here, so nobody appears more than once
sBTTrainers:: ds BATTLETOWER_STREAK_LENGTH
sBattleTowerSaveFileFlags:: db
sBattleTowerReward:: db

sBTMonOfTrainers::
; team of previous trainer
; sBTMonPrevTrainer1 - sBTMonPrevTrainer3
for n, 1, BATTLETOWER_PARTY_LENGTH + 1
sBTMonPrevTrainer{d:n}:: db
endr
; team of preprevious trainer
; sBTMonPrevPrevTrainer1 - sBTMonPrevPrevTrainer3
for n, 1, BATTLETOWER_PARTY_LENGTH + 1
sBTMonPrevPrevTrainer{d:n}:: db
endr


; The PC boxes will not fit into one SRAM bank,
; so they use multiple SECTIONs
DEF box_n = 0
MACRO boxes
	rept \1
		DEF box_n += 1
	sBox{d:box_n}:: box sBox{d:box_n}
	endr
ENDM

SECTION "Boxes 1-7", SRAM

; sBox1 - sBox7
	boxes 7

SECTION "Boxes 8-14", SRAM

; sBox8 - sBox14
	boxes 7

; All 14 boxes fit exactly within 2 SRAM banks
	assert box_n == NUM_BOXES, \
		"boxes: Expected {d:NUM_BOXES} total boxes, got {d:box_n}"


SECTION "SRAM Mobile 1", SRAM

	ds $7

sEZChatMessages::
sEZChatIntroductionMessage:: ds EASY_CHAT_MESSAGE_LENGTH
sEZChatBattleMessages::
sEZChatBeginBattleMessage::  ds EASY_CHAT_MESSAGE_LENGTH
sEZChatWinBattleMessage::    ds EASY_CHAT_MESSAGE_LENGTH
sEZChatLoseBattleMessage::   ds EASY_CHAT_MESSAGE_LENGTH

s4_a037:: ds 4

s4_a03b:: ds 37 * 40

s4_a603:: ds 8

s4_a60b:: db
s4_a60c:: db
s4_a60d:: db

s4_a60e:: dw

	ds $1f0

sMobileBattleTimer:: ds 3

	ds $7fd

sMobileAdapterStatus:: db


SECTION "SRAM Mobile 2", SRAM

sGSBallFlagJP:: db ; unused

sTrainerRankings::
sTrainerRankingGameTimeHOF:: ds 4
sTrainerRankingStepCountHOF:: ds 4
sTrainerRankingHealingsHOF:: ds 4
sTrainerRankingBattlesHOF:: ds 3
sTrainerRankingStepCount:: ds 4
sTrainerRankingBattleTowerWins:: ds 4
sTrainerRankingTMsHMsTaught:: ds 3
sTrainerRankingBattles:: ds 3
sTrainerRankingWildBattles:: ds 3
sTrainerRankingTrainerBattles:: ds 3
sTrainerRankingUnused1:: ds 3
sTrainerRankingHOFEntries:: ds 3
sTrainerRankingWildMonsCaught:: ds 3
sTrainerRankingHookedEncounters:: ds 3
sTrainerRankingEggsHatched:: ds 3
sTrainerRankingMonsEvolved:: ds 3
sTrainerRankingFruitPicked:: ds 3
sTrainerRankingHealings:: ds 3
sTrainerRankingMysteryGift:: ds 3
sTrainerRankingTrades:: ds 3
sTrainerRankingFly:: ds 3
sTrainerRankingSurf:: ds 3
sTrainerRankingWaterfall:: ds 3
sTrainerRankingWhiteOuts:: ds 3
sTrainerRankingLuckyNumberShow:: ds 3
sTrainerRankingPhoneCalls:: ds 3
sTrainerRankingUnused2:: ds 3
sTrainerRankingLinkBattles:: ds 3
sTrainerRankingSplash:: ds 3
sTrainerRankingTreeEncounters:: ds 3
sTrainerRankingUnused3:: ds 3
sTrainerRankingColosseumWins:: ds 3
sTrainerRankingColosseumLosses:: ds 3
sTrainerRankingColosseumDraws:: ds 3
sTrainerRankingSelfdestruct:: ds 3
sTrainerRankingCurrentSlotsStreak:: ds 2
sTrainerRankingLongestSlotsStreak:: ds 2
sTrainerRankingTotalSlotsPayouts:: ds 4
sTrainerRankingTotalBattlePayouts:: ds 4
sTrainerRankingLongestMagikarp:: ds 2
sTrainerRankingShortestMagikarp:: ds 2
sTrainerRankingBugContestScore:: ds 2
sTrainerRankingsChecksum:: ds 2
sTrainerRankingsEnd::

sGSBallFlagBackupJP:: db ; unused

sTrainerRankingsBackup:: ds sTrainerRankingsEnd - sTrainerRankings

	ds $6fa

s5_a800:: db

sOfferEmail::      ds MOBILE_EMAIL_LENGTH
sOfferTrainerID::  dw
sOfferSecretID::   dw
sOfferGender::     db
sOfferSpecies::    db
sOfferReqGender::  db
sOfferReqSpecies:: db
sOfferMonSender::  ds NAME_LENGTH_JAPANESE - 1
sOfferMon::        party_struct sOfferMon
sOfferMonOT::      ds NAME_LENGTH_JAPANESE - 1
sOfferMonNick::    ds NAME_LENGTH_JAPANESE - 1
sOfferMonMail::    mailmsg_jp sOfferMonMail

s5_a890:: db
s5_a891:: db
s5_a892:: db
s5_a893:: db
s5_a894:: ds 6
s5_a89a:: dw
s5_a89c:: ds 22
s5_a8b2:: ds 150

s5_a948:: ds 246

	ds $3

s5_aa41:: ds 4

	ds $2

s5_aa47:: db
s5_aa48:: db

	ds $1

s5_aa4a:: db

sMobileLoginPassword:: ds MOBILE_LOGIN_PASSWORD_LENGTH

	ds $1

s5_aa5d:: ds MOBILE_LOGIN_PASSWORD_LENGTH

	ds $4

s5_aa72:: db
s5_aa73:: ds 12
s5_aa7f:: ds 12

s5_aa8b:: db
s5_aa8c:: db
s5_aa8d:: db
s5_aa8e:: ds 7 * $cc

	ds $1

s5_b023:: ds 105
s5_b08c:: ds 4
s5_b090:: db
s5_b091:: db
s5_b092:: ds 31

	ds $100

s5_b1b1:: db
s5_b1b2:: db
s5_b1b3:: db
s5_b1b4:: db

	ds $1e

s5_b1d3::

	ds $120

s5_b2f3:: db
s5_b2f4:: ds 4

	ds $1

s5_b2f9:: db
s5_b2fa:: db
s5_b2fb:: db

	ds $b49

s5_be45:: db
s5_be46:: db

	ds $1b8

s5_bfff:: db


SECTION "SRAM Mobile 3", SRAM

s6_a000:: db
	db
s6_a002:: db
s6_a003:: db
s6_a004:: db
s6_a005:: db
s6_a006:: ds $1000

SECTION "SRAM Mobile 4", SRAM

sMobileStadiumFlag:: db
s7_a001:: db

	ds $7fe

sMobileAdapterStatus2:: db
