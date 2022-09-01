_GiveOddEgg:
	; Figure out which egg to give.

	; Compare a random word to probabilities out of $ffff.
	call Random
	ld hl, OddEggProbabilities
	ld c, 0
	ld b, c
.loop
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a

	; Break on $ffff.
	ld a, d
	cp HIGH($ffff)
	jr nz, .not_done
	ld a, e
	cp LOW($ffff)
	jr z, .done
.not_done

	; Break when the random word <= the next probability in de.
	ldh a, [hRandomSub]
	cp d
	jr c, .done
	jr z, .ok
	jr .next
.ok
	ldh a, [hRandomAdd]
	cp e
	jr c, .done
	jr z, .done
.next
	inc bc
	jr .loop
.done

	ld hl, OddEggs
	ld a, NICKNAMED_MON_STRUCT_LENGTH
	call AddNTimes

	; Writes to wOddEgg, wOddEggName, and wOddEggOT,
	; even though OddEggs does not have data for wOddEggOT
	ld de, wOddEgg
	ld bc, NICKNAMED_MON_STRUCT_LENGTH + NAME_LENGTH
	call CopyBytes

	ld a, EGG_TICKET
	ld [wCurItem], a
	ld a, 1
	ld [wItemQuantityChange], a
	ld a, -1
	ld [wCurItemQuantity], a
	ld hl, wNumItems
	call TossItem

	; load species in wMobileMonSpecies
	ld a, EGG
	ld [wMobileMonMiscSpecies], a

	; load pointer to (wMobileMonSpecies - 1) in wMobileMonSpeciesPointer
	ld a, LOW(wMobileMonMiscSpecies - 1)
	ld [wMobileMonSpeciesPointer], a
	ld a, HIGH(wMobileMonMiscSpecies - 1)
	ld [wMobileMonSpeciesPointer + 1], a
	; load pointer to wOddEgg in wMobileMonStructPointer
	ld a, LOW(wOddEgg)
	ld [wMobileMonStructPointer], a
	ld a, HIGH(wOddEgg)
	ld [wMobileMonStructPointer + 1], a

	; load Odd Egg Name in wTempOddEggNickname
	ld hl, .Odd
	ld de, wTempOddEggNickname
	ld bc, MON_NAME_LENGTH
	call CopyBytes

	; load pointer to wTempOddEggNickname in wMobileMonOTPointer
	ld a, LOW(wTempOddEggNickname)
	ld [wMobileMonOTPointer], a
	ld a, HIGH(wTempOddEggNickname)
	ld [wMobileMonOTPointer + 1], a
	; load pointer to wOddEggName in wMobileMonNicknamePointer
	ld a, LOW(wOddEggName)
	ld [wMobileMonNicknamePointer], a
	ld a, HIGH(wOddEggName)
	ld [wMobileMonNicknamePointer + 1], a
	farcall AddMobileMonToParty
	ret

.Odd:
	db "ODD@@@@@@@@@"

INCLUDE "data/events/odd_eggs.asm"
