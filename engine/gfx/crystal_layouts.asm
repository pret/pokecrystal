GetMysteryGift_MobileAdapterLayout:
	ld a, b
	cp SCGB_RAM
	jr nz, .not_ram
	ld a, [wSGBPredef]
.not_ram
	push af
	farcall ResetBGPals
	pop af
	ld l, a
	ld h, 0
	add hl, hl
	ld de, .dw
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .done
	push de
	jp hl
.done
	ret

.dw
	dw MG_Mobile_Layout00
	dw MG_Mobile_Layout01
	dw MG_Mobile_Layout02

MG_Mobile_Layout_FillBox:
.row
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row
	ret

MG_Mobile_Layout_WipeAttrMap:
	hlcoord 0, 0, wAttrMap
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	xor a
	call ByteFill
	ret

MG_Mobile_Layout_LoadPals:
	ld de, wBGPals1
	ld hl, Palette_MysteryGiftMobile
	ld bc, 5 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	ld de, wBGPals1 palette PAL_BG_TEXT
	ld hl, Palette_TextBG7
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	ret

MG_Mobile_Layout00:
	call MG_Mobile_Layout_LoadPals
	call MG_Mobile_Layout_WipeAttrMap
	call MG_Mobile_Layout_CreatePalBoxes
	farcall ApplyAttrMap
	farcall ApplyPals
	ret

MG_Mobile_Layout_CreatePalBoxes:
	hlcoord 0, 0, wAttrMap
	lb bc, 4, 1
	ld a, $1
	call MG_Mobile_Layout_FillBox
	lb bc, 2, 1
	ld a, $2
	call MG_Mobile_Layout_FillBox
	lb bc, 6, 1
	ld a, $3
	call MG_Mobile_Layout_FillBox
	hlcoord 1, 0, wAttrMap
	ld a, $1
	lb bc, 3, 18
	call MG_Mobile_Layout_FillBox
	lb bc, 2, 18
	ld a, $2
	call MG_Mobile_Layout_FillBox
	lb bc, 12, 18
	ld a, $3
	call MG_Mobile_Layout_FillBox
	hlcoord 19, 0, wAttrMap
	lb bc, 4, 1
	ld a, $1
	call MG_Mobile_Layout_FillBox
	lb bc, 2, 1
	ld a, $2
	call MG_Mobile_Layout_FillBox
	lb bc, 6, 1
	ld a, $3
	call MG_Mobile_Layout_FillBox
	hlcoord 0, 12, wAttrMap
	ld bc, 6 * SCREEN_WIDTH
	ld a, $7
	call ByteFill
	ret

Palette_MysteryGiftMobile:
INCLUDE "gfx/mystery_gift/mg_mobile.pal"

LoadOW_BGPal7::
	ld hl, Palette_TextBG7
	ld de, wBGPals1 palette PAL_BG_TEXT
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	ret

Palette_TextBG7:
INCLUDE "gfx/font/bg_text.pal"

Function49420::
	ld hl, MansionPalette1 + 8 palettes
	ld de, wBGPals1 palette PAL_BG_ROOF
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	ret

MG_Mobile_Layout01:
	call MG_Mobile_Layout_LoadPals
	ld de, wBGPals1 palette PAL_BG_TEXT
	ld hl, .Palette_49478
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	call MG_Mobile_Layout_WipeAttrMap
	hlcoord 0, 0, wAttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	xor a
	call ByteFill
	hlcoord 0, 14, wAttrMap
	ld bc, 4 * SCREEN_WIDTH
	ld a, $7
	call ByteFill
	ld a, [wd002]
	bit 6, a
	jr z, .asm_49464
	call Function49480
	jr .asm_49467

.asm_49464
	call Function49496

.asm_49467
	farcall ApplyAttrMap
	farcall ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

.Palette_49478:
	RGB 31, 31, 31
	RGB 26, 31, 00
	RGB 20, 16, 03
	RGB 00, 00, 00

Function49480:
	hlcoord 0, 0, wAttrMap
	lb bc, 4, SCREEN_WIDTH
	ld a, $7
	call MG_Mobile_Layout_FillBox
	hlcoord 0, 2, wAttrMap
	ld a, $4
	ld [hl], a
	hlcoord 19, 2, wAttrMap
	ld [hl], a
	ret

Function49496:
	hlcoord 0, 0, wAttrMap
	lb bc, 2, SCREEN_WIDTH
	ld a, $7
	call MG_Mobile_Layout_FillBox
	hlcoord 0, 1, wAttrMap
	ld a, $4
	ld [hl], a
	hlcoord 19, 1, wAttrMap
	ld [hl], a
	ret

INCLUDE "engine/tilesets/tileset_palettes.asm"

MG_Mobile_Layout02:
	ld hl, .Palette_49732
	ld de, wBGPals1
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	farcall ApplyPals
	call MG_Mobile_Layout_WipeAttrMap
	farcall ApplyAttrMap
	ld hl, .Palette_4973a
	ld de, wOBPals1
	ld bc, 1 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM
	ret

.Palette_49732:
	RGB 31, 31, 31
	RGB 23, 16, 07
	RGB 23, 07, 07
	RGB 03, 07, 20

.Palette_4973a:
	RGB 00, 00, 00
	RGB 07, 05, 31
	RGB 14, 18, 31
	RGB 31, 31, 31

Function49742:
	ld hl, .Palette_49757
	ld de, wBGPals1
	ld bc, 8 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	farcall ApplyPals
	ret

.Palette_49757:
INCLUDE "gfx/unknown/49757.pal"

_InitMG_Mobile_LinkTradePalMap:
	hlcoord 0, 0, wAttrMap
	lb bc, 16, 2
	ld a, $4
	call MG_Mobile_Layout_FillBox
	ld a, $3
	ldcoord_a 0, 1, wAttrMap
	ldcoord_a 0, 14, wAttrMap
	hlcoord 2, 0, wAttrMap
	lb bc, 8, 18
	ld a, $5
	call MG_Mobile_Layout_FillBox
	hlcoord 2, 8, wAttrMap
	lb bc, 8, 18
	ld a, $6
	call MG_Mobile_Layout_FillBox
	hlcoord 0, 16, wAttrMap
	lb bc, 2, SCREEN_WIDTH
	ld a, $4
	call MG_Mobile_Layout_FillBox
	ld a, $3
	lb bc, 6, 1
	hlcoord 6, 1, wAttrMap
	call MG_Mobile_Layout_FillBox
	ld a, $3
	lb bc, 6, 1
	hlcoord 17, 1, wAttrMap
	call MG_Mobile_Layout_FillBox
	ld a, $3
	lb bc, 6, 1
	hlcoord 6, 9, wAttrMap
	call MG_Mobile_Layout_FillBox
	ld a, $3
	lb bc, 6, 1
	hlcoord 17, 9, wAttrMap
	call MG_Mobile_Layout_FillBox
	ld a, $2
	hlcoord 2, 16, wAttrMap
	ld [hli], a
	ld a, $7
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, $2
	ld [hl], a
	hlcoord 2, 17, wAttrMap
	ld a, $3
	ld bc, 6
	call ByteFill
	ret

_LoadTradeRoomBGPals:
	ld hl, TradeRoomPalette
	ld de, wBGPals1 palette PAL_BG_GREEN
	ld bc, 6 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	farcall ApplyPals
	ret

TradeRoomPalette:
INCLUDE "gfx/trade/border.pal"

InitMG_Mobile_LinkTradePalMap:
	call _InitMG_Mobile_LinkTradePalMap
	ret

; unused
INCLUDE "gfx/unknown/4985a.asm"
