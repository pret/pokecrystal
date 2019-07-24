BattleTowerText::
; Print text c for trainer [wBT_OTTrainerClass]
; 1: Intro text
; 2: Player lost
; 3: Player won
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBT_OTTrainerClass)
	ldh [rSVBK], a
if DEF(_CRYSTAL11)
	ld hl, wBT_OTTrainerClass
else
; BUG ALERT
; Instead of loading the Trainer Class, this routine
; loads the 6th character in the Trainer's name, then
; uses it to get the gender of the trainer.
; As a consequence, the enemy trainer's dialog will
; always be sampled from the female array.
	ld hl, wBT_OTName + NAME_LENGTH_JAPANESE - 1
endc
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
	dw BTGreetingM1
	dw BTGreetingM2
	dw BTGreetingM3
	dw BTGreetingM4
	dw BTGreetingM5
	dw BTGreetingM6
	dw BTGreetingM7
	dw BTGreetingM8
	dw BTGreetingM9
	dw BTGreetingM10
	dw BTGreetingM11
	dw BTGreetingM12
	dw BTGreetingM13
	dw BTGreetingM14
	dw BTGreetingM15
	dw BTGreetingM16
	dw BTGreetingM17
	dw BTGreetingM18
	dw BTGreetingM19
	dw BTGreetingM20
	dw BTGreetingM21
	dw BTGreetingM22
	dw BTGreetingM23
	dw BTGreetingM24
	dw BTGreetingM25

.PlayerLost:
	dw BTLossM1
	dw BTLossM2
	dw BTLossM3
	dw BTLossM4
	dw BTLossM5
	dw BTLossM6
	dw BTLossM7
	dw BTLossM8
	dw BTLossM9
	dw BTLossM10
	dw BTLossM11
	dw BTLossM12
	dw BTLossM13
	dw BTLossM14
	dw BTLossM15
	dw BTLossM16
	dw BTLossM17
	dw BTLossM18
	dw BTLossM19
	dw BTLossM20
	dw BTLossM21
	dw BTLossM22
	dw BTLossM23
	dw BTLossM24
	dw BTLossM25

.PlayerWon:
	dw BTWinM1
	dw BTWinM2
	dw BTWinM3
	dw BTWinM4
	dw BTWinM5
	dw BTWinM6
	dw BTWinM7
	dw BTWinM8
	dw BTWinM9
	dw BTWinM10
	dw BTWinM11
	dw BTWinM12
	dw BTWinM13
	dw BTWinM14
	dw BTWinM15
	dw BTWinM16
	dw BTWinM17
	dw BTWinM18
	dw BTWinM19
	dw BTWinM20
	dw BTWinM21
	dw BTWinM22
	dw BTWinM23
	dw BTWinM24
	dw BTWinM25

BTFemaleTrainerTexts:
	dw .Greetings
	dw .PlayerLost
	dw .PlayerWon

.Greetings:
	dw BTGreetingF1
	dw BTGreetingF2
	dw BTGreetingF3
	dw BTGreetingF4
	dw BTGreetingF5
	dw BTGreetingF6
	dw BTGreetingF7
	dw BTGreetingF8
	dw BTGreetingF9
	dw BTGreetingF10
	dw BTGreetingF11
	dw BTGreetingF12
	dw BTGreetingF13
	dw BTGreetingF14
	dw BTGreetingF15

.PlayerLost:
	dw BTLossF1
	dw BTLossF2
	dw BTLossF3
	dw BTLossF4
	dw BTLossF5
	dw BTLossF6
	dw BTLossF7
	dw BTLossF8
	dw BTLossF9
	dw BTLossF10
	dw BTLossF11
	dw BTLossF12
	dw BTLossF13
	dw BTLossF14
	dw BTLossF15

.PlayerWon:
	dw BTWinF1
	dw BTWinF2
	dw BTWinF3
	dw BTWinF4
	dw BTWinF5
	dw BTWinF6
	dw BTWinF7
	dw BTWinF8
	dw BTWinF9
	dw BTWinF10
	dw BTWinF11
	dw BTWinF12
	dw BTWinF13
	dw BTWinF14
	dw BTWinF15

BTGreetingM1:
	text_far _BTGreetingM1Text
	text_end

BTLossM1:
	text_far _BTLossM1Text
	text_end

BTWinM1:
	text_far _BTWinM1Text
	text_end

BTGreetingM2:
	text_far _BTGreetingM2Text
	text_end

BTLossM2:
	text_far _BTLossM2Text
	text_end

BTWinM2:
	text_far _BTWinM2Text
	text_end

BTGreetingM3:
	text_far _BTGreetingM3Text
	text_end

BTLossM3:
	text_far _BTLossM3Text
	text_end

BTWinM3:
	text_far _BTWinM3Text
	text_end

BTGreetingM4:
	text_far _BTGreetingM4Text
	text_end

BTLossM4:
	text_far _BTLossM4Text
	text_end

BTWinM4:
	text_far _BTWinM4Text
	text_end

BTGreetingM5:
	text_far _BTGreetingM5Text
	text_end

BTLossM5:
	text_far _BTLossM5Text
	text_end

BTWinM5:
	text_far _BTWinM5Text
	text_end

BTGreetingM6:
	text_far _BTGreetingM6Text
	text_end

BTLossM6:
	text_far _BTLossM6Text
	text_end

BTWinM6:
	text_far _BTWinM6Text
	text_end

BTGreetingM7:
	text_far _BTGreetingM7Text
	text_end

BTLossM7:
	text_far _BTLossM7Text
	text_end

BTWinM7:
	text_far _BTWinM7Text
	text_end

BTGreetingM8:
	text_far _BTGreetingM8Text
	text_end

BTLossM8:
	text_far _BTLossM8Text
	text_end

BTWinM8:
	text_far _BTWinM8Text
	text_end

BTGreetingM9:
	text_far _BTGreetingM9Text
	text_end

BTLossM9:
	text_far _BTLossM9Text
	text_end

BTWinM9:
	text_far _BTWinM9Text
	text_end

BTGreetingM10:
	text_far _BTGreetingM10Text
	text_end

BTLossM10:
	text_far _BTLossM10Text
	text_end

BTWinM10:
	text_far _BTWinM10Text
	text_end

BTGreetingM11:
	text_far _BTGreetingM11Text
	text_end

BTLossM11:
	text_far _BTLossM11Text
	text_end

BTWinM11:
	text_far _BTWinM11Text
	text_end

BTGreetingM12:
	text_far _BTGreetingM12Text
	text_end

BTLossM12:
	text_far _BTLossM12Text
	text_end

BTWinM12:
	text_far _BTWinM12Text
	text_end

BTGreetingM13:
	text_far _BTGreetingM13Text
	text_end

BTLossM13:
	text_far _BTLossM13Text
	text_end

BTWinM13:
	text_far _BTWinM13Text
	text_end

BTGreetingM14:
	text_far _BTGreetingM14Text
	text_end

BTLossM14:
	text_far _BTLossM14Text
	text_end

BTWinM14:
	text_far _BTWinM14Text
	text_end

BTGreetingM15:
	text_far _BTGreetingM15Text
	text_end

BTLossM15:
	text_far _BTLossM15Text
	text_end

BTWinM15:
	text_far _BTWinM15Text
	text_end

BTGreetingM16:
	text_far _BTGreetingM16Text
	text_end

BTLossM16:
	text_far _BTLossM16Text
	text_end

BTWinM16:
	text_far _BTWinM16Text
	text_end

BTGreetingM17:
	text_far _BTGreetingM17Text
	text_end

BTLossM17:
	text_far _BTLossM17Text
	text_end

BTWinM17:
	text_far _BTWinM17Text
	text_end

BTGreetingM18:
	text_far _BTGreetingM18Text
	text_end

BTLossM18:
	text_far _BTLossM18Text
	text_end

BTWinM18:
	text_far _BTWinM18Text
	text_end

BTGreetingM19:
	text_far _BTGreetingM19Text
	text_end

BTLossM19:
	text_far _BTLossM19Text
	text_end

BTWinM19:
	text_far _BTWinM19Text
	text_end

BTGreetingM20:
	text_far _BTGreetingM20Text
	text_end

BTLossM20:
	text_far _BTLossM20Text
	text_end

BTWinM20:
	text_far _BTWinM20Text
	text_end

BTGreetingM21:
	text_far _BTGreetingM21Text
	text_end

BTLossM21:
	text_far _BTLossM21Text
	text_end

BTWinM21:
	text_far _BTWinM21Text
	text_end

BTGreetingM22:
	text_far _BTGreetingM22Text
	text_end

BTLossM22:
	text_far _BTLossM22Text
	text_end

BTWinM22:
	text_far _BTWinM22Text
	text_end

BTGreetingM23:
	text_far _BTGreetingM23Text
	text_end

BTLossM23:
	text_far _BTLossM23Text
	text_end

BTWinM23:
	text_far _BTWinM23Text
	text_end

BTGreetingM24:
	text_far _BTGreetingM24Text
	text_end

BTLossM24:
	text_far _BTLossM24Text
	text_end

BTWinM24:
	text_far _BTWinM24Text
	text_end

BTGreetingM25:
	text_far _BTGreetingM25Text
	text_end

BTLossM25:
	text_far _BTLossM25Text
	text_end

BTWinM25:
	text_far _BTWinM25Text
	text_end

BTGreetingF1:
	text_far _BTGreetingF1Text
	text_end

BTLossF1:
	text_far _BTLossF1Text
	text_end

BTWinF1:
	text_far _BTWinF1Text
	text_end

BTGreetingF2:
	text_far _BTGreetingF2Text
	text_end

BTLossF2:
	text_far _BTLossF2Text
	text_end

BTWinF2:
	text_far _BTWinF2Text
	text_end

BTGreetingF3:
	text_far _BTGreetingF3Text
	text_end

BTLossF3:
	text_far _BTLossF3Text
	text_end

BTWinF3:
	text_far _BTWinF3Text
	text_end

BTGreetingF4:
	text_far _BTGreetingF4Text
	text_end

BTLossF4:
	text_far _BTLossF4Text
	text_end

BTWinF4:
	text_far _BTWinF4Text
	text_end

BTGreetingF5:
	text_far _BTGreetingF5Text
	text_end

BTLossF5:
	text_far _BTLossF5Text
	text_end

BTWinF5:
	text_far _BTWinF5Text
	text_end

BTGreetingF6:
	text_far _BTGreetingF6Text
	text_end

BTLossF6:
	text_far _BTLossF6Text
	text_end

BTWinF6:
	text_far _BTWinF6Text
	text_end

BTGreetingF7:
	text_far _BTGreetingF7Text
	text_end

BTLossF7:
	text_far _BTLossF7Text
	text_end

BTWinF7:
	text_far _BTWinF7Text
	text_end

BTGreetingF8:
	text_far _BTGreetingF8Text
	text_end

BTLossF8:
	text_far _BTLossF8Text
	text_end

BTWinF8:
	text_far _BTWinF8Text
	text_end

BTGreetingF9:
	text_far _BTGreetingF9Text
	text_end

BTLossF9:
	text_far _BTLossF9Text
	text_end

BTWinF9:
	text_far _BTWinF9Text
	text_end

BTGreetingF10:
	text_far _BTGreetingF10Text
	text_end

BTLossF10:
	text_far _BTLossF10Text
	text_end

BTWinF10:
	text_far _BTWinF10Text
	text_end

BTGreetingF11:
	text_far _BTGreetingF11Text
	text_end

BTLossF11:
	text_far _BTLossF11Text
	text_end

BTWinF11:
	text_far _BTWinF11Text
	text_end

BTGreetingF12:
	text_far _BTGreetingF12Text
	text_end

BTLossF12:
	text_far _BTLossF12Text
	text_end

BTWinF12:
	text_far _BTWinF12Text
	text_end

BTGreetingF13:
	text_far _BTGreetingF13Text
	text_end

BTLossF13:
	text_far _BTLossF13Text
	text_end

BTWinF13:
	text_far _BTWinF13Text
	text_end

BTGreetingF14:
	text_far _BTGreetingF14Text
	text_end

BTLossF14:
	text_far _BTLossF14Text
	text_end

BTWinF14:
	text_far _BTWinF14Text
	text_end

BTGreetingF15:
	text_far _BTGreetingF15Text
	text_end

BTLossF15:
	text_far _BTLossF15Text
	text_end

BTWinF15:
	text_far _BTWinF15Text
	text_end
