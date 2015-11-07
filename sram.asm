SRAM_Begin EQU $a000
SRAM_End   EQU $c000
GLOBAL SRAM_Begin, SRAM_End


SECTION "Scratch", SRAM, BANK [0]
sScratch::


SECTION "SRAM Bank 0", SRAM [$a600], BANK [0]

sPartyScratch1:: ds 6 * SCRATCHMON_STRUCT_LENGTH
sPartyScratch2:: ds 6 * SCRATCHMON_STRUCT_LENGTH
s0_a834:: ds 1
s0_a835:: ds 10 * SCRATCHMON_STRUCT_LENGTH
s0_aa0b:: ds 1
s0_aa0c:: ds 10 * SCRATCHMON_STRUCT_LENGTH

sMysteryGiftItem:: ds 1
s0_abe3:: ds 1
s0_abe4:: ds 1
s0_abe5:: ds 1
s0_abe6:: ds 10
s0_abf0:: ds 10
sMysteryGiftTimer:: ds 1
sMysteryGiftTimerStartDay:: ds 1
	ds 1
sMysteryGiftTrainerHouseFlag:: ds 1
s0_abfe:: ds 12
sMysteryGiftTrainer:: ds (1 + 1 + NUM_MOVES) * PARTY_LENGTH + 1
	ds 1
s0_abe4End::

	ds $30

s0_ac60:: ds 8
sLuckyNumberDay:: ds 1
sLuckyIDNumber:: ds 2

	ds $b200 - $ac6b

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

s1_a008:: ds 1

sGameData::
sPlayerData::  ds wPlayerDataEnd - wPlayerData
sMapData::     ds wMapDataEnd - wMapData
sPokemonData:: ds wPokemonDataEnd - wPokemonData
sGameDataEnd::

; ab83
	ds $18a
; ad0d

sChecksum::   ds 2
s1_ad0f::     ds 1

; ad10
	box sBox
; b160

	ds $100

sLinkBattleStats:: ; b260
sLinkBattleWins::   ds 2
sLinkBattleLosses:: ds 2
sLinkBattleDraws::  ds 2
	ds 90
sLinkBattleStatsEnd::

sHallOfFame:: ; b2c0
	ds HOF_LENGTH * NUM_HOF_TEAMS
sHallOfFameEnd::

sMobileEventIndex:: ds 1

sCrystalData::
	ds wCrystalDataEnd - wCrystalData
sMobileEventIndexBackup:: ds 1
s1_be45:: ds 1

; data of the BattleTower must be in SRAM because you can save and leave between battles
sBattleTower:: ; be46
sNrOfBeatenBattleTowerTrainers::
sbe46:: ds 1
sbe47:: ds 1
; The 7 trainers of the BattleTower are saved here, so nobody appears more than once
sBTTrainers:: ; sbe48
	ds 7
sbe4f:: ds 1
sbe50:: ds 1
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
