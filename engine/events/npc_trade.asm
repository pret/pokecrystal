NPCTrade::
	ld a, e
	ld [wJumptableIndex], a
	call Trade_GetDialog
	ld b, CHECK_FLAG
	call TradeFlagAction
	ld a, TRADE_DIALOG_AFTER
	jr nz, .done

	ld a, TRADE_DIALOG_INTRO
	call PrintTradeText

	call YesNoBox
	ld a, TRADE_DIALOG_CANCEL
	jr c, .done

; Select givemon from party
	ld b, PARTYMENUACTION_GIVE_MON
	farcall SelectTradeOrDayCareMon
	ld a, TRADE_DIALOG_CANCEL
	jr c, .done

	ld e, NPCTRADE_GIVEMON
	call GetTradeAttribute
	ld a, [wCurPartySpecies]
	cp [hl]
	ld a, TRADE_DIALOG_WRONG
	jr nz, .done

	call CheckTradeGender
	ld a, TRADE_DIALOG_WRONG
	jr c, .done

	ld b, SET_FLAG
	call TradeFlagAction

	ld hl, ConnectLinkCableText
	call PrintText

	call DoNPCTrade
	call .TradeAnimation
	call GetTradeMonNames

	ld hl, TradedForText
	call PrintText

	call RestartMapMusic

	ld a, TRADE_DIALOG_COMPLETE

.done
	call PrintTradeText
	ret

.TradeAnimation:
	call DisableSpriteUpdates
	ld a, [wJumptableIndex]
	push af
	ld a, [wcf64]
	push af
	predef TradeAnimation
	pop af
	ld [wcf64], a
	pop af
	ld [wJumptableIndex], a
	call ReturnToMapWithSpeechTextbox
	ret

CheckTradeGender:
	xor a
	ld [wMonType], a

	ld e, NPCTRADE_GENDER
	call GetTradeAttribute
	ld a, [hl]
	and a ; TRADE_GENDER_EITHER
	jr z, .matching
	cp TRADE_GENDER_MALE
	jr z, .check_male
	; TRADE_GENDER_FEMALE
	farcall GetGender
	jr nz, .not_matching
	jr .matching

.check_male
	farcall GetGender
	jr z, .not_matching

.matching
	and a
	ret

.not_matching
	scf
	ret

TradeFlagAction:
	ld hl, wTradeFlags
	ld a, [wJumptableIndex]
	ld c, a
	predef SmallFarFlagAction
	ld a, c
	and a
	ret

Trade_GetDialog:
	ld e, NPCTRADE_DIALOG
	call GetTradeAttribute
	ld a, [hl]
	ld [wcf64], a
	ret

DoNPCTrade:
	ld e, NPCTRADE_GIVEMON
	call GetTradeAttribute
	ld a, [hl]
	ld [wPlayerTrademonSpecies], a

	ld e, NPCTRADE_GETMON
	call GetTradeAttribute
	ld a, [hl]
	ld [wOTTrademonSpecies], a

	ld a, [wPlayerTrademonSpecies]
	ld de, wPlayerTrademonSpeciesName
	call GetTradeMonName
	call CopyTradeName

	ld a, [wOTTrademonSpecies]
	ld de, wOTTrademonSpeciesName
	call GetTradeMonName
	call CopyTradeName

	ld hl, wPartyMonOT
	ld bc, NAME_LENGTH
	call Trade_GetAttributeOfCurrentPartymon
	ld de, wPlayerTrademonOTName
	call CopyTradeName

	ld hl, wPlayerName
	ld de, wPlayerTrademonSenderName
	call CopyTradeName

	ld hl, wPartyMon1ID
	ld bc, PARTYMON_STRUCT_LENGTH
	call Trade_GetAttributeOfCurrentPartymon
	ld de, wPlayerTrademonID
	call Trade_CopyTwoBytes

	ld hl, wPartyMon1DVs
	ld bc, PARTYMON_STRUCT_LENGTH
	call Trade_GetAttributeOfCurrentPartymon
	ld de, wPlayerTrademonDVs
	call Trade_CopyTwoBytes

	ld hl, wPartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	call Trade_GetAttributeOfCurrentPartymon
	ld b, h
	ld c, l
	farcall GetCaughtGender
	ld a, c
	ld [wPlayerTrademonCaughtData], a

	ld e, NPCTRADE_DIALOG
	call GetTradeAttribute
	ld a, [hl]
	cp TRADE_DIALOGSET_GIRL
	ld a, CAUGHT_BY_GIRL
	jr c, .okay
	ld a, CAUGHT_BY_BOY
.okay
	ld [wOTTrademonCaughtData], a

	ld hl, wPartyMon1Level
	ld bc, PARTYMON_STRUCT_LENGTH
	call Trade_GetAttributeOfCurrentPartymon
	ld a, [hl]
	ld [wCurPartyLevel], a
	ld a, [wOTTrademonSpecies]
	ld [wCurPartySpecies], a
	xor a
	ld [wMonType], a ; PARTYMON
	ld [wPokemonWithdrawDepositParameter], a ; REMOVE_PARTY
	callfar RemoveMonFromPartyOrBox
	predef TryAddMonToParty

	ld e, NPCTRADE_DIALOG
	call GetTradeAttribute
	ld a, [hl]
	cp TRADE_DIALOG_COMPLETE
	ld b, RESET_FLAG
	jr c, .incomplete
	ld b, SET_FLAG
.incomplete
	farcall SetGiftPartyMonCaughtData

	ld e, NPCTRADE_NICK
	call GetTradeAttribute
	ld de, wOTTrademonNickname
	call CopyTradeName

	ld hl, wPartyMonNicknames
	ld bc, MON_NAME_LENGTH
	call Trade_GetAttributeOfLastPartymon
	ld hl, wOTTrademonNickname
	call CopyTradeName

	ld e, NPCTRADE_OT_NAME
	call GetTradeAttribute
	push hl
	ld de, wOTTrademonOTName
	call CopyTradeName
	pop hl
	ld de, wOTTrademonSenderName
	call CopyTradeName

	ld hl, wPartyMonOT
	ld bc, NAME_LENGTH
	call Trade_GetAttributeOfLastPartymon
	ld hl, wOTTrademonOTName
	call CopyTradeName

	ld e, NPCTRADE_DVS
	call GetTradeAttribute
	ld de, wOTTrademonDVs
	call Trade_CopyTwoBytes

	ld hl, wPartyMon1DVs
	ld bc, PARTYMON_STRUCT_LENGTH
	call Trade_GetAttributeOfLastPartymon
	ld hl, wOTTrademonDVs
	call Trade_CopyTwoBytes

	ld e, NPCTRADE_OT_ID
	call GetTradeAttribute
	ld de, wOTTrademonID + 1
	call Trade_CopyTwoBytesReverseEndian

	ld hl, wPartyMon1ID
	ld bc, PARTYMON_STRUCT_LENGTH
	call Trade_GetAttributeOfLastPartymon
	ld hl, wOTTrademonID
	call Trade_CopyTwoBytes

	ld e, NPCTRADE_ITEM
	call GetTradeAttribute
	push hl
	ld hl, wPartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	call Trade_GetAttributeOfLastPartymon
	pop hl
	ld a, [hl]
	ld [de], a

	push af
	push bc
	push de
	push hl
	ld a, [wCurPartyMon]
	push af
	ld a, [wPartyCount]
	dec a
	ld [wCurPartyMon], a
	farcall ComputeNPCTrademonStats
	pop af
	ld [wCurPartyMon], a
	pop hl
	pop de
	pop bc
	pop af
	ret

GetTradeAttribute:
	ld d, 0
	push de
	ld a, [wJumptableIndex]
	and $f
	swap a
	ld e, a
	ld d, 0
	ld hl, NPCTrades
	add hl, de
	add hl, de
	pop de
	add hl, de
	ret

Trade_GetAttributeOfCurrentPartymon:
	ld a, [wCurPartyMon]
	call AddNTimes
	ret

Trade_GetAttributeOfLastPartymon:
	ld a, [wPartyCount]
	dec a
	call AddNTimes
	ld e, l
	ld d, h
	ret

GetTradeMonName:
	push de
	ld [wNamedObjectIndexBuffer], a
	call GetBasePokemonName
	ld hl, wStringBuffer1
	pop de
	ret

CopyTradeName:
	ld bc, NAME_LENGTH
	call CopyBytes
	ret

Unreferenced_Functionfcdfb:
	ld bc, 4
	call CopyBytes
	ld a, "@"
	ld [de], a
	ret

Unreferenced_Functionfce05:
	ld bc, 3
	call CopyBytes
	ld a, "@"
	ld [de], a
	ret

Trade_CopyTwoBytes:
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ret

Trade_CopyTwoBytesReverseEndian:
	ld a, [hli]
	ld [de], a
	dec de
	ld a, [hl]
	ld [de], a
	ret

GetTradeMonNames:
	ld e, NPCTRADE_GETMON
	call GetTradeAttribute
	ld a, [hl]
	call GetTradeMonName

	ld de, wStringBuffer2
	call CopyTradeName

	ld e, NPCTRADE_GIVEMON
	call GetTradeAttribute
	ld a, [hl]
	call GetTradeMonName

	ld de, wMonOrItemNameBuffer
	call CopyTradeName

	ld hl, wStringBuffer1
.loop
	ld a, [hli]
	cp "@"
	jr nz, .loop

	dec hl
	push hl
	ld e, NPCTRADE_GENDER
	call GetTradeAttribute
	ld a, [hl]
	pop hl
	and a ; TRADE_GENDER_EITHER
	ret z
	cp TRADE_GENDER_MALE
	ld a, "♂"
	jr z, .done
	; TRADE_GENDER_FEMALE
	ld a, "♀"
.done
	ld [hli], a
	ld [hl], "@"
	ret

INCLUDE "data/events/npc_trades.asm"

PrintTradeText:
	push af
	call GetTradeMonNames
	pop af
	ld bc, 2 * 4
	ld hl, TradeTexts
	call AddNTimes
	ld a, [wcf64]
	ld c, a
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	ret

TradeTexts:
; entries correspond to TRADE_DIALOG_* × TRADE_DIALOGSET_* constants
; TRADE_DIALOG_INTRO
	dw TradeIntroText1
	dw TradeIntroText2
	dw TradeIntroText3
	dw TradeIntroText4
; TRADE_DIALOG_CANCEL
	dw TradeCancelText1
	dw TradeCancelText2
	dw TradeCancelText3
	dw TradeCancelText4
; TRADE_DIALOG_WRONG
	dw TradeWrongText1
	dw TradeWrongText2
	dw TradeWrongText3
	dw TradeWrongText4
; TRADE_DIALOG_COMPLETE
	dw TradeCompleteText1
	dw TradeCompleteText2
	dw TradeCompleteText3
	dw TradeCompleteText4
; TRADE_DIALOG_AFTER
	dw TradeAfterText1
	dw TradeAfterText2
	dw TradeAfterText3
	dw TradeAfterText4

ConnectLinkCableText:
	; OK, connect the Game Link Cable.
	text_far UnknownText_0x1bd407
	text_end

TradedForText:
	; traded givemon for getmon
	text_far UnknownText_0x1bd429
	text_asm
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	ld hl, .done
	ret

.done
	; sound_dex_fanfare_80_109
	; text_pause
	text_far UnknownText_0x1bd445
	text_end

TradeIntroText1:
	; I collect #MON. Do you have @ ? Want to trade it for my @ ?
	text_far _NPCTradeIntroText1
	text_end

TradeCancelText1:
	; You don't want to trade? Aww…
	text_far _NPCTradeCancelText1
	text_end

TradeWrongText1:
	; Huh? That's not @ .  What a letdown…
	text_far _NPCTradeWrongText1
	text_end

TradeCompleteText1:
	; Yay! I got myself @ ! Thanks!
	text_far _NPCTradeCompleteText1
	text_end

TradeAfterText1:
	; Hi, how's my old @  doing?
	text_far _NPCTradeAFterText1
	text_end

TradeIntroText2:
TradeIntroText3:
	; Hi, I'm looking for this #MON. If you have @ , would you trade it for my @ ?
	text_far _NPCTradeIntroText2
	text_end

TradeCancelText2:
TradeCancelText3:
	; You don't have one either? Gee, that's really disappointing…
	text_far _NPCTradeCancelText2
	text_end

TradeWrongText2:
TradeWrongText3:
	; You don't have @ ? That's too bad, then.
	text_far _NPCTradeWrongText2
	text_end

TradeCompleteText2:
	; Great! Thank you! I finally got @ .
	text_far _NPCTradeCompleteText2
	text_end

TradeAfterText2:
	; Hi! The @ you traded me is doing great!
	text_far _NPCTradeAfterText2
	text_end

TradeIntroText4:
	; 's cute, but I don't have it. Do you have @ ? Want to trade it for my @ ?
	text_far _NPCTradeIntroText3
	text_end

TradeCancelText4:
	; You don't want to trade? Oh, darn…
	text_far _NPCTradeCancelText3
	text_end

TradeWrongText4:
	; That's not @ . Please trade with me if you get one.
	text_far _NPCTradeWrongText3
	text_end

TradeCompleteText4:
	; Wow! Thank you! I always wanted @ !
	text_far _NPCTradeCompleteText3
	text_end

TradeAfterText4:
	; How is that @  I traded you doing? Your @ 's so cute!
	text_far _NPCTradeAfterText3
	text_end

TradeCompleteText3:
	; Uh? What happened?
	text_far _NPCTradeCompleteText4
	text_end

TradeAfterText3:
	; Trading is so odd… I still have a lot to learn about it.
	text_far _NPCTradeAfterText4
	text_end
