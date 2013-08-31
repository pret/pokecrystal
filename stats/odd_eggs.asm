GiveOddEgg: ; 1fb4b6

; Figure out which egg to give.
	call Random
	ld hl, .Probabilities
	ld c, 0
	ld b, c
.next
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, d
	cp $ff
	jr nz, .first
	ld a, e
	cp $ff
	jr z, .done
.first
	ld a, [hRandomSub]
	cp d
	jr c, .done
	jr z, .second
	jr .good
.second
	ld a, [hRandomAdd]
	cp e
	jr c, .done
	jr z, .done
.good
	inc bc
	jr .next
.done

	ld hl, OddEggs
	ld a, OddEgg2 - OddEgg1
	call AddNTimes
	ld de, EnemyMoveAnimation
	ld bc, $0046
	call CopyBytes
	ld a, EGG_TICKET
	ld [CurItem], a
	ld a, $1
	ld [$d10c], a
	ld a, $ff
	ld [$d107], a
	ld hl, NumItems
	call Function2f53
	ld a, EGG
	ld [$cd2a], a
	ld a, $29
	ld [$cd20], a
	ld a, $cd
	ld [$cd21], a
	ld a, $8
	ld [$cd22], a
	ld a, $c6
	ld [$cd23], a

	ld hl, .Odd
	ld de, $cd2b
	ld bc, $000b
	call CopyBytes

	ld a, $2b
	ld [$cd24], a
	ld a, $cd
	ld [$cd25], a
	ld a, $38
	ld [$cd26], a
	ld a, $c6
	ld [$cd27], a
	callba Function11b98f
	ret
; 1fb546

.Odd
	db "ODD@@@@@@@@@"

.Probabilities
	dw $147a ; 92% ->  8%
	dw $170a ; 91% ->  1%
	dw $3fff ; 75% -> 16%
	dw $47ad ; 72% ->  3%
	dw $70a3 ; 56% -> 16%
	dw $7851 ; 53% ->  3%
	dw $9c28 ; 39% -> 14%
	dw $a147 ; 37% ->  2%
	dw $bae0 ; 27% -> 10%
	dw $bfff ; 25% ->  2%
	dw $deb7 ; 13% -> 12%
	dw $e3d6 ; 11% ->  2%
	dw $fd6f ;  1% -> 10%
	dw $ffff ;  0% ->  1%
; 1fb56e


OddEggs: ; 1fb56e

OddEgg1:
	db PICHU
	db NO_ITEM
	db THUNDERSHOCK, CHARM, DIZZY_PUNCH, NONE
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
	db THUNDERSHOCK, CHARM, DIZZY_PUNCH, NONE
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
	db POUND, CHARM, DIZZY_PUNCH, NONE
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
	db POUND, CHARM, DIZZY_PUNCH, NONE
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
	db SING, CHARM, DIZZY_PUNCH, NONE
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
	db SING, CHARM, DIZZY_PUNCH, NONE
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
	db POUND, LICK, DIZZY_PUNCH, NONE
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
	db POUND, LICK, DIZZY_PUNCH, NONE
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
	db EMBER, DIZZY_PUNCH, NONE, NONE
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
	db EMBER, DIZZY_PUNCH, NONE, NONE
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
	db QUICK_ATTACK, LEER, DIZZY_PUNCH, NONE
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
	db QUICK_ATTACK, LEER, DIZZY_PUNCH, NONE
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
	db TACKLE, DIZZY_PUNCH, NONE, NONE
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
	db TACKLE, DIZZY_PUNCH, NONE, NONE
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

