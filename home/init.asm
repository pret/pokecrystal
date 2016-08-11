Reset:: ; 150
	di
	call MapSetup_Sound_Off
	xor a
	ld [hMapAnims], a
	call ClearPalettes
	xor a
	ld [rIF], a
	ld a, 1 ; VBlank int
	ld [rIE], a
	ei

	ld hl, wcfbe
	set 7, [hl]

	ld c, 32
	call DelayFrames

	jr Init
; 16e


_Start:: ; 16e
	cp $11
	jr z, .cgb
	xor a
	jr .load

.cgb
	ld a, $1

.load
	ld [hCGB], a
	ld a, $1
	ld [hFFEA], a
; 17d


Init:: ; 17d

	di

	xor a
	ld [rIF], a
	ld [rIE], a
	ld [rRP], a
	ld [rSCX], a
	ld [rSCY], a
	ld [rSB], a
	ld [rSC], a
	ld [rWX], a
	ld [rWY], a
	ld [rBGP], a
	ld [rOBP0], a
	ld [rOBP1], a
	ld [rTMA], a
	ld [rTAC], a
	ld [$d000], a

	ld a, %100 ; Start timer at 4096Hz
	ld [rTAC], a

.wait
	ld a, [rLY]
	cp 145
	jr nz, .wait

	xor a
	ld [rLCDC], a

; Clear WRAM bank 0
	ld hl, wc000
	ld bc, wd000 - wc000
.ByteFill:
	ld [hl], 0
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, .ByteFill

	ld sp, Stack

; Clear HRAM
	ld a, [hCGB]
	push af
	ld a, [hFFEA]
	push af
	xor a
	ld hl, HRAM_START
	ld bc, HRAM_END - HRAM_START
	call ByteFill
	pop af
	ld [hFFEA], a
	pop af
	ld [hCGB], a

	call ClearWRAM
	ld a, 1
	ld [rSVBK], a
	call ClearVRAM
	call ClearSprites
	call ClearsScratch


	ld a, BANK(LoadPushOAM)
	rst Bankswitch

	call LoadPushOAM

	xor a
	ld [hMapAnims], a
	ld [hSCX], a
	ld [hSCY], a
	ld [rJOYP], a

	ld a, $8 ; HBlank int enable
	ld [rSTAT], a

	ld a, $90
	ld [hWY], a
	ld [rWY], a

	ld a, 7
	ld [hWX], a
	ld [rWX], a

	ld a, %11100011
	; LCD on
	; Win tilemap 1
	; Win on
	; BG/Win tiledata 0
	; BG Tilemap 0
	; OBJ 8x8
	; OBJ on
	; BG on
	ld [rLCDC], a

	ld a, -1
	ld [hLinkPlayerNumber], a

	callba InitCGBPals

	ld a, VBGMap1 / $100
	ld [hBGMapAddress + 1], a
	xor a ; VBGMap1 % $100
	ld [hBGMapAddress], a

	callba StartClock

	xor a
	ld [MBC3LatchClock], a
	ld [MBC3SRamEnable], a

	ld a, [hCGB]
	and a
	jr z, .no_double_speed
	call NormalSpeed
.no_double_speed

	xor a
	ld [rIF], a
	ld a, %1111 ; VBlank, LCDStat, Timer, Serial interrupts
	ld [rIE], a
	ei

	call DelayFrame

	predef InitSGBBorder ; SGB init

	call MapSetup_Sound_Off
	xor a
	ld [wMapMusic], a
	jp GameInit
; 245


ClearVRAM:: ; 245
; Wipe VRAM banks 0 and 1

	ld a, 1
	ld [rVBK], a
	call .clear

	xor a
	ld [rVBK], a
.clear
	ld hl, VTiles0
	ld bc, $2000
	xor a
	call ByteFill
	ret
; 25a

ClearWRAM:: ; 25a
; Wipe swappable WRAM banks (1-7)
; Assumes CGB or AGB

	ld a, 1
.bank_loop
	push af
	ld [rSVBK], a
	xor a
	ld hl, $d000
	ld bc, $1000
	call ByteFill
	pop af
	inc a
	cp 8
	jr nc, .bank_loop ; Should be jr c
	ret
; 270

ClearsScratch:: ; 270
; Wipe the first 32 bytes of sScratch

	ld a, BANK(sScratch)
	call GetSRAMBank
	ld hl, sScratch
	ld bc, $20
	xor a
	call ByteFill
	call CloseSRAM
	ret
; 283
