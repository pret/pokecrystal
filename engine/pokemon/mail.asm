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
	ld hl, sMailboxes
	call AddNTimes
	ld d, h
	ld e, l
	ld a, [wCurPartyMon]
	ld bc, MAIL_STRUCT_LENGTH
	ld hl, sPartyMail
	call AddNTimes
	push hl
	ld a, BANK(sMailboxCount)
	call OpenSRAM
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
	call OpenSRAM
	ld a, b
	push bc
	ld hl, sMailboxes
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
	ld hl, sMailboxes
	ld bc, MAIL_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	farcall ReadAnyMail
	ret

MoveMailFromPCToParty:
	ld a, BANK(sMailboxCount)
	call OpenSRAM
	push bc
	ld a, b
	ld bc, MAIL_STRUCT_LENGTH
	ld hl, sMailboxes
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
	call OpenSRAM
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
	call OpenSRAM
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
	ld hl, wMonMailMessageBuffer
	ld bc, MAIL_MSG_LENGTH + 1
	ld a, BANK(sPartyMail)
	call OpenSRAM
	call CopyBytes
	pop af
	push af
	ld hl, wPartyMonOTs
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
	call OpenSRAM
	ld hl, sPartyMail
	ld de, sPartyMailBackup
	ld bc, PARTY_LENGTH * MAIL_STRUCT_LENGTH
	call CopyBytes
	ld hl, sMailboxCount
	ld de, sMailboxCountBackup
	ld bc, 1 + MAILBOX_CAPACITY * MAIL_STRUCT_LENGTH
	call CopyBytes
	jp CloseSRAM

RestorePartyMonMail:
	ld a, BANK(sPartyMail)
	call OpenSRAM
	ld hl, sPartyMailBackup
	ld de, sPartyMail
	ld bc, PARTY_LENGTH * MAIL_STRUCT_LENGTH
	call CopyBytes
	ld hl, sMailboxCountBackup
	ld de, sMailboxCount
	ld bc, 1 + MAILBOX_CAPACITY * MAIL_STRUCT_LENGTH
	call CopyBytes
	jp CloseSRAM

DeletePartyMonMail:
	ld a, BANK(sPartyMail)
	call OpenSRAM
	xor a
	ld hl, sPartyMail
	ld bc, PARTY_LENGTH * MAIL_STRUCT_LENGTH
	call ByteFill
	xor a
	ld hl, sMailboxCount
	ld bc, 1 + MAILBOX_CAPACITY * MAIL_STRUCT_LENGTH
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
; return z if no mail
	ld a, BANK(sMailboxCount)
	call OpenSRAM
	ld a, [sMailboxCount]
	call CloseSRAM

; initialize wMailboxCount from sMailboxCount
	ld hl, wMailboxCount
	ld [hli], a
	assert wMailboxCount + 1 == wMailboxItems
	and a
	jr z, .done ; if no mail, we're done

; initialize wMailboxItems with incrementing values starting at 1
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
	call OpenSRAM
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
	ld [wMenuCursorPosition], a
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
	ld hl, .Jumptable
	rst JumpTable

.subexit
	ret

.Jumptable:
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
	ld hl, .MailMessageLostText
	call MenuTextbox
	call YesNoBox
	call ExitMenu
	ret c
	ld a, [wMenuSelection]
	dec a
	call .GetMailType
	ld a, 1
	ld [wItemQuantityChange], a
	ld hl, wNumItems
	call ReceiveItem
	jr c, .put_in_bag
	ld hl, .MailPackFullText
	jp MenuTextboxBackup

.put_in_bag
	ld a, [wMenuSelection]
	dec a
	ld b, a
	call DeleteMailFromPC
	ld hl, .MailClearedPutAwayText
	jp MenuTextboxBackup

.MailClearedPutAwayText:
	text_far _MailClearedPutAwayText
	text_end

.MailPackFullText:
	text_far _MailPackFullText
	text_end

.MailMessageLostText:
	text_far _MailMessageLostText
	text_end

.GetMailType:
	push af
	ld a, BANK(sMailboxCount)
	call OpenSRAM
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
	ld hl, .MailAlreadyHoldingItemText
	call PrintText
	jr .try_again

.egg
	ld hl, .MailEggText
	call PrintText
	jr .try_again

.attach_mail
	ld a, [wMenuSelection]
	dec a
	ld b, a
	call MoveMailFromPCToParty
	ld hl, .MailMovedFromBoxText
	call PrintText

.exit2
	jp CloseSubmenu

.MailAlreadyHoldingItemText:
	text_far _MailAlreadyHoldingItemText
	text_end

.MailEggText:
	text_far _MailEggText
	text_end

.MailMovedFromBoxText:
	text_far _MailMovedFromBoxText
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
	dbw 0, wMailboxCount
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
