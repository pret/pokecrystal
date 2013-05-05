SECTION "bank0",HOME
SECTION "rst0",HOME[$0]
	di
	jp Start

SECTION "rst8",HOME[$8] ; FarCall
	jp FarJpHl

SECTION "rst10",HOME[$10] ; Bankswitch
	ld [hROMBank], a
	ld [MBC3RomBank], a
	ret

SECTION "rst18",HOME[$18] ; Unused
	rst $38

SECTION "rst20",HOME[$20] ; Unused
	rst $38

SECTION "rst28",HOME[$28] ; JumpTable
	push de
	ld e, a
	ld d, 00
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop de
	jp [hl] ; (actually jp hl)

; rst30 is midst rst28

SECTION "rst38",HOME[$38] ; Unused
	rst $38

SECTION "vblank",HOME[$40] ; vblank interrupt
	jp VBlank

SECTION "lcd",HOME[$48] ; lcd interrupt
	jp $0552

SECTION "timer",HOME[$50] ; timer interrupt
	jp $3e93

SECTION "serial",HOME[$58] ; serial interrupt
	jp $06ef

SECTION "joypad",HOME[$60] ; joypad interrupt
	jp JoypadInt

SECTION "romheader",HOME[$100]
Start:
	nop
	jp $016e

SECTION "start",HOME[$150]

INCBIN "baserom.gbc", $150, $283 - $150


VBlank: ; 283
INCLUDE "vblank.asm"


DelayFrame: ; 45a
; Wait for one frame
	ld a, 1
	ld [VBlankOccurred], a

; Wait for the next VBlank, halting to conserve battery
.halt
	halt ; rgbasm adds a nop after this instruction by default
	ld a, [VBlankOccurred]
	and a
	jr nz, .halt
	ret
; 468


DelayFrames: ; 468
; Wait c frames
	call DelayFrame
	dec c
	jr nz, DelayFrames
	ret
; 46f


RTC: ; 46f
; update time and time-sensitive palettes

; rtc enabled?
	ld a, [$c2ce]
	cp 0
	ret z
	
	call UpdateTime
	
; obj update on?
	ld a, [VramState]
	bit 0, a ; obj update
	ret z
	
; update palettes
	callab TimeOfDayPals
	ret
; 485


INCBIN "baserom.gbc", $485, $52f - $485


IncGradGBPalTable_01: ; 52f
	db %11111111 ; bgp
	db %11111111 ; obp1
	db %11111111 ; obp2
	             ; and so on...
	db %11111110
	db %11111110
	db %11111000

	db %11111001
	db %11100100
	db %11100100
	
	db %11100100
	db %11010000
	db %11100000
	
	db %11100100
	db %11010000
	db %11100000
	
	db %10010000
	db %10000000
	db %10010000
	
	db %01000000
	db %01000000
	db %01000000
	
	db %00000000
	db %00000000
	db %00000000
; 547


INCBIN "baserom.gbc", $547, $568 - $547


DisableLCD: ; 568
; Turn the LCD off
; Most of this is just going through the motions

; don't need to do anything if lcd is already off
	ld a, [rLCDC]
	bit 7, a ; lcd enable
	ret z
	
; reset ints
	xor a
	ld [rIF], a
	
; save enabled ints
	ld a, [rIE]
	ld b, a
	
; disable vblank
	res 0, a ; vblank
	ld [rIE], a
	
.wait
; wait until vblank
	ld a, [rLY]
	cp 145 ; >144 (ensure beginning of vblank)
	jr nz, .wait
	
; turn lcd off
	ld a, [rLCDC]
	and %01111111 ; lcd enable off
	ld [rLCDC], a
	
; reset ints
	xor a
	ld [rIF], a
	
; restore enabled ints
	ld a, b
	ld [rIE], a
	ret
; 58a


EnableLCD: ; 58a
	ld a, [rLCDC]
	set 7, a ; lcd enable
	ld [rLCDC], a
	ret
; 591


AskTimer: ; 591
	INCBIN "baserom.gbc", $591, $59c - $591
; 59c


LatchClock: ; 59c
; latch clock counter data
	ld a, 0
	ld [MBC3LatchClock], a
	ld a, 1
	ld [MBC3LatchClock], a
	ret
; 5a7


UpdateTime: ; 5a7
; get rtc data
	call GetClock
; condense days to one byte, update rtc w/ new day count
	call FixDays
; add game time to rtc time
	call FixTime
; update time of day (0 = morn, 1 = day, 2 = nite)
	callba GetTimeOfDay
	ret
; 5b7


GetClock: ; 5b7
; store clock data in hRTCDayHi-hRTCSeconds

; enable clock r/w
	ld a, SRAM_ENABLE
	ld [MBC3SRamEnable], a
	
; get clock data
; stored 'backwards' in hram
	
	call LatchClock
	ld hl, MBC3SRamBank
	ld de, MBC3RTC
	
; seconds
	ld [hl], RTC_S
	ld a, [de]
	and $3f
	ld [hRTCSeconds], a
; minutes
	ld [hl], RTC_M
	ld a, [de]
	and $3f
	ld [hRTCMinutes], a
; hours
	ld [hl], RTC_H
	ld a, [de]
	and $1f
	ld [hRTCHours], a
; day lo
	ld [hl], RTC_DL
	ld a, [de]
	ld [hRTCDayLo], a
; day hi
	ld [hl], RTC_DH
	ld a, [de]
	ld [hRTCDayHi], a
	
; cleanup
	call CloseSRAM ; unlatch clock, disable clock r/w
	ret
; 5e8


FixDays: ; 5e8
; fix day count
; mod by 140

; check if day count > 255 (bit 8 set)
	ld a, [hRTCDayHi] ; DH
	bit 0, a
	jr z, .daylo
; reset dh (bit 8)
	res 0, a
	ld [hRTCDayHi], a ; DH
	
; mod 140
; mod twice since bit 8 (DH) was set
	ld a, [hRTCDayLo] ; DL
.modh
	sub 140
	jr nc, .modh
.modl
	sub 140
	jr nc, .modl
	add 140
	
; update dl
	ld [hRTCDayLo], a ; DL

; unknown output
	ld a, $40 ; %1000000
	jr .set

.daylo
; quit if fewer than 140 days have passed
	ld a, [hRTCDayLo] ; DL
	cp 140
	jr c, .quit
	
; mod 140
.mod
	sub 140
	jr nc, .mod
	add 140
	
; update dl
	ld [hRTCDayLo], a ; DL
	
; unknown output
	ld a, $20 ; %100000
	
.set
; update clock with modded day value
	push af
	call SetClock
	pop af
	scf
	ret
	
.quit
	xor a
	ret
; 61d


FixTime: ; 61d
; add ingame time (set at newgame) to current time
;				  day     hr    min    sec
; store time in CurDay, hHours, hMinutes, hSeconds

; second
	ld a, [hRTCSeconds] ; S
	ld c, a
	ld a, [StartSecond]
	add c
	sub 60
	jr nc, .updatesec
	add 60
.updatesec
	ld [hSeconds], a
	
; minute
	ccf ; carry is set, so turn it off
	ld a, [hRTCMinutes] ; M
	ld c, a
	ld a, [StartMinute]
	adc c
	sub 60
	jr nc, .updatemin
	add 60
.updatemin
	ld [hMinutes], a
	
; hour
	ccf ; carry is set, so turn it off
	ld a, [hRTCHours] ; H
	ld c, a
	ld a, [StartHour]
	adc c
	sub 24
	jr nc, .updatehr
	add 24
.updatehr
	ld [hHours], a
	
; day
	ccf ; carry is set, so turn it off
	ld a, [hRTCDayLo] ; DL
	ld c, a
	ld a, [StartDay]
	adc c
	ld [CurDay], a
	ret
; 658

INCBIN "baserom.gbc", $658, $691 - $658

SetClock: ; 691
; set clock data from hram

; enable clock r/w
	ld a, SRAM_ENABLE
	ld [MBC3SRamEnable], a
	
; set clock data
; stored 'backwards' in hram

	call LatchClock
	ld hl, MBC3SRamBank
	ld de, MBC3RTC
	
; seems to be a halt check that got partially commented out
; this block is totally pointless
	ld [hl], RTC_DH
	ld a, [de]
	bit 6, a ; halt
	ld [de], a
	
; seconds
	ld [hl], RTC_S
	ld a, [hRTCSeconds]
	ld [de], a
; minutes
	ld [hl], RTC_M
	ld a, [hRTCMinutes]
	ld [de], a
; hours
	ld [hl], RTC_H
	ld a, [hRTCHours]
	ld [de], a
; day lo
	ld [hl], RTC_DL
	ld a, [hRTCDayLo]
	ld [de], a
; day hi
	ld [hl], RTC_DH
	ld a, [hRTCDayHi]
	res 6, a ; make sure timer is active
	ld [de], a
	
; cleanup
	call CloseSRAM ; unlatch clock, disable clock r/w
	ret
; 6c4

INCBIN "baserom.gbc", $6c4, $92e - $6c4


INCLUDE "joypad.asm"


INCBIN "baserom.gbc", $a1b, $b40 - $a1b

FarDecompress: ; b40
; Decompress graphics data at a:hl to de

; put a away for a sec
	ld [$c2c4], a
; save bank
	ld a, [hROMBank]
	push af
; bankswitch
	ld a, [$c2c4]
	rst Bankswitch
	
; what we came here for
	call Decompress
	
; restore bank
	pop af
	rst Bankswitch
	ret
; b50


Decompress: ; b50
; Pokemon Crystal uses an lz variant for compression.

; This is mainly used for graphics, but the intro's
; tilemaps also use this compression.

; This function decompresses lz-compressed data at hl to de.


; Basic rundown:

;	A typical control command consists of:
;		-the command (bits 5-7)
;		-the count (bits 0-4)
;		-and any additional params

;	$ff is used as a terminator.


;	Commands:

;		0: literal
;			literal data for some number of bytes
;		1: iterate
;			one byte repeated for some number of bytes
;		2: alternate
;			two bytes alternated for some number of bytes
;		3: zero (whitespace)
;			0x00 repeated for some number of bytes

;	Repeater control commands have a signed parameter used to determine the start point.
;	Wraparound is simulated:
;		Positive values are added to the start address of the decompressed data
;		and negative values are subtracted from the current position.

;		4: repeat
;			repeat some number of bytes from decompressed data
;		5: flipped
;			repeat some number of flipped bytes from decompressed data
;			ex: $ad = %10101101 -> %10110101 = $b5
;		6: reverse
;			repeat some number of bytes in reverse from decompressed data

;	If the value in the count needs to be larger than 5 bits,
;	control code 7 can be used to expand the count to 10 bits.

;		A new control command is read in bits 2-4.
;		The new 10-bit count is split:
;			bits 0-1 contain the top 2 bits
;			another byte is added containing the latter 8

;		So, the structure of the control command becomes:
;			111xxxyy yyyyyyyy
;			 |  |  |    |
;            |  | our new count
;            | the control command for this count
;            7 (this command)

; For more information, refer to the code below and in extras/gfx.py .

; save starting output address
	ld a, e
	ld [$c2c2], a
	ld a, d
	ld [$c2c3], a
	
.loop
; get next byte
	ld a, [hl]
; done?
	cp $ff ; end
	ret z

; get control code
	and %11100000
	
; 10-bit param?
	cp $e0 ; LZ_HI
	jr nz, .normal
	
	
; 10-bit param:

; get next 3 bits (%00011100)
	ld a, [hl]
	add a
	add a ; << 3
	add a
	
; this is our new control code
	and %11100000
	push af
	
; get param hi
	ld a, [hli]
	and %00000011
	ld b, a
	
; get param lo
	ld a, [hli]
	ld c, a
	
; read at least 1 byte
	inc bc
	jr .readers
	
	
.normal
; push control code
	push af
; get param
	ld a, [hli]
	and %00011111
	ld c, a
	ld b, $0
; read at least 1 byte
	inc c
	
.readers
; let's get started

; inc loop counts since we bail as soon as they hit 0
	inc b
	inc c
	
; get control code
	pop af
; command type
	bit 7, a ; 80, a0, c0
	jr nz, .repeatertype
	
; literals
	cp $20 ; LZ_ITER
	jr z, .iter
	cp $40 ; LZ_ALT
	jr z, .alt
	cp $60 ; LZ_ZERO
	jr z, .zero
	; else $00
	
; 00 ; LZ_LIT
; literal data for bc bytes
.loop1
; done?
	dec c
	jr nz, .next1
	dec b
	jp z, .loop
	
.next1
	ld a, [hli]
	ld [de], a
	inc de
	jr .loop1
	
	
; 20 ; LZ_ITER
; write byte for bc bytes
.iter
	ld a, [hli]
	
.iterloop
	dec c
	jr nz, .iternext
	dec b
	jp z, .loop
	
.iternext
	ld [de], a
	inc de
	jr .iterloop
	
	
; 40 ; LZ_ALT
; alternate two bytes for bc bytes

; next pair
.alt
; done?
	dec c
	jr nz, .alt0
	dec b
	jp z, .altclose0
	
; alternate for bc
.alt0
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .alt1
; done?
	dec b
	jp z, .altclose1
.alt1
	ld a, [hld]
	ld [de], a
	inc de
	jr .alt
	
; skip past the bytes we were alternating
.altclose0
	inc hl
.altclose1
	inc hl
	jr .loop
	
	
; 60 ; LZ_ZERO
; write 00 for bc bytes
.zero
	xor a
	
.zeroloop
	dec c
	jr nz, .zeronext
	dec b
	jp z, .loop
	
.zeronext
	ld [de], a
	inc de
	jr .zeroloop
	
	
; repeats
; 80, a0, c0
; repeat decompressed data from output
.repeatertype
	push hl
	push af
; get next byte
	ld a, [hli]
; absolute?
	bit 7, a
	jr z, .absolute
	
; relative
; a = -a
	and %01111111 ; forget the bit we just looked at
	cpl
; add de (current output address)
	add e
	ld l, a
	ld a, $ff ; -1
	adc d
	ld h, a
	jr .repeaters
	
.absolute
; get next byte (lo)
	ld l, [hl]
; last byte (hi)
	ld h, a
; add starting output address
	ld a, [$c2c2]
	add l
	ld l, a
	ld a, [$c2c3]
	adc h
	ld h, a
	
.repeaters
	pop af
	cp $80 ; LZ_REPEAT
	jr z, .repeat
	cp $a0 ; LZ_FLIP
	jr z, .flip
	cp $c0 ; LZ_REVERSE
	jr z, .reverse
	
; e0 -> 80
	
; 80 ; LZ_REPEAT
; repeat some decompressed data
.repeat
; done?
	dec c
	jr nz, .repeatnext
	dec b
	jr z, .cleanup
	
.repeatnext
	ld a, [hli]
	ld [de], a
	inc de
	jr .repeat
	
	
; a0 ; LZ_FLIP
; repeat some decompressed data w/ flipped bit order
.flip
	dec c
	jr nz, .flipnext
	dec b
	jp z, .cleanup
	
.flipnext
	ld a, [hli]
	push bc
	ld bc, $0008
	
.fliploop
	rra
	rl b
	dec c
	jr nz, .fliploop
	ld a, b
	pop bc
	ld [de], a
	inc de
	jr .flip
	
	
; c0 ; LZ_REVERSE
; repeat some decompressed data in reverse
.reverse
	dec c
	jr nz, .reversenext
	
	dec b
	jp z, .cleanup
	
.reversenext
	ld a, [hld]
	ld [de], a
	inc de
	jr .reverse
	
	
.cleanup
; get type of repeat we just used
	pop hl
; was it relative or absolute?
	bit 7, [hl]
	jr nz, .next

; skip two bytes for absolute
	inc hl
; skip one byte for relative
.next
	inc hl
	jp .loop
; c2f




UpdatePalsIfCGB: ; c2f
; update bgp data from BGPals
; update obp data from OBPals
; return carry if successful

; check cgb
	ld a, [hCGB]
	and a
	ret z


UpdateCGBPals: ; c33
; return carry if successful
; any pals to update?
	ld a, [hCGBPalUpdate]
	and a
	ret z


ForceUpdateCGBPals: ; c37

	ld a, [rSVBK]
	push af
	ld a, 5 ; BANK(BGPals)
	ld [rSVBK], a

	ld hl, BGPals ; 5:d080

; copy 8 pals to bgpd
	ld a, %10000000 ; auto increment, index 0
	ld [rBGPI], a
	ld c, rBGPD % $100
	ld b, 4 ; NUM_PALS / 2
.bgp
	rept $10
	ld a, [hli]
	ld [$ff00+c], a
	endr

	dec b
	jr nz, .bgp
	
; hl is now 5:d0c0 OBPals
	
; copy 8 pals to obpd
	ld a, %10000000 ; auto increment, index 0
	ld [rOBPI], a
	ld c, rOBPD - rJOYP
	ld b, 4 ; NUM_PALS / 2
.obp
	rept $10
	ld a, [hli]
	ld [$ff00+c], a
	endr

	dec b
	jr nz, .obp
	
	pop af
	ld [rSVBK], a

; clear pal update queue
	xor a
	ld [hCGBPalUpdate], a

	scf
	ret
; c9f


DmgToCgbBGPals: ; c9f
; exists to forego reinserting cgb-converted image data

; input: a -> bgp

	ld [rBGP], a
	push af

	ld a, [hCGB]
	and a
	jr z, .end

	push hl
	push de
	push bc
	ld a, [rSVBK]
	push af

	ld a, 5
	ld [rSVBK], a

; copy & reorder bg pal buffer
	ld hl, BGPals ; to
	ld de, Unkn1Pals ; from
; order
	ld a, [rBGP]
	ld b, a
; all pals
	ld c, 8
	call CopyPals
; request pal update
	ld a, 1
	ld [hCGBPalUpdate], a

	pop af
	ld [rSVBK], a
	pop bc
	pop de
	pop hl
.end
	pop af
	ret
; ccb


DmgToCgbObjPals: ; ccb
; exists to forego reinserting cgb-converted image data

; input: d -> obp1
;        e -> obp2

	ld a, e
	ld [rOBP0], a
	ld a, d
	ld [rOBP1], a
	
	ld a, [hCGB]
	and a
	ret z

	push hl
	push de
	push bc
	ld a, [rSVBK]
	push af

	ld a, 5
	ld [rSVBK], a

; copy & reorder obj pal buffer
	ld hl, OBPals ; to
	ld de, Unkn2Pals ; from
; order
	ld a, [rOBP0]
	ld b, a
; all pals
	ld c, 8
	call CopyPals
; request pal update
	ld a, 1
	ld [hCGBPalUpdate], a

	pop af
	ld [rSVBK], a
	pop bc
	pop de
	pop hl
	ret
; cf8


INCBIN "baserom.gbc", $cf8, $d50 - $cf8


CopyPals: ; d50
; copy c palettes in order b from de to hl

	push bc
	ld c, 4 ; NUM_PAL_COLORS
.loop
	push de
	push hl
	
; get pal color
	ld a, b
	and %11 ; color
; 2 bytes per color
	add a
	ld l, a
	ld h, $0
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	
; dest
	pop hl
; write color
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
; next pal color
	srl b
	srl b
; source
	pop de
; done pal?
	dec c
	jr nz, .loop
	
; de += 8 (next pal)
	ld a, 8 ; NUM_PAL_COLORS * 2 ; bytes per pal
	add e
	jr nc, .ok
	inc d
.ok
	ld e, a
	
; how many more pals?
	pop bc
	dec c
	jr nz, CopyPals
	ret
; d79


INCBIN "baserom.gbc", $d79, $e8d - $d79


FarCopyBytes: ; e8d
; copy bc bytes from a:hl to de

	ld [hBuffer], a
	ld a, [hROMBank]
	push af
	ld a, [hBuffer]
	rst Bankswitch

	call CopyBytes

	pop af
	rst Bankswitch
	ret
; 0xe9b


FarCopyBytesDouble: ; e9b
; Copy bc bytes from a:hl to bc*2 bytes at de,
; doubling each byte in the process.

	ld [hBuffer], a
	ld a, [hROMBank]
	push af
	ld a, [hBuffer]
	rst Bankswitch

; switcheroo, de <> hl
	ld a, h
	ld h, d
	ld d, a
	ld a, l
	ld l, e
	ld e, a

	inc b
	inc c
	jr .dec

.loop
	ld a, [de]
	inc de
	ld [hli], a
	ld [hli], a
.dec
	dec c
	jr nz, .loop
	dec b
	jr nz, .loop

	pop af
	rst Bankswitch
	ret
; 0xeba


INCBIN "baserom.gbc", $eba, $fb6 - $eba


ClearBox: ; fb6
; Fill a c*b box at hl with blank tiles.

	ld a, " "
.y
	push bc
	push hl
.x
	ld [hli], a
	dec c
	jr nz, .x
	pop hl
	ld bc, 20 ; screen width
	add hl, bc
	pop bc
	dec b
	jr nz, .y
	ret
; fc8


ClearTileMap: ; fc8
; Fill TileMap with blank tiles.

	ld hl, TileMap
	ld a, " "
	ld bc, 360 ; screen dimensions 20*18
	call ByteFill
	
; We aren't done if the LCD is on.
	ld a, [rLCDC]
	bit 7, a
	ret z
	jp WaitBGMap
; fdb


INCBIN "baserom.gbc", $fdb, $fe8 - $fdb


TextBox: ; fe8
; draw a text box of given location/size
; ? hl
; size bc
; ? de

; draw border
	push bc
	push hl
	call TextBoxBorder
	pop hl
	pop bc
; fill textbox area with palette 7
	jr TextBoxPalette
; ff1


TextBoxBorder: ; ff1
; draw a text box
; upper-left corner at coordinates hl
; height b
; width c

	; first row
	push hl
	ld a, "┌"
	ld [hli], a
	inc a    ; horizontal border ─
	call NPlaceChar
	inc a    ; upper-right border ┐
	ld [hl], a

	; middle rows
	pop hl
	ld de, 20
	add hl, de ; skip the top row

.PlaceRow\@
	push hl
	ld a, "│"
	ld [hli], a
	ld a, " "
	call NPlaceChar
	ld [hl], "│"

	pop hl
	ld de, 20
	add hl, de ; move to next row
	dec b
	jr nz, .PlaceRow\@

	; bottom row
	ld a, "└"
	ld [hli], a
	ld a, "─"
	call NPlaceChar
	ld [hl], "┘"
	ret
; 101e


NPlaceChar: ; 101e
; place a row of width c of identical characters
	ld d,c
.loop\@
	ld [hli],a
	dec d
	jr nz,.loop\@
	ret
; 1024


TextBoxPalette: ; 1024
; fill textbox area with pal 07
; hl: tile address
; b: height
; c: width
	ld de, AttrMap - TileMap
	add hl, de
	inc b
	inc b
	inc c
	inc c
	ld a, $07 ; palette
.gotoy
	push bc
	push hl
.gotox
	ld [hli], a
	dec c
	jr nz, .gotox
	pop hl
	ld de, $0014 ; screen width in tiles (20)
	add hl, de
	pop bc
	dec b
	jr nz, .gotoy
	ret
; 103e


SpeechTextBox: ; 103e
; Standard textbox.
	ld hl, $c590 ; tile 0, 12
	ld b, $4 ; height
	ld c, $12 ; width ; SCREEN_WIDTH - 2 (border)
	jp TextBox
; 1048


INCBIN "baserom.gbc", $1048, $1065 - $1048


PrintTextBoxText: ; 1065
	ld bc, $c5b9 ; TileMap(1,14)
	call $13e5 ; PrintText
	ret
; 106c


INCBIN "baserom.gbc", $106c, $1078 - $106c


PlaceString: ; 1078
	push hl

PlaceNextChar: ; 1079
	ld a, [de]
	cp "@"
	jr nz, CheckDict
	ld b, h
	ld c, l
	pop hl
	ret
	pop de

NextChar: ; 1083
	inc de
	jp PlaceNextChar

CheckDict: ; 1087
	cp $15
	jp z, $117b
	cp $4f
	jp z, $12ea
	cp $4e
	jp z, $12a7
	cp $16
	jp z, $12b9
	and a
	jp z, $1383
	cp $4c
	jp z, $1337
	cp $4b
	jp z, $131f
	cp $51 ; Player name
	jp z, $12f2
	cp $49
	jp z, $1186
	cp $52 ; Mother name
	jp z, $118d
	cp $53
	jp z, $1194
	cp $35
	jp z, $11e8
	cp $36
	jp z, $11ef
	cp $37
	jp z, $11f6
	cp $38
	jp z, $119b
	cp $39
	jp z, $11a2
	cp $54
	jp z, $11c5
	cp $5b
	jp z, $11b7
	cp $5e
	jp z, $11be
	cp $5c
	jp z, $11b0
	cp $5d
	jp z, $11a9
	cp $23
	jp z, $11cc
	cp $22
	jp z, $12b0
	cp $55
	jp z, $1345
	cp $56
	jp z, $11d3
	cp $57
	jp z, $137c
	cp $58
	jp z, $135a
	cp $4a
	jp z, $11da
	cp $24
	jp z, $11e1
	cp $25
	jp z, NextChar
	cp $1f
	jr nz, .asm_1122
	ld a, $7f
.asm_1122
	cp $5f
	jp z, Char5F
	cp $59
	jp z, $11fd
	cp $5a
	jp z, $1203
	cp $3f
	jp z, $121b
	cp $14
	jp z, $1252
	cp $e4
	jr z, .asm_1174 ; 0x113d $35
	cp $e5
	jr z, .asm_1174 ; 0x1141 $31
	jr .asm_114c ; 0x1143 $7
	ld b, a
	call $13c6
	jp NextChar
.asm_114c
	cp $60
	jr nc, .asm_1174 ; 0x114e $24
	cp $40
	jr nc, .asm_1165 ; 0x1152 $11
	cp $20
	jr nc, .asm_115c ; 0x1156 $4
	add $80
	jr .asm_115e ; 0x115a $2
.asm_115c
	add $90
.asm_115e
	ld b, $e5
	call $13c6
	jr .asm_1174 ; 0x1163 $f
.asm_1165
	cp $44
	jr nc, .asm_116d ; 0x1167 $4
	add $59
	jr .asm_116f ; 0x116b $2
.asm_116d
	add $86
.asm_116f
	ld b, $e4
	call $13c6
.asm_1174
	ld [hli], a
	call PrintLetterDelay
	jp NextChar
; 0x117b


INCBIN "baserom.gbc", $117b, $1203 - $117b


Char5D:
	ld a, [hBattleTurn]
	push de
	and a
	jr nz, .asm_120e ; 0x1207 $5
	ld de, $c621
	jr .asm_126a ; 0x120c $5c
.asm_120e
	ld de, Char5AText ; Enemy
	call $1078
	ld h, b
	ld l, c
	ld de, $c616
	jr .asm_126a ; 0x1219 $4f
	push de
	ld a, [InLinkBattle]
	and a
	jr nz, .linkbattle
	ld a, [$d233]
	cp $9
	jr z, .asm_1248 ; 0x1227 $1f
	cp $2a
	jr z, .asm_1248 ; 0x122b $1b
	ld de, $c656
	call $1078
	ld h, b
	ld l, c
	ld de, $12a2
	call $1078
	push bc
	ld hl, $5939
	ld a, $e
	rst FarCall
	pop hl
	ld de, StringBuffer1
	jr .asm_126a ; 0x1246 $22
.asm_1248
	ld de, $d493
	jr .asm_126a ; 0x124b $1d
.linkbattle
	ld de, $c656
	jr .asm_126a ; 0x1250 $18
	push de
	ld de, PlayerName
	call $1078
	ld h, b
	ld l, c
	ld a, [$d472]
	bit 0, a
	ld de, $12a5
	jr z, .asm_126a ; 0x1263 $5
	ld de, $12a6
	jr .asm_126a ; 0x1268 $0
.asm_126a
	call $1078
	ld h, b
	ld l, c
	pop de
	jp $1083
; 0x1273


Char5CText: ; 0x1273
	db "TM@"
Char5DText: ; 0x1276
	db "TRAINER@"
Char5BText: ; 0x127e
	db "PC@"

INCBIN "baserom.gbc", $1281, $1293 - $1281

Char56Text: ; 0x1293
	db "…@"
Char5AText: ; 0x1295
	db "Enemy @"

INCBIN "baserom.gbc", $129c, $1356 - $129c

Char5F: ; 0x1356
; ends a Pokédex entry
	ld [hl],"."
	pop hl
	ret

INCBIN "baserom.gbc", $135a, $15d8 - $135a

DMATransfer: ; 15d8
; DMA transfer
; return carry if successful

; anything to transfer?
	ld a, [hDMATransfer]
	and a
	ret z
; start transfer
	ld [rHDMA5], a
; indicate that transfer has occurred
	xor a
	ld [hDMATransfer], a
; successful transfer
	scf
	ret
; 15e3


UpdateBGMapBuffer: ; 15e3
; write [$ffdc] 16x8 tiles from BGMapBuffer to bg map addresses in BGMapBufferPtrs
; [$ffdc] must be even since this is done in 16x16 blocks

; return carry if successful

; any tiles to update?
	ld a, [hBGMapUpdate]
	and a
	ret z
; save wram bank
	ld a, [rVBK]
	push af
; save sp
	ld [hSPBuffer], sp
	
; temp stack
	ld hl, BGMapBufferPtrs
	ld sp, hl
; we can now pop the addresses of affected spots in bg map
	
; get pal and tile buffers
	ld hl, BGMapPalBuffer
	ld de, BGMapBuffer

.loop
; draw one 16x16 block

; top half:

; get bg map address
	pop bc
; update palettes
	ld a, $1
	ld [rVBK], a
; tile 1
	ld a, [hli]
	ld [bc], a
	inc c
; tile 2
	ld a, [hli]
	ld [bc], a
	dec c
; update tiles
	ld a, $0
	ld [rVBK], a
; tile 1
	ld a, [de]
	inc de
	ld [bc], a
	inc c
; tile 2
	ld a, [de]
	inc de
	ld [bc], a
	
; bottom half:

; get bg map address
	pop bc
; update palettes
	ld a, $1
	ld [rVBK], a
; tile 1
	ld a, [hli]
	ld [bc], a
	inc c
; tile 2
	ld a, [hli]
	ld [bc], a
	dec c
; update tiles
	ld a, $0
	ld [rVBK], a
; tile 1
	ld a, [de]
	inc de
	ld [bc], a
	inc c
; tile 2
	ld a, [de]
	inc de
	ld [bc], a
	
; we've done 2 16x8 blocks
	ld a, [$ffdc]
	dec a
	dec a
	ld [$ffdc], a
	
; if there are more left, get the next 16x16 block
	jr nz, .loop
	
	
; restore sp
	ld a, [hSPBuffer]
	ld l, a
	ld a, [$ffda]
	ld h, a
	ld sp, hl
	
; restore vram bank
	pop af
	ld [rVBK], a
	
; we don't need to update bg map until new tiles are loaded
	xor a
	ld [hBGMapUpdate], a
	
; successfully updated bg map
	scf
	ret
; 163a


WaitTop: ; 163a
	ld a, [hBGMapMode]
	and a
	ret z
	
; wait until top third of bg map can be updated
	ld a, [hBGMapThird]
	and a
	jr z, .quit
	
	call DelayFrame
	jr WaitTop
	
.quit
	xor a
	ld [hBGMapMode], a
	ret
; 164c


UpdateBGMap: ; 164c
; get mode
	ld a, [hBGMapMode]
	and a
	ret z
	
; don't save bg map address
	dec a ; 1
	jr z, .tiles
	dec a ; 2
	jr z, .attr
	dec a ; ?
	
; save bg map address
	ld a, [hBGMapAddress]
	ld l, a
	ld a, [$ffd7]
	ld h, a
	push hl

; bg map 1 ($9c00)
	xor a
	ld [hBGMapAddress], a
	ld a, $9c
	ld [$ffd7], a
	
; get mode again
	ld a, [hBGMapMode]
	push af
	cp 3
	call z, .tiles
	pop af
	cp 4
	call z, .attr
	
; restore bg map address
	pop hl
	ld a, l
	ld [hBGMapAddress], a
	ld a, h
	ld [$ffd7], a
	ret
	
.attr
; switch vram banks
	ld a, 1
	ld [rVBK], a
; bg map 1
	ld hl, AttrMap
	call .getthird
; restore vram bank
	ld a, 0
	ld [rVBK], a
	ret
	
.tiles
; bg map 0
	ld hl, TileMap
	
.getthird
; save sp
	ld [hSPBuffer], sp
	
; # tiles to move down * 6 (which third?)
	ld a, [hBGMapThird]
	and a ; 0
	jr z, .top
	dec a ; 1
	jr z, .middle

; .bottom ; 2
; move 12 tiles down
	ld de, $00f0 ; TileMap(0,12) - TileMap
	add hl, de
; stack now points to source
	ld sp, hl
; get bg map address
	ld a, [$ffd7]
	ld h, a
	ld a, [hBGMapAddress]
	ld l, a
; move 12 tiles down
	ld de, $0180 ; bgm(0,12)
	add hl, de
; start at top next time
	xor a
	jr .start
	
.middle
; move 6 tiles down
	ld de, $0078 ; TileMap(0,6) - TileMap
	add hl, de
; stack now points to source
	ld sp, hl
; get bg map address
	ld a, [$ffd7]
	ld h, a
	ld a, [hBGMapAddress]
	ld l, a
; move 6 tiles down
	ld de, $00c0 ; bgm(0,6)
	add hl, de
; start at bottom next time
	ld a, 2
	jr .start
	
.top
; stack now points to source
	ld sp, hl
; get bg map address
	ld a, [$ffd7]
	ld h, a
	ld a, [hBGMapAddress]
	ld l, a
; start at middle next time
	ld a, 1
	
.start
; which third to draw next update
	ld [hBGMapThird], a
; # rows per third
	ld a, 6 ; SCREEN_HEIGHT / 3
; # tiles from the edge of the screen to the next row
	ld bc, $000d ; BG_WIDTH + 1 - SCREEN_WIDTH
	
.row
; write a row of 20 tiles
	pop de
	ld [hl], e
	inc l
	ld [hl], d
	inc l
	pop de
	ld [hl], e
	inc l
	ld [hl], d
	inc l
	pop de
	ld [hl], e
	inc l
	ld [hl], d
	inc l
	pop de
	ld [hl], e
	inc l
	ld [hl], d
	inc l
	pop de
	ld [hl], e
	inc l
	ld [hl], d
	inc l
	pop de
	ld [hl], e
	inc l
	ld [hl], d
	inc l
	pop de
	ld [hl], e
	inc l
	ld [hl], d
	inc l
	pop de
	ld [hl], e
	inc l
	ld [hl], d
	inc l
	pop de
	ld [hl], e
	inc l
	ld [hl], d
	inc l
	pop de
	ld [hl], e
	inc l
	ld [hl], d
; next row
	add hl, bc
; done?
	dec a
	jr nz, .row
	
; restore sp
	ld a, [hSPBuffer]
	ld l, a
	ld a, [$ffda]
	ld h, a
	ld sp, hl
	ret
; 170a


SafeLoadTiles2: ; 170a
; only execute during first fifth of vblank
; any tiles to draw?
	ld a, [$cf6c]
	and a
	ret z
; abort if too far into vblank
	ld a, [rLY]
; ly = 144-145?
	cp 144
	ret c
	cp 146
	ret nc
	
GetTiles2: ; 1717
; load [$cf6c] tiles from [$cf6d-e] to [$cf6f-70]
; save sp
	ld [hSPBuffer], sp
	
; sp = [$cf6d-e] tile source
	ld hl, $cf6d
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld sp, hl
	
; hl = [$cf6f-70] tile dest
	ld hl, $cf6f
	ld a, [hli]
	ld h, [hl]
	ld l, a
	
; # tiles to draw
	ld a, [$cf6c]
	ld b, a
	
; clear tile queue
	xor a
	ld [$cf6c], a
	
.loop
; put 1 tile (16 bytes) into hl from sp
	pop de
	ld [hl], e
	inc l
	ld [hl], e
	inc l
	ld [hl], d
	inc l
	ld [hl], d
	inc l
	pop de
	ld [hl], e
	inc l
	ld [hl], e
	inc l
	ld [hl], d
	inc l
	ld [hl], d
	inc l
	pop de
	ld [hl], e
	inc l
	ld [hl], e
	inc l
	ld [hl], d
	inc l
	ld [hl], d
	inc l
	pop de
	ld [hl], e
	inc l
	ld [hl], e
	inc l
	ld [hl], d
	inc l
	ld [hl], d
; next tile
	inc hl
; done?
	dec b
	jr nz, .loop
	
; update $cf6f-70
	ld a, l
	ld [$cf6f], a
	ld a, h
	ld [$cf70], a
	
; update $cf6d-e
	ld [$cf6d], sp
	
; restore sp
	ld a, [hSPBuffer]
	ld l, a
	ld a, [$ffda]
	ld h, a
	ld sp, hl
	ret
; 1769


SafeLoadTiles: ; 1769
; only execute during first fifth of vblank
; any tiles to draw?
	ld a, [$cf67]
	and a
	ret z
; abort if too far into vblank
	ld a, [rLY]
; ly = 144-145?
	cp 144
	ret c
	cp 146
	ret nc
	jr GetTiles
	
LoadTiles: ; 1778
; use only if time is allotted
; any tiles to draw?
	ld a, [$cf67]
	and a
	ret z
; get tiles
	
GetTiles: ; 177d
; load [$cf67] tiles from [$cf68-9] to [$cf6a-b]

; save sp
	ld [hSPBuffer], sp
	
; sp = [$cf68-9] tile source
	ld hl, $cf68
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld sp, hl
	
; hl = [$cf6a-b] tile dest
	ld hl, $cf6a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	
; # tiles to draw
	ld a, [$cf67]
	ld b, a
; clear tile queue
	xor a
	ld [$cf67], a
	
.loop
; put 1 tile (16 bytes) into hl from sp
	pop de
	ld [hl], e
	inc l
	ld [hl], d
	inc l
	pop de
	ld [hl], e
	inc l
	ld [hl], d
	inc l
	pop de
	ld [hl], e
	inc l
	ld [hl], d
	inc l
	pop de
	ld [hl], e
	inc l
	ld [hl], d
	inc l
	pop de
	ld [hl], e
	inc l
	ld [hl], d
	inc l
	pop de
	ld [hl], e
	inc l
	ld [hl], d
	inc l
	pop de
	ld [hl], e
	inc l
	ld [hl], d
	inc l
	pop de
	ld [hl], e
	inc l
	ld [hl], d
; next tile
	inc hl
; done?
	dec b
	jr nz, .loop
	
; update $cf6a-b
	ld a, l
	ld [$cf6a], a
	ld a, h
	ld [$cf6b], a
	
; update $cf68-9
	ld [$cf68], sp
	
; restore sp
	ld a, [hSPBuffer]
	ld l, a
	ld a, [$ffda]
	ld h, a
	ld sp, hl
	ret
; 17d3


SafeTileAnimation: ; 17d3
; call from vblank

	ld a, [$ffde]
	and a
	ret z
	
; abort if too far into vblank
	ld a, [rLY]
; ret unless ly = 144-150
	cp 144
	ret c
	cp 151
	ret nc
	
; save affected banks
; switch to new banks
	ld a, [hROMBank]
	push af ; save bank
	ld a, BANK(DoTileAnimation)
	rst Bankswitch ; bankswitch

	ld a, [rSVBK]
	push af ; save wram bank
	ld a, $1 ; wram bank 1
	ld [rSVBK], a

	ld a, [rVBK]
	push af ; save vram bank
	ld a, $0 ; vram bank 0
	ld [rVBK], a
	
; take care of tile animation queue
	call DoTileAnimation
	
; restore affected banks
	pop af
	ld [rVBK], a
	pop af
	ld [rSVBK], a
	pop af
	rst Bankswitch ; bankswitch
	ret
; 17ff

INCBIN "baserom.gbc", $17ff, $185d - $17ff

GetTileType: ; 185d
; checks the properties of a tile
; input: a = tile id
	push de
	push hl
	ld hl, TileTypeTable
	ld e, a
	ld d, $00
	add hl, de
	ld a, [hROMBank] ; current bank
	push af
	ld a, BANK(TileTypeTable)
	rst Bankswitch
	ld e, [hl] ; get tile type
	pop af
	rst Bankswitch ; return to current bank
	ld a, e
	and a, $0f ; lo nybble only
	pop hl
	pop de
	ret
; 1875

INCBIN "baserom.gbc", $1875, $2063 - $1875

AskSerial: ; 2063
; send out a handshake while serial int is off
	ld a, [$c2d4]
	bit 0, a
	ret z
	
	ld a, [$c2d5]
	and a
	ret nz
	
; once every 6 frames
	ld hl, $ca8a
	inc [hl]
	ld a, [hl]
	cp 6
	ret c
	
	xor a
	ld [hl], a
	
	ld a, $c
	ld [$c2d5], a
	
; handshake
	ld a, $88
	ld [rSB], a
	
; switch to internal clock
	ld a, %00000001
	ld [rSC], a
	
; start transfer
	ld a, %10000001
	ld [rSC], a
	
	ret
; 208a

INCBIN "baserom.gbc", $208a, $209e - $208a

GameTimer: ; 209e
; precautionary
	nop
	
; save wram bank
	ld a, [rSVBK]
	push af
	
	ld a, $1
	ld [rSVBK], a
	
	call UpdateGameTimer
	
; restore wram bank
	pop af
	ld [rSVBK], a
	ret
; 20ad


UpdateGameTimer: ; 20ad
; increment the game timer by one frame
; capped at 999:59:59.00 after exactly 1000 hours

; pause game update?
	ld a, [$c2cd]
	and a
	ret nz
	
; game timer paused?
	ld hl, GameTimerPause
	bit 0, [hl]
	ret z
	
; reached cap? (999:00:00.00)
	ld hl, GameTimeCap
	bit 0, [hl]
	ret nz
	
; increment frame counter
	ld hl, GameTimeFrames ; frame counter
	ld a, [hl]
	inc a

; reached 1 second?
	cp 60 ; frames/second
	jr nc, .second ; 20c5 $2
	
; update frame counter
	ld [hl], a
	ret
	
.second
; reset frame counter
	xor a
	ld [hl], a
	
; increment second counter
	ld hl, GameTimeSeconds
	ld a, [hl]
	inc a
	
; reached 1 minute?
	cp 60 ; seconds/minute
	jr nc, .minute
	
; update second counter
	ld [hl], a
	ret
	
.minute
; reset second counter
	xor a
	ld [hl], a
	
; increment minute counter
	ld hl, GameTimeMinutes
	ld a, [hl]
	inc a
	
; reached 1 hour?
	cp 60 ; minutes/hour
	jr nc, .hour
	
; update minute counter
	ld [hl], a
	ret
	
.hour
; reset minute counter
	xor a
	ld [hl], a
	
; increment hour counter
	ld a, [GameTimeHours]
	ld h, a
	ld a, [GameTimeHours+1]
	ld l, a
	inc hl
	
; reached 1000 hours?
	ld a, h
	cp $3 ; 1000 / $100
	jr c, .updatehr
	
	ld a, l
	cp $e8 ; 1000 & $ff
	jr c, .updatehr
	
; cap at 999:59:59.00
	ld hl, GameTimeCap
	set 0, [hl] ; stop timer
	
	ld a, 59
	ld [GameTimeMinutes], a
	ld [GameTimeSeconds], a
	
; this will never be run again
	ret
	
.updatehr
	ld a, h
	ld [GameTimeHours], a
	ld a, l
	ld [GameTimeHours+1], a
	ret
; 210f

INCBIN "baserom.gbc", $210f, $261f - $210f

PushScriptPointer: ; 261f
; used to call a script from asm
; input:
;	a: bank
;	hl: address

; bank
	ld [$d439], a ; ScriptBank
	
; address
	ld a, l
	ld [$d43a], a ; ScriptAddressLo
	ld a, h
	ld [$d43b], a ; ScriptAddressHi
	
	ld a, $ff
	ld [$d438], a
	
	scf
	ret
; 2631

INCBIN "baserom.gbc", $2631, $26d4 - $2631

GetScriptByte: ; 0x26d4
; Return byte at ScriptBank:ScriptPos in a.

	push hl
	push bc

	ld a, [hROMBank]
	push af

	ld a, [ScriptBank]
	rst Bankswitch

	ld hl, ScriptPos
	ld c, [hl]
	inc hl
	ld b, [hl]

	ld a, [bc]

	inc bc
	ld [hl], b
	dec hl
	ld [hl], c

	ld b, a
	pop af
	rst Bankswitch
	ld a, b

	pop bc
	pop hl
	ret
; 0x26ef

ObjectEvent: ; 0x26ef
	jumptextfaceplayer ObjectEventText
; 0x26f2

ObjectEventText:
	TX_FAR _ObjectEventText
	db "@"
; 0x26f7

INCBIN "baserom.gbc", $26f7, $2bed-$26f7

GetMapHeaderPointer: ; 0x2bed
; Prior to calling this function, you must have switched banks so that
; MapGroupPointers is visible.

; inputs:
; b = map group, c = map number
; XXX de = ???

; outputs:
; hl points to the map header
	push bc ; save map number for later

	; get pointer to map group
	dec b
	ld c, b
	ld b, $0
	ld hl, MapGroupPointers
	add hl, bc
	add hl, bc

	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop bc ; restore map number

	; find the cth map header
	dec c
	ld b, $0
	ld a, OlivineGym_MapHeader - OlivinePokeCenter1F_MapHeader
	call AddNTimes
	ret
; 0x2c04

GetMapHeaderMember: ; 0x2c04
; Extract data from the current map's header.

; inputs:
; de = offset of desired data within the mapheader

; outputs:
; bc = data from the current map's header
; (e.g., de = $0003 would return a pointer to the secondary map header)

	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	; fallthrough

GetAnyMapHeaderMember: ; 0x2c0c
	; bankswitch
	ld a, [hROMBank]
	push af
	ld a, BANK(MapGroupPointers)
	rst Bankswitch

	call GetMapHeaderPointer
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]

	; bankswitch back
	pop af
	rst Bankswitch
	ret
; 0x2c1c

INCBIN "baserom.gbc", $2c1c, $2c7d-$2c1c

GetSecondaryMapHeaderPointer: ; 0x2c7d
; returns the current map's secondary map header pointer in hl.
	push bc
	push de
	ld de, $0003 ; secondary map header pointer (offset within header)
	call GetMapHeaderMember
	ld l, c
	ld h, b
	pop de
	pop bc
	ret

INCBIN "baserom.gbc", $2c8a, $2caf-$2c8a

GetWorldMapLocation: ; 0x2caf
; given a map group/id in bc, return its location on the Pokégear map.
	push hl
	push de
	push bc
	ld de, 5
	call GetAnyMapHeaderMember
	ld a, c
	pop bc
	pop de
	pop hl
	ret
; 0x2cbd

INCBIN "baserom.gbc", $2cbd, $2d63-$2cbd

FarJpHl: ; 2d63
; Jump to a:hl.
; Preserves all registers besides a.

; Switch to the new bank.
	ld [hBuffer], a
	ld a, [hROMBank]
	push af
	ld a, [hBuffer]
	rst Bankswitch
	
	call .hl
	
; We want to retain the contents of f.
; To do this, we can pop to bc instead of af.
	
	ld a, b
	ld [$cfb9], a
	ld a, c
	ld [$cfba], a
	
; Restore the working bank.
	pop bc
	ld a, b
	rst Bankswitch
	
	ld a, [$cfb9]
	ld b, a
	ld a, [$cfba]
	ld c, a
	ret
.hl
	jp [hl]
; 2d83


Predef: ; 2d83
; call a function from given id a

; relies on $cfb4-8

; this function is somewhat unreadable at a glance
; the execution flow is as follows:
;	save bank
;	get function from id
;	call function
;	restore bank
; these are pushed to the stack in reverse

; most of the $cfbx trickery is just juggling hl (which is preserved)
; this allows hl, de and bc to be passed to the function

; input:
;	a: id
;	parameters bc, de, hl

; store id
	ld [$cfb4], a
	
; save bank
	ld a, [hROMBank] ; current bank
	push af
	
; get Predef function to call
; GetPredefFn also stores hl in $cfb5-6
	ld a, BANK(GetPredefFn)
	rst Bankswitch
	call GetPredefFn
; switch bank to Predef function
	rst Bankswitch
	
; clean up after Predef call
	ld hl, .cleanup
	push hl
	
; call Predef function from ret
	ld a, [$cfb7]
	ld h, a
	ld a, [$cfb8]
	ld l, a
	push hl
	
; get hl back
	ld a, [$cfb5]
	ld h, a
	ld a, [$cfb6]
	ld l, a
	ret

.cleanup
; store hl
	ld a, h
	ld [$cfb5], a
	ld a, l
	ld [$cfb6], a
	
; restore bank
	pop hl ; popping a pushed af. h = a (old bank)
	ld a, h
	rst Bankswitch
	
; get hl back
	ld a, [$cfb5]
	ld h, a
	ld a, [$cfb6]
	ld l, a
	ret
; 2dba

INCBIN "baserom.gbc", $2dba, $2e6f-$2dba

BitTable1Func: ; 0x2e6f
	ld hl, $da72
	call BitTableFunc
	ret

BitTableFunc: ; 0x2e76
; Perform a function on a bit in memory.

; inputs:
; b: function
;    0 clear bit
;    1 set bit
;    2 check bit
; de: bit number
; hl: index within bit table

	; get index within the byte
	ld a, e
	and $7

	; shift de right by three bits (get the index within memory)
	srl d
	rr e
	srl d
	rr e
	srl d
	rr e
	add hl, de

	; implement a decoder
	ld c, $1
	rrca
	jr nc, .one
	rlc c
.one
	rrca
	jr nc, .two
	rlc c
	rlc c
.two
	rrca
	jr nc, .three
	swap c
.three

	; check b's value: 0, 1, 2
	ld a, b
	cp 1
	jr c, .clearbit ; 0
	jr z, .setbit ; 1

	; check bit
	ld a, [hl]
	and c
	ld c, a
	ret

.setbit
	; set bit
	ld a, [hl]
	or c
	ld [hl], a
	ret

.clearbit
	; clear bit
	ld a, c
	cpl
	and [hl]
	ld [hl], a
	ret
; 0x2ead

INCBIN "baserom.gbc", $2ead, $2f8c - $2ead

RNG: ; 2f8c
; Two random numbers are generated by adding and subtracting
; the divider to the respective values every time it's called.

; The divider is a value that increments at a rate of 16384Hz.
; For comparison, the Game Boy operates at a clock speed of 4.2MHz.

; Additionally, an equivalent function is called every frame.

; output:
;	a: rand2
;	ffe1: rand1
;	ffe2: rand2

	push bc
; Added value
	ld a, [rDIV]
	ld b, a
	ld a, [hRandomAdd]
	adc b
	ld [hRandomAdd], a
; Subtracted value
	ld a, [rDIV]
	ld b, a
	ld a, [hRandomSub]
	sbc b
	ld [hRandomSub], a
	pop bc
	ret
; 2f9f

FarBattleRNG: ; 2f9f
; BattleRNG lives in another bank.
; It handles all RNG calls in the battle engine,
; allowing link battles to remain in sync using a shared PRNG.

; Save bank
	ld a, [hROMBank] ; bank
	push af
; Bankswitch
	ld a, BANK(BattleRNG)
	rst Bankswitch
	call BattleRNG
; Restore bank
	ld [$cfb6], a
	pop af
	rst Bankswitch
	ld a, [$cfb6]
	ret
; 2fb1


Function2fb1: ; 2fb1
	push bc
	ld c, a
	xor a
	sub c
.asm_2fb5
	sub c
	jr nc, .asm_2fb5
	add c
	ld b, a
	push bc
.asm_2fbb
	call RNG
	ld a, [hRandomAdd]
	ld c, a
	add b
	jr c, .asm_2fbb
	ld a, c
	pop bc
	call SimpleDivide
	pop bc
	ret
; 2fcb

GetSRAMBank: ; 2fcb
; load sram bank a
; if invalid bank, sram is disabled
	cp NUM_SRAM_BANKS
	jr c, OpenSRAM
	jr CloseSRAM
; 2fd1

OpenSRAM: ; 2fd1
; switch to sram bank a
	push af
; latch clock data
	ld a, 1
	ld [MBC3LatchClock], a
; enable sram/clock write
	ld a, SRAM_ENABLE
	ld [MBC3SRamEnable], a
; select sram bank
	pop af
	ld [MBC3SRamBank], a
	ret
; 2fe1

CloseSRAM: ; 2fe1
; preserve a
	push af
	ld a, SRAM_DISABLE
; reset clock latch for next time
	ld [MBC3LatchClock], a
; disable sram/clock write
	ld [MBC3SRamEnable], a
	pop af
	ret
; 2fec

JpHl: ; 2fec
	jp [hl]
; 2fed

INCBIN "baserom.gbc", $2fed, $300b-$2fed

ClearSprites: ; 300b
	ld hl, Sprites
	ld b, TileMap - Sprites
	xor a
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	ret
; 3016

HideSprites: ; 3016
; Set all OBJ y-positions to 160 to hide them offscreen
	ld hl, Sprites
	ld de, $0004 ; length of an OBJ struct
	ld b, $28 ; number of OBJ structs
	ld a, 160 ; y-position
.loop
	ld [hl], a
	add hl, de
	dec b
	jr nz, .loop
	ret
; 3026

CopyBytes: ; 0x3026
; copy bc bytes from hl to de
	inc b  ; we bail the moment b hits 0, so include the last run
	inc c  ; same thing; include last byte
	jr .HandleLoop
.CopyByte
	ld a, [hli]
	ld [de], a
	inc de
.HandleLoop
	dec c
	jr nz, .CopyByte
	dec b
	jr nz, .CopyByte
	ret

SwapBytes: ; 0x3034
; swap bc bytes between hl and de
.Loop
	; stash [hl] away on the stack
	ld a, [hl]
	push af

	; copy a byte from [de] to [hl]
	ld a, [de]
	ld [hli], a

	; retrieve the previous value of [hl]; put it in [de]
	pop af
	ld [de], a

	; handle loop stuff
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .Loop
	ret

ByteFill: ; 0x3041
; fill bc bytes with the value of a, starting at hl
	inc b  ; we bail the moment b hits 0, so include the last run
	inc c  ; same thing; include last byte
	jr .HandleLoop
.PutByte
	ld [hli], a
.HandleLoop
	dec c
	jr nz, .PutByte
	dec b
	jr nz, .PutByte
	ret

GetFarByte: ; 0x304d
; retrieve a single byte from a:hl, and return it in a.
	; bankswitch to new bank
	ld [hBuffer], a
	ld a, [hROMBank]
	push af
	ld a, [hBuffer]
	rst Bankswitch

	; get byte from new bank
	ld a, [hl]
	ld [hBuffer], a

	; bankswitch to previous bank
	pop af
	rst Bankswitch

	; return retrieved value in a
	ld a, [hBuffer]
	ret

GetFarHalfword: ; 0x305d
; retrieve a halfword from a:hl, and return it in hl.
	; bankswitch to new bank
	ld [hBuffer], a
	ld a, [hROMBank]
	push af
	ld a, [hBuffer]
	rst Bankswitch

	; get halfword from new bank, put it in hl
	ld a, [hli]
	ld h, [hl]
	ld l, a

	; bankswitch to previous bank and return
	pop af
	rst Bankswitch
	ret
; 0x306b

INCBIN "baserom.gbc", $306b, $30d6-$306b

CopyName1: ; 30d6
	ld hl, StringBuffer2
; 30d9
CopyName2: ; 30d9
.loop
	ld a, [de]
	inc de
	ld [hli], a
	cp "@"
	jr nz, .loop
	ret
; 30e1

IsInArray: ; 30e1
; searches an array at hl for the value in a.
; skips (de - 1) bytes between reads, so to check every byte, de should be 1.
; if found, returns count in b and sets carry.
	ld b,0
	ld c,a
.loop\@
	ld a,[hl]
	cp a, $FF
	jr z,.NotInArray\@
	cp c
	jr z,.InArray\@
	inc b
	add hl,de
	jr .loop\@
.NotInArray\@
	and a
	ret
.InArray\@
	scf
	ret
; 0x30f4

SkipNames: ; 0x30f4
; skips n names where n = a
	ld bc, $000b ; name length
	and a
	ret z
.loop
	add hl, bc
	dec a
	jr nz, .loop
	ret
; 0x30fe

AddNTimes: ; 0x30fe
; adds bc n times where n = a
	and a
	ret z
.loop
	add hl, bc
	dec a
	jr nz, .loop
	ret
; 0x3105


SimpleMultiply: ; 3105
; Return a * c.
	and a
	ret z

	push bc
	ld b, a
	xor a
.loop
	add c
	dec b
	jr nz, .loop
	pop bc
	ret
; 3110


SimpleDivide: ; 3110
; Divide a by c. Return quotient b and remainder a.
	ld b, 0
.loop
	inc b
	sub c
	jr nc, .loop
	dec b
	add c
	ret
; 3119


Multiply: ; 3119
; Multiply hMultiplicand (3 bytes) by hMultiplier. Result in hProduct.
; All values are big endian.
	push hl
	push bc

	callab _Multiply

	pop bc
	pop hl
	ret
; 3124


Divide: ; 3124
; Divide hDividend length b (max 4 bytes) by hDivisor. Result in hQuotient.
; All values are big endian.
	push hl
	push de
	push bc
	ld a, [hROMBank]
	push af
	ld a, BANK(_Divide)
	rst Bankswitch

	call _Divide

	pop af
	rst Bankswitch
	pop bc
	pop de
	pop hl
	ret
; 3136


SubtractSigned: ; 3136
; Return a - b, sign in carry.
	sub b
	ret nc
	cpl
	add 1
	scf
	ret
; 313d


PrintLetterDelay: ; 313d
; wait some frames before printing the next letter
; the text speed setting in Options is actually a frame count
; 	fast: 1 frame
; 	mid:  3 frames
; 	slow: 5 frames
; $cfcf[!0] and A or B override text speed with a one-frame delay
; Options[4] and $cfcf[!1] disable the delay

; delay off?
	ld a, [Options]
	bit 4, a ; delay off
	ret nz
	
; non-scrolling text?
	ld a, [$cfcf]
	bit 1, a
	ret z
	
	push hl
	push de
	push bc
	
; save oam update status
	ld hl, hOAMUpdate
	ld a, [hl]
	push af
; orginally turned oam update off, commented out
;	ld a, 1
	ld [hl], a
	
; force fast scroll?
	ld a, [$cfcf]
	bit 0, a
	jr z, .fast
	
; text speed
	ld a, [Options]
	and a, %111 ; # frames to delay
	jr .updatedelay
	
.fast
	ld a, 1
.updatedelay
	ld [TextDelayFrames], a
	
.checkjoypad
	call GetJoypadPublic
	
; input override
	ld a, [$c2d7]
	and a
	jr nz, .wait
	
; wait one frame if holding a
	ld a, [hJoyDown] ; joypad
	bit 0, a ; A
	jr z, .checkb
	jr .delay
	
.checkb
; wait one frame if holding b
	bit 1, a ; B
	jr z, .wait
	
.delay
	call DelayFrame
	jr .end
	
.wait
; wait until frame counter hits 0 or the loop is broken
; this is a bad way to do this
	ld a, [TextDelayFrames]
	and a
	jr nz, .checkjoypad
	
.end
; restore oam update flag (not touched in this fn anymore)
	pop af
	ld [hOAMUpdate], a
	pop bc
	pop de
	pop hl
	ret
; 318c

CopyDataUntil: ; 318c
; Copies [hl, bc) to [de, bc - hl).
; In other words, the source data is from hl up to but not including bc,
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

INCBIN "baserom.gbc", $3198, $31db - $3198

StringCmp: ; 31db
; Compare strings, c bytes in length, at de and hl.
; Often used to compare big endian numbers in battle calculations.
	ld a, [de]
	cp [hl]
	ret nz
	inc de
	inc hl
	dec c
	jr nz, StringCmp
	ret
; 0x31e4


CompareLong: ; 31e4
; Compare bc bytes at de and hl. Return carry if they all match.

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


WhiteBGMap: ; 31f3
	call ClearPalettes
WaitBGMap: ; 31f6
; Tell VBlank to update BG Map
	ld a, 1 ; BG Map 0 tiles
	ld [hBGMapMode], a
; Wait for it to do its magic
	ld c, 4
	call DelayFrames
	ret
; 3200

INCBIN "baserom.gbc", $3200, $3317 - $3200

ClearPalettes: ; 3317
; Make all palettes white

; For CGB we make all the palette colors white
	ld a, [hCGB]
	and a
	jr nz, .cgb
	
; In DMG mode, we can just change palettes to 0 (white)
	xor a
	ld [rBGP], a
	ld [rOBP0], a
	ld [rOBP1], a
	ret
	
.cgb
; Save WRAM bank
	ld a, [rSVBK]
	push af
; WRAM bank 5
	ld a, 5
	ld [rSVBK], a
; Fill BGPals and OBPals with $ffff (white)
	ld hl, BGPals
	ld bc, $0080
	ld a, $ff
	call ByteFill
; Restore WRAM bank
	pop af
	ld [rSVBK], a
; Request palette update
	ld a, 1
	ld [hCGBPalUpdate], a
	ret
; 333e

ClearSGB: ; 333e
	ld b, $ff
GetSGBLayout: ; 3340
; load sgb packets unless dmg

; check cgb
	ld a, [hCGB]
	and a
	jr nz, .dosgb
	
; check sgb
	ld a, [hSGB]
	and a
	ret z
	
.dosgb
	ld a, $31 ; LoadSGBLayout
	jp Predef
; 334e


SetHPPal: ; 334e
; Set palette for hp bar pixel length e at hl.
	call GetHPPal
	ld [hl], d
	ret
; 3353


GetHPPal: ; 3353
; Get palette for hp bar pixel length e in d.

	ld d, 0 ; green
	ld a, e
	cp 24
	ret nc
	inc d ; yellow
	cp 10
	ret nc
	inc d ; red
	ret
; 335f


CountSetBits: ; 0x335f
; function to count how many bits are set in a string of bytes
; INPUT:
; hl = address of string of bytes
; b = length of string of bytes
; OUTPUT:
; [$d265] = number of set bits
	ld c, $0
.loop\@
	ld a, [hli]
	ld e, a
	ld d, $8
.innerLoop\@ ; count how many bits are set in the current byte
	srl e
	ld a, $0
	adc c
	ld c, a
	dec d
	jr nz, .innerLoop\@
	dec b
	jr nz, .loop\@
	ld a, c
	ld [$d265], a
	ret
; 0x3376


GetWeekday: ; 3376
	ld a, [CurDay]
.loop
	sub 7
	jr nc, .loop
	add 7
	ret
; 3380


SetSeenAndCaughtMon: ; 3380
	push af
	ld c, a
	ld hl, PokedexSeen
	ld b, 1
	call GetWramFlag
	pop af
	; fallthrough
; 338b

SetCaughtMon: ; 338b
	ld c, a
	ld hl, PokedexCaught
	ld b, 1
	jr GetWramFlag
; 3393

CheckSeenMon: ; 3393
	ld c, a
	ld hl, PokedexSeen
	ld b, 2
	jr GetWramFlag
; 339b

CheckCaughtMon: ; 339b
	ld c, a
	ld hl, PokedexCaught
	ld b, 2
	; fallthrough
; 33a1

GetWramFlag: ; 33a1
	ld d, 0
	ld a, PREDEF_FLAG
	call Predef

	ld a, c
	and a
	ret
; 33ab


NamesPointerTable: ; 33ab
	dbw BANK(PokemonNames), PokemonNames
	dbw BANK(MoveNames), MoveNames
	dbw $00, $0000
	dbw BANK(ItemNames), ItemNames
	dbw $00, PartyMonOT
	dbw $00, OTPartyMonOT
	dbw BANK(TrainerClassNames), TrainerClassNames
	dbw $04, $4b52
; 33c3


GetName: ; 33c3
; Return name $cf60 from name list $cf61 in StringBuffer1.
	ld a, [hROMBank]
	push af
	push hl
	push bc
	push de
	ld a, [$cf61]
	cp 1 ; Pokemon names
	jr nz, .NotPokeName

	ld a, [$cf60]
	ld [$d265], a
	call GetPokemonName
	ld hl, $000b
	add hl, de
	ld e, l
	ld d, h
	jr .done

.NotPokeName
	ld a, [$cf61]
	dec a
	ld e, a
	ld d, 0
	ld hl, NamesPointerTable
	add hl, de
	add hl, de
	add hl, de
	ld a, [hli]
	rst Bankswitch
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld a, [$cf60]
	dec a
	call GetNthString

	ld de, StringBuffer1
	ld bc, $000d
	call CopyBytes

.done
	ld a, e
	ld [$d102], a
	ld a, d
	ld [$d103], a
	pop de
	pop bc
	pop hl
	pop af
	rst Bankswitch
	ret
; 3411


GetNthString: ; 3411
; Starting at hl, this function returns the start address of the ath string.
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


GetBasePokemonName: ; 3420
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


GetPokemonName: ; 343b
; Get Pokemon name $d265.

	ld a, [hROMBank]
	push af
	push hl
	ld a, BANK(PokemonNames)
	rst Bankswitch

; Each name is ten characters
	ld a, [$d265]
	dec a
	ld d, 0
	ld e, a
	ld h, 0
	ld l, a
	add hl, hl
	add hl, hl
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


GetItemName: ; 3468
; Get item name $d265.

	push hl
	push bc
	ld a, [$d265]

	cp TM_01
	jr nc, .TM

	ld [$cf60], a
	ld a, 4 ; Item names
	ld [$cf61], a
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


GetTMHMName: ; 3487
; Get TM/HM name by item id $d265.

	push hl
	push de
	push bc
	ld a, [$d265]
	push af

; TM/HM prefix
	cp HM_01
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
	ld a, [$d265]
	ld c, a
	callab GetTMHMNumber
	pop de

; HM numbers start from 51, not 1
	pop af
	ld a, c
	jr c, .asm_34b9
	sub NUM_TMS

; Divide and mod by 10 to get the top and bottom digits respectively
.asm_34b9
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
	ld [$d265], a
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


IsHM: ; 34df
	cp HM_01
	jr c, .NotHM
	scf
	ret
.NotHM
	and a
	ret
; 34e7


IsHMMove: ; 34e7
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


GetMoveName: ; 34f8
	push hl
; move name
	ld a, $2 ; move names
	ld [$cf61], a
; move id
	ld a, [$d265]
	ld [$cf60], a

	call GetName
	ld de, StringBuffer1
	pop hl
	ret
; 350c


INCBIN "baserom.gbc", $350c, $3856 - $350c


GetBaseData: ; 3856
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
	ld de, $7d9c
	
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


GetCurNick; 389c
	ld a, [CurPartyMon]
	ld hl, PartyMonNicknames

GetNick: ; 38a2
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


PrintBCDNumber: ; 38bb
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
	jr z, .loop\@
	bit 7, b
	jr nz, .loop\@
	ld [hl], "¥"
	inc hl
.loop\@
	ld a, [de]
	swap a
	call PrintBCDDigit ; print upper digit
	ld a, [de]
	call PrintBCDDigit ; print lower digit
	inc de
	dec c
	jr nz, .loop\@
	bit 7, b ; were any non-zero digits printed?
	jr z, .done\@ ; if so, we are done
.numberEqualsZero\@ ; if every digit of the BCD number is zero
	bit 6, b ; left or right alignment?
	jr nz, .skipRightAlignmentAdjustment\@
	dec hl ; if the string is right-aligned, it needs to be moved back one space
.skipRightAlignmentAdjustment\@
	bit 5, b
	jr z, .skipCurrencySymbol\@
	ld [hl], "¥" ; currency symbol
	inc hl
.skipCurrencySymbol\@
	ld [hl], "0"
	call PrintLetterDelay
	inc hl
.done\@
	ret
; 0x38f2

PrintBCDDigit: ; 38f2
	and a, %00001111
	and a
	jr z, .zeroDigit\@
.nonzeroDigit\@
	bit 7, b ; have any non-space characters been printed?
	jr z, .outputDigit\@
; if bit 7 is set, then no numbers have been printed yet
	bit 5, b ; print the currency symbol?
	jr z, .skipCurrencySymbol\@
	ld [hl], "¥"
	inc hl
	res 5, b
.skipCurrencySymbol\@
	res 7, b ; unset 7 to indicate that a nonzero digit has been reached
.outputDigit\@
	add a, "0"
	ld [hli], a
	jp PrintLetterDelay
.zeroDigit\@
	bit 7, b ; either printing leading zeroes or already reached a nonzero digit?
	jr z, .outputDigit\@ ; if so, print a zero digit
	bit 6, b ; left or right alignment?
	ret nz
	ld a, " "
	ld [hli], a ; if right-aligned, "print" a space by advancing the pointer
	ret
; 0x3917

GetPartyParamLocation: ; 3917
; Get the location of parameter a from CurPartyMon in hl
	push bc
	ld hl, PartyMons
	ld c, a
	ld b, $00
	add hl, bc
	ld a, [CurPartyMon]
	call GetPartyLocation
	pop bc
	ret
; 3927

GetPartyLocation: ; 3927
; Add the length of a PartyMon struct to hl a times.
	ld bc, PartyMon2 - PartyMon1
	jp AddNTimes
; 392d


INCBIN "baserom.gbc", $392d, $3945 - $392d


UserPartyAttr: ; 3945
	push af
	ld a, [hBattleTurn]
	and a
	jr nz, .asm_394e
	pop af
	jr BattlePartyAttr
.asm_394e
	pop af
	jr OTPartyAttr
; 3951


OpponentPartyAttr: ; 3951
	push af
	ld a, [hBattleTurn]
	and a
	jr z, .asm_395a
	pop af
	jr BattlePartyAttr
.asm_395a
	pop af
	jr OTPartyAttr
; 395d


BattlePartyAttr: ; 395d
; Get attribute a from the active BattleMon's party struct.
	push bc
	ld c, a
	ld b, 0
	ld hl, PartyMons
	add hl, bc
	ld a, [CurBattleMon]
	call GetPartyLocation
	pop bc
	ret
; 396d


OTPartyAttr: ; 396d
; Get attribute a from the active EnemyMon's party struct.
	push bc
	ld c, a
	ld b, 0
	ld hl, OTPartyMon1Species
	add hl, bc
	ld a, [CurOTMon]
	call GetPartyLocation
	pop bc
	ret
; 397d


ResetDamage: ; 397d
	xor a
	ld [CurDamage], a
	ld [CurDamage + 1], a
	ret
; 3985

SetPlayerTurn: ; 3985
	xor a
	ld [hBattleTurn], a
	ret
; 3989

SetEnemyTurn: ; 3989
	ld a, 1
	ld [hBattleTurn], a
	ret
; 398e


UpdateOpponentInParty: ; 398e
	ld a, [hBattleTurn]
	and a
	jr z, UpdateEnemyMonInParty
	jr UpdateBattleMonInParty
; 3995

UpdateUserInParty: ; 3995
	ld a, [hBattleTurn]
	and a
	jr z, UpdateBattleMonInParty
	jr UpdateEnemyMonInParty
; 399c

UpdateBattleMonInParty: ; 399c
; Update level, status, current HP

	ld a, [CurBattleMon]
	ld hl, PartyMon1Level
	call GetPartyLocation

	ld d, h
	ld e, l
	ld hl, BattleMonLevel
	ld bc, BattleMonMaxHP - BattleMonLevel
	jp CopyBytes
; 39b0

UpdateEnemyMonInParty: ; 39b0
; Update level, status, current HP

; No wildmons.
	ld a, [IsInBattle]
	dec a
	ret z

	ld a, [CurOTMon]
	ld hl, OTPartyMon1Level
	call GetPartyLocation

	ld d, h
	ld e, l
	ld hl, EnemyMonLevel
	ld bc, EnemyMonMaxHP - EnemyMonLevel
	jp CopyBytes
; 39c9


RefreshBattleHuds: ; 39c9
	call UpdateBattleHuds
	ld c, 3
	call DelayFrames
	jp WaitBGMap
; 39d4

UpdateBattleHuds: ; 39d4
	ld a, $f
	ld hl, $5f48
	rst FarCall ; UpdatePlayerHud
	ld a, $f
	ld hl, $6036
	rst FarCall ; UpdateEnemyHud
	ret
; 39e1


CleanGetBattleVarPair: ; 39e1
; Preserves hl.
	push hl
	call GetBattleVarPair
	pop hl
	ret
; 39e7

GetBattleVarPair: ; 39e7
; Get variable from pair a, depending on whose turn it is.
; There are 21 variable pairs.

	push bc
	
; get var pair
	ld hl, .battlevarpairs
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	
	ld a, [hli]
	ld h, [hl]
	ld l, a
	
; Enemy turn uses the second byte instead.
; This lets battle variable calls be side-neutral.
	ld a, [hBattleTurn]
	and a
	jr z, .getvar
	inc hl
	
.getvar
; get var id
	ld a, [hl]
	ld c, a
	ld b, $0
	
; seek
	ld hl, .vars
	add hl, bc
	add hl, bc
	
; get var address
	ld a, [hli]
	ld h, [hl]
	ld l, a
	
	ld a, [hl]
	
	pop bc
	ret


.battlevarpairs
	dw .substatus1         ; 0
	dw .substatus2         ; 1
	dw .substatus3         ; 2
	dw .substatus4         ; 3
	dw .substatus5         ; 4
	dw .substatus1opp      ; 5
	dw .substatus2opp      ; 6
	dw .substatus3opp      ; 7
	dw .substatus4opp      ; 8
	dw .substatus5opp      ; 9
	dw .status             ; a
	dw .statusopp          ; b
	dw .animation          ; c
	dw .effect             ; d
	dw .power              ; e
	dw .type               ; f
	dw .curmove            ; 10
	dw .lastcountermove    ; 11
	dw .lastcountermoveopp ; 12
	dw .lastmove           ; 13
	dw .lastmoveopp        ; 14

	;                  player             enemy
.substatus1
	db $00, $01 ; PLAYER_SUBSTATUS1, ENEMY_SUBSTATUS1
.substatus1opp
	db $01, $00 ; ENEMY_SUBSTATUS1, PLAYER_SUBSTATUS1
.substatus2
	db $02, $03 ; PLAYER_SUBSTATUS2, ENEMY_SUBSTATUS2
.substatus2opp
	db $03, $02 ; ENEMY_SUBSTATUS2, PLAYER_SUBSTATUS2
.substatus3
	db $04, $05 ; PLAYER_SUBSTATUS3, ENEMY_SUBSTATUS3
.substatus3opp
	db $05, $04 ; ENEMY_SUBSTATUS3, PLAYER_SUBSTATUS3
.substatus4
	db $06, $07 ; PLAYER_SUBSTATUS4, ENEMY_SUBSTATUS4
.substatus4opp
	db $07, $06 ; ENEMY_SUBSTATUS4, PLAYER_SUBSTATUS4
.substatus5
	db $08, $09 ; PLAYER_SUBSTATUS5, ENEMY_SUBSTATUS5
.substatus5opp
	db $09, $08 ; ENEMY_SUBSTATUS5, PLAYER_SUBSTATUS5
.status
	db $0a, $0b ; PLAYER_STATUS, ENEMY_STATUS
.statusopp
	db $0b, $0a ; ENEMY_STATUS, PLAYER_STATUS
.animation
	db $0c, $0d ; PLAYER_MOVE_ANIMATION, ENEMY_MOVE_ANIMATION
.effect
	db $0e, $0f ; PLAYER_MOVE_EFFECT, ENEMY_MOVE_EFFECT
.power
	db $10, $11 ; PLAYER_MOVE_POWER, ENEMY_MOVE_POWER
.type
	db $12, $13 ; PLAYER_MOVE_TYPE, ENEMY_MOVE_TYPE
.curmove
	db $14, $15 ; PLAYER_CUR_MOVE, ENEMY_CUR_MOVE
.lastcountermove
	db $16, $17 ; ENEMY_LAST_COUNTER_MOVE, PLAYER_LAST_COUNTER_MOVE
.lastcountermoveopp
	db $17, $16 ; PLAYER_LAST_COUNTER_MOVE, ENEMY_LAST_COUNTER_MOVE
.lastmove
	db $18, $19 ; PLAYER_LAST_MOVE, ENEMY_LAST_MOVE
.lastmoveopp
	db $19, $18 ; ENEMY_LAST_MOVE, PLAYER_LAST_MOVE

.vars
	dw PlayerSubStatus1
	dw EnemySubStatus1
	
	dw PlayerSubStatus2
	dw EnemySubStatus2
	
	dw PlayerSubStatus3
	dw EnemySubStatus3
	
	dw PlayerSubStatus4
	dw EnemySubStatus4
	
	dw PlayerSubStatus5
	dw EnemySubStatus5
	
	dw BattleMonStatus
	dw EnemyMonStatus
	
	dw PlayerMoveAnimation
	dw EnemyMoveAnimation
	
	dw PlayerMoveEffect
	dw EnemyMoveEffect
	
	dw PlayerMovePower
	dw EnemyMovePower
	
	dw PlayerMoveType
	dw EnemyMoveType
	
	dw CurPlayerMove
	dw CurEnemyMove
	
	dw LastEnemyCounterMove
	dw LastPlayerCounterMove
	
	dw LastPlayerMove
	dw LastEnemyMove
; 3a90

INCBIN "baserom.gbc", $3a90, $3ab2 - $3a90


MobileTextBorder: ; 3ab2
; For mobile link battles only.
	ld a, [InLinkBattle]
	cp 4
	ret c
; Draw a cell phone icon at the top right corner of the border.
	ld hl, $c5a3 ; TileMap(19,12)
	ld [hl], $5e ; cell phone top
	ld hl, $c5b7 ; TileMap(19,13)
	ld [hl], $5f ; cell phone bottom
	ret
; 3ac3


BattleTextBox: ; 3ac3
	push hl
	call SpeechTextBox
	call MobileTextBorder
	call $1ad2 ; UpdateSprites
	call $321c ; refresh?
	pop hl
	call PrintTextBoxText
	ret
; 3ad5


FarBattleTextBox: ; 3ad5
; Open a textbox and print text at 20:hl.

	ld a, [hROMBank]
	push af

	ld a, $20
	rst Bankswitch

	call BattleTextBox

	pop af
	rst Bankswitch
	ret
; 3ae1


INCBIN "baserom.gbc", $3ae1, $3b4e - $3ae1


CleanSoundRestart: ; 3b4e

	push hl
	push de
	push bc
	push af

	ld a, [hROMBank]
	push af
	ld a, BANK(SoundRestart)
	ld [hROMBank], a
	ld [MBC3RomBank], a

	call SoundRestart

	pop af
	ld [hROMBank], a
	ld [MBC3RomBank], a

	pop af
	pop bc
	pop de
	pop hl
	ret
; 3b6a


CleanUpdateSound: ; 3b6a

	push hl
	push de
	push bc
	push af

	ld a, [hROMBank]
	push af
	ld a, BANK(UpdateSound)
	ld [hROMBank], a
	ld [MBC3RomBank], a

	call UpdateSound

	pop af
	ld [hROMBank], a
	ld [MBC3RomBank], a

	pop af
	pop bc
	pop de
	pop hl
	ret
; 3b86


LoadMusicByte: ; 3b86
; CurMusicByte = [a:de]

	ld [hROMBank], a
	ld [MBC3RomBank], a

	ld a, [de]
	ld [CurMusicByte], a
	ld a, $3a ; manual bank restore

	ld [hROMBank], a
	ld [MBC3RomBank], a
	ret
; 3b97


StartMusic: ; 3b97
; Play music de.

	push hl
	push de
	push bc
	push af

	ld a, [hROMBank]
	push af
	ld a, BANK(LoadMusic) ; and BANK(SoundRestart)
	ld [hROMBank], a
	ld [MBC3RomBank], a

	ld a, e
	and a
	jr z, .nomusic

	call LoadMusic
	jr .end

.nomusic
	call SoundRestart

.end
	pop af
	ld [hROMBank], a
	ld [MBC3RomBank], a
	pop af
	pop bc
	pop de
	pop hl
	ret
; 3bbc


StartMusic2: ; 3bbc
; Stop playing music, then play music de.

	push hl
	push de
	push bc
	push af

	ld a, [hROMBank]
	push af
	ld a, BANK(LoadMusic)
	ld [hROMBank], a
	ld [MBC3RomBank], a

	push de
	ld de, MUSIC_NONE
	call LoadMusic
	call DelayFrame
	pop de
	call LoadMusic

	pop af
	ld [hROMBank], a
	ld [MBC3RomBank], a

	pop af
	pop bc
	pop de
	pop hl
	ret

; 3be3


PlayCryHeader: ; 3be3
; Play a cry given parameters in header de

	push hl
	push de
	push bc
	push af

; Save current bank
	ld a, [hROMBank]
	push af

; Cry headers are stuck in one bank.
	ld a, BANK(CryHeaders)
	ld [hROMBank], a
	ld [MBC3RomBank], a

; Each header is 6 bytes long:
	ld hl, CryHeaders
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de

	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl

	ld a, [hli]
	ld [CryPitch], a
	ld a, [hli]
	ld [CryEcho], a
	ld a, [hli]
	ld [CryLength], a
	ld a, [hl]
	ld [CryLength+1], a

	ld a, BANK(PlayCry)
	ld [hROMBank], a
	ld [MBC3RomBank], a

	call PlayCry

	pop af
	ld [hROMBank], a
	ld [MBC3RomBank], a
	
	pop af
	pop bc
	pop de
	pop hl
	ret
; 3c23


StartSFX: ; 3c23
; Play sound effect de.
; Sound effects are ordered by priority (lowest to highest)

	push hl
	push de
	push bc
	push af

; Is something already playing?
	call CheckSFX
	jr nc, .play
; Does it have priority?
	ld a, [CurSFX]
	cp e
	jr c, .quit

.play
	ld a, [hROMBank]
	push af
	ld a, BANK(LoadSFX)
	ld [hROMBank], a
	ld [MBC3RomBank], a ; bankswitch

	ld a, e
	ld [CurSFX], a
	call LoadSFX

	pop af
	ld [hROMBank], a
	ld [MBC3RomBank], a ; bankswitch
.quit
	pop af
	pop bc
	pop de
	pop hl
	ret
; 3c4e


WaitPlaySFX: ; 3c4e
	call WaitSFX
	call StartSFX
	ret
; 3c55


WaitSFX: ; 3c55
; infinite loop until sfx is done playing

	push hl
	
.loop
	; ch5 on?
	ld hl, Channel5 + Channel1Flags - Channel1
	bit 0, [hl]
	jr nz, .loop
	; ch6 on?
	ld hl, Channel6 + Channel1Flags - Channel1
	bit 0, [hl]
	jr nz, .loop
	; ch7 on?
	ld hl, Channel7 + Channel1Flags - Channel1
	bit 0, [hl]
	jr nz, .loop
	; ch8 on?
	ld hl, Channel8 + Channel1Flags - Channel1
	bit 0, [hl]
	jr nz, .loop
	
	pop hl
	ret
; 3c74

INCBIN "baserom.gbc", $3c74, $3c97-$3c74

MaxVolume: ; 3c97
	ld a, $77 ; max
	ld [Volume], a
	ret
; 3c9d

LowVolume: ; 3c9d
	ld a, $33 ; 40%
	ld [Volume], a
	ret
; 3ca3

VolumeOff: ; 3ca3
	xor a
	ld [Volume], a
	ret
; 3ca8

INCBIN "baserom.gbc", $3ca8, $3dde - $3ca8

CheckSFX: ; 3dde
; returns carry if sfx channels are active
	ld a, [$c1cc] ; 1
	bit 0, a
	jr nz, .quit
	ld a, [$c1fe] ; 2
	bit 0, a
	jr nz, .quit
	ld a, [$c230] ; 3
	bit 0, a
	jr nz, .quit
	ld a, [$c262] ; 4
	bit 0, a
	jr nz, .quit
	and a
	ret
.quit
	scf
	ret
; 3dfe

INCBIN "baserom.gbc", $3dfe, $3e10 - $3dfe

ChannelsOff: ; 3e10
; Quickly turn off music channels
	xor a
	ld [$c104], a
	ld [$c136], a
	ld [$c168], a
	ld [$c19a], a
	ld [$c29c], a
	ret
; 3e21

SFXChannelsOff: ; 3e21
; Quickly turn off sound effect channels
	xor a
	ld [$c1cc], a
	ld [$c1fe], a
	ld [$c230], a
	ld [$c262], a
	ld [$c29c], a
	ret
; 3e32

INCBIN "baserom.gbc", $3e32, $3fb5 - $3e32


SECTION "bank1",DATA,BANK[$1]

INCBIN "baserom.gbc", $4000, $617c - $4000

IntroFadePalettes: ; 0x617c
	db %01010100
	db %10101000
	db %11111100
	db %11111000
	db %11110100
	db %11100100
; 6182

INCBIN "baserom.gbc", $6182, $6274 - $6182

FarStartTitleScreen: ; 6274
	callba StartTitleScreen
	ret
; 627b

INCBIN "baserom.gbc", $627b, $62bc - $627b

TitleScreenEntrance: ; 62bc

; Animate the logo:
; Move each line by 4 pixels until our count hits 0.
	ld a, [$ffcf]
	and a
	jr z, .done
	sub 4
	ld [$ffcf], a
	
; Lay out a base (all lines scrolling together).
	ld e, a
	ld hl, $d100
	ld bc, 8 * 10 ; logo height
	call ByteFill
	
; Alternate signage for each line's position vector.
; This is responsible for the interlaced effect.
	ld a, e
	xor $ff
	inc a
	
	ld b, 8 * 10 / 2 ; logo height / 2
	ld hl, $d101
.loop
	ld [hli], a
	inc hl
	dec b
	jr nz, .loop
	
	callba AnimateTitleCrystal
	ret
	
	
.done
; Next scene
	ld hl, $cf63
	inc [hl]
	xor a
	ld [hLCDStatCustom], a
	
; Play the title screen music.
	ld de, MUSIC_TITLE
	call StartMusic
	
	ld a, $88
	ld [$ffd2], a
	ret
; 62f6

INCBIN "baserom.gbc", $62f6, $669f - $62f6

CheckNickErrors: ; 669f
; error-check monster nick before use
; must be a peace offering to gamesharkers

; input: de = nick location

	push bc
	push de
	ld b, PKMN_NAME_LENGTH

.checkchar
; end of nick?
	ld a, [de]
	cp "@" ; terminator
	jr z, .end

; check if this char is a text command
	ld hl, .textcommands
	dec hl
.loop
; next entry
	inc hl
; reached end of commands table?
	ld a, [hl]
	cp a, $ff
	jr z, .done

; is the current char between this value (inclusive)...
	ld a, [de]
	cp [hl]
	inc hl
	jr c, .loop
; ...and this one?
	cp [hl]
	jr nc, .loop

; replace it with a "?"
	ld a, "?"
	ld [de], a
	jr .loop

.done
; next char
	inc de
; reached end of nick without finding a terminator?
	dec b
	jr nz, .checkchar

; change nick to "?@"
	pop de
	push de
	ld a, "?"
	ld [de], a
	inc de
	ld a, "@"
	ld [de], a
.end
; if the nick has any errors at this point it's out of our hands
	pop de
	pop bc
	ret
; 66cf

.textcommands ; 66cf
; table definining which characters
; are actually text commands
; format:
;       >=   <
	db $00, $05
	db $14, $19
	db $1d, $26
	db $35, $3a
	db $3f, $40
	db $49, $5d
	db $5e, $7f
	db $ff ; end
; 66de


_Multiply: ; 66de

; hMultiplier is one byte.
	ld a, 8
	ld b, a

	xor a
	ld [hMultiplicand - 1], a
	ld [hMathBuffer + 1], a
	ld [hMathBuffer + 2], a
	ld [hMathBuffer + 3], a
	ld [hMathBuffer + 4], a


.loop
	ld a, [hMultiplier]
	srl a
	ld [hMultiplier], a
	jr nc, .next

	ld a, [hMathBuffer + 4]
	ld c, a
	ld a, [hMultiplicand + 2]
	add c
	ld [hMathBuffer + 4], a

	ld a, [hMathBuffer + 3]
	ld c, a
	ld a, [hMultiplicand + 1]
	adc c
	ld [hMathBuffer + 3], a

	ld a, [hMathBuffer + 2]
	ld c, a
	ld a, [hMultiplicand + 0]
	adc c
	ld [hMathBuffer + 2], a

	ld a, [hMathBuffer + 1]
	ld c, a
	ld a, [hMultiplicand - 1]
	adc c
	ld [hMathBuffer + 1], a

.next
	dec b
	jr z, .done


; hMultiplicand <<= 1

	ld a, [hMultiplicand + 2]
	add a
	ld [hMultiplicand + 2], a

	ld a, [hMultiplicand + 1]
	rla
	ld [hMultiplicand + 1], a

	ld a, [hMultiplicand + 0]
	rla
	ld [hMultiplicand + 0], a

	ld a, [hMultiplicand - 1]
	rla
	ld [hMultiplicand - 1], a

	jr .loop


.done
	ld a, [hMathBuffer + 4]
	ld [hProduct + 3], a

	ld a, [hMathBuffer + 3]
	ld [hProduct + 2], a

	ld a, [hMathBuffer + 2]
	ld [hProduct + 1], a

	ld a, [hMathBuffer + 1]
	ld [hProduct + 0], a

	ret
; 673e


_Divide: ; 673e
	xor a
	ld [hMathBuffer + 0], a
	ld [hMathBuffer + 1], a
	ld [hMathBuffer + 2], a
	ld [hMathBuffer + 3], a
	ld [hMathBuffer + 4], a

	ld a, 9
	ld e, a

.loop
	ld a, [hMathBuffer + 0]
	ld c, a
	ld a, [hDividend + 1]
	sub c
	ld d, a

	ld a, [hDivisor]
	ld c, a
	ld a, [hDividend + 0]
	sbc c
	jr c, .asm_6767

	ld [hDividend + 0], a

	ld a, d
	ld [hDividend + 1], a

	ld a, [hMathBuffer + 4]
	inc a
	ld [hMathBuffer + 4], a

	jr .loop

.asm_6767
	ld a, b
	cp 1
	jr z, .done

	ld a, [hMathBuffer + 4]
	add a
	ld [hMathBuffer + 4], a

	ld a, [hMathBuffer + 3]
	rla
	ld [hMathBuffer + 3], a

	ld a, [hMathBuffer + 2]
	rla
	ld [hMathBuffer + 2], a

	ld a, [hMathBuffer + 1]
	rla
	ld [hMathBuffer + 1], a

	dec e
	jr nz, .asm_6798

	ld e, 8
	ld a, [hMathBuffer + 0]
	ld [hDivisor], a
	xor a
	ld [hMathBuffer + 0], a

	ld a, [hDividend + 1]
	ld [hDividend + 0], a

	ld a, [hDividend + 2]
	ld [hDividend + 1], a

	ld a, [hDividend + 3]
	ld [hDividend + 2], a

.asm_6798
	ld a, e
	cp 1
	jr nz, .asm_679e
	dec b

.asm_679e
	ld a, [hDivisor]
	srl a
	ld [hDivisor], a

	ld a, [hMathBuffer + 0]
	rr a
	ld [hMathBuffer + 0], a

	jr .loop

.done
	ld a, [hDividend + 1]
	ld [hDivisor], a

	ld a, [hMathBuffer + 4]
	ld [hDividend + 3], a

	ld a, [hMathBuffer + 3]
	ld [hDividend + 2], a

	ld a, [hMathBuffer + 2]
	ld [hDividend + 1], a

	ld a, [hMathBuffer + 1]
	ld [hDividend + 0], a

	ret
; 67c1


ItemAttributes: ; 67c1
INCLUDE "items/item_attributes.asm"
; 6ec1


INCBIN "baserom.gbc", $6ec1, $6eef - $6ec1


DrawGraphic: ; 6eef
; input:
;   hl: draw location
;   b: height
;   c: width
;   d: tile to start drawing from
;   e: number of tiles to advance for each row
	call $7009
	pop bc
	pop hl
	ret c
	bit 5, [hl]
	jr nz, .asm_6f05
	push hl
	call $70a4
	pop hl
	ret c
	push hl
	call $70ed
	pop hl
	ret c
.asm_6f05
	and a
	ret
; 6f07


INCBIN "baserom.gbc", $6f07, $7305 - $6f07


SpecialGiveShuckle: ; 7305

; Adding to the party.
	xor a
	ld [MonType], a

; Level 15 Shuckle.
	ld a, SHUCKLE
	ld [CurPartySpecies], a
	ld a, 15
	ld [CurPartyLevel], a

	ld a, PREDEF_ADDPARTYMON
	call Predef
	jr nc, .NotGiven

; Caught data.
	ld b, 0
	ld a, $13
	ld hl, $5ba3
	rst FarCall

; Holding a Berry.
	ld bc, PartyMon2 - PartyMon1
	ld a, [PartyCount]
	dec a
	push af
	push bc
	ld hl, PartyMon1Item
	call AddNTimes
	ld [hl], BERRY
	pop bc
	pop af

; OT ID.
	ld hl, PartyMon1ID
	call AddNTimes
	ld a, $2
	ld [hli], a
	ld [hl], $6

; Nickname.
	ld a, [PartyCount]
	dec a
	ld hl, PartyMon1Nickname
	call SkipNames
	ld de, .Shuckie
	call CopyName2

; OT.
	ld a, [PartyCount]
	dec a
	ld hl, PartyMon1OT
	call SkipNames
	ld de, .Mania
	call CopyName2

; Bittable2 flag for this event.
	ld hl, $dc1e
	set 5, [hl]

	ld a, 1
	ld [ScriptVar], a
	ret

.NotGiven
	xor a
	ld [ScriptVar], a
	ret

.Mania
	db "MANIA@"
.Shuckie
	db "SHUCKIE@"
; 737e


INCBIN "baserom.gbc", $737e, $747b - $737e


SECTION "bank2",DATA,BANK[$2]

INCBIN "baserom.gbc", $8000, $854b - $8000

GetPredefFn: ; 854b
; input:
;	[$cfb4] id

; save hl for later
	ld a, h
	ld [$cfb5], a
	ld a, l
	ld [$cfb6], a
	
	push de
	
; get id
	ld a, [$cfb4]
	ld e, a
	ld d, $0
	ld hl, PredefPointers
; seek
	add hl, de
	add hl, de
	add hl, de
	
	pop de
	
; store address in [$cfb7-8]
; addr lo
	ld a, [hli]
	ld [$cfb8], a
; addr hi
	ld a, [hli]
	ld [$cfb7], a
; get bank
	ld a, [hl]
	ret
; 856b

PredefPointers: ; 856b
; $4b Predef pointers
; address, bank
	dwb $6508, $01
	dwb $747a, $01
	dwb $4658, $03
	dwb $57c1, $13
	dwb $4699, $03
	dwb $5a6d, $03
	dwb $588c, $03
	dwb $5a96, $03
	dwb $5b3f, $03
	dwb $5e6e, $03
	dwb $5f8c, $03
	dwb $46e0, $03
	dwb $6167, $03
	dwb $617b, $03
	dwb $5639, $04
	dwb $566a, $04
	dwb $4eef, $0a
	dwb $4b3e, $0b
	dwb $5f48, $0f
	dwb FillBox, BANK(FillBox)
	dwb $5873, $0f
	dwb $6036, $0f
	dwb $74c1, $0f
	dwb $7390, $0f
	dwb $743d, $0f
	dwb $747c, $0f
	dwb $6487, $10
	dwb $64e1, $10
	dwb $61e6, $10
	dwb $4f63, $0a
	dwb $4f24, $0a
	dwb $484a, $14
	dwb $4d6f, $14
	dwb $4d2e, $14
	dwb $4cdb, $14
	dwb $4c50, $14
	dwb $4bdd, $14
	dwb StatsScreenInit, BANK(StatsScreenInit) ; stats screen
	dwb $4b0a, $14
	dwb $4b0e, $14
	dwb $4b7b, $14
	dwb $4964, $14
	dwb $493a, $14
	dwb $4953, $14
	dwb $490d, $14
	dwb $5040, $14
	dwb $7cdd, $32
	dwb $40d5, $33
	dwb $5853, $02
	dwb $464c, $02
	dwb $5d11, $24
	dwb $4a88, $02
	dwb $420f, $23
	dwb $4000, $23
	dwb $4000, $23
	dwb $40d6, $33
	dwb $40d5, $33
	dwb $40d5, $33
	dwb $51d0, $3f
	dwb $6a6c, $04
	dwb $5077, $14
	dwb $516c, $14
	dwb $508b, $14
	dwb $520d, $14
	dwb $525d, $14
	dwb $47d3, $0d
	dwb $7908, $3e
	dwb $7877, $3e
	dwb $4000, $34
	dwb $4d0a, $14
	dwb $40a3, $34
	dwb $408e, $34
	dwb $4669, $34
	dwb $466e, $34
	dwb $43ff, $2d
; 864c

INCBIN "baserom.gbc", $864c, $8a68 - $864c

CheckShininess: ; 0x8a68
; given a pointer to Attack/Defense DV in bc, determine if monster is shiny.
; if shiny, set carry.
	ld l,c
	ld h,b
	ld a,[hl]
	and a,%00100000 ; is attack DV xx1x?
	jr z,.NotShiny
	ld a,[hli]
	and a,%1111
	cp $A ; is defense DV 1010?
	jr nz,.NotShiny
	ld a,[hl]
	and a,%11110000
	cp $A0 ; is speed DV 1010?
	jr nz,.NotShiny
	ld a,[hl]
	and a,%1111
	cp $A ; is special DV 1010?
	jr nz,.NotShiny
	scf
	ret
.NotShiny
	and a ; clear carry flag
	ret

INCBIN "baserom.gbc", $8a88, $9a52-$8a88

CopyData: ; 0x9a52
; copy bc bytes of data from hl to de
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, CopyData
	ret
; 0x9a5b

ClearBytes: ; 0x9a5b
; clear bc bytes of data starting from de
	xor a
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, ClearBytes
	ret
; 0x9a64

DrawDefaultTiles: ; 0x9a64
; Draw 240 tiles (2/3 of the screen) from tiles in VRAM
	ld hl, $9800 ; BG Map 0
	ld de, 32 - 20
	ld a, $80 ; starting tile
	ld c, 12 + 1
.line
	ld b, 20
.tile
	ld [hli], a
	inc a
	dec b
	jr nz, .tile
; next line
	add hl, de
	dec c
	jr nz, .line
	ret
; 0x9a7a

INCBIN "baserom.gbc", $9a7a, $a51e - $9a7a

SGBBorder:
INCBIN "gfx/misc/sgb_border.2bpp"

INCBIN "baserom.gbc", $a8be, $a8d6 - $a8be

PokemonPalettes:
INCLUDE "gfx/pics/palette_pointers.asm"

INCBIN "baserom.gbc", $b0ae, $b0d2 - $b0ae

TrainerPalettes:
INCLUDE "gfx/trainers/palette_pointers.asm"

INCBIN "baserom.gbc", $b1de, $b319 - $b1de

MornPal: ; 0xb319
INCBIN "tilesets/morn.pal"
; 0xb359

DayPal: ; 0xb359
INCBIN "tilesets/day.pal"
; 0xb399

NitePal: ; 0xb399
INCBIN "tilesets/nite.pal"
; 0xb3d9

DarkPal: ; 0xb3d9
INCBIN "tilesets/dark.pal"
; 0xb419

INCBIN "baserom.gbc", $b419, $b825 - $b419


SECTION "bank3",DATA,BANK[$3]

INCBIN "baserom.gbc", $c000, $29

SpecialsPointers: ; 0xc029
	dbw $25, $7c28
	dbw $0a, $5ce8
	dbw $0a, $5d11
	dbw $0a, $5d92
	dbw $0a, $5e66
	dbw $0a, $5e82
	dbw $0a, $5efa
	dbw $0a, $5eee
	dbw $0a, $5c92
	dbw $0a, $5cf1
	dbw $0a, $5cfa
	dbw $0a, $5bfb
	dbw $0a, $5c7b
	dbw $0a, $5ec4
	dbw $0a, $5ed9
	dbw $0a, $5eaf
	dbw $0a, $5f47
	dbw $03, $42f6
	dbw $03, $4309
	dbw $41, $50b9
	dbw $03, $434a
	dbw $13, $59e5
	dbw $04, $7a12
	dbw $04, $7a31
	dbw $04, $75db
	dbw $3e, $7b32
	dbw $3e, $7cd2
	dbw $03, $4658
	dbw $05, $559a
	dbw $03, $42e7
	dbw $05, $66d6
	dbw $05, $672a
	dbw $05, $6936
	dbw $0b, $4547
	dbw $05, $6218
	dbw $23, $4c04
	dbw $03, $429d
	dbw $24, $4913
	dbw $03, $42c0
	dbw $03, $42cd
	dbw $03, $4355
	dbw $03, $4360
	dbw $03, $4373
	dbw $03, $4380
	dbw $03, $438d
	dbw $03, $43db
	dbw $23, $4084
	dbw $23, $4092
	dbw $23, $40b6
	dbw $23, $4079
	dbw $23, $40ab
	dbw $00, $0d91
	dbw $00, $31f3
	dbw $00, $0485
	dbw $00, $0fc8
	dbw $00, $1ad2
	dbw $00, $0e4a
	dbw $03, $4230
	dbw $03, $4252
	dbw BANK(WaitSFX),WaitSFX
	dbw $00, $3cdf
	dbw $00, $3d47
	dbw $04, $6324
	dbw $02, $4379
	dbw $03, $425a
	dbw $03, $4268
	dbw $03, $4276
	dbw $03, $4284
	dbw $03, $43ef
	dbw $05, $7421
	dbw $05, $7440
	dbw $04, $79a8
	dbw $03, $43fc
	dbw $09, $6feb
	dbw $09, $7043
	dbw BANK(SpecialGiveShuckle), SpecialGiveShuckle
	dbw $01, $737e
	dbw $01, $73f7
	dbw BANK(SpecialCheckPokerus),SpecialCheckPokerus
	dbw $09, $4b25
	dbw $09, $4b4e
	dbw $09, $4ae8
	dbw $13, $587a
	dbw $03, $4434
	dbw $03, $4422
	dbw $13, $59d3
	dbw $22, $4018
	dbw $03, $42b9
	dbw $03, $42da
	dbw $01, $718d
	dbw $01, $71ac
	dbw $0a, $64ab
	dbw $0a, $651f
	dbw $0a, $6567
	dbw $05, $4209
	dbw $3e, $7841
	dbw BANK(SpecialSnorlaxAwake),SpecialSnorlaxAwake
	dbw $01, $7413
	dbw $01, $7418
	dbw $01, $741d
	dbw $03, $4472
	dbw $09, $65ee
	dbw BANK(SpecialGameboyCheck),SpecialGameboyCheck
	dbw BANK(SpecialTrainerHouse),SpecialTrainerHouse
	dbw $05, $6dc7
	dbw BANK(SpecialRoamMons), SpecialRoamMons
	dbw $03, $448f
	dbw $03, $449f
	dbw $03, $44ac
	dbw $46, $6c3e
	dbw $46, $7444
	dbw $46, $75e8
	dbw $46, $77e5
	dbw $46, $7879
	dbw $46, $7920
	dbw $46, $793b
	dbw $5c, $40b0
	dbw $5c, $40ba
	dbw $5c, $4114
	dbw $5c, $4215
	dbw $5c, $44e1
	dbw $5c, $421d
	dbw $5c, $4b44
	dbw $46, $7a38
	dbw $5c, $4bd3
	dbw $45, $7656
	dbw $00, $0150
	dbw $40, $51f1
	dbw $40, $5220
	dbw $40, $5225
	dbw $40, $5231
	dbw $12, $525b
	dbw $22, $6def
	dbw $47, $41ab
	dbw $5c, $4687
	dbw $22, $6e68
	dbw $5f, $5224
	dbw $5f, $52b6
	dbw $5f, $52ce
	dbw $5f, $753d
	dbw $40, $7612
	dbw BANK(SpecialHoOhChamber),SpecialHoOhChamber
	dbw $40, $6142
	dbw $12, $589a
	dbw $12, $5bf9
	dbw $13, $70bc
	dbw $22, $6f6b
	dbw $22, $6fd4
	dbw BANK(SpecialDratini),SpecialDratini
	dbw $04, $5485
	dbw BANK(SpecialBeastsCheck),SpecialBeastsCheck
	dbw BANK(SpecialMonCheck),SpecialMonCheck
	dbw $03, $4225
	dbw $5c, $4bd2
	dbw $40, $766e
	dbw $40, $77eb
	dbw $40, $783c
	dbw $41, $60a2
	dbw $05, $4168
	dbw $40, $77c2
	dbw $41, $630f
	dbw $40, $7780
	dbw $40, $787b
	dbw $12, $6e12
	dbw $41, $47eb
	dbw $12, $6927
	dbw $24, $4a54
	dbw $24, $4a88
	dbw $03, $4224

INCBIN "baserom.gbc", $c224, $c3e2 - $c224

ScriptReturnCarry: ; c3e2
	jr c, .carry
	xor a
	ld [ScriptVar], a
	ret
.carry
	ld a, 1
	ld [ScriptVar], a
	ret
; c3ef

INCBIN "baserom.gbc", $c3ef, $c419 - $c3ef

SpecialCheckPokerus: ; c419
; Check if a monster in your party has Pokerus
	callba CheckPokerus
	jp ScriptReturnCarry
; c422

INCBIN "baserom.gbc", $c422, $c43d - $c422

SpecialSnorlaxAwake: ; 0xc43d
; Check if the Poké Flute channel is playing, and if the player is standing
; next to Snorlax.

; outputs:
; ScriptVar is 1 if the conditions are met, otherwise 0.

; check background music
	ld a, [$c2c0]
	cp $40 ; Poké Flute Channel
	jr nz, .nope

	ld a, [XCoord]
	ld b, a
	ld a, [YCoord]
	ld c, a

	ld hl, .ProximityCoords
.loop
	ld a, [hli]
	cp $ff
	jr z, .nope
	cp b
	jr nz, .nextcoord
	ld a, [hli]
	cp c
	jr nz, .loop

	ld a, $1
	jr .done

.nextcoord
	inc hl
	jr .loop

.nope
	xor a
.done
	ld [ScriptVar], a
	ret

.ProximityCoords
	db $21, $08
	db $22, $0a
	db $23, $0a
	db $24, $08
	db $24, $09
	db $ff

INCBIN "baserom.gbc", $c472, $c478 - $c472

SpecialGameboyCheck: ; c478
; check cgb
	ld a, [hCGB]
	and a
	jr nz, .cgb
; check sgb
	ld a, [hSGB]
	and a
	jr nz, .sgb
; gb
	xor a
	jr .done
	
.sgb
	ld a, 1
	jr .done

.cgb
	ld a, 2
	
.done
	ld [ScriptVar], a
	ret

INCBIN "baserom.gbc", $c48f, $c4b9 - $c48f

SpecialTrainerHouse: ; 0xc4b9
	ld a, 0
	call GetSRAMBank
	ld a, [$abfd] ; XXX what is this memory location?
	ld [ScriptVar], a
	jp CloseSRAM

INCBIN "baserom.gbc", $c4c7, $c5d2 - $c4c7

PrintNumber_PrintDigit: ; c5d2
INCBIN "baserom.gbc", $c5d2, $c644 - $c5d2

PrintNumber_PrintLeadingZero: ; c644
; prints a leading zero unless they are turned off in the flags
	bit 7, d ; print leading zeroes?
	ret z
	ld [hl], "0"
	ret

PrintNumber_AdvancePointer: ; c64a
; increments the pointer unless leading zeroes are not being printed,
; the number is left-aligned, and no nonzero digits have been printed yet
	bit 7, d ; print leading zeroes?
	jr nz, .incrementPointer\@
	bit 6, d ; left alignment or right alignment?
	jr z, .incrementPointer\@
	ld a, [hPastLeadingZeroes]
	and a
	ret z
.incrementPointer\@
	inc hl
	ret
; 0xc658

INCBIN "baserom.gbc", $c658, $c706 - $c658

GetPartyNick: ; c706
; write CurPartyMon nickname to StringBuffer1-3
	ld hl, PartyMon1Nickname
	ld a, $02
	ld [$cf5f], a
	ld a, [CurPartyMon]
	call GetNick
	call CopyName1
; copy text from StringBuffer2 to StringBuffer3
	ld de, StringBuffer2
	ld hl, StringBuffer3
	call CopyName2
	ret
; c721

CheckFlag2: ; c721
; using bittable2
; check flag id in de
; return carry if flag is not set
	ld b, $02 ; check flag
	callba GetFlag2
	ld a, c
	and a
	jr nz, .isset
	scf
	ret
.isset
	xor a
	ret
; c731

CheckBadge: ; c731
; input: a = badge flag id ($1b-$2b)
	call CheckFlag2
	ret nc
	ld hl, BadgeRequiredText
	call $1d67 ; push text to queue
	scf
	ret
; c73d

BadgeRequiredText: ; c73d
	TX_FAR _BadgeRequiredText	; Sorry! A new BADGE
	db "@"						; is required.
; c742

CheckPartyMove: ; c742
; checks if a pokemon in your party has a move
; e = partymon being checked

; input: d = move id
	ld e, $00 ; mon #
	xor a
	ld [CurPartyMon], a
.checkmon
; check for valid species
	ld c, e
	ld b, $00
	ld hl, PartySpecies
	add hl, bc
	ld a, [hl]
	and a ; no id
	jr z, .quit
	cp a, $ff ; terminator
	jr z, .quit
	cp a, EGG
	jr z, .nextmon
; navigate to appropriate move table
	ld bc, PartyMon2 - PartyMon1
	ld hl, PartyMon1Moves
	ld a, e
	call AddNTimes
	ld b, $04 ; number of moves
.checkmove
	ld a, [hli]
	cp d ; move id
	jr z, .end
	dec b ; how many moves left?
	jr nz, .checkmove
.nextmon
	inc e ; mon #
	jr .checkmon
.end
	ld a, e
	ld [CurPartyMon], a ; which mon has the move
	xor a
	ret
.quit
	scf
	ret
; c779

INCBIN "baserom.gbc", $c779, $c986 - $c779

UsedSurfScript: ; c986
; print "[MON] used SURF!"
	2writetext UsedSurfText
	closetext
	loadmovesprites
; this does absolutely nothing
	3callasm BANK(Functionc9a2), Functionc9a2
; write surftype to PlayerState
	copybytetovar $d1eb ; Buffer2
	writevarcode VAR_MOVEMENT
; update sprite tiles
	special SPECIAL_UPDATESPRITETILES
; start surf music
	special SPECIAL_BIKESURFMUSIC
; step into the water
	special SPECIAL_LOADFACESTEP ; (slow_step_x, step_end)
	applymovement $00, $d007 ; PLAYER, MovementBuffer
	end
; c9a2

Functionc9a2: ; c9a2
	callba Function1060bb ; empty
	ret
; c9a9

UsedSurfText: ; c9a9
	TX_FAR _UsedSurfText ; [MONSTER] used
	db "@"	       ; SURF!
; c9ae

CantSurfText: ; c9ae
	TX_FAR _CantSurfText ; You can't SURF
	db "@"	       ; here.
; c9b3

AlreadySurfingText: ; c9b3
	TX_FAR _AlreadySurfingText ; You're already
	db "@"		     ; SURFING.
; c9b8

GetSurfType: ; c9b8
; get surfmon species
	ld a, [CurPartyMon]
	ld e, a
	ld d, $00
	ld hl, PartySpecies
	add hl, de
; is pikachu surfing?
	ld a, [hl]
	cp PIKACHU
	ld a, PLAYER_SURF_PIKA
	ret z
	ld a, PLAYER_SURF
	ret
; c9cb

CheckDirection: ; c9cb
; set carry if a tile permission prevents you
; from moving in the direction you are facing

; get player direction
	ld a, [PlayerDirection]
	and a, %00001100 ; bits 2 and 3 contain direction
	rrca
	rrca
	ld e, a
	ld d, $00
	ld hl, .DirectionTable
	add hl, de
; can you walk in this direction?
	ld a, [TilePermissions]
	and [hl]
	jr nz, .quit
	xor a
	ret
.quit
	scf
	ret
; c9e3

.DirectionTable ; c9e3
	db %00001000 ; down
	db %00000100 ; up
	db %00000010 ; left
	db %00000001 ; right
; c9e7

CheckSurfOW: ; c9e7
; called when checking a tile in the overworld
; check if you can surf
; return carry if conditions are met

; can we surf?
	ld a, [PlayerState]
	; are you already surfing (pikachu)?
	cp PLAYER_SURF_PIKA
	jr z, .quit
	; are you already surfing (normal)?
	cp PLAYER_SURF
	jr z, .quit
	; are you facing a surf tile?
	ld a, [$d03e] ; buffer for the tile you are facing (used for other things too)
	call GetTileType
	cp $01 ; surfable
	jr nz, .quit
	; does this contradict tile permissions?
	call CheckDirection
	jr c, .quit
	; do you have fog badge?
	ld de, $001e ; FLAG_FOG_BADGE
	call CheckFlag2
	jr c, .quit
	; do you have a monster with surf?
	ld d, SURF
	call CheckPartyMove
	jr c, .quit
	; can you get off the bike (cycling road)?
	ld hl, $dbf5 ; overworld flags
	bit 1, [hl] ; always on bike (can't surf)
	jr nz, .quit
	
; load surftype into MovementType
	call GetSurfType
	ld [$d1eb], a ; MovementType
	
; get surfmon nick
	call GetPartyNick
	
; run AskSurfScript
	ld a, BANK(AskSurfScript)
	ld hl, AskSurfScript
	call PushScriptPointer

; conditions were met
	scf
	ret
	
.quit
; conditions were not met
	xor a
	ret
; ca2c

AskSurfScript: ; ca2c
	loadfont
	2writetext AskSurfText
	yesorno
	iftrue UsedSurfScript
	loadmovesprites
	end

AskSurfText: ; ca36
	TX_FAR _AskSurfText	; The water is calm.
	db "@"				; Want to SURF?
; ca3b


INCBIN "baserom.gbc", $ca3b, $d407 - $ca3b


GetTMHMNumber: ; d407
; Return the number of a TM/HM by item id c.

	ld a, c

; Skip any dummy items.
	cp $c3 ; TM04-05
	jr c, .done
	cp $dc ; TM28-29
	jr c, .skip

	dec a
.skip
	dec a
.done
	sub TM_01
	inc a
	ld c, a
	ret
; d417


GetNumberedTMHM: ; d417
; Return the item id of a TM/HM by number c.

	ld a, c 

; Skip any gaps.
	cp 5
	jr c, .done
	cp 29
	jr c, .skip

	inc a
.skip
	inc a
.done
	add TM_01
	dec a
	ld c, a
	ret
; d427


CheckTossableItem: ; d427
; Return 1 in $d142 and carry if CurItem can't be removed from the bag.
	ld a, 4
	call GetItemAttr
	bit 7, a
	jr nz, Function0xd47f
	and a
	ret
; d432

CheckSelectableItem: ; d432
; Return 1 in $d142 and carry if CurItem can't be selected.
	ld a, 4
	call GetItemAttr
	bit 6, a
	jr nz, Function0xd47f
	and a
	ret
; d43d

CheckItemPocket: ; d43d
; Return the pocket for CurItem in $d142.
	ld a, 5
	call GetItemAttr
	and $f
	ld [$d142], a
	ret
; d448

CheckItemContext: ; d448
; Return the context for CurItem in $d142.
	ld a, 6
	call GetItemAttr
	and $f
	ld [$d142], a
	ret
; d453

CheckItemMenu: ; d453
; Return the menu for CurItem in $d142.
	ld a, 6
	call GetItemAttr
	swap a
	and $f
	ld [$d142], a
	ret
; d460

GetItemAttr: ; d460
; Get attribute a of CurItem.

	push hl
	push bc

	ld hl, ItemAttributes
	ld c, a
	ld b, 0
	add hl, bc

	xor a
	ld [$d142], a

	ld a, [CurItem]
	dec a
	ld c, a
	ld a, 7
	call AddNTimes
	ld a, BANK(ItemAttributes)
	call GetFarByte

	pop bc
	pop hl
	ret
; d47f

Function0xd47f: ; d47f
	ld a, 1
	ld [$d142], a
	scf
	ret
; d486


INCBIN "baserom.gbc", $d486, $fa0b - $d486


SECTION "bank4",DATA,BANK[$4]

INCBIN "baserom.gbc", $10000, $10b16 - $10000

PackGFX:
INCBIN "gfx/misc/pack.2bpp"

INCBIN "baserom.gbc", $113d6, $1167a - $113d6

TechnicalMachines: ; 0x1167a
	db DYNAMICPUNCH
	db HEADBUTT
	db CURSE
	db ROLLOUT
	db ROAR
	db TOXIC
	db ZAP_CANNON
	db ROCK_SMASH
	db PSYCH_UP
	db HIDDEN_POWER
	db SUNNY_DAY
	db SWEET_SCENT
	db SNORE
	db BLIZZARD
	db HYPER_BEAM
	db ICY_WIND
	db PROTECT
	db RAIN_DANCE
	db GIGA_DRAIN
	db ENDURE
	db FRUSTRATION
	db SOLARBEAM
	db IRON_TAIL
	db DRAGONBREATH
	db THUNDER
	db EARTHQUAKE
	db RETURN
	db DIG
	db PSYCHIC_M
	db SHADOW_BALL
	db MUD_SLAP
	db DOUBLE_TEAM
	db ICE_PUNCH
	db SWAGGER
	db SLEEP_TALK
	db SLUDGE_BOMB
	db SANDSTORM
	db FIRE_BLAST
	db SWIFT
	db DEFENSE_CURL
	db THUNDERPUNCH
	db DREAM_EATER
	db DETECT
	db REST
	db ATTRACT
	db THIEF
	db STEEL_WING
	db FIRE_PUNCH
	db FURY_CUTTER
	db NIGHTMARE
	db CUT
	db FLY
	db SURF
	db STRENGTH
	db FLASH
	db WHIRLPOOL
	db WATERFALL

INCBIN "baserom.gbc", $116b3, $11ce7 - $116b3

NameInputLower:
	db "a b c d e f g h i"
	db "j k l m n o p q r"
	db "s t u v w x y z  "
	db "× ( ) : ; [ ] ", $e1, " ", $e2
	db "UPPER  DEL   END "
BoxNameInputLower:
	db "a b c d e f g h i"
	db "j k l m n o p q r"
	db "s t u v w x y z  "
	db "é 'd 'l 'm 'r 's 't 'v 0"
	db "1 2 3 4 5 6 7 8 9"
	db "UPPER  DEL   END "
NameInputUpper:
	db "A B C D E F G H I"
	db "J K L M N O P Q R"
	db "S T U V W X Y Z  "
	db "- ? ! / . ,      "
	db "lower  DEL   END "
BoxNameInputUpper:
	db "A B C D E F G H I"
	db "J K L M N O P Q R"
	db "S T U V W X Y Z  "
	db "× ( ) : ; [ ] ", $e1, " ", $e2
	db "- ? ! ♂ ♀ / . , &"
	db "lower  DEL   END "

INCBIN "baserom.gbc", $11e5d, $12976 - $11e5d

OpenPartyMenu: ; $12976
	ld a, [PartyCount]
	and a
	jr z, .return ; no pokémon in party
	call $2b29 ; fade in?
.choosemenu ; 1297f
	xor a
	ld [PartyMenuActionText], a ; Choose a POKéMON.
	call $31f3 ; this is also a predef/special, something with delayframe
.menu ; 12986
	ld a, $14
	ld hl, $404f
	rst FarCall ; load gfx
	ld a, $14
	ld hl, $4405
	rst FarCall ; setup menu?
	ld a, $14
	ld hl, $43e0
	rst FarCall ; load menu pokémon sprites
.menunoreload ; 12998
	ld a, BANK(WritePartyMenuTilemap)
	ld hl, WritePartyMenuTilemap
	rst FarCall
	ld a, BANK(PrintPartyMenuText)
	ld hl, PrintPartyMenuText
	rst FarCall
	call $31f6
	call $32f9 ; load regular palettes?
	call DelayFrame
	ld a, BANK(PartyMenuSelect)
	ld hl, PartyMenuSelect
	rst FarCall
	jr c, .return ; if cancelled or pressed B
	call PokemonActionSubmenu
	cp $3
	jr z, .menu
	cp $0
	jr z, .choosemenu
	cp $1
	jr z, .menunoreload
	cp $2
	jr z, .quit
.return ; 129c8
	call $2b3c
	ld a, $0
	ret
.quit ; 129ce
	ld a, b
	push af
	call $2b4d
	pop af
	ret
; 0x129d5

INCBIN "baserom.gbc", $129d5, $12a88 - $129d5

PokemonActionSubmenu ; 0x12a88
	ld hl, $c5cd ; coord
	ld bc, $0212 ; box size
	call $0fb6 ; draw box
	ld a, $9
	ld hl, $4d19
	rst FarCall
	call $389c
	ld a, [$cf74] ; menu selection?
	ld hl, PokemonSubmenuActionPointerTable
	ld de, $0003 ; skip 3 bytes each time
	call IsInArray
	jr nc, .nothing
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
.nothing
	ld a, $0
	ret
; 0x12ab0

PokemonSubmenuActionPointerTable: ; 0x12ab0
    dbw $01, $6e1b
    dbw $02, $6e30
    dbw $03, $6ebd
    dbw $04, $6e6a
    dbw $06, $6e55
    dbw $07, $6e7f
    dbw $08, $6ed1
    dbw $09, $6ea9
    dbw $0a, $6ee6
    dbw $0d, $6ee6
    dbw $0b, $6f26
    dbw $05, $6e94
    dbw $0c, $6f3b
    dbw $0e, $6f50
    dbw $0f, OpenPartyStats ; stats
    dbw $10, $6aec ; switch
    dbw $11, $6b60 ; item
    dbw $12, $6a79
    dbw $13, $6fba ; move
    dbw $14, $6d45 ; mail
; no terminator?
; 0x12aec

INCBIN "baserom.gbc", $12aec, $12e00 - $12aec

OpenPartyStats: ; 12e00
	call $1d6e
	call $300b
	xor a
	ld [MonType], a ; partymon
	call LowVolume
	ld a, $25
	call Predef
	call MaxVolume
	call $1d7d
	ld a, $0
	ret
; 0x12e1b

INCBIN "baserom.gbc", $12e1b, $13b87 - $12e1b

GetSquareRoot: ; 13b87
; Return the square root of de in b.

; Rather than calculating the result, we take the index of the
; first value in a table of squares that isn't lower than de.

	ld hl, Squares
	ld b, 0
.loop
; Make sure we don't go past the end of the table.
	inc b
	ld a, b
	cp $ff
	ret z

; Iterate over the table until b**2 >= de.
	ld a, [hli]
	sub e
	ld a, [hli]
	sbc d

	jr c, .loop
	ret

Squares: ; 13b98
root	set 1
	rept $ff
	dw root*root
root	set root+1
	endr
; 13d96


SECTION "bank5",DATA,BANK[$5]

INCBIN "baserom.gbc", $14000, $14032 - $14000

GetTimeOfDay: ; 14032
; get time of day based on the current hour
	ld a, [hHours] ; hour
	ld hl, TimeOfDayTable
	
.check
; if we're within the given time period,
; get the corresponding time of day
	cp [hl]
	jr c, .match
; else, get the next entry
	inc hl
	inc hl
; try again
	jr .check
	
.match
; get time of day
	inc hl
	ld a, [hl]
	ld [TimeOfDay], a
	ret
; 14044

TimeOfDayTable: ; 14044
; boundaries for the time of day
; 04-09 morn | 10-17 day | 18-03 nite
;	   hr, time of day
	db 04, $02 ; NITE
	db 10, $00 ; MORN
	db 18, $01 ; DAY
	db 24, $02 ; NITE
; 1404c

INCBIN "baserom.gbc", $1404c, $152ab - $1404c

BlackoutPoints: ; 0x152ab
	db GROUP_KRISS_HOUSE_2F, MAP_KRISS_HOUSE_2F, 3, 3
	db GROUP_VIRIDIAN_POKECENTER_1F, MAP_VIRIDIAN_POKECENTER_1F, 5, 3 ; unused
	db GROUP_PALLET_TOWN, MAP_PALLET_TOWN, 5, 6
	db GROUP_VIRIDIAN_CITY, MAP_VIRIDIAN_CITY, 23, 26
	db GROUP_PEWTER_CITY, MAP_PEWTER_CITY, 13, 26
	db GROUP_CERULEAN_CITY, MAP_CERULEAN_CITY, 19, 22
	db GROUP_ROUTE_10A, MAP_ROUTE_10A, 11, 2
	db GROUP_VERMILION_CITY, MAP_VERMILION_CITY, 9, 6
	db GROUP_LAVENDER_TOWN, MAP_LAVENDER_TOWN, 5, 6
	db GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY, 9, 30
	db GROUP_CELADON_CITY, MAP_CELADON_CITY, 29, 10
	db GROUP_FUCHSIA_CITY, MAP_FUCHSIA_CITY, 19, 28
	db GROUP_CINNABAR_ISLAND, MAP_CINNABAR_ISLAND, 11, 12
	db GROUP_ROUTE_23, MAP_ROUTE_23, 9, 6
	db GROUP_NEW_BARK_TOWN, MAP_NEW_BARK_TOWN, 13, 6
	db GROUP_CHERRYGROVE_CITY, MAP_CHERRYGROVE_CITY, 29, 4
	db GROUP_VIOLET_CITY, MAP_VIOLET_CITY, 31, 26
	db GROUP_ROUTE_32, MAP_ROUTE_32, 11, 74
	db GROUP_AZALEA_TOWN, MAP_AZALEA_TOWN, 15, 10
	db GROUP_CIANWOOD_CITY, MAP_CIANWOOD_CITY, 23, 44
	db GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY, 15, 28
	db GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY, 13, 22
	db GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY, 23, 28
	db GROUP_MAHOGANY_TOWN, MAP_MAHOGANY_TOWN, 15, 14
	db GROUP_LAKE_OF_RAGE, MAP_LAKE_OF_RAGE, 21, 29
	db GROUP_BLACKTHORN_CITY, MAP_BLACKTHORN_CITY, 21, 30
	db GROUP_SILVER_CAVE_OUTSIDE, MAP_SILVER_CAVE_OUTSIDE, 23, 20
	db GROUP_FAST_SHIP_CABINS_SW_SSW_NW, MAP_FAST_SHIP_CABINS_SW_SSW_NW, 6, 2
	db $ff, $ff, $ff, $ff

INCBIN "baserom.gbc", $1531f, $174ba - $1531f


SECTION "bank6",DATA,BANK[$6]

Tileset03GFX: ; 0x18000
INCBIN "gfx/tilesets/03.lz"
; 0x18605

	db $00

Tileset03Meta: ; 0x18606
INCBIN "tilesets/03_metatiles.bin"
; 0x18e06

Tileset03Coll: ; 0x18e06
INCBIN "tilesets/03_collision.bin"
; 0x19006

Tileset00GFX: ; 0x19006
Tileset01GFX: ; 0x19006
INCBIN "gfx/tilesets/01.lz"
; 0x19c0d

	db $00

Tileset00Meta: ; 0x19c0e
Tileset01Meta: ; 0x19c0e
INCBIN "tilesets/01_metatiles.bin"
; 0x1a40e

Tileset00Coll: ; 0x1a40e
Tileset01Coll: ; 0x1a40e
INCBIN "tilesets/01_collision.bin"
; 0x1a60e

Tileset29GFX: ; 0x1a60e
INCBIN "gfx/tilesets/29.lz"
; 0x1af38

	db $00
	db $00
	db $00
	db $00
	db $00
	db $00

Tileset29Meta: ; 0x1af3e
INCBIN "tilesets/29_metatiles.bin"
; 0x1b33e

Tileset29Coll: ; 0x1b33e
INCBIN "tilesets/29_collision.bin"
; 0x1b43e

Tileset20GFX: ; 0x1b43e
INCBIN "gfx/tilesets/20.lz"
; 0x1b8f1

	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00

Tileset20Meta: ; 0x1b8fe
INCBIN "tilesets/20_metatiles.bin"
; 0x1bcfe

Tileset20Coll: ; 0x1bcfe
INCBIN "tilesets/20_collision.bin"
; 0x1bdfe


SECTION "bank7",DATA,BANK[$7]

INCBIN "baserom.gbc", $1c000, $1c30c - $1c000

Tileset07GFX: ; 0x1c30c
INCBIN "gfx/tilesets/07.lz"
; 0x1c73b

	db $00

Tileset07Meta: ; 0x1c73c
INCBIN "tilesets/07_metatiles.bin"
; 0x1cb3c

Tileset07Coll: ; 0x1cb3c
INCBIN "tilesets/07_collision.bin"
; 0x1cc3c

Tileset09GFX: ; 0x1cc3c
INCBIN "gfx/tilesets/09.lz"
; 0x1d047

	db $00
	db $00
	db $00
	db $00
	db $00

Tileset09Meta: ; 0x1d04c
INCBIN "tilesets/09_metatiles.bin"
; 0x1d44c

Tileset09Coll: ; 0x1d44c
INCBIN "tilesets/09_collision.bin"
; 0x1d54c

Tileset06GFX: ; 0x1d54c
INCBIN "gfx/tilesets/06.lz"
; 0x1d924

	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00

Tileset06Meta: ; 0x1d92c
INCBIN "tilesets/06_metatiles.bin"
; 0x1dd2c

Tileset06Coll: ; 0x1dd2c
INCBIN "tilesets/06_collision.bin"
; 0x1de2c

Tileset13GFX: ; 0x1de2c
INCBIN "gfx/tilesets/13.lz"
; 0x1e58c

Tileset13Meta: ; 0x1e58c
INCBIN "tilesets/13_metatiles.bin"
; 0x1e98c

Tileset13Coll: ; 0x1e98c
INCBIN "tilesets/13_collision.bin"
; 0x1ea8c

Tileset24GFX: ; 0x1ea8c
INCBIN "gfx/tilesets/24.lz"
; 0x1ee0e

	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00

Tileset24Meta: ; 0x1ee1c
Tileset30Meta: ; 0x1ee1c
INCBIN "tilesets/30_metatiles.bin"
; 0x1f21c

Tileset24Coll: ; 0x1f21c
Tileset30Coll: ; 0x1f21c
INCBIN "tilesets/30_collision.bin"
; 0x1f31c

;                           Songs i

Music_Credits:       INCLUDE "audio/music/credits.asm"
Music_Clair:         INCLUDE "audio/music/clair.asm"
Music_MobileAdapter: INCLUDE "audio/music/mobileadapter.asm"


SECTION "bank8",DATA,BANK[$8]

INCBIN "baserom.gbc", $20000, $20181 - $20000

Tileset23GFX: ; 0x20181
INCBIN "gfx/tilesets/23.lz"
; 0x206d2

	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00

Tileset23Meta: ; 0x206e1
INCBIN "tilesets/23_metatiles.bin"
; 0x20ae1

Tileset23Coll: ; 0x20ae1
INCBIN "tilesets/23_collision.bin"
; 0x20be1

Tileset10GFX: ; 0x20be1
INCBIN "gfx/tilesets/10.lz"
; 0x213e0

	db $00

Tileset10Meta: ; 0x213e1
INCBIN "tilesets/10_metatiles.bin"
; 0x217e1

Tileset10Coll: ; 0x217e1
INCBIN "tilesets/10_collision.bin"
; 0x218e1

Tileset12GFX: ; 0x218e1
INCBIN "gfx/tilesets/12.lz"
; 0x22026

	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00

Tileset12Meta: ; 0x22031
INCBIN "tilesets/12_metatiles.bin"
; 0x22431

Tileset12Coll: ; 0x22431
INCBIN "tilesets/12_collision.bin"
; 0x22531

Tileset14GFX: ; 0x22531
INCBIN "gfx/tilesets/14.lz"
; 0x22ae2

	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00

Tileset14Meta: ; 0x22af1
INCBIN "tilesets/14_metatiles.bin"
; 0x22ef1

Tileset14Coll: ; 0x22ef1
INCBIN "tilesets/14_collision.bin"
; 0x22ff1

Tileset17GFX: ; 0x22ff1
INCBIN "gfx/tilesets/17.lz"
; 0x23391

Tileset17Meta: ; 0x23391
INCBIN "tilesets/17_metatiles.bin"
; 0x23791

Tileset17Coll: ; 0x23791
INCBIN "tilesets/17_collision.bin"
; 0x23891

; todo
Tileset31Meta: ; 0x23891
INCBIN "tilesets/31_metatiles.bin", $0, $280
; 0x23b11

EggMovePointers: ; 0x23b11
INCLUDE "stats/egg_move_pointers.asm"

INCLUDE "stats/egg_moves.asm"


SECTION "bank9",DATA,BANK[$9]

INCBIN "baserom.gbc", $24000, $270c4 - $24000

GetTrainerDVs: ; 270c4
; get dvs based on trainer class
; output: bc
	push hl
; dec trainer class so there's no filler entry for $00
	ld a, [OtherTrainerClass]
	dec a
	ld c, a
	ld b, $0
; seek table
	ld hl, TrainerClassDVs
	add hl, bc
	add hl, bc
; get dvs
	ld a, [hli]
	ld b, a
	ld c, [hl]
; we're done
	pop hl
	ret
; 270d6

TrainerClassDVs ; 270d6
;   AtkDef, SpdSpc
	db $9A, $77 ; falkner
	db $88, $88 ; bugsy
	db $98, $88 ; whitney
	db $98, $88 ; morty
	db $98, $88 ; pryce
	db $98, $88 ; jasmine
	db $98, $88 ; chuck
	db $7C, $DD ; clair
	db $DD, $DD ; rival1
	db $98, $88 ; pokemon prof
	db $DC, $DD ; will
	db $DC, $DD ; cal
	db $DC, $DD ; bruno
	db $7F, $DF ; karen
	db $DC, $DD ; koga
	db $DC, $DD ; champion
	db $98, $88 ; brock
	db $78, $88 ; misty
	db $98, $88 ; lt surge
	db $98, $88 ; scientist
	db $78, $88 ; erika
	db $98, $88 ; youngster
	db $98, $88 ; schoolboy
	db $98, $88 ; bird keeper
	db $58, $88 ; lass
	db $98, $88 ; janine
	db $D8, $C8 ; cooltrainerm
	db $7C, $C8 ; cooltrainerf
	db $69, $C8 ; beauty
	db $98, $88 ; pokemaniac
	db $D8, $A8 ; gruntm
	db $98, $88 ; gentleman
	db $98, $88 ; skier
	db $68, $88 ; teacher
	db $7D, $87 ; sabrina
	db $98, $88 ; bug catcher
	db $98, $88 ; fisher
	db $98, $88 ; swimmerm
	db $78, $88 ; swimmerf
	db $98, $88 ; sailor
	db $98, $88 ; super nerd
	db $98, $88 ; rival2
	db $98, $88 ; guitarist
	db $A8, $88 ; hiker
	db $98, $88 ; biker
	db $98, $88 ; blaine
	db $98, $88 ; burglar
	db $98, $88 ; firebreather
	db $98, $88 ; juggler
	db $98, $88 ; blackbelt
	db $D8, $A8 ; executivem
	db $98, $88 ; psychic
	db $6A, $A8 ; picnicker
	db $98, $88 ; camper
	db $7E, $A8 ; executivef
	db $98, $88 ; sage
	db $78, $88 ; medium
	db $98, $88 ; boarder
	db $98, $88 ; pokefanm
	db $68, $8A ; kimono girl
	db $68, $A8 ; twins
	db $6D, $88 ; pokefanf
	db $FD, $DE ; red
	db $9D, $DD ; blue
	db $98, $88 ; officer
	db $7E, $A8 ; gruntf
	db $98, $88 ; mysticalman
; 2715c

INCBIN "baserom.gbc", $2715c, $271f4 - $2715c

MoveEffectsPointers: ; 271f4
INCLUDE "battle/moves/move_effects_pointers.asm"

MoveEffects: ; 2732e
INCLUDE "battle/moves/move_effects.asm"

INCBIN "baserom.gbc", $27a28, $27a2d - $27a28


SECTION "bankA",DATA,BANK[$A]

INCBIN "baserom.gbc", $28000, $2a2a0 - $28000

SpecialRoamMons: ; 2a2a0
; initialize RoamMon structs
; include commented-out parts from the gs function

; species
	ld a, RAIKOU
	ld [RoamMon1Species], a
	ld a, ENTEI
	ld [RoamMon2Species], a
;	ld a, SUICUNE
;	ld [RoamMon3Species], a

; level
	ld a, 40
	ld [RoamMon1Level], a
	ld [RoamMon2Level], a
;	ld [RoamMon3Level], a

; raikou starting map
	ld a, GROUP_ROUTE_42
	ld [RoamMon1MapGroup], a
	ld a, MAP_ROUTE_42
	ld [RoamMon1MapNumber], a

; entei starting map
	ld a, GROUP_ROUTE_37
	ld [RoamMon2MapGroup], a
	ld a, MAP_ROUTE_37
	ld [RoamMon2MapNumber], a

; suicune starting map
;	ld a, GROUP_ROUTE_38
;	ld [RoamMon3MapGroup], a
;	ld a, MAP_ROUTE_38
;	ld [RoamMon3MapNumber], a

; hp
	xor a ; generate new stats
	ld [RoamMon1CurHP], a
	ld [RoamMon2CurHP], a
;	ld [RoamMon3CurHP], a

	ret
; 2a2ce

INCBIN "baserom.gbc", $2a2ce, $2a5e9 - $2a2ce


WildMons1: ; 0x2a5e9
INCLUDE "stats/wild/johto_grass.asm"

WildMons2: ; 0x2b11d
INCLUDE "stats/wild/johto_water.asm"

WildMons3: ; 0x2b274
INCLUDE "stats/wild/kanto_grass.asm"

WildMons4: ; 0x2b7f7
INCLUDE "stats/wild/kanto_water.asm"

WildMons5: ; 0x2b8d0
INCLUDE "stats/wild/swarm_grass.asm"

WildMons6: ; 0x2b92f
INCLUDE "stats/wild/swarm_water.asm"


INCBIN "baserom.gbc", $2b930, $2ba1a - $2b930

PlayerGFX: ; 2ba1a
INCBIN "gfx/misc/player.lz"
; 2bba1

db 0, 0, 0, 0, 0, 0, 0, 0, 0 ; filler

DudeGFX: ; 2bbaa
INCBIN "gfx/misc/dude.lz"
; 2bce1


SECTION "bankB",DATA,BANK[$B]

INCBIN "baserom.gbc", $2C000, $2c1ef - $2C000

TrainerClassNames: ; 2c1ef
	db "LEADER@"
	db "LEADER@"
	db "LEADER@"
	db "LEADER@"
	db "LEADER@"
	db "LEADER@"
	db "LEADER@"
	db "LEADER@"
	db "RIVAL@"
	db "#MON PROF.@"
	db "ELITE FOUR@"
	db $4a, " TRAINER@"
	db "ELITE FOUR@"
	db "ELITE FOUR@"
	db "ELITE FOUR@"
	db "CHAMPION@"
	db "LEADER@"
	db "LEADER@"
	db "LEADER@"
	db "SCIENTIST@"
	db "LEADER@"
	db "YOUNGSTER@"
	db "SCHOOLBOY@"
	db "BIRD KEEPER@"
	db "LASS@"
	db "LEADER@"
	db "COOLTRAINER@"
	db "COOLTRAINER@"
	db "BEAUTY@"
	db "#MANIAC@"
	db "ROCKET@"
	db "GENTLEMAN@"
	db "SKIER@"
	db "TEACHER@"
	db "LEADER@"
	db "BUG CATCHER@"
	db "FISHER@"
	db "SWIMMER♂@"
	db "SWIMMER♀@"
	db "SAILOR@"
	db "SUPER NERD@"
	db "RIVAL@"
	db "GUITARIST@"
	db "HIKER@"
	db "BIKER@"
	db "LEADER@"
	db "BURGLAR@"
	db "FIREBREATHER@"
	db "JUGGLER@"
	db "BLACKBELT@"
	db "ROCKET@"
	db "PSYCHIC@"
	db "PICNICKER@"
	db "CAMPER@"
	db "ROCKET@"
	db "SAGE@"
	db "MEDIUM@"
	db "BOARDER@"
	db "#FAN@"
	db "KIMONO GIRL@"
	db "TWINS@"
	db "#FAN@"
	db $4a, " TRAINER@"
	db "LEADER@"
	db "OFFICER@"
	db "ROCKET@"
	db "MYSTICALMAN@"


INCBIN "baserom.gbc", $2c41a, $2ee6c - $2c41a


PlayBattleMusic: ; 2ee6c

	push hl
	push de
	push bc

	xor a
	ld [MusicFade], a
	ld de, MUSIC_NONE
	call StartMusic
	call DelayFrame
	call MaxVolume

	ld a, [BattleType]
	cp BATTLETYPE_SUICUNE
	ld de, MUSIC_SUICUNE_BATTLE
	jp z, .done
	cp BATTLETYPE_ROAMING
	jp z, .done

	; Are we fighting a trainer?
	ld a, [OtherTrainerClass]
	and a
	jr nz, .trainermusic

	ld a, BANK(RegionCheck)
	ld hl, RegionCheck
	rst FarCall
	ld a, e
	and a
	jr nz, .kantowild

	ld de, MUSIC_JOHTO_WILD_BATTLE
	ld a, [TimeOfDay]
	cp NITE
	jr nz, .done
	ld de, MUSIC_JOHTO_WILD_BATTLE_NIGHT
	jr .done

.kantowild
	ld de, MUSIC_KANTO_WILD_BATTLE
	jr .done

.trainermusic
	ld de, MUSIC_CHAMPION_BATTLE
	cp CHAMPION
	jr z, .done
	cp RED
	jr z, .done

	; really, they should have included admins and scientists here too...
	ld de, MUSIC_ROCKET_BATTLE
	cp GRUNTM
	jr z, .done
	cp GRUNTF
	jr z, .done

	ld de, MUSIC_KANTO_GYM_LEADER_BATTLE
	ld a, BANK(IsKantoGymLeader)
	ld hl, IsKantoGymLeader
	rst FarCall
	jr c, .done

	ld de, MUSIC_JOHTO_GYM_LEADER_BATTLE
	ld a, BANK(IsJohtoGymLeader)
	ld hl, IsJohtoGymLeader
	rst FarCall
	jr c, .done

	ld de, MUSIC_RIVAL_BATTLE
	ld a, [OtherTrainerClass]
	cp RIVAL1
	jr z, .done
	cp RIVAL2
	jr nz, .othertrainer

	ld a, [OtherTrainerID]
	cp 4 ; Rival in Indigo Plateau
	jr c, .done
	ld de, MUSIC_CHAMPION_BATTLE
	jr .done

.othertrainer
	ld a, [InLinkBattle]
	and a
	jr nz, .johtotrainer

	ld a, BANK(RegionCheck)
	ld hl, RegionCheck
	rst FarCall
	ld a, e
	and a
	jr nz, .kantotrainer

.johtotrainer
	ld de, MUSIC_JOHTO_TRAINER_BATTLE
	jr .done

.kantotrainer
	ld de, MUSIC_KANTO_TRAINER_BATTLE

.done
	call StartMusic

	pop bc
	pop de
	pop hl
	ret
; 2ef18


ClearBattleRAM: ; 2ef18
	xor a
	ld [$d0ec], a
	ld [$d0ee], a

	ld hl, $d0d8
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a

	ld [$d0e4], a
	ld [CriticalHit], a
	ld [BattleMonSpecies], a
	ld [$c664], a
	ld [CurBattleMon], a
	ld [$d232], a
	ld [TimeOfDayPal], a
	ld [PlayerTurnsTaken], a
	ld [EnemyTurnsTaken], a
	ld [EvolvableFlags], a

	ld hl, PlayerHPPal
	ld [hli], a
	ld [hl], a

	ld hl, BattleMonDVs
	ld [hli], a
	ld [hl], a

	ld hl, EnemyMonDVs
	ld [hli], a
	ld [hl], a

; Clear the entire BattleMons area
	ld hl, EnemyMoveStruct
	ld bc, $0139
	xor a
	call ByteFill

	ld hl, $5867
	ld a, $f
	rst FarCall

	call $1fbf

	ld hl, $ffd6
	xor a
	ld [hli], a
	ld [hl], $98
	ret
; 2ef6e


FillBox: ; 2ef6e
; Fill $c2c6-aligned box width b height c
; with iterating tile starting from $ffad at hl.
; Predef $13

	ld de, 20

	ld a, [$c2c6]
	and a
	jr nz, .left

	ld a, [$ffad]
.x1
	push bc
	push hl

.y1
	ld [hl], a
	add hl, de
	inc a
	dec c
	jr nz, .y1

	pop hl
	inc hl
	pop bc
	dec b
	jr nz, .x1
	ret

.left
; Right-aligned.
	push bc
	ld b, 0
	dec c
	add hl, bc
	pop bc

	ld a, [$ffad]
.x2
	push bc
	push hl

.y2
	ld [hl], a
	add hl, de
	inc a
	dec c
	jr nz, .y2

	pop hl
	dec hl
	pop bc
	dec b
	jr nz, .x2
	ret
; 2ef9f



SECTION "bankC",DATA,BANK[$C]

Tileset15GFX: ; 0x30000
INCBIN "gfx/tilesets/15.lz"
; 0x304d7

	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00

Tileset15Meta: ; 0x304e0
INCBIN "tilesets/15_metatiles.bin"
; 0x308e0

Tileset15Coll: ; 0x308e0
INCBIN "tilesets/15_collision.bin"
; 0x309e0

Tileset25GFX: ; 0x309e0
INCBIN "gfx/tilesets/25.lz"
; 0x30e78

	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00

Tileset25Meta: ; 0x30e80
INCBIN "tilesets/25_metatiles.bin"
; 0x31280

Tileset25Coll: ; 0x31280
INCBIN "tilesets/25_collision.bin"
; 0x31380

Tileset27GFX: ; 0x31380
INCBIN "gfx/tilesets/27.lz"
; 0x318dc

	db $00
	db $00
	db $00
	db $00

Tileset27Meta: ; 0x318e0
INCBIN "tilesets/27_metatiles.bin"
; 0x31ce0

Tileset27Coll: ; 0x31ce0
INCBIN "tilesets/27_collision.bin"
; 0x31de0

Tileset28GFX: ; 0x31de0
INCBIN "gfx/tilesets/28.lz"
; 0x321a6

	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00

Tileset28Meta: ; 0x321b0
INCBIN "tilesets/28_metatiles.bin"
; 0x325b0

Tileset28Coll: ; 0x325b0
INCBIN "tilesets/28_collision.bin"
; 0x326b0

Tileset30GFX: ; 0x326b0
INCBIN "gfx/tilesets/30.lz"
; 0x329ed

INCBIN "baserom.gbc", $329ed, $333f0 - $329ed


SECTION "bankD",DATA,BANK[$D]

INCLUDE "battle/effect_commands.asm"


SECTION "bankE",DATA,BANK[$E]

INCBIN "baserom.gbc", $38000, $38591 - $38000


Function_0x38591: ; 38591
	ld hl, Buffer1 - 1
	ld de, EnemyMonMoves
	ld b, EnemyMonMovesEnd - EnemyMonMoves + 1
.asm_38599
	dec b
	ret z

	inc hl
	ld a, [de]
	and a
	ret z

	inc de
	call $5508

	ld a, [EnemyMoveEffect]
	ld c, a

	push hl
	push de
	push bc
	ld a, $b
	ld hl, $441a
	rst FarCall
	pop bc
	pop de
	pop hl
	jr nz, .asm_385d6

	ld a, [EnemyMoveEffect]
	push hl
	push de
	push bc
	ld hl, .table_385db
	ld de, 1
	call IsInArray

	pop bc
	pop de
	pop hl
	jr nc, .asm_38599

	ld a, [BattleMonStatus]
	and a
	jr nz, .asm_385d6

	ld a, [PlayerScreens]
	bit 2, a
	jr z, .asm_38599

.asm_385d6
	call $5503

	jr .asm_38599
; 385db

.table_385db
	db EFFECT_SLEEP
	db EFFECT_TOXIC
	db EFFECT_POISON
	db EFFECT_PARALYZE
	db $ff
; 385e0



Function_0x385e0: ; 385e0
	ld hl, Buffer1 - 1
	ld de, EnemyMonMoves
	ld b, EnemyMonMovesEnd - EnemyMonMoves + 1
.next
	dec b
	ret z

	inc hl
	ld a, [de]
	and a
	ret z

	inc de
	call $5508

	ld a, [EnemyMoveEffect]

	cp EFFECT_ATTACK_UP
	jr c, .next
	cp EFFECT_EVASION_UP + 1
	jr c, .statup

;	cp EFFECT_ATTACK_DOWN - 1
	jr z, .next
	cp EFFECT_EVASION_DOWN + 1
	jr c, .statdown

	cp EFFECT_ATTACK_UP_2
	jr c, .next
	cp EFFECT_EVASION_UP_2 + 1
	jr c, .statup

;	cp EFFECT_ATTACK_DOWN_2 - 1
	jr z, .next
	cp EFFECT_EVASION_DOWN_2 + 1
	jr c, .statdown

	jr .next

.statup
	ld a, [EnemyTurnsTaken]
	and a
	jr nz, .asm_3862a

	jr .asm_38621

.statdown
	ld a, [PlayerTurnsTaken]
	and a
	jr nz, .asm_3862a

.asm_38621
	call $5527

	jr c, .next

	dec [hl]
	dec [hl]
	jr .next

.asm_3862a
	call RNG

	cp $1e
	jr c, .next

	inc [hl]
	inc [hl]
	jr .next
; 38635



Function_0x38635: ; 38635
	ld hl, Buffer1 - 1
	ld de, EnemyMonMoves
	ld b, EnemyMonMovesEnd - EnemyMonMoves + 1
.asm_3863d
	dec b
	ret z

	inc hl
	ld a, [de]
	and a
	ret z

	inc de
	call $5508

	push hl
	push bc
	push de
	ld a, 1
	ld [hBattleTurn], a
	ld hl, $47c8
	ld a, $d
	rst FarCall

	pop de
	pop bc
	pop hl
	ld a, [$d265]
	and a
	jr z, .asm_3869d

	cp $a
	jr z, .asm_3863d

	jr c, .asm_3866c

	ld a, [EnemyMovePower]
	and a
	jr z, .asm_3863d

	dec [hl]
	jr .asm_3863d

.asm_3866c
	push hl
	push de
	push bc
	ld a, [EnemyMoveType]
	ld d, a
	ld hl, EnemyMonMoves
	ld b, EnemyMonMovesEnd - EnemyMonMoves + 1
	ld c, 0
.asm_3867a
	dec b
	jr z, .asm_38693

	ld a, [hli]
	and a
	jr z, .asm_38693

	call $5508

	ld a, [EnemyMoveType]
	cp d
	jr z, .asm_3867a

	ld a, [EnemyMovePower]
	and a
	jr nz, .asm_38692

	jr .asm_3867a

.asm_38692
	ld c, a
.asm_38693
	ld a, c
	pop bc
	pop de
	pop hl
	and a
	jr z, .asm_3863d

	inc [hl]
	jr .asm_3863d

.asm_3869d
	call $5503

	jr .asm_3863d
; 386a2



Function_0x386a2: ; 386a2
	ld hl, Buffer1 - 1
	ld de, EnemyMonMoves
	ld b, EnemyMonMovesEnd - EnemyMonMoves + 1
.asm_386aa
	dec b
	ret z

	inc hl
	ld a, [de]
	and a
	ret z

	inc de
	call $5508

	ld a, [EnemyMovePower]
	and a
	jr nz, .asm_386aa

	inc [hl]
	inc [hl]
	jr .asm_386aa
; 386be



Function_0x386be: ; 386be
	ld hl, Buffer1
	ld de, EnemyMonMoves
	ld b, EnemyMonMovesEnd - EnemyMonMoves + 1
.asm_386c6
	dec b
	ret z

	ld a, [de]
	inc de
	and a
	ret z

	push de
	push bc
	push hl
	call $5508

	ld a, [EnemyMoveEffect]
	ld hl, .table_386f2
	ld de, 3
	call IsInArray

	inc hl
	jr nc, .asm_386ec

	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl
	push hl
	ld bc, .asm_386ec
	push bc
	push de
	ret

.asm_386ec
	pop hl
	pop bc
	pop de
	inc hl
	jr .asm_386c6
; 386f2

.table_386f2 ; 386f2
	dbw EFFECT_SLEEP,            AIScoring_Sleep
	dbw EFFECT_LEECH_HIT,        AIScoring_LeechHit
	dbw EFFECT_EXPLOSION,        AIScoring_Explosion
	dbw EFFECT_DREAM_EATER,      AIScoring_DreamEater
	dbw EFFECT_MIRROR_MOVE,      AIScoring_MirrorMove
	dbw EFFECT_EVASION_UP,       AIScoring_EvasionUp
	dbw EFFECT_ALWAYS_HIT,       AIScoring_AlwaysHit
	dbw EFFECT_ACCURACY_DOWN,    AIScoring_AccuracyDown
	dbw EFFECT_HAZE,             AIScoring_Haze
	dbw EFFECT_BIDE,             AIScoring_Bide
	dbw EFFECT_WHIRLWIND,        AIScoring_Whirlwind
	dbw EFFECT_HEAL,             AIScoring_Heal
	dbw EFFECT_TOXIC,            AIScoring_Toxic
	dbw EFFECT_LIGHT_SCREEN,     AIScoring_LightScreen
	dbw EFFECT_OHKO,             AIScoring_Ohko
	dbw EFFECT_RAZOR_WIND,       AIScoring_RazorWind
	dbw EFFECT_SUPER_FANG,       AIScoring_SuperFang
	dbw EFFECT_BIND,             AIScoring_Bind
	dbw EFFECT_UNUSED_2B,        AIScoring_Unused2B
	dbw EFFECT_CONFUSE,          AIScoring_Confuse
	dbw EFFECT_SP_DEFENSE_UP_2,  AIScoring_SpDefenseUp2
	dbw EFFECT_REFLECT,          AIScoring_Reflect
	dbw EFFECT_PARALYZE,         AIScoring_Paralyze
	dbw EFFECT_SPEED_DOWN_HIT,   AIScoring_SpeedDownHit
	dbw EFFECT_SUBSTITUTE,       AIScoring_Substitute
	dbw EFFECT_HYPER_BEAM,       AIScoring_HyperBeam
	dbw EFFECT_RAGE,             AIScoring_Rage
	dbw EFFECT_MIMIC,            AIScoring_Mimic
	dbw EFFECT_LEECH_SEED,       AIScoring_LeechSeed
	dbw EFFECT_DISABLE,          AIScoring_Disable
	dbw EFFECT_COUNTER,          AIScoring_Counter
	dbw EFFECT_ENCORE,           AIScoring_Encore
	dbw EFFECT_PAIN_SPLIT,       AIScoring_PainSplit
	dbw EFFECT_SNORE,            AIScoring_Snore
	dbw EFFECT_CONVERSION2,      AIScoring_Conversion2
	dbw EFFECT_LOCK_ON,          AIScoring_LockOn
	dbw EFFECT_DEFROST_OPPONENT, AIScoring_DefrostOpponent
	dbw EFFECT_SLEEP_TALK,       AIScoring_SleepTalk
	dbw EFFECT_DESTINY_BOND,     AIScoring_DestinyBond
	dbw EFFECT_REVERSAL,         AIScoring_Reversal
	dbw EFFECT_SPITE,            AIScoring_Spite
	dbw EFFECT_HEAL_BELL,        AIScoring_HealBell
	dbw EFFECT_PRIORITY_HIT,     AIScoring_PriorityHit
	dbw EFFECT_THIEF,            AIScoring_Thief
	dbw EFFECT_MEAN_LOOK,        AIScoring_MeanLook
	dbw EFFECT_NIGHTMARE,        AIScoring_Nightmare
	dbw EFFECT_FLAME_WHEEL,      AIScoring_FlameWheel
	dbw EFFECT_CURSE,            AIScoring_Curse
	dbw EFFECT_PROTECT,          AIScoring_Protect
	dbw EFFECT_FORESIGHT,        AIScoring_Foresight
	dbw EFFECT_PERISH_SONG,      AIScoring_PerishSong
	dbw EFFECT_SANDSTORM,        AIScoring_Sandstorm
	dbw EFFECT_ENDURE,           AIScoring_Endure
	dbw EFFECT_ROLLOUT,          AIScoring_Rollout
	dbw EFFECT_SWAGGER,          AIScoring_Swagger
	dbw EFFECT_FURY_CUTTER,      AIScoring_FuryCutter
	dbw EFFECT_ATTRACT,          AIScoring_Attract
	dbw EFFECT_SAFEGUARD,        AIScoring_Safeguard
	dbw EFFECT_MAGNITUDE,        AIScoring_Magnitude
	dbw EFFECT_BATON_PASS,       AIScoring_BatonPass
	dbw EFFECT_PURSUIT,          AIScoring_Pursuit
	dbw EFFECT_RAPID_SPIN,       AIScoring_RapidSpin
	dbw EFFECT_MORNING_SUN,      AIScoring_MorningSun
	dbw EFFECT_SYNTHESIS,        AIScoring_Synthesis
	dbw EFFECT_MOONLIGHT,        AIScoring_Moonlight
	dbw EFFECT_HIDDEN_POWER,     AIScoring_HiddenPower
	dbw EFFECT_RAIN_DANCE,       AIScoring_RainDance
	dbw EFFECT_SUNNY_DAY,        AIScoring_SunnyDay
	dbw EFFECT_BELLY_DRUM,       AIScoring_BellyDrum
	dbw EFFECT_PSYCH_UP,         AIScoring_PsychUp
	dbw EFFECT_MIRROR_COAT,      AIScoring_MirrorCoat
	dbw EFFECT_SKULL_BASH,       AIScoring_SkullBash
	dbw EFFECT_TWISTER,          AIScoring_Twister
	dbw EFFECT_EARTHQUAKE,       AIScoring_Earthquake
	dbw EFFECT_FUTURE_SIGHT,     AIScoring_FutureSight
	dbw EFFECT_GUST,             AIScoring_Gust
	dbw EFFECT_STOMP,            AIScoring_Stomp
	dbw EFFECT_SOLARBEAM,        AIScoring_Solarbeam
	dbw EFFECT_THUNDER,          AIScoring_Thunder
	dbw EFFECT_FLY,              AIScoring_Fly
	db $ff
; 387e3


AIScoring_Sleep: ; 387e3
	ld b, $8
	call $52ca

	jr c, .asm_387f0

	ld b, $6b
	call $52ca

	ret nc

.asm_387f0
	call $5527

	ret c
	dec [hl]
	dec [hl]
	ret
; 387f7


AIScoring_LeechHit: ; 387f7
	push hl
	ld a, $1
	ld [hBattleTurn], a
	ld hl, $47c8
	ld a, $d
	rst FarCall

	pop hl
	ld a, [$d265]
	cp $a
	jr c, .asm_38815

	ret z
	call $5251

	ret c
	call $5521

	ret c
	dec [hl]
	ret

.asm_38815
	call RNG

	cp $64
	ret c
	inc [hl]
	ret
; 3881d


AIScoring_LockOn: ; 3881d
	ld a, [PlayerSubStatus5]
	bit 5, a
	jr nz, .asm_38882

	push hl
	call $5298

	jr nc, .asm_38877

	call $5281

	jr c, .asm_38834

	call $5233

	jr nc, .asm_38877


.asm_38834
	ld a, [PlayerEvaLevel]
	cp $a
	jr nc, .asm_3887a

	cp $8
	jr nc, .asm_38875

	ld a, [EnemyAccLevel]
	cp $5
	jr c, .asm_3887a

	cp $7
	jr c, .asm_38875

	ld hl, EnemyMonMove1
	ld c, $5

.asm_3884f
	dec c
	jr z, .asm_38877

	ld a, [hli]
	and a
	jr z, .asm_38877

	call $5508

	ld a, [EnemyMoveAccuracy]
	cp $b4
	jr nc, .asm_3884f

	ld a, $1
	ld [hBattleTurn], a
	push hl
	push bc
	ld a, $d
	ld hl, $47c8
	rst FarCall

	ld a, [$d265]
	cp $a
	pop bc
	pop hl
	jr c, .asm_3884f


.asm_38875
	pop hl
	ret

.asm_38877
	pop hl
	inc [hl]
	ret

.asm_3887a
	pop hl
	call $5527

	ret c
	dec [hl]
	dec [hl]
	ret

.asm_38882
	push hl
	ld hl, $d1e9
	ld de, EnemyMonMove1
	ld c, $5

.asm_3888b
	inc hl
	dec c
	jr z, .asm_388a2

	ld a, [de]
	and a
	jr z, .asm_388a2

	inc de
	call $5508

	ld a, [EnemyMoveAccuracy]
	cp $b4
	jr nc, .asm_3888b

	dec [hl]
	dec [hl]
	jr .asm_3888b


.asm_388a2
	pop hl
	jp $5503

; 388a6


AIScoring_Explosion: ; 388a6
	push hl
	ld a, $d
	ld hl, $49f4
	rst FarCall

	pop hl
	jr nc, .asm_388b7

	push hl
	call $4e2e

	pop hl
	jr nz, .asm_388c6


.asm_388b7
	call $5281

	jr c, .asm_388c6

	call $5298

	ret nc
	call RNG

	cp $14
	ret c

.asm_388c6
	inc [hl]
	inc [hl]
	inc [hl]
	ret
; 388ca


AIScoring_DreamEater: ; 388ca
	call RNG

	cp $19
	ret c
	dec [hl]
	dec [hl]
	dec [hl]
	ret
; 388d4


AIScoring_EvasionUp: ; 388d4
	ld a, [EnemyEvaLevel]
	cp $d
	jp nc, $5503

	call $5251

	jr nc, .asm_388f2

	ld a, [PlayerSubStatus5]
	bit 0, a
	jr nz, .asm_388ef

	call RNG

	cp $b2
	jr nc, .asm_38911


.asm_388ef
	dec [hl]
	dec [hl]
	ret

.asm_388f2
	call $5298

	jr nc, .asm_3890f

	call RNG

	cp $a
	jr c, .asm_388ef

	call $5281

	jr nc, .asm_3890a

	call $5521

	jr c, .asm_388ef

	jr .asm_38911


.asm_3890a
	call $5527

	jr c, .asm_38911


.asm_3890f
	inc [hl]
	inc [hl]

.asm_38911
	ld a, [PlayerSubStatus5]
	bit 0, a
	jr nz, .asm_38938

	ld a, [PlayerSubStatus4]
	bit 7, a
	jr nz, .asm_38941

	ld a, [EnemyEvaLevel]
	ld b, a
	ld a, [PlayerAccLevel]
	cp b
	jr c, .asm_38936

	ld a, [PlayerFuryCutterCount]
	and a
	jr nz, .asm_388ef

	ld a, [PlayerSubStatus1]
	bit 6, a
	jr nz, .asm_388ef


.asm_38936
	inc [hl]
	ret

.asm_38938
	call RNG

	cp $50
	ret c
	dec [hl]
	dec [hl]
	ret

.asm_38941
	call $5527

	ret c
	dec [hl]
	ret
; 38947


AIScoring_AlwaysHit: ; 38947
	ld a, [EnemyAccLevel]
	cp $5
	jr c, .asm_38954

	ld a, [PlayerEvaLevel]
	cp $a
	ret c

.asm_38954
	call $5521

	ret c
	dec [hl]
	dec [hl]
	ret
; 3895b


AIScoring_MirrorMove: ; 3895b
	ld a, [LastEnemyCounterMove]
	and a
	jr nz, .asm_38968

	call $5233

	ret nc
	jp $5503


.asm_38968
	push hl
	ld hl, $5301
	ld de, $0001
	call IsInArray

	pop hl
	ret nc
	call $5527

	ret c
	dec [hl]
	call $5233

	ret nc
	call RNG

	cp $19
	ret c
	dec [hl]
	ret
; 38985


AIScoring_AccuracyDown: ; 38985
	call $5246

	jr nc, .asm_389a0

	call $5281

	jr nc, .asm_389a0

	ld a, [PlayerSubStatus5]
	bit 0, a
	jr nz, .asm_3899d

	call RNG

	cp $b2
	jr nc, .asm_389bf


.asm_3899d
	dec [hl]
	dec [hl]
	ret

.asm_389a0
	call $52b3

	jr nc, .asm_389bd

	call RNG

	cp $a
	jr c, .asm_3899d

	call $526e

	jr nc, .asm_389b8

	call $5521

	jr c, .asm_3899d

	jr .asm_389bf


.asm_389b8
	call $5527

	jr c, .asm_389bf


.asm_389bd
	inc [hl]
	inc [hl]

.asm_389bf
	ld a, [PlayerSubStatus5]
	bit 0, a
	jr nz, .asm_389e6

	ld a, [PlayerSubStatus4]
	bit 7, a
	jr nz, .asm_389ef

	ld a, [EnemyEvaLevel]
	ld b, a
	ld a, [PlayerAccLevel]
	cp b
	jr c, .asm_389e4

	ld a, [PlayerFuryCutterCount]
	and a
	jr nz, .asm_3899d

	ld a, [PlayerSubStatus1]
	bit 6, a
	jr nz, .asm_3899d


.asm_389e4
	inc [hl]
	ret

.asm_389e6
	call RNG

	cp $50
	ret c
	dec [hl]
	dec [hl]
	ret

.asm_389ef
	call $5527

	ret c
	dec [hl]
	ret
; 389f5


AIScoring_Haze: ; 389f5
	push hl
	ld hl, EnemyAtkLevel
	ld c, $8

.asm_389fb
	dec c
	jr z, .asm_38a05

	ld a, [hli]
	cp $5
	jr c, .asm_38a12

	jr .asm_389fb


.asm_38a05
	ld hl, PlayerAtkLevel
	ld c, $8

.asm_38a0a
	dec c
	jr z, .asm_38a1b

	ld a, [hli]
	cp $a
	jr c, .asm_38a0a


.asm_38a12
	pop hl
	call RNG

	cp $28
	ret c
	dec [hl]
	ret

.asm_38a1b
	pop hl
	inc [hl]
	ret
; 38a1e


AIScoring_Bide: ; 38a1e
	call $5251

	ret c
	call RNG

	cp $19
	ret c
	inc [hl]
	ret
; 38a2a


AIScoring_Whirlwind: ; 38a2a
	push hl
	ld hl, $484e
	ld a, $d
	rst FarCall

	ld a, [$c716]
	cp $a
	pop hl
	ret c
	inc [hl]
	ret
; 38a3a


AIScoring_Heal:
AIScoring_MorningSun:
AIScoring_Synthesis:
AIScoring_Moonlight: ; 38a3a
	call $5298

	jr nc, .asm_38a45

	call $5281

	ret nc
	inc [hl]
	ret

.asm_38a45
	call RNG

	cp $19
	ret c
	dec [hl]
	dec [hl]
	ret
; 38a4e


AIScoring_Toxic:
AIScoring_LeechSeed: ; 38a4e
	call $526e

	ret c
	inc [hl]
	ret
; 38a54


AIScoring_LightScreen:
AIScoring_Reflect: ; 38a54
	call $5251

	ret c
	call RNG

	cp $14
	ret c
	inc [hl]
	ret
; 38a60


AIScoring_Ohko: ; 38a60
	ld a, [BattleMonLevel]
	ld b, a
	ld a, [EnemyMonLevel]
	cp b
	jp c, $5503

	call $526e

	ret c
	inc [hl]
	ret
; 38a71


AIScoring_Bind: ; 38a71
	ld a, [$c730]
	and a
	jr nz, .asm_38a8b

	ld a, [PlayerSubStatus5]
	bit 0, a
	jr nz, .asm_38a91

	ld a, [PlayerSubStatus1]
	and $c9
	jr nz, .asm_38a91

	ld a, [PlayerTurnsTaken]
	and a
	jr z, .asm_38a91


.asm_38a8b
	call $5527

	ret c
	inc [hl]
	ret

.asm_38a91
	call $5298

	ret nc
	call $5527

	ret c
	dec [hl]
	dec [hl]
	ret
; 38a9c


AIScoring_RazorWind:
AIScoring_Unused2B: ; 38a9c
	ld a, [EnemySubStatus1]
	bit 4, a
	jr z, .asm_38aaa

	ld a, [EnemyPerishCount]
	cp $3
	jr c, .asm_38ad3


.asm_38aaa
	push hl
	ld hl, PlayerUsedMoves
	ld c, $4

.asm_38ab0
	ld a, [hli]
	and a
	jr z, .asm_38ac1

	call $5508

	ld a, [EnemyMoveEffect]
	cp $6f
	jr z, .asm_38ad5

	dec c
	jr nz, .asm_38ab0


.asm_38ac1
	pop hl
	ld a, [EnemySubStatus3]
	bit 7, a
	jr nz, .asm_38acd

	call $5281

	ret c

.asm_38acd
	call RNG

	cp $c8
	ret c

.asm_38ad3
	inc [hl]
	ret

.asm_38ad5
	pop hl
	ld a, [hl]
	add $6
	ld [hl], a
	ret
; 38adb


AIScoring_Confuse: ; 38adb
	call $526e

	ret c
	call RNG

	cp $19
	jr c, .asm_38ae7

	inc [hl]

.asm_38ae7
	call $52b3

	ret c
	inc [hl]
	ret
; 38aed


AIScoring_SpDefenseUp2: ; 38aed
	call $5281

	jr nc, .asm_38b10

	ld a, [EnemySDefLevel]
	cp $b
	jr nc, .asm_38b10

	cp $9
	ret nc
	ld a, [BattleMonType1]
	cp $14
	jr nc, .asm_38b09

	ld a, [BattleMonType2]
	cp $14
	ret c

.asm_38b09
	call $5521

	ret c
	dec [hl]
	dec [hl]
	ret

.asm_38b10
	inc [hl]
	ret
; 38b12


AIScoring_Fly: ; 38b12
	ld a, [PlayerSubStatus3]
	and $60
	ret z
	call $5233

	ret nc
	dec [hl]
	dec [hl]
	dec [hl]
	ret
; 38b20


AIScoring_SuperFang: ; 38b20
	call $52b3

	ret c
	inc [hl]
	ret
; 38b26


AIScoring_Paralyze: ; 38b26
	call $52b3

	jr nc, .asm_38b3a

	call $5233

	ret c
	call $5298

	ret nc
	call $5521

	ret c
	dec [hl]
	dec [hl]
	ret

.asm_38b3a
	call $5527

	ret c
	inc [hl]
	ret
; 38b40


AIScoring_SpeedDownHit: ; 38b40
	ld a, [EnemyMoveAnimation]
	cp $c4
	ret nz
	call $5298

	ret nc
	ld a, [PlayerTurnsTaken]
	and a
	ret nz
	call $5233

	ret c
	call RNG

	cp $1e
	ret c
	dec [hl]
	dec [hl]
	ret
; 38b5c


AIScoring_Substitute: ; 38b5c
	call $5281

	ret c
	jp $5503

; 38b63


AIScoring_HyperBeam: ; 38b63
	call $5281

	jr c, .asm_38b72

	call $5298

	ret c
	call $5527

	ret c
	dec [hl]
	ret

.asm_38b72
	call RNG

	cp $28
	ret c
	inc [hl]
	call $5527

	ret c
	inc [hl]
	ret
; 38b7f


AIScoring_Rage: ; 38b7f
	ld a, [EnemySubStatus4]
	bit 6, a
	jr z, .asm_38b9b

	call $5527

	jr c, .asm_38b8c

	dec [hl]

.asm_38b8c
	ld a, [$c72c]
	cp $2
	ret c
	dec [hl]
	ld a, [$c72c]
	cp $3
	ret c
	dec [hl]
	ret

.asm_38b9b
	call $5281

	jr nc, .asm_38ba6

	call $5521

	ret nc
	dec [hl]
	ret

.asm_38ba6
	inc [hl]
	ret
; 38ba8


AIScoring_Mimic: ; 38ba8
	ld a, [LastEnemyCounterMove]
	and a
	jr z, .asm_38be9

	call $5281

	jr nc, .asm_38bef

	push hl
	ld a, [LastEnemyCounterMove]
	call $5508

	ld a, $1
	ld [hBattleTurn], a
	ld hl, $47c8
	ld a, $d
	rst FarCall

	ld a, [$d265]
	cp $a
	pop hl
	jr c, .asm_38bef

	jr z, .asm_38bd4

	call $5527

	jr c, .asm_38bd4

	dec [hl]

.asm_38bd4
	ld a, [LastEnemyCounterMove]
	push hl
	ld hl, $5301
	ld de, $0001
	call IsInArray

	pop hl
	ret nc
	call $5527

	ret c
	dec [hl]
	ret

.asm_38be9
	call $5233

	jp c, $5503


.asm_38bef
	inc [hl]
	ret
; 38bf1


AIScoring_Counter: ; 38bf1
	push hl
	ld hl, PlayerUsedMoves
	ld c, $4
	ld b, $0

.asm_38bf9
	ld a, [hli]
	and a
	jr z, .asm_38c0e

	call $5508

	ld a, [EnemyMovePower]
	and a
	jr z, .asm_38c0e

	ld a, [EnemyMoveType]
	cp $14
	jr nc, .asm_38c0e

	inc b

.asm_38c0e
	dec c
	jr nz, .asm_38bf9

	pop hl
	ld a, b
	and a
	jr z, .asm_38c39

	cp $3
	jr nc, .asm_38c30

	ld a, [LastEnemyCounterMove]
	and a
	jr z, .asm_38c38

	call $5508

	ld a, [EnemyMovePower]
	and a
	jr z, .asm_38c38

	ld a, [EnemyMoveType]
	cp $14
	jr nc, .asm_38c38


.asm_38c30
	call RNG

	cp $64
	jr c, .asm_38c38

	dec [hl]

.asm_38c38
	ret

.asm_38c39
	inc [hl]
	ret
; 38c3b


AIScoring_Encore: ; 38c3b
	call $5233

	jr nc, .asm_38c81

	ld a, [LastPlayerMove]
	and a
	jp z, $5503

	call $5508

	ld a, [EnemyMovePower]
	and a
	jr z, .asm_38c68

	push hl
	ld a, [EnemyMoveType]
	ld hl, EnemyMonType1
	ld a, $41
	call Predef

	pop hl
	ld a, [$d265]
	cp $a
	jr nc, .asm_38c68

	and a
	ret nz
	jr .asm_38c78


.asm_38c68
	push hl
	ld a, [LastEnemyCounterMove]
	ld hl, $4c85
	ld de, $0001
	call IsInArray

	pop hl
	jr nc, .asm_38c81


.asm_38c78
	call RNG

	cp $46
	ret c
	dec [hl]
	dec [hl]
	ret

.asm_38c81
	inc [hl]
	inc [hl]
	inc [hl]
	ret
; 38c85



INCBIN "baserom.gbc", $38c85, $38ca4 - $38c85



AIScoring_PainSplit: ; 38ca4
	push hl
	ld hl, EnemyMonHPHi
	ld b, [hl]
	inc hl
	ld c, [hl]
	sla c
	rl b
	ld hl, $c63d
	ld a, [hld]
	cp c
	ld a, [hl]
	sbc b
	pop hl
	ret nc
	inc [hl]
	ret
; 38cba


AIScoring_Snore:
AIScoring_SleepTalk: ; 38cba
	ld a, [EnemyMonStatus]
	and $7
	cp $1
	jr z, .asm_38cc7

	dec [hl]
	dec [hl]
	dec [hl]
	ret

.asm_38cc7
	inc [hl]
	inc [hl]
	inc [hl]
	ret
; 38ccb


AIScoring_DefrostOpponent: ; 38ccb
	ld a, [EnemyMonStatus]
	and $20
	ret z
	dec [hl]
	dec [hl]
	dec [hl]
	ret
; 38cd5


AIScoring_Spite: ; 38cd5
	ld a, [LastEnemyCounterMove]
	and a
	jr nz, .asm_38ce7

	call $5233

	jp c, $5503

	call $5527

	ret c
	inc [hl]
	ret

.asm_38ce7
	push hl
	ld b, a
	ld c, $4
	ld hl, BattleMonMove1
	ld de, BattleMonPPMove1

.asm_38cf1
	ld a, [hli]
	cp b
	jr z, .asm_38cfb

	inc de
	dec c
	jr nz, .asm_38cf1

	pop hl
	ret

.asm_38cfb
	pop hl
	ld a, [de]
	cp $6
	jr c, .asm_38d0d

	cp $f
	jr nc, .asm_38d0b

	call RNG

	cp $64
	ret nc

.asm_38d0b
	inc [hl]
	ret

.asm_38d0d
	call RNG

	cp $64
	ret c
	dec [hl]
	dec [hl]
	ret
; 38d16



INCBIN "baserom.gbc", $38d16, $38d19 - $38d16



AIScoring_DestinyBond:
AIScoring_Reversal:
AIScoring_SkullBash: ; 38d19
	call $5298

	ret nc
	inc [hl]
	ret
; 38d1f


AIScoring_HealBell: ; 38d1f
	push hl
	ld a, [OTPartyCount]
	ld b, a
	ld c, $0
	ld hl, OTPartyMon1CurHP
	ld de, $0030

.asm_38d2c
	push hl
	ld a, [hli]
	or [hl]
	jr z, .asm_38d37

	dec hl
	dec hl
	dec hl
	ld a, [hl]
	or c
	ld c, a

.asm_38d37
	pop hl
	add hl, de
	dec b
	jr nz, .asm_38d2c

	pop hl
	ld a, c
	and a
	jr z, .asm_38d52

	ld a, [EnemyMonStatus]
	and a
	jr z, .asm_38d48

	dec [hl]

.asm_38d48
	and $27
	ret z
	call $5527

	ret c
	dec [hl]
	dec [hl]
	ret

.asm_38d52
	ld a, [EnemyMonStatus]
	and a
	ret nz
	jp $5503

; 38d5a


AIScoring_PriorityHit: ; 38d5a
	call $5233

	ret c
	ld a, [PlayerSubStatus3]
	and $60
	jp nz, $5503

	ld a, $1
	ld [hBattleTurn], a
	push hl
	ld hl, $53f6
	ld a, $d
	rst FarCall

	ld hl, $5612
	ld a, $d
	rst FarCall

	ld hl, $46d2
	ld a, $d
	rst FarCall

	pop hl
	ld a, [$d257]
	ld c, a
	ld a, [CurDamage]
	ld b, a
	ld a, [$c63d]
	cp c
	ld a, [BattleMonHP]
	sbc b
	ret nc
	dec [hl]
	dec [hl]
	dec [hl]
	ret
; 38d93


AIScoring_Thief: ; 38d93
	ld a, [hl]
	add $1e
	ld [hl], a
	ret
; 38d98


AIScoring_Conversion2: ; 38d98
	ld a, [LastPlayerMove]
	and a
	jr nz, .asm_38dc9

	push hl
	dec a
	ld hl, $5afe
	ld bc, $0007
	call AddNTimes

	ld a, $10
	call GetFarByte

	ld [PlayerMoveType], a
	xor a
	ld [hBattleTurn], a
	ld hl, $47c8
	ld a, $d
	rst FarCall

	ld a, [$d265]
	cp $a
	pop hl
	jr c, .asm_38dc9

	ret z
	call $5527

	ret c
	dec [hl]
	ret

.asm_38dc9
	call RNG

	cp $19
	ret c
	inc [hl]
	ret
; 38dd1


AIScoring_Disable: ; 38dd1
	call $5233

	jr nc, .asm_38df3

	push hl
	ld a, [LastEnemyCounterMove]
	ld hl, $5301
	ld de, $0001
	call IsInArray

	pop hl
	jr nc, .asm_38dee

	call RNG

	cp $64
	ret c
	dec [hl]
	ret

.asm_38dee
	ld a, [EnemyMovePower]
	and a
	ret nz

.asm_38df3
	call RNG

	cp $14
	ret c
	inc [hl]
	ret
; 38dfb


AIScoring_MeanLook: ; 38dfb
	call $5281

	jr nc, .asm_38e24

	push hl
	call $4e2e

	pop hl
	jp z, $5503

	ld a, [EnemySubStatus5]
	bit 0, a
	jr nz, .asm_38e26

	ld a, [PlayerSubStatus1]
	and $c9
	jr nz, .asm_38e26

	push hl
	ld hl, $484e
	ld a, $d
	rst FarCall

	ld a, [$c716]
	cp $b
	pop hl
	ret nc

.asm_38e24
	inc [hl]
	ret

.asm_38e26
	call $5521

	ret c
	dec [hl]
	dec [hl]
	dec [hl]
	ret
; 38e2e



INCBIN "baserom.gbc", $38e2e, $38e4a - $38e2e



AIScoring_Nightmare: ; 38e4a
	call $5527

	ret c
	dec [hl]
	ret
; 38e50


AIScoring_FlameWheel: ; 38e50
	ld a, [EnemyMonStatus]
	bit 5, a
	ret z
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	ret
; 38e5c


AIScoring_Curse: ; 38e5c
	ld a, [EnemyMonType1]
	cp $8
	jr z, .asm_38e95

	ld a, [EnemyMonType2]
	cp $8
	jr z, .asm_38e95

	call $5281

	jr nc, .asm_38e93

	ld a, [EnemyAtkLevel]
	cp $b
	jr nc, .asm_38e93

	cp $9
	ret nc
	ld a, [BattleMonType1]
	cp $8
	jr z, .asm_38e92

	cp $14
	ret nc
	ld a, [BattleMonType2]
	cp $14
	ret nc
	call $5521

	ret c
	dec [hl]
	dec [hl]
	ret

.asm_38e90
	inc [hl]
	inc [hl]

.asm_38e92
	inc [hl]

.asm_38e93
	inc [hl]
	ret

.asm_38e95
	ld a, [PlayerSubStatus1]
	bit 1, a
	jp nz, $5503

	push hl
	ld a, $d
	ld hl, $49f4
	rst FarCall

	pop hl
	jr nc, .asm_38eb0

	push hl
	call $4e2e

	pop hl
	jr nz, .asm_38e90

	jr .asm_38eb7


.asm_38eb0
	push hl
	call $4e2e

	pop hl
	jr z, .asm_38ecb


.asm_38eb7
	call $5298

	jp nc, $4e90

	call $5281

	jr nc, .asm_38e92

	call $5251

	ret nc
	ld a, [PlayerTurnsTaken]
	and a
	ret nz

.asm_38ecb
	call $5527

	ret c
	dec [hl]
	dec [hl]
	ret
; 38ed2


AIScoring_Protect: ; 38ed2
	ld a, [$c681]
	and a
	jr nz, .asm_38f13

	ld a, [PlayerSubStatus5]
	bit 5, a
	jr nz, .asm_38f14

	ld a, [PlayerFuryCutterCount]
	cp $3
	jr nc, .asm_38f0d

	ld a, [PlayerSubStatus3]
	bit 4, a
	jr nz, .asm_38f0d

	ld a, [PlayerSubStatus5]
	bit 0, a
	jr nz, .asm_38f0d

	ld a, [PlayerSubStatus4]
	bit 7, a
	jr nz, .asm_38f0d

	ld a, [PlayerSubStatus1]
	bit 1, a
	jr nz, .asm_38f0d

	bit 6, a
	jr z, .asm_38f14

	ld a, [PlayerRolloutCount]
	cp $3
	jr c, .asm_38f14


.asm_38f0d
	call $5521

	ret c
	dec [hl]
	ret

.asm_38f13
	inc [hl]

.asm_38f14
	call RNG

	cp $14
	ret c
	inc [hl]
	inc [hl]
	ret
; 38f1d


AIScoring_Foresight: ; 38f1d
	ld a, [EnemyAccLevel]
	cp $5
	jr c, .asm_38f41

	ld a, [PlayerEvaLevel]
	cp $a
	jr nc, .asm_38f41

	ld a, [BattleMonType1]
	cp $8
	jr z, .asm_38f41

	ld a, [BattleMonType2]
	cp $8
	jr z, .asm_38f41

	call RNG

	cp $14
	ret c
	inc [hl]
	ret

.asm_38f41
	call RNG

	cp $64
	ret c
	dec [hl]
	dec [hl]
	ret
; 38f4a


AIScoring_PerishSong: ; 38f4a
	push hl
	ld hl, $49f4
	ld a, $d
	rst FarCall

	pop hl
	jr c, .asm_38f75

	ld a, [PlayerSubStatus5]
	bit 7, a
	jr nz, .asm_38f6f

	push hl
	ld hl, $484e
	ld a, $d
	rst FarCall

	ld a, [$c716]
	cp $a
	pop hl
	ret c
	call $5527

	ret c
	inc [hl]
	ret

.asm_38f6f
	call $5527

	ret c
	dec [hl]
	ret

.asm_38f75
	ld a, [hl]
	add $5
	ld [hl], a
	ret
; 38f7a


AIScoring_Sandstorm: ; 38f7a
	ld a, [BattleMonType1]
	push hl
	ld hl, $4fa8
	ld de, $0001
	call IsInArray

	pop hl
	jr c, .asm_38fa5

	ld a, [BattleMonType2]
	push hl
	ld hl, $4fa8
	ld de, $0001
	call IsInArray

	pop hl
	jr c, .asm_38fa5

	call $526e

	jr nc, .asm_38fa6

	call $5527

	ret c
	dec [hl]
	ret

.asm_38fa5
	inc [hl]

.asm_38fa6
	inc [hl]
	ret
; 38fa8



INCBIN "baserom.gbc", $38fa8, $38fac - $38fa8



AIScoring_Endure: ; 38fac
	ld a, [$c681]
	and a
	jr nz, .asm_38fd8

	call $5251

	jr c, .asm_38fd8

	call $5298

	jr c, .asm_38fd9

	ld b, $63
	call $52ca

	jr nc, .asm_38fcb

	call $5521

	ret c
	dec [hl]
	dec [hl]
	dec [hl]
	ret

.asm_38fcb
	ld a, [EnemySubStatus5]
	bit 5, a
	ret z
	call $5527

	ret c
	dec [hl]
	dec [hl]
	ret

.asm_38fd8
	inc [hl]

.asm_38fd9
	inc [hl]
	ret
; 38fdb


AIScoring_FuryCutter: ; 38fdb
	ld a, [EnemyFuryCutterCount]
	and a
	jr z, AIScoring_Rollout

	dec [hl]
	cp $2
	jr c, AIScoring_Rollout

	dec [hl]
	dec [hl]
	cp $3
	jr c, AIScoring_Rollout

	dec [hl]
	dec [hl]
	dec [hl]

	; fallthrough
; 38fef


AIScoring_Rollout: ; 38fef
	ld a, [EnemySubStatus1]
	bit 7, a
	jr nz, .asm_39020

	ld a, [EnemySubStatus3]
	bit 7, a
	jr nz, .asm_39020

	ld a, [EnemyMonStatus]
	bit 6, a
	jr nz, .asm_39020

	call $5298

	jr nc, .asm_39020

	ld a, [EnemyAccLevel]
	cp $7
	jr c, .asm_39020

	ld a, [PlayerEvaLevel]
	cp $8
	jr nc, .asm_39020

	call RNG

	cp $c8
	ret nc
	dec [hl]
	dec [hl]
	ret

.asm_39020
	call $5521

	ret c
	inc [hl]
	ret
; 39026


AIScoring_Swagger:
AIScoring_Attract: ; 39026
	ld a, [PlayerTurnsTaken]
	and a
	jr z, .asm_39032

	call $5521

	ret c
	inc [hl]
	ret

.asm_39032
	call RNG

	cp $c8
	ret nc
	dec [hl]
	ret
; 3903a


AIScoring_Safeguard: ; 3903a
	call $526e

	ret c
	call $5521

	ret c
	inc [hl]
	ret
; 39044


AIScoring_Magnitude:
AIScoring_Earthquake: ; 39044
	ld a, [LastEnemyCounterMove]
	cp $5b
	ret nz
	ld a, [PlayerSubStatus3]
	bit 5, a
	jr z, .asm_39058

	call $5233

	ret nc
	dec [hl]
	dec [hl]
	ret

.asm_39058
	call $5233

	ret c
	call $5527

	ret c
	dec [hl]
	ret
; 39062


AIScoring_BatonPass: ; 39062
	push hl
	ld hl, $484e
	ld a, $d
	rst FarCall

	ld a, [$c716]
	cp $a
	pop hl
	ret c
	inc [hl]
	ret
; 39072


AIScoring_Pursuit: ; 39072
	call $52b3

	jr nc, .asm_3907d

	call $5521

	ret c
	inc [hl]
	ret

.asm_3907d
	call $5527

	ret c
	dec [hl]
	dec [hl]
	ret
; 39084


AIScoring_RapidSpin: ; 39084
	ld a, [$c731]
	and a
	jr nz, .asm_39097

	ld a, [EnemySubStatus4]
	bit 7, a
	jr nz, .asm_39097

	ld a, [EnemyScreens]
	bit 0, a
	ret z

.asm_39097
	call $5521

	ret c
	dec [hl]
	dec [hl]
	ret
; 3909e


AIScoring_HiddenPower: ; 3909e
	push hl
	ld a, $1
	ld [hBattleTurn], a
	ld hl, $7ced
	ld a, $3e
	rst FarCall

	ld hl, $47c8
	ld a, $d
	rst FarCall

	pop hl
	ld a, [$d265]
	cp $a
	jr c, .asm_390c9

	ld a, d
	cp $32
	jr c, .asm_390c9

	ld a, [$d265]
	cp $b
	jr nc, .asm_390c7

	ld a, d
	cp $46
	ret c

.asm_390c7
	dec [hl]
	ret

.asm_390c9
	inc [hl]
	ret
; 390cb


AIScoring_RainDance: ; 390cb
	ld a, [BattleMonType1]
	cp $15
	jr z, Function_0x3911e

	cp $14
	jr z, Function_0x39122

	ld a, [BattleMonType2]
	cp $15
	jr z, Function_0x3911e

	cp $14
	jr z, Function_0x39122

	push hl
	ld hl, $50e7
	jr Function_0x3910d
; 390e7



INCBIN "baserom.gbc", $390e7, $390f3 - $390e7



AIScoring_SunnyDay: ; 390f3
	ld a, [BattleMonType1]
	cp $14
	jr z, Function_0x3911e

	cp $15
	jr z, Function_0x39122

	ld a, [BattleMonType2]
	cp $14
	jr z, Function_0x3911e

	cp $15
	jr z, Function_0x39122

	push hl
	ld hl, $5134

	; fallthrough
; 3910d


Function_0x3910d: ; 3910d
	call $52e6

	pop hl
	jr nc, Function_0x3911e

	call $526e

	jr nc, Function_0x3911e

	call $5527

	ret c
	dec [hl]
	ret

Function_0x3911e: ; 3911e
	inc [hl]
	inc [hl]
	inc [hl]
	ret

Function_0x39122: ; 39122
	call $526e

	ret nc
	ld a, [PlayerTurnsTaken]
	and a
	jr z, .asm_39131

	ld a, [EnemyTurnsTaken]
	and a
	ret nz

.asm_39131
	dec [hl]
	dec [hl]
	ret
; 39134



INCBIN "baserom.gbc", $39134, $3913d - $39134



AIScoring_BellyDrum: ; 3913d
	ld a, [EnemyAtkLevel]
	cp $a
	jr nc, .asm_3914d

	call $5251

	ret c
	inc [hl]
	call $5281

	ret c

.asm_3914d
	ld a, [hl]
	add $5
	ld [hl], a
	ret
; 39152


AIScoring_PsychUp: ; 39152
	push hl
	ld hl, EnemyAtkLevel
	ld b, $8
	ld c, $64

.asm_3915a
	ld a, [hli]
	sub $7
	add c
	ld c, a
	dec b
	jr nz, .asm_3915a

	ld hl, PlayerAtkLevel
	ld b, $8
	ld d, $64

.asm_39169
	ld a, [hli]
	sub $7
	add d
	ld d, a
	dec b
	jr nz, .asm_39169

	ld a, c
	sub d
	pop hl
	jr nc, .asm_39188

	ld a, [PlayerAccLevel]
	cp $6
	ret c
	ld a, [EnemyEvaLevel]
	cp $8
	ret nc
	call $5521

	ret c
	dec [hl]
	ret

.asm_39188
	inc [hl]
	inc [hl]
	ret
; 3918b


AIScoring_MirrorCoat: ; 3918b
	push hl
	ld hl, PlayerUsedMoves
	ld c, $4
	ld b, $0

.asm_39193
	ld a, [hli]
	and a
	jr z, .asm_391a8

	call $5508

	ld a, [EnemyMovePower]
	and a
	jr z, .asm_391a8

	ld a, [EnemyMoveType]
	cp $14
	jr c, .asm_391a8

	inc b

.asm_391a8
	dec c
	jr nz, .asm_39193

	pop hl
	ld a, b
	and a
	jr z, .asm_391d3

	cp $3
	jr nc, .asm_391ca

	ld a, [LastEnemyCounterMove]
	and a
	jr z, .asm_391d2

	call $5508

	ld a, [EnemyMovePower]
	and a
	jr z, .asm_391d2

	ld a, [EnemyMoveType]
	cp $14
	jr c, .asm_391d2


.asm_391ca
	call RNG

	cp $64
	jr c, .asm_391d2

	dec [hl]

.asm_391d2
	ret

.asm_391d3
	inc [hl]
	ret
; 391d5


AIScoring_Twister:
AIScoring_Gust: ; 391d5
	ld a, [LastEnemyCounterMove]
	cp $13
	ret nz
	ld a, [PlayerSubStatus3]
	bit 6, a
	jr z, .asm_391e9

	call $5233

	ret nc
	dec [hl]
	dec [hl]
	ret

.asm_391e9
	call $5233

	ret c
	call $5527

	ret c
	dec [hl]
	ret
; 391f3


AIScoring_FutureSight: ; 391f3
	call $5233

	ret nc
	ld a, [PlayerSubStatus3]
	and $60
	ret z
	dec [hl]
	dec [hl]
	ret
; 39200


AIScoring_Stomp: ; 39200
	ld a, [$c6fe]
	and a
	ret z
	call $5521

	ret c
	dec [hl]
	ret
; 3920b


AIScoring_Solarbeam: ; 3920b
	ld a, [Weather]
	cp $2
	jr z, .asm_3921e

	cp $1
	ret nz
	call RNG

	cp $19
	ret c
	inc [hl]
	inc [hl]
	ret

.asm_3921e
	call $5521

	ret c
	dec [hl]
	dec [hl]
	ret
; 39225


AIScoring_Thunder: ; 39225
	ld a, [Weather]
	cp $2
	ret nz
	call RNG

	cp $19
	ret c
	inc [hl]
	ret
; 39233



INCBIN "baserom.gbc", $39233, $39315 - $39233



Function_0x39315: ; 39315
	call $5281
	ret c

	call $5298
	jr nc, .asm_39322

	call $5527
	ret c

.asm_39322
	ld hl, Buffer1 - 1
	ld de, EnemyMonMoves
	ld c, EnemyMonMovesEnd - EnemyMonMoves + 1
.asm_3932a
	inc hl
	dec c
	jr z, .asm_39347

	ld a, [de]
	inc de
	and a
	jr z, .asm_39347

	push hl
	push de
	push bc
	ld hl, .table_39348
	ld de, 1
	call IsInArray

	pop bc
	pop de
	pop hl
	jr nc, .asm_3932a

	inc [hl]
	jr .asm_3932a

.asm_39347
	ret

.table_39348
	db SWORDS_DANCE
	db TAIL_WHIP
	db LEER
	db GROWL
	db DISABLE
	db MIST
	db COUNTER
	db LEECH_SEED
	db GROWTH
	db STRING_SHOT
	db MEDITATE
	db AGILITY
	db RAGE
	db MIMIC
	db SCREECH
	db HARDEN
	db WITHDRAW
	db DEFENSE_CURL
	db BARRIER
	db LIGHT_SCREEN
	db HAZE
	db REFLECT
	db FOCUS_ENERGY
	db BIDE
	db AMNESIA
	db TRANSFORM
	db SPLASH
	db ACID_ARMOR
	db SHARPEN
	db CONVERSION
	db SUBSTITUTE
	db FLAME_WHEEL
	db $ff
; 39369



Function_0x39369: ; 39369
	ld hl, EnemyMonMoves
	ld bc, 0
	ld de, 0
.asm_39372
	inc b
	ld a, b
	cp EnemyMonMovesEnd - EnemyMonMoves + 1
	jr z, .asm_393a8

	ld a, [hli]
	and a
	jr z, .asm_393a8

	push hl
	push de
	push bc
	call $5508

	ld a, [EnemyMovePower]
	and a
	jr z, .asm_393a3

	call $53e7

	pop bc
	pop de
	pop hl
	ld a, [CurDamage + 1]
	cp e
	ld a, [CurDamage]
	sbc d
	jr c, .asm_39372

	ld a, [CurDamage + 1]
	ld e, a
	ld a, [CurDamage]
	ld d, a
	ld c, b
	jr .asm_39372

.asm_393a3
	pop bc
	pop de
	pop hl
	jr .asm_39372

.asm_393a8
	ld a, c
	and a
	jr z, .asm_393e1

	ld hl, Buffer1 - 1
	ld de, EnemyMonMoves
	ld b, $0
.asm_393b4
	inc b
	ld a, b
	cp EnemyMonMovesEnd - EnemyMonMoves + 1
	jr z, .asm_393e1

	cp c
	ld a, [de]
	inc de
	inc hl
	jr z, .asm_393b4

	call $5508

	ld a, [EnemyMovePower]
	cp $2
	jr c, .asm_393b4

	push hl
	push de
	push bc
	ld a, [EnemyMoveEffect]
	ld hl, $53e2
	ld de, 1
	call IsInArray

	pop bc
	pop de
	pop hl
	jr c, .asm_393b4

	inc [hl]
	jr .asm_393b4

.asm_393e1
	ret

; 393e2


INCBIN "baserom.gbc", $393e2, $39418 - $393e2


Function_0x39418: ; 39418
	ld a, [EnemyTurnsTaken]
	and a
	ret z

	ld hl, Buffer1 - 1
	ld de, EnemyMonMoves
	ld c, EnemyMonMovesEnd - EnemyMonMoves + 1
.asm_39425
	inc hl
	dec c
	ret z

	ld a, [de]
	inc de
	and a
	ret z

	push hl
	push de
	push bc
	ld hl, .table_39446
	ld de, 1
	call IsInArray

	pop bc
	pop de
	pop hl
	jr nc, .asm_39425

	call RNG
	cp $e6
	ret nc

	inc [hl]
	jr .asm_39425

.table_39446
	db MIST
	db LEECH_SEED
	db POISONPOWDER
	db STUN_SPORE
	db THUNDER_WAVE
	db FOCUS_ENERGY
	db BIDE
	db POISON_GAS
	db TRANSFORM
	db CONVERSION
	db SUBSTITUTE
	db SPIKES
	db $ff
; 39453



Function_0x39453: ; 39453
	ld hl, Buffer1 - 1
	ld de, EnemyMonMoves
	ld b, EnemyMonMovesEnd - EnemyMonMoves + 1
.asm_3945b
	dec b
	ret z

	inc hl
	ld a, [de]
	and a
	ret z

	inc de
	call $5508

	ld a, [EnemyMoveEffect]
	cp EFFECT_TOXIC
	jr z, .asm_39480
	cp EFFECT_POISON
	jr z, .asm_39480
	cp EFFECT_SLEEP
	jr z, .asm_3948e
	cp EFFECT_PARALYZE
	jr z, .asm_3948e

	ld a, [EnemyMovePower]
	and a
	jr z, .asm_3945b

	jr .asm_3948e

.asm_39480
	ld a, [BattleMonType1]
	cp POISON
	jr z, .asm_394a4
	ld a, [BattleMonType2]
	cp POISON
	jr z, .asm_394a4

.asm_3948e
	push hl
	push bc
	push de

	ld a, 1
	ld [hBattleTurn], a

	ld hl, $47c8
	ld a, $d
	rst FarCall

	pop de
	pop bc
	pop hl

	ld a, [$d265]
	and a
	jr nz, .asm_3945b

.asm_394a4
	call $5503
	jr .asm_3945b
; 394a9



Function_0x394a9: ; 394a9
	ld hl, Buffer1 - 1
	ld de, EnemyMonMoves
	ld c, EnemyMonMovesEnd - EnemyMonMoves + 1
.asm_394b1
	inc hl
	dec c
	ret z

	ld a, [de]
	inc de
	and a
	ret z

	push de
	push bc
	push hl
	call $5508

	ld a, [EnemyMovePower]
	and a
	jr z, .asm_394fa

	ld a, [EnemyMoveEffect]
	ld de, 1
	ld hl, .table_394ff
	call IsInArray
	jr nc, .asm_394de

	call $5251
	jr c, .asm_394fa

	call RNG
	cp $c8
	jr c, .asm_394fa

.asm_394de
	call $53e7

	ld a, [CurDamage + 1]
	ld e, a
	ld a, [CurDamage]
	ld d, a
	ld a, [BattleMonHP + 1]
	cp e
	ld a, [BattleMonHP]
	sbc d
	jr nc, .asm_394fa

	pop hl
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	push hl
.asm_394fa
	pop hl
	pop bc
	pop de
	jr .asm_394b1

.table_394ff
	db EFFECT_EXPLOSION
	db EFFECT_OHKO
	db $ff
; 39502



Function_0x39502: ; 39502
	ret
; 39503


INCBIN "baserom.gbc", $39503, $39999 - $39503


TrainerGroups: ; 0x39999
INCLUDE "trainers/trainer_pointers.asm"

INCLUDE "trainers/trainers.asm"


SECTION "bankF",DATA,BANK[$F]

INCBIN "baserom.gbc", $3c000, $3cc83 - $3c000

GetEighthMaxHP: ; 3cc83
; output: bc
	call GetQuarterMaxHP
; assumes nothing can have 1024 or more hp
; halve result
	srl c
; round up
	ld a, c
	and a
	jr nz, .end
	inc c
.end
	ret
; 3cc8e


GetQuarterMaxHP: ; 3cc8e
; output: bc
	call GetMaxHP

; quarter result
	srl b
	rr c
	srl b
	rr c

; assumes nothing can have 1024 or more hp
; round up
	ld a, c
	and a
	jr nz, .end
	inc c
.end
	ret
; 3cc9f


GetHalfMaxHP: ; 3cc9f
; output: bc
	call GetMaxHP

; halve reslut
	srl b
	rr c

; floor = 1
	ld a, c
	or b
	jr nz, .end
	inc c
.end
	ret
; 3ccac


GetMaxHP: ; 3ccac
; output: bc, $d1ea-b

; player
	ld hl, BattleMonMaxHP

; whose turn?
	ld a, [hBattleTurn]
	and a
	jr z, .gethp

; enemy
	ld hl, EnemyMonMaxHP

.gethp
	ld a, [hli]
	ld [$d1eb], a
	ld b, a

	ld a, [hl]
	ld [$d1ea], a
	ld c, a
	ret
; 3ccc2


INCBIN "baserom.gbc", $3ccc2, $3d123 - $3ccc2


; These functions check if the current opponent is a gym leader or one of a
; few other special trainers.

; Note: KantoGymLeaders is a subset of JohtoGymLeaders. If you wish to
; differentiate between the two, call IsKantoGymLeader first.

; The Lance and Red entries are unused for music checks; those trainers are
; accounted for elsewhere.

IsKantoGymLeader: ; 0x3d123
	ld hl, KantoGymLeaders
	jr IsGymLeaderCommon

IsJohtoGymLeader: ; 0x3d128
	ld hl, JohtoGymLeaders
IsGymLeaderCommon:
	push de
	ld a, [OtherTrainerClass]
	ld de, $0001
	call IsInArray
	pop de
	ret
; 0x3d137

JohtoGymLeaders:
	db FALKNER
	db WHITNEY
	db BUGSY
	db MORTY
	db PRYCE
	db JASMINE
	db CHUCK
	db CLAIR
	db WILL
	db BRUNO
	db KAREN
	db KOGA
; fallthrough
; these two entries are unused
	db CHAMPION
	db RED
; fallthrough
KantoGymLeaders:
	db BROCK
	db MISTY
	db LT_SURGE
	db ERIKA
	db JANINE
	db SABRINA
	db BLAINE
	db BLUE
	db $ff

INCBIN "baserom.gbc", $3d14e, $3ddc2 - $3d14e

	ld hl, RecoveredUsingText
	jp $3ad5
; 0x3ddc8

INCBIN "baserom.gbc", $3ddc8, $3e8eb - $3ddc8

LoadEnemyMon: ; 3e8eb
; Initialize enemy monster parameters
; To do this we pull the species from TempEnemyMonSpecies

; Notes:
;   FarBattleRNG is used to ensure sync between Game Boys

; Clear the whole EnemyMon struct
	xor a
	ld hl, EnemyMonSpecies
	ld bc, EnemyMonEnd - EnemyMon
	call ByteFill
	
; We don't need to be here if we're in a link battle
	ld a, [InLinkBattle]
	and a
	jp nz, $5abd
	
	ld a, [$cfc0] ; ????
	bit 0, a
	jp nz, $5abd
	
; Make sure everything knows what species we're working with
	ld a, [TempEnemyMonSpecies]
	ld [EnemyMonSpecies], a
	ld [CurSpecies], a
	ld [CurPartySpecies], a
	
; Grab the BaseData for this species
	call GetBaseData
	

; Let's get the item:

; Is the item predetermined?
	ld a, [IsInBattle]
	dec a
	jr z, .WildItem
	
; If we're in a trainer battle, the item is in the party struct
	ld a, [CurPartyMon]
	ld hl, OTPartyMon1Item
	call GetPartyLocation ; bc = PartyMon[CurPartyMon] - PartyMons
	ld a, [hl]
	jr .UpdateItem
	
	
.WildItem
; In a wild battle, we pull from the item slots in BaseData

; Force Item1
; Used for Ho-Oh, Lugia and Snorlax encounters
	ld a, [BattleType]
	cp BATTLETYPE_FORCEITEM
	ld a, [BaseItems]
	jr z, .UpdateItem
	
; Failing that, it's all up to chance
;  Effective chances:
;    75% None
;    23% Item1
;     2% Item2

; 25% chance of getting an item
	call FarBattleRNG
	cp a, $c0
	ld a, NO_ITEM
	jr c, .UpdateItem
	
; From there, an 8% chance for Item2
	call FarBattleRNG
	cp a, $14 ; 8% of 25% = 2% Item2
	ld a, [BaseItems]
	jr nc, .UpdateItem
	ld a, [BaseItems+1]
	
	
.UpdateItem
	ld [EnemyMonItem], a
	
	
; Initialize DVs
	
; If we're in a trainer battle, DVs are predetermined
	ld a, [IsInBattle]
	and a
	jr z, .InitDVs
	
; ????
	ld a, [EnemySubStatus5]
	bit 3, a
	jr z, .InitDVs
	
; Unknown
	ld hl, $c6f2
	ld de, EnemyMonDVs
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	jp .Happiness
	
	
.InitDVs
	
; Trainer DVs
	
; All trainers have preset DVs, determined by class
; See GetTrainerDVs for more on that
	callba GetTrainerDVs
; These are the DVs we'll use if we're actually in a trainer battle
	ld a, [IsInBattle]
	dec a
	jr nz, .UpdateDVs
	
	
; Wild DVs
; Here's where the fun starts

; Roaming monsters (Entei, Raikou) work differently
; They have their own structs, which are shorter than normal
	ld a, [BattleType]
	cp a, BATTLETYPE_ROAMING
	jr nz, .NotRoaming
	
; Grab HP
	call GetRoamMonHP
	ld a, [hl]
; Check if the HP has been initialized
	and a
; We'll do something with the result in a minute
	push af
	
; Grab DVs
	call GetRoamMonDVs
	inc hl
	ld a, [hld]
	ld c, a
	ld b, [hl]

; Get back the result of our check
	pop af
; If the RoamMon struct has already been initialized, we're done
	jr nz, .UpdateDVs
	
; If it hasn't, we need to initialize the DVs
; (HP is initialized at the end of the battle)
	call GetRoamMonDVs
	inc hl
	call FarBattleRNG
	ld [hld], a
	ld c, a
	call FarBattleRNG
	ld [hl], a
	ld b, a
; We're done with DVs
	jr .UpdateDVs

	
.NotRoaming
; Register a contains BattleType

; Forced shiny battle type
; Used by Red Gyarados at Lake of Rage
	cp a, BATTLETYPE_SHINY
	jr nz, .GenerateDVs

	ld b, ATKDEFDV_SHINY ; $ea
	ld c, SPDSPCDV_SHINY ; $aa
	jr .UpdateDVs
	
.GenerateDVs
; Generate new random DVs
	call FarBattleRNG
	ld b, a
	call FarBattleRNG
	ld c, a
	
.UpdateDVs
; Input DVs in register bc
	ld hl, EnemyMonDVs
	ld a, b
	ld [hli], a
	ld [hl], c
	
	
; We've still got more to do if we're dealing with a wild monster
	ld a, [IsInBattle]
	dec a
	jr nz, .Happiness
	
	
; Species-specfic:
	
	
; Unown
	ld a, [TempEnemyMonSpecies]
	cp a, UNOWN
	jr nz, .Magikarp
	
; Get letter based on DVs
	ld hl, EnemyMonDVs
	ld a, PREDEF_GETUNOWNLETTER
	call Predef
; Can't use any letters that haven't been unlocked
; If combined with forced shiny battletype, causes an infinite loop
	call CheckUnownLetter
	jr c, .GenerateDVs ; try again
	
	
.Magikarp
; Skimming this part recommended
	
	ld a, [TempEnemyMonSpecies]
	cp a, MAGIKARP
	jr nz, .Happiness
	
; Get Magikarp's length
	ld de, EnemyMonDVs
	ld bc, PlayerID
	callab CalcMagikarpLength
	
; We're clear if the length is < 1536
	ld a, [MagikarpLength]
	cp a, $06 ; $600 = 1536
	jr nz, .CheckMagikarpArea
	
; 5% chance of skipping size checks
	call RNG
	cp a, $0c ; / $100
	jr c, .CheckMagikarpArea
; Try again if > 1614
	ld a, [MagikarpLength + 1]
	cp a, $50
	jr nc, .GenerateDVs
	
; 20% chance of skipping this check
	call RNG
	cp a, $32 ; / $100
	jr c, .CheckMagikarpArea
; Try again if > 1598
	ld a, [MagikarpLength + 1]
	cp a, $40
	jr nc, .GenerateDVs
	
.CheckMagikarpArea
; The z checks are supposed to be nz
; Instead, all maps in GROUP_LAKE_OF_RAGE (mahogany area)
; and routes 20 and 44 are treated as Lake of Rage
	
; This also means Lake of Rage Magikarp can be smaller than ones
; caught elsewhere rather than the other way around
	
; Intended behavior enforces a minimum size at Lake of Rage
; The real behavior prevents size flooring in the Lake of Rage area
	ld a, [MapGroup]
	cp a, GROUP_LAKE_OF_RAGE
	jr z, .Happiness
	ld a, [MapNumber]
	cp a, MAP_LAKE_OF_RAGE
	jr z, .Happiness
; 40% chance of not flooring
	call RNG
	cp a, $64 ; / $100
	jr c, .Happiness
; Floor at length 1024
	ld a, [MagikarpLength]
	cp a, $04 ; $400 = 1024
	jr c, .GenerateDVs ; try again
	
	
; Finally done with DVs
	
.Happiness
; Set happiness
	ld a, BASE_HAPPINESS
	ld [EnemyMonHappiness], a
; Set level
	ld a, [CurPartyLevel]
	ld [EnemyMonLevel], a
; Fill stats
	ld de, EnemyMonMaxHP
	ld b, $00
	ld hl, $d201 ; ?
	ld a, PREDEF_FILLSTATS
	call Predef
	
; If we're in a trainer battle,
; get the rest of the parameters from the party struct
	ld a, [IsInBattle]
	cp a, TRAINER_BATTLE
	jr z, .OpponentParty
	
; If we're in a wild battle, check wild-specific stuff
	and a
	jr z, .TreeMon
	
; ????
	ld a, [$c671]
	bit 3, a
	jp nz, .Moves
	
.TreeMon
; If we're headbutting trees, some monsters enter battle asleep
	call CheckSleepingTreeMon
	ld a, 7 ; Asleep for 7 turns
	jr c, .UpdateStatus
; Otherwise, no status
	xor a
	
.UpdateStatus
	ld hl, EnemyMonStatus
	ld [hli], a
	
; Unused byte
	xor a
	ld [hli], a
	
; Full HP...
	ld a, [EnemyMonMaxHPHi]
	ld [hli], a
	ld a, [EnemyMonMaxHPLo]
	ld [hl], a
	
; ...unless it's a RoamMon
	ld a, [BattleType]
	cp a, BATTLETYPE_ROAMING
	jr nz, .Moves
	
; Grab HP
	call GetRoamMonHP
	ld a, [hl]
; Check if it's been initialized again
	and a
	jr z, .InitRoamHP
; Update from the struct if it has
	ld a, [hl]
	ld [EnemyMonHPLo], a
	jr .Moves
	
.InitRoamHP
; HP only uses the lo byte in the RoamMon struct since
; Raikou/Entei/Suicune will have < 256 hp at level 40
	ld a, [EnemyMonHPLo]
	ld [hl], a
	jr .Moves
	
	
.OpponentParty
; Get HP from the party struct
	ld hl, (PartyMon1CurHP + 1) - PartyMon1 + OTPartyMon1
	ld a, [CurPartyMon]
	call GetPartyLocation
	ld a, [hld]
	ld [EnemyMonHPLo], a
	ld a, [hld]
	ld [EnemyMonHPHi], a
	
; Make sure everything knows which monster the opponent is using
	ld a, [CurPartyMon]
	ld [CurOTMon], a
	
; Get status from the party struct
	dec hl
	ld a, [hl] ; OTPartyMonStatus
	ld [EnemyMonStatus], a
	
	
.Moves
; ????
	ld hl, BaseType1
	ld de, EnemyMonType1
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	
; Get moves
	ld de, EnemyMonMoves
; Are we in a trainer battle?
	ld a, [IsInBattle]
	cp a, TRAINER_BATTLE
	jr nz, .WildMoves
; Then copy moves from the party struct
	ld hl, OTPartyMon1Moves
	ld a, [CurPartyMon]
	call GetPartyLocation
	ld bc, NUM_MOVES
	call CopyBytes
	jr .PP
	
.WildMoves
; Clear EnemyMonMoves
	xor a
	ld h, d
	ld l, e
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
; Make sure the predef knows this isn't a partymon
	ld [$d1ea], a
; Fill moves based on level
	ld a, PREDEF_FILLMOVES
	call Predef
	
.PP
; Trainer battle?
	ld a, [IsInBattle]
	cp a, TRAINER_BATTLE
	jr z, .TrainerPP
	
; Fill wild PP
	ld hl, EnemyMonMoves
	ld de, EnemyMonPP
	ld a, PREDEF_FILLPP
	call Predef
	jr .Finish
	
.TrainerPP
; Copy PP from the party struct
	ld hl, OTPartyMon1PP
	ld a, [CurPartyMon]
	call GetPartyLocation
	ld de, EnemyMonPP
	ld bc, NUM_MOVES
	call CopyBytes
	
.Finish
; Only the first five base stats are copied...
	ld hl, BaseStats
	ld de, EnemyMonBaseStats
	ld b, BaseSpecialDefense - BaseStats
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .loop

	ld a, [BaseCatchRate]
	ld [de], a
	inc de

	ld a, [BaseExp]
	ld [de], a

	ld a, [TempEnemyMonSpecies]
	ld [$d265], a

	call GetPokemonName

; Did we catch it?
	ld a, [IsInBattle]
	and a
	ret z

; Update enemy nick
	ld hl, StringBuffer1
	ld de, EnemyMonNick
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes

; Caught this mon
	ld a, [TempEnemyMonSpecies]
	dec a
	ld c, a
	ld b, 1 ; set
	ld hl, PokedexCaught
	ld a, PREDEF_FLAG
	call Predef

	ld hl, EnemyMonStats
	ld de, $c6c1
	ld bc, EnemyMonStatsEnd - EnemyMonStats
	call CopyBytes

	ret
; 3eb38


CheckSleepingTreeMon: ; 3eb38
; Return carry if species is in the list
; for the current time of day

; Don't do anything if this isn't a tree encounter
	ld a, [BattleType]
	cp a, BATTLETYPE_TREE
	jr nz, .NotSleeping
	
; Get list for the time of day
	ld hl, .Morn
	ld a, [TimeOfDay]
	cp a, DAY
	jr c, .Check
	ld hl, .Day
	jr z, .Check
	ld hl, .Nite
	
.Check
	ld a, [TempEnemyMonSpecies]
	ld de, 1 ; length of species id
	call IsInArray
; If it's a match, the opponent is asleep
	ret c
	
.NotSleeping
	and a
	ret

.Nite
	db CATERPIE
	db METAPOD
	db BUTTERFREE
	db WEEDLE
	db KAKUNA
	db BEEDRILL
	db SPEAROW
	db EKANS
	db EXEGGCUTE
	db LEDYBA
	db AIPOM
	db $ff ; end

.Day
	db VENONAT
	db HOOTHOOT
	db NOCTOWL
	db SPINARAK
	db HERACROSS
	db $ff ; end

.Morn
	db VENONAT
	db HOOTHOOT
	db NOCTOWL
	db SPINARAK
	db HERACROSS
	db $ff ; end
; 3eb75


CheckUnownLetter: ; 3eb75
; Return carry if the Unown letter hasn't been unlocked yet
	
	ld a, [UnlockedUnowns]
	ld c, a
	ld de, 0
	
.loop
	
; Don't check this set unless it's been unlocked
	srl c
	jr nc, .next
	
; Is our letter in the set?
	ld hl, .LetterSets
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	
	push de
	ld a, [UnownLetter]
	ld de, 1
	push bc
	call IsInArray
	pop bc
	pop de
	
	jr c, .match
	
.next
; Make sure we haven't gone past the end of the table
	inc e
	inc e
	ld a, e
	cp a, .Set1 - .LetterSets
	jr c, .loop
	
; Hasn't been unlocked, or the letter is invalid
	scf
	ret
	
.match
; Valid letter
	and a
	ret
	
.LetterSets
	dw .Set1
	dw .Set2
	dw .Set3
	dw .Set4
	
.Set1
	;  A   B   C   D   E   F   G   H   I   J   K
	db 01, 02, 03, 04, 05, 06, 07, 08, 09, 10, 11, $ff
.Set2
	;  L   M   N   O   P   Q   R
	db 12, 13, 14, 15, 16, 17, 18, $ff
.Set3
	;  S   T   U   V   W
	db 19, 20, 21, 22, 23, $ff
.Set4
	;  X   Y   Z
	db 24, 25, 26, $ff
	
; 3ebc7


INCBIN "baserom.gbc", $3ebc7, $3edd8 - $3ebc7

BattleRNG: ; 3edd8
; If the normal RNG is used in a link battle it'll desync.
; To circumvent this a shared PRNG is used instead.

; But if we're in a non-link battle we're safe to use it
	ld a, [InLinkBattle]
	and a
	jp z, RNG

; The PRNG operates in streams of 8 values
; The reasons for this are unknown

; Which value are we trying to pull?
	push hl
	push bc
	ld a, [LinkBattleRNCount]
	ld c, a
	ld b, $0
	ld hl, LinkBattleRNs
	add hl, bc
	inc a
	ld [LinkBattleRNCount], a

; If we haven't hit the end yet, we're good
	cp 9 ; Exclude last value. See the closing comment
	ld a, [hl]
	pop bc
	pop hl
	ret c
	
	
; If we have, we have to generate new pseudorandom data
; Instead of having multiple PRNGs, ten seeds are used
	push hl
	push bc
	push af
	
; Reset count to 0
	xor a
	ld [LinkBattleRNCount], a
	ld hl, LinkBattleRNs
	ld b, 10 ; number of seeds
	
; Generate next number in the sequence for each seed
; The algorithm takes the form *5 + 1 % 256
.loop
	; get last #
	ld a, [hl]
	
	; a * 5 + 1
	ld c, a
	add a
	add a
	add c
	inc a
	
	; update #
	ld [hli], a
	dec b
	jr nz, .loop

; This has the side effect of pulling the last value first,
; then wrapping around. As a result, when we check to see if
; we've reached the end, we have to take this into account.
	pop af
	pop bc
	pop hl
	ret
; 3ee0f

INCBIN "baserom.gbc", $3ee0f, $3fa01 - $3ee0f

GetRoamMonHP: ; 3fa01
; output: hl = RoamMonCurHP
	ld a, [TempEnemyMonSpecies]
	ld b, a
	ld a, [RoamMon1Species]
	cp b
	ld hl, RoamMon1CurHP
	ret z
	ld a, [RoamMon2Species]
	cp b
	ld hl, RoamMon2CurHP
	ret z
; remnant of the GS function
; we know this will be $00 because it's never initialized
	ld hl, RoamMon3CurHP
	ret
; 3fa19

GetRoamMonDVs: ; 3fa19
; output: hl = RoamMonDVs
	ld a, [TempEnemyMonSpecies]
	ld b, a
	ld a, [RoamMon1Species]
	cp b
	ld hl, RoamMon1DVs
	ret z
	ld a, [RoamMon2Species]
	cp b
	ld hl, RoamMon2DVs
	ret z
; remnant of the GS function
; we know this will be $0000 because it's never initialized
	ld hl, RoamMon3DVs
	ret
; 3fa31


INCBIN "baserom.gbc", $3fa31, $3fc8b - $3fa31


BattleStartMessage ; 3fc8b
	ld a, [IsInBattle]
	dec a
	jr z, .asm_3fcaa

	ld de, SFX_SHINE
	call StartSFX
	call WaitSFX

	ld c, 20
	call DelayFrames

	ld a, $e
	ld hl, $5939
	rst FarCall

	ld hl, WantsToBattleText
	jr .asm_3fd0e

.asm_3fcaa
	call $5a79
	jr nc, .asm_3fcc2

	xor a
	ld [$cfca], a
	ld a, 1
	ld [hBattleTurn], a
	ld a, 1
	ld [$c689], a
	ld de, $0101
	call $6e17

.asm_3fcc2
	ld a, $f
	ld hl, $6b38
	rst FarCall
	jr c, .asm_3fceb

	ld a, $13
	ld hl, $6a44
	rst FarCall
	jr c, .asm_3fce0

	hlcoord 12, 0
	ld d, $0
	ld e, $1
	ld a, $47
	call Predef
	jr .asm_3fceb

.asm_3fce0
	ld a, $0f
	ld [CryTracks], a
	ld a, [TempEnemyMonSpecies]
	call $37b6

.asm_3fceb
	ld a, [BattleType]
	cp BATTLETYPE_FISH
	jr nz, .asm_3fcfd

	ld a, $41
	ld hl, $6086
	rst FarCall

	ld hl, HookedPokemonAttackedText
	jr .asm_3fd0e

.asm_3fcfd
	ld hl, PokemonFellFromTreeText
	cp BATTLETYPE_TREE
	jr z, .asm_3fd0e
	ld hl, WildPokemonAppearedText2
	cp $b
	jr z, .asm_3fd0e
	ld hl, WildPokemonAppearedText

.asm_3fd0e
	push hl
	ld a, $b
	ld hl, $4000
	rst FarCall

	pop hl
	call FarBattleTextBox

	call $7830

	ret nz

	ld c, $2
	ld a, $13
	ld hl, $6a0a
	rst FarCall

	ret
; 3fd26


	dw $0000 ; padding


BattleCommandPointers: ; 3fd28

INCLUDE "battle/effect_command_pointers.asm"



SECTION "bank10",DATA,BANK[$10]

INCBIN "baserom.gbc", $40000, $40c65-$40000

AlphabeticalPokedexOrder: ; 0x40c65
INCLUDE "stats/pokedex/order_alpha.asm"

NewPokedexOrder: ; 0x40d60
INCLUDE "stats/pokedex/order_new.asm"

INCBIN "baserom.gbc", $40e5b, $41afb-$40e5b

Moves: ; 0x41afb
INCLUDE "battle/moves/moves.asm"

INCBIN "baserom.gbc", $421d8, $425b1-$421d8

EvosAttacksPointers: ; 0x425b1
INCLUDE "stats/evos_attacks_pointers.asm"

INCLUDE "stats/evos_attacks.asm"


SECTION "bank11",DATA,BANK[$11]

FruitTreeScript: ; 44000
	3callasm BANK(GetCurTreeFruit), GetCurTreeFruit
	loadfont
	copybytetovar CurFruit
	itemtotext $0, $0
	2writetext FruitBearingTreeText
	keeptextopen
	3callasm BANK(TryResetFruitTrees), TryResetFruitTrees
	3callasm BANK(CheckFruitTree), CheckFruitTree
	iffalse .fruit
	2writetext NothingHereText
	closetext
	2jump .end

.fruit
	2writetext HeyItsFruitText
	copybytetovar CurFruit
	giveitem $ff, 1
	iffalse .packisfull
	keeptextopen
	2writetext ObtainedFruitText
	3callasm BANK(PickedFruitTree), PickedFruitTree
	specialsound
	itemnotify
	2jump .end

.packisfull
	keeptextopen
	2writetext FruitPackIsFullText
	closetext

.end
	loadmovesprites
	end
; 44041

GetCurTreeFruit: ; 44041
	ld a, [CurFruitTree]
	dec a
	call GetFruitTreeItem
	ld [CurFruit], a
	ret
; 4404c

TryResetFruitTrees: ; 4404c
	ld hl, $dc1e
	bit 4, [hl]
	ret nz
	jp ResetFruitTrees
; 44055

CheckFruitTree: ; 44055
	ld b, 2
	call GetFruitTreeFlag
	ld a, c
	ld [ScriptVar], a
	ret
; 4405f

PickedFruitTree: ; 4405f
	ld a, $41
	ld hl, $609b
	rst FarCall ; empty function

	ld b, 1
	jp GetFruitTreeFlag
; 4406a

ResetFruitTrees: ; 4406a
	xor a
	ld hl, FruitTreeFlags
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, $dc1e
	set 4, [hl]
	ret
; 44078

GetFruitTreeFlag: ; 44078
	push hl
	push de
	ld a, [CurFruitTree]
	dec a
	ld e, a
	ld d, 0
	ld hl, FruitTreeFlags
	call BitTableFunc
	pop de
	pop hl
	ret
; 4408a

GetFruitTreeItem: ; 4408a
	push hl
	push de
	ld e, a
	ld d, 0
	ld hl, FruitTreeItems
	add hl, de
	ld a, [hl]
	pop de
	pop hl
	ret
; 44097

FruitTreeItems: ; 44097
	db BERRY
	db BERRY
	db BERRY
	db BERRY
	db PSNCUREBERRY
	db PSNCUREBERRY
	db BITTER_BERRY
	db BITTER_BERRY
	db PRZCUREBERRY
	db PRZCUREBERRY
	db MYSTERYBERRY
	db MYSTERYBERRY
	db ICE_BERRY
	db ICE_BERRY
	db MINT_BERRY
	db BURNT_BERRY
	db RED_APRICORN
	db BLU_APRICORN
	db BLK_APRICORN
	db WHT_APRICORN
	db PNK_APRICORN
	db GRN_APRICORN
	db YLW_APRICORN
	db BERRY
	db PSNCUREBERRY
	db BITTER_BERRY
	db PRZCUREBERRY
	db ICE_BERRY
	db MINT_BERRY
	db BURNT_BERRY
; 440b5

FruitBearingTreeText: ; 440b5
	text_jump _FruitBearingTreeText, BANK(_FruitBearingTreeText)
	db "@"
; 440ba

HeyItsFruitText: ; 440ba
	text_jump _HeyItsFruitText, BANK(_HeyItsFruitText)
	db "@"
; 440bf

ObtainedFruitText: ; 440bf
	text_jump _ObtainedFruitText, BANK(_ObtainedFruitText)
	db "@"
; 440c4

FruitPackIsFullText: ; 440c4
	text_jump _FruitPackIsFullText, BANK(_FruitPackIsFullText)
	db "@"
; 440c9

NothingHereText: ; 440c9
	text_jump _NothingHereText, BANK(_NothingHereText)
	db "@"
; 440ce



AIChooseMove: ; 440ce
; Score each move in EnemyMonMoves starting from Buffer1. Lower is better.
; Pick the move with the lowest score.

; Wildmons attack at random.
	ld a, [IsInBattle]
	dec a
	ret z

	ld a, [InLinkBattle]
	and a
	ret nz

; No use picking a move if there's no choice.
	ld a, $f
	ld hl, $68d1
	rst FarCall ; CheckLockedEnemyMove
	ret nz


; The default score is 20. Unusable moves are given a score of 80.
	ld a, 20
	ld hl, Buffer1
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a

; Don't pick disabled moves.
	ld a, [EnemyDisabledMove]
	and a
	jr z, .CheckPP

	ld hl, EnemyMonMove1
	ld c, 0
.CheckDisabledMove
	cp [hl]
	jr z, .ScoreDisabledMove
	inc c
	inc hl
	jr .CheckDisabledMove
.ScoreDisabledMove
	ld hl, Buffer1
	ld b, 0
	add hl, bc
	ld [hl], 80

; Don't pick moves with 0 PP.
.CheckPP
	ld hl, Buffer1 - 1
	ld de, EnemyMonPP
	ld b, 0
.CheckMovePP
	inc b
	ld a, b
	cp EnemyMonMovesEnd - EnemyMonMoves + 1
	jr z, .ApplyLayers
	inc hl
	ld a, [de]
	inc de
	and $3f
	jr nz, .CheckMovePP
	ld [hl], 80
	jr .CheckMovePP


; Apply AI scoring layers depending on the trainer class.
.ApplyLayers
	ld hl, $559f ; TrainerAI + 3 ; e:559c-5771

	ld a, [$cfc0]
	bit 0, a
	jr nz, .asm_4412f

	ld a, [TrainerClass]
	dec a
	ld bc, 7 ; Trainer2AI - Trainer1AI
	call AddNTimes

.asm_4412f
	ld bc, (CHECK_FLAG << 8) | 0
	push bc
	push hl

.CheckLayer
	pop hl
	pop bc

	ld a, c
	cp 16 ; up to 16 scoring layers
	jr z, .asm_4415e

	push bc
	ld d, $e ; BANK(TrainerAI)
	ld a, PREDEF_FLAG
	call Predef
	ld d, c
	pop bc

	inc c
	push bc
	push hl

	ld a, d
	and a
	jr z, .CheckLayer

	ld hl, AIScoringPointers
	dec c
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, $e ; bank
	call FarJpHl

	jr .CheckLayer

.asm_4415e
	ld hl, Buffer1
	ld de, EnemyMonMoves
	ld c, EnemyMonMovesEnd - EnemyMonMoves
.asm_44166
	ld a, [de]
	inc de
	and a
	jr z, .asm_4415e

	dec [hl]
	jr z, .asm_44174

	inc hl
	dec c
	jr z, .asm_4415e

	jr .asm_44166

.asm_44174
	ld a, c
.asm_44175
	inc [hl]
	dec hl
	inc a
	cp EnemyMonMovesEnd - EnemyMonMoves + 1
	jr nz, .asm_44175

	ld hl, Buffer1
	ld de, EnemyMonMoves
	ld c, EnemyMonMovesEnd - EnemyMonMoves
.asm_44184
	ld a, [de]
	and a
	jr nz, .asm_44189
	ld [hl], a
.asm_44189
	ld a, [hl]
	dec a
	jr z, .asm_44191
	xor a
	ld [hli], a
	jr .asm_44193
.asm_44191
	ld a, [de]
	ld [hli], a
.asm_44193
	inc de
	dec c
	jr nz, .asm_44184

.asm_44197
	ld hl, Buffer1
	call RNG
	and 3
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_44197

	ld [CurEnemyMove], a
	ld a, c
	ld [CurEnemyMoveNum], a
	ret
; 441af


AIScoringPointers: ; 441af
	dw Function_0x38591
	dw Function_0x385e0
	dw Function_0x38635
	dw Function_0x386a2
	dw Function_0x386be
	dw Function_0x39315
	dw Function_0x39369
	dw Function_0x39418
	dw Function_0x39453
	dw Function_0x394a9
	dw Function_0x39502
	dw Function_0x39502
	dw Function_0x39502
	dw Function_0x39502
	dw Function_0x39502
	dw Function_0x39502
; 441cf


INCBIN "baserom.gbc", $441cf, $44378 - $441cf


PokedexDataPointerTable: ; 0x44378
INCLUDE "stats/pokedex/entry_pointers.asm"


INCBIN "baserom.gbc", $4456e, $44997 - $4456e


SECTION "bank12",DATA,BANK[$12]

INCBIN "baserom.gbc", $48000, $48e9b - $48000

PackFGFX:
INCBIN "gfx/misc/pack_f.2bpp"

INCBIN "baserom.gbc", $4925b, $49962 - $4925b

SpecialCelebiGFX:
INCBIN "gfx/special/celebi/leaf.2bpp"
INCBIN "gfx/special/celebi/1.2bpp"
INCBIN "gfx/special/celebi/2.2bpp"
INCBIN "gfx/special/celebi/3.2bpp"
INCBIN "gfx/special/celebi/4.2bpp"

INCBIN "baserom.gbc", $49aa2, $49d24 - $49aa2

ContinueText: ; 0x49d24
	db "CONTINUE@"
NewGameText: ; 0x49d2d
	db "NEW GAME@"
OptionText: ; 0x49d36
	db "OPTION@"
MysteryGiftText: ; 0x49d3d
	db "MYSTERY GIFT@"
MobileText: ; 0x49d4a
	db "MOBILE@"
MobileStudiumText: ; 0x49d51
	db "MOBILE STUDIUM@"

Label49d60: ; 0x49d60
	dw $5eee ; XXX is this ContinueASM?
	dw $5ee0 ; XXX is this NewGameASM?
	dw $5ee7 ; XXX is this OptionASM?
	dw $5ef5 ; XXX is this MysteryGiftASM?
	dw $5efc ; XXX is this MobileASM?
	dw $6496 ; XXX is this MobileStudiumASM?

NewGameMenu: ; 0x49d6c
	db 2
	db NEW_GAME
	db OPTION
	db $ff

ContinueMenu: ; 0x49d70
	db 3
	db CONTINUE
	db NEW_GAME
	db OPTION
	db $ff

MobileMysteryMenu: ; 0x49d75
	db 5
	db CONTINUE
	db NEW_GAME
	db OPTION
	db MYSTERY_GIFT
	db MOBILE
	db $ff

MobileMenu: ; 0x49d7c
	db 4
	db CONTINUE
	db NEW_GAME
	db OPTION
	db MOBILE
	db $ff

MobileStudiumMenu: ; 0x49d82
	db 5
	db CONTINUE
	db NEW_GAME
	db OPTION
	db MOBILE
	db MOBILE_STUDIUM
	db $ff

MysteryMobileStudiumMenu: ; 0x49d89
	db 6
	db CONTINUE
	db NEW_GAME
	db OPTION
	db MYSTERY_GIFT
	db MOBILE
	db MOBILE_STUDIUM
	db $ff

MysteryMenu: ; 0x49d91
	db 4
	db CONTINUE
	db NEW_GAME
	db OPTION
	db MYSTERY_GIFT
	db $ff

MysteryStudiumMenu: ; 0x49d97
	db 5
	db CONTINUE
	db NEW_GAME
	db OPTION
	db MYSTERY_GIFT
	db MOBILE_STUDIUM
	db $ff

StudiumMenu: ; 0x49d9e
	db 4
	db CONTINUE
	db NEW_GAME
	db OPTION
	db MOBILE_STUDIUM
	db $ff

INCBIN "baserom.gbc", $49da4, $4a6e8 - $49da4

SpecialBeastsCheck: ; 0x4a6e8
; Check if the player owns all three legendary beasts.
; They must exist in either party or PC, and have the player's OT and ID.

; outputs:
; ScriptVar is 1 if the Pokémon exist, otherwise 0.

	ld a, RAIKOU
	ld [ScriptVar], a
	call CheckOwnMonAnywhere
	jr nc, .notexist

	ld a, ENTEI
	ld [ScriptVar], a
	call CheckOwnMonAnywhere
	jr nc, .notexist

	ld a, SUICUNE
	ld [ScriptVar], a
	call CheckOwnMonAnywhere
	jr nc, .notexist

	; they exist
	ld a, $1
	ld [ScriptVar], a
	ret

.notexist
	xor a
	ld [ScriptVar], a
	ret

SpecialMonCheck: ; 0x4a711
; Check if a Pokémon exists in PC or party.
; It must exist in either party or PC, and have the player's OT and ID.

; inputs:
; ScriptVar contains species to search for
	call CheckOwnMonAnywhere
	jr c, .exists

	; doesn't exist
	xor a
	ld [ScriptVar], a
	ret

.exists
	ld a, $1
	ld [ScriptVar], a
	ret

CheckOwnMonAnywhere: ; 0x4a721
	ld a, [PartyCount]
	and a
	ret z ; no pokémon in party

	ld d, a
	ld e, $0
	ld hl, PartyMon1Species
	ld bc, PartyMon1OT

; run CheckOwnMon on each Pokémon in the party
.loop
	call CheckOwnMon
	ret c ; found!

	push bc
	ld bc, PartyMon2 - PartyMon1
	add hl, bc
	pop bc
	call UpdateOTPointer
	dec d
	jr nz, .loop ; 0x4a73d $f0

; XXX the below could use some cleanup
; run CheckOwnMon on each Pokémon in the PC
	ld a, $1
	call GetSRAMBank
	ld a, [$ad10]
	and a
	jr z, .asm_4a766 ; 0x4a748 $1c
	ld d, a
	ld hl, $ad26
	ld bc, $afa6
.asm_4a751
	call CheckOwnMon
	jr nc, .asm_4a75a ; 0x4a754 $4
	call CloseSRAM
	ret
.asm_4a75a
	push bc
	ld bc, $0020
	add hl, bc
	pop bc
	call UpdateOTPointer
	dec d
	jr nz, .asm_4a751 ; 0x4a764 $eb
.asm_4a766
	call CloseSRAM
	ld c, $0
.asm_4a76b
	ld a, [$db72]
	and $f
	cp c
	jr z, .asm_4a7af ; 0x4a771 $3c
	ld hl, $6810
	ld b, $0
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [hli]
	call GetSRAMBank
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	and a
	jr z, .asm_4a7af ; 0x4a784 $29
	push bc
	push hl
	ld de, $0016
	add hl, de
	ld d, h
	ld e, l
	pop hl
	push de
	ld de, $0296
	add hl, de
	ld b, h
	ld c, l
	pop hl
	ld d, a
.asm_4a798
	call CheckOwnMon
	jr nc, .asm_4a7a2 ; 0x4a79b $5
	pop bc
	call CloseSRAM
	ret
.asm_4a7a2
	push bc
	ld bc, $0020
	add hl, bc
	pop bc
	call UpdateOTPointer
	dec d
	jr nz, .asm_4a798 ; 0x4a7ac $ea
	pop bc
.asm_4a7af
	inc c
	ld a, c
	cp $e
	jr c, .asm_4a76b ; 0x4a7b3 $b6
	call CloseSRAM
	and a ; clear carry
	ret

CheckOwnMon: ; 0x4a7ba
; Check if a Pokémon belongs to the player and is of a specific species.

; inputs:
; hl, pointer to PartyMonNSpecies
; bc, pointer to PartyMonNOT
; ScriptVar should contain the species we're looking for

; outputs:
; sets carry if monster matches species, ID, and OT name.

	push bc
	push hl
	push de
	ld d, b
	ld e, c

; check species
	ld a, [ScriptVar] ; species we're looking for
	ld b, [hl] ; species we have
	cp b
	jr nz, .notfound ; species doesn't match

; check ID number
	ld bc, PartyMon1ID - PartyMon1Species
	add hl, bc ; now hl points to ID number
	ld a, [PlayerID]
	cp [hl]
	jr nz, .notfound ; ID doesn't match
	inc hl
	ld a, [PlayerID + 1]
	cp [hl]
	jr nz, .notfound ; ID doesn't match

; check OT
; This only checks five characters, which is fine for the Japanese version,
; but in the English version the player name is 7 characters, so this is wrong.

	ld hl, PlayerName

	ld a, [de]
	cp [hl]
	jr nz, .notfound
	cp "@"
	jr z, .found ; reached end of string
	inc hl
	inc de

	ld a, [de]
	cp [hl]
	jr nz, .notfound
	cp $50
	jr z, .found
	inc hl
	inc de

	ld a, [de]
	cp [hl]
	jr nz, .notfound
	cp $50
	jr z, .found
	inc hl
	inc de

	ld a, [de]
	cp [hl]
	jr nz, .notfound
	cp $50
	jr z, .found
	inc hl
	inc de

	ld a, [de]
	cp [hl]
	jr z, .found

.notfound
	pop de
	pop hl
	pop bc
	and a ; clear carry
	ret
.found
	pop de
	pop hl
	pop bc
	scf
	ret

; 0x4a810
INCBIN "baserom.gbc", $4a810, $4a83a - $4a810

UpdateOTPointer: ; 0x4a83a
	push hl
	ld hl, PartyMon2OT - PartyMon1OT
	add hl, bc
	ld b, h
	ld c, l
	pop hl
	ret
; 0x4a843

INCBIN "baserom.gbc", $4a843, $4ae78 - $4a843


SECTION "bank13",DATA,BANK[$13]

INCBIN "baserom.gbc", $4c000, $4c075 - $4c000

Tileset03PalMap: ; 0x4c075
INCBIN "tilesets/03_palette_map.bin"
; 0x4c0e5

Tileset00PalMap: ; 0x4c0e5
Tileset01PalMap: ; 0x4c0e5
INCBIN "tilesets/01_palette_map.bin"
; 0x4c155

Tileset02PalMap: ; 0x4c155
INCBIN "tilesets/02_palette_map.bin"
; 0x4c1c5

Tileset05PalMap: ; 0x4c1c5
INCBIN "tilesets/05_palette_map.bin"
; 0x4c235

Tileset06PalMap: ; 0x4c235
INCBIN "tilesets/06_palette_map.bin"
; 0x4c2a5

Tileset07PalMap: ; 0x4c2a5
INCBIN "tilesets/07_palette_map.bin"
; 0x4c315

Tileset08PalMap: ; 0x4c315
INCBIN "tilesets/08_palette_map.bin"
; 0x4c385

Tileset09PalMap: ; 0x4c385
INCBIN "tilesets/09_palette_map.bin"
; 0x4c3f5

Tileset10PalMap: ; 0x4c3f5
INCBIN "tilesets/10_palette_map.bin"
; 0x4c465

Tileset11PalMap: ; 0x4c465
INCBIN "tilesets/11_palette_map.bin"
; 0x4c4d5

Tileset12PalMap: ; 0x4c4d5
INCBIN "tilesets/12_palette_map.bin"
; 0x4c545

Tileset13PalMap: ; 0x4c545
INCBIN "tilesets/13_palette_map.bin"
; 0x4c5b5

Tileset14PalMap: ; 0x4c5b5
INCBIN "tilesets/14_palette_map.bin"
; 0x4c625

Tileset15PalMap: ; 0x4c625
INCBIN "tilesets/15_palette_map.bin"
; 0x4c695

Tileset16PalMap: ; 0x4c695
INCBIN "tilesets/16_palette_map.bin"
; 0x4c705

Tileset23PalMap: ; 0x4c705
INCBIN "tilesets/23_palette_map.bin"
; 0x4c775

Tileset24PalMap: ; 0x4c775
Tileset30PalMap: ; 0x4c775
INCBIN "tilesets/30_palette_map.bin"
; 0x4c7e5

Tileset25PalMap: ; 0x4c7e5
INCBIN "tilesets/25_palette_map.bin"
; 0x4c855

Tileset26PalMap: ; 0x4c855
Tileset32PalMap: ; 0x4c855
Tileset33PalMap: ; 0x4c855
Tileset34PalMap: ; 0x4c855
Tileset35PalMap: ; 0x4c855
Tileset36PalMap: ; 0x4c855
INCBIN "tilesets/36_palette_map.bin"
; 0x4c8c5

Tileset27PalMap: ; 0x4c8c5
INCBIN "tilesets/27_palette_map.bin"
; 0x4c935

Tileset17PalMap: ; 0x4c935
INCBIN "tilesets/17_palette_map.bin"
; 0x4c9a5

Tileset28PalMap: ; 0x4c9a5
INCBIN "tilesets/28_palette_map.bin"
; 0x4ca15

Tileset18PalMap: ; 0x4ca15
INCBIN "tilesets/18_palette_map.bin"
; 0x4ca85

Tileset19PalMap: ; 0x4ca85
INCBIN "tilesets/19_palette_map.bin"
; 0x4caf5

Tileset20PalMap: ; 0x4caf5
INCBIN "tilesets/20_palette_map.bin"
; 0x4cb65

INCBIN "baserom.gbc", $4cb65, $4cbd5-$4cb65

Tileset29PalMap: ; 0x4cbd5
INCBIN "tilesets/29_palette_map.bin"
; 0x4cc45

Tileset31PalMap: ; 0x4cc45
INCBIN "tilesets/31_palette_map.bin"
; 0x4ccb5

Tileset21PalMap: ; 0x4ccb5
INCBIN "tilesets/21_palette_map.bin"
; 0x4cd25

Tileset22PalMap: ; 0x4cd25
INCBIN "tilesets/22_palette_map.bin"
; 0x4cd95

Tileset04PalMap: ; 0x4cd95
INCBIN "tilesets/04_palette_map.bin"
; 0x4ce05

INCBIN "baserom.gbc", $4ce05, $4ce1f - $4ce05

TileTypeTable: ; 4ce1f
; 256 tiletypes
; 01 = surfable
	db $00, $00, $00, $00, $00, $00, $00, $0f
	db $00, $00, $00, $00, $00, $00, $00, $0f
	db $00, $00, $1f, $00, $00, $1f, $00, $00
	db $00, $00, $1f, $00, $00, $1f, $00, $00
	db $01, $01, $11, $00, $11, $01, $01, $0f
	db $01, $01, $11, $00, $11, $01, $01, $0f
	db $01, $01, $01, $01, $01, $01, $01, $01
	db $01, $01, $01, $01, $01, $01, $01, $01
	
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $0f, $00, $00, $00, $00, $00
	db $00, $00, $0f, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	
	db $0f, $0f, $0f, $0f, $0f, $00, $00, $00
	db $0f, $0f, $0f, $0f, $0f, $00, $00, $00
	db $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f
	db $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	
	db $01, $01, $01, $01, $01, $01, $01, $01
	db $01, $01, $01, $01, $01, $01, $01, $01
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $0f
; 4cf1f

INCBIN "baserom.gbc", $4cf1f, $4d596 - $4cf1f

Tilesets:

Tileset00: ; 0x4d596
	dbw BANK(Tileset00GFX), Tileset00GFX
	dbw BANK(Tileset00Meta), Tileset00Meta
	dbw BANK(Tileset00Coll), Tileset00Coll
	dw Tileset00Anim
	dw $0000
	dw Tileset00PalMap

Tileset01: ; 0x4d5a5
	dbw BANK(Tileset01GFX), Tileset01GFX
	dbw BANK(Tileset01Meta), Tileset01Meta
	dbw BANK(Tileset01Coll), Tileset01Coll
	dw Tileset01Anim
	dw $0000
	dw Tileset01PalMap

Tileset02: ; 0x4d5b4
	dbw BANK(Tileset02GFX), Tileset02GFX
	dbw BANK(Tileset02Meta), Tileset02Meta
	dbw BANK(Tileset02Coll), Tileset02Coll
	dw Tileset02Anim
	dw $0000
	dw Tileset02PalMap

Tileset03: ; 0x4d5c3
	dbw BANK(Tileset03GFX), Tileset03GFX
	dbw BANK(Tileset03Meta), Tileset03Meta
	dbw BANK(Tileset03Coll), Tileset03Coll
	dw Tileset03Anim
	dw $0000
	dw Tileset03PalMap

Tileset04: ; 0x4d5d2
	dbw BANK(Tileset04GFX), Tileset04GFX
	dbw BANK(Tileset04Meta), Tileset04Meta
	dbw BANK(Tileset04Coll), Tileset04Coll
	dw Tileset04Anim
	dw $0000
	dw Tileset04PalMap

Tileset05: ; 0x4d5e1
	dbw BANK(Tileset05GFX), Tileset05GFX
	dbw BANK(Tileset05Meta), Tileset05Meta
	dbw BANK(Tileset05Coll), Tileset05Coll
	dw Tileset05Anim
	dw $0000
	dw Tileset05PalMap

Tileset06: ; 0x4d5f0
	dbw BANK(Tileset06GFX), Tileset06GFX
	dbw BANK(Tileset06Meta), Tileset06Meta
	dbw BANK(Tileset06Coll), Tileset06Coll
	dw Tileset06Anim
	dw $0000
	dw Tileset06PalMap

Tileset07: ; 0x4d5ff
	dbw BANK(Tileset07GFX), Tileset07GFX
	dbw BANK(Tileset07Meta), Tileset07Meta
	dbw BANK(Tileset07Coll), Tileset07Coll
	dw Tileset07Anim
	dw $0000
	dw Tileset07PalMap

Tileset08: ; 0x4d60e
	dbw BANK(Tileset08GFX), Tileset08GFX
	dbw BANK(Tileset08Meta), Tileset08Meta
	dbw BANK(Tileset08Coll), Tileset08Coll
	dw Tileset08Anim
	dw $0000
	dw Tileset08PalMap

Tileset09: ; 0x4d61d
	dbw BANK(Tileset09GFX), Tileset09GFX
	dbw BANK(Tileset09Meta), Tileset09Meta
	dbw BANK(Tileset09Coll), Tileset09Coll
	dw Tileset09Anim
	dw $0000
	dw Tileset09PalMap

Tileset10: ; 0x4d62c
	dbw BANK(Tileset10GFX), Tileset10GFX
	dbw BANK(Tileset10Meta), Tileset10Meta
	dbw BANK(Tileset10Coll), Tileset10Coll
	dw Tileset10Anim
	dw $0000
	dw Tileset10PalMap

Tileset11: ; 0x4d63b
	dbw BANK(Tileset11GFX), Tileset11GFX
	dbw BANK(Tileset11Meta), Tileset11Meta
	dbw BANK(Tileset11Coll), Tileset11Coll
	dw Tileset11Anim
	dw $0000
	dw Tileset11PalMap

Tileset12: ; 0x4d64a
	dbw BANK(Tileset12GFX), Tileset12GFX
	dbw BANK(Tileset12Meta), Tileset12Meta
	dbw BANK(Tileset12Coll), Tileset12Coll
	dw Tileset12Anim
	dw $0000
	dw Tileset12PalMap

Tileset13: ; 0x4d659
	dbw BANK(Tileset13GFX), Tileset13GFX
	dbw BANK(Tileset13Meta), Tileset13Meta
	dbw BANK(Tileset13Coll), Tileset13Coll
	dw Tileset13Anim
	dw $0000
	dw Tileset13PalMap

Tileset14: ; 0x4d668
	dbw BANK(Tileset14GFX), Tileset14GFX
	dbw BANK(Tileset14Meta), Tileset14Meta
	dbw BANK(Tileset14Coll), Tileset14Coll
	dw Tileset14Anim
	dw $0000
	dw Tileset14PalMap

Tileset15: ; 0x4d677
	dbw BANK(Tileset15GFX), Tileset15GFX
	dbw BANK(Tileset15Meta), Tileset15Meta
	dbw BANK(Tileset15Coll), Tileset15Coll
	dw Tileset15Anim
	dw $0000
	dw Tileset15PalMap

Tileset16: ; 0x4d686
	dbw BANK(Tileset16GFX), Tileset16GFX
	dbw BANK(Tileset16Meta), Tileset16Meta
	dbw BANK(Tileset16Coll), Tileset16Coll
	dw Tileset16Anim
	dw $0000
	dw Tileset16PalMap

Tileset17: ; 0x4d695
	dbw BANK(Tileset17GFX), Tileset17GFX
	dbw BANK(Tileset17Meta), Tileset17Meta
	dbw BANK(Tileset17Coll), Tileset17Coll
	dw Tileset17Anim
	dw $0000
	dw Tileset17PalMap

Tileset18: ; 0x4d6a4
	dbw BANK(Tileset18GFX), Tileset18GFX
	dbw BANK(Tileset18Meta), Tileset18Meta
	dbw BANK(Tileset18Coll), Tileset18Coll
	dw Tileset18Anim
	dw $0000
	dw Tileset18PalMap

Tileset19: ; 0x4d6b3
	dbw BANK(Tileset19GFX), Tileset19GFX
	dbw BANK(Tileset19Meta), Tileset19Meta
	dbw BANK(Tileset19Coll), Tileset19Coll
	dw Tileset19Anim
	dw $0000
	dw Tileset19PalMap

Tileset20: ; 0x4d6c2
	dbw BANK(Tileset20GFX), Tileset20GFX
	dbw BANK(Tileset20Meta), Tileset20Meta
	dbw BANK(Tileset20Coll), Tileset20Coll
	dw Tileset20Anim
	dw $0000
	dw Tileset20PalMap

Tileset21: ; 0x4d6d1
	dbw BANK(Tileset21GFX), Tileset21GFX
	dbw BANK(Tileset21Meta), Tileset21Meta
	dbw BANK(Tileset21Coll), Tileset21Coll
	dw Tileset21Anim
	dw $0000
	dw Tileset21PalMap

Tileset22: ; 0x4d6e0
	dbw BANK(Tileset22GFX), Tileset22GFX
	dbw BANK(Tileset22Meta), Tileset22Meta
	dbw BANK(Tileset22Coll), Tileset22Coll
	dw Tileset22Anim
	dw $0000
	dw Tileset22PalMap

Tileset23: ; 0x4d6ef
	dbw BANK(Tileset23GFX), Tileset23GFX
	dbw BANK(Tileset23Meta), Tileset23Meta
	dbw BANK(Tileset23Coll), Tileset23Coll
	dw Tileset23Anim
	dw $0000
	dw Tileset23PalMap

Tileset24: ; 0x4d6fe
	dbw BANK(Tileset24GFX), Tileset24GFX
	dbw BANK(Tileset24Meta), Tileset24Meta
	dbw BANK(Tileset24Coll), Tileset24Coll
	dw Tileset24Anim
	dw $0000
	dw Tileset24PalMap

Tileset25: ; 0x4d70d
	dbw BANK(Tileset25GFX), Tileset25GFX
	dbw BANK(Tileset25Meta), Tileset25Meta
	dbw BANK(Tileset25Coll), Tileset25Coll
	dw Tileset25Anim
	dw $0000
	dw Tileset25PalMap

Tileset26: ; 0x4d71c
	dbw BANK(Tileset26GFX), Tileset26GFX
	dbw BANK(Tileset26Meta), Tileset26Meta
	dbw BANK(Tileset26Coll), Tileset26Coll
	dw Tileset26Anim
	dw $0000
	dw Tileset26PalMap

Tileset27: ; 0x4d72b
	dbw BANK(Tileset27GFX), Tileset27GFX
	dbw BANK(Tileset27Meta), Tileset27Meta
	dbw BANK(Tileset27Coll), Tileset27Coll
	dw Tileset27Anim
	dw $0000
	dw Tileset27PalMap

Tileset28: ; 0x4d73a
	dbw BANK(Tileset28GFX), Tileset28GFX
	dbw BANK(Tileset28Meta), Tileset28Meta
	dbw BANK(Tileset28Coll), Tileset28Coll
	dw Tileset28Anim
	dw $0000
	dw Tileset28PalMap

Tileset29: ; 0x4d749
	dbw BANK(Tileset29GFX), Tileset29GFX
	dbw BANK(Tileset29Meta), Tileset29Meta
	dbw BANK(Tileset29Coll), Tileset29Coll
	dw Tileset29Anim
	dw $0000
	dw Tileset29PalMap

Tileset30: ; 0x4d758
	dbw BANK(Tileset30GFX), Tileset30GFX
	dbw BANK(Tileset30Meta), Tileset30Meta
	dbw BANK(Tileset30Coll), Tileset30Coll
	dw Tileset30Anim
	dw $0000
	dw Tileset30PalMap

Tileset31: ; 0x4d767
	dbw BANK(Tileset31GFX), Tileset31GFX
	dbw BANK(Tileset31Meta), Tileset31Meta
	dbw BANK(Tileset31Coll), Tileset31Coll
	dw Tileset31Anim
	dw $0000
	dw Tileset31PalMap

Tileset32: ; 0x4d776
	dbw BANK(Tileset32GFX), Tileset32GFX
	dbw BANK(Tileset32Meta), Tileset32Meta
	dbw BANK(Tileset32Coll), Tileset32Coll
	dw Tileset32Anim
	dw $0000
	dw Tileset32PalMap

Tileset33: ; 0x4d785
	dbw BANK(Tileset33GFX), Tileset33GFX
	dbw BANK(Tileset33Meta), Tileset33Meta
	dbw BANK(Tileset33Coll), Tileset33Coll
	dw Tileset33Anim
	dw $0000
	dw Tileset33PalMap

Tileset34: ; 0x4d794
	dbw BANK(Tileset34GFX), Tileset34GFX
	dbw BANK(Tileset34Meta), Tileset34Meta
	dbw BANK(Tileset34Coll), Tileset34Coll
	dw Tileset34Anim
	dw $0000
	dw Tileset34PalMap

Tileset35: ; 0x4d7a3
	dbw BANK(Tileset35GFX), Tileset35GFX
	dbw BANK(Tileset35Meta), Tileset35Meta
	dbw BANK(Tileset35Coll), Tileset35Coll
	dw Tileset35Anim
	dw $0000
	dw Tileset35PalMap

Tileset36: ; 0x4d7b2
	dbw BANK(Tileset36GFX), Tileset36GFX
	dbw BANK(Tileset36Meta), Tileset36Meta
	dbw BANK(Tileset36Coll), Tileset36Coll
	dw Tileset36Anim
	dw $0000
	dw Tileset36PalMap

; 0x4d7c1

INCBIN "baserom.gbc", $4d7c1, $4d860 - $4d7c1

CheckPokerus: ; 4d860
; Return carry if a monster in your party has Pokerus

; Get number of monsters to iterate over
	ld a, [PartyCount]
	and a
	jr z, .NoPokerus
	ld b, a
; Check each monster in the party for Pokerus
	ld hl, PartyMon1PokerusStatus
	ld de, PartyMon2 - PartyMon1
.Check
	ld a, [hl]
	and $0f ; only the bottom nybble is used
	jr nz, .HasPokerus
; Next PartyMon
	add hl, de
	dec b
	jr nz, .Check
.NoPokerus
	and a
	ret
.HasPokerus
	scf
	ret
; 4d87a

INCBIN "baserom.gbc", $4d87a, $4dc8a - $4d87a

StatsScreenInit: ; 4dc8a
	ld hl, StatsScreenMain
	jr .gotaddress
	ld hl, $5cf7
	jr .gotaddress
.gotaddress
	ld a, [$ffde]
	push af
	xor a
	ld [$ffde], a ; disable overworld tile animations
	ld a, [$c2c6] ; whether sprite is to be mirrorred
	push af
	ld a, [$cf63]
	ld b, a
	ld a, [$cf64]
	ld c, a
	push bc
	push hl
	call $31f3
	call $0fc8
	call $1ad2
	ld a, $3e
	ld hl, $753e
	rst FarCall ; this loads graphics
	pop hl
	call JpHl
	call $31f3
	call $0fc8
	pop bc
	; restore old values
	ld a, b
	ld [$cf63], a
	ld a, c
	ld [$cf64], a
	pop af
	ld [$c2c6], a
	pop af
	ld [$ffde], a
	ret
; 0x4dcd2

StatsScreenMain: ; 0x4dcd2
	xor a
	ld [$cf63], a
	ld [$cf64], a
	ld a, [$cf64]
	and $fc
	or $1
	ld [$cf64], a
.loop ; 4dce3
	ld a, [$cf63]
	and $7f
	ld hl, StatsScreenPointerTable
	rst $28
	call $5d3a ; check for keys?
	ld a, [$cf63]
	bit 7, a
	jr z, .loop
	ret
; 0x4dcf7

INCBIN "baserom.gbc", $4dcf7, $4dd2a - $4dcf7

StatsScreenPointerTable: ; 4dd2a
    dw $5d72 ; regular pokémon
    dw EggStatsInit ; egg
    dw $5de6
    dw $5dac
    dw $5dc6
    dw $5de6
    dw $5dd6
    dw $5d6c

; 4dd3a

INCBIN "baserom.gbc", $4dd3a, $4dda1 - $4dd3a

EggStatsInit: ; 4dda1
	call EggStatsScreen
	ld a, [$cf63]
	inc a
	ld [$cf63], a
	ret
; 0x4ddac

INCBIN "baserom.gbc", $4ddac, $4e21e - $4ddac

IDNoString: ; 4e21e
    db $73, "№.@"

OTString: ; 4e222
    db "OT/@"
; 4e226

INCBIN "baserom.gbc", $4e226, $4e33a - $4e226

EggStatsScreen: ; 4e33a
	xor a
	ld [hBGMapMode], a
	ld hl, $cda1
	call SetHPPal
	ld b, $3
	call GetSGBLayout
	call $5f8f
	ld de, EggString
	hlcoord 8, 1 ; $c4bc
	call PlaceString
	ld de, IDNoString
	hlcoord 8, 3 ; $c4e4
	call PlaceString
	ld de, OTString
	hlcoord 8, 5 ; $c50c
	call PlaceString
	ld de, FiveQMarkString
	hlcoord 11, 3 ; $c4e7
	call PlaceString
	ld de, FiveQMarkString
	hlcoord 11, 5 ; $c50f
	call PlaceString
	ld a, [$d129] ; egg status
	ld de, EggSoonString
	cp $6
	jr c, .picked
	ld de, EggCloseString
	cp $b
	jr c, .picked
	ld de, EggMoreTimeString
	cp $29
	jr c, .picked
	ld de, EggALotMoreTimeString
.picked
	hlcoord 1, 9 ; $c555
	call PlaceString
	ld hl, $cf64
	set 5, [hl]
	call $32f9 ; pals
	call $045a
	ld hl, TileMap
	call $3786
	ld a, $41
	ld hl, $402d
	rst FarCall
	call $6497

	ld a, [TempMonHappiness]
	cp 6
	ret nc
	ld de, SFX_2_BOOPS
	call StartSFX
	ret
; 0x4e3c0

EggString: ; 4e3c0
    db "EGG@"

FiveQMarkString: ; 4e3c4
    db "?????@"

EggSoonString: ; 0x4e3ca
    db "It's making sounds", $4e, "inside. It's going", $4e, "to hatch soon!@"

EggCloseString: ; 0x4e3fd
    db "It moves around", $4e, "inside sometimes.", $4e, "It must be close", $4e, "to hatching.@"

EggMoreTimeString: ; 0x4e43d
    db "Wonder what's", $4e, "inside? It needs", $4e, "more time, though.@"

EggALotMoreTimeString: ; 0x4e46e
    db "This EGG needs a", $4e, "lot more time to", $4e, "hatch.@"

; 0x4e497

INCBIN "baserom.gbc", $4e497, $4e831 - $4e497

EvolutionGFX:
INCBIN "gfx/evo/bubble_large.2bpp"
INCBIN "gfx/evo/bubble.2bpp"

INCBIN "baserom.gbc", $4e881, $4f31c - $4e881


SECTION "bank14",DATA,BANK[$14]

INCBIN "baserom.gbc", $50000, $5005f-$50000

WritePartyMenuTilemap: ; 0x5005f
	ld hl, Options
	ld a, [hl]
	push af
	set 4, [hl] ; Disable text delay
	xor a
	ld [hBGMapMode], a
	ld hl, TileMap
	ld bc, $0168
	ld a, " "
	call $3041 ; blank the tilemap
	call $4396 ; This reads from a pointer table???
.asm_50077
	ld a, [hli]
	cp $ff
	jr z, .asm_50084 ; 0x5007a $8
	push hl
	ld hl, $4089
	rst $28
	pop hl
	jr .asm_50077 ; 0x50082 $f3
.asm_50084
	pop af
	ld [Options], a
	ret
; 0x50089

INCBIN "baserom.gbc", $50089, $50457-$50089

PartyMenuSelect: ; 0x50457
; sets carry if exitted menu.
	call $1bc9
	call $1bee
	ld a, [PartyCount]
	inc a
	ld b, a
	ld a, [$cfa9] ; menu selection?
	cp b
	jr z, .exitmenu ; CANCEL
	ld [$d0d8], a
	ld a, [$ffa9]
	ld b, a
	bit 1, b
	jr nz, .exitmenu ; B button?
	ld a, [$cfa9]
	dec a
	ld [CurPartyMon], a
	ld c, a
	ld b, $0
	ld hl, PartySpecies
	add hl, bc
	ld a, [hl]
	ld [CurPartySpecies], a

	ld de, SFX_READ_TEXT_2
	call StartSFX
	call WaitSFX
	and a
	ret

.exitmenu
	ld de, SFX_READ_TEXT_2
	call StartSFX
	call WaitSFX
	scf
	ret
; 0x5049a


PrintPartyMenuText: ; 5049a
	ld hl, $c5b8
	ld bc, $0212
	call $0fe8 ; related to TextBoxBorder
	ld a, [PartyCount]
	and a
	jr nz, .haspokemon
	ld de, YouHaveNoPKMNString
	jr .gotstring
.haspokemon ; 504ae
	ld a, [PartyMenuActionText]
	and $f ; drop high nibble
	ld hl, PartyMenuStrings
	ld e, a
	ld d, $0
	add hl, de
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
.gotstring ; 504be
	ld a, [Options]
	push af
	set 4, a ; disable text delay
	ld [Options], a
	ld hl, $c5e1 ; Coord
	call PlaceString
	pop af
	ld [Options], a
	ret
; 0x504d2

PartyMenuStrings: ; 0x504d2
    dw ChooseAMonString
    dw UseOnWhichPKMNString
    dw WhichPKMNString
    dw TeachWhichPKMNString
    dw MoveToWhereString
    dw UseOnWhichPKMNString
    dw ChooseAMonString ; Probably used to be ChooseAFemalePKMNString
    dw ChooseAMonString ; Probably used to be ChooseAMalePKMNString
    dw ToWhichPKMNString

ChooseAMonString: ; 0x504e4
    db "Choose a #MON.@"
UseOnWhichPKMNString: ; 0x504f3
    db "Use on which ", $e1, $e2, "?@"
WhichPKMNString: ; 0x50504
    db "Which ", $e1, $e2, "?@"
TeachWhichPKMNString: ; 0x5050e
    db "Teach which ", $e1, $e2, "?@"
MoveToWhereString: ; 0x5051e
    db "Move to where?@"
ChooseAFemalePKMNString: ; 0x5052d  ; UNUSED
    db "Choose a ♀", $e1, $e2, ".@"
ChooseAMalePKMNString: ; 0x5053b    ; UNUSED
    db "Choose a ♂", $e1, $e2, ".@"
ToWhichPKMNString: ; 0x50549
    db "To which ", $e1, $e2, "?@"

YouHaveNoPKMNString: ; 0x50556
    db "You have no ", $e1, $e2, "!@"


INCBIN "baserom.gbc", $50566, $5093a - $50566


PrintMoveType: ; 5093a
; Print the type of move b at hl.

	push hl
	ld a, b
	dec a
	ld bc, Move2 - Move1
	ld hl, Moves
	call AddNTimes
	ld de, StringBuffer1
	ld a, BANK(Moves)
	call FarCopyBytes
	ld a, [StringBuffer1 + PlayerMoveType - PlayerMoveStruct]
	pop hl

	ld b, a
; 50953

PrintType: ; 50953
; Print type b at hl.
	ld a, b

	push hl
	add a
	ld hl, TypeNames
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl

	jp PlaceString
; 50964


LoadTypeName: ; 50964
; Copy the name of type $d265 to StringBuffer1.
	ld a, [$d265]
	ld hl, TypeNames
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, StringBuffer1
	ld bc, $000d
	jp CopyBytes
; 5097b


TypeNames: ; 5097b
	dw Normal
	dw Fighting
	dw Flying
	dw Poison
	dw Ground
	dw Rock
	dw Bird
	dw Bug
	dw Ghost
	dw Steel
	dw Normal
	dw Normal
	dw Normal
	dw Normal
	dw Normal
	dw Normal
	dw Normal
	dw Normal
	dw Normal
	dw UnknownType
	dw Fire
	dw Water
	dw Grass
	dw Electric
	dw Psychic
	dw Ice
	dw Dragon
	dw Dark

Normal:
	db "NORMAL@"
Fighting:
	db "FIGHTING@"
Flying:
	db "FLYING@"
Poison:
	db "POISON@"
UnknownType:
	db "???@"
Fire:
	db "FIRE@"
Water:
	db "WATER@"
Grass:
	db "GRASS@"
Electric:
	db "ELECTRIC@"
Psychic:
	db "PSYCHIC@"
Ice:
	db "ICE@"
Ground:
	db "GROUND@"
Rock:
	db "ROCK@"
Bird:
	db "BIRD@"
Bug:
	db "BUG@"
Ghost:
	db "GHOST@"
Steel:
	db "STEEL@"
Dragon:
	db "DRAGON@"
Dark:
	db "DARK@"
; 50a28


INCBIN "baserom.gbc", $50a28, $50bdd - $50a28


GetGender: ; 50bdd
; Return the gender of a given monster in a.

; 1: male
; 0: female
; c: genderless

; This is determined by comparing the Attack and Speed DVs
; with the species' gender ratio.


; Figure out what type of monster struct we're looking at.

; 0: PartyMon
	ld hl, PartyMon1DVs
	ld bc, PartyMon2 - PartyMon1
	ld a, [MonType]
	and a
	jr z, .PartyMon
	
; 1: OTPartyMon
	ld hl, OTPartyMon1DVs
	dec a
	jr z, .PartyMon
	
; 2: BoxMon
	ld hl, $ad26 + $15 ; BoxMon1DVs
	ld bc, $20 ; BoxMon2 - BoxMon1
	dec a
	jr z, .BoxMon
	
; 3: Unknown
	ld hl, $d123 ; DVBuffer
	dec a
	jr z, .DVs
	
; else: WildMon
	ld hl, EnemyMonDVs
	jr .DVs
	
	
; Get our place in the party/box.
	
.PartyMon
.BoxMon
	ld a, [CurPartyMon]
	call AddNTimes
	
	
.DVs
	
; BoxMon data is read directly from SRAM.
	ld a, [MonType]
	cp 2
	ld a, 1
	call z, GetSRAMBank
	
; Attack DV
	ld a, [hli]
	and $f0
	ld b, a
; Speed DV
	ld a, [hl]
	and $f0
	swap a
	
; Put our DVs together.
	or b
	ld b, a

; Close SRAM if we were dealing with a BoxMon.
	ld a, [MonType] ; MonType
	cp 2 ; BOXMON
	call z, CloseSRAM
	
	
; We need the gender ratio to do anything with this.
	push bc
	ld a, [CurPartySpecies]
	dec a
	ld hl, BaseData + BaseGender - CurBaseData
	ld bc, BaseData1 - BaseData
	call AddNTimes
	pop bc
	
	ld a, BANK(BaseData)
	call GetFarByte
	
	
; The higher the ratio, the more likely the monster is to be female.
	
	cp $ff
	jr z, .Genderless
	
	and a
	jr z, .Male
	
	cp $fe
	jr z, .Female
	
; Values below the ratio are male, and vice versa.
	cp b
	jr c, .Male
	
.Female
	xor a
	ret
	
.Male
	ld a, 1
	and a
	ret
	
.Genderless
	scf
	ret
; 50c50

INCBIN "baserom.gbc", $50c50, $51424 - $50c50

BaseData:
INCLUDE "stats/base_stats.asm"

PokemonNames:
INCLUDE "stats/pokemon_names.asm"

INCBIN "baserom.gbc", $53D84, $53e2e - $53D84


SECTION "bank15",DATA,BANK[$15]

;                          Map Scripts I

INCLUDE "maps/GoldenrodGym.asm"
INCLUDE "maps/GoldenrodBikeShop.asm"
INCLUDE "maps/GoldenrodHappinessRater.asm"
INCLUDE "maps/GoldenrodBillsHouse.asm"
INCLUDE "maps/GoldenrodMagnetTrainStation.asm"
INCLUDE "maps/GoldenrodFlowerShop.asm"
INCLUDE "maps/GoldenrodPPSpeechHouse.asm"
INCLUDE "maps/GoldenrodNameRatersHouse.asm"
INCLUDE "maps/GoldenrodDeptStore1F.asm"
INCLUDE "maps/GoldenrodDeptStore2F.asm"
INCLUDE "maps/GoldenrodDeptStore3F.asm"
INCLUDE "maps/GoldenrodDeptStore4F.asm"
INCLUDE "maps/GoldenrodDeptStore5F.asm"
INCLUDE "maps/GoldenrodDeptStore6F.asm"
INCLUDE "maps/GoldenrodDeptStoreElevator.asm"
INCLUDE "maps/GoldenrodDeptStoreRoof.asm"
INCLUDE "maps/GoldenrodGameCorner.asm"


SECTION "bank16",DATA,BANK[$16]

;                          Map Scripts II

INCLUDE "maps/RuinsofAlphOutside.asm"
INCLUDE "maps/RuinsofAlphHoOhChamber.asm"
INCLUDE "maps/RuinsofAlphKabutoChamber.asm"
INCLUDE "maps/RuinsofAlphOmanyteChamber.asm"
INCLUDE "maps/RuinsofAlphAerodactylChamber.asm"
INCLUDE "maps/RuinsofAlphInnerChamber.asm"
INCLUDE "maps/RuinsofAlphResearchCenter.asm"
INCLUDE "maps/RuinsofAlphHoOhItemRoom.asm"
INCLUDE "maps/RuinsofAlphKabutoItemRoom.asm"
INCLUDE "maps/RuinsofAlphOmanyteItemRoom.asm"
INCLUDE "maps/RuinsofAlphAerodactylItemRoom.asm"
INCLUDE "maps/RuinsofAlphHoOhWordRoom.asm"
INCLUDE "maps/RuinsofAlphKabutoWordRoom.asm"
INCLUDE "maps/RuinsofAlphOmanyteWordRoom.asm"
INCLUDE "maps/RuinsofAlphAerodactylWordRoom.asm"
INCLUDE "maps/UnionCave1F.asm"
INCLUDE "maps/UnionCaveB1F.asm"
INCLUDE "maps/UnionCaveB2F.asm"
INCLUDE "maps/SlowpokeWellB1F.asm"
INCLUDE "maps/SlowpokeWellB2F.asm"
INCLUDE "maps/OlivineLighthouse1F.asm"
INCLUDE "maps/OlivineLighthouse2F.asm"
INCLUDE "maps/OlivineLighthouse3F.asm"
INCLUDE "maps/OlivineLighthouse4F.asm"


SECTION "bank17",DATA,BANK[$17]

;                         Map Scripts III

INCLUDE "maps/NationalPark.asm"
INCLUDE "maps/NationalParkBugContest.asm"
INCLUDE "maps/RadioTower1F.asm"
INCLUDE "maps/RadioTower2F.asm"
INCLUDE "maps/RadioTower3F.asm"
INCLUDE "maps/RadioTower4F.asm"


SECTION "bank18",DATA,BANK[$18]

;                          Map Scripts IV

INCLUDE "maps/RadioTower5F.asm"
INCLUDE "maps/OlivineLighthouse5F.asm"
INCLUDE "maps/OlivineLighthouse6F.asm"
INCLUDE "maps/GoldenrodPokeCenter1F.asm"
INCLUDE "maps/GoldenrodPokeComCenter2FMobile.asm"
INCLUDE "maps/IlexForestAzaleaGate.asm"
INCLUDE "maps/Route34IlexForestGate.asm"
INCLUDE "maps/DayCare.asm"


SECTION "bank19",DATA,BANK[$19]

INCBIN "baserom.gbc", $64000, $67308 - $64000


SECTION "bank1A",DATA,BANK[$1A]

;                          Map Scripts V

INCLUDE "maps/Route11.asm"
INCLUDE "maps/VioletMart.asm"
INCLUDE "maps/VioletGym.asm"
INCLUDE "maps/EarlsPokemonAcademy.asm"
INCLUDE "maps/VioletNicknameSpeechHouse.asm"
INCLUDE "maps/VioletPokeCenter1F.asm"
INCLUDE "maps/VioletOnixTradeHouse.asm"
INCLUDE "maps/Route32RuinsofAlphGate.asm"
INCLUDE "maps/Route32PokeCenter1F.asm"
INCLUDE "maps/Route35Goldenrodgate.asm"
INCLUDE "maps/Route35NationalParkgate.asm"
INCLUDE "maps/Route36RuinsofAlphgate.asm"
INCLUDE "maps/Route36NationalParkgate.asm"


SECTION "bank1B",DATA,BANK[$1B]

;                          Map Scripts VI

INCLUDE "maps/Route8.asm"
INCLUDE "maps/MahoganyMart1F.asm"
INCLUDE "maps/TeamRocketBaseB1F.asm"
INCLUDE "maps/TeamRocketBaseB2F.asm"
INCLUDE "maps/TeamRocketBaseB3F.asm"
INCLUDE "maps/IlexForest.asm"


SECTION "bank1C",DATA,BANK[$1C]

;                         Map Scripts VII

INCLUDE "maps/LakeofRage.asm"
INCLUDE "maps/CeladonDeptStore1F.asm"
INCLUDE "maps/CeladonDeptStore2F.asm"
INCLUDE "maps/CeladonDeptStore3F.asm"
INCLUDE "maps/CeladonDeptStore4F.asm"
INCLUDE "maps/CeladonDeptStore5F.asm"
INCLUDE "maps/CeladonDeptStore6F.asm"
INCLUDE "maps/CeladonDeptStoreElevator.asm"
INCLUDE "maps/CeladonMansion1F.asm"
INCLUDE "maps/CeladonMansion2F.asm"
INCLUDE "maps/CeladonMansion3F.asm"
INCLUDE "maps/CeladonMansionRoof.asm"
INCLUDE "maps/CeladonMansionRoofHouse.asm"
INCLUDE "maps/CeladonPokeCenter1F.asm"
INCLUDE "maps/CeladonPokeCenter2FBeta.asm"
INCLUDE "maps/CeladonGameCorner.asm"
INCLUDE "maps/CeladonGameCornerPrizeRoom.asm"
INCLUDE "maps/CeladonGym.asm"
INCLUDE "maps/CeladonCafe.asm"
INCLUDE "maps/Route16FuchsiaSpeechHouse.asm"
INCLUDE "maps/Route16Gate.asm"
INCLUDE "maps/Route7SaffronGate.asm"
INCLUDE "maps/Route1718Gate.asm"


SECTION "bank1D",DATA,BANK[$1D]

;                         Map Scripts VIII

INCLUDE "maps/DiglettsCave.asm"
INCLUDE "maps/MountMoon.asm"
INCLUDE "maps/Underground.asm"
INCLUDE "maps/RockTunnel1F.asm"
INCLUDE "maps/RockTunnelB1F.asm"
INCLUDE "maps/SafariZoneFuchsiaGateBeta.asm"
INCLUDE "maps/SafariZoneBeta.asm"
INCLUDE "maps/VictoryRoad.asm"
INCLUDE "maps/OlivinePort.asm"
INCLUDE "maps/VermilionPort.asm"
INCLUDE "maps/FastShip1F.asm"
INCLUDE "maps/FastShipCabins_NNW_NNE_NE.asm"
INCLUDE "maps/FastShipCabins_SW_SSW_NW.asm"
INCLUDE "maps/FastShipCabins_SE_SSE_CaptainsCabin.asm"
INCLUDE "maps/FastShipB1F.asm"
INCLUDE "maps/OlivinePortPassage.asm"
INCLUDE "maps/VermilionPortPassage.asm"
INCLUDE "maps/MountMoonSquare.asm"
INCLUDE "maps/MountMoonGiftShop.asm"
INCLUDE "maps/TinTowerRoof.asm"


SECTION "bank1E",DATA,BANK[$1E]

;                          Map Scripts IX

INCLUDE "maps/Route34.asm"
INCLUDE "maps/ElmsLab.asm"
INCLUDE "maps/KrissHouse1F.asm"
INCLUDE "maps/KrissHouse2F.asm"
INCLUDE "maps/KrissNeighborsHouse.asm"
INCLUDE "maps/ElmsHouse.asm"
INCLUDE "maps/Route26HealSpeechHouse.asm"
INCLUDE "maps/Route26DayofWeekSiblingsHouse.asm"
INCLUDE "maps/Route27SandstormHouse.asm"
INCLUDE "maps/Route2946Gate.asm"


SECTION "bank1F",DATA,BANK[$1F]

;                          Map Scripts X

INCLUDE "maps/Route22.asm"
INCLUDE "maps/WarehouseEntrance.asm"
INCLUDE "maps/UndergroundPathSwitchRoomEntrances.asm"
INCLUDE "maps/GoldenrodDeptStoreB1F.asm"
INCLUDE "maps/UndergroundWarehouse.asm"
INCLUDE "maps/MountMortar1FOutside.asm"
INCLUDE "maps/MountMortar1FInside.asm"
INCLUDE "maps/MountMortar2FInside.asm"
INCLUDE "maps/MountMortarB1F.asm"
INCLUDE "maps/IcePath1F.asm"
INCLUDE "maps/IcePathB1F.asm"
INCLUDE "maps/IcePathB2FMahoganySide.asm"
INCLUDE "maps/IcePathB2FBlackthornSide.asm"
INCLUDE "maps/IcePathB3F.asm"
INCLUDE "maps/LavenderPokeCenter1F.asm"
INCLUDE "maps/LavenderPokeCenter2FBeta.asm"
INCLUDE "maps/MrFujisHouse.asm"
INCLUDE "maps/LavenderTownSpeechHouse.asm"
INCLUDE "maps/LavenderNameRater.asm"
INCLUDE "maps/LavenderMart.asm"
INCLUDE "maps/SoulHouse.asm"
INCLUDE "maps/LavRadioTower1F.asm"
INCLUDE "maps/Route8SaffronGate.asm"
INCLUDE "maps/Route12SuperRodHouse.asm"


SECTION "bank20",DATA,BANK[$20]

INCBIN "baserom.gbc", $80000, $80430-$80000

GetFlag2: ; 80430
; Do action b on flag de from BitTable2
;
;   b = 0: reset flag
;     = 1: set flag
;     > 1: check flag, result in c
;
; Setting/resetting does not return a result.


; 16-bit flag ids are considered invalid, but it's nice
; to know that the infrastructure is there.

	ld a, d
	cp 0
	jr z, .ceiling
	jr c, .read ; cp 0 can't set carry!
	jr .invalid
	
; There are only $a2 flags in BitTable2, so anything beyond that
; is invalid too.
	
.ceiling
	ld a, e
	cp $a2
	jr c, .read
	
; Invalid flags are treated as flag $00.
	
.invalid
	xor a
	ld e, a
	ld d, a
	
; Read BitTable2 for this flag's location.
	
.read
	ld hl, BitTable2
; location
	add hl, de
	add hl, de
; bit
	add hl, de
	
; location
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
; bit
	ld c, [hl]
	
; What are we doing with this flag?
	
	ld a, b
	cp 1
	jr c, .reset ; b = 0
	jr z, .set   ; b = 1
	
; Return the given flag in c.
.check
	ld a, [de]
	and c
	ld c, a
	ret
	
; Set the given flag.
.set
	ld a, [de]
	or c
	ld [de], a
	ret
	
; Reset the given flag.
.reset
	ld a, c
	cpl ; AND all bits except the one in question
	ld c, a
	ld a, [de]
	and c
	ld [de], a
	ret
; 80462


BitTable2: ; 80462
INCLUDE "bittable2.asm"
; 80648


INCBIN "baserom.gbc", $80648, $80730-$80648

BattleText_0x80730: ; 0x80730
	db $0, $52, " picked up", $4f
	db "¥@"
	deciram $c6ec, $36
	db $0, "!", $58
; 0x80746

WildPokemonAppearedText: ; 0x80746
	db $0, "Wild @"
	text_from_ram $c616
	db $0, $4f
	db "appeared!", $58
; 0x8075c

HookedPokemonAttackedText: ; 0x8075c
	db $0, "The hooked", $4f
	db "@"
	text_from_ram $c616
	db $0, $55
	db "attacked!", $58
; 0x80778

PokemonFellFromTreeText: ; 0x80778
	text_from_ram $c616
	db $0, " fell", $4f
	db "out of the tree!", $58
; 0x80793

WildPokemonAppearedText2: ; 0x80793
	db $0, "Wild @"
	text_from_ram $c616
	db $0, $4f
	db "appeared!", $58
; 0x807a9

WantsToBattleText: ; 0x807a9
	db $0, $3f, $4f
	db "wants to battle!", $58
; 0x807bd

BattleText_0x807bd: ; 0x807bd
	db $0, "Wild @"
	text_from_ram $c616
	db $0, $4f
	db "fled!", $58
; 0x807cf

BattleText_0x807cf: ; 0x807cf
	db $0, "Enemy @"
	text_from_ram $c616
	db $0, $4f
	db "fled!", $58
; 0x807e2

BattleText_0x807e2: ; 0x807e2
	db $0, $5a, $4f
	db "is hurt by poison!", $58
; 0x807f8

BattleText_0x807f8: ; 0x807f8
	db $0, $5a, "'s", $4f
	db "hurt by its burn!", $58
; 0x8080e

BattleText_0x8080e: ; 0x8080e
	db $0, "LEECH SEED saps", $4f
	db $5a, "!", $58
; 0x80822

BattleText_0x80822: ; 0x80822
	db $0, $5a, $4f
	db "has a NIGHTMARE!", $58
; 0x80836

BattleText_0x80836: ; 0x80836
	db $0, $5a, "'s", $4f
	db "hurt by the CURSE!", $58
; 0x8084d

BattleText_0x8084d: ; 0x8084d
	db $0, "The SANDSTORM hits", $4f
	db $5a, "!", $58
; 0x80864

BattleText_0x80864: ; 0x80864
	db $0, $5a, "'s", $4f
	db "PERISH count is @"
	deciram $d265, $11
	db $0, "!", $58
; 0x80880

BattleText_0x80880: ; 0x80880
	db $0, $59, $4f
	db "recovered with", $55
	db "@"
	text_from_ram StringBuffer1
	db $0, ".", $58
; 0x80899

BattleText_0x80899: ; 0x80899
	db $0, $5a, $4f
	db "recovered PP using", $55
	db "@"
	text_from_ram StringBuffer1
	db $0, ".", $58
; 0x808b6

BattleText_0x808b6: ; 0x808b6
	db $0, $59, $4f
	db "was hit by FUTURE", $55
	db "SIGHT!", $58
; 0x808d2

BattleText_0x808d2: ; 0x808d2
	db $0, $5a, "'s", $4f
	db "SAFEGUARD faded!", $58
; 0x808e7

BattleText_0x808e7: ; 0x808e7
	text_from_ram StringBuffer1
	db $0, " #MON's", $4f
	db "LIGHT SCREEN fell!", $58
; 0x80905

BattleText_0x80905: ; 0x80905
	text_from_ram StringBuffer1
	db $0, " #MON's", $4f
	db "REFLECT faded!", $58
; 0x8091f

BattleText_0x8091f: ; 0x8091f
	db $0, "Rain continues to", $4f
	db "fall.", $58
; 0x80938

BattleText_0x80938: ; 0x80938
	db $0, "The sunlight is", $4f
	db "strong.", $58
; 0x80951

BattleText_0x80951: ; 0x80951
	db $0, "The SANDSTORM", $4f
	db "rages.", $58
; 0x80967

BattleText_0x80967: ; 0x80967
	db $0, "The rain stopped.", $58
; 0x8097a

BattleText_0x8097a: ; 0x8097a
	db $0, "The sunlight", $4f
	db "faded.", $58
; 0x8098f

BattleText_0x8098f: ; 0x8098f
	db $0, "The SANDSTORM", $4f
	db "subsided.", $58
; 0x809a8

BattleText_0x809a8: ; 0x809a8
	db $0, "Enemy @"
	text_from_ram $c616
	db $0, $4f
	db "fainted!", $58
; 0x809be

BattleText_0x809be: ; 0x809be
	db $0, $52, " got ¥@"
	deciram $c686, $36
	db $0, $4f
	db "for winning!", $58
; 0x809da

BattleText_0x809da: ; 0x809da
	db $0, $3f, $4f
	db "was defeated!", $58
; 0x809eb

BattleText_0x809eb: ; 0x809eb
	db $0, "Tied against", $4f
	db $3f, "!", $58
; 0x809fc

BattleText_0x809fc: ; 0x809fc
	db $0, $52, " got ¥@"
	deciram $c686, $36
	db $0, $4f
	db "for winning!", $55
	db "Sent some to MOM!", $58
; 0x80a2a

BattleText_0x80a2a: ; 0x80a2a
	db $0, "Sent half to MOM!", $58
; 0x80a3d

BattleText_0x80a3d: ; 0x80a3d
	db $0, "Sent all to MOM!", $58
; 0x80a4f

BattleText_0x80a4f: ; 0x80a4f
	db $0, $53, ": Huh? I", $4f
	db "should've chosen", $55
	db "your #MON!", $58
; 0x80a75

BattleText_0x80a75: ; 0x80a75
	text_from_ram $c621
	db $0, $4f
	db "fainted!", $58
; 0x80a83

BattleText_0x80a83: ; 0x80a83
	db $0, "Use next #MON?", $57
; 0x80a93

BattleText_0x80a93: ; 0x80a93
	db $0, $53, ": Yes!", $4f
	db "I guess I chose a", $55
	db "good #MON!", $58
; 0x80ab9

BattleText_0x80ab9: ; 0x80ab9
	db $0, "Lost against", $4f
	db $3f, "!", $58
; 0x80aca

BattleText_0x80aca: ; 0x80aca
	db $0, $3f, $4f
	db "is about to use", $55
	db "@"
	text_from_ram $c616
	db $0, ".", $51
	db "Will ", $52, $4f
	db "change #MON?", $57
; 0x80af8

BattleText_0x80af8: ; 0x80af8
	db $0, $3f, $4f
	db "sent out", $55
	db "@"
	text_from_ram $c616
	db $0, "!", $57
; 0x80b0b

BattleText_0x80b0b: ; 0x80b0b
	db $0, "There's no will to", $4f
	db "battle!", $58
; 0x80b26

BattleText_0x80b26: ; 0x80b26
	db $0, "An EGG can't", $4f
	db "battle!", $58
; 0x80b3b

BattleText_0x80b3b: ; 0x80b3b
	db $0, "Can't escape!", $58
; 0x80b49

BattleText_0x80b49: ; 0x80b49
	db $0, "No! There's no", $4f
	db "running from a", $55
	db "trainer battle!", $58
; 0x80b77

BattleText_0x80b77: ; 0x80b77
	db $0, "Got away safely!", $58
; 0x80b89

BattleText_0x80b89: ; 0x80b89
	db $0, $5a, $4f
	db "fled using a", $55
	db "@"
	text_from_ram StringBuffer1
	db $0, "!", $58
; 0x80ba0

BattleText_0x80ba0: ; 0x80ba0
	db $0, "Can't escape!", $58
; 0x80bae

BattleText_0x80bae: ; 0x80bae
	db $0, $5a, "'s", $4f
	db "hurt by SPIKES!", $58
; 0x80bc2

RecoveredUsingText: ; 0x80bc2
	db $0, $59, $4f
	db "recovered using a", $55
	db "@"
	text_from_ram StringBuffer1
	db $0, "!", $58
; 0x80bde

BattleText_0x80bde: ; 0x80bde
	db $0, $5a, "'s", $4f
	db "@"
	text_from_ram StringBuffer1
	db $0, $55
	db "activated!", $58
; 0x80bf3

BattleText_0x80bf3: ; 0x80bf3
	db $0, "Items can't be", $4f
	db "used here.", $58
; 0x80c0d

BattleText_0x80c0d: ; 0x80c0d
	text_from_ram $c621
	db $0, $4f
	db "is already out.", $58
; 0x80c22

BattleText_0x80c22: ; 0x80c22
	text_from_ram $c621
	db $0, $4f
	db "can't be recalled!", $58
; 0x80c39

BattleText_0x80c39: ; 0x80c39
	db $0, "There's no PP left", $4f
	db "for this move!", $58
; 0x80c5b

BattleText_0x80c5b: ; 0x80c5b
	db $0, "The move is", $4f
	db "DISABLED!", $58
; 0x80c72

BattleText_0x80c72: ; 0x80c72
	text_from_ram $c621
	db $0, $4f
	db "has no moves left!", $57
; 0x80c8a

BattleText_0x80c8a: ; 0x80c8a
	db $0, $59, "'s", $4f
	db "ENCORE ended!", $58
; 0x80c9c

BattleText_0x80c9c: ; 0x80c9c
	text_from_ram StringBuffer1
	db $0, " grew to", $4f
	db "level @"
	deciram $d143, $13
	db $0, "!@"
	sound0
	db $50
; 0x80cb9

BattleText_0x80cb9: ; 0x80cb9
	db $50
; 0x80cba

BattleText_0x80cba: ; 0x80cba
	db $0, "Wild @"
	text_from_ram $c616
	db $0, $4f
	db "is eating!", $58
; 0x80cd1

BattleText_0x80cd1: ; 0x80cd1
	db $0, "Wild @"
	text_from_ram $c616
	db $0, $4f
	db "is angry!", $58
; 0x80ce7

FastAsleepText: ; 0x80ce7
	db $0, $5a, $4f
	db "is fast asleep!", $58
; 0x80cfa

WokeUpText: ; 0x80cfa
	db $0, $5a, $4f
	db "woke up!", $58
; 0x80d06

FrozenSolidText: ; 0x80d06
	db $0, $5a, $4f
	db "is frozen solid!", $58
; 0x80d1a

FlinchedText: ; 0x80d1a
	db $0, $5a, $4f
	db "flinched!", $58
; 0x80d27

MustRechargeText: ; 0x80d27
	db $0, $5a, $4f
	db "must recharge!", $58
; 0x80d39

DisabledNoMoreText: ; 0x80d39
	db $0, $5a, "'s", $4f
	db "disabled no more!", $58
; 0x80d4f

IsConfusedText: ; 0x80d4f
	db $0, $5a, $4f
	db "is confused!", $58
; 0x80d5f

HurtItselfText: ; 0x80d5f
	db $0, "It hurt itself in", $4f
	db "its confusion!", $58
; 0x80d81

ConfusedNoMoreText: ; 0x80d81
	db $0, $5a, "'s", $4f
	db "confused no more!", $58
; 0x80d97

BecameConfusedText: ; 0x80d97
	db $0, $59, $4f
	db "became confused!", $58
; 0x80dab

BattleText_0x80dab: ; 0x80dab
	db $0, "A @"
	text_from_ram StringBuffer1
	db $0, " rid", $4f
	db $59, $55
	db "of its confusion.", $58
; 0x80dcc

AlreadyConfusedText: ; 0x80dcc
	db $0, $59, "'s", $4f
	db "already confused!", $58
; 0x80de2

BattleText_0x80de2: ; 0x80de2
	db $0, $5a, "'s", $4f
	db "hurt by", $55
	db "@"
	text_from_ram StringBuffer1
	db $0, "!", $58
; 0x80df5

BattleText_0x80df5: ; 0x80df5
	db $0, $5a, $4f
	db "was released from", $55
	db "@"
	text_from_ram StringBuffer1
	db $0, "!", $58
; 0x80e11

UsedBindText: ; 0x80e11
	db $0, $5a, $4f
	db "used BIND on", $55
	db $59, "!", $58
; 0x80e24

WhirlpoolTrapText: ; 0x80e24
	db $0, $59, $4f
	db "was trapped!", $58
; 0x80e34

FireSpinTrapText: ; 0x80e34
	db $0, $59, $4f
	db "was trapped!", $58
; 0x80e44

WrappedByText: ; 0x80e44
	db $0, $59, $4f
	db "was WRAPPED by", $55
	db $5a, "!", $58
; 0x80e59

ClampedByText: ; 0x80e59
	db $0, $59, $4f
	db "was CLAMPED by", $55
	db $5a, "!", $58
; 0x80e6e

StoringEnergyText: ; 0x80e6e
	db $0, $5a, $4f
	db "is storing energy!", $58
; 0x80e84

UnleashedEnergyText: ; 0x80e84
	db $0, $5a, $4f
	db "unleashed energy!", $58
; 0x80e99

HungOnText: ; 0x80e99
	db $0, $59, $4f
	db "hung on with", $55
	db "@"
	text_from_ram StringBuffer1
	db $0, "!", $58
; 0x80eb0

EnduredText: ; 0x80eb0
	db $0, $59, $4f
	db "ENDURED the hit!", $58
; 0x80ec4

InLoveWithText: ; 0x80ec4
	db $0, $5a, $4f
	db "is in love with", $55
	db $59, "!", $58
; 0x80eda

InfatuationText: ; 0x80eda
	db $0, $5a, "'s", $4f
	db "infatuation kept", $55
	db "it from attacking!", $58
; 0x80f02

DisabledMoveText: ; 0x80f02
	db $0, $5a, "'s", $4f
	db "@"
	text_from_ram StringBuffer1
	db $0, " is", $55
	db "DISABLED!", $58
; 0x80f19

LoafingAroundText: ; 0x80f19
	text_from_ram $c621
	db $0, " is", $4f
	db "loafing around.", $58
; 0x80f31

BeganToNapText: ; 0x80f31
	text_from_ram $c621
	db $0, " began", $4f
	db "to nap!", $58
; 0x80f44

WontObeyText: ; 0x80f44
	text_from_ram $c621
	db $0, " won't", $4f
	db "obey!", $58
; 0x80f54

TurnedAwayText: ; 0x80f54
	text_from_ram $c621
	db $0, " turned", $4f
	db "away!", $58
; 0x80f66

IgnoredOrdersText: ; 0x80f66
	text_from_ram $c621
	db $0, " ignored", $4f
	db "orders!", $58
; 0x80f7b

IgnoredSleepingText: ; 0x80f7b
	text_from_ram $c621
	db $0, " ignored", $4f
	db "orders…sleeping!", $58
; 0x80f99

NoPPLeftText: ; 0x80f99
	db $0, "But no PP is left", $4f
	db "for the move!", $58
; 0x80fba

HasNoPPLeftText: ; 0x80fba
	db $0, $5a, $4f
	db "has no PP left for", $55
	db "@"
	text_from_ram $d086
	db $0, "!", $58
; 0x80fd7

WentToSleepText: ; 0x80fd7
	db $0, $5a, $4f
	db "went to sleep!", $57
; 0x80fe9

RestedText: ; 0x80fe9
	db $0, $5a, $4f
	db "fell asleep and", $55
	db "became healthy!", $57
; 0x8100c

RegainedHealthText: ; 0x8100c
	db $0, $5a, $4f
	db "regained health!", $58
; 0x81020

AttackMissedText: ; 0x81020
	db $0, $5a, "'s", $4f
	db "attack missed!", $58
; 0x81033

AttackMissed2Text: ; 0x81033
	db $0, $5a, "'s", $4f
	db "attack missed!", $58
; 0x81046

CrashedText: ; 0x81046
	db $0, $5a, $4f
	db "kept going and", $55
	db "crashed!", $58
; 0x81061

UnaffectedText: ; 0x81061
	db $0, $59, "'s", $4f
	db "unaffected!", $58
; 0x81071

DoesntAffectText: ; 0x81071
	db $0, "It doesn't affect", $4f
	db $59, "!", $58
; 0x81086

CriticalHitText: ; 0x81086
	db $0, "A critical hit!", $58
; 0x81097

OneHitKOText: ; 0x81097
	db $0, "It's a one-hit KO!", $58
; 0x810aa

SuperEffectiveText: ; 0x810aa
	db $0, "It's super-", $4f
	db "effective!", $58
; 0x810c1

NotVeryEffectiveText: ; 0x810c1
	db $0, "It's not very", $4f
	db "effective…", $58
; 0x810da

TookDownWithItText: ; 0x810da
	db $0, $59, $4f
	db "took down with it,", $55
	db $5a, "!", $58
; 0x810f3

RageBuildingText: ; 0x810f3
	db $0, $5a, "'s", $4f
	db "RAGE is building!", $58
; 0x81109

GotAnEncoreText: ; 0x81109
	db $0, $59, $4f
	db "got an ENCORE!", $58
; 0x8111b

SharedPainText: ; 0x8111b
	db $0, "The battlers", $4f
	db "shared pain!", $58
; 0x81136

TookAimText: ; 0x81136
	db $0, $5a, $4f
	db "took aim!", $58
; 0x81143

SketchedText: ; 0x81143
	db $0, $5a, $4f
	db "SKETCHED", $55
	db "@"
	text_from_ram StringBuffer1
	db $0, "!", $58
; 0x81156

DestinyBondEffectText: ; 0x81156
	db $0, $5a, "'s", $4f
	db "trying to take its", $55
	db "opponent with it!", $58
; 0x8117f

SpiteEffectText: ; 0x8117f
	db $0, $59, "'s", $4f
	db "@"
	text_from_ram StringBuffer1
	db $0, " was", $55
	db "reduced by @"
	deciram $d265, $11
	db $0, "!", $58
; 0x811a0

BellChimedText: ; 0x811a0
	db $0, "A bell chimed!", $4f
	db $58
; 0x811b1

FellAsleepText: ; 0x811b1
	db $0, $59, $4f
	db "fell asleep!", $58
; 0x811c1

AlreadyAsleepText: ; 0x811c1
	db $0, $59, "'s", $4f
	db "already asleep!", $58
; 0x811d5

WasPoisonedText: ; 0x811d5
	db $0, $59, $4f
	db "was poisoned!", $58
; 0x811e6

BadlyPoisonedText: ; 0x811e6
	db $0, $59, "'s", $4f
	db "badly poisoned!", $58
; 0x811fa

AlreadyPoisonedText: ; 0x811fa
	db $0, $59, "'s", $4f
	db "already poisoned!", $58
; 0x81210

SuckedHealthText: ; 0x81210
	db $0, "Sucked health from", $4f
	db $59, "!", $58
; 0x81227

DreamEatenText: ; 0x81227
	db $0, $59, "'s", $4f
	db "dream was eaten!", $58
; 0x8123c

WasBurnedText: ; 0x8123c
	db $0, $59, $4f
	db "was burned!", $58
; 0x8124b

DefrostedOpponentText: ; 0x8124b
	db $0, $59, $4f
	db "was defrosted!", $58
; 0x8125d

WasFrozenText: ; 0x8125d
	db $0, $59, $4f
	db "was frozen solid!", $58
; 0x81272

WontRiseAnymoreText: ; 0x81272
	db $0, $5a, "'s", $4f
	db "@"
	text_from_ram $d086
	db $0, " won't", $55
	db "rise anymore!", $58
; 0x8128f

WontDropAnymoreText: ; 0x8128f
	db $0, $59, "'s", $4f
	db "@"
	text_from_ram $d086
	db $0, " won't", $55
	db "drop anymore!", $58
; 0x812ac

FledFromBattleText: ; 0x812ac
	db $0, $5a, $4f
	db "fled from battle!", $58
; 0x812c1

FledInFearText: ; 0x812c1
	db $0, $59, $4f
	db "fled in fear!", $58
; 0x812d2

BlownAwayText: ; 0x812d2
	db $0, $59, $4f
	db "was blown away!", $58
; 0x812e5

PlayerHitTimesText: ; 0x812e5
	db $0, "Hit @"
	deciram $c682, $11
	db $0, " times!", $58
; 0x812f8

EnemyHitTimesText: ; 0x812f8
	db $0, "Hit @"
	deciram $c684, $11
	db $0, " times!", $58
; 0x8130b

MistText: ; 0x8130b
	db $0, $5a, "'s", $4f
	db "shrouded in MIST!", $58
; 0x81321

ProtectedByMistText: ; 0x81321
	db $0, $59, "'s", $4f
	db "protected by MIST.", $58
; 0x81338

GettingPumpedText: ; 0x81338
	interpret_data
	db $0, $5a, "'s", $4f
	db "getting pumped!", $58
; 0x8134d

RecoilText: ; 0x8134d
	db $0, $5a, "'s", $4f
	db "hit with recoil!", $58
; 0x81362

MadeSubstituteText: ; 0x81362
	db $0, $5a, $4f
	db "made a SUBSTITUTE!", $58
; 0x81378

HasSubstituteText: ; 0x81378
	db $0, $5a, $4f
	db "has a SUBSTITUTE!", $58
; 0x8138d

TooWeakSubText: ; 0x8138d
	db $0, "Too weak to make", $4f
	db "a SUBSTITUTE!", $58
; 0x813ad

SubTookDamageText: ; 0x813ad
	db $0, "The SUBSTITUTE", $4f
	db "took damage for", $55
	db $59, "!", $58
; 0x813d0

SubFadedText: ; 0x813d0
	db $0, $59, "'s", $4f
	db "SUBSTITUTE faded!", $58
; 0x813e6

LearnedMoveText: ; 0x813e6
	db $0, $5a, $4f
	db "learned", $55
	db "@"
	text_from_ram StringBuffer1
	db $0, "!", $58
; 0x813f8

WasSeededText: ; 0x813f8
	db $0, $59, $4f
	db "was seeded!", $58
; 0x81407

EvadedText: ; 0x81407
	db $0, $59, $4f
	db "evaded the attack!", $58
; 0x8141d

WasDisabledText: ; 0x8141d
	db $0, $59, "'s", $4f
	db "@"
	text_from_ram StringBuffer1
	db $0, " was", $55
	db "DISABLED!", $58
; 0x81435

CoinsScatteredText: ; 0x81435
	db $0, "Coins scattered", $4f
	db "everywhere!", $58
; 0x81452

TransformedTypeText: ; 0x81452
	db $0, $5a, $4f
	db "transformed into", $55
	db "the @"
	text_from_ram StringBuffer1
	db $0, "-type!", $58
; 0x81476

EliminatedStatsText: ; 0x81476
	db $0, "All stat changes", $4f
	db "were eliminated!", $58
; 0x81499

TransformedText: ; 0x81499
	db $0, $5a, $4f
	db "TRANSFORMED into", $55
	db "@"
	text_from_ram StringBuffer1
	db $0, "!", $58
; 0x814b4

LightScreenEffectText: ; 0x814b4
	db $0, $5a, "'s", $4f
	db "SPCL.DEF rose!", $58
; 0x814c7

ReflectEffectText: ; 0x814c7
	db $0, $5a, "'s", $4f
	db "DEFENSE rose!", $58
; 0x814d9

NothingHappenedText: ; 0x814d9
	db $0, "But nothing", $4f
	db "happened.", $58
; 0x814f0

ButItFailedText: ; 0x814f0
	db $0, "But it failed!", $58
; 0x81500

ItFailedText: ; 0x81500
	db $0, "It failed!", $58
; 0x8150c

DidntAffect1Text: ; 0x8150c
	db $0, "It didn't affect", $4f
	db $59, "!", $58
; 0x81520

DidntAffect2Text: ; 0x81520
	db $0, "It didn't affect", $4f
	db $59, "!", $58
; 0x81534

HPIsFullText: ; 0x81534
	db $0, $5a, "'s", $4f
	db "HP is full!", $58
; 0x81544

DraggedOutText: ; 0x81544
	db $0, $5a, $4f
	db "was dragged out!", $58
; 0x81558

ParalyzedText: ; 0x81558
	db $0, $59, "'s", $4f
	db "paralyzed! Maybe", $55
	db "it can't attack!", $58
; 0x8157d

FullyParalyzedText: ; 0x8157d
	db $0, $5a, "'s", $4f
	db "fully paralyzed!", $58
; 0x81592

AlreadyParalyzedText: ; 0x81592
	db $0, $59, "'s", $4f
	db "already paralyzed!", $58
; 0x815a9

ProtectedByText: ; 0x815a9
	db $0, $59, "'s", $4f
	db "protected by", $55
	db "@"
	text_from_ram StringBuffer1
	db $0, "!", $58
; 0x815c1

MirrorMoveFailedText: ; 0x815c1
	db $0, "The MIRROR MOVE", $4e, "failed!", $58
; 0x815da

StoleText: ; 0x815da
	db $0, $5a, $4f
	db "stole @"
	text_from_ram StringBuffer1
	db $0, $55
	db "from its foe!", $58
; 0x815f7

CantEscapeNowText: ; 0x815f7
	db $0, $59, $4f
	db "can't escape now!", $58
; 0x8160b

StartedNightmareText: ; 0x8160b
	db $0, $59, $4f
	db "started to have a", $55
	db "NIGHTMARE!", $58
; 0x8162b

WasDefrostedText: ; 0x8162b
	db $0, $5a, $4f
	db "was defrosted!", $58
; 0x8163d

PutACurseText: ; 0x8163d
	db $0, $5a, $4f
	db "cut its own HP and", $51
	db "put a CURSE on", $4f
	db $59, "!", $58
; 0x81665

ProtectedItselfText: ; 0x81665
	db $0, $5a, $4f
	db "PROTECTED itself!", $58
; 0x8167a

ProtectingItselfText: ; 0x8167a
	db $0, $59, "'s", $4f
	db "PROTECTING itself!", $57
; 0x81691

SpikesText: ; 0x81691
	db $0, "SPIKES scattered", $4f
	db "all around", $55
	db $59, "!", $58
; 0x816b1

IdentifiedText: ; 0x816b1
	db $0, $5a, $4f
	db "identified", $55
	db $59, "!", $58
; 0x816c2

StartPerishText: ; 0x816c2
	db $0, "Both #MON will", $4f
	db "faint in 3 turns!", $58
; 0x816e4

SandstormBrewedText: ; 0x816e4
	db $0, "A SANDSTORM", $4f
	db "brewed!", $58
; 0x816f9

BracedItselfText: ; 0x816f9
	db $0, $5a, $4f
	db "braced itself!", $58
; 0x8170b

FellInLoveText: ; 0x8170b
	db $0, $59, $4f
	db "fell in love!", $58
; 0x8171c

CoveredByVeilText: ; 0x8171c
	db $0, $5a, "'s", $4f
	db "covered by a veil!", $58
; 0x81733

SafeguardProtectText: ; 0x81733
	db $0, $59, $4f
	db "is protected by", $55
	db "SAFEGUARD!", $58
; 0x81751

MagnitudeText: ; 0x81751
	db $0, "Magnitude @"
	deciram $d265, $11
	db $0, "!", $58
; 0x81764

ReleasedByText: ; 0x81764
	db $0, $5a, $4f
	db "was released by", $55
	db $59, "!", $58
; 0x8177a

ShedLeechSeedText: ; 0x8177a
	db $0, $5a, $4f
	db "shed LEECH SEED!", $58
; 0x8178e

BlewSpikesText: ; 0x8178e
	db $0, $5a, $4f
	db "blew away SPIKES!", $58
; 0x817a3

DownpourText: ; 0x817a3
	db $0, "A downpour", $4f
	db "started!", $58
; 0x817b8

SunGotBrightText: ; 0x817b8
	db $0, "The sunlight got", $4f
	db "bright!", $58
; 0x817d2

BellyDrumText: ; 0x817d2
	db $0, $5a, $4f
	db "cut its HP and", $55
	db "maximized ATTACK!", $58
; 0x817f6

CopiedStatsText: ; 0x817f6
	db $0, $5a, $4f
	db "copied the stat", $51
	db "changes of", $4f
	db $59, "!", $58
; 0x81817

ForesawAttackText: ; 0x81817
	db $0, $5a, $4f
	db "foresaw an attack!", $58
; 0x8182d

BeatUpAttackText: ; 0x8182d
	text_from_ram StringBuffer1
	db $0, "'s", $4f
	db "attack!", $57
; 0x8183b

RefusedGiftText: ; 0x8183b
	db $0, $59, $4f
	db "refused the gift!", $58
; 0x81850

IgnoredOrders2Text: ; 0x81850
	db $0, $5a, $4f
	db "ignored orders!", $58
; 0x81863

BattleText_0x81863: ; 0x81863
	db $0, "Link error…", $51
	db "The battle has", $4f
	db "been canceled…", $58
; 0x8188e

BattleText_0x8188e: ; 0x8188e
	db $0, "There is no time", $4f
	db "left today!", $57
; 0x818ac

INCBIN "baserom.gbc", $818ac, $81fe3-$818ac

DebugColorTestGFX:
INCBIN "gfx/debug/color_test.2bpp"

INCBIN "baserom.gbc", $82153, $823c8-$82153


SECTION "bank21",DATA,BANK[$21]

INCBIN "baserom.gbc", $84000, $84a2e - $84000

FX00GFX:
FX01GFX: ; 84a2e
INCBIN "gfx/fx/001.lz"
; 84b15

INCBIN "baserom.gbc", $84b15, $84b1e - $84b15

FX02GFX: ; 84b1e
INCBIN "gfx/fx/002.lz"
; 84b7a

INCBIN "baserom.gbc", $84b7a, $84b7e - $84b7a

FX03GFX: ; 84b7e
INCBIN "gfx/fx/003.lz"
; 84bd0

INCBIN "baserom.gbc", $84bd0, $84bde - $84bd0

FX04GFX: ; 84bde
INCBIN "gfx/fx/004.lz"
; 84ca5

INCBIN "baserom.gbc", $84ca5, $84cae - $84ca5

FX05GFX: ; 84cae
INCBIN "gfx/fx/005.lz"
; 84de2

INCBIN "baserom.gbc", $84de2, $84dee - $84de2

FX07GFX: ; 84dee
INCBIN "gfx/fx/007.lz"
; 84e70

INCBIN "baserom.gbc", $84e70, $84e7e - $84e70

FX08GFX: ; 84e7e
INCBIN "gfx/fx/008.lz"
; 84ed4

INCBIN "baserom.gbc", $84ed4, $84ede - $84ed4

FX10GFX: ; 84ede
INCBIN "gfx/fx/010.lz"
; 84f13

INCBIN "baserom.gbc", $84f13, $84f1e - $84f13

FX09GFX: ; 84f1e
INCBIN "gfx/fx/009.lz"
; 85009

INCBIN "baserom.gbc", $85009, $8500e - $85009

FX12GFX: ; 8500e
INCBIN "gfx/fx/012.lz"
; 8506f

INCBIN "baserom.gbc", $8506f, $8507e - $8506f

FX06GFX: ; 8507e
INCBIN "gfx/fx/006.lz"
; 8515c

INCBIN "baserom.gbc", $8515c, $8515e - $8515c

FX11GFX: ; 8515e
INCBIN "gfx/fx/011.lz"
; 851ad

INCBIN "baserom.gbc", $851ad, $851ae - $851ad

FX13GFX: ; 851ae
INCBIN "gfx/fx/013.lz"
; 85243

INCBIN "baserom.gbc", $85243, $8524e - $85243

FX14GFX: ; 8524e
INCBIN "gfx/fx/014.lz"
; 852ff

INCBIN "baserom.gbc", $852ff, $8530e - $852ff

FX24GFX: ; 8530e
INCBIN "gfx/fx/024.lz"
; 8537c

INCBIN "baserom.gbc", $8537c, $8537e - $8537c

FX15GFX: ; 8537e
INCBIN "gfx/fx/015.lz"
; 8539a

INCBIN "baserom.gbc", $8539a, $8539e - $8539a

FX16GFX: ; 8539e
INCBIN "gfx/fx/016.lz"
; 8542d

INCBIN "baserom.gbc", $8542d, $8542e - $8542d

FX17GFX: ; 8542e
INCBIN "gfx/fx/017.lz"
; 85477

INCBIN "baserom.gbc", $85477, $8547e - $85477

FX18GFX: ; 8547e
INCBIN "gfx/fx/018.lz"
; 854eb

INCBIN "baserom.gbc", $854eb, $854ee - $854eb

FX19GFX: ; 854ee
INCBIN "gfx/fx/019.lz"
; 855a9

INCBIN "baserom.gbc", $855a9, $855ae - $855a9

FX20GFX: ; 855ae
INCBIN "gfx/fx/020.lz"
; 85627

INCBIN "baserom.gbc", $85627, $8562e - $85627

FX22GFX: ; 8562e
INCBIN "gfx/fx/022.lz"
; 856ec

INCBIN "baserom.gbc", $856ec, $856ee - $856ec

FX21GFX: ; 856ee
INCBIN "gfx/fx/021.lz"
; 85767

INCBIN "baserom.gbc", $85767, $8576e - $85767

FX23GFX: ; 8576e
INCBIN "gfx/fx/023.lz"
; 857d0

INCBIN "baserom.gbc", $857d0, $857de - $857d0

FX26GFX: ; 857de
INCBIN "gfx/fx/026.lz"
; 85838

INCBIN "baserom.gbc", $85838, $8583e - $85838

FX27GFX: ; 8583e
INCBIN "gfx/fx/027.lz"
; 858b0

INCBIN "baserom.gbc", $858b0, $858be - $858b0

FX28GFX: ; 858be
INCBIN "gfx/fx/028.lz"
; 85948

INCBIN "baserom.gbc", $85948, $8594e - $85948

FX29GFX: ; 8594e
INCBIN "gfx/fx/029.lz"
; 859a8

INCBIN "baserom.gbc", $859a8, $859ae - $859a8

FX30GFX: ; 859ae
INCBIN "gfx/fx/030.lz"
; 859ff

INCBIN "baserom.gbc", $859ff, $85a0e - $859ff

FX31GFX: ; 85a0e
INCBIN "gfx/fx/031.lz"
; 85ba1

INCBIN "baserom.gbc", $85ba1, $85bae - $85ba1

FX32GFX: ; 85bae
INCBIN "gfx/fx/032.lz"
; 85d09

INCBIN "baserom.gbc", $85d09, $85d0e - $85d09

FX33GFX: ; 85d0e
INCBIN "gfx/fx/033.lz"
; 85def

INCBIN "baserom.gbc", $85def, $85dfe - $85def

FX34GFX: ; 85dfe
INCBIN "gfx/fx/034.lz"
; 85e96

INCBIN "baserom.gbc", $85e96, $85e9e - $85e96

FX25GFX: ; 85e9e
INCBIN "gfx/fx/025.lz"
; 85fb8

INCBIN "baserom.gbc", $85fb8, $85fbe - $85fb8

FX35GFX: ; 85fbe
INCBIN "gfx/fx/035.lz"
; 86099

INCBIN "baserom.gbc", $86099, $8609e - $86099

FX36GFX: ; 8609e
INCBIN "gfx/fx/036.lz"
; 86174

INCBIN "baserom.gbc", $86174, $8617e - $86174

FX37GFX: ; 8617e
INCBIN "gfx/fx/037.lz"
; 862eb

INCBIN "baserom.gbc", $862eb, $862ee - $862eb

FX38GFX: ; 862ee
INCBIN "gfx/fx/038.lz"
; 8637f

INCBIN "baserom.gbc", $8637f, $8638e - $8637f

FX39GFX: ; 8638e
INCBIN "gfx/fx/039.lz"
; 8640b

INCBIN "baserom.gbc", $8640b, $8640e - $8640b

HallOfFame3: ; 0x8640e
	call $648e
	ld a, [$d84c]
	push af
	ld a, $1
	ld [$c2cd], a
	call $2ed3
	ld a, $1
	ld [$d4b5], a

	; Enable the Pokégear map to cycle through all of Kanto
	ld hl, $d84c
	set 6, [hl]

	ld a, $5
	ld hl, $4da0
	rst FarCall
	ld hl, $d95e
	ld a, [hl]
	cp $c8
	jr nc, .asm_86436 ; 0x86433 $1
	inc [hl]
.asm_86436
	ld a, $5
	ld hl, $4b85
	rst FarCall
	call $653f
	ld a, $5
	ld hl, $4b5f
	rst FarCall
	xor a
	ld [$c2cd], a
	call $64c3
	pop af
	ld b, a
	ld a, $42
	ld hl, $5847
	rst FarCall
	ret
; 0x86455

INCBIN "baserom.gbc", $86455, $88000 - $86455

SECTION "bank22",DATA,BANK[$22]

INCBIN "baserom.gbc", $88000, $8832c - $88000

GetPlayerIcon: ; 8832c
; Get the player icon corresponding to gender

; Male
	ld de, $4000 ; KrissMIcon
	ld b, $30 ; BANK(KrissMIcon)
	
	ld a, [PlayerGender]
	bit 0, a
	jr z, .done
	
; Female
	ld de, $7a40 ; KrissFIcon
	ld b, $31 ; BANK(KrissFIcon)
	
.done
	ret
; 8833e

INCBIN "baserom.gbc", $8833e, $896ff - $8833e

ClearScreenArea: ; 0x896ff
; clears an area of the screen
; INPUT:
; hl = address of upper left corner of the area
; b = height
; c = width
	ld a,  $7f    ; blank tile
	ld de, 20     ; screen width
.loop\@
	push bc
	push hl
.innerLoop\@
	ld [hli], a
	dec c
	jr nz, .innerLoop\@
	pop hl
	pop bc
	add hl, de
	dec b
	jr nz, .loop\@
	dec hl
	inc c
	inc c
.asm_89713
	ld a, $36
	ld [hli], a
	dec c
	ret z
	ld a, $18
	ld [hli], a
	dec c
	jr nz, .asm_89713 ; 0x8971c $f5
	ret
; 0x8971f

INCBIN "baserom.gbc", $8971f, $8addb - $8971f

SpecialHoOhChamber: ; 0x8addb
	ld hl, PartySpecies
	ld a, [hl]
	cp HO_OH ; is Ho-oh the first Pokémon in the party?
	jr nz, .done ; if not, we're done
	call GetSecondaryMapHeaderPointer
	ld de, $0326
	ld b, $1
	call BitTable1Func
.done
	ret
; 0x8adef

INCBIN "baserom.gbc", $8adef, $8b170 - $8adef

SpecialDratini: ; 0x8b170
; if ScriptVar is 0 or 1, change the moveset of the last Dratini in the party.
;  0: give it a special moveset with Extremespeed.
;  1: give it the normal moveset of a level 15 Dratini.

	ld a, [ScriptVar]
	cp $2
	ret nc
	ld bc, PartyCount
	ld a, [bc]
	ld hl, 0
	call GetNthPartyMon
	ld a, [bc]
	ld c, a
	ld de, PartyMon2 - PartyMon1
.CheckForDratini
; start at the end of the party and search backwards for a Dratini
	ld a, [hl]
	cp DRATINI
	jr z, .GiveMoveset
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	dec c
	jr nz, .CheckForDratini
	ret

.GiveMoveset
	push hl
	ld a, [ScriptVar]
	ld hl, .Movesets
	ld bc, .Moveset1 - .Moveset0
	call AddNTimes

	; get address of mon's first move
	pop de
	inc de
	inc de

.GiveMoves
	ld a, [hl]
	and a ; is the move 00?
	ret z ; if so, we're done here

	push hl
	push de
	ld [de], a ; give the Pokémon the new move

	; get the PP of the new move
	dec a
	ld hl, Moves + PlayerMovePP - PlayerMoveStruct
	ld bc, Move2 - Move1
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte

	; get the address of the move's PP and update the PP
	ld hl, PartyMon1PP - PartyMon1Moves
	add hl, de
	ld [hl], a

	pop de
	pop hl
	inc de
	inc hl
	jr .GiveMoves

.Movesets
.Moveset0
; Dratini does not normally learn Extremespeed. This is a special gift.
	db WRAP
	db THUNDER_WAVE
	db TWISTER
	db EXTREMESPEED
	db 0
.Moveset1
; This is the normal moveset of a level 15 Dratini
	db WRAP
	db LEER
	db THUNDER_WAVE
	db TWISTER
	db 0

GetNthPartyMon: ; 0x8b1ce
; inputs:
; hl must be set to 0 before calling this function.
; a must be set to the number of Pokémon in the party.

; outputs:
; returns the address of the last Pokémon in the party in hl.
; sets carry if a is 0.

	ld de, PartyMon1
	add hl, de
	and a
	jr z, .EmptyParty
	dec a
	ret z
	ld de, PartyMon2 - PartyMon1
.loop
	add hl, de
	dec a
	jr nz, .loop
	ret
.EmptyParty
	scf
	ret

INCBIN "baserom.gbc", $8b1e1, $8ba24-$8b1e1


SECTION "bank23",DATA,BANK[$23]

INCBIN "baserom.gbc", $8c000, $8c011 - $8c000

TimeOfDayPals: ; 8c011
; return carry if pals are changed

; forced pals?
	ld hl, $d846
	bit 7, [hl]
	jr nz, .dontchange
	
; do we need to bother updating?
	ld a, [TimeOfDay]
	ld hl, CurTimeOfDay
	cp [hl]
	jr z, .dontchange
	
; if so, the time of day has changed
	ld a, [TimeOfDay]
	ld [CurTimeOfDay], a
	
; get palette id
	call GetTimePalette
	
; same palette as before?
	ld hl, TimeOfDayPal
	cp [hl]
	jr z, .dontchange
	
; update palette id
	ld [TimeOfDayPal], a
	
	
; save bg palette 8
	ld hl, $d038 ; Unkn1Pals + 7 pals
	
; save wram bank
	ld a, [rSVBK]
	ld b, a
; wram bank 5
	ld a, 5
	ld [rSVBK], a
	
; push palette
	ld c, 4 ; NUM_PAL_COLORS
.push
	ld d, [hl]
	inc hl
	ld e, [hl]
	inc hl
	push de
	dec c
	jr nz, .push
	
; restore wram bank
	ld a, b
	ld [rSVBK], a
	
	
; update sgb pals
	ld b, $9
	call GetSGBLayout
	
	
; restore bg palette 8
	ld hl, $d03f ; last byte in Unkn1Pals
	
; save wram bank
	ld a, [rSVBK]
	ld d, a
; wram bank 5
	ld a, 5
	ld [rSVBK], a
	
; pop palette
	ld e, 4 ; NUM_PAL_COLORS
.pop
	pop bc
	ld [hl], c
	dec hl
	ld [hl], b
	dec hl
	dec e
	jr nz, .pop
	
; restore wram bank
	ld a, d
	ld [rSVBK], a
	
; update palettes
	call UpdateTimePals
	call DelayFrame
	
; successful change
	scf
	ret
	
.dontchange
; no change occurred
	and a
	ret
; 8c070


UpdateTimePals: ; 8c070
	ld c, $9 ; normal
	call GetTimePalFade
	call DmgToCgbTimePals
	ret
; 8c079

INCBIN "baserom.gbc", $8c079, $8c117 - $8c079

GetTimePalette: ; 8c117
; get time of day
	ld a, [TimeOfDay]
	ld e, a
	ld d, $0
; get fn ptr
	ld hl, .TimePalettes
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
; go
	jp [hl]
; 8c126

.TimePalettes
	dw .MorningPalette
	dw .DayPalette
	dw .NitePalette
	dw .DarknessPalette

.MorningPalette ; 8c12e
	ld a, [$d847]
	and %00000011 ; 0
	ret
; 8c134

.DayPalette ; 8c134
	ld a, [$d847]
	and %00001100 ; 1
	srl a
	srl a
	ret
; 8c13e

.NitePalette ; 8c13e
	ld a, [$d847]
	and %00110000 ; 2
	swap a
	ret
; 8c146

.DarknessPalette ; 8c146
	ld a, [$d847]
	and %11000000 ; 3
	rlca
	rlca
	ret
; 8c14e


DmgToCgbTimePals: ; 8c14e
	push hl
	push de
	ld a, [hli]
	call DmgToCgbBGPals
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	call DmgToCgbObjPals
	pop de
	pop hl
	ret
; 8c15e

INCBIN "baserom.gbc", $8c15e, $8c17c - $8c15e

GetTimePalFade: ; 8c17c
; check cgb
	ld a, [hCGB]
	and a
	jr nz, .cgb
	
; else: dmg

; index
	ld a, [TimeOfDayPal]
	and %11
	
; get fade table
	push bc
	ld c, a
	ld b, $0
	ld hl, .dmgfades
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop bc
	
; get place in fade table
	ld b, $0
	add hl, bc
	ret
	
.cgb
	ld hl, .cgbfade
	ld b, $0
	add hl, bc
	ret
; 8c19e

.dmgfades ; 8c19e
	dw .morn
	dw .day
	dw .nite
	dw .darkness
; 8c1a6

.morn ; 8c1a6
	db %11111111
	db %11111111
	db %11111111
	
	db %11111110
	db %11111110
	db %11111110
	
	db %11111001
	db %11100100
	db %11100100
	
	db %11100100
	db %11010000
	db %11010000
	
	db %10010000
	db %10000000
	db %10000000
	
	db %01000000
	db %01000000
	db %01000000
	
	db %00000000
	db %00000000
	db %00000000
; 8c1bb

.day ; 8c1bb
	db %11111111
	db %11111111
	db %11111111
	
	db %11111110
	db %11111110
	db %11111110
	
	db %11111001
	db %11100100
	db %11100100
	
	db %11100100
	db %11010000
	db %11010000
	
	db %10010000
	db %10000000
	db %10000000
	
	db %01000000
	db %01000000
	db %01000000
	
	db %00000000
	db %00000000
	db %00000000
; 8c1d0

.nite ; 8c1d0
	db %11111111
	db %11111111
	db %11111111
	
	db %11111110
	db %11111110
	db %11111110
	
	db %11111001
	db %11100100
	db %11100100
	
	db %11101001
	db %11010000
	db %11010000
	
	db %10010000
	db %10000000
	db %10000000
	
	db %01000000
	db %01000000
	db %01000000
	
	db %00000000
	db %00000000
	db %00000000
; 8c1e5

.darkness ; 8c1e5
	db %11111111
	db %11111111
	db %11111111
	
	db %11111110
	db %11111110
	db %11111111
	
	db %11111110
	db %11100100
	db %11111111
	
	db %11111101
	db %11010000
	db %11111111
	
	db %11111101
	db %10000000
	db %11111111
	
	db %00000000
	db %01000000
	db %00000000
	
	db %00000000
	db %00000000
	db %00000000
; 8c1fa

.cgbfade ; 8c1fa
	db %11111111
	db %11111111
	db %11111111
	
	db %11111110
	db %11111110
	db %11111110
	
	db %11111001
	db %11111001
	db %11111001
	
	db %11100100
	db %11100100
	db %11100100
	
	db %10010000
	db %10010000
	db %10010000
	
	db %01000000
	db %01000000
	db %01000000
	
	db %00000000
	db %00000000
	db %00000000
; 8c20f

INCBIN "baserom.gbc", $8c20f, $8e9ac - $8c20f

GetSpeciesIcon: ; 8e9ac
; Load species icon into VRAM at tile a
	push de
	ld a, [$d265]
	call ReadMonMenuIcon
	ld [CurIcon], a
	pop de
	ld a, e
	call GetIconGFX
	ret
; 8e9bc

INCBIN "baserom.gbc", $8e9bc, $8e9de - $8e9bc

GetIconGFX: ; 8e9de
	call GetIcon_a
	ld de, $80 ; 8 tiles
	add hl, de
	ld de, HeldItemIcons
	ld bc, $2302
	call GetGFXUnlessMobile
	ld a, [$c3b7]
	add 10
	ld [$c3b7], a
	ret
	
HeldItemIcons:
INCBIN "gfx/icon/mail.2bpp"
INCBIN "gfx/icon/item.2bpp"
; 8ea17

GetIcon_de: ; 8ea17
; Load icon graphics into VRAM starting from tile de
	ld l, e
	ld h, d
	jr GetIcon
	
GetIcon_a: ; 8ea1b
; Load icon graphics into VRAM starting from tile a
	ld l, a
	ld h, 0
	
GetIcon: ; 8ea1e
; Load icon graphics into VRAM starting from tile hl

; One tile is 16 bytes long
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	
	ld de, VTiles0
	add hl, de
	push hl
	
; Reading the icon pointer table would only make sense if they were
; scattered. However, the icons are contiguous and in-order.
	ld a, [CurIcon]
	push hl
	ld l, a
	ld h, 0
	add hl, hl
	ld de, IconPointers
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl
	
	ld bc, $2308
	call GetGFXUnlessMobile
	pop hl
	ret
; 8ea3f

GetGFXUnlessMobile: ; 8ea3f
	ld a, [InLinkBattle]
	cp 4 ; Mobile Link Battle
	jp nz, $eba
	jp $dc9
; 8ea4a

INCBIN "baserom.gbc", $8ea4a, $8eab3 - $8ea4a

ReadMonMenuIcon: ; 8eab3
	cp EGG
	jr z, .egg
	dec a
	ld hl, MonMenuIcons
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	ret
.egg
	ld a, ICON_EGG
	ret
; 8eac4

MonMenuIcons: ; 8eac4
	db ICON_BULBASAUR    ; BULBASAUR
	db ICON_BULBASAUR    ; IVYSAUR
	db ICON_BULBASAUR    ; VENUSAUR
	db ICON_CHARMANDER   ; CHARMANDER
	db ICON_CHARMANDER   ; CHARMELEON
	db ICON_BIGMON       ; CHARIZARD
	db ICON_SQUIRTLE     ; SQUIRTLE
	db ICON_SQUIRTLE     ; WARTORTLE
	db ICON_SQUIRTLE     ; BLASTOISE
	db ICON_CATERPILLAR  ; CATERPIE
	db ICON_CATERPILLAR  ; METAPOD
	db ICON_MOTH         ; BUTTERFREE
	db ICON_CATERPILLAR  ; WEEDLE
	db ICON_CATERPILLAR  ; KAKUNA
	db ICON_BUG          ; BEEDRILL
	db ICON_BIRD         ; PIDGEY
	db ICON_BIRD         ; PIDGEOTTO
	db ICON_BIRD         ; PIDGEOT
	db ICON_FOX          ; RATTATA
	db ICON_FOX          ; RATICATE
	db ICON_BIRD         ; SPEAROW
	db ICON_BIRD         ; FEAROW
	db ICON_SERPENT      ; EKANS
	db ICON_SERPENT      ; ARBOK
	db ICON_PIKACHU      ; PIKACHU
	db ICON_PIKACHU      ; RAICHU
	db ICON_MONSTER      ; SANDSHREW
	db ICON_MONSTER      ; SANDSLASH
	db ICON_FOX          ; NIDORAN_F
	db ICON_FOX          ; NIDORINA
	db ICON_MONSTER      ; NIDOQUEEN
	db ICON_FOX          ; NIDORAN_M
	db ICON_FOX          ; NIDORINO
	db ICON_MONSTER      ; NIDOKING
	db ICON_CLEFAIRY     ; CLEFAIRY
	db ICON_CLEFAIRY     ; CLEFABLE
	db ICON_FOX          ; VULPIX
	db ICON_FOX          ; NINETALES
	db ICON_JIGGLYPUFF   ; JIGGLYPUFF
	db ICON_JIGGLYPUFF   ; WIGGLYTUFF
	db ICON_BAT          ; ZUBAT
	db ICON_BAT          ; GOLBAT
	db ICON_ODDISH       ; ODDISH
	db ICON_ODDISH       ; GLOOM
	db ICON_ODDISH       ; VILEPLUME
	db ICON_BUG          ; PARAS
	db ICON_BUG          ; PARASECT
	db ICON_CATERPILLAR  ; VENONAT
	db ICON_MOTH         ; VENOMOTH
	db ICON_DIGLETT      ; DIGLETT
	db ICON_DIGLETT      ; DUGTRIO
	db ICON_FOX          ; MEOWTH
	db ICON_FOX          ; PERSIAN
	db ICON_MONSTER      ; PSYDUCK
	db ICON_MONSTER      ; GOLDUCK
	db ICON_FIGHTER      ; MANKEY
	db ICON_FIGHTER      ; PRIMEAPE
	db ICON_FOX          ; GROWLITHE
	db ICON_FOX          ; ARCANINE
	db ICON_POLIWAG      ; POLIWAG
	db ICON_POLIWAG      ; POLIWHIRL
	db ICON_POLIWAG      ; POLIWRATH
	db ICON_HUMANSHAPE   ; ABRA
	db ICON_HUMANSHAPE   ; KADABRA
	db ICON_HUMANSHAPE   ; ALAKAZAM
	db ICON_FIGHTER      ; MACHOP
	db ICON_FIGHTER      ; MACHOKE
	db ICON_FIGHTER      ; MACHAMP
	db ICON_ODDISH       ; BELLSPROUT
	db ICON_ODDISH       ; WEEPINBELL
	db ICON_ODDISH       ; VICTREEBEL
	db ICON_JELLYFISH    ; TENTACOOL
	db ICON_JELLYFISH    ; TENTACRUEL
	db ICON_GEODUDE      ; GEODUDE
	db ICON_GEODUDE      ; GRAVELER
	db ICON_GEODUDE      ; GOLEM
	db ICON_EQUINE       ; PONYTA
	db ICON_EQUINE       ; RAPIDASH
	db ICON_SLOWPOKE     ; SLOWPOKE
	db ICON_SLOWPOKE     ; SLOWBRO
	db ICON_VOLTORB      ; MAGNEMITE
	db ICON_VOLTORB      ; MAGNETON
	db ICON_BIRD         ; FARFETCH_D
	db ICON_BIRD         ; DODUO
	db ICON_BIRD         ; DODRIO
	db ICON_LAPRAS       ; SEEL
	db ICON_LAPRAS       ; DEWGONG
	db ICON_BLOB         ; GRIMER
	db ICON_BLOB         ; MUK
	db ICON_SHELL        ; SHELLDER
	db ICON_SHELL        ; CLOYSTER
	db ICON_GHOST        ; GASTLY
	db ICON_GHOST        ; HAUNTER
	db ICON_GHOST        ; GENGAR
	db ICON_SERPENT      ; ONIX
	db ICON_HUMANSHAPE   ; DROWZEE
	db ICON_HUMANSHAPE   ; HYPNO
	db ICON_SHELL        ; KRABBY
	db ICON_SHELL        ; KINGLER
	db ICON_VOLTORB      ; VOLTORB
	db ICON_VOLTORB      ; ELECTRODE
	db ICON_ODDISH       ; EXEGGCUTE
	db ICON_ODDISH       ; EXEGGUTOR
	db ICON_MONSTER      ; CUBONE
	db ICON_MONSTER      ; MAROWAK
	db ICON_FIGHTER      ; HITMONLEE
	db ICON_FIGHTER      ; HITMONCHAN
	db ICON_MONSTER      ; LICKITUNG
	db ICON_BLOB         ; KOFFING
	db ICON_BLOB         ; WEEZING
	db ICON_EQUINE       ; RHYHORN
	db ICON_MONSTER      ; RHYDON
	db ICON_CLEFAIRY     ; CHANSEY
	db ICON_ODDISH       ; TANGELA
	db ICON_MONSTER      ; KANGASKHAN
	db ICON_FISH         ; HORSEA
	db ICON_FISH         ; SEADRA
	db ICON_FISH         ; GOLDEEN
	db ICON_FISH         ; SEAKING
	db ICON_STARYU       ; STARYU
	db ICON_STARYU       ; STARMIE
	db ICON_HUMANSHAPE   ; MR__MIME
	db ICON_BUG          ; SCYTHER
	db ICON_HUMANSHAPE   ; JYNX
	db ICON_HUMANSHAPE   ; ELECTABUZZ
	db ICON_HUMANSHAPE   ; MAGMAR
	db ICON_BUG          ; PINSIR
	db ICON_EQUINE       ; TAUROS
	db ICON_FISH         ; MAGIKARP
	db ICON_GYARADOS     ; GYARADOS
	db ICON_LAPRAS       ; LAPRAS
	db ICON_BLOB         ; DITTO
	db ICON_FOX          ; EEVEE
	db ICON_FOX          ; VAPOREON
	db ICON_FOX          ; JOLTEON
	db ICON_FOX          ; FLAREON
	db ICON_VOLTORB      ; PORYGON
	db ICON_SHELL        ; OMANYTE
	db ICON_SHELL        ; OMASTAR
	db ICON_SHELL        ; KABUTO
	db ICON_SHELL        ; KABUTOPS
	db ICON_BIRD         ; AERODACTYL
	db ICON_SNORLAX      ; SNORLAX
	db ICON_BIRD         ; ARTICUNO
	db ICON_BIRD         ; ZAPDOS
	db ICON_BIRD         ; MOLTRES
	db ICON_SERPENT      ; DRATINI
	db ICON_SERPENT      ; DRAGONAIR
	db ICON_BIGMON       ; DRAGONITE
	db ICON_HUMANSHAPE   ; MEWTWO
	db ICON_HUMANSHAPE   ; MEW
	db ICON_ODDISH       ; CHIKORITA
	db ICON_ODDISH       ; BAYLEEF
	db ICON_ODDISH       ; MEGANIUM
	db ICON_FOX          ; CYNDAQUIL
	db ICON_FOX          ; QUILAVA
	db ICON_FOX          ; TYPHLOSION
	db ICON_MONSTER      ; TOTODILE
	db ICON_MONSTER      ; CROCONAW
	db ICON_MONSTER      ; FERALIGATR
	db ICON_FOX          ; SENTRET
	db ICON_FOX          ; FURRET
	db ICON_BIRD         ; HOOTHOOT
	db ICON_BIRD         ; NOCTOWL
	db ICON_BUG          ; LEDYBA
	db ICON_BUG          ; LEDIAN
	db ICON_BUG          ; SPINARAK
	db ICON_BUG          ; ARIADOS
	db ICON_BAT          ; CROBAT
	db ICON_FISH         ; CHINCHOU
	db ICON_FISH         ; LANTURN
	db ICON_PIKACHU      ; PICHU
	db ICON_CLEFAIRY     ; CLEFFA
	db ICON_JIGGLYPUFF   ; IGGLYBUFF
	db ICON_CLEFAIRY     ; TOGEPI
	db ICON_BIRD         ; TOGETIC
	db ICON_BIRD         ; NATU
	db ICON_BIRD         ; XATU
	db ICON_FOX          ; MAREEP
	db ICON_MONSTER      ; FLAAFFY
	db ICON_MONSTER      ; AMPHAROS
	db ICON_ODDISH       ; BELLOSSOM
	db ICON_JIGGLYPUFF   ; MARILL
	db ICON_JIGGLYPUFF   ; AZUMARILL
	db ICON_SUDOWOODO    ; SUDOWOODO
	db ICON_POLIWAG      ; POLITOED
	db ICON_ODDISH       ; HOPPIP
	db ICON_ODDISH       ; SKIPLOOM
	db ICON_ODDISH       ; JUMPLUFF
	db ICON_MONSTER      ; AIPOM
	db ICON_ODDISH       ; SUNKERN
	db ICON_ODDISH       ; SUNFLORA
	db ICON_BUG          ; YANMA
	db ICON_MONSTER      ; WOOPER
	db ICON_MONSTER      ; QUAGSIRE
	db ICON_FOX          ; ESPEON
	db ICON_FOX          ; UMBREON
	db ICON_BIRD         ; MURKROW
	db ICON_SLOWPOKE     ; SLOWKING
	db ICON_GHOST        ; MISDREAVUS
	db ICON_UNOWN        ; UNOWN
	db ICON_GHOST        ; WOBBUFFET
	db ICON_EQUINE       ; GIRAFARIG
	db ICON_BUG          ; PINECO
	db ICON_BUG          ; FORRETRESS
	db ICON_SERPENT      ; DUNSPARCE
	db ICON_BUG          ; GLIGAR
	db ICON_SERPENT      ; STEELIX
	db ICON_MONSTER      ; SNUBBULL
	db ICON_MONSTER      ; GRANBULL
	db ICON_FISH         ; QWILFISH
	db ICON_BUG          ; SCIZOR
	db ICON_BUG          ; SHUCKLE
	db ICON_BUG          ; HERACROSS
	db ICON_FOX          ; SNEASEL
	db ICON_MONSTER      ; TEDDIURSA
	db ICON_MONSTER      ; URSARING
	db ICON_BLOB         ; SLUGMA
	db ICON_BLOB         ; MAGCARGO
	db ICON_EQUINE       ; SWINUB
	db ICON_EQUINE       ; PILOSWINE
	db ICON_SHELL        ; CORSOLA
	db ICON_FISH         ; REMORAID
	db ICON_FISH         ; OCTILLERY
	db ICON_MONSTER      ; DELIBIRD
	db ICON_FISH         ; MANTINE
	db ICON_BIRD         ; SKARMORY
	db ICON_FOX          ; HOUNDOUR
	db ICON_FOX          ; HOUNDOOM
	db ICON_BIGMON       ; KINGDRA
	db ICON_EQUINE       ; PHANPY
	db ICON_EQUINE       ; DONPHAN
	db ICON_VOLTORB      ; PORYGON2
	db ICON_EQUINE       ; STANTLER
	db ICON_MONSTER      ; SMEARGLE
	db ICON_FIGHTER      ; TYROGUE
	db ICON_FIGHTER      ; HITMONTOP
	db ICON_HUMANSHAPE   ; SMOOCHUM
	db ICON_HUMANSHAPE   ; ELEKID
	db ICON_HUMANSHAPE   ; MAGBY
	db ICON_EQUINE       ; MILTANK
	db ICON_CLEFAIRY     ; BLISSEY
	db ICON_FOX          ; RAIKOU
	db ICON_FOX          ; ENTEI
	db ICON_FOX          ; SUICUNE
	db ICON_MONSTER      ; LARVITAR
	db ICON_MONSTER      ; PUPITAR
	db ICON_MONSTER      ; TYRANITAR
	db ICON_LUGIA        ; LUGIA
	db ICON_HO_OH        ; HO_OH
	db ICON_HUMANSHAPE   ; CELEBI

IconPointers:
	dw NullIcon
	dw PoliwagIcon
	dw JigglypuffIcon
	dw DiglettIcon
	dw PikachuIcon
	dw StaryuIcon
	dw FishIcon
	dw BirdIcon
	dw MonsterIcon
	dw ClefairyIcon
	dw OddishIcon
	dw BugIcon
	dw GhostIcon
	dw LaprasIcon
	dw HumanshapeIcon
	dw FoxIcon
	dw EquineIcon
	dw ShellIcon
	dw BlobIcon
	dw SerpentIcon
	dw VoltorbIcon
	dw SquirtleIcon
	dw BulbasaurIcon
	dw CharmanderIcon
	dw CaterpillarIcon
	dw UnownIcon
	dw GeodudeIcon
	dw FighterIcon
	dw EggIcon
	dw JellyfishIcon
	dw MothIcon
	dw BatIcon
	dw SnorlaxIcon
	dw HoOhIcon
	dw LugiaIcon
	dw GyaradosIcon
	dw SlowpokeIcon
	dw SudowoodoIcon
	dw BigmonIcon

NullIcon:
PoliwagIcon:      INCBIN "gfx/icon/poliwag.2bpp" ; 0x8ec0d
JigglypuffIcon:   INCBIN "gfx/icon/jigglypuff.2bpp" ; 0x8ec8d
DiglettIcon:      INCBIN "gfx/icon/diglett.2bpp" ; 0x8ed0d
PikachuIcon:      INCBIN "gfx/icon/pikachu.2bpp" ; 0x8ed8d
StaryuIcon:       INCBIN "gfx/icon/staryu.2bpp" ; 0x8ee0d
FishIcon:         INCBIN "gfx/icon/fish.2bpp" ; 0x8ee8d
BirdIcon:         INCBIN "gfx/icon/bird.2bpp" ; 0x8ef0d
MonsterIcon:      INCBIN "gfx/icon/monster.2bpp" ; 0x8ef8d
ClefairyIcon:     INCBIN "gfx/icon/clefairy.2bpp" ; 0x8f00d
OddishIcon:       INCBIN "gfx/icon/oddish.2bpp" ; 0x8f08d
BugIcon:          INCBIN "gfx/icon/bug.2bpp" ; 0x8f10d
GhostIcon:        INCBIN "gfx/icon/ghost.2bpp" ; 0x8f18d
LaprasIcon:       INCBIN "gfx/icon/lapras.2bpp" ; 0x8f20d
HumanshapeIcon:   INCBIN "gfx/icon/humanshape.2bpp" ; 0x8f28d
FoxIcon:          INCBIN "gfx/icon/fox.2bpp" ; 0x8f30d
EquineIcon:       INCBIN "gfx/icon/equine.2bpp" ; 0x8f38d
ShellIcon:        INCBIN "gfx/icon/shell.2bpp" ; 0x8f40d
BlobIcon:         INCBIN "gfx/icon/blob.2bpp" ; 0x8f48d
SerpentIcon:      INCBIN "gfx/icon/serpent.2bpp" ; 0x8f50d
VoltorbIcon:      INCBIN "gfx/icon/voltorb.2bpp" ; 0x8f58d
SquirtleIcon:     INCBIN "gfx/icon/squirtle.2bpp" ; 0x8f60d
BulbasaurIcon:    INCBIN "gfx/icon/bulbasaur.2bpp" ; 0x8f68d
CharmanderIcon:   INCBIN "gfx/icon/charmander.2bpp" ; 0x8f70d
CaterpillarIcon:  INCBIN "gfx/icon/caterpillar.2bpp" ; 0x8f78d
UnownIcon:        INCBIN "gfx/icon/unown.2bpp" ; 0x8f80d
GeodudeIcon:      INCBIN "gfx/icon/geodude.2bpp" ; 0x8f88d
FighterIcon:      INCBIN "gfx/icon/fighter.2bpp" ; 0x8f90d
EggIcon:          INCBIN "gfx/icon/egg.2bpp" ; 0x8f98d
JellyfishIcon:    INCBIN "gfx/icon/jellyfish.2bpp" ; 0x8fa0d
MothIcon:         INCBIN "gfx/icon/moth.2bpp" ; 0x8fa8d
BatIcon:          INCBIN "gfx/icon/bat.2bpp" ; 0x8fb0d
SnorlaxIcon:      INCBIN "gfx/icon/snorlax.2bpp" ; 0x8fb8d
HoOhIcon:        INCBIN "gfx/icon/ho_oh.2bpp" ; 0x8fc0d
LugiaIcon:        INCBIN "gfx/icon/lugia.2bpp" ; 0x8fc8d
GyaradosIcon:     INCBIN "gfx/icon/gyarados.2bpp" ; 0x8fd0d
SlowpokeIcon:     INCBIN "gfx/icon/slowpoke.2bpp" ; 0x8fd8d
SudowoodoIcon:    INCBIN "gfx/icon/sudowoodo.2bpp" ; 0x8fe0d
BigmonIcon:       INCBIN "gfx/icon/bigmon.2bpp" ; 0x8fe8d


SECTION "bank24",DATA,BANK[$24]

INCBIN "baserom.gbc", $90000, $909F2-$90000

dw Sunday
dw Monday
dw Tuesday
dw Wednesday
dw Thursday
dw Friday
dw Saturday
dw Sunday

Sunday:
	db " SUNDAY@"
Monday:
	db " MONDAY@"
Tuesday:
	db " TUESDAY@"
Wednesday:
	db "WEDNESDAY@"
Thursday:
	db "THURSDAY@"
Friday:
	db " FRIDAY@"
Saturday:
	db "SATURDAY@"


INCBIN "baserom.gbc", $90a3f, $914dd - $90a3f

PokegearSpritesGFX: ; 914dd
INCBIN "gfx/misc/pokegear_sprites.lz"
; 91508

INCBIN "baserom.gbc", $91508, $91bb5 - $91508

TownMapBubble: ; 91bb5
; Draw the bubble containing the location text in the town map HUD
	
; Top-left corner
	ld hl, TileMap + 1 ; (1,0)
	ld a, $30
	ld [hli], a
	
; Top row
	ld bc, 16
	ld a, " "
	call ByteFill
	
; Top-right corner
	ld a, $31
	ld [hl], a
	ld hl, TileMap + 1 + 20 ; (1,1)
	
	
; Middle row
	ld bc, 18
	ld a, " "
	call ByteFill
	
	
; Bottom-left corner
	ld hl, TileMap + 1 + 40 ; (1,2)
	ld a, $32
	ld [hli], a
	
; Bottom row
	ld bc, 16
	ld a, " "
	call ByteFill
	
; Bottom-right corner
	ld a, $33
	ld [hl], a
	
	
; Print "Where?"
	ld hl, TileMap + 2 ; (2,0)
	ld de, .Where
	call PlaceString
	
; Print the name of the default flypoint
	call .Name
	
; Up/down arrows
	ld hl, TileMap + 18 + 20 ; (18,1)
	ld [hl], $34	
	ret
	
.Where
	db "Where?@"

.Name
; We need the map location of the default flypoint
	ld a, [DefaultFlypoint]
	ld l, a
	ld h, 0
	add hl, hl ; two bytes per flypoint
	ld de, Flypoints
	add hl, de
	ld e, [hl]
	
	callba GetLandmarkName
	
	ld hl, TileMap + 2 + 20 ; (2,1)
	ld de, StringBuffer1
	call PlaceString
	ret
; 91c17

INCBIN "baserom.gbc", $91c17, $91c50 - $91c17

GetFlyPermission: ; 91c50
; Return flypoint c permission flag in a
	ld hl, FlypointPerms
	ld b, $2
	ld d, $0
	ld a, 3 ; PREDEF_GET_FLAG_NO
	call Predef
	ld a, c
	ret
; 91c5e

Flypoints: ; 91c5e
; location id, blackout id

; Johto
	db 01, 14 ; New Bark Town
	db 03, 15 ; Cherrygrove City
	db 06, 16 ; Violet City
	db 12, 18 ; Azalea Town
	db 16, 20 ; Goldenrod City
	db 22, 22 ; Ecruteak City
	db 27, 21 ; Olivine City
	db 33, 19 ; Cianwood City
	db 36, 23 ; Mahogany Town
	db 38, 24 ; Lake of Rage
	db 41, 25 ; Blackthorn City
	db 46, 26 ; Silver Cave
	
; Kanto
	db 47, 02 ; Pallet Town
	db 49, 03 ; Viridian City
	db 51, 04 ; Pewter City
	db 55, 05 ; Cerulean City
	db 61, 07 ; Vermilion City
	db 66, 06 ; Rock Tunnel
	db 69, 08 ; Lavender Town
	db 71, 10 ; Celadon City
	db 72, 09 ; Saffron City
	db 81, 11 ; Fuchsia City
	db 85, 12 ; Cinnabar Island
	db 90, 13 ; Indigo Plateau
	
; 91c8e

INCBIN "baserom.gbc", $91c8e, $91c90 - $91c8e

FlyMap: ; 91c90
	
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	call GetWorldMapLocation
	
; If we're not in a valid location, i.e. Pokecenter floor 2F,
; the backup map information is used
	
	cp 0
	jr nz, .CheckRegion
	
	ld a, [BackupMapGroup]
	ld b, a
	ld a, [BackupMapNumber]
	ld c, a
	call GetWorldMapLocation
	
.CheckRegion
; The first 46 locations are part of Johto. The rest are in Kanto
	cp 47
	jr nc, .KantoFlyMap
	
.JohtoFlyMap
; Note that .NoKanto should be modified in tandem with this branch
	
	push af
	
; Start from New Bark Town
	ld a, 0
	ld [DefaultFlypoint], a
	
; Flypoints begin at New Bark Town...
	ld [StartFlypoint], a
; ..and end at Silver Cave
	ld a, $b
	ld [EndFlypoint], a
	
; Fill out the map
	call FillJohtoMap
	call .MapHud
	pop af
	call TownMapPlayerIcon
	ret
	
.KantoFlyMap
	
; The event that there are no flypoints enabled in a map is not
; accounted for. As a result, if you attempt to select a flypoint
; when there are none enabled, the game will crash. Additionally,
; the flypoint selection has a default starting point that
; can be flown to even if none are enabled
	
; To prevent both of these things from happening when the player
; enters Kanto, fly access is restricted until Indigo Plateau is
; visited and its flypoint enabled
	
	push af
	ld c, $d ; Indigo Plateau
	call GetFlyPermission
	and a
	jr z, .NoKanto
	
; Kanto's map is only loaded if we've visited Indigo Plateau
	
; Flypoints begin at Pallet Town...
	ld a, $c
	ld [StartFlypoint], a
; ...and end at Indigo Plateau
	ld a, $17
	ld [EndFlypoint], a
	
; Because Indigo Plateau is the first flypoint the player
; visits, it's made the default flypoint
	ld [DefaultFlypoint], a
	
; Fill out the map
	call FillKantoMap
	call .MapHud
	pop af
	call TownMapPlayerIcon
	ret
	
.NoKanto
; If Indigo Plateau hasn't been visited, we use Johto's map instead
	
; Start from New Bark Town
	ld a, 0
	ld [DefaultFlypoint], a
	
; Flypoints begin at New Bark Town...
	ld [StartFlypoint], a
; ..and end at Silver Cave
	ld a, $b
	ld [EndFlypoint], a
	
	call FillJohtoMap
	
	pop af
	
.MapHud
	call TownMapBubble
	call TownMapPals
	
	ld hl, $9800 ; BG Map 0
	call TownMapBGUpdate
	
	call TownMapMon
	ld a, c
	ld [$d003], a
	ld a, b
	ld [$d004], a
	ret
; 91d11

INCBIN "baserom.gbc", $91d11, $91ee4 - $91d11

TownMapBGUpdate: ; 91ee4
; Update BG Map tiles and attributes

; BG Map address
	ld a, l
	ld [hBGMapAddress], a
	ld a, h
	ld [$ffd7], a
	
; Only update palettes on CGB
	ld a, [hCGB]
	and a
	jr z, .tiles
	
; BG Map mode 2 (palettes)
	ld a, 2
	ld [hBGMapMode], a
	
; The BG Map is updated in thirds, so we wait
; 3 frames to update the whole screen's palettes.
	ld c, 3
	call DelayFrames
	
.tiles
; Update BG Map tiles
	call WaitBGMap
	
; Turn off BG Map update
	xor a
	ld [hBGMapMode], a
	ret
; 91eff

FillJohtoMap: ; 91eff
	ld de, JohtoMap
	jr FillTownMap
	
FillKantoMap: ; 91f04
	ld de, KantoMap
	
FillTownMap: ; 91f07
	ld hl, TileMap
.loop
	ld a, [de]
	cp $ff
	ret z
	ld a, [de]
	ld [hli], a
	inc de
	jr .loop
; 91f13

TownMapPals: ; 91f13
; Assign palettes based on tile ids

	ld hl, TileMap
	ld de, AttrMap
	ld bc, 360
.loop
; Current tile
	ld a, [hli]
	push hl
	
; HP/borders use palette 0
	cp $60
	jr nc, .pal0
	
; The palette data is condensed to nybbles,
; least-significant first.
	ld hl, .Pals
	srl a
	jr c, .odd
	
; Even-numbered tile ids take the bottom nybble...
	add l
	ld l, a
	ld a, h
	adc 0
	ld h, a
	ld a, [hl]
	and %111
	jr .update
	
.odd
; ...and odd ids take the top.
	add l
	ld l, a
	ld a, h
	adc 0
	ld h, a
	ld a, [hl]
	swap a
	and %111
	jr .update
	
.pal0
	xor a
	
.update
	pop hl
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret

.Pals
	db $11, $21, $22, $00, $11, $13, $54, $54, $11, $21, $22, $00
	db $11, $10, $01, $00, $11, $21, $22, $00, $00, $00, $00, $00
	db $00, $00, $44, $04, $00, $00, $00, $00, $33, $33, $33, $33
	db $33, $33, $33, $03, $33, $33, $33, $33, $00, $00, $00, $00
; 91f7b

TownMapMon: ; 91f7b
; Draw the FlyMon icon at town map location in 

; Get FlyMon species
	ld a, [CurPartyMon]
	ld hl, PartySpecies
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	ld [$d265], a
	
; Get FlyMon icon
	ld e, 8 ; starting tile in VRAM
	callba GetSpeciesIcon
	
; Animation/palette
	ld de, $0000
	ld a, $0
	call $3b2a
	
	ld hl, 3
	add hl, bc
	ld [hl], 8
	ld hl, 2
	add hl, bc
	ld [hl], 0
	ret
; 91fa6

TownMapPlayerIcon: ; 91fa6
; Draw the player icon at town map location in a
	push af
	
	callba GetPlayerIcon
	
; Standing icon
	ld hl, $8100
	ld c, 4 ; # tiles
	call $eba
	
; Walking icon
	ld hl, $00c0
	add hl, de
	ld d, h
	ld e, l
	ld hl, $8140
	ld c, 4 ; # tiles
	ld a, $30
	call $eba
	
; Animation/palette
	ld de, $0000
	ld b, $0a ; Male
	ld a, [PlayerGender]
	bit 0, a
	jr z, .asm_91fd3
	ld b, $1e ; Female
	
.asm_91fd3
	ld a, b
	call $3b2a
	
	ld hl, $0003
	add hl, bc
	ld [hl], $10
	
	pop af
	ld e, a
	push bc
	callba GetLandmarkCoords
	pop bc
	
	ld hl, 4
	add hl, bc
	ld [hl], e
	ld hl, 5
	add hl, bc
	ld [hl], d
	ret
; 0x91ff2

INCBIN "baserom.gbc", $91ff2, $91fff - $91ff2

JohtoMap:
INCBIN "baserom.gbc", $91fff, $92168 - $91fff

KantoMap:
INCBIN "baserom.gbc", $92168, $922d1 - $92168


INCBIN "baserom.gbc", $922d1, $92402 - $922d1


INCLUDE "stats/wild/fish.asm"


INCBIN "baserom.gbc", $926c7, $93a31 - $926c7


SECTION "bank25",DATA,BANK[$25]

MapGroupPointers: ; 0x94000
; pointers to the first map header of each map group
	dw MapGroup0
	dw MapGroup1
	dw MapGroup2
	dw MapGroup3
	dw MapGroup4
	dw MapGroup5
	dw MapGroup6
	dw MapGroup7
	dw MapGroup8
	dw MapGroup9
	dw MapGroup10
	dw MapGroup11
	dw MapGroup12
	dw MapGroup13
	dw MapGroup14
	dw MapGroup15
	dw MapGroup16
	dw MapGroup17
	dw MapGroup18
	dw MapGroup19
	dw MapGroup20
	dw MapGroup21
	dw MapGroup22
	dw MapGroup23
	dw MapGroup24
	dw MapGroup25


INCLUDE "maps/map_headers.asm"

INCLUDE "maps/second_map_headers.asm"

INCBIN "baserom.gbc", $966b0, $96cb1 - $966b0

INCLUDE "scripting.asm"

INCBIN "baserom.gbc", $97c20, $35e

SECTION "bank26",DATA,BANK[$26]

;                          Map Scripts XI

INCLUDE "maps/EcruteakHouse.asm"
INCLUDE "maps/WiseTriosRoom.asm"
INCLUDE "maps/EcruteakPokeCenter1F.asm"
INCLUDE "maps/EcruteakLugiaSpeechHouse.asm"
INCLUDE "maps/DanceTheatre.asm"
INCLUDE "maps/EcruteakMart.asm"
INCLUDE "maps/EcruteakGym.asm"
INCLUDE "maps/EcruteakItemfinderHouse.asm"
INCLUDE "maps/ViridianGym.asm"
INCLUDE "maps/ViridianNicknameSpeechHouse.asm"
INCLUDE "maps/TrainerHouse1F.asm"
INCLUDE "maps/TrainerHouseB1F.asm"
INCLUDE "maps/ViridianMart.asm"
INCLUDE "maps/ViridianPokeCenter1F.asm"
INCLUDE "maps/ViridianPokeCenter2FBeta.asm"
INCLUDE "maps/Route2NuggetSpeechHouse.asm"
INCLUDE "maps/Route2Gate.asm"
INCLUDE "maps/VictoryRoadGate.asm"


SECTION "bank27",DATA,BANK[$27]

;                         Map Scripts XII

INCLUDE "maps/OlivinePokeCenter1F.asm"
INCLUDE "maps/OlivineGym.asm"
INCLUDE "maps/OlivineVoltorbHouse.asm"
INCLUDE "maps/OlivineHouseBeta.asm"
INCLUDE "maps/OlivinePunishmentSpeechHouse.asm"
INCLUDE "maps/OlivineGoodRodHouse.asm"
INCLUDE "maps/OlivineCafe.asm"
INCLUDE "maps/OlivineMart.asm"
INCLUDE "maps/Route38EcruteakGate.asm"
INCLUDE "maps/Route39Barn.asm"
INCLUDE "maps/Route39Farmhouse.asm"
INCLUDE "maps/ManiasHouse.asm"
INCLUDE "maps/CianwoodGym.asm"
INCLUDE "maps/CianwoodPokeCenter1F.asm"
INCLUDE "maps/CianwoodPharmacy.asm"
INCLUDE "maps/CianwoodCityPhotoStudio.asm"
INCLUDE "maps/CianwoodLugiaSpeechHouse.asm"
INCLUDE "maps/PokeSeersHouse.asm"
INCLUDE "maps/BattleTower1F.asm"
INCLUDE "maps/BattleTowerBattleRoom.asm"
INCLUDE "maps/BattleTowerElevator.asm"
INCLUDE "maps/BattleTowerHallway.asm"
INCLUDE "maps/Route40BattleTowerGate.asm"
INCLUDE "maps/BattleTowerOutside.asm"


SECTION "bank28",DATA,BANK[$28]

INCBIN "baserom.gbc", $a0000, $a1eca - $a0000


SECTION "bank29",DATA,BANK[$29]

INCBIN "baserom.gbc", $a4000, $a64ad - $a4000


SECTION "bank2A",DATA,BANK[$2A]

Route32_BlockData: ; 0xa8000
	INCBIN "maps/Route32.blk"
; 0xa81c2

Route40_BlockData: ; 0xa81c2
	INCBIN "maps/Route40.blk"
; 0xa8276

Route36_BlockData: ; 0xa8276
	INCBIN "maps/Route36.blk"
; 0xa8384

Route44_BlockData: ; 0xa8384
	INCBIN "maps/Route44.blk"
; 0xa8492

Route28_BlockData: ; 0xa8492
	INCBIN "maps/Route28.blk"
; 0xa8546

BetaHerosHouse_BlockData: ; 0xa8546
	INCBIN "maps/BetaHerosHouse.blk"
; 0xa8552

CeladonCity_BlockData: ; 0xa8552
	INCBIN "maps/CeladonCity.blk"
; 0xa86ba

SaffronCity_BlockData: ; 0xa86ba
	INCBIN "maps/SaffronCity.blk"
; 0xa8822

Route2_BlockData: ; 0xa8822
	INCBIN "maps/Route2.blk"
; 0xa8930

ElmsHouse_BlockData: ; 0xa8930
	INCBIN "maps/ElmsHouse.blk"
; 0xa8940

BetaSproutTower1_BlockData: ; 0xa8940
	INCBIN "maps/BetaSproutTower1.blk"
; 0xa899a

Route11_BlockData: ; 0xa899a
	INCBIN "maps/Route11.blk"
; 0xa8a4e

BetaSproutTower5_BlockData: ; 0xa8a4e
	INCBIN "maps/BetaSproutTower5.blk"
; 0xa8aa8

Route15_BlockData: ; 0xa8aa8
	INCBIN "maps/Route15.blk"
; 0xa8b5c

BetaSproutTower9_BlockData: ; 0xa8b5c
	INCBIN "maps/BetaSproutTower9.blk"
; 0xa8b80

Route19_BlockData: ; 0xa8b80
	INCBIN "maps/Route19.blk"
; 0xa8c34

BetaBlackthornCity_BlockData: ; 0xa8c34
	INCBIN "maps/BetaBlackthornCity.blk"
; 0xa8d9c

Route10South_BlockData: ; 0xa8d9c
	INCBIN "maps/Route10South.blk"
; 0xa8df6

CinnabarPokeCenter2FBeta_BlockData: ; 0xa8df6
	INCBIN "maps/CinnabarPokeCenter2FBeta.blk"
; 0xa8e16

Route41_BlockData: ; 0xa8e16
	INCBIN "maps/Route41.blk"
; 0xa90b9

Route33_BlockData: ; 0xa90b9
	INCBIN "maps/Route33.blk"
; 0xa9113

Route45_BlockData: ; 0xa9113
	INCBIN "maps/Route45.blk"
; 0xa92d5

Route29_BlockData: ; 0xa92d5
	INCBIN "maps/Route29.blk"
; 0xa93e3

Route37_BlockData: ; 0xa93e3
	INCBIN "maps/Route37.blk"
; 0xa943d

LavenderTown_BlockData: ; 0xa943d
	INCBIN "maps/LavenderTown.blk"
; 0xa9497

PalletTown_BlockData: ; 0xa9497
	INCBIN "maps/PalletTown.blk"
; 0xa94f1

Route25_BlockData: ; 0xa94f1
	INCBIN "maps/Route25.blk"
; 0xa95ff

Route24_BlockData: ; 0xa95ff
	INCBIN "maps/Route24.blk"
; 0xa9659

BetaVioletCity_BlockData: ; 0xa9659
	INCBIN "maps/BetaVioletCity.blk"
; 0xa97c1

Route3_BlockData: ; 0xa97c1
	INCBIN "maps/Route3.blk"
; 0xa98cf

PewterCity_BlockData: ; 0xa98cf
	INCBIN "maps/PewterCity.blk"
; 0xa9a37

BetaIlexForest_BlockData: ; 0xa9a37
	INCBIN "maps/BetaIlexForest.blk"
; 0xa9b9f

BetaSproutTower2_BlockData: ; 0xa9b9f
	INCBIN "maps/BetaSproutTower2.blk"
; 0xa9bf9

Route12_BlockData: ; 0xa9bf9
	INCBIN "maps/Route12.blk"
; 0xa9d07

BetaGoldenrodCity_BlockData: ; 0xa9d07
	INCBIN "maps/BetaGoldenrodCity.blk"
; 0xa9e6f

Route20_BlockData: ; 0xa9e6f
	INCBIN "maps/Route20.blk"
; 0xa9f7d

BetaSproutTower6_BlockData: ; 0xa9f7d
	INCBIN "maps/BetaSproutTower6.blk"
; 0xa9fd7

BetaPokecenterMainHouse_BlockData: ; 0xa9fd7
	INCBIN "maps/BetaPokecenterMainHouse.blk"
; 0xa9ff7

Route30_BlockData: ; 0xa9ff7
	INCBIN "maps/Route30.blk"
; 0xaa105

Route26_BlockData: ; 0xaa105
	INCBIN "maps/Route26.blk"
; 0xaa321

Route42_BlockData: ; 0xaa321
	INCBIN "maps/Route42.blk"
; 0xaa42f

Route34_BlockData: ; 0xaa42f
	INCBIN "maps/Route34.blk"
; 0xaa53d

Route46_BlockData: ; 0xaa53d
	INCBIN "maps/Route46.blk"
; 0xaa5f1

FuchsiaCity_BlockData: ; 0xaa5f1
	INCBIN "maps/FuchsiaCity.blk"
; 0xaa759

Route38_BlockData: ; 0xaa759
	INCBIN "maps/Route38.blk"
; 0xaa80d

BetaCianwoodCity_BlockData: ; 0xaa80d
	INCBIN "maps/BetaCianwoodCity.blk"
; 0xaa867

OlivineVoltorbHouse_BlockData: ; 0xaa867
	INCBIN "maps/OlivineVoltorbHouse.blk"
; 0xaa877

SafariZoneFuchsiaGateBeta_BlockData: ; 0xaa877
	INCBIN "maps/SafariZoneFuchsiaGateBeta.blk"
; 0xaa88b

BetaTeakCity_BlockData: ; 0xaa88b
	INCBIN "maps/BetaTeakCity.blk"
; 0xaa9f3

BetaCherrygroveCity_BlockData: ; 0xaa9f3
	INCBIN "maps/BetaCherrygroveCity.blk"
; 0xaaa4d

CinnabarIsland_BlockData: ; 0xaaa4d
	INCBIN "maps/CinnabarIsland.blk"
; 0xaaaa7

Route4_BlockData: ; 0xaaaa7
	INCBIN "maps/Route4.blk"
; 0xaab5b

Route8_BlockData: ; 0xaab5b
	INCBIN "maps/Route8.blk"
; 0xaac0f

BetaSproutTower3_BlockData: ; 0xaac0f
	INCBIN "maps/BetaSproutTower3.blk"
; 0xaac69

ViridianCity_BlockData: ; 0xaac69
	INCBIN "maps/ViridianCity.blk"
; 0xaadd1

Route13_BlockData: ; 0xaadd1
	INCBIN "maps/Route13.blk"
; 0xaaedf

Route21_BlockData: ; 0xaaedf
	INCBIN "maps/Route21.blk"
; 0xaaf93

BetaSproutTower7_BlockData: ; 0xaaf93
	INCBIN "maps/BetaSproutTower7.blk"
; 0xaafed

Route17_BlockData: ; 0xaafed
	INCBIN "maps/Route17.blk"
; 0xab1af

BetaMahoganyTown_BlockData: ; 0xab1af
	INCBIN "maps/BetaMahoganyTown.blk"
; 0xab209

Route31_BlockData: ; 0xab209
	INCBIN "maps/Route31.blk"
; 0xab2bd

Route27_BlockData: ; 0xab2bd
	INCBIN "maps/Route27.blk"
; 0xab425

Route35_BlockData: ; 0xab425
	INCBIN "maps/Route35.blk"
; 0xab4d9

Route43_BlockData: ; 0xab4d9
	INCBIN "maps/Route43.blk"
; 0xab5e7

Route39_BlockData: ; 0xab5e7
	INCBIN "maps/Route39.blk"
; 0xab69b

KrissHouse1F_BlockData: ; 0xab69b
	INCBIN "maps/KrissHouse1F.blk"
; 0xab6af

Route38EcruteakGate_BlockData: ; 0xab6af
	INCBIN "maps/Route38EcruteakGate.blk"
; 0xab6c3

BetaAzaleaTown_BlockData: ; 0xab6c3
	INCBIN "maps/BetaAzaleaTown.blk"
; 0xab82b

VermilionCity_BlockData: ; 0xab82b
	INCBIN "maps/VermilionCity.blk"
; 0xab993

BetaOlivineCity_BlockData: ; 0xab993
	INCBIN "maps/BetaOlivineCity.blk"
; 0xabafb

BetaNewBarkTown_BlockData: ; 0xabafb
	INCBIN "maps/BetaNewBarkTown.blk"
; 0xabb55

ElmsLab_BlockData: ; 0xabb55
	INCBIN "maps/ElmsLab.blk"
; 0xabb73

CeruleanCity_BlockData: ; 0xabb73
	INCBIN "maps/CeruleanCity.blk"
; 0xabcdb

Route1_BlockData: ; 0xabcdb
	INCBIN "maps/Route1.blk"
; 0xabd8f

Route5_BlockData: ; 0xabd8f
	INCBIN "maps/Route5.blk"
; 0xabde9

Route9_BlockData: ; 0xabde9
	INCBIN "maps/Route9.blk"
; 0xabef7

Route22_BlockData: ; 0xabef7
	INCBIN "maps/Route22.blk"
; 0xabfab


SECTION "bank2B",DATA,BANK[$2B]

Route14_BlockData: ; 0xac000
	INCBIN "maps/Route14.blk"
; 0xac0b4

BetaSproutTower8_BlockData: ; 0xac0b4
	INCBIN "maps/BetaSproutTower8.blk"
; 0xac10e

OlivineMart_BlockData: ; 0xac10e
	INCBIN "maps/OlivineMart.blk"
; 0xac126

Route10North_BlockData: ; 0xac126
	INCBIN "maps/Route10North.blk"
; 0xac180

BetaLakeOfRage_BlockData: ; 0xac180
	INCBIN "maps/BetaLakeOfRage.blk"
; 0xac2e8

OlivinePokeCenter1F_BlockData: ; 0xac2e8
	INCBIN "maps/OlivinePokeCenter1F.blk"
; 0xac2fc

BetaPewterMuseumOfScience1F_BlockData: ; 0xac2fc
	INCBIN "maps/BetaPewterMuseumOfScience1F.blk"
; 0xac324

BetaPewterMuseumOfScience2F_BlockData: ; 0xac324
	INCBIN "maps/BetaPewterMuseumOfScience2F.blk"
; 0xac340

EarlsPokemonAcademy_BlockData: ; 0xac340
	INCBIN "maps/EarlsPokemonAcademy.blk"
; 0xac360

BetaCinnabarIslandPokemonLabHallway_BlockData: ; 0xac360
	INCBIN "maps/BetaCinnabarIslandPokemonLabHallway.blk"
; 0xac384

BetaCinnabarIslandPokemonLabRoom1_BlockData: ; 0xac384
	INCBIN "maps/BetaCinnabarIslandPokemonLabRoom1.blk"
; 0xac394

BetaCinnabarIslandPokemonLabRoom2_BlockData: ; 0xac394
	INCBIN "maps/BetaCinnabarIslandPokemonLabRoom2.blk"
; 0xac3a4

BetaCinnabarIslandPokemonLabRoom3_BlockData: ; 0xac3a4
	INCBIN "maps/BetaCinnabarIslandPokemonLabRoom3.blk"
; 0xac3b4

GoldenrodDeptStore1F_BlockData: ; 0xac3b4
	INCBIN "maps/GoldenrodDeptStore1F.blk"
; 0xac3d4

GoldenrodDeptStore2F_BlockData: ; 0xac3d4
	INCBIN "maps/GoldenrodDeptStore2F.blk"
; 0xac3f4

GoldenrodDeptStore3F_BlockData: ; 0xac3f4
	INCBIN "maps/GoldenrodDeptStore3F.blk"
; 0xac414

GoldenrodDeptStore4F_BlockData: ; 0xac414
	INCBIN "maps/GoldenrodDeptStore4F.blk"
; 0xac434

GoldenrodDeptStore5F_BlockData: ; 0xac434
	INCBIN "maps/GoldenrodDeptStore5F.blk"
; 0xac454

GoldenrodDeptStore6F_BlockData: ; 0xac454
	INCBIN "maps/GoldenrodDeptStore6F.blk"
; 0xac474

GoldenrodDeptStoreElevator_BlockData: ; 0xac474
	INCBIN "maps/GoldenrodDeptStoreElevator.blk"
; 0xac478

CeladonMansion1F_BlockData: ; 0xac478
	INCBIN "maps/CeladonMansion1F.blk"
; 0xac48c

CeladonMansion2F_BlockData: ; 0xac48c
	INCBIN "maps/CeladonMansion2F.blk"
; 0xac4a0

CeladonMansion3F_BlockData: ; 0xac4a0
	INCBIN "maps/CeladonMansion3F.blk"
; 0xac4b4

CeladonMansionRoof_BlockData: ; 0xac4b4
	INCBIN "maps/CeladonMansionRoof.blk"
; 0xac4c8

BetaHouse_BlockData: ; 0xac4c8
	INCBIN "maps/BetaHouse.blk"
; 0xac4d8

CeladonGameCorner_BlockData: ; 0xac4d8
	INCBIN "maps/CeladonGameCorner.blk"
; 0xac51e

CeladonGameCornerPrizeRoom_BlockData: ; 0xac51e
	INCBIN "maps/CeladonGameCornerPrizeRoom.blk"
; 0xac527

Colosseum_BlockData: ; 0xac527
	INCBIN "maps/Colosseum.blk"
; 0xac53b

TradeCenter_BlockData: ; 0xac53b
	INCBIN "maps/TradeCenter.blk"
; 0xac54f

EcruteakLugiaSpeechHouse_BlockData: ; 0xac54f
	INCBIN "maps/EcruteakLugiaSpeechHouse.blk"
; 0xac55f

BetaCave_BlockData: ; 0xac55f
	INCBIN "maps/BetaCave.blk"
; 0xac5b9

UnionCaveB1F_BlockData: ; 0xac5b9
	INCBIN "maps/UnionCaveB1F.blk"
; 0xac66d

UnionCaveB2F_BlockData: ; 0xac66d
	INCBIN "maps/UnionCaveB2F.blk"
; 0xac721

UnionCave1F_BlockData: ; 0xac721
	INCBIN "maps/UnionCave1F.blk"
; 0xac7d5

NationalPark_BlockData: ; 0xac7d5
	INCBIN "maps/NationalPark.blk"
; 0xac9f1

Route6UndergroundEntrance_BlockData: ; 0xac9f1
	INCBIN "maps/Route6UndergroundEntrance.blk"
; 0xaca01

BetaPokecenterTradeStation_BlockData: ; 0xaca01
	INCBIN "maps/BetaPokecenterTradeStation.blk"
; 0xaca11

KurtsHouse_BlockData: ; 0xaca11
	INCBIN "maps/KurtsHouse.blk"
; 0xaca31

GoldenrodMagnetTrainStation_BlockData: ; 0xaca31
	INCBIN "maps/GoldenrodMagnetTrainStation.blk"
; 0xaca8b

RuinsofAlphOutside_BlockData: ; 0xaca8b
	INCBIN "maps/RuinsofAlphOutside.blk"
; 0xacb3f

BetaAlphRuinUnsolvedPuzzleRoom_BlockData: ; 0xacb3f
	INCBIN "maps/BetaAlphRuinUnsolvedPuzzleRoom.blk"
; 0xacb53

RuinsofAlphInnerChamber_BlockData: ; 0xacb53
	INCBIN "maps/RuinsofAlphInnerChamber.blk"
; 0xacbdf

RuinsofAlphHoOhChamber_BlockData: ; 0xacbdf
	INCBIN "maps/RuinsofAlphHoOhChamber.blk"
; 0xacbf3

SproutTower1F_BlockData: ; 0xacbf3
	INCBIN "maps/SproutTower1F.blk"
; 0xacc43

BetaSproutTowerCutOut1_BlockData: ; 0xacc43
	INCBIN "maps/BetaSproutTowerCutOut1.blk"
; 0xacc4d

SproutTower2F_BlockData: ; 0xacc4d
	INCBIN "maps/SproutTower2F.blk"
; 0xacc9d

BetaSproutTowerCutOut2_BlockData: ; 0xacc9d
	INCBIN "maps/BetaSproutTowerCutOut2.blk"
; 0xacca7

SproutTower3F_BlockData: ; 0xacca7
	INCBIN "maps/SproutTower3F.blk"
; 0xaccf7

BetaSproutTowerCutOut3_BlockData: ; 0xaccf7
	INCBIN "maps/BetaSproutTowerCutOut3.blk"
; 0xacd01

RadioTower1F_BlockData: ; 0xacd01
	INCBIN "maps/RadioTower1F.blk"
; 0xacd25

RadioTower2F_BlockData: ; 0xacd25
	INCBIN "maps/RadioTower2F.blk"
; 0xacd49

RadioTower3F_BlockData: ; 0xacd49
	INCBIN "maps/RadioTower3F.blk"
; 0xacd6d

RadioTower4F_BlockData: ; 0xacd6d
	INCBIN "maps/RadioTower4F.blk"
; 0xacd91

RadioTower5F_BlockData: ; 0xacd91
	INCBIN "maps/RadioTower5F.blk"
; 0xacdb5

NewBarkTown_BlockData: ; 0xacdb5
	INCBIN "maps/NewBarkTown.blk"
; 0xace0f

CherrygroveCity_BlockData: ; 0xace0f
	INCBIN "maps/CherrygroveCity.blk"
; 0xacec3

VioletCity_BlockData: ; 0xacec3
	INCBIN "maps/VioletCity.blk"
; 0xad02b

AzaleaTown_BlockData: ; 0xad02b
	INCBIN "maps/AzaleaTown.blk"
; 0xad0df

CianwoodCity_BlockData: ; 0xad0df
	INCBIN "maps/CianwoodCity.blk"
; 0xad274

GoldenrodCity_BlockData: ; 0xad274
	INCBIN "maps/GoldenrodCity.blk"
; 0xad3dc

OlivineCity_BlockData: ; 0xad3dc
	INCBIN "maps/OlivineCity.blk"
; 0xad544

EcruteakCity_BlockData: ; 0xad544
	INCBIN "maps/EcruteakCity.blk"
; 0xad6ac

MahoganyTown_BlockData: ; 0xad6ac
	INCBIN "maps/MahoganyTown.blk"
; 0xad706

LakeofRage_BlockData: ; 0xad706
	INCBIN "maps/LakeofRage.blk"
; 0xad86e

BlackthornCity_BlockData: ; 0xad86e
	INCBIN "maps/BlackthornCity.blk"
; 0xad9d6

SilverCaveOutside_BlockData: ; 0xad9d6
	INCBIN "maps/SilverCaveOutside.blk"
; 0xadb3e

Route6_BlockData: ; 0xadb3e
	INCBIN "maps/Route6.blk"
; 0xadb98

Route7_BlockData: ; 0xadb98
	INCBIN "maps/Route7.blk"
; 0xadbf2

Route16_BlockData: ; 0xadbf2
	INCBIN "maps/Route16.blk"
; 0xadc4c

Route18_BlockData: ; 0xadc4c
	INCBIN "maps/Route18.blk"
; 0xadca6

WarehouseEntrance_BlockData: ; 0xadca6
	INCBIN "maps/WarehouseEntrance.blk"
; 0xaddb4

UndergroundPathSwitchRoomEntrances_BlockData: ; 0xaddb4
	INCBIN "maps/UndergroundPathSwitchRoomEntrances.blk"
; 0xadec2

GoldenrodDeptStoreB1F_BlockData: ; 0xadec2
	INCBIN "maps/GoldenrodDeptStoreB1F.blk"
; 0xadf1c

UndergroundWarehouse_BlockData: ; 0xadf1c
	INCBIN "maps/UndergroundWarehouse.blk"
; 0xadf76

BetaElevator_BlockData: ; 0xadf76
	INCBIN "maps/BetaElevator.blk"
; 0xadf8f

TinTower1F_BlockData: ; 0xadf8f
	INCBIN "maps/TinTower1F.blk"
; 0xadfe9

TinTower2F_BlockData: ; 0xadfe9
	INCBIN "maps/TinTower2F.blk"
; 0xae043

TinTower3F_BlockData: ; 0xae043
	INCBIN "maps/TinTower3F.blk"
; 0xae09d

TinTower4F_BlockData: ; 0xae09d
	INCBIN "maps/TinTower4F.blk"
; 0xae0f7

TinTower5F_BlockData: ; 0xae0f7
	INCBIN "maps/TinTower5F.blk"
; 0xae151

TinTower6F_BlockData: ; 0xae151
	INCBIN "maps/TinTower6F.blk"
; 0xae1ab

TinTower7F_BlockData: ; 0xae1ab
	INCBIN "maps/TinTower7F.blk"
; 0xae205

TinTower8F_BlockData: ; 0xae205
	INCBIN "maps/TinTower8F.blk"
; 0xae25f

TinTower9F_BlockData: ; 0xae25f
	INCBIN "maps/TinTower9F.blk"
; 0xae2b9

TinTowerRoof_BlockData: ; 0xae2b9
	INCBIN "maps/TinTowerRoof.blk"
; 0xae313

BurnedTower1F_BlockData: ; 0xae313
	INCBIN "maps/BurnedTower1F.blk"
; 0xae36d

BurnedTowerB1F_BlockData: ; 0xae36d
	INCBIN "maps/BurnedTowerB1F.blk"
; 0xae3c7

BetaCaveTestMap_BlockData: ; 0xae3c7
	INCBIN "maps/BetaCaveTestMap.blk"
; 0xae4d5

MountMortar1FOutside_BlockData: ; 0xae4d5
	INCBIN "maps/MountMortar1FOutside.blk"
; 0xae63d

MountMortar1FInside_BlockData: ; 0xae63d
	INCBIN "maps/MountMortar1FInside.blk"
; 0xae859

MountMortar2FInside_BlockData: ; 0xae859
	INCBIN "maps/MountMortar2FInside.blk"
; 0xae9c1

MountMortarB1F_BlockData: ; 0xae9c1
	INCBIN "maps/MountMortarB1F.blk"
; 0xaeb29

IcePath1F_BlockData: ; 0xaeb29
	INCBIN "maps/IcePath1F.blk"
; 0xaec91

IcePathB1F_BlockData: ; 0xaec91
	INCBIN "maps/IcePathB1F.blk"
; 0xaed45

IcePathB2FMahoganySide_BlockData: ; 0xaed45
	INCBIN "maps/IcePathB2FMahoganySide.blk"
; 0xaed9f

IcePathB2FBlackthornSide_BlockData: ; 0xaed9f
	INCBIN "maps/IcePathB2FBlackthornSide.blk"
; 0xaedcc

IcePathB3F_BlockData: ; 0xaedcc
	INCBIN "maps/IcePathB3F.blk"
; 0xaee26

WhirlIslandNW_BlockData: ; 0xaee26
	INCBIN "maps/WhirlIslandNW.blk"
; 0xaee53

WhirlIslandNE_BlockData: ; 0xaee53
	INCBIN "maps/WhirlIslandNE.blk"
; 0xaeead

WhirlIslandSW_BlockData: ; 0xaeead
	INCBIN "maps/WhirlIslandSW.blk"
; 0xaef07

WhirlIslandCave_BlockData: ; 0xaef07
	INCBIN "maps/WhirlIslandCave.blk"
; 0xaef34

WhirlIslandSE_BlockData: ; 0xaef34
	INCBIN "maps/WhirlIslandSE.blk"
; 0xaef61

WhirlIslandB1F_BlockData: ; 0xaef61
	INCBIN "maps/WhirlIslandB1F.blk"
; 0xaf0c9

WhirlIslandB2F_BlockData: ; 0xaf0c9
	INCBIN "maps/WhirlIslandB2F.blk"
; 0xaf17d

WhirlIslandLugiaChamber_BlockData: ; 0xaf17d
	INCBIN "maps/WhirlIslandLugiaChamber.blk"
; 0xaf1d7

SilverCaveRoom1_BlockData: ; 0xaf1d7
	INCBIN "maps/SilverCaveRoom1.blk"
; 0xaf28b

SilverCaveRoom2_BlockData: ; 0xaf28b
	INCBIN "maps/SilverCaveRoom2.blk"
; 0xaf399

SilverCaveRoom3_BlockData: ; 0xaf399
	INCBIN "maps/SilverCaveRoom3.blk"
; 0xaf44d

BetaRocketHideout1_BlockData: ; 0xaf44d
	INCBIN "maps/BetaRocketHideout1.blk"
; 0xaf55b

BetaRocketHideout2_BlockData: ; 0xaf55b
	INCBIN "maps/BetaRocketHideout2.blk"
; 0xaf669

BetaEmptyHouse_BlockData: ; 0xaf669
	INCBIN "maps/BetaEmptyHouse.blk"
; 0xaf777

BetaRocketHideout3_BlockData: ; 0xaf777
	INCBIN "maps/BetaRocketHideout3.blk"
; 0xaf885

MahoganyMart1F_BlockData: ; 0xaf885
	INCBIN "maps/MahoganyMart1F.blk"
; 0xaf895

TeamRocketBaseB1F_BlockData: ; 0xaf895
	INCBIN "maps/TeamRocketBaseB1F.blk"
; 0xaf91c

TeamRocketBaseB2F_BlockData: ; 0xaf91c
	INCBIN "maps/TeamRocketBaseB2F.blk"
; 0xaf9a3

TeamRocketBaseB3F_BlockData: ; 0xaf9a3
	INCBIN "maps/TeamRocketBaseB3F.blk"
; 0xafa2a

BetaRoute23EarlyVersion_BlockData: ; 0xafa2a
	INCBIN "maps/BetaRoute23EarlyVersion.blk"
; 0xafa84

IndigoPlateauPokeCenter1F_BlockData: ; 0xafa84
	INCBIN "maps/IndigoPlateauPokeCenter1F.blk"
; 0xafac3

WillsRoom_BlockData: ; 0xafac3
	INCBIN "maps/WillsRoom.blk"
; 0xafaf0

KogasRoom_BlockData: ; 0xafaf0
	INCBIN "maps/KogasRoom.blk"
; 0xafb1d

BrunosRoom_BlockData: ; 0xafb1d
	INCBIN "maps/BrunosRoom.blk"
; 0xafb4a

KarensRoom_BlockData: ; 0xafb4a
	INCBIN "maps/KarensRoom.blk"
; 0xafb77

AzaleaGym_BlockData: ; 0xafb77
	INCBIN "maps/AzaleaGym.blk"
; 0xafb9f

VioletGym_BlockData: ; 0xafb9f
	INCBIN "maps/VioletGym.blk"
; 0xafbc7

GoldenrodGym_BlockData: ; 0xafbc7
	INCBIN "maps/GoldenrodGym.blk"
; 0xafc21

EcruteakGym_BlockData: ; 0xafc21
	INCBIN "maps/EcruteakGym.blk"
; 0xafc4e

MahoganyGym_BlockData: ; 0xafc4e
	INCBIN "maps/MahoganyGym.blk"
; 0xafc7b

OlivineGym_BlockData: ; 0xafc7b
	INCBIN "maps/OlivineGym.blk"
; 0xafca3

BetaUnknown_BlockData: ; 0xafca3
	INCBIN "maps/BetaUnknown.blk"
; 0xafcb7

CianwoodGym_BlockData: ; 0xafcb7
	INCBIN "maps/CianwoodGym.blk"
; 0xafce4

BlackthornGym1F_BlockData: ; 0xafce4
	INCBIN "maps/BlackthornGym1F.blk"
; 0xafd11

BlackthornGym2F_BlockData: ; 0xafd11
	INCBIN "maps/BlackthornGym2F.blk"
; 0xafd3e

OlivineLighthouse1F_BlockData: ; 0xafd3e
	INCBIN "maps/OlivineLighthouse1F.blk"
; 0xafd98

OlivineLighthouse2F_BlockData: ; 0xafd98
	INCBIN "maps/OlivineLighthouse2F.blk"
; 0xafdf2

OlivineLighthouse3F_BlockData: ; 0xafdf2
	INCBIN "maps/OlivineLighthouse3F.blk"
; 0xafe4c

OlivineLighthouse4F_BlockData: ; 0xafe4c
	INCBIN "maps/OlivineLighthouse4F.blk"
; 0xafea6

OlivineLighthouse5F_BlockData: ; 0xafea6
	INCBIN "maps/OlivineLighthouse5F.blk"
; 0xaff00

OlivineLighthouse6F_BlockData: ; 0xaff00
	INCBIN "maps/OlivineLighthouse6F.blk"
; 0xaff5a


SECTION "bank2C",DATA,BANK[$2C]

BetaCave2_BlockData: ; 0xb0000
	INCBIN "maps/BetaCave2.blk"
; 0xb0023

SlowpokeWellB1F_BlockData: ; 0xb0023
	INCBIN "maps/SlowpokeWellB1F.blk"
; 0xb007d

SlowpokeWellB2F_BlockData: ; 0xb007d
	INCBIN "maps/SlowpokeWellB2F.blk"
; 0xb00d7

IlexForest_BlockData: ; 0xb00d7
	INCBIN "maps/IlexForest.blk"
; 0xb026c

DarkCaveVioletEntrance_BlockData: ; 0xb026c
	INCBIN "maps/DarkCaveVioletEntrance.blk"
; 0xb03d4

DarkCaveBlackthornEntrance_BlockData: ; 0xb03d4
	INCBIN "maps/DarkCaveBlackthornEntrance.blk"
; 0xb04e2

RuinsofAlphResearchCenter_BlockData: ; 0xb04e2
	INCBIN "maps/RuinsofAlphResearchCenter.blk"
; 0xb04f2

GoldenrodBikeShop_BlockData: ; 0xb04f2
	INCBIN "maps/GoldenrodBikeShop.blk"
; 0xb0502

DanceTheatre_BlockData: ; 0xb0502
	INCBIN "maps/DanceTheatre.blk"
; 0xb052c

EcruteakHouse_BlockData: ; 0xb052c
	INCBIN "maps/EcruteakHouse.blk"
; 0xb0586

GoldenrodGameCorner_BlockData: ; 0xb0586
	INCBIN "maps/GoldenrodGameCorner.blk"
; 0xb05cc

Route35NationalParkgate_BlockData: ; 0xb05cc
	INCBIN "maps/Route35NationalParkgate.blk"
; 0xb05dc

Route36NationalParkgate_BlockData: ; 0xb05dc
	INCBIN "maps/Route36NationalParkgate.blk"
; 0xb05f0

FastShip1F_BlockData: ; 0xb05f0
	INCBIN "maps/FastShip1F.blk"
; 0xb0680

FastShipB1F_BlockData: ; 0xb0680
	INCBIN "maps/FastShipB1F.blk"
; 0xb0700

BetaSsAquaInsideCutOut_BlockData: ; 0xb0700
	INCBIN "maps/BetaSsAquaInsideCutOut.blk"
; 0xb0710

FastShipCabins_NNW_NNE_NE_BlockData: ; 0xb0710
	INCBIN "maps/FastShipCabins_NNW_NNE_NE.blk"
; 0xb0750

FastShipCabins_SW_SSW_NW_BlockData: ; 0xb0750
	INCBIN "maps/FastShipCabins_SW_SSW_NW.blk"
; 0xb0790

FastShipCabins_SE_SSE_CaptainsCabin_BlockData: ; 0xb0790
	INCBIN "maps/FastShipCabins_SE_SSE_CaptainsCabin.blk"
; 0xb07e5

OlivinePort_BlockData: ; 0xb07e5
	INCBIN "maps/OlivinePort.blk"
; 0xb0899

VermilionPort_BlockData: ; 0xb0899
	INCBIN "maps/VermilionPort.blk"
; 0xb094d

OlivineCafe_BlockData: ; 0xb094d
	INCBIN "maps/OlivineCafe.blk"
; 0xb095d

KrissHouse2F_BlockData: ; 0xb095d
	INCBIN "maps/KrissHouse2F.blk"
; 0xb0969

SaffronTrainStation_BlockData: ; 0xb0969
	INCBIN "maps/SaffronTrainStation.blk"
; 0xb09c3

CeruleanGym_BlockData: ; 0xb09c3
	INCBIN "maps/CeruleanGym.blk"
; 0xb09eb

VermilionGym_BlockData: ; 0xb09eb
	INCBIN "maps/VermilionGym.blk"
; 0xb0a18

SaffronGym_BlockData: ; 0xb0a18
	INCBIN "maps/SaffronGym.blk"
; 0xb0a72

PowerPlant_BlockData: ; 0xb0a72
	INCBIN "maps/PowerPlant.blk"
; 0xb0acc

PokemonFanClub_BlockData: ; 0xb0acc
	INCBIN "maps/PokemonFanClub.blk"
; 0xb0ae0

FightingDojo_BlockData: ; 0xb0ae0
	INCBIN "maps/FightingDojo.blk"
; 0xb0afe

SilphCo1F_BlockData: ; 0xb0afe
	INCBIN "maps/SilphCo1F.blk"
; 0xb0b1e

ViridianGym_BlockData: ; 0xb0b1e
	INCBIN "maps/ViridianGym.blk"
; 0xb0b4b

TrainerHouse1F_BlockData: ; 0xb0b4b
	INCBIN "maps/TrainerHouse1F.blk"
; 0xb0b6e

TrainerHouseB1F_BlockData: ; 0xb0b6e
	INCBIN "maps/TrainerHouseB1F.blk"
; 0xb0b96

RedsHouse1F_BlockData: ; 0xb0b96
	INCBIN "maps/RedsHouse1F.blk"
; 0xb0ba6

RedsHouse2F_BlockData: ; 0xb0ba6
	INCBIN "maps/RedsHouse2F.blk"
; 0xb0bb6

OaksLab_BlockData: ; 0xb0bb6
	INCBIN "maps/OaksLab.blk"
; 0xb0bd4

MrFujisHouse_BlockData: ; 0xb0bd4
	INCBIN "maps/MrFujisHouse.blk"
; 0xb0be8

LavRadioTower1F_BlockData: ; 0xb0be8
	INCBIN "maps/LavRadioTower1F.blk"
; 0xb0c10

SilverCaveItemRooms_BlockData: ; 0xb0c10
	INCBIN "maps/SilverCaveItemRooms.blk"
; 0xb0c6a

DayCare_BlockData: ; 0xb0c6a
	INCBIN "maps/DayCare.blk"
; 0xb0c7e

SoulHouse_BlockData: ; 0xb0c7e
	INCBIN "maps/SoulHouse.blk"
; 0xb0c92

PewterGym_BlockData: ; 0xb0c92
	INCBIN "maps/PewterGym.blk"
; 0xb0cb5

CeladonGym_BlockData: ; 0xb0cb5
	INCBIN "maps/CeladonGym.blk"
; 0xb0ce2

BetaHouse2_BlockData: ; 0xb0ce2
	INCBIN "maps/BetaHouse2.blk"
; 0xb0cf6

CeladonCafe_BlockData: ; 0xb0cf6
	INCBIN "maps/CeladonCafe.blk"
; 0xb0d0e

BetaCeladonMansion_BlockData: ; 0xb0d0e
	INCBIN "maps/BetaCeladonMansion.blk"
; 0xb0d26

RockTunnel1F_BlockData: ; 0xb0d26
	INCBIN "maps/RockTunnel1F.blk"
; 0xb0e34

RockTunnelB1F_BlockData: ; 0xb0e34
	INCBIN "maps/RockTunnelB1F.blk"
; 0xb0f42

DiglettsCave_BlockData: ; 0xb0f42
	INCBIN "maps/DiglettsCave.blk"
; 0xb0ff6

MountMoon_BlockData: ; 0xb0ff6
	INCBIN "maps/MountMoon.blk"
; 0xb107d

SeafoamGym_BlockData: ; 0xb107d
	INCBIN "maps/SeafoamGym.blk"
; 0xb1091

MrPokemonsHouse_BlockData: ; 0xb1091
	INCBIN "maps/MrPokemonsHouse.blk"
; 0xb10a1

VictoryRoadGate_BlockData: ; 0xb10a1
	INCBIN "maps/VictoryRoadGate.blk"
; 0xb10fb

OlivinePortPassage_BlockData: ; 0xb10fb
	INCBIN "maps/OlivinePortPassage.blk"
; 0xb1155

FuchsiaGym_BlockData: ; 0xb1155
	INCBIN "maps/FuchsiaGym.blk"
; 0xb1182

SafariZoneBeta_BlockData: ; 0xb1182
	INCBIN "maps/SafariZoneBeta.blk"
; 0xb1236

Underground_BlockData: ; 0xb1236
	INCBIN "maps/Underground.blk"
; 0xb1260

Route39Barn_BlockData: ; 0xb1260
	INCBIN "maps/Route39Barn.blk"
; 0xb1270

VictoryRoad_BlockData: ; 0xb1270
	INCBIN "maps/VictoryRoad.blk"
; 0xb13d8

Route23_BlockData: ; 0xb13d8
	INCBIN "maps/Route23.blk"
; 0xb1432

LancesRoom_BlockData: ; 0xb1432
	INCBIN "maps/LancesRoom.blk"
; 0xb146e

HallOfFame_BlockData: ; 0xb146e
	INCBIN "maps/HallOfFame.blk"
; 0xb1491

CopycatsHouse1F_BlockData: ; 0xb1491
	INCBIN "maps/CopycatsHouse1F.blk"
; 0xb14a1

CopycatsHouse2F_BlockData: ; 0xb14a1
	INCBIN "maps/CopycatsHouse2F.blk"
; 0xb14b0

GoldenrodFlowerShop_BlockData: ; 0xb14b0
	INCBIN "maps/GoldenrodFlowerShop.blk"
; 0xb14c0

MountMoonSquare_BlockData: ; 0xb14c0
	INCBIN "maps/MountMoonSquare.blk"
; 0xb1547

WiseTriosRoom_BlockData: ; 0xb1547
	INCBIN "maps/WiseTriosRoom.blk"
; 0xb1557

DragonsDen1F_BlockData: ; 0xb1557
	INCBIN "maps/DragonsDen1F.blk"
; 0xb1584

DragonsDenB1F_BlockData: ; 0xb1584
	INCBIN "maps/DragonsDenB1F.blk"
; 0xb16ec

TohjoFalls_BlockData: ; 0xb16ec
	INCBIN "maps/TohjoFalls.blk"
; 0xb1773

RuinsofAlphHoOhItemRoom_BlockData: ; 0xb1773
	INCBIN "maps/RuinsofAlphHoOhItemRoom.blk"
; 0xb1787

RuinsofAlphHoOhWordRoom_BlockData: ; 0xb1787
	INCBIN "maps/RuinsofAlphHoOhWordRoom.blk"
; 0xb17ff

RuinsofAlphKabutoWordRoom_BlockData: ; 0xb17ff
	INCBIN "maps/RuinsofAlphKabutoWordRoom.blk"
; 0xb1845

RuinsofAlphOmanyteWordRoom_BlockData: ; 0xb1845
	INCBIN "maps/RuinsofAlphOmanyteWordRoom.blk"
; 0xb1895

RuinsofAlphAerodactylWordRoom_BlockData: ; 0xb1895
	INCBIN "maps/RuinsofAlphAerodactylWordRoom.blk"
; 0xb18db

DragonShrine_BlockData: ; 0xb18db
	INCBIN "maps/DragonShrine.blk"
; 0xb18f4

BattleTower1F_BlockData: ; 0xb18f4
	INCBIN "maps/BattleTower1F.blk"
; 0xb191c

BattleTowerBattleRoom_BlockData: ; 0xb191c
	INCBIN "maps/BattleTowerBattleRoom.blk"
; 0xb192c

GoldenrodPokeComCenter2FMobile_BlockData: ; 0xb192c
	INCBIN "maps/GoldenrodPokeComCenter2FMobile.blk"
; 0xb1a2c

MobileTradeRoomMobile_BlockData: ; 0xb1a2c
	INCBIN "maps/MobileTradeRoomMobile.blk"
; 0xb1a40

MobileBattleRoom_BlockData: ; 0xb1a40
	INCBIN "maps/MobileBattleRoom.blk"
; 0xb1a54

BattleTowerHallway_BlockData: ; 0xb1a54
	INCBIN "maps/BattleTowerHallway.blk"
; 0xb1a6a

BattleTowerElevator_BlockData: ; 0xb1a6a
	INCBIN "maps/BattleTowerElevator.blk"
; 0xb1a6e

BattleTowerOutside_BlockData: ; 0xb1a6e
	INCBIN "maps/BattleTowerOutside.blk"
; 0xb1afa

BetaBlank_BlockData: ; 0xb1afa
	INCBIN "maps/BetaBlank.blk"
; 0xb1b22

GoldenrodDeptStoreRoof_BlockData: ; 0xb1b22
	INCBIN "maps/GoldenrodDeptStoreRoof.blk"
; 0xb1b42


SECTION "bank2D",DATA,BANK[$2D]

Tileset21GFX: ; 0xb4000
INCBIN "gfx/tilesets/21.lz"
; 0xb4893

	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00

Tileset21Meta: ; 0xb48a0
INCBIN "tilesets/21_metatiles.bin"
; 0xb4ca0

Tileset21Coll: ; 0xb4ca0
INCBIN "tilesets/21_collision.bin"
; 0xb4da0

Tileset22GFX: ; 0xb4da0
INCBIN "gfx/tilesets/22.lz"
; 0xb50d1

	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00

Tileset22Meta: ; 0xb50e0
INCBIN "tilesets/22_metatiles.bin"
; 0xb54e0

Tileset22Coll: ; 0xb54e0
INCBIN "tilesets/22_collision.bin"
; 0xb55e0

Tileset08GFX: ; 0xb55e0
INCBIN "gfx/tilesets/08.lz"
; 0xb59db

	db $00
	db $00
	db $00
	db $00
	db $00

Tileset08Meta: ; 0xb59e0
INCBIN "tilesets/08_metatiles.bin"
; 0xb5de0

Tileset08Coll: ; 0xb5de0
INCBIN "tilesets/08_collision.bin"
; 0xb5ee0

Tileset02GFX: ; 0xb5ee0
Tileset04GFX: ; 0xb5ee0
INCBIN "gfx/tilesets/04.lz"
; 0xb6ae7

	db $00

Tileset02Meta: ; 0xb6ae8
INCBIN "tilesets/02_metatiles.bin"
; 0xb72e8

Tileset02Coll: ; 0xb72e8
INCBIN "tilesets/02_collision.bin"
; 0xb74e8

Tileset16GFX: ; 0xb74e8
INCBIN "gfx/tilesets/16.lz"
; 0xb799a

	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00

Tileset16Meta: ; 0xb79a8
INCBIN "tilesets/16_metatiles.bin"
; 0xb7da8

Tileset16Coll: ; 0xb7da8
INCBIN "tilesets/16_collision.bin"
; 0xb7ea8


SECTION "bank2E",DATA,BANK[$2E]

INCBIN "baserom.gbc", $B8000, $b8219 - $b8000

Functionb8219: ; b8219
; deals strictly with rockmon encounter
	xor a
	ld [$d22e], a
	ld [$d143], a
	ld hl, WildRockMonMapTable
	call GetTreeMonEncounterTable
	jr nc, .quit
	call LoadWildTreeMonData
	jr nc, .quit
	ld a, $0a
	call $2fb1
	cp a, $04
	jr nc, .quit
	call $441f
	jr nc, .quit
	ret
.quit
	xor a
	ret
; b823e

db $05 ; ????

GetTreeMonEncounterTable: ; b823f
; reads a map-sensitive encounter table
; compares current map with maps in the table
; if there is a match, encounter table # is loaded into a
	ld a, [MapNumber]
	ld e, a
	ld a, [MapGroup]
	ld d, a
.loop
	ld a, [hli]
	cp a, $ff
	jr z, .quit
	cp d
	jr nz, .skip2
	ld a, [hli]
	cp e
	jr nz, .skip1
	jr .end
.skip2
	inc hl
.skip1
	inc hl
	jr .loop
.quit
	xor a
	ret
.end
	ld a, [hl]
	scf
	ret
; b825e

INCBIN "baserom.gbc", $B825E, $b82c5 - $b825e

WildRockMonMapTable: ; b82c5
	db GROUP_CIANWOOD_CITY, MAP_CIANWOOD_CITY, $07
	db GROUP_ROUTE_40, MAP_ROUTE_40, $07
	db GROUP_DARK_CAVE_VIOLET_ENTRANCE, MAP_DARK_CAVE_VIOLET_ENTRANCE, $07
	db GROUP_SLOWPOKE_WELL_B1F, MAP_SLOWPOKE_WELL_B1F, $07
	db $ff ; end
; b82d2

LoadWildTreeMonData: ; b82d2
; input: a = table number
; returns wildtreemontable pointer in hl
; sets carry if successful
	cp a, $08 ; which table?
	jr nc, .quit ; only 8 tables
	and a
	jr z, .quit ; 0 is invalid
	ld e, a
	ld d, $00
	ld hl, WildTreeMonPointerTable
	add hl, de
	add hl, de
	ld a, [hli] ; store pointer in hl
	ld h, [hl]
	ld l, a
	scf
	ret
.quit
	xor a
	ret
; b82e8

WildTreeMonPointerTable: ; b82e8
; seems to point to "normal" tree encounter data
; as such only odd-numbered tables are used
; rockmon is 13th
	dw WildTreeMonTable1  ; filler
	dw WildTreeMonTable1  ; 1
	dw WildTreeMonTable3  ; 2
	dw WildTreeMonTable5  ; 3
	dw WildTreeMonTable7  ; 4
	dw WildTreeMonTable9  ; 5
	dw WildTreeMonTable11 ; 6
	dw WildRockMonTable   ; 7
	dw WildTreeMonTable1  ; 8
; b82fa

; structure: % species level

WildTreeMonTable1: ; b82fa
	db 50, SPEAROW, 10
	db 15, SPEAROW, 10
	db 15, SPEAROW, 10
	db 10, AIPOM, 10
	db 5, AIPOM, 10
	db 5, AIPOM, 10
	db $ff ; end
; b830d

WildTreeMonTable2 ; b830d
; unused
	db 50, SPEAROW, 10
	db 15, HERACROSS, 10
	db 15, HERACROSS, 10
	db 10, AIPOM, 10
	db 5, AIPOM, 10
	db 5, AIPOM, 10
	db $ff ; end
; b8320

WildTreeMonTable3: ; b8320
	db 50, SPEAROW, 10
	db 15, EKANS, 10
	db 15, SPEAROW, 10
	db 10, AIPOM, 10
	db 5, AIPOM, 10
	db 5, AIPOM, 10
	db $ff ; end
; b8333

WildTreeMonTable4: ; b8333
; unused
	db 50, SPEAROW, 10
	db 15, HERACROSS, 10
	db 15, HERACROSS, 10
	db 10, AIPOM, 10
	db 5, AIPOM, 10
	db 5, AIPOM, 10
	db $ff ; end
; b8346

WildTreeMonTable5: ; b8346
	db 50, HOOTHOOT, 10
	db 15, SPINARAK, 10
	db 15, LEDYBA, 10
	db 10, EXEGGCUTE, 10
	db 5, EXEGGCUTE, 10
	db 5, EXEGGCUTE, 10
	db $ff ; end
; b8359

WildTreeMonTable6: ; b8359
; unused
	db 50, HOOTHOOT, 10
	db 15, PINECO, 10
	db 15, PINECO, 10
	db 10, EXEGGCUTE, 10
	db 5, EXEGGCUTE, 10
	db 5, EXEGGCUTE, 10
	db $ff ; end
; b836c

WildTreeMonTable7: ; b836c
	db 50, HOOTHOOT, 10
	db 15, EKANS, 10
	db 15, HOOTHOOT, 10
	db 10, EXEGGCUTE, 10
	db 5, EXEGGCUTE, 10
	db 5, EXEGGCUTE, 10
	db $ff ; end
; b837f

WildTreeMonTable8: ; b837f
; unused
	db 50, HOOTHOOT, 10
	db 15, PINECO, 10
	db 15, PINECO, 10
	db 10, EXEGGCUTE, 10
	db 5, EXEGGCUTE, 10
	db 5, EXEGGCUTE, 10
	db $ff ; end
; b8392

WildTreeMonTable9: ; b8392
	db 50, HOOTHOOT, 10
	db 15, VENONAT, 10
	db 15, HOOTHOOT, 10
	db 10, EXEGGCUTE, 10
	db 5, EXEGGCUTE, 10
	db 5, EXEGGCUTE, 10
	db $ff ; end
; b83a5

WildTreeMonTable10: ; b83a5
; unused
	db 50, HOOTHOOT, 10
	db 15, PINECO, 10
	db 15, PINECO, 10
	db 10, EXEGGCUTE, 10
	db 5, EXEGGCUTE, 10
	db 5, EXEGGCUTE, 10
	db $ff ; end
; b83b8

WildTreeMonTable11: ; b83b8
	db 50, HOOTHOOT, 10
	db 15, PINECO, 10
	db 15, PINECO, 10
	db 10, NOCTOWL, 10
	db 5, BUTTERFREE, 10
	db 5, BEEDRILL, 10
	db $ff ; end
; b83cb

WildTreeMonTable12; b83cb
; unused
	db 50, HOOTHOOT, 10
	db 15, CATERPIE, 10
	db 15, WEEDLE, 10
	db 10, HOOTHOOT, 10
	db 5, METAPOD, 10
	db 5, KAKUNA, 10
	db $ff ; end
; b83de

WildRockMonTable: ; b83de
	db 90, KRABBY, 15
	db 10, SHUCKLE, 15
	db $ff ; end
; b83e5

INCBIN "baserom.gbc", $b83e5, $b9e8b - $b83e5


SECTION "bank2F",DATA,BANK[$2F]

INCBIN "baserom.gbc", $bc000, $bc09c - $bc000

PokeCenterNurseScript: ; bc09c
; Talking to a nurse in a Pokemon Center

	loadfont
; The nurse has different text for:
; Morn
	checktime $1
	iftrue .morn
; Day
	checktime $2
	iftrue .day
; Nite
	checktime $4
	iftrue .nite
; If somehow it's not a time of day at all, we skip the introduction
	2jump .heal

.morn
; Different text if we're in the com center
	checkbit1 $032a
	iftrue .morn_comcenter
; Good morning! Welcome to ...
	3writetext BANK(UnknownText_0x1b0000), UnknownText_0x1b0000
	keeptextopen
	2jump .heal
.morn_comcenter
; Good morning! This is the ...
	3writetext BANK(UnknownText_0x1b008a), UnknownText_0x1b008a
	keeptextopen
	2jump .heal

.day
; Different text if we're in the com center
	checkbit1 $032a
	iftrue .day_comcenter
; Hello! Welcome to ...
	3writetext BANK(UnknownText_0x1b002b), UnknownText_0x1b002b
	keeptextopen
	2jump .heal
.day_comcenter
; Hello! This is the ...
	3writetext BANK(UnknownText_0x1b00d6), UnknownText_0x1b00d6
	keeptextopen
	2jump .heal

.nite
; Different text if we're in the com center
	checkbit1 $032a
	iftrue .nite_comcenter
; Good evening! You're out late. ...
	3writetext BANK(UnknownText_0x1b004f), UnknownText_0x1b004f
	keeptextopen
	2jump .heal
.nite_comcenter
; Good to see you working so late. ...
	3writetext BANK(UnknownText_0x1b011b), UnknownText_0x1b011b
	keeptextopen
	2jump .heal

.heal
; If we come back, don't welcome us to the com center again
	clearbit1 $032a
; Ask if you want to heal
	3writetext BANK(UnknownText_0x1b017a), UnknownText_0x1b017a
	yesorno
	iffalse .end
; Go ahead and heal
	3writetext BANK(UnknownText_0x1b01bd), UnknownText_0x1b01bd
	pause 20
	special $009d
; Turn to the machine
	spriteface $fe, $2
	pause 10
	special $001b
	playmusic $0000
	writebyte $0
	special $003e
	pause 30
	special $003d
	spriteface $fe, $0
	pause 10
; Has Elm already phoned you about Pokerus?
	checkphonecall
	iftrue .done
; Has Pokerus already been found in the Pokecenter?
	checkbit2 $000d
	iftrue .done
; Check for Pokerus
	special $004e ; SPECIAL_CHECKPOKERUS
	iftrue .pokerus
.done
; Thank you for waiting. ...
	3writetext BANK(UnknownText_0x1b01d7), UnknownText_0x1b01d7
	pause 20
.end
; We hope to see you again.
	3writetext BANK(UnknownText_0x1b020b), UnknownText_0x1b020b
; Curtsy
	spriteface $fe, $1
	pause 10
	spriteface $fe, $0
	pause 10
; And we're out
	closetext
	loadmovesprites
	end

.pokerus
; Different text for com center (excludes 'in a Pokemon Center')
; Since flag $32a is cleared when healing,
; this text is never actually seen
	checkbit1 $032a
	iftrue .pokerus_comcenter
; Your Pokemon appear to be infected ...
	3writetext BANK(UnknownText_0x1b0241), UnknownText_0x1b0241
	closetext
	loadmovesprites
	2jump .endpokerus
.pokerus_comcenter
; Your Pokemon appear to be infected ...
	3writetext BANK(UnknownText_0x1b02d6), UnknownText_0x1b02d6
	closetext
	loadmovesprites
.endpokerus
; Don't tell us about Pokerus again
	setbit2 $000d
; Trigger Elm's Pokerus phone call
	specialphonecall $0001
	end
; bc162

INCBIN "baserom.gbc", $bc162, $bcea5-$bc162

UnusedPhoneScript: ; 0xbcea5
	3writetext BANK(UnusedPhoneText), UnusedPhoneText
	end

MomPhoneScript: ; 0xbceaa
	checkbit1 $0040
	iftrue .bcec5
	checkbit1 $0041 ; if dude talked to you, then you left home without talking to mom
	iftrue MomPhoneLectureScript
	checkbit1 $001f
	iftrue MomPhoneNoGymQuestScript
	checkbit1 $001a
	iftrue MomPhoneNoPokedexScript
	2jump MomPhoneNoPokemonScript

.bcec5 ; 0xbcec5
	checkbit1 $0007
	iftrue MomPhoneHangUpScript
	3writetext BANK(MomPhoneGreetingText), MomPhoneGreetingText
	keeptextopen
	mapnametotext $0
	checkcode $f
	if_equal $1, UnknownScript_0xbcee7
	if_equal $2, $4f27
	2jump UnknownScript_0xbcf2f

UnknownScript_0xbcedf: ; 0xbcedf
	3writetext $6d, $4021
	keeptextopen
	2jump UnknownScript_0xbcf37

UnknownScript_0xbcee7: ; 0xbcee7
	checkcode $c
	if_equal GROUP_NEW_BARK_TOWN, .newbark
	if_equal GROUP_CHERRYGROVE_CITY, .cherrygrove
	if_equal GROUP_VIOLET_CITY, .violet
	if_equal GROUP_AZALEA_TOWN, .azalea
	if_equal GROUP_GOLDENROD_CITY, .goldenrod
	3writetext BANK(MomPhoneGenericAreaText), MomPhoneGenericAreaText
	keeptextopen
	2jump UnknownScript_0xbcf37

.newbark ; 0xbcf05
	3writetext BANK(MomPhoneNewBarkText), MomPhoneNewBarkText
	keeptextopen
	2jump UnknownScript_0xbcf37

.cherrygrove ; 0xbcf0d
	3writetext BANK(MomPhoneCherrygroveText), MomPhoneCherrygroveText
	keeptextopen
	2jump UnknownScript_0xbcf37

.violet ; 0xbcf15
	displaylocation $7 ; sprout tower
	3call $3, $4edf
.azalea ; 0xbcf1b
	displaylocation $d ; slowpoke well
	3call $3, $4edf
.goldenrod ; 0xbcf21
	displaylocation $11 ; radio tower
	3call $3, $4edf
	3writetext $6d, $411c
	keeptextopen
	2jump UnknownScript_0xbcf37

UnknownScript_0xbcf2f: ; 0xbcf2f
	3writetext $6d, $4150
	keeptextopen
	2jump UnknownScript_0xbcf37

UnknownScript_0xbcf37: ; 0xbcf37
	checkbit2 $0008
	iffalse UnknownScript_0xbcf49
	checkmoney $1, 0
	if_equal $0, UnknownScript_0xbcf55
	2jump UnknownScript_0xbcf63

UnknownScript_0xbcf49: ; 0xbcf49
	checkmoney $1, 0
	if_equal $0, UnknownScript_0xbcf79
	2jump UnknownScript_0xbcf6e

UnknownScript_0xbcf55: ; 0xbcf55
	readmoney $1, $0
	3writetext $6d, $41a7
	yesorno
	iftrue MomPhoneSaveMoneyScript
	2jump MomPhoneWontSaveMoneyScript

UnknownScript_0xbcf63: ; 0xbcf63
	3writetext $6d, $41ea
	yesorno
	iftrue MomPhoneSaveMoneyScript
	2jump MomPhoneWontSaveMoneyScript

UnknownScript_0xbcf6e: ; 0xbcf6e
	3writetext $6d, $420d
	yesorno
	iftrue MomPhoneSaveMoneyScript
	2jump MomPhoneWontSaveMoneyScript

UnknownScript_0xbcf79: ; 0xbcf79
	readmoney $1, $0
	3writetext $6d, $4249
	yesorno
	iftrue MomPhoneSaveMoneyScript
	2jump MomPhoneWontSaveMoneyScript

MomPhoneSaveMoneyScript: ; 0xbcf87
	setbit2 $0008
	3writetext $6d, $4289
	keeptextopen
	2jump MomPhoneHangUpScript

MomPhoneWontSaveMoneyScript: ; 0xbcf92
	clearbit2 $0008
	3writetext BANK(MomPhoneWontSaveMoneyText), MomPhoneWontSaveMoneyText
	keeptextopen
	2jump MomPhoneHangUpScript

MomPhoneHangUpScript: ; 0xbcf9d
	3writetext BANK(MomPhoneHangUpText), MomPhoneHangUpText
	end

MomPhoneNoPokemonScript: ; 0xbcfa2
	3writetext BANK(MomPhoneNoPokemonText), MomPhoneNoPokemonText
	end

MomPhoneNoPokedexScript: ; 0xbcfa7
	3writetext BANK(MomPhoneNoPokedexText), MomPhoneNoPokedexText
	end

MomPhoneNoGymQuestScript: ; 0xbcfac
	3writetext BANK(MomPhoneNoGymQuestText), MomPhoneNoGymQuestText
	end

MomPhoneLectureScript: ; 0xbcfb1
	setbit1 $0040
	setbit2 $0009
	specialphonecall $0000
	3writetext BANK(MomPhoneLectureText), MomPhoneLectureText
	yesorno
	iftrue MomPhoneSaveMoneyScript
	2jump MomPhoneWontSaveMoneyScript

BillPhoneScript1: ; 0xbcfc5
	checktime $2
	iftrue .daygreet
	checktime $4
	iftrue .nitegreet
	3writetext BANK(BillPhoneMornGreetingText), BillPhoneMornGreetingText
	keeptextopen
	2jump .main

.daygreet ; 0xbcfd7
	3writetext BANK(BillPhoneDayGreetingText), BillPhoneDayGreetingText
	keeptextopen
	2jump .main

.nitegreet ; 0xbcfdf
	3writetext BANK(BillPhoneNiteGreetingText), BillPhoneNiteGreetingText
	keeptextopen
	2jump .main

.main ; 0xbcfe7
	3writetext BANK(BillPhoneGeneriText), BillPhoneGeneriText
	keeptextopen
	checkcode $10
	RAM2MEM $0
	if_equal $0, .full
	if_greater_than $6, .nearlyfull
	3writetext BANK(BillPhoneNotFullText), BillPhoneNotFullText
	end

.nearlyfull ; 0xbcffd
	3writetext BANK(BillPhoneNearlyFullText), BillPhoneNearlyFullText
	end

.full ; 0xbd002
	3writetext BANK(BillPhoneFullText), BillPhoneFullText
	end

BillPhoneScript2: ; 0xbd007
	3writetext BANK(BillPhoneNewlyFullText), BillPhoneNewlyFullText
	closetext
	end

ElmPhoneScript1: ; 0xbd00d
	checkcode $14
	if_equal $1, .pokerus
	checkbit1 $0055
	iftrue .discovery
	checkbit1 $002d
	iffalse .next
	checkbit1 $0054
	iftrue .egghatched
.next
	checkbit1 $002d
	iftrue .eggunhatched
	checkbit1 $0701
	iftrue .assistant
	checkbit1 $001f
	iftrue .checkingegg
	checkbit1 $0043
	iftrue .stolen
	checkbit1 $001e
	iftrue .sawmrpokemon
	3writetext BANK(ElmPhoneStartText), ElmPhoneStartText
	end

.sawmrpokemon ; 0xbd048
	3writetext BANK(ElmPhoneSawMrPokemonText), ElmPhoneSawMrPokemonText
	end

.stolen ; 0xbd04d
	3writetext BANK(ElmPhonePokemonStolenText), ElmPhonePokemonStolenText
	end

.checkingegg ; 0xbd052
	3writetext BANK(ElmPhoneCheckingEggText), ElmPhoneCheckingEggText
	end

.assistant ; 0xbd057
	3writetext BANK(ElmPhoneAssistantText), ElmPhoneAssistantText
	end

.eggunhatched ; 0xbd05c
	3writetext BANK(ElmPhoneEggUnhatchedText), ElmPhoneEggUnhatchedText
	end

.egghatched ; 0xbd061
	3writetext BANK(ElmPhoneEggHatchedText), ElmPhoneEggHatchedText
	setbit1 $0077
	end

.discovery ; 0xbd069
	random $2
	if_equal $0, .nextdiscovery
	3writetext BANK(ElmPhoneDiscovery1Text), ElmPhoneDiscovery1Text
	end

.nextdiscovery ; 0xbd074
	3writetext BANK(ElmPhoneDiscovery2Text), ElmPhoneDiscovery2Text
	end

.pokerus ; 0xbd079
	3writetext BANK(ElmPhonePokerusText), ElmPhonePokerusText
	specialphonecall $0000
	end

ElmPhoneScript2: ; 0xbd081
	checkcode $14
	if_equal $2, .disaster
	if_equal $3, .assistant
	if_equal $4, .rocket
	if_equal $5, .gift
	if_equal $8, .gift
	3writetext BANK(ElmPhonePokerusText), ElmPhonePokerusText
	specialphonecall $0000
	end

.disaster ; 0xbd09f
	3writetext BANK(ElmPhoneDisasterText), ElmPhoneDisasterText
	specialphonecall $0000
	setbit1 $0043
	end

.assistant ; 0xbd0aa
	3writetext BANK(ElmPhoneEggAssistantText), ElmPhoneEggAssistantText
	specialphonecall $0000
	clearbit1 $0700
	setbit1 $0701
	end

.rocket ; 0xbd0b8
	3writetext BANK(ElmPhoneRocketText), ElmPhoneRocketText
	specialphonecall $0000
	end

.gift ; 0xbd0c0
	3writetext BANK(ElmPhoneGiftText), ElmPhoneGiftText
	specialphonecall $0000
	end

.unused ; 0xbd0c8
	3writetext BANK(ElmPhoneUnusedText), ElmPhoneUnusedText
	specialphonecall $0000
	end

INCBIN "baserom.gbc", $bd0d0, $be699-$bd0d0


SECTION "bank30",DATA,BANK[$30]

INCBIN "baserom.gbc", $c0000, $c3fc0 - $c0000


SECTION "bank31",DATA,BANK[$31]

INCBIN "baserom.gbc", $c4000, $c7f80 - $c4000


SECTION "bank32",DATA,BANK[$32]

INCBIN "baserom.gbc", $c8000, $cbe2b - $c8000


SECTION "bank33",DATA,BANK[$33]

INCBIN "baserom.gbc", $cc000, $cfd9e - $cc000

;                          Songs iii

Music_PostCredits: INCLUDE "audio/music/postcredits.asm"



;                       Pic animations I

SECTION "bank34",DATA,BANK[$34]

; Pic animations asm
INCBIN "baserom.gbc", $d0000, $d0695 - $d0000

; Pic animations are assembled in 3 parts:

; Top-level animations:
; 	frame #, duration: Frame 0 is the original pic (no change)
;	setrepeat #:       Sets the number of times to repeat
; 	dorepeat #:        Repeats from command # (starting from 0)
; 	end

; Bitmasks:
;	Layered over the pic to designate affected tiles

; Frame definitions:
;	first byte is the bitmask used for this frame
;	following bytes are tile ids mapped to each bit in the mask

; Main animations (played everywhere)
AnimationPointers: INCLUDE "gfx/pics/anim_pointers.asm"
INCLUDE "gfx/pics/anims.asm"

; Extra animations, appended to the main animation
; Used in the status screen (blinking, tail wags etc.)
AnimationExtraPointers: INCLUDE "gfx/pics/extra_pointers.asm"
INCLUDE "gfx/pics/extras.asm"

; Unown has its own animation data despite having an entry in the main tables
UnownAnimationPointers: INCLUDE "gfx/pics/unown_anim_pointers.asm"
INCLUDE "gfx/pics/unown_anims.asm"
UnownAnimationExtraPointers: INCLUDE "gfx/pics/unown_extra_pointers.asm"
INCLUDE "gfx/pics/unown_extras.asm"

; Bitmasks
BitmasksPointers: INCLUDE "gfx/pics/bitmask_pointers.asm"
INCLUDE "gfx/pics/bitmasks.asm"
UnownBitmasksPointers: INCLUDE "gfx/pics/unown_bitmask_pointers.asm"
INCLUDE "gfx/pics/unown_bitmasks.asm"


;                       Pic animations II

SECTION "bank35",DATA,BANK[$35]

; Frame definitions
FramesPointers: INCLUDE "gfx/pics/frame_pointers.asm"
; Inexplicably, Kanto frames are split off from Johto
INCLUDE "gfx/pics/kanto_frames.asm"


;                       Pic animations III

SECTION "bank36",DATA,BANK[$36]

FontInversed: INCBIN "gfx/misc/font_inversed.1bpp"

; Johto frame definitions
INCLUDE "gfx/pics/johto_frames.asm"

; Unown frame definitions
UnownFramesPointers: INCLUDE "gfx/pics/unown_frame_pointers.asm"
INCLUDE "gfx/pics/unown_frames.asm"


SECTION "bank37",DATA,BANK[$37]

Tileset31GFX: ; 0xdc000
INCBIN "gfx/tilesets/31.lz"
; 0xdc3ce

	db $00
	db $00

Tileset18GFX: ; 0xdc3d0
INCBIN "gfx/tilesets/18.lz"
; 0xdcc4e

	db $00
	db $00

Tileset18Meta: ; 0xdcc50
INCBIN "tilesets/18_metatiles.bin"
; 0xdd050

Tileset18Coll: ; 0xdd050
INCBIN "tilesets/18_collision.bin"
; 0xdd150

Tileset05GFX: ; 0xdd150
INCBIN "gfx/tilesets/05.lz"
; 0xdd5f8

	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00

Tileset05Meta: ; 0xdd600
INCBIN "tilesets/05_metatiles.bin"
; 0xdda00

Tileset05Coll: ; 0xdda00
INCBIN "tilesets/05_collision.bin"
; 0xddb00

Tileset19GFX: ; 0xddb00
INCBIN "gfx/tilesets/19.lz"
; 0xddf64

	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00

Tileset19Meta: ; 0xddf70
INCBIN "tilesets/19_metatiles.bin"
; 0xde370

Tileset19Coll: ; 0xde370
INCBIN "tilesets/19_collision.bin"
; 0xde470

Tileset31Coll: ; 0xde470
INCBIN "tilesets/31_collision.bin"
; 0xde570

Tileset11GFX: ; 0xde570
INCBIN "gfx/tilesets/11.lz"
; 0xde98a

	db $00
	db $00
	db $00
	db $00
	db $00
	db $00

Tileset11Meta: ; 0xde990
INCBIN "tilesets/11_metatiles.bin"
; 0xded90

Tileset11Coll: ; 0xded90
INCBIN "tilesets/11_collision.bin"
; 0xdee90

Tileset04Meta: ; 0xdee90
INCBIN "tilesets/04_metatiles.bin"
; 0xdf690

Tileset04Coll: ; 0xdf690
INCBIN "tilesets/04_collision.bin"
; 0xdf890

Tileset32Meta: ; 0xdf890
INCBIN "tilesets/32_metatiles.bin"
; 0xdfc90

Tileset32Coll: ; 0xdfc90
Tileset33Coll: ; 0xdfc90
Tileset34Coll: ; 0xdfc90
Tileset35Coll: ; 0xdfc90
Tileset36Coll: ; 0xdfc90
INCBIN "tilesets/36_collision.bin"
; 0xdfd90


SECTION "bank38",DATA,BANK[$38]

INCBIN "baserom.gbc", $e0000, $e37f9 - $e0000


SECTION "bank39",DATA,BANK[$39]

INCBIN "baserom.gbc", $e4000, $e555d - $e4000

IntroSuicuneRunGFX: ; e555d
INCBIN "gfx/intro/suicune_run.lz"
; e592b

INCBIN "baserom.gbc", $e592b, $e592d - $e592b

IntroPichuWooperGFX: ; e592d
INCBIN "gfx/intro/pichu_wooper.lz"
; e5c70

INCBIN "baserom.gbc", $e5c70, $e5c7d - $e5c70

IntroBackgroundGFX: ; e5c7d
INCBIN "gfx/intro/background.lz"
; e5e69

INCBIN "baserom.gbc", $e5e69, $e5e6d - $e5e69

IntroTilemap004: ; e5e6d
INCBIN "gfx/intro/004.lz"
; e5ec5

INCBIN "baserom.gbc", $e5ec5, $e5ecd - $e5ec5

IntroTilemap003: ; e5ecd
INCBIN "gfx/intro/003.lz"
; e5ed9

INCBIN "baserom.gbc", $e5ed9, $e5f5d - $e5ed9

IntroUnownsGFX: ; e5f5d
INCBIN "gfx/intro/unowns.lz"
; e6348

INCBIN "baserom.gbc", $e6348, $e634d - $e6348

IntroPulseGFX: ; e634d
INCBIN "gfx/intro/pulse.lz"
; e63d4

INCBIN "baserom.gbc", $e63d4, $e63dd - $e63d4

IntroTilemap002: ; e63dd
INCBIN "gfx/intro/002.lz"
; e6418

INCBIN "baserom.gbc", $e6418, $e641d - $e6418

IntroTilemap001: ; e641d
INCBIN "gfx/intro/001.lz"
; e6429

INCBIN "baserom.gbc", $e6429, $e642d - $e6429

IntroTilemap006: ; e642d
INCBIN "gfx/intro/006.lz"
; e6472

INCBIN "baserom.gbc", $e6472, $e647d - $e6472

IntroTilemap005: ; e647d
INCBIN "gfx/intro/005.lz"
; e6498

INCBIN "baserom.gbc", $e6498, $e649d - $e6498

IntroTilemap008: ; e649d
INCBIN "gfx/intro/008.lz"
; e6550

INCBIN "baserom.gbc", $e6550, $e655d - $e6550

IntroTilemap007: ; e655d
INCBIN "gfx/intro/007.lz"
; e65a4

INCBIN "baserom.gbc", $e65a4, $e662d - $e65a4

IntroCrystalUnownsGFX: ; e662d
INCBIN "gfx/intro/crystal_unowns.lz"
; e6720

INCBIN "baserom.gbc", $e6720, $e672d - $e6720

IntroTilemap017: ; e672d
INCBIN "gfx/intro/017.lz"
; e6761

INCBIN "baserom.gbc", $e6761, $e676d - $e6761

IntroTilemap015: ; e676d
INCBIN "gfx/intro/015.lz"
; e6794

INCBIN "baserom.gbc", $e6794, $e681d - $e6794

IntroSuicuneCloseGFX: ; e681d
INCBIN "gfx/intro/suicune_close.lz"
; e6c37

INCBIN "baserom.gbc", $e6c37, $e6c3d - $e6c37

IntroTilemap012: ; e6c3d
INCBIN "gfx/intro/012.lz"
; e6d0a

INCBIN "baserom.gbc", $e6d0a, $e6d0d - $e6d0a

IntroTilemap011: ; e6d0d
INCBIN "gfx/intro/011.lz"
; e6d65

INCBIN "baserom.gbc", $e6d65, $e6ded - $e6d65

IntroSuicuneJumpGFX: ; e6ded
INCBIN "gfx/intro/suicune_jump.lz"
; e72a7

INCBIN "baserom.gbc", $e72a7, $e72ad - $e72a7

IntroSuicuneBackGFX: ; e72ad
INCBIN "gfx/intro/suicune_back.lz"
; e7648

INCBIN "baserom.gbc", $e7648, $e764d - $e7648

IntroTilemap010: ; e764d
INCBIN "gfx/intro/010.lz"
; e76a0

INCBIN "baserom.gbc", $e76a0, $e76ad - $e76a0

IntroTilemap009: ; e76ad
INCBIN "gfx/intro/009.lz"
; e76bb

INCBIN "baserom.gbc", $e76bb, $e76bd - $e76bb

IntroTilemap014: ; e76bd
INCBIN "gfx/intro/014.lz"
; e778b

INCBIN "baserom.gbc", $e778b, $e778d - $e778b

IntroTilemap013: ; e778d
INCBIN "gfx/intro/013.lz"
; e77d9

INCBIN "baserom.gbc", $e77d9, $e785d - $e77d9

IntroUnownBackGFX: ; e785d
INCBIN "gfx/intro/unown_back.lz"
; e799a

INCBIN "baserom.gbc", $e799a, $e7a70 - $e799a


; ================================================================
;           Sound engine and music/sound effect pointers
SECTION "bank3A",DATA,BANK[$3A]


; The sound engine. Interfaces are in bank 0
INCLUDE "audio/engine.asm"

; What music plays when a trainer notices you
INCLUDE "audio/trainer_encounters.asm"

; Pointer table for all 103 songs
Music: INCLUDE "audio/music_pointers.asm"

; Empty song
Music_Nothing: INCLUDE "audio/music/nothing.asm"

; Pointer table for all 68 base cries
Cries: INCLUDE "audio/cry_pointers.asm"

; Pointer table for all 207 sfx
SFX: INCLUDE "audio/sfx_pointers.asm"


;                            Songs I

Music_Route36:              INCLUDE "audio/music/route36.asm"
Music_RivalBattle:          INCLUDE "audio/music/rivalbattle.asm"
Music_RocketBattle:         INCLUDE "audio/music/rocketbattle.asm"
Music_ElmsLab:              INCLUDE "audio/music/elmslab.asm"
Music_DarkCave:             INCLUDE "audio/music/darkcave.asm"
Music_JohtoGymBattle:       INCLUDE "audio/music/johtogymleaderbattle.asm"
Music_ChampionBattle:       INCLUDE "audio/music/championbattle.asm"
Music_SSAqua:               INCLUDE "audio/music/ssaqua.asm"
Music_NewBarkTown:          INCLUDE "audio/music/newbarktown.asm"
Music_GoldenrodCity:        INCLUDE "audio/music/goldenrodcity.asm"
Music_VermilionCity:        INCLUDE "audio/music/vermilioncity.asm"
Music_TitleScreen:          INCLUDE "audio/music/titlescreen.asm"
Music_RuinsOfAlphInterior:  INCLUDE "audio/music/ruinsofalphinterior.asm"
Music_LookPokemaniac:       INCLUDE "audio/music/lookpokemaniac.asm"
Music_TrainerVictory:       INCLUDE "audio/music/trainervictory.asm"


SECTION "bank3B",DATA,BANK[$3B]

;                           Songs II

Music_Route1:               INCLUDE "audio/music/route1.asm"
Music_Route3:               INCLUDE "audio/music/route3.asm"
Music_Route12:              INCLUDE "audio/music/route12.asm"
Music_KantoGymBattle:       INCLUDE "audio/music/kantogymleaderbattle.asm"
Music_KantoTrainerBattle:   INCLUDE "audio/music/kantotrainerbattle.asm"
Music_KantoWildBattle:      INCLUDE "audio/music/kantowildpokemonbattle.asm"
Music_PokemonCenter:        INCLUDE "audio/music/pokemoncenter.asm"
Music_LookLass:             INCLUDE "audio/music/looklass.asm"
Music_LookOfficer:          INCLUDE "audio/music/lookofficer.asm"
Music_Route2:               INCLUDE "audio/music/route2.asm"
Music_MtMoon:               INCLUDE "audio/music/mtmoon.asm"
Music_ShowMeAround:         INCLUDE "audio/music/showmearound.asm"
Music_GameCorner:           INCLUDE "audio/music/gamecorner.asm"
Music_Bicycle:              INCLUDE "audio/music/bicycle.asm"
Music_LookSage:             INCLUDE "audio/music/looksage.asm"
Music_PokemonChannel:       INCLUDE "audio/music/pokemonchannel.asm"
Music_Lighthouse:           INCLUDE "audio/music/lighthouse.asm"
Music_LakeOfRage:           INCLUDE "audio/music/lakeofrage.asm"
Music_IndigoPlateau:        INCLUDE "audio/music/indigoplateau.asm"
Music_Route37:              INCLUDE "audio/music/route37.asm"
Music_RocketHideout:        INCLUDE "audio/music/rockethideout.asm"
Music_DragonsDen:           INCLUDE "audio/music/dragonsden.asm"
Music_RuinsOfAlphRadio:     INCLUDE "audio/music/ruinsofalphradiosignal.asm"
Music_LookBeauty:           INCLUDE "audio/music/lookbeauty.asm"
Music_Route26:              INCLUDE "audio/music/route26.asm"
Music_EcruteakCity:         INCLUDE "audio/music/ecruteakcity.asm"
Music_LakeOfRageRocketRadio:INCLUDE "audio/music/lakeofragerocketsradiosignal.asm"
Music_MagnetTrain:          INCLUDE "audio/music/magnettrain.asm"
Music_LavenderTown:         INCLUDE "audio/music/lavendertown.asm"
Music_DancingHall:          INCLUDE "audio/music/dancinghall.asm"
Music_ContestResults:       INCLUDE "audio/music/bugcatchingcontestresults.asm"
Music_Route30:              INCLUDE "audio/music/route30.asm"

SECTION "bank3C",DATA,BANK[$3C]

;                          Songs III

Music_VioletCity:           INCLUDE "audio/music/violetcity.asm"
Music_Route29:              INCLUDE "audio/music/route29.asm"
Music_HallOfFame:           INCLUDE "audio/music/halloffame.asm"
Music_HealPokemon:          INCLUDE "audio/music/healpokemon.asm"
Music_Evolution:            INCLUDE "audio/music/evolution.asm"
Music_Printer:              INCLUDE "audio/music/printer.asm"

INCBIN "baserom.gbc", $f0941, $f2787 - $f0941

CryHeaders:
INCLUDE "audio/cry_headers.asm"

INCBIN "baserom.gbc", $f2d69, $f3fb6 - $f2d69


SECTION "bank3D",DATA,BANK[$3D]

;                           Songs IV

Music_ViridianCity:         INCLUDE "audio/music/viridiancity.asm"
Music_CeladonCity:          INCLUDE "audio/music/celadoncity.asm"
Music_WildPokemonVictory:   INCLUDE "audio/music/wildpokemonvictory.asm"
Music_SuccessfulCapture:    INCLUDE "audio/music/successfulcapture.asm"
Music_GymLeaderVictory:     INCLUDE "audio/music/gymleadervictory.asm"
Music_MtMoonSquare:         INCLUDE "audio/music/mtmoonsquare.asm"
Music_Gym:                  INCLUDE "audio/music/gym.asm"
Music_PalletTown:           INCLUDE "audio/music/pallettown.asm"
Music_ProfOaksPokemonTalk:  INCLUDE "audio/music/profoakspokemontalk.asm"
Music_ProfOak:              INCLUDE "audio/music/profoak.asm"
Music_LookRival:            INCLUDE "audio/music/lookrival.asm"
Music_AfterTheRivalFight:   INCLUDE "audio/music/aftertherivalfight.asm"
Music_Surf:                 INCLUDE "audio/music/surf.asm"
Music_NationalPark:         INCLUDE "audio/music/nationalpark.asm"
Music_AzaleaTown:           INCLUDE "audio/music/azaleatown.asm"
Music_CherrygroveCity:      INCLUDE "audio/music/cherrygrovecity.asm"
Music_UnionCave:            INCLUDE "audio/music/unioncave.asm"
Music_JohtoWildBattle:      INCLUDE "audio/music/johtowildpokemonbattle.asm"
Music_JohtoWildBattleNight: INCLUDE "audio/music/johtowildpokemonbattlenight.asm"
Music_JohtoTrainerBattle:   INCLUDE "audio/music/johtotrainerbattle.asm"
Music_LookYoungster:        INCLUDE "audio/music/lookyoungster.asm"
Music_TinTower:             INCLUDE "audio/music/tintower.asm"
Music_SproutTower:          INCLUDE "audio/music/sprouttower.asm"
Music_BurnedTower:          INCLUDE "audio/music/burnedtower.asm"
Music_Mom:                  INCLUDE "audio/music/mom.asm"
Music_VictoryRoad:          INCLUDE "audio/music/victoryroad.asm"
Music_PokemonLullaby:       INCLUDE "audio/music/pokemonlullaby.asm"
Music_PokemonMarch:         INCLUDE "audio/music/pokemonmarch.asm"
Music_GoldSilverOpening:    INCLUDE "audio/music/goldsilveropening.asm"
Music_GoldSilverOpening2:   INCLUDE "audio/music/goldsilveropening2.asm"
Music_LookHiker:            INCLUDE "audio/music/lookhiker.asm"
Music_LookRocket:           INCLUDE "audio/music/lookrocket.asm"
Music_RocketTheme:          INCLUDE "audio/music/rockettheme.asm"
Music_MainMenu:             INCLUDE "audio/music/mainmenu.asm"
Music_LookKimonoGirl:       INCLUDE "audio/music/lookkimonogirl.asm"
Music_PokeFluteChannel:     INCLUDE "audio/music/pokeflutechannel.asm"
Music_BugCatchingContest:   INCLUDE "audio/music/bugcatchingcontest.asm"

SECTION "bank3E",DATA,BANK[$3E]

FontExtra:
INCBIN "gfx/misc/font_extra.2bpp", $0, $200

Font:
INCBIN "gfx/misc/font.1bpp", $0, $400

FontBattleExtra:
INCBIN "gfx/misc/font_battle_extra.2bpp", $0, $200

INCBIN "baserom.gbc", $f8800, $f8ba0 - $f8800

TownMapGFX: ; f8ba0
INCBIN "gfx/misc/town_map.lz"
; f8ea3

INCBIN "baserom.gbc", $f8ea3, $fbbfc - $f8ea3

INCLUDE "battle/magikarp_length.asm"

INCBIN "baserom.gbc", $fbccf, $fbda4 - $fbccf


DoWeatherModifiers: ; fbda4

	ld de, .WeatherTypeModifiers
	ld a, [Weather]
	ld b, a
	ld a, [$d265] ; move type
	ld c, a

.CheckWeatherType
	ld a, [de]
	inc de
	cp $ff
	jr z, .asm_fbdc0

	cp b
	jr nz, .NextWeatherType

	ld a, [de]
	cp c
	jr z, .ApplyModifier

.NextWeatherType
	inc de
	inc de
	jr .CheckWeatherType


.asm_fbdc0
	ld de, .WeatherMoveModifiers

	ld a, BATTLE_VARS_MOVE_EFFECT
	call CleanGetBattleVarPair
	ld c, a

.CheckWeatherMove
	ld a, [de]
	inc de
	cp $ff
	jr z, .done

	cp b
	jr nz, .NextWeatherMove

	ld a, [de]
	cp c
	jr z, .ApplyModifier

.NextWeatherMove
	inc de
	inc de
	jr .CheckWeatherMove

.ApplyModifier
	xor a
	ld [$ffb4], a
	ld hl, CurDamage
	ld a, [hli]
	ld [$ffb5], a
	ld a, [hl]
	ld [$ffb6], a

	inc de
	ld a, [de]
	ld [$ffb7], a

	call Multiply

	ld a, 10
	ld [$ffb7], a
	ld b, $4
	call Divide

	ld a, [$ffb4]
	and a
	ld bc, $ffff
	jr nz, .Update

	ld a, [$ffb5]
	ld b, a
	ld a, [$ffb6]
	ld c, a
	or b
	jr nz, .Update

	ld bc, 1

.Update
	ld a, b
	ld [CurDamage], a
	ld a, c
	ld [CurDamage + 1], a

.done
	ret

.WeatherTypeModifiers
	db WEATHER_RAIN, WATER, 15
	db WEATHER_RAIN, FIRE,  05
	db WEATHER_SUN,  FIRE,  15
	db WEATHER_SUN,  WATER, 05
	db $ff

.WeatherMoveModifiers
	db WEATHER_RAIN, EFFECT_SOLARBEAM, 05
	db $ff
; fbe24


DoBadgeTypeBoosts: ; fbe24
	ld a, [InLinkBattle]
	and a
	ret nz

	ld a, [$cfc0]
	and a
	ret nz

	ld a, [hBattleTurn]
	and a
	ret nz

	push de
	push bc

	ld hl, .BadgeTypes

	ld a, [KantoBadges]
	ld b, a
	ld a, [JohtoBadges]
	ld c, a

.CheckBadge
	ld a, [hl]
	cp $ff
	jr z, .done

	srl b
	rr c
	jr nc, .NextBadge

	ld a, [$d265] ; move type
	cp [hl]
	jr z, .ApplyBoost

.NextBadge
	inc hl
	jr .CheckBadge

.ApplyBoost
	ld a, [CurDamage]
	ld h, a
	ld d, a
	ld a, [CurDamage + 1]
	ld l, a
	ld e, a

	srl d
	rr e
	srl d
	rr e
	srl d
	rr e

	ld a, e
	or d
	jr nz, .asm_fbe6f
	ld e, 1

.asm_fbe6f
	add hl, de
	jr nc, .Update

	ld hl, $ffff

.Update
	ld a, h
	ld [CurDamage], a
	ld a, l
	ld [$d257], a

.done
	pop bc
	pop de
	ret

.BadgeTypes
	db FLYING   ; zephyrbadge
	db BUG      ; hivebadge
	db NORMAL   ; plainbadge
	db GHOST    ; fogbadge
	db STEEL    ; mineralbadge
	db FIGHTING ; stormbadge
	db ICE      ; glacierbadge
	db DRAGON   ; risingbadge

	db ROCK     ; boulderbadge
	db WATER    ; cascadebadge
	db ELECTRIC ; thunderbadge
	db GRASS    ; rainbowbadge
	db POISON   ; soulbadge
	db PSYCHIC  ; marshbadge
	db FIRE     ; volcanobadge
	db GROUND   ; earthbadge
	db $ff
; fbe91


SECTION "bank3F",DATA,BANK[$3F]

DoTileAnimation: ; fc000
; Iterate over a given pointer array of animation functions
; (one per frame).
; Typically in wra1, vra0

; Beginning of animation pointer array
	ld a, [TileSetAnim]
	ld e, a
	ld a, [TileSetAnim + 1]
	ld d, a

; Play this frame.
	ld a, [hTileAnimFrame] ; frame count
	ld l, a
	inc a
	ld [hTileAnimFrame], a
	
; Each pointer has:
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de

; 2-byte parameter (all functions take input de)
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	
; Function address
	ld a, [hli]
	ld h, [hl]
	ld l, a
	
	jp [hl]
; fc01b

Tileset00Anim: ; 0xfc01b
Tileset02Anim: ; 0xfc01b
Tileset03Anim: ; 0xfc01b
;	   param, function
	dw $9140, AnimateWaterTile
	dw $0000, WaitTileAnimation
	dw $0000, WaitTileAnimation
	dw $0000, WaitTileAnimation
	dw $0000, TileAnimationPalette
	dw $0000, WaitTileAnimation
	dw $0000, AnimateFlowerTile
	dw $0000, WaitTileAnimation
	dw $0000, WaitTileAnimation
	dw $0000, NextTileFrame8
	dw $0000, DoneTileAnimation
; 0xfc047

Tileset25Anim: ; 0xfc047
;	   param, function
	dw $9140, AnimateWaterTile
	dw $0000, WaitTileAnimation
	dw $95f0, $4387
	dw $0000, WaitTileAnimation
	dw $0000, TileAnimationPalette
	dw $0000, WaitTileAnimation
	dw $0000, AnimateFlowerTile
	dw $0000, WaitTileAnimation
	dw $0000, WaitTileAnimation
	dw $0000, NextTileFrame8
	dw $0000, DoneTileAnimation
; 0xfc073

Tileset31Anim: ; 0xfc073
;	   param, function
	dw $0000, $445c
	dw $0000, $44c4
	dw $0000, WaitTileAnimation
	dw $0000, WaitTileAnimation
	dw $0000, WaitTileAnimation
	dw $0000, $44f2
	dw $0000, $451c
	dw $0000, AnimateFlowerTile
	dw $9140, AnimateWaterTile
	dw $0000, TileAnimationPalette
	dw $0000, NextTileFrame8
	dw $0000, DoneTileAnimation
; 0xfc0a3

Tileset01Anim: ; 0xfc0a3
;	   param, function
	dw $9140, AnimateWaterTile
	dw $0000, WaitTileAnimation
	dw $0000, WaitTileAnimation
	dw $0000, TileAnimationPalette
	dw $0000, WaitTileAnimation
	dw $0000, AnimateFlowerTile
	dw $4a98, AnimateWhirlpoolTile
	dw $4a9c, AnimateWhirlpoolTile
	dw $4aa0, AnimateWhirlpoolTile
	dw $4aa4, AnimateWhirlpoolTile
	dw $0000, WaitTileAnimation
	dw $0000, NextTileFrame8
	dw $0000, DoneTileAnimation
; 0xfc0d7

INCBIN "baserom.gbc", $fc0d7, $fc12f-$fc0d7

Tileset09Anim: ; 0xfc12f
;	   param, function
	dw $9140, AnimateWaterTile
	dw $0000, WaitTileAnimation
	dw $0000, WaitTileAnimation
	dw $0000, WaitTileAnimation
	dw $0000, WaitTileAnimation
	dw $0000, TileAnimationPalette
	dw $0000, WaitTileAnimation
	dw $0000, WaitTileAnimation
	dw $0000, WaitTileAnimation
	dw $0000, WaitTileAnimation
	dw $0000, NextTileFrame8
	dw $0000, DoneTileAnimation
; 0xfc15f

Tileset15Anim: ; 0xfc15f
;	   param, function
	dw $0000, $45eb
	dw $0000, WaitTileAnimation
	dw $0000, WaitTileAnimation
	dw $0000, WaitTileAnimation
	dw $0000, $45cc
	dw $0000, WaitTileAnimation
	dw $0000, NextTileFrame8
	dw $0000, DoneTileAnimation
; 0xfc17f

INCBIN "baserom.gbc", $fc17f, $fc1e7-$fc17f

Tileset24Anim: ; 0xfc1e7
Tileset30Anim: ; 0xfc1e7
;	   param, function
	dw $9140, $46a2
	dw $0000, $471e
	dw $cf41, $4309
	dw $0000, $471e
	dw $9140, $4696
	dw $0000, $471e
	dw $0000, TileAnimationPalette
	dw $0000, $471e
	dw $9400, $46a2
	dw $0000, $471e
	dw $cf41, $436a
	dw $0000, $471e
	dw $cf41, $436a
	dw $0000, $471e
	dw $cf41, $436a
	dw $0000, $471e
	dw $9400, $4696
	dw $0000, $471e
	dw $0000, DoneTileAnimation
; 0xfc233

Tileset29Anim: ; 0xfc233
;	   param, function
	dw $9350, $46a2
	dw $0000, $471e
	dw $cf41, $4309
	dw $0000, $471e
	dw $9350, $4696
	dw $0000, $471e
	dw $0000, TileAnimationPalette
	dw $0000, $471e
	dw $9310, $46a2
	dw $0000, $471e
	dw $cf41, $436a
	dw $0000, $471e
	dw $cf41, $436a
	dw $0000, $471e
	dw $cf41, $436a
	dw $0000, $471e
	dw $9310, $4696
	dw $0000, $471e
	dw $0000, DoneTileAnimation
; 0xfc27f

Tileset23Anim: ; 0xfc27f
;	   param, function
	dw $4770, $4645
	dw $4774, $4645
	dw $4768, $4645
	dw $476c, $4645
	dw $4760, $4645
	dw $4764, $4645
	dw $4758, $4645
	dw $475c, $4645
	dw $4750, $4645
	dw $4754, $4645
	dw $0000, NextTileFrame
	dw $0000, WaitTileAnimation
	dw $0000, WaitTileAnimation
	dw $0000, WaitTileAnimation
	dw $0000, WaitTileAnimation
	dw $0000, DoneTileAnimation
; 0xfc2bf

INCBIN "baserom.gbc", $fc2bf, $fc2e7-$fc2bf

Tileset04Anim: ; 0xfc2e7
Tileset05Anim: ; 0xfc2e7
Tileset06Anim: ; 0xfc2e7
Tileset07Anim: ; 0xfc2e7
Tileset08Anim: ; 0xfc2e7
Tileset10Anim: ; 0xfc2e7
Tileset11Anim: ; 0xfc2e7
Tileset12Anim: ; 0xfc2e7
Tileset13Anim: ; 0xfc2e7
Tileset14Anim: ; 0xfc2e7
Tileset16Anim: ; 0xfc2e7
Tileset17Anim: ; 0xfc2e7
Tileset18Anim: ; 0xfc2e7
Tileset19Anim: ; 0xfc2e7
Tileset20Anim: ; 0xfc2e7
Tileset21Anim: ; 0xfc2e7
Tileset22Anim: ; 0xfc2e7
Tileset26Anim: ; 0xfc2e7
Tileset27Anim: ; 0xfc2e7
Tileset28Anim: ; 0xfc2e7
Tileset32Anim: ; 0xfc2e7
Tileset33Anim: ; 0xfc2e7
Tileset34Anim: ; 0xfc2e7
Tileset35Anim: ; 0xfc2e7
Tileset36Anim: ; 0xfc2e7
;	   param, function
	dw $0000, WaitTileAnimation
	dw $0000, WaitTileAnimation
	dw $0000, WaitTileAnimation
	dw $0000, WaitTileAnimation
	dw $0000, DoneTileAnimation
; 0xfc2fb

DoneTileAnimation: ; fc2fb
; Reset the animation command loop.
	xor a
	ld [hTileAnimFrame], a
	
WaitTileAnimation: ; fc2fe
; Do nothing this frame.
	ret
; fc2ff

NextTileFrame8: ; fc2ff
	ld a, [TileAnimationTimer]
	inc a
	and a, 7
	ld [TileAnimationTimer], a
	ret
; fc309

INCBIN "baserom.gbc", $fc309, $fc402 - $fc309

AnimateWaterTile: ; fc402
; Draw a water tile for the current frame in VRAM tile at de.

; Save sp in bc (see WriteTile).
	ld hl, [sp+0]
	ld b, h
	ld c, l
	
	ld a, [TileAnimationTimer]
	
; 4 tile graphics, updated every other frame.
	and 3 << 1
	
; 2 x 8 = 16 bytes per tile
	add a
	add a
	add a
	
	add WaterTileFrames % $100
	ld l, a
	ld a, 0
	adc WaterTileFrames / $100
	ld h, a
	
; Stack now points to the start of the tile for this frame.
	ld sp, hl
	
	ld l, e
	ld h, d
	
	jp WriteTile
; fc41c

WaterTileFrames: ; fc41c
; Frames 0-3
; INCBIN "gfx/tilesets/water.2bpp"
INCBIN "baserom.gbc", $fc41c, $fc45c - $fc41c
; fc45c

INCBIN "baserom.gbc", $fc45c, $fc56d - $fc45c

AnimateFlowerTile: ; fc56d
; No parameters.

; Save sp in bc (see WriteTile).
	ld hl, [sp+0]
	ld b, h
	ld c, l
	
; Alternate tile graphc every other frame
	ld a, [TileAnimationTimer]
	and 1 << 1
	ld e, a
	
; CGB has different color mappings for flowers.
	ld a, [hCGB]
	and 1
	
	add e
	swap a ; << 4 (16 bytes)
	ld e, a
	ld d, 0
	ld hl, FlowerTileFrames
	add hl, de
	ld sp, hl
	
	ld hl, VTiles2 + $30 ; tile 4
	
	jp WriteTile
; fc58c

FlowerTileFrames: ; fc58c
; frame 0 dmg
; frame 0 cgb
; frame 1 dmg
; frame 1 sgb
; INCBIN "gfx/tilesets/flower.2bpp"
INCBIN "baserom.gbc", $fc58c, $fc5cc - $fc58c
; fc5cc

INCBIN "baserom.gbc", $fc5cc, $fc673 - $fc5cc

NextTileFrame: ; fc673
	ld hl, TileAnimationTimer
	inc [hl]
	ret
; fc678


AnimateWhirlpoolTile: ; fc678
; Update whirlpool tile using struct at de.

; Struct:
; 	VRAM address
;	Address of the first tile

; Only does one of 4 tiles at a time.

; Save sp in bc (see WriteTile).
	ld hl, [sp+0]
	ld b, h
	ld c, l
	
; de = VRAM address
	ld l, e
	ld h, d
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
; Tile address is now at hl.
	
; Get the tile for this frame.
	ld a, [TileAnimationTimer]
	and %11 ; 4 frames x2
	swap a  ; * 16 bytes per tile
	
	add [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld a, 0
	adc h
	ld h, a
	
; Stack now points to the desired frame.
	ld sp, hl
	
	ld l, e
	ld h, d
	
	jr WriteTile
; fc696
	
	
WriteTileFromBuffer: ; fc696
; Write tiledata at $cf41 to de.
; $cf41 is loaded to sp for WriteTile.

	ld hl, [sp+0]
	ld b, h
	ld c, l
	
	ld hl, $cf41
	ld sp, hl
	
	ld h, d
	ld l, e
	jr WriteTile
; fc6a2
	
	
WriteTileToBuffer: ; fc6a2
; Write tiledata de to $cf41.
; de is loaded to sp for WriteTile.

	ld hl, [sp+0]
	ld b, h
	ld c, l
	
	ld h, d
	ld l, e
	ld sp, hl
	
	ld hl, $cf41
	
	; fallthrough

WriteTile: ; fc6ac
; Write one 8x8 tile ($10 bytes) from sp to hl.

; Warning: sp is saved in bc so we can abuse pop.
; sp is restored to address bc. Save sp in bc before calling.

	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	
rept 7
	pop de
	inc hl
	ld [hl], e
	inc hl
	ld [hl], d
endr
	
; restore sp
	ld h, b
	ld l, c
	ld sp, hl
	ret
; fc6d7


TileAnimationPalette: ; fc6d7
; Transition between color values 0-2 for color 0 in palette 3.

; No palette changes on DMG.
	ld a, [hCGB]
	and a
	ret z
	
; We don't want to mess with non-standard palettes.
	ld a, [$ff47] ; BGP
	cp %11100100
	ret nz
	
; Only update on even frames.
	ld a, [TileAnimationTimer]
	ld l, a
	and 1 ; odd
	ret nz
	
; Ready for BGPD input...
	ld a, %10011000 ; auto increment, index $18 (pal 3 color 0)
	ld [rBGPI], a
	
	ld a, [rSVBK]
	push af
	ld a, 5 ; wra5: gfx
	ld [rSVBK], a
	
; Update color 0 in order 0 1 2 1
	
	ld a, l
	and %110 ; frames 0 2 4 6
	
	jr z, .color0
	
	cp 4
	jr z, .color2
	
.color1
	ld hl, $d01a ; pal 3 color 1
	ld a, [hli]
	ld [rBGPD], a
	ld a, [hli]
	ld [rBGPD], a
	jr .end
	
.color0
	ld hl, $d018 ; pal 3 color 0
	ld a, [hli]
	ld [rBGPD], a
	ld a, [hli]
	ld [rBGPD], a
	jr .end
	
.color2
	ld hl, $d01c ; pal 3 color 2
	ld a, [hli]
	ld [rBGPD], a
	ld a, [hli]
	ld [rBGPD], a
	
.end
	pop af
	ld [rSVBK], a
	ret
; fc71e

INCBIN "baserom.gbc", $fc71e, $fcdc2 - $fc71e

LoadTradesPointer: ; 0xfcdc2
	ld d, 0
	push de
	ld a, [$cf63]
	and $f
	swap a
	ld e, a
	ld d, $0
	ld hl, Trades
	add hl, de
	add hl, de
	pop de
	add hl, de
	ret
; 0xfcdd7

INCBIN "baserom.gbc", $fcdd7, $fce58-$fcdd7

Trades: ; 0xfce58
; byte 1: dialog
; byte 2: givemon
; byte 3: getmon
; bytes 4-14 nickname
; bytes 15-16 DVs
; byte 17 held item
; bytes 18-19 ID
; bytes 20-30 OT name
; byte 31 gender
; byte 32 XXX always zero?

	db 0,ABRA,MACHOP,"MUSCLE@@@@@", $37, $66,GOLD_BERRY, $54, $92,"MIKE@@@@@@@",0,0
	db 0,BELLSPROUT,ONIX,"ROCKY@@@@@@", $96, $66,BITTER_BERRY, $1e, $bf,"KYLE@@@@@@@",0,0
	db 1,KRABBY,VOLTORB,"VOLTY@@@@@@", $98, $88,PRZCUREBERRY, $05, $72,"TIM@@@@@@@@",0,0
	db 3,DRAGONAIR,DODRIO,"DORIS@@@@@@", $77, $66,SMOKE_BALL, $1b, $01,"EMY@@@@@@@@",2,0
	db 2,HAUNTER,XATU,"PAUL@@@@@@@", $96, $86,MYSTERYBERRY, $00, $3d,"CHRIS@@@@@@",0,0
	db 3,CHANSEY,AERODACTYL,"AEROY@@@@@@", $96, $66,GOLD_BERRY, $7b, $67,"KIM@@@@@@@@",0,0
	db 0,DUGTRIO,MAGNETON,"MAGGIE@@@@@", $96, $66,METAL_COAT, $a2, $c3,"FOREST@@@@@",0,0

INCBIN "baserom.gbc", $fcf38, $fd1d2-$fcf38


SECTION "bank40",DATA,BANK[$40]

INCBIN "baserom.gbc", $100000, $10389d - $100000


SECTION "bank41",DATA,BANK[$41]

INCBIN "baserom.gbc", $104000, $104350 - $104000

INCBIN "gfx/ow/misc.2bpp"

INCBIN "baserom.gbc", $1045b0, $105258 - $1045b0

MysteryGiftGFX:
INCBIN "gfx/misc/mystery_gift.2bpp"

INCBIN "baserom.gbc", $105688, $105930 - $105688

; japanese mystery gift gfx
INCBIN "gfx/misc/mystery_gift_jp.2bpp"


DisplayUsedMoveText: ; 105db0
; battle command 03
	ld hl, UsedMoveText
	call BattleTextBox
	jp WaitBGMap
; 105db9


UsedMoveText: ; 105db9

; this is a stream of text and asm from 105db9 to 105ef6

; print actor name
	text_jump _ActorNameText, BANK(_ActorNameText)
	start_asm

; ????
	ld a, [hBattleTurn]
	and a
	jr nz, .start
	
; append used move list
	ld a, [PlayerMoveAnimation]
	call UpdateUsedMoves
	
.start
; get address for last move
	ld a, $13 ; last move
	call GetBattleVarPair
	ld d, h
	ld e, l
	
; get address for last counter move
	ld a, $11
	call GetBattleVarPair
	
; get move animation (id)
	ld a, $c ; move animation
	call CleanGetBattleVarPair
	ld [$d265], a
	
; check actor ????
	push hl
	callba Function0x34548
	pop hl
	jr nz, .grammar
	
; update last move
	ld a, [$d265]
	ld [hl], a
	ld [de], a
	
.grammar
	call GetMoveGrammar
; $d265 now contains MoveGrammar
	
	
; everything except 'instead' made redundant in localization

; check obedience
	ld a, [$c6f4]
	and a
	ld hl, UsedMove2Text
	ret nz
	
; check move grammar
	ld a, [$d265]
	cp $3
	ld hl, UsedMove2Text
	ret c
	ld hl, UsedMove1Text
	ret
; 105e04

UsedMove1Text: ; 105e04
	text_jump _UsedMove1Text, BANK(_UsedMove1Text)
	start_asm
	jr Function105e10
; 105e0b

UsedMove2Text: ; 105e0b
	text_jump _UsedMove2Text, BANK(_UsedMove2Text)
	start_asm
; 105e10

Function105e10: ; 105e10
; check obedience
	ld a, [$c6f4]
	and a
	jr z, GetMoveNameText
; print "instead,"
	ld hl, UsedInsteadText
	ret
; 105e1a

UsedInsteadText: ; 105e1a
	text_jump _UsedInsteadText, BANK(_UsedInsteadText)
	start_asm
; 105e1f

GetMoveNameText: ; 105e1f
	ld hl, MoveNameText
	ret
; 105e23

MoveNameText: ; 105e23
	text_jump _MoveNameText, BANK(_MoveNameText)
	start_asm
; 105e28

GetUsedMoveTextEnder: ; 105e28
; get start address
	ld hl, .endusedmovetexts
	
; get move id
	ld a, [$d265]
	
; 2-byte pointer
	add a
	
; seek
	push bc
	ld b, $0
	ld c, a
	add hl, bc
	pop bc
	
; get pointer to usedmovetext ender
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret
; 105e39

.endusedmovetexts ; 105e39
	dw EndUsedMove1Text
	dw EndUsedMove2Text
	dw EndUsedMove3Text
	dw EndUsedMove4Text
	dw EndUsedMove5Text
; 105e43

EndUsedMove1Text: ; 105e43
	text_jump _EndUsedMove1Text, BANK(_EndUsedMove1Text)
	db "@"
; 105e48
EndUsedMove2Text: ; 105e48
	text_jump _EndUsedMove2Text, BANK(_EndUsedMove2Text)
	db "@"
; 105e4d
EndUsedMove3Text: ; 105e4d
	text_jump _EndUsedMove3Text, BANK(_EndUsedMove3Text)
	db "@"
; 105e52
EndUsedMove4Text: ; 105e52
	text_jump _EndUsedMove4Text, BANK(_EndUsedMove4Text)
	db "@"
; 105e57
EndUsedMove5Text: ; 105e57
	text_jump _EndUsedMove5Text, BANK(_EndUsedMove5Text)
	db "@"
; 105e5c


GetMoveGrammar: ; 105e5c
; store move grammar type in $d265

	push bc
; c = move id
	ld a, [$d265]
	ld c, a
	ld b, $0
	
; read grammar table
	ld hl, MoveGrammar
.loop
	ld a, [hli]
; end of table?
	cp $ff
	jr z, .end
; match?
	cp c
	jr z, .end
; advance grammar type at $00
	and a
	jr nz, .loop
; next grammar type
	inc b
	jr .loop
	
.end
; $d265 now contains move grammar
	ld a, b
	ld [$d265], a
	
; we're done
	pop bc
	ret
; 105e7a

MoveGrammar: ; 105e7a
; made redundant in localization
; each move is given an identifier for what usedmovetext to use (0-4):

; 0
	db SWORDS_DANCE
	db GROWTH
	db STRENGTH
	db HARDEN
	db MINIMIZE
	db SMOKESCREEN
	db WITHDRAW
	db DEFENSE_CURL
	db EGG_BOMB
	db SMOG
	db BONE_CLUB
	db FLASH
	db SPLASH
	db ACID_ARMOR
	db BONEMERANG
	db REST
	db SHARPEN
	db SUBSTITUTE
	db MIND_READER
	db SNORE
	db PROTECT
	db SPIKES
	db ENDURE
	db ROLLOUT
	db SWAGGER
	db SLEEP_TALK
	db HIDDEN_POWER
	db PSYCH_UP
	db EXTREMESPEED
	db 0 ; end set
	
; 1
	db RECOVER
	db TELEPORT
	db BIDE
	db SELFDESTRUCT
	db AMNESIA
	db FLAIL
	db 0 ; end set
	
; 2
	db MEDITATE
	db AGILITY
	db MIMIC
	db DOUBLE_TEAM
	db BARRAGE
	db TRANSFORM
	db STRUGGLE
	db SCARY_FACE
	db 0 ; end set
	
; 3
	db POUND
	db SCRATCH
	db VICEGRIP
	db WING_ATTACK
	db FLY
	db BIND
	db SLAM
	db HORN_ATTACK
	db WRAP
	db THRASH
	db TAIL_WHIP
	db LEER
	db BITE
	db GROWL
	db ROAR
	db SING
	db PECK
	db ABSORB
	db STRING_SHOT
	db EARTHQUAKE
	db FISSURE
	db DIG
	db TOXIC
	db SCREECH
	db METRONOME
	db LICK
	db CLAMP
	db CONSTRICT
	db POISON_GAS
	db BUBBLE
	db SLASH
	db SPIDER_WEB
	db NIGHTMARE
	db CURSE
	db FORESIGHT
	db CHARM
	db ATTRACT
	db ROCK_SMASH
	db 0 ; end set
	
; all other moves = 4
	db $ff ; end
; 105ed0


UpdateUsedMoves: ; 105ed0
; append move a to PlayerUsedMoves unless it has already been used

	push bc
; start of list
	ld hl, PlayerUsedMoves
; get move id
	ld b, a
; loop count
	ld c, NUM_MOVES
	
.loop
; get move from the list
	ld a, [hli]
; not used yet?
	and a
	jr z, .add
; already used?
	cp b
	jr z, .quit
; next byte
	dec c
	jr nz, .loop
	
; if the list is full and the move hasn't already been used
; shift the list back one byte, deleting the first move used
; this can occur with struggle or a new learned move
	ld hl, PlayerUsedMoves + 1
; 1 = 2
	ld a, [hld]
	ld [hli], a
; 2 = 3
	inc hl
	ld a, [hld]
	ld [hli], a
; 3 = 4
	inc hl
	ld a, [hld]
	ld [hl], a
; 4 = new move
	ld a, b
	ld [PlayerUsedMoves + 3], a
	jr .quit
	
.add
; go back to the byte we just inced from
	dec hl
; add the new move
	ld [hl], b
	
.quit
; list updated
	pop bc
	ret
; 105ef6



HallOfFame2: ; 0x105ef6
	ret

INCBIN "baserom.gbc", $105ef7, $106078 - $105ef7

HallOfFame1: ; 0x106078
	ret

INCBIN "baserom.gbc", $106079, $1060bb - $106079

Function1060bb: ; 1060bb
; commented out
	ret
; 1060bc

INCBIN "baserom.gbc", $1060bc, $106dbc - $1060bc


SECTION "bank42",DATA,BANK[$42]

INCBIN "baserom.gbc", $108000, $109407 - $108000

IntroLogoGFX: ; 109407
INCBIN "gfx/intro/logo.lz"
; 10983f

INCBIN "baserom.gbc", $10983f, $1099aa - $10983f

; Credits
INCLUDE "credits.asm"


SECTION "bank43",DATA,BANK[$43]

INCBIN "baserom.gbc", $10c000, $10ed67 - $10c000

StartTitleScreen: ; 10ed67

	call WhiteBGMap
	call ClearSprites
	call ClearTileMap
	
; Turn BG Map update off
	xor a
	ld [hBGMapMode], a
	
; Reset timing variables
	ld hl, $cf63
	ld [hli], a ; cf63 ; Scene?
	ld [hli], a ; cf64
	ld [hli], a ; cf65 ; Timer lo
	ld [hl], a  ; cf66 ; Timer hi
	
; Turn LCD off
	call DisableLCD
	
	
; VRAM bank 1
	ld a, 1
	ld [rVBK], a
	
	
; Decompress running Suicune gfx
	ld hl, TitleSuicuneGFX
	ld de, $8800
	call $0b50
	
	
; Clear screen palettes
	ld hl, $9800
	ld bc, $0280
	xor a
	call ByteFill
	

; Fill tile palettes:

; BG Map 1:

; line 0 (copyright)
	ld hl, $9c00
	ld bc, $0020 ; one row
	ld a, 7 ; palette
	call ByteFill


; BG Map 0:

; Apply logo gradient:

; lines 3-4
	ld hl, $9860 ; (0,3)
	ld bc, $0040 ; 2 rows
	ld a, 2
	call ByteFill
; line 5
	ld hl, $98a0 ; (0,5)
	ld bc, $0020 ; 1 row
	ld a, 3
	call ByteFill
; line 6
	ld hl, $98c0 ; (0,6)
	ld bc, $0020 ; 1 row
	ld a, 4
	call ByteFill
; line 7
	ld hl, $98e0 ; (0,7)
	ld bc, $0020 ; 1 row
	ld a, 5
	call ByteFill
; lines 8-9
	ld hl, $9900 ; (0,8)
	ld bc, $0040 ; 2 rows
	ld a, 6
	call ByteFill
	

; 'CRYSTAL VERSION'
	ld hl, $9925 ; (5,9)
	ld bc, $000b ; length of version text
	ld a, 1
	call ByteFill
	
; Suicune gfx
	ld hl, $9980 ; (0,12)
	ld bc, $00c0 ; the rest of the screen
	ld a, 8
	call ByteFill
	
	
; Back to VRAM bank 0
	ld a, $0
	ld [rVBK], a
	
	
; Decompress logo
	ld hl, TitleLogoGFX
	ld de, $8800
	call $0b50
	
; Decompress background crystal
	ld hl, TitleCrystalGFX
	ld de, $8000
	call $0b50
	
	
; Clear screen tiles
	ld hl, $9800
	ld bc, $0800
	ld a, $7f
	call ByteFill
	
; Draw Pokemon logo
	ld hl, $c4dc ; TileMap(0,3)
	ld bc, $0714 ; 20x7
	ld d, $80
	ld e, $14
	call DrawGraphic
	
; Draw copyright text
	ld hl, $9c03 ; BG Map 1 (3,0)
	ld bc, $010d ; 13x1
	ld d, $c
	ld e, $10
	call DrawGraphic
	
; Initialize running Suicune?
	ld d, $0
	call $6ed2
	
; Initialize background crystal
	call $6f06
	
; Save WRAM bank
	ld a, [rSVBK]
	push af
; WRAM bank 5
	ld a, 5
	ld [rSVBK], a
	
; Update palette colors
	ld hl, TitleScreenPalettes
	ld de, $d000
	ld bc, $0080
	call CopyBytes
	
	ld hl, TitleScreenPalettes
	ld de, $d080
	ld bc, $0080
	call CopyBytes
	
; Restore WRAM bank
	pop af
	ld [rSVBK], a
	
	
; LY/SCX trickery starts here
	
; Save WRAM bank
	ld a, [rSVBK]
	push af
; WRAM bank 5
	ld a, 5
	ld [rSVBK], a
	
; Make alternating lines come in from opposite sides

; ( This part is actually totally pointless, you can't
;   see anything until these values are overwritten!  )

	ld b, 40 ; alternate for 80 lines
	ld hl, $d100 ; LY buffer
.loop
; $00 is the middle position
	ld [hl], $70 ; coming from the left
	inc hl
	ld [hl], $90 ; coming from the right
	inc hl
	dec b
	jr nz, .loop
	
; Make sure the rest of the buffer is empty
	ld hl, $d150
	xor a
	ld bc, $0040
	call ByteFill
	
; Let LCD Stat know we're messing around with SCX
	ld a, rSCX - rJOYP
	ld [hLCDStatCustom], a
	
; Restore WRAM bank
	pop af
	ld [rSVBK], a
	
	
; Reset audio
	call ChannelsOff
	call $058a
	
; Set sprite size to 8x16
	ld a, [rLCDC]
	set 2, a
	ld [rLCDC], a
	
;
	ld a, $70
	ld [$ffcf], a
	ld a, $8
	ld [$ffd0], a
	ld a, $7
	ld [$ffd1], a
	ld a, $90
	ld [$ffd2], a
	
	ld a, $1
	ld [hCGBPalUpdate], a
	
; Update BG Map 0 (bank 0)
	ld [hBGMapMode], a
	
	xor a
	ld [$d002], a
	
; Play starting sound effect
	call SFXChannelsOff
	ld de, SFX_TITLE_SCREEN_ENTRANCE
	call StartSFX
	
	ret
; 10eea7

INCBIN "baserom.gbc", $10eea7, $10ef32 - $10eea7

AnimateTitleCrystal: ; 10ef32
; Move the title screen crystal downward until it's fully visible

; Stop at y=6
; y is really from the bottom of the sprite, which is two tiles high
	ld hl, Sprites
	ld a, [hl]
	cp 6 + 16
	ret z
	
; Move all 30 parts of the crystal down by 2
	ld c, 30
.loop
	ld a, [hl]
	add 2
	ld [hli], a
	inc hl
	inc hl
	inc hl
	dec c
	jr nz, .loop
	
	ret
; 10ef46

TitleSuicuneGFX: ; 10ef46
INCBIN "gfx/title/suicune.lz"
; 10f31b

INCBIN "baserom.gbc", $10f31b, $10f326 - $10f31b

TitleLogoGFX: ; 10f326
INCBIN "gfx/title/logo.lz"
; 10fced

INCBIN "baserom.gbc", $10fced, $10fcee - $10fced

TitleCrystalGFX: ; 10fcee
INCBIN "gfx/title/crystal.lz"
; 10fed7

INCBIN "baserom.gbc", $10fed7, $10fede - $10fed7

TitleScreenPalettes:
; BG
	RGB 00, 00, 00
	RGB 19, 00, 00
	RGB 15, 08, 31
	RGB 15, 08, 31
	
	RGB 00, 00, 00
	RGB 31, 31, 31
	RGB 15, 16, 31
	RGB 31, 01, 13
	
	RGB 00, 00, 00
	RGB 07, 07, 07
	RGB 31, 31, 31
	RGB 02, 03, 30
	
	RGB 00, 00, 00
	RGB 13, 13, 13
	RGB 31, 31, 18
	RGB 02, 03, 30
	
	RGB 00, 00, 00
	RGB 19, 19, 19
	RGB 29, 28, 12
	RGB 02, 03, 30
	
	RGB 00, 00, 00
	RGB 25, 25, 25
	RGB 28, 25, 06
	RGB 02, 03, 30
	
	RGB 00, 00, 00
	RGB 31, 31, 31
	RGB 26, 21, 00
	RGB 02, 03, 30
	
	RGB 00, 00, 00
	RGB 11, 11, 19
	RGB 31, 31, 31
	RGB 00, 00, 00
	
; OBJ
	RGB 00, 00, 00
	RGB 10, 00, 15
	RGB 17, 05, 22
	RGB 19, 09, 31
	
	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	
	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	
	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	
	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	
	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	
	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	
	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

SECTION "bank44",DATA,BANK[$44]

INCBIN "baserom.gbc", $110000, $110fad - $110000

URIPrefix: ; 0x110fad
	ascii "http://"
HTTPDownloadURL: ; 0x110fb4
	ascii "gameboy.datacenter.ne.jp/cgb/download"
HTTPUploadURL: ; 0x110fd9
	ascii "gameboy.datacenter.ne.jp/cgb/upload"
HTTPUtilityURL: ; 0x110ffc
	ascii "gameboy.datacenter.ne.jp/cgb/utility"
HTTPRankingURL: ; 0x111020
	ascii "gameboy.datacenter.ne.jp/cgb/ranking"

INCBIN "baserom.gbc", $111044, $113f84 - $111044

SECTION "bank45",DATA,BANK[$45]

INCBIN "baserom.gbc", $114000, $117a7f - $114000

; everything from here to the end of the bank is related to the
; Mobile Stadium option from the continue/newgame menu.
; XXX better function names
Function117a7f: ; 0x117a7f
	ld a, [$ffaa]
	push af
	ld a, $1
	ld [$ffaa], a
	call Function117a8d
	pop af
	ld [$ffaa], a
	ret
; 0x117a8d

Function117a8d: ; 0x117a8d
	call Function117a94
	call Function117acd
	ret
; 0x117a94

Function117a94: ; 0x117a94
	xor a
	ld [$cf63], a
	ld [$cf64], a
	ld [$cf65], a
	ld [$cf66], a
	call $31f3
	call $300b
	ld a, $5c
	ld hl, $6e78
	rst FarCall
	ld a, $41
	ld hl, $4000
	rst FarCall
	ret
; 0x117ab4

Function117ab4: ; 0x117ab4
	call $31f3
	call $300b
	ld a, $5c
	ld hl, $6e78
	rst FarCall
	ld a, $5c
	ld hl, $6eb9
	rst FarCall
	ld a, $41
	ld hl, $4061
	rst FarCall
	ret
; 0x117acd

Function117acd: ; 0x117acd
	call $0a57
	ld a, [$cf63]
	bit 7, a
	jr nz, .asm_117ae2 ; 0x117ad5 $b
	call Function117ae9
	ld a, $41
	ld hl, $4000
	rst FarCall
	jr Function117acd
.asm_117ae2
	call $31f3
	call $300b
	ret

Function117ae9: ; 0x117ae9
	ld a, [$cf63]
	ld e, a
	ld d, $0
	ld hl, Pointers117af8
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers117af8: ; 0x117af8
	dw Function117b06
	dw Function117b14
	dw Function117b28
	dw Function117b31
	dw Function117b4f
	dw Function117bb6
	dw Function117c4a

Function117b06:
	ld a, $5c
	ld hl, $6eb9
	rst FarCall
	ld a, $10
	ld [$cf64], a
	jp Function117cdd

Function117b14:
	ld hl, $cf64
	dec [hl]
	ret nz
	ld hl, Data117cbc
	call $1d35
	call $1cbb
	call $1cfd
	jp Function117cdd

Function117b28:
	ld hl, MobileStadiumEntryText
	call $1057
	jp Function117cdd

Function117b31:
	ld hl, Data117cc4
	call $1d35
	call $1cbb
	call $1cfd
	ld hl, $c550
	ld de, YesNo117ccc
	call $1078
	ld hl, $c54f
	ld a, "▶"
	ld [hl], a
	jp Function117cdd

Function117b4f:
	ld a, [hJoyPressed]
	cp $2
	jr z, .asm_117ba4 ; 0x117b53 $4f
	cp $1
	jr z, .asm_117b8c ; 0x117b57 $33
	cp $80
	jr z, .asm_117b76 ; 0x117b5b $19
	cp $40
	ret nz
	ld a, [$cf64]
	and a
	ret z
	dec a
	ld [$cf64], a
	ld hl, $c54f
	ld a, "▶"
	ld [hl], a
	ld hl, $c577
	ld a, " "
	ld [hl], a
	ret
.asm_117b76
	ld a, [$cf64]
	and a
	ret nz
	inc a
	ld [$cf64], a
	ld hl, $c54f
	ld a, " "
	ld [hl], a
	ld hl, $c577
	ld a, "▶"
	ld [hl], a
	ret
.asm_117b8c
	call $2009
	ld a, [$cf64]
	and a
	jr nz, .asm_117ba4 ; 0x117b93 $f
	call $1c07
	call $1c07
	ld a, $41
	ld hl, $4061
	rst FarCall
	jp Function117cdd
.asm_117ba4
	call $1c07
	call $1c07
	ld a, $41
	ld hl, $4061
	rst FarCall
	ld a, $80
	ld [$cf63], a
	ret

Function117bb6:
	call Function117c89
	ld a, $1
	ld [hBGMapMode], a
	ld a, $46
	ld hl, $4284
	rst FarCall
	call $300b
	ld a, [$c300]
	and a
	jr z, .asm_117be7 ; 0x117bca $1b
	cp $a
	jr z, .asm_117be1 ; 0x117bce $11
.asm_117bd0
	ld a, $2
	ld [$c303], a
	ld a, $5f
	ld hl, $7555
	rst FarCall
	ld a, $80
	ld [$cf63], a
	ret
.asm_117be1
	ld a, $80
	ld [$cf63], a
	ret
.asm_117be7
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
	ld a, [$cd89]
	and $1
	jr nz, .asm_117c16 ; 0x117bf3 $21
	ld a, [$d000]
	cp $fe
	jr nz, .asm_117c16 ; 0x117bfa $1a
	ld a, [$d001]
	cp $f
	jr nz, .asm_117c16 ; 0x117c01 $13
	ld hl, $dfec
	ld de, $cd69
	ld c, $10
.asm_117c0b
	ld a, [de]
	inc de
	cp [hl]
	jr nz, .asm_117c16 ; 0x117c0e $6
	inc hl
	dec c
	jr nz, .asm_117c0b ; 0x117c12 $f7
	jr .asm_117c20 ; 0x117c14 $a
.asm_117c16
	pop af
	ld [rSVBK], a
	ld a, $d3
	ld [$c300], a
	jr .asm_117bd0 ; 0x117c1e $b0
.asm_117c20
	pop af
	ld [rSVBK], a
	ld a, $5c
	ld hl, $6eb9
	rst FarCall
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
	ld a, $7
	call GetSRAMBank
	ld hl, $d002
	ld de, $b000
	ld bc, $1000
	call CopyBytes
	call CloseSRAM
	pop af
	ld [rSVBK], a
	jp Function117cdd

Function117c4a:
	ld hl, Data117cbc
	call $1d35
	call $1cbb
	call $1cfd
	ld a, $41
	ld hl, $4061
	rst FarCall
	ld hl, MobileStadiumSuccessText
	call $1057
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, $d000
	ld de, $0008
	ld c, $8
.asm_117c71
	push hl
	ld a, $ff
	ld [hli], a
	ld a, " "
	ld [hl], a
	pop hl
	add hl, de
	dec c
	jr nz, .asm_117c71 ; 0x117c7b $f4
	call $04b6
	pop af
	ld [rSVBK], a
	ld a, $80
	ld [$cf63], a
	ret

Function117c89:
	ld a, $7
	call GetSRAMBank
	ld l, $0
	ld h, l
	ld de, $b000
	ld bc, $0ffc
.asm_117c97
	push bc
	ld a, [de]
	inc de
	ld c, a
	ld b, $0
	add hl, bc
	pop bc
	dec bc
	ld a, b
	or c
	jr nz, .asm_117c97 ; 0x117ca2 $f3
	ld a, l
	ld [$cd83], a
	ld a, h
	ld [$cd84], a
	ld hl, $bfea
	ld de, $cd69
	ld bc, $0010
	call CopyBytes
	call CloseSRAM
	ret

Data117cbc: ; 0x117cbc
	db $40, $0c, $00, $11, $13, $00, $00, $00

Data117cc4: ; 0x117cc4
	db $40, $07, $0e, $0b, $13, $00, $00, $00 ; XXX what is this

YesNo117ccc: ; 0x117ccc
	db "はい", $4e ; Yes
	db "いいえ@"   ; No

MobileStadiumEntryText: ; 0x117cd3
	TX_FAR _MobileStadiumEntryText
	db "@"

MobileStadiumSuccessText: ; 0x117cd8
	TX_FAR _MobileStadiumSuccessText
	db "@"

Function117cdd: ; 0x117cdd
	ld hl, $cf63
	inc [hl]
	ret


SECTION "bank46",DATA,BANK[$46]

INCBIN "baserom.gbc", $118000, $118ba5 - $118000

ExchangeDownloadURL: ; 0x118ba5
	ascii "http://gameboy.datacenter.ne.jp/cgb/download?name=/01/CGB-BXTJ/exchange/index.txt"

db $0

BattleDownloadURL: ; 0x118bf7
	ascii "http://gameboy.datacenter.ne.jp/cgb/download?name=/01/CGB-BXTJ/battle/index.txt"

db $0

NewsDownloadURL: ; 0x118c47
	ascii "http://gameboy.datacenter.ne.jp/cgb/download?name=/01/CGB-BXTJ/news/index.txt"

db $0

MenuDownloadURL: ; 0x118c95
	ascii "http://gameboy.datacenter.ne.jp/cgb/download?name=/01/CGB-BXTJ/POKESTA/menu.cgb"

db $0

IndexDownloadURL: ; 0x118ce4
	ascii "http://gameboy.datacenter.ne.jp/cgb/download?name=/01/CGB-BXTJ/tamago/index.txt"

db $0

INCBIN "baserom.gbc", $118d35, $11bc9e - $118d35

SECTION "bank47",DATA,BANK[$47]

INCBIN "baserom.gbc", $11c000, $11f686 - $11c000


SECTION "bank48",DATA,BANK[$48]

PicPointers:
INCLUDE "gfx/pics/pic_pointers.asm"

;                             Pics I

HoOhFrontpic:        INCBIN "gfx/pics/250/front.lz"
MachampFrontpic:     INCBIN "gfx/pics/068/front.lz"
NinetalesFrontpic:   INCBIN "gfx/pics/038/front.lz"
FeraligatrFrontpic:  INCBIN "gfx/pics/160/front.lz"
NidokingFrontpic:    INCBIN "gfx/pics/034/front.lz"
RaikouFrontpic:      INCBIN "gfx/pics/243/front.lz"
LugiaFrontpic:       INCBIN "gfx/pics/249/front.lz"
ArticunoFrontpic:    INCBIN "gfx/pics/144/front.lz"
TaurosFrontpic:      INCBIN "gfx/pics/128/front.lz"
VenusaurFrontpic:    INCBIN "gfx/pics/003/front.lz"
EnteiFrontpic:       INCBIN "gfx/pics/244/front.lz"
SuicuneFrontpic:     INCBIN "gfx/pics/245/front.lz"
TyphlosionFrontpic:  INCBIN "gfx/pics/157/front.lz"
; 123ffa


SECTION "bank49",DATA,BANK[$49]

UnownPicPointers:
INCLUDE "gfx/pics/unown_pic_pointers.asm"

;                            Pics II

BlastoiseFrontpic:   INCBIN "gfx/pics/009/front.lz"
RapidashFrontpic:    INCBIN "gfx/pics/078/front.lz"
MeganiumFrontpic:    INCBIN "gfx/pics/154/front.lz"
NidoqueenFrontpic:   INCBIN "gfx/pics/031/front.lz"
HitmonleeFrontpic:   INCBIN "gfx/pics/106/front.lz"
ScizorFrontpic:      INCBIN "gfx/pics/212/front.lz"
BeedrillFrontpic:    INCBIN "gfx/pics/015/front.lz"
ArcanineFrontpic:    INCBIN "gfx/pics/059/front.lz"
TyranitarFrontpic:   INCBIN "gfx/pics/248/front.lz"
MoltresFrontpic:     INCBIN "gfx/pics/146/front.lz"
ZapdosFrontpic:      INCBIN "gfx/pics/145/front.lz"
ArbokFrontpic:       INCBIN "gfx/pics/024/front.lz"
MewtwoFrontpic:      INCBIN "gfx/pics/150/front.lz"
FearowFrontpic:      INCBIN "gfx/pics/022/front.lz"
CharizardFrontpic:   INCBIN "gfx/pics/006/front.lz"
QuilavaFrontpic:     INCBIN "gfx/pics/156/front.lz"
; 127ffe


SECTION "bank4a",DATA,BANK[$4a]

TrainerPicPointers:
INCLUDE "gfx/pics/trainer_pic_pointers.asm"

;                           Pics III

SteelixFrontpic:     INCBIN "gfx/pics/208/front.lz"
AlakazamFrontpic:    INCBIN "gfx/pics/065/front.lz"
GyaradosFrontpic:    INCBIN "gfx/pics/130/front.lz"
KangaskhanFrontpic:  INCBIN "gfx/pics/115/front.lz"
RhydonFrontpic:      INCBIN "gfx/pics/112/front.lz"
GolduckFrontpic:     INCBIN "gfx/pics/055/front.lz"
RhyhornFrontpic:     INCBIN "gfx/pics/111/front.lz"
PidgeotFrontpic:     INCBIN "gfx/pics/018/front.lz"
SlowbroFrontpic:     INCBIN "gfx/pics/080/front.lz"
ButterfreeFrontpic:  INCBIN "gfx/pics/012/front.lz"
WeezingFrontpic:     INCBIN "gfx/pics/110/front.lz"
CloysterFrontpic:    INCBIN "gfx/pics/091/front.lz"
SkarmoryFrontpic:    INCBIN "gfx/pics/227/front.lz"
DewgongFrontpic:     INCBIN "gfx/pics/087/front.lz"
VictreebelFrontpic:  INCBIN "gfx/pics/071/front.lz"
RaichuFrontpic:      INCBIN "gfx/pics/026/front.lz"
PrimeapeFrontpic:    INCBIN "gfx/pics/057/front.lz"
OmastarBackpic:      INCBIN "gfx/pics/139/back.lz"
; 12bffe


SECTION "bank4b",DATA,BANK[$4b]

;                            Pics IV

DodrioFrontpic:      INCBIN "gfx/pics/085/front.lz"
SlowkingFrontpic:    INCBIN "gfx/pics/199/front.lz"
HitmontopFrontpic:   INCBIN "gfx/pics/237/front.lz"
OnixFrontpic:        INCBIN "gfx/pics/095/front.lz"
BlisseyFrontpic:     INCBIN "gfx/pics/242/front.lz"
MachokeFrontpic:     INCBIN "gfx/pics/067/front.lz"
DragoniteFrontpic:   INCBIN "gfx/pics/149/front.lz"
PoliwrathFrontpic:   INCBIN "gfx/pics/062/front.lz"
ScytherFrontpic:     INCBIN "gfx/pics/123/front.lz"
AerodactylFrontpic:  INCBIN "gfx/pics/142/front.lz"
SeakingFrontpic:     INCBIN "gfx/pics/119/front.lz"
MukFrontpic:         INCBIN "gfx/pics/089/front.lz"
CroconawFrontpic:    INCBIN "gfx/pics/159/front.lz"
HypnoFrontpic:       INCBIN "gfx/pics/097/front.lz"
NidorinoFrontpic:    INCBIN "gfx/pics/033/front.lz"
SandslashFrontpic:   INCBIN "gfx/pics/028/front.lz"
JolteonFrontpic:     INCBIN "gfx/pics/135/front.lz"
DonphanFrontpic:     INCBIN "gfx/pics/232/front.lz"
PinsirFrontpic:      INCBIN "gfx/pics/127/front.lz"
UnownEFrontpic:      INCBIN "gfx/pics/201e/front.lz"
; 130000


SECTION "bank4C",DATA,BANK[$4C]

;                             Pics V

GolbatFrontpic:      INCBIN "gfx/pics/042/front.lz"
KinglerFrontpic:     INCBIN "gfx/pics/099/front.lz"
ExeggcuteFrontpic:   INCBIN "gfx/pics/102/front.lz"
MagcargoFrontpic:    INCBIN "gfx/pics/219/front.lz"
PersianFrontpic:     INCBIN "gfx/pics/053/front.lz"
StantlerFrontpic:    INCBIN "gfx/pics/234/front.lz"
RaticateFrontpic:    INCBIN "gfx/pics/020/front.lz"
VenomothFrontpic:    INCBIN "gfx/pics/049/front.lz"
PolitoedFrontpic:    INCBIN "gfx/pics/186/front.lz"
ElectabuzzFrontpic:  INCBIN "gfx/pics/125/front.lz"
MantineFrontpic:     INCBIN "gfx/pics/226/front.lz"
LickitungFrontpic:   INCBIN "gfx/pics/108/front.lz"
KingdraFrontpic:     INCBIN "gfx/pics/230/front.lz"
CharmeleonFrontpic:  INCBIN "gfx/pics/005/front.lz"
KadabraFrontpic:     INCBIN "gfx/pics/064/front.lz"
ExeggutorFrontpic:   INCBIN "gfx/pics/103/front.lz"
GastlyFrontpic:      INCBIN "gfx/pics/092/front.lz"
AzumarillFrontpic:   INCBIN "gfx/pics/184/front.lz"
ParasectFrontpic:    INCBIN "gfx/pics/047/front.lz"
MrMimeFrontpic:      INCBIN "gfx/pics/122/front.lz"
HeracrossFrontpic:   INCBIN "gfx/pics/214/front.lz"
; 133fff


SECTION "bank4d",DATA,BANK[$4d]

;                            Pics VI

AriadosFrontpic:     INCBIN "gfx/pics/168/front.lz"
NoctowlFrontpic:     INCBIN "gfx/pics/164/front.lz"
WartortleFrontpic:   INCBIN "gfx/pics/008/front.lz"
LaprasFrontpic:      INCBIN "gfx/pics/131/front.lz"
GolemFrontpic:       INCBIN "gfx/pics/076/front.lz"
PoliwhirlFrontpic:   INCBIN "gfx/pics/061/front.lz"
UrsaringFrontpic:    INCBIN "gfx/pics/217/front.lz"
HoundoomFrontpic:    INCBIN "gfx/pics/229/front.lz"
KabutopsFrontpic:    INCBIN "gfx/pics/141/front.lz"
AmpharosFrontpic:    INCBIN "gfx/pics/181/front.lz"
NidorinaFrontpic:    INCBIN "gfx/pics/030/front.lz"
FlareonFrontpic:     INCBIN "gfx/pics/136/front.lz"
FarfetchDFrontpic:   INCBIN "gfx/pics/083/front.lz"
VileplumeFrontpic:   INCBIN "gfx/pics/045/front.lz"
BayleefFrontpic:     INCBIN "gfx/pics/153/front.lz"
MagmarFrontpic:      INCBIN "gfx/pics/126/front.lz"
TentacruelFrontpic:  INCBIN "gfx/pics/073/front.lz"
ElekidFrontpic:      INCBIN "gfx/pics/239/front.lz"
JumpluffFrontpic:    INCBIN "gfx/pics/189/front.lz"
MarowakFrontpic:     INCBIN "gfx/pics/105/front.lz"
VulpixFrontpic:      INCBIN "gfx/pics/037/front.lz"
GligarFrontpic:      INCBIN "gfx/pics/207/front.lz"
DunsparceFrontpic:   INCBIN "gfx/pics/206/front.lz"
; 137fff


SECTION "bank4E",DATA,BANK[$4E]

;                           Pics VII

VaporeonFrontpic:    INCBIN "gfx/pics/134/front.lz"
GirafarigFrontpic:   INCBIN "gfx/pics/203/front.lz"
DrowzeeFrontpic:     INCBIN "gfx/pics/096/front.lz"
SneaselFrontpic:     INCBIN "gfx/pics/215/front.lz"
BellossomFrontpic:   INCBIN "gfx/pics/182/front.lz"
SnorlaxFrontpic:     INCBIN "gfx/pics/143/front.lz"
WigglytuffFrontpic:  INCBIN "gfx/pics/040/front.lz"
YanmaFrontpic:       INCBIN "gfx/pics/193/front.lz"
SmeargleFrontpic:    INCBIN "gfx/pics/235/front.lz"
ClefableFrontpic:    INCBIN "gfx/pics/036/front.lz"
PonytaFrontpic:      INCBIN "gfx/pics/077/front.lz"
MurkrowFrontpic:     INCBIN "gfx/pics/198/front.lz"
GravelerFrontpic:    INCBIN "gfx/pics/075/front.lz"
StarmieFrontpic:     INCBIN "gfx/pics/121/front.lz"
PidgeottoFrontpic:   INCBIN "gfx/pics/017/front.lz"
LedybaFrontpic:      INCBIN "gfx/pics/165/front.lz"
GengarFrontpic:      INCBIN "gfx/pics/094/front.lz"
OmastarFrontpic:     INCBIN "gfx/pics/139/front.lz"
PiloswineFrontpic:   INCBIN "gfx/pics/221/front.lz"
DugtrioFrontpic:     INCBIN "gfx/pics/051/front.lz"
MagnetonFrontpic:    INCBIN "gfx/pics/082/front.lz"
DragonairFrontpic:   INCBIN "gfx/pics/148/front.lz"
ForretressFrontpic:  INCBIN "gfx/pics/205/front.lz"
TogeticFrontpic:     INCBIN "gfx/pics/176/front.lz"
KangaskhanBackpic:   INCBIN "gfx/pics/115/back.lz"
; 13c000


SECTION "bank4f",DATA,BANK[$4f]

;                          Pics VIII

SeelFrontpic:        INCBIN "gfx/pics/086/front.lz"
CrobatFrontpic:      INCBIN "gfx/pics/169/front.lz"
ChanseyFrontpic:     INCBIN "gfx/pics/113/front.lz"
TangelaFrontpic:     INCBIN "gfx/pics/114/front.lz"
SnubbullFrontpic:    INCBIN "gfx/pics/209/front.lz"
GranbullFrontpic:    INCBIN "gfx/pics/210/front.lz"
MiltankFrontpic:     INCBIN "gfx/pics/241/front.lz"
HaunterFrontpic:     INCBIN "gfx/pics/093/front.lz"
SunfloraFrontpic:    INCBIN "gfx/pics/192/front.lz"
UmbreonFrontpic:     INCBIN "gfx/pics/197/front.lz"
ChikoritaFrontpic:   INCBIN "gfx/pics/152/front.lz"
GoldeenFrontpic:     INCBIN "gfx/pics/118/front.lz"
EspeonFrontpic:      INCBIN "gfx/pics/196/front.lz"
XatuFrontpic:        INCBIN "gfx/pics/178/front.lz"
MewFrontpic:         INCBIN "gfx/pics/151/front.lz"
OctilleryFrontpic:   INCBIN "gfx/pics/224/front.lz"
JynxFrontpic:        INCBIN "gfx/pics/124/front.lz"
WobbuffetFrontpic:   INCBIN "gfx/pics/202/front.lz"
DelibirdFrontpic:    INCBIN "gfx/pics/225/front.lz"
LedianFrontpic:      INCBIN "gfx/pics/166/front.lz"
GloomFrontpic:       INCBIN "gfx/pics/044/front.lz"
FlaaffyFrontpic:     INCBIN "gfx/pics/180/front.lz"
IvysaurFrontpic:     INCBIN "gfx/pics/002/front.lz"
FurretFrontpic:      INCBIN "gfx/pics/162/front.lz"
CyndaquilFrontpic:   INCBIN "gfx/pics/155/front.lz"
HitmonchanFrontpic:  INCBIN "gfx/pics/107/front.lz"
QuagsireFrontpic:    INCBIN "gfx/pics/195/front.lz"
; 13fff7


SECTION "bank50",DATA,BANK[$50]

;                            Pics IX

EkansFrontpic:       INCBIN "gfx/pics/023/front.lz"
SudowoodoFrontpic:   INCBIN "gfx/pics/185/front.lz"
PikachuFrontpic:     INCBIN "gfx/pics/025/front.lz"
SeadraFrontpic:      INCBIN "gfx/pics/117/front.lz"
MagbyFrontpic:       INCBIN "gfx/pics/240/front.lz"
WeepinbellFrontpic:  INCBIN "gfx/pics/070/front.lz"
TotodileFrontpic:    INCBIN "gfx/pics/158/front.lz"
CorsolaFrontpic:     INCBIN "gfx/pics/222/front.lz"
FirebreatherPic:     INCBIN "gfx/trainers/047.lz"
MachopFrontpic:      INCBIN "gfx/pics/066/front.lz"
ChinchouFrontpic:    INCBIN "gfx/pics/170/front.lz"
RattataFrontpic:     INCBIN "gfx/pics/019/front.lz"
ChampionPic:         INCBIN "gfx/trainers/015.lz"
SpearowFrontpic:     INCBIN "gfx/pics/021/front.lz"
MagikarpFrontpic:    INCBIN "gfx/pics/129/front.lz"
CharmanderFrontpic:  INCBIN "gfx/pics/004/front.lz"
CuboneFrontpic:      INCBIN "gfx/pics/104/front.lz"
BlackbeltTPic:       INCBIN "gfx/trainers/049.lz"
BikerPic:            INCBIN "gfx/trainers/044.lz"
NidoranMFrontpic:    INCBIN "gfx/pics/032/front.lz"
PorygonFrontpic:     INCBIN "gfx/pics/137/front.lz"
BrunoPic:            INCBIN "gfx/trainers/012.lz"
GrimerFrontpic:      INCBIN "gfx/pics/088/front.lz"
StaryuFrontpic:      INCBIN "gfx/pics/120/front.lz"
HikerPic:            INCBIN "gfx/trainers/043.lz"
MeowthFrontpic:      INCBIN "gfx/pics/052/front.lz"
Porygon2Frontpic:    INCBIN "gfx/pics/233/front.lz"
SandshrewFrontpic:   INCBIN "gfx/pics/027/front.lz"
NidoranFFrontpic:    INCBIN "gfx/pics/029/front.lz"
PidgeyFrontpic:      INCBIN "gfx/pics/016/front.lz"
ParasectBackpic:     INCBIN "gfx/pics/047/back.lz"
; 144000


SECTION "bank51",DATA,BANK[$51]

;                             Pics X

MisdreavusFrontpic:  INCBIN "gfx/pics/200/front.lz"
HoundourFrontpic:    INCBIN "gfx/pics/228/front.lz"
MankeyFrontpic:      INCBIN "gfx/pics/056/front.lz"
CelebiFrontpic:      INCBIN "gfx/pics/251/front.lz"
MediumPic:           INCBIN "gfx/trainers/056.lz"
PinecoFrontpic:      INCBIN "gfx/pics/204/front.lz"
KrabbyFrontpic:      INCBIN "gfx/pics/098/front.lz"
FisherPic:           INCBIN "gfx/trainers/036.lz"
JigglypuffFrontpic:  INCBIN "gfx/pics/039/front.lz"
ParasFrontpic:       INCBIN "gfx/pics/046/front.lz"
NidokingBackpic:     INCBIN "gfx/pics/034/back.lz"
PokefanmPic:         INCBIN "gfx/trainers/058.lz"
BoarderPic:          INCBIN "gfx/trainers/057.lz"
PsyduckFrontpic:     INCBIN "gfx/pics/054/front.lz"
SquirtleFrontpic:    INCBIN "gfx/pics/007/front.lz"
MachampBackpic:      INCBIN "gfx/pics/068/back.lz"
KoffingFrontpic:     INCBIN "gfx/pics/109/front.lz"
VenonatFrontpic:     INCBIN "gfx/pics/048/front.lz"
ExeggutorBackpic:    INCBIN "gfx/pics/103/back.lz"
LanturnFrontpic:     INCBIN "gfx/pics/171/front.lz"
TyrogueFrontpic:     INCBIN "gfx/pics/236/front.lz"
SkiploomFrontpic:    INCBIN "gfx/pics/188/front.lz"
MareepFrontpic:      INCBIN "gfx/pics/179/front.lz"
ChuckPic:            INCBIN "gfx/trainers/006.lz"
EeveeFrontpic:       INCBIN "gfx/pics/133/front.lz"
ButterfreeBackpic:   INCBIN "gfx/pics/012/back.lz"
ZubatFrontpic:       INCBIN "gfx/pics/041/front.lz"
KimonoGirlPic:       INCBIN "gfx/trainers/059.lz"
AlakazamBackpic:     INCBIN "gfx/pics/065/back.lz"
AipomFrontpic:       INCBIN "gfx/pics/190/front.lz"
AbraFrontpic:        INCBIN "gfx/pics/063/front.lz"
HitmontopBackpic:    INCBIN "gfx/pics/237/back.lz"
CloysterBackpic:     INCBIN "gfx/pics/091/back.lz"
HoothootFrontpic:    INCBIN "gfx/pics/163/front.lz"
UnownFBackpic:       INCBIN "gfx/pics/201f/back.lz"
; 148000


SECTION "bank52",DATA,BANK[$52]

;                            Pics XI

DodrioBackpic:       INCBIN "gfx/pics/085/back.lz"
ClefairyFrontpic:    INCBIN "gfx/pics/035/front.lz"
SlugmaFrontpic:      INCBIN "gfx/pics/218/front.lz"
GrowlitheFrontpic:   INCBIN "gfx/pics/058/front.lz"
SlowpokeFrontpic:    INCBIN "gfx/pics/079/front.lz"
SmoochumFrontpic:    INCBIN "gfx/pics/238/front.lz"
JugglerPic:          INCBIN "gfx/trainers/048.lz"
MarillFrontpic:      INCBIN "gfx/pics/183/front.lz"
GuitaristPic:        INCBIN "gfx/trainers/042.lz"
PokefanfPic:         INCBIN "gfx/trainers/061.lz"
VenomothBackpic:     INCBIN "gfx/pics/049/back.lz"
ClairPic:            INCBIN "gfx/trainers/007.lz"
PokemaniacPic:       INCBIN "gfx/trainers/029.lz"
OmanyteFrontpic:     INCBIN "gfx/pics/138/front.lz"
SkierPic:            INCBIN "gfx/trainers/032.lz"
PupitarFrontpic:     INCBIN "gfx/pics/247/front.lz"
BellsproutFrontpic:  INCBIN "gfx/pics/069/front.lz"
ShellderFrontpic:    INCBIN "gfx/pics/090/front.lz"
TentacoolFrontpic:   INCBIN "gfx/pics/072/front.lz"
CleffaFrontpic:      INCBIN "gfx/pics/173/front.lz"
GyaradosBackpic:     INCBIN "gfx/pics/130/back.lz"
NinetalesBackpic:    INCBIN "gfx/pics/038/back.lz"
YanmaBackpic:        INCBIN "gfx/pics/193/back.lz"
PinsirBackpic:       INCBIN "gfx/pics/127/back.lz"
LassPic:             INCBIN "gfx/trainers/024.lz"
ClefableBackpic:     INCBIN "gfx/pics/036/back.lz"
DoduoFrontpic:       INCBIN "gfx/pics/084/front.lz"
FeraligatrBackpic:   INCBIN "gfx/pics/160/back.lz"
DratiniFrontpic:     INCBIN "gfx/pics/147/front.lz"
MagnetonBackpic:     INCBIN "gfx/pics/082/back.lz"
QwilfishFrontpic:    INCBIN "gfx/pics/211/front.lz"
SuicuneBackpic:      INCBIN "gfx/pics/245/back.lz"
SlowkingBackpic:     INCBIN "gfx/pics/199/back.lz"
ElekidBackpic:       INCBIN "gfx/pics/239/back.lz"
CelebiBackpic:       INCBIN "gfx/pics/251/back.lz"
KrabbyBackpic:       INCBIN "gfx/pics/098/back.lz"
BugCatcherPic:       INCBIN "gfx/trainers/035.lz"
SnorlaxBackpic:      INCBIN "gfx/pics/143/back.lz"
; 14bffb


SECTION "bank53",DATA,BANK[$53]

;                           Pics XII

VenusaurBackpic:     INCBIN "gfx/pics/003/back.lz"
MoltresBackpic:      INCBIN "gfx/pics/146/back.lz"
SunfloraBackpic:     INCBIN "gfx/pics/192/back.lz"
PhanpyFrontpic:      INCBIN "gfx/pics/231/front.lz"
RhydonBackpic:       INCBIN "gfx/pics/112/back.lz"
LarvitarFrontpic:    INCBIN "gfx/pics/246/front.lz"
TyranitarBackpic:    INCBIN "gfx/pics/248/back.lz"
SandslashBackpic:    INCBIN "gfx/pics/028/back.lz"
SeadraBackpic:       INCBIN "gfx/pics/117/back.lz"
TwinsPic:            INCBIN "gfx/trainers/060.lz"
FarfetchDBackpic:    INCBIN "gfx/pics/083/back.lz"
NidoranMBackpic:     INCBIN "gfx/pics/032/back.lz"
LedybaBackpic:       INCBIN "gfx/pics/165/back.lz"
CyndaquilBackpic:    INCBIN "gfx/pics/155/back.lz"
BayleefBackpic:      INCBIN "gfx/pics/153/back.lz"
OddishFrontpic:      INCBIN "gfx/pics/043/front.lz"
RapidashBackpic:     INCBIN "gfx/pics/078/back.lz"
DoduoBackpic:        INCBIN "gfx/pics/084/back.lz"
HoppipFrontpic:      INCBIN "gfx/pics/187/front.lz"
MankeyBackpic:       INCBIN "gfx/pics/056/back.lz"
MagmarBackpic:       INCBIN "gfx/pics/126/back.lz"
HypnoBackpic:        INCBIN "gfx/pics/097/back.lz"
QuilavaBackpic:      INCBIN "gfx/pics/156/back.lz"
CroconawBackpic:     INCBIN "gfx/pics/159/back.lz"
SandshrewBackpic:    INCBIN "gfx/pics/027/back.lz"
SailorPic:           INCBIN "gfx/trainers/039.lz"
BeautyPic:           INCBIN "gfx/trainers/028.lz"
ShellderBackpic:     INCBIN "gfx/pics/090/back.lz"
ZubatBackpic:        INCBIN "gfx/pics/041/back.lz"
TeddiursaFrontpic:   INCBIN "gfx/pics/216/front.lz"
CuboneBackpic:       INCBIN "gfx/pics/104/back.lz"
GruntmPic:           INCBIN "gfx/trainers/030.lz"
GloomBackpic:        INCBIN "gfx/pics/044/back.lz"
MagcargoBackpic:     INCBIN "gfx/pics/219/back.lz"
KabutopsBackpic:     INCBIN "gfx/pics/141/back.lz"
BeedrillBackpic:     INCBIN "gfx/pics/015/back.lz"
ArcanineBackpic:     INCBIN "gfx/pics/059/back.lz"
FlareonBackpic:      INCBIN "gfx/pics/136/back.lz"
GoldeenBackpic:      INCBIN "gfx/pics/118/back.lz"
BulbasaurFrontpic:   INCBIN "gfx/pics/001/front.lz"
StarmieBackpic:      INCBIN "gfx/pics/121/back.lz"
; 150000


SECTION "bank54",DATA,BANK[$54]

;                           Pics XIII

OmanyteBackpic:      INCBIN "gfx/pics/138/back.lz"
PidgeyBackpic:       INCBIN "gfx/pics/016/back.lz"
ScientistPic:        INCBIN "gfx/trainers/019.lz"
QwilfishBackpic:     INCBIN "gfx/pics/211/back.lz"
GligarBackpic:       INCBIN "gfx/pics/207/back.lz"
TyphlosionBackpic:   INCBIN "gfx/pics/157/back.lz"
CharmeleonBackpic:   INCBIN "gfx/pics/005/back.lz"
NidoqueenBackpic:    INCBIN "gfx/pics/031/back.lz"
PichuFrontpic:       INCBIN "gfx/pics/172/front.lz"
ElectabuzzBackpic:   INCBIN "gfx/pics/125/back.lz"
LedianBackpic:       INCBIN "gfx/pics/166/back.lz"
PupitarBackpic:      INCBIN "gfx/pics/247/back.lz"
HeracrossBackpic:    INCBIN "gfx/pics/214/back.lz"
UnownDFrontpic:      INCBIN "gfx/pics/201d/front.lz"
MiltankBackpic:      INCBIN "gfx/pics/241/back.lz"
SteelixBackpic:      INCBIN "gfx/pics/208/back.lz"
PersianBackpic:      INCBIN "gfx/pics/053/back.lz"
LtSurgePic:          INCBIN "gfx/trainers/018.lz"
TeacherPic:          INCBIN "gfx/trainers/033.lz"
EggPic:              INCBIN "gfx/pics/egg/front.lz"
EeveeBackpic:        INCBIN "gfx/pics/133/back.lz"
ShuckleFrontpic:     INCBIN "gfx/pics/213/front.lz"
PonytaBackpic:       INCBIN "gfx/pics/077/back.lz"
RemoraidFrontpic:    INCBIN "gfx/pics/223/front.lz"
PoliwagFrontpic:     INCBIN "gfx/pics/060/front.lz"
OnixBackpic:         INCBIN "gfx/pics/095/back.lz"
KoffingBackpic:      INCBIN "gfx/pics/109/back.lz"
BirdKeeperPic:       INCBIN "gfx/trainers/023.lz"
FalknerPic:          INCBIN "gfx/trainers/000.lz"
KarenPic:            INCBIN "gfx/trainers/013.lz"
NidorinaBackpic:     INCBIN "gfx/pics/030/back.lz"
TentacruelBackpic:   INCBIN "gfx/pics/073/back.lz"
GrowlitheBackpic:    INCBIN "gfx/pics/058/back.lz"
KogaPic:             INCBIN "gfx/trainers/014.lz"
MachokeBackpic:      INCBIN "gfx/pics/067/back.lz"
RaichuBackpic:       INCBIN "gfx/pics/026/back.lz"
PoliwrathBackpic:    INCBIN "gfx/pics/062/back.lz"
SwimmermPic:         INCBIN "gfx/trainers/037.lz"
SunkernFrontpic:     INCBIN "gfx/pics/191/front.lz"
NidorinoBackpic:     INCBIN "gfx/pics/033/back.lz"
MysticalmanPic:      INCBIN "gfx/trainers/066.lz"
CooltrainerfPic:     INCBIN "gfx/trainers/027.lz"
ElectrodeFrontpic:   INCBIN "gfx/pics/101/front.lz"
; 153fe3


SECTION "bank55",DATA,BANK[$55]

;                           Pics XIV

SudowoodoBackpic:    INCBIN "gfx/pics/185/back.lz"
FlaaffyBackpic:      INCBIN "gfx/pics/180/back.lz"
SentretFrontpic:     INCBIN "gfx/pics/161/front.lz"
TogeticBackpic:      INCBIN "gfx/pics/176/back.lz"
BugsyPic:            INCBIN "gfx/trainers/002.lz"
MarowakBackpic:      INCBIN "gfx/pics/105/back.lz"
GeodudeBackpic:      INCBIN "gfx/pics/074/back.lz"
ScytherBackpic:      INCBIN "gfx/pics/123/back.lz"
VileplumeBackpic:    INCBIN "gfx/pics/045/back.lz"
HitmonchanBackpic:   INCBIN "gfx/pics/107/back.lz"
JumpluffBackpic:     INCBIN "gfx/pics/189/back.lz"
CooltrainermPic:     INCBIN "gfx/trainers/026.lz"
BlastoiseBackpic:    INCBIN "gfx/pics/009/back.lz"
MisdreavusBackpic:   INCBIN "gfx/pics/200/back.lz"
TyrogueBackpic:      INCBIN "gfx/pics/236/back.lz"
GeodudeFrontpic:     INCBIN "gfx/pics/074/front.lz"
ScizorBackpic:       INCBIN "gfx/pics/212/back.lz"
GirafarigBackpic:    INCBIN "gfx/pics/203/back.lz"
StantlerBackpic:     INCBIN "gfx/pics/234/back.lz"
SmeargleBackpic:     INCBIN "gfx/pics/235/back.lz"
CharizardBackpic:    INCBIN "gfx/pics/006/back.lz"
KadabraBackpic:      INCBIN "gfx/pics/064/back.lz"
PrimeapeBackpic:     INCBIN "gfx/pics/057/back.lz"
FurretBackpic:       INCBIN "gfx/pics/162/back.lz"
WartortleBackpic:    INCBIN "gfx/pics/008/back.lz"
ExeggcuteBackpic:    INCBIN "gfx/pics/102/back.lz"
IgglybuffFrontpic:   INCBIN "gfx/pics/174/front.lz"
RaticateBackpic:     INCBIN "gfx/pics/020/back.lz"
VulpixBackpic:       INCBIN "gfx/pics/037/back.lz"
EkansBackpic:        INCBIN "gfx/pics/023/back.lz"
SeakingBackpic:      INCBIN "gfx/pics/119/back.lz"
BurglarPic:          INCBIN "gfx/trainers/046.lz"
PsyduckBackpic:      INCBIN "gfx/pics/054/back.lz"
PikachuBackpic:      INCBIN "gfx/pics/025/back.lz"
KabutoFrontpic:      INCBIN "gfx/pics/140/front.lz"
MareepBackpic:       INCBIN "gfx/pics/179/back.lz"
RemoraidBackpic:     INCBIN "gfx/pics/223/back.lz"
DittoFrontpic:       INCBIN "gfx/pics/132/front.lz"
KingdraBackpic:      INCBIN "gfx/pics/230/back.lz"
CamperPic:           INCBIN "gfx/trainers/053.lz"
WooperFrontpic:      INCBIN "gfx/pics/194/front.lz"
ClefairyBackpic:     INCBIN "gfx/pics/035/back.lz"
VenonatBackpic:      INCBIN "gfx/pics/048/back.lz"
BellossomBackpic:    INCBIN "gfx/pics/182/back.lz"
Rival1Pic:           INCBIN "gfx/trainers/008.lz"
SwinubBackpic:       INCBIN "gfx/pics/220/back.lz"
; 158000


SECTION "bank56",DATA,BANK[$56]

;                            Pics XV

MewtwoBackpic:       INCBIN "gfx/pics/150/back.lz"
PokemonProfPic:      INCBIN "gfx/trainers/009.lz"
CalPic:              INCBIN "gfx/trainers/011.lz"
SwimmerfPic:         INCBIN "gfx/trainers/038.lz"
DiglettFrontpic:     INCBIN "gfx/pics/050/front.lz"
OfficerPic:          INCBIN "gfx/trainers/064.lz"
MukBackpic:          INCBIN "gfx/pics/089/back.lz"
DelibirdBackpic:     INCBIN "gfx/pics/225/back.lz"
SabrinaPic:          INCBIN "gfx/trainers/034.lz"
MagikarpBackpic:     INCBIN "gfx/pics/129/back.lz"
AriadosBackpic:      INCBIN "gfx/pics/168/back.lz"
SneaselBackpic:      INCBIN "gfx/pics/215/back.lz"
UmbreonBackpic:      INCBIN "gfx/pics/197/back.lz"
MurkrowBackpic:      INCBIN "gfx/pics/198/back.lz"
IvysaurBackpic:      INCBIN "gfx/pics/002/back.lz"
SlowbroBackpic:      INCBIN "gfx/pics/080/back.lz"
PsychicTPic:         INCBIN "gfx/trainers/051.lz"
GolduckBackpic:      INCBIN "gfx/pics/055/back.lz"
WeezingBackpic:      INCBIN "gfx/pics/110/back.lz"
EnteiBackpic:        INCBIN "gfx/pics/244/back.lz"
GruntfPic:           INCBIN "gfx/trainers/065.lz"
HorseaFrontpic:      INCBIN "gfx/pics/116/front.lz"
PidgeotBackpic:      INCBIN "gfx/pics/018/back.lz"
HoOhBackpic:         INCBIN "gfx/pics/250/back.lz"
PoliwhirlBackpic:    INCBIN "gfx/pics/061/back.lz"
MewBackpic:          INCBIN "gfx/pics/151/back.lz"
MachopBackpic:       INCBIN "gfx/pics/066/back.lz"
AbraBackpic:         INCBIN "gfx/pics/063/back.lz"
AerodactylBackpic:   INCBIN "gfx/pics/142/back.lz"
KakunaFrontpic:      INCBIN "gfx/pics/014/front.lz"
DugtrioBackpic:      INCBIN "gfx/pics/051/back.lz"
WeepinbellBackpic:   INCBIN "gfx/pics/070/back.lz"
NidoranFBackpic:     INCBIN "gfx/pics/029/back.lz"
GravelerBackpic:     INCBIN "gfx/pics/075/back.lz"
AipomBackpic:        INCBIN "gfx/pics/190/back.lz"
EspeonBackpic:       INCBIN "gfx/pics/196/back.lz"
WeedleFrontpic:      INCBIN "gfx/pics/013/front.lz"
TotodileBackpic:     INCBIN "gfx/pics/158/back.lz"
SnubbullBackpic:     INCBIN "gfx/pics/209/back.lz"
KinglerBackpic:      INCBIN "gfx/pics/099/back.lz"
GengarBackpic:       INCBIN "gfx/pics/094/back.lz"
RattataBackpic:      INCBIN "gfx/pics/019/back.lz"
YoungsterPic:        INCBIN "gfx/trainers/021.lz"
WillPic:             INCBIN "gfx/trainers/010.lz"
SchoolboyPic:        INCBIN "gfx/trainers/022.lz"
MagnemiteFrontpic:   INCBIN "gfx/pics/081/front.lz"
ErikaPic:            INCBIN "gfx/trainers/020.lz"
JaninePic:           INCBIN "gfx/trainers/025.lz"
MagnemiteBackpic:    INCBIN "gfx/pics/081/back.lz"
; 15bffa


SECTION "bank57",DATA,BANK[$57]

;                           Pics XVI

HoothootBackpic:     INCBIN "gfx/pics/163/back.lz"
NoctowlBackpic:      INCBIN "gfx/pics/164/back.lz"
MortyPic:            INCBIN "gfx/trainers/003.lz"
SlugmaBackpic:       INCBIN "gfx/pics/218/back.lz"
KabutoBackpic:       INCBIN "gfx/pics/140/back.lz"
VictreebelBackpic:   INCBIN "gfx/pics/071/back.lz"
MeowthBackpic:       INCBIN "gfx/pics/052/back.lz"
MeganiumBackpic:     INCBIN "gfx/pics/154/back.lz"
PicnickerPic:        INCBIN "gfx/trainers/052.lz"
LickitungBackpic:    INCBIN "gfx/pics/108/back.lz"
TogepiFrontpic:      INCBIN "gfx/pics/175/front.lz"
SuperNerdPic:        INCBIN "gfx/trainers/040.lz"
HaunterBackpic:      INCBIN "gfx/pics/093/back.lz"
XatuBackpic:         INCBIN "gfx/pics/178/back.lz"
RedPic:              INCBIN "gfx/trainers/062.lz"
Porygon2Backpic:     INCBIN "gfx/pics/233/back.lz"
JasminePic:          INCBIN "gfx/trainers/005.lz"
PinecoBackpic:       INCBIN "gfx/pics/204/back.lz"
MetapodFrontpic:     INCBIN "gfx/pics/011/front.lz"
SeelBackpic:         INCBIN "gfx/pics/086/back.lz"
QuagsireBackpic:     INCBIN "gfx/pics/195/back.lz"
WhitneyPic:          INCBIN "gfx/trainers/001.lz"
JolteonBackpic:      INCBIN "gfx/pics/135/back.lz"
CaterpieFrontpic:    INCBIN "gfx/pics/010/front.lz"
HoppipBackpic:       INCBIN "gfx/pics/187/back.lz"
BluePic:             INCBIN "gfx/trainers/063.lz"
GranbullBackpic:     INCBIN "gfx/pics/210/back.lz"
GentlemanPic:        INCBIN "gfx/trainers/031.lz"
ExecutivemPic:       INCBIN "gfx/trainers/050.lz"
SpearowBackpic:      INCBIN "gfx/pics/021/back.lz"
SunkernBackpic:      INCBIN "gfx/pics/191/back.lz"
LaprasBackpic:       INCBIN "gfx/pics/131/back.lz"
MagbyBackpic:        INCBIN "gfx/pics/240/back.lz"
DragonairBackpic:    INCBIN "gfx/pics/148/back.lz"
ZapdosBackpic:       INCBIN "gfx/pics/145/back.lz"
ChikoritaBackpic:    INCBIN "gfx/pics/152/back.lz"
CorsolaBackpic:      INCBIN "gfx/pics/222/back.lz"
ChinchouBackpic:     INCBIN "gfx/pics/170/back.lz"
ChanseyBackpic:      INCBIN "gfx/pics/113/back.lz"
SkiploomBackpic:     INCBIN "gfx/pics/188/back.lz"
SpinarakFrontpic:    INCBIN "gfx/pics/167/front.lz"
Rival2Pic:           INCBIN "gfx/trainers/041.lz"
UnownWFrontpic:      INCBIN "gfx/pics/201w/front.lz"
CharmanderBackpic:   INCBIN "gfx/pics/004/back.lz"
RhyhornBackpic:      INCBIN "gfx/pics/111/back.lz"
UnownCFrontpic:      INCBIN "gfx/pics/201c/front.lz"
MistyPic:            INCBIN "gfx/trainers/017.lz"
BlainePic:           INCBIN "gfx/trainers/045.lz"
UnownZFrontpic:      INCBIN "gfx/pics/201z/front.lz"
SwinubFrontpic:      INCBIN "gfx/pics/220/front.lz"
LarvitarBackpic:     INCBIN "gfx/pics/246/back.lz"
PorygonBackpic:      INCBIN "gfx/pics/137/back.lz"
UnownHBackpic:       INCBIN "gfx/pics/201h/back.lz"
; 15ffff


SECTION "bank58",DATA,BANK[$58]

;                           Pics XVII

ParasBackpic:        INCBIN "gfx/pics/046/back.lz"
VaporeonBackpic:     INCBIN "gfx/pics/134/back.lz"
TentacoolBackpic:    INCBIN "gfx/pics/072/back.lz"
ExecutivefPic:       INCBIN "gfx/trainers/054.lz"
BulbasaurBackpic:    INCBIN "gfx/pics/001/back.lz"
SmoochumBackpic:     INCBIN "gfx/pics/238/back.lz"
PichuBackpic:        INCBIN "gfx/pics/172/back.lz"
HoundoomBackpic:     INCBIN "gfx/pics/229/back.lz"
BellsproutBackpic:   INCBIN "gfx/pics/069/back.lz"
GrimerBackpic:       INCBIN "gfx/pics/088/back.lz"
LanturnBackpic:      INCBIN "gfx/pics/171/back.lz"
PidgeottoBackpic:    INCBIN "gfx/pics/017/back.lz"
StaryuBackpic:       INCBIN "gfx/pics/120/back.lz"
MrMimeBackpic:       INCBIN "gfx/pics/122/back.lz"
CaterpieBackpic:     INCBIN "gfx/pics/010/back.lz"
VoltorbFrontpic:     INCBIN "gfx/pics/100/front.lz"
LugiaBackpic:        INCBIN "gfx/pics/249/back.lz"
PrycePic:            INCBIN "gfx/trainers/004.lz"
BrockPic:            INCBIN "gfx/trainers/016.lz"
UnownGFrontpic:      INCBIN "gfx/pics/201g/front.lz"
ArbokBackpic:        INCBIN "gfx/pics/024/back.lz"
PolitoedBackpic:     INCBIN "gfx/pics/186/back.lz"
DragoniteBackpic:    INCBIN "gfx/pics/149/back.lz"
HitmonleeBackpic:    INCBIN "gfx/pics/106/back.lz"
NatuFrontpic:        INCBIN "gfx/pics/177/front.lz"
UrsaringBackpic:     INCBIN "gfx/pics/217/back.lz"
SagePic:             INCBIN "gfx/trainers/055.lz"
TeddiursaBackpic:    INCBIN "gfx/pics/216/back.lz"
PhanpyBackpic:       INCBIN "gfx/pics/231/back.lz"
UnownVFrontpic:      INCBIN "gfx/pics/201v/front.lz"
KakunaBackpic:       INCBIN "gfx/pics/014/back.lz"
WobbuffetBackpic:    INCBIN "gfx/pics/202/back.lz"
TogepiBackpic:       INCBIN "gfx/pics/175/back.lz"
CrobatBackpic:       INCBIN "gfx/pics/169/back.lz"
BlisseyBackpic:      INCBIN "gfx/pics/242/back.lz"
AmpharosBackpic:     INCBIN "gfx/pics/181/back.lz"
IgglybuffBackpic:    INCBIN "gfx/pics/174/back.lz"
AzumarillBackpic:    INCBIN "gfx/pics/184/back.lz"
OctilleryBackpic:    INCBIN "gfx/pics/224/back.lz"
UnownSFrontpic:      INCBIN "gfx/pics/201s/front.lz"
HorseaBackpic:       INCBIN "gfx/pics/116/back.lz"
SentretBackpic:      INCBIN "gfx/pics/161/back.lz"
UnownOFrontpic:      INCBIN "gfx/pics/201o/front.lz"
UnownTFrontpic:      INCBIN "gfx/pics/201t/front.lz"
WigglytuffBackpic:   INCBIN "gfx/pics/040/back.lz"
ArticunoBackpic:     INCBIN "gfx/pics/144/back.lz"
DittoBackpic:        INCBIN "gfx/pics/132/back.lz"
WeedleBackpic:       INCBIN "gfx/pics/013/back.lz"
UnownHFrontpic:      INCBIN "gfx/pics/201h/front.lz"
CleffaBackpic:       INCBIN "gfx/pics/173/back.lz"
DrowzeeBackpic:      INCBIN "gfx/pics/096/back.lz"
GastlyBackpic:       INCBIN "gfx/pics/092/back.lz"
FearowBackpic:       INCBIN "gfx/pics/022/back.lz"
MarillBackpic:       INCBIN "gfx/pics/183/back.lz"
DratiniBackpic:      INCBIN "gfx/pics/147/back.lz"
ElectrodeBackpic:    INCBIN "gfx/pics/101/back.lz"
SkarmoryBackpic:     INCBIN "gfx/pics/227/back.lz"
MetapodBackpic:      INCBIN "gfx/pics/011/back.lz"
JigglypuffBackpic:   INCBIN "gfx/pics/039/back.lz"
OddishBackpic:       INCBIN "gfx/pics/043/back.lz"
UnownDBackpic:       INCBIN "gfx/pics/201d/back.lz"
; 163ffc


SECTION "bank59",DATA,BANK[$59]

;                           Pics XVIII

SpinarakBackpic:     INCBIN "gfx/pics/167/back.lz"
RaikouBackpic:       INCBIN "gfx/pics/243/back.lz"
UnownKFrontpic:      INCBIN "gfx/pics/201k/front.lz"
HoundourBackpic:     INCBIN "gfx/pics/228/back.lz"
PoliwagBackpic:      INCBIN "gfx/pics/060/back.lz"
SquirtleBackpic:     INCBIN "gfx/pics/007/back.lz"
ShuckleBackpic:      INCBIN "gfx/pics/213/back.lz"
DewgongBackpic:      INCBIN "gfx/pics/087/back.lz"
UnownBFrontpic:      INCBIN "gfx/pics/201b/front.lz"
SlowpokeBackpic:     INCBIN "gfx/pics/079/back.lz"
DunsparceBackpic:    INCBIN "gfx/pics/206/back.lz"
DonphanBackpic:      INCBIN "gfx/pics/232/back.lz"
WooperBackpic:       INCBIN "gfx/pics/194/back.lz"
TaurosBackpic:       INCBIN "gfx/pics/128/back.lz"
UnownXFrontpic:      INCBIN "gfx/pics/201x/front.lz"
UnownNFrontpic:      INCBIN "gfx/pics/201n/front.lz"
TangelaBackpic:      INCBIN "gfx/pics/114/back.lz"
VoltorbBackpic:      INCBIN "gfx/pics/100/back.lz"
UnownJFrontpic:      INCBIN "gfx/pics/201j/front.lz"
MantineBackpic:      INCBIN "gfx/pics/226/back.lz"
UnownLFrontpic:      INCBIN "gfx/pics/201l/front.lz"
PiloswineBackpic:    INCBIN "gfx/pics/221/back.lz"
UnownMFrontpic:      INCBIN "gfx/pics/201m/front.lz"
UnownFFrontpic:      INCBIN "gfx/pics/201f/front.lz"
NatuBackpic:         INCBIN "gfx/pics/177/back.lz"
UnownAFrontpic:      INCBIN "gfx/pics/201a/front.lz"
GolemBackpic:        INCBIN "gfx/pics/076/back.lz"
UnownUFrontpic:      INCBIN "gfx/pics/201u/front.lz"
DiglettBackpic:      INCBIN "gfx/pics/050/back.lz"
UnownQFrontpic:      INCBIN "gfx/pics/201q/front.lz"
UnownPFrontpic:      INCBIN "gfx/pics/201p/front.lz"
UnownCBackpic:       INCBIN "gfx/pics/201c/back.lz"
JynxBackpic:         INCBIN "gfx/pics/124/back.lz"
GolbatBackpic:       INCBIN "gfx/pics/042/back.lz"
UnownYFrontpic:      INCBIN "gfx/pics/201y/front.lz"
UnownGBackpic:       INCBIN "gfx/pics/201g/back.lz"
UnownIFrontpic:      INCBIN "gfx/pics/201i/front.lz"
UnownVBackpic:       INCBIN "gfx/pics/201v/back.lz"
ForretressBackpic:   INCBIN "gfx/pics/205/back.lz"
UnownSBackpic:       INCBIN "gfx/pics/201s/back.lz"
UnownRFrontpic:      INCBIN "gfx/pics/201r/front.lz"
UnownEBackpic:       INCBIN "gfx/pics/201e/back.lz"
UnownJBackpic:       INCBIN "gfx/pics/201j/back.lz"
UnownBBackpic:       INCBIN "gfx/pics/201b/back.lz"
UnownOBackpic:       INCBIN "gfx/pics/201o/back.lz"
UnownZBackpic:       INCBIN "gfx/pics/201z/back.lz"
UnownWBackpic:       INCBIN "gfx/pics/201w/back.lz"
UnownNBackpic:       INCBIN "gfx/pics/201n/back.lz"
UnownABackpic:       INCBIN "gfx/pics/201a/back.lz"
UnownMBackpic:       INCBIN "gfx/pics/201m/back.lz"
UnownKBackpic:       INCBIN "gfx/pics/201k/back.lz"
UnownTBackpic:       INCBIN "gfx/pics/201t/back.lz"
UnownXBackpic:       INCBIN "gfx/pics/201x/back.lz"
UnownLBackpic:       INCBIN "gfx/pics/201l/back.lz"
UnownUBackpic:       INCBIN "gfx/pics/201u/back.lz"
UnownQBackpic:       INCBIN "gfx/pics/201q/back.lz"
UnownYBackpic:       INCBIN "gfx/pics/201y/back.lz"
UnownPBackpic:       INCBIN "gfx/pics/201p/back.lz"
UnownIBackpic:       INCBIN "gfx/pics/201i/back.lz"
UnownRBackpic:       INCBIN "gfx/pics/201r/back.lz"
; 1669d3


SECTION "bank5A",DATA,BANK[$5A]

; This bank is identical to bank 59!
; It's also unreferenced, so it's a free bank

INCBIN "gfx/pics/167/back.lz"
INCBIN "gfx/pics/243/back.lz"
INCBIN "gfx/pics/201k/front.lz"
INCBIN "gfx/pics/228/back.lz"
INCBIN "gfx/pics/060/back.lz"
INCBIN "gfx/pics/007/back.lz"
INCBIN "gfx/pics/213/back.lz"
INCBIN "gfx/pics/087/back.lz"
INCBIN "gfx/pics/201b/front.lz"
INCBIN "gfx/pics/079/back.lz"
INCBIN "gfx/pics/206/back.lz"
INCBIN "gfx/pics/232/back.lz"
INCBIN "gfx/pics/194/back.lz"
INCBIN "gfx/pics/128/back.lz"
INCBIN "gfx/pics/201x/front.lz"
INCBIN "gfx/pics/201n/front.lz"
INCBIN "gfx/pics/114/back.lz"
INCBIN "gfx/pics/100/back.lz"
INCBIN "gfx/pics/201j/front.lz"
INCBIN "gfx/pics/226/back.lz"
INCBIN "gfx/pics/201l/front.lz"
INCBIN "gfx/pics/221/back.lz"
INCBIN "gfx/pics/201m/front.lz"
INCBIN "gfx/pics/201f/front.lz"
INCBIN "gfx/pics/177/back.lz"
INCBIN "gfx/pics/201a/front.lz"
INCBIN "gfx/pics/076/back.lz"
INCBIN "gfx/pics/201u/front.lz"
INCBIN "gfx/pics/050/back.lz"
INCBIN "gfx/pics/201q/front.lz"
INCBIN "gfx/pics/201p/front.lz"
INCBIN "gfx/pics/201c/back.lz"
INCBIN "gfx/pics/124/back.lz"
INCBIN "gfx/pics/042/back.lz"
INCBIN "gfx/pics/201y/front.lz"
INCBIN "gfx/pics/201g/back.lz"
INCBIN "gfx/pics/201i/front.lz"
INCBIN "gfx/pics/201v/back.lz"
INCBIN "gfx/pics/205/back.lz"
INCBIN "gfx/pics/201s/back.lz"
INCBIN "gfx/pics/201r/front.lz"
INCBIN "gfx/pics/201e/back.lz"
INCBIN "gfx/pics/201j/back.lz"
INCBIN "gfx/pics/201b/back.lz"
INCBIN "gfx/pics/201o/back.lz"
INCBIN "gfx/pics/201z/back.lz"
INCBIN "gfx/pics/201w/back.lz"
INCBIN "gfx/pics/201n/back.lz"
INCBIN "gfx/pics/201a/back.lz"
INCBIN "gfx/pics/201m/back.lz"
INCBIN "gfx/pics/201k/back.lz"
INCBIN "gfx/pics/201t/back.lz"
INCBIN "gfx/pics/201x/back.lz"
INCBIN "gfx/pics/201l/back.lz"
INCBIN "gfx/pics/201u/back.lz"
INCBIN "gfx/pics/201q/back.lz"
INCBIN "gfx/pics/201y/back.lz"
INCBIN "gfx/pics/201p/back.lz"
INCBIN "gfx/pics/201i/back.lz"
INCBIN "gfx/pics/201r/back.lz"


SECTION "bank5B",DATA,BANK[$5B]

INCBIN "baserom.gbc", $16c000, $16d7fe - $16c000


SECTION "bank5C",DATA,BANK[$5C]

INCBIN "baserom.gbc", $170000, $17367f - $170000


SECTION "bank5D",DATA,BANK[$5D]

INCBIN "baserom.gbc", $174000, $177561 - $174000


SECTION "bank5E",DATA,BANK[$5E]

INCBIN "baserom.gbc", $178000, $1f

;                          Songs V

Music_MobileAdapterMenu: INCLUDE "audio/music/mobileadaptermenu.asm"
Music_BuenasPassword:    INCLUDE "audio/music/buenaspassword.asm"
Music_LookMysticalMan:   INCLUDE "audio/music/lookmysticalman.asm"
Music_CrystalOpening:    INCLUDE "audio/music/crystalopening.asm"
Music_BattleTowerTheme:  INCLUDE "audio/music/battletowertheme.asm"
Music_SuicuneBattle:     INCLUDE "audio/music/suicunebattle.asm"
Music_BattleTowerLobby:  INCLUDE "audio/music/battletowerlobby.asm"
Music_MobileCenter:      INCLUDE "audio/music/mobilecenter.asm"

INCBIN "baserom.gbc", $17982d, $1799ef - $17982d

MobileAdapterGFX:
INCBIN "gfx/misc/mobile_adapter.2bpp"

INCBIN "baserom.gbc", $17a68f, $17b629 - $17a68f


SECTION "bank5F",DATA,BANK[$5F]

INCBIN "baserom.gbc", $17c000, $17ff6c - $17c000


SECTION "bank60",DATA,BANK[$60]

;                        Map Scripts XIII

INCLUDE "maps/IndigoPlateauPokeCenter1F.asm"
INCLUDE "maps/WillsRoom.asm"
INCLUDE "maps/KogasRoom.asm"
INCLUDE "maps/BrunosRoom.asm"
INCLUDE "maps/KarensRoom.asm"
INCLUDE "maps/LancesRoom.asm"
INCLUDE "maps/HallOfFame.asm"


;                       Pokedex entries I
;                            001-064

INCLUDE "stats/pokedex/entries_1.asm"


SECTION "bank61",DATA,BANK[$61]

;                        Map Scripts XIV

INCLUDE "maps/CeruleanCity.asm"
INCLUDE "maps/SproutTower1F.asm"
INCLUDE "maps/SproutTower2F.asm"
INCLUDE "maps/SproutTower3F.asm"
INCLUDE "maps/TinTower1F.asm"
INCLUDE "maps/TinTower2F.asm"
INCLUDE "maps/TinTower3F.asm"
INCLUDE "maps/TinTower4F.asm"
INCLUDE "maps/TinTower5F.asm"
INCLUDE "maps/TinTower6F.asm"
INCLUDE "maps/TinTower7F.asm"
INCLUDE "maps/TinTower8F.asm"
INCLUDE "maps/TinTower9F.asm"
INCLUDE "maps/BurnedTower1F.asm"
INCLUDE "maps/BurnedTowerB1F.asm"


SECTION "bank62",DATA,BANK[$62]

;                         Map Scripts XV

INCLUDE "maps/CeruleanGymBadgeSpeechHouse.asm"
INCLUDE "maps/CeruleanPoliceStation.asm"
INCLUDE "maps/CeruleanTradeSpeechHouse.asm"
INCLUDE "maps/CeruleanPokeCenter1F.asm"
INCLUDE "maps/CeruleanPokeCenter2FBeta.asm"
INCLUDE "maps/CeruleanGym.asm"
INCLUDE "maps/CeruleanMart.asm"
INCLUDE "maps/Route10PokeCenter1F.asm"
INCLUDE "maps/Route10PokeCenter2FBeta.asm"
INCLUDE "maps/PowerPlant.asm"
INCLUDE "maps/BillsHouse.asm"
INCLUDE "maps/FightingDojo.asm"
INCLUDE "maps/SaffronGym.asm"
INCLUDE "maps/SaffronMart.asm"
INCLUDE "maps/SaffronPokeCenter1F.asm"
INCLUDE "maps/SaffronPokeCenter2FBeta.asm"
INCLUDE "maps/MrPsychicsHouse.asm"
INCLUDE "maps/SaffronTrainStation.asm"
INCLUDE "maps/SilphCo1F.asm"
INCLUDE "maps/CopycatsHouse1F.asm"
INCLUDE "maps/CopycatsHouse2F.asm"
INCLUDE "maps/Route5UndergroundEntrance.asm"
INCLUDE "maps/Route5SaffronCityGate.asm"
INCLUDE "maps/Route5CleanseTagSpeechHouse.asm"


SECTION "bank63",DATA,BANK[$63]

;                        Map Scripts XVI

INCLUDE "maps/PewterCity.asm"
INCLUDE "maps/WhirlIslandNW.asm"
INCLUDE "maps/WhirlIslandNE.asm"
INCLUDE "maps/WhirlIslandSW.asm"
INCLUDE "maps/WhirlIslandCave.asm"
INCLUDE "maps/WhirlIslandSE.asm"
INCLUDE "maps/WhirlIslandB1F.asm"
INCLUDE "maps/WhirlIslandB2F.asm"
INCLUDE "maps/WhirlIslandLugiaChamber.asm"
INCLUDE "maps/SilverCaveRoom1.asm"
INCLUDE "maps/SilverCaveRoom2.asm"
INCLUDE "maps/SilverCaveRoom3.asm"
INCLUDE "maps/SilverCaveItemRooms.asm"
INCLUDE "maps/DarkCaveVioletEntrance.asm"
INCLUDE "maps/DarkCaveBlackthornEntrance.asm"
INCLUDE "maps/DragonsDen1F.asm"
INCLUDE "maps/DragonsDenB1F.asm"
INCLUDE "maps/DragonShrine.asm"
INCLUDE "maps/TohjoFalls.asm"
INCLUDE "maps/AzaleaPokeCenter1F.asm"
INCLUDE "maps/CharcoalKiln.asm"
INCLUDE "maps/AzaleaMart.asm"
INCLUDE "maps/KurtsHouse.asm"
INCLUDE "maps/AzaleaGym.asm"


SECTION "bank64",DATA,BANK[$64]

;                        Map Scripts XVII

INCLUDE "maps/MahoganyTown.asm"
INCLUDE "maps/Route32.asm"
INCLUDE "maps/VermilionHouseFishingSpeechHouse.asm"
INCLUDE "maps/VermilionPokeCenter1F.asm"
INCLUDE "maps/VermilionPokeCenter2FBeta.asm"
INCLUDE "maps/PokemonFanClub.asm"
INCLUDE "maps/VermilionMagnetTrainSpeechHouse.asm"
INCLUDE "maps/VermilionMart.asm"
INCLUDE "maps/VermilionHouseDiglettsCaveSpeechHouse.asm"
INCLUDE "maps/VermilionGym.asm"
INCLUDE "maps/Route6SaffronGate.asm"
INCLUDE "maps/Route6UndergroundEntrance.asm"
INCLUDE "maps/PokeCenter2F.asm"
INCLUDE "maps/TradeCenter.asm"
INCLUDE "maps/Colosseum.asm"
INCLUDE "maps/TimeCapsule.asm"
INCLUDE "maps/MobileTradeRoomMobile.asm"
INCLUDE "maps/MobileBattleRoom.asm"


SECTION "bank65",DATA,BANK[$65]

;                       Map Scripts XVIII

INCLUDE "maps/Route36.asm"
INCLUDE "maps/FuchsiaCity.asm"
INCLUDE "maps/BlackthornGym1F.asm"
INCLUDE "maps/BlackthornGym2F.asm"
INCLUDE "maps/BlackthornDragonSpeechHouse.asm"
INCLUDE "maps/BlackthornDodrioTradeHouse.asm"
INCLUDE "maps/BlackthornMart.asm"
INCLUDE "maps/BlackthornPokeCenter1F.asm"
INCLUDE "maps/MoveDeletersHouse.asm"
INCLUDE "maps/FuchsiaMart.asm"
INCLUDE "maps/SafariZoneMainOffice.asm"
INCLUDE "maps/FuchsiaGym.asm"
INCLUDE "maps/FuchsiaBillSpeechHouse.asm"
INCLUDE "maps/FuchsiaPokeCenter1F.asm"
INCLUDE "maps/FuchsiaPokeCenter2FBeta.asm"
INCLUDE "maps/SafariZoneWardensHome.asm"
INCLUDE "maps/Route15FuchsiaGate.asm"
INCLUDE "maps/CherrygroveMart.asm"
INCLUDE "maps/CherrygrovePokeCenter1F.asm"
INCLUDE "maps/CherrygroveGymSpeechHouse.asm"
INCLUDE "maps/GuideGentsHouse.asm"
INCLUDE "maps/CherrygroveEvolutionSpeechHouse.asm"
INCLUDE "maps/Route30BerrySpeechHouse.asm"
INCLUDE "maps/MrPokemonsHouse.asm"
INCLUDE "maps/Route31VioletGate.asm"


SECTION "bank66",DATA,BANK[$66]

;                        Map Scripts XIX

INCLUDE "maps/AzaleaTown.asm"
INCLUDE "maps/GoldenrodCity.asm"
INCLUDE "maps/SaffronCity.asm"
INCLUDE "maps/MahoganyRedGyaradosSpeechHouse.asm"
INCLUDE "maps/MahoganyGym.asm"
INCLUDE "maps/MahoganyPokeCenter1F.asm"
INCLUDE "maps/Route42EcruteakGate.asm"
INCLUDE "maps/LakeofRageHiddenPowerHouse.asm"
INCLUDE "maps/LakeofRageMagikarpHouse.asm"
INCLUDE "maps/Route43MahoganyGate.asm"
INCLUDE "maps/Route43Gate.asm"
INCLUDE "maps/RedsHouse1F.asm"
INCLUDE "maps/RedsHouse2F.asm"
INCLUDE "maps/BluesHouse.asm"
INCLUDE "maps/OaksLab.asm"


SECTION "bank67",DATA,BANK[$67]

;                         Map Scripts XX

INCLUDE "maps/CherrygroveCity.asm"
INCLUDE "maps/Route35.asm"
INCLUDE "maps/Route43.asm"
INCLUDE "maps/Route44.asm"
INCLUDE "maps/Route45.asm"
INCLUDE "maps/Route19.asm"
INCLUDE "maps/Route25.asm"


SECTION "bank68",DATA,BANK[$68]

;                        Map Scripts XXI

INCLUDE "maps/CianwoodCity.asm"
INCLUDE "maps/Route27.asm"
INCLUDE "maps/Route29.asm"
INCLUDE "maps/Route30.asm"
INCLUDE "maps/Route38.asm"
INCLUDE "maps/Route13.asm"
INCLUDE "maps/PewterNidoranSpeechHouse.asm"
INCLUDE "maps/PewterGym.asm"
INCLUDE "maps/PewterMart.asm"
INCLUDE "maps/PewterPokeCenter1F.asm"
INCLUDE "maps/PewterPokeCEnter2FBeta.asm"
INCLUDE "maps/PewterSnoozeSpeechHouse.asm"


SECTION "bank69",DATA,BANK[$69]

;                        Map Scripts XXII

INCLUDE "maps/EcruteakCity.asm"
INCLUDE "maps/BlackthornCity.asm"
INCLUDE "maps/Route26.asm"
INCLUDE "maps/Route28.asm"
INCLUDE "maps/Route31.asm"
INCLUDE "maps/Route39.asm"
INCLUDE "maps/Route40.asm"
INCLUDE "maps/Route41.asm"
INCLUDE "maps/Route12.asm"


SECTION "bank6A",DATA,BANK[$6A]

;                       Map Scripts XXIII

INCLUDE "maps/NewBarkTown.asm"
INCLUDE "maps/VioletCity.asm"
INCLUDE "maps/OlivineCity.asm"
INCLUDE "maps/Route37.asm"
INCLUDE "maps/Route42.asm"
INCLUDE "maps/Route46.asm"
INCLUDE "maps/ViridianCity.asm"
INCLUDE "maps/CeladonCity.asm"
INCLUDE "maps/Route15.asm"
INCLUDE "maps/VermilionCity.asm"
INCLUDE "maps/Route9.asm"
INCLUDE "maps/CinnabarPokeCenter1F.asm"
INCLUDE "maps/CinnabarPokeCenter2FBeta.asm"
INCLUDE "maps/Route19FuchsiaGate.asm"
INCLUDE "maps/SeafoamGym.asm"


SECTION "bank6B",DATA,BANK[$6B]

;                        Map Scripts XXIV

INCLUDE "maps/Route33.asm"
INCLUDE "maps/Route2.asm"
INCLUDE "maps/Route1.asm"
INCLUDE "maps/PalletTown.asm"
INCLUDE "maps/Route21.asm"
INCLUDE "maps/CinnabarIsland.asm"
INCLUDE "maps/Route20.asm"
INCLUDE "maps/Route18.asm"
INCLUDE "maps/Route17.asm"
INCLUDE "maps/Route16.asm"
INCLUDE "maps/Route7.asm"
INCLUDE "maps/Route14.asm"
INCLUDE "maps/LavenderTown.asm"
INCLUDE "maps/Route6.asm"
INCLUDE "maps/Route5.asm"
INCLUDE "maps/Route24.asm"
INCLUDE "maps/Route3.asm"
INCLUDE "maps/Route4.asm"
INCLUDE "maps/Route10South.asm"
INCLUDE "maps/Route23.asm"
INCLUDE "maps/SilverCavePokeCenter1F.asm"
INCLUDE "maps/Route28FamousSpeechHouse.asm"


SECTION "bank6C",DATA,BANK[$6C]

;                         Common text I

INCLUDE "text/common.tx"

;                        Map Scripts XXV

INCLUDE "maps/SilverCaveOutside.asm"
INCLUDE "maps/Route10North.asm"


SECTION "bank6D",DATA,BANK[$6D]

INCLUDE "text/phone/mom.tx"
INCLUDE "text/phone/bill.tx"
INCLUDE "text/phone/elm.tx"
INCLUDE "text/phone/trainers1.tx"


SECTION "bank6E",DATA,BANK[$6E]

;                       Pokedex entries II
;                            065-128

INCLUDE "stats/pokedex/entries_2.asm"


SECTION "bank6F",DATA,BANK[$6F]

_FruitBearingTreeText: ; 0x1bc000
	db $0, "It's a fruit-", $4f
	db "bearing tree.", $57
; 0x1bc01c

_HeyItsFruitText: ; 0x1bc01c
	db $0, "Hey! It's", $4f
	db "@"
	text_from_ram StringBuffer3
	db $0, "!", $57
; 0x1bc02d

_ObtainedFruitText: ; 0x1bc02d
	db $0, "Obtained", $4f
	db "@"
	text_from_ram StringBuffer3
	db $0, "!", $57
; 0x1bc03e

_FruitPackIsFullText: ; 0x1bc03e
	db $0, "But the PACK is", $4f
	db "full…", $57
; 0x1bc055

_NothingHereText: ; 0x1bc055
	db $0, "There's nothing", $4f
	db "here…", $57
; 0x1bc06b

INCBIN "baserom.gbc", $1bc06b, $1be08d - $1bc06b


SECTION "bank70",DATA,BANK[$70]

;                         Common text II

INCLUDE "text/common_2.tx"


SECTION "bank71",DATA,BANK[$71]

;                        Common text III

INCLUDE "text/common_3.tx"


SECTION "bank72",DATA,BANK[$72]

;                   Item names & descriptions

ItemNames:
INCLUDE "items/item_names.asm"

INCLUDE "items/item_descriptions.asm"


MoveNames:
INCLUDE "battle/move_names.asm"


INCLUDE "landmarks.asm"


RegionCheck: ; 0x1caea1
; Checks if the player is in Kanto or Johto.
; If in Johto, returns 0 in e.
; If in Kanto, returns 1 in e.
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	call GetWorldMapLocation
	cp $5f ; on S.S. Aqua
	jr z, .johto
	cp $0 ; special
	jr nz, .checkagain

; If in map $00, load map group / map id from backup locations
	ld a, [BackupMapGroup]
	ld b, a
	ld a, [BackupMapNumber]
	ld c, a
	call GetWorldMapLocation
.checkagain
	cp $2f ; Pallet Town
	jr c, .johto
	cp $58 ; Victory Road
	jr c, .kanto
.johto
	ld e, 0
	ret
.kanto
	ld e, 1
	ret


SECTION "bank73",DATA,BANK[$73]

                      ; Pokedex entries III
                            ; 129-192
							
INCLUDE "stats/pokedex/entries_3.asm"


SECTION "bank74",DATA,BANK[$74]

;                       Pokedex entries IV
                            ; 193-251
							
INCLUDE "stats/pokedex/entries_4.asm"


SECTION "bank75",DATA,BANK[$75]


SECTION "bank76",DATA,BANK[$76]


SECTION "bank77",DATA,BANK[$77]

INCBIN "baserom.gbc", $1dc000, $1dc5a1 - $1dc000

Tileset26GFX: ; 0x1dc5a1
Tileset32GFX: ; 0x1dc5a1
Tileset33GFX: ; 0x1dc5a1
Tileset34GFX: ; 0x1dc5a1
Tileset35GFX: ; 0x1dc5a1
Tileset36GFX: ; 0x1dc5a1
INCBIN "gfx/tilesets/36.lz"
; 0x1dd1a8

	db $00

Tileset26Meta: ; 0x1dd1a9
INCBIN "tilesets/26_metatiles.bin"
; 0x1dd5a9

Tileset26Coll: ; 0x1dd5a9
INCBIN "tilesets/26_collision.bin"
; 0x1dd6a9

INCBIN "baserom.gbc", $1dd6a9, $1de29f - $1dd6a9


DudeAutoInput_A: ; 1de29f
	db NO_INPUT, $50
	db BUTTON_A, $00
	db NO_INPUT, $ff ; end
; 1de2a5
	
DudeAutoInput_RightA: ; 1de2a5
	db NO_INPUT, $08
	db D_RIGHT,  $00
	db NO_INPUT, $08
	db BUTTON_A, $00
	db NO_INPUT, $ff ; end
; 1de2af
	
DudeAutoInput_DownA: ; 1de2af
	db NO_INPUT, $fe
	db NO_INPUT, $fe
	db NO_INPUT, $fe
	db NO_INPUT, $fe
	db D_DOWN,   $00
	db NO_INPUT, $fe
	db NO_INPUT, $fe
	db NO_INPUT, $fe
	db NO_INPUT, $fe
	db BUTTON_A, $00
	db NO_INPUT, $ff ; end
; 1de2c5


INCBIN "baserom.gbc", $1de2c5, $1de2e4 - $1de2c5

PokegearGFX: ; 1de2e4
INCBIN "gfx/misc/pokegear.lz"
; 1de5c7

INCBIN "baserom.gbc", $1de5c7, $1df238 - $1de5c7


SECTION "bank78",DATA,BANK[$78]

Tileset33Meta: ; 0x1e0000
INCBIN "tilesets/33_metatiles.bin"
; 0x1e0400

Tileset34Meta: ; 0x1e0400
INCBIN "tilesets/34_metatiles.bin"
; 0x1e0800

Tileset35Meta: ; 0x1e0800
INCBIN "tilesets/35_metatiles.bin"
; 0x1e0c00

Tileset36Meta: ; 0x1e0c00
INCBIN "tilesets/36_metatiles.bin"
; 0x1e1000


SECTION "bank79",DATA,BANK[$79]


SECTION "bank7A",DATA,BANK[$7A]


SECTION "bank7B",DATA,BANK[$7B]

INCBIN "baserom.gbc", $1ec000, $1ecf02 - $1ec000


SECTION "bank7C",DATA,BANK[$7C]

INCBIN "baserom.gbc", $1f0000, $1f09d8 - $1f0000


SECTION "bank7D",DATA,BANK[$7D]

INCBIN "baserom.gbc", $1f4000, $1f636a - $1f4000


SECTION "bank7E",DATA,BANK[$7E]

INCBIN "baserom.gbc", $1f8000, $1fb8a8 - $1f8000


SECTION "bank7F",DATA,BANK[$7F]

SECTION "stadium2",DATA[$8000-$220],BANK[$7F]
INCBIN "baserom.gbc", $1ffde0, $220

