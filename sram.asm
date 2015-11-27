SRAM_Begin EQU $a000
SRAM_End   EQU $c000
GLOBAL SRAM_Begin, SRAM_End


SECTION "Scratch", SRAM, BANK [0]
sScratch::


SECTION "SRAM Bank 0", SRAM [$a600], BANK [0]

; a600
sPartyMail::
sPartyMon1Mail::       mailmsg sPartyMon1Mail
sPartyMon2Mail::       mailmsg sPartyMon2Mail
sPartyMon3Mail::       mailmsg sPartyMon3Mail
sPartyMon4Mail::       mailmsg sPartyMon4Mail
sPartyMon5Mail::       mailmsg sPartyMon5Mail
sPartyMon6Mail::       mailmsg sPartyMon6Mail

; a71a
sPartyMailBackup::
sPartyMon1MailBackup:: mailmsg sPartyMon1MailBackup
sPartyMon2MailBackup:: mailmsg sPartyMon2MailBackup
sPartyMon3MailBackup:: mailmsg sPartyMon3MailBackup
sPartyMon4MailBackup:: mailmsg sPartyMon4MailBackup
sPartyMon5MailBackup:: mailmsg sPartyMon5MailBackup
sPartyMon6MailBackup:: mailmsg sPartyMon6MailBackup

; a834
sMailboxCount:: ds 1
sMailbox::
sMailbox1::            mailmsg sMailbox1
sMailbox2::            mailmsg sMailbox2
sMailbox3::            mailmsg sMailbox3
sMailbox4::            mailmsg sMailbox4
sMailbox5::            mailmsg sMailbox5
sMailbox6::            mailmsg sMailbox6
sMailbox7::            mailmsg sMailbox7
sMailbox8::            mailmsg sMailbox8
sMailbox9::            mailmsg sMailbox9
sMailbox10::           mailmsg sMailbox10

; aa0b
sMailboxCountBackup:: ds 1
sMailboxBackup::
sMailbox1Backup::      mailmsg sMailbox1Backup
sMailbox2Backup::      mailmsg sMailbox2Backup
sMailbox3Backup::      mailmsg sMailbox3Backup
sMailbox4Backup::      mailmsg sMailbox4Backup
sMailbox5Backup::      mailmsg sMailbox5Backup
sMailbox6Backup::      mailmsg sMailbox6Backup
sMailbox7Backup::      mailmsg sMailbox7Backup
sMailbox8Backup::      mailmsg sMailbox8Backup
sMailbox9Backup::      mailmsg sMailbox9Backup
sMailbox10Backup::     mailmsg sMailbox10Backup

; abe2
sMysteryGiftItem:: ds 1
sMysteryGiftUnlocked:: ds 1
sBackupMysteryGiftItem:: ds 1
sNumDailyMysteryGiftPartnerIDs:: ds 1
sDailyMysteryGiftPartnerIDs:: ds 5 * 2 ; maximum 5 per day, 2 bytes per ID
sMysteryGiftDecorationsReceived:: flag_array NUM_NON_TROPHY_DECOS
	ds 4
sMysteryGiftTimer:: ds 1
sMysteryGiftTimerStartDay:: ds 1
	ds 1
sMysteryGiftTrainerHouseFlag:: ds 1
sMysteryGiftPartnerName:: ds NAME_LENGTH
s0_ac09:: ds 1
sMysteryGiftTrainer:: ds (1 + 1 + NUM_MOVES) * PARTY_LENGTH + 2
sBackupMysteryGiftItemEnd::

	ds $30

sRTCStatusFlags:: ds 8
sLuckyNumberDay:: ds 1
sLuckyIDNumber:: ds 2

SECTION "Backup Save", SRAM [$b200], BANK [0]
sBackupOptions:: ds OptionsEnd - Options

s0_b208:: ds 1

sBackupGameData::
sBackupPlayerData::  ds wPlayerDataEnd - wPlayerData
sBackupMapData::     ds wMapDataEnd - wMapData
sBackupPokemonData:: ds wPokemonDataEnd - wPokemonData
sBackupGameDataEnd::

; bd83
	ds $18a
; bf0d

sBackupChecksum:: ds 2
s0_bf0f:: ds 1
sStackTop:: ds 2


SECTION "SRAM Bank 1", SRAM, BANK [1]

sOptions:: ds OptionsEnd - Options

s1_a008:: ds 1 ; loaded with 99, used to check save corruption

sGameData::
sPlayerData::  ds wPlayerDataEnd - wPlayerData
sMapData::     ds wMapDataEnd - wMapData
sPokemonData:: ds wPokemonDataEnd - wPokemonData
sGameDataEnd::

; ab83
	ds $18a
; ad0d

sChecksum::   ds 2
s1_ad0f::     ds 1 ; loaded with 0x7f, used to check save corruption

; ad10
	box sBox
; b160

	ds $f4
s1_b254:: ds $c

sLinkBattleStats:: ; b260
sLinkBattleWins::   ds 2
sLinkBattleLosses:: ds 2 ; b262
sLinkBattleDraws::  ds 2 ; b264
s1_b266::
	ds 17
s1_b277::
	ds 73
sLinkBattleStatsEnd::

sHallOfFame:: ; b2c0
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

sMobileEventIndex:: ds 1

sCrystalData::
	ds wCrystalDataEnd - wCrystalData
sMobileEventIndexBackup:: ds 1

SECTION "SRAM Battle Tower", SRAM, BANK [1]
; data of the BattleTower must be in SRAM because you can save and leave between battles
sBattleTowerChallengeState:: ds 1
; 0: normal
; 2: battle tower

sBattleTower:: ; be46
sNrOfBeatenBattleTowerTrainers:: ds 1
sBTChoiceOfLevelGroup:: ds 1
; The 7 trainers of the BattleTower are saved here, so nobody appears more than once
sBTTrainers:: ; sbe48
	ds 7
sbe4f:: ds 1
sBattleTowerReward:: ds 1
; Pkmn of previous trainer
sBTPkmnOfTrainers:: ; 0xbe51
sBTPkmnPrevTrainer1::
	ds 1
sBTPkmnPrevTrainer2:: ds 1
sBTPkmnPrevTrainer3:: ds 1
; Pkmn of preprevious trainer
sBTPkmnPrevPrevTrainer1:: ds 1
sBTPkmnPrevPrevTrainer2:: ds 1
sBTPkmnPrevPrevTrainer3:: ds 1


SECTION "Boxes 1-7",  SRAM, BANK [2]
	box sBox1
	box sBox2
	box sBox3
	box sBox4
	box sBox5
	box sBox6
	box sBox7

SECTION "Boxes 8-14", SRAM, BANK [3]
	box sBox8
	box sBox9
	box sBox10
	box sBox11
	box sBox12
	box sBox13
	box sBox14
