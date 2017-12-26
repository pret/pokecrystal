SpriteAnimOAMData: ; 8d94d
; entries correspond to SPRITE_ANIM_OAMSET_* constants
	; vtile offset, pointer
	dbw $00, .OAMData_RedWalk ; SPRITE_ANIM_OAMSET_RED_WALK_1
	dbw $04, .OAMData_RedWalk ; SPRITE_ANIM_OAMSET_RED_WALK_2
	dbw $4c, .OAMData_1x1_Palette0 ; SPRITE_ANIM_OAMSET_02
	dbw $5c, .OAMData_1x1_Palette0 ; SPRITE_ANIM_OAMSET_03
	dbw $6c, .OAMData_04 ; SPRITE_ANIM_OAMSET_04
	dbw $6e, .OAMData_04 ; SPRITE_ANIM_OAMSET_05
	dbw $2d, .OAMData_06 ; SPRITE_ANIM_OAMSET_06
	dbw $4d, .OAMData_06 ; SPRITE_ANIM_OAMSET_07
	dbw $60, .OAMData_08 ; SPRITE_ANIM_OAMSET_08
	dbw $00, .OAMData_08 ; SPRITE_ANIM_OAMSET_09
	dbw $00, .OAMData_08 ; SPRITE_ANIM_OAMSET_0A
	dbw $06, .OAMData_08 ; SPRITE_ANIM_OAMSET_0B
	dbw $0c, .OAMData_0c ; SPRITE_ANIM_OAMSET_0C
	dbw $0d, .OAMData_1x1_Palette0 ; SPRITE_ANIM_OAMSET_0D
	dbw $00, .OAMData_0e ; SPRITE_ANIM_OAMSET_0E
	dbw $04, .OAMData_0e ; SPRITE_ANIM_OAMSET_0F
	dbw $08, .OAMData_0e ; SPRITE_ANIM_OAMSET_10
	dbw $40, .OAMData_0e ; SPRITE_ANIM_OAMSET_11
	dbw $44, .OAMData_0e ; SPRITE_ANIM_OAMSET_12
	dbw $48, .OAMData_0e ; SPRITE_ANIM_OAMSET_13
	dbw $4c, .OAMData_0e ; SPRITE_ANIM_OAMSET_14
	dbw $80, .OAMData_15 ; SPRITE_ANIM_OAMSET_15
	dbw $85, .OAMData_15 ; SPRITE_ANIM_OAMSET_16
	dbw $8a, .OAMData_15 ; SPRITE_ANIM_OAMSET_17
	dbw $00, .OAMData_18 ; SPRITE_ANIM_OAMSET_18
	dbw $01, .OAMData_TradePoofBubble ; SPRITE_ANIM_OAMSET_19
	dbw $09, .OAMData_1a ; SPRITE_ANIM_OAMSET_1A
	dbw $10, .OAMData_1b ; SPRITE_ANIM_OAMSET_1B
	dbw $29, .OAMData_1b ; SPRITE_ANIM_OAMSET_1C
	dbw $42, .OAMData_1b ; SPRITE_ANIM_OAMSET_1D
	dbw $f8, .OAMData_GSTitleTrail ; SPRITE_ANIM_OAMSET_GS_TITLE_TRAIL_1
	dbw $fa, .OAMData_GSTitleTrail ; SPRITE_ANIM_OAMSET_GS_TITLE_TRAIL_2
	dbw $00, .OAMData_TextEntryCursor ; SPRITE_ANIM_OAMSET_TEXT_ENTRY_CURSOR
	dbw $00, .OAMData_ForFrameset09 ; SPRITE_ANIM_OAMSET_FOR_FRAMESET_09
	dbw $00, .OAMData_22 ; SPRITE_ANIM_OAMSET_22
	dbw $0f, .OAMData_GSIntroStar ; SPRITE_ANIM_OAMSET_GS_INTRO_STAR
	dbw $11, .OAMData_1x1_Palette0 ; SPRITE_ANIM_OAMSET_GS_INTRO_SPARKLE_1
	dbw $12, .OAMData_1x1_Palette0 ; SPRITE_ANIM_OAMSET_GS_INTRO_SPARKLE_2
	dbw $13, .OAMData_1x1_Palette0 ; SPRITE_ANIM_OAMSET_GS_INTRO_SPARKLE_3
	dbw $00, .OAMData_SlotsGolem ; SPRITE_ANIM_OAMSET_SLOTS_GOLEM_1
	dbw $08, .OAMData_SlotsGolem ; SPRITE_ANIM_OAMSET_SLOTS_GOLEM_2
	dbw $10, .OAMData_SlotsChansey1 ; SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_1
	dbw $10, .OAMData_SlotsChansey2 ; SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_2
	dbw $10, .OAMData_SlotsChansey3 ; SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_3
	dbw $10, .OAMData_SlotsChansey4 ; SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_4
	dbw $10, .OAMData_SlotsChansey5 ; SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_5
	dbw $3a, .OAMData_1x1_Palette0 ; SPRITE_ANIM_OAMSET_SLOTS_EGG
	dbw $00, .OAMData_RedWalk ; SPRITE_ANIM_OAMSET_STILL_CURSOR
	dbw $00, .OAMData_TradePokeBall1 ; SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1
	dbw $02, .OAMData_MagnetTrainRed ; SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_2
	dbw $06, .OAMData_TradePoofBubble ; SPRITE_ANIM_OAMSET_TRADE_POOF_1
	dbw $0a, .OAMData_TradePoofBubble ; SPRITE_ANIM_OAMSET_TRADE_POOF_2
	dbw $0e, .OAMData_TradePoofBubble ; SPRITE_ANIM_OAMSET_TRADE_POOF_3
	dbw $12, .OAMData_35 ; SPRITE_ANIM_OAMSET_35
	dbw $13, .OAMData_35 ; SPRITE_ANIM_OAMSET_36
	dbw $00, .OAMData_RedWalk ; SPRITE_ANIM_OAMSET_TRADEMON_ICON_1
	dbw $04, .OAMData_RedWalk ; SPRITE_ANIM_OAMSET_TRADEMON_ICON_2
	dbw $10, .OAMData_TradePoofBubble ; SPRITE_ANIM_OAMSET_TRADEMON_BUBBLE
	dbw $00, .OAMData_MagnetTrainRed ; SPRITE_ANIM_OAMSET_EVOLUTION_BALL_OF_LIGHT_1
	dbw $04, .OAMData_1x1_Palette0 ; SPRITE_ANIM_OAMSET_EVOLUTION_BALL_OF_LIGHT_2
	dbw $00, .OAMData_RadioTuningKnob ; SPRITE_ANIM_OAMSET_RADIO_TUNING_KNOB
	dbw $00, .OAMData_PartyMonWithMail1 ; SPRITE_ANIM_OAMSET_PARTY_MON_WITH_MAIL_1
	dbw $00, .OAMData_PartyMonWithMail2 ; SPRITE_ANIM_OAMSET_PARTY_MON_WITH_MAIL_2
	dbw $00, .OAMData_PartyMonWithItem1 ; SPRITE_ANIM_OAMSET_PARTY_MON_WITH_ITEM_1
	dbw $00, .OAMData_PartyMonWithItem2 ; SPRITE_ANIM_OAMSET_PARTY_MON_WITH_ITEM_2
	dbw $00, .OAMData_MagnetTrainRed ; SPRITE_ANIM_OAMSET_MAGNET_TRAIN_RED_1
	dbw $04, .OAMData_MagnetTrainRed ; SPRITE_ANIM_OAMSET_MAGNET_TRAIN_RED_2
	dbw $00, .OAMData_43 ; SPRITE_ANIM_OAMSET_43
	dbw $30, .OAMData_43 ; SPRITE_ANIM_OAMSET_44
	dbw $03, .OAMData_43 ; SPRITE_ANIM_OAMSET_45
	dbw $33, .OAMData_43 ; SPRITE_ANIM_OAMSET_46
	dbw $06, .OAMData_43 ; SPRITE_ANIM_OAMSET_47
	dbw $36, .OAMData_43 ; SPRITE_ANIM_OAMSET_48
	dbw $09, .OAMData_43 ; SPRITE_ANIM_OAMSET_49
	dbw $39, .OAMData_43 ; SPRITE_ANIM_OAMSET_4A
	dbw $0c, .OAMData_4b ; SPRITE_ANIM_OAMSET_4B
	dbw $0c, .OAMData_4c ; SPRITE_ANIM_OAMSET_4C
	dbw $3c, .OAMData_1x1_Palette0 ; SPRITE_ANIM_OAMSET_4D
	dbw $3e, .OAMData_1x1_Palette0 ; SPRITE_ANIM_OAMSET_4E
	dbw $00, .OAMData_Leaf ; SPRITE_ANIM_OAMSET_LEAF
	dbw $00, .OAMData_Tree ; SPRITE_ANIM_OAMSET_TREE_1
	dbw $00, .OAMData_CutTree2 ; SPRITE_ANIM_OAMSET_CUT_TREE_2
	dbw $00, .OAMData_CutTree3 ; SPRITE_ANIM_OAMSET_CUT_TREE_3
	dbw $00, .OAMData_CutTree4 ; SPRITE_ANIM_OAMSET_CUT_TREE_4
	dbw $00, .OAMData_1x1_Palette0 ; SPRITE_ANIM_OAMSET_EGG_CRACK
	dbw $01, .OAMData_1x1_Palette0 ; SPRITE_ANIM_OAMSET_55
	dbw $00, .OAMData_56 ; SPRITE_ANIM_OAMSET_56
	dbw $00, .OAMData_57 ; SPRITE_ANIM_OAMSET_57
	dbw $00, .OAMData_58 ; SPRITE_ANIM_OAMSET_58
	dbw $00, .OAMData_59 ; SPRITE_ANIM_OAMSET_59
	dbw $00, .OAMData_5a ; SPRITE_ANIM_OAMSET_5A
	dbw $04, .OAMData_Tree ; SPRITE_ANIM_OAMSET_HEADBUTT_TREE_2
	dbw $00, .OAMData_5c ; SPRITE_ANIM_OAMSET_5C
	dbw $00, .OAMData_5d ; SPRITE_ANIM_OAMSET_5D
	dbw $00, .OAMData_5e ; SPRITE_ANIM_OAMSET_5E
	dbw $00, .OAMData_5f ; SPRITE_ANIM_OAMSET_5F
	dbw $00, .OAMData_60 ; SPRITE_ANIM_OAMSET_60
	dbw $00, .OAMData_61 ; SPRITE_ANIM_OAMSET_61
	dbw $00, .OAMData_62 ; SPRITE_ANIM_OAMSET_62
	dbw $00, .OAMData_BlueWalk ; SPRITE_ANIM_OAMSET_BLUE_WALK_1
	dbw $04, .OAMData_BlueWalk ; SPRITE_ANIM_OAMSET_BLUE_WALK_2
	dbw $00, .OAMData_MagnetTrainBlue ; SPRITE_ANIM_OAMSET_MAGNET_TRAIN_BLUE_1
	dbw $04, .OAMData_MagnetTrainBlue ; SPRITE_ANIM_OAMSET_MAGNET_TRAIN_BLUE_2
	dbw $20, .OAMData_ForMobile22 ; SPRITE_ANIM_OAMSET_FOR_MOBILE_22_1
	dbw $21, .OAMData_ForMobile22 ; SPRITE_ANIM_OAMSET_FOR_MOBILE_22_2
	dbw $22, .OAMData_ForMobile25_1 ; SPRITE_ANIM_OAMSET_FOR_MOBILE_25_1
	dbw $23, .OAMData_ForMobile25_2 ; SPRITE_ANIM_OAMSET_FOR_MOBILE_25_2
	dbw $27, .OAMData_ForMobile25_3 ; SPRITE_ANIM_OAMSET_FOR_MOBILE_25_3
	dbw $2a, .OAMData_ForMobile23 ; SPRITE_ANIM_OAMSET_FOR_MOBILE_23
	dbw $2a, .OAMData_ForMobile24 ; SPRITE_ANIM_OAMSET_FOR_MOBILE_24
	dbw $00, .OAMData_IntroSuicune1 ; SPRITE_ANIM_OAMSET_INTRO_SUICUNE_1
	dbw $08, .OAMData_IntroSuicune2 ; SPRITE_ANIM_OAMSET_INTRO_SUICUNE_2
	dbw $60, .OAMData_IntroSuicune3 ; SPRITE_ANIM_OAMSET_INTRO_SUICUNE_3
	dbw $68, .OAMData_IntroSuicune4 ; SPRITE_ANIM_OAMSET_INTRO_SUICUNE_4
	dbw $00, .OAMData_IntroPichu ; SPRITE_ANIM_OAMSET_INTRO_PICHU_1
	dbw $05, .OAMData_IntroPichu ; SPRITE_ANIM_OAMSET_INTRO_PICHU_2
	dbw $0a, .OAMData_IntroPichu ; SPRITE_ANIM_OAMSET_INTRO_PICHU_3
	dbw $50, .OAMData_IntroWooper ; SPRITE_ANIM_OAMSET_INTRO_WOOPER
	dbw $00, .OAMData_IntroUnown1 ; SPRITE_ANIM_OAMSET_INTRO_UNOWN_1
	dbw $01, .OAMData_IntroUnown2 ; SPRITE_ANIM_OAMSET_INTRO_UNOWN_2
	dbw $04, .OAMData_IntroUnown3 ; SPRITE_ANIM_OAMSET_INTRO_UNOWN_3
	dbw $00, .OAMData_18 ; SPRITE_ANIM_OAMSET_INTRO_UNOWN_F_2_1
	dbw $01, .OAMData_IntroUnownF2_2 ; SPRITE_ANIM_OAMSET_INTRO_UNOWN_F_2_2
	dbw $03, .OAMData_IntroUnownF2_3 ; SPRITE_ANIM_OAMSET_INTRO_UNOWN_F_2_3
	dbw $08, .OAMData_IntroUnownF2_4_5 ; SPRITE_ANIM_OAMSET_INTRO_UNOWN_F_2_4
	dbw $1c, .OAMData_IntroUnownF2_4_5 ; SPRITE_ANIM_OAMSET_INTRO_UNOWN_F_2_5
	dbw $80, .OAMData_IntroSuicuneAway ; SPRITE_ANIM_OAMSET_INTRO_SUICUNE_AWAY
	dbw $00, .OAMData_Celebi ; SPRITE_ANIM_OAMSET_CELEBI_1
	dbw $04, .OAMData_Celebi ; SPRITE_ANIM_OAMSET_CELEBI_2
	dbw $d0, .OAMData_GameFreakLogo1_3 ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_1
	dbw $d3, .OAMData_GameFreakLogo1_3 ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_2
	dbw $d6, .OAMData_GameFreakLogo1_3 ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_3
	dbw $6c, .OAMData_GameFreakLogo4_11 ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_4
	dbw $68, .OAMData_GameFreakLogo4_11 ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_5
	dbw $64, .OAMData_GameFreakLogo4_11 ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_6
	dbw $60, .OAMData_GameFreakLogo4_11 ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_7
	dbw $0c, .OAMData_GameFreakLogo4_11 ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_8
	dbw $08, .OAMData_GameFreakLogo4_11 ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_9
	dbw $04, .OAMData_GameFreakLogo4_11 ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_10
	dbw $00, .OAMData_GameFreakLogo4_11 ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_11

.OAMData_1x1_Palette0:
	db 1
	dsprite -1,  4, -1,  4, $00, $00

.OAMData_04:
	db 4
	dsprite -1,  0, -1,  0, $00, $00
	dsprite -1,  0,  0,  0, $01, $00
	dsprite  0,  0, -1,  0, $10, $00
	dsprite  0,  0,  0,  0, $11, $00

.OAMData_GSIntroStar:
	db 4
	dsprite -1,  0, -1,  0, $00, 0
	dsprite -1,  0,  0,  0, $00, 0 | X_FLIP
	dsprite  0,  0, -1,  0, $01, 0
	dsprite  0,  0,  0,  0, $01, 0 | X_FLIP

.OAMData_TradePokeBall1:
	db 4
	dsprite -1,  0, -1,  0, $00, $80
	dsprite -1,  0,  0,  0, $00, $a0
	dsprite  0,  0, -1,  0, $01, $80
	dsprite  0,  0,  0,  0, $01, $a0

.OAMData_18:
	db 4
	dsprite -1,  0, -1,  0, $00, $00
	dsprite -1,  0,  0,  0, $00, $20
	dsprite  0,  0, -1,  0, $00, $40
	dsprite  0,  0,  0,  0, $00, $60

.OAMData_35:
	db 4
	dsprite -1,  0, -1,  0, $00, $07
	dsprite -1,  0,  0,  0, $00, $27
	dsprite  0,  0, -1,  0, $00, $47
	dsprite  0,  0,  0,  0, $00, $67
; 8db4b

; 8db4b
	db 4
	dsprite -1,  0, -1,  0, $00, $80
	dsprite -1,  0,  0,  0, $00, $a0
	dsprite  0,  0, -1,  0, $00, $c0
	dsprite  0,  0,  0,  0, $00, $e0

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

.OAMData_1a:
	db 36
	dsprite -3,  0, -3,  0, $00, $00
	dsprite -3,  0, -2,  0, $01, $00
	dsprite -3,  0, -1,  0, $02, $00
	dsprite -2,  0, -3,  0, $03, $00
	dsprite -2,  0, -2,  0, $04, $00
	dsprite -2,  0, -1,  0, $05, $00
	dsprite -1,  0, -3,  0, $06, $00
	dsprite -1,  0, -2,  0, $05, $00
	dsprite -1,  0, -1,  0, $05, $00
	dsprite -3,  0,  0,  0, $02, $20
	dsprite -3,  0,  1,  0, $01, $20
	dsprite -3,  0,  2,  0, $00, $20
	dsprite -2,  0,  0,  0, $05, $20
	dsprite -2,  0,  1,  0, $04, $20
	dsprite -2,  0,  2,  0, $03, $20
	dsprite -1,  0,  0,  0, $05, $20
	dsprite -1,  0,  1,  0, $05, $20
	dsprite -1,  0,  2,  0, $06, $20
	dsprite  0,  0, -3,  0, $06, $40
	dsprite  0,  0, -2,  0, $05, $40
	dsprite  0,  0, -1,  0, $05, $40
	dsprite  1,  0, -3,  0, $03, $40
	dsprite  1,  0, -2,  0, $04, $40
	dsprite  1,  0, -1,  0, $05, $40
	dsprite  2,  0, -3,  0, $00, $40
	dsprite  2,  0, -2,  0, $01, $40
	dsprite  2,  0, -1,  0, $02, $40
	dsprite  0,  0,  0,  0, $05, $60
	dsprite  0,  0,  1,  0, $05, $60
	dsprite  0,  0,  2,  0, $06, $60
	dsprite  1,  0,  0,  0, $05, $60
	dsprite  1,  0,  1,  0, $04, $60
	dsprite  1,  0,  2,  0, $03, $60
	dsprite  2,  0,  0,  0, $02, $60
	dsprite  2,  0,  1,  0, $01, $60
	dsprite  2,  0,  2,  0, $00, $60

.OAMData_43:
	db 9
	dsprite -2,  4, -2,  4, $00, $00
	dsprite -2,  4, -1,  4, $01, $00
	dsprite -2,  4,  0,  4, $02, $00
	dsprite -1,  4, -2,  4, $10, $00
	dsprite -1,  4, -1,  4, $11, $00
	dsprite -1,  4,  0,  4, $12, $00
	dsprite  0,  4, -2,  4, $20, $00
	dsprite  0,  4, -1,  4, $21, $00
	dsprite  0,  4,  0,  4, $22, $00

.OAMData_0e:
	db 16
	dsprite -2,  0, -2,  0, $00, $00
	dsprite -2,  0, -1,  0, $01, $00
	dsprite -2,  0,  0,  0, $02, $00
	dsprite -2,  0,  1,  0, $03, $00
	dsprite -1,  0, -2,  0, $10, $00
	dsprite -1,  0, -1,  0, $11, $00
	dsprite -1,  0,  0,  0, $12, $00
	dsprite -1,  0,  1,  0, $13, $00
	dsprite  0,  0, -2,  0, $20, $00
	dsprite  0,  0, -1,  0, $21, $00
	dsprite  0,  0,  0,  0, $22, $00
	dsprite  0,  0,  1,  0, $23, $00
	dsprite  1,  0, -2,  0, $30, $00
	dsprite  1,  0, -1,  0, $31, $00
	dsprite  1,  0,  0,  0, $32, $00
	dsprite  1,  0,  1,  0, $33, $00

.OAMData_1b:
	db 25
	dsprite -3,  4, -3,  4, $00, $00
	dsprite -2,  4, -3,  4, $01, $00
	dsprite -1,  4, -3,  4, $02, $00
	dsprite  0,  4, -3,  4, $03, $00
	dsprite  1,  4, -3,  4, $04, $00
	dsprite -3,  4, -2,  4, $05, $00
	dsprite -2,  4, -2,  4, $06, $00
	dsprite -1,  4, -2,  4, $07, $00
	dsprite  0,  4, -2,  4, $08, $00
	dsprite  1,  4, -2,  4, $09, $00
	dsprite -3,  4, -1,  4, $0a, $00
	dsprite -2,  4, -1,  4, $0b, $00
	dsprite -1,  4, -1,  4, $0c, $00
	dsprite  0,  4, -1,  4, $0d, $00
	dsprite  1,  4, -1,  4, $0e, $00
	dsprite -3,  4,  0,  4, $0f, $00
	dsprite -2,  4,  0,  4, $10, $00
	dsprite -1,  4,  0,  4, $11, $00
	dsprite  0,  4,  0,  4, $12, $00
	dsprite  1,  4,  0,  4, $13, $00
	dsprite -3,  4,  1,  4, $14, $00
	dsprite -2,  4,  1,  4, $15, $00
	dsprite -1,  4,  1,  4, $16, $00
	dsprite  0,  4,  1,  4, $17, $00
	dsprite  1,  4,  1,  4, $18, $00
; 8dcf9

; 8dcf9
	db 36
	dsprite -3,  0, -3,  0, $00, $00
	dsprite -3,  0, -2,  0, $01, $00
	dsprite -3,  0, -1,  0, $02, $00
	dsprite -3,  0,  0,  0, $03, $00
	dsprite -3,  0,  1,  0, $04, $00
	dsprite -3,  0,  2,  0, $05, $00
	dsprite -2,  0, -3,  0, $06, $00
	dsprite -2,  0, -2,  0, $07, $00
	dsprite -2,  0, -1,  0, $08, $00
	dsprite -2,  0,  0,  0, $09, $00
	dsprite -2,  0,  1,  0, $0a, $00
	dsprite -2,  0,  2,  0, $0b, $00
	dsprite -1,  0, -3,  0, $0c, $00
	dsprite -1,  0, -2,  0, $0d, $00
	dsprite -1,  0, -1,  0, $0e, $00
	dsprite -1,  0,  0,  0, $0f, $00
	dsprite -1,  0,  1,  0, $10, $00
	dsprite -1,  0,  2,  0, $11, $00
	dsprite  0,  0, -3,  0, $12, $00
	dsprite  0,  0, -2,  0, $13, $00
	dsprite  0,  0, -1,  0, $14, $00
	dsprite  0,  0,  0,  0, $15, $00
	dsprite  0,  0,  1,  0, $16, $00
	dsprite  0,  0,  2,  0, $17, $00
	dsprite  1,  0, -3,  0, $18, $00
	dsprite  1,  0, -2,  0, $19, $00
	dsprite  1,  0, -1,  0, $1a, $00
	dsprite  1,  0,  0,  0, $1b, $00
	dsprite  1,  0,  1,  0, $1c, $00
	dsprite  1,  0,  2,  0, $1d, $00
	dsprite  2,  0, -3,  0, $1e, $00
	dsprite  2,  0, -2,  0, $1f, $00
	dsprite  2,  0, -1,  0, $20, $00
	dsprite  2,  0,  0,  0, $21, $00
	dsprite  2,  0,  1,  0, $22, $00
	dsprite  2,  0,  2,  0, $23, $00

.OAMData_RedWalk:
	db 4
	dsprite -1,  0, -1,  0, $00, PAL_OW_RED
	dsprite -1,  0,  0,  0, $01, PAL_OW_RED
	dsprite  0,  0, -1,  0, $02, PAL_OW_RED
	dsprite  0,  0,  0,  0, $03, PAL_OW_RED

.OAMData_MagnetTrainRed:
	db 4
	dsprite -1,  0, -1,  0, $00, PAL_OW_RED | BEHIND_BG
	dsprite -1,  0,  0,  0, $01, PAL_OW_RED | BEHIND_BG
	dsprite  0,  0, -1,  0, $02, PAL_OW_RED | BEHIND_BG
	dsprite  0,  0,  0,  0, $03, PAL_OW_RED | BEHIND_BG

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

.OAMData_06:
	db 6
	dsprite -1,  0, -2,  4, $00, $01
	dsprite -1,  0, -1,  4, $01, $01
	dsprite -1,  0,  0,  4, $02, $01
	dsprite  0,  0, -2,  4, $10, $01
	dsprite  0,  0, -1,  4, $11, $01
	dsprite  0,  0,  0,  4, $12, $01

.OAMData_08:
	db 29
	dsprite -3,  0, -3,  0, $00, $00
	dsprite -3,  0, -2,  0, $01, $00
	dsprite -3,  0, -1,  0, $02, $00
	dsprite -3,  0,  0,  0, $03, $00
	dsprite -2,  0, -3,  0, $10, $00
	dsprite -2,  0, -2,  0, $11, $00
	dsprite -2,  0, -1,  0, $12, $00
	dsprite -2,  0,  0,  0, $13, $00
	dsprite -1,  0, -3,  0, $20, $00
	dsprite -1,  0, -2,  0, $21, $00
	dsprite -1,  0, -1,  0, $22, $00
	dsprite -1,  0,  0,  0, $23, $00
	dsprite -1,  0,  1,  0, $24, $00
	dsprite  0,  0, -3,  0, $30, $80
	dsprite  0,  0, -2,  0, $31, $80
	dsprite  0,  0, -1,  0, $32, $80
	dsprite  0,  0,  0,  0, $33, $80
	dsprite  0,  0,  1,  0, $34, $80
	dsprite  1,  0, -3,  0, $40, $80
	dsprite  1,  0, -2,  0, $41, $80
	dsprite  1,  0, -1,  0, $42, $80
	dsprite  1,  0,  0,  0, $43, $80
	dsprite  1,  0,  1,  0, $44, $80
	dsprite  1,  0,  2,  0, $45, $80
	dsprite  2,  0, -2,  0, $51, $80
	dsprite  2,  0, -1,  0, $52, $80
	dsprite  2,  0,  0,  0, $53, $80
	dsprite  2,  0,  1,  0, $54, $80
	dsprite  2,  0,  2,  0, $55, $80

.OAMData_0c:
	db 2
	dsprite -1,  0, -1,  4, $00, $00
	dsprite  0,  0, -1,  4, $10, $00

.OAMData_15:
	db 5
	dsprite -2,  0,  3,  0, $00, $00
	dsprite -2,  0,  4,  0, $01, $00
	dsprite -1,  0,  2,  0, $02, $00
	dsprite -1,  0,  3,  0, $03, $00
	dsprite  0,  0,  2,  0, $04, $00

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

.OAMData_ForFrameset09:
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

.OAMData_22:
	db 15
	dsprite -3,  4, -2,  4, $00, $11
	dsprite -3,  4, -1,  4, $01, $11
	dsprite -3,  4,  0,  4, $02, $11
	dsprite -2,  4, -2,  4, $03, $11
	dsprite -2,  4, -1,  4, $04, $11
	dsprite -2,  4,  0,  4, $05, $11
	dsprite -1,  4, -2,  4, $06, $11
	dsprite -1,  4, -1,  4, $07, $11
	dsprite -1,  4,  0,  4, $08, $11
	dsprite  0,  4, -2,  4, $09, $11
	dsprite  0,  4, -1,  4, $0a, $11
	dsprite  0,  4,  0,  4, $0b, $11
	dsprite  1,  4, -2,  4, $0c, $11
	dsprite  1,  4, -1,  4, $0d, $11
	dsprite  1,  4,  0,  4, $0e, $11

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

.OAMData_4b:
	db 6
	dsprite  0,  0,  0,  0, $00, $00
	dsprite  0,  0,  1,  0, $01, $00
	dsprite  0,  0,  2,  0, $01, $00
	dsprite  0,  0,  3,  0, $01, $00
	dsprite  0,  0,  4,  0, $02, $00
	dsprite  0,  0,  5,  0, $03, $00

.OAMData_4c:
	db 4
	dsprite  0,  0,  0,  0, $00, $00
	dsprite  0,  0,  1,  0, $01, $00
	dsprite  0,  0,  2,  0, $02, $00
	dsprite  0,  0,  3,  0, $03, $00

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

.OAMData_56:
	db 19
	dsprite -1,  0, -4,  0, $00, $00
	dsprite -2,  0, -3,  0, $02, $00
	dsprite  0,  0, -3,  0, $04, $00
	dsprite -3,  0, -2,  0, $06, $00
	dsprite -1,  0, -2,  0, $08, $00
	dsprite  1,  0, -2,  0, $0a, $00
	dsprite -3,  0, -1,  0, $0c, $00
	dsprite -1,  0, -1,  0, $0e, $00
	dsprite  1,  0, -1,  0, $10, $00
	dsprite -3,  0,  0,  0, $12, $00
	dsprite -1,  0,  0,  0, $14, $00
	dsprite  1,  0,  0,  0, $16, $00
	dsprite -3,  0,  1,  0, $18, $00
	dsprite -1,  0,  1,  0, $1a, $00
	dsprite  1,  0,  1,  0, $1c, $00
	dsprite -1,  0,  2,  0, $1e, $00
	dsprite  1,  0,  2,  0, $20, $00
	dsprite -2,  0,  3,  0, $22, $00
	dsprite  0,  0,  3,  0, $24, $00

.OAMData_57:
	db 16
	dsprite -1,  0, -4,  0, $00, $00
	dsprite -2,  0, -3,  0, $02, $00
	dsprite  0,  0, -3,  0, $04, $00
	dsprite -1,  0, -2,  0, $26, $00
	dsprite  1,  0, -2,  0, $0a, $00
	dsprite -3,  0, -1,  0, $28, $00
	dsprite -1,  0, -1,  0, $2a, $00
	dsprite  1,  0, -1,  0, $10, $00
	dsprite -1,  0,  0,  0, $2c, $00
	dsprite  1,  0,  0,  0, $16, $00
	dsprite -1,  0,  1,  0, $30, $00
	dsprite  1,  0,  1,  0, $1c, $00
	dsprite -1,  0,  2,  0, $1e, $00
	dsprite  1,  0,  2,  0, $20, $00
	dsprite -2,  0,  3,  0, $22, $00
	dsprite  0,  0,  3,  0, $24, $00

.OAMData_58:
	db 15
	dsprite -1,  0, -4,  0, $00, $00
	dsprite -2,  0, -3,  0, $02, $00
	dsprite  0,  0, -3,  0, $32, $00
	dsprite -1,  0, -2,  0, $34, $00
	dsprite  1,  0, -2,  0, $36, $00
	dsprite -1,  0, -1,  0, $38, $00
	dsprite  1,  0, -1,  0, $3a, $00
	dsprite -1,  0,  0,  0, $3c, $00
	dsprite  1,  0,  0,  0, $3e, $00
	dsprite -1,  0,  1,  0, $30, $00
	dsprite  1,  0,  1,  0, $1c, $00
	dsprite -1,  0,  2,  0, $1e, $00
	dsprite  1,  0,  2,  0, $20, $00
	dsprite -2,  0,  3,  0, $22, $00
	dsprite  0,  0,  3,  0, $24, $00

.OAMData_59:
	db 17
	dsprite -1,  0, -4,  0, $00, $00
	dsprite -2,  0, -3,  0, $02, $00
	dsprite  0,  0, -3,  0, $04, $00
	dsprite -1,  0, -2,  0, $40, $00
	dsprite  1,  0, -2,  0, $42, $00
	dsprite  3,  0, -2,  0, $44, $00
	dsprite -1,  0, -1,  0, $46, $00
	dsprite  1,  0, -1,  0, $48, $00
	dsprite  3,  0, -1,  0, $4a, $00
	dsprite -1,  0,  0,  0, $4c, $00
	dsprite  1,  0,  0,  0, $4e, $00
	dsprite -1,  0,  1,  0, $30, $00
	dsprite  1,  0,  1,  0, $1c, $00
	dsprite -1,  0,  2,  0, $1e, $00
	dsprite  1,  0,  2,  0, $20, $00
	dsprite -2,  0,  3,  0, $22, $00
	dsprite  0,  0,  3,  0, $24, $00

.OAMData_5a:
	db 17
	dsprite -1,  0, -4,  0, $00, $00
	dsprite -2,  0, -3,  0, $02, $00
	dsprite  0,  0, -3,  0, $04, $00
	dsprite -1,  0, -2,  0, $50, $00
	dsprite  1,  0, -2,  0, $0a, $00
	dsprite -3,  0, -1,  0, $52, $00
	dsprite -1,  0, -1,  0, $54, $00
	dsprite  1,  0, -1,  0, $10, $00
	dsprite -3,  0,  0,  0, $56, $00
	dsprite -1,  0,  0,  0, $2e, $00
	dsprite  1,  0,  0,  0, $16, $00
	dsprite -1,  0,  1,  0, $30, $00
	dsprite  1,  0,  1,  0, $1c, $00
	dsprite -1,  0,  2,  0, $1e, $00
	dsprite  1,  0,  2,  0, $20, $00
	dsprite -2,  0,  3,  0, $22, $00
	dsprite  0,  0,  3,  0, $24, $00

.OAMData_GSTitleTrail:
	db 1
	dsprite -1,  4, -1,  4, $00, 1 | OBP_NUM

.OAMData_5c:
	db 12
	dsprite  0,  0,  0,  0, $30, $00
	dsprite  0,  0,  1,  0, $31, $00
	dsprite  0,  0,  2,  0, $31, $00
	dsprite  0,  0,  3,  0, $31, $00
	dsprite  0,  0,  4,  0, $31, $00
	dsprite  0,  0,  5,  0, $32, $00
	dsprite  1,  0,  0,  0, $33, $00
	dsprite  1,  0,  1,  0, $34, $00
	dsprite  1,  0,  2,  0, $34, $00
	dsprite  1,  0,  3,  0, $34, $00
	dsprite  1,  0,  4,  0, $34, $00
	dsprite  1,  0,  5,  0, $35, $00

.OAMData_5d:
	db 1
	dsprite  0,  0,  0,  0, $ed, $00

.OAMData_5e:
	db 4
	dsprite -1,  7, -1,  7, $30, $00
	dsprite -1,  7,  0,  1, $32, $00
	dsprite  0,  1, -1,  7, $33, $00
	dsprite  0,  1,  0,  1, $35, $00

.OAMData_5f:
	db 8
	dsprite -1,  7, -1,  7, $30, $00
	dsprite -1,  7,  0,  4, $31, $00
	dsprite -1,  7,  1,  4, $31, $00
	dsprite -1,  7,  2,  1, $32, $00
	dsprite  0,  1, -1,  7, $33, $00
	dsprite  0,  1,  0,  4, $34, $00
	dsprite  0,  1,  1,  4, $34, $00
	dsprite  0,  1,  2,  1, $35, $00

.OAMData_60:
	db 1
	dsprite  0,  0,  0,  0, $34, $00

.OAMData_61:
	db 2
	dsprite  0,  0,  0,  0, $30, $00
	dsprite  1,  0,  0,  0, $33, $00

.OAMData_62:
	db 2
	dsprite  0,  0,  0,  0, $32, $00
	dsprite  1,  0,  0,  0, $35, $00

.OAMData_BlueWalk:
	db 4
	dsprite -1,  0, -1,  0, $00, PAL_OW_BLUE
	dsprite -1,  0,  0,  0, $01, PAL_OW_BLUE
	dsprite  0,  0, -1,  0, $02, PAL_OW_BLUE
	dsprite  0,  0,  0,  0, $03, PAL_OW_BLUE

.OAMData_MagnetTrainBlue:
	db 4
	dsprite -1,  0, -1,  0, $00, PAL_OW_BLUE | BEHIND_BG
	dsprite -1,  0,  0,  0, $01, PAL_OW_BLUE | BEHIND_BG
	dsprite  0,  0, -1,  0, $02, PAL_OW_BLUE | BEHIND_BG
	dsprite  0,  0,  0,  0, $03, PAL_OW_BLUE | BEHIND_BG

.OAMData_ForMobile22:
	db 1
	dsprite -1,  4, -1,  4, $00, 2

.OAMData_ForMobile23:
	db 4
	dsprite -2,  0, -1,  4, $00, 3
	dsprite -1,  0, -1,  4, $01, 3
	dsprite  0,  0, -1,  4, $02, 3
	dsprite  1,  0, -1,  4, $03, 3

.OAMData_ForMobile24:
	db 4
	dsprite -2,  0, -1,  4, $03, 4 | Y_FLIP
	dsprite -1,  0, -1,  4, $02, 4 | Y_FLIP
	dsprite  0,  0, -1,  4, $01, 4 | Y_FLIP
	dsprite  1,  0, -1,  4, $00, 4 | Y_FLIP

.OAMData_ForMobile25_1:
	db 4
	dsprite -1,  0, -1,  0, $00, 1
	dsprite -1,  0,  0,  0, $00, 1 | X_FLIP
	dsprite  0,  0, -1,  0, $00, 1 | Y_FLIP
	dsprite  0,  0,  0,  0, $00, 1 | X_FLIP | Y_FLIP

.OAMData_ForMobile25_2:
	db 8
	dsprite -2,  4, -2,  4, $00, 1
	dsprite -2,  4, -1,  4, $01, 1
	dsprite -2,  4,  0,  4, $00, 1 | X_FLIP
	dsprite -1,  4, -2,  4, $02, 1
	dsprite -1,  4,  0,  4, $02, 1 | X_FLIP
	dsprite  0,  4, -2,  4, $00, 1 | Y_FLIP
	dsprite  0,  4, -1,  4, $01, 1 | Y_FLIP
	dsprite  0,  4,  0,  4, $00, 1 | X_FLIP | Y_FLIP

.OAMData_ForMobile25_3:
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
	dsprite -1,  4, -1,  4, $00, $00

.OAMData_IntroUnown2:
	db 3
	dsprite  0,  0, -1,  0, $00, $00
	dsprite -1,  0, -1,  0, $01, $00
	dsprite -1,  0,  0,  0, $02, $00

.OAMData_IntroUnown3:
	db 7
	dsprite  1,  0, -2,  0, $00, $00
	dsprite  0,  0, -2,  0, $01, $00
	dsprite -1,  0, -2,  0, $02, $00
	dsprite -1,  0, -1,  0, $03, $00
	dsprite -2,  0, -1,  0, $04, $00
	dsprite -2,  0,  0,  0, $05, $00
	dsprite -2,  0,  1,  0, $06, $00

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
	dsprite  0,  0,   1,  0, $00, 1 | BEHIND_BG
	dsprite  1,  0,   2,  0, $00, 1 | BEHIND_BG
	dsprite  2,  0,   3,  0, $00, 1 | BEHIND_BG
	dsprite  3,  0,   4,  0, $00, 1 | BEHIND_BG
	dsprite  4,  0,   5,  0, $00, 1 | BEHIND_BG
	dsprite  3,  0,   6,  0, $00, 1 | BEHIND_BG
	dsprite  2,  0,   7,  0, $00, 1 | BEHIND_BG
	dsprite  1,  0,   8,  0, $00, 1 | BEHIND_BG
	dsprite  0,  0,   9,  0, $00, 1 | BEHIND_BG
	dsprite  1,  0,  10,  0, $00, 1 | BEHIND_BG
	dsprite  2,  0,  11,  0, $00, 1 | BEHIND_BG
	dsprite  3,  0,  12,  0, $00, 1 | BEHIND_BG
	dsprite  4,  0,  13,  0, $00, 1 | BEHIND_BG
	dsprite  3,  0,  14,  0, $00, 1 | BEHIND_BG
	dsprite  2,  0,  15,  0, $00, 1 | BEHIND_BG
	dsprite  1,  0,  16,  0, $00, 1 | BEHIND_BG
	dsprite  0,  0, -15,  0, $00, 1 | BEHIND_BG
	dsprite  1,  0, -14,  0, $00, 1 | BEHIND_BG
	dsprite  2,  0, -13,  0, $00, 1 | BEHIND_BG
	dsprite  3,  0, -12,  0, $00, 1 | BEHIND_BG

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
; 8e706
