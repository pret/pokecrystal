_BillsPC:
	call .CheckCanUsePC
	ret c
	call .LogIn
	call .UseBillsPC
	jp .LogOut

.CheckCanUsePC:
	ld a, [wPartyCount]
	and a
	ret nz
	ld hl, .PCGottaHavePokemonText
	call MenuTextboxBackup
	scf
	ret

.PCGottaHavePokemonText:
	text_far _PCGottaHavePokemonText
	text_end

.LogIn:
	xor a
	ldh [hBGMapMode], a
	call LoadStandardMenuHeader
	call ClearPCItemScreen
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	ld hl, .PCWhatText
	call PrintText
	pop af
	ld [wOptions], a
	call LoadFontsBattleExtra
	ret

.PCWhatText:
	text_far _PCWhatText
	text_end

.LogOut:
	call CloseSubmenu
	ret

.UseBillsPC:
	ld hl, .MenuHeader
	call LoadMenuHeader
	ld a, $1
.loop
	ld [wMenuCursorBuffer], a
	call SetPalettes
	xor a
	ld [wWhichIndexSet], a
	ldh [hBGMapMode], a
	call DoNthMenu
	jr c, .cancel
	ld a, [wMenuCursorBuffer]
	push af
	ld a, [wMenuSelection]
	ld hl, .Jumptable
	rst JumpTable
	pop bc
	ld a, b
	jr nc, .loop
.cancel
	call CloseWindow
	ret

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 0 ; items
	dw .items
	dw PlaceMenuStrings
	dw .strings

.strings
	db "WITHDRAW <PK><MN>@"
	db "DEPOSIT <PK><MN>@"
	db "CHANGE BOX@"
	db "MOVE <PK><MN> W/O MAIL@"
	db "SEE YA!@"

.Jumptable:
	dw BillsPC_WithdrawMenu
	dw BillsPC_DepositMenu
	dw BillsPC_ChangeBoxMenu
	dw BillsPC_MovePKMNMenu
	dw BillsPC_SeeYa

.items
	db 5 ; # items
	db 0 ; WITHDRAW
	db 1 ; DEPOSIT
	db 2 ; CHANGE BOX
	db 3 ; MOVE PKMN
	db 4 ; SEE YA!
	db -1

BillsPC_SeeYa:
	scf
	ret

BillsPC_MovePKMNMenu:
	call LoadStandardMenuHeader
	farcall IsAnyMonHoldingMail
	jr nc, .no_mail
	ld hl, .PCMonHoldingMailText
	call PrintText
	jr .quit

.no_mail
	farcall StartMoveMonWOMail_SaveGame
	jr c, .quit
	farcall _MovePKMNWithoutMail
	call ReturnToMapFromSubmenu
	call ClearPCItemScreen

.quit
	call CloseWindow
	and a
	ret

.PCMonHoldingMailText:
	text_far _PCMonHoldingMailText
	text_end

BillsPC_DepositMenu:
	call LoadStandardMenuHeader
	farcall _DepositPKMN
	call ReturnToMapFromSubmenu
	call ClearPCItemScreen
	call CloseWindow
	and a
	ret

Unreferenced_Functione512:
	ld a, [wPartyCount]
	and a
	jr z, .no_mon
	cp 2
	jr c, .only_one_mon
	and a
	ret

.no_mon
	ld hl, .PCNoSingleMonText
	call MenuTextboxBackup
	scf
	ret

.only_one_mon
	ld hl, .PCCantDepositLastMonText
	call MenuTextboxBackup
	scf
	ret

.PCNoSingleMonText:
	text_far _PCNoSingleMonText
	text_end

.PCCantDepositLastMonText:
	text_far _PCCantDepositLastMonText
	text_end

CheckCurPartyMonFainted:
	ld hl, wPartyMon1HP
	ld de, PARTYMON_STRUCT_LENGTH
	ld b, $0
.loop
	ld a, [wCurPartyMon]
	cp b
	jr z, .skip
	ld a, [hli]
	or [hl]
	jr nz, .notfainted
	dec hl

.skip
	inc b
	ld a, [wPartyCount]
	cp b
	jr z, .done
	add hl, de
	jr .loop

.done
	scf
	ret

.notfainted
	and a
	ret

BillsPC_WithdrawMenu:
	call LoadStandardMenuHeader
	farcall _WithdrawPKMN
	call ReturnToMapFromSubmenu
	call ClearPCItemScreen
	call CloseWindow
	and a
	ret

Unreferenced_Functione56d:
	ld a, [wPartyCount]
	cp PARTY_LENGTH
	jr nc, .asm_e576
	and a
	ret

.asm_e576
	ld hl, PCCantTakeText
	call MenuTextboxBackup
	scf
	ret

PCCantTakeText:
	text_far _PCCantTakeText
	text_end

BillsPC_ChangeBoxMenu:
	farcall _ChangeBox
	and a
	ret

ClearPCItemScreen:
	call DisableSpriteUpdates
	xor a
	ldh [hBGMapMode], a
	call ClearBGPalettes
	call ClearSprites
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	ld a, " "
	call ByteFill
	hlcoord 0, 0
	lb bc, 10, 18
	call Textbox
	hlcoord 0, 12
	lb bc, 4, 18
	call Textbox
	call WaitBGMap2
	call SetPalettes ; load regular palettes?
	ret

CopyBoxmonToTempMon:
	ld a, [wCurPartyMon]
	ld hl, sBoxMon1Species
	ld bc, BOXMON_STRUCT_LENGTH
	call AddNTimes
	ld de, wTempMonSpecies
	ld bc, BOXMON_STRUCT_LENGTH
	ld a, BANK(sBoxMon1Species)
	call GetSRAMBank
	call CopyBytes
	call CloseSRAM
	ret

Unreferenced_LoadBoxMonListing:
	ld a, [wCurBox]
	cp b
	jr z, .same_box
	ld a, b
	ld hl, .BoxAddrs
	ld bc, 3
	call AddNTimes
	ld a, [hli]
	push af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	jr .okay

.same_box
	ld a, BANK(sBoxCount)
	ld hl, sBoxCount

.okay
	call GetSRAMBank
	ld a, [hl]
	ld bc, sBoxMons - sBox
	add hl, bc
	ld b, a
	ld c, $0
	ld de, wBoxPartialData
	ld a, b
	and a
	jr z, .empty_box
.loop
	push hl
	push bc
	ld a, c
	ld bc, sBoxMon1Species - sBoxMons
	add hl, bc
	ld bc, BOXMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [hl]
	ld [de], a
	inc de
	ld [wCurSpecies], a
	call GetBaseData
	pop bc
	pop hl

	push hl
	push bc
	ld a, c
	ld bc, sBoxMonNicknames - sBoxMons
	add hl, bc
	call SkipNames
	call CopyBytes
	pop bc
	pop hl

	push hl
	push bc
	ld a, c
	ld bc, MON_LEVEL
	add hl, bc
	ld bc, BOXMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [hl]
	ld [de], a
	inc de
	pop bc
	pop hl

	push hl
	push bc
	ld a, c
	ld bc, MON_DVS
	add hl, bc
	ld bc, BOXMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [hli]
	and $f0
	ld b, a
	ld a, [hl]
	and $f0
	swap a
	or b
	ld b, a
	ld a, [wBaseGender]
	cp b
	ld a, $1
	jr c, .okay2
	xor a
.okay2
	ld [de], a
	inc de
	pop bc
	pop hl

	inc c
	dec b
	jr nz, .loop
.empty_box
	call CloseSRAM
	ret

.BoxAddrs:
	dba sBox1
	dba sBox2
	dba sBox3
	dba sBox4
	dba sBox5
	dba sBox6
	dba sBox7
	dba sBox8
	dba sBox9
	dba sBox10
	dba sBox11
	dba sBox12
	dba sBox13
	dba sBox14
