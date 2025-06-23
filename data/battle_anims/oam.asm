MACRO battleanimoam
; vtile offset, data length, data pointer
	db \1, \2
	dw \3
ENDM

BattleAnimOAMData:
; entries correspond to BATTLE_ANIM_OAMSET_* constants
	table_width 4
	battleanimoam $00, 16, .OAMData_00 ; BATTLE_ANIM_OAMSET_00
	battleanimoam $04,  9, .OAMData_01 ; BATTLE_ANIM_OAMSET_01
	battleanimoam $08,  4, .OAMData_02 ; BATTLE_ANIM_OAMSET_02
	battleanimoam $09,  4, .OAMData_03 ; BATTLE_ANIM_OAMSET_03
	battleanimoam $0d,  4, .OAMData_04 ; BATTLE_ANIM_OAMSET_04
	battleanimoam $0f,  4, .OAMData_03 ; BATTLE_ANIM_OAMSET_05
	battleanimoam $13,  4, .OAMData_04 ; BATTLE_ANIM_OAMSET_06
	battleanimoam $04, 16, .OAMData_00 ; BATTLE_ANIM_OAMSET_07
	battleanimoam $08, 16, .OAMData_00 ; BATTLE_ANIM_OAMSET_08
	battleanimoam $08, 16, .OAMData_09 ; BATTLE_ANIM_OAMSET_09
	battleanimoam $00,  4, .OAMData_04 ; BATTLE_ANIM_OAMSET_0A
	battleanimoam $02,  4, .OAMData_03 ; BATTLE_ANIM_OAMSET_0B
	battleanimoam $06,  2, .OAMData_0c ; BATTLE_ANIM_OAMSET_0C
	battleanimoam $07,  2, .OAMData_0c ; BATTLE_ANIM_OAMSET_0D
	battleanimoam $02,  4, .OAMData_04 ; BATTLE_ANIM_OAMSET_0E
	battleanimoam $04,  1, .OAMData_0f ; BATTLE_ANIM_OAMSET_0F
	battleanimoam $05,  1, .OAMData_0f ; BATTLE_ANIM_OAMSET_10
	battleanimoam $00,  2, .OAMData_11 ; BATTLE_ANIM_OAMSET_11
	battleanimoam $02,  2, .OAMData_11 ; BATTLE_ANIM_OAMSET_12
	battleanimoam $00,  4, .OAMData_13 ; BATTLE_ANIM_OAMSET_13
	battleanimoam $00,  1, .OAMData_0f ; BATTLE_ANIM_OAMSET_14
	battleanimoam $01,  1, .OAMData_0f ; BATTLE_ANIM_OAMSET_15
	battleanimoam $02,  1, .OAMData_0f ; BATTLE_ANIM_OAMSET_16
	battleanimoam $03,  1, .OAMData_0f ; BATTLE_ANIM_OAMSET_17
	battleanimoam $00,  4, .OAMData_02 ; BATTLE_ANIM_OAMSET_18
	battleanimoam $01, 16, .OAMData_00 ; BATTLE_ANIM_OAMSET_19
	battleanimoam $05, 16, .OAMData_00 ; BATTLE_ANIM_OAMSET_1A
	battleanimoam $00,  4, .OAMData_03 ; BATTLE_ANIM_OAMSET_1B
	battleanimoam $05, 12, .OAMData_1c ; BATTLE_ANIM_OAMSET_1C
	battleanimoam $02,  4, .OAMData_02 ; BATTLE_ANIM_OAMSET_1D
	battleanimoam $06,  1, .OAMData_0f ; BATTLE_ANIM_OAMSET_1E
	battleanimoam $07,  1, .OAMData_0f ; BATTLE_ANIM_OAMSET_1F
	battleanimoam $08,  1, .OAMData_0f ; BATTLE_ANIM_OAMSET_20
	battleanimoam $04,  4, .OAMData_03 ; BATTLE_ANIM_OAMSET_21
	battleanimoam $09, 22, .OAMData_22 ; BATTLE_ANIM_OAMSET_22
	battleanimoam $04,  2, .OAMData_11 ; BATTLE_ANIM_OAMSET_23
	battleanimoam $06,  2, .OAMData_11 ; BATTLE_ANIM_OAMSET_24
	battleanimoam $0c,  1, .OAMData_0f ; BATTLE_ANIM_OAMSET_25
	battleanimoam $0a,  1, .OAMData_0f ; BATTLE_ANIM_OAMSET_26
	battleanimoam $0b,  4, .OAMData_02 ; BATTLE_ANIM_OAMSET_27
	battleanimoam $08,  4, .OAMData_04 ; BATTLE_ANIM_OAMSET_28
	battleanimoam $06,  4, .OAMData_04 ; BATTLE_ANIM_OAMSET_29
	battleanimoam $00,  5, .OAMData_2a ; BATTLE_ANIM_OAMSET_2A
	battleanimoam $03,  6, .OAMData_2b ; BATTLE_ANIM_OAMSET_2B
	battleanimoam $00,  7, .OAMData_2c ; BATTLE_ANIM_OAMSET_2C
	battleanimoam $03,  8, .OAMData_2d ; BATTLE_ANIM_OAMSET_2D
	battleanimoam $00,  9, .OAMData_2e ; BATTLE_ANIM_OAMSET_2E
	battleanimoam $00,  4, .OAMData_2f ; BATTLE_ANIM_OAMSET_2F
	battleanimoam $02,  4, .OAMData_30 ; BATTLE_ANIM_OAMSET_30
	battleanimoam $04,  6, .OAMData_31 ; BATTLE_ANIM_OAMSET_31
	battleanimoam $00,  2, .OAMData_32 ; BATTLE_ANIM_OAMSET_32
	battleanimoam $00,  7, .OAMData_33 ; BATTLE_ANIM_OAMSET_33
	battleanimoam $00, 14, .OAMData_32 ; BATTLE_ANIM_OAMSET_34
	battleanimoam $00, 21, .OAMData_33 ; BATTLE_ANIM_OAMSET_35
	battleanimoam $00,  2, .OAMData_36 ; BATTLE_ANIM_OAMSET_36
	battleanimoam $00,  6, .OAMData_36 ; BATTLE_ANIM_OAMSET_37
	battleanimoam $00, 10, .OAMData_36 ; BATTLE_ANIM_OAMSET_38
	battleanimoam $00, 14, .OAMData_36 ; BATTLE_ANIM_OAMSET_39
	battleanimoam $00,  2, .OAMData_3a ; BATTLE_ANIM_OAMSET_3A
	battleanimoam $00,  6, .OAMData_3a ; BATTLE_ANIM_OAMSET_3B
	battleanimoam $00, 10, .OAMData_3a ; BATTLE_ANIM_OAMSET_3C
	battleanimoam $00, 14, .OAMData_3a ; BATTLE_ANIM_OAMSET_3D
	battleanimoam $00,  4, .OAMData_3e ; BATTLE_ANIM_OAMSET_3E
	battleanimoam $00, 16, .OAMData_3e ; BATTLE_ANIM_OAMSET_3F
	battleanimoam $00, 26, .OAMData_3e ; BATTLE_ANIM_OAMSET_40
	battleanimoam $00, 26, .OAMData_41 ; BATTLE_ANIM_OAMSET_41
	battleanimoam $0e,  4, .OAMData_42 ; BATTLE_ANIM_OAMSET_42
	battleanimoam $0e,  8, .OAMData_42 ; BATTLE_ANIM_OAMSET_43
	battleanimoam $0e,  4, .OAMData_44 ; BATTLE_ANIM_OAMSET_44
	battleanimoam $0e,  8, .OAMData_44 ; BATTLE_ANIM_OAMSET_45
	battleanimoam $0e,  4, .OAMData_46 ; BATTLE_ANIM_OAMSET_46
	battleanimoam $0e,  4, .OAMData_47 ; BATTLE_ANIM_OAMSET_47
	battleanimoam $00,  6, .OAMData_48 ; BATTLE_ANIM_OAMSET_48
	battleanimoam $03,  4, .OAMData_49 ; BATTLE_ANIM_OAMSET_49
	battleanimoam $03,  2, .OAMData_4a ; BATTLE_ANIM_OAMSET_4A
	battleanimoam $01,  5, .OAMData_0f ; BATTLE_ANIM_OAMSET_4B
	battleanimoam $01,  6, .OAMData_4c ; BATTLE_ANIM_OAMSET_4C
	battleanimoam $01,  7, .OAMData_4d ; BATTLE_ANIM_OAMSET_4D
	battleanimoam $01,  3, .OAMData_4d ; BATTLE_ANIM_OAMSET_4E
	battleanimoam $01,  8, .OAMData_4f ; BATTLE_ANIM_OAMSET_4F
	battleanimoam $01,  9, .OAMData_50 ; BATTLE_ANIM_OAMSET_50
	battleanimoam $01, 10, .OAMData_51 ; BATTLE_ANIM_OAMSET_51
	battleanimoam $01,  6, .OAMData_51 ; BATTLE_ANIM_OAMSET_52
	battleanimoam $00,  9, .OAMData_01 ; BATTLE_ANIM_OAMSET_53
	battleanimoam $04,  4, .OAMData_02 ; BATTLE_ANIM_OAMSET_54
	battleanimoam $05,  4, .OAMData_02 ; BATTLE_ANIM_OAMSET_55
	battleanimoam $00,  2, .OAMData_56 ; BATTLE_ANIM_OAMSET_56
	battleanimoam $02,  2, .OAMData_56 ; BATTLE_ANIM_OAMSET_57
	battleanimoam $04,  2, .OAMData_56 ; BATTLE_ANIM_OAMSET_58
	battleanimoam $02,  4, .OAMData_59 ; BATTLE_ANIM_OAMSET_59
	battleanimoam $02,  4, .OAMData_5a ; BATTLE_ANIM_OAMSET_5A
	battleanimoam $02,  2, .OAMData_0c ; BATTLE_ANIM_OAMSET_5B
	battleanimoam $04,  2, .OAMData_0c ; BATTLE_ANIM_OAMSET_5C
	battleanimoam $06,  4, .OAMData_5d ; BATTLE_ANIM_OAMSET_5D
	battleanimoam $08,  2, .OAMData_0c ; BATTLE_ANIM_OAMSET_5E
	battleanimoam $09,  2, .OAMData_0c ; BATTLE_ANIM_OAMSET_5F
	battleanimoam $05,  2, .OAMData_60 ; BATTLE_ANIM_OAMSET_60
	battleanimoam $00,  2, .OAMData_61 ; BATTLE_ANIM_OAMSET_61
	battleanimoam $00,  5, .OAMData_61 ; BATTLE_ANIM_OAMSET_62
	battleanimoam $00,  9, .OAMData_61 ; BATTLE_ANIM_OAMSET_63
	battleanimoam $09,  9, .OAMData_61 ; BATTLE_ANIM_OAMSET_64
	battleanimoam $00,  4, .OAMData_65 ; BATTLE_ANIM_OAMSET_65
	battleanimoam $00,  7, .OAMData_65 ; BATTLE_ANIM_OAMSET_66
	battleanimoam $00,  9, .OAMData_65 ; BATTLE_ANIM_OAMSET_67
	battleanimoam $09,  9, .OAMData_65 ; BATTLE_ANIM_OAMSET_68
	battleanimoam $04,  1, .OAMData_69 ; BATTLE_ANIM_OAMSET_69
	battleanimoam $05,  2, .OAMData_6a ; BATTLE_ANIM_OAMSET_6A
	battleanimoam $06,  4, .OAMData_03 ; BATTLE_ANIM_OAMSET_6B
	battleanimoam $0a,  4, .OAMData_03 ; BATTLE_ANIM_OAMSET_6C
	battleanimoam $0e,  4, .OAMData_03 ; BATTLE_ANIM_OAMSET_6D
	battleanimoam $08,  5, .OAMData_6e ; BATTLE_ANIM_OAMSET_6E
	battleanimoam $0d,  3, .OAMData_6f ; BATTLE_ANIM_OAMSET_6F
	battleanimoam $01,  8, .OAMData_70 ; BATTLE_ANIM_OAMSET_70
	battleanimoam $03,  8, .OAMData_70 ; BATTLE_ANIM_OAMSET_71
	battleanimoam $05,  8, .OAMData_70 ; BATTLE_ANIM_OAMSET_72
	battleanimoam $07,  8, .OAMData_70 ; BATTLE_ANIM_OAMSET_73
	battleanimoam $06,  4, .OAMData_02 ; BATTLE_ANIM_OAMSET_74
	battleanimoam $07,  4, .OAMData_02 ; BATTLE_ANIM_OAMSET_75
	battleanimoam $0a,  2, .OAMData_76 ; BATTLE_ANIM_OAMSET_76
	battleanimoam $00,  1, .OAMData_77 ; BATTLE_ANIM_OAMSET_77
	battleanimoam $00,  3, .OAMData_78 ; BATTLE_ANIM_OAMSET_78
	battleanimoam $00,  6, .OAMData_79 ; BATTLE_ANIM_OAMSET_79
	battleanimoam $00,  9, .OAMData_7a ; BATTLE_ANIM_OAMSET_7A
	battleanimoam $00, 12, .OAMData_7b ; BATTLE_ANIM_OAMSET_7B
	battleanimoam $00, 14, .OAMData_7c ; BATTLE_ANIM_OAMSET_7C
	battleanimoam $00, 15, .OAMData_7d ; BATTLE_ANIM_OAMSET_7D
	battleanimoam $04,  4, .OAMData_03 ; BATTLE_ANIM_OAMSET_7E
	battleanimoam $08,  4, .OAMData_03 ; BATTLE_ANIM_OAMSET_7F
	battleanimoam $0d,  1, .OAMData_0f ; BATTLE_ANIM_OAMSET_80
	battleanimoam $0e,  4, .OAMData_81 ; BATTLE_ANIM_OAMSET_81
	battleanimoam $10,  1, .OAMData_0f ; BATTLE_ANIM_OAMSET_82
	battleanimoam $11,  1, .OAMData_0f ; BATTLE_ANIM_OAMSET_83
	battleanimoam $04,  2, .OAMData_6a ; BATTLE_ANIM_OAMSET_84
	battleanimoam $05,  2, .OAMData_6a ; BATTLE_ANIM_OAMSET_85
	battleanimoam $0a,  4, .OAMData_04 ; BATTLE_ANIM_OAMSET_86
	battleanimoam $00,  8, .OAMData_87 ; BATTLE_ANIM_OAMSET_87
	battleanimoam $00, 12, .OAMData_88 ; BATTLE_ANIM_OAMSET_88
	battleanimoam $00, 16, .OAMData_87 ; BATTLE_ANIM_OAMSET_89
	battleanimoam $09,  2, .OAMData_8a ; BATTLE_ANIM_OAMSET_8A
	battleanimoam $09,  4, .OAMData_8a ; BATTLE_ANIM_OAMSET_8B
	battleanimoam $09,  6, .OAMData_8a ; BATTLE_ANIM_OAMSET_8C
	battleanimoam $09,  8, .OAMData_8a ; BATTLE_ANIM_OAMSET_8D
	battleanimoam $12,  5, .OAMData_8e ; BATTLE_ANIM_OAMSET_8E
	battleanimoam $00,  4, .OAMData_8f ; BATTLE_ANIM_OAMSET_8F
	battleanimoam $04,  4, .OAMData_8f ; BATTLE_ANIM_OAMSET_90
	battleanimoam $08,  4, .OAMData_8f ; BATTLE_ANIM_OAMSET_91
	battleanimoam $0c,  4, .OAMData_8f ; BATTLE_ANIM_OAMSET_92
	battleanimoam $00,  6, .OAMData_93 ; BATTLE_ANIM_OAMSET_93
	battleanimoam $04,  4, .OAMData_03 ; BATTLE_ANIM_OAMSET_94
	battleanimoam $0a,  4, .OAMData_04 ; BATTLE_ANIM_OAMSET_95
	battleanimoam $15,  4, .OAMData_30 ; BATTLE_ANIM_OAMSET_96
	battleanimoam $04,  4, .OAMData_30 ; BATTLE_ANIM_OAMSET_97
	battleanimoam $0c,  4, .OAMData_04 ; BATTLE_ANIM_OAMSET_98
	battleanimoam $0a,  4, .OAMData_99 ; BATTLE_ANIM_OAMSET_99
	battleanimoam $0c,  4, .OAMData_03 ; BATTLE_ANIM_OAMSET_9A
	battleanimoam $00, 36, .OAMData_9b ; BATTLE_ANIM_OAMSET_9B
	battleanimoam $0d,  2, .OAMData_9c ; BATTLE_ANIM_OAMSET_9C
	battleanimoam $0d,  4, .OAMData_9c ; BATTLE_ANIM_OAMSET_9D
	battleanimoam $0d,  6, .OAMData_9c ; BATTLE_ANIM_OAMSET_9E
	battleanimoam $02,  8, .OAMData_9f ; BATTLE_ANIM_OAMSET_9F
	battleanimoam $08,  7, .OAMData_a0 ; BATTLE_ANIM_OAMSET_A0
	battleanimoam $08,  5, .OAMData_a0 ; BATTLE_ANIM_OAMSET_A1
	battleanimoam $08,  3, .OAMData_a0 ; BATTLE_ANIM_OAMSET_A2
	battleanimoam $00, 16, .OAMData_1c ; BATTLE_ANIM_OAMSET_A3
	battleanimoam $00,  9, .OAMData_a4 ; BATTLE_ANIM_OAMSET_A4
	battleanimoam $06,  9, .OAMData_a4 ; BATTLE_ANIM_OAMSET_A5
	battleanimoam $0c,  9, .OAMData_a4 ; BATTLE_ANIM_OAMSET_A6
	battleanimoam $12,  9, .OAMData_a4 ; BATTLE_ANIM_OAMSET_A7
	battleanimoam $18,  9, .OAMData_a4 ; BATTLE_ANIM_OAMSET_A8
	battleanimoam $1e,  9, .OAMData_a4 ; BATTLE_ANIM_OAMSET_A9
	battleanimoam $24,  9, .OAMData_a4 ; BATTLE_ANIM_OAMSET_AA
	battleanimoam $2a,  9, .OAMData_a4 ; BATTLE_ANIM_OAMSET_AB
	battleanimoam $03,  4, .OAMData_ac ; BATTLE_ANIM_OAMSET_AC
	battleanimoam $12,  4, .OAMData_03 ; BATTLE_ANIM_OAMSET_AD
	battleanimoam $10,  4, .OAMData_04 ; BATTLE_ANIM_OAMSET_AE
	battleanimoam $16,  1, .OAMData_0f ; BATTLE_ANIM_OAMSET_AF
	battleanimoam $17,  4, .OAMData_02 ; BATTLE_ANIM_OAMSET_B0
	battleanimoam $18,  4, .OAMData_03 ; BATTLE_ANIM_OAMSET_B1
	battleanimoam $1c,  4, .OAMData_03 ; BATTLE_ANIM_OAMSET_B2
	battleanimoam $20,  3, .OAMData_03 ; BATTLE_ANIM_OAMSET_B3
	battleanimoam $23,  4, .OAMData_04 ; BATTLE_ANIM_OAMSET_B4
	battleanimoam $25,  3, .OAMData_03 ; BATTLE_ANIM_OAMSET_B5
	battleanimoam $17,  4, .OAMData_03 ; BATTLE_ANIM_OAMSET_B6
	battleanimoam $0a, 16, .OAMData_00 ; BATTLE_ANIM_OAMSET_B7
	battleanimoam $10, 16, .OAMData_1c ; BATTLE_ANIM_OAMSET_B8
	battleanimoam $00, 16, .OAMData_1c ; BATTLE_ANIM_OAMSET_B9
	battleanimoam $04,  4, .OAMData_03 ; BATTLE_ANIM_OAMSET_BA
	battleanimoam $08,  2, .OAMData_11 ; BATTLE_ANIM_OAMSET_BB
	battleanimoam $20,  6, .OAMData_bc ; BATTLE_ANIM_OAMSET_BC
	battleanimoam $08,  1, .OAMData_0f ; BATTLE_ANIM_OAMSET_BD
	battleanimoam $04,  4, .OAMData_03 ; BATTLE_ANIM_OAMSET_BE
	battleanimoam $1a,  4, .OAMData_30 ; BATTLE_ANIM_OAMSET_BF
	battleanimoam $16,  9, .OAMData_01 ; BATTLE_ANIM_OAMSET_C0
	battleanimoam $10, 16, .OAMData_c1 ; BATTLE_ANIM_OAMSET_C1
	battleanimoam $09,  6, .OAMData_c2 ; BATTLE_ANIM_OAMSET_C2
	battleanimoam $11,  9, .OAMData_c3 ; BATTLE_ANIM_OAMSET_C3
	battleanimoam $0e,  4, .OAMData_03 ; BATTLE_ANIM_OAMSET_C4
	battleanimoam $0b,  4, .OAMData_30 ; BATTLE_ANIM_OAMSET_C5
	battleanimoam $1c,  6, .OAMData_02 ; BATTLE_ANIM_OAMSET_C6
	battleanimoam $20, 16, .OAMData_c1 ; BATTLE_ANIM_OAMSET_C7
	battleanimoam $05,  6, .OAMData_c8 ; BATTLE_ANIM_OAMSET_C8
	battleanimoam $0b,  4, .OAMData_03 ; BATTLE_ANIM_OAMSET_C9
	battleanimoam $09,  4, .OAMData_ca ; BATTLE_ANIM_OAMSET_CA
	battleanimoam $0b,  4, .OAMData_04 ; BATTLE_ANIM_OAMSET_CB
	battleanimoam $11, 13, .OAMData_cc ; BATTLE_ANIM_OAMSET_CC
	battleanimoam $00,  9, .OAMData_c3 ; BATTLE_ANIM_OAMSET_CD
	battleanimoam $09,  9, .OAMData_c3 ; BATTLE_ANIM_OAMSET_CE
	battleanimoam $00, 12, .OAMData_cf ; BATTLE_ANIM_OAMSET_CF
	battleanimoam $06, 12, .OAMData_cf ; BATTLE_ANIM_OAMSET_D0
	battleanimoam $0c, 12, .OAMData_cf ; BATTLE_ANIM_OAMSET_D1
	battleanimoam $12, 12, .OAMData_cf ; BATTLE_ANIM_OAMSET_D2
	battleanimoam $00, 13, .OAMData_cc ; BATTLE_ANIM_OAMSET_D3
	battleanimoam $00,  7, .OAMData_d4 ; BATTLE_ANIM_OAMSET_D4
	battleanimoam $00,  6, .OAMData_d5 ; BATTLE_ANIM_OAMSET_D5
	battleanimoam $00, 14, .OAMData_d6 ; BATTLE_ANIM_OAMSET_D6
	battleanimoam $00, 12, .OAMData_d7 ; BATTLE_ANIM_OAMSET_D7
	assert_table_length NUM_BATTLE_ANIM_OAMSETS

.OAMData_11:
	dbsprite  -1,  -1, 4, 0, $00, $0
	dbsprite  -1,   0, 4, 0, $01, $0

.OAMData_56:
	dbsprite  -1,  -1, 0, 4, $00, $0
	dbsprite   0,  -1, 0, 4, $01, $0

.OAMData_03:
	dbsprite  -1,  -1, 0, 0, $00, $0
	dbsprite   0,  -1, 0, 0, $01, $0
	dbsprite  -1,   0, 0, 0, $02, $0
	dbsprite   0,   0, 0, 0, $03, $0

.OAMData_02:
	dbsprite  -1,  -1, 0, 0, $00, $0
	dbsprite   0,  -1, 0, 0, $00, OAM_XFLIP
	dbsprite  -1,   0, 0, 0, $00, OAM_YFLIP
	dbsprite   0,   0, 0, 0, $00, OAM_XFLIP | OAM_YFLIP

.OAMData_c3:
	dbsprite  -2,  -2, 4, 4, $00, $0
	dbsprite  -1,  -2, 4, 4, $01, $0
	dbsprite   0,  -2, 4, 4, $02, $0
	dbsprite  -2,  -1, 4, 4, $03, $0
	dbsprite  -1,  -1, 4, 4, $04, $0
	dbsprite   0,  -1, 4, 4, $05, $0
	dbsprite  -2,   0, 4, 4, $06, $0
	dbsprite  -1,   0, 4, 4, $07, $0
	dbsprite   0,   0, 4, 4, $08, $0

.OAMData_01:
	dbsprite  -2,  -2, 4, 4, $00, $0
	dbsprite  -1,  -2, 4, 4, $01, $0
	dbsprite   0,  -2, 4, 4, $00, OAM_XFLIP
	dbsprite  -2,  -1, 4, 4, $02, $0
	dbsprite  -1,  -1, 4, 4, $03, $0
	dbsprite   0,  -1, 4, 4, $02, OAM_XFLIP | OAM_YFLIP
	dbsprite  -2,   0, 4, 4, $00, OAM_YFLIP
	dbsprite  -1,   0, 4, 4, $01, OAM_XFLIP | OAM_YFLIP
	dbsprite   0,   0, 4, 4, $00, OAM_XFLIP | OAM_YFLIP

.OAMData_cf:
	dbsprite  -2,  -2, 4, 0, $00, $0
	dbsprite  -1,  -2, 4, 0, $01, $0
	dbsprite   0,  -2, 4, 0, $02, $0
	dbsprite  -2,  -1, 4, 0, $03, $0
	dbsprite  -1,  -1, 4, 0, $04, $0
	dbsprite   0,  -1, 4, 0, $05, $0
	dbsprite  -2,   0, 4, 0, $05, OAM_XFLIP | OAM_YFLIP
	dbsprite  -1,   0, 4, 0, $04, OAM_XFLIP | OAM_YFLIP
	dbsprite   0,   0, 4, 0, $03, OAM_XFLIP | OAM_YFLIP
	dbsprite  -2,   1, 4, 0, $02, OAM_XFLIP | OAM_YFLIP
	dbsprite  -1,   1, 4, 0, $01, OAM_XFLIP | OAM_YFLIP
	dbsprite   0,   1, 4, 0, $00, OAM_XFLIP | OAM_YFLIP

.OAMData_1c:
	dbsprite  -2,  -2, 0, 0, $00, $0
	dbsprite  -1,  -2, 0, 0, $01, $0
	dbsprite   0,  -2, 0, 0, $02, $0
	dbsprite   1,  -2, 0, 0, $03, $0
	dbsprite  -2,  -1, 0, 0, $04, $0
	dbsprite  -1,  -1, 0, 0, $05, $0
	dbsprite   0,  -1, 0, 0, $06, $0
	dbsprite   1,  -1, 0, 0, $07, $0
	dbsprite  -2,   0, 0, 0, $08, $0
	dbsprite  -1,   0, 0, 0, $09, $0
	dbsprite   0,   0, 0, 0, $0a, $0
	dbsprite   1,   0, 0, 0, $0b, $0
	dbsprite  -2,   1, 0, 0, $0c, $0
	dbsprite  -1,   1, 0, 0, $0d, $0
	dbsprite   0,   1, 0, 0, $0e, $0
	dbsprite   1,   1, 0, 0, $0f, $0

.OAMData_00:
	dbsprite  -2,  -2, 0, 0, $00, $0
	dbsprite  -1,  -2, 0, 0, $01, $0
	dbsprite  -2,  -1, 0, 0, $02, $0
	dbsprite  -1,  -1, 0, 0, $03, $0
	dbsprite   0,  -2, 0, 0, $01, OAM_XFLIP
	dbsprite   1,  -2, 0, 0, $00, OAM_XFLIP
	dbsprite   0,  -1, 0, 0, $03, OAM_XFLIP
	dbsprite   1,  -1, 0, 0, $02, OAM_XFLIP
	dbsprite  -2,   0, 0, 0, $02, OAM_YFLIP
	dbsprite  -1,   0, 0, 0, $03, OAM_YFLIP
	dbsprite  -2,   1, 0, 0, $00, OAM_YFLIP
	dbsprite  -1,   1, 0, 0, $01, OAM_YFLIP
	dbsprite   0,   0, 0, 0, $03, OAM_XFLIP | OAM_YFLIP
	dbsprite   1,   0, 0, 0, $02, OAM_XFLIP | OAM_YFLIP
	dbsprite   0,   1, 0, 0, $01, OAM_XFLIP | OAM_YFLIP
	dbsprite   1,   1, 0, 0, $00, OAM_XFLIP | OAM_YFLIP

.OAMData_09:
	dbsprite  -3,  -3, 4, 4, $00, $0
	dbsprite  -2,  -3, 4, 4, $01, $0
	dbsprite  -3,  -2, 4, 4, $02, $0
	dbsprite  -2,  -2, 4, 4, $03, $0
	dbsprite   0,  -3, 4, 4, $01, OAM_XFLIP
	dbsprite   1,  -3, 4, 4, $00, OAM_XFLIP
	dbsprite   0,  -2, 4, 4, $03, OAM_XFLIP
	dbsprite   1,  -2, 4, 4, $02, OAM_XFLIP
	dbsprite  -3,   0, 4, 4, $02, OAM_YFLIP
	dbsprite  -2,   0, 4, 4, $03, OAM_YFLIP
	dbsprite  -3,   1, 4, 4, $00, OAM_YFLIP
	dbsprite  -2,   1, 4, 4, $01, OAM_YFLIP
	dbsprite   0,   0, 4, 4, $03, OAM_XFLIP | OAM_YFLIP
	dbsprite   1,   0, 4, 4, $02, OAM_XFLIP | OAM_YFLIP
	dbsprite   0,   1, 4, 4, $01, OAM_XFLIP | OAM_YFLIP
	dbsprite   1,   1, 4, 4, $00, OAM_XFLIP | OAM_YFLIP

.OAMData_0c:
	dbsprite  -1,  -1, 0, 4, $00, $0
	dbsprite   0,  -1, 0, 4, $00, OAM_XFLIP

.OAMData_6a:
	dbsprite  -1,   0, 0, 0, $00, $0
	dbsprite   0,   0, 0, 0, $00, OAM_XFLIP

.OAMData_04:
	dbsprite  -1,  -1, 0, 0, $00, $0
	dbsprite   0,  -1, 0, 0, $00, OAM_XFLIP
	dbsprite  -1,   0, 0, 0, $01, $0
	dbsprite   0,   0, 0, 0, $01, OAM_XFLIP

.OAMData_5d:
	dbsprite  -1,  -1, 0, 0, $00, $0
	dbsprite   0,  -1, 0, 0, $01, $0
	dbsprite  -1,   0, 0, 0, $00, OAM_YFLIP
	dbsprite   0,   0, 0, 0, $01, OAM_YFLIP

.OAMData_13:
	dbsprite  -1,  -1, 0, 2, $02, $0
	dbsprite  -1,   0, 0, 2, $03, $0
	dbsprite   0,  -2, 0, 6, $02, $0
	dbsprite   0,  -1, 0, 6, $03, $0

.OAMData_22:
	dbsprite -11,   1, 0, 0, $01, $0
	dbsprite -10,   0, 0, 0, $02, $0
	dbsprite  -9,   0, 0, 0, $03, $0
	dbsprite  -8,   0, 0, 0, $00, $0
	dbsprite  -7,   0, 0, 0, $03, $0
	dbsprite  -6,   0, 0, 0, $00, $0
	dbsprite  -5,   0, 0, 0, $03, $0
	dbsprite  -4,   0, 0, 0, $00, $0
	dbsprite  -3,   0, 0, 0, $03, $0
	dbsprite  -2,   0, 0, 0, $00, $0
	dbsprite  -1,   0, 0, 0, $01, $0
	dbsprite   0,  -1, 0, 0, $02, $0
	dbsprite   1,  -1, 0, 0, $03, $0
	dbsprite   2,  -1, 0, 0, $00, $0
	dbsprite   3,  -1, 0, 0, $03, $0
	dbsprite   4,  -1, 0, 0, $00, $0
	dbsprite   5,  -1, 0, 0, $03, $0
	dbsprite   6,  -1, 0, 0, $00, $0
	dbsprite   7,  -1, 0, 0, $03, $0
	dbsprite   8,  -1, 0, 0, $00, $0
	dbsprite   9,  -1, 0, 0, $01, $0
	dbsprite  10,  -2, 0, 0, $02, $0

.OAMData_2a:
	dbsprite  -1,  -3, 0, 4, $00, $0
	dbsprite   0,  -3, 0, 4, $00, OAM_XFLIP
	dbsprite  -1,  -2, 0, 4, $01, $0
	dbsprite   0,  -2, 0, 4, $01, OAM_XFLIP
	dbsprite  -1,  -1, 4, 4, $02, $0

.OAMData_2b:
	dbsprite  -1,  -4, 0, 4, $00, $0
	dbsprite   0,  -4, 0, 4, $00, OAM_XFLIP
	dbsprite  -1,  -3, 0, 4, $01, $0
	dbsprite   0,  -3, 0, 4, $01, OAM_XFLIP
	dbsprite  -1,  -2, 4, 4, $02, $0
	dbsprite  -1,  -1, 4, 4, $02, $0

.OAMData_2c:
	dbsprite  -1,  -5, 0, 4, $00, $0
	dbsprite   0,  -5, 0, 4, $00, OAM_XFLIP
	dbsprite  -1,  -4, 0, 4, $01, $0
	dbsprite   0,  -4, 0, 4, $01, OAM_XFLIP
	dbsprite  -1,  -3, 4, 4, $02, $0
	dbsprite  -1,  -2, 4, 4, $02, $0
	dbsprite  -1,  -1, 4, 4, $02, $0

.OAMData_2d:
	dbsprite  -1,  -6, 0, 4, $00, $0
	dbsprite   0,  -6, 0, 4, $00, OAM_XFLIP
	dbsprite  -1,  -5, 0, 4, $01, $0
	dbsprite   0,  -5, 0, 4, $01, OAM_XFLIP
	dbsprite  -1,  -4, 4, 4, $02, $0
	dbsprite  -1,  -3, 4, 4, $02, $0
	dbsprite  -1,  -2, 4, 4, $02, $0
	dbsprite  -1,  -1, 4, 4, $02, $0

.OAMData_2e:
	dbsprite  -1,  -7, 0, 4, $00, $0
	dbsprite   0,  -7, 0, 4, $00, OAM_XFLIP
	dbsprite  -1,  -6, 0, 4, $01, $0
	dbsprite   0,  -6, 0, 4, $01, OAM_XFLIP
	dbsprite  -1,  -5, 4, 4, $02, $0
	dbsprite  -1,  -4, 4, 4, $02, $0
	dbsprite  -1,  -3, 4, 4, $02, $0
	dbsprite  -1,  -2, 4, 4, $02, $0
	dbsprite  -1,  -1, 4, 4, $02, $0

.OAMData_2f:
	dbsprite  -1,  -1, 0, 0, $00, $0
	dbsprite   0,  -1, 0, 0, $00, OAM_XFLIP
	dbsprite  -1,   0, 0, 0, $01, $0
	dbsprite   0,   0, 0, 0, $00, OAM_XFLIP | OAM_YFLIP

.OAMData_30:
	dbsprite  -1,  -1, 0, 0, $00, $0
	dbsprite   0,  -1, 0, 0, $01, $0
	dbsprite  -1,   0, 0, 0, $01, OAM_XFLIP | OAM_YFLIP
	dbsprite   0,   0, 0, 0, $00, OAM_XFLIP | OAM_YFLIP

.OAMData_31:
	dbsprite  -1,  -2, 0, 4, $00, $0
	dbsprite   0,  -2, 0, 4, $01, $0
	dbsprite  -1,  -1, 0, 4, $02, $0
	dbsprite   0,  -1, 0, 4, $03, $0
	dbsprite  -1,   0, 0, 4, $04, $0
	dbsprite   0,   0, 0, 4, $05, $0

.OAMData_76:
	dbsprite  -1,  -1, 0, 5, $00, $0
	dbsprite   0,  -1, 0, 1, $00, $0

.OAMData_32:
	dbsprite  -2,  -1, 4, 0, $00, $0
	dbsprite   0,  -1, 4, 0, $00, $0
	dbsprite  -2,  -3, 4, 0, $00, $0
	dbsprite   0,  -3, 4, 0, $00, $0
	dbsprite  -3,  -2, 4, 0, $00, $0
	dbsprite  -2,  -2, 4, 0, $01, $0
	dbsprite  -1,  -2, 4, 0, $00, $0
	dbsprite   0,  -2, 4, 0, $01, $0
	dbsprite   1,  -2, 4, 0, $00, $0
	dbsprite  -4,  -1, 4, 0, $00, $0
	dbsprite  -3,  -1, 4, 0, $01, $0
	dbsprite  -1,  -1, 4, 0, $01, $0
	dbsprite   1,  -1, 4, 0, $01, $0
	dbsprite   2,  -1, 4, 0, $00, $0

.OAMData_33:
	dbsprite  -2,  -2, 4, 0, $00, $0
	dbsprite   0,  -2, 4, 0, $00, $0
	dbsprite  -3,  -1, 4, 0, $00, $0
	dbsprite  -2,  -1, 4, 0, $01, $0
	dbsprite  -1,  -1, 4, 0, $00, $0
	dbsprite   0,  -1, 4, 0, $01, $0
	dbsprite   1,  -1, 4, 0, $00, $0
	dbsprite  -2,  -4, 4, 0, $00, $0
	dbsprite   0,  -4, 4, 0, $00, $0
	dbsprite  -3,  -3, 4, 0, $00, $0
	dbsprite  -2,  -3, 4, 0, $01, $0
	dbsprite  -1,  -3, 4, 0, $00, $0
	dbsprite   0,  -3, 4, 0, $01, $0
	dbsprite   1,  -3, 4, 0, $00, $0
	dbsprite  -4,  -2, 4, 0, $00, $0
	dbsprite  -3,  -2, 4, 0, $01, $0
	dbsprite  -1,  -2, 4, 0, $01, $0
	dbsprite   1,  -2, 4, 0, $01, $0
	dbsprite   2,  -2, 4, 0, $00, $0
	dbsprite  -4,  -1, 4, 0, $01, $0
	dbsprite   2,  -1, 4, 0, $01, $0

.OAMData_36:
	dbsprite  -1,  -7, 0, 4, $00, $0
	dbsprite   0,  -7, 0, 4, $01, $0
	dbsprite  -1,  -6, 0, 4, $02, $0
	dbsprite   0,  -6, 0, 4, $03, $0
	dbsprite  -1,  -5, 0, 4, $04, $0
	dbsprite   0,  -5, 0, 4, $05, $0
	dbsprite  -1,  -4, 0, 4, $06, $0
	dbsprite   0,  -4, 0, 4, $07, $0
	dbsprite  -1,  -3, 0, 4, $08, $0
	dbsprite   0,  -3, 0, 4, $09, $0
	dbsprite  -1,  -2, 0, 4, $0a, $0
	dbsprite   0,  -2, 0, 4, $0b, $0
	dbsprite  -1,  -1, 0, 4, $0c, $0
	dbsprite   0,  -1, 0, 4, $0d, $0

.OAMData_3a:
	dbsprite  -1,  -7, 0, 4, $0c, $0
	dbsprite   0,  -7, 0, 4, $0d, $0
	dbsprite  -1,  -6, 0, 4, $08, $0
	dbsprite   0,  -6, 0, 4, $09, $0
	dbsprite  -1,  -5, 0, 4, $04, $0
	dbsprite   0,  -5, 0, 4, $05, $0
	dbsprite  -1,  -4, 0, 4, $00, $0
	dbsprite   0,  -4, 0, 4, $01, $0
	dbsprite  -1,  -3, 0, 4, $02, $0
	dbsprite   0,  -3, 0, 4, $03, $0
	dbsprite   0,  -2, 0, 4, $02, $0
	dbsprite   1,  -2, 0, 4, $03, $0
	dbsprite   0,  -1, 0, 4, $0a, $0
	dbsprite   1,  -1, 0, 4, $0b, $0

.OAMData_3e:
	dbsprite  -2,   1, 0, 4, $00, OAM_YFLIP
	dbsprite  -1,   1, 0, 4, $02, OAM_YFLIP
	dbsprite   0,   1, 0, 4, $02, OAM_XFLIP | OAM_YFLIP
	dbsprite   1,   1, 0, 4, $00, OAM_XFLIP | OAM_YFLIP
	dbsprite  -3,  -1, 0, 4, $09, OAM_XFLIP
	dbsprite  -2,  -1, 0, 4, $08, OAM_XFLIP
	dbsprite  -1,  -1, 0, 4, $06, $0
	dbsprite   0,  -1, 0, 4, $07, $0
	dbsprite   1,  -1, 0, 4, $08, $0
	dbsprite   2,  -1, 0, 4, $09, $0
	dbsprite  -3,   0, 0, 4, $01, OAM_XFLIP
	dbsprite  -2,   0, 0, 4, $00, OAM_XFLIP
	dbsprite  -1,   0, 0, 4, $0c, $0
	dbsprite   0,   0, 0, 4, $0d, $0
	dbsprite   1,   0, 0, 4, $00, $0
	dbsprite   2,   0, 0, 4, $01, $0
	dbsprite  -2,  -3, 0, 4, $00, $0
	dbsprite  -1,  -3, 0, 4, $02, $0
	dbsprite   0,  -3, 0, 4, $02, OAM_XFLIP
	dbsprite   1,  -3, 0, 4, $00, OAM_XFLIP
	dbsprite  -3,  -2, 0, 4, $03, OAM_XFLIP
	dbsprite  -2,  -2, 0, 4, $02, OAM_XFLIP
	dbsprite  -1,  -2, 0, 4, $04, $0
	dbsprite   0,  -2, 0, 4, $05, $0
	dbsprite   1,  -2, 0, 4, $02, $0
	dbsprite   2,  -2, 0, 4, $03, $0

.OAMData_41:
	dbsprite  -2,  -3, 0, 4, $00, $0
	dbsprite  -1,  -3, 0, 4, $02, $0
	dbsprite   0,  -3, 0, 4, $02, OAM_XFLIP
	dbsprite   1,  -3, 0, 4, $00, OAM_XFLIP
	dbsprite  -3,  -2, 4, 4, $00, $0
	dbsprite  -2,  -2, 4, 4, $01, $0
	dbsprite  -1,  -2, 0, 4, $05, OAM_XFLIP
	dbsprite   0,  -2, 0, 4, $04, OAM_XFLIP
	dbsprite   0,  -2, 4, 4, $01, OAM_XFLIP
	dbsprite   1,  -2, 4, 4, $00, OAM_XFLIP
	dbsprite  -3,  -1, 4, 4, $02, $0
	dbsprite  -2,  -1, 4, 4, $03, $0
	dbsprite  -1,  -1, 0, 4, $07, OAM_XFLIP
	dbsprite   0,  -1, 0, 4, $06, OAM_XFLIP
	dbsprite   0,  -1, 4, 4, $03, OAM_XFLIP
	dbsprite   1,  -1, 4, 4, $02, OAM_XFLIP
	dbsprite  -3,   0, 4, 4, $04, $0
	dbsprite  -2,   0, 4, 4, $05, $0
	dbsprite  -1,   0, 0, 4, $0d, OAM_XFLIP
	dbsprite   0,   0, 0, 4, $0c, OAM_XFLIP
	dbsprite   0,   0, 4, 4, $05, OAM_XFLIP
	dbsprite   1,   0, 4, 4, $04, OAM_XFLIP
	dbsprite  -2,   1, 0, 4, $00, OAM_YFLIP
	dbsprite  -1,   1, 0, 4, $02, OAM_YFLIP
	dbsprite   0,   1, 0, 4, $02, OAM_XFLIP | OAM_YFLIP
	dbsprite   1,   1, 0, 4, $00, OAM_XFLIP | OAM_YFLIP

.OAMData_42:
	dbsprite  -1,  -3, 4, 0, $02, $0
	dbsprite  -1,   2, 4, 0, $02, OAM_XFLIP | OAM_YFLIP
	dbsprite  -3,  -1, 0, 4, $01, $0
	dbsprite   2,  -1, 0, 4, $01, OAM_XFLIP | OAM_YFLIP
	dbsprite  -1,  -4, 4, 0, $02, $0
	dbsprite  -1,   3, 4, 0, $02, OAM_XFLIP | OAM_YFLIP
	dbsprite  -4,  -1, 0, 4, $01, $0
	dbsprite   3,  -1, 0, 4, $01, OAM_XFLIP | OAM_YFLIP

.OAMData_44:
	dbsprite  -3,  -3, 5, 5, $00, OAM_XFLIP
	dbsprite   1,  -3, 3, 5, $00, $0
	dbsprite  -3,   1, 5, 3, $00, OAM_XFLIP | OAM_YFLIP
	dbsprite   1,   1, 3, 3, $00, OAM_YFLIP
	dbsprite  -4,  -4, 5, 5, $00, OAM_XFLIP
	dbsprite   2,  -4, 3, 5, $00, $0
	dbsprite  -4,   2, 5, 3, $00, OAM_XFLIP | OAM_YFLIP
	dbsprite   2,   2, 3, 3, $00, OAM_YFLIP

.OAMData_46:
	dbsprite  -1,  -3, 4, 4, $02, $0
	dbsprite  -1,   1, 4, 4, $02, OAM_XFLIP | OAM_YFLIP
	dbsprite  -3,  -1, 4, 4, $01, $0
	dbsprite   1,  -1, 4, 4, $01, OAM_XFLIP | OAM_YFLIP

.OAMData_47:
	dbsprite  -2,  -2, 0, 0, $00, OAM_XFLIP
	dbsprite   1,  -2, 0, 0, $00, $0
	dbsprite  -2,   1, 0, 0, $00, OAM_XFLIP | OAM_YFLIP
	dbsprite   1,   1, 0, 0, $00, OAM_YFLIP

.OAMData_48:
	dbsprite  -1,  -3, 4, 0, $00, $0
	dbsprite  -1,  -2, 2, 0, $00, $0
	dbsprite  -1,  -1, 0, 0, $00, $0
	dbsprite  -1,   0, 0, 0, $00, $0
	dbsprite  -1,   1, 2, 0, $00, $0
	dbsprite  -1,   2, 4, 0, $00, $0

.OAMData_49:
	dbsprite  -2,  -1, 0, 4, $00, OAM_XFLIP
	dbsprite  -1,  -1, 0, 2, $00, OAM_XFLIP
	dbsprite   0,  -1, 0, 2, $00, $0
	dbsprite   1,  -1, 0, 4, $00, $0

.OAMData_4a:
	dbsprite  -1,  -1, 0, 4, $00, OAM_XFLIP | OAM_YFLIP
	dbsprite   0,  -1, 0, 4, $00, OAM_YFLIP

.OAMData_0f:
	dbsprite  -1,  -1, 4, 4, $00, $0
	dbsprite  -2,  -1, 4, 4, $01, $0
	dbsprite  -1,  -1, 4, 4, $01, OAM_XFLIP
	dbsprite  -2,   0, 4, 4, $01, OAM_YFLIP
	dbsprite  -1,   0, 4, 4, $01, OAM_XFLIP | OAM_YFLIP

.OAMData_4c:
	dbsprite  -1,  -1, 4, 4, $00, $0
	dbsprite  -2,   0, 6, 2, $00, $0
	dbsprite  -3,   0, 6, 2, $01, $0
	dbsprite  -2,   0, 6, 2, $01, OAM_XFLIP
	dbsprite  -3,   1, 6, 2, $01, OAM_YFLIP
	dbsprite  -2,   1, 6, 2, $01, OAM_XFLIP | OAM_YFLIP

.OAMData_4d:
	dbsprite  -1,  -1, 4, 4, $00, $0
	dbsprite  -2,   0, 6, 2, $00, $0
	dbsprite  -2,   1, 0, 0, $00, $0
	dbsprite  -3,   1, 0, 0, $01, $0
	dbsprite  -2,   1, 0, 0, $01, OAM_XFLIP
	dbsprite  -3,   2, 0, 0, $01, OAM_YFLIP
	dbsprite  -2,   2, 0, 0, $01, OAM_XFLIP | OAM_YFLIP

.OAMData_4f:
	dbsprite  -1,  -1, 4, 4, $00, $0
	dbsprite  -2,   0, 6, 2, $00, $0
	dbsprite  -2,   1, 0, 0, $00, $0
	dbsprite  -3,   1, 2, 6, $00, $0
	dbsprite  -4,   1, 2, 6, $01, $0
	dbsprite  -3,   1, 2, 6, $01, OAM_XFLIP
	dbsprite  -4,   2, 2, 6, $01, OAM_YFLIP
	dbsprite  -3,   2, 2, 6, $01, OAM_XFLIP | OAM_YFLIP

.OAMData_50:
	dbsprite  -1,  -1, 4, 4, $00, $0
	dbsprite  -2,   0, 6, 2, $00, $0
	dbsprite  -2,   1, 0, 0, $00, $0
	dbsprite  -3,   1, 2, 6, $00, $0
	dbsprite  -4,   2, 4, 4, $00, $0
	dbsprite  -5,   2, 4, 4, $01, $0
	dbsprite  -4,   2, 4, 4, $01, OAM_XFLIP
	dbsprite  -5,   3, 4, 4, $01, OAM_YFLIP
	dbsprite  -4,   3, 4, 4, $01, OAM_XFLIP | OAM_YFLIP

.OAMData_51:
	dbsprite  -1,  -1, 4, 4, $00, $0
	dbsprite  -2,   0, 6, 2, $00, $0
	dbsprite  -2,   1, 0, 0, $00, $0
	dbsprite  -3,   1, 2, 6, $00, $0
	dbsprite  -4,   2, 4, 4, $00, $0
	dbsprite  -5,   3, 6, 2, $00, $0
	dbsprite  -6,   3, 6, 2, $01, $0
	dbsprite  -5,   3, 6, 2, $01, OAM_XFLIP
	dbsprite  -6,   4, 6, 2, $01, OAM_YFLIP
	dbsprite  -5,   4, 6, 2, $01, OAM_XFLIP | OAM_YFLIP

.OAMData_59:
	dbsprite  -2,  -1, 0, 4, $00, $0
	dbsprite  -1,  -1, 0, 4, $01, $0
	dbsprite   0,  -1, 0, 4, $01, OAM_XFLIP
	dbsprite   1,  -1, 0, 4, $00, OAM_XFLIP

.OAMData_5a:
	dbsprite  -2,  -1, 0, 4, $02, $0
	dbsprite  -1,  -1, 0, 4, $01, $0
	dbsprite   0,  -1, 0, 4, $01, OAM_XFLIP
	dbsprite   1,  -1, 0, 4, $02, OAM_XFLIP

.OAMData_60:
	dbsprite  -1,  -1, 4, 0, $00, $0

.OAMData_69:
	dbsprite  -1,   0, 4, 0, $00, $0

.OAMData_61:
	dbsprite  -4,  -1, 4, 4, $00, $0
	dbsprite  -3,  -1, 4, 4, $01, $0
	dbsprite  -2,  -1, 4, 4, $02, $0
	dbsprite  -1,  -1, 4, 4, $03, $0
	dbsprite   0,  -1, 4, 4, $04, $0
	dbsprite   1,  -1, 4, 4, $05, $0
	dbsprite   2,  -1, 4, 4, $06, $0
	dbsprite   1,  -2, 4, 4, $07, $0
	dbsprite   2,  -2, 4, 4, $08, $0

.OAMData_65:
	dbsprite  -4,  -2, 4, 4, $08, OAM_XFLIP
	dbsprite  -3,  -2, 4, 4, $07, OAM_XFLIP
	dbsprite  -4,  -1, 4, 4, $06, OAM_XFLIP
	dbsprite  -3,  -1, 4, 4, $05, OAM_XFLIP
	dbsprite  -2,  -1, 4, 4, $04, OAM_XFLIP
	dbsprite  -1,  -1, 4, 4, $03, OAM_XFLIP
	dbsprite   0,  -1, 4, 4, $02, OAM_XFLIP
	dbsprite   1,  -1, 4, 4, $01, OAM_XFLIP
	dbsprite   2,  -1, 4, 4, $00, OAM_XFLIP

.OAMData_d4:
	dbsprite  -4,   0, 4, 0, $00, OAM_PAL1
	dbsprite  -3,   0, 4, 0, $01, OAM_PAL1
	dbsprite  -2,   0, 4, 0, $02, OAM_PAL1
	dbsprite  -1,   0, 4, 0, $03, OAM_PAL1
	dbsprite   0,   0, 4, 0, $04, OAM_PAL1
	dbsprite   1,   0, 4, 0, $05, OAM_PAL1
	dbsprite   2,   0, 4, 0, $06, OAM_PAL1

.OAMData_d6:
	dbsprite  -4,  -1, 4, 0, $00, OAM_PAL1
	dbsprite  -4,   0, 4, 0, $01, OAM_PAL1
	dbsprite  -3,  -1, 4, 0, $02, OAM_PAL1
	dbsprite  -3,   0, 4, 0, $03, OAM_PAL1
	dbsprite  -2,  -1, 4, 0, $04, OAM_PAL1
	dbsprite  -2,   0, 4, 0, $05, OAM_PAL1
	dbsprite  -1,  -1, 4, 0, $06, OAM_PAL1
	dbsprite  -1,   0, 4, 0, $07, OAM_PAL1
	dbsprite   0,  -1, 4, 0, $08, OAM_PAL1
	dbsprite   0,   0, 4, 0, $09, OAM_PAL1
	dbsprite   1,  -1, 4, 0, $0a, OAM_PAL1
	dbsprite   1,   0, 4, 0, $0b, OAM_PAL1
	dbsprite   2,  -1, 4, 0, $0c, OAM_PAL1
	dbsprite   2,   0, 4, 0, $0d, OAM_PAL1

.OAMData_d5:
	dbsprite  -3,   0, 0, 0, $00, $1 | OAM_PAL1
	dbsprite  -2,   0, 0, 0, $01, $1 | OAM_PAL1
	dbsprite  -1,   0, 0, 0, $02, $1 | OAM_PAL1
	dbsprite   0,   0, 0, 0, $03, $1 | OAM_PAL1
	dbsprite   1,   0, 0, 0, $04, $1 | OAM_PAL1
	dbsprite   2,   0, 0, 0, $05, $1 | OAM_PAL1

.OAMData_d7:
	dbsprite  -3,   0, 0, 0, $00, $1 | OAM_PAL1
	dbsprite  -3,   1, 0, 0, $01, $1 | OAM_PAL1
	dbsprite  -2,   0, 0, 0, $02, $1 | OAM_PAL1
	dbsprite  -2,   1, 0, 0, $03, $1 | OAM_PAL1
	dbsprite  -1,   0, 0, 0, $04, $1 | OAM_PAL1
	dbsprite  -1,   1, 0, 0, $05, $1 | OAM_PAL1
	dbsprite   0,   0, 0, 0, $06, $1 | OAM_PAL1
	dbsprite   0,   1, 0, 0, $07, $1 | OAM_PAL1
	dbsprite   1,   0, 0, 0, $08, $1 | OAM_PAL1
	dbsprite   1,   1, 0, 0, $09, $1 | OAM_PAL1
	dbsprite   2,   0, 0, 0, $0a, $1 | OAM_PAL1
	dbsprite   2,   1, 0, 0, $0b, $1 | OAM_PAL1

.OAMData_6e:
	dbsprite   0,  -2, 4, 4, $00, $0
	dbsprite  -2,  -1, 4, 4, $01, $0
	dbsprite  -1,  -1, 4, 4, $02, $0
	dbsprite   0,  -1, 4, 4, $03, $0
	dbsprite  -2,   0, 4, 4, $04, $0

.OAMData_6f:
	dbsprite  -2,  -1, 4, 4, $00, $0
	dbsprite  -1,  -1, 4, 4, $01, $0
	dbsprite   0,  -1, 4, 4, $02, $0

.OAMData_77:
	dbsprite   1,  -4, 4, 4, $01, OAM_XFLIP | OAM_YFLIP

.OAMData_78:
	dbsprite   1,  -4, 4, 4, $00, $0
	dbsprite   0,  -4, 4, 4, $01, OAM_XFLIP | OAM_YFLIP
	dbsprite   1,  -3, 4, 4, $01, OAM_XFLIP | OAM_YFLIP

.OAMData_79:
	dbsprite   1,  -4, 4, 4, $01, $0
	dbsprite   0,  -4, 4, 4, $00, $0
	dbsprite  -1,  -4, 4, 4, $01, OAM_XFLIP | OAM_YFLIP
	dbsprite   1,  -3, 4, 4, $00, $0
	dbsprite   0,  -3, 4, 4, $01, OAM_XFLIP | OAM_YFLIP
	dbsprite   1,  -2, 4, 4, $01, OAM_XFLIP | OAM_YFLIP

.OAMData_7a:
	dbsprite  -2,  -4, 4, 4, $01, OAM_XFLIP | OAM_YFLIP
	dbsprite  -1,  -4, 4, 4, $00, $0
	dbsprite   0,  -4, 4, 4, $01, $0
	dbsprite  -1,  -3, 4, 4, $01, OAM_XFLIP | OAM_YFLIP
	dbsprite   0,  -3, 4, 4, $00, $0
	dbsprite   1,  -3, 4, 4, $01, $0
	dbsprite   0,  -2, 4, 4, $01, OAM_XFLIP | OAM_YFLIP
	dbsprite   1,  -2, 4, 4, $00, $0
	dbsprite   1,  -1, 4, 4, $01, OAM_XFLIP | OAM_YFLIP

.OAMData_7b:
	dbsprite  -3,  -4, 4, 4, $01, OAM_XFLIP | OAM_YFLIP
	dbsprite  -2,  -4, 4, 4, $00, $0
	dbsprite  -1,  -4, 4, 4, $01, $0
	dbsprite  -2,  -3, 4, 4, $01, OAM_XFLIP | OAM_YFLIP
	dbsprite  -1,  -3, 4, 4, $00, $0
	dbsprite   0,  -3, 4, 4, $01, $0
	dbsprite  -1,  -2, 4, 4, $01, OAM_XFLIP | OAM_YFLIP
	dbsprite   0,  -2, 4, 4, $00, $0
	dbsprite   1,  -2, 4, 4, $01, $0
	dbsprite   0,  -1, 4, 4, $01, OAM_XFLIP | OAM_YFLIP
	dbsprite   1,  -1, 4, 4, $00, $0
	dbsprite   1,   0, 4, 4, $01, OAM_XFLIP | OAM_YFLIP

.OAMData_7c:
	dbsprite  -3,  -4, 4, 4, $00, $0
	dbsprite  -2,  -4, 4, 4, $01, $0
	dbsprite  -3,  -3, 4, 4, $01, OAM_XFLIP | OAM_YFLIP
	dbsprite  -2,  -3, 4, 4, $00, $0
	dbsprite  -1,  -3, 4, 4, $01, $0
	dbsprite  -2,  -2, 4, 4, $01, OAM_XFLIP | OAM_YFLIP
	dbsprite  -1,  -2, 4, 4, $00, $0
	dbsprite   0,  -2, 4, 4, $01, $0
	dbsprite  -1,  -1, 4, 4, $01, OAM_XFLIP | OAM_YFLIP
	dbsprite   0,  -1, 4, 4, $00, $0
	dbsprite   1,  -1, 4, 4, $01, $0
	dbsprite   0,   0, 4, 4, $01, OAM_XFLIP | OAM_YFLIP
	dbsprite   1,   0, 4, 4, $00, $0
	dbsprite   1,   1, 4, 4, $01, OAM_XFLIP | OAM_YFLIP

.OAMData_7d:
	dbsprite  -3,  -4, 4, 4, $01, $0
	dbsprite  -3,  -3, 4, 4, $00, $0
	dbsprite  -2,  -3, 4, 4, $01, $0
	dbsprite  -3,  -2, 4, 4, $01, OAM_XFLIP | OAM_YFLIP
	dbsprite  -2,  -2, 4, 4, $00, $0
	dbsprite  -1,  -2, 4, 4, $01, $0
	dbsprite  -2,  -1, 4, 4, $01, OAM_XFLIP | OAM_YFLIP
	dbsprite  -1,  -1, 4, 4, $00, $0
	dbsprite   0,  -1, 4, 4, $01, $0
	dbsprite  -1,   0, 4, 4, $01, OAM_XFLIP | OAM_YFLIP
	dbsprite   0,   0, 4, 4, $00, $0
	dbsprite   1,   0, 4, 4, $01, $0
	dbsprite   0,   1, 4, 4, $01, OAM_XFLIP | OAM_YFLIP
	dbsprite   1,   1, 4, 4, $00, $0
	dbsprite   1,   2, 4, 4, $01, OAM_XFLIP | OAM_YFLIP

.OAMData_70:
	dbsprite  -1,  -2, 0, 0, $00, $0
	dbsprite  -1,  -1, 0, 0, $01, $0
	dbsprite   0,  -2, 0, 0, $00, OAM_XFLIP
	dbsprite   0,  -1, 0, 0, $01, OAM_XFLIP
	dbsprite  -1,   0, 0, 0, $01, OAM_YFLIP
	dbsprite  -1,   1, 0, 0, $00, OAM_YFLIP
	dbsprite   0,   0, 0, 0, $01, OAM_XFLIP | OAM_YFLIP
	dbsprite   0,   1, 0, 0, $00, OAM_XFLIP | OAM_YFLIP

.OAMData_81:
	dbsprite  -1,  -1, 0, 0, $00, $0
	dbsprite   0,  -1, 0, 0, $01, $0
	dbsprite  -1,   0, 0, 0, $01, OAM_XFLIP | OAM_YFLIP
	dbsprite   0,   0, 0, 0, $00, OAM_XFLIP | OAM_YFLIP

.OAMData_87:
	dbsprite  -1,  -2, 0, 4, $00, $0
	dbsprite   0,  -2, 0, 4, $01, $0
	dbsprite  -1,  -1, 0, 4, $02, $0
	dbsprite   0,  -1, 0, 4, $03, $0
	dbsprite  -1,  -1, 0, 4, $00, $0
	dbsprite   0,  -1, 0, 4, $01, $0
	dbsprite  -1,   0, 0, 4, $02, $0
	dbsprite   0,   0, 0, 4, $03, $0
	dbsprite  -1,  -3, 0, 4, $00, $0
	dbsprite   0,  -3, 0, 4, $01, $0
	dbsprite  -1,  -2, 0, 4, $02, $0
	dbsprite   0,  -2, 0, 4, $03, $0
	dbsprite  -1,   0, 0, 4, $00, $0
	dbsprite   0,   0, 0, 4, $01, $0
	dbsprite  -1,   1, 0, 4, $02, $0
	dbsprite   0,   1, 0, 4, $03, $0

.OAMData_88:
	dbsprite  -1,  -2, 0, 0, $00, $0
	dbsprite   0,  -2, 0, 0, $01, $0
	dbsprite  -1,  -1, 0, 0, $02, $0
	dbsprite   0,  -1, 0, 0, $03, $0
	dbsprite  -1,  -1, 0, 0, $00, $0
	dbsprite   0,  -1, 0, 0, $01, $0
	dbsprite  -1,   0, 0, 0, $02, $0
	dbsprite   0,   0, 0, 0, $03, $0
	dbsprite  -1,   0, 0, 0, $00, $0
	dbsprite   0,   0, 0, 0, $01, $0
	dbsprite  -1,   1, 0, 0, $02, $0
	dbsprite   0,   1, 0, 0, $03, $0

.OAMData_8a:
	dbsprite  -1,  -1, 4, 4, $00, $0
	dbsprite   0,  -1, 4, 0, $00, $0
	dbsprite   1,  -2, 4, 4, $00, $0
	dbsprite   2,  -2, 4, 0, $00, $0
	dbsprite   3,  -3, 4, 4, $00, $0
	dbsprite   4,  -3, 4, 0, $00, $0
	dbsprite   5,  -4, 4, 0, $00, $0
	dbsprite   6,  -5, 4, 4, $00, $0

.OAMData_8e:
	dbsprite  -1,  -3, 4, 4, $00, $0
	dbsprite  -1,  -2, 4, 4, $01, $0
	dbsprite  -1,  -1, 4, 4, $02, $0
	dbsprite  -1,   0, 4, 4, $01, OAM_YFLIP
	dbsprite  -1,   1, 4, 4, $00, OAM_YFLIP

.OAMData_8f:
	dbsprite  -2,  -1, 0, 4, $00, $0
	dbsprite  -1,  -1, 0, 4, $01, $0
	dbsprite   0,  -1, 0, 4, $02, $0
	dbsprite   1,  -1, 0, 4, $03, $0

.OAMData_93:
	dbsprite  -2,  -1, 4, 0, $00, $0
	dbsprite  -1,  -1, 4, 0, $01, $0
	dbsprite   0,  -1, 4, 0, $02, $0
	dbsprite  -2,   0, 4, 0, $03, $0
	dbsprite  -1,   0, 4, 0, $04, $0
	dbsprite   0,   0, 4, 0, $05, $0

.OAMData_99:
	dbsprite  -1,  -1, 0, 0, $00, $0
	dbsprite   0,  -1, 0, 0, $05, $0
	dbsprite  -1,   0, 0, 0, $01, $0
	dbsprite   0,   0, 0, 0, $05, $0

.OAMData_9b:
	dbsprite   1,  -4, 0, 4, $00, $0
	dbsprite   2,  -4, 0, 4, $01, $0
	dbsprite  -1,  -3, 0, 4, $02, $0
	dbsprite   0,  -3, 0, 4, $03, $0
	dbsprite   1,  -3, 0, 4, $04, $0
	dbsprite   2,  -3, 0, 4, $05, $0
	dbsprite   3,  -3, 0, 4, $06, $0
	dbsprite  -2,  -2, 0, 4, $07, $0
	dbsprite  -1,  -2, 0, 4, $08, $0
	dbsprite   0,  -2, 0, 4, $09, $0
	dbsprite   1,  -2, 0, 4, $0a, $0
	dbsprite   2,  -2, 0, 4, $0b, $0
	dbsprite   3,  -2, 0, 4, $0c, $0
	dbsprite   4,  -2, 0, 4, $0d, $0
	dbsprite  -3,  -1, 0, 4, $0e, $0
	dbsprite  -2,  -1, 0, 4, $0f, $0
	dbsprite  -1,  -1, 0, 4, $10, $0
	dbsprite   0,  -1, 0, 4, $11, $0
	dbsprite   1,  -1, 0, 4, $12, $0
	dbsprite   2,  -1, 0, 4, $13, $0
	dbsprite  -5,   0, 0, 4, $14, $0
	dbsprite  -4,   0, 0, 4, $15, $0
	dbsprite  -3,   0, 0, 4, $16, $0
	dbsprite  -2,   0, 0, 4, $17, $0
	dbsprite  -1,   0, 0, 4, $18, $0
	dbsprite   0,   0, 0, 4, $19, $0
	dbsprite   1,   0, 0, 4, $1a, $0
	dbsprite   2,   0, 0, 4, $1b, $0
	dbsprite   3,   0, 0, 4, $1c, $0
	dbsprite  -5,   1, 0, 4, $1d, $0
	dbsprite  -4,   1, 0, 4, $1e, $0
	dbsprite  -2,   1, 0, 4, $1f, $0
	dbsprite  -1,   1, 0, 4, $20, $0
	dbsprite   0,   1, 0, 4, $21, $0
	dbsprite   1,   1, 0, 4, $22, $0
	dbsprite   0,   2, 0, 4, $23, $0

.OAMData_9c:
	dbsprite  -1,   0, 0, 4, $02, $0
	dbsprite   0,   0, 0, 4, $03, $0
	dbsprite  -1,  -1, 0, 4, $01, $0
	dbsprite   0,  -1, 0, 4, $01, OAM_XFLIP
	dbsprite  -1,  -2, 0, 4, $00, $0
	dbsprite   0,  -2, 0, 4, $00, OAM_XFLIP

.OAMData_9f:
	dbsprite  -2,  -1, 0, 0, $00, $0
	dbsprite  -1,  -1, 0, 0, $01, $0
	dbsprite   0,  -1, 0, 0, $02, $0
	dbsprite   1,  -1, 0, 0, $03, $0
	dbsprite  -2,   0, 0, 0, $04, $0
	dbsprite  -1,   0, 0, 0, $05, $0
	dbsprite   0,   0, 0, 0, $06, $0
	dbsprite   1,   0, 0, 0, $07, $0

.OAMData_a0:
	dbsprite  -1,  -2, 4, 4, $00, $0
	dbsprite  -1,  -1, 4, 4, $00, $0
	dbsprite  -1,   0, 4, 4, $00, $0
	dbsprite  -1,  -3, 4, 4, $00, $0
	dbsprite  -1,   1, 4, 4, $00, $0
	dbsprite  -1,  -4, 4, 4, $00, $0
	dbsprite  -1,   2, 4, 4, $00, $0

.OAMData_a4:
	dbsprite  -2,  -2, 4, 4, $00, $0
	dbsprite  -1,  -2, 4, 4, $01, $0
	dbsprite   0,  -2, 4, 4, $02, $0
	dbsprite  -2,  -1, 4, 4, $03, $0
	dbsprite  -1,  -1, 4, 4, $04, $0
	dbsprite   0,  -1, 4, 4, $05, $0
	dbsprite  -2,   0, 4, 4, $00, OAM_YFLIP
	dbsprite  -1,   0, 4, 4, $01, OAM_YFLIP
	dbsprite   0,   0, 4, 4, $02, OAM_YFLIP

.OAMData_ac:
	dbsprite  -2,  -1, 0, 4, $00, $0
	dbsprite  -1,  -1, 0, 4, $01, $0
	dbsprite   0,  -1, 0, 4, $01, OAM_XFLIP
	dbsprite   1,  -1, 0, 4, $00, OAM_XFLIP

.OAMData_bc:
	dbsprite  -3,  -1, 0, 4, $00, $0
	dbsprite  -2,  -1, 0, 4, $01, $0
	dbsprite  -1,  -1, 0, 4, $02, $0
	dbsprite   0,  -1, 0, 4, $02, OAM_XFLIP
	dbsprite   1,  -1, 0, 4, $01, OAM_XFLIP
	dbsprite   2,  -1, 0, 4, $00, OAM_XFLIP

.OAMData_c1:
	dbsprite  -2,  -2, 0, 0, $00, $0
	dbsprite  -1,  -2, 0, 0, $01, $0
	dbsprite   0,  -2, 0, 0, $02, $0
	dbsprite   1,  -2, 0, 0, $00, OAM_XFLIP
	dbsprite  -2,  -1, 0, 0, $03, $0
	dbsprite  -1,  -1, 0, 0, $04, $0
	dbsprite   0,  -1, 0, 0, $04, OAM_XFLIP
	dbsprite   1,  -1, 0, 0, $05, $0
	dbsprite  -2,   0, 0, 0, $05, OAM_XFLIP | OAM_YFLIP
	dbsprite  -1,   0, 0, 0, $04, OAM_YFLIP
	dbsprite   0,   0, 0, 0, $04, OAM_XFLIP | OAM_YFLIP
	dbsprite   1,   0, 0, 0, $03, OAM_XFLIP | OAM_YFLIP
	dbsprite  -2,   1, 0, 0, $00, OAM_YFLIP
	dbsprite  -1,   1, 0, 0, $02, OAM_XFLIP | OAM_YFLIP
	dbsprite   0,   1, 0, 0, $01, OAM_XFLIP | OAM_YFLIP
	dbsprite   1,   1, 0, 0, $00, OAM_XFLIP | OAM_YFLIP

.OAMData_c2:
	dbsprite  -2,  -1, 0, 0, $00, $0
	dbsprite  -1,  -1, 0, 0, $01, $0
	dbsprite   0,  -1, 0, 0, $00, OAM_XFLIP | OAM_YFLIP
	dbsprite  -1,   0, 0, 0, $00, $0
	dbsprite   0,   0, 0, 0, $01, $0
	dbsprite   1,   0, 0, 0, $00, OAM_XFLIP | OAM_YFLIP

.OAMData_c8:
	dbsprite   1,  -1, 4, 0, $00, $0
	dbsprite   2,  -1, 4, 0, $01, $0
	dbsprite  -1,   0, 4, 0, $02, $0
	dbsprite   0,   0, 4, 0, $03, $0
	dbsprite   1,   0, 4, 0, $04, $0
	dbsprite   2,   0, 4, 0, $05, $0

.OAMData_ca:
	dbsprite  -1,  -1, 0, 0, $00, $0
	dbsprite   0,  -1, 0, 0, $01, OAM_XFLIP | OAM_YFLIP
	dbsprite  -1,   0, 0, 0, $01, $0
	dbsprite   0,   0, 0, 0, $01, OAM_XFLIP

.OAMData_cc:
	dbsprite -13,  -2, 4, 0, $00, $0
	dbsprite -11,  -4, 4, 0, $00, $0
	dbsprite  -9,  -1, 4, 0, $00, $0
	dbsprite  -7,  -5, 4, 0, $00, $0
	dbsprite  -5,  -3, 4, 0, $00, $0
	dbsprite  -3,  -5, 4, 0, $00, $0
	dbsprite  -1,  -3, 4, 0, $00, $0
	dbsprite   0,  -3, 4, 0, $00, $0
	dbsprite   2,  -5, 4, 0, $00, $0
	dbsprite   4,   0, 4, 0, $00, $0
	dbsprite   6,  -2, 4, 0, $00, $0
	dbsprite   8,  -4, 4, 0, $00, $0
	dbsprite  10,  -2, 4, 0, $00, $0
