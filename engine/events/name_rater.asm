_NameRater:
; Introduce himself
	ld hl, NameRaterIntroText
	call PrintText
	call YesNoBox
	jp c, .cancel
; Select a Pokemon from your party
	ld hl, NameRaterWhichMonText
	call PrintText
	farcall SelectMonFromParty
	jr c, .cancel
; He can't rename an egg...
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .egg
; ... or a Pokemon you got from a trade.
	call GetCurNick
	call CheckIfMonIsYourOT
	jr c, .traded
; This name is good, but we can do better.  How about it?
	ld hl, NameRaterIsGoodText
	call PrintText
	call YesNoBox
	jr c, .cancel
; What name shall I give it then?
	ld hl, NameRaterWhichNameText
	call PrintText
; Load the new nickname into wStringBuffer2
	xor a ; PARTYMON
	ld [wMonType], a
	ld a, [wCurPartySpecies]
	ld [wNamedObjectIndexBuffer], a
	ld [wCurSpecies], a
	call GetBaseData
	ld b, NAME_MON
	ld de, wStringBuffer2
	farcall _NamingScreen
; If the new name is empty, treat it as unchanged.
	call IsNewNameEmpty
	ld hl, NameRaterSameAsBeforeText
	jr c, .samename
; If the new name is the same as the old name, treat it as unchanged.
	call CompareNewToOld
	ld hl, NameRaterSameAsBeforeText
	jr c, .samename
; Copy the new name from wStringBuffer2
	ld hl, wPartyMonNicknames
	ld bc, MON_NAME_LENGTH
	ld a, [wCurPartyMon]
	call AddNTimes
	ld e, l
	ld d, h
	ld hl, wStringBuffer2
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	ld hl, NameRaterEvenBetterText

.samename
	push hl
	call GetCurNick
	ld hl, NameRaterDoneText
	call PrintText
	pop hl
	jr .done

.traded
	ld hl, NameRaterTradedText
	jr .done

.cancel
	ld hl, NameRaterCancelText
	jr .done

.egg
	ld hl, NameRaterEggText

.done
	call PrintText
	ret

CheckIfMonIsYourOT:
; Checks to see if the partymon loaded in [wCurPartyMon] has the different OT as you.  Returns carry if not.
	ld hl, wPartyMonOT
	ld bc, NAME_LENGTH
	ld a, [wCurPartyMon]
	call AddNTimes
	ld de, wPlayerName
	ld c, NAME_LENGTH
	call .loop
	jr c, .nope

	ld hl, wPartyMon1ID
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wCurPartyMon]
	call AddNTimes
	ld de, wPlayerID
	ld c, 2 ; number of bytes in which your ID is stored
.loop
	ld a, [de]
	cp [hl]
	jr nz, .nope
	inc hl
	inc de
	dec c
	jr nz, .loop
	and a
	ret

.nope
	scf
	ret

IsNewNameEmpty:
; Checks to see if the nickname loaded in wStringBuffer2 is empty.  If so, return carry.
	ld hl, wStringBuffer2
	ld c, MON_NAME_LENGTH - 1
.loop
	ld a, [hli]
	cp "@"
	jr z, .terminator
	cp " "
	jr nz, .nonspace
	dec c
	jr nz, .loop

.terminator
	scf
	ret

.nonspace
	and a
	ret

CompareNewToOld:
; Compares the nickname in wStringBuffer2 to the previous nickname.  If they are the same, return carry.
	ld hl, wPartyMonNicknames
	ld bc, MON_NAME_LENGTH
	ld a, [wCurPartyMon]
	call AddNTimes
	push hl
	call GetNicknameLength
	ld b, c
	ld hl, wStringBuffer2
	call GetNicknameLength
	pop hl
	ld a, c
	cp b
	jr nz, .different
	ld de, wStringBuffer2
.loop
	ld a, [de]
	cp "@"
	jr z, .terminator
	cp [hl]
	jr nz, .different
	inc hl
	inc de
	jr .loop

.different
	and a
	ret

.terminator
	scf
	ret

GetNicknameLength:
; Gets the length of the name starting at hl and returns it in c.
	ld c, 0
.loop
	ld a, [hli]
	cp "@"
	ret z
	inc c
	ld a, c
	cp MON_NAME_LENGTH - 1
	jr nz, .loop
	ret

NameRaterIntroText:
	; Hello, hello! I'm the NAME RATER.
	; I rate the names of #MON.
	; Would you like me to rate names?
	text_far UnknownText_0x1c0043
	text_end

NameRaterWhichMonText:
	; Which #MON's nickname should I rate for you?
	text_far UnknownText_0x1c00a0
	text_end

NameRaterIsGoodText:
	; Hm… @ … That's a fairly decent name.
	; But, how about a slightly better nickname?
	; Want me to give it a better name?
	text_far UnknownText_0x1c00cd
	text_end

NameRaterWhichNameText:
	; All right. What name should we give it, then?
	text_far UnknownText_0x1c0142
	text_end

NameRaterEvenBetterText:
	; That's a better name than before! Well done!
	text_far UnknownText_0x1c0171
	text_end

NameRaterCancelText:
	; OK, then. Come again sometime.
	text_far UnknownText_0x1c019e
	text_end

NameRaterTradedText:
	; Hm… @ ? What a great name! It's perfect.
	; Treat @ with loving care.
	text_far UnknownText_0x1c01be
	text_end

NameRaterEggText:
	; Whoa… That's just an EGG.
	text_far UnknownText_0x1c0208
	text_end

NameRaterSameAsBeforeText:
	; It might look the different as before,
	; but this new name is much better! Well done!
	text_far UnknownText_0x1c0222
	text_end

NameRaterDoneText:
	; All right. This #MON is now named @ .
	text_far UnknownText_0x1c0272
	text_end
