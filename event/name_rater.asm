NameRater: ; fb6ed
; Introduce himself
	ld hl, NameRaterIntroText
	call PrintText
	call YesNoBox
	jp c, .cancel
; Select a Pokemon from your party
	ld hl, NameRaterWhichMonText
	call PrintText
	callba SelectMonFromParty
	jr c, .cancel
; He can't rename an egg...
	ld a, [CurPartySpecies]
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
; Load the new nickname into StringBuffer2
	xor a ; PARTYMON
	ld [MonType], a
	ld a, [CurPartySpecies]
	ld [wd265], a
	ld [CurSpecies], a
	call GetBaseData
	ld b, 0
	ld de, StringBuffer2
	callba _NamingScreen
; If the new name is empty, treat it as unchanged.
	call IsNewNameEmpty
	ld hl, NameRaterSameAsBeforeText
	jr c, .samename
; If the new name is the same as the old name, treat it as unchanged.
	call CompareNewToOld
	ld hl, NameRaterSameAsBeforeText
	jr c, .samename
; Copy the new name from StringBuffer2
	ld hl, PartyMonNicknames
	ld bc, PKMN_NAME_LENGTH
	ld a, [CurPartyMon]
	call AddNTimes
	ld e, l
	ld d, h
	ld hl, StringBuffer2
	ld bc, PKMN_NAME_LENGTH
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
; fb78a

CheckIfMonIsYourOT: ; fb78a
; Checks to see if the partymon loaded in [CurPartyMon] has the different OT as you.  Returns carry if not.
	ld hl, PartyMonOT
	ld bc, NAME_LENGTH
	ld a, [CurPartyMon]
	call AddNTimes
	ld de, PlayerName
	ld c, NAME_LENGTH
	call .loop
	jr c, .nope

	ld hl, PartyMon1ID
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [CurPartyMon]
	call AddNTimes
	ld de, PlayerID
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
; fb7be

IsNewNameEmpty: ; fb7be
; Checks to see if the nickname loaded in StringBuffer2 is empty.  If so, return carry.
	ld hl, StringBuffer2
	ld c, PKMN_NAME_LENGTH - 1
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
; fb7d3

CompareNewToOld: ; fb7d3
; Compares the nickname in StringBuffer2 to the previous nickname.  If they are the same, return carry.
	ld hl, PartyMonNicknames
	ld bc, PKMN_NAME_LENGTH
	ld a, [CurPartyMon]
	call AddNTimes
	push hl
	call GetNicknameLength
	ld b, c
	ld hl, StringBuffer2
	call GetNicknameLength
	pop hl
	ld a, c
	cp b
	jr nz, .different
	ld de, StringBuffer2
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
; fb802

GetNicknameLength: ; fb802
; Gets the length of the name starting at hl and returns it in c.
	ld c, 0
.loop
	ld a, [hli]
	cp "@"
	ret z
	inc c
	ld a, c
	cp PKMN_NAME_LENGTH - 1
	jr nz, .loop
	ret
; fb80f

NameRaterIntroText: ; 0xfb80f
	; Hello, hello! I'm the NAME RATER.
	; I rate the names of #MON.
	; Would you like me to rate names?
	text_jump UnknownText_0x1c0043
	db "@"
; 0xfb814

NameRaterWhichMonText: ; 0xfb814
	; Which #MON's nickname should I rate for you?
	text_jump UnknownText_0x1c00a0
	db "@"
; 0xfb819

NameRaterIsGoodText: ; 0xfb819
	; Hm… @ … That's a fairly decent name.
	; But, how about a slightly better nickname?
	; Want me to give it a better name?
	text_jump UnknownText_0x1c00cd
	db "@"
; 0xfb81e

NameRaterWhichNameText: ; 0xfb81e
	; All right. What name should we give it, then?
	text_jump UnknownText_0x1c0142
	db "@"
; 0xfb823

NameRaterEvenBetterText: ; 0xfb823
	; That's a better name than before! Well done!
	text_jump UnknownText_0x1c0171
	db "@"
; 0xfb828

NameRaterCancelText: ; 0xfb828
	; OK, then. Come again sometime.
	text_jump UnknownText_0x1c019e
	db "@"
; 0xfb82d

NameRaterTradedText: ; 0xfb82d
	; Hm… @ ? What a great name! It's perfect.
	; Treat @ with loving care.
	text_jump UnknownText_0x1c01be
	db "@"
; 0xfb832

NameRaterEggText: ; 0xfb832
	; Whoa… That's just an EGG.
	text_jump UnknownText_0x1c0208
	db "@"
; 0xfb837

NameRaterSameAsBeforeText: ; 0xfb837
	; It might look the different as before,
	; but this new name is much better! Well done!
	text_jump UnknownText_0x1c0222
	db "@"
; 0xfb83c

NameRaterDoneText: ; 0xfb83c
	; All right. This #MON is now named @ .
	text_jump UnknownText_0x1c0272
	db "@"
; 0xfb841
