NUM_MOM_ITEMS_1 EQUS "((MomItems_1.End - MomItems_1) / 8)"
NUM_MOM_ITEMS_2 EQUS "((MomItems_2.End - MomItems_2) / 8)"

const_value = 1
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
	farjump Script_ReceivePhoneCall

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
	ld bc, wEngineBuffer2
	ld hl, 0
	add hl, bc
	ld [hl], 0
	inc hl
	ld [hl], 1
	ld hl, wPhoneScriptPointer - wEngineBuffer2
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
	ld [wItemQuantityChangeBuffer], a
	ld hl, wPCItems
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
	writetext _MomText_HiHowAreYou
	writetext _MomText_FoundAnItem
	writetext _MomText_BoughtWithYourMoney
	writetext _MomText_ItsInPC
	end

.DollScript:
	writetext _MomText_HiHowAreYou
	writetext _MomText_FoundADoll
	writetext _MomText_BoughtWithYourMoney
	writetext _MomText_ItsInRoom
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

	db 0, 0, 0 ; unused

_MomText_HiHowAreYou:
	; Hi,  ! How are you?
	text_jump UnknownText_0x1bc615
	db "@"

_MomText_FoundAnItem:
	; I found a useful item shopping, so
	text_jump UnknownText_0x1bc62a
	db "@"

_MomText_BoughtWithYourMoney:
	; I bought it with your money. Sorry!
	text_jump UnknownText_0x1bc64e
	db "@"

_MomText_ItsInPC:
	; It's in your PC. You'll like it!
	text_jump UnknownText_0x1bc673
	db "@"

_MomText_FoundADoll:
	; While shopping today, I saw this adorable doll, so
	text_jump UnknownText_0x1bc693
	db "@"

_MomText_ItsInRoom:
	; It's in your room. You'll love it!
	text_jump UnknownText_0x1bc6c7
	db "@"

	db 0 ; unused

DummyPredef3A:
	ret

	ret ; unused
