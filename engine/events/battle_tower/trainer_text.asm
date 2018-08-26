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
	text_jump BattleTowerText_0x1ec000
	db "@"

BTLossM1:
	text_jump BattleTowerText_0x1ec03b
	db "@"

BTWinM1:
	text_jump UnknownText_0x1ec060
	db "@"

BTGreetingM2:
	text_jump BattleTowerText_0x1ec080
	db "@"

BTLossM2:
	text_jump UnknownText_0x1ec0a3
	db "@"

BTWinM2:
	text_jump UnknownText_0x1ec0c4
	db "@"

BTGreetingM3:
	text_jump UnknownText_0x1ec0e1
	db "@"

BTLossM3:
	text_jump UnknownText_0x1ec108
	db "@"

BTWinM3:
	text_jump UnknownText_0x1ec12a
	db "@"

BTGreetingM4:
	text_jump UnknownText_0x1ec14d
	db "@"

BTLossM4:
	text_jump UnknownText_0x1ec16f
	db "@"

BTWinM4:
	text_jump UnknownText_0x1ec190
	db "@"

BTGreetingM5:
	text_jump UnknownText_0x1ec1ae
	db "@"

BTLossM5:
	text_jump UnknownText_0x1ec1d0
	db "@"

BTWinM5:
	text_jump UnknownText_0x1ec1f4
	db "@"

BTGreetingM6:
	text_jump UnknownText_0x1ec216
	db "@"

BTLossM6:
	text_jump UnknownText_0x1ec238
	db "@"

BTWinM6:
	text_jump UnknownText_0x1ec259
	db "@"

BTGreetingM7:
	text_jump UnknownText_0x1ec27b
	db "@"

BTLossM7:
	text_jump UnknownText_0x1ec2a0
	db "@"

BTWinM7:
	text_jump UnknownText_0x1ec2c0
	db "@"

BTGreetingM8:
	text_jump UnknownText_0x1ec2d9
	db "@"

BTLossM8:
	text_jump UnknownText_0x1ec2fe
	db "@"

BTWinM8:
	text_jump UnknownText_0x1ec320
	db "@"

BTGreetingM9:
	text_jump UnknownText_0x1ec33f
	db "@"

BTLossM9:
	text_jump UnknownText_0x1ec36c
	db "@"

BTWinM9:
	text_jump UnknownText_0x1ec389
	db "@"

BTGreetingM10:
	text_jump UnknownText_0x1ec3ad
	db "@"

BTLossM10:
	text_jump UnknownText_0x1ec3c5
	db "@"

BTWinM10:
	text_jump UnknownText_0x1ec3e5
	db "@"

BTGreetingM11:
	text_jump UnknownText_0x1ec402
	db "@"

BTLossM11:
	text_jump UnknownText_0x1ec411
	db "@"

BTWinM11:
	text_jump UnknownText_0x1ec41f
	db "@"

BTGreetingM12:
	text_jump UnknownText_0x1ec42e
	db "@"

BTLossM12:
	text_jump UnknownText_0x1ec461
	db "@"

BTWinM12:
	text_jump UnknownText_0x1ec4a0
	db "@"

BTGreetingM13:
	text_jump UnknownText_0x1ec4d6
	db "@"

BTLossM13:
	text_jump UnknownText_0x1ec4f5
	db "@"

BTWinM13:
	text_jump UnknownText_0x1ec512
	db "@"

BTGreetingM14:
	text_jump UnknownText_0x1ec532
	db "@"

BTLossM14:
	text_jump UnknownText_0x1ec54b
	db "@"

BTWinM14:
	text_jump UnknownText_0x1ec565
	db "@"

BTGreetingM15:
	text_jump UnknownText_0x1ec580
	db "@"

BTLossM15:
	text_jump UnknownText_0x1ec59d
	db "@"

BTWinM15:
	text_jump UnknownText_0x1ec5b5
	db "@"

BTGreetingM16:
	text_jump UnknownText_0x1ec5d3
	db "@"

BTLossM16:
	text_jump UnknownText_0x1ec5ee
	db "@"

BTWinM16:
	text_jump UnknownText_0x1ec60d
	db "@"

BTGreetingM17:
	text_jump UnknownText_0x1ec631
	db "@"

BTLossM17:
	text_jump UnknownText_0x1ec651
	db "@"

BTWinM17:
	text_jump UnknownText_0x1ec68f
	db "@"

BTGreetingM18:
	text_jump UnknownText_0x1ec6b1
	db "@"

BTLossM18:
	text_jump UnknownText_0x1ec6d0
	db "@"

BTWinM18:
	text_jump UnknownText_0x1ec708
	db "@"

BTGreetingM19:
	text_jump UnknownText_0x1ec720
	db "@"

BTLossM19:
	text_jump UnknownText_0x1ec73e
	db "@"

BTWinM19:
	text_jump UnknownText_0x1ec75b
	db "@"

BTGreetingM20:
	text_jump UnknownText_0x1ec77f
	db "@"

BTLossM20:
	text_jump UnknownText_0x1ec798
	db "@"

BTWinM20:
	text_jump UnknownText_0x1ec7bb
	db "@"

BTGreetingM21:
	text_jump UnknownText_0x1ec7d8
	db "@"

BTLossM21:
	text_jump UnknownText_0x1ec818
	db "@"

BTWinM21:
	text_jump UnknownText_0x1ec837
	db "@"

BTGreetingM22:
	text_jump UnknownText_0x1ec858
	db "@"

BTLossM22:
	text_jump UnknownText_0x1ec876
	db "@"

BTWinM22:
	text_jump UnknownText_0x1ec898
	db "@"

BTGreetingM23:
	text_jump UnknownText_0x1ec8b1
	db "@"

BTLossM23:
	text_jump UnknownText_0x1ec8d5
	db "@"

BTWinM23:
	text_jump UnknownText_0x1ec8f0
	db "@"

BTGreetingM24:
	text_jump UnknownText_0x1ec911
	db "@"

BTLossM24:
	text_jump UnknownText_0x1ec928
	db "@"

BTWinM24:
	text_jump UnknownText_0x1ec949
	db "@"

BTGreetingM25:
	text_jump UnknownText_0x1ec969
	db "@"

BTLossM25:
	text_jump UnknownText_0x1ec986
	db "@"

BTWinM25:
	text_jump UnknownText_0x1ec99b
	db "@"

BTGreetingF1:
	text_jump UnknownText_0x1ec9bd
	db "@"

BTLossF1:
	text_jump UnknownText_0x1ec9d9
	db "@"

BTWinF1:
	text_jump UnknownText_0x1ec9f7
	db "@"

BTGreetingF2:
	text_jump UnknownText_0x1eca0a
	db "@"

BTLossF2:
	text_jump UnknownText_0x1eca2a
	db "@"

BTWinF2:
	text_jump UnknownText_0x1eca47
	db "@"

BTGreetingF3:
	text_jump UnknownText_0x1eca64
	db "@"

BTLossF3:
	text_jump UnknownText_0x1eca82
	db "@"

BTWinF3:
	text_jump UnknownText_0x1eca9d
	db "@"

BTGreetingF4:
	text_jump UnknownText_0x1ecabf
	db "@"

BTLossF4:
	text_jump UnknownText_0x1ecade
	db "@"

BTWinF4:
	text_jump UnknownText_0x1ecafa
	db "@"

BTGreetingF5:
	text_jump UnknownText_0x1ecb19
	db "@"

BTLossF5:
	text_jump UnknownText_0x1ecb37
	db "@"

BTWinF5:
	text_jump UnknownText_0x1ecb55
	db "@"

BTGreetingF6:
	text_jump UnknownText_0x1ecb70
	db "@"

BTLossF6:
	text_jump UnknownText_0x1ecb92
	db "@"

BTWinF6:
	text_jump UnknownText_0x1ecbb6
	db "@"

BTGreetingF7:
	text_jump UnknownText_0x1ecbd9
	db "@"

BTLossF7:
	text_jump UnknownText_0x1ecbf3
	db "@"

BTWinF7:
	text_jump UnknownText_0x1ecc15
	db "@"

BTGreetingF8:
	text_jump UnknownText_0x1ecc39
	db "@"

BTLossF8:
	text_jump UnknownText_0x1ecc55
	db "@"

BTWinF8:
	text_jump UnknownText_0x1ecc75
	db "@"

BTGreetingF9:
	text_jump UnknownText_0x1ecc92
	db "@"

BTLossF9:
	text_jump UnknownText_0x1ecca7
	db "@"

BTWinF9:
	text_jump UnknownText_0x1eccc1
	db "@"

BTGreetingF10:
	text_jump UnknownText_0x1eccd7
	db "@"

BTLossF10:
	text_jump UnknownText_0x1eccef
	db "@"

BTWinF10:
	text_jump UnknownText_0x1ecd0e
	db "@"

BTGreetingF11:
	text_jump UnknownText_0x1ecd2b
	db "@"

BTLossF11:
	text_jump UnknownText_0x1ecd4d
	db "@"

BTWinF11:
	text_jump UnknownText_0x1ecd6b
	db "@"

BTGreetingF12:
	text_jump UnknownText_0x1ecd8d
	db "@"

BTLossF12:
	text_jump UnknownText_0x1ecdaf
	db "@"

BTWinF12:
	text_jump UnknownText_0x1ecdcf
	db "@"

BTGreetingF13:
	text_jump UnknownText_0x1ecded
	db "@"

BTLossF13:
	text_jump UnknownText_0x1ece0d
	db "@"

BTWinF13:
	text_jump UnknownText_0x1ece2a
	db "@"

BTGreetingF14:
	text_jump UnknownText_0x1ece4b
	db "@"

BTLossF14:
	text_jump UnknownText_0x1ece70
	db "@"

BTWinF14:
	text_jump UnknownText_0x1ece8a
	db "@"

BTGreetingF15:
	text_jump UnknownText_0x1ecea8
	db "@"

BTLossF15:
	text_jump UnknownText_0x1ecec9
	db "@"

BTWinF15:
	text_jump UnknownText_0x1ecee8
	db "@"
