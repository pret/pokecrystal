GetPredefPointer:: ; 854b
; Return the bank and address of PredefID in a and PredefAddress.

; Save hl for later (back in Predef)
	ld a, h
	ld [PredefTemp], a
	ld a, l
	ld [PredefTemp + 1], a

	push de
	ld a, [PredefID]
	ld e, a
	ld d, 0
	ld hl, PredefPointers
rept 3
	add hl,de
endr
	pop de

	ld a, [hli]
	ld [PredefAddress + 1], a
	ld a, [hli]
	ld [PredefAddress], a
	ld a, [hl]

	ret
; 856b

PredefPointers:: ; 856b
; $4b Predef pointers
; address, bank

	add_predef LearnMove ; $0
	add_predef Predef1
	add_predef HealParty
	add_predef FlagPredef
	add_predef Functionc699
	add_predef FillPP
	add_predef Functiond88c
	add_predef Functionda96
	add_predef Functiondb3f ; $8
	add_predef Functionde6e
	add_predef GiveEgg
	add_predef Functionc6e0
	add_predef Functione167
	add_predef Functione17b
	add_predef CanLearnTMHMMove
	add_predef GetTMHMMove
	add_predef Function28eef ; $ 10
	add_predef PrintMoveDesc
	add_predef UpdatePlayerHUD
	add_predef FillBox
	add_predef Function3d873
	add_predef UpdateEnemyHUD
	add_predef StartBattle
	add_predef FillInExpBar
	add_predef Function3f43d ; $18
	add_predef Function3f47c
	add_predef LearnLevelMoves
	add_predef FillMoves
	add_predef Function421e6
	add_predef Function28f63
	add_predef Function28f24
	add_predef Function5084a
	add_predef ListMoves ; $20
	add_predef Function50d2e
	add_predef Function50cdb
	add_predef Function50c50
	add_predef GetGender
	add_predef StatsScreenInit
	add_predef DrawPlayerHP
	add_predef DrawEnemyHP
	add_predef PrintTempMonStats ; $28
	add_predef GetTypeName
	add_predef PrintMoveType
	add_predef PrintType
	add_predef PrintMonTypes
	add_predef GetUnownLetter
	add_predef Functioncbcdd
	add_predef Predef2F
	add_predef Function9853 ; $30
	add_predef Function864c
	add_predef Function91d11
	add_predef CheckContestMon
	add_predef Function8c20f
	add_predef Function8c000
	add_predef Function8c000_2
	add_predef PlayBattleAnim
	add_predef Predef38 ; $38
	add_predef Predef39
	add_predef Functionfd1d0
	add_predef PartyMonItemName
	add_predef GetFrontpic
	add_predef GetBackpic
	add_predef Function5108b
	add_predef GetTrainerPic
	add_predef DecompressPredef ; $40
	add_predef Function347d3
	add_predef ConvertMon_1to2
	add_predef Functionfb877
	add_predef Functiond0000
	add_predef Function50d0a
	add_predef Functiond00a3
	add_predef Functiond008e
	add_predef Functiond0669 ; $48
	add_predef Functiond066e
	dbw $ff, Function2d43 ; ????
; 864c
