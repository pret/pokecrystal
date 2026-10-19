
SpriteAnim_OAMSets: const_def
MACRO spriteanim_oamset
	const \1
	export \1
	db \2
	dw \3
ENDM
	table_width 3
	spriteanim_oamset SPRANIM_OAMSET_RED_WALK_1,                  $00, .OAMSet_RedWalk
	spriteanim_oamset SPRANIM_OAMSET_RED_WALK_2,                  $04, .OAMSet_RedWalk
	spriteanim_oamset SPRANIM_OAMSET_GS_INTRO_BUBBLE_1,           $4c, .OAMSet_1x1_Palette0
	spriteanim_oamset SPRANIM_OAMSET_GS_INTRO_BUBBLE_2,           $5c, .OAMSet_1x1_Palette0
	spriteanim_oamset SPRANIM_OAMSET_GS_INTRO_SHELLDER_1,         $6c, .OAMSet_GSIntroShellder
	spriteanim_oamset SPRANIM_OAMSET_GS_INTRO_SHELLDER_2,         $6e, .OAMSet_GSIntroShellder
	spriteanim_oamset SPRANIM_OAMSET_GS_INTRO_MAGIKARP_1,         $2d, .OAMSet_GSIntroMagikarp
	spriteanim_oamset SPRANIM_OAMSET_GS_INTRO_MAGIKARP_2,         $4d, .OAMSet_GSIntroMagikarp
	spriteanim_oamset SPRANIM_OAMSET_GS_INTRO_UNUSED_LAPRAS,      $60, .OAMSet_GSIntroLapras
	spriteanim_oamset SPRANIM_OAMSET_GS_INTRO_LAPRAS_1,           $00, .OAMSet_GSIntroLapras
	spriteanim_oamset SPRANIM_OAMSET_GS_INTRO_LAPRAS_2,           $00, .OAMSet_GSIntroLapras
	spriteanim_oamset SPRANIM_OAMSET_GS_INTRO_LAPRAS_3,           $06, .OAMSet_GSIntroLapras
	spriteanim_oamset SPRANIM_OAMSET_GS_INTRO_NOTE,               $0c, .OAMSet_GSIntroNote
	spriteanim_oamset SPRANIM_OAMSET_GS_INTRO_INVISIBLE_NOTE,     $0d, .OAMSet_1x1_Palette0
	spriteanim_oamset SPRANIM_OAMSET_GS_INTRO_JIGGLYPUFF_1,       $00, .OAMSet_GSIntroJigglypuffPikachu
	spriteanim_oamset SPRANIM_OAMSET_GS_INTRO_JIGGLYPUFF_2,       $04, .OAMSet_GSIntroJigglypuffPikachu
	spriteanim_oamset SPRANIM_OAMSET_GS_INTRO_JIGGLYPUFF_3,       $08, .OAMSet_GSIntroJigglypuffPikachu
	spriteanim_oamset SPRANIM_OAMSET_GS_INTRO_PIKACHU_1,          $40, .OAMSet_GSIntroJigglypuffPikachu
	spriteanim_oamset SPRANIM_OAMSET_GS_INTRO_PIKACHU_2,          $44, .OAMSet_GSIntroJigglypuffPikachu
	spriteanim_oamset SPRANIM_OAMSET_GS_INTRO_PIKACHU_3,          $48, .OAMSet_GSIntroJigglypuffPikachu
	spriteanim_oamset SPRANIM_OAMSET_GS_INTRO_PIKACHU_4,          $4c, .OAMSet_GSIntroJigglypuffPikachu
	spriteanim_oamset SPRANIM_OAMSET_GS_INTRO_PIKACHU_TAIL_1,     $80, .OAMSet_GSIntroPikachuTail
	spriteanim_oamset SPRANIM_OAMSET_GS_INTRO_PIKACHU_TAIL_2,     $85, .OAMSet_GSIntroPikachuTail
	spriteanim_oamset SPRANIM_OAMSET_GS_INTRO_PIKACHU_TAIL_3,     $8a, .OAMSet_GSIntroPikachuTail
	spriteanim_oamset SPRANIM_OAMSET_GS_INTRO_SMALL_FIREBALL,     $00, .OAMSet_IntroUnownF2_1
	spriteanim_oamset SPRANIM_OAMSET_GS_INTRO_MED_FIREBALL,       $01, .OAMSet_TradePoofBubble
	spriteanim_oamset SPRANIM_OAMSET_GS_INTRO_BIG_FIREBALL,       $09, .OAMSet_GSIntroBigFireball
	spriteanim_oamset SPRANIM_OAMSET_GS_INTRO_CHIKORITA,          $10, .OAMSet_GSIntroStarter
	spriteanim_oamset SPRANIM_OAMSET_GS_INTRO_CYNDAQUIL,          $29, .OAMSet_GSIntroStarter
	spriteanim_oamset SPRANIM_OAMSET_GS_INTRO_TOTODILE,           $42, .OAMSet_GSIntroStarter
	spriteanim_oamset SPRANIM_OAMSET_GS_TITLE_TRAIL_1,            $f8, .OAMSet_GSTitleTrail
	spriteanim_oamset SPRANIM_OAMSET_GS_TITLE_TRAIL_2,            $fa, .OAMSet_GSTitleTrail
	spriteanim_oamset SPRANIM_OAMSET_TEXT_ENTRY_CURSOR,           $00, .OAMSet_TextEntryCursor
	spriteanim_oamset SPRANIM_OAMSET_TEXT_ENTRY_CURSOR_BIG,       $00, .OAMSet_TextEntryCursorBig
	spriteanim_oamset SPRANIM_OAMSET_GS_GAMEFREAK_LOGO,           $00, .OAMSet_GSGameFreakLogo
	spriteanim_oamset SPRANIM_OAMSET_GS_GAMEFREAK_LOGO_STAR,      $0f, .OAMSet_GSGameFreakLogoStar
	spriteanim_oamset SPRANIM_OAMSET_GS_GAMEFREAK_LOGO_SPARKLE_1, $11, .OAMSet_1x1_Palette0
	spriteanim_oamset SPRANIM_OAMSET_GS_GAMEFREAK_LOGO_SPARKLE_2, $12, .OAMSet_1x1_Palette0
	spriteanim_oamset SPRANIM_OAMSET_GS_GAMEFREAK_LOGO_SPARKLE_3, $13, .OAMSet_1x1_Palette0
	spriteanim_oamset SPRANIM_OAMSET_SLOTS_GOLEM_1,               $00, .OAMSet_SlotsGolem
	spriteanim_oamset SPRANIM_OAMSET_SLOTS_GOLEM_2,               $08, .OAMSet_SlotsGolem
	spriteanim_oamset SPRANIM_OAMSET_SLOTS_CHANSEY_1,             $10, .OAMSet_SlotsChansey1
	spriteanim_oamset SPRANIM_OAMSET_SLOTS_CHANSEY_2,             $10, .OAMSet_SlotsChansey2
	spriteanim_oamset SPRANIM_OAMSET_SLOTS_CHANSEY_3,             $10, .OAMSet_SlotsChansey3
	spriteanim_oamset SPRANIM_OAMSET_SLOTS_CHANSEY_4,             $10, .OAMSet_SlotsChansey4
	spriteanim_oamset SPRANIM_OAMSET_SLOTS_CHANSEY_5,             $10, .OAMSet_SlotsChansey5
	spriteanim_oamset SPRANIM_OAMSET_SLOTS_EGG,                   $3a, .OAMSet_1x1_Palette0
	spriteanim_oamset SPRANIM_OAMSET_STILL_CURSOR,                $00, .OAMSet_RedWalk
	spriteanim_oamset SPRANIM_OAMSET_TRADE_POKE_BALL_1,           $00, .OAMSet_TradePokeBall1
	spriteanim_oamset SPRANIM_OAMSET_TRADE_POKE_BALL_2,           $02, .OAMSet_MagnetTrainRed
	spriteanim_oamset SPRANIM_OAMSET_TRADE_POOF_1,                $06, .OAMSet_TradePoofBubble
	spriteanim_oamset SPRANIM_OAMSET_TRADE_POOF_2,                $0a, .OAMSet_TradePoofBubble
	spriteanim_oamset SPRANIM_OAMSET_TRADE_POOF_3,                $0e, .OAMSet_TradePoofBubble
	spriteanim_oamset SPRANIM_OAMSET_TRADE_TUBE_BULGE_1,          $12, .OAMSet_TradeTubeBulge
	spriteanim_oamset SPRANIM_OAMSET_TRADE_TUBE_BULGE_2,          $13, .OAMSet_TradeTubeBulge
	spriteanim_oamset SPRANIM_OAMSET_TRADEMON_ICON_1,             $00, .OAMSet_RedWalk
	spriteanim_oamset SPRANIM_OAMSET_TRADEMON_ICON_2,             $04, .OAMSet_RedWalk
	spriteanim_oamset SPRANIM_OAMSET_TRADEMON_BUBBLE,             $10, .OAMSet_TradePoofBubble
	spriteanim_oamset SPRANIM_OAMSET_EVOLUTION_BALL_OF_LIGHT_1,   $00, .OAMSet_MagnetTrainRed
	spriteanim_oamset SPRANIM_OAMSET_EVOLUTION_BALL_OF_LIGHT_2,   $04, .OAMSet_1x1_Palette0
	spriteanim_oamset SPRANIM_OAMSET_RADIO_TUNING_KNOB,           $00, .OAMSet_RadioTuningKnob
	spriteanim_oamset SPRANIM_OAMSET_PARTY_MON_WITH_MAIL_1,       $00, .OAMSet_PartyMonWithMail1
	spriteanim_oamset SPRANIM_OAMSET_PARTY_MON_WITH_MAIL_2,       $00, .OAMSet_PartyMonWithMail2
	spriteanim_oamset SPRANIM_OAMSET_PARTY_MON_WITH_ITEM_1,       $00, .OAMSet_PartyMonWithItem1
	spriteanim_oamset SPRANIM_OAMSET_PARTY_MON_WITH_ITEM_2,       $00, .OAMSet_PartyMonWithItem2
	spriteanim_oamset SPRANIM_OAMSET_MAGNET_TRAIN_RED_1,          $00, .OAMSet_MagnetTrainRed
	spriteanim_oamset SPRANIM_OAMSET_MAGNET_TRAIN_RED_2,          $04, .OAMSet_MagnetTrainRed
	spriteanim_oamset SPRANIM_OAMSET_UNUSED_43,                   $00, .OAMSet_Unused43_4A
	spriteanim_oamset SPRANIM_OAMSET_UNUSED_44,                   $30, .OAMSet_Unused43_4A
	spriteanim_oamset SPRANIM_OAMSET_UNUSED_45,                   $03, .OAMSet_Unused43_4A
	spriteanim_oamset SPRANIM_OAMSET_UNUSED_46,                   $33, .OAMSet_Unused43_4A
	spriteanim_oamset SPRANIM_OAMSET_UNUSED_47,                   $06, .OAMSet_Unused43_4A
	spriteanim_oamset SPRANIM_OAMSET_UNUSED_48,                   $36, .OAMSet_Unused43_4A
	spriteanim_oamset SPRANIM_OAMSET_UNUSED_49,                   $09, .OAMSet_Unused43_4A
	spriteanim_oamset SPRANIM_OAMSET_UNUSED_4A,                   $39, .OAMSet_Unused43_4A
	spriteanim_oamset SPRANIM_OAMSET_UNUSED_4B,                   $0c, .OAMSet_Unused4B
	spriteanim_oamset SPRANIM_OAMSET_UNUSED_4C,                   $0c, .OAMSet_Unused4C
	spriteanim_oamset SPRANIM_OAMSET_UNUSED_4D,                   $3c, .OAMSet_1x1_Palette0
	spriteanim_oamset SPRANIM_OAMSET_UNUSED_4E,                   $3e, .OAMSet_1x1_Palette0
	spriteanim_oamset SPRANIM_OAMSET_LEAF,                        $00, .OAMSet_Leaf
	spriteanim_oamset SPRANIM_OAMSET_TREE_1,                      $00, .OAMSet_Tree
	spriteanim_oamset SPRANIM_OAMSET_CUT_TREE_2,                  $00, .OAMSet_CutTree2
	spriteanim_oamset SPRANIM_OAMSET_CUT_TREE_3,                  $00, .OAMSet_CutTree3
	spriteanim_oamset SPRANIM_OAMSET_CUT_TREE_4,                  $00, .OAMSet_CutTree4
	spriteanim_oamset SPRANIM_OAMSET_EGG_CRACK,                   $00, .OAMSet_1x1_Palette0
	spriteanim_oamset SPRANIM_OAMSET_EGG_HATCH,                   $01, .OAMSet_1x1_Palette0
	spriteanim_oamset SPRANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_1,      $00, .OAMSet_GSIntroHoOhLugia1
	spriteanim_oamset SPRANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_2,      $00, .OAMSet_GSIntroHoOhLugia2
	spriteanim_oamset SPRANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_3,      $00, .OAMSet_GSIntroHoOhLugia3
	spriteanim_oamset SPRANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_4,      $00, .OAMSet_GSIntroHoOhLugia4
	spriteanim_oamset SPRANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_5,      $00, .OAMSet_GSIntroHoOhLugia5
	spriteanim_oamset SPRANIM_OAMSET_HEADBUTT_TREE_2,             $04, .OAMSet_Tree
	spriteanim_oamset SPRANIM_OAMSET_EZCHAT_CURSOR_1,             $00, .OAMSet_EZChatCursor1
	spriteanim_oamset SPRANIM_OAMSET_EZCHAT_CURSOR_2,             $00, .OAMSet_EZChatCursor2
	spriteanim_oamset SPRANIM_OAMSET_EZCHAT_CURSOR_3,             $00, .OAMSet_EZChatCursor3
	spriteanim_oamset SPRANIM_OAMSET_EZCHAT_CURSOR_4,             $00, .OAMSet_EZChatCursor4
	spriteanim_oamset SPRANIM_OAMSET_EZCHAT_CURSOR_5,             $00, .OAMSet_EZChatCursor5
	spriteanim_oamset SPRANIM_OAMSET_EZCHAT_CURSOR_6,             $00, .OAMSet_EZChatCursor6
	spriteanim_oamset SPRANIM_OAMSET_EZCHAT_CURSOR_7,             $00, .OAMSet_EZChatCursor7
	spriteanim_oamset SPRANIM_OAMSET_BLUE_WALK_1,                 $00, .OAMSet_BlueWalk
	spriteanim_oamset SPRANIM_OAMSET_BLUE_WALK_2,                 $04, .OAMSet_BlueWalk
	spriteanim_oamset SPRANIM_OAMSET_MAGNET_TRAIN_BLUE_1,         $00, .OAMSet_MagnetTrainBlue
	spriteanim_oamset SPRANIM_OAMSET_MAGNET_TRAIN_BLUE_2,         $04, .OAMSet_MagnetTrainBlue
	spriteanim_oamset SPRANIM_OAMSET_MOBILE_TRADE_CABLE_BULGE_1,  $20, .OAMSet_MobileTradeCableBulge
	spriteanim_oamset SPRANIM_OAMSET_MOBILE_TRADE_CABLE_BULGE_2,  $21, .OAMSet_MobileTradeCableBulge
	spriteanim_oamset SPRANIM_OAMSET_MOBILE_TRADE_PING_1,         $22, .OAMSet_MobileTradePing1
	spriteanim_oamset SPRANIM_OAMSET_MOBILE_TRADE_PING_2,         $23, .OAMSet_MobileTradePing2
	spriteanim_oamset SPRANIM_OAMSET_MOBILE_TRADE_PING_3,         $27, .OAMSet_MobileTradePing3
	spriteanim_oamset SPRANIM_OAMSET_MOBILE_TRADE_SENT_PULSE,     $2a, .OAMSet_MobileTradeSentPulse
	spriteanim_oamset SPRANIM_OAMSET_MOBILE_TRADE_OT_PULSE,       $2a, .OAMSet_MobileTradeOTPulse
	spriteanim_oamset SPRANIM_OAMSET_INTRO_SUICUNE_1,             $00, .OAMSet_IntroSuicune1
	spriteanim_oamset SPRANIM_OAMSET_INTRO_SUICUNE_2,             $08, .OAMSet_IntroSuicune2
	spriteanim_oamset SPRANIM_OAMSET_INTRO_SUICUNE_3,             $60, .OAMSet_IntroSuicune3
	spriteanim_oamset SPRANIM_OAMSET_INTRO_SUICUNE_4,             $68, .OAMSet_IntroSuicune4
	spriteanim_oamset SPRANIM_OAMSET_INTRO_PICHU_1,               $00, .OAMSet_IntroPichu
	spriteanim_oamset SPRANIM_OAMSET_INTRO_PICHU_2,               $05, .OAMSet_IntroPichu
	spriteanim_oamset SPRANIM_OAMSET_INTRO_PICHU_3,               $0a, .OAMSet_IntroPichu
	spriteanim_oamset SPRANIM_OAMSET_INTRO_WOOPER,                $50, .OAMSet_IntroWooper
	spriteanim_oamset SPRANIM_OAMSET_INTRO_UNOWN_1,               $00, .OAMSet_IntroUnown1
	spriteanim_oamset SPRANIM_OAMSET_INTRO_UNOWN_2,               $01, .OAMSet_IntroUnown2
	spriteanim_oamset SPRANIM_OAMSET_INTRO_UNOWN_3,               $04, .OAMSet_IntroUnown3
	spriteanim_oamset SPRANIM_OAMSET_INTRO_UNOWN_F_2_1,           $00, .OAMSet_IntroUnownF2_1
	spriteanim_oamset SPRANIM_OAMSET_INTRO_UNOWN_F_2_2,           $01, .OAMSet_IntroUnownF2_2
	spriteanim_oamset SPRANIM_OAMSET_INTRO_UNOWN_F_2_3,           $03, .OAMSet_IntroUnownF2_3
	spriteanim_oamset SPRANIM_OAMSET_INTRO_UNOWN_F_2_4,           $08, .OAMSet_IntroUnownF2_4_5
	spriteanim_oamset SPRANIM_OAMSET_INTRO_UNOWN_F_2_5,           $1c, .OAMSet_IntroUnownF2_4_5
	spriteanim_oamset SPRANIM_OAMSET_INTRO_SUICUNE_AWAY,          $80, .OAMSet_IntroSuicuneAway
	spriteanim_oamset SPRANIM_OAMSET_CELEBI_1,                    $00, .OAMSet_Celebi
	spriteanim_oamset SPRANIM_OAMSET_CELEBI_2,                    $04, .OAMSet_Celebi
	spriteanim_oamset SPRANIM_OAMSET_GAMEFREAK_LOGO_1,            $d0, .OAMSet_GameFreakLogo1_3
	spriteanim_oamset SPRANIM_OAMSET_GAMEFREAK_LOGO_2,            $d3, .OAMSet_GameFreakLogo1_3
	spriteanim_oamset SPRANIM_OAMSET_GAMEFREAK_LOGO_3,            $d6, .OAMSet_GameFreakLogo1_3
	spriteanim_oamset SPRANIM_OAMSET_GAMEFREAK_LOGO_4,            $6c, .OAMSet_GameFreakLogo4_11
	spriteanim_oamset SPRANIM_OAMSET_GAMEFREAK_LOGO_5,            $68, .OAMSet_GameFreakLogo4_11
	spriteanim_oamset SPRANIM_OAMSET_GAMEFREAK_LOGO_6,            $64, .OAMSet_GameFreakLogo4_11
	spriteanim_oamset SPRANIM_OAMSET_GAMEFREAK_LOGO_7,            $60, .OAMSet_GameFreakLogo4_11
	spriteanim_oamset SPRANIM_OAMSET_GAMEFREAK_LOGO_8,            $0c, .OAMSet_GameFreakLogo4_11
	spriteanim_oamset SPRANIM_OAMSET_GAMEFREAK_LOGO_9,            $08, .OAMSet_GameFreakLogo4_11
	spriteanim_oamset SPRANIM_OAMSET_GAMEFREAK_LOGO_10,           $04, .OAMSet_GameFreakLogo4_11
	spriteanim_oamset SPRANIM_OAMSET_GAMEFREAK_LOGO_11,           $00, .OAMSet_GameFreakLogo4_11
export DEF NUM_SPRANIM_OAMSETS EQU const_value

.OAMSet_1x1_Palette0:
	db 1
	dbsprite -1, -1,  4,  4, $00, 0

.OAMSet_GSIntroShellder:
	db 4
	dbsprite -1, -1,  0,  0, $00, 0
	dbsprite  0, -1,  0,  0, $01, 0
	dbsprite -1,  0,  0,  0, $10, 0
	dbsprite  0,  0,  0,  0, $11, 0

.OAMSet_GSGameFreakLogoStar:
	db 4
	dbsprite -1, -1,  0,  0, $00, 0
	dbsprite  0, -1,  0,  0, $00, 0 | OAM_XFLIP
	dbsprite -1,  0,  0,  0, $01, 0
	dbsprite  0,  0,  0,  0, $01, 0 | OAM_XFLIP

.OAMSet_TradePokeBall1:
	db 4
	dbsprite -1, -1,  0,  0, $00, 0 | OAM_PRIO
	dbsprite  0, -1,  0,  0, $00, 0 | OAM_XFLIP | OAM_PRIO
	dbsprite -1,  0,  0,  0, $01, 0 | OAM_PRIO
	dbsprite  0,  0,  0,  0, $01, 0 | OAM_XFLIP | OAM_PRIO

.OAMSet_IntroUnownF2_1:
	db 4
	dbsprite -1, -1,  0,  0, $00, 0
	dbsprite  0, -1,  0,  0, $00, 0 | OAM_XFLIP
	dbsprite -1,  0,  0,  0, $00, 0 | OAM_YFLIP
	dbsprite  0,  0,  0,  0, $00, 0 | OAM_XFLIP | OAM_YFLIP

.OAMSet_TradeTubeBulge:
	db 4
	dbsprite -1, -1,  0,  0, $00, 7
	dbsprite  0, -1,  0,  0, $00, 7 | OAM_XFLIP
	dbsprite -1,  0,  0,  0, $00, 7 | OAM_YFLIP
	dbsprite  0,  0,  0,  0, $00, 7 | OAM_XFLIP | OAM_YFLIP

.OAMSet_Unknown1: ; unreferenced
	db 4
	dbsprite -1, -1,  0,  0, $00, 0 | OAM_PRIO
	dbsprite  0, -1,  0,  0, $00, 0 | OAM_XFLIP | OAM_PRIO
	dbsprite -1,  0,  0,  0, $00, 0 | OAM_YFLIP | OAM_PRIO
	dbsprite  0,  0,  0,  0, $00, 0 | OAM_XFLIP | OAM_YFLIP | OAM_PRIO

.OAMSet_TradePoofBubble:
	db 16
	dbsprite -2, -2,  0,  0, $00, 0
	dbsprite -1, -2,  0,  0, $01, 0
	dbsprite -2, -1,  0,  0, $02, 0
	dbsprite -1, -1,  0,  0, $03, 0
	dbsprite  0, -2,  0,  0, $01, 0 | OAM_XFLIP
	dbsprite  1, -2,  0,  0, $00, 0 | OAM_XFLIP
	dbsprite  0, -1,  0,  0, $03, 0 | OAM_XFLIP
	dbsprite  1, -1,  0,  0, $02, 0 | OAM_XFLIP
	dbsprite -2,  0,  0,  0, $02, 0 | OAM_YFLIP
	dbsprite -1,  0,  0,  0, $03, 0 | OAM_YFLIP
	dbsprite -2,  1,  0,  0, $00, 0 | OAM_YFLIP
	dbsprite -1,  1,  0,  0, $01, 0 | OAM_YFLIP
	dbsprite  0,  0,  0,  0, $03, 0 | OAM_XFLIP | OAM_YFLIP
	dbsprite  1,  0,  0,  0, $02, 0 | OAM_XFLIP | OAM_YFLIP
	dbsprite  0,  1,  0,  0, $01, 0 | OAM_XFLIP | OAM_YFLIP
	dbsprite  1,  1,  0,  0, $00, 0 | OAM_XFLIP | OAM_YFLIP

.OAMSet_GSIntroBigFireball:
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
	dbsprite  0, -3,  0,  0, $02, 0 | OAM_XFLIP
	dbsprite  1, -3,  0,  0, $01, 0 | OAM_XFLIP
	dbsprite  2, -3,  0,  0, $00, 0 | OAM_XFLIP
	dbsprite  0, -2,  0,  0, $05, 0 | OAM_XFLIP
	dbsprite  1, -2,  0,  0, $04, 0 | OAM_XFLIP
	dbsprite  2, -2,  0,  0, $03, 0 | OAM_XFLIP
	dbsprite  0, -1,  0,  0, $05, 0 | OAM_XFLIP
	dbsprite  1, -1,  0,  0, $05, 0 | OAM_XFLIP
	dbsprite  2, -1,  0,  0, $06, 0 | OAM_XFLIP
	dbsprite -3,  0,  0,  0, $06, 0 | OAM_YFLIP
	dbsprite -2,  0,  0,  0, $05, 0 | OAM_YFLIP
	dbsprite -1,  0,  0,  0, $05, 0 | OAM_YFLIP
	dbsprite -3,  1,  0,  0, $03, 0 | OAM_YFLIP
	dbsprite -2,  1,  0,  0, $04, 0 | OAM_YFLIP
	dbsprite -1,  1,  0,  0, $05, 0 | OAM_YFLIP
	dbsprite -3,  2,  0,  0, $00, 0 | OAM_YFLIP
	dbsprite -2,  2,  0,  0, $01, 0 | OAM_YFLIP
	dbsprite -1,  2,  0,  0, $02, 0 | OAM_YFLIP
	dbsprite  0,  0,  0,  0, $05, 0 | OAM_XFLIP | OAM_YFLIP
	dbsprite  1,  0,  0,  0, $05, 0 | OAM_XFLIP | OAM_YFLIP
	dbsprite  2,  0,  0,  0, $06, 0 | OAM_XFLIP | OAM_YFLIP
	dbsprite  0,  1,  0,  0, $05, 0 | OAM_XFLIP | OAM_YFLIP
	dbsprite  1,  1,  0,  0, $04, 0 | OAM_XFLIP | OAM_YFLIP
	dbsprite  2,  1,  0,  0, $03, 0 | OAM_XFLIP | OAM_YFLIP
	dbsprite  0,  2,  0,  0, $02, 0 | OAM_XFLIP | OAM_YFLIP
	dbsprite  1,  2,  0,  0, $01, 0 | OAM_XFLIP | OAM_YFLIP
	dbsprite  2,  2,  0,  0, $00, 0 | OAM_XFLIP | OAM_YFLIP

.OAMSet_Unused43_4A:
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

.OAMSet_GSIntroJigglypuffPikachu:
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

.OAMSet_GSIntroStarter:
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

.OAMSet_Unknown2: ; unreferenced
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

.OAMSet_RedWalk:
	db 4
	dbsprite -1, -1,  0,  0, $00, PAL_OW_RED
	dbsprite  0, -1,  0,  0, $01, PAL_OW_RED
	dbsprite -1,  0,  0,  0, $02, PAL_OW_RED
	dbsprite  0,  0,  0,  0, $03, PAL_OW_RED

.OAMSet_MagnetTrainRed:
	db 4
	dbsprite -1, -1,  0,  0, $00, PAL_OW_RED | OAM_PRIO
	dbsprite  0, -1,  0,  0, $01, PAL_OW_RED | OAM_PRIO
	dbsprite -1,  0,  0,  0, $02, PAL_OW_RED | OAM_PRIO
	dbsprite  0,  0,  0,  0, $03, PAL_OW_RED | OAM_PRIO

.OAMSet_PartyMonWithMail1:
	db 4
	dbsprite -1, -1,  0,  0, $00, PAL_OW_RED
	dbsprite  0, -1,  0,  0, $01, PAL_OW_RED
	dbsprite -1,  0,  0,  0, $08, PAL_OW_RED
	dbsprite  0,  0,  0,  0, $03, PAL_OW_RED

.OAMSet_PartyMonWithMail2:
	db 4
	dbsprite -1, -1,  0,  0, $04, PAL_OW_RED
	dbsprite  0, -1,  0,  0, $05, PAL_OW_RED
	dbsprite -1,  0,  0,  0, $08, PAL_OW_RED
	dbsprite  0,  0,  0,  0, $07, PAL_OW_RED

.OAMSet_PartyMonWithItem1:
	db 4
	dbsprite -1, -1,  0,  0, $00, PAL_OW_RED
	dbsprite  0, -1,  0,  0, $01, PAL_OW_RED
	dbsprite -1,  0,  0,  0, $09, PAL_OW_RED
	dbsprite  0,  0,  0,  0, $03, PAL_OW_RED

.OAMSet_PartyMonWithItem2:
	db 4
	dbsprite -1, -1,  0,  0, $04, PAL_OW_RED
	dbsprite  0, -1,  0,  0, $05, PAL_OW_RED
	dbsprite -1,  0,  0,  0, $09, PAL_OW_RED
	dbsprite  0,  0,  0,  0, $07, PAL_OW_RED

.OAMSet_GSIntroMagikarp:
	db 6
	dbsprite -2, -1,  4,  0, $00, 1
	dbsprite -1, -1,  4,  0, $01, 1
	dbsprite  0, -1,  4,  0, $02, 1
	dbsprite -2,  0,  4,  0, $10, 1
	dbsprite -1,  0,  4,  0, $11, 1
	dbsprite  0,  0,  4,  0, $12, 1

.OAMSet_GSIntroLapras:
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
	dbsprite -3,  0,  0,  0, $30, 0 | OAM_PRIO
	dbsprite -2,  0,  0,  0, $31, 0 | OAM_PRIO
	dbsprite -1,  0,  0,  0, $32, 0 | OAM_PRIO
	dbsprite  0,  0,  0,  0, $33, 0 | OAM_PRIO
	dbsprite  1,  0,  0,  0, $34, 0 | OAM_PRIO
	dbsprite -3,  1,  0,  0, $40, 0 | OAM_PRIO
	dbsprite -2,  1,  0,  0, $41, 0 | OAM_PRIO
	dbsprite -1,  1,  0,  0, $42, 0 | OAM_PRIO
	dbsprite  0,  1,  0,  0, $43, 0 | OAM_PRIO
	dbsprite  1,  1,  0,  0, $44, 0 | OAM_PRIO
	dbsprite  2,  1,  0,  0, $45, 0 | OAM_PRIO
	dbsprite -2,  2,  0,  0, $51, 0 | OAM_PRIO
	dbsprite -1,  2,  0,  0, $52, 0 | OAM_PRIO
	dbsprite  0,  2,  0,  0, $53, 0 | OAM_PRIO
	dbsprite  1,  2,  0,  0, $54, 0 | OAM_PRIO
	dbsprite  2,  2,  0,  0, $55, 0 | OAM_PRIO

.OAMSet_GSIntroNote:
	db 2
	dbsprite -1, -1,  4,  0, $00, 0
	dbsprite -1,  0,  4,  0, $10, 0

.OAMSet_GSIntroPikachuTail:
	db 5
	dbsprite  3, -2,  0,  0, $00, 0
	dbsprite  4, -2,  0,  0, $01, 0
	dbsprite  2, -1,  0,  0, $02, 0
	dbsprite  3, -1,  0,  0, $03, 0
	dbsprite  2,  0,  0,  0, $04, 0

.OAMSet_Leaf:
	db 1
	dbsprite -1, -1,  4,  4, $00, PAL_OW_TREE

.OAMSet_Tree:
	db 4
	dbsprite -1, -1,  0,  0, $00, PAL_OW_TREE
	dbsprite  0, -1,  0,  0, $01, PAL_OW_TREE
	dbsprite -1,  0,  0,  0, $02, PAL_OW_TREE
	dbsprite  0,  0,  0,  0, $03, PAL_OW_TREE

.OAMSet_TextEntryCursor:
	db 4
	dbsprite -1, -1,  7,  7, $00, 0
	dbsprite  0, -1,  0,  7, $00, 0 | OAM_XFLIP
	dbsprite -1,  0,  7,  0, $00, 0 | OAM_YFLIP
	dbsprite  0,  0,  0,  0, $00, 0 | OAM_XFLIP | OAM_YFLIP

.OAMSet_TextEntryCursorBig:
	db 10
	dbsprite  0, -1,  0,  7, $00, 0
	dbsprite  1, -1,  0,  7, $01, 0
	dbsprite  2, -1,  0,  7, $01, 0
	dbsprite  3, -1,  0,  7, $01, 0
	dbsprite  4, -1,  0,  7, $00, 0 | OAM_XFLIP
	dbsprite  0,  0,  0,  0, $00, 0 | OAM_YFLIP
	dbsprite  1,  0,  0,  0, $01, 0 | OAM_YFLIP
	dbsprite  2,  0,  0,  0, $01, 0 | OAM_YFLIP
	dbsprite  3,  0,  0,  0, $01, 0 | OAM_YFLIP
	dbsprite  4,  0,  0,  0, $00, 0 | OAM_XFLIP | OAM_YFLIP

.OAMSet_GSGameFreakLogo:
	db 15
	dbsprite -2, -3,  4,  4, $00, 1 | OAM_PAL1
	dbsprite -1, -3,  4,  4, $01, 1 | OAM_PAL1
	dbsprite  0, -3,  4,  4, $02, 1 | OAM_PAL1
	dbsprite -2, -2,  4,  4, $03, 1 | OAM_PAL1
	dbsprite -1, -2,  4,  4, $04, 1 | OAM_PAL1
	dbsprite  0, -2,  4,  4, $05, 1 | OAM_PAL1
	dbsprite -2, -1,  4,  4, $06, 1 | OAM_PAL1
	dbsprite -1, -1,  4,  4, $07, 1 | OAM_PAL1
	dbsprite  0, -1,  4,  4, $08, 1 | OAM_PAL1
	dbsprite -2,  0,  4,  4, $09, 1 | OAM_PAL1
	dbsprite -1,  0,  4,  4, $0a, 1 | OAM_PAL1
	dbsprite  0,  0,  4,  4, $0b, 1 | OAM_PAL1
	dbsprite -2,  1,  4,  4, $0c, 1 | OAM_PAL1
	dbsprite -1,  1,  4,  4, $0d, 1 | OAM_PAL1
	dbsprite  0,  1,  4,  4, $0e, 1 | OAM_PAL1

.OAMSet_SlotsGolem:
	db 6
	dbsprite -2, -2,  4,  4, $00, 5 | OAM_PAL1
	dbsprite -1, -2,  4,  4, $02, 5 | OAM_PAL1
	dbsprite  0, -2,  4,  4, $00, 5 | OAM_PAL1 | OAM_XFLIP
	dbsprite -2,  0,  4,  4, $04, 5 | OAM_PAL1
	dbsprite -1,  0,  4,  4, $06, 5 | OAM_PAL1
	dbsprite  0,  0,  4,  4, $04, 5 | OAM_PAL1 | OAM_XFLIP

.OAMSet_SlotsChansey1:
	db 6
	dbsprite -2, -2,  4,  4, $00, 6 | OAM_PAL1
	dbsprite -1, -2,  4,  4, $02, 6 | OAM_PAL1
	dbsprite  0, -2,  4,  4, $04, 6 | OAM_PAL1
	dbsprite -2,  0,  4,  4, $06, 6 | OAM_PAL1
	dbsprite -1,  0,  4,  4, $08, 6 | OAM_PAL1
	dbsprite  0,  0,  4,  4, $0a, 6 | OAM_PAL1

.OAMSet_SlotsChansey2:
	db 6
	dbsprite -2, -2,  4,  4, $00, 6 | OAM_PAL1
	dbsprite -1, -2,  4,  4, $02, 6 | OAM_PAL1
	dbsprite  0, -2,  4,  4, $04, 6 | OAM_PAL1
	dbsprite -2,  0,  4,  4, $0c, 6 | OAM_PAL1
	dbsprite -1,  0,  4,  4, $0e, 6 | OAM_PAL1
	dbsprite  0,  0,  4,  4, $10, 6 | OAM_PAL1

.OAMSet_SlotsChansey3:
	db 6
	dbsprite -2, -2,  4,  4, $00, 6 | OAM_PAL1
	dbsprite -1, -2,  4,  4, $02, 6 | OAM_PAL1
	dbsprite  0, -2,  4,  4, $04, 6 | OAM_PAL1
	dbsprite -2,  0,  4,  4, $12, 6 | OAM_PAL1
	dbsprite -1,  0,  4,  4, $14, 6 | OAM_PAL1
	dbsprite  0,  0,  4,  4, $16, 6 | OAM_PAL1

.OAMSet_SlotsChansey4:
	db 6
	dbsprite -2, -2,  4,  4, $00, 6 | OAM_PAL1
	dbsprite -1, -2,  4,  4, $02, 6 | OAM_PAL1
	dbsprite  0, -2,  4,  4, $04, 6 | OAM_PAL1
	dbsprite -2,  0,  4,  4, $18, 6 | OAM_PAL1
	dbsprite -1,  0,  4,  4, $1a, 6 | OAM_PAL1
	dbsprite  0,  0,  4,  4, $1c, 6 | OAM_PAL1

.OAMSet_SlotsChansey5:
	db 6
	dbsprite -2, -2,  4,  4, $1e, 6 | OAM_PAL1
	dbsprite -1, -2,  4,  4, $20, 6 | OAM_PAL1
	dbsprite  0, -2,  4,  4, $22, 6 | OAM_PAL1
	dbsprite -2,  0,  4,  4, $24, 6 | OAM_PAL1
	dbsprite -1,  0,  4,  4, $26, 6 | OAM_PAL1
	dbsprite  0,  0,  4,  4, $28, 6 | OAM_PAL1

.OAMSet_RadioTuningKnob:
	db 3
	dbsprite -1, -2,  4,  4, $00, 0 | OAM_PAL1
	dbsprite -1, -1,  4,  4, $00, 0 | OAM_PAL1
	dbsprite -1,  0,  4,  4, $00, 0 | OAM_PAL1

.OAMSet_Unused4B:
	db 6
	dbsprite  0,  0,  0,  0, $00, 0
	dbsprite  1,  0,  0,  0, $01, 0
	dbsprite  2,  0,  0,  0, $01, 0
	dbsprite  3,  0,  0,  0, $01, 0
	dbsprite  4,  0,  0,  0, $02, 0
	dbsprite  5,  0,  0,  0, $03, 0

.OAMSet_Unused4C:
	db 4
	dbsprite  0,  0,  0,  0, $00, 0
	dbsprite  1,  0,  0,  0, $01, 0
	dbsprite  2,  0,  0,  0, $02, 0
	dbsprite  3,  0,  0,  0, $03, 0

.OAMSet_CutTree2:
	db 4
	dbsprite -2, -1,  6,  0, $00, PAL_OW_TREE
	dbsprite  0, -1,  2,  0, $01, PAL_OW_TREE
	dbsprite -2,  0,  6,  0, $02, PAL_OW_TREE
	dbsprite  0,  0,  2,  0, $03, PAL_OW_TREE

.OAMSet_CutTree3:
	db 4
	dbsprite -2, -1,  4,  0, $00, PAL_OW_TREE
	dbsprite  0, -1,  4,  0, $01, PAL_OW_TREE
	dbsprite -2,  0,  4,  0, $02, PAL_OW_TREE
	dbsprite  0,  0,  4,  0, $03, PAL_OW_TREE

.OAMSet_CutTree4:
	db 4
	dbsprite -2, -1,  0,  0, $00, PAL_OW_TREE
	dbsprite  1, -1,  0,  0, $01, PAL_OW_TREE
	dbsprite -2,  0,  0,  0, $02, PAL_OW_TREE
	dbsprite  1,  0,  0,  0, $03, PAL_OW_TREE

.OAMSet_GSIntroHoOhLugia1:
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

.OAMSet_GSIntroHoOhLugia2:
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

.OAMSet_GSIntroHoOhLugia3:
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

.OAMSet_GSIntroHoOhLugia4:
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

.OAMSet_GSIntroHoOhLugia5:
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

.OAMSet_GSTitleTrail:
	db 1
	dbsprite -1, -1,  4,  4, $00, 1 | OAM_PAL1

.OAMSet_EZChatCursor1:
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

.OAMSet_EZChatCursor2:
	db 1
	dbsprite  0,  0,  0,  0, $ed, 0

.OAMSet_EZChatCursor3:
	db 4
	dbsprite -1, -1,  7,  7, $30, 0
	dbsprite  0, -1,  1,  7, $32, 0
	dbsprite -1,  0,  7,  1, $33, 0
	dbsprite  0,  0,  1,  1, $35, 0

.OAMSet_EZChatCursor4:
	db 8
	dbsprite -1, -1,  7,  7, $30, 0
	dbsprite  0, -1,  4,  7, $31, 0
	dbsprite  1, -1,  4,  7, $31, 0
	dbsprite  2, -1,  1,  7, $32, 0
	dbsprite -1,  0,  7,  1, $33, 0
	dbsprite  0,  0,  4,  1, $34, 0
	dbsprite  1,  0,  4,  1, $34, 0
	dbsprite  2,  0,  1,  1, $35, 0

.OAMSet_EZChatCursor5:
	db 1
	dbsprite  0,  0,  0,  0, $34, 0

.OAMSet_EZChatCursor6:
	db 2
	dbsprite  0,  0,  0,  0, $30, 0
	dbsprite  0,  1,  0,  0, $33, 0

.OAMSet_EZChatCursor7:
	db 2
	dbsprite  0,  0,  0,  0, $32, 0
	dbsprite  0,  1,  0,  0, $35, 0

.OAMSet_BlueWalk:
	db 4
	dbsprite -1, -1,  0,  0, $00, PAL_OW_BLUE
	dbsprite  0, -1,  0,  0, $01, PAL_OW_BLUE
	dbsprite -1,  0,  0,  0, $02, PAL_OW_BLUE
	dbsprite  0,  0,  0,  0, $03, PAL_OW_BLUE

.OAMSet_MagnetTrainBlue:
	db 4
	dbsprite -1, -1,  0,  0, $00, PAL_OW_BLUE | OAM_PRIO
	dbsprite  0, -1,  0,  0, $01, PAL_OW_BLUE | OAM_PRIO
	dbsprite -1,  0,  0,  0, $02, PAL_OW_BLUE | OAM_PRIO
	dbsprite  0,  0,  0,  0, $03, PAL_OW_BLUE | OAM_PRIO

.OAMSet_MobileTradeCableBulge:
	db 1
	dbsprite -1, -1,  4,  4, $00, 2

.OAMSet_MobileTradeSentPulse:
	db 4
	dbsprite -1, -2,  4,  0, $00, 3
	dbsprite -1, -1,  4,  0, $01, 3
	dbsprite -1,  0,  4,  0, $02, 3
	dbsprite -1,  1,  4,  0, $03, 3

.OAMSet_MobileTradeOTPulse:
	db 4
	dbsprite -1, -2,  4,  0, $03, 4 | OAM_YFLIP
	dbsprite -1, -1,  4,  0, $02, 4 | OAM_YFLIP
	dbsprite -1,  0,  4,  0, $01, 4 | OAM_YFLIP
	dbsprite -1,  1,  4,  0, $00, 4 | OAM_YFLIP

.OAMSet_MobileTradePing1:
	db 4
	dbsprite -1, -1,  0,  0, $00, 1
	dbsprite  0, -1,  0,  0, $00, 1 | OAM_XFLIP
	dbsprite -1,  0,  0,  0, $00, 1 | OAM_YFLIP
	dbsprite  0,  0,  0,  0, $00, 1 | OAM_XFLIP | OAM_YFLIP

.OAMSet_MobileTradePing2:
	db 8
	dbsprite -2, -2,  4,  4, $00, 1
	dbsprite -1, -2,  4,  4, $01, 1
	dbsprite  0, -2,  4,  4, $00, 1 | OAM_XFLIP
	dbsprite -2, -1,  4,  4, $02, 1
	dbsprite  0, -1,  4,  4, $02, 1 | OAM_XFLIP
	dbsprite -2,  0,  4,  4, $00, 1 | OAM_YFLIP
	dbsprite -1,  0,  4,  4, $01, 1 | OAM_YFLIP
	dbsprite  0,  0,  4,  4, $00, 1 | OAM_XFLIP | OAM_YFLIP

.OAMSet_MobileTradePing3:
	db 12
	dbsprite -2, -2,  0,  0, $00, 1
	dbsprite -1, -2,  0,  0, $01, 1
	dbsprite -2, -1,  0,  0, $02, 1
	dbsprite  0, -2,  0,  0, $01, 1 | OAM_XFLIP
	dbsprite  1, -2,  0,  0, $00, 1 | OAM_XFLIP
	dbsprite  1, -1,  0,  0, $02, 1 | OAM_XFLIP
	dbsprite -2,  0,  0,  0, $02, 1 | OAM_YFLIP
	dbsprite -2,  1,  0,  0, $00, 1 | OAM_YFLIP
	dbsprite -1,  1,  0,  0, $01, 1 | OAM_YFLIP
	dbsprite  1,  0,  0,  0, $02, 1 | OAM_XFLIP | OAM_YFLIP
	dbsprite  0,  1,  0,  0, $01, 1 | OAM_XFLIP | OAM_YFLIP
	dbsprite  1,  1,  0,  0, $00, 1 | OAM_XFLIP | OAM_YFLIP

.OAMSet_IntroSuicune1:
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

.OAMSet_IntroSuicune2:
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

.OAMSet_IntroSuicune3:
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

.OAMSet_IntroSuicune4:
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

.OAMSet_IntroPichu:
	db 25
	dbsprite -3, -3,  4,  4, $00, 1 | OAM_BANK1
	dbsprite -2, -3,  4,  4, $01, 1 | OAM_BANK1
	dbsprite -1, -3,  4,  4, $02, 1 | OAM_BANK1
	dbsprite  0, -3,  4,  4, $03, 1 | OAM_BANK1
	dbsprite  1, -3,  4,  4, $04, 1 | OAM_BANK1
	dbsprite -3, -2,  4,  4, $10, 1 | OAM_BANK1
	dbsprite -2, -2,  4,  4, $11, 1 | OAM_BANK1
	dbsprite -1, -2,  4,  4, $12, 1 | OAM_BANK1
	dbsprite  0, -2,  4,  4, $13, 1 | OAM_BANK1
	dbsprite  1, -2,  4,  4, $14, 1 | OAM_BANK1
	dbsprite -3, -1,  4,  4, $20, 1 | OAM_BANK1
	dbsprite -2, -1,  4,  4, $21, 1 | OAM_BANK1
	dbsprite -1, -1,  4,  4, $22, 1 | OAM_BANK1
	dbsprite  0, -1,  4,  4, $23, 1 | OAM_BANK1
	dbsprite  1, -1,  4,  4, $24, 1 | OAM_BANK1
	dbsprite -3,  0,  4,  4, $30, 1 | OAM_BANK1
	dbsprite -2,  0,  4,  4, $31, 1 | OAM_BANK1
	dbsprite -1,  0,  4,  4, $32, 1 | OAM_BANK1
	dbsprite  0,  0,  4,  4, $33, 1 | OAM_BANK1
	dbsprite  1,  0,  4,  4, $34, 1 | OAM_BANK1
	dbsprite -3,  1,  4,  4, $40, 1 | OAM_BANK1
	dbsprite -2,  1,  4,  4, $41, 1 | OAM_BANK1
	dbsprite -1,  1,  4,  4, $42, 1 | OAM_BANK1
	dbsprite  0,  1,  4,  4, $43, 1 | OAM_BANK1
	dbsprite  1,  1,  4,  4, $44, 1 | OAM_BANK1

.OAMSet_IntroWooper:
	db 16
	dbsprite -3, -2,  4,  0, $00, 2 | OAM_BANK1
	dbsprite -2, -2,  4,  0, $01, 2 | OAM_BANK1
	dbsprite -1, -2,  4,  0, $02, 2 | OAM_BANK1
	dbsprite  0, -2,  4,  0, $03, 2 | OAM_BANK1
	dbsprite -3, -1,  4,  0, $04, 2 | OAM_BANK1
	dbsprite -2, -1,  4,  0, $05, 2 | OAM_BANK1
	dbsprite -1, -1,  4,  0, $06, 2 | OAM_BANK1
	dbsprite  0, -1,  4,  0, $07, 2 | OAM_BANK1
	dbsprite -3,  0,  4,  0, $08, 2 | OAM_BANK1
	dbsprite -2,  0,  4,  0, $09, 2 | OAM_BANK1
	dbsprite -1,  0,  4,  0, $0a, 2 | OAM_BANK1
	dbsprite  0,  0,  4,  0, $0b, 2 | OAM_BANK1
	dbsprite -3,  1,  4,  0, $0c, 2 | OAM_BANK1
	dbsprite -2,  1,  4,  0, $0d, 2 | OAM_BANK1
	dbsprite -1,  1,  4,  0, $0e, 2 | OAM_BANK1
	dbsprite  0,  1,  4,  0, $0f, 2 | OAM_BANK1

.OAMSet_IntroUnown1:
	db 1
	dbsprite -1, -1,  4,  4, $00, 0

.OAMSet_IntroUnown2:
	db 3
	dbsprite -1,  0,  0,  0, $00, 0
	dbsprite -1, -1,  0,  0, $01, 0
	dbsprite  0, -1,  0,  0, $02, 0

.OAMSet_IntroUnown3:
	db 7
	dbsprite -2,  1,  0,  0, $00, 0
	dbsprite -2,  0,  0,  0, $01, 0
	dbsprite -2, -1,  0,  0, $02, 0
	dbsprite -1, -1,  0,  0, $03, 0
	dbsprite -1, -2,  0,  0, $04, 0
	dbsprite  0, -2,  0,  0, $05, 0
	dbsprite  1, -2,  0,  0, $06, 0

.OAMSet_IntroUnownF2_2:
	db 8
	dbsprite -2, -1,  0,  0, $00, 0
	dbsprite -1, -1,  0,  0, $01, 0
	dbsprite  0, -1,  0,  0, $01, 0 | OAM_XFLIP
	dbsprite  1, -1,  0,  0, $00, 0 | OAM_XFLIP
	dbsprite -2,  0,  0,  0, $00, 0 | OAM_YFLIP
	dbsprite -1,  0,  0,  0, $01, 0 | OAM_YFLIP
	dbsprite  0,  0,  0,  0, $01, 0 | OAM_XFLIP | OAM_YFLIP
	dbsprite  1,  0,  0,  0, $00, 0 | OAM_XFLIP | OAM_YFLIP

.OAMSet_IntroUnownF2_3:
	db 12
	dbsprite -1, -3,  0,  0, $00, 0
	dbsprite -1, -2,  0,  0, $01, 0
	dbsprite -1, -1,  0,  0, $02, 0
	dbsprite  0, -3,  0,  0, $00, 0 | OAM_XFLIP
	dbsprite  0, -2,  0,  0, $01, 0 | OAM_XFLIP
	dbsprite  0, -1,  0,  0, $02, 0 | OAM_XFLIP
	dbsprite -1,  0,  0,  0, $02, 0 | OAM_YFLIP
	dbsprite -1,  1,  0,  0, $01, 0 | OAM_YFLIP
	dbsprite -1,  2,  0,  0, $00, 0 | OAM_YFLIP
	dbsprite  0,  0,  0,  0, $02, 0 | OAM_XFLIP | OAM_YFLIP
	dbsprite  0,  1,  0,  0, $01, 0 | OAM_XFLIP | OAM_YFLIP
	dbsprite  0,  2,  0,  0, $00, 0 | OAM_XFLIP | OAM_YFLIP

.OAMSet_IntroUnownF2_4_5:
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

.OAMSet_IntroSuicuneAway:
	db 20
	dbsprite   1,  0,  0,  0, $00, 1 | OAM_PRIO
	dbsprite   2,  1,  0,  0, $00, 1 | OAM_PRIO
	dbsprite   3,  2,  0,  0, $00, 1 | OAM_PRIO
	dbsprite   4,  3,  0,  0, $00, 1 | OAM_PRIO
	dbsprite   5,  4,  0,  0, $00, 1 | OAM_PRIO
	dbsprite   6,  3,  0,  0, $00, 1 | OAM_PRIO
	dbsprite   7,  2,  0,  0, $00, 1 | OAM_PRIO
	dbsprite   8,  1,  0,  0, $00, 1 | OAM_PRIO
	dbsprite   9,  0,  0,  0, $00, 1 | OAM_PRIO
	dbsprite  10,  1,  0,  0, $00, 1 | OAM_PRIO
	dbsprite  11,  2,  0,  0, $00, 1 | OAM_PRIO
	dbsprite  12,  3,  0,  0, $00, 1 | OAM_PRIO
	dbsprite  13,  4,  0,  0, $00, 1 | OAM_PRIO
	dbsprite  14,  3,  0,  0, $00, 1 | OAM_PRIO
	dbsprite  15,  2,  0,  0, $00, 1 | OAM_PRIO
	dbsprite  16,  1,  0,  0, $00, 1 | OAM_PRIO
	dbsprite -15,  0,  0,  0, $00, 1 | OAM_PRIO
	dbsprite -14,  1,  0,  0, $00, 1 | OAM_PRIO
	dbsprite -13,  2,  0,  0, $00, 1 | OAM_PRIO
	dbsprite -12,  3,  0,  0, $00, 1 | OAM_PRIO

.OAMSet_Celebi:
	db 4
	dbsprite -1, -1,  0,  0, $00, PAL_OW_GREEN
	dbsprite  0, -1,  0,  0, $01, PAL_OW_GREEN
	dbsprite -1,  0,  0,  0, $02, PAL_OW_GREEN
	dbsprite  0,  0,  0,  0, $03, PAL_OW_GREEN

.OAMSet_GameFreakLogo1_3:
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

.OAMSet_GameFreakLogo4_11:
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
