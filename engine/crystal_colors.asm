GetMysteryGift_MobileAdapterLayout: ; 4930f (mobile)
	ld a, b
	cp SCGB_RAM
	jr nz, .not_ram
	ld a, [SGBPredef]
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
; 49330 (12:5330)

.dw ; 49330

	dw MG_Mobile_Layout00
	dw MG_Mobile_Layout01
	dw MG_Mobile_Layout02
; 49336

MG_Mobile_Layout_FillBox: ; 49336
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
; 49346

MG_Mobile_Layout_WipeAttrMap: ; 49346 (12:5346)
	hlcoord 0, 0, AttrMap
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	xor a
	call ByteFill
	ret

MG_Mobile_Layout_LoadPals: ; 49351 (12:5351)
	ld de, wBGPals1
	ld hl, Palette_493e1
	ld bc, 5 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	ld de, wBGPals1 palette PAL_BG_TEXT
	ld hl, Palette_TextBG7
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	ret

MG_Mobile_Layout00: ; 4936e (12:536e)
	call MG_Mobile_Layout_LoadPals
	call MG_Mobile_Layout_WipeAttrMap
	call MG_Mobile_Layout_CreatePalBoxes
	farcall ApplyAttrMap
	farcall ApplyPals
	ret

MG_Mobile_Layout_CreatePalBoxes: ; 49384 (12:5384)
	hlcoord 0, 0, AttrMap
	lb bc, 4, 1
	ld a, $1
	call MG_Mobile_Layout_FillBox
	lb bc, 2, 1
	ld a, $2
	call MG_Mobile_Layout_FillBox
	lb bc, 6, 1
	ld a, $3
	call MG_Mobile_Layout_FillBox
	hlcoord 1, 0, AttrMap
	ld a, $1
	lb bc, 3, 18
	call MG_Mobile_Layout_FillBox
	lb bc, 2, 18
	ld a, $2
	call MG_Mobile_Layout_FillBox
	lb bc, 12, 18
	ld a, $3
	call MG_Mobile_Layout_FillBox
	hlcoord 19, 0, AttrMap
	lb bc, 4, 1
	ld a, $1
	call MG_Mobile_Layout_FillBox
	lb bc, 2, 1
	ld a, $2
	call MG_Mobile_Layout_FillBox
	lb bc, 6, 1
	ld a, $3
	call MG_Mobile_Layout_FillBox
	hlcoord 0, 12, AttrMap
	ld bc, 6 * SCREEN_WIDTH
	ld a, $7
	call ByteFill
	ret
; 493e1 (12:53e1)

Palette_493e1: ; 493e1
INCLUDE "gfx/mystery_gift/mg_mobile.pal"
; 49409

LoadOW_BGPal7:: ; 49409
	ld hl, Palette_TextBG7
	ld de, wBGPals1 palette PAL_BG_TEXT
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	ret
; 49418

Palette_TextBG7: ; 49418
INCLUDE "gfx/font/bg_text.pal"
; 49420

Function49420:: ; 49420 (12:5420)
	ld hl, MansionPalette4
	ld de, wBGPals1 palette PAL_BG_ROOF
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	ret
; 4942f (12:542f)

MG_Mobile_Layout01: ; 4942f
	call MG_Mobile_Layout_LoadPals
	ld de, wBGPals1 palette PAL_BG_TEXT
	ld hl, .Palette_49478
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	call MG_Mobile_Layout_WipeAttrMap
	hlcoord 0, 0, AttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	xor a
	call ByteFill
	hlcoord 0, 14, AttrMap
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
	ld [hCGBPalUpdate], a
	ret
; 49478

.Palette_49478: ; 49478
	RGB 31, 31, 31
	RGB 26, 31, 00
	RGB 20, 16, 03
	RGB 00, 00, 00
; 49480

Function49480: ; 49480
	hlcoord 0, 0, AttrMap
	lb bc, 4, SCREEN_WIDTH
	ld a, $7
	call MG_Mobile_Layout_FillBox
	hlcoord 0, 2, AttrMap
	ld a, $4
	ld [hl], a
	hlcoord 19, 2, AttrMap
	ld [hl], a
	ret
; 49496

Function49496: ; 49496
	hlcoord 0, 0, AttrMap
	lb bc, 2, SCREEN_WIDTH
	ld a, $7
	call MG_Mobile_Layout_FillBox
	hlcoord 0, 1, AttrMap
	ld a, $4
	ld [hl], a
	hlcoord 19, 1, AttrMap
	ld [hl], a
	ret
; 494ac

INCLUDE "engine/tileset_palettes.asm"

MG_Mobile_Layout02: ; 49706
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
; 49732

.Palette_49732: ; 49732
	RGB 31, 31, 31
	RGB 23, 16, 07
	RGB 23, 07, 07
	RGB 03, 07, 20
; 4973a

.Palette_4973a: ; 4973a
	RGB 00, 00, 00
	RGB 07, 05, 31
	RGB 14, 18, 31
	RGB 31, 31, 31
; 49742

Function49742: ; 49742
	ld hl, .Palette_49757
	ld de, wBGPals1
	ld bc, 8 palettes
	ld a, $5
	call FarCopyWRAM
	farcall ApplyPals
	ret
; 49757

.Palette_49757: ; 49757
INCLUDE "gfx/unknown/49757.pal"
; 49797

_InitMG_Mobile_LinkTradePalMap: ; 49797
	hlcoord 0, 0, AttrMap
	lb bc, 16, 2
	ld a, $4
	call MG_Mobile_Layout_FillBox
	ld a, $3
	ldcoord_a 0, 1, AttrMap
	ldcoord_a 0, 14, AttrMap
	hlcoord 2, 0, AttrMap
	lb bc, 8, 18
	ld a, $5
	call MG_Mobile_Layout_FillBox
	hlcoord 2, 8, AttrMap
	lb bc, 8, 18
	ld a, $6
	call MG_Mobile_Layout_FillBox
	hlcoord 0, 16, AttrMap
	lb bc, 2, SCREEN_WIDTH
	ld a, $4
	call MG_Mobile_Layout_FillBox
	ld a, $3
	lb bc, 6, 1
	hlcoord 6, 1, AttrMap
	call MG_Mobile_Layout_FillBox
	ld a, $3
	lb bc, 6, 1
	hlcoord 17, 1, AttrMap
	call MG_Mobile_Layout_FillBox
	ld a, $3
	lb bc, 6, 1
	hlcoord 6, 9, AttrMap
	call MG_Mobile_Layout_FillBox
	ld a, $3
	lb bc, 6, 1
	hlcoord 17, 9, AttrMap
	call MG_Mobile_Layout_FillBox
	ld a, $2
	hlcoord 2, 16, AttrMap
	ld [hli], a
	ld a, $7
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, $2
	ld [hl], a
	hlcoord 2, 17, AttrMap
	ld a, $3
	ld bc, 6
	call ByteFill
	ret
; 49811

LoadTradeRoomBGPals: ; 49811
	ld hl, TradeRoomPalette
	ld de, wBGPals1 palette PAL_BG_GREEN
	ld bc, 6 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	farcall ApplyPals
	ret
; 49826

TradeRoomPalette: ; 49826
INCLUDE "gfx/trade/border.pal"
; 49856

InitMG_Mobile_LinkTradePalMap: ; 49856
	call _InitMG_Mobile_LinkTradePalMap
	ret
; 4985a

Unknown_4985a: ; unreferenced
INCLUDE "gfx/unknown/4985a.asm"
