SendMailToPC:
	ld a, MON_ITEM
	call GetPartyParamLocation
	ld d, [hl]
	farcall ItemIsMail
	jr nc, .full
	call GetMailboxCount
	cp MAILBOX_CAPACITY
	jr nc, .full
	ld bc, MAIL_STRUCT_LENGTH
	ld hl, sMailbox
	call AddNTimes
	ld d, h
	ld e, l
	ld a, [wCurPartyMon]
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

DeleteMailFromPC:
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

ReadMailMessage:
	ld a, b
	ld hl, sMailbox
	ld bc, MAIL_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	farcall ReadAnyMail
	ret

MoveMailFromPCToParty:
	ld a, BANK(sMailboxCount)
	call GetSRAMBank
	push bc
	ld a, b
	ld bc, MAIL_STRUCT_LENGTH
	ld hl, sMailbox
	call AddNTimes
	push hl
	ld a, [wCurPartyMon]
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
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld [hl], d
	call CloseSRAM
	pop bc
	jp DeleteMailFromPC

GetMailboxCount:
	ld a, BANK(sMailboxCount)
	call GetSRAMBank
	ld a, [sMailboxCount]
	ld c, a
	jp CloseSRAM

CheckPokeMail::
	push bc
	push de
	farcall SelectMonFromParty
	ld a, POKEMAIL_REFUSED
	jr c, .pop_return

	ld a, [wCurPartyMon]
	ld hl, wPartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, [hl]
	farcall ItemIsMail
	ld a, POKEMAIL_NO_MAIL
	jr nc, .pop_return

	ld a, BANK(sPartyMail)
	call GetSRAMBank
	ld a, [wCurPartyMon]
	ld hl, sPartyMail
	ld bc, MAIL_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	pop hl
	pop bc

; Compare the mail message, byte for byte, with the expected message.
	ld a, MAIL_MSG_LENGTH
	ld [wTempByteValue], a
.loop
	ld a, [de]
	ld c, a
	ld a, b
	call GetFarByte
	cp "@"
	jr z, .done
	cp c
	ld a, POKEMAIL_WRONG_MAIL
	jr nz, .close_sram_return
	inc hl
	inc de
	ld a, [wTempByteValue]
	dec a
	ld [wTempByteValue], a
	jr nz, .loop

.done
	farcall CheckCurPartyMonFainted
	ld a, POKEMAIL_LAST_MON
	jr c, .close_sram_return
	xor a ; REMOVE_PARTY
	ld [wPokemonWithdrawDepositParameter], a
	farcall RemoveMonFromPartyOrBox
	ld a, POKEMAIL_CORRECT

.close_sram_return
	call CloseSRAM
	jr .return

.pop_return
	pop de
	pop bc

.return
	ld [wScriptVar], a
	ret

GivePokeMail::
	ld a, [wPartyCount]
	dec a
	push af
	push bc
	ld hl, wPartyMon1Item
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
	ld hl, wPartyMonOT
	ld bc, NAME_LENGTH
	call AddNTimes
	ld bc, NAME_LENGTH - 1
	call CopyBytes
	pop af
	ld hl, wPartyMon1ID
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	ld a, [wCurPartySpecies]
	ld [de], a
	inc de
	pop bc
	ld a, b
	ld [de], a
	jp CloseSRAM

BackupPartyMonMail:
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

RestorePartyMonMail:
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

DeletePartyMonMail:
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

IsAnyMonHoldingMail:
	ld a, [wPartyCount]
	and a
	jr z, .no_mons
	ld e, a
	ld hl, wPartyMon1Item
.loop
	ld d, [hl]
	push hl
	push de
	farcall ItemIsMail
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

_PlayerMailBoxMenu:
	call InitMail
	jr z, .nomail
	call LoadStandardMenuHeader
	call MailboxPC
	jp CloseWindow

.nomail
	ld hl, .EmptyMailboxText
	jp MenuTextboxBackup

.EmptyMailboxText:
	text_far _EmptyMailboxText
	text_end

InitMail:
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

MailboxPC_GetMailAuthor:
	dec a
	ld hl, sMailbox1Author
	ld bc, MAIL_STRUCT_LENGTH
	call AddNTimes
	ld a, BANK(sMailboxCount)
	call GetSRAMBank
	ld de, wStringBuffer2
	push de
	ld bc, NAME_LENGTH - 1
	call CopyBytes
	ld a, "@"
	ld [de], a
	call CloseSRAM
	pop de
	ret

MailboxPC_PrintMailAuthor:
	push de
	ld a, [wMenuSelection]
	call MailboxPC_GetMailAuthor
	pop hl
	jp PlaceString

MailboxPC:
	xor a
	ld [wCurMessageScrollPosition], a
	ld a, 1
	ld [wCurMessageIndex], a
.loop
	call InitMail
	ld hl, .TopMenuHeader
	call CopyMenuHeader
	xor a
	ldh [hBGMapMode], a
	call InitScrollingMenu
	call UpdateSprites

	ld a, [wCurMessageIndex]
	ld [wMenuCursorBuffer], a
	ld a, [wCurMessageScrollPosition]
	ld [wMenuScrollPosition], a
	call ScrollingMenu
	ld a, [wMenuScrollPosition]
	ld [wCurMessageScrollPosition], a
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

.Submenu:
	ld hl, .SubMenuHeader
	call LoadMenuHeader
	call VerticalMenu
	call ExitMenu
	jr c, .subexit
	ld a, [wMenuCursorY]
	dec a
	ld hl, .JumpTable
	rst JumpTable

.subexit
	ret

.JumpTable:
	dw .ReadMail
	dw .PutInPack
	dw .AttachMail
	dw .Cancel

.ReadMail:
	call FadeToMenu
	ld a, [wMenuSelection]
	dec a
	ld b, a
	call ReadMailMessage
	jp CloseSubmenu

.PutInPack:
	ld hl, .MessageLostText
	call MenuTextbox
	call YesNoBox
	call ExitMenu
	ret c
	ld a, [wMenuSelection]
	dec a
	call .GetMailType
	ld a, 1
	ld [wItemQuantityChangeBuffer], a
	ld hl, wNumItems
	call ReceiveItem
	jr c, .put_in_bag
	ld hl, .PackFullText
	jp MenuTextboxBackup

.put_in_bag
	ld a, [wMenuSelection]
	dec a
	ld b, a
	call DeleteMailFromPC
	ld hl, .PutAwayText
	jp MenuTextboxBackup

.PutAwayText:
	text_far ClearedMailPutAwayText
	text_end

.PackFullText:
	text_far MailPackFullText
	text_end

.MessageLostText:
	text_far MailMessageLostText
	text_end

.GetMailType:
	push af
	ld a, BANK(sMailboxCount)
	call GetSRAMBank
	pop af
	ld hl, sMailbox1Type
	ld bc, MAIL_STRUCT_LENGTH
	call AddNTimes
	ld a, [hl]
	ld [wCurItem], a
	jp CloseSRAM

.AttachMail:
	call FadeToMenu
	xor a
	ld [wPartyMenuActionText], a
	call ClearBGPalettes
.try_again
	farcall LoadPartyMenuGFX
	farcall InitPartyMenuWithCancel
	farcall InitPartyMenuGFX
	farcall WritePartyMenuTilemap
	farcall PrintPartyMenuText
	call WaitBGMap
	call SetPalettes
	call DelayFrame
	farcall PartyMenuSelect
	jr c, .exit2
	ld a, [wCurPartySpecies]
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
	ld a, [wMenuSelection]
	dec a
	ld b, a
	call MoveMailFromPCToParty
	ld hl, .MailMovedText
	call PrintText

.exit2
	jp CloseSubmenu

.HoldingMailText:
	text_far MailAlreadyHoldingItemText
	text_end

.EggText:
	text_far MailEggText
	text_end

.MailMovedText:
	text_far MailMovedFromBoxText
	text_end

.Cancel:
	ret

.TopMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 8, 1, SCREEN_WIDTH - 2, 10
	dw .TopMenuData
	db 1 ; default option

.TopMenuData:
	db SCROLLINGMENU_DISPLAY_ARROWS ; flags
	db 4, 0 ; rows, columns
	db SCROLLINGMENU_ITEMS_NORMAL ; item format
	dbw 0, wMailboxCount ; text pointer
	dba MailboxPC_PrintMailAuthor
	dba NULL
	dba NULL

.SubMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 13, 9
	dw .SubMenuData
	db 1 ; default option

.SubMenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "READ MAIL@"
	db "PUT IN PACK@"
	db "ATTACH MAIL@"
	db "CANCEL@"
