SECTION "Scratch", SRAM

sScratch:: ds $600


SECTION "SRAM Bank 0", SRAM

sPartyMail::
sPartyMon1Mail:: mailmsg sPartyMon1Mail
sPartyMon2Mail:: mailmsg sPartyMon2Mail
sPartyMon3Mail:: mailmsg sPartyMon3Mail
sPartyMon4Mail:: mailmsg sPartyMon4Mail
sPartyMon5Mail:: mailmsg sPartyMon5Mail
sPartyMon6Mail:: mailmsg sPartyMon6Mail

sPartyMailBackup::
sPartyMon1MailBackup:: mailmsg sPartyMon1MailBackup
sPartyMon2MailBackup:: mailmsg sPartyMon2MailBackup
sPartyMon3MailBackup:: mailmsg sPartyMon3MailBackup
sPartyMon4MailBackup:: mailmsg sPartyMon4MailBackup
sPartyMon5MailBackup:: mailmsg sPartyMon5MailBackup
sPartyMon6MailBackup:: mailmsg sPartyMon6MailBackup

sMailboxCount:: db
sMailbox::
sMailbox1::  mailmsg sMailbox1
sMailbox2::  mailmsg sMailbox2
sMailbox3::  mailmsg sMailbox3
sMailbox4::  mailmsg sMailbox4
sMailbox5::  mailmsg sMailbox5
sMailbox6::  mailmsg sMailbox6
sMailbox7::  mailmsg sMailbox7
sMailbox8::  mailmsg sMailbox8
sMailbox9::  mailmsg sMailbox9
sMailbox10:: mailmsg sMailbox10

sMailboxCountBackup:: db
sMailboxBackup::
sMailbox1Backup::  mailmsg sMailbox1Backup
sMailbox2Backup::  mailmsg sMailbox2Backup
sMailbox3Backup::  mailmsg sMailbox3Backup
sMailbox4Backup::  mailmsg sMailbox4Backup
sMailbox5Backup::  mailmsg sMailbox5Backup
sMailbox6Backup::  mailmsg sMailbox6Backup
sMailbox7Backup::  mailmsg sMailbox7Backup
sMailbox8Backup::  mailmsg sMailbox8Backup
sMailbox9Backup::  mailmsg sMailbox9Backup
sMailbox10Backup:: mailmsg sMailbox10Backup

sMysteryGiftItem:: db
sMysteryGiftUnlocked:: db
sBackupMysteryGiftItem:: db
sNumDailyMysteryGiftPartnerIDs:: db
sDailyMysteryGiftPartnerIDs:: ds 5 * 2 ; maximum 5 per day, 2 bytes per ID
sMysteryGiftDecorationsReceived:: flag_array NUM_NON_TROPHY_DECOS
	ds 4
sMysteryGiftTimer:: db
sMysteryGiftTimerStartDay:: db
	ds 1
sMysteryGiftTrainerHouseFlag:: db
sMysteryGiftPartnerName:: ds NAME_LENGTH
	ds 1
sMysteryGiftTrainer:: ds (1 + 1 + NUM_MOVES) * PARTY_LENGTH + 2
sBackupMysteryGiftItemEnd::

	ds $30

sRTCStatusFlags:: ds 8
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
sLinkBattleRecord1:: link_battle_record sLinkBattleRecord1
sLinkBattleRecord2:: link_battle_record sLinkBattleRecord2
sLinkBattleRecord3:: link_battle_record sLinkBattleRecord3
sLinkBattleRecord4:: link_battle_record sLinkBattleRecord4
sLinkBattleRecord5:: link_battle_record sLinkBattleRecord5
sLinkBattleStatsEnd::


SECTION "SRAM Hall of Fame", SRAM

sHallOfFame::
sHallOfFame01:: hall_of_fame sHallOfFame01
sHallOfFame02:: hall_of_fame sHallOfFame02
sHallOfFame03:: hall_of_fame sHallOfFame03
sHallOfFame04:: hall_of_fame sHallOfFame04
sHallOfFame05:: hall_of_fame sHallOfFame05
sHallOfFame06:: hall_of_fame sHallOfFame06
sHallOfFame07:: hall_of_fame sHallOfFame07
sHallOfFame08:: hall_of_fame sHallOfFame08
sHallOfFame09:: hall_of_fame sHallOfFame09
sHallOfFame10:: hall_of_fame sHallOfFame10
sHallOfFame11:: hall_of_fame sHallOfFame11
sHallOfFame12:: hall_of_fame sHallOfFame12
sHallOfFame13:: hall_of_fame sHallOfFame13
sHallOfFame14:: hall_of_fame sHallOfFame14
sHallOfFame15:: hall_of_fame sHallOfFame15
sHallOfFame16:: hall_of_fame sHallOfFame16
sHallOfFame17:: hall_of_fame sHallOfFame17
sHallOfFame18:: hall_of_fame sHallOfFame18
sHallOfFame19:: hall_of_fame sHallOfFame19
sHallOfFame20:: hall_of_fame sHallOfFame20
sHallOfFame21:: hall_of_fame sHallOfFame21
sHallOfFame22:: hall_of_fame sHallOfFame22
sHallOfFame23:: hall_of_fame sHallOfFame23
sHallOfFame24:: hall_of_fame sHallOfFame24
sHallOfFame25:: hall_of_fame sHallOfFame25
sHallOfFame26:: hall_of_fame sHallOfFame26
sHallOfFame27:: hall_of_fame sHallOfFame27
sHallOfFame28:: hall_of_fame sHallOfFame28
sHallOfFame29:: hall_of_fame sHallOfFame29
sHallOfFame30:: hall_of_fame sHallOfFame30
sHallOfFameEnd::


SECTION "SRAM Crystal Data", SRAM

sMobileEventIndex:: db

sCrystalData:: ds wCrystalDataEnd - wCrystalData

sMobileEventIndexBackup:: db


SECTION "SRAM Battle Tower", SRAM

; Battle Tower data must be in SRAM because you can save and leave between battles
sBattleTowerChallengeState::
; 0: normal
; 2: battle tower
	db

sBattleTower::
sNrOfBeatenBattleTowerTrainers:: db
sBTChoiceOfLevelGroup:: db
; Battle Tower trainers are saved here, so nobody appears more than once
sBTTrainers:: ds BATTLETOWER_STREAK_LENGTH ; sbe48
sBattleTowerSaveFileFlags:: db
sBattleTowerReward:: db

; team of previous trainer
sBTMonOfTrainers::
sBTMonPrevTrainer1:: db
sBTMonPrevTrainer2:: db
sBTMonPrevTrainer3:: db
; team of preprevious trainer
sBTMonPrevPrevTrainer1:: db
sBTMonPrevPrevTrainer2:: db
sBTMonPrevPrevTrainer3:: db


SECTION "Boxes 1-7", SRAM

sBox1::  box sBox1
sBox2::  box sBox2
sBox3::  box sBox3
sBox4::  box sBox4
sBox5::  box sBox5
sBox6::  box sBox6
sBox7::  box sBox7


SECTION "Boxes 8-14", SRAM

sBox8::  box sBox8
sBox9::  box sBox9
sBox10:: box sBox10
sBox11:: box sBox11
sBox12:: box sBox12
sBox13:: box sBox13
sBox14:: box sBox14


SECTION "SRAM Mobile 1", SRAM

	ds $7

s4_a007:: ; struct size $30

	ds $c

s4_a013:: ds 36

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

s4_b000:: db


SECTION "SRAM Mobile 2", SRAM

	ds 1 ; former location for sMobileEventIndex, moved to 1:BE3C in English

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

	ds 1 ; Former location for sMobileEventIndexBackup, moved to 1:BE44 in English

sTrainerRankingsBackup:: ds sTrainerRankingsEnd - sTrainerRankings

	ds $6fa

s5_a800:: db

	ds $24

s5_a825:: db
s5_a826:: db

	ds $6d

s5_a894:: ds NAME_LENGTH_JAPANESE

	ds $1

s5_a89b:: ds 1
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

s6_a000::


SECTION "SRAM Mobile 4", SRAM

s7_a000::

	ds $800

s7_a800:: db
