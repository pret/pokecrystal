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
	text_far BattleTowerText_0x1ec000
	text_end

BTLossM1:
	text_far BattleTowerText_0x1ec03b
	text_end

BTWinM1:
	text_far UnknownText_0x1ec060
	text_end

BTGreetingM2:
	text_far BattleTowerText_0x1ec080
	text_end

BTLossM2:
	text_far UnknownText_0x1ec0a3
	text_end

BTWinM2:
	text_far UnknownText_0x1ec0c4
	text_end

BTGreetingM3:
	text_far UnknownText_0x1ec0e1
	text_end

BTLossM3:
	text_far UnknownText_0x1ec108
	text_end

BTWinM3:
	text_far UnknownText_0x1ec12a
	text_end

BTGreetingM4:
	text_far UnknownText_0x1ec14d
	text_end

BTLossM4:
	text_far UnknownText_0x1ec16f
	text_end

BTWinM4:
	text_far UnknownText_0x1ec190
	text_end

BTGreetingM5:
	text_far UnknownText_0x1ec1ae
	text_end

BTLossM5:
	text_far UnknownText_0x1ec1d0
	text_end

BTWinM5:
	text_far UnknownText_0x1ec1f4
	text_end

BTGreetingM6:
	text_far UnknownText_0x1ec216
	text_end

BTLossM6:
	text_far UnknownText_0x1ec238
	text_end

BTWinM6:
	text_far UnknownText_0x1ec259
	text_end

BTGreetingM7:
	text_far UnknownText_0x1ec27b
	text_end

BTLossM7:
	text_far UnknownText_0x1ec2a0
	text_end

BTWinM7:
	text_far UnknownText_0x1ec2c0
	text_end

BTGreetingM8:
	text_far UnknownText_0x1ec2d9
	text_end

BTLossM8:
	text_far UnknownText_0x1ec2fe
	text_end

BTWinM8:
	text_far UnknownText_0x1ec320
	text_end

BTGreetingM9:
	text_far UnknownText_0x1ec33f
	text_end

BTLossM9:
	text_far UnknownText_0x1ec36c
	text_end

BTWinM9:
	text_far UnknownText_0x1ec389
	text_end

BTGreetingM10:
	text_far UnknownText_0x1ec3ad
	text_end

BTLossM10:
	text_far UnknownText_0x1ec3c5
	text_end

BTWinM10:
	text_far UnknownText_0x1ec3e5
	text_end

BTGreetingM11:
	text_far UnknownText_0x1ec402
	text_end

BTLossM11:
	text_far UnknownText_0x1ec411
	text_end

BTWinM11:
	text_far UnknownText_0x1ec41f
	text_end

BTGreetingM12:
	text_far UnknownText_0x1ec42e
	text_end

BTLossM12:
	text_far UnknownText_0x1ec461
	text_end

BTWinM12:
	text_far UnknownText_0x1ec4a0
	text_end

BTGreetingM13:
	text_far UnknownText_0x1ec4d6
	text_end

BTLossM13:
	text_far UnknownText_0x1ec4f5
	text_end

BTWinM13:
	text_far UnknownText_0x1ec512
	text_end

BTGreetingM14:
	text_far UnknownText_0x1ec532
	text_end

BTLossM14:
	text_far UnknownText_0x1ec54b
	text_end

BTWinM14:
	text_far UnknownText_0x1ec565
	text_end

BTGreetingM15:
	text_far UnknownText_0x1ec580
	text_end

BTLossM15:
	text_far UnknownText_0x1ec59d
	text_end

BTWinM15:
	text_far UnknownText_0x1ec5b5
	text_end

BTGreetingM16:
	text_far UnknownText_0x1ec5d3
	text_end

BTLossM16:
	text_far UnknownText_0x1ec5ee
	text_end

BTWinM16:
	text_far UnknownText_0x1ec60d
	text_end

BTGreetingM17:
	text_far UnknownText_0x1ec631
	text_end

BTLossM17:
	text_far UnknownText_0x1ec651
	text_end

BTWinM17:
	text_far UnknownText_0x1ec68f
	text_end

BTGreetingM18:
	text_far UnknownText_0x1ec6b1
	text_end

BTLossM18:
	text_far UnknownText_0x1ec6d0
	text_end

BTWinM18:
	text_far UnknownText_0x1ec708
	text_end

BTGreetingM19:
	text_far UnknownText_0x1ec720
	text_end

BTLossM19:
	text_far UnknownText_0x1ec73e
	text_end

BTWinM19:
	text_far UnknownText_0x1ec75b
	text_end

BTGreetingM20:
	text_far UnknownText_0x1ec77f
	text_end

BTLossM20:
	text_far UnknownText_0x1ec798
	text_end

BTWinM20:
	text_far UnknownText_0x1ec7bb
	text_end

BTGreetingM21:
	text_far UnknownText_0x1ec7d8
	text_end

BTLossM21:
	text_far UnknownText_0x1ec818
	text_end

BTWinM21:
	text_far UnknownText_0x1ec837
	text_end

BTGreetingM22:
	text_far UnknownText_0x1ec858
	text_end

BTLossM22:
	text_far UnknownText_0x1ec876
	text_end

BTWinM22:
	text_far UnknownText_0x1ec898
	text_end

BTGreetingM23:
	text_far UnknownText_0x1ec8b1
	text_end

BTLossM23:
	text_far UnknownText_0x1ec8d5
	text_end

BTWinM23:
	text_far UnknownText_0x1ec8f0
	text_end

BTGreetingM24:
	text_far UnknownText_0x1ec911
	text_end

BTLossM24:
	text_far UnknownText_0x1ec928
	text_end

BTWinM24:
	text_far UnknownText_0x1ec949
	text_end

BTGreetingM25:
	text_far UnknownText_0x1ec969
	text_end

BTLossM25:
	text_far UnknownText_0x1ec986
	text_end

BTWinM25:
	text_far UnknownText_0x1ec99b
	text_end

BTGreetingF1:
	text_far UnknownText_0x1ec9bd
	text_end

BTLossF1:
	text_far UnknownText_0x1ec9d9
	text_end

BTWinF1:
	text_far UnknownText_0x1ec9f7
	text_end

BTGreetingF2:
	text_far UnknownText_0x1eca0a
	text_end

BTLossF2:
	text_far UnknownText_0x1eca2a
	text_end

BTWinF2:
	text_far UnknownText_0x1eca47
	text_end

BTGreetingF3:
	text_far UnknownText_0x1eca64
	text_end

BTLossF3:
	text_far UnknownText_0x1eca82
	text_end

BTWinF3:
	text_far UnknownText_0x1eca9d
	text_end

BTGreetingF4:
	text_far UnknownText_0x1ecabf
	text_end

BTLossF4:
	text_far UnknownText_0x1ecade
	text_end

BTWinF4:
	text_far UnknownText_0x1ecafa
	text_end

BTGreetingF5:
	text_far UnknownText_0x1ecb19
	text_end

BTLossF5:
	text_far UnknownText_0x1ecb37
	text_end

BTWinF5:
	text_far UnknownText_0x1ecb55
	text_end

BTGreetingF6:
	text_far UnknownText_0x1ecb70
	text_end

BTLossF6:
	text_far UnknownText_0x1ecb92
	text_end

BTWinF6:
	text_far UnknownText_0x1ecbb6
	text_end

BTGreetingF7:
	text_far UnknownText_0x1ecbd9
	text_end

BTLossF7:
	text_far UnknownText_0x1ecbf3
	text_end

BTWinF7:
	text_far UnknownText_0x1ecc15
	text_end

BTGreetingF8:
	text_far UnknownText_0x1ecc39
	text_end

BTLossF8:
	text_far UnknownText_0x1ecc55
	text_end

BTWinF8:
	text_far UnknownText_0x1ecc75
	text_end

BTGreetingF9:
	text_far UnknownText_0x1ecc92
	text_end

BTLossF9:
	text_far UnknownText_0x1ecca7
	text_end

BTWinF9:
	text_far UnknownText_0x1eccc1
	text_end

BTGreetingF10:
	text_far UnknownText_0x1eccd7
	text_end

BTLossF10:
	text_far UnknownText_0x1eccef
	text_end

BTWinF10:
	text_far UnknownText_0x1ecd0e
	text_end

BTGreetingF11:
	text_far UnknownText_0x1ecd2b
	text_end

BTLossF11:
	text_far UnknownText_0x1ecd4d
	text_end

BTWinF11:
	text_far UnknownText_0x1ecd6b
	text_end

BTGreetingF12:
	text_far UnknownText_0x1ecd8d
	text_end

BTLossF12:
	text_far UnknownText_0x1ecdaf
	text_end

BTWinF12:
	text_far UnknownText_0x1ecdcf
	text_end

BTGreetingF13:
	text_far UnknownText_0x1ecded
	text_end

BTLossF13:
	text_far UnknownText_0x1ece0d
	text_end

BTWinF13:
	text_far UnknownText_0x1ece2a
	text_end

BTGreetingF14:
	text_far UnknownText_0x1ece4b
	text_end

BTLossF14:
	text_far UnknownText_0x1ece70
	text_end

BTWinF14:
	text_far UnknownText_0x1ece8a
	text_end

BTGreetingF15:
	text_far UnknownText_0x1ecea8
	text_end

BTLossF15:
	text_far UnknownText_0x1ecec9
	text_end

BTWinF15:
	text_far UnknownText_0x1ecee8
	text_end
