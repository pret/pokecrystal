BattleTowerText::
; Print text c for trainer [wBT_OTTrainerClass]
; 1: Intro text
; 2: Player lost
; 3: Player won
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBT_OTTrainerClass)
	ldh [rSVBK], a
	ld hl, wBT_OTTrainerClass
	ld a, [hl]
	dec a
	ld e, a
	ld d, 0
	ld hl, BTTrainerClassGenders
	add hl, de
	ld a, [hl]
	and a
	jr nz, .female
	; generate a random number between 0 and 24
	ldh a, [hRandomAdd]
	and $1f
	cp 25
	jr c, .okay0
	sub 25

.okay0
	ld hl, BTMaleTrainerTexts
	jr .proceed

.female
	; generate a random number between 0 and 14
	ldh a, [hRandomAdd]
	and $f
	cp 15
	jr c, .okay1
	sub 15

.okay1
	ld hl, BTFemaleTrainerTexts

.proceed
	ld b, 0
	dec c
	jr nz, .restore
	ld [wBT_TrainerTextIndex], a
	jr .okay2

.restore
	ld a, [wBT_TrainerTextIndex]

.okay2
	push af
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld c, a
	ld a, [hl]
	ld h, a
	ld l, c
	pop af
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld c, a
	ld a, [hl]
	ld l, c
	ld h, a
	bccoord 1, 14
	pop af
	ldh [rSVBK], a
	call PlaceHLTextAtBC
	ret

INCLUDE "mobile/fixed_words.asm"

INCLUDE "data/trainers/genders.asm"

BTMaleTrainerTexts:
	dw .Greetings
	dw .PlayerLost
	dw .PlayerWon

.Greetings:
	dw BTGreetingM1Text
	dw BTGreetingM2Text
	dw BTGreetingM3Text
	dw BTGreetingM4Text
	dw BTGreetingM5Text
	dw BTGreetingM6Text
	dw BTGreetingM7Text
	dw BTGreetingM8Text
	dw BTGreetingM9Text
	dw BTGreetingM10Text
	dw BTGreetingM11Text
	dw BTGreetingM12Text
	dw BTGreetingM13Text
	dw BTGreetingM14Text
	dw BTGreetingM15Text
	dw BTGreetingM16Text
	dw BTGreetingM17Text
	dw BTGreetingM18Text
	dw BTGreetingM19Text
	dw BTGreetingM20Text
	dw BTGreetingM21Text
	dw BTGreetingM22Text
	dw BTGreetingM23Text
	dw BTGreetingM24Text
	dw BTGreetingM25Text

.PlayerLost:
	dw BTLossM1Text
	dw BTLossM2Text
	dw BTLossM3Text
	dw BTLossM4Text
	dw BTLossM5Text
	dw BTLossM6Text
	dw BTLossM7Text
	dw BTLossM8Text
	dw BTLossM9Text
	dw BTLossM10Text
	dw BTLossM11Text
	dw BTLossM12Text
	dw BTLossM13Text
	dw BTLossM14Text
	dw BTLossM15Text
	dw BTLossM16Text
	dw BTLossM17Text
	dw BTLossM18Text
	dw BTLossM19Text
	dw BTLossM20Text
	dw BTLossM21Text
	dw BTLossM22Text
	dw BTLossM23Text
	dw BTLossM24Text
	dw BTLossM25Text

.PlayerWon:
	dw BTWinM1Text
	dw BTWinM2Text
	dw BTWinM3Text
	dw BTWinM4Text
	dw BTWinM5Text
	dw BTWinM6Text
	dw BTWinM7Text
	dw BTWinM8Text
	dw BTWinM9Text
	dw BTWinM10Text
	dw BTWinM11Text
	dw BTWinM12Text
	dw BTWinM13Text
	dw BTWinM14Text
	dw BTWinM15Text
	dw BTWinM16Text
	dw BTWinM17Text
	dw BTWinM18Text
	dw BTWinM19Text
	dw BTWinM20Text
	dw BTWinM21Text
	dw BTWinM22Text
	dw BTWinM23Text
	dw BTWinM24Text
	dw BTWinM25Text

BTFemaleTrainerTexts:
	dw .Greetings
	dw .PlayerLost
	dw .PlayerWon

.Greetings:
	dw BTGreetingF1Text
	dw BTGreetingF2Text
	dw BTGreetingF3Text
	dw BTGreetingF4Text
	dw BTGreetingF5Text
	dw BTGreetingF6Text
	dw BTGreetingF7Text
	dw BTGreetingF8Text
	dw BTGreetingF9Text
	dw BTGreetingF10Text
	dw BTGreetingF11Text
	dw BTGreetingF12Text
	dw BTGreetingF13Text
	dw BTGreetingF14Text
	dw BTGreetingF15Text

.PlayerLost:
	dw BTLossF1Text
	dw BTLossF2Text
	dw BTLossF3Text
	dw BTLossF4Text
	dw BTLossF5Text
	dw BTLossF6Text
	dw BTLossF7Text
	dw BTLossF8Text
	dw BTLossF9Text
	dw BTLossF10Text
	dw BTLossF11Text
	dw BTLossF12Text
	dw BTLossF13Text
	dw BTLossF14Text
	dw BTLossF15Text

.PlayerWon:
	dw BTWinF1Text
	dw BTWinF2Text
	dw BTWinF3Text
	dw BTWinF4Text
	dw BTWinF5Text
	dw BTWinF6Text
	dw BTWinF7Text
	dw BTWinF8Text
	dw BTWinF9Text
	dw BTWinF10Text
	dw BTWinF11Text
	dw BTWinF12Text
	dw BTWinF13Text
	dw BTWinF14Text
	dw BTWinF15Text

BTGreetingM1Text:
	text_far _BTGreetingM1Text
	text_end

BTLossM1Text:
	text_far _BTLossM1Text
	text_end

BTWinM1Text:
	text_far _BTWinM1Text
	text_end

BTGreetingM2Text:
	text_far _BTGreetingM2Text
	text_end

BTLossM2Text:
	text_far _BTLossM2Text
	text_end

BTWinM2Text:
	text_far _BTWinM2Text
	text_end

BTGreetingM3Text:
	text_far _BTGreetingM3Text
	text_end

BTLossM3Text:
	text_far _BTLossM3Text
	text_end

BTWinM3Text:
	text_far _BTWinM3Text
	text_end

BTGreetingM4Text:
	text_far _BTGreetingM4Text
	text_end

BTLossM4Text:
	text_far _BTLossM4Text
	text_end

BTWinM4Text:
	text_far _BTWinM4Text
	text_end

BTGreetingM5Text:
	text_far _BTGreetingM5Text
	text_end

BTLossM5Text:
	text_far _BTLossM5Text
	text_end

BTWinM5Text:
	text_far _BTWinM5Text
	text_end

BTGreetingM6Text:
	text_far _BTGreetingM6Text
	text_end

BTLossM6Text:
	text_far _BTLossM6Text
	text_end

BTWinM6Text:
	text_far _BTWinM6Text
	text_end

BTGreetingM7Text:
	text_far _BTGreetingM7Text
	text_end

BTLossM7Text:
	text_far _BTLossM7Text
	text_end

BTWinM7Text:
	text_far _BTWinM7Text
	text_end

BTGreetingM8Text:
	text_far _BTGreetingM8Text
	text_end

BTLossM8Text:
	text_far _BTLossM8Text
	text_end

BTWinM8Text:
	text_far _BTWinM8Text
	text_end

BTGreetingM9Text:
	text_far _BTGreetingM9Text
	text_end

BTLossM9Text:
	text_far _BTLossM9Text
	text_end

BTWinM9Text:
	text_far _BTWinM9Text
	text_end

BTGreetingM10Text:
	text_far _BTGreetingM10Text
	text_end

BTLossM10Text:
	text_far _BTLossM10Text
	text_end

BTWinM10Text:
	text_far _BTWinM10Text
	text_end

BTGreetingM11Text:
	text_far _BTGreetingM11Text
	text_end

BTLossM11Text:
	text_far _BTLossM11Text
	text_end

BTWinM11Text:
	text_far _BTWinM11Text
	text_end

BTGreetingM12Text:
	text_far _BTGreetingM12Text
	text_end

BTLossM12Text:
	text_far _BTLossM12Text
	text_end

BTWinM12Text:
	text_far _BTWinM12Text
	text_end

BTGreetingM13Text:
	text_far _BTGreetingM13Text
	text_end

BTLossM13Text:
	text_far _BTLossM13Text
	text_end

BTWinM13Text:
	text_far _BTWinM13Text
	text_end

BTGreetingM14Text:
	text_far _BTGreetingM14Text
	text_end

BTLossM14Text:
	text_far _BTLossM14Text
	text_end

BTWinM14Text:
	text_far _BTWinM14Text
	text_end

BTGreetingM15Text:
	text_far _BTGreetingM15Text
	text_end

BTLossM15Text:
	text_far _BTLossM15Text
	text_end

BTWinM15Text:
	text_far _BTWinM15Text
	text_end

BTGreetingM16Text:
	text_far _BTGreetingM16Text
	text_end

BTLossM16Text:
	text_far _BTLossM16Text
	text_end

BTWinM16Text:
	text_far _BTWinM16Text
	text_end

BTGreetingM17Text:
	text_far _BTGreetingM17Text
	text_end

BTLossM17Text:
	text_far _BTLossM17Text
	text_end

BTWinM17Text:
	text_far _BTWinM17Text
	text_end

BTGreetingM18Text:
	text_far _BTGreetingM18Text
	text_end

BTLossM18Text:
	text_far _BTLossM18Text
	text_end

BTWinM18Text:
	text_far _BTWinM18Text
	text_end

BTGreetingM19Text:
	text_far _BTGreetingM19Text
	text_end

BTLossM19Text:
	text_far _BTLossM19Text
	text_end

BTWinM19Text:
	text_far _BTWinM19Text
	text_end

BTGreetingM20Text:
	text_far _BTGreetingM20Text
	text_end

BTLossM20Text:
	text_far _BTLossM20Text
	text_end

BTWinM20Text:
	text_far _BTWinM20Text
	text_end

BTGreetingM21Text:
	text_far _BTGreetingM21Text
	text_end

BTLossM21Text:
	text_far _BTLossM21Text
	text_end

BTWinM21Text:
	text_far _BTWinM21Text
	text_end

BTGreetingM22Text:
	text_far _BTGreetingM22Text
	text_end

BTLossM22Text:
	text_far _BTLossM22Text
	text_end

BTWinM22Text:
	text_far _BTWinM22Text
	text_end

BTGreetingM23Text:
	text_far _BTGreetingM23Text
	text_end

BTLossM23Text:
	text_far _BTLossM23Text
	text_end

BTWinM23Text:
	text_far _BTWinM23Text
	text_end

BTGreetingM24Text:
	text_far _BTGreetingM24Text
	text_end

BTLossM24Text:
	text_far _BTLossM24Text
	text_end

BTWinM24Text:
	text_far _BTWinM24Text
	text_end

BTGreetingM25Text:
	text_far _BTGreetingM25Text
	text_end

BTLossM25Text:
	text_far _BTLossM25Text
	text_end

BTWinM25Text:
	text_far _BTWinM25Text
	text_end

BTGreetingF1Text:
	text_far _BTGreetingF1Text
	text_end

BTLossF1Text:
	text_far _BTLossF1Text
	text_end

BTWinF1Text:
	text_far _BTWinF1Text
	text_end

BTGreetingF2Text:
	text_far _BTGreetingF2Text
	text_end

BTLossF2Text:
	text_far _BTLossF2Text
	text_end

BTWinF2Text:
	text_far _BTWinF2Text
	text_end

BTGreetingF3Text:
	text_far _BTGreetingF3Text
	text_end

BTLossF3Text:
	text_far _BTLossF3Text
	text_end

BTWinF3Text:
	text_far _BTWinF3Text
	text_end

BTGreetingF4Text:
	text_far _BTGreetingF4Text
	text_end

BTLossF4Text:
	text_far _BTLossF4Text
	text_end

BTWinF4Text:
	text_far _BTWinF4Text
	text_end

BTGreetingF5Text:
	text_far _BTGreetingF5Text
	text_end

BTLossF5Text:
	text_far _BTLossF5Text
	text_end

BTWinF5Text:
	text_far _BTWinF5Text
	text_end

BTGreetingF6Text:
	text_far _BTGreetingF6Text
	text_end

BTLossF6Text:
	text_far _BTLossF6Text
	text_end

BTWinF6Text:
	text_far _BTWinF6Text
	text_end

BTGreetingF7Text:
	text_far _BTGreetingF7Text
	text_end

BTLossF7Text:
	text_far _BTLossF7Text
	text_end

BTWinF7Text:
	text_far _BTWinF7Text
	text_end

BTGreetingF8Text:
	text_far _BTGreetingF8Text
	text_end

BTLossF8Text:
	text_far _BTLossF8Text
	text_end

BTWinF8Text:
	text_far _BTWinF8Text
	text_end

BTGreetingF9Text:
	text_far _BTGreetingF9Text
	text_end

BTLossF9Text:
	text_far _BTLossF9Text
	text_end

BTWinF9Text:
	text_far _BTWinF9Text
	text_end

BTGreetingF10Text:
	text_far _BTGreetingF10Text
	text_end

BTLossF10Text:
	text_far _BTLossF10Text
	text_end

BTWinF10Text:
	text_far _BTWinF10Text
	text_end

BTGreetingF11Text:
	text_far _BTGreetingF11Text
	text_end

BTLossF11Text:
	text_far _BTLossF11Text
	text_end

BTWinF11Text:
	text_far _BTWinF11Text
	text_end

BTGreetingF12Text:
	text_far _BTGreetingF12Text
	text_end

BTLossF12Text:
	text_far _BTLossF12Text
	text_end

BTWinF12Text:
	text_far _BTWinF12Text
	text_end

BTGreetingF13Text:
	text_far _BTGreetingF13Text
	text_end

BTLossF13Text:
	text_far _BTLossF13Text
	text_end

BTWinF13Text:
	text_far _BTWinF13Text
	text_end

BTGreetingF14Text:
	text_far _BTGreetingF14Text
	text_end

BTLossF14Text:
	text_far _BTLossF14Text
	text_end

BTWinF14Text:
	text_far _BTWinF14Text
	text_end

BTGreetingF15Text:
	text_far _BTGreetingF15Text
	text_end

BTLossF15Text:
	text_far _BTLossF15Text
	text_end

BTWinF15Text:
	text_far _BTWinF15Text
	text_end
