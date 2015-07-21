INCLUDE "includes.asm"

SECTION "NULL", ROM0[0]
NULL::


INCLUDE "rst.asm"
INCLUDE "interrupts.asm"


SECTION "Header", ROM0[$100]

Start::
	nop
	jp _Start


SECTION "Home", ROM0[$150]

INCLUDE "home/init.asm"
INCLUDE "home/vblank.asm"
INCLUDE "home/delay.asm"
INCLUDE "home/rtc.asm"
INCLUDE "home/fade.asm"
INCLUDE "home/lcd.asm"
INCLUDE "home/time.asm"
INCLUDE "home/serial.asm"
INCLUDE "home/joypad.asm"
INCLUDE "home/decompress.asm"
INCLUDE "home/palettes.asm"
INCLUDE "home/copy.asm"
INCLUDE "home/text.asm"
INCLUDE "home/video.asm"
INCLUDE "home/map_objects.asm"
INCLUDE "home/sine.asm"
INCLUDE "home/movement.asm"
INCLUDE "home/tilemap.asm"
INCLUDE "home/menu.asm"
INCLUDE "home/handshake.asm"
INCLUDE "home/game_time.asm"
INCLUDE "home/map.asm"


Function2d43:: ; 2d43
; Inexplicably empty.
; Seen in PredefPointers.
	rept 16
	nop
	endr
	ret
; 2d54


INCLUDE "home/farcall.asm"
INCLUDE "home/predef.asm"
INCLUDE "home/window.asm"


Function2e4e:: ; 2e4e
; Unreferenced.
	scf
	ret
; 2e50


INCLUDE "home/flag.asm"


Function2ebb:: ; 2ebb
	ld a, [wc2cc]
	bit 1, a
	ret z
	ld a, [hJoyDown]
	bit 1, a ; B_BUTTON
	ret
; 2ec6

Function2ec6:: ; 2ec6
	xor a
	ret
; 2ec8

Function2ec8:: ; 2ec8
	xor a
	dec a
	ret
; 2ecb

Function2ecb:: ; 2ecb
	push hl
	ld hl, wc2cc
	bit 1, [hl]
	pop hl
	ret
; 2ed3


Function2ed3:: ; 0x2ed3
; disables overworld sprite updating?
	xor a
	ld [$ffde], a
	ld a, [VramState]
	res 0, a
	ld [VramState], a
	ld a, $0
	ld [wc2ce], a
	ret
; 0x2ee4

Function2ee4:: ; 2ee4
	ld a, $1
	ld [wc2ce], a
	ld a, [VramState]
	set 0, a
	ld [VramState], a
	ld a, $1
	ld [$ffde], a
	ret
; 2ef6


INCLUDE "home/string.asm"


IsInJohto:: ; 2f17
; Return 0 if the player is in Johto, and 1 in Kanto.

	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	call GetWorldMapLocation

	cp FAST_SHIP
	jr z, .Johto

	cp SPECIAL_MAP
	jr nz, .CheckRegion

	ld a, [BackupMapGroup]
	ld b, a
	ld a, [BackupMapNumber]
	ld c, a
	call GetWorldMapLocation

.CheckRegion
	cp KANTO_LANDMARK
	jr nc, .Kanto

.Johto
	xor a
	ret

.Kanto
	ld a, 1
	ret
; 2f3e


Function2f3e:: ; 2f3e
	ret
; 2f3f


INCLUDE "home/item.asm"
INCLUDE "home/random.asm"
INCLUDE "home/sram.asm"


; Register aliases

_hl_:: ; 2fec
	jp [hl]
; 2fed

_de_:: ; 2fed
	push de
	ret
; 2fef


INCLUDE "home/double_speed.asm"


ClearSprites:: ; 300b
; Erase OAM data
	ld hl, Sprites
	ld b, SpritesEnd - Sprites
	xor a
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	ret
; 3016

HideSprites:: ; 3016
; Set all OAM y-positions to 160 to hide them offscreen
	ld hl, Sprites
	ld de, 4 ; length of an OAM struct
	ld b, (SpritesEnd - Sprites) / 4 ; number of OAM structs
	ld a, 160 ; y
.loop
	ld [hl], a
	add hl, de
	dec b
	jr nz, .loop
	ret
; 3026


INCLUDE "home/copy2.asm"


Function309d:: ; 309d
	ld a, [rSVBK]
	push af
	ld a, 2
	ld [rSVBK], a
	ld hl, TileMap
	ld de, w2_d000
	ld bc, TileMapEnd - TileMap
	call CopyBytes
	pop af
	ld [rSVBK], a
	ret
; 30b4

Function30b4:: ; 30b4
	xor a
	ld [hBGMapMode], a
	call Function30bf
	ld a, 1
	ld [hBGMapMode], a
	ret
; 30bf

Function30bf:: ; 30bf
	ld a, [rSVBK]
	push af
	ld a, 2
	ld [rSVBK], a
	ld hl, w2_d000
	ld de, TileMap
	ld bc, TileMapEnd - TileMap
	call CopyBytes
	pop af
	ld [rSVBK], a
	ret
; 30d6


CopyName1:: ; 30d6
	ld hl, StringBuffer2

CopyName2:: ; 30d9
.loop
	ld a, [de]
	inc de
	ld [hli], a
	cp "@"
	jr nz, .loop
	ret
; 30e1

IsInArray:: ; 30e1
; Find value a for every de bytes in array hl.
; Return index in b and carry if found.

	ld b, 0
	ld c, a
.loop
	ld a, [hl]
	cp $ff
	jr z, .NotInArray
	cp c
	jr z, .InArray
	inc b
	add hl, de
	jr .loop

.NotInArray
	and a
	ret

.InArray
	scf
	ret
; 30f4

SkipNames:: ; 0x30f4
; Skip a names.
	ld bc, NAME_LENGTH
	and a
	ret z
.loop
	add hl, bc
	dec a
	jr nz, .loop
	ret
; 0x30fe

AddNTimes:: ; 0x30fe
; Add bc * a to hl.
	and a
	ret z
.loop
	add hl, bc
	dec a
	jr nz, .loop
	ret
; 0x3105


INCLUDE "home/math.asm"


PrintLetterDelay:: ; 313d
; Wait before printing the next letter.

; The text speed setting in Options is actually a frame count:
; 	fast: 1 frame
; 	mid:  3 frames
; 	slow: 5 frames

; TextBoxFrame + 1[!0] and A or B override text speed with a one-frame delay.
; Options[4] and TextBoxFrame + 1[!1] disable the delay.

	ld a, [Options]
	bit NO_TEXT_SCROLL, a
	ret nz

; non-scrolling text?
	ld a, [TextBoxFrame + 1]
	bit 1, a
	ret z

	push hl
	push de
	push bc

	ld hl, hOAMUpdate
	ld a, [hl]
	push af

; orginally turned oam update off...
;	ld a, 1
	ld [hl], a

; force fast scroll?
	ld a, [TextBoxFrame + 1]
	bit 0, a
	jr z, .fast

; text speed
	ld a, [Options]
	and %111
	jr .updatedelay

.fast
	ld a, 1

.updatedelay
	ld [TextDelayFrames], a

.checkjoypad
	call GetJoypad

; input override
	ld a, [wc2d7]
	and a
	jr nz, .wait

; Wait one frame if holding A or B.
	ld a, [hJoyDown]
	bit 0, a ; A_BUTTON
	jr z, .checkb
	jr .delay
.checkb
	bit 1, a ; B_BUTTON
	jr z, .wait

.delay
	call DelayFrame
	jr .end

.wait
	ld a, [TextDelayFrames]
	and a
	jr nz, .checkjoypad

.end
	pop af
	ld [hOAMUpdate], a
	pop bc
	pop de
	pop hl
	ret
; 318c


CopyDataUntil:: ; 318c
; Copy [hl .. bc) to de.

; In other words, the source data is
; from hl up to but not including bc,
; and the destination is de.

	ld a, [hli]
	ld [de], a
	inc de
	ld a, h
	cp b
	jr nz, CopyDataUntil
	ld a, l
	cp c
	jr nz, CopyDataUntil
	ret
; 0x3198


PrintNum:: ; 3198
	ld a, [hROMBank]
	push af
	ld a, BANK(_PrintNum)
	rst Bankswitch

	call _PrintNum

	pop af
	rst Bankswitch
	ret
; 31a4


Function31a4:: ; 31a4
	ld a, [hROMBank]
	push af
	ld a, BANK(Function1061ef)
	rst Bankswitch

	call Function1061ef

	pop af
	rst Bankswitch
	ret
; 31b0


FarPrintText:: ; 31b0
	ld [hBuffer], a
	ld a, [hROMBank]
	push af
	ld a, [hBuffer]
	rst Bankswitch

	call PrintText

	pop af
	rst Bankswitch
	ret
; 31be


CallPointerAt:: ; 31be
	ld a, [hROMBank]
	push af
	ld a, [hli]
	rst Bankswitch

	ld a, [hli]
	ld h, [hl]
	ld l, a

	call _hl_

	pop hl
	ld a, h
	rst Bankswitch
	ret
; 31cd


ExitMenuCallScript:: ; 31cd
; Push pointer hl in the current bank to wd0e8.
	ld a, [hROMBank]

Function31cf:: ; 31cf
; Push pointer a:hl to wd0e8.
	ld [wd0e8], a
	ld a, l
	ld [wd0e9], a
	ld a, h
	ld [wd0e9 + 1], a
	ret
; 31db


StringCmp:: ; 31db
; Compare c bytes at de and hl.
; Return z if they all match.
.loop
	ld a, [de]
	cp [hl]
	ret nz
	inc de
	inc hl
	dec c
	jr nz, .loop
	ret
; 0x31e4


CompareLong:: ; 31e4
; Compare bc bytes at de and hl.
; Return carry if they all match.

	ld a, [de]
	cp [hl]
	jr nz, .Diff

	inc de
	inc hl
	dec bc

	ld a, b
	or c
	jr nz, CompareLong

	scf
	ret

.Diff
	and a
	ret
; 31f3


WhiteBGMap:: ; 31f3
	call ClearPalettes
WaitBGMap:: ; 31f6
; Tell VBlank to update BG Map
	ld a, 1 ; BG Map 0 tiles
	ld [hBGMapMode], a
; Wait for it to do its magic
	ld c, 4
	call DelayFrames
	ret
; 3200

Function3200:: ; 0x3200
	ld a, [hCGB]
	and a
	jr z, .bg0

	ld a, 2
	ld [hBGMapMode], a
	ld c, 4
	call DelayFrames

.bg0
	ld a, 1
	ld [hBGMapMode], a
	ld c, 4
	call DelayFrames
	ret
; 0x3218


Function3218:: ; 3218
	ld a, [hCGB]
	and a
	ret
; 321c


Function321c:: ; 321c
	ld a, [hCGB]
	and a
	jr z, .dmg

	ld a, [wc2ce]
	cp 0
	jr z, .dmg

	ld a, 1
	ld [hBGMapMode], a
	jr Function323d

.dmg
	ld a, 1
	ld [hBGMapMode], a
	ld c, 4
	call DelayFrames
	ret
; 3238

Function3238:: ; 3238
	ld a, [hCGB]
	and a
	jr z, WaitBGMap

Function323d:: ; 323d
	jr Function3246
; 323f

Function323f:: ; 323f
	callba Function104000
	ret
; 3246

Function3246:: ; 3246
	ld a, [hBGMapMode]
	push af
	xor a
	ld [hBGMapMode], a
	ld a, [$ffde]
	push af
	xor a
	ld [$ffde], a
.wait
	ld a, [rLY]
	cp $7f
	jr c, .wait

	di
	ld a, $1
	ld [rVBK], a
	ld hl, AttrMap
	call Function327b
	ld a, $0
	ld [rVBK], a
	ld hl, TileMap
	call Function327b
.wait2
	ld a, [rLY]
	cp $7f
	jr c, .wait2
	ei

	pop af
	ld [$ffde], a
	pop af
	ld [hBGMapMode], a
	ret
; 327b

Function327b:: ; 327b
	ld [hSPBuffer], sp
	ld sp, hl
	ld a, [$ffd7]
	ld h, a
	ld l, 0
	ld a, 18
	ld [$ffd3], a
	ld b, 1 << 1 ; not in v/hblank
	ld c, rSTAT % $100

.loop
rept 20 / 2
	pop de
.loop\@
	ld a, [$ff00+c]
	and b
	jr nz, .loop\@
	ld [hl], e
	inc l
	ld [hl], d
	inc l
endr

	ld de, 32 - 20
	add hl, de
	ld a, [$ffd3]
	dec a
	ld [$ffd3], a
	jr nz, .loop

	ld a, [hSPBuffer]
	ld l, a
	ld a, [hSPBuffer + 1]
	ld h, a
	ld sp, hl
	ret
; 32f9



Function32f9:: ; 32f9
	ld a, [hCGB]
	and a
	jr nz, .asm_3309
	ld a, $e4
	ld [rBGP], a
	ld a, $d0
	ld [rOBP0], a
	ld [rOBP1], a
	ret

.asm_3309
	push de
	ld a, $e4
	call DmgToCgbBGPals
	ld de, $e4e4
	call DmgToCgbObjPals
	pop de
	ret
; 3317


ClearPalettes:: ; 3317
; Make all palettes white

; CGB: make all the palette colors white
	ld a, [hCGB]
	and a
	jr nz, .cgb

; DMG: just change palettes to 0 (white)
	xor a
	ld [rBGP], a
	ld [rOBP0], a
	ld [rOBP1], a
	ret

.cgb
	ld a, [rSVBK]
	push af

	ld a, 5
	ld [rSVBK], a

; Fill BGPals and OBPals with $ffff (white)
	ld hl, BGPals
	ld bc, $80
	ld a, $ff
	call ByteFill

	pop af
	ld [rSVBK], a

; Request palette update
	ld a, 1
	ld [hCGBPalUpdate], a
	ret
; 333e


ClearSGB:: ; 333e
	ld b, $ff

GetSGBLayout:: ; 3340
; load sgb packets unless dmg

	ld a, [hCGB]
	and a
	jr nz, .sgb

	ld a, [hSGB]
	and a
	ret z

.sgb
	predef_jump Function864c ; LoadSGBLayout
; 334e


SetHPPal:: ; 334e
; Set palette for hp bar pixel length e at hl.
	call GetHPPal
	ld [hl], d
	ret
; 3353


GetHPPal:: ; 3353
; Get palette for hp bar pixel length e in d.

	ld d, HP_GREEN
	ld a, e
	cp 24
	ret nc
	inc d ; yellow
	cp 10
	ret nc
	inc d ; red
	ret
; 335f


CountSetBits:: ; 0x335f
; Count the number of set bits in b bytes starting from hl.
; Return in a, c and [wd265].

	ld c, 0
.next
	ld a, [hli]
	ld e, a
	ld d, 8

.count
	srl e
	ld a, 0
	adc c
	ld c, a
	dec d
	jr nz, .count

	dec b
	jr nz, .next

	ld a, c
	ld [wd265], a
	ret
; 0x3376


GetWeekday:: ; 3376
	ld a, [CurDay]
.mod
	sub 7
	jr nc, .mod
	add 7
	ret
; 3380


INCLUDE "home/pokedex_flags.asm"


NamesPointers:: ; 33ab
	dbw BANK(PokemonNames), PokemonNames
	dbw BANK(MoveNames), MoveNames
	dbw 0, 0
	dbw BANK(ItemNames), ItemNames
	dbw 0, PartyMonOT
	dbw 0, OTPartyMonOT
	dbw BANK(TrainerClassNames), TrainerClassNames
; 33c0

Function33c0:
	inc b
	ld d, d
	ld c, e
; 33c3

GetName:: ; 33c3
; Return name CurSpecies from name list wcf61 in StringBuffer1.

	ld a, [hROMBank]
	push af
	push hl
	push bc
	push de

	ld a, [wcf61]
	cp PKMN_NAME
	jr nz, .NotPokeName

	ld a, [CurSpecies]
	ld [wd265], a
	call GetPokemonName
	ld hl, PKMN_NAME_LENGTH
	add hl, de
	ld e, l
	ld d, h
	jr .done

.NotPokeName
	ld a, [wcf61]
	dec a
	ld e, a
	ld d, 0
	ld hl, NamesPointers
rept 3
	add hl, de
endr
	ld a, [hli]
	rst Bankswitch
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld a, [CurSpecies]
	dec a
	call GetNthString

	ld de, StringBuffer1
	ld bc, ITEM_NAME_LENGTH
	call CopyBytes

.done
	ld a, e
	ld [wd102], a
	ld a, d
	ld [wd103], a

	pop de
	pop bc
	pop hl
	pop af
	rst Bankswitch
	ret
; 3411


GetNthString:: ; 3411
; Return the address of the
; ath string starting from hl.

	and a
	ret z

	push bc
	ld b, a
	ld c, "@"
.readChar
	ld a, [hli]
	cp c
	jr nz, .readChar
	dec b
	jr nz, .readChar
	pop bc
	ret
; 3420


GetBasePokemonName:: ; 3420
; Discards gender (Nidoran).

	push hl
	call GetPokemonName

	ld hl, StringBuffer1
.loop
	ld a, [hl]
	cp "@"
	jr z, .quit
	cp "♂"
	jr z, .end
	cp "♀"
	jr z, .end
	inc hl
	jr .loop
.end
	ld [hl], "@"
.quit
	pop hl
	ret

; 343b


GetPokemonName:: ; 343b
; Get Pokemon name wd265.

	ld a, [hROMBank]
	push af
	push hl
	ld a, BANK(PokemonNames)
	rst Bankswitch

; Each name is ten characters
	ld a, [wd265]
	dec a
	ld d, 0
	ld e, a
	ld h, 0
	ld l, a
rept 2
	add hl, hl
endr
	add hl, de
	add hl, hl
	ld de, PokemonNames
	add hl, de

; Terminator
	ld de, StringBuffer1
	push de
	ld bc, PKMN_NAME_LENGTH - 1
	call CopyBytes
	ld hl, StringBuffer1 + PKMN_NAME_LENGTH - 1
	ld [hl], "@"
	pop de

	pop hl
	pop af
	rst Bankswitch
	ret
; 3468


GetItemName:: ; 3468
; Get item name wd265.

	push hl
	push bc
	ld a, [wd265]

	cp TM01
	jr nc, .TM

	ld [CurSpecies], a
	ld a, ITEM_NAME
	ld [wcf61], a
	call GetName
	jr .Copied
.TM
	call GetTMHMName
.Copied
	ld de, StringBuffer1
	pop bc
	pop hl
	ret
; 3487


GetTMHMName:: ; 3487
; Get TM/HM name by item id wd265.

	push hl
	push de
	push bc
	ld a, [wd265]
	push af

; TM/HM prefix
	cp HM01
	push af
	jr c, .TM

	ld hl, .HMText
	ld bc, .HMTextEnd - .HMText
	jr .asm_34a1

.TM
	ld hl, .TMText
	ld bc, .TMTextEnd - .TMText

.asm_34a1
	ld de, StringBuffer1
	call CopyBytes

; TM/HM number
	push de
	ld a, [wd265]
	ld c, a
	callab GetTMHMNumber
	pop de

; HM numbers start from 51, not 1
	pop af
	ld a, c
	jr c, .asm_34b9
	sub NUM_TMS
.asm_34b9

; Divide and mod by 10 to get the top and bottom digits respectively
	ld b, "0"
.mod10
	sub 10
	jr c, .asm_34c2
	inc b
	jr .mod10
.asm_34c2
	add 10

	push af
	ld a, b
	ld [de], a
	inc de
	pop af

	ld b, "0"
	add b
	ld [de], a

; End the string
	inc de
	ld a, "@"
	ld [de], a

	pop af
	ld [wd265], a
	pop bc
	pop de
	pop hl
	ret

.TMText
	db "TM"
.TMTextEnd
	db "@"

.HMText
	db "HM"
.HMTextEnd
	db "@"
; 34df


IsHM:: ; 34df
	cp HM01
	jr c, .NotHM
	scf
	ret
.NotHM
	and a
	ret
; 34e7


IsHMMove:: ; 34e7
	ld hl, .HMMoves
	ld de, 1
	jp IsInArray

.HMMoves
	db CUT
	db FLY
	db SURF
	db STRENGTH
	db FLASH
	db WATERFALL
	db WHIRLPOOL
	db $ff
; 34f8


GetMoveName:: ; 34f8
	push hl

	ld a, MOVE_NAME
	ld [wcf61], a

	ld a, [wd265] ; move id
	ld [CurSpecies], a

	call GetName
	ld de, StringBuffer1

	pop hl
	ret
; 350c


Function350c:: ; 350c
	call Function1c66
	ld a, [hROMBank]
	push af

	ld a, BANK(Function245af)
	rst Bankswitch

	call Function245af
	call Function3524
	call Function245cb

	pop af
	rst Bankswitch

	ld a, [wcf73]
	ret
; 3524

Function3524:: ; 3524
	ld hl, VramState
	bit 0, [hl]
	jp nz, UpdateTimePals
	jp Function32f9
; 352f

Function352f:: ; 352f
	ld a, [wcf82]
	dec a
	ld b, a
	ld a, [wcf84]
	sub b
	ld d, a
	ld a, [wcf83]
	dec a
	ld c, a
	ld a, [wcf85]
	sub c
	ld e, a
	push de
	call GetTileCoord
	pop bc
	jp TextBox
; 354b

Function354b:: ; 354b
	call DelayFrame

	ld a, [$ffaa]
	push af
	ld a, $1
	ld [$ffaa], a
	call Functiona57
	pop af
	ld [$ffaa], a

	ld a, [$ffa9]
	and D_RIGHT + D_LEFT + D_UP + D_DOWN
	ld c, a
	ld a, [hJoyPressed]
	and A_BUTTON + B_BUTTON + SELECT + START
	or c
	ld c, a
	ret
; 3567


Function3567:: ; 3567
	ld a, [hROMBank]
	push af

	call SwitchToMapScriptHeaderBank
	call Function3574

	pop bc
	ld a, b
	rst Bankswitch
	ret
; 3574

Function3574:: ; 3574
	ld hl, $0001
	add hl, de
	ld a, [hl]
	cp $ff
	jr z, .asm_3597

	ld l, a
	push hl
	call Function3599
	pop hl
	jr nc, .asm_3597
	ld d, a
	ld e, l
	call Function35de
	jr nc, .asm_3597
	call Function2631
	callba EnableScriptMode
	scf
	ret

.asm_3597
	and a
	ret
; 3599

Function3599:: ; 3599
	push de

	ld hl, $0010
	add hl, de
	ld a, [hl]
	ld hl, $0011
	add hl, de
	ld e, [hl]

	sub 4
	ld d, a
	ld a, e
	sub 4
	ld e, a
	call Function35b0

	pop de
	ret
; 35b0

Function35b0:: ; 35b0
	ld hl, wdbf9 + 3
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wdbf9 + 2]
	and a
	jr z, .asm_35d3

.loop
	push af
	ld a, [hl]
	cp e
	jr nz, .asm_35c8
	inc hl
	ld a, [hld]
	cp d
	jr nz, .asm_35c8
	jr .asm_35d5

.asm_35c8
	ld a, $5
	add l
	ld l, a
	jr nc, .asm_35cf
	inc h
.asm_35cf

	pop af
	dec a
	jr nz, .loop

.asm_35d3
	and a
	ret

.asm_35d5
	pop af
	ld d, a
	ld a, [wdbf9 + 2]
	sub d
	inc a
	scf
	ret
; 35de

Function35de:: ; 35de
	inc e
	ld hl, $0001
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
.asm_35e6
	ld a, [hli]
	cp $ff
	jr z, .asm_35fc
	cp d
	jr nz, .asm_35f7
	ld a, [hli]
	cp e
	jr nz, .asm_35f8
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jr .asm_35fe

.asm_35f7
	inc hl

.asm_35f8
rept 2
	inc hl
endr
	jr .asm_35e6

.asm_35fc
	and a
	ret

.asm_35fe
	scf
	ret
; 3600


CheckTrainerBattle2:: ; 3600

	ld a, [hROMBank]
	push af

	call SwitchToMapScriptHeaderBank
	call CheckTrainerBattle

	pop bc
	ld a, b
	rst Bankswitch
	ret
; 360d


CheckTrainerBattle:: ; 360d
; Check if any trainer on the map sees the player and wants to battle.

; Skip the player object.
	ld a, 1
	ld de, MapObjects + OBJECT_LENGTH

.loop

; Start a battle if the object:

	push af
	push de

; Has a sprite
	ld hl, MAPOBJECT_SPRITE
	add hl, de
	ld a, [hl]
	and a
	jr z, .next

; Is a trainer
	ld hl, MAPOBJECT_COLOR
	add hl, de
	ld a, [hl]
	and $f
	cp $2
	jr nz, .next

; Is visible on the map
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, de
	ld a, [hl]
	cp -1
	jr z, .next

; Is facing the player...
	call GetObjectStruct
	call FacingPlayerDistance_bc
	jr nc, .next

; ...within their sight range
	ld hl, MAPOBJECT_RANGE
	add hl, de
	ld a, [hl]
	cp b
	jr c, .next

; And hasn't already been beaten
	push bc
	push de
	ld hl, MAPOBJECT_SCRIPT_POINTER
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	pop de
	pop bc
	and a
	jr z, .startbattle

.next
	pop de
	ld hl, OBJECT_LENGTH
	add hl, de
	ld d, h
	ld e, l

	pop af
	inc a
	cp NUM_OBJECTS
	jr nz, .loop
	xor a
	ret

.startbattle
	pop de
	pop af
	ld [$ffe0], a
	ld a, b
	ld [CurFruit], a
	ld a, c
	ld [wd040], a
	jr Function367e
; 3674

Function3674:: ; 3674
	ld a, 1
	ld [CurFruit], a
	ld a, -1
	ld [wd040], a

Function367e:: ; 367e
	call GetMapScriptHeaderBank
	ld [EngineBuffer1], a
	ld a, [$ffe0]
	call GetMapObject
	ld hl, MAPOBJECT_SCRIPT_POINTER
	add hl, bc
	ld a, [EngineBuffer1]
	call GetFarHalfword
	ld de, wd041
	ld bc, $000d
	ld a, [EngineBuffer1]
	call FarCopyBytes
	xor a
	ld [wd04d], a
	scf
	ret
; 36a5


FacingPlayerDistance_bc:: ; 36a5

	push de
	call FacingPlayerDistance
	ld b, d
	ld c, e
	pop de
	ret
; 36ad


FacingPlayerDistance:: ; 36ad
; Return carry if the sprite at bc is facing the player,
; and its distance in d.

	ld hl, OBJECT_MAP_X ; x
	add hl, bc
	ld d, [hl]

	ld hl, OBJECT_MAP_Y ; y
	add hl, bc
	ld e, [hl]

	ld a, [MapX]
	cp d
	jr z, .CheckY

	ld a, [MapY]
	cp e
	jr z, .CheckX

	and a
	ret

.CheckY
	ld a, [MapY]
	sub e
	jr z, .NotFacing
	jr nc, .Above

; Below
	cpl
	inc a
	ld d, a
	ld e, UP << 2
	jr .CheckFacing

.Above
	ld d, a
	ld e, DOWN << 2
	jr .CheckFacing

.CheckX
	ld a, [MapX]
	sub d
	jr z, .NotFacing
	jr nc, .Left

; Right
	cpl
	inc a
	ld d, a
	ld e, LEFT << 2
	jr .CheckFacing

.Left
	ld d, a
	ld e, RIGHT << 2

.CheckFacing
	call GetSpriteDirection
	cp e
	jr nz, .NotFacing
	scf
	ret

.NotFacing
	and a
	ret
; 36f5


CheckTrainerFlag:: ; 36f5
	push bc
	ld hl, OBJECT_MAP_OBJECT_INDEX
	add hl, bc
	ld a, [hl]
	call GetMapObject
	ld hl, MAPOBJECT_SCRIPT_POINTER
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetMapScriptHeaderBank
	call GetFarHalfword
	ld d, h
	ld e, l
	push de
	ld b, CHECK_FLAG
	call EventFlagAction
	pop de
	ld a, c
	and a
	pop bc
	ret
; 3718


Function3718:: ; 3718
	ld a, [BattleType]
	cp BATTLETYPE_CANLOSE
	jr .canlose

	ld hl, WalkingTile
	jr .ok

.canlose
	ld a, [wd0ee]
	ld hl, WalkingTile
	and $f
	jr z, .ok
	ld hl, wd048 + 1

.ok
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetMapScriptHeaderBank
	call FarPrintText
	call WaitBGMap
	call Functiona80
	ret
; 3741



IsAPokemon:: ; 3741
; Return carry if species a is not a Pokemon.
	and a
	jr z, .NotAPokemon
	cp EGG
	jr z, .Pokemon
	cp NUM_POKEMON + 1
	jr c, .Pokemon

.NotAPokemon
	scf
	ret

.Pokemon
	and a
	ret
; 3750


DrawHPBar:: ; 3750
; Draw an HP bar d tiles long at hl
; Fill it up to e pixels

	push hl
	push de
	push bc

; Place 'HP:'
	ld a, $60
	ld [hli], a
	ld a, $61
	ld [hli], a

; Draw a template
	push hl
	ld a, $62 ; empty bar
.template
	ld [hli], a
	dec d
	jr nz, .template
	ld a, $6b ; bar end
	add b
	ld [hl], a
	pop hl

; Safety check # pixels
	ld a, e
	and a
	jr nz, .fill
	ld a, c
	and a
	jr z, .done
	ld e, 1

.fill
; Keep drawing tiles until pixel length is reached
	ld a, e
	sub TILE_WIDTH
	jr c, .lastbar

	ld e, a
	ld a, $6a ; full bar
	ld [hli], a
	ld a, e
	and a
	jr z, .done
	jr .fill

.lastbar
	ld a, $62  ; empty bar
	add e      ; + e
	ld [hl], a

.done
	pop bc
	pop de
	pop hl
	ret
; 3786


Function3786:: ; 3786
	ld a, $1
	ld [wc2c6], a

Function378b:: ; 378b
	ld a, [CurPartySpecies]
	call IsAPokemon
	jr c, .not_pokemon

	push hl
	ld de, VTiles2
	predef GetFrontpic
	pop hl
	xor a
	ld [$ffad], a
	lb bc, 7, 7
	predef FillBox
	xor a
	ld [wc2c6], a
	ret

.not_pokemon
	xor a
	ld [wc2c6], a
	inc a
	ld [CurPartySpecies], a
	ret
; 37b6


INCLUDE "home/cry.asm"


PrintLevel:: ; 382d
; Print TempMonLevel at hl

	ld a, [TempMonLevel]
	ld [hl], LV_CHAR
	inc hl

; How many digits?
	ld c, 2
	cp 100
	jr c, Function3842

; 3-digit numbers overwrite the :L.
	dec hl
	inc c
	jr Function3842
; 383d

Function383d:: ; 383d
; Print :L and all 3 digits
	ld [hl], LV_CHAR
	inc hl
	ld c, 3
; 3842

Function3842:: ; 3842
	ld [wd265], a
	ld de, wd265
	ld b, 1 << 6 + 1
	jp PrintNum
; 384d


Function384d:: ; 384d
	ld hl, wd25e
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	ret
; 3856


GetBaseData:: ; 3856
	push bc
	push de
	push hl
	ld a, [hROMBank]
	push af
	ld a, BANK(BaseData)
	rst Bankswitch

; Egg doesn't have BaseData
	ld a, [CurSpecies]
	cp EGG
	jr z, .egg

; Get BaseData
	dec a
	ld bc, BaseData1 - BaseData0
	ld hl, BaseData
	call AddNTimes
	ld de, CurBaseData
	ld bc, BaseData1 - BaseData0
	call CopyBytes
	jr .end

.egg
; ????
	ld de, UnknownEggPic

; Sprite dimensions
	ld b, $55 ; 5x5
	ld hl, BasePicSize
	ld [hl], b

; ????
	ld hl, BasePadding
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	ld [hl], e
	inc hl
	ld [hl], d
	jr .end

.end
; Replace Pokedex # with species
	ld a, [CurSpecies]
	ld [BaseDexNo], a

	pop af
	rst Bankswitch
	pop hl
	pop de
	pop bc
	ret
; 389c


GetCurNick:: ; 389c
	ld a, [CurPartyMon]
	ld hl, PartyMonNicknames

GetNick:: ; 38a2
; Get nickname a from list hl.

	push hl
	push bc

	call SkipNames
	ld de, StringBuffer1

	push de
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	pop de

	callab CheckNickErrors

	pop bc
	pop hl
	ret
; 38bb


PrintBCDNumber:: ; 38bb
; function to print a BCD (Binary-coded decimal) number
; de = address of BCD number
; hl = destination address
; c = flags and length
; bit 7: if set, do not print leading zeroes
;        if unset, print leading zeroes
; bit 6: if set, left-align the string (do not pad empty digits with spaces)
;        if unset, right-align the string
; bit 5: if set, print currency symbol at the beginning of the string
;        if unset, do not print the currency symbol
; bits 0-4: length of BCD number in bytes
; Note that bits 5 and 7 are modified during execution. The above reflects
; their meaning at the beginning of the functions's execution.
	ld b, c ; save flags in b
	res 7, c
	res 6, c
	res 5, c ; c now holds the length
	bit 5, b
	jr z, .loop
	bit 7, b
	jr nz, .loop
	ld [hl], "¥"
	inc hl
.loop
	ld a, [de]
	swap a
	call PrintBCDDigit ; print upper digit
	ld a, [de]
	call PrintBCDDigit ; print lower digit
	inc de
	dec c
	jr nz, .loop
	bit 7, b ; were any non-zero digits printed?
	jr z, .done ; if so, we are done
.numberEqualsZero ; if every digit of the BCD number is zero
	bit 6, b ; left or right alignment?
	jr nz, .skipRightAlignmentAdjustment
	dec hl ; if the string is right-aligned, it needs to be moved back one space
.skipRightAlignmentAdjustment
	bit 5, b
	jr z, .skipCurrencySymbol
	ld [hl], "¥" ; currency symbol
	inc hl
.skipCurrencySymbol
	ld [hl], "0"
	call PrintLetterDelay
	inc hl
.done
	ret
; 0x38f2

PrintBCDDigit:: ; 38f2
	and a, %00001111
	and a
	jr z, .zeroDigit
.nonzeroDigit
	bit 7, b ; have any non-space characters been printed?
	jr z, .outputDigit
; if bit 7 is set, then no numbers have been printed yet
	bit 5, b ; print the currency symbol?
	jr z, .skipCurrencySymbol
	ld [hl], "¥"
	inc hl
	res 5, b
.skipCurrencySymbol
	res 7, b ; unset 7 to indicate that a nonzero digit has been reached
.outputDigit
	add a, "0"
	ld [hli], a
	jp PrintLetterDelay
.zeroDigit
	bit 7, b ; either printing leading zeroes or already reached a nonzero digit?
	jr z, .outputDigit ; if so, print a zero digit
	bit 6, b ; left or right alignment?
	ret nz
	ld a, " "
	ld [hli], a ; if right-aligned, "print" a space by advancing the pointer
	ret
; 0x3917

GetPartyParamLocation:: ; 3917
; Get the location of parameter a from CurPartyMon in hl
	push bc
	ld hl, PartyMons
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [CurPartyMon]
	call GetPartyLocation
	pop bc
	ret
; 3927

GetPartyLocation:: ; 3927
; Add the length of a PartyMon struct to hl a times.
	ld bc, PartyMon2 - PartyMon1
	jp AddNTimes
; 392d


Function392d:: ; 392d
	push hl
	ld a, b
	dec a
	ld b, 0
	add hl, bc
	ld hl, BaseData + 0
	ld bc, $0020
	call AddNTimes
	ld a, BANK(BaseData)
	call GetFarHalfword
	ld b, l
	ld c, h
	pop hl
	ret
; 3945


INCLUDE "home/battle.asm"


Function3ae1:: ; 3ae1

GLOBAL BattleAnimations
GLOBAL BattleAnimCommands

	ld a, BANK(BattleAnimations)
	rst Bankswitch

	ld a, [hli]
	ld [BattleAnimAddress], a
	ld a, [hl]
	ld [BattleAnimAddress + 1], a

	ld a, BANK(BattleAnimCommands)
	rst Bankswitch

	ret
; 3af0

GetBattleAnimByte:: ; 3af0

	push hl
	push de

	ld hl, BattleAnimAddress
	ld e, [hl]
	inc hl
	ld d, [hl]

	ld a, BANK(BattleAnimations)
	rst Bankswitch

	ld a, [de]
	ld [BattleAnimByte], a
	inc de

	ld a, BANK(BattleAnimCommands)
	rst Bankswitch

	ld [hl], d
	dec hl
	ld [hl], e

	pop de
	pop hl

	ld a, [BattleAnimByte]
	ret
; 3b0c

Function3b0c:: ; 3b0c

	ld a, [hLCDStatCustom]
	and a
	ret z

	ld a, LYOverridesBackup % $100
	ld [Requested2bppSource], a
	ld a, LYOverridesBackup / $100
	ld [Requested2bppSource + 1], a

	ld a, LYOverrides % $100
	ld [Requested2bppDest], a
	ld a, LYOverrides / $100
	ld [Requested2bppDest + 1], a

	ld a, (LYOverridesEnd - LYOverrides) / 16
	ld [Requested2bpp], a
	ret
; 3b2a



Function3b2a:: ; 3b2a

	ld [wc3b8], a
	ld a, [hROMBank]
	push af

	ld a, BANK(Function8cfd6)
	rst Bankswitch
	ld a, [wc3b8]

	call Function8cfd6

	pop af
	rst Bankswitch

	ret
; 3b3c


Function3b3c:: ; 3b3c

	ld [wc3b8], a
	ld a, [hROMBank]
	push af

	ld a, BANK(Function8d120)
	rst Bankswitch
	ld a, [wc3b8]

	call Function8d120

	pop af
	rst Bankswitch

	ret
; 3b4e


INCLUDE "home/audio.asm"
INCLUDE "home/mobile.asm"


Function3eea:: ; 3eea
	push hl
	push bc
	ld de, AttrMap - TileMap
	add hl, de
rept 2
	inc b
endr
rept 2
	inc c
endr
	call Function3f35
	pop bc
	pop hl
	call Function3f47
	ret
; 3efd

Function3efd:: ; 3efd
	push hl
	hlcoord 0, 12
	ld b, 4
	ld c, 18
	call Function3f0d
	pop hl
	call PrintTextBoxText
	ret
; 3f0d

Function3f0d:: ; 3f0d
	push hl
	push bc
	ld de, AttrMap - TileMap
	add hl, de
rept 2
	inc b
endr
rept 2
	inc c
endr
	call Function3f35
	pop bc
	pop hl
	call TextBoxBorder
	ret
; 3f20

Function3f20:: ; 3f20
	ld hl, AttrMap
	ld b, $6
	ld c, $14
	call Function3f35
	ld hl, TileMap
	ld b, $4
	ld c, $12
	call Function3f47
	ret
; 3f35

Function3f35:: ; 3f35
	ld a, $6
	ld de, $0014
.asm_3f3a
	push bc
	push hl
.asm_3f3c
	ld [hli], a
	dec c
	jr nz, .asm_3f3c
	pop hl
	add hl, de
	pop bc
	dec b
	jr nz, .asm_3f3a
	ret
; 3f47

Function3f47:: ; 3f47
	push bc
	call Function3f58
	pop bc
.asm_3f4c
	push bc
	call Function3f68
	pop bc
	dec b
	jr nz, .asm_3f4c
	call Function3f60
	ret
; 3f58

Function3f58:: ; 3f58
	ld a, $63
	ld d, $62
	ld e, $64
	jr Function3f6e

Function3f60:: ; 3f60
	ld a, $68
	ld d, $67
	ld e, $69
	jr Function3f6e

Function3f68:: ; 3f68
	ld a, $7f
	ld d, $65
	ld e, $66

Function3f6e:: ; 3f6e
	push hl
	ld [hl], d
	inc hl
.asm_3f71
	ld [hli], a
	dec c
	jr nz, .asm_3f71
	ld [hl], e
	pop hl
	ld de, $0014
	add hl, de
	ret
; 3f7c

Function3f7c:: ; 3f7c
	call Function1cfd
	call Function1c53
	dec b
	dec c
	call Function3eea
	ret
; 3f88

Function3f88:: ; 3f88
	ld hl, w6_d000
	ld b, $0
.asm_3f8d
	push bc
	ld c, $8
.asm_3f90
	ld a, [de]
	inc de
	cpl
	ld [hl], $0
	inc hl
	ld [hli], a
	dec c
	jr nz, .asm_3f90
	pop bc
	dec c
	jr nz, .asm_3f8d
	ret
; 3f9f

Function3f9f:: ; 3f9f
	ld hl, w6_d000
.asm_3fa2
	push bc
	ld c, $8
.asm_3fa5
	ld a, [de]
rept 2
	inc de
endr
	cpl
	ld [hl], $0
	inc hl
	ld [hli], a
	dec c
	jr nz, .asm_3fa5
	pop bc
	dec c
	jr nz, .asm_3fa2
	ret
; 3fb5
