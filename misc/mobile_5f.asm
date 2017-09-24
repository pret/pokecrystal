
SECTION "bank5F", ROMX

Function17c000: ; 17c000

	call DisableLCD

	ld hl, VTiles2
	ld bc, $31 tiles
	xor a
	call ByteFill

	call LoadStandardFont
	call LoadFontsExtra

	ld hl, HaveWantMap
	decoord 0, 0
	bccoord 0, 0, AttrMap

	ld a, SCREEN_HEIGHT
.y
	push af
	ld a, SCREEN_WIDTH

	push hl
.x
	push af
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [bc], a
	inc bc
	pop af
	dec a
	jr nz, .x
	pop hl

	push bc
	ld bc, BG_MAP_WIDTH * 2
	add hl, bc
	pop bc

	pop af
	dec a
	jr nz, .y

	ld a, [rSVBK]
	push af

	ld a, 5 ; BANK(UnknBGPals)
	ld [rSVBK], a

	ld hl, HaveWantPals
	ld de, UnknBGPals
	ld bc, $80
	call CopyBytes

	pop af
	ld [rSVBK], a

	ld hl, MobileSelectGFX
	ld de, VTiles0 tile $30
	ld bc, $20 tiles
	call CopyBytes

	ld a, 1
	ld [rVBK], a

	ld hl, HaveWantGFX
	ld de, VTiles2
	ld bc, $80 tiles
	call CopyBytes

	ld hl, HaveWantGFX + $800
	ld de, VTiles1
	ld bc, $10 tiles
	call CopyBytes

	xor a
	ld [rVBK], a

	call EnableLCD
	callba ReloadMapPart
	ret
; 17c083

HaveWantGFX: ; 17c083
INCBIN "gfx/mobile/havewant.2bpp"

MobileSelectGFX: ; 17c983
INCBIN "gfx/mobile/select.2bpp"

HaveWantMap: ; 17cb83
; Interleaved tile/palette map.
INCBIN "gfx/mobile/havewant_map.bin"

HaveWantPals: ; 17cff3
; BG and OBJ palettes.
	RGB  0,  0,  0
	RGB 21, 21, 21
	RGB  0,  0,  0
	RGB  0,  0,  0

	RGB  0,  0,  0
	RGB  4, 17, 29
	RGB  6, 19, 31
	RGB 31, 31, 31

	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0

	RGB  0,  0,  0
	RGB  2, 13, 18
	RGB  6, 19, 31
	RGB 31, 31, 31

	RGB  0,  0,  0
	RGB 31,  5,  5
	RGB 29, 21, 21
	RGB 31, 31, 31

	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0

	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0

	RGB  0,  0,  0
	RGB  4, 17, 29
	RGB  6, 19, 31
	RGB  2, 15, 27

	RGB  0,  0,  0
	RGB 28, 19, 18
	RGB 25,  9,  0
	RGB  0,  0,  0

	RGB  0,  0,  0
	RGB 31, 27, 27
	RGB 31, 10,  4
	RGB 29,  0,  0

	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 26,  8, 23
	RGB 22,  0, 16

	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20,  8, 31
	RGB 15,  1, 26

	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 17, 12, 31
	RGB 12,  6, 31

	RGB  0, 16,  0
	RGB 11, 11, 14
	RGB  5,  5,  7
	RGB 31, 31, 31

	RGB  0, 31,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0

	RGB 16, 31,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0


CheckStringForErrors: ; 17d073
; Valid character ranges:
; $0, $5 - $13, $19 - $1c, $26 - $34, $3a - $3e, $40 - $48, $60 - $ff
.loop
	ld a, [de]
	inc de
	and a
	jr z, .NextChar
	cp $60
	jr nc, .NextChar
	cp $4e
	jr z, .NextChar
	cp "@"
	jr z, .Done
	cp $5
	jr c, .Fail
	cp "<PLAY_G>"
	jr c, .NextChar
	cp $19
	jr c, .Fail
	cp $1d
	jr c, .NextChar
	cp $26
	jr c, .Fail
	cp $35
	jr c, .NextChar
	cp $3a
	jr c, .Fail
	cp $3f
	jr c, .NextChar
	cp $40
	jr c, .Fail
	cp $49
	jr c, .NextChar

.Fail:
	scf
	ret

.NextChar:
	dec c
	jr nz, .loop

.Done:
	and a
	ret
; 17d0b3

CheckStringForErrors_IgnoreTerminator: ; 17d0b3
; Find control chars
.loop
	ld a, [de]
	inc de
	and a
	jr z, .next
	cp "<DEXEND>" + 1
	jr nc, .next
	cp "<NEXT>"
	jr z, .next
	cp "@"
	jr z, .next

	cp $5
	jr c, .end
	cp "<PLAY_G>"
	jr c, .next
	cp $19
	jr c, .end
	cp $1d
	jr c, .next
	cp "%" + 1
	jr c, .end
	cp $35
	jr c, .next
	cp "<GREEN>" + 1
	jr c, .end
	cp "<ENEMY>"
	jr c, .next
	cp "<ENEMY>" + 1
	jr c, .end
	cp "<MOM>"
	jr c, .next

.end
	scf
	ret

.next
	dec c
	jr nz, .loop
	and a
	ret
; 17d0f3

Function17d0f3: ; 17d0f3
	ld a, [$c608 + 5]
	ld [wOTTrademonSpecies], a
	ld [CurPartySpecies], a
	ld a, [wcd81]
	ld [$c74e], a
	ld hl, $c63d
	ld de, wOTTrademonOTName
	ld bc, 5
	call CopyBytes
	ld a, "@"
	ld [de], a
	ld a, [$c608 + 11]
	ld [wOTTrademonID], a
	ld a, [$c608 + 12]
	ld [wOTTrademonID + 1], a
	ld hl, $c608 + 26
	ld a, [hli]
	ld [wOTTrademonDVs], a
	ld a, [hl]
	ld [wOTTrademonDVs + 1], a
	ld bc, $c608 + 5
	callba GetCaughtGender
	ld a, c
	ld [wOTTrademonCaughtData], a
	call SpeechTextBox
	call FadeToMenu
	callba Function10804d
	callba Function17d1f1
	ld a, $1
	ld [wForceEvolution], a
	ld a, $2
	ld [wLinkMode], a
	callba EvolvePokemon
	xor a
	ld [wLinkMode], a
	callba SaveAfterLinkTrade
	ld a, $5
	call GetSRAMBank
	ld a, $5
	ld [$a800], a
	call CloseSRAM
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	call GetMapTrigger
	ld a, d
	or e
	jr z, .asm_17d180
	ld a, $1
	ld [de], a

.asm_17d180
	call CloseSubmenu
	call RestartMapMusic
	ret
; 17d187

Mobile_CopyDefaultOTName: ; 17d187
	ld hl, Mobile5F_KrissName
	ld de, $c63d
	ld bc, 5
	call CopyBytes
	ret
; 17d194

Mobile5F_KrissName:
	db "クりス@@"
; 17d198

Mobile_CopyDefaultNickname: ; 17d199
	ld hl, .DefaultNickname
	ld de, $c642
	ld bc, 5
	call CopyBytes
	ret
; 17d1a6

.DefaultNickname:
	db "?????"

Mobile_CopyDefaultMail: ; 17d1ab
	ld a, "@"
	ld hl, $c647
	ld bc, MAIL_MSG_LENGTH + 1
	call ByteFill
	ld hl, .DefaultMessage
	ld de, $c647
	ld bc, 6
	call CopyBytes
	ret
; 17d1c3

.DefaultMessage:
	db "こんにちは@"
; 17d1c9

Mobile_CopyDefaultMailAuthor: ; 17d1c9
	ld a, "@"
	ld de, $c668
	ld bc, 5
	call ByteFill
	ld hl, Mobile5F_KrissName
	ld de, $c668
	ld bc, 5
	call CopyBytes
	ret
; 17d1e1

CheckStringContainsLessThanBNextCharacters: ; 17d1e1
.loop
	ld a, [de]
	inc de
	cp "<NEXT>"
	jr nz, .next_char
	dec b
	jr z, .done

.next_char
	dec c
	jr nz, .loop
	and a
	ret

.done
	scf
	ret
; 17d1f1

Function17d1f1: ; 17d1f1
	ld a, [CurPartySpecies]
	dec a
	call SetSeenAndCaughtMon

	ld a, [CurPartySpecies]
	cp UNOWN
	jr nz, .asm_17d223

	ld hl, PartyMon1DVs
	ld a, [PartyCount]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	predef GetUnownLetter
	callab UpdateUnownDex
	ld a, [wFirstUnownSeen]
	and a
	jr nz, .asm_17d223

	ld a, [UnownLetter]
	ld [wFirstUnownSeen], a

.asm_17d223
	ret
; 17d224


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Parameter: [ScriptVar] = 0..1
;
; if [ScriptVar] == 0
;    Show japanese menu options
;    - News - News - ??? - Cancel
; if [ScriptVar] == 1
;    Show BattleTower-Menu with 3 options in english language
;    - Challenge - Explanation - Cancel
Special_Menu_ChallengeExplanationCancel: ; 17d224
	ld a, [ScriptVar]
	and a
	jr nz, .English
	ld a, $4
	ld [ScriptVar], a
	ld hl, MenuDataHeader_17d26a ; Japanese Menu, where you can choose 'News' as an option
	jr .Load_Interpret

.English:
	ld a, $4
	ld [ScriptVar], a
	ld hl, MenuDataHeader_ChallengeExplanationCancel ; English Menu

.Load_Interpret:
	call LoadMenuDataHeader
	call Function17d246
	call CloseWindow
	ret
; 17d246

Function17d246: ; 17d246
	call VerticalMenu
	jr c, .Exit
	ld a, [ScriptVar]
	cp $5
	jr nz, .UsewMenuCursorY
	ld a, [wMenuCursorY]
	cp $3
	ret z
	jr c, .UsewMenuCursorY
	dec a
	jr .LoadToScriptVar

.UsewMenuCursorY:
	ld a, [wMenuCursorY]

.LoadToScriptVar:
	ld [ScriptVar], a
	ret

.Exit:
	ld a, $4
	ld [ScriptVar], a
	ret
; 17d26a

MenuDataHeader_17d26a: ; 17d26a
	db $40 ; flags
	db  0,  0 ; start coords
	db  9, 14 ; end coords
	dw MenuData2_17d272
	db 1 ; default option

MenuData2_17d272: ; 17d272
	db $a0 ; flags
	db 4
	db "ニュース¯よみこむ@"
	db "ニュース¯みる@"
	db "せつめい@"
	db "やめる@"
; 17d28f

MenuDataHeader_ChallengeExplanationCancel: ; 17d28f
	db $40 ; flags
	db  0,  0 ; start coords
	db  7, 14 ; end coords
	dw MenuData2_ChallengeExplanationCancel
	db 1 ; default option

MenuData2_ChallengeExplanationCancel: ; 17d297
	db $a0 ; flags
	db 3
	db "Challenge@"
	db "Explanation@"
	db "Cancel@"
; 17d2b6

Function17d2b6: ; 17d2b6
	call Function17d2c0
	callba Function1181da
	ret
; 17d2c0

Function17d2c0: ; 17d2c0
	xor a
	ld [wJumptableIndex], a
	ld [wcf64], a
	ld [wcf65], a
	ld [wcf66], a
	ret
; 17d2ce

Function17d2ce: ; 17d2ce
	ld a, $5
	call GetSRAMBank
	ld a, [$aa72]
	call CloseSRAM
	and a
	jr nz, .asm_17d2e2
	ld a, $1
	ld [ScriptVar], a
	ret

.asm_17d2e2
	call Function17d314
	ret c
	call SpeechTextBox
	call FadeToMenu
	ld a, [rSVBK]
	push af
	ld a, $4
	ld [rSVBK], a
	call Function17d370
	call Function17d45a
	pop af
	ld [rSVBK], a
	ld de, MUSIC_MOBILE_CENTER
	ld a, e
	ld [wMapMusic], a
	ld [MusicFadeIDLo], a
	ld a, d
	ld [MusicFadeIDHi], a
	call PlayMusic
	call ReturnToMapFromSubmenu
	call CloseSubmenu
	ret
; 17d314

Function17d314: ; 17d314
	ld a, $5
	call GetSRAMBank
	ld a, [$b1b1]
	call CloseSRAM
	cp $21
	jr nc, .asm_17d354
	ld a, $6
	call GetSRAMBank
	ld l, $0
	ld h, l
	ld de, $a006
	ld a, [$a004]
	ld c, a
	ld a, [$a005]
	ld b, a
.asm_17d336
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
	jr nz, .asm_17d336
	ld a, [$a002]
	cp l
	jr nz, .asm_17d354
	ld a, [$a003]
	cp h
	jr nz, .asm_17d354
	call CloseSRAM
	and a
	ret

.asm_17d354
	call CloseSRAM
	ld a, $5
	call GetSRAMBank
	xor a
	ld hl, $aa73
	ld bc, $c
	call ByteFill
	call CloseSRAM
	ld a, $2
	ld [ScriptVar], a
	scf
	ret
; 17d370

Function17d370: ; 17d370
	xor a
	ld [wcd77], a
	ld [wcd78], a
	ld [wcd79], a
	dec a
	ld [wcd6c], a
	call ClearBGPalettes
	call ClearSprites
	call ClearScreen
	callba ReloadMapPart
	call DisableLCD
	ld hl, VTiles1 tile $6e
	ld de, $c608
	ld bc, 1 tiles
	call CopyBytes
	ld a, $1
	ld [rVBK], a
	ld hl, PokemonNewsGFX
	ld de, VTiles1
	ld bc, $48 tiles
	call CopyBytes
	xor a
	ld hl, VTiles2 tile $7f
	ld bc, 1 tiles
	call ByteFill
	ld hl, $c608
	ld de, VTiles1 tile $6e
	ld bc, 1 tiles
	call CopyBytes
	xor a
	ld [rVBK], a
	ld hl, GFX_17eb7e
	ld de, VTiles2 tile $60
	ld bc, 1 tiles
	call CopyBytes
	call EnableLCD
	call Function17d60b
	ld a, $0
	ld [BGMapBuffer], a
	ld a, $d0
	ld [wcd21], a
	ld a, $6
	call GetSRAMBank
	ld hl, $a006
	ld de, UnknBGPals
	ld bc, $1000
	call CopyBytes
	call CloseSRAM
	ret
; 17d3f6

Function17d3f6: ; 17d3f6
	call ClearBGPalettes
	call ClearSprites
	call ClearScreen
	callba ReloadMapPart

Function17d405:
	call DisableLCD
	ld hl, VTiles1 tile $6e
	ld de, $c608
	ld bc, 1 tiles
	call CopyBytes
	ld a, $1
	ld [rVBK], a
	ld hl, PokemonNewsGFX
	ld de, VTiles1
	ld bc, $48 tiles
	call CopyBytes
	xor a
	ld hl, VTiles2 tile $7f
	ld bc, 1 tiles
	call ByteFill
	ld hl, $c608
	ld de, VTiles1 tile $6e
	ld bc, 1 tiles
	call CopyBytes
	xor a
	ld [rVBK], a
	call EnableLCD
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_17eff6
	ld de, UnknBGPals
	ld bc, 8 palettes
	call CopyBytes
	call SetPalettes
	pop af
	ld [rSVBK], a
	ret
; 17d45a

Function17d45a: ; 17d45a
.asm_17d45a
	call JoyTextDelay
	ld a, [wcd77]
	bit 7, a
	jr nz, .asm_17d46f
	call Function17d474
	callba ReloadMapPart
	jr .asm_17d45a

.asm_17d46f
	xor a
	ld [ScriptVar], a
	ret
; 17d474

Function17d474: ; 17d474
	jumptable Jumptable_17d483, wcd77
; 17d483

Jumptable_17d483: ; 17d483
	dw Function17d48d
	dw Function17d5be
	dw Function17d5c4
	dw Function17d6fd
	dw Function17e427
; 17d48d

Function17d48d: ; 17d48d
	ld hl, Palette_17eff6
	ld de, $c608
	ld bc, $40
	call CopyBytes
	ld hl, TileAttrmap_17eb8e
	decoord 0, 0
	bccoord 0, 0, AttrMap
	ld a, $12
.asm_17d4a4
	push af
	ld a, $14
	push hl
.asm_17d4a8
	push af
	ld a, [hli]
	cp $7f
	jr z, .asm_17d4b0
	add $80

.asm_17d4b0
	ld [de], a
	inc de
	ld a, [hli]
	ld [bc], a
	inc bc
	pop af
	dec a
	jr nz, .asm_17d4a8
	pop hl
	push bc
	ld bc, $40
	add hl, bc
	pop bc
	pop af
	dec a
	jr nz, .asm_17d4a4
	ld a, [BGMapBuffer]
	ld l, a
	ld a, [wcd21]
	ld h, a
	ld a, [hli]
	ld e, a
	ld a, [wcd6c]
	cp e
	jr z, .asm_17d4e0
	ld a, e
	ld [wcd6c], a
	ld [wMapMusic], a
	ld d, $0
	call PlayMusic2

.asm_17d4e0
	ld a, [hli]
	ld de, $c608
	ld c, $8
.asm_17d4e6
	srl a
	jr nc, .asm_17d4f6
	ld b, $8
	push af
.asm_17d4ed
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_17d4ed
	pop af
	jr .asm_17d4fc

.asm_17d4f6
	push af
	ld a, e
	add $8
	ld e, a
	pop af

.asm_17d4fc
	dec c
	jr nz, .asm_17d4e6
	push hl
	call Function17d5f6
	pop hl
	ld a, [hli]
	and a
	jr z, .asm_17d539
.asm_17d508
	push af
	ld a, [hli]
	ld [wcd4f], a
	ld a, [hli]
	ld [wcd50], a
	ld a, [hli]
	ld [wcd51], a
	ld a, [hli]
	ld [wcd52], a
	ld a, [hli]
	sla a
	sla a
	sla a
	add $98
	ld [wcd53], a
	ld de, wcd4f
	call Function17e613
	ld a, [hli]
	ld [wcd53], a
	ld de, wcd4f
	call Function17e691
	pop af
	dec a
	jr nz, .asm_17d508

.asm_17d539
	ld a, [hli]
.asm_17d53a
	push af
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	push hl
	pop de
	hlcoord 0, 0
	add hl, bc
	call PlaceString
	push de
	pop hl
	inc hl
	pop af
	dec a
	jr nz, .asm_17d53a
	ld de, CreditsTimer
	ld bc, $c
	call CopyBytes
	xor a
	ld [wcd2e], a
	ld [wcd2f], a
	inc a
	ld [wcd30], a
	ld [wcd31], a
	ld de, wcd32
	ld bc, $10
	call CopyBytes
	ld a, [hli]
	ld [wcd42], a
	ld a, [hli]
	ld [wcd43], a
	ld a, [hli]
	ld [wMobileInactivityTimerMinutes], a
	ld a, [hli]
	ld [wMobileInactivityTimerSeconds], a
	ld a, [hli]
	ld [wMobileInactivityTimerFrames], a
	ld a, [hli]
	and a
	jr z, .asm_17d58a
	call Function17d6a1

.asm_17d58a
	ld a, l
	ld [wcd49], a
	ld a, h
	ld [wcd4a], a
	ld a, [wcd42]
	ld c, a
	ld b, $0
	add hl, bc
	add hl, bc
	ld a, l
	ld [wcd4b], a
	ld a, h
	ld [wcd4c], a
	add hl, bc
	add hl, bc
	ld a, l
	ld [wcd4d], a
	ld a, h
	ld [wcd4e], a
	call Function17e451
	call Function17e55b
	call Function17e5af
	callba ReloadMapPart
	jp Function17e438
; 17d5be

Function17d5be: ; 17d5be
	call SetPalettes
	call Function17e438

Function17d5c4:
	ld a, [hJoyPressed]
	and a
	ret z
	ld c, 0
	ld b, c
	ld hl, wcd32
.loop
	srl a
	jr c, .got_button
	inc c
	inc c
	jr .loop

.got_button
	add hl, bc
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	and c
	cp $ff
	ret z
	ld a, [wcd20]
	ld l, a
	ld a, [wcd21]
	ld h, a
	add hl, bc
	ld a, l
	ld [wcd78], a
	ld a, h
	ld [wcd79], a
	ld a, $3
	ld [wcd77], a
	ret
; 17d5f6

Function17d5f6: ; 17d5f6
	ld a, $5
	ld [rSVBK], a
	ld hl, $c608
	ld de, UnknBGPals
	ld bc, 8 palettes
	call CopyBytes
	ld a, $4
	ld [rSVBK], a
	ret
; 17d60b

Function17d60b: ; 17d60b
	ld a, $5
	call GetSRAMBank
	ld hl, $b1d3
	ld de, $c608
	ld bc, $20
	call CopyBytes
	ld a, [$b1b1]
	ld c, a
	ld a, [$b1b2]
	ld b, a
	ld a, [$b1b3]
	ld l, a
	ld a, [$b1b4]
	ld h, a
	call CloseSRAM
	ld a, $6
	call GetSRAMBank
	ld de, $c708
	ld a, c
	and a
	jr z, .asm_17d684
.asm_17d63b
	push bc
	ld a, l
	ld [de], a
	inc de
	ld a, h
	ld [de], a
	inc de
	ld bc, $a
	add hl, bc
	pop bc
	ld a, [hli]
	ld [wcd4a], a
	ld a, [hli]
	ld [wcd49], a
	push hl
	push de
	ld hl, $c608
	ld e, b
	ld d, $0
	add hl, de
	ld a, [hli]
	ld [wcd4b], a
	ld a, [hl]
	ld [wcd4c], a
	pop de
	pop hl
	inc b
	inc b
	dec c
	dec c
	jr z, .asm_17d684
	push bc
	push de
	ld a, [wcd49]
	ld c, a
	ld a, [wcd4a]
	ld b, a
	ld a, [wcd4b]
	ld e, a
	ld a, [wcd4c]
	ld d, a
.asm_17d67a
	add hl, de
	dec bc
	ld a, c
	or b
	jr nz, .asm_17d67a
	pop de
	pop bc
	jr .asm_17d63b

.asm_17d684
	call CloseSRAM
	ld a, $5
	call GetSRAMBank
	ld hl, $c708
	ld de, $b1b3
	ld a, [$b1b1]
	ld c, a
	ld a, [$b1b2]
	ld b, a
	call CopyBytes
	call CloseSRAM
	ret
; 17d6a1


Function17d6a1: ; 17d6a1
	push hl
	ld a, [wcd6e]
	ld c, a
	ld b, $0
	ld a, $5
	call GetSRAMBank
	ld hl, $b1d3
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld [wcd47], a
	ld a, [hl]
	ld [BGMapPalBuffer], a
	ld hl, $b1b3
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld c, a
	ld a, [hl]
	ld h, a
	ld l, c
	call CloseSRAM
	ld a, $6
	call GetSRAMBank
	ld a, l
	ld [wcd5e], a
	ld a, h
	ld [wcd5f], a
	ld de, wcd60
	ld bc, $4
	call CopyBytes
	inc hl
	inc hl
	ld de, wcd64
	ld bc, $4
	call CopyBytes
	ld a, [hli]
	ld [wcd69], a
	ld a, [hli]
	ld [wcd68], a
	ld a, l
	ld [wcd6a], a
	ld a, h
	ld [wcd6b], a
	call CloseSRAM
	pop hl
	ret
; 17d6fd

Function17d6fd: ; 17d6fd
	ld a, [wcd77]
	bit 7, a
	jr nz, asm_17d721
	ld a, [wcd78]
	ld l, a
	ld a, [wcd79]
	ld h, a
	ld a, [hl]
	cp $ff
	jr z, asm_17d721

Function17d711:
.crash_loop
	cp $31
	jr nc, .crash_loop
	ld e, a
	ld d, 0
	ld hl, Jumptable17d72a
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

asm_17d721
	call Function17e5af
	ld a, $2
	ld [wcd77], a
	ret
; 17d72a

Jumptable17d72a: ; 17d72a
	dw Function17d78c
	dw Function17d78d
	dw Function17d7b4
	dw Function17d7c2
	dw Function17d7d3
	dw Function17d7e5
	dw Function17d818
	dw Function17d833
	dw Function17d85d
	dw Function17d902
	dw Function17d93a
	dw Function17d98b
	dw Function17d9e3
	dw Function17da31
	dw Function17da9c
	dw Function17dadc
	dw Function17db2d
	dw Function17db56
	dw Function17db77
	dw Function17dbe9
	dw Function17dc1f
	dw Function17dc9f
	dw Function17dca9
	dw Function17dccf
	dw Function17dd13
	dw Function17dd30
	dw Function17dd49
	dw Function17ddcd
	dw Function17de32
	dw Function17de91
	dw Function17ded9
	dw Function17e0fd
	dw Function17e133
	dw Function17e165
	dw Function17e1a1
	dw Function17e254
	dw Function17e261
	dw Function17e270
	dw Function17e27f
	dw Function17e293
	dw Function17e2a7
	dw Function17e367
	dw Function17e37e
	dw Function17e395
	dw Function17e3ac
	dw Function17e3c3
	dw Function17e3e0
	dw Function17e3f0
	dw Function17e409
; 17d78c

Function17d78c: ; 17d78c
	ret
; 17d78d

Function17d78d: ; 17d78d
	call Function17e415
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	call Function17e41e
	ld a, $6
	call GetSRAMBank
	ld hl, $a006
	add hl, bc
	ld de, UnknBGPals
	ld bc, $1000
	call CopyBytes
	call CloseSRAM
	xor a
	ld [wcd77], a
	call ClearBGPalettes
	ret
; 17d7b4

Function17d7b4: ; 17d7b4
	call Function17e415
	ld a, [hli]
	ld e, a
	ld d, $0
	call PlayMusic2
	call Function17e41e
	ret
; 17d7c2

Function17d7c2: ; 17d7c2
	call Function17e415
	ld a, [hli]
	ld e, a
	ld d, $0
	call PlaySFX
	call WaitSFX
	call Function17e41e
	ret
; 17d7d3

Function17d7d3: ; 17d7d3
	call Function17e415
	ld a, [hli]
	dec a
	ld e, a
	ld d, $0
	call PlayCryHeader
	call WaitSFX
	call Function17e41e
	ret
; 17d7e5

Function17d7e5: ; 17d7e5
	call Function17e415
	ld a, [hli]
	ld [wcd4f], a
	ld a, [hli]
	ld [wcd50], a
	ld a, [hli]
	ld [wcd51], a
	ld a, [hli]
	ld [wcd52], a
	ld a, [hli]
	sla a
	sla a
	sla a
	add $98
	ld [wcd53], a
	ld de, wcd4f
	call Function17e613
	ld a, [hli]
	ld [wcd53], a
	ld de, wcd4f
	call Function17e691
	call Function17e41e
	ret
; 17d818

Function17d818: ; 17d818
	call Function17e415
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	call Function17e41e
	call Function17e447
	ld e, l
	ld d, h
	hlcoord 0, 0
	add hl, bc
	call PlaceString
	ret
; 17d833

Function17d833: ; 17d833
	call Function17e415
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	call Function17e41e
	push de
	push bc
	call Function17e32b
	pop bc
	pop de
	call Function17e43d
	ld c, l
	ld b, h
	hlcoord 0, 0
	add hl, de
	ld e, l
	ld d, h
	callba Function11c08f
	call Function17e349
	ret
; 17d85d

Function17d85d: ; 17d85d
	call Function17e415
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push hl
	ld hl, UnknBGPals
	add hl, de
	ld de, wcc60
.asm_17d86c
	ld a, [hli]
	ld [de], a
	inc de
	and a
	jr nz, .asm_17d86c
	pop hl
	ld de, $c608
	ld c, $0
.asm_17d878
	ld a, [hli]
	cp $ff
	jr z, .asm_17d8c7
	ld [wcd4f], a
	ld a, [hli]
	ld [wcd50], a
	ld a, [hli]
	ld [wcd51], a
	ld a, [hli]
	ld [wcd52], a
	ld a, [wcd51]
	push af
	cp $c0
	jr c, .asm_17d89b
	ld a, [wcd4f]
	ld [rSVBK], a
	jr .asm_17d8a1

.asm_17d89b
	ld a, [wcd4f]
	call GetSRAMBank

.asm_17d8a1
	push hl
	ld a, [wcd50]
	ld l, a
	ld a, [wcd51]
	ld h, a
	ld a, [wcd52]
.asm_17d8ad
	push af
	ld a, [hli]
	ld [de], a
	inc de
	inc c
	pop af
	dec a
	jr nz, .asm_17d8ad
	pop hl
	pop af
	cp $c0
	jr c, .asm_17d8c2
	ld a, $4
	ld [rSVBK], a
	jr .asm_17d878

.asm_17d8c2
	call CloseSRAM
	jr .asm_17d878

.asm_17d8c7
	call Function17e41e
	push bc
	ld a, $3
	ld [rSVBK], a
	ld hl, $c608
	ld de, UnknBGPals
	ld b, $0
	call CopyBytes
	ld a, $4
	ld [rSVBK], a
	call Function17e32b
	pop bc
	ld a, c
	ld [wcd3b], a
	xor a
	ld [wcf66], a
	callba Function118329
	ld a, [wc300]
	and a
	jr z, .asm_17d8fe
	cp $a
	jr z, .asm_17d8fe
	call Function17e309
	ret

.asm_17d8fe
	call Function17e349
	ret
; 17d902

Function17d902: ; 17d902
	call Function17e415
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push de
	call Function17e41e
	call Function17e32b
	pop de
	ld hl, UnknBGPals
	add hl, de
	ld de, wcc60
.asm_17d918
	ld a, [hli]
	ld [de], a
	inc de
	and a
	jr nz, .asm_17d918
	xor a
	ld [wcf66], a
	callba Function11837a
	ld a, [wc300]
	and a
	jr z, .asm_17d936
	cp $a
	jr z, .asm_17d936
	call Function17e309
	ret

.asm_17d936
	call Function17e349
	ret
; 17d93a

Function17d93a: ; 17d93a
	call Function17e415
	ld de, $c708
	ld bc, $5
	call CopyBytes
	call Function17e41e
	call Function17e32b
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	ld a, [$c70c]
	call Function17e6de
	ld a, [$c70a]
	ld [CurPartySpecies], a
	ld a, [$c70c]
	ld e, a
	callba LoadMonPaletteAsNthBGPal
	call SetPalettes
	ld a, [$c708]
	ld l, a
	ld a, [$c709]
	ld h, a
	ld a, [$c70b]
	ld c, a
	decoord 0, 0
	add hl, de
	ld e, l
	ld d, h
	callba HOF_AnimateFrontpic
	pop af
	ld [rSVBK], a
	call Function17e349
	ret
; 17d98b

Function17d98b: ; 17d98b
	call Function17e415
	ld de, $c708
	ld bc, $4
	call CopyBytes
	call Function17e41e
	call Function17e32b
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	ld a, [$c70b]
	call Function17e6de
	ld a, [$c70a]
	ld [TrainerClass], a
	ld a, [$c70b]
	ld e, a
	callba LoadTrainerClassPaletteAsNthBGPal
	call SetPalettes
	ld a, [$c708]
	ld e, a
	ld a, [$c709]
	ld d, a
	push de
	ld de, VTiles2
	callba GetTrainerPic
	pop hl
	decoord 0, 0
	add hl, de
	ld bc, $707
	predef PlaceGraphic
	pop af
	ld [rSVBK], a
	call Function17e349
	ret
; 17d9e3

Function17d9e3: ; 17d9e3
	call Function17e415
	ld de, $c708
	ld bc, $7
	call CopyBytes
	call Function17e41e
	ld a, [$c70b]
	push af
	cp $c0
	jr c, .asm_17da01
	ld a, [$c70c]
	ld [rSVBK], a
	jr .asm_17da07

.asm_17da01
	ld a, [$c70c]
	call GetSRAMBank

.asm_17da07
	ld a, [$c708]
	ld l, a
	ld a, [$c709]
	ld h, a
	ld a, [$c70a]
	ld e, a
	ld a, [$c70b]
	ld d, a
	ld a, [$c70d]
	ld c, a
	ld a, [$c70e]
	ld b, a
	call CopyBytes
	pop af
	cp $c0
	jr c, .asm_17da2d
	ld a, $4
	ld [rSVBK], a
	jr .asm_17da30

.asm_17da2d
	call CloseSRAM

.asm_17da30
	ret
; 17da31

Function17da31: ; 17da31
	call Function17e415
	ld de, $c708
	ld bc, $4
	call CopyBytes
	call Function17e41e
	ld a, [$c709]
	push af
	cp $c0
	jr c, .asm_17da4f
	ld a, [$c70a]
	ld [rSVBK], a
	jr .asm_17da55

.asm_17da4f
	ld a, [$c70a]
	call GetSRAMBank

.asm_17da55
	ld a, [$c708]
	ld e, a
	ld a, [$c709]
	ld d, a
	ld a, [$c70b]
	ld c, a
	bit 7, c
	jr nz, .asm_17da70
	ld hl, Unknown_17da8c
	ld b, $0
	add hl, bc
	ld a, [de]
	or [hl]
	ld [de], a
	jr .asm_17da7d

.asm_17da70
	ld hl, Unknown_17da94
	ld a, c
	and $7f
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [de]
	and [hl]
	ld [de], a

.asm_17da7d
	pop af
	cp $c0
	jr c, .asm_17da88
	ld a, $4
	ld [rSVBK], a
	jr .asm_17da8b

.asm_17da88
	call CloseSRAM

.asm_17da8b
	ret
; 17da8c

Unknown_17da8c:
x = 0
	rept 8
	db 1 << x
x = x + 1
	endr

Unknown_17da94:
x = 0
	rept 8
	db (1 << x) ^ $ff
x = x + 1
	endr
; 17da9c

Function17da9c: ; 17da9c
	ld a, [wcd31]
	dec a
	jr z, .asm_17dabd
	push af
	call Function17e566
	pop af
	ld [wcd31], a
	ld hl, wcd24
	ld a, [wcd2e]
	sub [hl]
	ld [wcd2e], a
	call Function17e55b
	call Function17e5af
.asm_17daba
	jp Function17e415

.asm_17dabd
	ld a, [wcd2f]
	and a
	jr z, .asm_17daba
	ld hl, wcd24
	sub [hl]
	ld [wcd2f], a
	ld a, [wcd2e]
	sub [hl]
	ld [wcd2e], a
	call Function17e451
	call Function17e55b
	call Function17e5af
	jr .asm_17daba
; 17dadc

Function17dadc: ; 17dadc
	ld a, [wcd2e]
	ld hl, wcd24
	add [hl]
	ld hl, wcd42
	cp [hl]
	jr z, .asm_17db0e
	jr nc, .asm_17db0e
	ld hl, wcd31
	ld a, [wcd2b]
	cp [hl]
	jr z, .asm_17db11
	call Function17e566
	ld a, [wcd31]
	inc a
	ld [wcd31], a
	ld hl, wcd24
	ld a, [wcd2e]
	add [hl]
	ld [wcd2e], a
	call Function17e55b
	call Function17e5af

.asm_17db0e
	jp Function17e415

.asm_17db11
	ld hl, wcd24
	ld a, [wcd2f]
	add [hl]
	ld [wcd2f], a
	ld a, [wcd2e]
	add [hl]
	ld [wcd2e], a
	call Function17e451
	call Function17e55b
	call Function17e5af
	jr .asm_17db0e
; 17db2d

Function17db2d: ; 17db2d
	ld a, [wcd30]
	ld hl, wcd24
	cp [hl]
	jr z, .asm_17db53
	ld hl, wcd42
	ld a, [wcd2e]
	inc a
	cp [hl]
	jr z, .asm_17db53
	ld [wcd2e], a
	call Function17e566
	ld a, [wcd30]
	inc a
	ld [wcd30], a
	call Function17e55b
	call Function17e5af

.asm_17db53
	jp Function17e415
; 17db56

Function17db56: ; 17db56
	ld a, [wcd30]
	cp $1
	jr z, .asm_17db74
	call Function17e566
	ld a, [wcd30]
	dec a
	ld [wcd30], a
	ld a, [wcd2e]
	dec a
	ld [wcd2e], a
	call Function17e55b
	call Function17e5af

.asm_17db74
	jp Function17e415
; 17db77

Function17db77: ; 17db77
	ld hl, wcd2d
	ld a, [wcd2f]
	add [hl]
	ld hl, wcd42
	cp [hl]
	jr z, .asm_17dbae
	jr nc, .asm_17dbae
	call Function17e566
	ld hl, wcd2d
	ld a, [wcd2f]
	add [hl]
	ld [wcd2f], a
	ld a, [wcd2e]
	add [hl]
	ld hl, wcd42
	cp [hl]
	jr c, .asm_17db9f
	ld a, [hl]
	dec a

.asm_17db9f
	ld [wcd2e], a
	call Function17dbb1
	call Function17e451
	call Function17e55b
	call Function17e5af

.asm_17dbae
	jp Function17e415
; 17dbb1

Function17dbb1: ; 17dbb1
	ld hl, wcd2f
	ld a, [wcd42]
	sub [hl]
	ld hl, wcd2d
	cp [hl]
	ret nc
	ld a, $1
	ld [wcd30], a
	ld [wcd31], a
	ld a, [wcd24]
	ld c, a
	ld a, [wcd24]
	ld b, a
	ld a, [wcd2e]
	ld hl, wcd2f
	sub [hl]
.asm_17dbd4
	and a
	ret z
	push af
	ld hl, wcd30
	ld a, b
	cp [hl]
	jr nz, .asm_17dbe4
	ld a, $1
	ld [hl], a
	ld hl, wcd31

.asm_17dbe4
	inc [hl]
	pop af
	dec a
	jr .asm_17dbd4
; 17dbe9

Function17dbe9: ; 17dbe9
	ld hl, wcd2d
	ld a, [wcd2f]
	sub [hl]
	bit 7, a
	jr z, .asm_17dbf5
	xor a

.asm_17dbf5
	ld [wcd2f], a
	ld a, [wcd30]
	dec a
	ld c, a
	ld a, [wcd31]
	ld b, a
	xor a
	ld hl, wcd24
.asm_17dc05
	dec b
	jr z, .asm_17dc0b
	add [hl]
	jr .asm_17dc05

.asm_17dc0b
	add c
	ld hl, wcd2f
	add [hl]
	ld [wcd2e], a
	call Function17e451
	call Function17e55b
	call Function17e5af
	jp Function17e415
; 17dc1f

Function17dc1f: ; 17dc1f
	call Function17e415
	ld de, $c688
	ld bc, $6
	call CopyBytes
	call Function17e32b
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	ld hl, $c688
	ld a, $40
	ld [$c708], a
	ld a, [hli]
	ld [$c70a], a
	add $5
	ld [$c70c], a
	ld a, [hli]
	ld [$c709], a
	add $4
	ld [$c70b], a
	ld a, $96
	ld [$c70d], a
	ld a, $5c
	ld [$c70e], a
	ld a, $1
	ld [$c70f], a
	ld hl, $c708
	call LoadMenuDataHeader
	call VerticalMenu
	jr nc, .asm_17dc6e
	ld a, $2
	ld [wMenuCursorY], a

.asm_17dc6e
	call CloseWindow
	pop af
	ld [rSVBK], a
	ld a, [wMenuCursorY]
	cp $1
	jr nz, .asm_17dc85
	ld a, [$c68a]
	ld l, a
	ld a, [$c68a + 1]
	ld h, a
	jr .asm_17dc8d

.asm_17dc85
	ld a, [$c68a + 2]
	ld l, a
	ld a, [$c68a + 3]
	ld h, a

.asm_17dc8d
	push hl
	call Function17e349
	pop hl
	call Function17e40f
	ret
; 17dc96

MenuData2_17dc96:
	db $e0 ; flags
	db 2
	db "はい@"
	db "いいえ@"
; 17dc9f

Function17dc9f: ; 17dc9f
	call Function17e415
	call Function17e41e
	call RotateFourPalettesLeft
	ret
; 17dca9

Function17dca9: ; 17dca9
	call Function17e415
	call Function17e41e

Function17dcaf:
	ld a, $5
	ld [rSVBK], a
	ld hl, UnknBGPals
	ld de, $8
	ld c, $8
.asm_17dcbb
	push hl
	ld a, $ff
	ld [hli], a
	ld a, $7f
	ld [hl], a
	pop hl
	add hl, de
	dec c
	jr nz, .asm_17dcbb
	call RotateThreePalettesRight
	ld a, $4
	ld [rSVBK], a
	ret
; 17dccf

Function17dccf: ; 17dccf
	call Function17e415
	push hl
	ld a, [wcd4b]
	ld l, a
	ld a, [wcd4c]
	ld h, a
	ld a, [wcd2e]
	ld c, a
	ld b, $0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld c, a
	ld a, [hl]
	ld b, a
	call Function17e43d
	call Function17e41e
.asm_17dced
	ld a, [wcd78]
	ld l, a
	ld a, [wcd79]
	ld h, a
	ld a, [hl]
	cp $ff
	jr z, .asm_17dd0d
.crash_loop
	cp $31
	jr nc, .crash_loop
	call Function17d711
	ld a, [wcd77]
	bit 7, a
	jr nz, .asm_17dd0d
	and a
	jr z, .asm_17dd11
	jr .asm_17dced

.asm_17dd0d
	pop hl
	jp Function17e41e

.asm_17dd11
	pop hl
	ret
; 17dd13

Function17dd13: ; 17dd13
	call Function17e415
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	call Function17e41e
	call Function17e447
	push hl
	hlcoord 0, 0
	add hl, bc
	push hl
	pop bc
	pop hl
	call PlaceHLTextAtBC
	ret
; 17dd30

Function17dd30: ; 17dd30
	call Function17e415
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld b, $0
	ld a, [hli]
	push af
	call Function17e41e
	pop af
	hlcoord 0, 0
	add hl, de
	call Function17e600
	ret
; 17dd49

Function17dd49: ; 17dd49
	call Function17e415
	ld de, $c708
	ld bc, $a
	call CopyBytes
	ld a, [$c711]
	ld c, a
	ld b, $0
	call CopyBytes
	ld a, [$c70a]
	cp $c0
	jr c, .sram
	ld a, [$c708]
	ld [rSVBK], a
	jr .got_bank

.sram
	ld a, [$c708]
	call GetSRAMBank

.got_bank
	ld a, [$c709]
	ld l, a
	ld a, [$c70a]
	ld h, a
	ld de, $c688
	ld a, [$c711]
	ld c, a
	ld b, $0
	call CopyBytes
	ld a, [$c70a]
	cp $c0
	jr c, .close_sram
	ld a, $4
	ld [rSVBK], a
	jr .exited_bank

.close_sram
	call CloseSRAM

.exited_bank
	ld a, [$c711]
	ld c, a
	ld hl, $c712
	ld de, $c688
.loop
	ld a, [de]
	inc de
	cp [hl]
	inc hl
	jr z, .next
	jr c, .load
	jr .load2

.next
	dec c
	jr nz, .loop
	ld a, [$c70d]
	ld l, a
	ld a, [$c70e]
	ld h, a
	jr .done

.load2
	ld a, [$c70f]
	ld l, a
	ld a, [$c710]
	ld h, a
	jr .done

.load
	ld a, [$c70b]
	ld l, a
	ld a, [$c70c]
	ld h, a

.done
	call Function17e40f
	ret
; 17ddcd

Function17ddcd: ; 17ddcd
	call Function17e415
	ld de, $c708
	ld bc, $8
	call CopyBytes
	ld a, [$c70a]
	cp $c0
	jr c, .asm_17dde7
	ld a, [$c708]
	ld [rSVBK], a
	jr .asm_17dded

.asm_17dde7
	ld a, [$c708]
	call GetSRAMBank

.asm_17dded
	ld a, [$c709]
	ld e, a
	ld a, [$c70a]
	ld d, a
	ld a, [de]
	ld [$c710], a
	ld a, [$c70b]
	ld c, a
	ld b, $0
	ld a, [$c70a]
	cp $c0
	jr c, .asm_17de0c
	ld a, $4
	ld [rSVBK], a
	jr .asm_17de0f

.asm_17de0c
	call CloseSRAM

.asm_17de0f
	push hl
	ld hl, Unknown_17da8c
	add hl, bc
	ld a, [hl]
	ld hl, $c710
	and [hl]
	pop hl
	jr nz, .asm_17de26
	ld a, [$c70e]
	ld l, a
	ld a, [$c70f]
	ld h, a
	jr .asm_17de2e

.asm_17de26
	ld a, [$c70c]
	ld l, a
	ld a, [$c70d]
	ld h, a

.asm_17de2e
	call Function17e40f
	ret
; 17de32

Function17de32: ; 17de32
	call Function17e415
	ld de, $c708
	ld bc, $9
	call CopyBytes
	ld a, [$c710]
	ld c, a
	ld b, $0
	call CopyBytes
	ld a, $6
	call GetSRAMBank
	call Function17f4f6
	ld a, [$c708]
	ld e, a
	ld a, [$c709]
	ld d, a
	add hl, de
	ld e, l
	ld d, h
	ld a, [$c710]
	ld c, a
	ld hl, $c711
.asm_17de61
	ld a, [de]
	inc de
	cp [hl]
	inc hl
	jr z, .asm_17de6b
	jr c, .asm_17de82
	jr .asm_17de78

.asm_17de6b
	dec c
	jr nz, .asm_17de61
	ld a, [$c70c]
	ld l, a
	ld a, [$c70d]
	ld h, a
	jr .asm_17de8a

.asm_17de78
	ld a, [$c70e]
	ld l, a
	ld a, [$c70f]
	ld h, a
	jr .asm_17de8a

.asm_17de82
	ld a, [$c70a]
	ld l, a
	ld a, [$c70b]
	ld h, a

.asm_17de8a
	call CloseSRAM
	call Function17e40f
	ret
; 17de91

Function17de91: ; 17de91
	call Function17e415
	ld de, $c708
	ld bc, $7
	call CopyBytes
	ld a, $6
	call GetSRAMBank
	call Function17f4f6
	ld a, [$c708]
	ld e, a
	ld a, [$c709]
	ld d, a
	add hl, de
	ld e, l
	ld d, h
	ld a, [$c70a]
	ld c, a
	ld b, $0
	ld hl, Unknown_17da8c
	add hl, bc
	ld a, [hl]
	ld l, e
	ld h, d
	and [hl]
	jr nz, .asm_17deca
	ld a, [$c70d]
	ld l, a
	ld a, [$c70e]
	ld h, a
	jr .asm_17ded2

.asm_17deca
	ld a, [$c70b]
	ld l, a
	ld a, [$c70c]
	ld h, a

.asm_17ded2
	call CloseSRAM
	call Function17e40f
	ret
; 17ded9

Function17ded9: ; 17ded9
	call Function17e415
	ld de, $c708
	ld bc, $1f
	call CopyBytes
	call Function17e32b
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	ld hl, $c708
	ld a, [hli]
	ld [CurPartySpecies], a
	ld [TempEnemyMonSpecies], a
	ld a, [hli]
	ld [CurPartyLevel], a
	ld a, [hli]
	ld b, a
	ld a, [PartyCount]
	cp $6
	jp nc, Function17e026
	xor a
	ld [MonType], a
	push hl
	push bc
	predef TryAddMonToParty
	callba SetCaughtData
	pop bc
	pop hl
	bit 1, b
	jr z, .asm_17df33
	push bc
	push hl
	ld a, [PartyCount]
	dec a
	ld hl, PartyMonNicknames
	call SkipNames
	ld d, h
	ld e, l
	pop hl
	call CopyBytes
	pop bc
	jr .asm_17df37

.asm_17df33
	ld de, $6
	add hl, de

.asm_17df37
	bit 2, b
	jr z, .asm_17df5a
	push bc
	push hl
	ld a, [PartyCount]
	dec a
	ld hl, PartyMonOT
	call SkipNames
	ld d, h
	ld e, l
	pop hl
	call CopyBytes
	ld a, [hli]
	ld b, a
	push hl
	callba SetGiftPartyMonCaughtData
	pop hl
	pop bc
	jr .asm_17df5e

.asm_17df5a
	ld de, $7
	add hl, de

.asm_17df5e
	bit 3, b
	jr z, .asm_17df79
	push bc
	push hl
	ld a, [PartyCount]
	dec a
	ld hl, PartyMon1ID
	call GetPartyLocation
	ld d, h
	ld e, l
	pop hl
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	pop bc
	jr .asm_17df7b

.asm_17df79
	inc hl
	inc hl

.asm_17df7b
	bit 4, b
	jr z, .asm_17dfd0
	push bc
	push hl
	ld a, [PartyCount]
	dec a
	ld hl, PartyMon1DVs
	call GetPartyLocation
	ld d, h
	ld e, l
	pop hl
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	push hl
	ld a, [PartyCount]
	dec a
	ld hl, PartyMon1Species
	call GetPartyLocation
	ld a, [hl]
	ld [CurSpecies], a
	call GetBaseData
	ld a, [PartyCount]
	dec a
	ld hl, PartyMon1MaxHP
	call GetPartyLocation
	ld d, h
	ld e, l
	push hl
	ld b, $0
	callba CalcPkmnStats
	ld a, [PartyCount]
	dec a
	ld hl, PartyMon1HP
	call GetPartyLocation
	ld d, h
	ld e, l
	pop hl
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	pop hl
	pop bc
	jr .asm_17dfd2

.asm_17dfd0
	inc hl
	inc hl

.asm_17dfd2
	bit 5, b
	jr z, .asm_17dfea
	push bc
	push hl
	ld a, [PartyCount]
	dec a
	ld hl, PartyMon1Item
	call GetPartyLocation
	ld d, h
	ld e, l
	pop hl
	ld a, [hli]
	ld [de], a
	pop bc
	jr .asm_17dfeb

.asm_17dfea
	inc hl

.asm_17dfeb
	bit 6, b
	jr z, .asm_17e01f
	push bc
	push hl
	ld a, [PartyCount]
	dec a
	ld hl, PartyMon1Moves
	call GetPartyLocation
	ld d, h
	ld e, l
	pop hl
	push de
	ld bc, $4
	call CopyBytes
	pop de
	push hl
	push de
	ld a, [PartyCount]
	dec a
	ld hl, PartyMon1PP
	call GetPartyLocation
	ld d, h
	ld e, l
	pop hl
	predef FillPP
	pop hl
	pop bc
	jp asm_17e0ee

.asm_17e01f
	ld de, $4
	add hl, de
	jp asm_17e0ee
; 17e026

Function17e026: ; 17e026
	ld a, BANK(sBoxCount)
	call GetSRAMBank
	ld a, [sBoxCount]
	call CloseSRAM
	cp $14
	jp nc, .asm_17e0ea
	bit 0, b
	jp z, .asm_17e0ea
	push bc
	push hl
	callba LoadEnemyMon
	callba SentPkmnIntoBox
	callba SetBoxMonCaughtData
	pop hl
	pop bc
	ld a, BANK(sBoxMonNicknames)
	call GetSRAMBank
	bit 1, b
	jr z, .asm_17e067
	push bc
	ld bc, $b
	ld de, sBoxMonNicknames
	call CopyBytes
	pop bc
	jr .asm_17e06b

.asm_17e067
	ld de, $6
	add hl, de

.asm_17e06b
	bit 2, b
	jr z, .asm_17e08e
	push bc
	ld bc, $6
	ld de, sBoxMonOT
	call CopyBytes
	ld a, [hli]
	ld b, a
	push hl
	call CloseSRAM
	callba SetGiftBoxMonCaughtData
	ld a, $1
	call GetSRAMBank
	pop hl
	pop bc
	jr .asm_17e092

.asm_17e08e
	ld de, $7
	add hl, de

.asm_17e092
	bit 3, b
	jr z, .asm_17e0a2
	push bc
	ld de, sBoxMon1ID
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	pop bc
	jr .asm_17e0a4

.asm_17e0a2
	inc hl
	inc hl

.asm_17e0a4
	bit 4, b
	jr z, .asm_17e0b4
	push bc
	ld de, sBoxMon1DVs
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	pop bc
	jr .asm_17e0b6

.asm_17e0b4
	inc hl
	inc hl

.asm_17e0b6
	bit 5, b
	ld a, [hli]
	jr z, .asm_17e0be
	ld [sBoxMon1Item], a

.asm_17e0be
	bit 6, b
	jr z, .asm_17e0e1
	push bc
	ld de, sBoxMon1Moves
	ld bc, $4
	call CopyBytes
	push hl
	ld hl, sBoxMon1Moves
	ld de, sBoxMon1PP
	predef FillPP
	call CloseSRAM
	pop hl
	pop bc
	inc hl
	inc hl
	jr asm_17e0ee

.asm_17e0e1
	call CloseSRAM
	ld de, $6
	add hl, de
	jr asm_17e0ee

.asm_17e0ea
	ld bc, $1a
	add hl, bc

asm_17e0ee
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	ld [rSVBK], a
	push hl
	call Function17e349
	pop hl
	call Function17e40f
	ret
; 17e0fd

Function17e0fd: ; 17e0fd
	call Function17e415
	ld de, $c708
	ld bc, $6
	call CopyBytes
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	ld hl, $c708
	ld a, [hli]
	ld [CurItem], a
	ld a, [hli]
	ld [wItemQuantityChangeBuffer], a
	push hl
	ld hl, NumItems
	call ReceiveItem
	pop hl
	jr c, .asm_17e127
	inc hl
	inc hl

.asm_17e127
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld h, a
	ld l, b
	pop af
	ld [rSVBK], a
	call Function17e40f
	ret
; 17e133

Function17e133: ; 17e133
	call Function17e415
	ld de, $c708
	ld bc, $5
	call CopyBytes
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	ld hl, $c708
	ld a, [hli]
	ld [ScriptVar], a
	push hl
	callba MobileCheckOwnMonAnywhere
	pop hl
	jr c, .asm_17e159
	inc hl
	inc hl

.asm_17e159
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld h, a
	ld l, b
	pop af
	ld [rSVBK], a
	call Function17e40f
	ret
; 17e165

Function17e165: ; 17e165
	call Function17e415
	ld de, $c708
	ld bc, $5
	call CopyBytes
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	ld hl, $c708
	ld a, [hli]
	ld [CurItem], a
	push hl
	ld hl, NumItems
	call CheckItem
	pop hl
	jr c, .asm_17e195
	push hl
	ld hl, PCItems
	call CheckItem
	pop hl
	jr c, .asm_17e195
	inc hl
	inc hl

.asm_17e195
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld h, a
	ld l, b
	pop af
	ld [rSVBK], a
	call Function17e40f
	ret
; 17e1a1

Function17e1a1: ; 17e1a1
	call Function17e415
	ld de, $c708
	ld bc, $d
	call CopyBytes
	ld a, [$c70a]
	cp $c0
	jr c, .asm_17e1bb
	ld a, [$c708]
	ld [rSVBK], a
	jr .asm_17e1c1

.asm_17e1bb
	ld a, [$c708]
	call GetSRAMBank

.asm_17e1c1
	ld a, [$c709]
	ld l, a
	ld a, [$c70a]
	ld h, a
	ld de, $c608
	ld a, [$c70b]
	ld c, a
	ld b, $0
	call CopyBytes
	ld a, [$c70a]
	cp $c0
	jr c, .asm_17e1e2
	ld a, $4
	ld [rSVBK], a
	jr .asm_17e1e5

.asm_17e1e2
	call CloseSRAM

.asm_17e1e5
	ld a, [$c70e]
	cp $c0
	jr c, .asm_17e1f3
	ld a, [$c70c]
	ld [rSVBK], a
	jr .asm_17e1f9

.asm_17e1f3
	ld a, [$c70c]
	call GetSRAMBank

.asm_17e1f9
	ld a, [$c70d]
	ld l, a
	ld a, [$c70e]
	ld h, a
	ld de, $c688
	ld a, [$c70b]
	ld c, a
	ld b, $0
	call CopyBytes
	ld a, [$c70e]
	cp $c0
	jr c, .asm_17e21a
	ld a, $4
	ld [rSVBK], a
	jr .asm_17e21d

.asm_17e21a
	call CloseSRAM

.asm_17e21d
	ld a, [$c70b]
	ld c, a
	ld hl, $c688
	ld de, $c608
.asm_17e227
	ld a, [de]
	inc de
	cp [hl]
	inc hl
	jr z, .asm_17e231
	jr c, .asm_17e23e
	jr .asm_17e248

.asm_17e231
	dec c
	jr nz, .asm_17e227
	ld a, [$c711]
	ld l, a
	ld a, [$c712]
	ld h, a
	jr .asm_17e250

.asm_17e23e
	ld a, [$c70f]
	ld l, a
	ld a, [$c710]
	ld h, a
	jr .asm_17e250

.asm_17e248
	ld a, [$c712 + 1]
	ld l, a
	ld a, [$c712 + 2]
	ld h, a

.asm_17e250
	call Function17e40f
	ret
; 17e254

Function17e254: ; 17e254
	call Function17e415
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld [de], a
	call Function17e41e
	ret
; 17e261

Function17e261: ; 17e261
	call Function17e415
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [de]
	add [hl]
	ld [de], a
	inc hl
	call Function17e41e
	ret
; 17e270

Function17e270: ; 17e270
	call Function17e415
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [de]
	sub [hl]
	ld [de], a
	inc hl
	call Function17e41e
	ret
; 17e27f

Function17e27f: ; 17e27f
	call Function17e415
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	call Function17e41e
	ld l, c
	ld h, b
	ld a, [de]
	add [hl]
	ld [de], a
	ret
; 17e293

Function17e293: ; 17e293
	call Function17e415
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	call Function17e41e
	ld l, c
	ld h, b
	ld a, [de]
	sub [hl]
	ld [de], a
	ret
; 17e2a7

Function17e2a7: ; 17e2a7
	call Function17e415
	call Function17e41e
	call Function17e32b
	xor a
	ld [wcf66], a
	callba Function118233
	ld de, GFX_17eb7e
	ld hl, VTiles2 tile $60
	lb bc, BANK(GFX_17eb7e), 1
	call Get2bpp
	ld a, [wc300]
	and a
	jr z, .asm_17e2d8
	cp $a
	jr z, .asm_17e2f7
	cp $b
	jr z, .asm_17e300
	call Function17e309
	ret

.asm_17e2d8
	call Function17d60b
	call Function17e349
	xor a
	ld [wcd7a], a
	ld a, $5
	call GetSRAMBank
	ld hl, $aa73
	ld de, $aa7f
	ld bc, $c
	call CopyBytes
	call CloseSRAM
	ret

.asm_17e2f7
	call Function17e349
	ld a, $1
	ld [wcd7a], a
	ret

.asm_17e300
	call Function17e349
	ld a, $2
	ld [wcd7a], a
	ret
; 17e309

Function17e309: ; 17e309
	ld a, $2
	ld [wc303], a
	call Function17dcaf
	call ClearScreen
	call Function17e349
	call Function17d5f6
	callba Function17f555
	call Function17e349
	call Function17dcaf
	xor a
	ld [wcd77], a
	ret
; 17e32b

Function17e32b: ; 17e32b
	ld a, $5
	call GetSRAMBank
	ld hl, $c608
	ld de, $b0b1
	ld bc, $40
	call CopyBytes
	ld hl, BGMapBuffer
	ld bc, $5b
	call CopyBytes
	call CloseSRAM
	ret
; 17e349

Function17e349: ; 17e349
	ld a, $5
	call GetSRAMBank
	ld hl, $b0b1
	ld de, $c608
	ld bc, $40
	call CopyBytes
	ld de, BGMapBuffer
	ld bc, $5b
	call CopyBytes
	call CloseSRAM
	ret
; 17e367

Function17e367: ; 17e367
	call Function17e415
	call Function17e41e
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	callba SaveGameData_
	pop af
	ld [rSVBK], a
	ret
; 17e37e

Function17e37e: ; 17e37e
	call Function17e415
	call Function17e41e
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	callba SaveAfterLinkTrade
	pop af
	ld [rSVBK], a
	ret
; 17e395

Function17e395: ; 17e395
	call Function17e415
	call Function17e41e
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	callba SaveBox
	pop af
	ld [rSVBK], a
	ret
; 17e3ac

Function17e3ac: ; 17e3ac
	call Function17e415
	call Function17e41e
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	callba SaveChecksum
	pop af
	ld [rSVBK], a
	ret
; 17e3c3

Function17e3c3: ; 17e3c3
	call Function17e415
	call Function17e41e
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	callba UpdateTrainerRankingsChecksum2
	callba BackupMobileEventIndex
	pop af
	ld [rSVBK], a
	ret
; 17e3e0

Function17e3e0: ; 17e3e0
	call Function17e415
	ld a, [hli]
	ld c, a
	call Function17e41e
	ld a, $1
	ld [hBGMapMode], a
	call DelayFrames
	ret
; 17e3f0

Function17e3f0: ; 17e3f0
	call Function17e415
	call Function17e41e
.asm_17e3f6
	call JoyTextDelay
	ld hl, hJoyPressed
	ld a, [hl]
	and $1
	ret nz
	ld a, [hl]
	and $2
	ret nz
	call WaitBGMap
	jr .asm_17e3f6
; 17e409

Function17e409: ; 17e409
	ld hl, wcd77
	set 7, [hl]
	ret
; 17e40f

Function17e40f: ; 17e40f
	ld de, UnknBGPals
	add hl, de
	jr Function17e41e

Function17e415:
	ld a, [wcd78]
	ld l, a
	ld a, [wcd79]
	ld h, a
	inc hl

Function17e41e:
	ld a, l
	ld [wcd78], a
	ld a, h
	ld [wcd79], a
	ret
; 17e427

Function17e427: ; 17e427
	ld hl, hJoyPressed
	ld a, [hl]
	and $1
	jr nz, .asm_17e432
	and $2
	ret z

.asm_17e432
	ld a, $3
	ld [wcd77], a
	ret
; 17e438

Function17e438: ; 17e438
	ld hl, wcd77
	inc [hl]
	ret
; 17e43d

Function17e43d: ; 17e43d
	ld a, [BGMapBuffer]
	ld l, a
	ld a, [wcd21]
	ld h, a
	add hl, bc
	ret
; 17e447

Function17e447: ; 17e447
	ld a, [BGMapBuffer]
	ld l, a
	ld a, [wcd21]
	ld h, a
	add hl, de
	ret
; 17e451

Function17e451: ; 17e451
	ld a, [wcd42]
	and a
	ret z
	call Function17e51b
	call Function17e4dd
	ld a, [wcd2e]
	push af
	ld a, [wcd49]
	ld l, a
	ld a, [wcd4a]
	ld h, a
	ld a, [wcd2f]
	ld [wcd2e], a
	ld c, a
	ld b, $0
	add hl, bc
	add hl, bc
	push hl
	hlcoord 0, 0
	ld bc, $14
	ld a, [wcd23]
	call AddNTimes
	ld a, [CreditsTimer]
	ld c, a
	ld b, $0
	add hl, bc
	pop bc
	ld a, [wMobileCommsJumptableIndex]
.asm_17e48b
	push af
	push hl
	ld a, [wcd24]
.asm_17e490
	push af
	push hl
	ld a, [bc]
	inc bc
	ld e, a
	ld a, [bc]
	inc bc
	ld d, a
	push bc
	push hl
	ld a, [BGMapBuffer]
	ld l, a
	ld a, [wcd21]
	ld h, a
	add hl, de
	push hl
	pop de
	pop hl
	call PlaceString
	pop bc
	pop hl
	ld a, [wcd26]
	ld e, a
	ld d, $0
	add hl, de
	ld a, [wcd2e]
	inc a
	ld [wcd2e], a
	ld e, a
	ld a, [wcd42]
	cp e
	jr z, .asm_17e4d5
	pop af
	dec a
	jr nz, .asm_17e490
	pop hl
	ld a, [wcd27]
	ld de, $14
.asm_17e4cb
	add hl, de
	dec a
	jr nz, .asm_17e4cb
	pop af
	dec a
	jr nz, .asm_17e48b
	jr .asm_17e4d8

.asm_17e4d5
	pop af
	pop hl
	pop af

.asm_17e4d8
	pop af
	ld [wcd2e], a
	ret
; 17e4dd

Function17e4dd: ; 17e4dd
	ld a, [wcd2c]
	and $1
	ret z
	ld a, [wcd29]
	hlcoord 0, 0
	ld bc, $14
	call AddNTimes
	ld a, [wcd28]
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [wcd2f]
	and a
	jr z, .asm_17e4ff
	ld a, $61
	ld [hl], a

.asm_17e4ff
	ld a, [wcd2a]
	ld bc, $14
	call AddNTimes
	ld a, [wcd42]
	ld c, a
	ld a, [wcd2e]
	ld b, a
	ld a, [wcd24]
	add b
	cp c
	ret z
	ret nc
	ld a, $ee
	ld [hl], a
	ret
; 17e51b

Function17e51b: ; 17e51b
	ld a, [wcd28]
	ld hl, CreditsTimer
	sub [hl]
	inc a
	ld [wcd4f], a
	hlcoord 0, 0
	ld bc, $14
	ld a, [wcd23]
	dec a
	call AddNTimes
	ld a, [CreditsTimer]
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [wMobileCommsJumptableIndex]
	ld c, a
	ld a, [wcd27]
	call SimpleMultiply
.asm_17e544
	push af
	push hl
	ld a, [wcd4f]
	ld c, a
	ld b, $0
	ld a, $7f
	call ByteFill
	pop hl
	ld bc, $14
	add hl, bc
	pop af
	dec a
	jr nz, .asm_17e544
	ret
; 17e55b

Function17e55b: ; 17e55b
	ld a, [wcd42]
	and a
	ret z
	ld a, $ed
	call Function17e571
	ret
; 17e566

Function17e566: ; 17e566
	ld a, [wcd42]
	and a
	ret z
	ld a, $7f
	call Function17e571
	ret
; 17e571

Function17e571: ; 17e571
	push af
	hlcoord 0, 0
	ld bc, $14
	ld a, [wcd23]
	call AddNTimes
	ld a, [CreditsTimer]
	ld c, a
	ld b, $0
	add hl, bc
	dec hl
	push hl
	ld a, [wcd31]
	dec a
	ld c, a
	ld a, [wcd27]
	call SimpleMultiply
	ld l, $0
	ld h, l
	ld bc, $14
	call AddNTimes
	ld a, [wcd30]
	dec a
	ld c, a
	ld a, [wcd26]
	call SimpleMultiply
	ld c, a
	ld b, $0
	add hl, bc
	pop bc
	add hl, bc
	pop af
	ld [hl], a
	ret
; 17e5af

Function17e5af: ; 17e5af
	ld a, [wcd2c]
	and $2
	ret z
	ld a, [wcd43]
	ld l, a
	ld a, [wMobileInactivityTimerMinutes]
	ld h, a
	bccoord 0, 0
	add hl, bc
	ld bc, $ffec
	add hl, bc
	ld a, [wMobileInactivityTimerSeconds]
	ld c, a
	ld b, $0
	ld a, [wMobileInactivityTimerFrames]
	call Function17e600
	ld a, [wcd2e]
	ld c, a
	ld b, $0
	ld a, [wcd4d]
	ld l, a
	ld a, [wcd4e]
	ld h, a
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [BGMapBuffer]
	ld l, a
	ld a, [wcd21]
	ld h, a
	add hl, de
	push hl
	pop de
	ld a, [wcd43]
	ld l, a
	ld a, [wMobileInactivityTimerMinutes]
	ld h, a
	bccoord 0, 0
	add hl, bc
	call PlaceString
	ret
; 17e600

Function17e600: ; 17e600
.asm_17e600
	push af
	push hl
	push bc
	ld a, $7f
	call ByteFill
	pop bc
	pop hl
	ld de, $14
	add hl, de
	pop af
	dec a
	jr nz, .asm_17e600
	ret
; 17e613

Function17e613: ; 17e613
	push hl
	hlcoord 0, 0
	ld bc, $14
	ld a, [de]
	inc de
	push af
	ld a, [de]
	inc de
	and a
.asm_17e620
	jr z, .asm_17e626
	add hl, bc
	dec a
	jr .asm_17e620

.asm_17e626
	pop af
	ld c, a
	ld b, $0
	add hl, bc
	push hl
	ld a, [wcd53]
	ld [hli], a
	ld a, [de]
	inc de
	dec a
	dec a
	jr z, .asm_17e63f
	ld c, a
	ld a, [wcd53]
	inc a
.asm_17e63b
	ld [hli], a
	dec c
	jr nz, .asm_17e63b

.asm_17e63f
	ld a, [wcd53]
	add $2
	ld [hl], a
	pop hl
	ld bc, $14
	add hl, bc
	ld a, [de]
	dec de
	dec a
	dec a
	jr z, .asm_17e674
	ld b, a
.asm_17e651
	push hl
	ld a, [wcd53]
	add $3
	ld [hli], a
	ld a, [de]
	dec a
	dec a
	jr z, .asm_17e664
	ld c, a
	ld a, $7f
.asm_17e660
	ld [hli], a
	dec c
	jr nz, .asm_17e660

.asm_17e664
	ld a, [wcd53]
	add $4
	ld [hl], a
	pop hl
	push bc
	ld bc, $14
	add hl, bc
	pop bc
	dec b
	jr nz, .asm_17e651

.asm_17e674
	ld a, [wcd53]
	add $5
	ld [hli], a
	ld a, [de]
	dec a
	dec a
	jr z, .asm_17e689
	ld c, a
	ld a, [wcd53]
	add $6
.asm_17e685
	ld [hli], a
	dec c
	jr nz, .asm_17e685

.asm_17e689
	ld a, [wcd53]
	add $7
	ld [hl], a
	pop hl
	ret
; 17e691

Function17e691: ; 17e691
	push hl
	ld hl, NULL
	ld bc, $14
	ld a, [de]
	inc de
	push af
	ld a, [de]
	inc de
	inc de
	and a
.asm_17e69f
	jr z, .asm_17e6a5
	add hl, bc
	dec a
	jr .asm_17e69f

.asm_17e6a5
	pop af
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [de]
	dec de
.asm_17e6ac
	push af
	push hl
	ld a, [de]
.asm_17e6af
	push af
	push hl
	push hl
	bccoord 0, 0
	add hl, bc
	ld a, [hl]
	cp $7f
	jr z, .asm_17e6c2
	ld a, [wcd53]
	add $8
	jr .asm_17e6c7

.asm_17e6c2
	ld a, [wcd53]
	jr .asm_17e6c7

.asm_17e6c7
	pop hl
	bccoord 0, 0, AttrMap
	add hl, bc
	ld [hl], a
	pop hl
	inc hl
	pop af
	dec a
	jr nz, .asm_17e6af
	pop hl
	ld bc, $14
	add hl, bc
	pop af
	dec a
	jr nz, .asm_17e6ac
	pop hl
	ret
; 17e6de

Function17e6de: ; 17e6de
	push af
	ld a, [$c708]
	ld l, a
	ld a, [$c709]
	ld h, a
	decoord 0, 0, AttrMap
	add hl, de
	pop af
	ld b, $7
.asm_17e6ee
	push hl
	ld c, $7
.asm_17e6f1
	ld [hli], a
	dec c
	jr nz, .asm_17e6f1
	pop hl
	ld de, $14
	add hl, de
	dec b
	jr nz, .asm_17e6ee
	ret
; 17e6fe


PokemonNewsGFX: ; 17e6fe
INCBIN "gfx/mobile/pokemon_news.2bpp"

GFX_17eb7e:
INCBIN "gfx/unknown/17eb7e.2bpp"

TileAttrmap_17eb8e:
INCBIN "gfx/unknown/17eb8e.attrmap"

Palette_17eff6:
	RGB 24,  9,  8
	RGB  4,  9, 18
	RGB 18, 18, 12
	RGB  0,  0,  0
	RGB 24, 24, 18
	RGB 18, 18, 12
	RGB  4,  9, 18
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 23, 11, 10
	RGB 13,  6,  5
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 15, 25,  5
	RGB 10, 20,  0
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 28, 20
	RGB 10, 18, 15
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 22, 22, 12
	RGB 17, 12,  5
	RGB  0,  0,  0
	RGB  5,  5, 16
	RGB  8, 19, 28
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 27, 24,  0
	RGB 24, 16,  3
	RGB  0,  0,  0


Function17f036:: ; 17f036
	ld a, $6
	call GetSRAMBank
	inc de
.asm_17f03c
	call Function17f047
	jr c, .asm_17f043
	jr .asm_17f03c

.asm_17f043
	call CloseSRAM
	ret
; 17f047

Function17f047: ; 17f047
	ld a, [de]
	inc de
	cp $50
	jr z, .finished
	cp $10
	jr nc, .finished
	dec a
	push de
	ld e, a
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.finished
	scf
	ret
; 17f061

.Jumptable: ; 17f061
	dw Function17f081 ; 0
	dw Function17f0f8 ; 1
	dw Function17f154 ; 2
	dw Function17f181 ; 3
	dw Function17f1d0 ; 4
	dw Function17f220 ; 5
	dw Function17f27b ; 6
	dw Function17f2cb ; 7
	dw Function17f2ff ; 8
	dw Function17f334 ; 9
	dw Function17f382 ; a
	dw Function17f3c9 ; b
	dw Function17f3f0 ; c
	dw Function17f41d ; d
	dw Function17f44f ; e
	dw Function17f44f ; f
; 17f081

Function17f081: ; 17f081
	pop hl
	call Function17f524
	jr c, .asm_17f09f
	ld de, 4
	add hl, de
	ld a, [hli]
	inc hl
	inc hl
	ld e, l
	ld d, h
	ld l, c
	ld h, b
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [de]
	cp $50
	jr z, .asm_17f09d
	and a
	ret

.asm_17f09d
	scf
	ret

.asm_17f09f
	push bc
	ld de, wcd54
	ld bc, 7
	call CopyBytes
	pop bc
	push hl
	push bc
	call Function17f4f6
	pop bc
	ld a, [wcd54]
	ld e, a
	ld a, [wcd55]
	ld d, a
	add hl, de
	ld e, l
	ld d, h
	ld l, c
	ld h, b
	push hl
	ld a, [wcd56]
	ld b, a
	ld a, [wcd57]
	ld c, a
	call MobilePrintNum
	ld a, l
	ld [wcd52], a
	ld a, h
	ld [wcd53], a
	ld a, [wcd59]
	and a
	jr z, .asm_17f0ee
	ld c, a
	ld a, [wcd57]
	inc a
	ld b, a
	ld e, l
	ld d, h
	dec de
.asm_17f0e0
	ld a, c
	cp b
	jr z, .asm_17f0ea
	ld a, [de]
	dec de
	ld [hld], a
	dec b
	jr .asm_17f0e0

.asm_17f0ea
	ld a, [wcd5a]
	ld [hl], a

.asm_17f0ee
	pop hl
	ld a, [wcd58]
	call Function17f50f
	pop de
	and a
	ret
; 17f0f8

Function17f0f8: ; 17f0f8
	pop hl
	call Function17f524
	jr c, .asm_17f114
	ld de, $3
	add hl, de
	ld a, [hli]
	ld e, l
	ld d, h
	ld l, c
	ld h, b
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [de]
	cp $50
	jr z, .asm_17f112
	and a
	ret

.asm_17f112
	scf
	ret

.asm_17f114
	push bc
	ld de, wcd54
	ld bc, $4
	call CopyBytes
	pop bc
	push hl
	push bc
	call Function17f4f6
	ld a, [wcd54]
	ld e, a
	ld a, [wcd55]
	ld d, a
	add hl, de
	ld de, $c608
	ld a, [wcd56]
	ld c, a
	ld b, $0
	call CopyBytes
	ld a, $50
	ld [de], a
	pop hl
	ld de, $c608
	call PlaceString
	ld a, c
	ld [wcd52], a
	ld a, b
	ld [wcd53], a
	ld a, [wcd57]
	call Function17f50f
	pop de
	and a
	ret
; 17f154

Function17f154: ; 17f154
	pop hl
	call Function17f524
	jr c, .asm_17f167
	inc hl
	inc hl
	ld e, l
	ld d, h
	ld a, [de]
	cp $50
	jr z, .asm_17f165
	and a
	ret

.asm_17f165
	scf
	ret

.asm_17f167
	push bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	pop bc
	push hl
	push bc
	call Function17f4f6
	add hl, de
	ld c, l
	ld b, h
	pop de
	callba Function11c08f
	ld c, l
	ld b, h
	pop de
	and a
	ret
; 17f181

Function17f181: ; 17f181
	pop hl
	call Function17f524
	jr c, .asm_17f19d
	ld de, $2
	add hl, de
	ld a, [hli]
	ld e, l
	ld d, h
	ld l, c
	ld h, b
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [de]
	cp $50
	jr z, .asm_17f19b
	and a
	ret

.asm_17f19b
	scf
	ret

.asm_17f19d
	push bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld [wcd54], a
	pop bc
	push hl
	push bc
	call Function17f4f6
	add hl, de
	ld a, [hl]
	ld c, a
	ld de, $c608
	callba Function48c63
	pop hl
	ld de, $c608
	call PlaceString
	ld a, c
	ld [wcd52], a
	ld a, b
	ld [wcd53], a
	ld a, [wcd54]
	call Function17f50f
	pop de
	and a
	ret
; 17f1d0

Function17f1d0: ; 17f1d0
	pop hl
	call Function17f524
	jr c, .asm_17f1ec
	ld de, $2
	add hl, de
	ld a, [hli]
	ld e, l
	ld d, h
	ld l, c
	ld h, b
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [de]
	cp $50
	jr z, .asm_17f1ea
	and a
	ret

.asm_17f1ea
	scf
	ret

.asm_17f1ec
	push bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld [wcd54], a
	pop bc
	push hl
	push bc
	call Function17f4f6
	add hl, de
	ld a, [hl]
	ld a, $1
	ld [rSVBK], a
	ld [wd265], a
	call GetPokemonName
	pop hl
	call PlaceString
	ld a, c
	ld [wcd52], a
	ld a, b
	ld [wcd53], a
	ld a, $4
	ld [rSVBK], a
	ld a, [wcd54]
	call Function17f50f
	pop de
	and a
	ret
; 17f220

Function17f220: ; 17f220
	pop hl
	call Function17f524
	jr c, .asm_17f23c
	ld de, $2
	add hl, de
	ld a, [hli]
	ld e, l
	ld d, h
	ld l, c
	ld h, b
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [de]
	cp $50
	jr z, .asm_17f23a
	and a
	ret

.asm_17f23a
	scf
	ret

.asm_17f23c
	push bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld [wcd54], a
	pop bc
	push hl
	push bc
	call Function17f4f6
	add hl, de
	ld a, [hl]
	ld e, a
	ld d, 0
	ld hl, .Genders
	add hl, de
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	pop hl
	call PlaceString
	ld a, c
	ld [wcd52], a
	ld a, b
	ld [wcd53], a
	ld a, [wcd54]
	call Function17f50f
	pop de
	and a
	ret
; 17f26e

.Genders: dw .Boy, .Girl
.Boy:     db "Boy@"
.Girl:    db "Girl@"

Function17f27b: ; 17f27b
	pop hl
	call Function17f524
	jr c, .asm_17f297
	ld de, $2
	add hl, de
	ld a, [hli]
	ld e, l
	ld d, h
	ld l, c
	ld h, b
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [de]
	cp $50
	jr z, .asm_17f295
	and a
	ret

.asm_17f295
	scf
	ret

.asm_17f297
	push bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld [wcd54], a
	pop bc
	push hl
	push bc
	call Function17f4f6
	add hl, de
	ld a, [hl]
	ld a, $1
	ld [rSVBK], a
	ld [wd265], a
	call GetItemName
	pop hl
	call PlaceString
	ld a, c
	ld [wcd52], a
	ld a, b
	ld [wcd53], a
	ld a, $4
	ld [rSVBK], a
	ld a, [wcd54]
	call Function17f50f
	pop de
	and a
	ret
; 17f2cb

Function17f2cb: ; 17f2cb
	pop hl
	push bc
	ld a, [hli]
	ld [wcd54], a
	ld a, [hli]
	ld [wcd55], a
	ld a, [wcd2e]
	inc a
	ld [wcd56], a
	pop bc
	push hl
	ld l, c
	ld h, b
	push hl
	ld de, wcd56
	ld b, $1
	ld a, [wcd54]
	ld c, a
	call MobilePrintNum
	ld a, l
	ld [wcd52], a
	ld a, h
	ld [wcd53], a
	pop hl
	ld a, [wcd55]
	call Function17f50f
	pop de
	and a
	ret
; 17f2ff

Function17f2ff: ; 17f2ff
	pop hl
	push bc
	ld a, [hli]
	ld [wcd54], a
	pop bc
	push hl
	push bc
	ld a, $1
	ld [rSVBK], a
	ld hl, PlayerName
	ld de, $c608
	ld bc, $6
	call CopyBytes
	ld a, $4
	ld [rSVBK], a
	pop hl
	ld de, $c608
	call PlaceString
	ld a, c
	ld [wcd52], a
	ld a, b
	ld [wcd53], a
	ld a, [wcd54]
	call Function17f50f
	pop de
	and a
	ret
; 17f334

Function17f334: ; 17f334
	pop hl
	push bc
	ld a, [hli]
	ld [wcd55], a
	and $f
	ld [wcd54], a
	pop bc
	push hl
	ld l, c
	ld h, b
	push hl
	ld a, [wcd55]
	bit 7, a
	jr nz, .asm_17f355
	ld a, BANK(sCrystalData)
	call GetSRAMBank
	ld a, [sCrystalData + 2]
	jr .asm_17f35d

.asm_17f355
	ld a, $5
	call GetSRAMBank
	ld a, [$b2f3]

.asm_17f35d
	ld c, a
	call CloseSRAM
	ld de, $c608
	callba Function48c63
	pop hl
	ld de, $c608
	call PlaceString
	ld a, c
	ld [wcd52], a
	ld a, b
	ld [wcd53], a
	ld a, [wcd54]
	call Function17f50f
	pop de
	and a
	ret
; 17f382

Function17f382: ; 17f382
	pop hl
	push bc
	ld a, [hli]
	ld [wcd55], a
	and $f
	ld [wcd54], a
	pop bc
	push hl
	push bc
	ld l, c
	ld h, b
	ld a, [wcd55]
	bit 7, a
	jr nz, .asm_17f3a3
	ld a, BANK(sCrystalData)
	call GetSRAMBank
	ld de, sCrystalData + 3
	jr .asm_17f3ab

.asm_17f3a3
	ld a, $5
	call GetSRAMBank
	ld de, $b2f4

.asm_17f3ab
	ld a, PRINTNUM_LEADINGZEROS | 2
	ld b, a
	ld a, 3
	ld c, a
	call PrintNum
	call CloseSRAM
	ld a, l
	ld [wcd52], a
	ld a, h
	ld [wcd53], a
	pop hl
	ld a, [wcd54]
	call Function17f50f
	pop de
	and a
	ret
; 17f3c9

Function17f3c9: ; 17f3c9
	push bc
	ld hl, wcd36
	ld de, $c708
	ld bc, 12
	call CopyBytes
	pop de
	ld c, $0
	callba Function11c075
	push hl
	ld hl, $c708
	ld de, wcd36
	ld bc, $c
	call CopyBytes
	pop bc
	pop de
	and a
	ret
; 17f3f0

Function17f3f0: ; 17f3f0
	pop hl
	push hl
	ld a, [hli]
	push af
	push bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [de]
	ld c, a
	ld b, $0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld hl, UnknBGPals
	add hl, de
	ld e, l
	ld d, h
	pop hl
	call PlaceString
	pop af
	ld e, a
	ld d, $0
	pop hl
	add hl, de
	add hl, de
	inc hl
	inc hl
	inc hl
	ld e, l
	ld d, h
	ld l, c
	ld h, b
	scf
	ret
; 17f41d

Function17f41d: ; 17f41d
	pop hl
	ld a, [hli]
	push hl
	push af
	ld l, c
	ld h, b
	ld bc, -TileMap + $10000
	add hl, bc
	ld de, -SCREEN_WIDTH
	ld c, $1
.asm_17f42c
	ld a, h
	and a
	jr nz, .asm_17f435
	ld a, l
	cp SCREEN_WIDTH
	jr c, .asm_17f439

.asm_17f435
	add hl, de
	inc c
	jr .asm_17f42c

.asm_17f439
	hlcoord 0, 0
	ld de, SCREEN_WIDTH
	ld a, c
.asm_17f440
	and a
	jr z, .asm_17f447
	add hl, de
	dec a
	jr .asm_17f440

.asm_17f447
	pop af
	ld e, a
	ld d, 0
	add hl, de
	pop de
	and a
	ret
; 17f44f

Function17f44f: ; 17f44f
	pop hl
	call Function17f524
	jr c, .asm_17f46d
	ld de, $5
	add hl, de
	ld a, [hli]
	inc hl
	inc hl
	ld e, l
	ld d, h
	ld l, c
	ld h, b
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [de]
	cp $50
	jr z, .asm_17f46b
	and a
	ret

.asm_17f46b
	scf
	ret

.asm_17f46d
	push bc
	ld de, wcd54
	ld bc, $8
	call CopyBytes
	pop bc
	push hl
	push bc
	ld a, [wcd56]
	cp $c0
	jr c, .asm_17f488
	ld a, [wcd54]
	ld [rSVBK], a
	jr .asm_17f48e

.asm_17f488
	ld a, [wcd54]
	call GetSRAMBank

.asm_17f48e
	ld a, [wcd55]
	ld l, a
	ld a, [wcd56]
	ld h, a
	ld de, $c608
	ld a, [wcd57]
	ld c, a
	ld b, $0
	call CopyBytes
	ld a, [wcd56]
	cp $c0
	jr c, .asm_17f4af
	ld a, $4
	ld [rSVBK], a
	jr .asm_17f4b7

.asm_17f4af
	call CloseSRAM
	ld a, $6
	call GetSRAMBank

.asm_17f4b7
	ld de, $c608
	pop hl
	push hl
	ld a, [wcd57]
	ld b, a
	ld a, [wcd58]
	ld c, a
	call MobilePrintNum
	ld a, l
	ld [wcd52], a
	ld a, h
	ld [wcd53], a
	ld a, [wcd5a]
	and a
	jr z, .asm_17f4ec
	ld c, a
	ld a, [wcd58]
	inc a
	ld b, a
	ld e, l
	ld d, h
	dec de
.asm_17f4de
	ld a, c
	cp b
	jr z, .asm_17f4e8
	ld a, [de]
	dec de
	ld [hld], a
	dec b
	jr .asm_17f4de

.asm_17f4e8
	ld a, [wcd5b]
	ld [hl], a

.asm_17f4ec
	pop hl
	ld a, [wcd59]
	call Function17f50f
	pop de
	and a
	ret
; 17f4f6

Function17f4f6: ; 17f4f6
	ld a, [wcd6a]
	ld l, a
	ld a, [wcd6b]
	ld h, a
	ld a, [wcd47]
	ld c, a
	ld a, [BGMapPalBuffer]
	ld b, a
	ld a, [wcd2e]
.asm_17f509
	and a
	ret z
	dec a
	add hl, bc
	jr .asm_17f509
; 17f50f

Function17f50f: ; 17f50f
	and a
	jr z, .asm_17f519
	ld c, a
	ld b, $0
	add hl, bc
	ld c, l
	ld b, h
	ret

.asm_17f519
	ld a, [wcd52]
	ld c, a
	ld l, a
	ld a, [wcd53]
	ld b, a
	ld h, a
	ret
; 17f524

Function17f524: ; 17f524
	push hl
	push bc
	push de
	ld a, [wcd42]
	dec a
	ld b, a
	ld a, [wcd2e]
	cp b
	jr z, .asm_17f53a
	ld hl, wcd68
	cp [hl]
.asm_17f536
	pop de
	pop bc
	pop hl
	ret

.asm_17f53a
	scf
	jr .asm_17f536
; 17f53d

Function17f53d: ; 17f53d
	call FadeToMenu
	xor a
	ld [wc303], a
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a

	call Function17f555

	pop af
	ld [rSVBK], a
	call ExitAllMenus
	ret
; 17f555

Function17f555: ; 17f555
.loop
	call JoyTextDelay
	call .RunJumptable
	ld a, [wc303]
	bit 7, a
	jr nz, .quit
	callba HDMATransferAttrMapAndTileMapToWRAMBank3
	jr .loop

.quit
	call .deinit
	ret

.deinit
	ld a, [wc300]
	cp $22
	jr z, .asm_17f597
	cp $31
	jr z, .asm_17f58a
	cp $33
	ret nz
	ld a, [wc301]
	cp $1
	ret nz
	ld a, [wc302]
	cp $2
	ret nz
	jr .asm_17f5a1

.asm_17f58a
	ld a, [wc301]
	cp $3
	ret nz
	ld a, [wc302]
	and a
	ret nz
	jr .asm_17f5a1

.asm_17f597
	ld a, [wc301]
	and a
	ret nz
	ld a, [wc302]
	and a
	ret nz

.asm_17f5a1
	ld a, $5
	call GetSRAMBank
	xor a
	ld [sMobileLoginPassword], a
	call CloseSRAM
	ret
; 17f5ae

.RunJumptable: ; 17f5ae
	jumptable .Jumptable, wc303
; 17f5bd

.Jumptable: ; 17f5bd
	dw Function17f5c3
	dw Function17ff23
	dw Function17f5d2
; 17f5c3

Function17f5c3: ; 17f5c3
	call Function17f5e4
	callba FinishExitMenu
	ld a, $1
	ld [wc303], a
	ret
; 17f5d2

Function17f5d2: ; 17f5d2
	call Function17f5e4
	callba HDMATransferAttrMapAndTileMapToWRAMBank3
	call SetPalettes
	ld a, $1
	ld [wc303], a
	ret
; 17f5e4

Function17f5e4: ; 17f5e4
	ld a, $8
	ld [MusicFade], a
	ld de, MUSIC_NONE
	ld a, e
	ld [MusicFadeIDLo], a
	ld a, d
	ld [MusicFadeIDHi], a
	ld a, " "
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call ByteFill
	ld a, $6
	hlcoord 0, 0, AttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call ByteFill
	hlcoord 2, 1
	ld b, $1
	ld c, $e
	call Function3eea
	hlcoord 1, 4
	ld b, $c
	ld c, $10
	call Function3eea
	hlcoord 3, 2
	ld de, String_17f6dc
	call PlaceString
	call Function17ff3c
	jr nc, .asm_17f632
	hlcoord 11, 2
	call Function17f6b7

.asm_17f632
	ld a, [wc300]
	cp $d0
	jr nc, .asm_17f684
	cp $10
	jr c, .asm_17f679
	sub $10
	cp $24
	jr nc, .asm_17f679
	ld e, a
	ld d, $0
	ld hl, Table_17f706
	add hl, de
	add hl, de
	ld a, [wc301]
	ld e, a
	ld a, [wc302]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hl]
	ld h, a
	ld l, c
	ld a, [hli]
	and a
	jr z, .asm_17f679
	ld c, a
.asm_17f65d
	ld a, [hli]
	ld b, a
	ld a, [hli]
	cp $ff
	jr nz, .asm_17f667
	cp b
	jr z, .asm_17f66e

.asm_17f667
	xor d
	jr nz, .asm_17f674
	ld a, b
	xor e
	jr nz, .asm_17f674

.asm_17f66e
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	jr .asm_17f67d

.asm_17f674
	inc hl
	inc hl
	dec c
	jr nz, .asm_17f65d

.asm_17f679
	ld a, $d9
	jr .asm_17f684

.asm_17f67d
	hlcoord 2, 6
	call PlaceString
	ret

.asm_17f684
	sub $d0
	ld e, a
	ld d, 0
	ld hl, Table_17f699
	add hl, de
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	hlcoord 2, 6
	call PlaceString
	ret
; 17f699

Table_17f699: ; 17f699
	dw String_17fedf
	dw String_17fdd9
	dw String_17fdd9
	dw String_17fe03
	dw String_17fd84
	dw String_17fe63
	dw String_17fdb2
	dw String_17fe4b
	dw String_17fe03
	dw String_17fe03
	dw String_17fe03
; 17f6af

Palette_17f6af: ; 17f6af
	RGB  5,  5, 16
	RGB  8, 19, 28
	RGB  0,  0,  0
	RGB 31, 31, 31
; 17f6b7

Function17f6b7: ; 17f6b7
	ld a, [wc300]
	call .bcd_two_digits
	inc hl
	ld a, [wc302]
	and $f
	call .bcd_digit
	ld a, [wc301]
	call .bcd_two_digits
	ret
; 17f6cd

.bcd_two_digits ; 17f6cd
	ld c, a
	and $f0
	swap a
	call .bcd_digit
	ld a, c
	and $f

.bcd_digit ; 17f6d8
	add "0"
	ld [hli], a
	ret
; 17f6dc

String_17f6dc: ; 17f6dc
	db "つうしんエラー   ー@"
; 17f6e8

String_17f6e8: ; 17f6e8
	db   "みていぎ", $25, "エラーです"
	next "プログラム", $1f
	next "かくにん してください"
	db   "@"
; 17f706

Table_17f706:
	dw Unknown_17f74e
	dw Unknown_17f753
	dw Unknown_17f758
	dw Unknown_17f75d
	dw Unknown_17f762
	dw Unknown_17f767
	dw Unknown_17f778
	dw Unknown_17f77d
	dw Unknown_17f782
	dw Unknown_17f782
	dw Unknown_17f782
	dw Unknown_17f782
	dw Unknown_17f782
	dw Unknown_17f782
	dw Unknown_17f782
	dw Unknown_17f782
	dw Unknown_17f782
	dw Unknown_17f787
	dw Unknown_17f78c
	dw Unknown_17f791
	dw Unknown_17f796
	dw Unknown_17f79b
	dw Unknown_17f7a0
	dw Unknown_17f7a5
	dw Unknown_17f7a5
	dw Unknown_17f7a5
	dw Unknown_17f7a5
	dw Unknown_17f7a5
	dw Unknown_17f7a5
	dw Unknown_17f7a5
	dw Unknown_17f7a5
	dw Unknown_17f7a5
	dw Unknown_17f7a5
	dw Unknown_17f7ea
	dw Unknown_17f7ff
	dw Unknown_17f844

Unknown_17f74e: db 1
	dbbw $0, $0, String_17f891

Unknown_17f753: db 1
	dbbw $0, $0, String_17f8d1

Unknown_17f758: db 1
	dbbw $0, $0, String_17f913

Unknown_17f75d: db 1
	dbbw $0, $0, String_17f8d1

Unknown_17f762: db 1
	dbbw $0, $0, String_17fa71

Unknown_17f767: db 4
	dbbw $0, $0, String_17f946
	dbbw $1, $0, String_17f946
	dbbw $2, $0, String_17f946
	dbbw $3, $0, String_17f946

Unknown_17f778: db 1
	dbbw $0, $0, String_17f98e

Unknown_17f77d: db 1
	dbbw $0, $0, String_17f98e

Unknown_17f782: db 1
	dbbw $0, $0, String_17f98e

Unknown_17f787: db 1
	dbbw $0, $0, String_17f98e

Unknown_17f78c: db 1
	dbbw $0, $0, String_17f9d0

Unknown_17f791: db 1
	dbbw $0, $0, String_17fa14

Unknown_17f796: db 1
	dbbw $0, $0, String_17fcbf

Unknown_17f79b: db 1
	dbbw $0, $0, String_17fa71

Unknown_17f7a0: db 1
	dbbw $0, $0, String_17fbfe

Unknown_17f7a5: db 17
	dbbw $0, $0, String_17f98e
	dbbw $21, $2, String_17fcbf
	dbbw $21, $4, String_17fcbf
	dbbw $50, $4, String_17faf9
	dbbw $51, $4, String_17fcbf
	dbbw $52, $4, String_17fcbf
	dbbw $0, $5, String_17f98e
	dbbw $1, $5, String_17f98e
	dbbw $2, $5, String_17f98e
	dbbw $3, $5, String_17f98e
	dbbw $4, $5, String_17f98e
	dbbw $50, $5, String_17faf9
	dbbw $51, $5, String_17faf9
	dbbw $52, $5, String_17fcbf
	dbbw $53, $5, String_17faf9
	dbbw $54, $5, String_17fcbf
	dbbw $ff, $ff, String_17fcbf

Unknown_17f7ea: db 5
	dbbw $0, $0, String_17f98e
	dbbw $2, $0, String_17fb2a
	dbbw $3, $0, String_17fb6e
	dbbw $4, $0, String_17f98e
	dbbw $ff, $ff, String_17fcbf

Unknown_17f7ff: db 17
	dbbw $0, $0, String_17f98e
	dbbw $1, $3, String_17f98e
	dbbw $2, $3, String_17f98e
	dbbw $0, $4, String_17f98e
	dbbw $1, $4, String_17f98e
	dbbw $3, $4, String_17fbb6
	dbbw $4, $4, String_17fbb6
	dbbw $5, $4, String_17f98e
	dbbw $6, $4, String_17f98e
	dbbw $7, $4, String_17f98e
	dbbw $8, $4, String_17fbfe
	dbbw $0, $5, String_17fa49
	dbbw $1, $5, String_17f98e
	dbbw $2, $5, String_17fa49
	dbbw $3, $5, String_17fab0
	dbbw $4, $5, String_17fa49
	dbbw $ff, $ff, String_17fa49

Unknown_17f844: db 19
	dbbw $1, $1, String_17fc3e
	dbbw $2, $1, String_17fc88
	dbbw $3, $1, String_17fcff
	dbbw $4, $1, String_17fd84
	dbbw $5, $1, String_17fd84
	dbbw $6, $1, String_17fd47
	dbbw $1, $2, String_17fb6e
	dbbw $2, $2, String_17f98e
	dbbw $3, $2, String_17fd84
	dbbw $4, $2, String_17f98e
	dbbw $5, $2, String_17fa49
	dbbw $6, $2, String_17fd84
	dbbw $99, $2, String_17fc88
	dbbw $1, $3, String_17fa49
	dbbw $1, $4, String_17fa49
	dbbw $2, $4, String_17fa49
	dbbw $3, $4, String_17fa49
	dbbw $4, $4, String_17fa49
	dbbw $ff, $ff, String_17fa49

String_17f891: ; 17f891
	db   "モバイルアダプタが ただしく"
	next "さしこまれていません"
	next "とりあつかいせつめいしょを"
	next "ごらんのうえ しっかりと"
	next "さしこんで ください"
	db   "@"

String_17f8d1: ; 17f8d1
	db   "でんわが うまく かけられないか"
	next "でんわかいせんが こんでいるので"
	next "つうしん できません"
	next "しばらく まって"
	next "かけなおして ください"
	db   "@"

String_17f913: ; 17f913
	db   "でんわかいせんが こんでいるため"
	next "でんわが かけられません"
	next "しばらく まって"
	next "かけなおして ください"
	db   "@"

String_17f946: ; 17f946
	db   "モバイルアダプタの エラーです"
	next "しばらく まって"
	next "かけなおして ください"
	next "なおらない ときは"
	next "モバイルサポートセンターへ"
	next "おといあわせください"
	db   "@"

String_17f98e: ; 17f98e
	db   "つうしんエラーです"
	next "しばらく まって"
	next "かけなおして ください"
	next "なおらない ときは"
	next "モバイルサポートセンターへ"
	next "おといあわせください"
	db   "@"

String_17f9d0: ; 17f9d0
	db   "ログインパスワードか"
	next "ログイン アイディーに"
	next "まちがいがあります"
	next "パスワードを かくにんして"
	next "しばらく まって"
	next "かけなおして ください"
	db   "@"

String_17fa14: ; 17fa14
	db   "でんわが きれました"
	next "とりあつかいせつめいしょを"
	next "ごらんのうえ"
	next "しばらく まって"
	next "かけなおして ください"
	db   "@"

String_17fa49: ; 17fa49
	db   "モバイルセンターの"
	next "つうしんエラーです"
	next "しばらくまって"
	next "かけなおして ください"
	db   "@"

String_17fa71: ; 17fa71
	db   "モバイルアダプタに"
	next "とうろくされた じょうほうが"
	next "ただしく ありません"
	next "モバイルトレーナーで"
	next "しょきとうろくを してください"
	db   "@"

String_17fab0: ; 17fab0
	db   "モバイルセンターが"
	next "こんでいて つながりません"
	next "しばらくまって"
	next "かけなおして ください"
	next "くわしくは とりあつかい"
	next "せつめいしょを ごらんください"
	db   "@"

String_17faf9: ; 17faf9
	db   "あてさき メールアドレスに"
	next "まちがいがあります"
	next "ただしい メールアドレスを"
	next "いれなおしてください"
	db   "@"

String_17fb2a: ; 17fb2a
	db   "メールアドレスに"
	next "まちがいが あります"
	next "とりあつかいせつめいしょを"
	next "ごらんのうえ"
	next "モバイルトレーナーで"
	next "しょきとうろくを してください"
	db   "@"

String_17fb6e: ; 17fb6e
	db   "ログインパスワードに"
	next "まちがいが あるか"
	next "モバイルセンターの エラーです"
	next "パスワードを かくにんして"
	next "しばらく まって"
	next "かけなおして ください"
	db   "@"

String_17fbb6: ; 17fbb6
	db   "データの よみこみが できません"
	next "しばらくまって"
	next "かけなおして ください"
	next "なおらない ときは"
	next "モバイルサポートセンターへ"
	next "おといあわせください"
	db   "@"

String_17fbfe: ; 17fbfe
	db   "じかんぎれです"
	next "でんわが きれました"
	next "でんわを かけなおしてください"
	next "くわしくは とりあつかい"
	next "せつめいしょを ごらんください"
	db   "@"

String_17fc3e: ; 17fc3e
	db   "ごりよう りょうきんの "
	next "おしはらいが おくれたばあいには"
	next "ごりようが できなくなります"
	next "くわしくは とりあつかい"
	next "せつめいしょを ごらんください"
	db   "@"

String_17fc88: ; 17fc88
	db   "おきゃくさまの ごつごうにより"
	next "ごりようできません"
	next "くわしくは とりあつかい"
	next "せつめいしょを ごらんください"
	db   "@"

String_17fcbf: ; 17fcbf
	db   "でんわかいせんが こんでいるか"
	next "モバイルセンターの エラーで"
	next "つうしんが できません"
	next "しばらく まって"
	next "かけなおして ください"
	db   "@"

String_17fcff: ; 17fcff
	db   "ごりよう りょうきんが"
	next "じょうげんを こえているため"
	next "こんげつは ごりようできません"
	next "くわしくは とりあつかい"
	next "せつめいしょを ごらんください"
	db   "@"

String_17fd47: ; 17fd47
	db   "げんざい モバイルセンターの"
	next "てんけんを しているので"
	next "つうしんが できません"
	next "しばらく まって"
	next "かけなおして ください"
	db   "@"

String_17fd84: ; 17fd84
	db   "データの よみこみが できません"
	next "くわしくは とりあつかい"
	next "せつめいしょを ごらんください"
	db   "@"


String_17fdb2: ; 17fdb2
	db   "3ぷん いじょう なにも"
	next "にゅうりょく しなかったので"
	next "でんわが きれました"
	db   "@"

String_17fdd9: ; 17fdd9
	db   "つうしんが うまく"
	next "できませんでした"
	next "もういちど はじめから"
	next "やりなおしてください"
	db   "@"

String_17fe03: ; 17fe03
	db   "データの よみこみが できません"
	next "しばらくまって"
	next "かけなおして ください"
	next "なおらない ときは"
	next "モバイルサポートセンターへ"
	next "おといあわせください"
	db   "@"

String_17fe4b: ; 17fe4b
	db   "まちじかんが ながいので"
	next "でんわが きれました"
	db   "@"

String_17fe63: ; 17fe63
	db   "あいての モバイルアダプタと"
	next "タイプが ちがいます"
	next "くわしくは とりあつかい"
	next "せつめいしょを ごらんください"
	db   "@"

String_17fe9a: ; 17fe9a ; unreferenced
	db   "ポケモンニュースが"
	next "あたらしくなっているので"
	next "レポートを おくれません"
	next "あたらしい ポケモンニュースの"
	next "よみこみを さきに してください"
	db   "@"

String_17fedf: ; 17fedf
	db   "つうしんの じょうきょうが"
	next "よくないか かけるあいてが"
	next "まちがっています"
	next "もういちど かくにんをして"
	next "でんわを かけなおして ください"
	db   "@"
; 17ff23

Function17ff23: ; 17ff23
	ld a, [hJoyPressed]
	and a
	ret z
	ld a, $8
	ld [MusicFade], a
	ld a, [wMapMusic]
	ld [MusicFadeIDLo], a
	xor a
	ld [MusicFadeIDHi], a
	ld hl, wc303
	set 7, [hl]
	ret
; 17ff3c

Function17ff3c: ; 17ff3c
	nop
	ld a, [wc300]
	cp $d0
	ret c
	hlcoord 10, 2
	ld de, String_17ff68
	call PlaceString
	ld a, [wc300]
	push af
	sub $d0
	inc a
	ld [wc300], a
	hlcoord 14, 2
	ld de, wc300
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	pop af
	ld [wc300], a
	and a
	ret
; 17ff68

String_17ff68: ; 17ff68
	db "101@"
; 17ff6c
