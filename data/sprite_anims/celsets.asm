SpriteAnim_CelSets:
; entries correspond to SPRANIM_CELSET_* constants (see constants/sprite_anim_constants.asm)
	table_width 2
	dw .Celset_00
	dw .Celset_PartyMon
	dw .Celset_PartyMonWithMail
	dw .Celset_PartyMonWithItem
	dw .Celset_PartyMonFast
	dw .Celset_PartyMonWithMailFast
	dw .Celset_PartyMonWithItemFast
	dw .Celset_GSTitleTrail
	dw .Celset_TextEntryCursor
	dw .Celset_TextEntryCursorBig
	dw .Celset_GameFreakLogo
	dw .Celset_GSGameFreakLogoStar
	dw .Celset_GSGameFreakLogoSparkle
	dw .Celset_SlotsGolem
	dw .Celset_SlotsChansey
	dw .Celset_SlotsChansey2
	dw .Celset_SlotsEgg
	dw .Celset_RedWalk
	dw .Celset_StillCursor
	dw .Celset_TradePokeBall
	dw .Celset_TradePokeBallWobble
	dw .Celset_TradePoof
	dw .Celset_TradeTubeBulge
	dw .Celset_TrademonIcon
	dw .Celset_TrademonBubble
	dw .Celset_EvolutionBallOfLight
	dw .Celset_RadioTuningKnob
	dw .Celset_MagnetTrainRed
	dw .Celset_Unused1C
	dw .Celset_Leaf
	dw .Celset_CutTree
	dw .Celset_EggCrack
	dw .Celset_EggHatch1
	dw .Celset_EggHatch2
	dw .Celset_EggHatch3
	dw .Celset_EggHatch4
	dw .Celset_GSIntroHoOhLugia
	dw .Celset_HeadbuttTree
	dw .Celset_EZChatCursor1
	dw .Celset_EZChatCursor2
	dw .Celset_EZChatCursor3
	dw .Celset_EZChatCursor4
	dw .Celset_EZChatCursor5
	dw .Celset_EZChatCursor6
	dw .Celset_EZChatCursor7
	dw .Celset_BlueWalk
	dw .Celset_MagnetTrainBlue
	dw .Celset_MobileTradeSentBall
	dw .Celset_MobileTradeOTBall
	dw .Celset_MobileTradeCableBulge
	dw .Celset_MobileTradeSentPulse
	dw .Celset_MobileTradeOTPulse
	dw .Celset_MobileTradePing
	dw .Celset_IntroSuicune
	dw .Celset_IntroSuicune2
	dw .Celset_IntroPichu
	dw .Celset_IntroWooper
	dw .Celset_IntroUnown1
	dw .Celset_IntroUnown2
	dw .Celset_IntroUnown3
	dw .Celset_IntroUnown4
	dw .Celset_IntroUnownF2
	dw .Celset_IntroSuicuneAway
	dw .Celset_IntroUnownF
	dw .Celset_CelebiLeft
	dw .Celset_CelebiRight
	assert_table_length NUM_SPRANIM_CELSETS

.Celset_00:
	oamcel SPRANIM_OAMSET_RED_WALK_1, 32
	oamend

.Celset_PartyMon:
	oamcel SPRANIM_OAMSET_RED_WALK_1,  8
	oamcel SPRANIM_OAMSET_RED_WALK_2,  8
	oamrestart

.Celset_PartyMonWithMail:
	oamcel SPRANIM_OAMSET_PARTY_MON_WITH_MAIL_1,  8
	oamcel SPRANIM_OAMSET_PARTY_MON_WITH_MAIL_2,  8
	oamrestart

.Celset_PartyMonWithItem:
	oamcel SPRANIM_OAMSET_PARTY_MON_WITH_ITEM_1,  8
	oamcel SPRANIM_OAMSET_PARTY_MON_WITH_ITEM_2,  8
	oamrestart

.Celset_PartyMonFast:
	oamcel SPRANIM_OAMSET_RED_WALK_1,  4
	oamcel SPRANIM_OAMSET_RED_WALK_2,  4
	oamrestart

.Celset_PartyMonWithMailFast:
	oamcel SPRANIM_OAMSET_PARTY_MON_WITH_MAIL_1,  4
	oamcel SPRANIM_OAMSET_PARTY_MON_WITH_MAIL_2,  4
	oamrestart

.Celset_PartyMonWithItemFast:
	oamcel SPRANIM_OAMSET_PARTY_MON_WITH_ITEM_1,  4
	oamcel SPRANIM_OAMSET_PARTY_MON_WITH_ITEM_2,  4
	oamrestart

.Celset_RedWalk:
	oamcel SPRANIM_OAMSET_RED_WALK_1,  8
	oamcel SPRANIM_OAMSET_RED_WALK_2,  8
	oamcel SPRANIM_OAMSET_RED_WALK_1,  8
	oamcel SPRANIM_OAMSET_RED_WALK_2,  8, B_OAM_XFLIP
	oamrestart

.Celset_BlueWalk:
	oamcel SPRANIM_OAMSET_BLUE_WALK_1,  8
	oamcel SPRANIM_OAMSET_BLUE_WALK_2,  8
	oamcel SPRANIM_OAMSET_BLUE_WALK_1,  8
	oamcel SPRANIM_OAMSET_BLUE_WALK_2,  8, B_OAM_XFLIP
	oamrestart

.Celset_MagnetTrainBlue:
	oamcel SPRANIM_OAMSET_MAGNET_TRAIN_BLUE_1,  8
	oamcel SPRANIM_OAMSET_MAGNET_TRAIN_BLUE_2,  8
	oamcel SPRANIM_OAMSET_MAGNET_TRAIN_BLUE_1,  8
	oamcel SPRANIM_OAMSET_MAGNET_TRAIN_BLUE_2,  8, B_OAM_XFLIP
	oamrestart

.Celset_GSTitleTrail:
	oamcel SPRANIM_OAMSET_GS_TITLE_TRAIL_1,  1
	oamcel SPRANIM_OAMSET_GS_TITLE_TRAIL_2,  1
	oamrestart

.Celset_TextEntryCursor:
	oamcel SPRANIM_OAMSET_TEXT_ENTRY_CURSOR,  1
	oamwait 1
	oamrestart

.Celset_TextEntryCursorBig:
	oamcel SPRANIM_OAMSET_TEXT_ENTRY_CURSOR_BIG,  1
	oamwait 1
	oamrestart

.Celset_GameFreakLogo:
	oamcel SPRANIM_OAMSET_GAMEFREAK_LOGO_1,  12
	oamcel SPRANIM_OAMSET_GAMEFREAK_LOGO_2,   1
	oamcel SPRANIM_OAMSET_GAMEFREAK_LOGO_3,   1
	oamcel SPRANIM_OAMSET_GAMEFREAK_LOGO_2,   4
	oamcel SPRANIM_OAMSET_GAMEFREAK_LOGO_1,  12
	oamcel SPRANIM_OAMSET_GAMEFREAK_LOGO_2,  12
	oamcel SPRANIM_OAMSET_GAMEFREAK_LOGO_3,   4
	oamcel SPRANIM_OAMSET_GAMEFREAK_LOGO_4,  32
	oamcel SPRANIM_OAMSET_GAMEFREAK_LOGO_5,   3
	oamcel SPRANIM_OAMSET_GAMEFREAK_LOGO_6,   3
	oamcel SPRANIM_OAMSET_GAMEFREAK_LOGO_7,   4
	oamcel SPRANIM_OAMSET_GAMEFREAK_LOGO_8,   4
	oamcel SPRANIM_OAMSET_GAMEFREAK_LOGO_9,   4
	oamcel SPRANIM_OAMSET_GAMEFREAK_LOGO_10, 10
	oamcel SPRANIM_OAMSET_GAMEFREAK_LOGO_11,  7
	oamend

.Celset_GSGameFreakLogoStar:
	oamcel SPRANIM_OAMSET_GS_GAMEFREAK_LOGO_STAR,  3
	oamcel SPRANIM_OAMSET_GS_GAMEFREAK_LOGO_STAR,  3, B_OAM_YFLIP
	oamrestart

.Celset_GSGameFreakLogoSparkle:
	oamcel SPRANIM_OAMSET_GS_GAMEFREAK_LOGO_SPARKLE_1,  2
	oamcel SPRANIM_OAMSET_GS_GAMEFREAK_LOGO_SPARKLE_2,  2
	oamcel SPRANIM_OAMSET_GS_GAMEFREAK_LOGO_SPARKLE_3,  2
	oamcel SPRANIM_OAMSET_GS_GAMEFREAK_LOGO_SPARKLE_2,  2
	oamrestart

.Celset_SlotsGolem:
	oamcel SPRANIM_OAMSET_SLOTS_GOLEM_1,  7
	oamcel SPRANIM_OAMSET_SLOTS_GOLEM_2,  7
	oamcel SPRANIM_OAMSET_SLOTS_GOLEM_1,  7, B_OAM_YFLIP
	oamcel SPRANIM_OAMSET_SLOTS_GOLEM_2,  7, B_OAM_XFLIP
	oamrestart

.Celset_SlotsChansey:
	oamcel SPRANIM_OAMSET_SLOTS_CHANSEY_1,  7
	oamcel SPRANIM_OAMSET_SLOTS_CHANSEY_2,  7
	oamcel SPRANIM_OAMSET_SLOTS_CHANSEY_1,  7
	oamcel SPRANIM_OAMSET_SLOTS_CHANSEY_3,  7
	oamrestart

.Celset_SlotsChansey2:
	oamcel SPRANIM_OAMSET_SLOTS_CHANSEY_1,  7
	oamcel SPRANIM_OAMSET_SLOTS_CHANSEY_4,  7
	oamcel SPRANIM_OAMSET_SLOTS_CHANSEY_5,  7
	oamcel SPRANIM_OAMSET_SLOTS_CHANSEY_4,  7
	oamcel SPRANIM_OAMSET_SLOTS_CHANSEY_1,  7
	oamend

.Celset_SlotsEgg:
	oamcel SPRANIM_OAMSET_SLOTS_EGG, 20
	oamend

.Celset_StillCursor:
	oamcel SPRANIM_OAMSET_STILL_CURSOR, 32
	oamend

.Celset_TradePokeBall:
	oamcel SPRANIM_OAMSET_TRADE_POKE_BALL_1, 32
	oamend

.Celset_TradePokeBallWobble:
	oamcel SPRANIM_OAMSET_TRADE_POKE_BALL_1,  3
	oamcel SPRANIM_OAMSET_TRADE_POKE_BALL_2,  3
	oamcel SPRANIM_OAMSET_TRADE_POKE_BALL_1,  3
	oamcel SPRANIM_OAMSET_TRADE_POKE_BALL_2,  3, B_OAM_XFLIP
	oamrestart

.Celset_TradePoof:
	oamcel SPRANIM_OAMSET_TRADE_POOF_1,  4
	oamcel SPRANIM_OAMSET_TRADE_POOF_2,  4
	oamcel SPRANIM_OAMSET_TRADE_POOF_3,  4
	oamdelete

.Celset_TradeTubeBulge:
	oamcel SPRANIM_OAMSET_TRADE_TUBE_BULGE_1,  3
	oamcel SPRANIM_OAMSET_TRADE_TUBE_BULGE_2,  3
	oamrestart

.Celset_TrademonIcon:
	oamcel SPRANIM_OAMSET_TRADEMON_ICON_1,  7
	oamcel SPRANIM_OAMSET_TRADEMON_ICON_2,  7
	oamrestart

.Celset_TrademonBubble:
	oamcel SPRANIM_OAMSET_TRADEMON_BUBBLE, 32
	oamend

.Celset_EvolutionBallOfLight:
	oamcel SPRANIM_OAMSET_EVOLUTION_BALL_OF_LIGHT_2,  2
	oamcel SPRANIM_OAMSET_EVOLUTION_BALL_OF_LIGHT_1,  2
	oamcel SPRANIM_OAMSET_EVOLUTION_BALL_OF_LIGHT_2,  2
	oamend

.Celset_RadioTuningKnob:
	oamcel SPRANIM_OAMSET_RADIO_TUNING_KNOB, 32
	oamend

.Celset_MagnetTrainRed:
	oamcel SPRANIM_OAMSET_MAGNET_TRAIN_RED_1,  8
	oamcel SPRANIM_OAMSET_MAGNET_TRAIN_RED_2,  8
	oamcel SPRANIM_OAMSET_MAGNET_TRAIN_RED_1,  8
	oamcel SPRANIM_OAMSET_MAGNET_TRAIN_RED_2,  8, B_OAM_XFLIP
	oamrestart

.Celset_Unknown1: ; unreferenced
	oamcel SPRANIM_OAMSET_UNUSED_43,  8
	oamcel SPRANIM_OAMSET_UNUSED_44,  8
	oamrestart

.Celset_Unknown2: ; unreferenced
	oamcel SPRANIM_OAMSET_UNUSED_45,  8
	oamcel SPRANIM_OAMSET_UNUSED_46,  8
	oamrestart

.Celset_Unknown3: ; unreferenced
	oamcel SPRANIM_OAMSET_UNUSED_47,  8
	oamcel SPRANIM_OAMSET_UNUSED_48,  8
	oamrestart

.Celset_Unknown4: ; unreferenced
	oamcel SPRANIM_OAMSET_UNUSED_49,  1
	oamcel SPRANIM_OAMSET_UNUSED_49,  1, B_OAM_XFLIP
	oamcel SPRANIM_OAMSET_UNUSED_49,  1, B_OAM_XFLIP, B_OAM_YFLIP
	oamcel SPRANIM_OAMSET_UNUSED_49,  1, B_OAM_YFLIP
	oamrestart

.Celset_Unknown5: ; unreferenced
	oamcel SPRANIM_OAMSET_UNUSED_4A, 32
	oamend

.Celset_Unknown6: ; unreferenced
	oamcel SPRANIM_OAMSET_UNUSED_4B, 32
	oamend

.Celset_Unknown7: ; unreferenced
	oamcel SPRANIM_OAMSET_UNUSED_4C, 32
	oamend

.Celset_Unknown8: ; unreferenced
	oamcel SPRANIM_OAMSET_UNUSED_4D, 32
	oamend

.Celset_Unknown9: ; unreferenced
	oamcel SPRANIM_OAMSET_UNUSED_4E,  3
	oamwait 3
	oamrestart

.Celset_Unused1C:
	oamwait 32
	oamend

.Celset_Leaf:
	oamcel SPRANIM_OAMSET_LEAF, 32
	oamend

.Celset_CutTree:
	oamcel SPRANIM_OAMSET_TREE_1,      2
	oamcel SPRANIM_OAMSET_CUT_TREE_2, 16
	oamwait 1
	oamcel SPRANIM_OAMSET_CUT_TREE_3,  1
	oamwait 1
	oamcel SPRANIM_OAMSET_CUT_TREE_4,  1
	oamdelete

.Celset_EggCrack:
	oamcel SPRANIM_OAMSET_EGG_CRACK, 32
	oamend

.Celset_EggHatch1:
	oamcel SPRANIM_OAMSET_EGG_HATCH, 32
	oamend

.Celset_EggHatch2:
	oamcel SPRANIM_OAMSET_EGG_HATCH, 32, B_OAM_XFLIP
	oamend

.Celset_EggHatch3:
	oamcel SPRANIM_OAMSET_EGG_HATCH, 32, B_OAM_YFLIP
	oamend

.Celset_EggHatch4:
	oamcel SPRANIM_OAMSET_EGG_HATCH, 32, B_OAM_XFLIP, B_OAM_YFLIP
	oamend

.Celset_GSIntroHoOhLugia:
	oamcel SPRANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_1, 10
	oamcel SPRANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_2,  9
	oamcel SPRANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_3, 10
	oamcel SPRANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_4, 10
	oamcel SPRANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_3,  9
	oamcel SPRANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_5, 10
	oamrestart

.Celset_HeadbuttTree:
	oamcel SPRANIM_OAMSET_TREE_1,           2
	oamcel SPRANIM_OAMSET_HEADBUTT_TREE_2,  2
	oamcel SPRANIM_OAMSET_TREE_1,           2
	oamcel SPRANIM_OAMSET_HEADBUTT_TREE_2,  2, B_OAM_XFLIP
	oamrestart

.Celset_EZChatCursor1:
	oamcel SPRANIM_OAMSET_EZCHAT_CURSOR_1,  2
	oamend

.Celset_EZChatCursor2:
	oamcel SPRANIM_OAMSET_EZCHAT_CURSOR_2,  2
	oamend

.Celset_EZChatCursor3:
	oamcel SPRANIM_OAMSET_EZCHAT_CURSOR_3,  2
	oamend

.Celset_EZChatCursor4:
	oamcel SPRANIM_OAMSET_EZCHAT_CURSOR_4,  2
	oamend

.Celset_EZChatCursor5:
	oamcel SPRANIM_OAMSET_EZCHAT_CURSOR_5,  2
	oamend

.Celset_EZChatCursor6:
	oamcel SPRANIM_OAMSET_EZCHAT_CURSOR_6,  2
	oamend

.Celset_EZChatCursor7:
	oamcel SPRANIM_OAMSET_EZCHAT_CURSOR_7,  2
	oamend

.Celset_MobileTradeSentBall:
	oamcel SPRANIM_OAMSET_TRADE_POOF_1,  3
	oamcel SPRANIM_OAMSET_TRADE_POOF_2,  3
	oamcel SPRANIM_OAMSET_TRADE_POOF_3,  3
	oamcel SPRANIM_OAMSET_TRADE_POKE_BALL_1,  3
	oamcel SPRANIM_OAMSET_TRADE_POKE_BALL_2,  3
	oamcel SPRANIM_OAMSET_TRADE_POKE_BALL_1,  3
	oamcel SPRANIM_OAMSET_TRADE_POKE_BALL_2,  3, B_OAM_XFLIP
	oamcel SPRANIM_OAMSET_TRADE_POKE_BALL_1,  3
	oamcel SPRANIM_OAMSET_TRADE_POKE_BALL_2,  3
	oamcel SPRANIM_OAMSET_TRADE_POKE_BALL_1,  3
	oamcel SPRANIM_OAMSET_TRADE_POKE_BALL_2,  3, B_OAM_XFLIP
	oamcel SPRANIM_OAMSET_TRADE_POKE_BALL_1,  3
	oamcel SPRANIM_OAMSET_TRADE_POKE_BALL_2,  3
	oamcel SPRANIM_OAMSET_TRADE_POKE_BALL_1,  3
	oamcel SPRANIM_OAMSET_TRADE_POKE_BALL_2,  3, B_OAM_XFLIP
	oamend

.Celset_MobileTradeOTBall:
	oamcel SPRANIM_OAMSET_TRADE_POKE_BALL_1,  3
	oamcel SPRANIM_OAMSET_TRADE_POKE_BALL_2,  3
	oamcel SPRANIM_OAMSET_TRADE_POKE_BALL_1,  3
	oamcel SPRANIM_OAMSET_TRADE_POKE_BALL_2,  3, B_OAM_XFLIP
	oamcel SPRANIM_OAMSET_TRADE_POKE_BALL_1,  3
	oamcel SPRANIM_OAMSET_TRADE_POKE_BALL_2,  3
	oamcel SPRANIM_OAMSET_TRADE_POKE_BALL_1,  3
	oamcel SPRANIM_OAMSET_TRADE_POKE_BALL_2,  3, B_OAM_XFLIP
	oamcel SPRANIM_OAMSET_TRADE_POKE_BALL_1,  3
	oamcel SPRANIM_OAMSET_TRADE_POKE_BALL_2,  3
	oamcel SPRANIM_OAMSET_TRADE_POKE_BALL_1,  3
	oamcel SPRANIM_OAMSET_TRADE_POKE_BALL_2,  3, B_OAM_XFLIP
	oamcel SPRANIM_OAMSET_TRADE_POOF_1,  3
	oamcel SPRANIM_OAMSET_TRADE_POOF_2,  3
	oamcel SPRANIM_OAMSET_TRADE_POOF_3,  3
	oamdelete

.Celset_MobileTradeCableBulge:
	oamcel SPRANIM_OAMSET_MOBILE_TRADE_CABLE_BULGE_1,  3
	oamcel SPRANIM_OAMSET_MOBILE_TRADE_CABLE_BULGE_2,  3
	oamrestart

.Celset_MobileTradeSentPulse:
	oamcel SPRANIM_OAMSET_MOBILE_TRADE_SENT_PULSE,  3
	oamend

.Celset_MobileTradeOTPulse:
	oamcel SPRANIM_OAMSET_MOBILE_TRADE_OT_PULSE,  3
	oamend

.Celset_MobileTradePing:
	oamcel SPRANIM_OAMSET_MOBILE_TRADE_PING_1,  2
	oamcel SPRANIM_OAMSET_MOBILE_TRADE_PING_2,  2
	oamcel SPRANIM_OAMSET_MOBILE_TRADE_PING_3,  2
	oamdelete

.Celset_IntroSuicune:
	oamcel SPRANIM_OAMSET_INTRO_SUICUNE_1,  3
	oamcel SPRANIM_OAMSET_INTRO_SUICUNE_2,  3
	oamcel SPRANIM_OAMSET_INTRO_SUICUNE_3,  3
	oamcel SPRANIM_OAMSET_INTRO_SUICUNE_4,  3
	oamrestart

.Celset_IntroSuicune2:
	oamcel SPRANIM_OAMSET_INTRO_SUICUNE_4,  3
	oamcel SPRANIM_OAMSET_INTRO_SUICUNE_1,  7
	oamend

.Celset_IntroPichu:
	oamcel SPRANIM_OAMSET_INTRO_PICHU_1, 32
	oamcel SPRANIM_OAMSET_INTRO_PICHU_2,  7
	oamcel SPRANIM_OAMSET_INTRO_PICHU_3,  7
	oamend

.Celset_IntroWooper:
	oamcel SPRANIM_OAMSET_INTRO_WOOPER,  3
	oamend

.Celset_IntroUnown1:
	oamcel SPRANIM_OAMSET_INTRO_UNOWN_1,  3
	oamcel SPRANIM_OAMSET_INTRO_UNOWN_2,  3
	oamcel SPRANIM_OAMSET_INTRO_UNOWN_3,  7
	oamdelete

.Celset_IntroUnown2:
	oamcel SPRANIM_OAMSET_INTRO_UNOWN_1,  3, B_OAM_XFLIP
	oamcel SPRANIM_OAMSET_INTRO_UNOWN_2,  3, B_OAM_XFLIP
	oamcel SPRANIM_OAMSET_INTRO_UNOWN_3,  7, B_OAM_XFLIP
	oamdelete

.Celset_IntroUnown3:
	oamcel SPRANIM_OAMSET_INTRO_UNOWN_1,  3, B_OAM_YFLIP
	oamcel SPRANIM_OAMSET_INTRO_UNOWN_2,  3, B_OAM_YFLIP
	oamcel SPRANIM_OAMSET_INTRO_UNOWN_3,  7, B_OAM_YFLIP
	oamdelete

.Celset_IntroUnown4:
	oamcel SPRANIM_OAMSET_INTRO_UNOWN_1,  3, B_OAM_XFLIP, B_OAM_YFLIP
	oamcel SPRANIM_OAMSET_INTRO_UNOWN_2,  3, B_OAM_XFLIP, B_OAM_YFLIP
	oamcel SPRANIM_OAMSET_INTRO_UNOWN_3,  7, B_OAM_XFLIP, B_OAM_YFLIP
	oamdelete

.Celset_IntroUnownF2:
	oamcel SPRANIM_OAMSET_INTRO_UNOWN_F_2_1,  3
	oamcel SPRANIM_OAMSET_INTRO_UNOWN_F_2_2,  3
	oamcel SPRANIM_OAMSET_INTRO_UNOWN_F_2_3,  3
	oamcel SPRANIM_OAMSET_INTRO_UNOWN_F_2_4,  7
	oamcel SPRANIM_OAMSET_INTRO_UNOWN_F_2_5,  7
	oamend

.Celset_IntroSuicuneAway:
	oamcel SPRANIM_OAMSET_INTRO_SUICUNE_AWAY,  3
	oamend

.Celset_IntroUnownF:
	oamwait 0
	oamend

.Celset_CelebiLeft:
	oamcel SPRANIM_OAMSET_CELEBI_1,  8
	oamcel SPRANIM_OAMSET_CELEBI_2,  8
	oamend

.Celset_CelebiRight:
	oamcel SPRANIM_OAMSET_CELEBI_1,  8, B_OAM_XFLIP
	oamcel SPRANIM_OAMSET_CELEBI_2,  8, B_OAM_XFLIP
	oamend
