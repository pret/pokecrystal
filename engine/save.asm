Function14a1a: ; 14a1a
	call Function1d6e
	callba Function5e9a
	call SpeechTextBox
	call UpdateSprites
	callba Function4cf45
	ld hl, UnknownText_0x15283
	call SaveTheGame_yesorno
	jr nz, .refused
	call CheckForExistingSaveFile
	jr c, .refused
	call SetWRAMStateForSave
	call _SavingDontTurnOffThePower
	call ClearWRAMStateAfterSave
	call ExitMenu
	and a
	ret
.refused
	call ExitMenu
	call Functiond90
	callba Function4cf45
	scf
	ret

Function14a58: ; 14a58
	call SetWRAMStateForSave
	callba Function14056
	callba Function1050d9
	call SavePartyData
	call Function14e13
	call LoadSavedPartyData
	call Function14e8b
	callba Function44725
	callba Function1406a
	call ClearWRAMStateAfterSave
	ret
; 14a83


Function14a83: ; 14a83 (5:4a83)
	push de
	ld hl, UnknownText_0x152a1
	call MenuTextBox
	call YesNoBox
	call ExitMenu
	jr c, .refused
	call CheckForExistingSaveFile
	jr c, .refused
	call SetWRAMStateForSave
	call SavingDontTurnOffThePower
	call Function14e0c
	pop de
	ld a, e
	ld [wCurBox], a
	call Function15021
	call SavedTheGame
	call ClearWRAMStateAfterSave
	and a
	ret
.refused
	pop de
	ret

Function14ab2: ; 14ab2
	call CheckForExistingSaveFile
	jr c, .refused
	call SetWRAMStateForSave
	call _SavingDontTurnOffThePower
	call ClearWRAMStateAfterSave
	and a

.refused
	ret
; 14ac2

Function14ac2: ; 14ac2
	call SetWRAMStateForSave
	push de
	call Function14e0c
	pop de
	ld a, e
	ld [wCurBox], a
	call Function15021
	call ClearWRAMStateAfterSave
	ret
; 14ad5

Function14ad5: ; 14ad5
	call SetWRAMStateForSave
	push de
	call Function14e0c
	pop de
	ld a, e
	ld [wCurBox], a
	ld a, $1
	ld [wcfcd], a
	callba Function14056
	callba Function1050d9
	call Function14da9
	call SaveOptionsSelection
	call SavePlayerData
	call SavePartyData
	call Function14e13
	call Function14e2d
	call LoadSavedOptions
	call LoadSavedPlayerData
	call LoadSavedPartyData
	call Function14e8b
	callba Function44725
	callba Function106187
	callba Function1406a
	call Function15021
	call ClearWRAMStateAfterSave
	ld de, SFX_SAVE
	call PlaySFX
	ld c, $18
	call DelayFrames
	ret
; 14b34

Function14b34: ; 14b34
	ld hl, UnknownText_0x152a6
	call MenuTextBox
	call YesNoBox
	call ExitMenu
	jr c, .asm_14b52
	call CheckForExistingSaveFile
	jr c, .asm_14b52
	call SetWRAMStateForSave
	call _SavingDontTurnOffThePower
	call ClearWRAMStateAfterSave
	and a
	ret

.asm_14b52
	scf
	ret
; 14b54

SetWRAMStateForSave: ; 14b54
	ld a, $1
	ld [wc2cd], a
	ret
; 14b5a

ClearWRAMStateAfterSave: ; 14b5a
	xor a
	ld [wc2cd], a
	ret
; 14b5f


Function14b5f: ; 14b5f
	ld a, $1
	call GetSRAMBank
	ld hl, $bdd9
	ld de, $be3b
	ld bc, $0b1a
.loop
	ld a, [hld]
	ld [de], a
	dec de
	dec bc
	ld a, c
	or b
	jr nz, .loop
	ld hl, OverworldMap
	ld de, $b2c0
	ld bc, 7 * 14
	call CopyBytes
	call CloseSRAM
	ret
; 14b85

Function14b85: ; 14b85
	call Function14c10
	ret
; 14b89

CheckForExistingSaveFile: ; 14b89
	ld a, [wcfcd]
	and a
	jr z, .getridofpreviousplayersave
	call Function14bcb
	jr z, .yoursavefile
	ld hl, UnknownText_0x15297
	call SaveTheGame_yesorno
	jr nz, .refused
	jr .getridofpreviousplayersave

.yoursavefile
	ld hl, UnknownText_0x15292
	call SaveTheGame_yesorno
	jr nz, .refused
	jr .ok

.getridofpreviousplayersave
	call GetRidOfPreviousPlayersSave

.ok
	and a
	ret

.refused
	scf
	ret
; 14baf

SaveTheGame_yesorno: ; 14baf
	ld b, BANK(UnknownText_0x15283)
	call MapTextbox
	call LoadMenuTextBox
	lb bc, 0, 7
	call PlaceYesNoBox
	ld a, [wcfa9]
	dec a
	call WriteBackup
	push af
	call Functiond90
	pop af
	and a
	ret
; 14bcb

Function14bcb: ; 14bcb
	ld a, $1
	call GetSRAMBank
	ld hl, $a009
	ld a, [hli]
	ld c, [hl]
	ld b, a
	call CloseSRAM
	ld a, [PlayerID]
	cp b
	ret nz
	ld a, [PlayerID + 1]
	cp c
	ret
; 14be3

_SavingDontTurnOffThePower: ; 14be3
	call SavingDontTurnOffThePower
SavedTheGame: ; 14be6
	call Function14c10
	; wait 32 frames
	ld c, $20
	call DelayFrames
	; copy the original text speed setting to the stack
	ld a, [Options]
	push af
	; set text speed super slow
	ld a, 3
	ld [Options], a
	; <PLAYER> saved the game!
	ld hl, UnknownText_0x1528d
	call PrintText
	; restore the original text speed setting
	pop af
	ld [Options], a
	ld de, SFX_SAVE
	call WaitPlaySFX
	call WaitSFX
	; wait 30 frames
	ld c, $1e
	call DelayFrames
	ret
; 14c10


Function14c10: ; 14c10
	ld a, 1
	ld [wcfcd], a
	callba Function14056
	callba Function1050d9
	call Function14da9
	call SaveOptionsSelection
	call SavePlayerData
	call SavePartyData
	call Function14e0c
	call Function14e13
	call Function14e2d
	call LoadSavedOptions
	call LoadSavedPlayerData
	call LoadSavedPartyData
	call Function14e8b
	call Function14c6b
	callba Function44725
	callba Function106187
	callba Function1406a
	ld a, $1
	call GetSRAMBank
	ld a, [$be45]
	cp $4
	jr nz, .asm_14c67
	xor a
	ld [$be45], a

.asm_14c67
	call CloseSRAM
	ret
; 14c6b

Function14c6b: ; 14c6b
	call Function14c90
	ld a, $0
	call GetSRAMBank
	ld a, [$bf10]
	ld e, a
	ld a, [$bf11]
	ld d, a
	or e
	jr z, .asm_14c84
	ld a, e
	sub l
	ld a, d
	sbc h
	jr c, .asm_14c8c

.asm_14c84
	ld a, l
	ld [$bf10], a
	ld a, h
	ld [$bf11], a

.asm_14c8c
	call CloseSRAM
	ret
; 14c90

Function14c90: ; 14c90
	ld hl, wc000
.asm_14c93
	ld a, [hl]
	or a
	ret nz
	inc hl
	jr .asm_14c93
; 14c99

SavingDontTurnOffThePower: ; 14c99
	; Prevent joypad interrupts
	xor a
	ld [hJoypadReleased], a
	ld [hJoypadPressed], a
	ld [hJoypadSum], a
	ld [hJoypadDown], a
	; Save the text speed setting to the stack
	ld a, [Options]
	push af
	; Set the text speed to super slow
	ld a, $3
	ld [Options], a
	; SAVING... DON'T TURN OFF THE POWER.
	ld hl, UnknownText_0x15288
	call PrintText
	; Restore the text speed setting
	pop af
	ld [Options], a
	; Wait for 16 frames
	ld c, $10
	call DelayFrames
	ret
; 14cbb


GetRidOfPreviousPlayersSave: ; 14cbb
	call Function151fb
	call Function14d06
	call Function14ce2
	call Function14cf4
	call Function14d68
	call Function14d5c
	ld a, $0
	call GetSRAMBank
	xor a
	ld [$bf10], a
	ld [$bf11], a
	call CloseSRAM
	ld a, $1
	ld [wd4b4], a
	ret
; 14ce2

Function14ce2: ; 14ce2
	ld a, $1
	call GetSRAMBank
	ld hl, $b260
	ld bc, $0060
	xor a
	call ByteFill
	jp CloseSRAM
; 14cf4

Function14cf4: ; 14cf4
	ld a, $0
	call GetSRAMBank
	ld hl, $abe4
	ld bc, $004c
	xor a
	call ByteFill
	jp CloseSRAM
; 14d06

Function14d06: ; 14d06
	ld a, $1
	call GetSRAMBank
	ld hl, $b2c0
	ld bc, $0b7c
	xor a
	call ByteFill
	jp CloseSRAM
; 14d18

Function14d18: ; 14d18
; copy Unknown_14d2c to SRA4:a007
	ld a, $4
	call GetSRAMBank
	ld hl, Unknown_14d2c
	ld de, $a007
	ld bc, 48
	call CopyBytes
	jp CloseSRAM
; 14d2c

Unknown_14d2c: ; 14d2c
	db $0d, $02, $00, $05, $00, $00
	db $22, $02, $01, $05, $00, $00
	db $03, $04, $05, $08, $03, $05
	db $0e, $06, $03, $02, $00, $00
	db $39, $07, $07, $04, $00, $05
	db $04, $07, $01, $05, $00, $00
	db $0f, $05, $14, $07, $05, $05
	db $11, $0c, $0c, $06, $06, $04
; 14d5c

Function14d5c: ; 14d5c
	ld a, $1
	call GetSRAMBank
	xor a
	ld [$be45], a
	jp CloseSRAM
; 14d68

Function14d68: ; 14d68
	call Function1509a
	ret
; 14d6c

Function14d6c: ; 14d6c
	ld a, $4
	call GetSRAMBank
	ld a, [$a60b]
	ld b, $0
	and a
	jr z, .ok
	ld b, $2

.ok
	ld a, b
	ld [$a60b], a
	call CloseSRAM
	ret
; 14d83

Function14d83: ; 14d83
	ld a, $4
	call GetSRAMBank
	xor a
	ld [$a60c], a
	ld [$a60d], a
	call CloseSRAM
	ret
; 14d93

Function14d93: ; 14d93
	ld a, $7
	call GetSRAMBank
	xor a
	ld [$a000], a
	call CloseSRAM
	ret
; 14da0


Function14da0: ; 14da0
	ld a, [wd4b4]
	and a
	ret nz
	call GetRidOfPreviousPlayersSave
	ret
; 14da9

Function14da9: ; 14da9
	ld a, $1
	call GetSRAMBank
	ld a, 99
	ld [$a008], a
	ld a, " "
	ld [$ad0f], a
	jp CloseSRAM
; 14dbb

SaveOptionsSelection: ; 14dbb
; Copy Options to SRA1:a000
	ld a, $1
	call GetSRAMBank
	ld hl, Options
	ld de, $a000
	ld bc, OptionsEnd - Options
	call CopyBytes
	ld a, [Options]
	and $ef
	ld [$a000], a
	jp CloseSRAM
; 14dd7

SavePlayerData: ; 14dd7
; Copy 2122 bytes starting at PlayerID to SRA1:a009
	ld a, $1
	call GetSRAMBank
	ld hl, PlayerID
	ld de, $a009
	ld bc, VisitedSpawns - PlayerID
	call CopyBytes
	ld hl, VisitedSpawns
	ld de, $a833
	ld bc, PartyCount - VisitedSpawns
	call CopyBytes
	jp CloseSRAM
; 14df7

SavePartyData: ; 14df7
; Copy your party to SRA1:a865.
	ld a, $1
	call GetSRAMBank
	ld hl, PartyCount
	ld de, $a865
	ld bc, wdff5 - PartyCount
	call CopyBytes
	call CloseSRAM
	ret
; 14e0c

Function14e0c: ; 14e0c
	call Function150d8
	call Function150f9
	ret
; 14e13

Function14e13: ; 14e13
	ld hl, $a009
	ld bc, $0b7a
	ld a, $1
	call GetSRAMBank
	call Function15273
	ld a, e
	ld [$ad0d], a
	ld a, d
	ld [$ad0e], a
	call CloseSRAM
	ret
; 14e2d

Function14e2d: ; 14e2d
	ld a, $0
	call GetSRAMBank
	ld a, 99
	ld [$b208], a
	ld a, " "
	ld [$bf0f], a
	call CloseSRAM
	ret
; 14e40

LoadSavedOptions: ; 14e40
	ld a, $0
	call GetSRAMBank
	ld hl, Options
	ld de, $b200
	ld bc, OptionsEnd - Options
	call CopyBytes
	call CloseSRAM
	ret
; 14e55

LoadSavedPlayerData: ; 14e55
	ld a, $0
	call GetSRAMBank
	ld hl, PlayerID
	ld de, $b209
	ld bc, VisitedSpawns - PlayerID
	call CopyBytes
	ld hl, VisitedSpawns
	ld de, $ba33
	ld bc, PartyCount - VisitedSpawns
	call CopyBytes
	call CloseSRAM
	ret
; 14e76

LoadSavedPartyData: ; 14e76
	ld a, $0
	call GetSRAMBank
	ld hl, PartyCount
	ld de, $ba65
	ld bc, wdff5 - PartyCount
	call CopyBytes
	call CloseSRAM
	ret
; 14e8b

Function14e8b: ; 14e8b
	ld hl, $b209
	ld bc, $0b7a
	ld a, $0
	call GetSRAMBank
	call Function15273
	ld a, e
	ld [$bf0d], a
	ld a, d
	ld [$bf0e], a
	call CloseSRAM
	ret
; 14ea5


TryLoadSaveFile: ; 14ea5 (5:4ea5)
	call Function15028
	jr nz, .trytowrite
	call Function14fd7
	call Function1500c
	call Function15021
	callba Function44745
	callba Function10619d
	callba Function1050ea
	call Function14e2d
	call LoadSavedOptions
	call LoadSavedPlayerData
	call LoadSavedPartyData
	call Function14e8b
	and a
	ret
.trytowrite
	call Function1507c
	jr nz, .corrupt
	call Function15046
	call Function15067
	call Function15021
	callba Function44745
	callba Function10619d
	callba Function1050ea
	call Function14da9
	call SaveOptionsSelection
	call SavePlayerData
	call SavePartyData
	call Function14e13
	and a
	ret
.corrupt
	ld a, [Options]
	push af
	set 4, a
	ld [Options], a
	ld hl, UnknownText_0x1529c
	call PrintText
	pop af
	ld [Options], a
	scf
	ret


Function14f1c: ; 14f1c
	xor a
	ld [wcfcd], a
	call Function14f84
	ld a, [wcfcd]
	and a
	jr z, .asm_14f46
	ld a, $1
	call GetSRAMBank
	ld hl, $a044
	ld de, StartDay
	ld bc, $0008
	call CopyBytes
	ld hl, $a3da
	ld de, StatusFlags
	ld a, [hl]
	ld [de], a
	call CloseSRAM
	ret

.asm_14f46
	call Function14faf
	ld a, [wcfcd]
	and a
	jr z, .asm_14f6c
	ld a, $0
	call GetSRAMBank
	ld hl, $b244
	ld de, StartDay
	ld bc, 8
	call CopyBytes
	ld hl, $b5da
	ld de, StatusFlags
	ld a, [hl]
	ld [de], a
	call CloseSRAM
	ret

.asm_14f6c
	ld hl, DefaultOptions
	ld de, Options
	ld bc, OptionsEnd - Options
	call CopyBytes
	call Function67e
	ret
; 14f7c

DefaultOptions: ; 14f7c
	db $03 ; mid text speed
	db $00
	db $00 ; frame 0
	db $01
	db $40 ; gb printer: normal brightness
	db $01 ; menu account on
	db $00
	db $00
; 14f84

Function14f84: ; 14f84
	ld a, $1
	call GetSRAMBank
	ld a, [$a008]
	cp 99
	jr nz, .nope
	ld a, [$ad0f]
	cp " "
	jr nz, .nope
	ld hl, $a000
	ld de, Options
	ld bc, OptionsEnd - Options
	call CopyBytes
	call CloseSRAM
	ld a, $1
	ld [wcfcd], a

.nope
	call CloseSRAM
	ret
; 14faf

Function14faf: ; 14faf
	ld a, $0
	call GetSRAMBank
	ld a, [$b208]
	cp 99
	jr nz, .nope
	ld a, [$bf0f]
	cp " "
	jr nz, .nope
	ld hl, $b200
	ld de, Options
	ld bc, OptionsEnd - Options
	call CopyBytes
	ld a, $2
	ld [wcfcd], a

.nope
	call CloseSRAM
	ret
; 14fd7


Function14fd7: ; 14fd7 (5:4fd7)
	ld a, $1
	call GetSRAMBank
	ld hl, $a009
	ld de, PlayerID
	ld bc, VisitedSpawns - PlayerID
	call CopyBytes
	ld hl, $a833
	ld de, VisitedSpawns
	ld bc, PartyCount - VisitedSpawns
	call CopyBytes
	call CloseSRAM
	ld a, $1
	call GetSRAMBank
	ld a, [$be45]
	cp $4
	jr nz, .asm_15008
	ld a, $3
	ld [$be45], a
.asm_15008
	call CloseSRAM
	ret

Function1500c: ; 1500c
	ld a, $1
	call GetSRAMBank
	ld hl, $a865
	ld de, PartyCount
	ld bc, wdff5 - PartyCount
	call CopyBytes
	call CloseSRAM
	ret
; 15021


Function15021: ; 15021 (5:5021)
	call Function150d8
	call Function1517d
	ret

Function15028: ; 15028 (5:5028)
	ld hl, $a009
	ld bc, $b7a
	ld a, $1
	call GetSRAMBank
	call Function15273
	ld a, [$ad0d]
	cp e
	jr nz, .asm_15040
	ld a, [$ad0e]
	cp d
.asm_15040
	push af
	call CloseSRAM
	pop af
	ret

Function15046: ; 15046 (5:5046)
	ld a, $0
	call GetSRAMBank
	ld hl, $b209
	ld de, PlayerID
	ld bc, VisitedSpawns - PlayerID
	call CopyBytes
	ld hl, $ba33
	ld de, VisitedSpawns
	ld bc, PartyCount - VisitedSpawns
	call CopyBytes
	call CloseSRAM
	ret

Function15067: ; 15067 (5:5067)
	ld a, $0
	call GetSRAMBank
	ld hl, $ba65
	ld de, PartyCount
	ld bc, wdff5 - PartyCount
	call CopyBytes
	call CloseSRAM
	ret

Function1507c: ; 1507c (5:507c)
	ld hl, $b209
	ld bc, $b7a
	ld a, $0
	call GetSRAMBank
	call Function15273
	ld a, [$bf0d]
	cp e
	jr nz, .asm_15094
	ld a, [$bf0e]
	cp d
.asm_15094
	push af
	call CloseSRAM
	pop af
	ret


Function1509a: ; 1509a
	ld a, $1
	call GetSRAMBank
	ld hl, PlayerGender
	ld de, $be3d
	ld bc, wd479 - PlayerGender
	call CopyBytes
	ld hl, wd479
	ld a, [hli]
	ld [$a60e], a
	ld a, [hli]
	ld [$a60f], a
	jp CloseSRAM
; 150b9


Function150b9: ; 150b9 (5:50b9)
	ld a, $1
	call GetSRAMBank
	ld hl, $be3d
	ld de, PlayerGender
	ld bc, wd479 - PlayerGender
	call CopyBytes
	ld hl, wd479
	ld a, [$a60e]
	ld [hli], a
	ld a, [$a60f]
	ld [hli], a
	jp CloseSRAM


Function150d8: ; 150d8
	ld a, [wCurBox]
	cp NUM_BOXES
	jr c, .asm_150e3
	xor a
	ld [wCurBox], a

.asm_150e3
	ld e, a
	ld d, 0
	ld hl, Unknown_1522d
rept 5
	add hl, de
endr
	ld a, [hli]
	push af
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	ret
; 150f9

Function150f9: ; 150f9
	push hl
	push af
	push de
	ld a, $1
	call GetSRAMBank
	ld hl, sBoxCount
	ld de, wc608
	ld bc, $01e0
	call CopyBytes
	call CloseSRAM
	pop de
	pop af
	push af
	push de
	call GetSRAMBank
	ld hl, wc608
	ld bc, $01e0
	call CopyBytes
	call CloseSRAM
	ld a, $1
	call GetSRAMBank
	ld hl, $aef0
	ld de, wc608
	ld bc, $01e0
	call CopyBytes
	call CloseSRAM
	pop de
	pop af
	ld hl, $01e0
	add hl, de
	ld e, l
	ld d, h
	push af
	push de
	call GetSRAMBank
	ld hl, wc608
	ld bc, $01e0
	call CopyBytes
	call CloseSRAM
	ld a, $1
	call GetSRAMBank
	ld hl, $b0d0
	ld de, wc608
	ld bc, $008e
	call CopyBytes
	call CloseSRAM
	pop de
	pop af
	ld hl, $01e0
	add hl, de
	ld e, l
	ld d, h
	call GetSRAMBank
	ld hl, wc608
	ld bc, $008e
	call CopyBytes
	call CloseSRAM
	pop hl
	ret
; 1517d


Function1517d: ; 1517d (5:517d)
	push hl
	ld l, e
	ld h, d
	push af
	push hl
	call GetSRAMBank
	ld de, wc608
	ld bc, $1e0
	call CopyBytes
	call CloseSRAM
	ld a, $1
	call GetSRAMBank
	ld hl, wc608
	ld de, $ad10
	ld bc, $1e0
	call CopyBytes
	call CloseSRAM
	pop hl
	pop af
	ld de, $1e0
	add hl, de
	push af
	push hl
	call GetSRAMBank
	ld de, wc608
	ld bc, $1e0
	call CopyBytes
	call CloseSRAM
	ld a, $1
	call GetSRAMBank
	ld hl, wc608
	ld de, $aef0
	ld bc, $1e0
	call CopyBytes
	call CloseSRAM
	pop hl
	pop af
	ld de, $1e0
	add hl, de
	call GetSRAMBank
	ld de, wc608
	ld bc, $8e
	call CopyBytes
	call CloseSRAM
	ld a, $1
	call GetSRAMBank
	ld hl, wc608
	ld de, $b0d0
	ld bc, $8e
	call CopyBytes
	call CloseSRAM
	pop hl
	ret


Function151fb: ; 151fb
	ld hl, Unknown_1522d
	ld c, $e
.outerloop
	push bc
	ld a, [hli]
	call GetSRAMBank
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	xor a
	ld [de], a
	inc de
	ld a, -1
	ld [de], a
	inc de
	ld bc, $044c
.loop
	xor a
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, -1
	ld [de], a
	inc de
	xor a
	ld [de], a
	call CloseSRAM
	pop bc
	dec c
	jr nz, .outerloop
	ret
; 1522d

Unknown_1522d: ; 1522d
; dbww bank, address, address
	dbww $02, $a000, $a44e ; 2, $a000, $a44e
	dbww $02, $a450, $a89e ; 2, $a450, $a89e
	dbww $02, $a8a0, $acee ; 2, $a8a0, $acee
	dbww $02, $acf0, $b13e ; 2, $acf0, $b13e
	dbww $02, $b140, $b58e ; 2, $b140, $b5de
	dbww $02, $b590, $b9de ; 2, $b590, $b9de
	dbww $02, $b9e0, $be2e ; 2, $b9e0, $be2e

	dbww $03, $a000, $a44e ; 3, $a000, $a44e
	dbww $03, $a450, $a89e ; 3, $a450, $a89e
	dbww $03, $a8a0, $acee ; 3, $a8a0, $acee
	dbww $03, $acf0, $b13e ; 3, $acf0, $b13e
	dbww $03, $b140, $b58e ; 3, $b140, $b58e
	dbww $03, $b590, $b9de ; 3, $b590, $b9de
	dbww $03, $b9e0, $be2e ; 3, $b9e0, $be2e
; 15273


Function15273: ; 15273
	ld de, 0
.loop
	ld a, [hli]
	add e
	ld e, a
	ld a, 0
	adc d
	ld d, a
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret
; 15283


UnknownText_0x15283: ; 0x15283
	; Would you like to save the game?
	text_jump UnknownText_0x1c454b
	db "@"
; 0x15288

UnknownText_0x15288: ; 0x15288
	; SAVING… DON'T TURN OFF THE POWER.
	text_jump UnknownText_0x1c456d
	db "@"
; 0x1528d

UnknownText_0x1528d: ; 0x1528d
	; saved the game.
	text_jump UnknownText_0x1c4590
	db "@"
; 0x15292

UnknownText_0x15292: ; 0x15292
	; There is already a save file. Is it OK to overwrite?
	text_jump UnknownText_0x1c45a3
	db "@"
; 0x15297

UnknownText_0x15297: ; 0x15297
	; There is another save file. Is it OK to overwrite?
	text_jump UnknownText_0x1c45d9
	db "@"
; 0x1529c

UnknownText_0x1529c: ; 0x1529c
	; The save file is corrupted!
	text_jump UnknownText_0x1c460d
	db "@"
; 0x152a1

UnknownText_0x152a1: ; 0x152a1
	; When you change a #MON BOX, data will be saved. OK?
	text_jump UnknownText_0x1c462a
	db "@"
; 0x152a6

UnknownText_0x152a6: ; 0x152a6
	; Each time you move a #MON, data will be saved. OK?
	text_jump UnknownText_0x1c465f
	db "@"
; 0x152ab
