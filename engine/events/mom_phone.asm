DEF NUM_MOM_ITEMS_1 EQUS "((MomItems_1.End - MomItems_1) / 8)"
DEF NUM_MOM_ITEMS_2 EQUS "((MomItems_2.End - MomItems_2) / 8)"

	const_def 1
	const MOM_ITEM
	const MOM_DOLL

MomTriesToBuySomething::
	ld a, [wMapReentryScriptQueueFlag]
	and a
	ret nz
	call GetMapPhoneService
	and a
	ret nz
	xor a
	ld [wWhichMomItemSet], a
	call CheckBalance_MomItem2
	ret nc
	call Mom_GiveItemOrDoll
	ret nc
	ld b, BANK(.Script)
	ld de, .Script
	farcall LoadScriptBDE
	scf
	ret

.Script:
	callasm .ASMFunction
	farsjump Script_ReceivePhoneCall

.ASMFunction:
	call MomBuysItem_DeductFunds
	call Mom_GetScriptPointer
	ld a, [wWhichMomItemSet]
	and a
	jr nz, .ok
	ld hl, wWhichMomItem
	inc [hl]
.ok
	ld a, PHONE_MOM
	ld [wCurCaller], a
	ld bc, wCallerContact
	ld hl, PHONE_CONTACT_TRAINER_CLASS
	add hl, bc
	ld [hl], TRAINER_NONE
	inc hl
	ld [hl], PHONE_MOM
	ld hl, PHONE_CONTACT_SCRIPT2_BANK
	add hl, bc
	ld a, BANK(Mom_GetScriptPointer)
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hl], a
	ret

CheckBalance_MomItem2:
	ld a, [wWhichMomItem]
	cp NUM_MOM_ITEMS_2
	jr nc, .nope
	call GetItemFromMom
	ld a, [hli]
	ldh [hMoneyTemp], a
	ld a, [hli]
	ldh [hMoneyTemp + 1], a
	ld a, [hli]
	ldh [hMoneyTemp + 2], a
	ld de, wMomsMoney
	ld bc, hMoneyTemp
	farcall CompareMoney
	jr nc, .have_enough_money

.nope
	jr .check_have_2300

.have_enough_money
	scf
	ret

.check_have_2300
	ld hl, hMoneyTemp
	ld [hl], HIGH(MOM_MONEY >> 8)
	inc hl
	ld [hl], HIGH(MOM_MONEY) ; mid
	inc hl
	ld [hl], LOW(MOM_MONEY)
.loop
	ld de, wMomItemTriggerBalance
	ld bc, wMomsMoney
	farcall CompareMoney
	jr z, .exact
	jr nc, .less_than
	call .AddMoney
	jr .loop

.less_than
	xor a
	ret

.exact
	call .AddMoney
	ld a, NUM_MOM_ITEMS_1
	call RandomRange
	inc a
	ld [wWhichMomItemSet], a
	scf
	ret

.AddMoney:
	ld de, wMomItemTriggerBalance
	ld bc, hMoneyTemp
	farcall AddMoney
	ret

MomBuysItem_DeductFunds:
	call GetItemFromMom
	ld de, 3 ; cost
	add hl, de
	ld a, [hli]
	ldh [hMoneyTemp], a
	ld a, [hli]
	ldh [hMoneyTemp + 1], a
	ld a, [hli]
	ldh [hMoneyTemp + 2], a
	ld de, wMomsMoney
	ld bc, hMoneyTemp
	farcall TakeMoney
	ret

Mom_GiveItemOrDoll:
	call GetItemFromMom
	ld de, 6 ; item type
	add hl, de
	ld a, [hli]
	cp MOM_ITEM
	jr z, .not_doll
	ld a, [hl]
	ld c, a
	ld b, 1
	farcall DecorationFlagAction_c
	scf
	ret

.not_doll
	ld a, [hl]
	ld [wCurItem], a
	ld a, 1
	ld [wItemQuantityChange], a
	ld hl, wNumPCItems
	call ReceiveItem
	ret

Mom_GetScriptPointer:
	call GetItemFromMom
	ld de, 6 ; item type
	add hl, de
	ld a, [hli]
	ld de, .ItemScript
	cp MOM_ITEM
	ret z
	ld de, .DollScript
	ret

.ItemScript:
	writetext MomHiHowAreYouText
	writetext MomFoundAnItemText
	writetext MomBoughtWithYourMoneyText
	writetext MomItsInPCText
	end

.DollScript:
	writetext MomHiHowAreYouText
	writetext MomFoundADollText
	writetext MomBoughtWithYourMoneyText
	writetext MomItsInYourRoomText
	end

GetItemFromMom:
	ld a, [wWhichMomItemSet]
	and a
	jr z, .zero
	dec a
	ld de, MomItems_1
	jr .GetFromList1

.zero
	ld a, [wWhichMomItem]
	cp NUM_MOM_ITEMS_2
	jr c, .ok
	xor a

.ok
	ld de, MomItems_2

.GetFromList1:
	ld l, a
	ld h, 0
rept 3 ; multiply hl by 8
	add hl, hl
endr
	add hl, de
	ret

INCLUDE "data/items/mom_phone.asm"

MomHiHowAreYouText:
	text_far _MomHiHowAreYouText
	text_end

MomFoundAnItemText:
	text_far _MomFoundAnItemText
	text_end

MomBoughtWithYourMoneyText:
	text_far _MomBoughtWithYourMoneyText
	text_end

MomItsInPCText:
	text_far _MomItsInPCText
	text_end

MomFoundADollText:
	text_far _MomFoundADollText
	text_end

MomItsInYourRoomText:
	text_far _MomItsInYourRoomText
	text_end


DummyPredef3A_DummyData: ; unreferenced
	db 0

DummyPredef3A:
	ret

DummyPredef3A_DummyFunction: ; unreferenced
	ret
