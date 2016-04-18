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
	ld [hl], 0
	ld hl, sMailboxCount
	inc [hl]
	call CloseSRAM
	xor a
	ret

.full
	scf
	ret
; 445c0

DeleteMailFromPC: ; 445c0 (11:45c0)
; Shift all mail messages in the mailbox
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
	cp MAILBOX_CAPACITY - 1
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

MoveMailFromPCToParty: ; 44607
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
	jp DeleteMailFromPC
; 44648 (11:4648)

GetMailboxCount: ; 44648
	ld a, BANK(sMailboxCount)
	call GetSRAMBank
	ld a, [sMailboxCount]
	ld c, a
	jp CloseSRAM
; 44654

CheckPokeItem:: ; 44654
	push bc
	push de
	callba SelectMonFromParty
	ld a, $2
	jr c, .pop_return

	ld a, [CurPartyMon]
	ld hl, PartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, [hl]
	callba ItemIsMail
	ld a, $3
	jr nc, .pop_return

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

; Compare the mail message, byte for byte, with the expected message.
	ld a, MAIL_MSG_LENGTH
	ld [wd265], a
.loop
	ld a, [de]
	ld c, a
	ld a, b
	call GetFarByte
	cp "@"
	jr z, .done
	cp c
	ld a, $0
	jr nz, .close_sram_return
	inc hl
	inc de
	ld a, [wd265]
	dec a
	ld [wd265], a
	jr nz, .loop

.done
	callba CheckCurPartyMonFainted
	ld a, $4
	jr c, .close_sram_return
	xor a
	ld [wPokemonWithdrawDepositParameter], a
	callba RemoveMonFromPartyOrBox
	ld a, $1

.close_sram_return
	call CloseSRAM
	jr .return

.pop_return
	pop de
	pop bc

.return
	ld [ScriptVar], a
	ret
; 446cc


GivePokeItem:: ; 446cc
	ld a, [PartyCount]
	dec a
	push af
	push bc
	ld hl, PartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	pop bc
	ld [hl], b
	pop af
	push bc
	push af
	ld hl, sPartyMail
	ld bc, MAIL_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, wd002
	ld bc, MAIL_MSG_LENGTH + 1
	ld a, BANK(sPartyMail)
	call GetSRAMBank
	call CopyBytes
	pop af
	push af
	ld hl, PartyMonOT
	ld bc, NAME_LENGTH
	call AddNTimes
	ld bc, NAME_LENGTH - 1
	call CopyBytes
	pop af
	ld hl, PartyMon1ID
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	ld a, [CurPartySpecies]
	ld [de], a
	inc de
	pop bc
	ld a, b
	ld [de], a
	jp CloseSRAM
; 44725


BackupPartyMonMail: ; 44725
	ld a, BANK(sPartyMail)
	call GetSRAMBank
	ld hl, sPartyMail
	ld de, sPartyMailBackup
	ld bc, 6 * MAIL_STRUCT_LENGTH
	call CopyBytes
	ld hl, sMailboxCount
	ld de, sMailboxCountBackup
	ld bc, 1 + 10 * MAIL_STRUCT_LENGTH
	call CopyBytes
	jp CloseSRAM
; 44745

RestorePartyMonMail: ; 44745 (11:4745)
	ld a, BANK(sPartyMail)
	call GetSRAMBank
	ld hl, sPartyMailBackup
	ld de, sPartyMail
	ld bc, 6 * MAIL_STRUCT_LENGTH
	call CopyBytes
	ld hl, sMailboxCountBackup
	ld de, sMailboxCount
	ld bc, 1 + 10 * MAIL_STRUCT_LENGTH
	call CopyBytes
	jp CloseSRAM

DeletePartyMonMail: ; 44765 (11:4765)
	ld a, BANK(sPartyMail)
	call GetSRAMBank
	xor a
	ld hl, sPartyMail
	ld bc, 6 * MAIL_STRUCT_LENGTH
	call ByteFill
	xor a
	ld hl, sMailboxCount
	ld bc, 1 + 10 * MAIL_STRUCT_LENGTH
	call ByteFill
	jp CloseSRAM
; 44781 (11:4781)


IsAnyMonHoldingMail: ; 44781
	ld a, [PartyCount]
	and a
	jr z, .no_mons
	ld e, a
	ld hl, PartyMon1Item
.loop
	ld d, [hl]
	push hl
	push de
	callba ItemIsMail
	pop de
	pop hl
	ret c
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	dec e
	jr nz, .loop

.no_mons
	and a
	ret
; 447a0

_KrisMailBoxMenu: ; 0x447a0
	call InitMail
	jr z, .nomail
	call LoadStandardMenuDataHeader
	call MailboxPC
	jp CloseWindow

.nomail
	ld hl, .EmptyMailboxText
	jp MenuTextBoxBackup
; 0x447b4

.EmptyMailboxText: ; 0x447b4
	text_jump _EmptyMailboxText
	db "@"

InitMail: ; 0x447b9
; initialize wMailboxCount and beyond with incrementing values, one per mail
; set z if no mail
	ld a, BANK(sMailboxCount)
	call GetSRAMBank
	ld a, [sMailboxCount]
	call CloseSRAM
	ld hl, wMailboxCount
	ld [hli], a
	and a

	jr z, .done ; if no mail, we're done

	; load values in memory with incrementing values starting at wMailboxCount
	ld b, a
	ld a, 1
.loop
	ld [hli], a
	inc a
	dec b
	jr nz, .loop
.done
	ld [hl], -1 ; terminate

	ld a, [wMailboxCount]
	and a
	ret
; 0x447da

MailboxPC_GetMailAuthor: ; 0x447da
	dec a
	ld hl, sMailbox1Author
	ld bc, MAIL_STRUCT_LENGTH
	call AddNTimes
	ld a, BANK(sMailboxCount)
	call GetSRAMBank
	ld de, StringBuffer2
	push de
	ld bc, NAME_LENGTH - 1
	call CopyBytes
	ld a, "@"
	ld [de], a
	call CloseSRAM
	pop de
	ret
; 0x447fb

MailboxPC_PrintMailAuthor: ; 0x447fb
	push de
	ld a, [MenuSelection]
	call MailboxPC_GetMailAuthor
	pop hl
	jp PlaceString
; 0x44806

MailboxPC: ; 0x44806
	xor a
	ld [OBPals + 8 * 6], a
	ld a, 1
	ld [wCurMessageIndex], a
.loop
	call InitMail
	ld hl, .TopMenuDataHeader
	call CopyMenuDataHeader
	xor a
	ld [hBGMapMode], a
	call InitScrollingMenu
	call UpdateSprites

	ld a, [wCurMessageIndex]
	ld [wMenuCursorBuffer], a
	ld a, [OBPals + 8 * 6]
	ld [wMenuScrollPosition], a
	call ScrollingMenu
	ld a, [wMenuScrollPosition]
	ld [OBPals + 8 * 6], a
	ld a, [wMenuCursorY]
	ld [wCurMessageIndex], a

	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .exit
	call .Submenu
	jr .loop

.exit
	xor a
	ret
; 0x4484a

.Submenu: ; 0x4484a
	ld hl, .SubMenuDataHeader
	call LoadMenuDataHeader
	call VerticalMenu
	call ExitMenu
	jr c, .subexit
	ld a, [wMenuCursorY]
	dec a
	ld hl, .JumpTable
	rst JumpTable

.subexit
	ret
; 0x44861

.JumpTable:
	dw .ReadMail
	dw .PutInPack
	dw .AttachMail
	dw .Cancel

.ReadMail: ; 0x44869
	call FadeToMenu
	ld a, [MenuSelection]
	dec a
	ld b, a
	call ReadMailMessage
	jp CloseSubmenu
; 0x44877

.PutInPack: ; 0x44877
	ld hl, .MessageLostText
	call MenuTextBox
	call YesNoBox
	call ExitMenu
	ret c
	ld a, [MenuSelection]
	dec a
	call .GetMailType
	ld a, 1
	ld [wItemQuantityChangeBuffer], a
	ld hl, NumItems
	call ReceiveItem
	jr c, .put_in_bag
	ld hl, .PackFullText
	jp MenuTextBoxBackup

.put_in_bag
	ld a, [MenuSelection]
	dec a
	ld b, a
	call DeleteMailFromPC
	ld hl, .PutAwayText
	jp MenuTextBoxBackup
; 0x448ac

.PutAwayText: ; 0x448ac
	text_jump ClearedMailPutAwayText
	db "@"

.PackFullText: ; 0x448b1
	text_jump MailPackFullText
	db "@"

.MessageLostText: ; 0x448b6
	text_jump MailMessageLostText
	db "@"

.GetMailType: ; 0x448bb
	push af
	ld a, BANK(sMailboxCount)
	call GetSRAMBank
	pop af
	ld hl, sMailbox1Type
	ld bc, MAIL_STRUCT_LENGTH
	call AddNTimes
	ld a, [hl]
	ld [CurItem], a
	jp CloseSRAM
; 0x448d2

.AttachMail: ; 0x448d2
	call FadeToMenu
	xor a
	ld [PartyMenuActionText], a
	call ClearBGPalettes
.try_again
	callba LoadPartyMenuGFX
	callba InitPartyMenuWithCancel
	callba InitPartyMenuGFX
	callba WritePartyMenuTilemap
	callba PrintPartyMenuText
	call WaitBGMap
	call SetPalettes
	call DelayFrame
	callba PartyMenuSelect
	jr c, .exit2
	ld a, [CurPartySpecies]
	cp EGG
	jr z, .egg
	ld a, MON_ITEM
	call GetPartyParamLocation
	ld a, [hl]
	and a
	jr z, .attach_mail
	ld hl, .HoldingMailText
	call PrintText
	jr .try_again

.egg
	ld hl, .EggText
	call PrintText
	jr .try_again

.attach_mail
	ld a, [MenuSelection]
	dec a
	ld b, a
	call MoveMailFromPCToParty
	ld hl, .MailMovedText
	call PrintText

.exit2
	jp CloseSubmenu
; 0x4493c

.HoldingMailText: ; 0x4493c
	text_jump MailAlreadyHoldingItemText
	db "@"

.EggText: ; 0x44941
	text_jump MailEggText
	db "@"

.MailMovedText: ; 0x44946
	text_jump MailMovedFromBoxText
	db "@"

.Cancel:
	ret

.TopMenuDataHeader: ; 0x4494c
	db %01000000 ; flags
	db 1, 8 ; start coords
	db 10, 18 ; end coords
	dw .TopMenuData2
	db 1 ; default option

.TopMenuData2:
	db %00010000 ; flags
	db 4, 0 ; rows/columns?
	db 1 ; horizontal spacing?
	dbw 0, wMailboxCount ; text pointer
	dba MailboxPC_PrintMailAuthor
	dba NULL
	dba NULL

.SubMenuDataHeader: ; 0x44964
	db %01000000 ; flags
	db 0,  0 ; start coords
	db 9, 13 ; end coords
	dw .SubMenuData2
	db 1 ; default option

.SubMenuData2:
	db %10000000 ; flags
	db 4 ; items
	db "READ MAIL@"
	db "PUT IN PACK@"
	db "ATTACH MAIL@"
	db "CANCEL@"
