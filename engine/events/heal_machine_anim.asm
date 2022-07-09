; HealMachineAnim.Jumptable indexes
	const_def
	const HEALMACHINESTATE_LOADGFX
	const HEALMACHINESTATE_PCLOADBALLS
	const HEALMACHINESTATE_HOFLOADBALLS
	const HEALMACHINESTATE_PLAYMUSIC
	const HEALMACHINESTATE_HOFPLAYSFX
	const HEALMACHINESTATE_FINISH

HealMachineAnim:
	; If you have no Pokemon, don't change the buffer.  This can lead to some glitchy effects if you have no Pokemon.
	ld a, [wPartyCount]
	and a
	ret z
	; The location of the healing machine relative to the player is stored in wScriptVar.
	; 0: Up and left (Pokemon Center)
	; 1: Left (Elm's Lab)
	; 2: Up (Hall of Fame)
	ld a, [wScriptVar]
	ld [wHealMachineAnimType], a
	ldh a, [rOBP1]
	ld [wHealMachineTempOBP1], a
	call .DoJumptableFunctions
	ld a, [wHealMachineTempOBP1]
	call DmgToCgbObjPal1
	ret

.DoJumptableFunctions:
	xor a
	ld [wHealMachineAnimState], a
.jumptable_loop
	ld a, [wHealMachineAnimType]
	ld e, a
	ld d, 0
	ld hl, .Pointers
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wHealMachineAnimState]
	ld e, a
	inc a
	ld [wHealMachineAnimState], a
	add hl, de
	ld a, [hl]
	cp HEALMACHINESTATE_FINISH
	jr z, .finish
	ld hl, .Jumptable
	rst JumpTable
	jr .jumptable_loop

.finish
	ret

.Pointers:
; entries correspond to HEALMACHINE_* constants
	dw .Pokecenter
	dw .ElmsLab
	dw .HallOfFame

MACRO healmachineanimseq
	rept _NARG
		db HEALMACHINESTATE_\1
		shift
	endr
ENDM

.Pokecenter:
	healmachineanimseq LOADGFX, PCLOADBALLS, PLAYMUSIC, FINISH
.ElmsLab:
	healmachineanimseq LOADGFX, PCLOADBALLS, PLAYMUSIC, FINISH
.HallOfFame:
	healmachineanimseq LOADGFX, HOFLOADBALLS, HOFPLAYSFX, FINISH

.Jumptable:
; entries correspond to HEALMACHINESTATE_* constants
	dw .LoadGFX
	dw .PC_LoadBallsOntoMachine
	dw .HOF_LoadBallsOntoMachine
	dw .PlayHealMusic
	dw .HOF_PlaySFX
	dw .dummy_5 ; never encountered

.LoadGFX:
	call .LoadPalettes
	ld de, .HealMachineGFX
	ld hl, vTiles0 tile $7c
	lb bc, BANK(.HealMachineGFX), 2
	call Request2bpp
	ret

.PC_LoadBallsOntoMachine:
	ld hl, wShadowOAMSprite32
	ld de, .PC_ElmsLab_OAM
	call .PlaceHealingMachineTile
	call .PlaceHealingMachineTile
	jr .LoadBallsOntoMachine

.HOF_LoadBallsOntoMachine:
	ld hl, wShadowOAMSprite32
	ld de, .HOF_OAM

.LoadBallsOntoMachine:
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

.PlayHealMusic:
	ld de, MUSIC_HEAL
	call PlayMusic
	jp .FlashPalettes8Times

.HOF_PlaySFX:
	ld de, SFX_GAME_FREAK_LOGO_GS
	call PlaySFX
	call .FlashPalettes8Times
	call WaitSFX
	ld de, SFX_BOOT_PC
	call PlaySFX
	ret

.dummy_5
	ret

.PC_ElmsLab_OAM:
	dbsprite   4,   4, 2, 0, $7c, PAL_OW_TREE | OBP_NUM
	dbsprite   4,   4, 6, 0, $7c, PAL_OW_TREE | OBP_NUM
	dbsprite   4,   4, 0, 6, $7d, PAL_OW_TREE | OBP_NUM
	dbsprite   5,   4, 0, 6, $7d, PAL_OW_TREE | OBP_NUM | X_FLIP
	dbsprite   4,   5, 0, 3, $7d, PAL_OW_TREE | OBP_NUM
	dbsprite   5,   5, 0, 3, $7d, PAL_OW_TREE | OBP_NUM | X_FLIP
	dbsprite   4,   6, 0, 0, $7d, PAL_OW_TREE | OBP_NUM
	dbsprite   5,   6, 0, 0, $7d, PAL_OW_TREE | OBP_NUM | X_FLIP

.HealMachineGFX:
INCBIN "gfx/overworld/heal_machine.2bpp"

.HOF_OAM:
	dbsprite  10,   7, 1, 4, $7d, PAL_OW_TREE | OBP_NUM
	dbsprite  10,   7, 6, 4, $7d, PAL_OW_TREE | OBP_NUM
	dbsprite   9,   7, 5, 3, $7d, PAL_OW_TREE | OBP_NUM
	dbsprite  11,   7, 2, 3, $7d, PAL_OW_TREE | OBP_NUM
	dbsprite   9,   7, 1, 1, $7d, PAL_OW_TREE | OBP_NUM
	dbsprite  11,   7, 5, 1, $7d, PAL_OW_TREE | OBP_NUM

.LoadPalettes:
	call IsCGB
	jr nz, .cgb
	ld a, %11100000
	ldh [rOBP1], a
	ret

.cgb
	ld hl, .palettes
	ld de, wOBPals2 palette PAL_OW_TREE
	ld bc, 1 palettes
	ld a, BANK(wOBPals2)
	call FarCopyWRAM
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

.palettes
INCLUDE "gfx/overworld/heal_machine.pal"

.FlashPalettes8Times:
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

.FlashPalettes:
	call IsCGB
	jr nz, .go
	ldh a, [rOBP1]
	xor %00101000
	ldh [rOBP1], a
	ret

.go
	ldh a, [rSVBK]
	push af
	ld a, BANK(wOBPals2)
	ldh [rSVBK], a

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
	ldh [rSVBK], a
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

.PlaceHealingMachineTile:
	push bc
	ld a, [wHealMachineAnimType]
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
