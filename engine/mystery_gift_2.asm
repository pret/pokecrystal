PrepMysteryGiftDataToSend: ; 2c642 (b:4642)
	ld de, wMysteryGiftStaging
	ld a, $1
	ld [de], a
	inc de ; wc801
	ld a, BANK(sGameData)
	call GetSRAMBank
	ld hl, sPlayerData + PlayerID - wPlayerData
	ld a, [hli]
	ld [de], a
	ld b, a
	inc de ; wc802
	ld a, [hl]
	ld [de], a
	ld c, a
	inc de ; wc803
	push bc
	ld hl, sPlayerData + PlayerName - wPlayerData
	ld bc, NAME_LENGTH
	call CopyBytes
	push de ; wc80e
	ld hl, sPokemonData + PokedexCaught - wPokemonData
	ld b, EndPokedexCaught - PokedexCaught
	call CountSetBits
	pop de
	pop bc
	ld a, [wd265]
	ld [de], a
	inc de ; wc80f
	call CloseSRAM
	call Random
	and 1
	ld [de], a
	inc de ; wc810
	call .RandomSample
	ld [de], a
	inc de ; wc811
	ld a, c
	ld c, b
	ld b, a
	call .RandomSample
	ld [de], a
	inc de ; wc812
	ld a, BANK(sBackupMysteryGiftItem)
	call GetSRAMBank
	ld a, [sBackupMysteryGiftItem]
	ld [de], a
	inc de
	ld a, [sBackupMysteryGiftItem + 1]
	ld [de], a
	ld a, $14
	ld [wca00], a
	call CloseSRAM
	ld hl, wMysteryGiftStaging
	ld de, wMysteryGiftPlayerData
	ld bc, wMysteryGiftPlayerDataEnd - wMysteryGiftPlayerData
	jp CopyBytes

.RandomSample: ; 2c6ac (b:46ac)
	push de
	call Random
	cp 10 percent
	jr c, .tenpercent
	call Random
	and %111
	ld d, a
	rl d
	ld e, $80
.loop
	rlc e
	dec a
	jr nz, .loop
	ld a, e
	and c
	jr z, .skip
	ld a, $1
.skip
	add d
	jr .done

.tenpercent
	call Random
	cp 20 percent - 1
	jr c, .twopercent
	call Random
	and %011
	ld d, a
	rl d
	ld e, $80
.loop2
	rlc e
	dec a
	jr nz, .loop2
	ld a, e
	and b
	jr z, .skip2
	ld a, $1
.skip2
	add d
	add $10
	jr .done

.twopercent
	call Random
	cp 20 percent - 1
	jr c, .pointfourpercent
	ld a, b
	swap a
	and $7
	add $18
	jr .done

.pointfourpercent
	ld a, b
	and $80
	ld a, $20
	jr z, .done
	ld a, $21

.done
	pop de
	ret

MysteryGiftGetItemHeldEffect: ; 2c708 (b:4708)
	ld a, c
	cp MysteryGiftItemsEnd - MysteryGiftItems
	jr nc, MysteryGiftFallbackItem
	ld hl, MysteryGiftItems
	ld b, 0
	add hl, bc
	ld c, [hl]
	ret

MysteryGiftGetDecoration: ; 2c715 (b:4715)
	ld a, c
	cp MysteryGiftDecosEnd - MysteryGiftDecos
	jr nc, MysteryGiftFallbackItem
	ld hl, MysteryGiftDecos
	ld b, 0
	add hl, bc
	ld c, [hl]
	ret

MysteryGiftFallbackItem: ; 2c722 (b:4722)
	ld c, DECO_POLKADOT_BED ; GREAT_BALL
	ret
; 2c725 (b:4725)


INCLUDE "data/items/mystery_gift_items.asm"

INCLUDE "data/decorations/mystery_gift_decos.asm"
