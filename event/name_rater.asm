NameRater: ; fb6ed
	ld hl, UnknownText_0xfb80f
	call PrintText
	call YesNoBox
	jp c, .asm_fb77e
	ld hl, UnknownText_0xfb814
	call PrintText
	callba Function50000
	jr c, .asm_fb77e
	ld a, [CurPartySpecies]
	cp EGG
	jr z, .asm_fb783
	call GetCurNick
	call Functionfb78a
	jr c, .asm_fb779
	ld hl, UnknownText_0xfb819
	call PrintText
	call YesNoBox
	jr c, .asm_fb77e
	ld hl, UnknownText_0xfb81e
	call PrintText
	xor a
	ld [MonType], a
	ld a, [CurPartySpecies]
	ld [wd265], a
	ld [CurSpecies], a
	call GetBaseData
	ld b, 0
	ld de, StringBuffer2
	callba Function116b7
	call Functionfb7be
	ld hl, UnknownText_0xfb837
	jr c, .asm_fb76c
	call Functionfb7d3
	ld hl, UnknownText_0xfb837
	jr c, .asm_fb76c
	ld hl, PartyMonNicknames
	ld bc, $000b
	ld a, [CurPartyMon]
	call AddNTimes
	ld e, l
	ld d, h
	ld hl, StringBuffer2
	ld bc, $000b
	call CopyBytes
	ld hl, UnknownText_0xfb823

.asm_fb76c
	push hl
	call GetCurNick
	ld hl, UnknownText_0xfb83c
	call PrintText
	pop hl
	jr .asm_fb786

.asm_fb779
	ld hl, UnknownText_0xfb82d
	jr .asm_fb786

.asm_fb77e
	ld hl, UnknownText_0xfb828
	jr .asm_fb786

.asm_fb783
	ld hl, UnknownText_0xfb832

.asm_fb786
	call PrintText
	ret
; fb78a

Functionfb78a: ; fb78a
	ld hl, PartyMonOT
	ld bc, NAME_LENGTH
	ld a, [CurPartyMon]
	call AddNTimes
	ld de, PlayerName
	ld c, NAME_LENGTH
	call .asm_fb7b1
	jr c, .asm_fb7bc
	ld hl, PartyMon1ID
	ld bc, PartyMon2 - PartyMon1
	ld a, [CurPartyMon]
	call AddNTimes
	ld de, PlayerID
	ld c, $2
.asm_fb7b1
	ld a, [de]
	cp [hl]
	jr nz, .asm_fb7bc
	inc hl
	inc de
	dec c
	jr nz, .asm_fb7b1
	and a
	ret

.asm_fb7bc
	scf
	ret
; fb7be

Functionfb7be: ; fb7be
	ld hl, StringBuffer2
	ld c, 10
.asm_fb7c3
	ld a, [hli]
	cp "@"
	jr z, .asm_fb7cf
	cp " "
	jr nz, .asm_fb7d1
	dec c
	jr nz, .asm_fb7c3

.asm_fb7cf
	scf
	ret

.asm_fb7d1
	and a
	ret
; fb7d3

Functionfb7d3: ; fb7d3
	ld hl, PartyMonNicknames
	ld bc, $000b
	ld a, [CurPartyMon]
	call AddNTimes
	push hl
	call Functionfb802
	ld b, c
	ld hl, StringBuffer2
	call Functionfb802
	pop hl
	ld a, c
	cp b
	jr nz, .asm_fb7fe
	ld de, StringBuffer2
.asm_fb7f2
	ld a, [de]
	cp "@"
	jr z, .asm_fb800
	cp [hl]
	jr nz, .asm_fb7fe
	inc hl
	inc de
	jr .asm_fb7f2

.asm_fb7fe
	and a
	ret

.asm_fb800
	scf
	ret
; fb802

Functionfb802: ; fb802
	ld c, 0
.asm_fb804
	ld a, [hli]
	cp "@"
	ret z
	inc c
	ld a, c
	cp 10
	jr nz, .asm_fb804
	ret
; fb80f

UnknownText_0xfb80f: ; 0xfb80f
	; Hello, hello! I'm the NAME RATER.
	; I rate the names of #MON.
	; Would you like me to rate names?
	text_jump UnknownText_0x1c0043
	db "@"
; 0xfb814

UnknownText_0xfb814: ; 0xfb814
	; Which #MON's nickname should I rate for you?
	text_jump UnknownText_0x1c00a0
	db "@"
; 0xfb819

UnknownText_0xfb819: ; 0xfb819
	; Hm… @ … That's a fairly decent name.
	; But, how about a slightly better nickname?
	; Want me to give it a better name?
	text_jump UnknownText_0x1c00cd
	db "@"
; 0xfb81e

UnknownText_0xfb81e: ; 0xfb81e
	; All right. What name should we give it, then?
	text_jump UnknownText_0x1c0142
	db "@"
; 0xfb823

UnknownText_0xfb823: ; 0xfb823
	; That's a better name than before! Well done!
	text_jump UnknownText_0x1c0171
	db "@"
; 0xfb828

UnknownText_0xfb828: ; 0xfb828
	; OK, then. Come again sometime.
	text_jump UnknownText_0x1c019e
	db "@"
; 0xfb82d

UnknownText_0xfb82d: ; 0xfb82d
	; Hm… @ ? What a great name! It's perfect.
	; Treat @ with loving care.
	text_jump UnknownText_0x1c01be
	db "@"
; 0xfb832

UnknownText_0xfb832: ; 0xfb832
	; Whoa… That's just an EGG.
	text_jump UnknownText_0x1c0208
	db "@"
; 0xfb837

UnknownText_0xfb837: ; 0xfb837
	; It might look the same as before,
	; but this new name is much better! Well done!
	text_jump UnknownText_0x1c0222
	db "@"
; 0xfb83c

UnknownText_0xfb83c: ; 0xfb83c
	; All right. This #MON is now named @ .
	text_jump UnknownText_0x1c0272
	db "@"
; 0xfb841
