; HW sound channel register base addresses
HW_CH1_BASE EQU (rNR10 % $10000)
HW_CH2_BASE EQU ((rNR21 % $10000) - 1)
HW_CH3_BASE EQU (rNR30 % $10000)
HW_CH4_BASE EQU ((rNR41 % $10000) - 1)

; HW sound channel enable bit masks
HW_CH1_ENABLE_MASK EQU %00010001
HW_CH2_ENABLE_MASK EQU %00100010
HW_CH3_ENABLE_MASK EQU %01000100
HW_CH4_ENABLE_MASK EQU %10001000

; HW sound channel disable bit masks
HW_CH1_DISABLE_MASK EQU (~HW_CH1_ENABLE_MASK & $ff)
HW_CH2_DISABLE_MASK EQU (~HW_CH2_ENABLE_MASK & $ff)
HW_CH3_DISABLE_MASK EQU (~HW_CH3_ENABLE_MASK & $ff)
HW_CH4_DISABLE_MASK EQU (~HW_CH4_ENABLE_MASK & $ff)

NRX1_SoundLength_MASK EQU $3f
NRX1_MaxSoundLength EQU $3f
NRX1_WaveDuty_MASK EQU 3<<6
NRX4_RestartSound EQU 1<<7
NR52_AllSoundOn EQU 1<<7

; ChannelFlags
	const_def

	const ChannelFlags_OnOff      ; 0 - 0:Off 1:On
	const ChannelFlags_Subroutine ; 1
	const ChannelFlags_Loop       ; 2
	const ChannelFlagsBit3
	const ChannelFlags_Noise      ; 4
	const ChannelFlagsBit5
	const ChannelFlagsBit6        ; Not found
	const ChannelFlagsBit7        ; Not found

; ChannelFlags2
	const_def

	const ChannelFlags2_Vibrato    ; 0 - 0:Off 1:On
	const ChannelFlags2Bit1        ; set by cmd $e0
	const ChannelFlags2_DutyCycle  ; 2 - 0:Off 1:On
	const ChannelFlags2Bit3        ; Unused
	const ChannelFlags2_PitchShift ; 4 - 1:pitch shift is set, used in cmd $e6 and when cries are played
	const ChannelFlags2Bit5        ; Unused
	const ChannelFlags2Bit6        ; Unused
	const ChannelFlags2Bit7

; ChannelFlags3
	const_def

	const ChannelFlags3_VibratoDir ; 0 - 0:Up 1:Down
	const ChannelFlags3Bit1
	const ChannelFlags3Bit2        ; Not found
	const ChannelFlags3Bit3        ; Not found
	const ChannelFlags3Bit4        ; Not found
	const ChannelFlags3Bit5        ; Not found
	const ChannelFlags3Bit6        ; Not found
	const ChannelFlags3Bit7        ; Not found

; ChannelNoteFlags
	const_def

	const ChannelNoteFlags_NewWaveDuty   ; 0 - load new wave duty
	const ChannelNoteFlags_NoteUpdated   ; 1 - - if set update both freq (NRX3 and NRX4) hardware registers
	const ChannelNoteFlagsBit2           ; Not found
	const ChannelNoteFlags_Sweep         ; 3 - 0:Off 1:On
	const ChannelNoteFlags_LoadChRegs    ; 4 - if set update all hardware registers of the channel
	const ChannelNoteFlags_Rest
	const ChannelNoteFlags_UpdateDutyLoFreq  ; 6 - if set update wave duty (NRX1) and low freq (NRX3) hardware registers
	const ChannelNoteFlagsBit7     ; Not found


	const_def

	const MUSIC_NONE
	const MUSIC_TITLE
	const MUSIC_ROUTE_1
	const MUSIC_ROUTE_3
	const MUSIC_ROUTE_12
	const MUSIC_MAGNET_TRAIN
	const MUSIC_KANTO_GYM_LEADER_BATTLE
	const MUSIC_KANTO_TRAINER_BATTLE
	const MUSIC_KANTO_WILD_BATTLE
	const MUSIC_POKEMON_CENTER
	const MUSIC_HIKER_ENCOUNTER
	const MUSIC_LASS_ENCOUNTER
	const MUSIC_OFFICER_ENCOUNTER
	const MUSIC_HEAL
	const MUSIC_LAVENDER_TOWN
	const MUSIC_ROUTE_2
	const MUSIC_MT_MOON
	const MUSIC_SHOW_ME_AROUND
	const MUSIC_GAME_CORNER
	const MUSIC_BICYCLE
	const MUSIC_HALL_OF_FAME
	const MUSIC_VIRIDIAN_CITY
	const MUSIC_CELADON_CITY
	const MUSIC_TRAINER_VICTORY
	const MUSIC_WILD_VICTORY
	const MUSIC_GYM_VICTORY
	const MUSIC_MT_MOON_SQUARE
	const MUSIC_GYM
	const MUSIC_PALLET_TOWN
	const MUSIC_POKEMON_TALK
	const MUSIC_PROF_OAK
	const MUSIC_RIVAL_ENCOUNTER
	const MUSIC_RIVAL_AFTER
	const MUSIC_SURF
	const MUSIC_EVOLUTION
	const MUSIC_NATIONAL_PARK
	const MUSIC_CREDITS
	const MUSIC_AZALEA_TOWN
	const MUSIC_CHERRYGROVE_CITY
	const MUSIC_KIMONO_ENCOUNTER
	const MUSIC_UNION_CAVE
	const MUSIC_JOHTO_WILD_BATTLE
	const MUSIC_JOHTO_TRAINER_BATTLE
	const MUSIC_ROUTE_30
	const MUSIC_ECRUTEAK_CITY
	const MUSIC_VIOLET_CITY
	const MUSIC_JOHTO_GYM_LEADER_BATTLE
	const MUSIC_CHAMPION_BATTLE
	const MUSIC_RIVAL_BATTLE
	const MUSIC_ROCKET_BATTLE
	const MUSIC_PROF_ELM
	const MUSIC_DARK_CAVE
	const MUSIC_ROUTE_29
	const MUSIC_ROUTE_36
	const MUSIC_SS_AQUA
	const MUSIC_YOUNGSTER_ENCOUNTER
	const MUSIC_BEAUTY_ENCOUNTER
	const MUSIC_ROCKET_ENCOUNTER
	const MUSIC_POKEMANIAC_ENCOUNTER
	const MUSIC_SAGE_ENCOUNTER
	const MUSIC_NEW_BARK_TOWN
	const MUSIC_GOLDENROD_CITY
	const MUSIC_VERMILION_CITY
	const MUSIC_POKEMON_CHANNEL
	const MUSIC_POKE_FLUTE_CHANNEL
	const MUSIC_TIN_TOWER
	const MUSIC_SPROUT_TOWER
	const MUSIC_BURNED_TOWER
	const MUSIC_LIGHTHOUSE
	const MUSIC_LAKE_OF_RAGE
	const MUSIC_INDIGO_PLATEAU
	const MUSIC_ROUTE_37
	const MUSIC_ROCKET_HIDEOUT
	const MUSIC_DRAGONS_DEN
	const MUSIC_JOHTO_WILD_BATTLE_NIGHT
	const MUSIC_RUINS_OF_ALPH_RADIO
	const MUSIC_CAPTURE
	const MUSIC_ROUTE_26
	const MUSIC_MOM
	const MUSIC_VICTORY_ROAD
	const MUSIC_POKEMON_LULLABY
	const MUSIC_POKEMON_MARCH
	const MUSIC_GS_OPENING
	const MUSIC_GS_OPENING_2
	const MUSIC_MAIN_MENU
	const MUSIC_RUINS_OF_ALPH_INTERIOR
	const MUSIC_ROCKET_OVERTURE
	const MUSIC_DANCING_HALL
	const MUSIC_BUG_CATCHING_CONTEST_RANKING
	const MUSIC_BUG_CATCHING_CONTEST
	const MUSIC_LAKE_OF_RAGE_ROCKET_RADIO
	const MUSIC_PRINTER
	const MUSIC_POST_CREDITS
	const MUSIC_CLAIR
	const MUSIC_MOBILE_ADAPTER_MENU
	const MUSIC_MOBILE_ADAPTER
	const MUSIC_BUENAS_PASSWORD
	const MUSIC_MYSTICALMAN_ENCOUNTER
	const MUSIC_CRYSTAL_OPENING
	const MUSIC_BATTLE_TOWER_THEME
	const MUSIC_SUICUNE_BATTLE
	const MUSIC_BATTLE_TOWER_LOBBY
	const MUSIC_MOBILE_CENTER

MUSIC_MAHOGANY_MART EQU 100 ; leftover from gold
