_GiveOddEgg:
	; Figure out which egg to give.

	; Compare a random word to
	; probabilities out of 0xffff.
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

	; Break when [hRandom] <= de.
	ldh a, [hRandom + 1]
	cp d
	jr c, .done
	jr z, .ok
	jr .next
.ok
	ldh a, [hRandom + 0]
	cp e
	jr c, .done
	jr z, .done
.next
	inc bc
	jr .loop
.done

	ld hl, OddEggs
	ld a, OddEgg1End - OddEgg1
	call AddNTimes

	ld de, wOddEggSpecies
	ld bc, PARTYMON_STRUCT_LENGTH + 2 * MON_NAME_LENGTH
	call CopyBytes

	ld a, EGG_TICKET
	ld [wCurItem], a
	ld a, 1
	ld [wItemQuantityChangeBuffer], a
	ld a, -1
	ld [wCurItemQuantity], a
	ld hl, wNumItems
	call TossItem

	; load species in wcd2a
	ld a, EGG
	ld [wMobileMonSpeciesBuffer], a

	; load pointer to (wMobileMonSpeciesBuffer - 1) in wMobileMonSpeciesPointerBuffer
	ld a, LOW(wMobileMonSpeciesBuffer - 1)
	ld [wMobileMonSpeciesPointerBuffer], a
	ld a, HIGH(wMobileMonSpeciesBuffer - 1)
	ld [wMobileMonSpeciesPointerBuffer + 1], a
	; load pointer to wOddEggSpecies in wMobileMonStructurePointerBuffer
	ld a, LOW(wOddEggSpecies)
	ld [wMobileMonStructurePointerBuffer], a
	ld a, HIGH(wOddEggSpecies)
	ld [wMobileMonStructurePointerBuffer + 1], a

	; load Odd Egg Name in wTempOddEggNickname
	ld hl, .Odd
	ld de, wTempOddEggNickname
	ld bc, MON_NAME_LENGTH
	call CopyBytes

	; load pointer to wTempOddEggNickname in wMobileMonOTNamePointerBuffer
	ld a, LOW(wTempOddEggNickname)
	ld [wMobileMonOTNamePointerBuffer], a
	ld a, HIGH(wTempOddEggNickname)
	ld [wMobileMonOTNamePointerBuffer + 1], a
	; load pointer to wOddEggName in wMobileMonNicknamePointerBuffer
	ld a, LOW(wOddEggName)
	ld [wMobileMonNicknamePointerBuffer], a
	ld a, HIGH(wOddEggName)
	ld [wMobileMonNicknamePointerBuffer + 1], a
	farcall AddMobileMonToParty
	ret

.Odd:
	db "ODD@@@@@@@@@"

INCLUDE "data/events/odd_eggs.asm"
