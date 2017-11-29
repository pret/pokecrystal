
SECTION "bank5F", ROMX


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


Special_Menu_ChallengeExplanationCancel: ; 17d224
	ld a, $4
	ld [ScriptVar], a
	ld hl, MenuDataHeader_ChallengeExplanationCancel ; English Menu

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
