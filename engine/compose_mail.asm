ComposeMailMessage: ; 11e75 (mail?)
	ld hl, wc6d0
	ld [hl], e
	inc hl
	ld [hl], d
	ld a, [hMapAnims]
	push af
	xor a
	ld [hMapAnims], a
	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a
	call .InitBlankMail
	call DelayFrame

.loop
	call .DoMailEntry
	jr nc, .loop

	pop af
	ld [hInMenu], a
	pop af
	ld [hMapAnims], a
	ret

.InitBlankMail: ; 11e9a (4:5e9a)
	call ClearBGPalettes
	call DisableLCD
	call Function11c51
	ld de, VTiles0 tile $00
	ld hl, .MailIcon
	ld bc, 8 tiles
	ld a, BANK(.MailIcon)
	call FarCopyBytes
	xor a
	ld hl, wc300
	ld [hli], a
	ld [hl], a

	; init mail icon
	depixel 3, 2
	ld a, SPRITE_ANIM_INDEX_00
	call _InitSpriteAnimStruct

	ld hl, $2
	add hl, bc
	ld [hl], $0
	call .InitCharset
	ld a, $e3
	ld [rLCDC], a
	call .initwc6d3
	ld b, SCGB_08
	call GetSGBLayout
	call WaitBGMap
	call WaitTop
	ld a, %11100100
	call DmgToCgbBGPals
	ld a, %11100100
	call Functioncf8
	call Function11be0
	ld hl, wc6d0
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $10
	add hl, de
	ld [hl], $4e
	ret
; 11ef4 (4:5ef4)

.MailIcon: ; 11ef4
INCBIN "gfx/icon/mail2.2bpp"
; 11f74

.initwc6d3: ; 11f74 (4:5f74)
	ld a, $21
	ld [wc6d3], a
	ret
; 11f7a (4:5f7a)

.Dummy: ; dummied out
	db "メールを かいてね@"
; 11f84

.InitCharset: ; 11f84 (4:5f84)
	call WaitTop
	hlcoord 0, 0
	ld bc, 6 * SCREEN_WIDTH
	ld a, $60 ; border
	call ByteFill
	hlcoord 0, 6
	ld bc, 12 * SCREEN_WIDTH
	ld a, " "
	call ByteFill
	hlcoord 1, 1
	lb bc, 4, SCREEN_WIDTH - 2
	call ClearBox
	ld de, MailEntry_Uppercase

.PlaceMailCharset: ; 11fa9 (4:5fa9)
	hlcoord 1, 7
	ld b, 6
.next
	ld c, SCREEN_WIDTH - 1
.loop_
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .loop_
	push de
	ld de, SCREEN_WIDTH + 1
	add hl, de
	pop de
	dec b
	jr nz, .next
	ret

.DoMailEntry: ; 11fc0 (4:5fc0)
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .exit_mail
	call .DoJumptable
	callba Function8cf62
	call .Update
	call DelayFrame
	and a
	ret
.exit_mail
	callab Function8cf53
	call ClearSprites
	xor a
	ld [hSCX], a
	ld [hSCY], a
	scf
	ret

.Update: ; 11feb (4:5feb)
	xor a
	ld [hBGMapMode], a
	hlcoord 1, 1
	lb bc, 4, 18
	call ClearBox
	ld hl, wc6d0
	ld e, [hl]
	inc hl
	ld d, [hl]
	hlcoord 2, 2
	call PlaceString
	ld a, $1
	ld [hBGMapMode], a
	ret

.DoJumptable: ; 12008 (4:6008)
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, .Jumptable
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

.Jumptable: ; 12017 (4:6017)
	dw .init_blinking_cursor
	dw .process_joypad


.init_blinking_cursor: ; 1201b (4:601b)
	depixel 9, 2
	ld a, SPRITE_ANIM_INDEX_09
	call _InitSpriteAnimStruct
	ld a, c
	ld [wc6d5], a
	ld a, b
	ld [wc6d6], a
	ld hl, $1
	add hl, bc
	ld a, [hl]
	ld hl, $e
	add hl, bc
	ld [hl], a
	ld hl, wJumptableIndex
	inc [hl]
	ret

.process_joypad: ; 1203a (4:603a)
	ld hl, hJoyPressed ; $ffa7
	ld a, [hl]
	and A_BUTTON
	jr nz, .a
	ld a, [hl]
	and B_BUTTON
	jr nz, .b
	ld a, [hl]
	and START
	jr nz, .start
	ld a, [hl]
	and SELECT
	jr nz, .select
	ret

.a
	call Function12185
	cp $1
	jr z, .select
	cp $2
	jr z, .b
	cp $3
	jr z, .finished
	call Function11c11
	call Function121ac
	jr c, .start
	ld hl, wc6d2
	ld a, [hl]
	cp $10
	ret nz
	inc [hl]
	call Function11bd0
	ld [hl], $f2
	dec hl
	ld [hl], $4e
	ret

.start
	ld hl, wc6d5
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld hl, $c
	add hl, bc
	ld [hl], $9
	ld hl, $d
	add hl, bc
	ld [hl], $5
	ret

.b
	call Function11bbc
	ld hl, wc6d2
	ld a, [hl]
	cp $10
	ret nz
	dec [hl]
	call Function11bd0
	ld [hl], $f2
	inc hl
	ld [hl], $4e
	ret

.finished
	call Function11bf7
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

.select
	ld hl, wcf64
	ld a, [hl]
	xor $1
	ld [hl], a
	jr nz, .switch_to_lowercase
	ld de, MailEntry_Uppercase
	call .PlaceMailCharset
	ret
.switch_to_lowercase
	ld de, MailEntry_Lowercase
	call .PlaceMailCharset
	ret

Function120c1: ; 120c1 (4:60c1)
	call Function1210c
	ld hl, SpriteAnim1Sprite0d - SpriteAnim1
	add hl, bc
	ld a, [hl]
	ld e, a
	swap e
	ld hl, SpriteAnim1YOffset - SpriteAnim1
	add hl, bc
	ld [hl], e
	cp $5
	ld de, Unknown_120f8
	ld a, $0
	jr nz, .asm_120df
	ld de, Unknown_12102
	ld a, $1
.asm_120df
	ld hl, SpriteAnim1Sprite0e - SpriteAnim1
	add hl, bc
	add [hl]
	ld hl, SpriteAnim1Sprite01 - SpriteAnim1
	add hl, bc
	ld [hl], a
	ld hl, SpriteAnim1Sprite0c - SpriteAnim1
	add hl, bc
	ld l, [hl]
	ld h, SpriteAnim1Index - SpriteAnim1
	add hl, de
	ld a, [hl]
	ld hl, SpriteAnim1XOffset - SpriteAnim1
	add hl, bc
	ld [hl], a
	ret
; 120f8 (4:60f8)

Unknown_120f8: ; 120f8
	db $00, $10, $20, $30, $40, $50, $60, $70, $80, $90
Unknown_12102: ; 12102
	db $00, $00, $00, $30, $30, $30, $60, $60, $60, $60
; 1210c

Function1210c: ; 1210c (4:610c)
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .up
	ld a, [hl]
	and D_DOWN
	jr nz, .down
	ld a, [hl]
	and D_LEFT
	jr nz, .left
	ld a, [hl]
	and D_RIGHT
	jr nz, .right
	ret
.right
	call Function1218b
	and a
	jr nz, .asm_12138
	ld hl, $c
	add hl, bc
	ld a, [hl]
	cp $9
	jr nc, .asm_12135
	inc [hl]
	ret
.asm_12135
	ld [hl], $0
	ret
.asm_12138
	cp $3
	jr nz, .asm_1213d
	xor a
.asm_1213d
	ld e, a
	add a
	add e
	ld hl, $c
	add hl, bc
	ld [hl], a
	ret
.left
	call Function1218b
	and a
	jr nz, .asm_12159
	ld hl, $c
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_12156
	dec [hl]
	ret
.asm_12156
	ld [hl], $9
	ret
.asm_12159
	cp $1
	jr nz, .asm_1215f
	ld a, $4
.asm_1215f
rept 2
	dec a
endr
	ld e, a
	add a
	add e
	ld hl, $c
	add hl, bc
	ld [hl], a
	ret
.down
	ld hl, $d
	add hl, bc
	ld a, [hl]
	cp $5
	jr nc, .asm_12175
	inc [hl]
	ret
.asm_12175
	ld [hl], $0
	ret
.up
	ld hl, $d
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_12182
	dec [hl]
	ret
.asm_12182
	ld [hl], $5
	ret

Function12185: ; 12185 (4:6185)
	ld hl, wc6d5
	ld c, [hl]
	inc hl
	ld b, [hl]

Function1218b: ; 1218b (4:618b)
	ld hl, $d
	add hl, bc
	ld a, [hl]
	cp $5
	jr nz, .asm_121aa
	ld hl, $c
	add hl, bc
	ld a, [hl]
	cp $3
	jr c, .asm_121a4
	cp $6
	jr c, .asm_121a7
	ld a, $3
	ret
.asm_121a4
	ld a, $1
	ret
.asm_121a7
	ld a, $2
	ret
.asm_121aa
	xor a
	ret

Function121ac: ; 121ac (4:61ac)
	ld a, [wc6d7]
	jp Function11b17
; 121b2 (4:61b2)

Function121b2: ; unreferenced
	ld a, [wc6d2]
	and a
	ret z
	cp $11
	jr nz, .asm_121c3
	push hl
	ld hl, wc6d2
rept 2
	dec [hl]
endr
	jr .asm_121c8

.asm_121c3
	push hl
	ld hl, wc6d2
	dec [hl]

.asm_121c8
	call Function11bd0
	ld c, [hl]
	pop hl
.asm_121cd
	ld a, [hli]
	cp $ff
	jp z, Function11b27
	cp c
	jr z, .asm_121d9
	inc hl
	jr .asm_121cd

.asm_121d9
	ld a, [hl]
	jp Function11b23
; 121dd

MailEntry_Uppercase: ; 122dd
	db "A B C D E F G H I J"
	db "K L M N O P Q R S T"
	db "U V W X Y Z   , ? !"
	db "1 2 3 4 5 6 7 8 9 0"
	db "<PK> <MN> <PO> <KE> é ♂ ♀ ¥ … ×"
	db "lower  DEL   END   "
; 1224f

MailEntry_Lowercase: ; 1224f
	db "a b c d e f g h i j"
	db "k l m n o p q r s t"
	db "u v w x y z   . - /"
	db "'d 'l 'm 'r 's 't 'v & ( )"
	db "<``> <''> [ ] ' : ;      "
	db "UPPER  DEL   END   "
; 122c1
