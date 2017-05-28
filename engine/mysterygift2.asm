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
	inc de
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
	and $1
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
	cp $19 ; 10 percent
	jr c, .tenpercent
	call Random
	and $7
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
	cp $32 ; 20 percent
	jr c, .twopercent
	call Random
	and $3
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
	cp $32 ; 50 ; 20 percent
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
	cp $25 ; 37
	jr nc, MysteryGiftFallbackItem
	ld hl, MysteryGiftItems
	ld b, 0
	add hl, bc
	ld c, [hl]
	ret

MysteryGiftGetDecoration: ; 2c715 (b:4715)
	ld a, c
	cp $25 ; 37
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

MysteryGiftItems: ; 2c725
	db BERRY
	db PRZCUREBERRY
	db MINT_BERRY
	db ICE_BERRY
	db BURNT_BERRY
	db PSNCUREBERRY
	db GUARD_SPEC
	db X_DEFEND
	db X_ATTACK
	db BITTER_BERRY
	db DIRE_HIT
	db X_SPECIAL
	db X_ACCURACY
	db EON_MAIL
	db MORPH_MAIL
	db MUSIC_MAIL
	db MIRACLEBERRY
	db GOLD_BERRY
	db REVIVE
	db GREAT_BALL
	db SUPER_REPEL
	db MAX_REPEL
	db ELIXER
	db ETHER
	db WATER_STONE
	db FIRE_STONE
	db LEAF_STONE
	db THUNDERSTONE
	db MAX_ETHER
	db MAX_ELIXER
	db MAX_REVIVE
	db SCOPE_LENS
	db HP_UP
	db PP_UP
	db RARE_CANDY
	db BLUESKY_MAIL
	db MIRAGE_MAIL
; 2c74a

MysteryGiftDecos: ; 2c74a
	db DECOFLAG_PIKACHU_DOLL
	db DECOFLAG_BULBASAUR_DOLL
	db DECOFLAG_CHARMANDER_DOLL
	db DECOFLAG_SQUIRTLE_DOLL
	db DECOFLAG_POLIWAG_DOLL
	db DECOFLAG_DIGLETT_DOLL
	db DECOFLAG_STARMIE_DOLL
	db DECOFLAG_MAGIKARP_DOLL
	db DECOFLAG_ODDISH_DOLL
	db DECOFLAG_GENGAR_DOLL
	db DECOFLAG_CLEFAIRY_POSTER
	db DECOFLAG_JIGGLYPUFF_POSTER
	db DECOFLAG_SNES
	db DECOFLAG_SHELLDER_DOLL
	db DECOFLAG_VOLTORB_DOLL
	db DECOFLAG_WEEDLE_DOLL
	db DECOFLAG_MAGNAPLANT
	db DECOFLAG_TROPICPLANT
	db DECOFLAG_FAMICOM
	db DECOFLAG_N64
	db DECOFLAG_SURF_PIKACHU_DOLL
	db DECOFLAG_JIGGLYPUFF_DOLL
	db DECOFLAG_PINK_BED
	db DECOFLAG_POLKADOT_BED
	db DECOFLAG_RED_CARPET
	db DECOFLAG_BLUE_CARPET
	db DECOFLAG_YELLOW_CARPET
	db DECOFLAG_GREEN_CARPET
	db DECOFLAG_JUMBOPLANT
	db DECOFLAG_VIRTUAL_BOY
	db DECOFLAG_MACHOP_DOLL
	db DECOFLAG_PIKACHU_POSTER
	db DECOFLAG_TENTACOOL_DOLL
	db DECOFLAG_BIG_ONIX_DOLL
	db DECOFLAG_PIKACHU_BED
	db DECOFLAG_GRIMER_DOLL
	db DECOFLAG_UNOWN_DOLL
; 2c76f
