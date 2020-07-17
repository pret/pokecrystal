TRADEANIM_RIGHT_ARROW EQU "▶" ; $ed
TRADEANIM_LEFT_ARROW  EQU "▼" ; $ee

; TradeAnim_TubeAnimJumptable.Jumptable indexes
	const_def
	const TRADEANIMSTATE_0 ; 0
	const TRADEANIMSTATE_1 ; 1
	const TRADEANIMSTATE_2 ; 2
	const TRADEANIMSTATE_3 ; 3
TRADEANIMJUMPTABLE_LENGTH EQU const_value

add_tradeanim: MACRO
\1_TradeCmd:
	dw \1
ENDM

tradeanim: MACRO
	db (\1_TradeCmd - DoTradeAnimation.JumpTable) / 2
ENDM

TradeAnimation:
	xor a
	ld [wcf66], a
	ld hl, wPlayerTrademonSenderName
	ld de, wOTTrademonSenderName
	call LinkTradeAnim_LoadTradePlayerNames
	ld hl, wPlayerTrademonSpecies
	ld de, wOTTrademonSpecies
	call LinkTradeAnim_LoadTradeMonSpecies
	ld de, .script
	jr RunTradeAnimScript

.script
	tradeanim TradeAnim_SetupGivemonScroll
	tradeanim TradeAnim_ShowGivemonData
	tradeanim TradeAnim_DoGivemonScroll
	tradeanim TradeAnim_Wait80
	tradeanim TradeAnim_Wait96
	tradeanim TradeAnim_Poof
	tradeanim TradeAnim_RockingBall
	tradeanim TradeAnim_EnterLinkTube1
	tradeanim TradeAnim_WaitAnim
	tradeanim TradeAnim_BulgeThroughTube
	tradeanim TradeAnim_WaitAnim
	tradeanim TradeAnim_TextboxScrollStart
	tradeanim TradeAnim_GiveTrademonSFX
	tradeanim TradeAnim_TubeToOT1
	tradeanim TradeAnim_SentToOTText
	tradeanim TradeAnim_ScrollOutRight

	tradeanim TradeAnim_OTSendsText1
	tradeanim TradeAnim_OTBidsFarewell
	tradeanim TradeAnim_Wait40
	tradeanim TradeAnim_ScrollOutRight
	tradeanim TradeAnim_GetTrademonSFX
	tradeanim TradeAnim_TubeToPlayer1
	tradeanim TradeAnim_EnterLinkTube1
	tradeanim TradeAnim_DropBall
	tradeanim TradeAnim_ExitLinkTube
	tradeanim TradeAnim_WaitAnim
	tradeanim TradeAnim_ShowGetmonData
	tradeanim TradeAnim_Poof
	tradeanim TradeAnim_WaitAnim
	tradeanim TradeAnim_FrontpicScrollStart
	tradeanim TradeAnim_AnimateFrontpic
	tradeanim TradeAnim_Wait80IfOTEgg
	tradeanim TradeAnim_TextboxScrollStart
	tradeanim TradeAnim_TakeCareOfText
	tradeanim TradeAnim_ScrollOutRight
	tradeanim TradeAnim_End

TradeAnimationPlayer2:
	xor a
	ld [wcf66], a
	ld hl, wOTTrademonSenderName
	ld de, wPlayerTrademonSenderName
	call LinkTradeAnim_LoadTradePlayerNames
	ld hl, wOTTrademonSpecies
	ld de, wPlayerTrademonSpecies
	call LinkTradeAnim_LoadTradeMonSpecies
	ld de, .script
	jr RunTradeAnimScript

.script
	tradeanim TradeAnim_OTSendsText2
	tradeanim TradeAnim_OTBidsFarewell
	tradeanim TradeAnim_Wait40
	tradeanim TradeAnim_ScrollOutRight
	tradeanim TradeAnim_GetTrademonSFX
	tradeanim TradeAnim_TubeToOT1
	tradeanim TradeAnim_EnterLinkTube1
	tradeanim TradeAnim_DropBall
	tradeanim TradeAnim_ExitLinkTube
	tradeanim TradeAnim_WaitAnim
	tradeanim TradeAnim_ShowGetmonData
	tradeanim TradeAnim_Poof
	tradeanim TradeAnim_WaitAnim
	tradeanim TradeAnim_FrontpicScrollStart
	tradeanim TradeAnim_AnimateFrontpic
	tradeanim TradeAnim_Wait180IfOTEgg
	tradeanim TradeAnim_TextboxScrollStart
	tradeanim TradeAnim_TakeCareOfText
	tradeanim TradeAnim_ScrollOutRight

	tradeanim TradeAnim_SetupGivemonScroll
	tradeanim TradeAnim_ShowGivemonData
	tradeanim TradeAnim_DoGivemonScroll
	tradeanim TradeAnim_Wait40
	tradeanim TradeAnim_Poof
	tradeanim TradeAnim_RockingBall
	tradeanim TradeAnim_EnterLinkTube1
	tradeanim TradeAnim_WaitAnim
	tradeanim TradeAnim_BulgeThroughTube
	tradeanim TradeAnim_WaitAnim
	tradeanim TradeAnim_TextboxScrollStart
	tradeanim TradeAnim_GiveTrademonSFX
	tradeanim TradeAnim_TubeToPlayer1
	tradeanim TradeAnim_SentToOTText
	tradeanim TradeAnim_ScrollOutRight
	tradeanim TradeAnim_End

RunTradeAnimScript:
	ld hl, wTradeAnimAddress
	ld [hl], e
	inc hl
	ld [hl], d
	ldh a, [hMapAnims]
	push af
	xor a
	ldh [hMapAnims], a
	ld hl, wVramState
	ld a, [hl]
	push af
	res 0, [hl]
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	call .TradeAnimLayout
	ld a, [wcf66]
	and a
	jr nz, .anim_loop
	ld de, MUSIC_EVOLUTION
	call PlayMusic2
.anim_loop
	call DoTradeAnimation
	jr nc, .anim_loop
	pop af
	ld [wOptions], a
	pop af
	ld [wVramState], a
	pop af
	ldh [hMapAnims], a
	ret

.TradeAnimLayout:
	xor a
	ld [wJumptableIndex], a
	call ClearBGPalettes
	call ClearSprites
	call ClearTilemap
	call DisableLCD
	call LoadFontsBattleExtra
	callfar ClearSpriteAnims
	ldh a, [hCGB]
	and a
	jr z, .NotCGB
	ld a, $1
	ldh [rVBK], a
	ld hl, vTiles0
	ld bc, sScratch - vTiles0
	xor a
	call ByteFill
	ld a, $0
	ldh [rVBK], a

.NotCGB:
	hlbgcoord 0, 0
	ld bc, sScratch - vBGMap0
	ld a, " "
	call ByteFill
	ld hl, TradeGameBoyLZ
	ld de, vTiles2 tile $31
	call Decompress
	ld hl, TradeArrowRightGFX
	ld de, vTiles0 tile TRADEANIM_RIGHT_ARROW
	ld bc, 1 tiles
	ld a, BANK(TradeArrowRightGFX)
	call FarCopyBytes
	ld hl, TradeArrowLeftGFX
	ld de, vTiles0 tile TRADEANIM_LEFT_ARROW
	ld bc, 1 tiles
	ld a, BANK(TradeArrowLeftGFX)
	call FarCopyBytes
	xor a
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, $7
	ldh [hWX], a
	ld a, $90
	ldh [hWY], a
	farcall GetTrademonFrontpic
	call EnableLCD
	call LoadTradeBallAndCableGFX
	ld a, [wPlayerTrademonSpecies]
	ld hl, wPlayerTrademonDVs
	ld de, vTiles0
	call TradeAnim_GetFrontpic
	ld a, [wOTTrademonSpecies]
	ld hl, wOTTrademonDVs
	ld de, vTiles0 tile $31
	call TradeAnim_GetFrontpic
	ld a, [wPlayerTrademonSpecies]
	ld de, wPlayerTrademonSpeciesName
	call TradeAnim_GetNickname
	ld a, [wOTTrademonSpecies]
	ld de, wOTTrademonSpeciesName
	call TradeAnim_GetNickname
	call TradeAnim_NormalPals
	ret

DoTradeAnimation:
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .finished
	call .DoTradeAnimCommand
	callfar PlaySpriteAnimations
	ld hl, wcf65
	inc [hl]
	call DelayFrame
	and a
	ret

.finished
	call LoadStandardFont
	scf
	ret

.DoTradeAnimCommand:
	jumptable .JumpTable, wJumptableIndex

.JumpTable:
	add_tradeanim TradeAnim_AdvanceScriptPointer ; 00
	add_tradeanim TradeAnim_ShowGivemonData      ; 01
	add_tradeanim TradeAnim_ShowGetmonData       ; 02
	add_tradeanim TradeAnim_EnterLinkTube1       ; 03
	add_tradeanim TradeAnim_EnterLinkTube2       ; 04
	add_tradeanim TradeAnim_ExitLinkTube         ; 05
	add_tradeanim TradeAnim_TubeToOT1            ; 06
	add_tradeanim TradeAnim_TubeToOT2            ; 07
	add_tradeanim TradeAnim_TubeToOT3            ; 08
	add_tradeanim TradeAnim_TubeToOT4            ; 09
	add_tradeanim TradeAnim_TubeToOT5            ; 0a
	add_tradeanim TradeAnim_TubeToOT6            ; 0b
	add_tradeanim TradeAnim_TubeToOT7            ; 0c
	add_tradeanim TradeAnim_TubeToOT8            ; 0d
	add_tradeanim TradeAnim_TubeToPlayer1        ; 0e
	add_tradeanim TradeAnim_TubeToPlayer2        ; 0f
	add_tradeanim TradeAnim_TubeToPlayer3        ; 10
	add_tradeanim TradeAnim_TubeToPlayer4        ; 11
	add_tradeanim TradeAnim_TubeToPlayer5        ; 12
	add_tradeanim TradeAnim_TubeToPlayer6        ; 13
	add_tradeanim TradeAnim_TubeToPlayer7        ; 14
	add_tradeanim TradeAnim_TubeToPlayer8        ; 15
	add_tradeanim TradeAnim_SentToOTText         ; 16
	add_tradeanim TradeAnim_OTBidsFarewell       ; 17
	add_tradeanim TradeAnim_TakeCareOfText       ; 18
	add_tradeanim TradeAnim_OTSendsText1         ; 19
	add_tradeanim TradeAnim_OTSendsText2         ; 1a
	add_tradeanim TradeAnim_SetupGivemonScroll   ; 1b
	add_tradeanim TradeAnim_DoGivemonScroll      ; 1c
	add_tradeanim TradeAnim_FrontpicScrollStart  ; 1d
	add_tradeanim TradeAnim_TextboxScrollStart   ; 1e
	add_tradeanim TradeAnim_ScrollOutRight       ; 1f
	add_tradeanim TradeAnim_ScrollOutRight2      ; 20
	add_tradeanim TradeAnim_Wait80              ; 21
	add_tradeanim TradeAnim_Wait40              ; 22
	add_tradeanim TradeAnim_RockingBall          ; 23
	add_tradeanim TradeAnim_DropBall             ; 24
	add_tradeanim TradeAnim_WaitAnim             ; 25
	add_tradeanim TradeAnim_WaitAnim2            ; 26
	add_tradeanim TradeAnim_Poof                 ; 27
	add_tradeanim TradeAnim_BulgeThroughTube     ; 28
	add_tradeanim TradeAnim_GiveTrademonSFX      ; 29
	add_tradeanim TradeAnim_GetTrademonSFX       ; 2a
	add_tradeanim TradeAnim_End                  ; 2b
	add_tradeanim TradeAnim_AnimateFrontpic      ; 2c
	add_tradeanim TradeAnim_Wait96              ; 2d
	add_tradeanim TradeAnim_Wait80IfOTEgg       ; 2e
	add_tradeanim TradeAnim_Wait180IfOTEgg      ; 2f

TradeAnim_IncrementJumptableIndex:
	ld hl, wJumptableIndex
	inc [hl]
	ret

TradeAnim_AdvanceScriptPointer:
	ld hl, wTradeAnimAddress
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	ld [wJumptableIndex], a
	inc de
	ld [hl], d
	dec hl
	ld [hl], e
	ret

TradeAnim_End:
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

TradeAnim_TubeToOT1:
	ld a, TRADEANIM_RIGHT_ARROW
	call TradeAnim_PlaceTrademonStatsOnTubeAnim
	ld a, [wLinkTradeSendmonSpecies]
	ld [wTempIconSpecies], a
	xor a
	depixel 5, 11, 4, 0
	ld b, $0
	jr TradeAnim_InitTubeAnim

TradeAnim_TubeToPlayer1:
	ld a, TRADEANIM_LEFT_ARROW
	call TradeAnim_PlaceTrademonStatsOnTubeAnim
	ld a, [wLinkTradeGetmonSpecies]
	ld [wTempIconSpecies], a
	ld a, TRADEANIMSTATE_2
	depixel 9, 18, 4, 4
	ld b, $4
TradeAnim_InitTubeAnim:
	push bc
	push de
	push bc
	push de

	push af
	call DisableLCD
	callfar ClearSpriteAnims
	hlbgcoord 20, 3
	ld bc, 12
	ld a, $60
	call ByteFill
	pop af

	call TradeAnim_TubeAnimJumptable

	xor a
	ldh [hSCX], a
	ld a, $7
	ldh [hWX], a
	ld a, $70
	ldh [hWY], a
	call EnableLCD
	call LoadTradeBubbleGFX

	pop de
	ld a, SPRITE_ANIM_INDEX_TRADEMON_ICON
	call InitSpriteAnimStruct

	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	pop bc
	ld [hl], b

	pop de
	ld a, SPRITE_ANIM_INDEX_TRADEMON_BUBBLE
	call InitSpriteAnimStruct

	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	pop bc
	ld [hl], b

	call WaitBGMap
	ld b, SCGB_TRADE_TUBE
	call GetSGBLayout
	ld a, %11100100 ; 3,2,1,0
	call DmgToCgbBGPals
	ld a, %11010000
	call DmgToCgbObjPal0

	call TradeAnim_IncrementJumptableIndex
	ld a, 92
	ld [wFrameCounter], a
	ret

TradeAnim_TubeToOT2:
	call TradeAnim_FlashBGPals
	ldh a, [hSCX]
	add $2
	ldh [hSCX], a
	cp $50
	ret nz
	ld a, TRADEANIMSTATE_1
	call TradeAnim_TubeAnimJumptable
	call TradeAnim_IncrementJumptableIndex
	ret

TradeAnim_TubeToOT3:
	call TradeAnim_FlashBGPals
	ldh a, [hSCX]
	add $2
	ldh [hSCX], a
	cp $a0
	ret nz
	ld a, TRADEANIMSTATE_2
	call TradeAnim_TubeAnimJumptable
	call TradeAnim_IncrementJumptableIndex
	ret

TradeAnim_TubeToOT4:
	call TradeAnim_FlashBGPals
	ldh a, [hSCX]
	add $2
	ldh [hSCX], a
	and a
	ret nz
	call TradeAnim_IncrementJumptableIndex
	ret

TradeAnim_TubeToPlayer3:
	call TradeAnim_FlashBGPals
	ldh a, [hSCX]
	sub $2
	ldh [hSCX], a
	cp $b0
	ret nz
	ld a, TRADEANIMSTATE_1
	call TradeAnim_TubeAnimJumptable
	call TradeAnim_IncrementJumptableIndex
	ret

TradeAnim_TubeToPlayer4:
	call TradeAnim_FlashBGPals
	ldh a, [hSCX]
	sub $2
	ldh [hSCX], a
	cp $60
	ret nz
	xor a ; TRADEANIMSTATE_0
	call TradeAnim_TubeAnimJumptable
	call TradeAnim_IncrementJumptableIndex
	ret

TradeAnim_TubeToPlayer5:
	call TradeAnim_FlashBGPals
	ldh a, [hSCX]
	sub $2
	ldh [hSCX], a
	and a
	ret nz
	call TradeAnim_IncrementJumptableIndex
	ret

TradeAnim_TubeToOT6:
TradeAnim_TubeToPlayer6:
	ld a, 128
	ld [wFrameCounter], a
	call TradeAnim_IncrementJumptableIndex
	ret

TradeAnim_TubeToOT8:
TradeAnim_TubeToPlayer8:
	call ClearBGPalettes
	call ClearTilemap
	call ClearSprites
	call DisableLCD
	callfar ClearSpriteAnims
	hlbgcoord 0, 0
	ld bc, sScratch - vBGMap0
	ld a, " "
	call ByteFill
	xor a
	ldh [hSCX], a
	ld a, $90
	ldh [hWY], a
	call EnableLCD
	call LoadTradeBallAndCableGFX
	call WaitBGMap
	call TradeAnim_NormalPals
	call TradeAnim_AdvanceScriptPointer
	ret

TradeAnim_TubeToOT5:
TradeAnim_TubeToOT7:
TradeAnim_TubeToPlayer2:
TradeAnim_TubeToPlayer7:
	call TradeAnim_FlashBGPals
	ld hl, wFrameCounter
	ld a, [hl]
	and a
	jr z, .done
	dec [hl]
	ret

.done
	call TradeAnim_IncrementJumptableIndex
	ret

TradeAnim_GiveTrademonSFX:
	call TradeAnim_AdvanceScriptPointer
	ld de, SFX_GIVE_TRADEMON
	call PlaySFX
	ret

TradeAnim_GetTrademonSFX:
	call TradeAnim_AdvanceScriptPointer
	ld de, SFX_GET_TRADEMON
	call PlaySFX
	ret

TradeAnim_TubeAnimJumptable:
	maskbits TRADEANIMJUMPTABLE_LENGTH
	ld e, a
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
; entries correspond to TRADEANIMSTATE_* constants
	dw .Zero
	dw .One
	dw .Two
	dw .Three

.Zero:
.Three:
	call TradeAnim_BlankTilemap
	hlcoord 9, 3
	ld [hl], $5b
	inc hl
	ld bc, 10
	ld a, $60
	call ByteFill
	hlcoord 3, 2
	call TradeAnim_CopyTradeGameBoyTilemap
	ret

.One:
	call TradeAnim_BlankTilemap
	hlcoord 0, 3
	ld bc, SCREEN_WIDTH
	ld a, $60
	call ByteFill
	ret

.Two:
	call TradeAnim_BlankTilemap
	hlcoord 0, 3
	ld bc, $11
	ld a, $60
	call ByteFill
	hlcoord 17, 3
	ld a, $5d
	ld [hl], a

	ld a, $61
	ld de, SCREEN_WIDTH
	ld c, $3
.loop
	add hl, de
	ld [hl], a
	dec c
	jr nz, .loop

	add hl, de
	ld a, $5f
	ld [hld], a
	ld a, $5b
	ld [hl], a
	hlcoord 10, 6
	call TradeAnim_CopyTradeGameBoyTilemap
	ret

TradeAnim_CopyTradeGameBoyTilemap:
	ld de, TradeGameBoyTilemap
	lb bc, 8, 6
	call TradeAnim_CopyBoxFromDEtoHL
	ret

TradeAnim_PlaceTrademonStatsOnTubeAnim:
	push af
	call ClearBGPalettes
	call WaitTop
	ld a, HIGH(vBGMap1)
	ldh [hBGMapAddress + 1], a
	call ClearTilemap
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH
	ld a, "─"
	call ByteFill
	hlcoord 0, 1
	ld de, wLinkPlayer1Name
	call PlaceString
	ld hl, wLinkPlayer2Name
	ld de, 0
.find_name_end_loop
	ld a, [hli]
	cp "@"
	jr z, .done
	dec de
	jr .find_name_end_loop

.done
	hlcoord 0, 4
	add hl, de
	ld de, wLinkPlayer2Name
	call PlaceString
	hlcoord 7, 2
	ld bc, 6
	pop af
	call ByteFill
	call WaitBGMap
	call WaitTop
	ld a, HIGH(vBGMap0)
	ldh [hBGMapAddress + 1], a
	call ClearTilemap
	ret

TradeAnim_EnterLinkTube1:
	call ClearTilemap
	call WaitTop
	ld a, $a0
	ldh [hSCX], a
	call DelayFrame
	hlcoord 8, 2
	ld de, TradeLinkTubeTilemap
	lb bc, 3, 12
	call TradeAnim_CopyBoxFromDEtoHL
	call WaitBGMap
	ld b, SCGB_TRADE_TUBE
	call GetSGBLayout
	ld a, %11100100 ; 3,2,1,0
	call DmgToCgbBGPals
	lb de, %11100100, %11100100 ; 3,2,1,0, 3,2,1,0
	call DmgToCgbObjPals
	ld de, SFX_POTION
	call PlaySFX
	call TradeAnim_IncrementJumptableIndex
	ret

TradeAnim_EnterLinkTube2:
	ldh a, [hSCX]
	and a
	jr z, .done
	add $4
	ldh [hSCX], a
	ret

.done
	ld c, 80
	call DelayFrames
	call TradeAnim_AdvanceScriptPointer
	ret

TradeAnim_ExitLinkTube:
	ldh a, [hSCX]
	cp $a0
	jr z, .done
	sub $4
	ldh [hSCX], a
	ret

.done
	call ClearTilemap
	xor a
	ldh [hSCX], a
	call TradeAnim_AdvanceScriptPointer
	ret

TradeAnim_SetupGivemonScroll:
	ld a, $8f
	ldh [hWX], a
	ld a, $88
	ldh [hSCX], a
	ld a, $50
	ldh [hWY], a
	call TradeAnim_AdvanceScriptPointer
	ret

TradeAnim_DoGivemonScroll:
	ldh a, [hWX]
	cp $7
	jr z, .done
	sub $4
	ldh [hWX], a
	ldh a, [hSCX]
	sub $4
	ldh [hSCX], a
	ret

.done
	ld a, $7
	ldh [hWX], a
	xor a
	ldh [hSCX], a
	call TradeAnim_AdvanceScriptPointer
	ret

TradeAnim_FrontpicScrollStart:
	ld a, $7
	ldh [hWX], a
	ld a, $50
	ldh [hWY], a
	call TradeAnim_AdvanceScriptPointer
	ret

TradeAnim_TextboxScrollStart:
	ld a, $7
	ldh [hWX], a
	ld a, $90
	ldh [hWY], a
	call TradeAnim_AdvanceScriptPointer
	ret

TradeAnim_ScrollOutRight:
	call WaitTop
	ld a, HIGH(vBGMap1)
	ldh [hBGMapAddress + 1], a
	call WaitBGMap
	ld a, $7
	ldh [hWX], a
	xor a
	ldh [hWY], a
	call DelayFrame
	call WaitTop
	ld a, HIGH(vBGMap0)
	ldh [hBGMapAddress + 1], a
	call ClearTilemap
	call TradeAnim_IncrementJumptableIndex
	ret

TradeAnim_ScrollOutRight2:
	ldh a, [hWX]
	cp $a1
	jr nc, .done
	add $4
	ldh [hWX], a
	ret

.done
	ld a, HIGH(vBGMap1)
	ldh [hBGMapAddress + 1], a
	call WaitBGMap
	ld a, $7
	ldh [hWX], a
	ld a, $90
	ldh [hWY], a
	ld a, HIGH(vBGMap0)
	ldh [hBGMapAddress + 1], a
	call TradeAnim_AdvanceScriptPointer
	ret

TradeAnim_ShowGivemonData:
	call ShowPlayerTrademonStats
	ld a, [wPlayerTrademonSpecies]
	ld [wCurPartySpecies], a
	ld a, [wPlayerTrademonDVs]
	ld [wTempMonDVs], a
	ld a, [wPlayerTrademonDVs + 1]
	ld [wTempMonDVs + 1], a
	ld b, SCGB_PLAYER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	ld a, %11100100 ; 3,2,1,0
	call DmgToCgbBGPals
	call TradeAnim_ShowGivemonFrontpic

	ld a, [wPlayerTrademonSpecies]
	call GetCryIndex
	jr c, .skip_cry
	ld e, c
	ld d, b
	call PlayCry
.skip_cry

	call TradeAnim_AdvanceScriptPointer
	ret

TradeAnim_ShowGetmonData:
	call ShowOTTrademonStats
	ld a, [wOTTrademonSpecies]
	ld [wCurPartySpecies], a
	ld a, [wOTTrademonDVs]
	ld [wTempMonDVs], a
	ld a, [wOTTrademonDVs + 1]
	ld [wTempMonDVs + 1], a
	ld b, SCGB_PLAYER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	ld a, %11100100 ; 3,2,1,0
	call DmgToCgbBGPals
	call TradeAnim_ShowGetmonFrontpic
	call TradeAnim_AdvanceScriptPointer
	ret

TradeAnim_AnimateFrontpic:
	farcall AnimateTrademonFrontpic
	call TradeAnim_AdvanceScriptPointer
	ret

TradeAnim_GetFrontpic:
	push de
	push af
	predef GetUnownLetter
	pop af
	ld [wCurPartySpecies], a
	ld [wCurSpecies], a
	call GetBaseData
	pop de
	predef GetMonFrontpic
	ret

TradeAnim_GetNickname:
	push de
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld hl, wStringBuffer1
	pop de
	ld bc, NAME_LENGTH
	call CopyBytes
	ret

TradeAnim_ShowGivemonFrontpic:
	ld de, vTiles0
	jr TradeAnim_ShowFrontpic

TradeAnim_ShowGetmonFrontpic:
	ld de, vTiles0 tile $31
TradeAnim_ShowFrontpic:
	call DelayFrame
	ld hl, vTiles2
	lb bc, 10, $31
	call Request2bpp
	call WaitTop
	call TradeAnim_BlankTilemap
	hlcoord 7, 2
	xor a
	ldh [hGraphicStartTile], a
	lb bc, 7, 7
	predef PlaceGraphic
	call WaitBGMap
	ret

TradeAnim_Wait80:
	ld c, 80
	call DelayFrames
	call TradeAnim_AdvanceScriptPointer
	ret

TradeAnim_Wait40:
	ld c, 40
	call DelayFrames
	call TradeAnim_AdvanceScriptPointer
	ret

TradeAnim_Wait96:
	ld c, 96
	call DelayFrames
	call TradeAnim_AdvanceScriptPointer
	ret

TradeAnim_Wait80IfOTEgg:
	call IsOTTrademonEgg
	ret nz
	ld c, 80
	call DelayFrames
	ret

TradeAnim_Wait180IfOTEgg:
	call IsOTTrademonEgg
	ret nz
	ld c, 180
	call DelayFrames
	ret

IsOTTrademonEgg:
	call TradeAnim_AdvanceScriptPointer
	ld a, [wOTTrademonSpecies]
	cp EGG
	ret

ShowPlayerTrademonStats:
	ld de, wPlayerTrademonSpecies
	ld a, [de]
	cp EGG
	jr z, TrademonStats_Egg
	call TrademonStats_MonTemplate
	ld de, wPlayerTrademonSpecies
	call TrademonStats_PrintSpeciesNumber
	ld de, wPlayerTrademonSpeciesName
	call TrademonStats_PrintSpeciesName
	ld a, [wPlayerTrademonCaughtData]
	ld de, wPlayerTrademonOTName
	call TrademonStats_PrintOTName
	ld de, wPlayerTrademonID
	call TrademonStats_PrintTrademonID
	call TrademonStats_WaitBGMap
	ret

ShowOTTrademonStats:
	ld de, wOTTrademonSpecies
	ld a, [de]
	cp EGG
	jr z, TrademonStats_Egg
	call TrademonStats_MonTemplate
	ld de, wOTTrademonSpecies
	call TrademonStats_PrintSpeciesNumber
	ld de, wOTTrademonSpeciesName
	call TrademonStats_PrintSpeciesName
	ld a, [wOTTrademonCaughtData]
	ld de, wOTTrademonOTName
	call TrademonStats_PrintOTName
	ld de, wOTTrademonID
	call TrademonStats_PrintTrademonID
	call TrademonStats_WaitBGMap
	ret

TrademonStats_MonTemplate:
	call WaitTop
	call TradeAnim_BlankTilemap
	ld a, HIGH(vBGMap1)
	ldh [hBGMapAddress + 1], a
	hlcoord 3, 0
	ld b, $6
	ld c, $d
	call Textbox
	hlcoord 4, 0
	ld de, .OTMonData
	call PlaceString
	ret

.OTMonData:
	db   "─── №."
	next ""
	next "OT/"
	next "<ID>№.@"

TrademonStats_Egg:
	call WaitTop
	call TradeAnim_BlankTilemap
	ld a, HIGH(vBGMap1)
	ldh [hBGMapAddress + 1], a
	hlcoord 3, 0
	ld b, 6
	ld c, 13
	call Textbox
	hlcoord 4, 2
	ld de, .EggData
	call PlaceString
	call TrademonStats_WaitBGMap
	ret

.EggData:
	db   "EGG"
	next "OT/?????"
	next "<ID>№.?????@"

TrademonStats_WaitBGMap:
	call WaitBGMap
	call WaitTop
	ld a, HIGH(vBGMap0)
	ldh [hBGMapAddress + 1], a
	ret

TrademonStats_PrintSpeciesNumber:
	hlcoord 10, 0
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	ld [hl], " "
	ret

TrademonStats_PrintSpeciesName:
	hlcoord 4, 2
	call PlaceString
	ret

TrademonStats_PrintOTName:
	cp 3
	jr c, .caught_gender_okay
	xor a
.caught_gender_okay
	push af
	hlcoord 7, 4
	call PlaceString
	inc bc
	pop af
	ld hl, .Gender
	ld d, 0
	ld e, a
	add hl, de
	ld a, [hl]
	ld [bc], a
	ret

.Gender:
	db " ", "♂", "♀"

TrademonStats_PrintTrademonID:
	hlcoord 7, 6
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	ret

TradeAnim_RockingBall:
	depixel 10, 11, 4, 0
	ld a, SPRITE_ANIM_INDEX_TRADE_POKE_BALL
	call InitSpriteAnimStruct
	call TradeAnim_AdvanceScriptPointer
	ld a, 32
	ld [wFrameCounter], a
	ret

TradeAnim_DropBall:
	depixel 10, 11, 4, 0
	ld a, SPRITE_ANIM_INDEX_TRADE_POKE_BALL
	call InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld [hl], $1
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], $dc
	call TradeAnim_AdvanceScriptPointer
	ld a, 56
	ld [wFrameCounter], a
	ret

TradeAnim_Poof:
	depixel 10, 11, 4, 0
	ld a, SPRITE_ANIM_INDEX_TRADE_POOF
	call InitSpriteAnimStruct
	call TradeAnim_AdvanceScriptPointer
	ld a, 16
	ld [wFrameCounter], a
	ld de, SFX_BALL_POOF
	call PlaySFX
	ret

TradeAnim_BulgeThroughTube:
	ld a, %11100100 ; 3,2,1,0
	call DmgToCgbObjPal0
	depixel 5, 11
	ld a, SPRITE_ANIM_INDEX_TRADE_TUBE_BULGE
	call InitSpriteAnimStruct
	call TradeAnim_AdvanceScriptPointer
	ld a, 64
	ld [wFrameCounter], a
	ret

TradeAnim_AnimateTrademonInTube:
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
	dw .InitTimer
	dw .WaitTimer1
	dw .MoveRight
	dw .MoveDown
	dw .MoveUp
	dw .MoveLeft
	dw .WaitTimer2

.JumptableNext:
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	ret

.InitTimer:
	call .JumptableNext
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $80
	ret

.WaitTimer1:
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	dec [hl]
	and a
	ret nz
	call .JumptableNext

.MoveRight:
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $94
	jr nc, .done_move_right
	inc [hl]
	ret

.done_move_right
	call .JumptableNext

.MoveDown:
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	cp $4c
	jr nc, .done_move_down
	inc [hl]
	ret

.done_move_down
	ld hl, SPRITEANIMSTRUCT_INDEX
	add hl, bc
	ld [hl], $0
	ret

.MoveUp:
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	cp $2c
	jr z, .done_move_up
	dec [hl]
	ret

.done_move_up
	call .JumptableNext

.MoveLeft:
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $58
	jr z, .done_move_left
	dec [hl]
	ret

.done_move_left
	call .JumptableNext
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $80
	ret

.WaitTimer2:
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	dec [hl]
	and a
	ret nz
	ld hl, SPRITEANIMSTRUCT_INDEX
	add hl, bc
	ld [hl], $0
	ret

TradeAnim_SentToOTText:
	ld a, [wLinkMode]
	cp LINK_TIMECAPSULE
	jr z, .time_capsule
	ld hl, .MonNameSentToText
	call PrintText
	ld c, 189
	call DelayFrames
	ld hl, .MonWasSentToText
	call PrintText
	call TradeAnim_Wait80Frames
	ld c, 128
	call DelayFrames
	call TradeAnim_AdvanceScriptPointer
	ret

.time_capsule
	ld hl, .MonWasSentToText
	call PrintText
	call TradeAnim_Wait80Frames
	call TradeAnim_AdvanceScriptPointer
	ret

.MonWasSentToText:
	text_far _MonWasSentToText
	text_end

.MonNameSentToText:
	text_far _MonNameSentToText
	text_end

TradeAnim_OTBidsFarewell:
	ld hl, .BidsFarewellToMonText
	call PrintText
	call TradeAnim_Wait80Frames
	ld hl, .MonNameBidsFarewellText
	call PrintText
	call TradeAnim_Wait80Frames
	call TradeAnim_AdvanceScriptPointer
	ret

.BidsFarewellToMonText:
	text_far _BidsFarewellToMonText
	text_end

.MonNameBidsFarewellText:
	text_far _MonNameBidsFarewellText
	text_end

TradeAnim_TakeCareOfText:
	call WaitTop
	hlcoord 0, 10
	ld bc, 8 * SCREEN_WIDTH
	ld a, " "
	call ByteFill
	call WaitBGMap
	ld hl, .TakeGoodCareOfMonText
	call PrintText
	call TradeAnim_Wait80Frames
	call TradeAnim_AdvanceScriptPointer
	ret

.TakeGoodCareOfMonText:
	text_far _TakeGoodCareOfMonText
	text_end

TradeAnim_OTSendsText1:
	ld hl, .ForYourMonSendsText
	call PrintText
	call TradeAnim_Wait80Frames
	ld hl, .OTSendsText
	call PrintText
	call TradeAnim_Wait80Frames
	ld c, 14
	call DelayFrames
	call TradeAnim_AdvanceScriptPointer
	ret

.ForYourMonSendsText:
	text_far _ForYourMonSendsText
	text_end

.OTSendsText:
	text_far _OTSendsText
	text_end

TradeAnim_OTSendsText2:
	ld hl, .WillTradeText
	call PrintText
	call TradeAnim_Wait80Frames
	ld hl, .ForYourMonWillTradeText
	call PrintText
	call TradeAnim_Wait80Frames
	ld c, 14
	call DelayFrames
	call TradeAnim_AdvanceScriptPointer
	ret

.WillTradeText:
	text_far _WillTradeText
	text_end

.ForYourMonWillTradeText:
	text_far _ForYourMonWillTradeText
	text_end

TradeAnim_Wait80Frames:
	ld c, 80
	call DelayFrames
	ret

TradeAnim_BlankTilemap:
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, " "
	call ByteFill
	ret

TradeAnim_CopyBoxFromDEtoHL:
.row
	push bc
	push hl
.col
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row
	ret

TradeAnim_NormalPals:
	ldh a, [hSGB]
	and a
	ld a, %11100100 ; 3,2,1,0
	jr z, .not_sgb
	ld a, $f0

.not_sgb
	call DmgToCgbObjPal0
	ld a, %11100100 ; 3,2,1,0
	call DmgToCgbBGPals
	ret

LinkTradeAnim_LoadTradePlayerNames:
	push de
	ld de, wLinkPlayer1Name
	ld bc, NAME_LENGTH
	call CopyBytes
	pop hl
	ld de, wLinkPlayer2Name
	ld bc, NAME_LENGTH
	call CopyBytes
	ret

LinkTradeAnim_LoadTradeMonSpecies:
	ld a, [hl]
	ld [wLinkTradeSendmonSpecies], a
	ld a, [de]
	ld [wLinkTradeGetmonSpecies], a
	ret

TradeAnim_FlashBGPals:
	ld a, [wcf65]
	and $7
	ret nz
	ldh a, [rBGP]
	xor %00111100
	call DmgToCgbBGPals
	ret

LoadTradeBallAndCableGFX:
	call DelayFrame
	ld de, TradeBallGFX
	ld hl, vTiles0 tile $62
	lb bc, BANK(TradeBallGFX), 6
	call Request2bpp
	ld de, TradePoofGFX
	ld hl, vTiles0 tile $68
	lb bc, BANK(TradePoofGFX), 12
	call Request2bpp
	ld de, TradeCableGFX
	ld hl, vTiles0 tile $74
	lb bc, BANK(TradeCableGFX), 4
	call Request2bpp
	xor a
	ld hl, wSpriteAnimDict
	ld [hli], a
	ld [hl], $62
	ret

LoadTradeBubbleGFX:
	call DelayFrame
	ld e, MONICON_TRADE
	callfar LoadMenuMonIcon
	ld de, TradeBubbleGFX
	ld hl, vTiles0 tile $72
	lb bc, BANK(TradeBubbleGFX), 4
	call Request2bpp
	xor a
	ld hl, wSpriteAnimDict
	ld [hli], a
	ld [hl], $62
	ret

TradeAnim_WaitAnim:
	ld hl, wFrameCounter
	ld a, [hl]
	and a
	jr z, .done
	dec [hl]
	ret

.done
	call TradeAnim_AdvanceScriptPointer
	ret

TradeAnim_WaitAnim2:
	ld hl, wFrameCounter
	ld a, [hl]
	and a
	jr z, .done
	dec [hl]
	ret

.done
	call TradeAnim_AdvanceScriptPointer
	ret

DebugTrade: ; unreferenced
; This function was meant for use in Japanese versions, so the
; constant used for copy length was changed by accident.

	ld hl, .DebugTradeData

	ld a, [hli]
	ld [wPlayerTrademonSpecies], a
	ld de, wPlayerTrademonSenderName
	ld c, NAME_LENGTH + 2 ; JP: NAME_LENGTH_JAPANESE + 2
.loop1
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop1

	ld a, [hli]
	ld [wOTTrademonSpecies], a
	ld de, wOTTrademonSenderName
	ld c, NAME_LENGTH + 2 ; JP: NAME_LENGTH_JAPANESE + 2
.loop2
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop2
	ret

debugtrade: MACRO
; species, ot name, ot id
	db \1, \2
	dw \3
ENDM

.DebugTradeData:
	debugtrade VENUSAUR,  "ゲーフり@@", $0123 ; GAME FREAK
	debugtrade CHARIZARD, "クりーチャ@", $0456 ; Creatures Inc.

TradeGameBoyTilemap:  INCBIN "gfx/trade/game_boy.tilemap" ; 6x8
TradeLinkTubeTilemap: INCBIN "gfx/trade/link_cable.tilemap" ; 12x3

TradeArrowRightGFX:   INCBIN "gfx/trade/arrow_right.2bpp"
TradeArrowLeftGFX:    INCBIN "gfx/trade/arrow_left.2bpp"
TradeCableGFX:        INCBIN "gfx/trade/cable.2bpp"
TradeBubbleGFX:       INCBIN "gfx/trade/bubble.2bpp"
TradeGameBoyLZ:       INCBIN "gfx/trade/game_boy_cable.2bpp.lz"
TradeBallGFX:         INCBIN "gfx/trade/ball.2bpp"
TradePoofGFX:         INCBIN "gfx/trade/poof.2bpp"
