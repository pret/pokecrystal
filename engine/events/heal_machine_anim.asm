; Special_HealMachineAnim.Jumptable indexes
	const_def
	const HEALMACHINESTATE_LOADGFX
	const HEALMACHINESTATE_PCLOADBALLS
	const HEALMACHINESTATE_HOFLOADBALLS
	const HEALMACHINESTATE_PLAYMUSIC
	const HEALMACHINESTATE_HOFPLAYSFX
	const HEALMACHINESTATE_FINISH

Special_HealMachineAnim: ; 12324
	; If you have no Pokemon, don't change the buffer.  This can lead to some glitchy effects if you have no Pokemon.
	ld a, [wPartyCount]
	and a
	ret z
	; The location of the healing machine relative to the player is stored in wScriptVar.
	; 0: Up and left (Pokemon Center)
	; 1: Left (Elm's Lab)
	; 2: Up (Hall of Fame)
	ld a, [wScriptVar]
	ld [wBuffer1], a
	ld a, [rOBP1]
	ld [wBuffer2], a
	call .DoJumptableFunctions
	ld a, [wBuffer2]
	call DmgToCgbObjPal1
	ret
; 1233e

.DoJumptableFunctions: ; 1233e
	xor a
	ld [wBuffer3], a
.jumpable_loop
	ld a, [wBuffer1]
	ld e, a
	ld d, 0
	ld hl, .Pointers
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wBuffer3]
	ld e, a
	inc a
	ld [wBuffer3], a
	add hl, de
	ld a, [hl]
	cp HEALMACHINESTATE_FINISH
	jr z, .finish
	ld hl, .Jumptable
	rst JumpTable
	jr .jumpable_loop

.finish
	ret
; 12365

.Pointers: ; 12365
; entries correspond to HEALMACHINE_* constants
	dw .Pokecenter
	dw .ElmLab
	dw .HallOfFame
; 1236b

healmachineanimseq: MACRO
rept _NARG
	db HEALMACHINESTATE_\1
	shift
endr
ENDM

.Pokecenter: ; 1236b
	healmachineanimseq LOADGFX, PCLOADBALLS, PLAYMUSIC, FINISH
.ElmLab: ; 1236f
	healmachineanimseq LOADGFX, PCLOADBALLS, PLAYMUSIC, FINISH
.HallOfFame: ; 12373
	healmachineanimseq LOADGFX, HOFLOADBALLS, HOFPLAYSFX, FINISH
; 12377

.Jumptable: ; 12377
; entries correspond to HEALMACHINESTATE_* constants
	dw .LoadGFX
	dw .PC_LoadBallsOntoMachine
	dw .HOF_LoadBallsOntoMachine
	dw .PlayHealMusic
	dw .HOF_PlaySFX
	dw .dummy_5 ; never encountered
; 12383

.LoadGFX: ; 12383
	call .LoadPalettes
	ld de, .HealMachineGFX
	ld hl, vTiles0 tile $7c
	lb bc, BANK(.HealMachineGFX), 2
	call Request2bpp
	ret
; 12393

.PC_LoadBallsOntoMachine: ; 12393
	ld hl, wVirtualOAMSprite32
	ld de, .PC_ElmsLab_OAM
	call .PlaceHealingMachineTile
	call .PlaceHealingMachineTile
	jr .LoadBallsOntoMachine

.HOF_LoadBallsOntoMachine: ; 123a1
	ld hl, wVirtualOAMSprite32
	ld de, .HOF_OAM

.LoadBallsOntoMachine: ; 123a7
	ld a, [wPartyCount]
	ld b, a
.party_loop
	call .PlaceHealingMachineTile
	push de
	ld de, SFX_SECOND_PART_OF_ITEMFINDER
	call PlaySFX
	pop de
	ld c, 30
	call DelayFrames
	dec b
	jr nz, .party_loop
	ret
; 123bf

.PlayHealMusic: ; 123bf
	ld de, MUSIC_HEAL
	call PlayMusic
	jp .FlashPalettes8Times
; 123c8

.HOF_PlaySFX: ; 123c8
	ld de, SFX_GAME_FREAK_LOGO_GS
	call PlaySFX
	call .FlashPalettes8Times
	call WaitSFX
	ld de, SFX_BOOT_PC
	call PlaySFX
	ret
; 123db

.dummy_5 ; 123db
	ret
; 123dc

.PC_ElmsLab_OAM: ; 123dc
	dsprite   4, 0,   4, 2, $7c, PAL_OW_TREE | OBP_NUM
	dsprite   4, 0,   4, 6, $7c, PAL_OW_TREE | OBP_NUM
	dsprite   4, 6,   4, 0, $7d, PAL_OW_TREE | OBP_NUM
	dsprite   4, 6,   5, 0, $7d, PAL_OW_TREE | OBP_NUM | X_FLIP
	dsprite   5, 3,   4, 0, $7d, PAL_OW_TREE | OBP_NUM
	dsprite   5, 3,   5, 0, $7d, PAL_OW_TREE | OBP_NUM | X_FLIP
	dsprite   6, 0,   4, 0, $7d, PAL_OW_TREE | OBP_NUM
	dsprite   6, 0,   5, 0, $7d, PAL_OW_TREE | OBP_NUM | X_FLIP
; 123fc

.HealMachineGFX: ; 123fc
INCBIN "gfx/overworld/heal_machine.2bpp"
; 1241c

.HOF_OAM: ; 1241c
	dsprite   7, 4,  10, 1, $7d, PAL_OW_TREE | OBP_NUM
	dsprite   7, 4,  10, 6, $7d, PAL_OW_TREE | OBP_NUM
	dsprite   7, 3,   9, 5, $7d, PAL_OW_TREE | OBP_NUM
	dsprite   7, 3,  11, 2, $7d, PAL_OW_TREE | OBP_NUM
	dsprite   7, 1,   9, 1, $7d, PAL_OW_TREE | OBP_NUM
	dsprite   7, 1,  11, 5, $7d, PAL_OW_TREE | OBP_NUM
; 12434

.LoadPalettes: ; 12434
	call IsCGB
	jr nz, .cgb
	ld a, %11100000
	ld [rOBP1], a
	ret

.cgb
	ld hl, .palettes
	ld de, wOBPals2 palette PAL_OW_TREE
	ld bc, 1 palettes
	ld a, BANK(wOBPals2)
	call FarCopyWRAM
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; 12451

.palettes ; 12451
INCLUDE "gfx/overworld/heal_machine.pal"
; 12459

.FlashPalettes8Times: ; 12459
	ld c, 8
.palette_loop
	push bc
	call .FlashPalettes
	ld c, 10
	call DelayFrames
	pop bc
	dec c
	jr nz, .palette_loop
	ret
; 12469

.FlashPalettes: ; 12469
	call IsCGB
	jr nz, .go
	ld a, [rOBP1]
	xor %00101000
	ld [rOBP1], a
	ret

.go
	ld a, [rSVBK]
	push af
	ld a, BANK(wOBPals2)
	ld [rSVBK], a

	ld hl, wOBPals2 palette PAL_OW_TREE
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push de
	ld c, $3
.palette_loop_2
	ld a, [hli]
	ld e, a
	ld a, [hld]
	ld d, a
	dec hl
	ld a, d
	ld [hld], a
	ld a, e
	ld [hli], a
	inc hl
	inc hl
	inc hl
	dec c
	jr nz, .palette_loop_2
	pop de
	dec hl
	ld a, d
	ld [hld], a
	ld a, e
	ld [hl], a

	pop af
	ld [rSVBK], a
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; 124a3

.PlaceHealingMachineTile: ; 124a3
	push bc
	ld a, [wBuffer1]
	bcpixel 2, 4
	cp HEALMACHINE_ELMS_LAB
	jr z, .okay
	bcpixel 0, 0

.okay
	ld a, [de]
	add c
	inc de
	ld [hli], a ; y
	ld a, [de]
	add b
	inc de
	ld [hli], a ; x
	ld a, [de]
	inc de
	ld [hli], a ; tile id
	ld a, [de]
	inc de
	ld [hli], a ; attributes
	pop bc
	ret
; 124c1
