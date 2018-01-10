GetEmote2bpp: ; 1412a
	ld a, $1
	ld [rVBK], a
	call Get2bpp
	xor a
	ld [rVBK], a
	ret
; 14135

_ReplaceKrisSprite:: ; 14135
	call GetPlayerSprite
	ld a, [UsedSprites]
	ld [hUsedSpriteIndex], a
	ld a, [UsedSprites + 1]
	ld [hUsedSpriteTile], a
	call GetUsedSprite
	ret
; 14146

Function14146: ; mobile
	ld hl, wSpriteFlags
	ld a, [hl]
	push af
	res 7, [hl]
	set 6, [hl]
	call MapCallbackSprites_LoadUsedSpritesGFX
	pop af
	ld [wSpriteFlags], a
	ret
; 14157

Function14157: ; mobile
	ld hl, wSpriteFlags
	ld a, [hl]
	push af
	set 7, [hl]
	res 6, [hl]
	call MapCallbackSprites_LoadUsedSpritesGFX
	pop af
	ld [wSpriteFlags], a
	ret
; 14168

RefreshSprites:: ; 14168
	call .Refresh
	call MapCallbackSprites_LoadUsedSpritesGFX
	ret
; 1416f

.Refresh: ; 1416f
	xor a
	ld bc, UsedSpritesEnd - UsedSprites
	ld hl, UsedSprites
	call ByteFill
	call GetPlayerSprite
	call AddMapSprites
	call LoadAndSortSprites
	ret
; 14183

GetPlayerSprite: ; 14183
; Get Chris or Kris's sprite.
	ld hl, .Chris
	ld a, [wPlayerSpriteSetupFlags]
	bit 2, a
	jr nz, .go
	ld a, [wPlayerGender]
	bit 0, a
	jr z, .go
	ld hl, .Kris

.go
	ld a, [PlayerState]
	ld c, a
.loop
	ld a, [hli]
	cp c
	jr z, .good
	inc hl
	cp $ff
	jr nz, .loop

; Any player state not in the array defaults to Chris's sprite.
	xor a ; ld a, PLAYER_NORMAL
	ld [PlayerState], a
	ld a, SPRITE_CHRIS
	jr .finish

.good
	ld a, [hl]

.finish
	ld [UsedSprites + 0], a
	ld [PlayerSprite], a
	ld [PlayerObjectSprite], a
	ret

.Chris:
	db PLAYER_NORMAL,    SPRITE_CHRIS
	db PLAYER_BIKE,      SPRITE_CHRIS_BIKE
	db PLAYER_SURF,      SPRITE_SURF
	db PLAYER_SURF_PIKA, SPRITE_SURFING_PIKACHU
	db $ff

.Kris:
	db PLAYER_NORMAL,    SPRITE_KRIS
	db PLAYER_BIKE,      SPRITE_KRIS_BIKE
	db PLAYER_SURF,      SPRITE_SURF
	db PLAYER_SURF_PIKA, SPRITE_SURFING_PIKACHU
	db $ff
; 141c9


AddMapSprites: ; 141c9
	call GetMapEnvironment
	call CheckOutdoorMap
	jr z, .outdoor
	call AddIndoorSprites
	ret

.outdoor
	call AddOutdoorSprites
	ret
; 141d9


AddIndoorSprites: ; 141d9
	ld hl, Map1ObjectSprite
	ld a, 1
.loop
	push af
	ld a, [hl]
	call AddSpriteGFX
	ld de, OBJECT_LENGTH
	add hl, de
	pop af
	inc a
	cp NUM_OBJECTS
	jr nz, .loop
	ret
; 141ee


AddOutdoorSprites: ; 141ee
	ld a, [MapGroup]
	dec a
	ld c, a
	ld b, 0
	ld hl, OutdoorSprites
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld c, MAX_OUTDOOR_SPRITES
.loop
	push bc
	ld a, [hli]
	call AddSpriteGFX
	pop bc
	dec c
	jr nz, .loop
	ret
; 14209


MapCallbackSprites_LoadUsedSpritesGFX: ; 14209
	ld a, MAPCALLBACK_SPRITES
	call RunMapCallback
	call GetUsedSprites
	call .LoadMiscTiles
	ret
; 14215

.LoadMiscTiles: ; 14215
	ld a, [wSpriteFlags]
	bit 6, a
	ret nz

	ld c, EMOTE_SHADOW
	farcall LoadEmote
	call GetMapEnvironment
	call CheckOutdoorMap
	ld c, EMOTE_GRASS_RUSTLE
	jr z, .outdoor
	ld c, EMOTE_BOULDER_DUST
.outdoor
	farcall LoadEmote
	ret
; 14236



SafeGetSprite: ; 14236
	push hl
	call GetSprite
	pop hl
	ret
; 1423c

GetSprite: ; 1423c
	call GetMonSprite
	ret c

	ld hl, OverworldSprites + SPRITEDATA_ADDR
	dec a
	ld c, a
	ld b, 0
	ld a, NUM_SPRITEDATA_FIELDS
	call AddNTimes
	; load the address into de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	; load the length into c
	ld a, [hli]
	swap a
	ld c, a
	; load the sprite bank into both b and h
	ld b, [hl]
	ld a, [hli]
	; load the sprite type into l
	ld l, [hl]
	ld h, a
	ret
; 14259


GetMonSprite: ; 14259
; Return carry if a monster sprite was loaded.

	cp SPRITE_POKEMON
	jr c, .Normal
	cp SPRITE_DAY_CARE_MON_1
	jr z, .wBreedMon1
	cp SPRITE_DAY_CARE_MON_2
	jr z, .wBreedMon2
	cp SPRITE_VARS
	jr nc, .Variable
	jr .Icon

.Normal:
	and a
	ret

.Icon:
	sub SPRITE_POKEMON
	ld e, a
	ld d, 0
	ld hl, SpriteMons
	add hl, de
	ld a, [hl]
	jr .Mon

.wBreedMon1
	ld a, [wBreedMon1Species]
	jr .Mon

.wBreedMon2
	ld a, [wBreedMon2Species]

.Mon:
	ld e, a
	and a
	jr z, .NoBreedmon

	farcall LoadOverworldMonIcon

	ld l, 1
	ld h, 0
	scf
	ret

.Variable:
	sub SPRITE_VARS
	ld e, a
	ld d, 0
	ld hl, VariableSprites
	add hl, de
	ld a, [hl]
	and a
	jp nz, GetMonSprite

.NoBreedmon:
	ld a, 1
	ld l, 1
	ld h, 0
	and a
	ret
; 142a7


_DoesSpriteHaveFacings:: ; 142a7
; Checks to see whether we can apply a facing to a sprite.
; Returns carry unless the sprite is a Pokemon or a Still Sprite.
	cp SPRITE_POKEMON
	jr nc, .only_down

	push hl
	push bc
	ld hl, OverworldSprites + SPRITEDATA_TYPE
	dec a
	ld c, a
	ld b, 0
	ld a, NUM_SPRITEDATA_FIELDS
	call AddNTimes
	ld a, [hl]
	pop bc
	pop hl
	cp STILL_SPRITE
	jr nz, .only_down
	scf
	ret

.only_down
	and a
	ret
; 142c4


_GetSpritePalette:: ; 142c4
	ld a, c
	call GetMonSprite
	jr c, .is_pokemon

	ld hl, OverworldSprites + SPRITEDATA_PALETTE
	dec a
	ld c, a
	ld b, 0
	ld a, NUM_SPRITEDATA_FIELDS
	call AddNTimes
	ld c, [hl]
	ret

.is_pokemon
	xor a
	ld c, a
	ret
; 142db


LoadAndSortSprites: ; 142db
	call LoadSpriteGFX
	call SortUsedSprites
	call ArrangeUsedSprites
	ret
; 142e5


AddSpriteGFX: ; 142e5
; Add any new sprite ids to a list of graphics to be loaded.
; Return carry if the list is full.

	push hl
	push bc
	ld b, a
	ld hl, UsedSprites + 2
	ld c, SPRITE_GFX_LIST_CAPACITY - 1
.loop
	ld a, [hl]
	cp b
	jr z, .exists
	and a
	jr z, .new
	inc hl
	inc hl
	dec c
	jr nz, .loop

	pop bc
	pop hl
	scf
	ret

.exists
	pop bc
	pop hl
	and a
	ret

.new
	ld [hl], b
	pop bc
	pop hl
	and a
	ret
; 14306


LoadSpriteGFX: ; 14306
; Bug: b is not preserved, so it's useless as a next count.
; Uncomment the lines below to fix.

	ld hl, UsedSprites
	ld b, SPRITE_GFX_LIST_CAPACITY
.loop
	ld a, [hli]
	and a
	jr z, .done
	push hl
	call .LoadSprite
	pop hl
	ld [hli], a
	dec b
	jr nz, .loop

.done
	ret

.LoadSprite:
	; push bc
	call GetSprite
	; pop bc
	ld a, l
	ret
; 1431e


SortUsedSprites: ; 1431e
; Bubble-sort sprites by type.

; Run backwards through UsedSprites to find the last one.

	ld c, SPRITE_GFX_LIST_CAPACITY
	ld de, UsedSprites + (SPRITE_GFX_LIST_CAPACITY - 1) * 2
.FindLastSprite:
	ld a, [de]
	and a
	jr nz, .FoundLastSprite
	dec de
	dec de
	dec c
	jr nz, .FindLastSprite
.FoundLastSprite:
	dec c
	jr z, .quit

; If the length of the current sprite is
; higher than a later one, swap them.

	inc de
	ld hl, UsedSprites + 1

.CheckSprite:
	push bc
	push de
	push hl

.CheckFollowing:
	ld a, [de]
	cp [hl]
	jr nc, .loop

; Swap the two sprites.

	ld b, a
	ld a, [hl]
	ld [hl], b
	ld [de], a
	dec de
	dec hl
	ld a, [de]
	ld b, a
	ld a, [hl]
	ld [hl], b
	ld [de], a
	inc de
	inc hl

; Keep doing this until everything's in order.

.loop
	dec de
	dec de
	dec c
	jr nz, .CheckFollowing

	pop hl
	inc hl
	inc hl
	pop de
	pop bc
	dec c
	jr nz, .CheckSprite

.quit
	ret
; 14355


ArrangeUsedSprites: ; 14355
; Get the length of each sprite and space them out in VRAM.
; Crystal introduces a second table in VRAM bank 0.

	ld hl, UsedSprites
	ld c, SPRITE_GFX_LIST_CAPACITY
	ld b, 0
.FirstTableLength:
; Keep going until the end of the list.
	ld a, [hli]
	and a
	jr z, .quit

	ld a, [hl]
	call GetSpriteLength

; Spill over into the second table after $80 tiles.
	add b
	cp $80
	jr z, .loop
	jr nc, .SecondTable

.loop
	ld [hl], b
	inc hl
	ld b, a

; Assumes the next table will be reached before c hits 0.
	dec c
	jr nz, .FirstTableLength

.SecondTable:
; The second tile table starts at tile $80.
	ld b, $80
	dec hl
.SecondTableLength:
; Keep going until the end of the list.
	ld a, [hli]
	and a
	jr z, .quit

	ld a, [hl]
	call GetSpriteLength

; There are only two tables, so don't go any further than that.
	add b
	jr c, .quit

	ld [hl], b
	ld b, a
	inc hl

	dec c
	jr nz, .SecondTableLength

.quit
	ret
; 14386


GetSpriteLength: ; 14386
; Return the length of sprite type a in tiles.

	cp WALKING_SPRITE
	jr z, .AnyDirection
	cp STANDING_SPRITE
	jr z, .AnyDirection
	cp STILL_SPRITE
	jr z, .OneDirection

	ld a, 12
	ret

.AnyDirection:
	ld a, 12
	ret

.OneDirection:
	ld a, 4
	ret
; 1439b


GetUsedSprites: ; 1439b
	ld hl, UsedSprites
	ld c, SPRITE_GFX_LIST_CAPACITY

.loop
	ld a, [wSpriteFlags]
	res 5, a
	ld [wSpriteFlags], a

	ld a, [hli]
	and a
	jr z, .done
	ld [hUsedSpriteIndex], a

	ld a, [hli]
	ld [hUsedSpriteTile], a

	bit 7, a
	jr z, .dont_set

	ld a, [wSpriteFlags]
	set 5, a ; load VBank0
	ld [wSpriteFlags], a

.dont_set
	push bc
	push hl
	call GetUsedSprite
	pop hl
	pop bc
	dec c
	jr nz, .loop

.done
	ret
; 143c8

GetUsedSprite: ; 143c8
	ld a, [hUsedSpriteIndex]
	call SafeGetSprite
	ld a, [hUsedSpriteTile]
	call .GetTileAddr
	push hl
	push de
	push bc
	ld a, [wSpriteFlags]
	bit 7, a
	jr nz, .skip
	call .CopyToVram

.skip
	pop bc
	ld l, c
	ld h, $0
rept 4
	add hl, hl
endr
	pop de
	add hl, de
	ld d, h
	ld e, l
	pop hl

	ld a, [wSpriteFlags]
	bit 5, a
	jr nz, .done
	bit 6, a
	jr nz, .done

	ld a, [hUsedSpriteIndex]
	call _DoesSpriteHaveFacings
	jr c, .done

	ld a, h
	add $8
	ld h, a
	call .CopyToVram

.done
	ret
; 14406

.GetTileAddr: ; 14406
; Return the address of tile (a) in (hl).
	and $7f
	ld l, a
	ld h, 0
rept 4
	add hl, hl
endr
	ld a, l
	add LOW(vTiles0)
	ld l, a
	ld a, h
	adc HIGH(vTiles0)
	ld h, a
	ret
; 14418

.CopyToVram: ; 14418
	ld a, [rVBK]
	push af
	ld a, [wSpriteFlags]
	bit 5, a
	ld a, $1
	jr z, .bankswitch
	ld a, $0

.bankswitch
	ld [rVBK], a
	call Get2bpp
	pop af
	ld [rVBK], a
	ret
; 1442f

LoadEmote:: ; 1442f
; Get the address of the pointer to emote c.
	ld a, c
	ld bc, 6 ; sizeof(emote)
	ld hl, Emotes
	call AddNTimes
; Load the emote address into de
	ld e, [hl]
	inc hl
	ld d, [hl]
; load the length of the emote (in tiles) into c
	inc hl
	ld c, [hl]
	swap c
; load the emote pointer bank into b
	inc hl
	ld b, [hl]
; load the VRAM destination into hl
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
; if the emote has a length of 0, do not proceed (error handling)
	ld a, c
	and a
	ret z
	call GetEmote2bpp
	ret
; 1444d


INCLUDE "data/sprites/emotes.asm"

INCLUDE "data/sprites/sprite_mons.asm"

INCLUDE "data/maps/outdoor_sprites.asm"

INCLUDE "data/sprites/sprites.asm"
