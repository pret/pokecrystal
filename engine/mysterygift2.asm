Function2c642: ; 2c642 (b:4642)
	ld de, wc800
	ld a, $1
	ld [de], a
	inc de
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
	inc de
	push bc
	ld hl, sPlayerData + PlayerName - wPlayerData
	ld bc, NAME_LENGTH
	call CopyBytes
	push de
	ld hl, sPokemonData + PokedexCaught - wPokemonData
	ld b, (NUM_POKEMON + 7) / 8
	call CountSetBits
	pop de
	pop bc
	ld a, [wd265]
	ld [de], a
	inc de
	call CloseSRAM
	call Random
	and $1
	ld [de], a
	inc de
	call Function2c6ac
	ld [de], a
	inc de
	ld a, c
	ld c, b
	ld b, a
	call Function2c6ac
	ld [de], a
	inc de
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
	ld hl, wc800
	ld de, wc950
	ld bc, $14
	jp CopyBytes

Function2c6ac: ; 2c6ac (b:46ac)
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
	jr nc, Function2c722
	ld hl, Unknown_2c725
	ld b, 0
	add hl, bc
	ld c, [hl]
	ret

MysteryGiftGetDecoration: ; 2c715 (b:4715)
	ld a, c
	cp $25 ; 37
	jr nc, Function2c722
	ld hl, Unknown_2c74a
	ld b, 0
	add hl, bc
	ld c, [hl]
	ret

Function2c722: ; 2c722 (b:4722)
	ld c, DECO_POLKADOT_BED ; GREAT_BALL
	ret
; 2c725 (b:4725)

Unknown_2c725: ; 2c725
; May or may not be items.
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

Unknown_2c74a: ; 2c74a
; May or may not be items.
	db DECO_SNES
	db DECO_BIG_SNORLAX_DOLL
	db DECO_BIG_ONIX_DOLL
	db DECO_BIG_LAPRAS_DOLL
	db DECO_DOLLS
	db DECO_PIKACHU_DOLL
	db DECO_SURF_PIKACHU_DOLL
	db DECO_CLEFAIRY_DOLL
	db DECO_JIGGLYPUFF_DOLL
	db DECO_BULBASAUR_DOLL
	db DECO_TROPICPLANT
	db DECO_JUMBOPLANT
	db DECO_TOWN_MAP
	db DECO_CHARMANDER_DOLL
	db DECO_POLIWAG_DOLL
	db DECO_DIGLETT_DOLL
	db DECO_BLUE_CARPET
	db DECO_YELLOW_CARPET
	db DECO_POSTERS
	db DECO_PIKACHU_POSTER
	db DECO_N64
	db DECO_BIG_DOLLS
	db DECO_BEDS
	db DECO_FEATHERY_BED
	db DECO_POLKADOT_BED
	db DECO_PIKACHU_BED
	db DECO_CARPETS
	db DECO_RED_CARPET
	db DECO_GREEN_CARPET
	db DECO_CLEFAIRY_POSTER
	db DECO_ODDISH_DOLL
	db DECO_MAGNAPLANT
	db DECO_GENGAR_DOLL
	db DECO_CONSOLES
	db DECO_PINK_BED
	db DECO_SQUIRTLE_DOLL
	db DECO_STARMIE_DOLL
; 2c76f
