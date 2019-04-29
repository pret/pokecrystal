SpriteAnimFrameData:
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
	dw .Frameset_TextEntryCursorBig
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
	dw .Frameset_TradePokeBallWobble
	dw .Frameset_TradePoof
	dw .Frameset_TradeTubeBulge
	dw .Frameset_TrademonIcon
	dw .Frameset_TrademonBubble
	dw .Frameset_EvolutionBallOfLight
	dw .Frameset_RadioTuningKnob
	dw .Frameset_MagnetTrainRed
	dw .Frameset_Unused1C
	dw .Frameset_Leaf
	dw .Frameset_CutTree
	dw .Frameset_EggCrack
	dw .Frameset_EggHatch1
	dw .Frameset_EggHatch2
	dw .Frameset_EggHatch3
	dw .Frameset_EggHatch4
	dw .Frameset_GSIntroHoOh
	dw .Frameset_HeadbuttTree
	dw .Frameset_EZChatCursor1
	dw .Frameset_EZChatCursor2
	dw .Frameset_EZChatCursor3
	dw .Frameset_EZChatCursor4
	dw .Frameset_EZChatCursor5
	dw .Frameset_EZChatCursor6
	dw .Frameset_EZChatCursor7
	dw .Frameset_BlueWalk
	dw .Frameset_MagnetTrainBlue
	dw .Frameset_MobileTradeSentBall
	dw .Frameset_MobileTradeOTBall
	dw .Frameset_MobileTradeCableBulge
	dw .Frameset_MobileTradeSentPulse
	dw .Frameset_MobileTradeOTPulse
	dw .Frameset_MobileTradePing
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
	dowait 1
	dorestart

.Frameset_TextEntryCursorBig:
	frame SPRITE_ANIM_OAMSET_TEXT_ENTRY_CURSOR_BIG,  1
	dowait 1
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

.Frameset_TradePokeBallWobble:
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
	frame SPRITE_ANIM_OAMSET_TRADE_TUBE_BULGE_1,  3
	frame SPRITE_ANIM_OAMSET_TRADE_TUBE_BULGE_2,  3
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

; unused
	frame SPRITE_ANIM_OAMSET_UNUSED_43,  8
	frame SPRITE_ANIM_OAMSET_UNUSED_44,  8
	dorestart

; unused
	frame SPRITE_ANIM_OAMSET_UNUSED_45,  8
	frame SPRITE_ANIM_OAMSET_UNUSED_46,  8
	dorestart

; unused
	frame SPRITE_ANIM_OAMSET_UNUSED_47,  8
	frame SPRITE_ANIM_OAMSET_UNUSED_48,  8
	dorestart

; unused
	frame SPRITE_ANIM_OAMSET_UNUSED_49,  1
	frame SPRITE_ANIM_OAMSET_UNUSED_49,  1, OAM_X_FLIP
	frame SPRITE_ANIM_OAMSET_UNUSED_49,  1, OAM_X_FLIP, OAM_Y_FLIP
	frame SPRITE_ANIM_OAMSET_UNUSED_49,  1, OAM_Y_FLIP
	dorestart

; unused
	frame SPRITE_ANIM_OAMSET_UNUSED_4A, 32
	endanim

; unused
	frame SPRITE_ANIM_OAMSET_UNUSED_4B, 32
	endanim

; unused
	frame SPRITE_ANIM_OAMSET_UNUSED_4C, 32
	endanim

; unused
	frame SPRITE_ANIM_OAMSET_UNUSED_4D, 32
	endanim

; unused
	frame SPRITE_ANIM_OAMSET_UNUSED_4E,  3
	dowait 3
	dorestart

.Frameset_Unused1C:
	dowait 32
	endanim

.Frameset_Leaf:
	frame SPRITE_ANIM_OAMSET_LEAF, 32
	endanim

.Frameset_CutTree:
	frame SPRITE_ANIM_OAMSET_TREE_1,      2
	frame SPRITE_ANIM_OAMSET_CUT_TREE_2, 16
	dowait 1
	frame SPRITE_ANIM_OAMSET_CUT_TREE_3,  1
	dowait 1
	frame SPRITE_ANIM_OAMSET_CUT_TREE_4,  1
	delanim

.Frameset_EggCrack:
	frame SPRITE_ANIM_OAMSET_EGG_CRACK, 32
	endanim

.Frameset_EggHatch1:
	frame SPRITE_ANIM_OAMSET_EGG_HATCH, 32
	endanim

.Frameset_EggHatch2:
	frame SPRITE_ANIM_OAMSET_EGG_HATCH, 32, OAM_X_FLIP
	endanim

.Frameset_EggHatch3:
	frame SPRITE_ANIM_OAMSET_EGG_HATCH, 32, OAM_Y_FLIP
	endanim

.Frameset_EggHatch4:
	frame SPRITE_ANIM_OAMSET_EGG_HATCH, 32, OAM_X_FLIP, OAM_Y_FLIP
	endanim

.Frameset_GSIntroHoOh:
	frame SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_1, 10
	frame SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_2,  9
	frame SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_3, 10
	frame SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_4, 10
	frame SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_3,  9
	frame SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_5, 10
	dorestart

.Frameset_HeadbuttTree:
	frame SPRITE_ANIM_OAMSET_TREE_1,           2
	frame SPRITE_ANIM_OAMSET_HEADBUTT_TREE_2,  2
	frame SPRITE_ANIM_OAMSET_TREE_1,           2
	frame SPRITE_ANIM_OAMSET_HEADBUTT_TREE_2,  2, OAM_X_FLIP
	dorestart

.Frameset_EZChatCursor1:
	frame SPRITE_ANIM_OAMSET_EZCHAT_CURSOR_1,  2
	endanim

.Frameset_EZChatCursor2:
	frame SPRITE_ANIM_OAMSET_EZCHAT_CURSOR_2,  2
	endanim

.Frameset_EZChatCursor3:
	frame SPRITE_ANIM_OAMSET_EZCHAT_CURSOR_3,  2
	endanim

.Frameset_EZChatCursor4:
	frame SPRITE_ANIM_OAMSET_EZCHAT_CURSOR_4,  2
	endanim

.Frameset_EZChatCursor5:
	frame SPRITE_ANIM_OAMSET_EZCHAT_CURSOR_5,  2
	endanim

.Frameset_EZChatCursor6:
	frame SPRITE_ANIM_OAMSET_EZCHAT_CURSOR_6,  2
	endanim

.Frameset_EZChatCursor7:
	frame SPRITE_ANIM_OAMSET_EZCHAT_CURSOR_7,  2
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

.Frameset_MobileTradeCableBulge:
	frame SPRITE_ANIM_OAMSET_MOBILE_TRADE_CABLE_BULGE_1,  3
	frame SPRITE_ANIM_OAMSET_MOBILE_TRADE_CABLE_BULGE_2,  3
	dorestart

.Frameset_MobileTradeSentPulse:
	frame SPRITE_ANIM_OAMSET_MOBILE_TRADE_SENT_PULSE,  3
	endanim

.Frameset_MobileTradeOTPulse:
	frame SPRITE_ANIM_OAMSET_MOBILE_TRADE_OT_PULSE,  3
	endanim

.Frameset_MobileTradePing:
	frame SPRITE_ANIM_OAMSET_MOBILE_TRADE_PING_1,  2
	frame SPRITE_ANIM_OAMSET_MOBILE_TRADE_PING_2,  2
	frame SPRITE_ANIM_OAMSET_MOBILE_TRADE_PING_3,  2
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
	dowait 0
	endanim

.Frameset_CelebiLeft:
	frame SPRITE_ANIM_OAMSET_CELEBI_1,  8
	frame SPRITE_ANIM_OAMSET_CELEBI_2,  8
	endanim

.Frameset_CelebiRight:
	frame SPRITE_ANIM_OAMSET_CELEBI_1,  8, OAM_X_FLIP
	frame SPRITE_ANIM_OAMSET_CELEBI_2,  8, OAM_X_FLIP
	endanim
