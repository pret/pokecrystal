Reset::
	di
	call InitSound
	xor a
	ldh [hMapAnims], a
	call ClearPalettes
	xor a
	ldh [rIF], a
	ld a, IE_VBLANK
	ldh [rIE], a
	ei

	ld hl, wJoypadDisable
	set JOYPAD_DISABLE_SGB_TRANSFER_F, [hl]

	ld c, 32
	call DelayFrames

	jr Init

_Start::
	cp BOOTUP_A_CGB
	jr z, .cgb
	xor a ; FALSE
	jr .load

.cgb
	ld a, TRUE

.load
	ldh [hCGB], a
	ld a, TRUE
	ldh [hSystemBooted], a

Init::
	di

	xor a
	ldh [rIF], a
	ldh [rIE], a
	ldh [rRP], a
	ldh [rSCX], a
	ldh [rSCY], a
	ldh [rSB], a
	ldh [rSC], a
	ldh [rWX], a
	ldh [rWY], a
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	ldh [rTMA], a
	ldh [rTAC], a
	ld [wBetaTitleSequenceOpeningType], a

	ld a, %100 ; Start timer at 4096Hz
	ldh [rTAC], a

.wait
	ldh a, [rLY]
	cp LY_VBLANK + 1
	jr nz, .wait

	xor a
	ldh [rLCDC], a

; Clear WRAM bank 0
	ld hl, STARTOF(WRAM0)
	ld bc, SIZEOF(WRAM0)
.ByteFill:
	ld [hl], 0
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, .ByteFill

	ld sp, wStackTop

; Clear HRAM
	ldh a, [hCGB]
	push af
	ldh a, [hSystemBooted]
	push af
	xor a
	ld hl, STARTOF(HRAM)
	ld bc, SIZEOF(HRAM)
	call ByteFill
	pop af
	ldh [hSystemBooted], a
	pop af
	ldh [hCGB], a

	call ClearWRAM
	ld a, 1
	ldh [rWBK], a
	call ClearVRAM
	call ClearSprites
	call ClearsScratch

	ld a, BANK(WriteOAMDMACodeToHRAM) ; aka BANK(GameInit)
	rst Bankswitch

	call WriteOAMDMACodeToHRAM

	xor a
	ldh [hMapAnims], a
	ldh [hSCX], a
	ldh [hSCY], a
	ldh [rJOYP], a

	ld a, STAT_MODE_0
	ldh [rSTAT], a

	ld a, SCREEN_HEIGHT_PX
	ldh [hWY], a
	ldh [rWY], a

	ld a, WX_OFS
	ldh [hWX], a
	ldh [rWX], a

	ld a, LCDC_DEFAULT ; %11100011
	; LCD on
	; Win tilemap 1
	; Win on
	; BG/Win tiledata 0
	; BG Tilemap 0
	; OBJ 8x8
	; OBJ on
	; BG on
	ldh [rLCDC], a

	ld a, CONNECTION_NOT_ESTABLISHED
	ldh [hSerialConnectionStatus], a

	farcall InitCGBPals

	ld a, HIGH(vBGMap1)
	ldh [hBGMapAddress + 1], a
	xor a ; LOW(vBGMap1)
	ldh [hBGMapAddress], a

	farcall StartClock

	xor a ; RAMG_SRAM_DISABLE
	ld [rRTCLATCH], a
	ld [rRAMG], a

	ldh a, [hCGB]
	and a
	jr z, .no_double_speed
	call NormalSpeed
.no_double_speed

	xor a
	ldh [rIF], a
	ld a, IE_DEFAULT
	ldh [rIE], a
	ei

	call DelayFrame

	predef InitSGBBorder

	call InitSound
	xor a
	ld [wMapMusic], a
	jp GameInit

ClearVRAM::
; Wipe VRAM banks 0 and 1

	ld a, 1
	ldh [rVBK], a
	call .clear

	xor a ; 0
	ldh [rVBK], a
.clear
	ld hl, STARTOF(VRAM)
	ld bc, SIZEOF(VRAM)
	xor a
	call ByteFill
	ret

ClearWRAM::
; Wipe swappable WRAM banks (1-7)
; Assumes CGB or AGB
; BUG: ClearWRAM only clears WRAM bank 1 (see docs/bugs_and_glitches.md)

	ld a, 1
.bank_loop
	push af
	ldh [rWBK], a
	xor a
	ld hl, STARTOF(WRAMX)
	ld bc, SIZEOF(WRAMX)
	call ByteFill
	pop af
	inc a
	cp 8
	jr nc, .bank_loop
	ret

ClearsScratch::
; Wipe the first 32 bytes of sScratch

	ld a, BANK(sScratch)
	call OpenSRAM
	ld hl, sScratch
	ld bc, $20
	xor a
	call ByteFill
	call CloseSRAM
	ret
