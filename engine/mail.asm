SendMailToPC: ; 4456e
	ld a, MON_ITEM
	call GetPartyParamLocation
	ld d, [hl]
	callba ItemIsMail
	jr nc, .full
	call GetMailboxCount
	cp MAILBOX_CAPACITY
	jr nc, .full
	ld bc, MAIL_STRUCT_LENGTH
	ld hl, sMailbox
	call AddNTimes
	ld d, h
	ld e, l
	ld a, [CurPartyMon]
	ld bc, MAIL_STRUCT_LENGTH
	ld hl, sPartyMail
	call AddNTimes
	push hl
	ld a, BANK(sMailboxCount)
	call GetSRAMBank
	ld bc, MAIL_STRUCT_LENGTH
	call CopyBytes
	pop hl
	xor a
	ld bc, MAIL_STRUCT_LENGTH
	call ByteFill
	ld a, MON_ITEM
	call GetPartyParamLocation
	ld [hl], $0
	ld hl, sMailboxCount
	inc [hl]
	call CloseSRAM
	xor a
	ret

.full
	scf
	ret
; 445c0

Function445c0: ; 445c0 (11:45c0)
	ld a, BANK(sMailboxCount)
	call GetSRAMBank
	ld a, b
	push bc
	ld hl, sMailbox
	ld bc, MAIL_STRUCT_LENGTH
	call AddNTimes
	push hl
	add hl, bc
	pop de
	pop bc
.loop
	ld a, b
	cp $9
	jr z, .done
	push bc
	ld bc, MAIL_STRUCT_LENGTH
	call CopyBytes
	pop bc
	inc b
	jr .loop
.done
	ld h, d
	ld l, e
	xor a
	ld bc, MAIL_STRUCT_LENGTH
	call ByteFill
	ld hl, sMailboxCount
	dec [hl]
	jp CloseSRAM
; 445f4 (11:45f4)

ReadMailMessage: ; 445f4
	ld a, b
	ld hl, sMailbox
	ld bc, MAIL_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	callba ReadAnyMail
	ret

Function44607: ; 44607
	ld a, BANK(sMailboxCount)
	call GetSRAMBank
	push bc
	ld a, b
	ld bc, MAIL_STRUCT_LENGTH
	ld hl, sMailbox
	call AddNTimes
	push hl
	ld a, [CurPartyMon]
	ld bc, MAIL_STRUCT_LENGTH
	ld hl, sPartyMail
	call AddNTimes
	ld d, h
	ld e, l
	pop hl
	push hl
	ld bc, MAIL_STRUCT_LENGTH
	call CopyBytes
	pop hl
	ld de, PARTYMON_STRUCT_LENGTH - MON_MOVES
	add hl, de
	ld d, [hl]
	ld a, [CurPartyMon]
	ld hl, PartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld [hl], d
	call CloseSRAM
	pop bc
	jp Function445c0
; 44648 (11:4648)

GetMailboxCount: ; 44648
	ld a, BANK(sMailboxCount)
	call GetSRAMBank
	ld a, [sMailboxCount]
	ld c, a
	jp CloseSRAM
; 44654

Function44654:: ; 44654
	push bc
	push de
	callba SelectMonFromParty
	ld a, $2
	jr c, .asm_446c6
	ld a, [CurPartyMon]
	ld hl, PartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, [hl]
	callba ItemIsMail
	ld a, $3
	jr nc, .asm_446c6
	ld a, BANK(sPartyMail)
	call GetSRAMBank
	ld a, [CurPartyMon]
	ld hl, sPartyMail
	ld bc, MAIL_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	pop hl
	pop bc

	ld a, $20
	ld [wd265], a
.asm_44691
	ld a, [de]
	ld c, a
	ld a, b
	call GetFarByte
	cp "@"
	jr z, .asm_446ab
	cp c
	ld a, $0
	jr nz, .asm_446c1
	inc hl
	inc de
	ld a, [wd265]
	dec a
	ld [wd265], a
	jr nz, .asm_44691

.asm_446ab
	callba CheckCurPartyMonFainted
	ld a, $4
	jr c, .asm_446c1
	xor a
	ld [wPokemonWithdrawDepositParameter], a
	callba Functione039
	ld a, $1

.asm_446c1
	call CloseSRAM
	jr .asm_446c8

.asm_446c6
	pop de
	pop bc

.asm_446c8
	ld [ScriptVar], a
	ret
; 446cc
