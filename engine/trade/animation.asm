TradeAnimation: ; 28f24
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
	tradeanim_setup_givemon_scroll
	tradeanim_show_givemon_data
	tradeanim_do_givemon_scroll
	tradeanim_wait_80
	tradeanim_wait_96
	tradeanim_poof
	tradeanim_rocking_ball
	tradeanim_enter_link_tube
	tradeanim_wait_anim
	tradeanim_bulge_through_tube
	tradeanim_wait_anim
	tradeanim_textbox_scroll
	tradeanim_give_trademon_sfx
	tradeanim_tube_to_ot
	tradeanim_sent_to_ot_text
	tradeanim_scroll_out_right

	tradeanim_ot_sends_text_1
	tradeanim_ot_bids_farewell
	tradeanim_wait_40
	tradeanim_scroll_out_right
	tradeanim_get_trademon_sfx
	tradeanim_tube_to_player
	tradeanim_enter_link_tube
	tradeanim_drop_ball
	tradeanim_exit_link_tube
	tradeanim_wait_anim
	tradeanim_show_getmon_data
	tradeanim_poof
	tradeanim_wait_anim
	tradeanim_frontpic_scroll
	tradeanim_animate_frontpic
	tradeanim_wait_80_if_ot_egg
	tradeanim_textbox_scroll
	tradeanim_take_care_of_text
	tradeanim_scroll_out_right
	tradeanim_end

TradeAnimationPlayer2: ; 28f63
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
	tradeanim_ot_sends_text_2
	tradeanim_ot_bids_farewell
	tradeanim_wait_40
	tradeanim_scroll_out_right
	tradeanim_get_trademon_sfx
	tradeanim_tube_to_ot
	tradeanim_enter_link_tube
	tradeanim_drop_ball
	tradeanim_exit_link_tube
	tradeanim_wait_anim
	tradeanim_show_getmon_data
	tradeanim_poof
	tradeanim_wait_anim
	tradeanim_frontpic_scroll
	tradeanim_animate_frontpic
	tradeanim_wait_180_if_ot_egg
	tradeanim_textbox_scroll
	tradeanim_take_care_of_text
	tradeanim_scroll_out_right

	tradeanim_setup_givemon_scroll
	tradeanim_show_givemon_data
	tradeanim_do_givemon_scroll
	tradeanim_wait_40
	tradeanim_poof
	tradeanim_rocking_ball
	tradeanim_enter_link_tube
	tradeanim_wait_anim
	tradeanim_bulge_through_tube
	tradeanim_wait_anim
	tradeanim_textbox_scroll
	tradeanim_give_trademon_sfx
	tradeanim_tube_to_player
	tradeanim_sent_to_ot_text
	tradeanim_scroll_out_right
	tradeanim_end

RunTradeAnimScript: ; 28fa1
	ld hl, wTradeAnimPointer
	ld [hl], e
	inc hl
	ld [hl], d
	ld a, [hMapAnims]
	push af
	xor a
	ld [hMapAnims], a
	ld hl, VramState
	ld a, [hl]
	push af
	res 0, [hl]
	ld hl, Options
	ld a, [hl]
	push af
	set 4, [hl]
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
	ld [Options], a
	pop af
	ld [VramState], a
	pop af
	ld [hMapAnims], a
	ret

; 28fdb

.TradeAnimLayout: ; 28fdb
	xor a
	ld [wJumptableIndex], a
	call ClearBGPalettes
	call ClearSprites
	call ClearTileMap
	call DisableLCD
	call LoadFontsBattleExtra
	callab ClearSpriteAnims
	ld a, [hCGB]
	and a
	jr z, .NotCGB
	ld a, $1
	ld [rVBK], a
	ld hl, VTiles0
	ld bc, sScratch - VTiles0
	xor a
	call ByteFill
	ld a, $0
	ld [rVBK], a

.NotCGB:
	hlbgcoord 0, 0
	ld bc, sScratch - VBGMap0
	ld a, " "
	call ByteFill
	ld hl, TradeGameBoyLZ
	ld de, VTiles2 tile $31
	call Decompress
	ld hl, TradeArrowGFX
	ld de, VTiles1 tile $6d
	ld bc, $10
	ld a, BANK(TradeArrowGFX)
	call FarCopyBytes
	ld hl, TradeArrowGFX + $10
	ld de, VTiles1 tile $6e
	ld bc, $10
	ld a, BANK(TradeArrowGFX)
	call FarCopyBytes
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	callba GetTrademonFrontpic
	call EnableLCD
	call LoadTradeBallAndCableGFX
	ld a, [wPlayerTrademonSpecies]
	ld hl, wPlayerTrademonDVs
	ld de, VTiles0
	call TradeAnim_GetFrontpic
	ld a, [wOTTrademonSpecies]
	ld hl, wOTTrademonDVs
	ld de, VTiles0 tile $31
	call TradeAnim_GetFrontpic
	ld a, [wPlayerTrademonSpecies]
	ld de, wPlayerTrademonSpeciesName
	call TradeAnim_GetNickname
	ld a, [wOTTrademonSpecies]
	ld de, wOTTrademonSpeciesName
	call TradeAnim_GetNickname
	call TradeAnim_NormalPals
	ret

; 29082

DoTradeAnimation: ; 29082
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .finished
	call .DoTradeAnimCommand
	callab PlaySpriteAnimations
	ld hl, wcf65
	inc [hl]
	call DelayFrame
	and a
	ret

.finished
	call LoadStandardFont
	scf
	ret

; 290a0

.DoTradeAnimCommand: ; 290a0
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, .JumpTable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
; 290af

.JumpTable: ; 290af
	dw TradeAnim_AdvanceScriptPointer ; 00
	dw TradeAnim_ShowGivemonData      ; 01
	dw TradeAnim_ShowGetmonData       ; 02
	dw TradeAnim_EnterLinkTube1       ; 03
	dw TradeAnim_EnterLinkTube2       ; 04
	dw TradeAnim_ExitLinkTube         ; 05
	dw TradeAnim_TubeToOT1            ; 06
	dw TradeAnim_TubeToOT2            ; 07
	dw TradeAnim_TubeToOT3            ; 08
	dw TradeAnim_TubeToOT4            ; 09
	dw TradeAnim_TubeToOT5            ; 0a
	dw TradeAnim_TubeToOT6            ; 0b
	dw TradeAnim_TubeToOT7            ; 0c
	dw TradeAnim_TubeToOT8            ; 0d
	dw TradeAnim_TubeToPlayer1        ; 0e
	dw TradeAnim_TubeToPlayer2        ; 0f
	dw TradeAnim_TubeToPlayer3        ; 10
	dw TradeAnim_TubeToPlayer4        ; 11
	dw TradeAnim_TubeToPlayer5        ; 12
	dw TradeAnim_TubeToPlayer6        ; 13
	dw TradeAnim_TubeToPlayer7        ; 14
	dw TradeAnim_TubeToPlayer8        ; 15
	dw TradeAnim_SentToOTText         ; 16
	dw TradeAnim_OTBidsFarewell       ; 17
	dw TradeAnim_TakeCareOfText       ; 18
	dw TradeAnim_OTSendsText1         ; 19
	dw TradeAnim_OTSendsText2         ; 1a
	dw TradeAnim_SetupGivemonScroll   ; 1b
	dw TradeAnim_DoGivemonScroll      ; 1c
	dw TradeAnim_FrontpicScrollStart  ; 1d
	dw TradeAnim_TextboxScrollStart   ; 1e
	dw TradeAnim_ScrollOutRight       ; 1f
	dw TradeAnim_ScrollOutRight2      ; 20
	dw TraideAnim_Wait80              ; 21
	dw TraideAnim_Wait40              ; 22
	dw TradeAnim_RockingBall          ; 23
	dw TradeAnim_DropBall             ; 24
	dw TradeAnim_WaitAnim             ; 25
	dw TradeAnim_WaitAnim2            ; 26
	dw TradeAnim_Poof                 ; 27
	dw TradeAnim_BulgeThroughTube     ; 28
	dw TradeAnim_GiveTrademonSFX      ; 29
	dw TradeAnim_GetTrademonSFX       ; 2a
	dw TradeAnim_End                  ; 2b
	dw TradeAnim_AnimateFrontpic      ; 2c
	dw TraideAnim_Wait96              ; 2d
	dw TraideAnim_Wait80IfOTEgg       ; 2e
	dw TraideAnim_Wait180IfOTEgg      ; 2f
; 2910f

TradeAnim_IncrementJumptableIndex: ; 2910f
	ld hl, wJumptableIndex
	inc [hl]
	ret

; 29114

TradeAnim_AdvanceScriptPointer: ; 29114
	ld hl, wTradeAnimPointer
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

; 29123

TradeAnim_End: ; 29123
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

; 29129

TradeAnim_TubeToOT1: ; 29129
	ld a, $ed ; >>>>>>>>
	call TradeAnim_PlaceTrademonStatsOnTubeAnim
	ld a, [wLinkTradeSendmonSpecies]
	ld [wd265], a
	xor a
	depixel 5, 11, 4, 0
	ld b, $0
	jr TradeAnim_InitTubeAnim

TradeAnim_TubeToPlayer1: ; 2913c
	ld a, $ee ; <<<<<<<<
	call TradeAnim_PlaceTrademonStatsOnTubeAnim
	ld a, [wLinkTradeGetmonSpecies]
	ld [wd265], a
	ld a, $2
	depixel 9, 18, 4, 4
	ld b, $4
TradeAnim_InitTubeAnim: ; 2914e
	push bc
	push de
	push bc
	push de

	push af
	call DisableLCD
	callab ClearSpriteAnims
	hlbgcoord 20, 3
	ld bc, 12
	ld a, $60
	call ByteFill
	pop af

	call TradeAnim_TubeAnimJumptable

	xor a
	ld [hSCX], a
	ld a, $7
	ld [hWX], a
	ld a, $70
	ld [hWY], a
	call EnableLCD
	call LoadTradeBubbleGFX

	pop de
	ld a, SPRITE_ANIM_INDEX_TRADEMON_ICON
	call _InitSpriteAnimStruct

	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	pop bc
	ld [hl], b

	pop de
	ld a, SPRITE_ANIM_INDEX_TRADEMON_BUBBLE
	call _InitSpriteAnimStruct

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
	ld a, $5c
	ld [wcf64], a
	ret

; 291af

TradeAnim_TubeToOT2: ; 291af
	call TradeAnim_FlashBGPals
	ld a, [hSCX]
	add $2
	ld [hSCX], a
	cp $50
	ret nz
	ld a, $1
	call TradeAnim_TubeAnimJumptable
	call TradeAnim_IncrementJumptableIndex
	ret

; 291c4

TradeAnim_TubeToOT3: ; 291c4
	call TradeAnim_FlashBGPals
	ld a, [hSCX]
	add $2
	ld [hSCX], a
	cp $a0
	ret nz
	ld a, $2
	call TradeAnim_TubeAnimJumptable
	call TradeAnim_IncrementJumptableIndex
	ret

; 291d9

TradeAnim_TubeToOT4: ; 291d9
	call TradeAnim_FlashBGPals
	ld a, [hSCX]
	add $2
	ld [hSCX], a
	and a
	ret nz
	call TradeAnim_IncrementJumptableIndex
	ret

; 291e8

TradeAnim_TubeToPlayer3: ; 291e8
	call TradeAnim_FlashBGPals
	ld a, [hSCX]
	sub $2
	ld [hSCX], a
	cp $b0
	ret nz
	ld a, $1
	call TradeAnim_TubeAnimJumptable
	call TradeAnim_IncrementJumptableIndex
	ret

; 291fd

TradeAnim_TubeToPlayer4: ; 291fd
	call TradeAnim_FlashBGPals
	ld a, [hSCX]
	sub $2
	ld [hSCX], a
	cp $60
	ret nz
	xor a
	call TradeAnim_TubeAnimJumptable
	call TradeAnim_IncrementJumptableIndex
	ret

; 29211

TradeAnim_TubeToPlayer5: ; 29211
	call TradeAnim_FlashBGPals
	ld a, [hSCX]
	sub $2
	ld [hSCX], a
	and a
	ret nz
	call TradeAnim_IncrementJumptableIndex
	ret

; 29220

TradeAnim_TubeToOT6:
TradeAnim_TubeToPlayer6: ; 29220
	ld a, $80
	ld [wcf64], a
	call TradeAnim_IncrementJumptableIndex
	ret

; 29229

TradeAnim_TubeToOT8:
TradeAnim_TubeToPlayer8: ; 29229
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	call DisableLCD
	callab ClearSpriteAnims
	hlbgcoord 0, 0
	ld bc, sScratch - VBGMap0
	ld a, " "
	call ByteFill
	xor a
	ld [hSCX], a
	ld a, $90
	ld [hWY], a
	call EnableLCD
	call LoadTradeBallAndCableGFX
	call WaitBGMap
	call TradeAnim_NormalPals
	call TradeAnim_AdvanceScriptPointer
	ret

; 2925d

TradeAnim_TubeToOT5:
TradeAnim_TubeToOT7:
TradeAnim_TubeToPlayer2:
TradeAnim_TubeToPlayer7: ; 2925d
	call TradeAnim_FlashBGPals
	ld hl, wcf64
	ld a, [hl]
	and a
	jr z, .done
	dec [hl]
	ret

.done
	call TradeAnim_IncrementJumptableIndex
	ret

; 2926d

TradeAnim_GiveTrademonSFX: ; 2926d
	call TradeAnim_AdvanceScriptPointer
	ld de, SFX_GIVE_TRADEMON
	call PlaySFX
	ret

; 29277

TradeAnim_GetTrademonSFX: ; 29277
	call TradeAnim_AdvanceScriptPointer
	ld de, SFX_GET_TRADEMON
	call PlaySFX
	ret

; 29281

TradeAnim_TubeAnimJumptable: ; 29281
	and 3
	ld e, a
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
; 2928f

.Jumptable: ; 2928f
	dw .Zero
	dw .One
	dw .Two
	dw .Three
; 29297

.Zero: ; 29297
.Three: ; 29297
	call TradeAnim_BlankTileMap
	hlcoord 9, 3
	ld [hl], $5b
	inc hl
	ld bc, 10
	ld a, $60
	call ByteFill
	hlcoord 3, 2
	call TradeAnim_CopyTradeGameBoyTilemap
	ret

; 292af

.One: ; 292af
	call TradeAnim_BlankTileMap
	hlcoord 0, 3
	ld bc, SCREEN_WIDTH
	ld a, $60
	call ByteFill
	ret

; 292be

.Two: ; 292be
	call TradeAnim_BlankTileMap
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

; 292ec

TradeAnim_CopyTradeGameBoyTilemap: ; 292ec
	ld de, TradeGameBoyTilemap
	lb bc, 8, 6
	call TradeAnim_CopyBoxFromDEtoHL
	ret

; 292f6

TradeAnim_PlaceTrademonStatsOnTubeAnim: ; 292f6
	push af
	call ClearBGPalettes
	call WaitTop
	ld a, VBGMap1 / $100
	ld [hBGMapAddress + 1], a
	call ClearTileMap
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
	ld a, VBGMap0 / $100
	ld [hBGMapAddress + 1], a
	call ClearTileMap
	ret

; 29348

TradeAnim_EnterLinkTube1: ; 29348
	call ClearTileMap
	call WaitTop
	ld a, $a0
	ld [hSCX], a
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

; 2937e

TradeAnim_EnterLinkTube2: ; 2937e
	ld a, [hSCX]
	and a
	jr z, .done
	add $4
	ld [hSCX], a
	ret

.done
	ld c, 80
	call DelayFrames
	call TradeAnim_AdvanceScriptPointer
	ret

; 29391

TradeAnim_ExitLinkTube: ; 29391
	ld a, [hSCX]
	cp $a0
	jr z, .done
	sub $4
	ld [hSCX], a
	ret

.done
	call ClearTileMap
	xor a
	ld [hSCX], a
	call TradeAnim_AdvanceScriptPointer
	ret

; 293a6

TradeAnim_SetupGivemonScroll: ; 293a6
	ld a, $8f
	ld [hWX], a
	ld a, $88
	ld [hSCX], a
	ld a, $50
	ld [hWY], a
	call TradeAnim_AdvanceScriptPointer
	ret

; 293b6

TradeAnim_DoGivemonScroll: ; 293b6
	ld a, [hWX]
	cp $7
	jr z, .done
	sub $4
	ld [hWX], a
	ld a, [hSCX]
	sub $4
	ld [hSCX], a
	ret

.done
	ld a, $7
	ld [hWX], a
	xor a
	ld [hSCX], a
	call TradeAnim_AdvanceScriptPointer
	ret

; 293d2

TradeAnim_FrontpicScrollStart: ; 293d2
	ld a, $7
	ld [hWX], a
	ld a, $50
	ld [hWY], a
	call TradeAnim_AdvanceScriptPointer
	ret

; 293de

TradeAnim_TextboxScrollStart: ; 293de
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	call TradeAnim_AdvanceScriptPointer
	ret

; 293ea

TradeAnim_ScrollOutRight: ; 293ea
	call WaitTop
	ld a, VBGMap1 / $100
	ld [hBGMapAddress + 1], a
	call WaitBGMap
	ld a, $7
	ld [hWX], a
	xor a
	ld [hWY], a
	call DelayFrame
	call WaitTop
	ld a, VBGMap0 / $100
	ld [hBGMapAddress + 1], a
	call ClearTileMap
	call TradeAnim_IncrementJumptableIndex
	ret

; 2940c

TradeAnim_ScrollOutRight2: ; 2940c
	ld a, [hWX]
	cp $a1
	jr nc, .done
	add $4
	ld [hWX], a
	ret

.done
	ld a, VBGMap1 / $100
	ld [hBGMapAddress + 1], a
	call WaitBGMap
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	ld a, VBGMap0 / $100
	ld [hBGMapAddress + 1], a
	call TradeAnim_AdvanceScriptPointer
	ret

; 2942e

TradeAnim_ShowGivemonData: ; 2942e
	call ShowPlayerTrademonStats
	ld a, [wPlayerTrademonSpecies]
	ld [CurPartySpecies], a
	ld a, [wPlayerTrademonDVs]
	ld [TempMonDVs], a
	ld a, [wPlayerTrademonDVs + 1]
	ld [TempMonDVs + 1], a
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
	call PlayCryHeader
.skip_cry

	call TradeAnim_AdvanceScriptPointer
	ret

; 29461

TradeAnim_ShowGetmonData: ; 29461
	call ShowOTTrademonStats
	ld a, [wOTTrademonSpecies]
	ld [CurPartySpecies], a
	ld a, [wOTTrademonDVs]
	ld [TempMonDVs], a
	ld a, [wOTTrademonDVs + 1]
	ld [TempMonDVs + 1], a
	ld b, SCGB_PLAYER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	ld a, %11100100 ; 3,2,1,0
	call DmgToCgbBGPals
	call TradeAnim_ShowGetmonFrontpic
	call TradeAnim_AdvanceScriptPointer
	ret

; 29487

TradeAnim_AnimateFrontpic: ; 29487
	callba AnimateTrademonFrontpic
	call TradeAnim_AdvanceScriptPointer
	ret

; 29491

TradeAnim_GetFrontpic: ; 29491
	push de
	push af
	predef GetUnownLetter
	pop af
	ld [CurPartySpecies], a
	ld [CurSpecies], a
	call GetBaseData
	pop de
	predef GetFrontpic
	ret

; 294a9

TradeAnim_GetNickname: ; 294a9
	push de
	ld [wd265], a
	call GetPokemonName
	ld hl, StringBuffer1
	pop de
	ld bc, NAME_LENGTH
	call CopyBytes
	ret

; 294bb

TradeAnim_ShowGivemonFrontpic: ; 294bb
	ld de, VTiles0
	jr TradeAnim_ShowFrontpic

TradeAnim_ShowGetmonFrontpic: ; 294c0
	ld de, VTiles0 tile $31
TradeAnim_ShowFrontpic: ; 294c3
	call DelayFrame
	ld hl, VTiles2
	lb bc, 10, $31
	call Request2bpp
	call WaitTop
	call TradeAnim_BlankTileMap
	hlcoord 7, 2
	xor a
	ld [hGraphicStartTile], a
	lb bc, 7, 7
	predef PlaceGraphic
	call WaitBGMap
	ret

; 294e7

TraideAnim_Wait80: ; 294e7
	ld c, 80
	call DelayFrames
	call TradeAnim_AdvanceScriptPointer
	ret

; 294f0

TraideAnim_Wait40: ; 294f0
	ld c, 40
	call DelayFrames
	call TradeAnim_AdvanceScriptPointer
	ret

; 294f9

TraideAnim_Wait96: ; 294f9
	ld c, 96
	call DelayFrames
	call TradeAnim_AdvanceScriptPointer
	ret

; 29502

TraideAnim_Wait80IfOTEgg: ; 29502
	call IsOTTrademonEgg
	ret nz
	ld c, 80
	call DelayFrames
	ret

; 2950c

TraideAnim_Wait180IfOTEgg: ; 2950c
	call IsOTTrademonEgg
	ret nz
	ld c, 180
	call DelayFrames
	ret

; 29516

IsOTTrademonEgg: ; 29516
	call TradeAnim_AdvanceScriptPointer
	ld a, [wOTTrademonSpecies]
	cp EGG
	ret

; 2951f
ShowPlayerTrademonStats: ; 2951f
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

; 29549

ShowOTTrademonStats: ; 29549
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

; 29573

TrademonStats_MonTemplate: ; 29573
	call WaitTop
	call TradeAnim_BlankTileMap
	ld a, VBGMap1 / $100
	ld [hBGMapAddress + 1], a
	hlcoord 3, 0
	ld b, $6
	ld c, $d
	call TextBox
	hlcoord 4, 0
	ld de, .OTMonData
	call PlaceString
	ret

; 29591

.OTMonData: ; 29591
	db   "─── №."
	next ""
	next "OT/"
	next "<ID>№.@"
; 295a1

TrademonStats_Egg: ; 295a1
	call WaitTop
	call TradeAnim_BlankTileMap
	ld a, VBGMap1 / $100
	ld [hBGMapAddress + 1], a
	hlcoord 3, 0
	ld b, 6
	ld c, 13
	call TextBox
	hlcoord 4, 2
	ld de, .EggData
	call PlaceString
	call TrademonStats_WaitBGMap
	ret

; 295c2

.EggData: ; 295c2
	db   "EGG"
	next "OT/?????"
	next "<ID>№.?????@"
; 295d8

TrademonStats_WaitBGMap: ; 295d8
	call WaitBGMap
	call WaitTop
	ld a, VBGMap0 / $100
	ld [hBGMapAddress + 1], a
	ret

; 295e3

TrademonStats_PrintSpeciesNumber: ; 295e3
	hlcoord 10, 0
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	ld [hl], " "
	ret

; 295ef

TrademonStats_PrintSpeciesName: ; 295ef
	hlcoord 4, 2
	call PlaceString
	ret

; 295f6

TrademonStats_PrintOTName: ; 295f6
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

; 2960e

.Gender: ; 2960e
	db " ", "♂", "♀"
; 29611

TrademonStats_PrintTrademonID: ; 29611
	hlcoord 7, 6
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	ret

; 2961b

TradeAnim_RockingBall: ; 2961b
	depixel 10, 11, 4, 0
	ld a, SPRITE_ANIM_INDEX_0E
	call _InitSpriteAnimStruct
	call TradeAnim_AdvanceScriptPointer
	ld a, $20
	ld [wcf64], a
	ret

; 2962c

TradeAnim_DropBall: ; 2962c
	depixel 10, 11, 4, 0
	ld a, SPRITE_ANIM_INDEX_0E
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld [hl], $1
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], $dc
	call TradeAnim_AdvanceScriptPointer
	ld a, $38
	ld [wcf64], a
	ret

; 29649

TradeAnim_Poof: ; 29649
	depixel 10, 11, 4, 0
	ld a, SPRITE_ANIM_INDEX_0F
	call _InitSpriteAnimStruct
	call TradeAnim_AdvanceScriptPointer
	ld a, $10
	ld [wcf64], a
	ld de, SFX_BALL_POOF
	call PlaySFX
	ret

; 29660

TradeAnim_BulgeThroughTube: ; 29660
	ld a, %11100100 ; 3,2,1,0
	call DmgToCgbObjPal0
	depixel 5, 11
	ld a, SPRITE_ANIM_INDEX_10
	call _InitSpriteAnimStruct
	call TradeAnim_AdvanceScriptPointer
	ld a, $40
	ld [wcf64], a
	ret

; 29676

TradeAnim_AnimateTrademonInTube: ; 29676 (a:5676)
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
; 29686

.Jumptable: ; 29686 (a:5686)
	dw .InitTimer
	dw .WaitTimer1
	dw .MoveRight
	dw .MoveDown
	dw .MoveUp
	dw .MoveLeft
	dw .WaitTimer2
; 2969a

.JumptableNext: ; 29694 (a:5694)
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	ret

.InitTimer: ; 2969a (a:569a)
	call .JumptableNext
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $80
	ret

.WaitTimer1: ; 296a4 (a:56a4)
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	dec [hl]
	and a
	ret nz
	call .JumptableNext

.MoveRight: ; 296af (a:56af)
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $94
	jr nc, .done_move_right
	inc [hl]
	ret

.done_move_right
	call .JumptableNext

.MoveDown: ; 296bd (a:56bd)
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

.MoveUp: ; 296cf (a:56cf)
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	cp $2c
	jr z, .done_move_up
	dec [hl]
	ret

.done_move_up
	call .JumptableNext

.MoveLeft: ; 296dd (a:56dd)
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

.WaitTimer2: ; 296f2 (a:56f2)
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

; 29701 (a:5701)

TradeAnim_SentToOTText: ; 29701
	ld a, [wLinkMode]
	cp LINK_TIMECAPSULE
	jr z, .time_capsule
	ld hl, .Text_MonName
	call PrintText
	ld c, 189
	call DelayFrames
	ld hl, .Text_WasSentTo
	call PrintText
	call TradeAnim_Wait80Frames
	ld c, 128
	call DelayFrames
	call TradeAnim_AdvanceScriptPointer
	ret

.time_capsule
	ld hl, .Text_WasSentTo
	call PrintText
	call TradeAnim_Wait80Frames
	call TradeAnim_AdvanceScriptPointer
	ret

; 29732

.Text_WasSentTo: ; 0x29732
	; was sent to @ .
	text_jump UnknownText_0x1bc6e9
	db "@"
; 0x29737

.Text_MonName: ; 0x29737
	;
	text_jump UnknownText_0x1bc701
	db "@"
; 0x2973c

TradeAnim_OTBidsFarewell: ; 2973c
	ld hl, .Text_BidsFarewellToMon
	call PrintText
	call TradeAnim_Wait80Frames
	ld hl, .Text_MonName
	call PrintText
	call TradeAnim_Wait80Frames
	call TradeAnim_AdvanceScriptPointer
	ret

; 29752

.Text_BidsFarewellToMon: ; 0x29752
	; bids farewell to
	text_jump UnknownText_0x1bc703
	db "@"
; 0x29757

.Text_MonName: ; 0x29757
	; .
	text_jump UnknownText_0x1bc719
	db "@"
; 0x2975c

TradeAnim_TakeCareOfText: ; 2975c
	call WaitTop
	hlcoord 0, 10
	ld bc, 8 * SCREEN_WIDTH
	ld a, " "
	call ByteFill
	call WaitBGMap
	ld hl, .Text_TakeGoodCareOfMon
	call PrintText
	call TradeAnim_Wait80Frames
	call TradeAnim_AdvanceScriptPointer
	ret

; 2977a

.Text_TakeGoodCareOfMon: ; 0x2977a
	; Take good care of @ .
	text_jump UnknownText_0x1bc71f
	db "@"
; 0x2977f

TradeAnim_OTSendsText1: ; 2977f
	ld hl, .Text_ForYourMon
	call PrintText
	call TradeAnim_Wait80Frames
	ld hl, .Text_OTSends
	call PrintText
	call TradeAnim_Wait80Frames
	ld c, 14
	call DelayFrames
	call TradeAnim_AdvanceScriptPointer
	ret

; 2979a

.Text_ForYourMon: ; 0x2979a
	; For @ 's @ ,
	text_jump UnknownText_0x1bc739
	db "@"
; 0x2979f

.Text_OTSends: ; 0x2979f
	; sends @ .
	text_jump UnknownText_0x1bc74c
	db "@"
; 0x297a4

TradeAnim_OTSendsText2: ; 297a4
	ld hl, .Text_WillTrade
	call PrintText
	call TradeAnim_Wait80Frames
	ld hl, .Text_ForYourMon
	call PrintText
	call TradeAnim_Wait80Frames
	ld c, 14
	call DelayFrames
	call TradeAnim_AdvanceScriptPointer
	ret

; 297bf

.Text_WillTrade: ; 0x297bf
	; will trade @ @
	text_jump UnknownText_0x1bc75e
	db "@"
; 0x297c4

.Text_ForYourMon: ; 0x297c4
	; for @ 's @ .
	text_jump UnknownText_0x1bc774
	db "@"
; 0x297c9

TradeAnim_Wait80Frames: ; 297c9
	ld c, 80
	call DelayFrames
	ret

; 297cf

TradeAnim_BlankTileMap: ; 297cf
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, " "
	call ByteFill
	ret

; 297db

TradeAnim_CopyBoxFromDEtoHL: ; 297db
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

; 297ed

TradeAnim_NormalPals: ; 297ed
	ld a, [hSGB]
	and a
	ld a, %11100100 ; 3,2,1,0
	jr z, .not_sgb
	ld a, $f0

.not_sgb
	call DmgToCgbObjPal0
	ld a, %11100100 ; 3,2,1,0
	call DmgToCgbBGPals
	ret

; 297ff

LinkTradeAnim_LoadTradePlayerNames: ; 297ff
	push de
	ld de, wLinkPlayer1Name
	ld bc, NAME_LENGTH
	call CopyBytes
	pop hl
	ld de, wLinkPlayer2Name
	ld bc, NAME_LENGTH
	call CopyBytes
	ret

; 29814

LinkTradeAnim_LoadTradeMonSpecies: ; 29814
	ld a, [hl]
	ld [wLinkTradeSendmonSpecies], a
	ld a, [de]
	ld [wLinkTradeGetmonSpecies], a
	ret

; 2981d

TradeAnim_FlashBGPals: ; 2981d
	ld a, [wcf65]
	and $7
	ret nz
	ld a, [rBGP]
	xor %00111100
	call DmgToCgbBGPals
	ret

; 2982b

LoadTradeBallAndCableGFX: ; 2982b
	call DelayFrame
	ld de, TradeBallGFX
	ld hl, VTiles0 tile $62
	lb bc, BANK(TradeBallGFX), $6
	call Request2bpp
	ld de, TradePoofGFX
	ld hl, VTiles0 tile $68
	lb bc, BANK(TradePoofGFX), $c
	call Request2bpp
	ld de, TradeCableGFX
	ld hl, VTiles0 tile $74
	lb bc, BANK(TradeCableGFX), $4
	call Request2bpp
	xor a
	ld hl, wSpriteAnimDict
	ld [hli], a
	ld [hl], $62
	ret

; 2985a

LoadTradeBubbleGFX: ; 2985a
	call DelayFrame
	ld e, $3
	callab LoadMenuMonIcon
	ld de, TradeBubbleGFX
	ld hl, VTiles0 tile $72
	lb bc, BANK(TradeBubbleGFX), $4
	call Request2bpp
	xor a
	ld hl, wSpriteAnimDict
	ld [hli], a
	ld [hl], $62
	ret

; 29879

TradeAnim_WaitAnim: ; 29879
	ld hl, wcf64
	ld a, [hl]
	and a
	jr z, .done
	dec [hl]
	ret

.done
	call TradeAnim_AdvanceScriptPointer
	ret

; 29886

TradeAnim_WaitAnim2: ; 29886
	ld hl, wcf64
	ld a, [hl]
	and a
	jr z, .done
	dec [hl]
	ret

.done
	call TradeAnim_AdvanceScriptPointer
	ret

; 29893


DebugTrade: ; 29893
; This function is unreferenced.
; It was meant for use in Japanese versions, so the
; constant used for copy length was changed by accident.

	ld hl, .DebugTradeData

	ld a, [hli]
	ld [wPlayerTrademonSpecies], a
	ld de, wPlayerTrademonSenderName
	ld c, 11 + 2 ; jp: 6 + 2
.loop1
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop1

	ld a, [hli]
	ld [wOTTrademonSpecies], a
	ld de, wOTTrademonSenderName
	ld c, 11 + 2 ; jp: 6 + 2
.loop2
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop2
	ret

; 298b5

.DebugTradeData: ; 298b5
	db VENUSAUR, "ゲーフり@@", $23, $01 ; GAME FREAK
	db CHARIZARD, "クりーチャ@", $56, $04 ; Creatures Inc.
; 298c7


TradeGameBoyTilemap: ; 298c7
; 6x8
	db $31, $32, $32, $32, $32, $33
	db $34, $35, $36, $36, $37, $38
	db $34, $39, $3a, $3a, $3b, $38
	db $3c, $3d, $3e, $3e, $3f, $40
	db $41, $42, $43, $43, $44, $45
	db $46, $47, $43, $48, $49, $4a
	db $41, $43, $4b, $4c, $4d, $4e
	db $4f, $50, $50, $50, $51, $52
; 297f7

TradeLinkTubeTilemap: ; 297f7
; 12x3
	db $43, $55, $56, $53, $53, $53, $53, $53, $53, $53, $53, $53
	db $43, $57, $58, $54, $54, $54, $54, $54, $54, $54, $54, $54
	db $43, $59, $5a, $43, $43, $43, $43, $43, $43, $43, $43, $43
; 2991b

TradeArrowGFX:  INCBIN "gfx/trade/arrow.2bpp"
TradeCableGFX:  INCBIN "gfx/trade/cable.2bpp"
TradeBubbleGFX: INCBIN "gfx/trade/bubble.2bpp"
TradeGameBoyLZ: INCBIN "gfx/trade/game_boy.2bpp.lz"
TradeBallGFX:   INCBIN "gfx/trade/ball.2bpp"
TradePoofGFX:   INCBIN "gfx/trade/poof.2bpp"
