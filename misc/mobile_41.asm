SECTION "bank41_2", ROMX

; These functions deal with miscellaneous statistics
; which were used for Trainer Rankings in Pokémon News.

; Copies certain values at the time the player enters the Hall of Fame.
TrainerRankings_HallOfFame2:: mobile ; 0x105ef6
	ld a, BANK(sTrainerRankingGameTimeHOF)
	call GetSRAMBank

	ld hl, GameTimeHours
	ld de, sTrainerRankingGameTimeHOF
	ld bc, 4
	call CopyBytes

	ld hl, sTrainerRankingStepCount
	ld de, sTrainerRankingStepCountHOF
	ld bc, 4
	call CopyBytes

	; sTrainerRankingHealings is only a 3-byte value.
	; One extraneous byte is copied from sTrainerRankingMysteryGift.
	ld hl, sTrainerRankingHealings
	ld de, sTrainerRankingHealingsHOF
	ld bc, 4
	call CopyBytes

	ld hl, sTrainerRankingBattles
	ld de, sTrainerRankingBattlesHOF
	ld bc, 3
	call CopyBytes

	call UpdateTrainerRankingsChecksum
	call CloseSRAM
	ret
; 105f33

TrainerRankings_MagikarpLength: mobile ; 105f33
	ld a, BANK(sTrainerRankingLongestMagikarp)
	call GetSRAMBank
	ld de, Buffer1
	ld hl, sTrainerRankingLongestMagikarp

	; Is this Magikarp the longest measured?
	ld a, [de]
	cp [hl]
	jr z, .isLowByteHigher
	jr nc, .newRecordLongest
	jr .checkShortest

.isLowByteHigher
	inc hl
	inc de
	ld a, [de]
	cp [hl]
	dec hl
	dec de
	jr c, .checkShortest

.newRecordLongest
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	dec de
	ld [hl], a

.checkShortest
	; First, check if the record for shortest Magikarp is 0.
	; This seems unnecessary, because the value is initialized to 100.0 cm.
	ld hl, sTrainerRankingShortestMagikarp
	ld a, [hli]
	or [hl]
	dec hl
	jr z, .newRecordShortest

	; Now check if this Magikarp is the shortest
	ld a, [de]
	cp [hl]
	jr z, .isLowByteLower
	jr c, .newRecordShortest
	jr .done

.isLowByteLower
	inc hl
	inc de
	ld a, [de]
	cp [hl]
	jr nc, .done
	dec hl
	dec de

.newRecordShortest
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hl], a

.done
	call UpdateTrainerRankingsChecksum
	call CloseSRAM
	ret
; 105f79

TrainerRankings_BugContestScore: mobile ; 105f79
	ld a, BANK(sTrainerRankingBugContestScore)
	call GetSRAMBank
	ld a, [hProduct]
	ld hl, sTrainerRankingBugContestScore
	cp [hl]
	jr z, .isLowByteHigher
	jr nc, .newHighScore
	jr .done

.isLowByteHigher
	inc hl
	ld a, [hMultiplicand]
	cp [hl]
	jr c, .done
	dec hl

.newHighScore
	ld a, [hProduct]
	ld [hli], a
	ld a, [hMultiplicand]
	ld [hl], a

.done
	call UpdateTrainerRankingsChecksum
	call CloseSRAM
	ret
; 105f9f

TrainerRankings_AddToSlotsWinStreak: mobile ; 105f9f
	ld a, BANK(sTrainerRankingCurrentSlotsStreak)
	call GetSRAMBank

	; Increment the current streak
	ld hl, sTrainerRankingCurrentSlotsStreak + 1
	inc [hl]
	jr nz, .noCarry
	dec hl
	inc [hl]
	inc hl

.noCarry
	dec hl
	; Now check if this is a new record for longest streak
	ld a, [sTrainerRankingLongestSlotsStreak]
	cp [hl]
	jr z, .isLowByteHigher
	jr c, .newRecordStreak
	jr .done

.isLowByteHigher
	inc hl
	ld a, [sTrainerRankingLongestSlotsStreak + 1]
	cp [hl]
	jr nc, .done
	dec hl

.newRecordStreak
	ld a, [hli]
	ld [sTrainerRankingLongestSlotsStreak], a
	ld a, [hl]
	ld [sTrainerRankingLongestSlotsStreak + 1], a

.done
	call UpdateTrainerRankingsChecksum
	call CloseSRAM
	ret
; 105fd0

TrainerRankings_EndSlotsWinStreak: mobile ; 105fd0
	ld a, BANK(sTrainerRankingCurrentSlotsStreak)
	call GetSRAMBank
	ld hl, sTrainerRankingCurrentSlotsStreak
	xor a
	ld [hli], a
	ld [hl], a
	call UpdateTrainerRankingsChecksum
	call CloseSRAM
	ret
; 105fe3

TrainerRankings_AddToSlotsPayouts: mobile ; 105fe3
	ld a, BANK(sTrainerRankingTotalSlotsPayouts)
	call GetSRAMBank
	ld hl, sTrainerRankingTotalSlotsPayouts + 3
	ld a, e
	add [hl]
	ld [hld], a
	ld a, d
	adc [hl]
	ld [hld], a
	jr nc, .done
	inc [hl]
	jr nz, .done
	dec hl
	inc [hl]
	jr nz, .done
	ld a, $ff
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a

.done
	call UpdateTrainerRankingsChecksum
	call CloseSRAM
	ret
; 106008

TrainerRankings_AddToBattlePayouts: mobile ; 106008
	ld a, BANK(sTrainerRankingTotalBattlePayouts)
	call GetSRAMBank
	ld hl, sTrainerRankingTotalBattlePayouts + 3
	ld a, [bc]
	dec bc
	add [hl]
	ld [hld], a
	ld a, [bc]
	dec bc
	adc [hl]
	ld [hld], a
	ld a, [bc]
	adc [hl]
	ld [hld], a
	jr nc, .done
	inc [hl]
	jr nz, .done
	ld a, $ff
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a

.done
	call UpdateTrainerRankingsChecksum
	call CloseSRAM
	ret
; 10602e

TrainerRankings_StepCount: mobile ; 10602e (41:602e)
	ld hl, sTrainerRankingStepCount
	jp TrainerRankings_Increment4Byte

TrainerRankings_TMsHMsTaught: mobile ; 106049
	ld hl, sTrainerRankingTMsHMsTaught
	jp TrainerRankings_Increment3Byte

TrainerRankings_Battles: mobile ; 106050
	ld a, [BattleType]
	cp BATTLETYPE_TUTORIAL ; Exclude the Dude’s tutorial battle
	ret z
	ld hl, sTrainerRankingBattles
	jp TrainerRankings_Increment3Byte

TrainerRankings_WildBattles: mobile ; 10605d
	ld a, [BattleType]
	cp BATTLETYPE_TUTORIAL ; Exclude the Dude’s tutorial battle
	ret z
	ld hl, sTrainerRankingWildBattles
	jp TrainerRankings_Increment3Byte

TrainerRankings_TrainerBattles: mobile ; 10606a
	ld hl, sTrainerRankingTrainerBattles
	jp TrainerRankings_Increment3Byte

TrainerRankings_HallOfFame:: mobile ; 0x106078
	ld hl, sTrainerRankingHOFEntries
	jp TrainerRankings_Increment3Byte

TrainerRankings_WildMonsCaught: mobile ; 10607f (41:607f)
	ld hl, sTrainerRankingWildMonsCaught
	jp TrainerRankings_Increment3Byte

TrainerRankings_HookedEncounters: mobile ; 106086
	ld hl, sTrainerRankingHookedEncounters
	jp TrainerRankings_Increment3Byte

TrainerRankings_EggsHatched: mobile ; 10608d (41:608d)
	ld hl, sTrainerRankingEggsHatched
	jp TrainerRankings_Increment3Byte

TrainerRankings_MonsEvolved: mobile ; 106094
	ld hl, sTrainerRankingMonsEvolved
	jp TrainerRankings_Increment3Byte

TrainerRankings_FruitPicked: mobile ; 10609b
	ld hl, sTrainerRankingFruitPicked
	jp TrainerRankings_Increment3Byte

TrainerRankings_Healings: mobile ; 1060a2
	ld hl, sTrainerRankingHealings
	jp TrainerRankings_Increment3Byte

TrainerRankings_MysteryGift: mobile ; 1060a9 (41:60a9)
	ld hl, sTrainerRankingMysteryGift
	jr TrainerRankings_Increment3Byte

TrainerRankings_Trades: mobile ; 1060af
	ld hl, sTrainerRankingTrades
	jr TrainerRankings_Increment3Byte

TrainerRankings_Fly: mobile ; 1060b5
	ld hl, sTrainerRankingFly
	jr TrainerRankings_Increment3Byte

TrainerRankings_Surf: mobile ; 1060bb
	ld hl, sTrainerRankingSurf
	jr TrainerRankings_Increment3Byte

TrainerRankings_Waterfall: mobile ; 1060c1
	ld hl, sTrainerRankingWaterfall
	jr TrainerRankings_Increment3Byte

TrainerRankings_WhiteOuts: mobile ; 1060c7
	ld hl, sTrainerRankingWhiteOuts
	jr TrainerRankings_Increment3Byte

TrainerRankings_LuckyNumberShow: mobile ; 1060cd
	ld hl, sTrainerRankingLuckyNumberShow
	jr TrainerRankings_Increment2Byte

TrainerRankings_PhoneCalls: mobile ; 1060d3
	ld hl, sTrainerRankingPhoneCalls
	jr TrainerRankings_Increment3Byte

TrainerRankings_LinkBattles: mobile ; 1060df
	ld hl, sTrainerRankingLinkBattles
	jr TrainerRankings_Increment3Byte

TrainerRankings_Splash: mobile ; 1060e5
	; Only counts if it’s the player’s turn
	ld a, [hBattleTurn]
	and a
	ret nz
	ld hl, sTrainerRankingSplash
	jr TrainerRankings_Increment3Byte

TrainerRankings_TreeEncounters: mobile ; 1060ef
	ld hl, sTrainerRankingTreeEncounters
	jr TrainerRankings_Increment3Byte

TrainerRankings_ColosseumWins: mobile ; win
	ld hl, sTrainerRankingColosseumWins
	jr TrainerRankings_Increment3Byte

TrainerRankings_ColosseumLosses: mobile ; lose
	ld hl, sTrainerRankingColosseumLosses
	jr TrainerRankings_Increment3Byte
; 106107

TrainerRankings_ColosseumDraws: mobile ; draw
	ld hl, sTrainerRankingColosseumDraws
	jr TrainerRankings_Increment3Byte
; 10610d

; Counts uses of both Selfdestruct and Explosion.
TrainerRankings_Selfdestruct: mobile ; 10610d
	; Only counts if it’s the player’s turn
	ld a, [hBattleTurn]
	and a
	ret nz
	ld hl, sTrainerRankingSelfdestruct
	jr TrainerRankings_Increment3Byte
; 106117

TrainerRankings_Increment4Byte: ; 106117
	push bc
	ld bc, 3
	jr TrainerRankings_Increment
; 10611d

TrainerRankings_Increment3Byte: ; 10611d
	push bc
	ld bc, 2
	jr TrainerRankings_Increment
; 106123

TrainerRankings_Increment2Byte: ; 106123
	push bc
	ld bc, 1
; 106129

; Increments a big-endian value of bc + 1 bytes at hl
TrainerRankings_Increment: ; 10612d
	ld a, BANK(sTrainerRankings)
	call GetSRAMBank
	push hl
	push de
	ld e, c
	inc e
.asm_106136
	ld a, [hli]
	inc a
	jr nz, .asm_10613d
	dec e
	jr nz, .asm_106136

.asm_10613d
	pop de
	pop hl
	jr z, .asm_10614d
	add hl, bc
.asm_106142
	inc [hl]
	jr nz, .asm_10614d
	ld a, c
	and a
	jr z, .asm_10614d
	dec hl
	dec c
	jr .asm_106142

.asm_10614d
	call UpdateTrainerRankingsChecksum
	call CloseSRAM
	pop bc
	ret
; 106155

; Used when SRAM bank 5 isn’t already loaded — what’s the point of this?
UpdateTrainerRankingsChecksum2: mobile ; 106155
	ld a, BANK(sTrainerRankings)
	call GetSRAMBank
	call UpdateTrainerRankingsChecksum
	call CloseSRAM
	ret
; 106162

UpdateTrainerRankingsChecksum: ; 106162
	push de
	call CalculateTrainerRankingsChecksum
	ld hl, sTrainerRankingsChecksum
	ld [hl], d
	inc hl
	ld [hl], e
	pop de
	ret
; 10616e

CalculateTrainerRankingsChecksum: ; 10616e
	push bc
	ld hl, sTrainerRankings
	ld bc, sTrainerRankingsChecksum - sTrainerRankings
	xor a
	ld de, 0
.asm_106179
	ld a, e
	add [hl]
	ld e, a
	jr nc, .asm_10617f
	inc d

.asm_10617f
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, .asm_106179
	pop bc
	ret
; 106187


BackupMobileEventIndex: ; 106187
	ld a, BANK(sMobileEventIndex)
	call GetSRAMBank
	ld a, [sMobileEventIndex]
	push af
	ld a, BANK(sMobileEventIndexBackup)
	call GetSRAMBank
	pop af
	ld [sMobileEventIndexBackup], a
	call CloseSRAM
	ret
; 10619d


RestoreMobileEventIndex: ; 10619d (41:619d)
	ld a, BANK(sMobileEventIndexBackup)
	call GetSRAMBank
	ld a, [sMobileEventIndexBackup]
	push af
	ld a, BANK(sMobileEventIndex)
	call GetSRAMBank
	pop af
	ld [sMobileEventIndex], a
	call CloseSRAM
	ret
; 1061b3 (41:61b3)

DeleteMobileEventIndex: ; 1061c0 (41:61c0)
	ld a, BANK(sMobileEventIndex)
	call GetSRAMBank
	xor a
	ld [sMobileEventIndex], a
	call CloseSRAM
	ret
; 1061cd (41:61cd)


_MobilePrintNum:: ; 1061ef
; Supports signed 31-bit integers (up to 10 digits)
; b: Bits 0-4 = # bytes
;    Bit 7 = set if negative
; c: Number of digits
; de: highest byte of number to convert
; hl: where to print the converted string
	push bc
	xor a
	ld [hPrintNum1], a
	ld [hPrintNum2], a
	ld [hPrintNum3], a
	ld a, b
	and $f
	cp $1
	jr z, .one_byte
	cp $2
	jr z, .two_bytes
	cp $3
	jr z, .three_bytes
; four bytes
	ld a, [de]
	ld [hPrintNum1], a
	inc de

.three_bytes
	ld a, [de]
	ld [hPrintNum2], a
	inc de

.two_bytes
	ld a, [de]
	ld [hPrintNum3], a
	inc de

.one_byte
	ld a, [de]
	ld [hPrintNum4], a
	inc de

	push de
	xor a
	ld [hPrintNum9], a
	ld a, b
	ld [hPrintNum10], a
	ld a, c
	cp 2
	jr z, .two_digits
	ld de, ._2
	cp 3
	jr z, .three_to_nine_digits
	ld de, ._3
	cp 4
	jr z, .three_to_nine_digits
	ld de, ._4
	cp 5
	jr z, .three_to_nine_digits
	ld de, ._5
	cp 6
	jr z, .three_to_nine_digits
	ld de, ._6
	cp 7
	jr z, .three_to_nine_digits
	ld de, ._7
	cp 8
	jr z, .three_to_nine_digits
	ld de, ._8
	cp 9
	jr z, .three_to_nine_digits
	ld de, ._9

.three_to_nine_digits
	inc de
	inc de
	inc de
	dec a
	dec a

.digit_loop
	push af
	call .Function1062b2
	call .Function1062ff
rept 4
	inc de
endr
	pop af
	dec a
	jr nz, .digit_loop

.two_digits
	ld c, 0
	ld a, [hPrintNum4]
.mod_ten_loop
	cp 10
	jr c, .simple_divide_done
	sub 10
	inc c
	jr .mod_ten_loop

.simple_divide_done
	ld b, a
	ld a, [hPrintNum9]
	or c
	ld [hPrintNum9], a
	jr nz, .create_digit
	call .LoadMinusTenIfNegative
	jr .done

.create_digit
	ld a, "0"
	add c
	ld [hl], a

.done
	call .Function1062ff
	ld a, "0"
	add b
	ld [hli], a
	pop de
	pop bc
	ret
; 106292

._9	dd 1000000000
._8	dd 100000000
._7	dd 10000000
._6	dd 1000000
._5	dd 100000
._4	dd 10000
._3	dd 1000
._2	dd 100
; 1062b2

.Function1062b2: ; 1062b2
	ld c, $0
.asm_1062b4
	ld a, [de]
	dec de
	ld b, a
	ld a, [hPrintNum4]
	sub b
	ld [hPrintNum8], a
	ld a, [de]
	dec de
	ld b, a
	ld a, [hPrintNum3]
	sbc b
	ld [hPrintNum7], a
	ld a, [de]
	dec de
	ld b, a
	ld a, [hPrintNum2]
	sbc b
	ld [hPrintNum6], a
	ld a, [de]
	inc de
	inc de
	inc de
	ld b, a
	ld a, [hPrintNum1]
	sbc b
	ld [hPrintNum5], a
	jr c, .asm_1062eb
	ld a, [hPrintNum5]
	ld [hPrintNum1], a
	ld a, [hPrintNum6]
	ld [hPrintNum2], a
	ld a, [hPrintNum7]
	ld [hPrintNum3], a
	ld a, [hPrintNum8]
	ld [hPrintNum4], a
	inc c
	jr .asm_1062b4

.asm_1062eb
	ld a, [hPrintNum9]
	or c
	jr z, .LoadMinusTenIfNegative
	ld a, -10
	add c
	ld [hl], a
	ld [hPrintNum9], a
	ret

.LoadMinusTenIfNegative:
	ld a, [hPrintNum10]
	bit 7, a
	ret z

	ld [hl], -10
	ret
; 1062ff

.Function1062ff: ; 1062ff
	ld a, [hPrintNum10]
	bit 7, a
	jr nz, .asm_10630d
	bit 6, a
	jr z, .asm_10630d
	ld a, [hPrintNum9]
	and a
	ret z

.asm_10630d
	inc hl
	ret
; 10630f

; functions related to the cable club and various NPC scripts referencing mobile communications

Mobile_DummyReturnFalse: ; 10630f
	xor a
	ld [ScriptVar], a
	ret
; 106314

Mobile_AlwaysReturnNotCarry: ; 10632f
	or a
	ret

MobileFunc_106462: mobile
	ret
; 106464

Function106464:: ; 106464
	ld de, MobilePhoneTilesGFX
	ld hl, VTiles2 tile $60
	lb bc, BANK(MobilePhoneTilesGFX), 1
	call Get2bpp
	ld de, FontsExtra2_UpArrowGFX
	ld hl, VTiles2 tile $61
	lb bc, BANK(FontsExtra2_UpArrowGFX), 1
	call Get2bpp
	ld de, GFX_106514
	ld hl, VTiles2 tile $62
	ld c, 9
	ld b, BANK(GFX_106514)
	call Get2bpp
	ld de, $40b0
	ld hl, VTiles2 tile $6b
	ld b, $f ; XXX no graphics at 0f:40b0
	call Get2bpp
	callba LoadFrame
	ret
; 10649b

GFX_106514:
INCBIN "gfx/unknown/106514.2bpp"
