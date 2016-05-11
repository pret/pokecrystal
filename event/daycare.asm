	const_def
	const DAYCARETEXT_MAN_INTRO
	const DAYCARETEXT_MAN_EGG
	const DAYCARETEXT_LADY_INTRO
	const DAYCARETEXT_LADY_EGG
	const DAYCARETEXT_WHICH_ONE
	const DAYCARETEXT_DEPOSIT
	const DAYCARETEXT_CANT_BREED_EGG
	const DAYCARETEXT_LAST_MON
	const DAYCARETEXT_LAST_ALIVE_MON
	const DAYCARETEXT_COME_BACK_LATER
	const DAYCARETEXT_REMOVE_MAIL
	const DAYCARETEXT_GENIUSES
	const DAYCARETEXT_ASK_WITHDRAW
	const DAYCARETEXT_WITHDRAW
	const DAYCARETEXT_TOO_SOON
	const DAYCARETEXT_PARTY_FULL
	const DAYCARETEXT_NOT_ENOUGH_MONEY
	const DAYCARETEXT_OH_FINE
	const DAYCARETEXT_COME_AGAIN
	const DAYCARETEXT_13

Special_DayCareMan: ; 166d6
	ld hl, wDaycareMan
	bit 0, [hl]
	jr nz, .AskWithdrawMon
	ld hl, wDaycareMan
	ld a, DAYCARETEXT_MAN_INTRO
	call DayCareManIntroText
	jr c, .cancel
	call DayCareAskDepositPokemon
	jr c, .print_text
	callba DepositMonWithDaycareMan
	ld hl, wDaycareMan
	set 0, [hl]
	call DayCare_DepositPokemonText
	call DayCare_InitBreeding
	ret

.AskWithdrawMon:
	callba GetBreedMon1LevelGrowth
	ld hl, wBreedMon1Nick
	call GetPriceToRetrieveBreedmon
	call DayCare_AskWithdrawBreedMon
	jr c, .print_text
	callba RetrievePokemonFromDaycareMan
	call DayCare_TakeMoney_PlayCry
	ld hl, wDaycareMan
	res 0, [hl]
	res 5, [hl]
	jr .cancel

.print_text
	call PrintDayCareText

.cancel
	ld a, DAYCARETEXT_13
	call PrintDayCareText
	ret
; 1672a

Special_DayCareLady: ; 1672a
	ld hl, wDaycareLady
	bit 0, [hl]
	jr nz, .AskWithdrawMon
	ld hl, wDaycareLady
	ld a, DAYCARETEXT_LADY_INTRO
	call DayCareLadyIntroText
	jr c, .cancel
	call DayCareAskDepositPokemon
	jr c, .print_text
	callba DepositMonWithDaycareLady
	ld hl, wDaycareLady
	set 0, [hl]
	call DayCare_DepositPokemonText
	call DayCare_InitBreeding
	ret

.AskWithdrawMon:
	callba GetBreedMon2LevelGrowth
	ld hl, wBreedMon2Nick
	call GetPriceToRetrieveBreedmon
	call DayCare_AskWithdrawBreedMon
	jr c, .print_text
	callba RetrievePokemonFromDaycareLady
	call DayCare_TakeMoney_PlayCry
	ld hl, wDaycareLady
	res 0, [hl]
	ld hl, wDaycareMan
	res 5, [hl]
	jr .cancel

.print_text
	call PrintDayCareText

.cancel
	ld a, DAYCARETEXT_13
	call PrintDayCareText
	ret
; 16781

DayCareLadyIntroText: ; 16781
	bit 7, [hl]
	jr nz, .okay
	set 7, [hl]
	inc a
.okay
	call PrintDayCareText
	call YesNoBox
	ret
; 1678f

DayCareManIntroText: ; 1678f
	set 7, [hl]
	call PrintDayCareText
	call YesNoBox
	ret
; 16798

DayCareAskDepositPokemon: ; 16798
	ld a, [PartyCount]
	cp 2
	jr c, .OnlyOneMon
	ld a, DAYCARETEXT_WHICH_ONE
	call PrintDayCareText
	ld b, 6
	callba SelectTradeOrDaycareMon
	jr c, .Declined
	ld a, [CurPartySpecies]
	cp EGG
	jr z, .Egg
	callba CheckCurPartyMonFainted
	jr c, .OutOfUsableMons
	ld hl, PartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [CurPartyMon]
	call AddNTimes
	ld d, [hl]
	callba ItemIsMail
	jr c, .HoldingMail
	ld hl, PartyMonNicknames
	ld a, [CurPartyMon]
	call GetNick
	and a
	ret

.Declined:
	ld a, DAYCARETEXT_COME_AGAIN
	scf
	ret

.Egg:
	ld a, DAYCARETEXT_CANT_BREED_EGG
	scf
	ret

.OnlyOneMon:
	ld a, DAYCARETEXT_LAST_MON
	scf
	ret

.OutOfUsableMons:
	ld a, DAYCARETEXT_LAST_ALIVE_MON
	scf
	ret

.HoldingMail:
	ld a, DAYCARETEXT_REMOVE_MAIL
	scf
	ret
; 167f1

.DummyText: ; 0x167f1
	;
	text_jump UnknownText_0x1bdaa7
	db "@"
; 0x167f6

DayCare_DepositPokemonText: ; 167f6
	ld a, DAYCARETEXT_DEPOSIT
	call PrintDayCareText
	ld a, [CurPartySpecies]
	call PlayCry
	ld a, DAYCARETEXT_COME_BACK_LATER
	call PrintDayCareText
	ret
; 16807

DayCare_AskWithdrawBreedMon: ; 16807
	ld a, [StringBuffer2 + 1]
	and a
	jr nz, .grew_at_least_one_level
	ld a, DAYCARETEXT_PARTY_FULL
	call PrintDayCareText
	call YesNoBox
	jr c, .refused
	jr .check_money

.grew_at_least_one_level
	ld a, DAYCARETEXT_GENIUSES
	call PrintDayCareText
	call YesNoBox
	jr c, .refused
	ld a, DAYCARETEXT_ASK_WITHDRAW
	call PrintDayCareText
	call YesNoBox
	jr c, .refused

.check_money
	ld de, Money
	ld bc, StringBuffer2 + 2
	callba CompareMoney
	jr c, .not_enough_money
	ld a, [PartyCount]
	cp PARTY_LENGTH
	jr nc, .PartyFull
	and a
	ret

.refused
	ld a, DAYCARETEXT_COME_AGAIN
	scf
	ret

.not_enough_money
	ld a, DAYCARETEXT_OH_FINE
	scf
	ret

.PartyFull:
	ld a, DAYCARETEXT_NOT_ENOUGH_MONEY
	scf
	ret
; 16850

DayCare_TakeMoney_PlayCry: ; 16850
	ld bc, StringBuffer2 + 2
	ld de, Money
	callba TakeMoney
	ld a, DAYCARETEXT_WITHDRAW
	call PrintDayCareText
	ld a, [CurPartySpecies]
	call PlayCry
	ld a, DAYCARETEXT_TOO_SOON
	call PrintDayCareText
	ret
; 1686d

GetPriceToRetrieveBreedmon: ; 1686d
	ld a, b
	ld [StringBuffer2], a
	ld a, d
	ld [StringBuffer2 + 1], a
	ld de, StringBuffer1
	ld bc, NAME_LENGTH
	call CopyBytes
	ld hl, 0
	ld bc, 100
	ld a, [StringBuffer2 + 1]
	call AddNTimes
	ld de, 100
	add hl, de
	xor a
	ld [StringBuffer2 + 2], a
	ld a, h
	ld [StringBuffer2 + 3], a
	ld a, l
	ld [StringBuffer2 + 4], a
	ret
; 1689b

PrintDayCareText: ; 1689b
	ld e, a
	ld d, 0
	ld hl, .TextTable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	ret
; 168aa

.TextTable: ; 168aa
	dw .DayCareManIntro ; 00
	dw .DayCareManOddEgg ; 01
	dw .DayCareLadyIntro ; 02
	dw .DayCareLadyOddEgg ; 03
	dw .WhichOne ; 04
	dw .OkayIllRaiseYourMon ; 05
	dw .CantAcceptEgg ; 06
	dw .JustOneMon ; 07
	dw .LastHealthyMon ; 08
	dw .ComeBackForItLater ; 09
	dw .RemoveMail ; 0a
	dw .AreWeGeniusesOrWhat ; 0b
	dw .AskRetrieveMon ; 0c
	dw .PerfectHeresYourMon ; 0d
	dw .GotBackMon ; 0e
	dw .ImmediatelyWithdrawMon ; 0f
	dw .PartyFull ; 10
	dw .NotEnoughMoney ; 11
	dw .OhFineThen ; 12
	dw .ComeAgain ; 13
; 168d2

.DayCareManIntro: ; 0x168d2
	; I'm the DAY-CARE MAN. Want me to raise a #MON?
	text_jump UnknownText_0x1bdaa9
	db "@"
; 0x168d7

.DayCareManOddEgg: ; 0x168d7
	; I'm the DAY-CARE MAN. Do you know about EGGS? I was raising #MON with my wife, you see. We were shocked to find an EGG! How incredible is that? So, want me to raise a #MON?
	text_jump UnknownText_0x1bdad8
	db "@"
; 0x168dc

.DayCareLadyIntro: ; 0x168dc
	; I'm the DAY-CARE LADY. Should I raise a #MON for you?
	text_jump UnknownText_0x1bdb85
	db "@"
; 0x168e1

.DayCareLadyOddEgg: ; 0x168e1
	; I'm the DAY-CARE LADY. Do you know about EGGS? My husband and I were raising some #MON, you see. We were shocked to find an EGG! How incredible could that be? Should I raise a #MON for you?
	text_jump UnknownText_0x1bdbbb
	db "@"
; 0x168e6

.WhichOne: ; 0x168e6
	; What should I raise for you?
	text_jump UnknownText_0x1bdc79
	db "@"
; 0x168eb

.JustOneMon: ; 0x168eb
	; Oh? But you have just one #MON.
	text_jump UnknownText_0x1bdc97
	db "@"
; 0x168f0

.CantAcceptEgg: ; 0x168f0
	; Sorry, but I can't accept an EGG.
	text_jump UnknownText_0x1bdcb8
	db "@"
; 0x168f5

.RemoveMail: ; 0x168f5
	; Remove MAIL before you come see me.
	text_jump UnknownText_0x1bdcda
	db "@"
; 0x168fa

.LastHealthyMon: ; 0x168fa
	; If you give me that, what will you battle with?
	text_jump UnknownText_0x1bdcff
	db "@"
; 0x168ff

.OkayIllRaiseYourMon: ; 0x168ff
	; OK. I'll raise your @ .
	text_jump UnknownText_0x1bdd30
	db "@"
; 0x16904

.ComeBackForItLater: ; 0x16904
	; Come back for it later.
	text_jump UnknownText_0x1bdd4b
	db "@"
; 0x16909

.AreWeGeniusesOrWhat: ; 0x16909
	; Are we geniuses or what? Want to see your @ ?
	text_jump UnknownText_0x1bdd64
	db "@"
; 0x1690e

.AskRetrieveMon: ; 0x1690e
	; Your @ has grown a lot. By level, it's grown by @ . If you want your #MON back, it will cost ¥@ .
	text_jump UnknownText_0x1bdd96
	db "@"
; 0x16913

.PerfectHeresYourMon: ; 0x16913
	; Perfect! Here's your #MON.
	text_jump UnknownText_0x1bde04
	db "@"
; 0x16918

.GotBackMon: ; 0x16918
	; got back @ .
	text_jump UnknownText_0x1bde1f
	db "@"
; 0x1691d

.ImmediatelyWithdrawMon: ; 0x1691d
	; Huh? Back already? Your @ needs a little more time with us. If you want your #MON back, it will cost ¥100.
	text_jump UnknownText_0x1bde32
	db "@"
; 0x16922

.PartyFull: ; 0x16922
	; You have no room for it.
	text_jump UnknownText_0x1bdea2
	db "@"
; 0x16927

.NotEnoughMoney: ; 0x16927
	; You don't have enough money.
	text_jump UnknownText_0x1bdebc
	db "@"
; 0x1692c

.OhFineThen: ; 0x1692c
	; Oh, fine then.
	text_jump UnknownText_0x1bded9
	db "@"
; 0x16931

.ComeAgain: ; 0x16931
	; Come again.
	text_jump UnknownText_0x1bdee9
	db "@"
; 0x16936

Special_DayCareManOutside: ; 16936
	ld hl, wDaycareMan
	bit 6, [hl]
	jr nz, .AskGiveEgg
	ld hl, .NotYet
	call PrintText
	ret

.NotYet: ; 0x16944
	; Not yet…
	text_jump UnknownText_0x1bdef6
	db "@"
; 0x16949

.AskGiveEgg: ; 16949
	ld hl, .IntroText
	call PrintText
	call YesNoBox
	jr c, .Declined
	ld a, [PartyCount]
	cp PARTY_LENGTH
	jr nc, .PartyFull
	call DayCare_GiveEgg
	ld hl, wDaycareMan
	res 6, [hl]
	call DayCare_InitBreeding
	ld hl, .GotEggText
	call PrintText
	ld de, SFX_GET_EGG_FROM_DAYCARE_LADY
	call PlaySFX
	ld c, 120
	call DelayFrames
	ld hl, .TakeGoodCareOfItText
	jr .Load0

.Declined:
	ld hl, .IllKeepItThanksText

.Load0:
	call PrintText
	xor a
	ld [ScriptVar], a
	ret

.PartyFull:
	ld hl, .PartyFullText
	call PrintText
	ld a, $1
	ld [ScriptVar], a
	ret
; 16993

.IntroText: ; 0x16993
	; Ah, it's you! We were raising your #MON, and my goodness, were we surprised! Your #MON had an EGG! We don't know how it got there, but your #MON had it. You want it?
	text_jump UnknownText_0x1bdf00
	db "@"
; 0x16998

.GotEggText: ; 0x16998
	; received the EGG!
	text_jump UnknownText_0x1bdfa5
	db "@"
; 0x1699d

.TakeGoodCareOfItText: ; 0x1699d
	; Take good care of it.
	text_jump UnknownText_0x1bdfba
	db "@"
; 0x169a2

.IllKeepItThanksText: ; 0x169a2
	; Well then, I'll keep it. Thanks!
	text_jump UnknownText_0x1bdfd1
	db "@"
; 0x169a7

.PartyFullText: ; 0x169a7
	; You have no room in your party. Come back later.
	text_jump UnknownText_0x1bdff2
	db "@"
; 0x169ac

DayCare_GiveEgg: ; 169ac
	ld a, [wEggMonLevel]
	ld [CurPartyLevel], a
	ld hl, PartyCount
	ld a, [hl]
	cp PARTY_LENGTH
	jr nc, .PartyFull
	inc a
	ld [hl], a

	ld c, a
	ld b, 0
	add hl, bc
	ld a, EGG
	ld [hli], a
	ld a, [wEggMonSpecies]
	ld [CurSpecies], a
	ld [CurPartySpecies], a
	ld a, -1
	ld [hl], a

	ld hl, PartyMonNicknames
	ld bc, PKMN_NAME_LENGTH
	call DayCare_GetCurrentPartyMember
	ld hl, wEggNick
	call CopyBytes

	ld hl, PartyMonOT
	ld bc, NAME_LENGTH
	call DayCare_GetCurrentPartyMember
	ld hl, wEggOT
	call CopyBytes

	ld hl, PartyMon1
	ld bc, PARTYMON_STRUCT_LENGTH
	call DayCare_GetCurrentPartyMember
	ld hl, wEggMon
	ld bc, wEggMonEnd - wEggMon
	call CopyBytes

	call GetBaseData
	ld a, [PartyCount]
	dec a
	ld hl, PartyMon1
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld b, h
	ld c, l
	ld hl, MON_ID + 1
	add hl, bc
	push hl
	ld hl, MON_MAXHP
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	push bc
	ld b, $0
	predef CalcPkmnStats
	pop bc
	ld hl, MON_HP
	add hl, bc
	xor a
	ld [hli], a
	ld [hl], a
	and a
	ret

.PartyFull:
	scf
	ret
; 16a31

DayCare_GetCurrentPartyMember: ; 16a31
	ld a, [PartyCount]
	dec a
	call AddNTimes
	ld d, h
	ld e, l
	ret
; 16a3b

DayCare_InitBreeding: ; 16a3b
	ld a, [wDaycareLady]
	bit 0, a
	ret z
	ld a, [wDaycareMan]
	bit 0, a
	ret z
	callab CheckBreedmonCompatibility
	ld a, [wd265]
	and a
	ret z
	inc a
	ret z
	ld hl, wDaycareMan
	set 5, [hl]
.loop
	call Random
	cp 150
	jr c, .loop
	ld [wStepsToEgg], a
	jp .UselessJump
; 16a66

.UselessJump: ; 16a66
	xor a
	ld hl, wEggMon
	ld bc, wEggMonEnd - wEggMon
	call ByteFill
	ld hl, wEggNick
	ld bc, PKMN_NAME_LENGTH
	call ByteFill
	ld hl, wEggOT
	ld bc, NAME_LENGTH
	call ByteFill
	ld a, [wBreedMon1DVs]
	ld [TempMonDVs], a
	ld a, [wBreedMon1DVs + 1]
	ld [TempMonDVs + 1], a
	ld a, [wBreedMon1Species]
	ld [CurPartySpecies], a
	ld a, $3
	ld [MonType], a
	ld a, [wBreedMon1Species]
	cp DITTO
	ld a, $1
	jr z, .LoadWhichBreedmonIsTheMother
	ld a, [wBreedMon2Species]
	cp DITTO
	ld a, $0
	jr z, .LoadWhichBreedmonIsTheMother
	callba GetGender
	ld a, $0
	jr z, .LoadWhichBreedmonIsTheMother
	inc a

.LoadWhichBreedmonIsTheMother:
	ld [wBreedMotherOrNonDitto], a
	and a
	ld a, [wBreedMon1Species]
	jr z, .GotMother
	ld a, [wBreedMon2Species]

.GotMother:
	ld [CurPartySpecies], a
	callab GetPreEvolution
	callab GetPreEvolution
	ld a, EGG_LEVEL
	ld [CurPartyLevel], a

	ld a, [CurPartySpecies]
	cp NIDORAN_F
	jr nz, .GotEggSpecies
	call Random
	cp 1 + 50 percent
	ld a, NIDORAN_F
	jr c, .GotEggSpecies
	ld a, NIDORAN_M
.GotEggSpecies:
	ld [CurPartySpecies], a
	ld [CurSpecies], a
	ld [wEggMonSpecies], a

	call GetBaseData
	ld hl, wEggNick
	ld de, .String_EGG
	call CopyName2
	ld hl, PlayerName
	ld de, wEggOT
	ld bc, NAME_LENGTH
	call CopyBytes
	xor a
	ld [wEggMonItem], a
	ld de, wEggMonMoves
	xor a
	ld [Buffer1], a
	predef FillMoves
	callba InitEggMoves
	ld hl, wEggMonID
	ld a, [PlayerID]
	ld [hli], a
	ld a, [PlayerID + 1]
	ld [hl], a
	ld a, [CurPartyLevel]
	ld d, a
	callab CalcExpAtLevel
	ld hl, wEggMonExp
	ld a, [hMultiplicand]
	ld [hli], a
	ld a, [hMultiplicand + 1]
	ld [hli], a
	ld a, [hMultiplicand + 2]
	ld [hl], a
	xor a
	ld b, wEggMonDVs - wEggMonStatExp
	ld hl, wEggMonStatExp
.loop2
	ld [hli], a
	dec b
	jr nz, .loop2
	ld hl, wEggMonDVs
	call Random
	ld [hli], a
	ld [TempMonDVs], a
	call Random
	ld [hld], a
	ld [TempMonDVs + 1], a
	ld de, wBreedMon1DVs
	ld a, [wBreedMon1Species]
	cp DITTO
	jr z, .GotDVs
	ld de, wBreedMon2DVs
	ld a, [wBreedMon2Species]
	cp DITTO
	jr z, .GotDVs
	ld a, TEMPMON
	ld [MonType], a
	push hl
	callba GetGender
	pop hl
	ld de, wBreedMon1DVs
	ld bc, wBreedMon2DVs
	jr c, .SkipDVs
	jr z, .ParentCheck2
	ld a, [wBreedMotherOrNonDitto]
	and a
	jr z, .GotDVs
	ld d, b
	ld e, c
	jr .GotDVs

.ParentCheck2:
	ld a, [wBreedMotherOrNonDitto]
	and a
	jr nz, .GotDVs
	ld d, b
	ld e, c

.GotDVs:
	ld a, [de]
	inc de
	and $f
	ld b, a
	ld a, [hl]
	and $f0
	add b
	ld [hli], a
	ld a, [de]
	and $7
	ld b, a
	ld a, [hl]
	and $f8
	add b
	ld [hl], a

.SkipDVs:
	ld hl, StringBuffer1
	ld de, wMonOrItemNameBuffer
	ld bc, NAME_LENGTH
	call CopyBytes
	ld hl, wEggMonMoves
	ld de, wEggMonPP
	predef FillPP
	ld hl, wMonOrItemNameBuffer
	ld de, StringBuffer1
	ld bc, NAME_LENGTH
	call CopyBytes
	ld a, [BaseEggSteps]
	ld hl, wEggMonHappiness
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld a, [CurPartyLevel]
	ld [wEggMonLevel], a
	ret
; 16be0

.String_EGG: ; 16be0
	db "EGG@"
; 16be4
