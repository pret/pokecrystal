PokemonCenterPC: ; 1559a
	call PC_CheckPartyForPokemon
	ret c
	call PC_PlayBootSound
	ld hl, UnknownText_0x15a27
	call PC_DisplayText
	ld hl, UnknownText_0x15a2c
	call PC_DisplayTextWaitMenu
	ld hl, .TopMenu
	call LoadMenuDataHeader
.loop
	xor a
	ld [hBGMapMode], a
	call .ChooseWhichPCListToUse
	ld [wcf76], a
	call DoNthMenu
	jr c, .shutdown
	ld a, [MenuSelection]
	ld hl, .JumpTable
	call MenuJumptable
	jr nc, .loop

.shutdown
	call PC_PlayShutdownSound
	call ExitMenu
	call WriteBackup
	ret
; 155d6

.TopMenu: ; 0x155d6
	db $48 ; flags
	db 00, 00 ; start coords
	db 12, 15 ; end coords
	dw .MenuData2
	db 1 ; default option
; 0x155de

.MenuData2: ; 0x155de
	db $a0 ; flags
	db 0 ; items
	dw .WhichPC
	dw PlaceNthMenuStrings
	dw .JumpTable
; 0x155e6

.JumpTable: ; 155e6
	dw PlayersPC, .String_PlayersPC
	dw BillsPC, .String_BillsPC
	dw OaksPC, .String_OaksPC
	dw HallOfFamePC, .String_HallOfFame
	dw TurnOffPC, .String_TurnOff
; 155fa

.String_PlayersPC:	db "<PLAYER>'s PC@"
.String_BillsPC:	db "BILL's PC@"
.String_OaksPC:	    db "PROF.OAK's PC@"
.String_HallOfFame:	db "HALL OF FAME@"
.String_TurnOff:	db "TURN OFF@"
; 1562c

.WhichPC: ; 1562c
	; before pokedex
	db  3 ; items
	db  1, 0, 4 ; bill's, player's, turn off
	db -1

	; before Hall Of Fame
	db  4 ; items
	db  1, 0, 2, 4 ; bill's, player's, oak's, turn off
	db -1

	; postgame
	db  5 ; items
	db  1, 0, 2, 3, 4 ; bill's, player's, oak's, hall of fame, turn off
	db -1
; 1563e

.ChooseWhichPCListToUse: ; 1563e
	call CheckReceivedDex
	jr nz, .got_dex
	ld a, $0
	ret

.got_dex
	ld a, [wHallOfFameCount]
	and a
	ld a, $1
	ret z
	ld a, $2
	ret
; 15650

PC_CheckPartyForPokemon: ; 15650
	ld a, [PartyCount]
	and a
	ret nz
	ld de, SFX_CHOOSE_PC_OPTION
	call PlaySFX
	ld hl, UnknownText_0x15663
	call PC_DisplayText
	scf
	ret
; 15663

UnknownText_0x15663: ; 0x15663
	; Bzzzzt! You must have a #MON to use this!
	text_jump UnknownText_0x1c1328
	db "@"
; 0x15668

BillsPC: ; 15668
	call PC_PlayChoosePCSound
	ld hl, UnknownText_0x15a31
	call PC_DisplayText
	callba _BillsPC
	and a
	ret
; 15679 (5:5679)

PlayersPC: ; 15679
	call PC_PlayChoosePCSound
	ld hl, UnknownText_0x15a36
	call PC_DisplayText
	ld b, $0
	call _PlayersPC
	and a
	ret
; 15689

OaksPC: ; 15689
	call PC_PlayChoosePCSound
	ld hl, UnknownText_0x15a3b
	call PC_DisplayText
	callba ProfOaksPC
	and a
	ret
; 1569a

HallOfFamePC: ; 1569a
	call PC_PlayChoosePCSound
	call FadeToMenu
	callba _HallOfFamePC
	call ReturnToCallingMenu
	and a
	ret
; 156ab

TurnOffPC: ; 156ab
	ld hl, UnknownText_0x15a40
	call PrintText
	scf
	ret
; 156b3

PC_PlayBootSound: ; 156b3
	ld de, SFX_BOOT_PC
	jr PC_WaitPlaySFX

PC_PlayShutdownSound: ; 156b8
	ld de, SFX_SHUT_DOWN_PC
	call PC_WaitPlaySFX
	call WaitSFX
	ret

PC_PlayChoosePCSound: ; 156c2
	ld de, SFX_CHOOSE_PC_OPTION
	jr PC_WaitPlaySFX

Function156c7: ; 156c7
	ld de, SFX_SWITCH_POKEMON
	call PC_WaitPlaySFX
	ld de, SFX_SWITCH_POKEMON

PC_WaitPlaySFX: ; 156d0
	push de
	call WaitSFX
	pop de
	call PlaySFX
	ret
; 156d9

_KrissHousePC: ; 156d9
	call PC_PlayBootSound
	ld hl, UnknownText_0x156ff
	call PC_DisplayText
	ld b, $1
	call _PlayersPC
	and a
	jr nz, .asm_156f9
	call OverworldTextModeSwitch
	call Function321c
	call UpdateSprites
	call PC_PlayShutdownSound
	ld c, $0
	ret

.asm_156f9
	call ClearBGPalettes
	ld c, $1
	ret
; 156ff

UnknownText_0x156ff: ; 0x156ff
	; turned on the PC.
	text_jump UnknownText_0x1c1353
	db "@"
; 0x15704

_PlayersPC: ; 15704
	ld a, b
	ld [wcf76], a
	ld hl, UnknownText_0x157cc
	call PC_DisplayTextWaitMenu
	call Function15715
	call ExitMenu
	ret
; 15715

Function15715: ; 15715
	xor a
	ld [wd0d7], a
	ld [wd0dd], a
	ld hl, KrissPCMenuData
	call LoadMenuDataHeader
.asm_15722
	call UpdateTimePals
	call DoNthMenu
	jr c, .asm_15731
	call MenuJumptable
	jr nc, .asm_15722
	jr .asm_15732

.asm_15731
	xor a

.asm_15732
	call ExitMenu
	ret
; 15736

KrissPCMenuData: ; 0x15736
	db %01000000
	db  0,  0 ; top left corner coords (y, x)
	db 12, 15 ; bottom right corner coords (y, x)
	dw .KrissPCMenuData2
	db 1 ; default selected option

.KrissPCMenuData2
	db %10100000 ; bit7
	db 0 ; # items?
	dw .KrissPCMenuList1
	dw PlaceNthMenuStrings
	dw .KrissPCMenuPointers

.KrissPCMenuPointers ; 0x15746
	dw KrisWithdrawItemMenu, .WithdrawItem
	dw KrisDepositItemMenu,  .DepositItem
	dw KrisTossItemMenu,     .TossItem
	dw KrisMailBoxMenu,      .MailBox
	dw KrisDecorationMenu,   .Decoration
	dw KrisLogOffMenu,       .LogOff
	dw KrisLogOffMenu,       .TurnOff

.WithdrawItem db "WITHDRAW ITEM@"
.DepositItem  db "DEPOSIT ITEM@"
.TossItem     db "TOSS ITEM@"
.MailBox      db "MAIL BOX@"
.Decoration   db "DECORATION@"
.TurnOff      db "TURN OFF@"
.LogOff       db "LOG OFF@"

WITHDRAW_ITEM EQU 0
DEPOSIT_ITEM  EQU 1
TOSS_ITEM     EQU 2
MAIL_BOX      EQU 3
DECORATION    EQU 4
TURN_OFF      EQU 5
LOG_OFF       EQU 6

.KrissPCMenuList1
	db 5
	db WITHDRAW_ITEM
	db DEPOSIT_ITEM
	db TOSS_ITEM
	db MAIL_BOX
	db TURN_OFF
	db -1

.KrissPCMenuList2
	db 6
	db WITHDRAW_ITEM
	db DEPOSIT_ITEM
	db TOSS_ITEM
	db MAIL_BOX
	db DECORATION
	db LOG_OFF
	db -1

PC_DisplayTextWaitMenu: ; 157bb
	ld a, [Options]
	push af
	set NO_TEXT_SCROLL, a
	ld [Options], a
	call MenuTextBox
	pop af
	ld [Options], a
	ret
; 157cc

UnknownText_0x157cc: ; 0x157cc
	; What do you want to do?
	text_jump UnknownText_0x1c1368
	db "@"
; 0x157d1

KrisWithdrawItemMenu: ; 0x157d1
	call LoadStandardMenuDataHeader
	callba ClearPCItemScreen
.asm_157da
	call Function15985
	jr c, .asm_157e4
	call Function157e9
	jr .asm_157da

.asm_157e4
	call ReturnToCallingMenu
	xor a
	ret
; 0x157e9

Function157e9: ; 0x157e9
	; check if the item has a quantity
	callba _CheckTossableItem
	ld a, [wItemAttributeParamBuffer]
	and a
	jr z, .askquantity

	; items without quantity are always ×1
	ld a, 1
	ld [wItemQuantityChangeBuffer], a
	jr .withdraw

.askquantity
	ld hl, .HowManyText
	call MenuTextBox
	callba Function24fbf
	call ExitMenu
	call ExitMenu
	jr c, .done

.withdraw
	ld a, [wItemQuantityChangeBuffer]
	ld [Buffer1], a ; quantity
	ld a, [wd107]
	ld [Buffer2], a
	ld hl, NumItems
	call ReceiveItem
	jr nc, .PackFull
	ld a, [Buffer1]
	ld [wItemQuantityChangeBuffer], a
	ld a, [Buffer2]
	ld [wd107], a
	ld hl, PCItems
	call TossItem
	predef PartyMonItemName
	ld hl, .WithdrewText
	call MenuTextBox
	xor a
	ld [hBGMapMode], a
	call ExitMenu
	ret

.PackFull
	ld hl, .NoRoomText
	call MenuTextBoxBackup
	ret

.done
	ret
; 0x15850

.HowManyText ; 0x15850
	text_jump _KrissPCHowManyWithdrawText
	db "@"

.WithdrewText ; 0x15855
	text_jump _KrissPCWithdrewItemsText
	db "@"

.NoRoomText ; 0x1585a
	text_jump _KrissPCNoRoomWithdrawText
	db "@"


KrisTossItemMenu: ; 0x1585f
	call LoadStandardMenuDataHeader
	callba ClearPCItemScreen
.asm_15868
	call Function15985
	jr c, .asm_15878
	ld de, PCItems
	callba Function129f4
	jr .asm_15868

.asm_15878
	call ReturnToCallingMenu
	xor a
	ret
; 0x1587d


KrisDecorationMenu: ; 0x1587d
	callba _KrisDecorationMenu
	ld a, c
	and a
	ret z
	scf
	ret
; 0x15888


KrisLogOffMenu: ; 0x15888
	xor a
	scf
	ret
; 0x1588b


KrisDepositItemMenu: ; 0x1588b
	call Function158b8
	jr c, .asm_158b6
	call DisableSpriteUpdates
	call LoadStandardMenuDataHeader
	callba Function106a5
.asm_1589c
	callba Function106be
	ld a, [wcf66]
	and a
	jr z, .asm_158b3
	call Function158cc
	callba CheckRegisteredItem
	jr .asm_1589c

.asm_158b3
	call ReturnToCallingMenu

.asm_158b6
	xor a
	ret
; 0x158b8

Function158b8: ; 0x158b8
	callba HasNoItems
	ret nc
	ld hl, UnknownText_0x158c7
	call MenuTextBoxBackup
	scf
	ret
; 0x158c7

UnknownText_0x158c7: ; 0x158c7
	; No items here!
	text_jump UnknownText_0x1c13df
	db "@"
; 0x158cc


Function158cc: ; 0x158cc
	ld a, [wc2ce]
	push af
	ld a, $0
	ld [wc2ce], a
	callba CheckItemMenu
	ld a, [wItemAttributeParamBuffer]
	ld hl, .jumptable
	rst JumpTable
	pop af
	ld [wc2ce], a
	ret
; 0x158e7

.jumptable: ; 0x158e7
	dw .tossable
	dw .no_toss
	dw .no_toss
	dw .no_toss
	dw .tossable
	dw .tossable
	dw .tossable

.no_toss:
	ret

.tossable:
	ld a, [Buffer1]
	push af
	ld a, [Buffer2]
	push af
	call Function1590a
	pop af
	ld [Buffer2], a
	pop af
	ld [Buffer1], a
	ret
; 0x1590a

Function1590a: ; 0x1590a
	callba _CheckTossableItem
	ld a, [wItemAttributeParamBuffer]
	and a
	jr z, .asm_1591d
	ld a, $1
	ld [wItemQuantityChangeBuffer], a
	jr .asm_15933

.asm_1591d
	ld hl, .HowManyText
	call MenuTextBox
	callba Function24fbf
	push af
	call ExitMenu
	call ExitMenu
	pop af
	jr c, .asm_1596c

.asm_15933
	ld a, [wItemQuantityChangeBuffer]
	ld [Buffer1], a
	ld a, [wd107]
	ld [Buffer2], a
	ld hl, PCItems
	call ReceiveItem
	jr nc, .asm_15965
	ld a, [Buffer1]
	ld [wItemQuantityChangeBuffer], a
	ld a, [Buffer2]
	ld [wd107], a
	ld hl, NumItems
	call TossItem
	predef PartyMonItemName
	ld hl, .DepositText
	call PrintText
	ret

.asm_15965
	ld hl, .NoRoomText
	call PrintText
	ret

.asm_1596c
	and a
	ret
; 0x1596e


.HowManyText ; 0x1596e
	text_jump _KrissPCHowManyDepositText
	db "@"

.DepositText ; 0x15973
	text_jump _KrissPCDepositItemsText
	db "@"

.NoRoomText ; 0x15978
	text_jump _KrissPCNoRoomDepositText
	db "@"


KrisMailBoxMenu: ; 0x1597d
	callba _KrisMailBoxMenu
	xor a
	ret
; 0x15985


Function15985: ; 0x15985
	xor a
	ld [wd0e3], a
.asm_15989
	ld a, [wc2ce]
	push af
	ld a, $0
	ld [wc2ce], a
	ld hl, MenuData15a08
	call CopyMenuDataHeader
	hlcoord 0, 0
	ld b, $a
	ld c, $12
	call TextBox
	ld a, [wd0d7]
	ld [wMenuCursorBuffer], a
	ld a, [wd0dd]
	ld [wd0e4], a
	call HandleScrollingMenu
	ld a, [wd0e4]
	ld [wd0dd], a
	ld a, [MenuSelection2]
	ld [wd0d7], a
	pop af
	ld [wc2ce], a
	ld a, [wd0e3]
	and a
	jr nz, .asm_159d8
	ld a, [wcf73]
	cp $2
	jr z, .asm_15a06
	cp $1
	jr z, .asm_159fb
	cp $4
	jr z, .asm_159f2
	jr .asm_159f8

.asm_159d8
	ld a, [wcf73]
	cp $2
	jr z, .asm_159e9
	cp $1
	jr z, .asm_159ef
	cp $4
	jr z, .asm_159ef
	jr .asm_159f8

.asm_159e9
	xor a
	ld [wd0e3], a
	jr .asm_159f8

.asm_159ef
	call Function156c7

.asm_159f2
	callba Function2490c

.asm_159f8
	jp .asm_15989

.asm_159fb
	callba Function24706
	call Function1bee
	and a
	ret

.asm_15a06
	scf
	ret
; 0x15a08

MenuData15a08: ; 0x15a08
	db %01000000
	db  1,  4 ; start coords
	db 10, 18 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2
	db %10110000
	db 4, 8 ; rows/cols?
	db 2 ; horizontal spacing?
	dbw 0, PCItems
	dba PlaceMenuItemName
	dba PlaceMenuItemQuantity
	dba Function244c3

PC_DisplayText: ; 15a20
	call MenuTextBox
	call ExitMenu
	ret
; 15a27


UnknownText_0x15a27: ; 0x15a27
	; turned on the PC.
	text_jump UnknownText_0x1c144d
	db "@"
; 0x15a2c

UnknownText_0x15a2c: ; 0x15a2c
	; Access whose PC?
	text_jump UnknownText_0x1c1462
	db "@"
; 0x15a31

UnknownText_0x15a31: ; 0x15a31
	; BILL's PC accessed. #MON Storage System opened.
	text_jump UnknownText_0x1c1474
	db "@"
; 0x15a36

UnknownText_0x15a36: ; 0x15a36
	; Accessed own PC. Item Storage System opened.
	text_jump UnknownText_0x1c14a4
	db "@"
; 0x15a3b

UnknownText_0x15a3b: ; 0x15a3b
	; PROF.OAK's PC accessed. #DEX Rating System opened.
	text_jump UnknownText_0x1c14d2
	db "@"
; 0x15a40

UnknownText_0x15a40: ; 0x15a40
	; … Link closed…
	text_jump UnknownText_0x1c1505
	db "@"
; 0x15a45
