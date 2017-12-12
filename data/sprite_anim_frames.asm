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
	dw .Frameset_31
	dw .Frameset_32
	dw .Frameset_33
	dw .Frameset_34
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
	frame SPRITE_ANIM_FRAME_IDX_RED_WALK_1, 32
	endanim

.Frameset_PartyMon:
	frame SPRITE_ANIM_FRAME_IDX_RED_WALK_1,  8
	frame SPRITE_ANIM_FRAME_IDX_RED_WALK_2,  8
	dorestart

.Frameset_PartyMonWithMail:
	frame SPRITE_ANIM_FRAME_IDX_PARTY_MON_WITH_MAIL_1,  8
	frame SPRITE_ANIM_FRAME_IDX_PARTY_MON_WITH_MAIL_2,  8
	dorestart

.Frameset_PartyMonWithItem:
	frame SPRITE_ANIM_FRAME_IDX_PARTY_MON_WITH_ITEM_1,  8
	frame SPRITE_ANIM_FRAME_IDX_PARTY_MON_WITH_ITEM_2,  8
	dorestart

.Frameset_PartyMonFast:
	frame SPRITE_ANIM_FRAME_IDX_RED_WALK_1,  4
	frame SPRITE_ANIM_FRAME_IDX_RED_WALK_2,  4
	dorestart

.Frameset_PartyMonWithMailFast:
	frame SPRITE_ANIM_FRAME_IDX_PARTY_MON_WITH_MAIL_1,  4
	frame SPRITE_ANIM_FRAME_IDX_PARTY_MON_WITH_MAIL_2,  4
	dorestart

.Frameset_PartyMonWithItemFast:
	frame SPRITE_ANIM_FRAME_IDX_PARTY_MON_WITH_ITEM_1,  4
	frame SPRITE_ANIM_FRAME_IDX_PARTY_MON_WITH_ITEM_2,  4
	dorestart

.Frameset_RedWalk:
	frame SPRITE_ANIM_FRAME_IDX_RED_WALK_1,  8
	frame SPRITE_ANIM_FRAME_IDX_RED_WALK_2,  8
	frame SPRITE_ANIM_FRAME_IDX_RED_WALK_1,  8
	frame SPRITE_ANIM_FRAME_IDX_RED_WALK_2,  8, OAM_X_FLIP
	dorestart

.Frameset_BlueWalk:
	frame SPRITE_ANIM_FRAME_IDX_BLUE_WALK_1,  8
	frame SPRITE_ANIM_FRAME_IDX_BLUE_WALK_2,  8
	frame SPRITE_ANIM_FRAME_IDX_BLUE_WALK_1,  8
	frame SPRITE_ANIM_FRAME_IDX_BLUE_WALK_2,  8, OAM_X_FLIP
	dorestart

.Frameset_MagnetTrainBlue:
	frame SPRITE_ANIM_FRAME_IDX_MAGNET_TRAIN_BLUE_1,  8
	frame SPRITE_ANIM_FRAME_IDX_MAGNET_TRAIN_BLUE_2,  8
	frame SPRITE_ANIM_FRAME_IDX_MAGNET_TRAIN_BLUE_1,  8
	frame SPRITE_ANIM_FRAME_IDX_MAGNET_TRAIN_BLUE_2,  8, OAM_X_FLIP
	dorestart

.Frameset_GSTitleTrail:
	frame SPRITE_ANIM_FRAME_IDX_GS_TITLE_TRAIL_1,  1
	frame SPRITE_ANIM_FRAME_IDX_GS_TITLE_TRAIL_2,  1
	dorestart

.Frameset_TextEntryCursor:
	frame SPRITE_ANIM_FRAME_IDX_TEXT_ENTRY_CURSOR,  1
	dorepeat  1
	dorestart

.Frameset_09:
	frame SPRITE_ANIM_FRAME_IDX_FOR_FRAMESET_09,  1
	dorepeat  1
	dorestart

.Frameset_GameFreakLogo:
	frame SPRITE_ANIM_FRAME_IDX_GAMEFREAK_LOGO_1,  12
	frame SPRITE_ANIM_FRAME_IDX_GAMEFREAK_LOGO_2,   1
	frame SPRITE_ANIM_FRAME_IDX_GAMEFREAK_LOGO_3,   1
	frame SPRITE_ANIM_FRAME_IDX_GAMEFREAK_LOGO_2,   4
	frame SPRITE_ANIM_FRAME_IDX_GAMEFREAK_LOGO_1,  12
	frame SPRITE_ANIM_FRAME_IDX_GAMEFREAK_LOGO_2,  12
	frame SPRITE_ANIM_FRAME_IDX_GAMEFREAK_LOGO_3,   4
	frame SPRITE_ANIM_FRAME_IDX_GAMEFREAK_LOGO_4,  32
	frame SPRITE_ANIM_FRAME_IDX_GAMEFREAK_LOGO_5,   3
	frame SPRITE_ANIM_FRAME_IDX_GAMEFREAK_LOGO_6,   3
	frame SPRITE_ANIM_FRAME_IDX_GAMEFREAK_LOGO_7,   4
	frame SPRITE_ANIM_FRAME_IDX_GAMEFREAK_LOGO_8,   4
	frame SPRITE_ANIM_FRAME_IDX_GAMEFREAK_LOGO_9,   4
	frame SPRITE_ANIM_FRAME_IDX_GAMEFREAK_LOGO_10, 10
	frame SPRITE_ANIM_FRAME_IDX_GAMEFREAK_LOGO_11,  7
	endanim

.Frameset_GSIntroStar:
	frame SPRITE_ANIM_FRAME_IDX_GS_INTRO_STAR,  3
	frame SPRITE_ANIM_FRAME_IDX_GS_INTRO_STAR,  3, OAM_Y_FLIP
	dorestart

.Frameset_GSIntroSparkle:
	frame SPRITE_ANIM_FRAME_IDX_GS_INTRO_SPARKLE_1,  2
	frame SPRITE_ANIM_FRAME_IDX_GS_INTRO_SPARKLE_2,  2
	frame SPRITE_ANIM_FRAME_IDX_GS_INTRO_SPARKLE_3,  2
	frame SPRITE_ANIM_FRAME_IDX_GS_INTRO_SPARKLE_2,  2
	dorestart

.Frameset_SlotsGolem:
	frame SPRITE_ANIM_FRAME_IDX_SLOTS_GOLEM_1,  7
	frame SPRITE_ANIM_FRAME_IDX_SLOTS_GOLEM_2,  7
	frame SPRITE_ANIM_FRAME_IDX_SLOTS_GOLEM_1,  7, OAM_Y_FLIP
	frame SPRITE_ANIM_FRAME_IDX_SLOTS_GOLEM_2,  7, OAM_X_FLIP
	dorestart

.Frameset_SlotsChansey:
	frame SPRITE_ANIM_FRAME_IDX_SLOTS_CHANSEY_1,  7
	frame SPRITE_ANIM_FRAME_IDX_SLOTS_CHANSEY_2,  7
	frame SPRITE_ANIM_FRAME_IDX_SLOTS_CHANSEY_1,  7
	frame SPRITE_ANIM_FRAME_IDX_SLOTS_CHANSEY_3,  7
	dorestart

.Frameset_SlotsChansey2:
	frame SPRITE_ANIM_FRAME_IDX_SLOTS_CHANSEY_1,  7
	frame SPRITE_ANIM_FRAME_IDX_SLOTS_CHANSEY_4,  7
	frame SPRITE_ANIM_FRAME_IDX_SLOTS_CHANSEY_5,  7
	frame SPRITE_ANIM_FRAME_IDX_SLOTS_CHANSEY_4,  7
	frame SPRITE_ANIM_FRAME_IDX_SLOTS_CHANSEY_1,  7
	endanim

.Frameset_SlotsEgg:
	frame SPRITE_ANIM_FRAME_IDX_SLOTS_EGG, 20
	endanim

.Frameset_StillCursor:
	frame SPRITE_ANIM_FRAME_IDX_STILL_CURSOR, 32
	endanim

.Frameset_TradePokeBall:
	frame SPRITE_ANIM_FRAME_IDX_TRADE_POKE_BALL_1, 32
	endanim

.Frameset_TradePokeBall0:
	frame SPRITE_ANIM_FRAME_IDX_TRADE_POKE_BALL_1,  3
	frame SPRITE_ANIM_FRAME_IDX_TRADE_POKE_BALL_2,  3
	frame SPRITE_ANIM_FRAME_IDX_TRADE_POKE_BALL_1,  3
	frame SPRITE_ANIM_FRAME_IDX_TRADE_POKE_BALL_2,  3, OAM_X_FLIP
	dorestart

.Frameset_TradePoof:
	frame SPRITE_ANIM_FRAME_IDX_32,  4
	frame SPRITE_ANIM_FRAME_IDX_33,  4
	frame SPRITE_ANIM_FRAME_IDX_34,  4
	delanim

.Frameset_TradeTubeBulge:
	frame SPRITE_ANIM_FRAME_IDX_35,  3
	frame SPRITE_ANIM_FRAME_IDX_36,  3
	dorestart

.Frameset_TrademonIcon:
	frame SPRITE_ANIM_FRAME_IDX_TRADEMON_ICON_1,  7
	frame SPRITE_ANIM_FRAME_IDX_TRADEMON_ICON_2,  7
	dorestart

.Frameset_TrademonBubble:
	frame SPRITE_ANIM_FRAME_IDX_39, 32
	endanim

.Frameset_EvolutionBallOfLight:
	frame SPRITE_ANIM_FRAME_IDX_3B,  2
	frame SPRITE_ANIM_FRAME_IDX_3A,  2
	frame SPRITE_ANIM_FRAME_IDX_3B,  2
	endanim

.Frameset_RadioTuningKnob:
	frame SPRITE_ANIM_FRAME_IDX_RADIO_TUNING_KNOB, 32
	endanim

.Frameset_MagnetTrainRed:
	frame SPRITE_ANIM_FRAME_IDX_41,  8
	frame SPRITE_ANIM_FRAME_IDX_42,  8
	frame SPRITE_ANIM_FRAME_IDX_41,  8
	frame SPRITE_ANIM_FRAME_IDX_42,  8, OAM_X_FLIP
	dorestart

; XXX
	frame SPRITE_ANIM_FRAME_IDX_43,  8
	frame SPRITE_ANIM_FRAME_IDX_44,  8
	dorestart

; XXX
	frame SPRITE_ANIM_FRAME_IDX_45,  8
	frame SPRITE_ANIM_FRAME_IDX_46,  8
	dorestart

; XXX
	frame SPRITE_ANIM_FRAME_IDX_47,  8
	frame SPRITE_ANIM_FRAME_IDX_48,  8
	dorestart

; XXX
	frame SPRITE_ANIM_FRAME_IDX_49,  1
	frame SPRITE_ANIM_FRAME_IDX_49,  1, OAM_X_FLIP
	frame SPRITE_ANIM_FRAME_IDX_49,  1, OAM_X_FLIP, OAM_Y_FLIP
	frame SPRITE_ANIM_FRAME_IDX_49,  1, OAM_Y_FLIP
	dorestart

; XXX
	frame SPRITE_ANIM_FRAME_IDX_4A, 32
	endanim

; XXX
	frame SPRITE_ANIM_FRAME_IDX_4B, 32
	endanim

; XXX
	frame SPRITE_ANIM_FRAME_IDX_4C, 32
	endanim

; XXX
	frame SPRITE_ANIM_FRAME_IDX_4D, 32
	endanim

; XXX
	frame SPRITE_ANIM_FRAME_IDX_4E,  3
	dorepeat  3
	dorestart

.Frameset_1c:
	dorepeat 32
	endanim

.Frameset_Leaf:
	frame SPRITE_ANIM_FRAME_IDX_LEAF, 32
	endanim

.Frameset_CutTree:
	frame SPRITE_ANIM_FRAME_IDX_TREE_1,      2
	frame SPRITE_ANIM_FRAME_IDX_CUT_TREE_2, 16
	dorepeat  1
	frame SPRITE_ANIM_FRAME_IDX_CUT_TREE_3,  1
	dorepeat  1
	frame SPRITE_ANIM_FRAME_IDX_CUT_TREE_4,  1
	delanim

.Frameset_EggCrack:
	frame SPRITE_ANIM_FRAME_IDX_EGG_CRACK, 32
	endanim

.Frameset_EggHatch:
	frame SPRITE_ANIM_FRAME_IDX_55, 32
	endanim

.Frameset_21:
	frame SPRITE_ANIM_FRAME_IDX_55, 32, OAM_X_FLIP
	endanim

.Frameset_22:
	frame SPRITE_ANIM_FRAME_IDX_55, 32, OAM_Y_FLIP
	endanim

.Frameset_23:
	frame SPRITE_ANIM_FRAME_IDX_55, 32, OAM_X_FLIP, OAM_Y_FLIP
	endanim

.Frameset_24:
	frame SPRITE_ANIM_FRAME_IDX_56, 10
	frame SPRITE_ANIM_FRAME_IDX_57,  9
	frame SPRITE_ANIM_FRAME_IDX_58, 10
	frame SPRITE_ANIM_FRAME_IDX_59, 10
	frame SPRITE_ANIM_FRAME_IDX_58,  9
	frame SPRITE_ANIM_FRAME_IDX_5A, 10
	dorestart

.Frameset_HeadbuttTree:
	frame SPRITE_ANIM_FRAME_IDX_TREE_1,           2
	frame SPRITE_ANIM_FRAME_IDX_HEADBUTT_TREE_2,  2
	frame SPRITE_ANIM_FRAME_IDX_TREE_1,           2
	frame SPRITE_ANIM_FRAME_IDX_HEADBUTT_TREE_2,  2, OAM_X_FLIP
	dorestart

.Frameset_26:
	frame SPRITE_ANIM_FRAME_IDX_5C,  2
	endanim

.Frameset_27:
	frame SPRITE_ANIM_FRAME_IDX_5D,  2
	endanim

.Frameset_28:
	frame SPRITE_ANIM_FRAME_IDX_5E,  2
	endanim

.Frameset_29:
	frame SPRITE_ANIM_FRAME_IDX_5F,  2
	endanim

.Frameset_2a:
	frame SPRITE_ANIM_FRAME_IDX_60,  2
	endanim

.Frameset_2b:
	frame SPRITE_ANIM_FRAME_IDX_61,  2
	endanim

.Frameset_2c:
	frame SPRITE_ANIM_FRAME_IDX_62,  2
	endanim

.Frameset_MobileTradeSentBall:
	frame SPRITE_ANIM_FRAME_IDX_32,  3
	frame SPRITE_ANIM_FRAME_IDX_33,  3
	frame SPRITE_ANIM_FRAME_IDX_34,  3
	frame SPRITE_ANIM_FRAME_IDX_TRADE_POKE_BALL_1,  3
	frame SPRITE_ANIM_FRAME_IDX_TRADE_POKE_BALL_2,  3
	frame SPRITE_ANIM_FRAME_IDX_TRADE_POKE_BALL_1,  3
	frame SPRITE_ANIM_FRAME_IDX_TRADE_POKE_BALL_2,  3, OAM_X_FLIP
	frame SPRITE_ANIM_FRAME_IDX_TRADE_POKE_BALL_1,  3
	frame SPRITE_ANIM_FRAME_IDX_TRADE_POKE_BALL_2,  3
	frame SPRITE_ANIM_FRAME_IDX_TRADE_POKE_BALL_1,  3
	frame SPRITE_ANIM_FRAME_IDX_TRADE_POKE_BALL_2,  3, OAM_X_FLIP
	frame SPRITE_ANIM_FRAME_IDX_TRADE_POKE_BALL_1,  3
	frame SPRITE_ANIM_FRAME_IDX_TRADE_POKE_BALL_2,  3
	frame SPRITE_ANIM_FRAME_IDX_TRADE_POKE_BALL_1,  3
	frame SPRITE_ANIM_FRAME_IDX_TRADE_POKE_BALL_2,  3, OAM_X_FLIP
	endanim

.Frameset_MobileTradeOTBall:
	frame SPRITE_ANIM_FRAME_IDX_TRADE_POKE_BALL_1,  3
	frame SPRITE_ANIM_FRAME_IDX_TRADE_POKE_BALL_2,  3
	frame SPRITE_ANIM_FRAME_IDX_TRADE_POKE_BALL_1,  3
	frame SPRITE_ANIM_FRAME_IDX_TRADE_POKE_BALL_2,  3, OAM_X_FLIP
	frame SPRITE_ANIM_FRAME_IDX_TRADE_POKE_BALL_1,  3
	frame SPRITE_ANIM_FRAME_IDX_TRADE_POKE_BALL_2,  3
	frame SPRITE_ANIM_FRAME_IDX_TRADE_POKE_BALL_1,  3
	frame SPRITE_ANIM_FRAME_IDX_TRADE_POKE_BALL_2,  3, OAM_X_FLIP
	frame SPRITE_ANIM_FRAME_IDX_TRADE_POKE_BALL_1,  3
	frame SPRITE_ANIM_FRAME_IDX_TRADE_POKE_BALL_2,  3
	frame SPRITE_ANIM_FRAME_IDX_TRADE_POKE_BALL_1,  3
	frame SPRITE_ANIM_FRAME_IDX_TRADE_POKE_BALL_2,  3, OAM_X_FLIP
	frame SPRITE_ANIM_FRAME_IDX_32,  3
	frame SPRITE_ANIM_FRAME_IDX_33,  3
	frame SPRITE_ANIM_FRAME_IDX_34,  3
	delanim

.Frameset_31:
	frame SPRITE_ANIM_FRAME_IDX_67,  3
	frame SPRITE_ANIM_FRAME_IDX_68,  3
	dorestart

.Frameset_32:
	frame SPRITE_ANIM_FRAME_IDX_6C,  3
	endanim

.Frameset_33:
	frame SPRITE_ANIM_FRAME_IDX_6D,  3
	endanim

.Frameset_34:
	frame SPRITE_ANIM_FRAME_IDX_69,  2
	frame SPRITE_ANIM_FRAME_IDX_6A,  2
	frame SPRITE_ANIM_FRAME_IDX_6B,  2
	delanim

.Frameset_IntroSuicune:
	frame SPRITE_ANIM_FRAME_IDX_6E,  3
	frame SPRITE_ANIM_FRAME_IDX_6F,  3
	frame SPRITE_ANIM_FRAME_IDX_70,  3
	frame SPRITE_ANIM_FRAME_IDX_71,  3
	dorestart

.Frameset_IntroSuicune2:
	frame SPRITE_ANIM_FRAME_IDX_71,  3
	frame SPRITE_ANIM_FRAME_IDX_6E,  7
	endanim

.Frameset_IntroPichu:
	frame SPRITE_ANIM_FRAME_IDX_72, 32
	frame SPRITE_ANIM_FRAME_IDX_73,  7
	frame SPRITE_ANIM_FRAME_IDX_74,  7
	endanim

.Frameset_IntroWooper:
	frame SPRITE_ANIM_FRAME_IDX_75,  3
	endanim

.Frameset_IntroUnown1:
	frame SPRITE_ANIM_FRAME_IDX_76,  3
	frame SPRITE_ANIM_FRAME_IDX_77,  3
	frame SPRITE_ANIM_FRAME_IDX_78,  7
	delanim

.Frameset_IntroUnown2:
	frame SPRITE_ANIM_FRAME_IDX_76,  3, OAM_X_FLIP
	frame SPRITE_ANIM_FRAME_IDX_77,  3, OAM_X_FLIP
	frame SPRITE_ANIM_FRAME_IDX_78,  7, OAM_X_FLIP
	delanim

.Frameset_IntroUnown3:
	frame SPRITE_ANIM_FRAME_IDX_76,  3, OAM_Y_FLIP
	frame SPRITE_ANIM_FRAME_IDX_77,  3, OAM_Y_FLIP
	frame SPRITE_ANIM_FRAME_IDX_78,  7, OAM_Y_FLIP
	delanim

.Frameset_IntroUnown4:
	frame SPRITE_ANIM_FRAME_IDX_76,  3, OAM_X_FLIP, OAM_Y_FLIP
	frame SPRITE_ANIM_FRAME_IDX_77,  3, OAM_X_FLIP, OAM_Y_FLIP
	frame SPRITE_ANIM_FRAME_IDX_78,  7, OAM_X_FLIP, OAM_Y_FLIP
	delanim

.Frameset_IntroUnownF2:
	frame SPRITE_ANIM_FRAME_IDX_79,  3
	frame SPRITE_ANIM_FRAME_IDX_7A,  3
	frame SPRITE_ANIM_FRAME_IDX_7B,  3
	frame SPRITE_ANIM_FRAME_IDX_7C,  7
	frame SPRITE_ANIM_FRAME_IDX_7D,  7
	endanim

.Frameset_IntroSuicuneAway:
	frame SPRITE_ANIM_FRAME_IDX_INTRO_SUICUNE_AWAY,  3
	endanim

.Frameset_IntroUnownF:
	dorepeat 0
	endanim

.Frameset_CelebiLeft:
	frame SPRITE_ANIM_FRAME_IDX_CELEBI_1,  8
	frame SPRITE_ANIM_FRAME_IDX_CELEBI_2,  8
	endanim

.Frameset_CelebiRight:
	frame SPRITE_ANIM_FRAME_IDX_CELEBI_1,  8, OAM_X_FLIP
	frame SPRITE_ANIM_FRAME_IDX_CELEBI_2,  8, OAM_X_FLIP
	endanim
; 8d94d
