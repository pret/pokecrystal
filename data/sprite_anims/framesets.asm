SpriteAnimFrameData:
; entries correspond to SPRITE_ANIM_FRAMESET_* constants (see constants/sprite_anim_constants.asm)
	table_width 2, SpriteAnimFrameData
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
	dw .Frameset_GSGameFreakLogoStar
	dw .Frameset_GSGameFreakLogoSparkle
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
	dw .Frameset_GSIntroHoOhLugia
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
	assert_table_length NUM_SPRITE_ANIM_FRAMESETS

.Frameset_00:
	oamframe SPRITE_ANIM_OAMSET_RED_WALK_1, 32
	oamend

.Frameset_PartyMon:
	oamframe SPRITE_ANIM_OAMSET_PARTY_MON_1,  8
	oamframe SPRITE_ANIM_OAMSET_PARTY_MON_2,  8
	oamrestart

.Frameset_PartyMonWithMail:
	oamframe SPRITE_ANIM_OAMSET_PARTY_MON_WITH_MAIL_1,  8
	oamframe SPRITE_ANIM_OAMSET_PARTY_MON_WITH_MAIL_2,  8
	oamrestart

.Frameset_PartyMonWithItem:
	oamframe SPRITE_ANIM_OAMSET_PARTY_MON_WITH_ITEM_1,  8
	oamframe SPRITE_ANIM_OAMSET_PARTY_MON_WITH_ITEM_2,  8
	oamrestart

.Frameset_PartyMonFast:
	oamframe SPRITE_ANIM_OAMSET_PARTY_MON_1,  4
	oamframe SPRITE_ANIM_OAMSET_PARTY_MON_2,  4
	oamrestart

.Frameset_PartyMonWithMailFast:
	oamframe SPRITE_ANIM_OAMSET_PARTY_MON_WITH_MAIL_1,  4
	oamframe SPRITE_ANIM_OAMSET_PARTY_MON_WITH_MAIL_2,  4
	oamrestart

.Frameset_PartyMonWithItemFast:
	oamframe SPRITE_ANIM_OAMSET_PARTY_MON_WITH_ITEM_1,  4
	oamframe SPRITE_ANIM_OAMSET_PARTY_MON_WITH_ITEM_2,  4
	oamrestart

.Frameset_RedWalk:
	oamframe SPRITE_ANIM_OAMSET_RED_WALK_1,  8
	oamframe SPRITE_ANIM_OAMSET_RED_WALK_2,  8
	oamframe SPRITE_ANIM_OAMSET_RED_WALK_1,  8
	oamframe SPRITE_ANIM_OAMSET_RED_WALK_2,  8, OAM_X_FLIP
	oamrestart

.Frameset_BlueWalk:
	oamframe SPRITE_ANIM_OAMSET_BLUE_WALK_1,  8
	oamframe SPRITE_ANIM_OAMSET_BLUE_WALK_2,  8
	oamframe SPRITE_ANIM_OAMSET_BLUE_WALK_1,  8
	oamframe SPRITE_ANIM_OAMSET_BLUE_WALK_2,  8, OAM_X_FLIP
	oamrestart

.Frameset_MagnetTrainBlue:
	oamframe SPRITE_ANIM_OAMSET_MAGNET_TRAIN_BLUE_1,  8
	oamframe SPRITE_ANIM_OAMSET_MAGNET_TRAIN_BLUE_2,  8
	oamframe SPRITE_ANIM_OAMSET_MAGNET_TRAIN_BLUE_1,  8
	oamframe SPRITE_ANIM_OAMSET_MAGNET_TRAIN_BLUE_2,  8, OAM_X_FLIP
	oamrestart

.Frameset_GSTitleTrail:
	oamframe SPRITE_ANIM_OAMSET_GS_TITLE_TRAIL_1,  1
	oamframe SPRITE_ANIM_OAMSET_GS_TITLE_TRAIL_2,  1
	oamrestart

.Frameset_TextEntryCursor:
	oamframe SPRITE_ANIM_OAMSET_TEXT_ENTRY_CURSOR,  1
	oamwait 1
	oamrestart

.Frameset_TextEntryCursorBig:
	oamframe SPRITE_ANIM_OAMSET_TEXT_ENTRY_CURSOR_BIG,  1
	oamwait 1
	oamrestart

.Frameset_GameFreakLogo:
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_1,  12
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_2,   1
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_3,   1
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_2,   4
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_1,  12
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_2,  12
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_3,   4
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_4,  32
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_5,   3
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_6,   3
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_7,   4
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_8,   4
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_9,   4
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_10, 10
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_11,  7
	oamend

.Frameset_GSGameFreakLogoStar:
	oamframe SPRITE_ANIM_OAMSET_GS_GAMEFREAK_LOGO_STAR,  3
	oamframe SPRITE_ANIM_OAMSET_GS_GAMEFREAK_LOGO_STAR,  3, OAM_Y_FLIP
	oamrestart

.Frameset_GSGameFreakLogoSparkle:
	oamframe SPRITE_ANIM_OAMSET_GS_GAMEFREAK_LOGO_SPARKLE_1,  2
	oamframe SPRITE_ANIM_OAMSET_GS_GAMEFREAK_LOGO_SPARKLE_2,  2
	oamframe SPRITE_ANIM_OAMSET_GS_GAMEFREAK_LOGO_SPARKLE_3,  2
	oamframe SPRITE_ANIM_OAMSET_GS_GAMEFREAK_LOGO_SPARKLE_2,  2
	oamrestart

.Frameset_SlotsGolem:
	oamframe SPRITE_ANIM_OAMSET_SLOTS_GOLEM_1,  7
	oamframe SPRITE_ANIM_OAMSET_SLOTS_GOLEM_2,  7
	oamframe SPRITE_ANIM_OAMSET_SLOTS_GOLEM_1,  7, OAM_Y_FLIP
	oamframe SPRITE_ANIM_OAMSET_SLOTS_GOLEM_2,  7, OAM_X_FLIP
	oamrestart

.Frameset_SlotsChansey:
	oamframe SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_1,  7
	oamframe SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_2,  7
	oamframe SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_1,  7
	oamframe SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_3,  7
	oamrestart

.Frameset_SlotsChansey2:
	oamframe SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_1,  7
	oamframe SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_4,  7
	oamframe SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_5,  7
	oamframe SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_4,  7
	oamframe SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_1,  7
	oamend

.Frameset_SlotsEgg:
	oamframe SPRITE_ANIM_OAMSET_SLOTS_EGG, 20
	oamend

.Frameset_StillCursor:
	oamframe SPRITE_ANIM_OAMSET_STILL_CURSOR, 32
	oamend

.Frameset_TradePokeBall:
	oamframe SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1, 32
	oamend

.Frameset_TradePokeBallWobble:
	oamframe SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1,  3
	oamframe SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_2,  3
	oamframe SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1,  3
	oamframe SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_2,  3, OAM_X_FLIP
	oamrestart

.Frameset_TradePoof:
	oamframe SPRITE_ANIM_OAMSET_TRADE_POOF_1,  4
	oamframe SPRITE_ANIM_OAMSET_TRADE_POOF_2,  4
	oamframe SPRITE_ANIM_OAMSET_TRADE_POOF_3,  4
	oamdelete

.Frameset_TradeTubeBulge:
	oamframe SPRITE_ANIM_OAMSET_TRADE_TUBE_BULGE_1,  3
	oamframe SPRITE_ANIM_OAMSET_TRADE_TUBE_BULGE_2,  3
	oamrestart

.Frameset_TrademonIcon:
	oamframe SPRITE_ANIM_OAMSET_TRADEMON_ICON_1,  7
	oamframe SPRITE_ANIM_OAMSET_TRADEMON_ICON_2,  7
	oamrestart

.Frameset_TrademonBubble:
	oamframe SPRITE_ANIM_OAMSET_TRADEMON_BUBBLE, 32
	oamend

.Frameset_EvolutionBallOfLight:
	oamframe SPRITE_ANIM_OAMSET_EVOLUTION_BALL_OF_LIGHT_2,  2
	oamframe SPRITE_ANIM_OAMSET_EVOLUTION_BALL_OF_LIGHT_1,  2
	oamframe SPRITE_ANIM_OAMSET_EVOLUTION_BALL_OF_LIGHT_2,  2
	oamend

.Frameset_RadioTuningKnob:
	oamframe SPRITE_ANIM_OAMSET_RADIO_TUNING_KNOB, 32
	oamend

.Frameset_MagnetTrainRed:
	oamframe SPRITE_ANIM_OAMSET_MAGNET_TRAIN_RED_1,  8
	oamframe SPRITE_ANIM_OAMSET_MAGNET_TRAIN_RED_2,  8
	oamframe SPRITE_ANIM_OAMSET_MAGNET_TRAIN_RED_1,  8
	oamframe SPRITE_ANIM_OAMSET_MAGNET_TRAIN_RED_2,  8, OAM_X_FLIP
	oamrestart

.Frameset_Unknown1: ; unreferenced
	oamframe SPRITE_ANIM_OAMSET_UNUSED_43,  8
	oamframe SPRITE_ANIM_OAMSET_UNUSED_44,  8
	oamrestart

.Frameset_Unknown2: ; unreferenced
	oamframe SPRITE_ANIM_OAMSET_UNUSED_45,  8
	oamframe SPRITE_ANIM_OAMSET_UNUSED_46,  8
	oamrestart

.Frameset_Unknown3: ; unreferenced
	oamframe SPRITE_ANIM_OAMSET_UNUSED_47,  8
	oamframe SPRITE_ANIM_OAMSET_UNUSED_48,  8
	oamrestart

.Frameset_Unknown4: ; unreferenced
	oamframe SPRITE_ANIM_OAMSET_UNUSED_49,  1
	oamframe SPRITE_ANIM_OAMSET_UNUSED_49,  1, OAM_X_FLIP
	oamframe SPRITE_ANIM_OAMSET_UNUSED_49,  1, OAM_X_FLIP, OAM_Y_FLIP
	oamframe SPRITE_ANIM_OAMSET_UNUSED_49,  1, OAM_Y_FLIP
	oamrestart

.Frameset_Unknown5: ; unreferenced
	oamframe SPRITE_ANIM_OAMSET_UNUSED_4A, 32
	oamend

.Frameset_Unknown6: ; unreferenced
	oamframe SPRITE_ANIM_OAMSET_UNUSED_4B, 32
	oamend

.Frameset_Unknown7: ; unreferenced
	oamframe SPRITE_ANIM_OAMSET_UNUSED_4C, 32
	oamend

.Frameset_Unknown8: ; unreferenced
	oamframe SPRITE_ANIM_OAMSET_UNUSED_4D, 32
	oamend

.Frameset_Unknown9: ; unreferenced
	oamframe SPRITE_ANIM_OAMSET_UNUSED_4E,  3
	oamwait 3
	oamrestart

.Frameset_Unused1C:
	oamwait 32
	oamend

.Frameset_Leaf:
	oamframe SPRITE_ANIM_OAMSET_LEAF, 32
	oamend

.Frameset_CutTree:
	oamframe SPRITE_ANIM_OAMSET_TREE_1,      2
	oamframe SPRITE_ANIM_OAMSET_CUT_TREE_2, 16
	oamwait 1
	oamframe SPRITE_ANIM_OAMSET_CUT_TREE_3,  1
	oamwait 1
	oamframe SPRITE_ANIM_OAMSET_CUT_TREE_4,  1
	oamdelete

.Frameset_EggCrack:
	oamframe SPRITE_ANIM_OAMSET_EGG_CRACK, 32
	oamend

.Frameset_EggHatch1:
	oamframe SPRITE_ANIM_OAMSET_EGG_HATCH, 32
	oamend

.Frameset_EggHatch2:
	oamframe SPRITE_ANIM_OAMSET_EGG_HATCH, 32, OAM_X_FLIP
	oamend

.Frameset_EggHatch3:
	oamframe SPRITE_ANIM_OAMSET_EGG_HATCH, 32, OAM_Y_FLIP
	oamend

.Frameset_EggHatch4:
	oamframe SPRITE_ANIM_OAMSET_EGG_HATCH, 32, OAM_X_FLIP, OAM_Y_FLIP
	oamend

.Frameset_GSIntroHoOhLugia:
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_1, 10
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_2,  9
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_3, 10
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_4, 10
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_3,  9
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_5, 10
	oamrestart

.Frameset_HeadbuttTree:
	oamframe SPRITE_ANIM_OAMSET_TREE_1,           2
	oamframe SPRITE_ANIM_OAMSET_HEADBUTT_TREE_2,  2
	oamframe SPRITE_ANIM_OAMSET_TREE_1,           2
	oamframe SPRITE_ANIM_OAMSET_HEADBUTT_TREE_2,  2, OAM_X_FLIP
	oamrestart

.Frameset_EZChatCursor1:
	oamframe SPRITE_ANIM_OAMSET_EZCHAT_CURSOR_1,  2
	oamend

.Frameset_EZChatCursor2:
	oamframe SPRITE_ANIM_OAMSET_EZCHAT_CURSOR_2,  2
	oamend

.Frameset_EZChatCursor3:
	oamframe SPRITE_ANIM_OAMSET_EZCHAT_CURSOR_3,  2
	oamend

.Frameset_EZChatCursor4:
	oamframe SPRITE_ANIM_OAMSET_EZCHAT_CURSOR_4,  2
	oamend

.Frameset_EZChatCursor5:
	oamframe SPRITE_ANIM_OAMSET_EZCHAT_CURSOR_5,  2
	oamend

.Frameset_EZChatCursor6:
	oamframe SPRITE_ANIM_OAMSET_EZCHAT_CURSOR_6,  2
	oamend

.Frameset_EZChatCursor7:
	oamframe SPRITE_ANIM_OAMSET_EZCHAT_CURSOR_7,  2
	oamend

.Frameset_MobileTradeSentBall:
	oamframe SPRITE_ANIM_OAMSET_TRADE_POOF_1,  3
	oamframe SPRITE_ANIM_OAMSET_TRADE_POOF_2,  3
	oamframe SPRITE_ANIM_OAMSET_TRADE_POOF_3,  3
	oamframe SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1,  3
	oamframe SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_2,  3
	oamframe SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1,  3
	oamframe SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_2,  3, OAM_X_FLIP
	oamframe SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1,  3
	oamframe SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_2,  3
	oamframe SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1,  3
	oamframe SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_2,  3, OAM_X_FLIP
	oamframe SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1,  3
	oamframe SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_2,  3
	oamframe SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1,  3
	oamframe SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_2,  3, OAM_X_FLIP
	oamend

.Frameset_MobileTradeOTBall:
	oamframe SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1,  3
	oamframe SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_2,  3
	oamframe SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1,  3
	oamframe SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_2,  3, OAM_X_FLIP
	oamframe SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1,  3
	oamframe SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_2,  3
	oamframe SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1,  3
	oamframe SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_2,  3, OAM_X_FLIP
	oamframe SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1,  3
	oamframe SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_2,  3
	oamframe SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1,  3
	oamframe SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_2,  3, OAM_X_FLIP
	oamframe SPRITE_ANIM_OAMSET_TRADE_POOF_1,  3
	oamframe SPRITE_ANIM_OAMSET_TRADE_POOF_2,  3
	oamframe SPRITE_ANIM_OAMSET_TRADE_POOF_3,  3
	oamdelete

.Frameset_MobileTradeCableBulge:
	oamframe SPRITE_ANIM_OAMSET_MOBILE_TRADE_CABLE_BULGE_1,  3
	oamframe SPRITE_ANIM_OAMSET_MOBILE_TRADE_CABLE_BULGE_2,  3
	oamrestart

.Frameset_MobileTradeSentPulse:
	oamframe SPRITE_ANIM_OAMSET_MOBILE_TRADE_SENT_PULSE,  3
	oamend

.Frameset_MobileTradeOTPulse:
	oamframe SPRITE_ANIM_OAMSET_MOBILE_TRADE_OT_PULSE,  3
	oamend

.Frameset_MobileTradePing:
	oamframe SPRITE_ANIM_OAMSET_MOBILE_TRADE_PING_1,  2
	oamframe SPRITE_ANIM_OAMSET_MOBILE_TRADE_PING_2,  2
	oamframe SPRITE_ANIM_OAMSET_MOBILE_TRADE_PING_3,  2
	oamdelete

.Frameset_IntroSuicune:
	oamframe SPRITE_ANIM_OAMSET_INTRO_SUICUNE_1,  3
	oamframe SPRITE_ANIM_OAMSET_INTRO_SUICUNE_2,  3
	oamframe SPRITE_ANIM_OAMSET_INTRO_SUICUNE_3,  3
	oamframe SPRITE_ANIM_OAMSET_INTRO_SUICUNE_4,  3
	oamrestart

.Frameset_IntroSuicune2:
	oamframe SPRITE_ANIM_OAMSET_INTRO_SUICUNE_4,  3
	oamframe SPRITE_ANIM_OAMSET_INTRO_SUICUNE_1,  7
	oamend

.Frameset_IntroPichu:
	oamframe SPRITE_ANIM_OAMSET_INTRO_PICHU_1, 32
	oamframe SPRITE_ANIM_OAMSET_INTRO_PICHU_2,  7
	oamframe SPRITE_ANIM_OAMSET_INTRO_PICHU_3,  7
	oamend

.Frameset_IntroWooper:
	oamframe SPRITE_ANIM_OAMSET_INTRO_WOOPER,  3
	oamend

.Frameset_IntroUnown1:
	oamframe SPRITE_ANIM_OAMSET_INTRO_UNOWN_1,  3
	oamframe SPRITE_ANIM_OAMSET_INTRO_UNOWN_2,  3
	oamframe SPRITE_ANIM_OAMSET_INTRO_UNOWN_3,  7
	oamdelete

.Frameset_IntroUnown2:
	oamframe SPRITE_ANIM_OAMSET_INTRO_UNOWN_1,  3, OAM_X_FLIP
	oamframe SPRITE_ANIM_OAMSET_INTRO_UNOWN_2,  3, OAM_X_FLIP
	oamframe SPRITE_ANIM_OAMSET_INTRO_UNOWN_3,  7, OAM_X_FLIP
	oamdelete

.Frameset_IntroUnown3:
	oamframe SPRITE_ANIM_OAMSET_INTRO_UNOWN_1,  3, OAM_Y_FLIP
	oamframe SPRITE_ANIM_OAMSET_INTRO_UNOWN_2,  3, OAM_Y_FLIP
	oamframe SPRITE_ANIM_OAMSET_INTRO_UNOWN_3,  7, OAM_Y_FLIP
	oamdelete

.Frameset_IntroUnown4:
	oamframe SPRITE_ANIM_OAMSET_INTRO_UNOWN_1,  3, OAM_X_FLIP, OAM_Y_FLIP
	oamframe SPRITE_ANIM_OAMSET_INTRO_UNOWN_2,  3, OAM_X_FLIP, OAM_Y_FLIP
	oamframe SPRITE_ANIM_OAMSET_INTRO_UNOWN_3,  7, OAM_X_FLIP, OAM_Y_FLIP
	oamdelete

.Frameset_IntroUnownF2:
	oamframe SPRITE_ANIM_OAMSET_INTRO_UNOWN_F_2_1,  3
	oamframe SPRITE_ANIM_OAMSET_INTRO_UNOWN_F_2_2,  3
	oamframe SPRITE_ANIM_OAMSET_INTRO_UNOWN_F_2_3,  3
	oamframe SPRITE_ANIM_OAMSET_INTRO_UNOWN_F_2_4,  7
	oamframe SPRITE_ANIM_OAMSET_INTRO_UNOWN_F_2_5,  7
	oamend

.Frameset_IntroSuicuneAway:
	oamframe SPRITE_ANIM_OAMSET_INTRO_SUICUNE_AWAY,  3
	oamend

.Frameset_IntroUnownF:
	oamwait 0
	oamend

.Frameset_CelebiLeft:
	oamframe SPRITE_ANIM_OAMSET_CELEBI_1,  8
	oamframe SPRITE_ANIM_OAMSET_CELEBI_2,  8
	oamend

.Frameset_CelebiRight:
	oamframe SPRITE_ANIM_OAMSET_CELEBI_1,  8, OAM_X_FLIP
	oamframe SPRITE_ANIM_OAMSET_CELEBI_2,  8, OAM_X_FLIP
	oamend
