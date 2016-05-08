BattleTowerText:: ; 11c000
; Print text c for trainer [BT_OTTrainerClass]
; 1: Intro text
; 2: Player lost
; 3: Player won
	ld a, [rSVBK]
	push af
	ld a, 3 ; BANK(BT_OTTrainerClass)
	ld [rSVBK], a
IF DEF(CRYSTAL11)
	ld hl, BT_OTTrainerClass
ELSE
	ld hl, BT_OTName + 5
; BUG ALERT
; Instead of loading the Trainer Class, this routine
; loads the 6th character in the Trainer's name, then
; uses it to get the gender of the trainer.
; As a consequence, the enemy trainer's dialog will
; always be sampled from the female array.
ENDC
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
	ld a, [hRandomAdd]
	and $1f
	cp 25
	jr c, .okay0
	sub 25

.okay0
	ld hl, BTMaleTrainerTexts
	jr .proceed

.female
	; generate a random number between 0 and 14
	ld a, [hRandomAdd]
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
	ld [BT_TrainerTextIndex], a
	jr .okay2

.restore
	ld a, [BT_TrainerTextIndex]

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
	ld [rSVBK], a
	call PlaceHLTextAtBC
	ret
; 11c05d

INCLUDE "misc/fixed_words.asm"

BTTrainerClassGenders: ; 11f2f0
	db MALE   ; FALKNER
	db FEMALE ; WHITNEY
	db FEMALE ; BUGSY
	db MALE   ; MORTY
	db MALE   ; PRYCE
	db FEMALE ; JASMINE
	db MALE   ; CHUCK
	db FEMALE ; CLAIR
	db MALE   ; RIVAL1
	db MALE   ; POKEMON_PROF
	db FEMALE ; WILL
	db MALE   ; CAL
	db MALE   ; BRUNO
	db FEMALE ; KAREN
	db MALE   ; KOGA
	db MALE   ; CHAMPION
	db MALE   ; BROCK
	db FEMALE ; MISTY
	db MALE   ; LT_SURGE
	db MALE   ; SCIENTIST
	db FEMALE ; ERIKA
	db MALE   ; YOUNGSTER
	db MALE   ; SCHOOLBOY
	db MALE   ; BIRD_KEEPER
	db FEMALE ; LASS
	db FEMALE ; JANINE
	db MALE   ; COOLTRAINERM
	db FEMALE ; COOLTRAINERF
	db FEMALE ; BEAUTY
	db MALE   ; POKEMANIAC
	db MALE   ; GRUNTM
	db MALE   ; GENTLEMAN
	db FEMALE ; SKIER
	db FEMALE ; TEACHER
	db FEMALE ; SABRINA
	db MALE   ; BUG_CATCHER
	db MALE   ; FISHER
	db MALE   ; SWIMMERM
	db FEMALE ; SWIMMERF
	db MALE   ; SAILOR
	db MALE   ; SUPER_NERD
	db MALE   ; RIVAL2
	db MALE   ; GUITARIST
	db MALE   ; HIKER
	db MALE   ; BIKER
	db MALE   ; BLAINE
	db MALE   ; BURGLAR
	db MALE   ; FIREBREATHER
	db MALE   ; JUGGLER
	db MALE   ; BLACKBELT_T
	db MALE   ; EXECUTIVEM
	db MALE   ; PSYCHIC_T
	db FEMALE ; PICNICKER
	db MALE   ; CAMPER
	db FEMALE ; EXECUTIVEF
	db MALE   ; SAGE
	db FEMALE ; MEDIUM
	db MALE   ; BOARDER
	db MALE   ; POKEFANM
	db FEMALE ; KIMONO_GIRL
	db FEMALE ; TWINS
	db FEMALE ; POKEFANF
	db MALE   ; RED
	db MALE   ; BLUE
	db MALE   ; OFFICER
	db FEMALE ; GRUNTF


BTMaleTrainerTexts: ; 11f332
	dw .Greetings
	dw .PlayerLost
	dw .PlayerWon

.Greetings: ; 11f338
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

.PlayerLost: ; 11f36a
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

.PlayerWon: ; 11f39c
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

.Greetings: ; 11f3d4
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

.PlayerLost: ; 11f3f2
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

.PlayerWon: ; 11f410
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


BTGreetingM1: ; 0x11f42e
	text_jump BattleTowerText_0x1ec000
	db "@"

BTLossM1: ; 0x11f433
	text_jump BattleTowerText_0x1ec03b
	db "@"

BTWinM1: ; 0x11f438
	text_jump UnknownText_0x1ec060
	db "@"

BTGreetingM2: ; 0x11f43d
	text_jump BattleTowerText_0x1ec080
	db "@"

BTLossM2: ; 0x11f442
	text_jump UnknownText_0x1ec0a3
	db "@"

BTWinM2: ; 0x11f447
	text_jump UnknownText_0x1ec0c4
	db "@"

BTGreetingM3: ; 0x11f44c
	text_jump UnknownText_0x1ec0e1
	db "@"

BTLossM3: ; 0x11f451
	text_jump UnknownText_0x1ec108
	db "@"

BTWinM3: ; 0x11f456
	text_jump UnknownText_0x1ec12a
	db "@"

BTGreetingM4: ; 0x11f45b
	text_jump UnknownText_0x1ec14d
	db "@"

BTLossM4: ; 0x11f460
	text_jump UnknownText_0x1ec16f
	db "@"

BTWinM4: ; 0x11f465
	text_jump UnknownText_0x1ec190
	db "@"

BTGreetingM5: ; 0x11f46a
	text_jump UnknownText_0x1ec1ae
	db "@"

BTLossM5: ; 0x11f46f
	text_jump UnknownText_0x1ec1d0
	db "@"

BTWinM5: ; 0x11f474
	text_jump UnknownText_0x1ec1f4
	db "@"

BTGreetingM6: ; 0x11f479
	text_jump UnknownText_0x1ec216
	db "@"

BTLossM6: ; 0x11f47e
	text_jump UnknownText_0x1ec238
	db "@"

BTWinM6: ; 0x11f483
	text_jump UnknownText_0x1ec259
	db "@"

BTGreetingM7: ; 0x11f488
	text_jump UnknownText_0x1ec27b
	db "@"

BTLossM7: ; 0x11f48d
	text_jump UnknownText_0x1ec2a0
	db "@"

BTWinM7: ; 0x11f492
	text_jump UnknownText_0x1ec2c0
	db "@"

BTGreetingM8: ; 0x11f497
	text_jump UnknownText_0x1ec2d9
	db "@"

BTLossM8: ; 0x11f49c
	text_jump UnknownText_0x1ec2fe
	db "@"

BTWinM8: ; 0x11f4a1
	text_jump UnknownText_0x1ec320
	db "@"

BTGreetingM9: ; 0x11f4a6
	text_jump UnknownText_0x1ec33f
	db "@"

BTLossM9: ; 0x11f4ab
	text_jump UnknownText_0x1ec36c
	db "@"

BTWinM9: ; 0x11f4b0
	text_jump UnknownText_0x1ec389
	db "@"

BTGreetingM10: ; 0x11f4b5
	text_jump UnknownText_0x1ec3ad
	db "@"

BTLossM10: ; 0x11f4ba
	text_jump UnknownText_0x1ec3c5
	db "@"

BTWinM10: ; 0x11f4bf
	text_jump UnknownText_0x1ec3e5
	db "@"

BTGreetingM11: ; 0x11f4c4
	text_jump UnknownText_0x1ec402
	db "@"

BTLossM11: ; 0x11f4c9
	text_jump UnknownText_0x1ec411
	db "@"

BTWinM11: ; 0x11f4ce
	text_jump UnknownText_0x1ec41f
	db "@"

BTGreetingM12: ; 0x11f4d3
	text_jump UnknownText_0x1ec42e
	db "@"

BTLossM12: ; 0x11f4d8
	text_jump UnknownText_0x1ec461
	db "@"

BTWinM12: ; 0x11f4dd
	text_jump UnknownText_0x1ec4a0
	db "@"

BTGreetingM13: ; 0x11f4e2
	text_jump UnknownText_0x1ec4d6
	db "@"

BTLossM13: ; 0x11f4e7
	text_jump UnknownText_0x1ec4f5
	db "@"

BTWinM13: ; 0x11f4ec
	text_jump UnknownText_0x1ec512
	db "@"

BTGreetingM14: ; 0x11f4f1
	text_jump UnknownText_0x1ec532
	db "@"

BTLossM14: ; 0x11f4f6
	text_jump UnknownText_0x1ec54b
	db "@"

BTWinM14: ; 0x11f4fb
	text_jump UnknownText_0x1ec565
	db "@"

BTGreetingM15: ; 0x11f500
	text_jump UnknownText_0x1ec580
	db "@"

BTLossM15: ; 0x11f505
	text_jump UnknownText_0x1ec59d
	db "@"

BTWinM15: ; 0x11f50a
	text_jump UnknownText_0x1ec5b5
	db "@"

BTGreetingM16: ; 0x11f50f
	text_jump UnknownText_0x1ec5d3
	db "@"

BTLossM16: ; 0x11f514
	text_jump UnknownText_0x1ec5ee
	db "@"

BTWinM16: ; 0x11f519
	text_jump UnknownText_0x1ec60d
	db "@"

BTGreetingM17: ; 0x11f51e
	text_jump UnknownText_0x1ec631
	db "@"

BTLossM17: ; 0x11f523
	text_jump UnknownText_0x1ec651
	db "@"

BTWinM17: ; 0x11f528
	text_jump UnknownText_0x1ec68f
	db "@"

BTGreetingM18: ; 0x11f52d
	text_jump UnknownText_0x1ec6b1
	db "@"

BTLossM18: ; 0x11f532
	text_jump UnknownText_0x1ec6d0
	db "@"

BTWinM18: ; 0x11f537
	text_jump UnknownText_0x1ec708
	db "@"

BTGreetingM19: ; 0x11f53c
	text_jump UnknownText_0x1ec720
	db "@"

BTLossM19: ; 0x11f541
	text_jump UnknownText_0x1ec73e
	db "@"

BTWinM19: ; 0x11f546
	text_jump UnknownText_0x1ec75b
	db "@"

BTGreetingM20: ; 0x11f54b
	text_jump UnknownText_0x1ec77f
	db "@"

BTLossM20: ; 0x11f550
	text_jump UnknownText_0x1ec798
	db "@"

BTWinM20: ; 0x11f555
	text_jump UnknownText_0x1ec7bb
	db "@"

BTGreetingM21: ; 0x11f55a
	text_jump UnknownText_0x1ec7d8
	db "@"

BTLossM21: ; 0x11f55f
	text_jump UnknownText_0x1ec818
	db "@"

BTWinM21: ; 0x11f564
	text_jump UnknownText_0x1ec837
	db "@"

BTGreetingM22: ; 0x11f569
	text_jump UnknownText_0x1ec858
	db "@"

BTLossM22: ; 0x11f56e
	text_jump UnknownText_0x1ec876
	db "@"

BTWinM22: ; 0x11f573
	text_jump UnknownText_0x1ec898
	db "@"

BTGreetingM23: ; 0x11f578
	text_jump UnknownText_0x1ec8b1
	db "@"

BTLossM23: ; 0x11f57d
	text_jump UnknownText_0x1ec8d5
	db "@"

BTWinM23: ; 0x11f582
	text_jump UnknownText_0x1ec8f0
	db "@"

BTGreetingM24: ; 0x11f587
	text_jump UnknownText_0x1ec911
	db "@"

BTLossM24: ; 0x11f58c
	text_jump UnknownText_0x1ec928
	db "@"

BTWinM24: ; 0x11f591
	text_jump UnknownText_0x1ec949
	db "@"

BTGreetingM25: ; 0x11f596
	text_jump UnknownText_0x1ec969
	db "@"

BTLossM25: ; 0x11f59b
	text_jump UnknownText_0x1ec986
	db "@"

BTWinM25: ; 0x11f5a0
	text_jump UnknownText_0x1ec99b
	db "@"




BTGreetingF1: ; 0x11f5a5
	text_jump UnknownText_0x1ec9bd
	db "@"

BTLossF1: ; 0x11f5aa
	text_jump UnknownText_0x1ec9d9
	db "@"

BTWinF1: ; 0x11f5af
	text_jump UnknownText_0x1ec9f7
	db "@"

BTGreetingF2: ; 0x11f5b4
	text_jump UnknownText_0x1eca0a
	db "@"

BTLossF2: ; 0x11f5b9
	text_jump UnknownText_0x1eca2a
	db "@"

BTWinF2: ; 0x11f5be
	text_jump UnknownText_0x1eca47
	db "@"

BTGreetingF3: ; 0x11f5c3
	text_jump UnknownText_0x1eca64
	db "@"

BTLossF3: ; 0x11f5c8
	text_jump UnknownText_0x1eca82
	db "@"

BTWinF3: ; 0x11f5cd
	text_jump UnknownText_0x1eca9d
	db "@"

BTGreetingF4: ; 0x11f5d2
	text_jump UnknownText_0x1ecabf
	db "@"

BTLossF4: ; 0x11f5d7
	text_jump UnknownText_0x1ecade
	db "@"

BTWinF4: ; 0x11f5dc
	text_jump UnknownText_0x1ecafa
	db "@"

BTGreetingF5: ; 0x11f5e1
	text_jump UnknownText_0x1ecb19
	db "@"

BTLossF5: ; 0x11f5e6
	text_jump UnknownText_0x1ecb37
	db "@"

BTWinF5: ; 0x11f5eb
	text_jump UnknownText_0x1ecb55
	db "@"

BTGreetingF6: ; 0x11f5f0
	text_jump UnknownText_0x1ecb70
	db "@"

BTLossF6: ; 0x11f5f5
	text_jump UnknownText_0x1ecb92
	db "@"

BTWinF6: ; 0x11f5fa
	text_jump UnknownText_0x1ecbb6
	db "@"

BTGreetingF7: ; 0x11f5ff
	text_jump UnknownText_0x1ecbd9
	db "@"

BTLossF7: ; 0x11f604
	text_jump UnknownText_0x1ecbf3
	db "@"

BTWinF7: ; 0x11f609
	text_jump UnknownText_0x1ecc15
	db "@"

BTGreetingF8: ; 0x11f60e
	text_jump UnknownText_0x1ecc39
	db "@"

BTLossF8: ; 0x11f613
	text_jump UnknownText_0x1ecc55
	db "@"

BTWinF8: ; 0x11f618
	text_jump UnknownText_0x1ecc75
	db "@"

BTGreetingF9: ; 0x11f61d
	text_jump UnknownText_0x1ecc92
	db "@"

BTLossF9: ; 0x11f622
	text_jump UnknownText_0x1ecca7
	db "@"

BTWinF9: ; 0x11f627
	text_jump UnknownText_0x1eccc1
	db "@"

BTGreetingF10: ; 0x11f62c
	text_jump UnknownText_0x1eccd7
	db "@"

BTLossF10: ; 0x11f631
	text_jump UnknownText_0x1eccef
	db "@"

BTWinF10: ; 0x11f636
	text_jump UnknownText_0x1ecd0e
	db "@"

BTGreetingF11: ; 0x11f63b
	text_jump UnknownText_0x1ecd2b
	db "@"

BTLossF11: ; 0x11f640
	text_jump UnknownText_0x1ecd4d
	db "@"

BTWinF11: ; 0x11f645
	text_jump UnknownText_0x1ecd6b
	db "@"

BTGreetingF12: ; 0x11f64a
	text_jump UnknownText_0x1ecd8d
	db "@"

BTLossF12: ; 0x11f64f
	text_jump UnknownText_0x1ecdaf
	db "@"

BTWinF12: ; 0x11f654
	text_jump UnknownText_0x1ecdcf
	db "@"

BTGreetingF13: ; 0x11f659
	text_jump UnknownText_0x1ecded
	db "@"

BTLossF13: ; 0x11f65e
	text_jump UnknownText_0x1ece0d
	db "@"

BTWinF13: ; 0x11f663
	text_jump UnknownText_0x1ece2a
	db "@"

BTGreetingF14: ; 0x11f668
	text_jump UnknownText_0x1ece4b
	db "@"

BTLossF14: ; 0x11f66d
	text_jump UnknownText_0x1ece70
	db "@"

BTWinF14: ; 0x11f672
	text_jump UnknownText_0x1ece8a
	db "@"

BTGreetingF15: ; 0x11f677
	text_jump UnknownText_0x1ecea8
	db "@"

BTLossF15: ; 0x11f67c
	text_jump UnknownText_0x1ecec9
	db "@"

BTWinF15: ; 0x11f681
	text_jump UnknownText_0x1ecee8
	db "@"
