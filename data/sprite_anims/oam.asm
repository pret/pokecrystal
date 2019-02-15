SpriteAnimOAMData:
; entries correspond to SPRITE_ANIM_OAMSET_* constants
	; vtile offset, data pointer
	dbw $00, .OAMData_RedWalk                  ; SPRITE_ANIM_OAMSET_RED_WALK_1
	dbw $04, .OAMData_RedWalk                  ; SPRITE_ANIM_OAMSET_RED_WALK_2
	dbw $4c, .OAMData_1x1_Palette0             ; SPRITE_ANIM_OAMSET_GS_INTRO_BUBBLE_1
	dbw $5c, .OAMData_1x1_Palette0             ; SPRITE_ANIM_OAMSET_GS_INTRO_BUBBLE_2
	dbw $6c, .OAMData_GSIntroShellder          ; SPRITE_ANIM_OAMSET_GS_INTRO_SHELLDER_1
	dbw $6e, .OAMData_GSIntroShellder          ; SPRITE_ANIM_OAMSET_GS_INTRO_SHELLDER_2
	dbw $2d, .OAMData_GSIntroMagikarp          ; SPRITE_ANIM_OAMSET_GS_INTRO_MAGIKARP_1
	dbw $4d, .OAMData_GSIntroMagikarp          ; SPRITE_ANIM_OAMSET_GS_INTRO_MAGIKARP_2
	dbw $60, .OAMData_GSIntroLapras            ; SPRITE_ANIM_OAMSET_GS_INTRO_LAPRAS_1
	dbw $00, .OAMData_GSIntroLapras            ; SPRITE_ANIM_OAMSET_GS_INTRO_LAPRAS_2
	dbw $00, .OAMData_GSIntroLapras            ; SPRITE_ANIM_OAMSET_GS_INTRO_LAPRAS_3
	dbw $06, .OAMData_GSIntroLapras            ; SPRITE_ANIM_OAMSET_GS_INTRO_LAPRAS_4
	dbw $0c, .OAMData_GSIntroNote              ; SPRITE_ANIM_OAMSET_GS_INTRO_NOTE
	dbw $0d, .OAMData_1x1_Palette0             ; SPRITE_ANIM_OAMSET_GS_INTRO_INVISIBLE_NOTE
	dbw $00, .OAMData_GSIntroJigglypuffPikachu ; SPRITE_ANIM_OAMSET_GS_INTRO_JIGGLYPUFF_1
	dbw $04, .OAMData_GSIntroJigglypuffPikachu ; SPRITE_ANIM_OAMSET_GS_INTRO_JIGGLYPUFF_2
	dbw $08, .OAMData_GSIntroJigglypuffPikachu ; SPRITE_ANIM_OAMSET_GS_INTRO_JIGGLYPUFF_3
	dbw $40, .OAMData_GSIntroJigglypuffPikachu ; SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_1
	dbw $44, .OAMData_GSIntroJigglypuffPikachu ; SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_2
	dbw $48, .OAMData_GSIntroJigglypuffPikachu ; SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_3
	dbw $4c, .OAMData_GSIntroJigglypuffPikachu ; SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_4
	dbw $80, .OAMData_GSIntroPikachuTail       ; SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_TAIL_1
	dbw $85, .OAMData_GSIntroPikachuTail       ; SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_TAIL_2
	dbw $8a, .OAMData_GSIntroPikachuTail       ; SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_TAIL_3
	dbw $00, .OAMData_IntroUnownF2_1           ; SPRITE_ANIM_OAMSET_GS_INTRO_SMALL_FIREBALL
	dbw $01, .OAMData_TradePoofBubble          ; SPRITE_ANIM_OAMSET_GS_INTRO_MED_FIREBALL
	dbw $09, .OAMData_GSIntroBigFireball       ; SPRITE_ANIM_OAMSET_GS_INTRO_BIG_FIREBALL
	dbw $10, .OAMData_GSIntroStarter           ; SPRITE_ANIM_OAMSET_GS_INTRO_CHIKORITA
	dbw $29, .OAMData_GSIntroStarter           ; SPRITE_ANIM_OAMSET_GS_INTRO_CYNDAQUIL
	dbw $42, .OAMData_GSIntroStarter           ; SPRITE_ANIM_OAMSET_GS_INTRO_TOTODILE
	dbw $f8, .OAMData_GSTitleTrail             ; SPRITE_ANIM_OAMSET_GS_TITLE_TRAIL_1
	dbw $fa, .OAMData_GSTitleTrail             ; SPRITE_ANIM_OAMSET_GS_TITLE_TRAIL_2
	dbw $00, .OAMData_TextEntryCursor          ; SPRITE_ANIM_OAMSET_TEXT_ENTRY_CURSOR
	dbw $00, .OAMData_TextEntryCursorBig       ; SPRITE_ANIM_OAMSET_TEXT_ENTRY_CURSOR_BIG
	dbw $00, .OAMData_GSIntroGameFreakLogo     ; SPRITE_ANIM_OAMSET_GS_INTRO_GAMEFREAK_LOGO
	dbw $0f, .OAMData_GSIntroStar              ; SPRITE_ANIM_OAMSET_GS_INTRO_STAR
	dbw $11, .OAMData_1x1_Palette0             ; SPRITE_ANIM_OAMSET_GS_INTRO_SPARKLE_1
	dbw $12, .OAMData_1x1_Palette0             ; SPRITE_ANIM_OAMSET_GS_INTRO_SPARKLE_2
	dbw $13, .OAMData_1x1_Palette0             ; SPRITE_ANIM_OAMSET_GS_INTRO_SPARKLE_3
	dbw $00, .OAMData_SlotsGolem               ; SPRITE_ANIM_OAMSET_SLOTS_GOLEM_1
	dbw $08, .OAMData_SlotsGolem               ; SPRITE_ANIM_OAMSET_SLOTS_GOLEM_2
	dbw $10, .OAMData_SlotsChansey1            ; SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_1
	dbw $10, .OAMData_SlotsChansey2            ; SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_2
	dbw $10, .OAMData_SlotsChansey3            ; SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_3
	dbw $10, .OAMData_SlotsChansey4            ; SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_4
	dbw $10, .OAMData_SlotsChansey5            ; SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_5
	dbw $3a, .OAMData_1x1_Palette0             ; SPRITE_ANIM_OAMSET_SLOTS_EGG
	dbw $00, .OAMData_RedWalk                  ; SPRITE_ANIM_OAMSET_STILL_CURSOR
	dbw $00, .OAMData_TradePokeBall1           ; SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1
	dbw $02, .OAMData_MagnetTrainRed           ; SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_2
	dbw $06, .OAMData_TradePoofBubble          ; SPRITE_ANIM_OAMSET_TRADE_POOF_1
	dbw $0a, .OAMData_TradePoofBubble          ; SPRITE_ANIM_OAMSET_TRADE_POOF_2
	dbw $0e, .OAMData_TradePoofBubble          ; SPRITE_ANIM_OAMSET_TRADE_POOF_3
	dbw $12, .OAMData_TradeTubeBulge           ; SPRITE_ANIM_OAMSET_TRADE_TUBE_BULGE_1
	dbw $13, .OAMData_TradeTubeBulge           ; SPRITE_ANIM_OAMSET_TRADE_TUBE_BULGE_2
	dbw $00, .OAMData_RedWalk                  ; SPRITE_ANIM_OAMSET_TRADEMON_ICON_1
	dbw $04, .OAMData_RedWalk                  ; SPRITE_ANIM_OAMSET_TRADEMON_ICON_2
	dbw $10, .OAMData_TradePoofBubble          ; SPRITE_ANIM_OAMSET_TRADEMON_BUBBLE
	dbw $00, .OAMData_MagnetTrainRed           ; SPRITE_ANIM_OAMSET_EVOLUTION_BALL_OF_LIGHT_1
	dbw $04, .OAMData_1x1_Palette0             ; SPRITE_ANIM_OAMSET_EVOLUTION_BALL_OF_LIGHT_2
	dbw $00, .OAMData_RadioTuningKnob          ; SPRITE_ANIM_OAMSET_RADIO_TUNING_KNOB
	dbw $00, .OAMData_PartyMonWithMail1        ; SPRITE_ANIM_OAMSET_PARTY_MON_WITH_MAIL_1
	dbw $00, .OAMData_PartyMonWithMail2        ; SPRITE_ANIM_OAMSET_PARTY_MON_WITH_MAIL_2
	dbw $00, .OAMData_PartyMonWithItem1        ; SPRITE_ANIM_OAMSET_PARTY_MON_WITH_ITEM_1
	dbw $00, .OAMData_PartyMonWithItem2        ; SPRITE_ANIM_OAMSET_PARTY_MON_WITH_ITEM_2
	dbw $00, .OAMData_MagnetTrainRed           ; SPRITE_ANIM_OAMSET_MAGNET_TRAIN_RED_1
	dbw $04, .OAMData_MagnetTrainRed           ; SPRITE_ANIM_OAMSET_MAGNET_TRAIN_RED_2
	dbw $00, .OAMData_Unused43_4A              ; SPRITE_ANIM_OAMSET_UNUSED_43
	dbw $30, .OAMData_Unused43_4A              ; SPRITE_ANIM_OAMSET_UNUSED_44
	dbw $03, .OAMData_Unused43_4A              ; SPRITE_ANIM_OAMSET_UNUSED_45
	dbw $33, .OAMData_Unused43_4A              ; SPRITE_ANIM_OAMSET_UNUSED_46
	dbw $06, .OAMData_Unused43_4A              ; SPRITE_ANIM_OAMSET_UNUSED_47
	dbw $36, .OAMData_Unused43_4A              ; SPRITE_ANIM_OAMSET_UNUSED_48
	dbw $09, .OAMData_Unused43_4A              ; SPRITE_ANIM_OAMSET_UNUSED_49
	dbw $39, .OAMData_Unused43_4A              ; SPRITE_ANIM_OAMSET_UNUSED_4A
	dbw $0c, .OAMData_Unused4B                 ; SPRITE_ANIM_OAMSET_UNUSED_4B
	dbw $0c, .OAMData_Unused4C                 ; SPRITE_ANIM_OAMSET_UNUSED_4C
	dbw $3c, .OAMData_1x1_Palette0             ; SPRITE_ANIM_OAMSET_UNUSED_4D
	dbw $3e, .OAMData_1x1_Palette0             ; SPRITE_ANIM_OAMSET_UNUSED_4E
	dbw $00, .OAMData_Leaf                     ; SPRITE_ANIM_OAMSET_LEAF
	dbw $00, .OAMData_Tree                     ; SPRITE_ANIM_OAMSET_TREE_1
	dbw $00, .OAMData_CutTree2                 ; SPRITE_ANIM_OAMSET_CUT_TREE_2
	dbw $00, .OAMData_CutTree3                 ; SPRITE_ANIM_OAMSET_CUT_TREE_3
	dbw $00, .OAMData_CutTree4                 ; SPRITE_ANIM_OAMSET_CUT_TREE_4
	dbw $00, .OAMData_1x1_Palette0             ; SPRITE_ANIM_OAMSET_EGG_CRACK
	dbw $01, .OAMData_1x1_Palette0             ; SPRITE_ANIM_OAMSET_EGG_HATCH
	dbw $00, .OAMData_GSIntroHoOh1             ; SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_1
	dbw $00, .OAMData_GSIntroHoOh2             ; SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_2
	dbw $00, .OAMData_GSIntroHoOh3             ; SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_3
	dbw $00, .OAMData_GSIntroHoOh4             ; SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_4
	dbw $00, .OAMData_GSIntroHoOh5             ; SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_5
	dbw $04, .OAMData_Tree                     ; SPRITE_ANIM_OAMSET_HEADBUTT_TREE_2
	dbw $00, .OAMData_EZChatCursor1            ; SPRITE_ANIM_OAMSET_EZCHAT_CURSOR_1
	dbw $00, .OAMData_EZChatCursor2            ; SPRITE_ANIM_OAMSET_EZCHAT_CURSOR_2
	dbw $00, .OAMData_EZChatCursor3            ; SPRITE_ANIM_OAMSET_EZCHAT_CURSOR_3
	dbw $00, .OAMData_EZChatCursor4            ; SPRITE_ANIM_OAMSET_EZCHAT_CURSOR_4
	dbw $00, .OAMData_EZChatCursor5            ; SPRITE_ANIM_OAMSET_EZCHAT_CURSOR_5
	dbw $00, .OAMData_EZChatCursor6            ; SPRITE_ANIM_OAMSET_EZCHAT_CURSOR_6
	dbw $00, .OAMData_EZChatCursor7            ; SPRITE_ANIM_OAMSET_EZCHAT_CURSOR_7
	dbw $00, .OAMData_BlueWalk                 ; SPRITE_ANIM_OAMSET_BLUE_WALK_1
	dbw $04, .OAMData_BlueWalk                 ; SPRITE_ANIM_OAMSET_BLUE_WALK_2
	dbw $00, .OAMData_MagnetTrainBlue          ; SPRITE_ANIM_OAMSET_MAGNET_TRAIN_BLUE_1
	dbw $04, .OAMData_MagnetTrainBlue          ; SPRITE_ANIM_OAMSET_MAGNET_TRAIN_BLUE_2
	dbw $20, .OAMData_MobileTradeCableBulge    ; SPRITE_ANIM_OAMSET_MOBILE_TRADE_CABLE_BULGE_1
	dbw $21, .OAMData_MobileTradeCableBulge    ; SPRITE_ANIM_OAMSET_MOBILE_TRADE_CABLE_BULGE_2
	dbw $22, .OAMData_MobileTradePing1         ; SPRITE_ANIM_OAMSET_MOBILE_TRADE_PING_1
	dbw $23, .OAMData_MobileTradePing2         ; SPRITE_ANIM_OAMSET_MOBILE_TRADE_PING_2
	dbw $27, .OAMData_MobileTradePing3         ; SPRITE_ANIM_OAMSET_MOBILE_TRADE_PING_3
	dbw $2a, .OAMData_MobileTradeSentPulse     ; SPRITE_ANIM_OAMSET_MOBILE_TRADE_SENT_PULSE
	dbw $2a, .OAMData_MobileTradeOTPulse       ; SPRITE_ANIM_OAMSET_MOBILE_TRADE_OT_PULSE
	dbw $00, .OAMData_IntroSuicune1            ; SPRITE_ANIM_OAMSET_INTRO_SUICUNE_1
	dbw $08, .OAMData_IntroSuicune2            ; SPRITE_ANIM_OAMSET_INTRO_SUICUNE_2
	dbw $60, .OAMData_IntroSuicune3            ; SPRITE_ANIM_OAMSET_INTRO_SUICUNE_3
	dbw $68, .OAMData_IntroSuicune4            ; SPRITE_ANIM_OAMSET_INTRO_SUICUNE_4
	dbw $00, .OAMData_IntroPichu               ; SPRITE_ANIM_OAMSET_INTRO_PICHU_1
	dbw $05, .OAMData_IntroPichu               ; SPRITE_ANIM_OAMSET_INTRO_PICHU_2
	dbw $0a, .OAMData_IntroPichu               ; SPRITE_ANIM_OAMSET_INTRO_PICHU_3
	dbw $50, .OAMData_IntroWooper              ; SPRITE_ANIM_OAMSET_INTRO_WOOPER
	dbw $00, .OAMData_IntroUnown1              ; SPRITE_ANIM_OAMSET_INTRO_UNOWN_1
	dbw $01, .OAMData_IntroUnown2              ; SPRITE_ANIM_OAMSET_INTRO_UNOWN_2
	dbw $04, .OAMData_IntroUnown3              ; SPRITE_ANIM_OAMSET_INTRO_UNOWN_3
	dbw $00, .OAMData_IntroUnownF2_1           ; SPRITE_ANIM_OAMSET_INTRO_UNOWN_F_2_1
	dbw $01, .OAMData_IntroUnownF2_2           ; SPRITE_ANIM_OAMSET_INTRO_UNOWN_F_2_2
	dbw $03, .OAMData_IntroUnownF2_3           ; SPRITE_ANIM_OAMSET_INTRO_UNOWN_F_2_3
	dbw $08, .OAMData_IntroUnownF2_4_5         ; SPRITE_ANIM_OAMSET_INTRO_UNOWN_F_2_4
	dbw $1c, .OAMData_IntroUnownF2_4_5         ; SPRITE_ANIM_OAMSET_INTRO_UNOWN_F_2_5
	dbw $80, .OAMData_IntroSuicuneAway         ; SPRITE_ANIM_OAMSET_INTRO_SUICUNE_AWAY
	dbw $00, .OAMData_Celebi                   ; SPRITE_ANIM_OAMSET_CELEBI_1
	dbw $04, .OAMData_Celebi                   ; SPRITE_ANIM_OAMSET_CELEBI_2
	dbw $d0, .OAMData_GameFreakLogo1_3         ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_1
	dbw $d3, .OAMData_GameFreakLogo1_3         ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_2
	dbw $d6, .OAMData_GameFreakLogo1_3         ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_3
	dbw $6c, .OAMData_GameFreakLogo4_11        ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_4
	dbw $68, .OAMData_GameFreakLogo4_11        ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_5
	dbw $64, .OAMData_GameFreakLogo4_11        ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_6
	dbw $60, .OAMData_GameFreakLogo4_11        ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_7
	dbw $0c, .OAMData_GameFreakLogo4_11        ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_8
	dbw $08, .OAMData_GameFreakLogo4_11        ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_9
	dbw $04, .OAMData_GameFreakLogo4_11        ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_10
	dbw $00, .OAMData_GameFreakLogo4_11        ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_11

.OAMData_1x1_Palette0:
	db 1
	dsprite -1,  4, -1,  4, $00, 0

.OAMData_GSIntroShellder:
	db 4
	dsprite -1,  0, -1,  0, $00, 0
	dsprite -1,  0,  0,  0, $01, 0
	dsprite  0,  0, -1,  0, $10, 0
	dsprite  0,  0,  0,  0, $11, 0

.OAMData_GSIntroStar:
	db 4
	dsprite -1,  0, -1,  0, $00, 0
	dsprite -1,  0,  0,  0, $00, 0 | X_FLIP
	dsprite  0,  0, -1,  0, $01, 0
	dsprite  0,  0,  0,  0, $01, 0 | X_FLIP

.OAMData_TradePokeBall1:
	db 4
	dsprite -1,  0, -1,  0, $00, 0 | PRIORITY
	dsprite -1,  0,  0,  0, $00, 0 | X_FLIP | PRIORITY
	dsprite  0,  0, -1,  0, $01, 0 | PRIORITY
	dsprite  0,  0,  0,  0, $01, 0 | X_FLIP | PRIORITY

.OAMData_IntroUnownF2_1:
	db 4
	dsprite -1,  0, -1,  0, $00, 0
	dsprite -1,  0,  0,  0, $00, 0 | X_FLIP
	dsprite  0,  0, -1,  0, $00, 0 | Y_FLIP
	dsprite  0,  0,  0,  0, $00, 0 | X_FLIP | Y_FLIP

.OAMData_TradeTubeBulge:
	db 4
	dsprite -1,  0, -1,  0, $00, 7
	dsprite -1,  0,  0,  0, $00, 7 | X_FLIP
	dsprite  0,  0, -1,  0, $00, 7 | Y_FLIP
	dsprite  0,  0,  0,  0, $00, 7 | X_FLIP | Y_FLIP

; unused
	db 4
	dsprite -1,  0, -1,  0, $00, 0 | PRIORITY
	dsprite -1,  0,  0,  0, $00, 0 | X_FLIP | PRIORITY
	dsprite  0,  0, -1,  0, $00, 0 | Y_FLIP | PRIORITY
	dsprite  0,  0,  0,  0, $00, 0 | X_FLIP | Y_FLIP | PRIORITY

.OAMData_TradePoofBubble:
	db 16
	dsprite -2,  0, -2,  0, $00, 0
	dsprite -2,  0, -1,  0, $01, 0
	dsprite -1,  0, -2,  0, $02, 0
	dsprite -1,  0, -1,  0, $03, 0
	dsprite -2,  0,  0,  0, $01, 0 | X_FLIP
	dsprite -2,  0,  1,  0, $00, 0 | X_FLIP
	dsprite -1,  0,  0,  0, $03, 0 | X_FLIP
	dsprite -1,  0,  1,  0, $02, 0 | X_FLIP
	dsprite  0,  0, -2,  0, $02, 0 | Y_FLIP
	dsprite  0,  0, -1,  0, $03, 0 | Y_FLIP
	dsprite  1,  0, -2,  0, $00, 0 | Y_FLIP
	dsprite  1,  0, -1,  0, $01, 0 | Y_FLIP
	dsprite  0,  0,  0,  0, $03, 0 | X_FLIP | Y_FLIP
	dsprite  0,  0,  1,  0, $02, 0 | X_FLIP | Y_FLIP
	dsprite  1,  0,  0,  0, $01, 0 | X_FLIP | Y_FLIP
	dsprite  1,  0,  1,  0, $00, 0 | X_FLIP | Y_FLIP

.OAMData_GSIntroBigFireball:
	db 36
	dsprite -3,  0, -3,  0, $00, 0
	dsprite -3,  0, -2,  0, $01, 0
	dsprite -3,  0, -1,  0, $02, 0
	dsprite -2,  0, -3,  0, $03, 0
	dsprite -2,  0, -2,  0, $04, 0
	dsprite -2,  0, -1,  0, $05, 0
	dsprite -1,  0, -3,  0, $06, 0
	dsprite -1,  0, -2,  0, $05, 0
	dsprite -1,  0, -1,  0, $05, 0
	dsprite -3,  0,  0,  0, $02, 0 | X_FLIP
	dsprite -3,  0,  1,  0, $01, 0 | X_FLIP
	dsprite -3,  0,  2,  0, $00, 0 | X_FLIP
	dsprite -2,  0,  0,  0, $05, 0 | X_FLIP
	dsprite -2,  0,  1,  0, $04, 0 | X_FLIP
	dsprite -2,  0,  2,  0, $03, 0 | X_FLIP
	dsprite -1,  0,  0,  0, $05, 0 | X_FLIP
	dsprite -1,  0,  1,  0, $05, 0 | X_FLIP
	dsprite -1,  0,  2,  0, $06, 0 | X_FLIP
	dsprite  0,  0, -3,  0, $06, 0 | Y_FLIP
	dsprite  0,  0, -2,  0, $05, 0 | Y_FLIP
	dsprite  0,  0, -1,  0, $05, 0 | Y_FLIP
	dsprite  1,  0, -3,  0, $03, 0 | Y_FLIP
	dsprite  1,  0, -2,  0, $04, 0 | Y_FLIP
	dsprite  1,  0, -1,  0, $05, 0 | Y_FLIP
	dsprite  2,  0, -3,  0, $00, 0 | Y_FLIP
	dsprite  2,  0, -2,  0, $01, 0 | Y_FLIP
	dsprite  2,  0, -1,  0, $02, 0 | Y_FLIP
	dsprite  0,  0,  0,  0, $05, 0 | X_FLIP | Y_FLIP
	dsprite  0,  0,  1,  0, $05, 0 | X_FLIP | Y_FLIP
	dsprite  0,  0,  2,  0, $06, 0 | X_FLIP | Y_FLIP
	dsprite  1,  0,  0,  0, $05, 0 | X_FLIP | Y_FLIP
	dsprite  1,  0,  1,  0, $04, 0 | X_FLIP | Y_FLIP
	dsprite  1,  0,  2,  0, $03, 0 | X_FLIP | Y_FLIP
	dsprite  2,  0,  0,  0, $02, 0 | X_FLIP | Y_FLIP
	dsprite  2,  0,  1,  0, $01, 0 | X_FLIP | Y_FLIP
	dsprite  2,  0,  2,  0, $00, 0 | X_FLIP | Y_FLIP

.OAMData_Unused43_4A:
	db 9
	dsprite -2,  4, -2,  4, $00, 0
	dsprite -2,  4, -1,  4, $01, 0
	dsprite -2,  4,  0,  4, $02, 0
	dsprite -1,  4, -2,  4, $10, 0
	dsprite -1,  4, -1,  4, $11, 0
	dsprite -1,  4,  0,  4, $12, 0
	dsprite  0,  4, -2,  4, $20, 0
	dsprite  0,  4, -1,  4, $21, 0
	dsprite  0,  4,  0,  4, $22, 0

.OAMData_GSIntroJigglypuffPikachu:
	db 16
	dsprite -2,  0, -2,  0, $00, 0
	dsprite -2,  0, -1,  0, $01, 0
	dsprite -2,  0,  0,  0, $02, 0
	dsprite -2,  0,  1,  0, $03, 0
	dsprite -1,  0, -2,  0, $10, 0
	dsprite -1,  0, -1,  0, $11, 0
	dsprite -1,  0,  0,  0, $12, 0
	dsprite -1,  0,  1,  0, $13, 0
	dsprite  0,  0, -2,  0, $20, 0
	dsprite  0,  0, -1,  0, $21, 0
	dsprite  0,  0,  0,  0, $22, 0
	dsprite  0,  0,  1,  0, $23, 0
	dsprite  1,  0, -2,  0, $30, 0
	dsprite  1,  0, -1,  0, $31, 0
	dsprite  1,  0,  0,  0, $32, 0
	dsprite  1,  0,  1,  0, $33, 0

.OAMData_GSIntroStarter:
	db 25
	dsprite -3,  4, -3,  4, $00, 0
	dsprite -2,  4, -3,  4, $01, 0
	dsprite -1,  4, -3,  4, $02, 0
	dsprite  0,  4, -3,  4, $03, 0
	dsprite  1,  4, -3,  4, $04, 0
	dsprite -3,  4, -2,  4, $05, 0
	dsprite -2,  4, -2,  4, $06, 0
	dsprite -1,  4, -2,  4, $07, 0
	dsprite  0,  4, -2,  4, $08, 0
	dsprite  1,  4, -2,  4, $09, 0
	dsprite -3,  4, -1,  4, $0a, 0
	dsprite -2,  4, -1,  4, $0b, 0
	dsprite -1,  4, -1,  4, $0c, 0
	dsprite  0,  4, -1,  4, $0d, 0
	dsprite  1,  4, -1,  4, $0e, 0
	dsprite -3,  4,  0,  4, $0f, 0
	dsprite -2,  4,  0,  4, $10, 0
	dsprite -1,  4,  0,  4, $11, 0
	dsprite  0,  4,  0,  4, $12, 0
	dsprite  1,  4,  0,  4, $13, 0
	dsprite -3,  4,  1,  4, $14, 0
	dsprite -2,  4,  1,  4, $15, 0
	dsprite -1,  4,  1,  4, $16, 0
	dsprite  0,  4,  1,  4, $17, 0
	dsprite  1,  4,  1,  4, $18, 0

; unused
	db 36
	dsprite -3,  0, -3,  0, $00, 0
	dsprite -3,  0, -2,  0, $01, 0
	dsprite -3,  0, -1,  0, $02, 0
	dsprite -3,  0,  0,  0, $03, 0
	dsprite -3,  0,  1,  0, $04, 0
	dsprite -3,  0,  2,  0, $05, 0
	dsprite -2,  0, -3,  0, $06, 0
	dsprite -2,  0, -2,  0, $07, 0
	dsprite -2,  0, -1,  0, $08, 0
	dsprite -2,  0,  0,  0, $09, 0
	dsprite -2,  0,  1,  0, $0a, 0
	dsprite -2,  0,  2,  0, $0b, 0
	dsprite -1,  0, -3,  0, $0c, 0
	dsprite -1,  0, -2,  0, $0d, 0
	dsprite -1,  0, -1,  0, $0e, 0
	dsprite -1,  0,  0,  0, $0f, 0
	dsprite -1,  0,  1,  0, $10, 0
	dsprite -1,  0,  2,  0, $11, 0
	dsprite  0,  0, -3,  0, $12, 0
	dsprite  0,  0, -2,  0, $13, 0
	dsprite  0,  0, -1,  0, $14, 0
	dsprite  0,  0,  0,  0, $15, 0
	dsprite  0,  0,  1,  0, $16, 0
	dsprite  0,  0,  2,  0, $17, 0
	dsprite  1,  0, -3,  0, $18, 0
	dsprite  1,  0, -2,  0, $19, 0
	dsprite  1,  0, -1,  0, $1a, 0
	dsprite  1,  0,  0,  0, $1b, 0
	dsprite  1,  0,  1,  0, $1c, 0
	dsprite  1,  0,  2,  0, $1d, 0
	dsprite  2,  0, -3,  0, $1e, 0
	dsprite  2,  0, -2,  0, $1f, 0
	dsprite  2,  0, -1,  0, $20, 0
	dsprite  2,  0,  0,  0, $21, 0
	dsprite  2,  0,  1,  0, $22, 0
	dsprite  2,  0,  2,  0, $23, 0

.OAMData_RedWalk:
	db 4
	dsprite -1,  0, -1,  0, $00, PAL_OW_RED
	dsprite -1,  0,  0,  0, $01, PAL_OW_RED
	dsprite  0,  0, -1,  0, $02, PAL_OW_RED
	dsprite  0,  0,  0,  0, $03, PAL_OW_RED

.OAMData_MagnetTrainRed:
	db 4
	dsprite -1,  0, -1,  0, $00, PAL_OW_RED | PRIORITY
	dsprite -1,  0,  0,  0, $01, PAL_OW_RED | PRIORITY
	dsprite  0,  0, -1,  0, $02, PAL_OW_RED | PRIORITY
	dsprite  0,  0,  0,  0, $03, PAL_OW_RED | PRIORITY

.OAMData_PartyMonWithMail1:
	db 4
	dsprite -1,  0, -1,  0, $00, PAL_OW_RED
	dsprite -1,  0,  0,  0, $01, PAL_OW_RED
	dsprite  0,  0, -1,  0, $08, PAL_OW_RED
	dsprite  0,  0,  0,  0, $03, PAL_OW_RED

.OAMData_PartyMonWithMail2:
	db 4
	dsprite -1,  0, -1,  0, $04, PAL_OW_RED
	dsprite -1,  0,  0,  0, $05, PAL_OW_RED
	dsprite  0,  0, -1,  0, $08, PAL_OW_RED
	dsprite  0,  0,  0,  0, $07, PAL_OW_RED

.OAMData_PartyMonWithItem1:
	db 4
	dsprite -1,  0, -1,  0, $00, PAL_OW_RED
	dsprite -1,  0,  0,  0, $01, PAL_OW_RED
	dsprite  0,  0, -1,  0, $09, PAL_OW_RED
	dsprite  0,  0,  0,  0, $03, PAL_OW_RED

.OAMData_PartyMonWithItem2:
	db 4
	dsprite -1,  0, -1,  0, $04, PAL_OW_RED
	dsprite -1,  0,  0,  0, $05, PAL_OW_RED
	dsprite  0,  0, -1,  0, $09, PAL_OW_RED
	dsprite  0,  0,  0,  0, $07, PAL_OW_RED

.OAMData_GSIntroMagikarp:
	db 6
	dsprite -1,  0, -2,  4, $00, 1
	dsprite -1,  0, -1,  4, $01, 1
	dsprite -1,  0,  0,  4, $02, 1
	dsprite  0,  0, -2,  4, $10, 1
	dsprite  0,  0, -1,  4, $11, 1
	dsprite  0,  0,  0,  4, $12, 1

.OAMData_GSIntroLapras:
	db 29
	dsprite -3,  0, -3,  0, $00, 0
	dsprite -3,  0, -2,  0, $01, 0
	dsprite -3,  0, -1,  0, $02, 0
	dsprite -3,  0,  0,  0, $03, 0
	dsprite -2,  0, -3,  0, $10, 0
	dsprite -2,  0, -2,  0, $11, 0
	dsprite -2,  0, -1,  0, $12, 0
	dsprite -2,  0,  0,  0, $13, 0
	dsprite -1,  0, -3,  0, $20, 0
	dsprite -1,  0, -2,  0, $21, 0
	dsprite -1,  0, -1,  0, $22, 0
	dsprite -1,  0,  0,  0, $23, 0
	dsprite -1,  0,  1,  0, $24, 0
	dsprite  0,  0, -3,  0, $30, 0 | PRIORITY
	dsprite  0,  0, -2,  0, $31, 0 | PRIORITY
	dsprite  0,  0, -1,  0, $32, 0 | PRIORITY
	dsprite  0,  0,  0,  0, $33, 0 | PRIORITY
	dsprite  0,  0,  1,  0, $34, 0 | PRIORITY
	dsprite  1,  0, -3,  0, $40, 0 | PRIORITY
	dsprite  1,  0, -2,  0, $41, 0 | PRIORITY
	dsprite  1,  0, -1,  0, $42, 0 | PRIORITY
	dsprite  1,  0,  0,  0, $43, 0 | PRIORITY
	dsprite  1,  0,  1,  0, $44, 0 | PRIORITY
	dsprite  1,  0,  2,  0, $45, 0 | PRIORITY
	dsprite  2,  0, -2,  0, $51, 0 | PRIORITY
	dsprite  2,  0, -1,  0, $52, 0 | PRIORITY
	dsprite  2,  0,  0,  0, $53, 0 | PRIORITY
	dsprite  2,  0,  1,  0, $54, 0 | PRIORITY
	dsprite  2,  0,  2,  0, $55, 0 | PRIORITY

.OAMData_GSIntroNote:
	db 2
	dsprite -1,  0, -1,  4, $00, 0
	dsprite  0,  0, -1,  4, $10, 0

.OAMData_GSIntroPikachuTail:
	db 5
	dsprite -2,  0,  3,  0, $00, 0
	dsprite -2,  0,  4,  0, $01, 0
	dsprite -1,  0,  2,  0, $02, 0
	dsprite -1,  0,  3,  0, $03, 0
	dsprite  0,  0,  2,  0, $04, 0

.OAMData_Leaf:
	db 1
	dsprite -1,  4, -1,  4, $00, PAL_OW_TREE

.OAMData_Tree:
	db 4
	dsprite -1,  0, -1,  0, $00, PAL_OW_TREE
	dsprite -1,  0,  0,  0, $01, PAL_OW_TREE
	dsprite  0,  0, -1,  0, $02, PAL_OW_TREE
	dsprite  0,  0,  0,  0, $03, PAL_OW_TREE

.OAMData_TextEntryCursor:
	db 4
	dsprite -1,  7, -1,  7, $00, 0
	dsprite -1,  7,  0,  0, $00, 0 | X_FLIP
	dsprite  0,  0, -1,  7, $00, 0 | Y_FLIP
	dsprite  0,  0,  0,  0, $00, 0 | X_FLIP | Y_FLIP

.OAMData_TextEntryCursorBig:
	db 10
	dsprite -1,  7,  0,  0, $00, 0
	dsprite -1,  7,  1,  0, $01, 0
	dsprite -1,  7,  2,  0, $01, 0
	dsprite -1,  7,  3,  0, $01, 0
	dsprite -1,  7,  4,  0, $00, 0 | X_FLIP
	dsprite  0,  0,  0,  0, $00, 0 | Y_FLIP
	dsprite  0,  0,  1,  0, $01, 0 | Y_FLIP
	dsprite  0,  0,  2,  0, $01, 0 | Y_FLIP
	dsprite  0,  0,  3,  0, $01, 0 | Y_FLIP
	dsprite  0,  0,  4,  0, $00, 0 | X_FLIP | Y_FLIP

.OAMData_GSIntroGameFreakLogo:
	db 15
	dsprite -3,  4, -2,  4, $00, 1 | OBP_NUM
	dsprite -3,  4, -1,  4, $01, 1 | OBP_NUM
	dsprite -3,  4,  0,  4, $02, 1 | OBP_NUM
	dsprite -2,  4, -2,  4, $03, 1 | OBP_NUM
	dsprite -2,  4, -1,  4, $04, 1 | OBP_NUM
	dsprite -2,  4,  0,  4, $05, 1 | OBP_NUM
	dsprite -1,  4, -2,  4, $06, 1 | OBP_NUM
	dsprite -1,  4, -1,  4, $07, 1 | OBP_NUM
	dsprite -1,  4,  0,  4, $08, 1 | OBP_NUM
	dsprite  0,  4, -2,  4, $09, 1 | OBP_NUM
	dsprite  0,  4, -1,  4, $0a, 1 | OBP_NUM
	dsprite  0,  4,  0,  4, $0b, 1 | OBP_NUM
	dsprite  1,  4, -2,  4, $0c, 1 | OBP_NUM
	dsprite  1,  4, -1,  4, $0d, 1 | OBP_NUM
	dsprite  1,  4,  0,  4, $0e, 1 | OBP_NUM

.OAMData_SlotsGolem:
	db 6
	dsprite -2,  4, -2,  4, $00, 5 | OBP_NUM
	dsprite -2,  4, -1,  4, $02, 5 | OBP_NUM
	dsprite -2,  4,  0,  4, $00, 5 | OBP_NUM | X_FLIP
	dsprite  0,  4, -2,  4, $04, 5 | OBP_NUM
	dsprite  0,  4, -1,  4, $06, 5 | OBP_NUM
	dsprite  0,  4,  0,  4, $04, 5 | OBP_NUM | X_FLIP

.OAMData_SlotsChansey1:
	db 6
	dsprite -2,  4, -2,  4, $00, 6 | OBP_NUM
	dsprite -2,  4, -1,  4, $02, 6 | OBP_NUM
	dsprite -2,  4,  0,  4, $04, 6 | OBP_NUM
	dsprite  0,  4, -2,  4, $06, 6 | OBP_NUM
	dsprite  0,  4, -1,  4, $08, 6 | OBP_NUM
	dsprite  0,  4,  0,  4, $0a, 6 | OBP_NUM

.OAMData_SlotsChansey2:
	db 6
	dsprite -2,  4, -2,  4, $00, 6 | OBP_NUM
	dsprite -2,  4, -1,  4, $02, 6 | OBP_NUM
	dsprite -2,  4,  0,  4, $04, 6 | OBP_NUM
	dsprite  0,  4, -2,  4, $0c, 6 | OBP_NUM
	dsprite  0,  4, -1,  4, $0e, 6 | OBP_NUM
	dsprite  0,  4,  0,  4, $10, 6 | OBP_NUM

.OAMData_SlotsChansey3:
	db 6
	dsprite -2,  4, -2,  4, $00, 6 | OBP_NUM
	dsprite -2,  4, -1,  4, $02, 6 | OBP_NUM
	dsprite -2,  4,  0,  4, $04, 6 | OBP_NUM
	dsprite  0,  4, -2,  4, $12, 6 | OBP_NUM
	dsprite  0,  4, -1,  4, $14, 6 | OBP_NUM
	dsprite  0,  4,  0,  4, $16, 6 | OBP_NUM

.OAMData_SlotsChansey4:
	db 6
	dsprite -2,  4, -2,  4, $00, 6 | OBP_NUM
	dsprite -2,  4, -1,  4, $02, 6 | OBP_NUM
	dsprite -2,  4,  0,  4, $04, 6 | OBP_NUM
	dsprite  0,  4, -2,  4, $18, 6 | OBP_NUM
	dsprite  0,  4, -1,  4, $1a, 6 | OBP_NUM
	dsprite  0,  4,  0,  4, $1c, 6 | OBP_NUM

.OAMData_SlotsChansey5:
	db 6
	dsprite -2,  4, -2,  4, $1e, 6 | OBP_NUM
	dsprite -2,  4, -1,  4, $20, 6 | OBP_NUM
	dsprite -2,  4,  0,  4, $22, 6 | OBP_NUM
	dsprite  0,  4, -2,  4, $24, 6 | OBP_NUM
	dsprite  0,  4, -1,  4, $26, 6 | OBP_NUM
	dsprite  0,  4,  0,  4, $28, 6 | OBP_NUM

.OAMData_RadioTuningKnob:
	db 3
	dsprite -2,  4, -1,  4, $00, 0 | OBP_NUM
	dsprite -1,  4, -1,  4, $00, 0 | OBP_NUM
	dsprite  0,  4, -1,  4, $00, 0 | OBP_NUM

.OAMData_Unused4B:
	db 6
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  1,  0, $01, 0
	dsprite  0,  0,  2,  0, $01, 0
	dsprite  0,  0,  3,  0, $01, 0
	dsprite  0,  0,  4,  0, $02, 0
	dsprite  0,  0,  5,  0, $03, 0

.OAMData_Unused4C:
	db 4
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  1,  0, $01, 0
	dsprite  0,  0,  2,  0, $02, 0
	dsprite  0,  0,  3,  0, $03, 0

.OAMData_CutTree2:
	db 4
	dsprite -1,  0, -2,  6, $00, PAL_OW_TREE
	dsprite -1,  0,  0,  2, $01, PAL_OW_TREE
	dsprite  0,  0, -2,  6, $02, PAL_OW_TREE
	dsprite  0,  0,  0,  2, $03, PAL_OW_TREE

.OAMData_CutTree3:
	db 4
	dsprite -1,  0, -2,  4, $00, PAL_OW_TREE
	dsprite -1,  0,  0,  4, $01, PAL_OW_TREE
	dsprite  0,  0, -2,  4, $02, PAL_OW_TREE
	dsprite  0,  0,  0,  4, $03, PAL_OW_TREE

.OAMData_CutTree4:
	db 4
	dsprite -1,  0, -2,  0, $00, PAL_OW_TREE
	dsprite -1,  0,  1,  0, $01, PAL_OW_TREE
	dsprite  0,  0, -2,  0, $02, PAL_OW_TREE
	dsprite  0,  0,  1,  0, $03, PAL_OW_TREE

.OAMData_GSIntroHoOh1:
	db 19
	dsprite -1,  0, -4,  0, $00, 0
	dsprite -2,  0, -3,  0, $02, 0
	dsprite  0,  0, -3,  0, $04, 0
	dsprite -3,  0, -2,  0, $06, 0
	dsprite -1,  0, -2,  0, $08, 0
	dsprite  1,  0, -2,  0, $0a, 0
	dsprite -3,  0, -1,  0, $0c, 0
	dsprite -1,  0, -1,  0, $0e, 0
	dsprite  1,  0, -1,  0, $10, 0
	dsprite -3,  0,  0,  0, $12, 0
	dsprite -1,  0,  0,  0, $14, 0
	dsprite  1,  0,  0,  0, $16, 0
	dsprite -3,  0,  1,  0, $18, 0
	dsprite -1,  0,  1,  0, $1a, 0
	dsprite  1,  0,  1,  0, $1c, 0
	dsprite -1,  0,  2,  0, $1e, 0
	dsprite  1,  0,  2,  0, $20, 0
	dsprite -2,  0,  3,  0, $22, 0
	dsprite  0,  0,  3,  0, $24, 0

.OAMData_GSIntroHoOh2:
	db 16
	dsprite -1,  0, -4,  0, $00, 0
	dsprite -2,  0, -3,  0, $02, 0
	dsprite  0,  0, -3,  0, $04, 0
	dsprite -1,  0, -2,  0, $26, 0
	dsprite  1,  0, -2,  0, $0a, 0
	dsprite -3,  0, -1,  0, $28, 0
	dsprite -1,  0, -1,  0, $2a, 0
	dsprite  1,  0, -1,  0, $10, 0
	dsprite -1,  0,  0,  0, $2c, 0
	dsprite  1,  0,  0,  0, $16, 0
	dsprite -1,  0,  1,  0, $30, 0
	dsprite  1,  0,  1,  0, $1c, 0
	dsprite -1,  0,  2,  0, $1e, 0
	dsprite  1,  0,  2,  0, $20, 0
	dsprite -2,  0,  3,  0, $22, 0
	dsprite  0,  0,  3,  0, $24, 0

.OAMData_GSIntroHoOh3:
	db 15
	dsprite -1,  0, -4,  0, $00, 0
	dsprite -2,  0, -3,  0, $02, 0
	dsprite  0,  0, -3,  0, $32, 0
	dsprite -1,  0, -2,  0, $34, 0
	dsprite  1,  0, -2,  0, $36, 0
	dsprite -1,  0, -1,  0, $38, 0
	dsprite  1,  0, -1,  0, $3a, 0
	dsprite -1,  0,  0,  0, $3c, 0
	dsprite  1,  0,  0,  0, $3e, 0
	dsprite -1,  0,  1,  0, $30, 0
	dsprite  1,  0,  1,  0, $1c, 0
	dsprite -1,  0,  2,  0, $1e, 0
	dsprite  1,  0,  2,  0, $20, 0
	dsprite -2,  0,  3,  0, $22, 0
	dsprite  0,  0,  3,  0, $24, 0

.OAMData_GSIntroHoOh4:
	db 17
	dsprite -1,  0, -4,  0, $00, 0
	dsprite -2,  0, -3,  0, $02, 0
	dsprite  0,  0, -3,  0, $04, 0
	dsprite -1,  0, -2,  0, $40, 0
	dsprite  1,  0, -2,  0, $42, 0
	dsprite  3,  0, -2,  0, $44, 0
	dsprite -1,  0, -1,  0, $46, 0
	dsprite  1,  0, -1,  0, $48, 0
	dsprite  3,  0, -1,  0, $4a, 0
	dsprite -1,  0,  0,  0, $4c, 0
	dsprite  1,  0,  0,  0, $4e, 0
	dsprite -1,  0,  1,  0, $30, 0
	dsprite  1,  0,  1,  0, $1c, 0
	dsprite -1,  0,  2,  0, $1e, 0
	dsprite  1,  0,  2,  0, $20, 0
	dsprite -2,  0,  3,  0, $22, 0
	dsprite  0,  0,  3,  0, $24, 0

.OAMData_GSIntroHoOh5:
	db 17
	dsprite -1,  0, -4,  0, $00, 0
	dsprite -2,  0, -3,  0, $02, 0
	dsprite  0,  0, -3,  0, $04, 0
	dsprite -1,  0, -2,  0, $50, 0
	dsprite  1,  0, -2,  0, $0a, 0
	dsprite -3,  0, -1,  0, $52, 0
	dsprite -1,  0, -1,  0, $54, 0
	dsprite  1,  0, -1,  0, $10, 0
	dsprite -3,  0,  0,  0, $56, 0
	dsprite -1,  0,  0,  0, $2e, 0
	dsprite  1,  0,  0,  0, $16, 0
	dsprite -1,  0,  1,  0, $30, 0
	dsprite  1,  0,  1,  0, $1c, 0
	dsprite -1,  0,  2,  0, $1e, 0
	dsprite  1,  0,  2,  0, $20, 0
	dsprite -2,  0,  3,  0, $22, 0
	dsprite  0,  0,  3,  0, $24, 0

.OAMData_GSTitleTrail:
	db 1
	dsprite -1,  4, -1,  4, $00, 1 | OBP_NUM

.OAMData_EZChatCursor1:
	db 12
	dsprite  0,  0,  0,  0, $30, 0
	dsprite  0,  0,  1,  0, $31, 0
	dsprite  0,  0,  2,  0, $31, 0
	dsprite  0,  0,  3,  0, $31, 0
	dsprite  0,  0,  4,  0, $31, 0
	dsprite  0,  0,  5,  0, $32, 0
	dsprite  1,  0,  0,  0, $33, 0
	dsprite  1,  0,  1,  0, $34, 0
	dsprite  1,  0,  2,  0, $34, 0
	dsprite  1,  0,  3,  0, $34, 0
	dsprite  1,  0,  4,  0, $34, 0
	dsprite  1,  0,  5,  0, $35, 0

.OAMData_EZChatCursor2:
	db 1
	dsprite  0,  0,  0,  0, $ed, 0

.OAMData_EZChatCursor3:
	db 4
	dsprite -1,  7, -1,  7, $30, 0
	dsprite -1,  7,  0,  1, $32, 0
	dsprite  0,  1, -1,  7, $33, 0
	dsprite  0,  1,  0,  1, $35, 0

.OAMData_EZChatCursor4:
	db 8
	dsprite -1,  7, -1,  7, $30, 0
	dsprite -1,  7,  0,  4, $31, 0
	dsprite -1,  7,  1,  4, $31, 0
	dsprite -1,  7,  2,  1, $32, 0
	dsprite  0,  1, -1,  7, $33, 0
	dsprite  0,  1,  0,  4, $34, 0
	dsprite  0,  1,  1,  4, $34, 0
	dsprite  0,  1,  2,  1, $35, 0

.OAMData_EZChatCursor5:
	db 1
	dsprite  0,  0,  0,  0, $34, 0

.OAMData_EZChatCursor6:
	db 2
	dsprite  0,  0,  0,  0, $30, 0
	dsprite  1,  0,  0,  0, $33, 0

.OAMData_EZChatCursor7:
	db 2
	dsprite  0,  0,  0,  0, $32, 0
	dsprite  1,  0,  0,  0, $35, 0

.OAMData_BlueWalk:
	db 4
	dsprite -1,  0, -1,  0, $00, PAL_OW_BLUE
	dsprite -1,  0,  0,  0, $01, PAL_OW_BLUE
	dsprite  0,  0, -1,  0, $02, PAL_OW_BLUE
	dsprite  0,  0,  0,  0, $03, PAL_OW_BLUE

.OAMData_MagnetTrainBlue:
	db 4
	dsprite -1,  0, -1,  0, $00, PAL_OW_BLUE | PRIORITY
	dsprite -1,  0,  0,  0, $01, PAL_OW_BLUE | PRIORITY
	dsprite  0,  0, -1,  0, $02, PAL_OW_BLUE | PRIORITY
	dsprite  0,  0,  0,  0, $03, PAL_OW_BLUE | PRIORITY

.OAMData_MobileTradeCableBulge:
	db 1
	dsprite -1,  4, -1,  4, $00, 2

.OAMData_MobileTradeSentPulse:
	db 4
	dsprite -2,  0, -1,  4, $00, 3
	dsprite -1,  0, -1,  4, $01, 3
	dsprite  0,  0, -1,  4, $02, 3
	dsprite  1,  0, -1,  4, $03, 3

.OAMData_MobileTradeOTPulse:
	db 4
	dsprite -2,  0, -1,  4, $03, 4 | Y_FLIP
	dsprite -1,  0, -1,  4, $02, 4 | Y_FLIP
	dsprite  0,  0, -1,  4, $01, 4 | Y_FLIP
	dsprite  1,  0, -1,  4, $00, 4 | Y_FLIP

.OAMData_MobileTradePing1:
	db 4
	dsprite -1,  0, -1,  0, $00, 1
	dsprite -1,  0,  0,  0, $00, 1 | X_FLIP
	dsprite  0,  0, -1,  0, $00, 1 | Y_FLIP
	dsprite  0,  0,  0,  0, $00, 1 | X_FLIP | Y_FLIP

.OAMData_MobileTradePing2:
	db 8
	dsprite -2,  4, -2,  4, $00, 1
	dsprite -2,  4, -1,  4, $01, 1
	dsprite -2,  4,  0,  4, $00, 1 | X_FLIP
	dsprite -1,  4, -2,  4, $02, 1
	dsprite -1,  4,  0,  4, $02, 1 | X_FLIP
	dsprite  0,  4, -2,  4, $00, 1 | Y_FLIP
	dsprite  0,  4, -1,  4, $01, 1 | Y_FLIP
	dsprite  0,  4,  0,  4, $00, 1 | X_FLIP | Y_FLIP

.OAMData_MobileTradePing3:
	db 12
	dsprite -2,  0, -2,  0, $00, 1
	dsprite -2,  0, -1,  0, $01, 1
	dsprite -1,  0, -2,  0, $02, 1
	dsprite -2,  0,  0,  0, $01, 1 | X_FLIP
	dsprite -2,  0,  1,  0, $00, 1 | X_FLIP
	dsprite -1,  0,  1,  0, $02, 1 | X_FLIP
	dsprite  0,  0, -2,  0, $02, 1 | Y_FLIP
	dsprite  1,  0, -2,  0, $00, 1 | Y_FLIP
	dsprite  1,  0, -1,  0, $01, 1 | Y_FLIP
	dsprite  0,  0,  1,  0, $02, 1 | X_FLIP | Y_FLIP
	dsprite  1,  0,  0,  0, $01, 1 | X_FLIP | Y_FLIP
	dsprite  1,  0,  1,  0, $00, 1 | X_FLIP | Y_FLIP

.OAMData_IntroSuicune1:
	db 36
	dsprite -3,  0,  1,  0, $05, 0
	dsprite -3,  0,  2,  0, $06, 0
	dsprite -3,  0,  3,  0, $07, 0
	dsprite -2,  0, -3,  0, $11, 0
	dsprite -2,  0, -2,  0, $12, 0
	dsprite -2,  0, -1,  0, $13, 0
	dsprite -2,  0,  0,  0, $14, 0
	dsprite -2,  0,  1,  0, $15, 0
	dsprite -2,  0,  2,  0, $16, 0
	dsprite -2,  0,  3,  0, $17, 0
	dsprite -1,  0, -4,  0, $20, 0
	dsprite -1,  0, -3,  0, $21, 0
	dsprite -1,  0, -2,  0, $22, 0
	dsprite -1,  0, -1,  0, $23, 0
	dsprite -1,  0,  0,  0, $24, 0
	dsprite -1,  0,  1,  0, $25, 0
	dsprite -1,  0,  2,  0, $26, 0
	dsprite -1,  0,  3,  0, $27, 0
	dsprite  0,  0, -4,  0, $30, 0
	dsprite  0,  0, -3,  0, $31, 0
	dsprite  0,  0, -2,  0, $32, 0
	dsprite  0,  0, -1,  0, $33, 0
	dsprite  0,  0,  0,  0, $34, 0
	dsprite  0,  0,  1,  0, $35, 0
	dsprite  0,  0,  2,  0, $36, 0
	dsprite  1,  0, -4,  0, $40, 0
	dsprite  1,  0, -3,  0, $41, 0
	dsprite  1,  0, -2,  0, $42, 0
	dsprite  1,  0, -1,  0, $43, 0
	dsprite  1,  0,  0,  0, $44, 0
	dsprite  1,  0,  1,  0, $45, 0
	dsprite  1,  0,  2,  0, $46, 0
	dsprite  1,  0,  3,  0, $47, 0
	dsprite  2,  0, -4,  0, $50, 0
	dsprite  2,  0, -3,  0, $51, 0
	dsprite  2,  0,  3,  0, $57, 0

.OAMData_IntroSuicune2:
	db 28
	dsprite -3,  0,  0,  0, $04, 0
	dsprite -3,  0,  1,  0, $05, 0
	dsprite -3,  0,  2,  0, $06, 0
	dsprite -2,  0, -3,  0, $11, 0
	dsprite -2,  0, -2,  0, $12, 0
	dsprite -2,  0, -1,  0, $13, 0
	dsprite -2,  0,  0,  0, $14, 0
	dsprite -2,  0,  1,  0, $15, 0
	dsprite -2,  0,  2,  0, $16, 0
	dsprite -1,  0, -3,  0, $21, 0
	dsprite -1,  0, -2,  0, $22, 0
	dsprite -1,  0, -1,  0, $23, 0
	dsprite -1,  0,  0,  0, $24, 0
	dsprite -1,  0,  1,  0, $25, 0
	dsprite -1,  0,  2,  0, $26, 0
	dsprite  0,  0, -4,  0, $30, 0
	dsprite  0,  0, -3,  0, $31, 0
	dsprite  0,  0, -2,  0, $32, 0
	dsprite  0,  0, -1,  0, $33, 0
	dsprite  0,  0,  0,  0, $34, 0
	dsprite  0,  0,  1,  0, $35, 0
	dsprite  1,  0, -2,  0, $42, 0
	dsprite  1,  0, -1,  0, $43, 0
	dsprite  1,  0,  0,  0, $44, 0
	dsprite  1,  0,  1,  0, $45, 0
	dsprite  2,  0, -1,  0, $53, 0
	dsprite  2,  0,  0,  0, $54, 0
	dsprite  2,  0,  1,  0, $55, 0

.OAMData_IntroSuicune3:
	db 30
	dsprite -3,  0,  0,  0, $04, 0
	dsprite -3,  0,  1,  0, $05, 0
	dsprite -2,  0, -3,  0, $11, 0
	dsprite -2,  0, -2,  0, $12, 0
	dsprite -2,  0, -1,  0, $13, 0
	dsprite -2,  0,  0,  0, $14, 0
	dsprite -2,  0,  1,  0, $15, 0
	dsprite -2,  0,  2,  0, $16, 0
	dsprite -2,  0,  3,  0, $17, 0
	dsprite -1,  0, -4,  0, $20, 0
	dsprite -1,  0, -3,  0, $21, 0
	dsprite -1,  0, -2,  0, $22, 0
	dsprite -1,  0, -1,  0, $23, 0
	dsprite -1,  0,  0,  0, $24, 0
	dsprite -1,  0,  1,  0, $25, 0
	dsprite -1,  0,  2,  0, $26, 0
	dsprite  0,  0, -4,  0, $30, 0
	dsprite  0,  0, -3,  0, $31, 0
	dsprite  0,  0, -2,  0, $32, 0
	dsprite  0,  0, -1,  0, $33, 0
	dsprite  0,  0,  0,  0, $34, 0
	dsprite  0,  0,  1,  0, $35, 0
	dsprite  1,  0, -2,  0, $42, 0
	dsprite  1,  0, -1,  0, $43, 0
	dsprite  1,  0,  0,  0, $44, 0
	dsprite  1,  0,  1,  0, $45, 0
	dsprite  2,  0, -2,  0, $52, 0
	dsprite  2,  0, -1,  0, $53, 0
	dsprite  2,  0,  0,  0, $54, 0
	dsprite  2,  0,  1,  0, $55, 0

.OAMData_IntroSuicune4:
	db 31
	dsprite -2,  0, -3,  0, $11, 0
	dsprite -2,  0, -2,  0, $12, 0
	dsprite -2,  0, -1,  0, $13, 0
	dsprite -2,  0,  0,  0, $14, 0
	dsprite -2,  0,  1,  0, $15, 0
	dsprite -2,  0,  2,  0, $16, 0
	dsprite -2,  0,  3,  0, $17, 0
	dsprite -1,  0, -4,  0, $20, 0
	dsprite -1,  0, -3,  0, $21, 0
	dsprite -1,  0, -2,  0, $22, 0
	dsprite -1,  0, -1,  0, $23, 0
	dsprite -1,  0,  0,  0, $24, 0
	dsprite -1,  0,  1,  0, $25, 0
	dsprite -1,  0,  2,  0, $26, 0
	dsprite -1,  0,  3,  0, $27, 0
	dsprite  0,  0, -4,  0, $30, 0
	dsprite  0,  0, -3,  0, $31, 0
	dsprite  0,  0, -2,  0, $32, 0
	dsprite  0,  0, -1,  0, $33, 0
	dsprite  0,  0,  0,  0, $34, 0
	dsprite  0,  0,  1,  0, $35, 0
	dsprite  0,  0,  2,  0, $36, 0
	dsprite  1,  0, -3,  0, $41, 0
	dsprite  1,  0, -2,  0, $42, 0
	dsprite  1,  0, -1,  0, $43, 0
	dsprite  1,  0,  0,  0, $44, 0
	dsprite  1,  0,  1,  0, $45, 0
	dsprite  2,  0, -3,  0, $51, 0
	dsprite  2,  0, -2,  0, $52, 0
	dsprite  2,  0,  0,  0, $54, 0
	dsprite  2,  0,  1,  0, $55, 0

.OAMData_IntroPichu:
	db 25
	dsprite -3,  4, -3,  4, $00, 1 | VRAM_BANK_1
	dsprite -3,  4, -2,  4, $01, 1 | VRAM_BANK_1
	dsprite -3,  4, -1,  4, $02, 1 | VRAM_BANK_1
	dsprite -3,  4,  0,  4, $03, 1 | VRAM_BANK_1
	dsprite -3,  4,  1,  4, $04, 1 | VRAM_BANK_1
	dsprite -2,  4, -3,  4, $10, 1 | VRAM_BANK_1
	dsprite -2,  4, -2,  4, $11, 1 | VRAM_BANK_1
	dsprite -2,  4, -1,  4, $12, 1 | VRAM_BANK_1
	dsprite -2,  4,  0,  4, $13, 1 | VRAM_BANK_1
	dsprite -2,  4,  1,  4, $14, 1 | VRAM_BANK_1
	dsprite -1,  4, -3,  4, $20, 1 | VRAM_BANK_1
	dsprite -1,  4, -2,  4, $21, 1 | VRAM_BANK_1
	dsprite -1,  4, -1,  4, $22, 1 | VRAM_BANK_1
	dsprite -1,  4,  0,  4, $23, 1 | VRAM_BANK_1
	dsprite -1,  4,  1,  4, $24, 1 | VRAM_BANK_1
	dsprite  0,  4, -3,  4, $30, 1 | VRAM_BANK_1
	dsprite  0,  4, -2,  4, $31, 1 | VRAM_BANK_1
	dsprite  0,  4, -1,  4, $32, 1 | VRAM_BANK_1
	dsprite  0,  4,  0,  4, $33, 1 | VRAM_BANK_1
	dsprite  0,  4,  1,  4, $34, 1 | VRAM_BANK_1
	dsprite  1,  4, -3,  4, $40, 1 | VRAM_BANK_1
	dsprite  1,  4, -2,  4, $41, 1 | VRAM_BANK_1
	dsprite  1,  4, -1,  4, $42, 1 | VRAM_BANK_1
	dsprite  1,  4,  0,  4, $43, 1 | VRAM_BANK_1
	dsprite  1,  4,  1,  4, $44, 1 | VRAM_BANK_1

.OAMData_IntroWooper:
	db 16
	dsprite -2,  0, -3,  4, $00, 2 | VRAM_BANK_1
	dsprite -2,  0, -2,  4, $01, 2 | VRAM_BANK_1
	dsprite -2,  0, -1,  4, $02, 2 | VRAM_BANK_1
	dsprite -2,  0,  0,  4, $03, 2 | VRAM_BANK_1
	dsprite -1,  0, -3,  4, $04, 2 | VRAM_BANK_1
	dsprite -1,  0, -2,  4, $05, 2 | VRAM_BANK_1
	dsprite -1,  0, -1,  4, $06, 2 | VRAM_BANK_1
	dsprite -1,  0,  0,  4, $07, 2 | VRAM_BANK_1
	dsprite  0,  0, -3,  4, $08, 2 | VRAM_BANK_1
	dsprite  0,  0, -2,  4, $09, 2 | VRAM_BANK_1
	dsprite  0,  0, -1,  4, $0a, 2 | VRAM_BANK_1
	dsprite  0,  0,  0,  4, $0b, 2 | VRAM_BANK_1
	dsprite  1,  0, -3,  4, $0c, 2 | VRAM_BANK_1
	dsprite  1,  0, -2,  4, $0d, 2 | VRAM_BANK_1
	dsprite  1,  0, -1,  4, $0e, 2 | VRAM_BANK_1
	dsprite  1,  0,  0,  4, $0f, 2 | VRAM_BANK_1

.OAMData_IntroUnown1:
	db 1
	dsprite -1,  4, -1,  4, $00, 0

.OAMData_IntroUnown2:
	db 3
	dsprite  0,  0, -1,  0, $00, 0
	dsprite -1,  0, -1,  0, $01, 0
	dsprite -1,  0,  0,  0, $02, 0

.OAMData_IntroUnown3:
	db 7
	dsprite  1,  0, -2,  0, $00, 0
	dsprite  0,  0, -2,  0, $01, 0
	dsprite -1,  0, -2,  0, $02, 0
	dsprite -1,  0, -1,  0, $03, 0
	dsprite -2,  0, -1,  0, $04, 0
	dsprite -2,  0,  0,  0, $05, 0
	dsprite -2,  0,  1,  0, $06, 0

.OAMData_IntroUnownF2_2:
	db 8
	dsprite -1,  0, -2,  0, $00, 0
	dsprite -1,  0, -1,  0, $01, 0
	dsprite -1,  0,  0,  0, $01, 0 | X_FLIP
	dsprite -1,  0,  1,  0, $00, 0 | X_FLIP
	dsprite  0,  0, -2,  0, $00, 0 | Y_FLIP
	dsprite  0,  0, -1,  0, $01, 0 | Y_FLIP
	dsprite  0,  0,  0,  0, $01, 0 | X_FLIP | Y_FLIP
	dsprite  0,  0,  1,  0, $00, 0 | X_FLIP | Y_FLIP

.OAMData_IntroUnownF2_3:
	db 12
	dsprite -3,  0, -1,  0, $00, 0
	dsprite -2,  0, -1,  0, $01, 0
	dsprite -1,  0, -1,  0, $02, 0
	dsprite -3,  0,  0,  0, $00, 0 | X_FLIP
	dsprite -2,  0,  0,  0, $01, 0 | X_FLIP
	dsprite -1,  0,  0,  0, $02, 0 | X_FLIP
	dsprite  0,  0, -1,  0, $02, 0 | Y_FLIP
	dsprite  1,  0, -1,  0, $01, 0 | Y_FLIP
	dsprite  2,  0, -1,  0, $00, 0 | Y_FLIP
	dsprite  0,  0,  0,  0, $02, 0 | X_FLIP | Y_FLIP
	dsprite  1,  0,  0,  0, $01, 0 | X_FLIP | Y_FLIP
	dsprite  2,  0,  0,  0, $00, 0 | X_FLIP | Y_FLIP

.OAMData_IntroUnownF2_4_5:
	db 20
	dsprite -3,  4, -2,  0, $00, 0
	dsprite -3,  4, -1,  0, $01, 0
	dsprite -3,  4,  0,  0, $02, 0
	dsprite -3,  4,  1,  0, $03, 0
	dsprite -2,  4, -2,  0, $04, 0
	dsprite -2,  4, -1,  0, $05, 0
	dsprite -2,  4,  0,  0, $06, 0
	dsprite -2,  4,  1,  0, $07, 0
	dsprite -1,  4, -2,  0, $08, 0
	dsprite -1,  4, -1,  0, $09, 0
	dsprite -1,  4,  0,  0, $0a, 0
	dsprite -1,  4,  1,  0, $0b, 0
	dsprite  0,  4, -2,  0, $0c, 0
	dsprite  0,  4, -1,  0, $0d, 0
	dsprite  0,  4,  0,  0, $0e, 0
	dsprite  0,  4,  1,  0, $0f, 0
	dsprite  1,  4, -2,  0, $10, 0
	dsprite  1,  4, -1,  0, $11, 0
	dsprite  1,  4,  0,  0, $12, 0
	dsprite  1,  4,  1,  0, $13, 0

.OAMData_IntroSuicuneAway:
	db 20
	dsprite  0,  0,   1,  0, $00, 1 | PRIORITY
	dsprite  1,  0,   2,  0, $00, 1 | PRIORITY
	dsprite  2,  0,   3,  0, $00, 1 | PRIORITY
	dsprite  3,  0,   4,  0, $00, 1 | PRIORITY
	dsprite  4,  0,   5,  0, $00, 1 | PRIORITY
	dsprite  3,  0,   6,  0, $00, 1 | PRIORITY
	dsprite  2,  0,   7,  0, $00, 1 | PRIORITY
	dsprite  1,  0,   8,  0, $00, 1 | PRIORITY
	dsprite  0,  0,   9,  0, $00, 1 | PRIORITY
	dsprite  1,  0,  10,  0, $00, 1 | PRIORITY
	dsprite  2,  0,  11,  0, $00, 1 | PRIORITY
	dsprite  3,  0,  12,  0, $00, 1 | PRIORITY
	dsprite  4,  0,  13,  0, $00, 1 | PRIORITY
	dsprite  3,  0,  14,  0, $00, 1 | PRIORITY
	dsprite  2,  0,  15,  0, $00, 1 | PRIORITY
	dsprite  1,  0,  16,  0, $00, 1 | PRIORITY
	dsprite  0,  0, -15,  0, $00, 1 | PRIORITY
	dsprite  1,  0, -14,  0, $00, 1 | PRIORITY
	dsprite  2,  0, -13,  0, $00, 1 | PRIORITY
	dsprite  3,  0, -12,  0, $00, 1 | PRIORITY

.OAMData_Celebi:
	db 4
	dsprite -1,  0, -1,  0, $00, PAL_OW_GREEN
	dsprite -1,  0,  0,  0, $01, PAL_OW_GREEN
	dsprite  0,  0, -1,  0, $02, PAL_OW_GREEN
	dsprite  0,  0,  0,  0, $03, PAL_OW_GREEN

.OAMData_GameFreakLogo1_3:
	db 9
	dsprite -2,  0, -2,  4, $00, 1
	dsprite -2,  0, -1,  4, $01, 1
	dsprite -2,  0,  0,  4, $02, 1
	dsprite -1,  0, -2,  4, $10, 1
	dsprite -1,  0, -1,  4, $11, 1
	dsprite -1,  0,  0,  4, $12, 1
	dsprite  0,  0, -2,  4, $20, 1
	dsprite  0,  0, -1,  4, $21, 1
	dsprite  0,  0,  0,  4, $22, 1

.OAMData_GameFreakLogo4_11:
	db 24
	dsprite -5,  0, -2,  4, $00, 1
	dsprite -5,  0, -1,  4, $01, 1
	dsprite -5,  0,  0,  4, $02, 1
	dsprite -5,  0,  1,  4, $03, 1
	dsprite -4,  0, -2,  4, $10, 1
	dsprite -4,  0, -1,  4, $11, 1
	dsprite -4,  0,  0,  4, $12, 1
	dsprite -4,  0,  1,  4, $13, 1
	dsprite -3,  0, -2,  4, $20, 1
	dsprite -3,  0, -1,  4, $21, 1
	dsprite -3,  0,  0,  4, $22, 1
	dsprite -3,  0,  1,  4, $23, 1
	dsprite -2,  0, -2,  4, $30, 1
	dsprite -2,  0, -1,  4, $31, 1
	dsprite -2,  0,  0,  4, $32, 1
	dsprite -2,  0,  1,  4, $33, 1
	dsprite -1,  0, -2,  4, $40, 1
	dsprite -1,  0, -1,  4, $41, 1
	dsprite -1,  0,  0,  4, $42, 1
	dsprite -1,  0,  1,  4, $43, 1
	dsprite  0,  0, -2,  4, $50, 1
	dsprite  0,  0, -1,  4, $51, 1
	dsprite  0,  0,  0,  4, $52, 1
	dsprite  0,  0,  1,  4, $53, 1
