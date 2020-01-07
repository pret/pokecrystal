; PrintDayCareText.TextTable indexes
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
	const DAYCARETEXT_GOT_BACK
	const DAYCARETEXT_TOO_SOON
	const DAYCARETEXT_PARTY_FULL
	const DAYCARETEXT_NOT_ENOUGH_MONEY
	const DAYCARETEXT_OH_FINE
	const DAYCARETEXT_COME_AGAIN

DayCareMan:
	ld hl, wDayCareMan
	bit DAYCAREMAN_HAS_MON_F, [hl]
	jr nz, .AskWithdrawMon
	ld hl, wDayCareMan
	ld a, DAYCARETEXT_MAN_INTRO
	call DayCareManIntroText
	jr c, .cancel
	call DayCareAskDepositPokemon
	jr c, .print_text
	farcall DepositMonWithDayCareMan
	ld hl, wDayCareMan
	set DAYCAREMAN_HAS_MON_F, [hl]
	call DayCare_DepositPokemonText
	call DayCare_InitBreeding
	ret

.AskWithdrawMon:
	farcall GetBreedMon1LevelGrowth
	ld hl, wBreedMon1Nick
	call GetPriceToRetrieveBreedmon
	call DayCare_AskWithdrawBreedMon
	jr c, .print_text
	farcall RetrieveMonFromDayCareMan
	call DayCare_GetBackMonForMoney
	ld hl, wDayCareMan
	res DAYCAREMAN_HAS_MON_F, [hl]
	res DAYCAREMAN_MONS_COMPATIBLE_F, [hl]
	jr .cancel

.print_text
	call PrintDayCareText

.cancel
	ld a, DAYCARETEXT_COME_AGAIN
	call PrintDayCareText
	ret

DayCareLady:
	ld hl, wDayCareLady
	bit DAYCARELADY_HAS_MON_F, [hl]
	jr nz, .AskWithdrawMon
	ld hl, wDayCareLady
	ld a, DAYCARETEXT_LADY_INTRO
	call DayCareLadyIntroText
	jr c, .cancel
	call DayCareAskDepositPokemon
	jr c, .print_text
	farcall DepositMonWithDayCareLady
	ld hl, wDayCareLady
	set DAYCARELADY_HAS_MON_F, [hl]
	call DayCare_DepositPokemonText
	call DayCare_InitBreeding
	ret

.AskWithdrawMon:
	farcall GetBreedMon2LevelGrowth
	ld hl, wBreedMon2Nick
	call GetPriceToRetrieveBreedmon
	call DayCare_AskWithdrawBreedMon
	jr c, .print_text
	farcall RetrieveMonFromDayCareLady
	call DayCare_GetBackMonForMoney
	ld hl, wDayCareLady
	res DAYCARELADY_HAS_MON_F, [hl]
	ld hl, wDayCareMan
	res DAYCAREMAN_MONS_COMPATIBLE_F, [hl]
	jr .cancel

.print_text
	call PrintDayCareText

.cancel
	ld a, DAYCARETEXT_COME_AGAIN
	call PrintDayCareText
	ret

DayCareLadyIntroText:
	bit DAYCARELADY_ACTIVE_F, [hl]
	jr nz, .okay
	set DAYCARELADY_ACTIVE_F, [hl]
	inc a
.okay
	call PrintDayCareText
	call YesNoBox
	ret

DayCareManIntroText:
	set DAYCAREMAN_ACTIVE_F, [hl]
	call PrintDayCareText
	call YesNoBox
	ret

DayCareAskDepositPokemon:
	ld a, [wPartyCount]
	cp 2
	jr c, .OnlyOneMon
	ld a, DAYCARETEXT_WHICH_ONE
	call PrintDayCareText
	ld b, PARTYMENUACTION_GIVE_MON
	farcall SelectTradeOrDayCareMon
	jr c, .Declined
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .Egg
	farcall CheckCurPartyMonFainted
	jr c, .OutOfUsableMons
	ld hl, wPartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wCurPartyMon]
	call AddNTimes
	ld d, [hl]
	farcall ItemIsMail
	jr c, .HoldingMail
	ld hl, wPartyMonNicknames
	ld a, [wCurPartyMon]
	call GetNick
	and a
	ret

.Declined:
	ld a, DAYCARETEXT_OH_FINE
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

.DaycareDummyText:
	text_far _DaycareDummyText
	text_end

DayCare_DepositPokemonText:
	ld a, DAYCARETEXT_DEPOSIT
	call PrintDayCareText
	ld a, [wCurPartySpecies]
	call PlayMonCry
	ld a, DAYCARETEXT_COME_BACK_LATER
	call PrintDayCareText
	ret

DayCare_AskWithdrawBreedMon:
	ld a, [wStringBuffer2 + 1]
	and a
	jr nz, .grew_at_least_one_level
	ld a, DAYCARETEXT_TOO_SOON
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
	ld de, wMoney
	ld bc, wStringBuffer2 + 2
	farcall CompareMoney
	jr c, .not_enough_money
	ld a, [wPartyCount]
	cp PARTY_LENGTH
	jr nc, .party_full
	and a
	ret

.refused
	ld a, DAYCARETEXT_OH_FINE
	scf
	ret

.not_enough_money
	ld a, DAYCARETEXT_NOT_ENOUGH_MONEY
	scf
	ret

.party_full
	ld a, DAYCARETEXT_PARTY_FULL
	scf
	ret

DayCare_GetBackMonForMoney:
	ld bc, wStringBuffer2 + 2
	ld de, wMoney
	farcall TakeMoney
	ld a, DAYCARETEXT_WITHDRAW
	call PrintDayCareText
	ld a, [wCurPartySpecies]
	call PlayMonCry
	ld a, DAYCARETEXT_GOT_BACK
	call PrintDayCareText
	ret

GetPriceToRetrieveBreedmon:
	ld a, b
	ld [wStringBuffer2], a
	ld a, d
	ld [wStringBuffer2 + 1], a
	ld de, wStringBuffer1
	ld bc, NAME_LENGTH
	call CopyBytes
	ld hl, 0
	ld bc, 100
	ld a, [wStringBuffer2 + 1]
	call AddNTimes
	ld de, 100
	add hl, de
	xor a
	ld [wStringBuffer2 + 2], a
	ld a, h
	ld [wStringBuffer2 + 3], a
	ld a, l
	ld [wStringBuffer2 + 4], a
	ret

PrintDayCareText:
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

.TextTable:
; entries correspond to DAYCARETEXT_* constants
	dw .DayCareManIntroText ; 00
	dw .DayCareManOddEggText ; 01
	dw .DayCareLadyIntroText ; 02
	dw .DayCareLadyOddEggText ; 03
	dw .WhatShouldIRaiseText ; 04
	dw .IllRaiseYourMonText ; 05
	dw .CantAcceptEggText ; 06
	dw .OnlyOneMonText ; 07
	dw .LastHealthyMonText ; 08
	dw .ComeBackLaterText ; 09
	dw .RemoveMailText ; 0a
	dw .AreWeGeniusesText ; 0b
	dw .YourMonHasGrownText ; 0c
	dw .PerfectHeresYourMonText ; 0d
	dw .GotBackMonText ; 0e
	dw .BackAlreadyText ; 0f
	dw .HaveNoRoomText ; 10
	dw .NotEnoughMoneyText ; 11
	dw .OhFineThenText ; 12
	dw .ComeAgainText ; 13

.DayCareManIntroText:
	text_far _DayCareManIntroText
	text_end

.DayCareManOddEggText:
	text_far _DayCareManOddEggText
	text_end

.DayCareLadyIntroText:
	text_far _DayCareLadyIntroText
	text_end

.DayCareLadyOddEggText:
	text_far _DayCareLadyOddEggText
	text_end

.WhatShouldIRaiseText:
	text_far _WhatShouldIRaiseText
	text_end

.OnlyOneMonText:
	text_far _OnlyOneMonText
	text_end

.CantAcceptEggText:
	text_far _CantAcceptEggText
	text_end

.RemoveMailText:
	text_far _RemoveMailText
	text_end

.LastHealthyMonText:
	text_far _LastHealthyMonText
	text_end

.IllRaiseYourMonText:
	text_far _IllRaiseYourMonText
	text_end

.ComeBackLaterText:
	text_far _ComeBackLaterText
	text_end

.AreWeGeniusesText:
	text_far _AreWeGeniusesText
	text_end

.YourMonHasGrownText:
	text_far _YourMonHasGrownText
	text_end

.PerfectHeresYourMonText:
	text_far _PerfectHeresYourMonText
	text_end

.GotBackMonText:
	text_far _GotBackMonText
	text_end

.BackAlreadyText:
	text_far _BackAlreadyText
	text_end

.HaveNoRoomText:
	text_far _HaveNoRoomText
	text_end

.NotEnoughMoneyText:
	text_far _NotEnoughMoneyText
	text_end

.OhFineThenText:
	text_far _OhFineThenText
	text_end

.ComeAgainText:
	text_far _ComeAgainText
	text_end

DayCareManOutside:
	ld hl, wDayCareMan
	bit DAYCAREMAN_HAS_EGG_F, [hl]
	jr nz, .AskGiveEgg
	ld hl, .NotYetText
	call PrintText
	ret

.NotYetText:
	text_far _NotYetText
	text_end

.AskGiveEgg:
	ld hl, .FoundAnEggText
	call PrintText
	call YesNoBox
	jr c, .Declined
	ld a, [wPartyCount]
	cp PARTY_LENGTH
	jr nc, .PartyFull
	call DayCare_GiveEgg
	ld hl, wDayCareMan
	res DAYCAREMAN_HAS_EGG_F, [hl]
	call DayCare_InitBreeding
	ld hl, .ReceivedEggText
	call PrintText
	ld de, SFX_GET_EGG
	call PlaySFX
	ld c, 120
	call DelayFrames
	ld hl, .TakeGoodCareOfEggText
	jr .Load0

.Declined:
	ld hl, .IllKeepItThanksText

.Load0:
	call PrintText
	xor a ; FALSE
	ld [wScriptVar], a
	ret

.PartyFull:
	ld hl, .NoRoomForEggText
	call PrintText
	ld a, TRUE
	ld [wScriptVar], a
	ret

.FoundAnEggText:
	text_far _FoundAnEggText
	text_end

.ReceivedEggText:
	text_far _ReceivedEggText
	text_end

.TakeGoodCareOfEggText:
	text_far _TakeGoodCareOfEggText
	text_end

.IllKeepItThanksText:
	text_far _IllKeepItThanksText
	text_end

.NoRoomForEggText:
	text_far _NoRoomForEggText
	text_end

DayCare_GiveEgg:
	ld a, [wEggMonLevel]
	ld [wCurPartyLevel], a
	ld hl, wPartyCount
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
	ld [wCurSpecies], a
	ld [wCurPartySpecies], a
	ld a, -1
	ld [hl], a

	ld hl, wPartyMonNicknames
	ld bc, MON_NAME_LENGTH
	call DayCare_GetCurrentPartyMember
	ld hl, wEggNick
	call CopyBytes

	ld hl, wPartyMonOT
	ld bc, NAME_LENGTH
	call DayCare_GetCurrentPartyMember
	ld hl, wEggOT
	call CopyBytes

	ld hl, wPartyMon1
	ld bc, PARTYMON_STRUCT_LENGTH
	call DayCare_GetCurrentPartyMember
	ld hl, wEggMon
	ld bc, wEggMonEnd - wEggMon
	call CopyBytes

	call GetBaseData
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMon1
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
	ld b, FALSE
	predef CalcMonStats
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

DayCare_GetCurrentPartyMember:
	ld a, [wPartyCount]
	dec a
	call AddNTimes
	ld d, h
	ld e, l
	ret

DayCare_InitBreeding:
	ld a, [wDayCareLady]
	bit DAYCARELADY_HAS_MON_F, a
	ret z
	ld a, [wDayCareMan]
	bit DAYCAREMAN_HAS_MON_F, a
	ret z
	callfar CheckBreedmonCompatibility
	ld a, [wBreedingCompatibility]
	and a
	ret z
	inc a
	ret z
	ld hl, wDayCareMan
	set DAYCAREMAN_MONS_COMPATIBLE_F, [hl]
.loop
	call Random
	cp 150
	jr c, .loop
	ld [wStepsToEgg], a
	jp .UselessJump

.UselessJump:
	xor a
	ld hl, wEggMon
	ld bc, wEggMonEnd - wEggMon
	call ByteFill
	ld hl, wEggNick
	ld bc, MON_NAME_LENGTH
	call ByteFill
	ld hl, wEggOT
	ld bc, NAME_LENGTH
	call ByteFill
	ld a, [wBreedMon1DVs]
	ld [wTempMonDVs], a
	ld a, [wBreedMon1DVs + 1]
	ld [wTempMonDVs + 1], a
	ld a, [wBreedMon1Species]
	ld [wCurPartySpecies], a
	ld a, $3
	ld [wMonType], a
	ld a, [wBreedMon1Species]
	cp DITTO
	ld a, $1
	jr z, .LoadWhichBreedmonIsTheMother
	ld a, [wBreedMon2Species]
	cp DITTO
	ld a, $0
	jr z, .LoadWhichBreedmonIsTheMother
	farcall GetGender
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
	ld [wCurPartySpecies], a
	callfar GetPreEvolution
	callfar GetPreEvolution
	ld a, EGG_LEVEL
	ld [wCurPartyLevel], a

; Nidoran♀ can give birth to either gender of Nidoran
	ld a, [wCurPartySpecies]
	cp NIDORAN_F
	jr nz, .GotEggSpecies
	call Random
	cp 50 percent + 1
	ld a, NIDORAN_F
	jr c, .GotEggSpecies
	ld a, NIDORAN_M
.GotEggSpecies:
	ld [wCurPartySpecies], a
	ld [wCurSpecies], a
	ld [wEggMonSpecies], a

	call GetBaseData
	ld hl, wEggNick
	ld de, .String_EGG
	call CopyName2
	ld hl, wPlayerName
	ld de, wEggOT
	ld bc, NAME_LENGTH
	call CopyBytes
	xor a
	ld [wEggMonItem], a
	ld de, wEggMonMoves
	xor a
	ld [wBuffer1], a
	predef FillMoves
	farcall InitEggMoves
	ld hl, wEggMonID
	ld a, [wPlayerID]
	ld [hli], a
	ld a, [wPlayerID + 1]
	ld [hl], a
	ld a, [wCurPartyLevel]
	ld d, a
	callfar CalcExpAtLevel
	ld hl, wEggMonExp
	ldh a, [hMultiplicand]
	ld [hli], a
	ldh a, [hMultiplicand + 1]
	ld [hli], a
	ldh a, [hMultiplicand + 2]
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
	ld [wTempMonDVs], a
	call Random
	ld [hld], a
	ld [wTempMonDVs + 1], a
	ld de, wBreedMon1DVs
	ld a, [wBreedMon1Species]
	cp DITTO
	jr z, .GotDVs
	ld de, wBreedMon2DVs
	ld a, [wBreedMon2Species]
	cp DITTO
	jr z, .GotDVs
	ld a, TEMPMON
	ld [wMonType], a
	push hl
	farcall GetGender
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
	ld hl, wStringBuffer1
	ld de, wMonOrItemNameBuffer
	ld bc, NAME_LENGTH
	call CopyBytes
	ld hl, wEggMonMoves
	ld de, wEggMonPP
	predef FillPP
	ld hl, wMonOrItemNameBuffer
	ld de, wStringBuffer1
	ld bc, NAME_LENGTH
	call CopyBytes
	ld a, [wBaseEggSteps]
	ld hl, wEggMonHappiness
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld a, [wCurPartyLevel]
	ld [wEggMonLevel], a
	ret

.String_EGG:
	db "EGG@"
