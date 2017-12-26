SpriteAnimFrameData: ; 8d6e6
; entries correspond to SPRITE_ANIM_FRAMESET_* constants
	dw .Frameset_00
	dw .Frameset_PartyMon
	dw .Frameset_PartyMonWithMail
	dw .Frameset_PartyMonWithItem
	dw .Frameset_PartyMonFast
	dw .Frameset_PartyMonWithMailFast
	dw .Frameset_PartyMonWithItemFast
	dw .Frameset_GSTitleTrail
	dw .Frameset_TextEntryCursor
	dw .Frameset_09
	dw .Frameset_GameFreakLogo
	dw .Frameset_GSIntroStar
	dw .Frameset_GSIntroSparkle
	dw .Frameset_SlotsGolem
	dw .Frameset_SlotsChansey
	dw .Frameset_SlotsChansey2
	dw .Frameset_SlotsEgg
	dw .Frameset_RedWalk
	dw .Frameset_StillCursor
	dw .Frameset_TradePokeBall
	dw .Frameset_TradePokeBall0
	dw .Frameset_TradePoof
	dw .Frameset_TradeTubeBulge
	dw .Frameset_TrademonIcon
	dw .Frameset_TrademonBubble
	dw .Frameset_EvolutionBallOfLight
	dw .Frameset_RadioTuningKnob
	dw .Frameset_MagnetTrainRed
	dw .Frameset_1c
	dw .Frameset_Leaf
	dw .Frameset_CutTree
	dw .Frameset_EggCrack
	dw .Frameset_EggHatch
	dw .Frameset_21
	dw .Frameset_22
	dw .Frameset_23
	dw .Frameset_24
	dw .Frameset_HeadbuttTree
	dw .Frameset_26
	dw .Frameset_27
	dw .Frameset_28
	dw .Frameset_29
	dw .Frameset_2a
	dw .Frameset_2b
	dw .Frameset_2c
	dw .Frameset_BlueWalk
	dw .Frameset_MagnetTrainBlue
	dw .Frameset_MobileTradeSentBall
	dw .Frameset_MobileTradeOTBall
	dw .Frameset_ForMobile22
	dw .Frameset_ForMobile23
	dw .Frameset_ForMobile24
	dw .Frameset_ForMobile25
	dw .Frameset_IntroSuicune
	dw .Frameset_IntroSuicune2
	dw .Frameset_IntroPichu
	dw .Frameset_IntroWooper
	dw .Frameset_IntroUnown1
	dw .Frameset_IntroUnown2
	dw .Frameset_IntroUnown3
	dw .Frameset_IntroUnown4
	dw .Frameset_IntroUnownF2
	dw .Frameset_IntroSuicuneAway
	dw .Frameset_IntroUnownF
	dw .Frameset_CelebiLeft
	dw .Frameset_CelebiRight
; 8d76a

.Frameset_00:
	frame SPRITE_ANIM_OAMSET_RED_WALK_1, 32
	endanim

.Frameset_PartyMon:
	frame SPRITE_ANIM_OAMSET_RED_WALK_1,  8
	frame SPRITE_ANIM_OAMSET_RED_WALK_2,  8
	dorestart

.Frameset_PartyMonWithMail:
	frame SPRITE_ANIM_OAMSET_PARTY_MON_WITH_MAIL_1,  8
	frame SPRITE_ANIM_OAMSET_PARTY_MON_WITH_MAIL_2,  8
	dorestart

.Frameset_PartyMonWithItem:
	frame SPRITE_ANIM_OAMSET_PARTY_MON_WITH_ITEM_1,  8
	frame SPRITE_ANIM_OAMSET_PARTY_MON_WITH_ITEM_2,  8
	dorestart

.Frameset_PartyMonFast:
	frame SPRITE_ANIM_OAMSET_RED_WALK_1,  4
	frame SPRITE_ANIM_OAMSET_RED_WALK_2,  4
	dorestart

.Frameset_PartyMonWithMailFast:
	frame SPRITE_ANIM_OAMSET_PARTY_MON_WITH_MAIL_1,  4
	frame SPRITE_ANIM_OAMSET_PARTY_MON_WITH_MAIL_2,  4
	dorestart

.Frameset_PartyMonWithItemFast:
	frame SPRITE_ANIM_OAMSET_PARTY_MON_WITH_ITEM_1,  4
	frame SPRITE_ANIM_OAMSET_PARTY_MON_WITH_ITEM_2,  4
	dorestart

.Frameset_RedWalk:
	frame SPRITE_ANIM_OAMSET_RED_WALK_1,  8
	frame SPRITE_ANIM_OAMSET_RED_WALK_2,  8
	frame SPRITE_ANIM_OAMSET_RED_WALK_1,  8
	frame SPRITE_ANIM_OAMSET_RED_WALK_2,  8, OAM_X_FLIP
	dorestart

.Frameset_BlueWalk:
	frame SPRITE_ANIM_OAMSET_BLUE_WALK_1,  8
	frame SPRITE_ANIM_OAMSET_BLUE_WALK_2,  8
	frame SPRITE_ANIM_OAMSET_BLUE_WALK_1,  8
	frame SPRITE_ANIM_OAMSET_BLUE_WALK_2,  8, OAM_X_FLIP
	dorestart

.Frameset_MagnetTrainBlue:
	frame SPRITE_ANIM_OAMSET_MAGNET_TRAIN_BLUE_1,  8
	frame SPRITE_ANIM_OAMSET_MAGNET_TRAIN_BLUE_2,  8
	frame SPRITE_ANIM_OAMSET_MAGNET_TRAIN_BLUE_1,  8
	frame SPRITE_ANIM_OAMSET_MAGNET_TRAIN_BLUE_2,  8, OAM_X_FLIP
	dorestart

.Frameset_GSTitleTrail:
	frame SPRITE_ANIM_OAMSET_GS_TITLE_TRAIL_1,  1
	frame SPRITE_ANIM_OAMSET_GS_TITLE_TRAIL_2,  1
	dorestart

.Frameset_TextEntryCursor:
	frame SPRITE_ANIM_OAMSET_TEXT_ENTRY_CURSOR,  1
	dorepeat  1
	dorestart

.Frameset_09:
	frame SPRITE_ANIM_OAMSET_FOR_FRAMESET_09,  1
	dorepeat  1
	dorestart

.Frameset_GameFreakLogo:
	frame SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_1,  12
	frame SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_2,   1
	frame SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_3,   1
	frame SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_2,   4
	frame SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_1,  12
	frame SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_2,  12
	frame SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_3,   4
	frame SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_4,  32
	frame SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_5,   3
	frame SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_6,   3
	frame SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_7,   4
	frame SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_8,   4
	frame SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_9,   4
	frame SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_10, 10
	frame SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_11,  7
	endanim

.Frameset_GSIntroStar:
	frame SPRITE_ANIM_OAMSET_GS_INTRO_STAR,  3
	frame SPRITE_ANIM_OAMSET_GS_INTRO_STAR,  3, OAM_Y_FLIP
	dorestart

.Frameset_GSIntroSparkle:
	frame SPRITE_ANIM_OAMSET_GS_INTRO_SPARKLE_1,  2
	frame SPRITE_ANIM_OAMSET_GS_INTRO_SPARKLE_2,  2
	frame SPRITE_ANIM_OAMSET_GS_INTRO_SPARKLE_3,  2
	frame SPRITE_ANIM_OAMSET_GS_INTRO_SPARKLE_2,  2
	dorestart

.Frameset_SlotsGolem:
	frame SPRITE_ANIM_OAMSET_SLOTS_GOLEM_1,  7
	frame SPRITE_ANIM_OAMSET_SLOTS_GOLEM_2,  7
	frame SPRITE_ANIM_OAMSET_SLOTS_GOLEM_1,  7, OAM_Y_FLIP
	frame SPRITE_ANIM_OAMSET_SLOTS_GOLEM_2,  7, OAM_X_FLIP
	dorestart

.Frameset_SlotsChansey:
	frame SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_1,  7
	frame SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_2,  7
	frame SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_1,  7
	frame SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_3,  7
	dorestart

.Frameset_SlotsChansey2:
	frame SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_1,  7
	frame SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_4,  7
	frame SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_5,  7
	frame SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_4,  7
	frame SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_1,  7
	endanim

.Frameset_SlotsEgg:
	frame SPRITE_ANIM_OAMSET_SLOTS_EGG, 20
	endanim

.Frameset_StillCursor:
	frame SPRITE_ANIM_OAMSET_STILL_CURSOR, 32
	endanim

.Frameset_TradePokeBall:
	frame SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1, 32
	endanim

.Frameset_TradePokeBall0:
	frame SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1,  3
	frame SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_2,  3
	frame SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1,  3
	frame SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_2,  3, OAM_X_FLIP
	dorestart

.Frameset_TradePoof:
	frame SPRITE_ANIM_OAMSET_TRADE_POOF_1,  4
	frame SPRITE_ANIM_OAMSET_TRADE_POOF_2,  4
	frame SPRITE_ANIM_OAMSET_TRADE_POOF_3,  4
	delanim

.Frameset_TradeTubeBulge:
	frame SPRITE_ANIM_OAMSET_35,  3
	frame SPRITE_ANIM_OAMSET_36,  3
	dorestart

.Frameset_TrademonIcon:
	frame SPRITE_ANIM_OAMSET_TRADEMON_ICON_1,  7
	frame SPRITE_ANIM_OAMSET_TRADEMON_ICON_2,  7
	dorestart

.Frameset_TrademonBubble:
	frame SPRITE_ANIM_OAMSET_TRADEMON_BUBBLE, 32
	endanim

.Frameset_EvolutionBallOfLight:
	frame SPRITE_ANIM_OAMSET_EVOLUTION_BALL_OF_LIGHT_2,  2
	frame SPRITE_ANIM_OAMSET_EVOLUTION_BALL_OF_LIGHT_1,  2
	frame SPRITE_ANIM_OAMSET_EVOLUTION_BALL_OF_LIGHT_2,  2
	endanim

.Frameset_RadioTuningKnob:
	frame SPRITE_ANIM_OAMSET_RADIO_TUNING_KNOB, 32
	endanim

.Frameset_MagnetTrainRed:
	frame SPRITE_ANIM_OAMSET_MAGNET_TRAIN_RED_1,  8
	frame SPRITE_ANIM_OAMSET_MAGNET_TRAIN_RED_2,  8
	frame SPRITE_ANIM_OAMSET_MAGNET_TRAIN_RED_1,  8
	frame SPRITE_ANIM_OAMSET_MAGNET_TRAIN_RED_2,  8, OAM_X_FLIP
	dorestart

; XXX
	frame SPRITE_ANIM_OAMSET_43,  8
	frame SPRITE_ANIM_OAMSET_44,  8
	dorestart

; XXX
	frame SPRITE_ANIM_OAMSET_45,  8
	frame SPRITE_ANIM_OAMSET_46,  8
	dorestart

; XXX
	frame SPRITE_ANIM_OAMSET_47,  8
	frame SPRITE_ANIM_OAMSET_48,  8
	dorestart

; XXX
	frame SPRITE_ANIM_OAMSET_49,  1
	frame SPRITE_ANIM_OAMSET_49,  1, OAM_X_FLIP
	frame SPRITE_ANIM_OAMSET_49,  1, OAM_X_FLIP, OAM_Y_FLIP
	frame SPRITE_ANIM_OAMSET_49,  1, OAM_Y_FLIP
	dorestart

; XXX
	frame SPRITE_ANIM_OAMSET_4A, 32
	endanim

; XXX
	frame SPRITE_ANIM_OAMSET_4B, 32
	endanim

; XXX
	frame SPRITE_ANIM_OAMSET_4C, 32
	endanim

; XXX
	frame SPRITE_ANIM_OAMSET_4D, 32
	endanim

; XXX
	frame SPRITE_ANIM_OAMSET_4E,  3
	dorepeat  3
	dorestart

.Frameset_1c:
	dorepeat 32
	endanim

.Frameset_Leaf:
	frame SPRITE_ANIM_OAMSET_LEAF, 32
	endanim

.Frameset_CutTree:
	frame SPRITE_ANIM_OAMSET_TREE_1,      2
	frame SPRITE_ANIM_OAMSET_CUT_TREE_2, 16
	dorepeat  1
	frame SPRITE_ANIM_OAMSET_CUT_TREE_3,  1
	dorepeat  1
	frame SPRITE_ANIM_OAMSET_CUT_TREE_4,  1
	delanim

.Frameset_EggCrack:
	frame SPRITE_ANIM_OAMSET_EGG_CRACK, 32
	endanim

.Frameset_EggHatch:
	frame SPRITE_ANIM_OAMSET_55, 32
	endanim

.Frameset_21:
	frame SPRITE_ANIM_OAMSET_55, 32, OAM_X_FLIP
	endanim

.Frameset_22:
	frame SPRITE_ANIM_OAMSET_55, 32, OAM_Y_FLIP
	endanim

.Frameset_23:
	frame SPRITE_ANIM_OAMSET_55, 32, OAM_X_FLIP, OAM_Y_FLIP
	endanim

.Frameset_24:
	frame SPRITE_ANIM_OAMSET_56, 10
	frame SPRITE_ANIM_OAMSET_57,  9
	frame SPRITE_ANIM_OAMSET_58, 10
	frame SPRITE_ANIM_OAMSET_59, 10
	frame SPRITE_ANIM_OAMSET_58,  9
	frame SPRITE_ANIM_OAMSET_5A, 10
	dorestart

.Frameset_HeadbuttTree:
	frame SPRITE_ANIM_OAMSET_TREE_1,           2
	frame SPRITE_ANIM_OAMSET_HEADBUTT_TREE_2,  2
	frame SPRITE_ANIM_OAMSET_TREE_1,           2
	frame SPRITE_ANIM_OAMSET_HEADBUTT_TREE_2,  2, OAM_X_FLIP
	dorestart

.Frameset_26:
	frame SPRITE_ANIM_OAMSET_5C,  2
	endanim

.Frameset_27:
	frame SPRITE_ANIM_OAMSET_5D,  2
	endanim

.Frameset_28:
	frame SPRITE_ANIM_OAMSET_5E,  2
	endanim

.Frameset_29:
	frame SPRITE_ANIM_OAMSET_5F,  2
	endanim

.Frameset_2a:
	frame SPRITE_ANIM_OAMSET_60,  2
	endanim

.Frameset_2b:
	frame SPRITE_ANIM_OAMSET_61,  2
	endanim

.Frameset_2c:
	frame SPRITE_ANIM_OAMSET_62,  2
	endanim

.Frameset_MobileTradeSentBall:
	frame SPRITE_ANIM_OAMSET_TRADE_POOF_1,  3
	frame SPRITE_ANIM_OAMSET_TRADE_POOF_2,  3
	frame SPRITE_ANIM_OAMSET_TRADE_POOF_3,  3
	frame SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1,  3
	frame SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_2,  3
	frame SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1,  3
	frame SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_2,  3, OAM_X_FLIP
	frame SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1,  3
	frame SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_2,  3
	frame SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1,  3
	frame SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_2,  3, OAM_X_FLIP
	frame SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1,  3
	frame SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_2,  3
	frame SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1,  3
	frame SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_2,  3, OAM_X_FLIP
	endanim

.Frameset_MobileTradeOTBall:
	frame SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1,  3
	frame SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_2,  3
	frame SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1,  3
	frame SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_2,  3, OAM_X_FLIP
	frame SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1,  3
	frame SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_2,  3
	frame SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1,  3
	frame SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_2,  3, OAM_X_FLIP
	frame SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1,  3
	frame SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_2,  3
	frame SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1,  3
	frame SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_2,  3, OAM_X_FLIP
	frame SPRITE_ANIM_OAMSET_TRADE_POOF_1,  3
	frame SPRITE_ANIM_OAMSET_TRADE_POOF_2,  3
	frame SPRITE_ANIM_OAMSET_TRADE_POOF_3,  3
	delanim

.Frameset_ForMobile22:
	frame SPRITE_ANIM_OAMSET_FOR_MOBILE_22_1,  3
	frame SPRITE_ANIM_OAMSET_FOR_MOBILE_22_2,  3
	dorestart

.Frameset_ForMobile23:
	frame SPRITE_ANIM_OAMSET_FOR_MOBILE_23,  3
	endanim

.Frameset_ForMobile24:
	frame SPRITE_ANIM_OAMSET_FOR_MOBILE_24,  3
	endanim

.Frameset_ForMobile25:
	frame SPRITE_ANIM_OAMSET_FOR_MOBILE_25_1,  2
	frame SPRITE_ANIM_OAMSET_FOR_MOBILE_25_2,  2
	frame SPRITE_ANIM_OAMSET_FOR_MOBILE_25_3,  2
	delanim

.Frameset_IntroSuicune:
	frame SPRITE_ANIM_OAMSET_INTRO_SUICUNE_1,  3
	frame SPRITE_ANIM_OAMSET_INTRO_SUICUNE_2,  3
	frame SPRITE_ANIM_OAMSET_INTRO_SUICUNE_3,  3
	frame SPRITE_ANIM_OAMSET_INTRO_SUICUNE_4,  3
	dorestart

.Frameset_IntroSuicune2:
	frame SPRITE_ANIM_OAMSET_INTRO_SUICUNE_4,  3
	frame SPRITE_ANIM_OAMSET_INTRO_SUICUNE_1,  7
	endanim

.Frameset_IntroPichu:
	frame SPRITE_ANIM_OAMSET_INTRO_PICHU_1, 32
	frame SPRITE_ANIM_OAMSET_INTRO_PICHU_2,  7
	frame SPRITE_ANIM_OAMSET_INTRO_PICHU_3,  7
	endanim

.Frameset_IntroWooper:
	frame SPRITE_ANIM_OAMSET_INTRO_WOOPER,  3
	endanim

.Frameset_IntroUnown1:
	frame SPRITE_ANIM_OAMSET_INTRO_UNOWN_1,  3
	frame SPRITE_ANIM_OAMSET_INTRO_UNOWN_2,  3
	frame SPRITE_ANIM_OAMSET_INTRO_UNOWN_3,  7
	delanim

.Frameset_IntroUnown2:
	frame SPRITE_ANIM_OAMSET_INTRO_UNOWN_1,  3, OAM_X_FLIP
	frame SPRITE_ANIM_OAMSET_INTRO_UNOWN_2,  3, OAM_X_FLIP
	frame SPRITE_ANIM_OAMSET_INTRO_UNOWN_3,  7, OAM_X_FLIP
	delanim

.Frameset_IntroUnown3:
	frame SPRITE_ANIM_OAMSET_INTRO_UNOWN_1,  3, OAM_Y_FLIP
	frame SPRITE_ANIM_OAMSET_INTRO_UNOWN_2,  3, OAM_Y_FLIP
	frame SPRITE_ANIM_OAMSET_INTRO_UNOWN_3,  7, OAM_Y_FLIP
	delanim

.Frameset_IntroUnown4:
	frame SPRITE_ANIM_OAMSET_INTRO_UNOWN_1,  3, OAM_X_FLIP, OAM_Y_FLIP
	frame SPRITE_ANIM_OAMSET_INTRO_UNOWN_2,  3, OAM_X_FLIP, OAM_Y_FLIP
	frame SPRITE_ANIM_OAMSET_INTRO_UNOWN_3,  7, OAM_X_FLIP, OAM_Y_FLIP
	delanim

.Frameset_IntroUnownF2:
	frame SPRITE_ANIM_OAMSET_INTRO_UNOWN_F_2_1,  3
	frame SPRITE_ANIM_OAMSET_INTRO_UNOWN_F_2_2,  3
	frame SPRITE_ANIM_OAMSET_INTRO_UNOWN_F_2_3,  3
	frame SPRITE_ANIM_OAMSET_INTRO_UNOWN_F_2_4,  7
	frame SPRITE_ANIM_OAMSET_INTRO_UNOWN_F_2_5,  7
	endanim

.Frameset_IntroSuicuneAway:
	frame SPRITE_ANIM_OAMSET_INTRO_SUICUNE_AWAY,  3
	endanim

.Frameset_IntroUnownF:
	dorepeat 0
	endanim

.Frameset_CelebiLeft:
	frame SPRITE_ANIM_OAMSET_CELEBI_1,  8
	frame SPRITE_ANIM_OAMSET_CELEBI_2,  8
	endanim

.Frameset_CelebiRight:
	frame SPRITE_ANIM_OAMSET_CELEBI_1,  8, OAM_X_FLIP
	frame SPRITE_ANIM_OAMSET_CELEBI_2,  8, OAM_X_FLIP
	endanim
; 8d94d
