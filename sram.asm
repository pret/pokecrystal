SRAM_Begin EQU $a000
SRAM_End   EQU $c000
GLOBAL SRAM_Begin, SRAM_End


SECTION "Scratch", SRAM
sScratch::


SECTION "SRAM Bank 0", SRAM

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
sMysteryGiftTrainer:: ds (1 + 1 + NUM_MOVES) * PARTY_LENGTH + 2 ; ac0a
sBackupMysteryGiftItemEnd::

	ds $30

sRTCStatusFlags:: ds 8
sLuckyNumberDay:: ds 1
sLuckyIDNumber:: ds 2

SECTION "Backup Save", SRAM
sBackupOptions:: ds OptionsEnd - Options

s0_b208:: ds 1 ; loaded with 99, used to check save corruption

sBackupGameData:: ; b209
sBackupPlayerData::  ds wPlayerDataEnd - wPlayerData
sBackupMapData::     ds wMapDataEnd - wMapData
sBackupPokemonData:: ds wPokemonDataEnd - wPokemonData
sBackupGameDataEnd::

; bd83
	ds $18a
; bf0d

sBackupChecksum:: ds 2
s0_bf0f:: ds 1 ; loaded with 0x7f, used to check save corruption
sStackTop:: ds 2


SECTION "Save", SRAM

sOptions:: ds OptionsEnd - Options

s1_a008:: ds 1 ; loaded with 99, used to check save corruption

sGameData:: ; a009
sPlayerData::  ds wPlayerDataEnd - wPlayerData
sMapData::     ds wMapDataEnd - wMapData
sPokemonData:: ds wPokemonDataEnd - wPokemonData
sGameDataEnd::

; ab83
	ds $18a
; ad0d

sChecksum::   ds 2
s1_ad0f::     ds 1 ; loaded with 0x7f, used to check save corruption

SECTION "Active Box", SRAM
; ad10
	box sBox
; b160

	ds $f4
SECTION "Link Battle Data", SRAM
sLinkBattleResults:: ds $c

sLinkBattleStats:: ; b260
sLinkBattleWins::   ds 2
sLinkBattleLosses:: ds 2 ; b262
sLinkBattleDraws::  ds 2 ; b264
link_battle_record: MACRO
\1Name:: ds NAME_LENGTH +- 1
\1ID:: ds 2
\1Wins:: ds 2
\1Losses:: ds 2
\1Draws:: ds 2
endm
sLinkBattleRecord::
sLinkBattleRecord1:: link_battle_record sLinkBattleRecord1
sLinkBattleRecord2:: link_battle_record sLinkBattleRecord2
sLinkBattleRecord3:: link_battle_record sLinkBattleRecord3
sLinkBattleRecord4:: link_battle_record sLinkBattleRecord4
sLinkBattleRecord5:: link_battle_record sLinkBattleRecord5
sLinkBattleStatsEnd::

SECTION "SRAM Hall of Fame", SRAM
sHallOfFame:: ; b2c0
; temporary until I can find a way to macrofy it
	hall_of_fame sHallOfFame01
	hall_of_fame sHallOfFame02
	hall_of_fame sHallOfFame03
	hall_of_fame sHallOfFame04
	hall_of_fame sHallOfFame05
	hall_of_fame sHallOfFame06
	hall_of_fame sHallOfFame07
	hall_of_fame sHallOfFame08
	hall_of_fame sHallOfFame09
	hall_of_fame sHallOfFame10
	hall_of_fame sHallOfFame11
	hall_of_fame sHallOfFame12
	hall_of_fame sHallOfFame13
	hall_of_fame sHallOfFame14
	hall_of_fame sHallOfFame15
	hall_of_fame sHallOfFame16
	hall_of_fame sHallOfFame17
	hall_of_fame sHallOfFame18
	hall_of_fame sHallOfFame19
	hall_of_fame sHallOfFame20
	hall_of_fame sHallOfFame21
	hall_of_fame sHallOfFame22
	hall_of_fame sHallOfFame23
	hall_of_fame sHallOfFame24
	hall_of_fame sHallOfFame25
	hall_of_fame sHallOfFame26
	hall_of_fame sHallOfFame27
	hall_of_fame sHallOfFame28
	hall_of_fame sHallOfFame29
	hall_of_fame sHallOfFame30

; x = 1
; rept NUM_HOF_TEAMS
; ; PRINTT("{x}\n")
; if STRLEN({x}) == 2
	; PRINTT(STRSUB({x},2,1))
	; hall_of_fame STRCAT("sHallOfFame0", STRSUB({x},2,1))
; else
	; PRINTT(STRSUB({x},2,2))
	; hall_of_fame STRCAT("sHallOfFame", STRSUB({x},2,2))
; endc
; x = x + 1
; endr
sHallOfFameEnd::

SECTION "SRAM Crystal Data", SRAM
sMobileEventIndex:: ds 1 ; be3c

sCrystalData::
	ds wCrystalDataEnd - wCrystalData
sMobileEventIndexBackup:: ds 1

SECTION "SRAM Battle Tower", SRAM
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
s1_be4f:: ds 1
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

SECTION "Boxes 8-14", SRAM
	box sBox8
	box sBox9
	box sBox10
	box sBox11
	box sBox12
	box sBox13
	box sBox14
