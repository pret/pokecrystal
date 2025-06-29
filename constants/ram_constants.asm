; wInputType::
DEF AUTO_INPUT EQU $ff

; wDebugFlags::
	const_def
	const DEBUG_BATTLE_F
	const DEBUG_FIELD_F

; wCurDexMode::
	const_def
	const DEXMODE_NEW
	const DEXMODE_OLD
	const DEXMODE_ABC
	const DEXMODE_UNOWN

; wMonType::
	const_def
	const PARTYMON   ; 0
	const OTPARTYMON ; 1
	const BOXMON     ; 2
	const TEMPMON    ; 3
	const WILDMON    ; 4

; wJumptableIndex::
DEF JUMPTABLE_INDEX_MASK EQU %01111111
	const_def 7
	shift_const JUMPTABLE_EXIT

; wGameTimerPaused::
DEF GAME_TIMER_COUNTING_F EQU 0
DEF GAME_TIMER_MOBILE_F   EQU 7

; wJoypadDisable::
DEF JOYPAD_DISABLE_MON_FAINT_F    EQU 6
DEF JOYPAD_DISABLE_SGB_TRANSFER_F EQU 7

; wInBattleTowerBattle::
DEF IN_BATTLE_TOWER_BATTLE_F EQU 0

; wOptions1::
DEF TEXT_DELAY_MASK EQU %111
	const_def 4
	const NO_TEXT_SCROLL ; 4
	const STEREO         ; 5
	const BATTLE_SHIFT   ; 6
	const BATTLE_SCENE   ; 7

DEF TEXT_DELAY_FAST EQU %001 ; 1
DEF TEXT_DELAY_MED  EQU %011 ; 3
DEF TEXT_DELAY_SLOW EQU %101 ; 5

; wTextboxFrame::
	const_def
	const FRAME_1 ; 0
	const FRAME_2 ; 1
	const FRAME_3 ; 2
	const FRAME_4 ; 3
	const FRAME_5 ; 4
	const FRAME_6 ; 5
	const FRAME_7 ; 6
	const FRAME_8 ; 7
DEF NUM_FRAMES EQU const_value

; wTextboxFlags::
	const_def
	const FAST_TEXT_DELAY_F ; 0
	const TEXT_DELAY_F      ; 1

; wGBPrinterBrightness::
DEF GBPRINTER_LIGHTEST EQU $00
DEF GBPRINTER_LIGHTER  EQU $20
DEF GBPRINTER_NORMAL   EQU $40
DEF GBPRINTER_DARKER   EQU $60
DEF GBPRINTER_DARKEST  EQU $7f

; wOptions2::
	const_def
	const MENU_ACCOUNT ; 0

; wDST::
DEF DST_F EQU 7

; wWalkingDirection::
	const_def -1
	const STANDING ; -1
	const DOWN     ; 0
	const UP       ; 1
	const LEFT     ; 2
	const RIGHT    ; 3
DEF NUM_DIRECTIONS EQU const_value

DEF DOWN_MASK  EQU 1 << DOWN
DEF UP_MASK    EQU 1 << UP
DEF LEFT_MASK  EQU 1 << LEFT
DEF RIGHT_MASK EQU 1 << RIGHT

; wFacingDirection::
	const_def NUM_DIRECTIONS - 1, -1
	shift_const FACE_DOWN  ; 8
	shift_const FACE_UP    ; 4
	shift_const FACE_LEFT  ; 2
	shift_const FACE_RIGHT ; 1
DEF FACE_CURRENT EQU 0

; wStateFlags
DEF SPRITE_UPDATES_DISABLED_F             EQU 0
DEF LAST_12_SPRITE_OAM_STRUCTS_RESERVED_F EQU 1
DEF TEXT_STATE_F                          EQU 6
DEF SCRIPTED_MOVEMENT_STATE_F             EQU 7

; wSpriteFlags::
DEF SPRITES_VRAM_BANK_0_F       EQU 5
DEF SPRITES_SKIP_WALKING_GFX_F  EQU 6
DEF SPRITES_SKIP_STANDING_GFX_F EQU 7

; wPokemonWithdrawDepositParameter::
DEF PC_WITHDRAW       EQU 0
DEF PC_DEPOSIT        EQU 1
DEF REMOVE_PARTY      EQU 0
DEF REMOVE_BOX        EQU 1
DEF DAY_CARE_WITHDRAW EQU 2
DEF DAY_CARE_DEPOSIT  EQU 3

; wPlayerStepFlags::
	const_def 4
	const PLAYERSTEP_MIDAIR_F   ; 4
	const PLAYERSTEP_CONTINUE_F ; 5
	const PLAYERSTEP_STOP_F     ; 6
	const PLAYERSTEP_START_F    ; 7

; wInitListType::
DEF INIT_ENEMYOT_LIST    EQU 1
DEF INIT_BAG_ITEM_LIST   EQU 2
DEF INIT_OTHER_ITEM_LIST EQU 3
DEF INIT_PLAYEROT_LIST   EQU 4
DEF INIT_MON_LIST        EQU 5

; wMapNameSignFlags::
	const_def 1
	const SHOWN_MAP_NAME_SIGN ; 1

; wTimeOfDay::
	const_def
	shift_const MORN     ; 0
	shift_const DAY      ; 1
	shift_const NITE     ; 2
	shift_const DARKNESS ; 3
DEF NUM_DAYTIMES EQU const_value

DEF ANYTIME EQU MORN | DAY | NITE

; wTimeOfDayPalFlags::
DEF FORCED_PALSET_F EQU 7

; wTimeOfDayPalset::
DEF DARKNESS_PALSET EQU (DARKNESS_F << 6) | (DARKNESS_F << 4) | (DARKNESS_F << 2) | DARKNESS_F

; wBattleAnimFlags::
	const_def
	const BATTLEANIM_STOP_F          ; 0
	const BATTLEANIM_IN_SUBROUTINE_F ; 1
	const BATTLEANIM_IN_LOOP_F       ; 2
	const BATTLEANIM_KEEPSPRITES_F   ; 3

; wBattleScriptFlags::
DEF BATTLESCRIPT_WILD_F     EQU 0
DEF BATTLESCRIPT_SCRIPTED_F EQU 7

; wPlayerSpriteSetupFlags::
DEF PLAYERSPRITESETUP_FACING_MASK       EQU %11
DEF PLAYERSPRITESETUP_FEMALE_TO_MALE_F  EQU 2
DEF PLAYERSPRITESETUP_CUSTOM_FACING_F   EQU 5
DEF PLAYERSPRITESETUP_SKIP_RELOAD_GFX_F EQU 6
DEF PLAYERSPRITESETUP_RESET_ACTION_F    EQU 7

; wPlayerGender::
DEF PLAYERGENDER_FEMALE_F EQU 0

; wMapStatus::
	const_def
	const MAPSTATUS_START  ; 0
	const MAPSTATUS_ENTER  ; 1
	const MAPSTATUS_HANDLE ; 2
	const MAPSTATUS_DONE   ; 3

; wMapEventStatus::
	const_def
	const MAPEVENTS_ON  ; 0
	const MAPEVENTS_OFF ; 1

; wScriptFlags::
	const_def
	const UNUSED_SCRIPT_FLAG_0 ; 0
	const UNUSED_SCRIPT_FLAG_1 ; 1
	const SCRIPT_RUNNING       ; 2
	const RUN_DEFERRED_SCRIPT  ; 3

; wEnabledPlayerEvents::
	const_def
	const PLAYEREVENTS_COUNT_STEPS           ; 0
	const PLAYEREVENTS_COORD_EVENTS          ; 1
	const PLAYEREVENTS_WARPS_AND_CONNECTIONS ; 2
	const_skip
	const PLAYEREVENTS_WILD_ENCOUNTERS       ; 4
	const PLAYEREVENTS_UNUSED                ; 5

; wScriptMode::
	const_def
	const SCRIPT_OFF
	const SCRIPT_READ
	const SCRIPT_WAIT_MOVEMENT
	const SCRIPT_WAIT

; wSpawnAfterChampion::
DEF SPAWN_LANCE EQU 1
DEF SPAWN_RED   EQU 2

; wGameTimeCap::
DEF GAME_TIME_CAPPED EQU 0

; wCurDay::
	const_def
	const SUNDAY    ; 0
	const MONDAY    ; 1
	const TUESDAY   ; 2
	const WEDNESDAY ; 3
	const THURSDAY  ; 4
	const FRIDAY    ; 5
	const SATURDAY  ; 6

; wStatusFlags::
	const_def
	const STATUSFLAGS_POKEDEX_F                  ; 0
	const STATUSFLAGS_UNOWN_DEX_F                ; 1
	const STATUSFLAGS_FLASH_F                    ; 2
	const STATUSFLAGS_CAUGHT_POKERUS_F           ; 3
	const STATUSFLAGS_ROCKET_SIGNAL_F            ; 4
	const STATUSFLAGS_NO_WILD_ENCOUNTERS_F       ; 5
	const STATUSFLAGS_HALL_OF_FAME_F             ; 6
	const STATUSFLAGS_MAIN_MENU_MOBILE_CHOICES_F ; 7

; wStatusFlags2::
	const_def
	const STATUSFLAGS2_ROCKETS_IN_RADIO_TOWER_F ; 0
	const STATUSFLAGS2_SAFARI_GAME_F            ; 1
	const STATUSFLAGS2_BUG_CONTEST_TIMER_F      ; 2
	const STATUSFLAGS2_UNUSED_3_F               ; 3
	const STATUSFLAGS2_BIKE_SHOP_CALL_F         ; 4
	const STATUSFLAGS2_UNUSED_5_F               ; 5
	const STATUSFLAGS2_REACHED_GOLDENROD_F      ; 6
	const STATUSFLAGS2_ROCKETS_IN_MAHOGANY_F    ; 7

; wMomSavingMoney::
DEF MOM_SAVING_SOME_MONEY_F EQU 0
DEF MOM_SAVING_HALF_MONEY_F EQU 1
DEF MOM_SAVING_ALL_MONEY_F  EQU 2
DEF MOM_ACTIVE_F            EQU 7

DEF MOM_SAVING_MONEY_MASK EQU (1 << MOM_SAVING_SOME_MONEY_F) | (1 << MOM_SAVING_HALF_MONEY_F) | (1 << MOM_SAVING_ALL_MONEY_F)

; wJohtoBadges::
	const_def
	const ZEPHYRBADGE
	const HIVEBADGE
	const PLAINBADGE
	const FOGBADGE
	const MINERALBADGE
	const STORMBADGE
	const GLACIERBADGE
	const RISINGBADGE
DEF NUM_JOHTO_BADGES EQU const_value

; wKantoBadges::
	const_def
	const BOULDERBADGE
	const CASCADEBADGE
	const THUNDERBADGE
	const RAINBOWBADGE
	const SOULBADGE
	const MARSHBADGE
	const VOLCANOBADGE
	const EARTHBADGE
DEF NUM_KANTO_BADGES EQU const_value
DEF NUM_BADGES       EQU NUM_JOHTO_BADGES + NUM_KANTO_BADGES

; wPokegearFlags::
	const_def
	const POKEGEAR_MAP_CARD_F   ; 0
	const POKEGEAR_RADIO_CARD_F ; 1
	const POKEGEAR_PHONE_CARD_F ; 2
	const POKEGEAR_EXPN_CARD_F  ; 3
	const_skip 3
	const POKEGEAR_OBTAINED_F   ; 7

; wWhichRegisteredItem::
DEF REGISTERED_POCKET EQU %11000000
DEF REGISTERED_NUMBER EQU %00111111

; wPlayerState::
DEF PLAYER_NORMAL    EQU 0
DEF PLAYER_BIKE      EQU 1
DEF PLAYER_SKATE     EQU 2
DEF PLAYER_SURF      EQU 4
DEF PLAYER_SURF_PIKA EQU 8

; wCelebiEvent::
DEF CELEBIEVENT_FOREST_IS_RESTLESS_F EQU 2

; wBikeFlags::
	const_def
	const BIKEFLAGS_STRENGTH_ACTIVE_F ; 0
	const BIKEFLAGS_ALWAYS_ON_BIKE_F  ; 1
	const BIKEFLAGS_DOWNHILL_F        ; 2

; wDailyFlags1::
	const_def
	const DAILYFLAGS1_KURT_MAKING_BALLS_F             ; 0
	const DAILYFLAGS1_BUG_CONTEST_F                   ; 1
	const DAILYFLAGS1_FISH_SWARM_F                    ; 2
	const DAILYFLAGS1_TIME_CAPSULE_F                  ; 3
	const DAILYFLAGS1_ALL_FRUIT_TREES_F               ; 4
	const DAILYFLAGS1_GOT_SHUCKIE_TODAY_F             ; 5
	const DAILYFLAGS1_GOLDENROD_UNDERGROUND_BARGAIN_F ; 6
	const DAILYFLAGS1_TRAINER_HOUSE_F                 ; 7

; wDailyFlags2::
	const_def
	const DAILYFLAGS2_MT_MOON_SQUARE_CLEFAIRY_F           ; 0
	const DAILYFLAGS2_UNION_CAVE_LAPRAS_F                 ; 1
	const DAILYFLAGS2_GOLDENROD_UNDERGROUND_GOT_HAIRCUT_F ; 2
	const DAILYFLAGS2_GOLDENROD_DEPT_STORE_TM27_RETURN_F  ; 3
	const DAILYFLAGS2_DAISYS_GROOMING_F                   ; 4
	const DAILYFLAGS2_INDIGO_PLATEAU_RIVAL_FIGHT_F        ; 5
	const DAILYFLAGS2_MOVE_TUTOR_F                        ; 6
	const DAILYFLAGS2_BUENAS_PASSWORD_F                   ; 7

; wSwarmFlags::
	const_def
	const SWARMFLAGS_BUENAS_PASSWORD_F           ; 0
	const SWARMFLAGS_GOLDENROD_DEPT_STORE_SALE_F ; 1
	const SWARMFLAGS_DUNSPARCE_SWARM_F           ; 2
	const SWARMFLAGS_YANMA_SWARM_F               ; 3
	const SWARMFLAGS_MOBILE_4_F                  ; 4

; wLuckyNumberShowFlag::
DEF LUCKYNUMBERSHOW_GAME_OVER_F EQU 0

; wDayCareMan::
DEF DAYCAREMAN_HAS_MON_F         EQU 0
DEF DAYCAREMAN_MONS_COMPATIBLE_F EQU 5
DEF DAYCAREMAN_HAS_EGG_F         EQU 6
DEF DAYCAREMAN_ACTIVE_F          EQU 7

; wDayCareLady::
DEF DAYCARELADY_HAS_MON_F        EQU 0
DEF DAYCARELADY_ACTIVE_F         EQU 7

; wUnlockedUnowns::
	const_def
	const UNLOCKED_UNOWNS_A_TO_K_F
	const UNLOCKED_UNOWNS_L_TO_R_F
	const UNLOCKED_UNOWNS_S_TO_W_F
	const UNLOCKED_UNOWNS_X_TO_Z_F
DEF NUM_UNLOCKED_UNOWN_SETS EQU const_value

; sRTCStatusFlags::
	const_def 5
	shift_const RTC_DAYS_EXCEED_139 ; 5
	shift_const RTC_DAYS_EXCEED_255 ; 6
	shift_const RTC_RESET           ; 7

; hVBlank::
; VBlankHandlers indexes (see home/vblank.asm)
	const_def
	const VBLANK_NORMAL       ; 0
	const VBLANK_CUTSCENE     ; 1
	const VBLANK_SOUND_ONLY   ; 2
	const VBLANK_CUTSCENE_CGB ; 3
	const VBLANK_SERIAL       ; 4
	const VBLANK_CREDITS      ; 5
	const VBLANK_DMA_TRANSFER ; 6
	const VBLANK_UNUSED       ; 7
DEF NUM_VBLANK_HANDLERS EQU const_value

; rRAMB::
DEF NUM_SRAM_BANKS EQU 4

; rLCDC::
DEF LCDC_DEFAULT EQU LCDC_ON | LCDC_WIN_9C00 | LCDC_WIN_ON | LCDC_BLOCK21 | LCDC_BG_9800 | LCDC_OBJ_8 | LCDC_OBJ_ON | LCDC_PRIO_ON

; rIE::
DEF IE_DEFAULT EQU IE_SERIAL | IE_TIMER | IE_STAT | IE_VBLANK
