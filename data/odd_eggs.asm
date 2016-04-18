GiveOddEgg: ; 1fb4b6

	; Figure out which egg to give.

	; Compare a random word to
	; probabilities out of 0xffff.
	call Random
	ld hl, .Probabilities
	ld c, 0
	ld b, c
.loop
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a

	; Break on $ffff.
	ld a, d
	cp $ffff / $100
	jr nz, .not_done
	ld a, e
	cp $ffff % $100
	jr z, .done
.not_done

	; Break when [hRandom] <= de.
	ld a, [hRandom + 1]
	cp d
	jr c, .done
	jr z, .ok
	jr .next
.ok
	ld a, [hRandom + 0]
	cp e
	jr c, .done
	jr z, .done
.next
	inc bc
	jr .loop
.done

	ld hl, OddEggs
	ld a, OddEgg2 - OddEgg1
	call AddNTimes

	ld de, OddEggSpecies
	ld bc, PARTYMON_STRUCT_LENGTH + 2 * PKMN_NAME_LENGTH
	call CopyBytes

	ld a, EGG_TICKET
	ld [CurItem], a
	ld a, 1
	ld [wItemQuantityChangeBuffer], a
	ld a, -1
	ld [CurItemQuantity], a
	ld hl, NumItems
	call TossItem

	; load species in wcd2a
	ld a, EGG
	ld [wMobileMonSpeciesBuffer], a

	; load pointer to (wMobileMonSpeciesBuffer - 1) in wMobileMonSpeciesPointerBuffer
	ld a, (wMobileMonSpeciesBuffer - 1) % $100
	ld [wMobileMonSpeciesPointerBuffer], a
	ld a, (wMobileMonSpeciesBuffer - 1) / $100
	ld [wMobileMonSpeciesPointerBuffer + 1], a
	; load pointer to OddEggSpecies in wMobileMonStructurePointerBuffer
	ld a, OddEggSpecies % $100
	ld [wMobileMonStructurePointerBuffer], a
	ld a, OddEggSpecies / $100
	ld [wMobileMonStructurePointerBuffer + 1], a

	; load Odd Egg Name in wTempOddEggNickname
	ld hl, .Odd
	ld de, wTempOddEggNickname
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes

	; load pointer to wTempOddEggNickname in wMobileMonOTNamePointerBuffer
	ld a, wTempOddEggNickname % $100
	ld [wMobileMonOTNamePointerBuffer], a
	ld a, wTempOddEggNickname / $100
	ld [wMobileMonOTNamePointerBuffer + 1], a
	; load pointer to wOddEggName in wMobileMonNicknamePointerBuffer
	ld a, wOddEggName % $100
	ld [wMobileMonNicknamePointerBuffer], a
	ld a, wOddEggName / $100
	ld [wMobileMonNicknamePointerBuffer + 1], a
	callba AddMobileMonToParty
	ret
; 1fb546

.Odd:
	db "ODD@@@@@@@@@"

.Probabilities:

prob: MACRO
prob_total = prob_total + (\1)
	dw prob_total * $ffff / 100
ENDM

prob_total = 0
; Pichu
	prob 8
	prob 1
; Cleffa
	prob 16
	prob 3
; Igglybuff
	prob 16
	prob 3
; Smoochum
	prob 14
	prob 2
; Magby
	prob 10
	prob 2
; Elekid
	prob 12
	prob 2
; Tyrogue
	prob 10
	prob 1
; 1fb56e


OddEggs: ; 1fb56e

OddEgg1:
	db PICHU
	db NO_ITEM
	db THUNDERSHOCK, CHARM, DIZZY_PUNCH, 0
	dw 02048 ; OT ID
	dt 125 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	db $0, $0 ; DVs
	db 30, 20, 10, 0 ; PP
	db 20 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 17 ; Max HP
	bigdw 9 ; Atk
	bigdw 6 ; Def
	bigdw 11 ; Spd
	bigdw 8 ; SAtk
	bigdw 8 ; SDef
	db "EGG@@@@@@@@"

OddEgg2:
	db PICHU
	db NO_ITEM
	db THUNDERSHOCK, CHARM, DIZZY_PUNCH, 0
	dw 00256 ; OT ID
	dt 125 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	db $2a, $aa ; DVs
	db 30, 20, 10, 0 ; PP
	db 20 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 17 ; Max HP
	bigdw 9 ; Atk
	bigdw 7 ; Def
	bigdw 12 ; Spd
	bigdw 9 ; SAtk
	bigdw 9 ; SDef
	db "EGG@@@@@@@@"

	db CLEFFA
	db NO_ITEM
	db POUND, CHARM, DIZZY_PUNCH, 0
	dw 04096 ; OT ID
	dt 125 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	db $0, $0 ; DVs
	db 35, 20, 10, 0 ; PP
	db 20 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 20 ; Max HP
	bigdw 7 ; Atk
	bigdw 7 ; Def
	bigdw 6 ; Spd
	bigdw 9 ; SAtk
	bigdw 10 ; SDef
	db "EGG@@@@@@@@"

	db CLEFFA
	db NO_ITEM
	db POUND, CHARM, DIZZY_PUNCH, 0
	dw 00768 ; OT ID
	dt 125 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	db $2a, $aa ; DVs
	db 35, 20, 10, 0 ; PP
	db 20 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 20 ; Max HP
	bigdw 7 ; Atk
	bigdw 8 ; Def
	bigdw 7 ; Spd
	bigdw 10 ; SAtk
	bigdw 11 ; SDef
	db "EGG@@@@@@@@"

	db IGGLYBUFF
	db NO_ITEM
	db SING, CHARM, DIZZY_PUNCH, 0
	dw 04096 ; OT ID
	dt 125 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	db $0, $0 ; DVs
	db 15, 20, 10, 0 ; PP
	db 20 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 24 ; Max HP
	bigdw 8 ; Atk
	bigdw 6 ; Def
	bigdw 6 ; Spd
	bigdw 9 ; SAtk
	bigdw 7 ; SDef
	db "EGG@@@@@@@@"

	db IGGLYBUFF
	db NO_ITEM
	db SING, CHARM, DIZZY_PUNCH, 0
	dw 00768 ; OT ID
	dt 125 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	db $2a, $aa ; DVs
	db 15, 20, 10, 0 ; PP
	db 20 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 24 ; Max HP
	bigdw 8 ; Atk
	bigdw 7 ; Def
	bigdw 7 ; Spd
	bigdw 10 ; SAtk
	bigdw 8 ; SDef
	db "EGG@@@@@@@@"

	db SMOOCHUM
	db NO_ITEM
	db POUND, LICK, DIZZY_PUNCH, 0
	dw 03584 ; OT ID
	dt 125 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	db $0, $0 ; DVs
	db 35, 30, 10, 0 ; PP
	db 20 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 19 ; Max HP
	bigdw 8 ; Atk
	bigdw 6 ; Def
	bigdw 11 ; Spd
	bigdw 13 ; SAtk
	bigdw 11 ; SDef
	db "EGG@@@@@@@@"

	db SMOOCHUM
	db NO_ITEM
	db POUND, LICK, DIZZY_PUNCH, 0
	dw 00512 ; OT ID
	dt 125 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	db $2a, $aa ; DVs
	db 35, 30, 10, 0 ; PP
	db 20 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 19 ; Max HP
	bigdw 8 ; Atk
	bigdw 7 ; Def
	bigdw 12 ; Spd
	bigdw 14 ; SAtk
	bigdw 12 ; SDef
	db "EGG@@@@@@@@"

	db MAGBY
	db NO_ITEM
	db EMBER, DIZZY_PUNCH, 0, 0
	dw 02560 ; OT ID
	dt 125 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	db $0, $0 ; DVs
	db 25, 10, 0, 0 ; PP
	db 20 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 19 ; Max HP
	bigdw 12 ; Atk
	bigdw 8 ; Def
	bigdw 13 ; Spd
	bigdw 12 ; SAtk
	bigdw 10 ; SDef
	db "EGG@@@@@@@@"

	db MAGBY
	db NO_ITEM
	db EMBER, DIZZY_PUNCH, 0, 0
	dw 00512 ; OT ID
	dt 125 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	db $2a, $aa ; DVs
	db 25, 10, 0, 0 ; PP
	db 20 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 19 ; Max HP
	bigdw 12 ; Atk
	bigdw 9 ; Def
	bigdw 14 ; Spd
	bigdw 13 ; SAtk
	bigdw 11 ; SDef
	db "EGG@@@@@@@@"

	db ELEKID
	db NO_ITEM
	db QUICK_ATTACK, LEER, DIZZY_PUNCH, 0
	dw 03072 ; OT ID
	dt 125 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	db $0, $0 ; DVs
	db 30, 30, 10, 0 ; PP
	db 20 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 19 ; Max HP
	bigdw 11 ; Atk
	bigdw 8 ; Def
	bigdw 14 ; Spd
	bigdw 11 ; SAtk
	bigdw 10 ; SDef
	db "EGG@@@@@@@@"

	db ELEKID
	db NO_ITEM
	db QUICK_ATTACK, LEER, DIZZY_PUNCH, 0
	dw 00512 ; OT ID
	dt 125 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	db $2a, $aa ; DVs
	db 30, 30, 10, 0 ; PP
	db 20 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 19 ; Max HP
	bigdw 11 ; Atk
	bigdw 9 ; Def
	bigdw 15 ; Spd
	bigdw 12 ; SAtk
	bigdw 11 ; SDef
	db "EGG@@@@@@@@"

	db TYROGUE
	db NO_ITEM
	db TACKLE, DIZZY_PUNCH, 0, 0
	dw 02560 ; OT ID
	dt 125 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	db $0, $0 ; DVs
	db 35, 10, 0, 0 ; PP
	db 20 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 18 ; Max HP
	bigdw 8 ; Atk
	bigdw 8 ; Def
	bigdw 8 ; Spd
	bigdw 8 ; SAtk
	bigdw 8 ; SDef
	db "EGG@@@@@@@@"

	db TYROGUE
	db NO_ITEM
	db TACKLE, DIZZY_PUNCH, 0, 0
	dw 00256 ; OT ID
	dt 125 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	db $2a, $aa ; DVs
	db 35, 10, 0, 0 ; PP
	db 20 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 18 ; Max HP
	bigdw 8 ; Atk
	bigdw 9 ; Def
	bigdw 9 ; Spd
	bigdw 9 ; SAtk
	bigdw 9 ; SDef
	db "EGG@@@@@@@@"
