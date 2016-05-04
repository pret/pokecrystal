UpdateUnownDex: ; fba18
	ld a, [UnownLetter]
	ld c, a
	ld b, 26
	ld hl, UnownDex
.loop
	ld a, [hli]
	and a
	jr z, .done
	cp c
	ret z
	dec b
	jr nz, .loop
	ret

.done
	dec hl
	ld [hl], c
	ret
; fba2e


PrintUnownWord: ; fba2e (3e:7a2e)
	hlcoord 4, 15
	ld bc, 12
	ld a, " "
	call ByteFill
	ld a, [wDexCurrentUnownIndex]
	ld e, a
	ld d, 0
	ld hl, UnownDex
	add hl, de
	ld a, [hl]
	ld e, a
	ld d, 0
	ld hl, UnownWords
	add hl, de
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	hlcoord 4, 15
.loop
	ld a, [de]
	cp -1
	ret z
	inc de
	ld [hli], a
	jr .loop
; fba5a (3e:7a5a)

UnownWords: ; fba5a
	dw UnownWord1
	dw UnownWord1
	dw UnownWord2
	dw UnownWord3
	dw UnownWord4
	dw UnownWord5
	dw UnownWord6
	dw UnownWord7
	dw UnownWord8
	dw UnownWord9
	dw UnownWord10
	dw UnownWord11
	dw UnownWord12
	dw UnownWord13
	dw UnownWord14
	dw UnownWord15
	dw UnownWord16
	dw UnownWord17
	dw UnownWord18
	dw UnownWord19
	dw UnownWord20
	dw UnownWord21
	dw UnownWord22
	dw UnownWord23
	dw UnownWord24
	dw UnownWord25
	dw UnownWord26
; fba90

unownword: macro
x = 1
	rept STRLEN(\1)
	db STRSUB(\1, x, 1) - $40
x = x + 1
	endr
	db -1
endm


UnownWord1:	 unownword "ANGRY"
UnownWord2:	 unownword "BEAR"
UnownWord3:	 unownword "CHASE"
UnownWord4:	 unownword "DIRECT"
UnownWord5:	 unownword "ENGAGE"
UnownWord6:	 unownword "FIND"
UnownWord7:	 unownword "GIVE"
UnownWord8:	 unownword "HELP"
UnownWord9:	 unownword "INCREASE"
UnownWord10: unownword "JOIN"
UnownWord11: unownword "KEEP"
UnownWord12: unownword "LAUGH"
UnownWord13: unownword "MAKE"
UnownWord14: unownword "NUZZLE"
UnownWord15: unownword "OBSERVE"
UnownWord16: unownword "PERFORM"
UnownWord17: unownword "QUICKEN"
UnownWord18: unownword "REASSURE"
UnownWord19: unownword "SEARCH"
UnownWord20: unownword "TELL"
UnownWord21: unownword "UNDO"
UnownWord22: unownword "VANISH"
UnownWord23: unownword "WANT"
UnownWord24: unownword "XXXXX"
UnownWord25: unownword "YIELD"
UnownWord26: unownword "ZOOM"
; fbb32
