MACRO spriteanimoam
; vtile offset, data pointer
	db \1
	dw \2
ENDM

SpriteAnimOAMData:
; entries correspond to SPRITE_ANIM_OAMSET_* constants (see constants/sprite_anim_constants.asm)
	table_width 3, SpriteAnimOAMData
	spriteanimoam $00, .OAMData_RedWalk                  ; SPRITE_ANIM_OAMSET_RED_WALK_1
	spriteanimoam $04, .OAMData_RedWalk                  ; SPRITE_ANIM_OAMSET_RED_WALK_2
	spriteanimoam $4c, .OAMData_1x1_Palette0             ; SPRITE_ANIM_OAMSET_GS_INTRO_BUBBLE_1
	spriteanimoam $5c, .OAMData_1x1_Palette0             ; SPRITE_ANIM_OAMSET_GS_INTRO_BUBBLE_2
	spriteanimoam $6c, .OAMData_GSIntroShellder          ; SPRITE_ANIM_OAMSET_GS_INTRO_SHELLDER_1
	spriteanimoam $6e, .OAMData_GSIntroShellder          ; SPRITE_ANIM_OAMSET_GS_INTRO_SHELLDER_2
	spriteanimoam $2d, .OAMData_GSIntroMagikarp          ; SPRITE_ANIM_OAMSET_GS_INTRO_MAGIKARP_1
	spriteanimoam $4d, .OAMData_GSIntroMagikarp          ; SPRITE_ANIM_OAMSET_GS_INTRO_MAGIKARP_2
	spriteanimoam $60, .OAMData_GSIntroLapras            ; SPRITE_ANIM_OAMSET_GS_INTRO_UNUSED_LAPRAS
	spriteanimoam $00, .OAMData_GSIntroLapras            ; SPRITE_ANIM_OAMSET_GS_INTRO_LAPRAS_1
	spriteanimoam $00, .OAMData_GSIntroLapras            ; SPRITE_ANIM_OAMSET_GS_INTRO_LAPRAS_2
	spriteanimoam $06, .OAMData_GSIntroLapras            ; SPRITE_ANIM_OAMSET_GS_INTRO_LAPRAS_3
	spriteanimoam $0c, .OAMData_GSIntroNote              ; SPRITE_ANIM_OAMSET_GS_INTRO_NOTE
	spriteanimoam $0d, .OAMData_1x1_Palette0             ; SPRITE_ANIM_OAMSET_GS_INTRO_INVISIBLE_NOTE
	spriteanimoam $00, .OAMData_GSIntroJigglypuffPikachu ; SPRITE_ANIM_OAMSET_GS_INTRO_JIGGLYPUFF_1
	spriteanimoam $04, .OAMData_GSIntroJigglypuffPikachu ; SPRITE_ANIM_OAMSET_GS_INTRO_JIGGLYPUFF_2
	spriteanimoam $08, .OAMData_GSIntroJigglypuffPikachu ; SPRITE_ANIM_OAMSET_GS_INTRO_JIGGLYPUFF_3
	spriteanimoam $40, .OAMData_GSIntroJigglypuffPikachu ; SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_1
	spriteanimoam $44, .OAMData_GSIntroJigglypuffPikachu ; SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_2
	spriteanimoam $48, .OAMData_GSIntroJigglypuffPikachu ; SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_3
	spriteanimoam $4c, .OAMData_GSIntroJigglypuffPikachu ; SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_4
	spriteanimoam $80, .OAMData_GSIntroPikachuTail       ; SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_TAIL_1
	spriteanimoam $85, .OAMData_GSIntroPikachuTail       ; SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_TAIL_2
	spriteanimoam $8a, .OAMData_GSIntroPikachuTail       ; SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_TAIL_3
	spriteanimoam $00, .OAMData_IntroUnownF2_1           ; SPRITE_ANIM_OAMSET_GS_INTRO_SMALL_FIREBALL
	spriteanimoam $01, .OAMData_TradePoofBubble          ; SPRITE_ANIM_OAMSET_GS_INTRO_MED_FIREBALL
	spriteanimoam $09, .OAMData_GSIntroBigFireball       ; SPRITE_ANIM_OAMSET_GS_INTRO_BIG_FIREBALL
	spriteanimoam $10, .OAMData_GSIntroStarter           ; SPRITE_ANIM_OAMSET_GS_INTRO_CHIKORITA
	spriteanimoam $29, .OAMData_GSIntroStarter           ; SPRITE_ANIM_OAMSET_GS_INTRO_CYNDAQUIL
	spriteanimoam $42, .OAMData_GSIntroStarter           ; SPRITE_ANIM_OAMSET_GS_INTRO_TOTODILE
	spriteanimoam $f8, .OAMData_GSTitleTrail             ; SPRITE_ANIM_OAMSET_GS_TITLE_TRAIL_1
	spriteanimoam $fa, .OAMData_GSTitleTrail             ; SPRITE_ANIM_OAMSET_GS_TITLE_TRAIL_2
	spriteanimoam $00, .OAMData_TextEntryCursor          ; SPRITE_ANIM_OAMSET_TEXT_ENTRY_CURSOR
	spriteanimoam $00, .OAMData_TextEntryCursorBig       ; SPRITE_ANIM_OAMSET_TEXT_ENTRY_CURSOR_BIG
	spriteanimoam $00, .OAMData_GSGameFreakLogo          ; SPRITE_ANIM_OAMSET_GS_GAMEFREAK_LOGO
	spriteanimoam $0f, .OAMData_GSGameFreakLogoStar      ; SPRITE_ANIM_OAMSET_GS_GAMEFREAK_LOGO_STAR
	spriteanimoam $11, .OAMData_1x1_Palette0             ; SPRITE_ANIM_OAMSET_GS_GAMEFREAK_LOGO_SPARKLE_1
	spriteanimoam $12, .OAMData_1x1_Palette0             ; SPRITE_ANIM_OAMSET_GS_GAMEFREAK_LOGO_SPARKLE_2
	spriteanimoam $13, .OAMData_1x1_Palette0             ; SPRITE_ANIM_OAMSET_GS_GAMEFREAK_LOGO_SPARKLE_3
	spriteanimoam $00, .OAMData_SlotsGolem               ; SPRITE_ANIM_OAMSET_SLOTS_GOLEM_1
	spriteanimoam $08, .OAMData_SlotsGolem               ; SPRITE_ANIM_OAMSET_SLOTS_GOLEM_2
	spriteanimoam $10, .OAMData_SlotsChansey1            ; SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_1
	spriteanimoam $10, .OAMData_SlotsChansey2            ; SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_2
	spriteanimoam $10, .OAMData_SlotsChansey3            ; SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_3
	spriteanimoam $10, .OAMData_SlotsChansey4            ; SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_4
	spriteanimoam $10, .OAMData_SlotsChansey5            ; SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_5
	spriteanimoam $3a, .OAMData_1x1_Palette0             ; SPRITE_ANIM_OAMSET_SLOTS_EGG
	spriteanimoam $00, .OAMData_RedWalk                  ; SPRITE_ANIM_OAMSET_STILL_CURSOR
	spriteanimoam $00, .OAMData_TradePokeBall1           ; SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1
	spriteanimoam $02, .OAMData_MagnetTrainRed           ; SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_2
	spriteanimoam $06, .OAMData_TradePoofBubble          ; SPRITE_ANIM_OAMSET_TRADE_POOF_1
	spriteanimoam $0a, .OAMData_TradePoofBubble          ; SPRITE_ANIM_OAMSET_TRADE_POOF_2
	spriteanimoam $0e, .OAMData_TradePoofBubble          ; SPRITE_ANIM_OAMSET_TRADE_POOF_3
	spriteanimoam $12, .OAMData_TradeTubeBulge           ; SPRITE_ANIM_OAMSET_TRADE_TUBE_BULGE_1
	spriteanimoam $13, .OAMData_TradeTubeBulge           ; SPRITE_ANIM_OAMSET_TRADE_TUBE_BULGE_2
	spriteanimoam $00, .OAMData_RedWalk                  ; SPRITE_ANIM_OAMSET_TRADEMON_ICON_1
	spriteanimoam $04, .OAMData_RedWalk                  ; SPRITE_ANIM_OAMSET_TRADEMON_ICON_2
	spriteanimoam $10, .OAMData_TradePoofBubble          ; SPRITE_ANIM_OAMSET_TRADEMON_BUBBLE
	spriteanimoam $00, .OAMData_MagnetTrainRed           ; SPRITE_ANIM_OAMSET_EVOLUTION_BALL_OF_LIGHT_1
	spriteanimoam $04, .OAMData_1x1_Palette0             ; SPRITE_ANIM_OAMSET_EVOLUTION_BALL_OF_LIGHT_2
	spriteanimoam $00, .OAMData_RadioTuningKnob          ; SPRITE_ANIM_OAMSET_RADIO_TUNING_KNOB
	spriteanimoam $00, .OAMData_PartyMonWithMail1        ; SPRITE_ANIM_OAMSET_PARTY_MON_WITH_MAIL_1
	spriteanimoam $00, .OAMData_PartyMonWithMail2        ; SPRITE_ANIM_OAMSET_PARTY_MON_WITH_MAIL_2
	spriteanimoam $00, .OAMData_PartyMonWithItem1        ; SPRITE_ANIM_OAMSET_PARTY_MON_WITH_ITEM_1
	spriteanimoam $00, .OAMData_PartyMonWithItem2        ; SPRITE_ANIM_OAMSET_PARTY_MON_WITH_ITEM_2
	spriteanimoam $00, .OAMData_MagnetTrainRed           ; SPRITE_ANIM_OAMSET_MAGNET_TRAIN_RED_1
	spriteanimoam $04, .OAMData_MagnetTrainRed           ; SPRITE_ANIM_OAMSET_MAGNET_TRAIN_RED_2
	spriteanimoam $00, .OAMData_Unused43_4A              ; SPRITE_ANIM_OAMSET_UNUSED_43
	spriteanimoam $30, .OAMData_Unused43_4A              ; SPRITE_ANIM_OAMSET_UNUSED_44
	spriteanimoam $03, .OAMData_Unused43_4A              ; SPRITE_ANIM_OAMSET_UNUSED_45
	spriteanimoam $33, .OAMData_Unused43_4A              ; SPRITE_ANIM_OAMSET_UNUSED_46
	spriteanimoam $06, .OAMData_Unused43_4A              ; SPRITE_ANIM_OAMSET_UNUSED_47
	spriteanimoam $36, .OAMData_Unused43_4A              ; SPRITE_ANIM_OAMSET_UNUSED_48
	spriteanimoam $09, .OAMData_Unused43_4A              ; SPRITE_ANIM_OAMSET_UNUSED_49
	spriteanimoam $39, .OAMData_Unused43_4A              ; SPRITE_ANIM_OAMSET_UNUSED_4A
	spriteanimoam $0c, .OAMData_Unused4B                 ; SPRITE_ANIM_OAMSET_UNUSED_4B
	spriteanimoam $0c, .OAMData_Unused4C                 ; SPRITE_ANIM_OAMSET_UNUSED_4C
	spriteanimoam $3c, .OAMData_1x1_Palette0             ; SPRITE_ANIM_OAMSET_UNUSED_4D
	spriteanimoam $3e, .OAMData_1x1_Palette0             ; SPRITE_ANIM_OAMSET_UNUSED_4E
	spriteanimoam $00, .OAMData_Leaf                     ; SPRITE_ANIM_OAMSET_LEAF
	spriteanimoam $00, .OAMData_Tree                     ; SPRITE_ANIM_OAMSET_TREE_1
	spriteanimoam $00, .OAMData_CutTree2                 ; SPRITE_ANIM_OAMSET_CUT_TREE_2
	spriteanimoam $00, .OAMData_CutTree3                 ; SPRITE_ANIM_OAMSET_CUT_TREE_3
	spriteanimoam $00, .OAMData_CutTree4                 ; SPRITE_ANIM_OAMSET_CUT_TREE_4
	spriteanimoam $00, .OAMData_1x1_Palette0             ; SPRITE_ANIM_OAMSET_EGG_CRACK
	spriteanimoam $01, .OAMData_1x1_Palette0             ; SPRITE_ANIM_OAMSET_EGG_HATCH
	spriteanimoam $00, .OAMData_GSIntroHoOhLugia1        ; SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_1
	spriteanimoam $00, .OAMData_GSIntroHoOhLugia2        ; SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_2
	spriteanimoam $00, .OAMData_GSIntroHoOhLugia3        ; SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_3
	spriteanimoam $00, .OAMData_GSIntroHoOhLugia4        ; SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_4
	spriteanimoam $00, .OAMData_GSIntroHoOhLugia5        ; SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_5
	spriteanimoam $04, .OAMData_Tree                     ; SPRITE_ANIM_OAMSET_HEADBUTT_TREE_2
	spriteanimoam $00, .OAMData_EZChatCursor1            ; SPRITE_ANIM_OAMSET_EZCHAT_CURSOR_1
	spriteanimoam $00, .OAMData_EZChatCursor2            ; SPRITE_ANIM_OAMSET_EZCHAT_CURSOR_2
	spriteanimoam $00, .OAMData_EZChatCursor3            ; SPRITE_ANIM_OAMSET_EZCHAT_CURSOR_3
	spriteanimoam $00, .OAMData_EZChatCursor4            ; SPRITE_ANIM_OAMSET_EZCHAT_CURSOR_4
	spriteanimoam $00, .OAMData_EZChatCursor5            ; SPRITE_ANIM_OAMSET_EZCHAT_CURSOR_5
	spriteanimoam $00, .OAMData_EZChatCursor6            ; SPRITE_ANIM_OAMSET_EZCHAT_CURSOR_6
	spriteanimoam $00, .OAMData_EZChatCursor7            ; SPRITE_ANIM_OAMSET_EZCHAT_CURSOR_7
	spriteanimoam $00, .OAMData_BlueWalk                 ; SPRITE_ANIM_OAMSET_BLUE_WALK_1
	spriteanimoam $04, .OAMData_BlueWalk                 ; SPRITE_ANIM_OAMSET_BLUE_WALK_2
	spriteanimoam $00, .OAMData_MagnetTrainBlue          ; SPRITE_ANIM_OAMSET_MAGNET_TRAIN_BLUE_1
	spriteanimoam $04, .OAMData_MagnetTrainBlue          ; SPRITE_ANIM_OAMSET_MAGNET_TRAIN_BLUE_2
	spriteanimoam $20, .OAMData_MobileTradeCableBulge    ; SPRITE_ANIM_OAMSET_MOBILE_TRADE_CABLE_BULGE_1
	spriteanimoam $21, .OAMData_MobileTradeCableBulge    ; SPRITE_ANIM_OAMSET_MOBILE_TRADE_CABLE_BULGE_2
	spriteanimoam $22, .OAMData_MobileTradePing1         ; SPRITE_ANIM_OAMSET_MOBILE_TRADE_PING_1
	spriteanimoam $23, .OAMData_MobileTradePing2         ; SPRITE_ANIM_OAMSET_MOBILE_TRADE_PING_2
	spriteanimoam $27, .OAMData_MobileTradePing3         ; SPRITE_ANIM_OAMSET_MOBILE_TRADE_PING_3
	spriteanimoam $2a, .OAMData_MobileTradeSentPulse     ; SPRITE_ANIM_OAMSET_MOBILE_TRADE_SENT_PULSE
	spriteanimoam $2a, .OAMData_MobileTradeOTPulse       ; SPRITE_ANIM_OAMSET_MOBILE_TRADE_OT_PULSE
	spriteanimoam $00, .OAMData_IntroSuicune1            ; SPRITE_ANIM_OAMSET_INTRO_SUICUNE_1
	spriteanimoam $08, .OAMData_IntroSuicune2            ; SPRITE_ANIM_OAMSET_INTRO_SUICUNE_2
	spriteanimoam $60, .OAMData_IntroSuicune3            ; SPRITE_ANIM_OAMSET_INTRO_SUICUNE_3
	spriteanimoam $68, .OAMData_IntroSuicune4            ; SPRITE_ANIM_OAMSET_INTRO_SUICUNE_4
	spriteanimoam $00, .OAMData_IntroPichu               ; SPRITE_ANIM_OAMSET_INTRO_PICHU_1
	spriteanimoam $05, .OAMData_IntroPichu               ; SPRITE_ANIM_OAMSET_INTRO_PICHU_2
	spriteanimoam $0a, .OAMData_IntroPichu               ; SPRITE_ANIM_OAMSET_INTRO_PICHU_3
	spriteanimoam $50, .OAMData_IntroWooper              ; SPRITE_ANIM_OAMSET_INTRO_WOOPER
	spriteanimoam $00, .OAMData_IntroUnown1              ; SPRITE_ANIM_OAMSET_INTRO_UNOWN_1
	spriteanimoam $01, .OAMData_IntroUnown2              ; SPRITE_ANIM_OAMSET_INTRO_UNOWN_2
	spriteanimoam $04, .OAMData_IntroUnown3              ; SPRITE_ANIM_OAMSET_INTRO_UNOWN_3
	spriteanimoam $00, .OAMData_IntroUnownF2_1           ; SPRITE_ANIM_OAMSET_INTRO_UNOWN_F_2_1
	spriteanimoam $01, .OAMData_IntroUnownF2_2           ; SPRITE_ANIM_OAMSET_INTRO_UNOWN_F_2_2
	spriteanimoam $03, .OAMData_IntroUnownF2_3           ; SPRITE_ANIM_OAMSET_INTRO_UNOWN_F_2_3
	spriteanimoam $08, .OAMData_IntroUnownF2_4_5         ; SPRITE_ANIM_OAMSET_INTRO_UNOWN_F_2_4
	spriteanimoam $1c, .OAMData_IntroUnownF2_4_5         ; SPRITE_ANIM_OAMSET_INTRO_UNOWN_F_2_5
	spriteanimoam $80, .OAMData_IntroSuicuneAway         ; SPRITE_ANIM_OAMSET_INTRO_SUICUNE_AWAY
	spriteanimoam $00, .OAMData_Celebi                   ; SPRITE_ANIM_OAMSET_CELEBI_1
	spriteanimoam $04, .OAMData_Celebi                   ; SPRITE_ANIM_OAMSET_CELEBI_2
	spriteanimoam $d0, .OAMData_GameFreakLogo1_3         ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_1
	spriteanimoam $d3, .OAMData_GameFreakLogo1_3         ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_2
	spriteanimoam $d6, .OAMData_GameFreakLogo1_3         ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_3
	spriteanimoam $6c, .OAMData_GameFreakLogo4_11        ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_4
	spriteanimoam $68, .OAMData_GameFreakLogo4_11        ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_5
	spriteanimoam $64, .OAMData_GameFreakLogo4_11        ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_6
	spriteanimoam $60, .OAMData_GameFreakLogo4_11        ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_7
	spriteanimoam $0c, .OAMData_GameFreakLogo4_11        ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_8
	spriteanimoam $08, .OAMData_GameFreakLogo4_11        ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_9
	spriteanimoam $04, .OAMData_GameFreakLogo4_11        ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_10
	spriteanimoam $00, .OAMData_GameFreakLogo4_11        ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_11
	assert_table_length NUM_SPRITE_ANIM_OAMSETS

.OAMData_1x1_Palette0:
	db 1
	dbsprite -1, -1,  4,  4, $00, 0

.OAMData_GSIntroShellder:
	db 4
	dbsprite -1, -1,  0,  0, $00, 0
	dbsprite  0, -1,  0,  0, $01, 0
	dbsprite -1,  0,  0,  0, $10, 0
	dbsprite  0,  0,  0,  0, $11, 0

.OAMData_GSGameFreakLogoStar:
	db 4
	dbsprite -1, -1,  0,  0, $00, 0
	dbsprite  0, -1,  0,  0, $00, 0 | X_FLIP
	dbsprite -1,  0,  0,  0, $01, 0
	dbsprite  0,  0,  0,  0, $01, 0 | X_FLIP

.OAMData_TradePokeBall1:
	db 4
	dbsprite -1, -1,  0,  0, $00, 0 | PRIORITY
	dbsprite  0, -1,  0,  0, $00, 0 | X_FLIP | PRIORITY
	dbsprite -1,  0,  0,  0, $01, 0 | PRIORITY
	dbsprite  0,  0,  0,  0, $01, 0 | X_FLIP | PRIORITY

.OAMData_IntroUnownF2_1:
	db 4
	dbsprite -1, -1,  0,  0, $00, 0
	dbsprite  0, -1,  0,  0, $00, 0 | X_FLIP
	dbsprite -1,  0,  0,  0, $00, 0 | Y_FLIP
	dbsprite  0,  0,  0,  0, $00, 0 | X_FLIP | Y_FLIP

.OAMData_TradeTubeBulge:
	db 4
	dbsprite -1, -1,  0,  0, $00, 7
	dbsprite  0, -1,  0,  0, $00, 7 | X_FLIP
	dbsprite -1,  0,  0,  0, $00, 7 | Y_FLIP
	dbsprite  0,  0,  0,  0, $00, 7 | X_FLIP | Y_FLIP

.OAMData_Unknown1: ; unreferenced
	db 4
	dbsprite -1, -1,  0,  0, $00, 0 | PRIORITY
	dbsprite  0, -1,  0,  0, $00, 0 | X_FLIP | PRIORITY
	dbsprite -1,  0,  0,  0, $00, 0 | Y_FLIP | PRIORITY
	dbsprite  0,  0,  0,  0, $00, 0 | X_FLIP | Y_FLIP | PRIORITY

.OAMData_TradePoofBubble:
	db 16
	dbsprite -2, -2,  0,  0, $00, 0
	dbsprite -1, -2,  0,  0, $01, 0
	dbsprite -2, -1,  0,  0, $02, 0
	dbsprite -1, -1,  0,  0, $03, 0
	dbsprite  0, -2,  0,  0, $01, 0 | X_FLIP
	dbsprite  1, -2,  0,  0, $00, 0 | X_FLIP
	dbsprite  0, -1,  0,  0, $03, 0 | X_FLIP
	dbsprite  1, -1,  0,  0, $02, 0 | X_FLIP
	dbsprite -2,  0,  0,  0, $02, 0 | Y_FLIP
	dbsprite -1,  0,  0,  0, $03, 0 | Y_FLIP
	dbsprite -2,  1,  0,  0, $00, 0 | Y_FLIP
	dbsprite -1,  1,  0,  0, $01, 0 | Y_FLIP
	dbsprite  0,  0,  0,  0, $03, 0 | X_FLIP | Y_FLIP
	dbsprite  1,  0,  0,  0, $02, 0 | X_FLIP | Y_FLIP
	dbsprite  0,  1,  0,  0, $01, 0 | X_FLIP | Y_FLIP
	dbsprite  1,  1,  0,  0, $00, 0 | X_FLIP | Y_FLIP

.OAMData_GSIntroBigFireball:
	db 36
	dbsprite -3, -3,  0,  0, $00, 0
	dbsprite -2, -3,  0,  0, $01, 0
	dbsprite -1, -3,  0,  0, $02, 0
	dbsprite -3, -2,  0,  0, $03, 0
	dbsprite -2, -2,  0,  0, $04, 0
	dbsprite -1, -2,  0,  0, $05, 0
	dbsprite -3, -1,  0,  0, $06, 0
	dbsprite -2, -1,  0,  0, $05, 0
	dbsprite -1, -1,  0,  0, $05, 0
	dbsprite  0, -3,  0,  0, $02, 0 | X_FLIP
	dbsprite  1, -3,  0,  0, $01, 0 | X_FLIP
	dbsprite  2, -3,  0,  0, $00, 0 | X_FLIP
	dbsprite  0, -2,  0,  0, $05, 0 | X_FLIP
	dbsprite  1, -2,  0,  0, $04, 0 | X_FLIP
	dbsprite  2, -2,  0,  0, $03, 0 | X_FLIP
	dbsprite  0, -1,  0,  0, $05, 0 | X_FLIP
	dbsprite  1, -1,  0,  0, $05, 0 | X_FLIP
	dbsprite  2, -1,  0,  0, $06, 0 | X_FLIP
	dbsprite -3,  0,  0,  0, $06, 0 | Y_FLIP
	dbsprite -2,  0,  0,  0, $05, 0 | Y_FLIP
	dbsprite -1,  0,  0,  0, $05, 0 | Y_FLIP
	dbsprite -3,  1,  0,  0, $03, 0 | Y_FLIP
	dbsprite -2,  1,  0,  0, $04, 0 | Y_FLIP
	dbsprite -1,  1,  0,  0, $05, 0 | Y_FLIP
	dbsprite -3,  2,  0,  0, $00, 0 | Y_FLIP
	dbsprite -2,  2,  0,  0, $01, 0 | Y_FLIP
	dbsprite -1,  2,  0,  0, $02, 0 | Y_FLIP
	dbsprite  0,  0,  0,  0, $05, 0 | X_FLIP | Y_FLIP
	dbsprite  1,  0,  0,  0, $05, 0 | X_FLIP | Y_FLIP
	dbsprite  2,  0,  0,  0, $06, 0 | X_FLIP | Y_FLIP
	dbsprite  0,  1,  0,  0, $05, 0 | X_FLIP | Y_FLIP
	dbsprite  1,  1,  0,  0, $04, 0 | X_FLIP | Y_FLIP
	dbsprite  2,  1,  0,  0, $03, 0 | X_FLIP | Y_FLIP
	dbsprite  0,  2,  0,  0, $02, 0 | X_FLIP | Y_FLIP
	dbsprite  1,  2,  0,  0, $01, 0 | X_FLIP | Y_FLIP
	dbsprite  2,  2,  0,  0, $00, 0 | X_FLIP | Y_FLIP

.OAMData_Unused43_4A:
	db 9
	dbsprite -2, -2,  4,  4, $00, 0
	dbsprite -1, -2,  4,  4, $01, 0
	dbsprite  0, -2,  4,  4, $02, 0
	dbsprite -2, -1,  4,  4, $10, 0
	dbsprite -1, -1,  4,  4, $11, 0
	dbsprite  0, -1,  4,  4, $12, 0
	dbsprite -2,  0,  4,  4, $20, 0
	dbsprite -1,  0,  4,  4, $21, 0
	dbsprite  0,  0,  4,  4, $22, 0

.OAMData_GSIntroJigglypuffPikachu:
	db 16
	dbsprite -2, -2,  0,  0, $00, 0
	dbsprite -1, -2,  0,  0, $01, 0
	dbsprite  0, -2,  0,  0, $02, 0
	dbsprite  1, -2,  0,  0, $03, 0
	dbsprite -2, -1,  0,  0, $10, 0
	dbsprite -1, -1,  0,  0, $11, 0
	dbsprite  0, -1,  0,  0, $12, 0
	dbsprite  1, -1,  0,  0, $13, 0
	dbsprite -2,  0,  0,  0, $20, 0
	dbsprite -1,  0,  0,  0, $21, 0
	dbsprite  0,  0,  0,  0, $22, 0
	dbsprite  1,  0,  0,  0, $23, 0
	dbsprite -2,  1,  0,  0, $30, 0
	dbsprite -1,  1,  0,  0, $31, 0
	dbsprite  0,  1,  0,  0, $32, 0
	dbsprite  1,  1,  0,  0, $33, 0

.OAMData_GSIntroStarter:
	db 25
	dbsprite -3, -3,  4,  4, $00, 0
	dbsprite -3, -2,  4,  4, $01, 0
	dbsprite -3, -1,  4,  4, $02, 0
	dbsprite -3,  0,  4,  4, $03, 0
	dbsprite -3,  1,  4,  4, $04, 0
	dbsprite -2, -3,  4,  4, $05, 0
	dbsprite -2, -2,  4,  4, $06, 0
	dbsprite -2, -1,  4,  4, $07, 0
	dbsprite -2,  0,  4,  4, $08, 0
	dbsprite -2,  1,  4,  4, $09, 0
	dbsprite -1, -3,  4,  4, $0a, 0
	dbsprite -1, -2,  4,  4, $0b, 0
	dbsprite -1, -1,  4,  4, $0c, 0
	dbsprite -1,  0,  4,  4, $0d, 0
	dbsprite -1,  1,  4,  4, $0e, 0
	dbsprite  0, -3,  4,  4, $0f, 0
	dbsprite  0, -2,  4,  4, $10, 0
	dbsprite  0, -1,  4,  4, $11, 0
	dbsprite  0,  0,  4,  4, $12, 0
	dbsprite  0,  1,  4,  4, $13, 0
	dbsprite  1, -3,  4,  4, $14, 0
	dbsprite  1, -2,  4,  4, $15, 0
	dbsprite  1, -1,  4,  4, $16, 0
	dbsprite  1,  0,  4,  4, $17, 0
	dbsprite  1,  1,  4,  4, $18, 0

.OAMData_Unknown2: ; unreferenced
	db 36
	dbsprite -3, -3,  0,  0, $00, 0
	dbsprite -2, -3,  0,  0, $01, 0
	dbsprite -1, -3,  0,  0, $02, 0
	dbsprite  0, -3,  0,  0, $03, 0
	dbsprite  1, -3,  0,  0, $04, 0
	dbsprite  2, -3,  0,  0, $05, 0
	dbsprite -3, -2,  0,  0, $06, 0
	dbsprite -2, -2,  0,  0, $07, 0
	dbsprite -1, -2,  0,  0, $08, 0
	dbsprite  0, -2,  0,  0, $09, 0
	dbsprite  1, -2,  0,  0, $0a, 0
	dbsprite  2, -2,  0,  0, $0b, 0
	dbsprite -3, -1,  0,  0, $0c, 0
	dbsprite -2, -1,  0,  0, $0d, 0
	dbsprite -1, -1,  0,  0, $0e, 0
	dbsprite  0, -1,  0,  0, $0f, 0
	dbsprite  1, -1,  0,  0, $10, 0
	dbsprite  2, -1,  0,  0, $11, 0
	dbsprite -3,  0,  0,  0, $12, 0
	dbsprite -2,  0,  0,  0, $13, 0
	dbsprite -1,  0,  0,  0, $14, 0
	dbsprite  0,  0,  0,  0, $15, 0
	dbsprite  1,  0,  0,  0, $16, 0
	dbsprite  2,  0,  0,  0, $17, 0
	dbsprite -3,  1,  0,  0, $18, 0
	dbsprite -2,  1,  0,  0, $19, 0
	dbsprite -1,  1,  0,  0, $1a, 0
	dbsprite  0,  1,  0,  0, $1b, 0
	dbsprite  1,  1,  0,  0, $1c, 0
	dbsprite  2,  1,  0,  0, $1d, 0
	dbsprite -3,  2,  0,  0, $1e, 0
	dbsprite -2,  2,  0,  0, $1f, 0
	dbsprite -1,  2,  0,  0, $20, 0
	dbsprite  0,  2,  0,  0, $21, 0
	dbsprite  1,  2,  0,  0, $22, 0
	dbsprite  2,  2,  0,  0, $23, 0

.OAMData_RedWalk:
	db 4
	dbsprite -1, -1,  0,  0, $00, PAL_OW_RED
	dbsprite  0, -1,  0,  0, $01, PAL_OW_RED
	dbsprite -1,  0,  0,  0, $02, PAL_OW_RED
	dbsprite  0,  0,  0,  0, $03, PAL_OW_RED

.OAMData_MagnetTrainRed:
	db 4
	dbsprite -1, -1,  0,  0, $00, PAL_OW_RED | PRIORITY
	dbsprite  0, -1,  0,  0, $01, PAL_OW_RED | PRIORITY
	dbsprite -1,  0,  0,  0, $02, PAL_OW_RED | PRIORITY
	dbsprite  0,  0,  0,  0, $03, PAL_OW_RED | PRIORITY

.OAMData_PartyMonWithMail1:
	db 4
	dbsprite -1, -1,  0,  0, $00, PAL_OW_RED
	dbsprite  0, -1,  0,  0, $01, PAL_OW_RED
	dbsprite -1,  0,  0,  0, $08, PAL_OW_RED
	dbsprite  0,  0,  0,  0, $03, PAL_OW_RED

.OAMData_PartyMonWithMail2:
	db 4
	dbsprite -1, -1,  0,  0, $04, PAL_OW_RED
	dbsprite  0, -1,  0,  0, $05, PAL_OW_RED
	dbsprite -1,  0,  0,  0, $08, PAL_OW_RED
	dbsprite  0,  0,  0,  0, $07, PAL_OW_RED

.OAMData_PartyMonWithItem1:
	db 4
	dbsprite -1, -1,  0,  0, $00, PAL_OW_RED
	dbsprite  0, -1,  0,  0, $01, PAL_OW_RED
	dbsprite -1,  0,  0,  0, $09, PAL_OW_RED
	dbsprite  0,  0,  0,  0, $03, PAL_OW_RED

.OAMData_PartyMonWithItem2:
	db 4
	dbsprite -1, -1,  0,  0, $04, PAL_OW_RED
	dbsprite  0, -1,  0,  0, $05, PAL_OW_RED
	dbsprite -1,  0,  0,  0, $09, PAL_OW_RED
	dbsprite  0,  0,  0,  0, $07, PAL_OW_RED

.OAMData_GSIntroMagikarp:
	db 6
	dbsprite -2, -1,  4,  0, $00, 1
	dbsprite -1, -1,  4,  0, $01, 1
	dbsprite  0, -1,  4,  0, $02, 1
	dbsprite -2,  0,  4,  0, $10, 1
	dbsprite -1,  0,  4,  0, $11, 1
	dbsprite  0,  0,  4,  0, $12, 1

.OAMData_GSIntroLapras:
	db 29
	dbsprite -3, -3,  0,  0, $00, 0
	dbsprite -2, -3,  0,  0, $01, 0
	dbsprite -1, -3,  0,  0, $02, 0
	dbsprite  0, -3,  0,  0, $03, 0
	dbsprite -3, -2,  0,  0, $10, 0
	dbsprite -2, -2,  0,  0, $11, 0
	dbsprite -1, -2,  0,  0, $12, 0
	dbsprite  0, -2,  0,  0, $13, 0
	dbsprite -3, -1,  0,  0, $20, 0
	dbsprite -2, -1,  0,  0, $21, 0
	dbsprite -1, -1,  0,  0, $22, 0
	dbsprite  0, -1,  0,  0, $23, 0
	dbsprite  1, -1,  0,  0, $24, 0
	dbsprite -3,  0,  0,  0, $30, 0 | PRIORITY
	dbsprite -2,  0,  0,  0, $31, 0 | PRIORITY
	dbsprite -1,  0,  0,  0, $32, 0 | PRIORITY
	dbsprite  0,  0,  0,  0, $33, 0 | PRIORITY
	dbsprite  1,  0,  0,  0, $34, 0 | PRIORITY
	dbsprite -3,  1,  0,  0, $40, 0 | PRIORITY
	dbsprite -2,  1,  0,  0, $41, 0 | PRIORITY
	dbsprite -1,  1,  0,  0, $42, 0 | PRIORITY
	dbsprite  0,  1,  0,  0, $43, 0 | PRIORITY
	dbsprite  1,  1,  0,  0, $44, 0 | PRIORITY
	dbsprite  2,  1,  0,  0, $45, 0 | PRIORITY
	dbsprite -2,  2,  0,  0, $51, 0 | PRIORITY
	dbsprite -1,  2,  0,  0, $52, 0 | PRIORITY
	dbsprite  0,  2,  0,  0, $53, 0 | PRIORITY
	dbsprite  1,  2,  0,  0, $54, 0 | PRIORITY
	dbsprite  2,  2,  0,  0, $55, 0 | PRIORITY

.OAMData_GSIntroNote:
	db 2
	dbsprite -1, -1,  4,  0, $00, 0
	dbsprite -1,  0,  4,  0, $10, 0

.OAMData_GSIntroPikachuTail:
	db 5
	dbsprite  3, -2,  0,  0, $00, 0
	dbsprite  4, -2,  0,  0, $01, 0
	dbsprite  2, -1,  0,  0, $02, 0
	dbsprite  3, -1,  0,  0, $03, 0
	dbsprite  2,  0,  0,  0, $04, 0

.OAMData_Leaf:
	db 1
	dbsprite -1, -1,  4,  4, $00, PAL_OW_TREE

.OAMData_Tree:
	db 4
	dbsprite -1, -1,  0,  0, $00, PAL_OW_TREE
	dbsprite  0, -1,  0,  0, $01, PAL_OW_TREE
	dbsprite -1,  0,  0,  0, $02, PAL_OW_TREE
	dbsprite  0,  0,  0,  0, $03, PAL_OW_TREE

.OAMData_TextEntryCursor:
	db 4
	dbsprite -1, -1,  7,  7, $00, 0
	dbsprite  0, -1,  0,  7, $00, 0 | X_FLIP
	dbsprite -1,  0,  7,  0, $00, 0 | Y_FLIP
	dbsprite  0,  0,  0,  0, $00, 0 | X_FLIP | Y_FLIP

.OAMData_TextEntryCursorBig:
	db 10
	dbsprite  0, -1,  0,  7, $00, 0
	dbsprite  1, -1,  0,  7, $01, 0
	dbsprite  2, -1,  0,  7, $01, 0
	dbsprite  3, -1,  0,  7, $01, 0
	dbsprite  4, -1,  0,  7, $00, 0 | X_FLIP
	dbsprite  0,  0,  0,  0, $00, 0 | Y_FLIP
	dbsprite  1,  0,  0,  0, $01, 0 | Y_FLIP
	dbsprite  2,  0,  0,  0, $01, 0 | Y_FLIP
	dbsprite  3,  0,  0,  0, $01, 0 | Y_FLIP
	dbsprite  4,  0,  0,  0, $00, 0 | X_FLIP | Y_FLIP

.OAMData_GSGameFreakLogo:
	db 15
	dbsprite -2, -3,  4,  4, $00, 1 | OBP_NUM
	dbsprite -1, -3,  4,  4, $01, 1 | OBP_NUM
	dbsprite  0, -3,  4,  4, $02, 1 | OBP_NUM
	dbsprite -2, -2,  4,  4, $03, 1 | OBP_NUM
	dbsprite -1, -2,  4,  4, $04, 1 | OBP_NUM
	dbsprite  0, -2,  4,  4, $05, 1 | OBP_NUM
	dbsprite -2, -1,  4,  4, $06, 1 | OBP_NUM
	dbsprite -1, -1,  4,  4, $07, 1 | OBP_NUM
	dbsprite  0, -1,  4,  4, $08, 1 | OBP_NUM
	dbsprite -2,  0,  4,  4, $09, 1 | OBP_NUM
	dbsprite -1,  0,  4,  4, $0a, 1 | OBP_NUM
	dbsprite  0,  0,  4,  4, $0b, 1 | OBP_NUM
	dbsprite -2,  1,  4,  4, $0c, 1 | OBP_NUM
	dbsprite -1,  1,  4,  4, $0d, 1 | OBP_NUM
	dbsprite  0,  1,  4,  4, $0e, 1 | OBP_NUM

.OAMData_SlotsGolem:
	db 6
	dbsprite -2, -2,  4,  4, $00, 5 | OBP_NUM
	dbsprite -1, -2,  4,  4, $02, 5 | OBP_NUM
	dbsprite  0, -2,  4,  4, $00, 5 | OBP_NUM | X_FLIP
	dbsprite -2,  0,  4,  4, $04, 5 | OBP_NUM
	dbsprite -1,  0,  4,  4, $06, 5 | OBP_NUM
	dbsprite  0,  0,  4,  4, $04, 5 | OBP_NUM | X_FLIP

.OAMData_SlotsChansey1:
	db 6
	dbsprite -2, -2,  4,  4, $00, 6 | OBP_NUM
	dbsprite -1, -2,  4,  4, $02, 6 | OBP_NUM
	dbsprite  0, -2,  4,  4, $04, 6 | OBP_NUM
	dbsprite -2,  0,  4,  4, $06, 6 | OBP_NUM
	dbsprite -1,  0,  4,  4, $08, 6 | OBP_NUM
	dbsprite  0,  0,  4,  4, $0a, 6 | OBP_NUM

.OAMData_SlotsChansey2:
	db 6
	dbsprite -2, -2,  4,  4, $00, 6 | OBP_NUM
	dbsprite -1, -2,  4,  4, $02, 6 | OBP_NUM
	dbsprite  0, -2,  4,  4, $04, 6 | OBP_NUM
	dbsprite -2,  0,  4,  4, $0c, 6 | OBP_NUM
	dbsprite -1,  0,  4,  4, $0e, 6 | OBP_NUM
	dbsprite  0,  0,  4,  4, $10, 6 | OBP_NUM

.OAMData_SlotsChansey3:
	db 6
	dbsprite -2, -2,  4,  4, $00, 6 | OBP_NUM
	dbsprite -1, -2,  4,  4, $02, 6 | OBP_NUM
	dbsprite  0, -2,  4,  4, $04, 6 | OBP_NUM
	dbsprite -2,  0,  4,  4, $12, 6 | OBP_NUM
	dbsprite -1,  0,  4,  4, $14, 6 | OBP_NUM
	dbsprite  0,  0,  4,  4, $16, 6 | OBP_NUM

.OAMData_SlotsChansey4:
	db 6
	dbsprite -2, -2,  4,  4, $00, 6 | OBP_NUM
	dbsprite -1, -2,  4,  4, $02, 6 | OBP_NUM
	dbsprite  0, -2,  4,  4, $04, 6 | OBP_NUM
	dbsprite -2,  0,  4,  4, $18, 6 | OBP_NUM
	dbsprite -1,  0,  4,  4, $1a, 6 | OBP_NUM
	dbsprite  0,  0,  4,  4, $1c, 6 | OBP_NUM

.OAMData_SlotsChansey5:
	db 6
	dbsprite -2, -2,  4,  4, $1e, 6 | OBP_NUM
	dbsprite -1, -2,  4,  4, $20, 6 | OBP_NUM
	dbsprite  0, -2,  4,  4, $22, 6 | OBP_NUM
	dbsprite -2,  0,  4,  4, $24, 6 | OBP_NUM
	dbsprite -1,  0,  4,  4, $26, 6 | OBP_NUM
	dbsprite  0,  0,  4,  4, $28, 6 | OBP_NUM

.OAMData_RadioTuningKnob:
	db 3
	dbsprite -1, -2,  4,  4, $00, 0 | OBP_NUM
	dbsprite -1, -1,  4,  4, $00, 0 | OBP_NUM
	dbsprite -1,  0,  4,  4, $00, 0 | OBP_NUM

.OAMData_Unused4B:
	db 6
	dbsprite  0,  0,  0,  0, $00, 0
	dbsprite  1,  0,  0,  0, $01, 0
	dbsprite  2,  0,  0,  0, $01, 0
	dbsprite  3,  0,  0,  0, $01, 0
	dbsprite  4,  0,  0,  0, $02, 0
	dbsprite  5,  0,  0,  0, $03, 0

.OAMData_Unused4C:
	db 4
	dbsprite  0,  0,  0,  0, $00, 0
	dbsprite  1,  0,  0,  0, $01, 0
	dbsprite  2,  0,  0,  0, $02, 0
	dbsprite  3,  0,  0,  0, $03, 0

.OAMData_CutTree2:
	db 4
	dbsprite -2, -1,  6,  0, $00, PAL_OW_TREE
	dbsprite  0, -1,  2,  0, $01, PAL_OW_TREE
	dbsprite -2,  0,  6,  0, $02, PAL_OW_TREE
	dbsprite  0,  0,  2,  0, $03, PAL_OW_TREE

.OAMData_CutTree3:
	db 4
	dbsprite -2, -1,  4,  0, $00, PAL_OW_TREE
	dbsprite  0, -1,  4,  0, $01, PAL_OW_TREE
	dbsprite -2,  0,  4,  0, $02, PAL_OW_TREE
	dbsprite  0,  0,  4,  0, $03, PAL_OW_TREE

.OAMData_CutTree4:
	db 4
	dbsprite -2, -1,  0,  0, $00, PAL_OW_TREE
	dbsprite  1, -1,  0,  0, $01, PAL_OW_TREE
	dbsprite -2,  0,  0,  0, $02, PAL_OW_TREE
	dbsprite  1,  0,  0,  0, $03, PAL_OW_TREE

.OAMData_GSIntroHoOhLugia1:
	db 19
	dbsprite -4, -1,  0,  0, $00, 0
	dbsprite -3, -2,  0,  0, $02, 0
	dbsprite -3,  0,  0,  0, $04, 0
	dbsprite -2, -3,  0,  0, $06, 0
	dbsprite -2, -1,  0,  0, $08, 0
	dbsprite -2,  1,  0,  0, $0a, 0
	dbsprite -1, -3,  0,  0, $0c, 0
	dbsprite -1, -1,  0,  0, $0e, 0
	dbsprite -1,  1,  0,  0, $10, 0
	dbsprite  0, -3,  0,  0, $12, 0
	dbsprite  0, -1,  0,  0, $14, 0
	dbsprite  0,  1,  0,  0, $16, 0
	dbsprite  1, -3,  0,  0, $18, 0
	dbsprite  1, -1,  0,  0, $1a, 0
	dbsprite  1,  1,  0,  0, $1c, 0
	dbsprite  2, -1,  0,  0, $1e, 0
	dbsprite  2,  1,  0,  0, $20, 0
	dbsprite  3, -2,  0,  0, $22, 0
	dbsprite  3,  0,  0,  0, $24, 0

.OAMData_GSIntroHoOhLugia2:
	db 16
	dbsprite -4, -1,  0,  0, $00, 0
	dbsprite -3, -2,  0,  0, $02, 0
	dbsprite -3,  0,  0,  0, $04, 0
	dbsprite -2, -1,  0,  0, $26, 0
	dbsprite -2,  1,  0,  0, $0a, 0
	dbsprite -1, -3,  0,  0, $28, 0
	dbsprite -1, -1,  0,  0, $2a, 0
	dbsprite -1,  1,  0,  0, $10, 0
	dbsprite  0, -1,  0,  0, $2c, 0
	dbsprite  0,  1,  0,  0, $16, 0
	dbsprite  1, -1,  0,  0, $30, 0
	dbsprite  1,  1,  0,  0, $1c, 0
	dbsprite  2, -1,  0,  0, $1e, 0
	dbsprite  2,  1,  0,  0, $20, 0
	dbsprite  3, -2,  0,  0, $22, 0
	dbsprite  3,  0,  0,  0, $24, 0

.OAMData_GSIntroHoOhLugia3:
	db 15
	dbsprite -4, -1,  0,  0, $00, 0
	dbsprite -3, -2,  0,  0, $02, 0
	dbsprite -3,  0,  0,  0, $32, 0
	dbsprite -2, -1,  0,  0, $34, 0
	dbsprite -2,  1,  0,  0, $36, 0
	dbsprite -1, -1,  0,  0, $38, 0
	dbsprite -1,  1,  0,  0, $3a, 0
	dbsprite  0, -1,  0,  0, $3c, 0
	dbsprite  0,  1,  0,  0, $3e, 0
	dbsprite  1, -1,  0,  0, $30, 0
	dbsprite  1,  1,  0,  0, $1c, 0
	dbsprite  2, -1,  0,  0, $1e, 0
	dbsprite  2,  1,  0,  0, $20, 0
	dbsprite  3, -2,  0,  0, $22, 0
	dbsprite  3,  0,  0,  0, $24, 0

.OAMData_GSIntroHoOhLugia4:
	db 17
	dbsprite -4, -1,  0,  0, $00, 0
	dbsprite -3, -2,  0,  0, $02, 0
	dbsprite -3,  0,  0,  0, $04, 0
	dbsprite -2, -1,  0,  0, $40, 0
	dbsprite -2,  1,  0,  0, $42, 0
	dbsprite -2,  3,  0,  0, $44, 0
	dbsprite -1, -1,  0,  0, $46, 0
	dbsprite -1,  1,  0,  0, $48, 0
	dbsprite -1,  3,  0,  0, $4a, 0
	dbsprite  0, -1,  0,  0, $4c, 0
	dbsprite  0,  1,  0,  0, $4e, 0
	dbsprite  1, -1,  0,  0, $30, 0
	dbsprite  1,  1,  0,  0, $1c, 0
	dbsprite  2, -1,  0,  0, $1e, 0
	dbsprite  2,  1,  0,  0, $20, 0
	dbsprite  3, -2,  0,  0, $22, 0
	dbsprite  3,  0,  0,  0, $24, 0

.OAMData_GSIntroHoOhLugia5:
	db 17
	dbsprite -4, -1,  0,  0, $00, 0
	dbsprite -3, -2,  0,  0, $02, 0
	dbsprite -3,  0,  0,  0, $04, 0
	dbsprite -2, -1,  0,  0, $50, 0
	dbsprite -2,  1,  0,  0, $0a, 0
	dbsprite -1, -3,  0,  0, $52, 0
	dbsprite -1, -1,  0,  0, $54, 0
	dbsprite -1,  1,  0,  0, $10, 0
	dbsprite  0, -3,  0,  0, $56, 0
	dbsprite  0, -1,  0,  0, $2e, 0
	dbsprite  0,  1,  0,  0, $16, 0
	dbsprite  1, -1,  0,  0, $30, 0
	dbsprite  1,  1,  0,  0, $1c, 0
	dbsprite  2, -1,  0,  0, $1e, 0
	dbsprite  2,  1,  0,  0, $20, 0
	dbsprite  3, -2,  0,  0, $22, 0
	dbsprite  3,  0,  0,  0, $24, 0

.OAMData_GSTitleTrail:
	db 1
	dbsprite -1, -1,  4,  4, $00, 1 | OBP_NUM

.OAMData_EZChatCursor1:
	db 12
	dbsprite  0,  0,  0,  0, $30, 0
	dbsprite  1,  0,  0,  0, $31, 0
	dbsprite  2,  0,  0,  0, $31, 0
	dbsprite  3,  0,  0,  0, $31, 0
	dbsprite  4,  0,  0,  0, $31, 0
	dbsprite  5,  0,  0,  0, $32, 0
	dbsprite  0,  1,  0,  0, $33, 0
	dbsprite  1,  1,  0,  0, $34, 0
	dbsprite  2,  1,  0,  0, $34, 0
	dbsprite  3,  1,  0,  0, $34, 0
	dbsprite  4,  1,  0,  0, $34, 0
	dbsprite  5,  1,  0,  0, $35, 0

.OAMData_EZChatCursor2:
	db 1
	dbsprite  0,  0,  0,  0, $ed, 0

.OAMData_EZChatCursor3:
	db 4
	dbsprite -1, -1,  7,  7, $30, 0
	dbsprite  0, -1,  1,  7, $32, 0
	dbsprite -1,  0,  7,  1, $33, 0
	dbsprite  0,  0,  1,  1, $35, 0

.OAMData_EZChatCursor4:
	db 8
	dbsprite -1, -1,  7,  7, $30, 0
	dbsprite  0, -1,  4,  7, $31, 0
	dbsprite  1, -1,  4,  7, $31, 0
	dbsprite  2, -1,  1,  7, $32, 0
	dbsprite -1,  0,  7,  1, $33, 0
	dbsprite  0,  0,  4,  1, $34, 0
	dbsprite  1,  0,  4,  1, $34, 0
	dbsprite  2,  0,  1,  1, $35, 0

.OAMData_EZChatCursor5:
	db 1
	dbsprite  0,  0,  0,  0, $34, 0

.OAMData_EZChatCursor6:
	db 2
	dbsprite  0,  0,  0,  0, $30, 0
	dbsprite  0,  1,  0,  0, $33, 0

.OAMData_EZChatCursor7:
	db 2
	dbsprite  0,  0,  0,  0, $32, 0
	dbsprite  0,  1,  0,  0, $35, 0

.OAMData_BlueWalk:
	db 4
	dbsprite -1, -1,  0,  0, $00, PAL_OW_BLUE
	dbsprite  0, -1,  0,  0, $01, PAL_OW_BLUE
	dbsprite -1,  0,  0,  0, $02, PAL_OW_BLUE
	dbsprite  0,  0,  0,  0, $03, PAL_OW_BLUE

.OAMData_MagnetTrainBlue:
	db 4
	dbsprite -1, -1,  0,  0, $00, PAL_OW_BLUE | PRIORITY
	dbsprite  0, -1,  0,  0, $01, PAL_OW_BLUE | PRIORITY
	dbsprite -1,  0,  0,  0, $02, PAL_OW_BLUE | PRIORITY
	dbsprite  0,  0,  0,  0, $03, PAL_OW_BLUE | PRIORITY

.OAMData_MobileTradeCableBulge:
	db 1
	dbsprite -1, -1,  4,  4, $00, 2

.OAMData_MobileTradeSentPulse:
	db 4
	dbsprite -1, -2,  4,  0, $00, 3
	dbsprite -1, -1,  4,  0, $01, 3
	dbsprite -1,  0,  4,  0, $02, 3
	dbsprite -1,  1,  4,  0, $03, 3

.OAMData_MobileTradeOTPulse:
	db 4
	dbsprite -1, -2,  4,  0, $03, 4 | Y_FLIP
	dbsprite -1, -1,  4,  0, $02, 4 | Y_FLIP
	dbsprite -1,  0,  4,  0, $01, 4 | Y_FLIP
	dbsprite -1,  1,  4,  0, $00, 4 | Y_FLIP

.OAMData_MobileTradePing1:
	db 4
	dbsprite -1, -1,  0,  0, $00, 1
	dbsprite  0, -1,  0,  0, $00, 1 | X_FLIP
	dbsprite -1,  0,  0,  0, $00, 1 | Y_FLIP
	dbsprite  0,  0,  0,  0, $00, 1 | X_FLIP | Y_FLIP

.OAMData_MobileTradePing2:
	db 8
	dbsprite -2, -2,  4,  4, $00, 1
	dbsprite -1, -2,  4,  4, $01, 1
	dbsprite  0, -2,  4,  4, $00, 1 | X_FLIP
	dbsprite -2, -1,  4,  4, $02, 1
	dbsprite  0, -1,  4,  4, $02, 1 | X_FLIP
	dbsprite -2,  0,  4,  4, $00, 1 | Y_FLIP
	dbsprite -1,  0,  4,  4, $01, 1 | Y_FLIP
	dbsprite  0,  0,  4,  4, $00, 1 | X_FLIP | Y_FLIP

.OAMData_MobileTradePing3:
	db 12
	dbsprite -2, -2,  0,  0, $00, 1
	dbsprite -1, -2,  0,  0, $01, 1
	dbsprite -2, -1,  0,  0, $02, 1
	dbsprite  0, -2,  0,  0, $01, 1 | X_FLIP
	dbsprite  1, -2,  0,  0, $00, 1 | X_FLIP
	dbsprite  1, -1,  0,  0, $02, 1 | X_FLIP
	dbsprite -2,  0,  0,  0, $02, 1 | Y_FLIP
	dbsprite -2,  1,  0,  0, $00, 1 | Y_FLIP
	dbsprite -1,  1,  0,  0, $01, 1 | Y_FLIP
	dbsprite  1,  0,  0,  0, $02, 1 | X_FLIP | Y_FLIP
	dbsprite  0,  1,  0,  0, $01, 1 | X_FLIP | Y_FLIP
	dbsprite  1,  1,  0,  0, $00, 1 | X_FLIP | Y_FLIP

.OAMData_IntroSuicune1:
	db 36
	dbsprite  1, -3,  0,  0, $05, 0
	dbsprite  2, -3,  0,  0, $06, 0
	dbsprite  3, -3,  0,  0, $07, 0
	dbsprite -3, -2,  0,  0, $11, 0
	dbsprite -2, -2,  0,  0, $12, 0
	dbsprite -1, -2,  0,  0, $13, 0
	dbsprite  0, -2,  0,  0, $14, 0
	dbsprite  1, -2,  0,  0, $15, 0
	dbsprite  2, -2,  0,  0, $16, 0
	dbsprite  3, -2,  0,  0, $17, 0
	dbsprite -4, -1,  0,  0, $20, 0
	dbsprite -3, -1,  0,  0, $21, 0
	dbsprite -2, -1,  0,  0, $22, 0
	dbsprite -1, -1,  0,  0, $23, 0
	dbsprite  0, -1,  0,  0, $24, 0
	dbsprite  1, -1,  0,  0, $25, 0
	dbsprite  2, -1,  0,  0, $26, 0
	dbsprite  3, -1,  0,  0, $27, 0
	dbsprite -4,  0,  0,  0, $30, 0
	dbsprite -3,  0,  0,  0, $31, 0
	dbsprite -2,  0,  0,  0, $32, 0
	dbsprite -1,  0,  0,  0, $33, 0
	dbsprite  0,  0,  0,  0, $34, 0
	dbsprite  1,  0,  0,  0, $35, 0
	dbsprite  2,  0,  0,  0, $36, 0
	dbsprite -4,  1,  0,  0, $40, 0
	dbsprite -3,  1,  0,  0, $41, 0
	dbsprite -2,  1,  0,  0, $42, 0
	dbsprite -1,  1,  0,  0, $43, 0
	dbsprite  0,  1,  0,  0, $44, 0
	dbsprite  1,  1,  0,  0, $45, 0
	dbsprite  2,  1,  0,  0, $46, 0
	dbsprite  3,  1,  0,  0, $47, 0
	dbsprite -4,  2,  0,  0, $50, 0
	dbsprite -3,  2,  0,  0, $51, 0
	dbsprite  3,  2,  0,  0, $57, 0

.OAMData_IntroSuicune2:
	db 28
	dbsprite  0, -3,  0,  0, $04, 0
	dbsprite  1, -3,  0,  0, $05, 0
	dbsprite  2, -3,  0,  0, $06, 0
	dbsprite -3, -2,  0,  0, $11, 0
	dbsprite -2, -2,  0,  0, $12, 0
	dbsprite -1, -2,  0,  0, $13, 0
	dbsprite  0, -2,  0,  0, $14, 0
	dbsprite  1, -2,  0,  0, $15, 0
	dbsprite  2, -2,  0,  0, $16, 0
	dbsprite -3, -1,  0,  0, $21, 0
	dbsprite -2, -1,  0,  0, $22, 0
	dbsprite -1, -1,  0,  0, $23, 0
	dbsprite  0, -1,  0,  0, $24, 0
	dbsprite  1, -1,  0,  0, $25, 0
	dbsprite  2, -1,  0,  0, $26, 0
	dbsprite -4,  0,  0,  0, $30, 0
	dbsprite -3,  0,  0,  0, $31, 0
	dbsprite -2,  0,  0,  0, $32, 0
	dbsprite -1,  0,  0,  0, $33, 0
	dbsprite  0,  0,  0,  0, $34, 0
	dbsprite  1,  0,  0,  0, $35, 0
	dbsprite -2,  1,  0,  0, $42, 0
	dbsprite -1,  1,  0,  0, $43, 0
	dbsprite  0,  1,  0,  0, $44, 0
	dbsprite  1,  1,  0,  0, $45, 0
	dbsprite -1,  2,  0,  0, $53, 0
	dbsprite  0,  2,  0,  0, $54, 0
	dbsprite  1,  2,  0,  0, $55, 0

.OAMData_IntroSuicune3:
	db 30
	dbsprite  0, -3,  0,  0, $04, 0
	dbsprite  1, -3,  0,  0, $05, 0
	dbsprite -3, -2,  0,  0, $11, 0
	dbsprite -2, -2,  0,  0, $12, 0
	dbsprite -1, -2,  0,  0, $13, 0
	dbsprite  0, -2,  0,  0, $14, 0
	dbsprite  1, -2,  0,  0, $15, 0
	dbsprite  2, -2,  0,  0, $16, 0
	dbsprite  3, -2,  0,  0, $17, 0
	dbsprite -4, -1,  0,  0, $20, 0
	dbsprite -3, -1,  0,  0, $21, 0
	dbsprite -2, -1,  0,  0, $22, 0
	dbsprite -1, -1,  0,  0, $23, 0
	dbsprite  0, -1,  0,  0, $24, 0
	dbsprite  1, -1,  0,  0, $25, 0
	dbsprite  2, -1,  0,  0, $26, 0
	dbsprite -4,  0,  0,  0, $30, 0
	dbsprite -3,  0,  0,  0, $31, 0
	dbsprite -2,  0,  0,  0, $32, 0
	dbsprite -1,  0,  0,  0, $33, 0
	dbsprite  0,  0,  0,  0, $34, 0
	dbsprite  1,  0,  0,  0, $35, 0
	dbsprite -2,  1,  0,  0, $42, 0
	dbsprite -1,  1,  0,  0, $43, 0
	dbsprite  0,  1,  0,  0, $44, 0
	dbsprite  1,  1,  0,  0, $45, 0
	dbsprite -2,  2,  0,  0, $52, 0
	dbsprite -1,  2,  0,  0, $53, 0
	dbsprite  0,  2,  0,  0, $54, 0
	dbsprite  1,  2,  0,  0, $55, 0

.OAMData_IntroSuicune4:
	db 31
	dbsprite -3, -2,  0,  0, $11, 0
	dbsprite -2, -2,  0,  0, $12, 0
	dbsprite -1, -2,  0,  0, $13, 0
	dbsprite  0, -2,  0,  0, $14, 0
	dbsprite  1, -2,  0,  0, $15, 0
	dbsprite  2, -2,  0,  0, $16, 0
	dbsprite  3, -2,  0,  0, $17, 0
	dbsprite -4, -1,  0,  0, $20, 0
	dbsprite -3, -1,  0,  0, $21, 0
	dbsprite -2, -1,  0,  0, $22, 0
	dbsprite -1, -1,  0,  0, $23, 0
	dbsprite  0, -1,  0,  0, $24, 0
	dbsprite  1, -1,  0,  0, $25, 0
	dbsprite  2, -1,  0,  0, $26, 0
	dbsprite  3, -1,  0,  0, $27, 0
	dbsprite -4,  0,  0,  0, $30, 0
	dbsprite -3,  0,  0,  0, $31, 0
	dbsprite -2,  0,  0,  0, $32, 0
	dbsprite -1,  0,  0,  0, $33, 0
	dbsprite  0,  0,  0,  0, $34, 0
	dbsprite  1,  0,  0,  0, $35, 0
	dbsprite  2,  0,  0,  0, $36, 0
	dbsprite -3,  1,  0,  0, $41, 0
	dbsprite -2,  1,  0,  0, $42, 0
	dbsprite -1,  1,  0,  0, $43, 0
	dbsprite  0,  1,  0,  0, $44, 0
	dbsprite  1,  1,  0,  0, $45, 0
	dbsprite -3,  2,  0,  0, $51, 0
	dbsprite -2,  2,  0,  0, $52, 0
	dbsprite  0,  2,  0,  0, $54, 0
	dbsprite  1,  2,  0,  0, $55, 0

.OAMData_IntroPichu:
	db 25
	dbsprite -3, -3,  4,  4, $00, 1 | VRAM_BANK_1
	dbsprite -2, -3,  4,  4, $01, 1 | VRAM_BANK_1
	dbsprite -1, -3,  4,  4, $02, 1 | VRAM_BANK_1
	dbsprite  0, -3,  4,  4, $03, 1 | VRAM_BANK_1
	dbsprite  1, -3,  4,  4, $04, 1 | VRAM_BANK_1
	dbsprite -3, -2,  4,  4, $10, 1 | VRAM_BANK_1
	dbsprite -2, -2,  4,  4, $11, 1 | VRAM_BANK_1
	dbsprite -1, -2,  4,  4, $12, 1 | VRAM_BANK_1
	dbsprite  0, -2,  4,  4, $13, 1 | VRAM_BANK_1
	dbsprite  1, -2,  4,  4, $14, 1 | VRAM_BANK_1
	dbsprite -3, -1,  4,  4, $20, 1 | VRAM_BANK_1
	dbsprite -2, -1,  4,  4, $21, 1 | VRAM_BANK_1
	dbsprite -1, -1,  4,  4, $22, 1 | VRAM_BANK_1
	dbsprite  0, -1,  4,  4, $23, 1 | VRAM_BANK_1
	dbsprite  1, -1,  4,  4, $24, 1 | VRAM_BANK_1
	dbsprite -3,  0,  4,  4, $30, 1 | VRAM_BANK_1
	dbsprite -2,  0,  4,  4, $31, 1 | VRAM_BANK_1
	dbsprite -1,  0,  4,  4, $32, 1 | VRAM_BANK_1
	dbsprite  0,  0,  4,  4, $33, 1 | VRAM_BANK_1
	dbsprite  1,  0,  4,  4, $34, 1 | VRAM_BANK_1
	dbsprite -3,  1,  4,  4, $40, 1 | VRAM_BANK_1
	dbsprite -2,  1,  4,  4, $41, 1 | VRAM_BANK_1
	dbsprite -1,  1,  4,  4, $42, 1 | VRAM_BANK_1
	dbsprite  0,  1,  4,  4, $43, 1 | VRAM_BANK_1
	dbsprite  1,  1,  4,  4, $44, 1 | VRAM_BANK_1

.OAMData_IntroWooper:
	db 16
	dbsprite -3, -2,  4,  0, $00, 2 | VRAM_BANK_1
	dbsprite -2, -2,  4,  0, $01, 2 | VRAM_BANK_1
	dbsprite -1, -2,  4,  0, $02, 2 | VRAM_BANK_1
	dbsprite  0, -2,  4,  0, $03, 2 | VRAM_BANK_1
	dbsprite -3, -1,  4,  0, $04, 2 | VRAM_BANK_1
	dbsprite -2, -1,  4,  0, $05, 2 | VRAM_BANK_1
	dbsprite -1, -1,  4,  0, $06, 2 | VRAM_BANK_1
	dbsprite  0, -1,  4,  0, $07, 2 | VRAM_BANK_1
	dbsprite -3,  0,  4,  0, $08, 2 | VRAM_BANK_1
	dbsprite -2,  0,  4,  0, $09, 2 | VRAM_BANK_1
	dbsprite -1,  0,  4,  0, $0a, 2 | VRAM_BANK_1
	dbsprite  0,  0,  4,  0, $0b, 2 | VRAM_BANK_1
	dbsprite -3,  1,  4,  0, $0c, 2 | VRAM_BANK_1
	dbsprite -2,  1,  4,  0, $0d, 2 | VRAM_BANK_1
	dbsprite -1,  1,  4,  0, $0e, 2 | VRAM_BANK_1
	dbsprite  0,  1,  4,  0, $0f, 2 | VRAM_BANK_1

.OAMData_IntroUnown1:
	db 1
	dbsprite -1, -1,  4,  4, $00, 0

.OAMData_IntroUnown2:
	db 3
	dbsprite -1,  0,  0,  0, $00, 0
	dbsprite -1, -1,  0,  0, $01, 0
	dbsprite  0, -1,  0,  0, $02, 0

.OAMData_IntroUnown3:
	db 7
	dbsprite -2,  1,  0,  0, $00, 0
	dbsprite -2,  0,  0,  0, $01, 0
	dbsprite -2, -1,  0,  0, $02, 0
	dbsprite -1, -1,  0,  0, $03, 0
	dbsprite -1, -2,  0,  0, $04, 0
	dbsprite  0, -2,  0,  0, $05, 0
	dbsprite  1, -2,  0,  0, $06, 0

.OAMData_IntroUnownF2_2:
	db 8
	dbsprite -2, -1,  0,  0, $00, 0
	dbsprite -1, -1,  0,  0, $01, 0
	dbsprite  0, -1,  0,  0, $01, 0 | X_FLIP
	dbsprite  1, -1,  0,  0, $00, 0 | X_FLIP
	dbsprite -2,  0,  0,  0, $00, 0 | Y_FLIP
	dbsprite -1,  0,  0,  0, $01, 0 | Y_FLIP
	dbsprite  0,  0,  0,  0, $01, 0 | X_FLIP | Y_FLIP
	dbsprite  1,  0,  0,  0, $00, 0 | X_FLIP | Y_FLIP

.OAMData_IntroUnownF2_3:
	db 12
	dbsprite -1, -3,  0,  0, $00, 0
	dbsprite -1, -2,  0,  0, $01, 0
	dbsprite -1, -1,  0,  0, $02, 0
	dbsprite  0, -3,  0,  0, $00, 0 | X_FLIP
	dbsprite  0, -2,  0,  0, $01, 0 | X_FLIP
	dbsprite  0, -1,  0,  0, $02, 0 | X_FLIP
	dbsprite -1,  0,  0,  0, $02, 0 | Y_FLIP
	dbsprite -1,  1,  0,  0, $01, 0 | Y_FLIP
	dbsprite -1,  2,  0,  0, $00, 0 | Y_FLIP
	dbsprite  0,  0,  0,  0, $02, 0 | X_FLIP | Y_FLIP
	dbsprite  0,  1,  0,  0, $01, 0 | X_FLIP | Y_FLIP
	dbsprite  0,  2,  0,  0, $00, 0 | X_FLIP | Y_FLIP

.OAMData_IntroUnownF2_4_5:
	db 20
	dbsprite -2, -3,  0,  4, $00, 0
	dbsprite -1, -3,  0,  4, $01, 0
	dbsprite  0, -3,  0,  4, $02, 0
	dbsprite  1, -3,  0,  4, $03, 0
	dbsprite -2, -2,  0,  4, $04, 0
	dbsprite -1, -2,  0,  4, $05, 0
	dbsprite  0, -2,  0,  4, $06, 0
	dbsprite  1, -2,  0,  4, $07, 0
	dbsprite -2, -1,  0,  4, $08, 0
	dbsprite -1, -1,  0,  4, $09, 0
	dbsprite  0, -1,  0,  4, $0a, 0
	dbsprite  1, -1,  0,  4, $0b, 0
	dbsprite -2,  0,  0,  4, $0c, 0
	dbsprite -1,  0,  0,  4, $0d, 0
	dbsprite  0,  0,  0,  4, $0e, 0
	dbsprite  1,  0,  0,  4, $0f, 0
	dbsprite -2,  1,  0,  4, $10, 0
	dbsprite -1,  1,  0,  4, $11, 0
	dbsprite  0,  1,  0,  4, $12, 0
	dbsprite  1,  1,  0,  4, $13, 0

.OAMData_IntroSuicuneAway:
	db 20
	dbsprite   1,  0,  0,  0, $00, 1 | PRIORITY
	dbsprite   2,  1,  0,  0, $00, 1 | PRIORITY
	dbsprite   3,  2,  0,  0, $00, 1 | PRIORITY
	dbsprite   4,  3,  0,  0, $00, 1 | PRIORITY
	dbsprite   5,  4,  0,  0, $00, 1 | PRIORITY
	dbsprite   6,  3,  0,  0, $00, 1 | PRIORITY
	dbsprite   7,  2,  0,  0, $00, 1 | PRIORITY
	dbsprite   8,  1,  0,  0, $00, 1 | PRIORITY
	dbsprite   9,  0,  0,  0, $00, 1 | PRIORITY
	dbsprite  10,  1,  0,  0, $00, 1 | PRIORITY
	dbsprite  11,  2,  0,  0, $00, 1 | PRIORITY
	dbsprite  12,  3,  0,  0, $00, 1 | PRIORITY
	dbsprite  13,  4,  0,  0, $00, 1 | PRIORITY
	dbsprite  14,  3,  0,  0, $00, 1 | PRIORITY
	dbsprite  15,  2,  0,  0, $00, 1 | PRIORITY
	dbsprite  16,  1,  0,  0, $00, 1 | PRIORITY
	dbsprite -15,  0,  0,  0, $00, 1 | PRIORITY
	dbsprite -14,  1,  0,  0, $00, 1 | PRIORITY
	dbsprite -13,  2,  0,  0, $00, 1 | PRIORITY
	dbsprite -12,  3,  0,  0, $00, 1 | PRIORITY

.OAMData_Celebi:
	db 4
	dbsprite -1, -1,  0,  0, $00, PAL_OW_GREEN
	dbsprite  0, -1,  0,  0, $01, PAL_OW_GREEN
	dbsprite -1,  0,  0,  0, $02, PAL_OW_GREEN
	dbsprite  0,  0,  0,  0, $03, PAL_OW_GREEN

.OAMData_GameFreakLogo1_3:
	db 9
	dbsprite -2, -2,  4,  0, $00, 1
	dbsprite -1, -2,  4,  0, $01, 1
	dbsprite  0, -2,  4,  0, $02, 1
	dbsprite -2, -1,  4,  0, $10, 1
	dbsprite -1, -1,  4,  0, $11, 1
	dbsprite  0, -1,  4,  0, $12, 1
	dbsprite -2,  0,  4,  0, $20, 1
	dbsprite -1,  0,  4,  0, $21, 1
	dbsprite  0,  0,  4,  0, $22, 1

.OAMData_GameFreakLogo4_11:
	db 24
	dbsprite -2, -5,  4,  0, $00, 1
	dbsprite -1, -5,  4,  0, $01, 1
	dbsprite  0, -5,  4,  0, $02, 1
	dbsprite  1, -5,  4,  0, $03, 1
	dbsprite -2, -4,  4,  0, $10, 1
	dbsprite -1, -4,  4,  0, $11, 1
	dbsprite  0, -4,  4,  0, $12, 1
	dbsprite  1, -4,  4,  0, $13, 1
	dbsprite -2, -3,  4,  0, $20, 1
	dbsprite -1, -3,  4,  0, $21, 1
	dbsprite  0, -3,  4,  0, $22, 1
	dbsprite  1, -3,  4,  0, $23, 1
	dbsprite -2, -2,  4,  0, $30, 1
	dbsprite -1, -2,  4,  0, $31, 1
	dbsprite  0, -2,  4,  0, $32, 1
	dbsprite  1, -2,  4,  0, $33, 1
	dbsprite -2, -1,  4,  0, $40, 1
	dbsprite -1, -1,  4,  0, $41, 1
	dbsprite  0, -1,  4,  0, $42, 1
	dbsprite  1, -1,  4,  0, $43, 1
	dbsprite -2,  0,  4,  0, $50, 1
	dbsprite -1,  0,  4,  0, $51, 1
	dbsprite  0,  0,  4,  0, $52, 1
	dbsprite  1,  0,  4,  0, $53, 1
