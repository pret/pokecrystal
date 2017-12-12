SpriteAnimOAMData: ; 8d94d
; entries correspond to SPRITE_ANIM_FRAME_IDX_* constants
	; vtile offset, pointer
	dbw $00, .OAMData_RedWalk ; SPRITE_ANIM_FRAME_IDX_RED_WALK_1
	dbw $04, .OAMData_RedWalk ; SPRITE_ANIM_FRAME_IDX_RED_WALK_2
	dbw $4c, .OAMData_02 ; SPRITE_ANIM_FRAME_IDX_02
	dbw $5c, .OAMData_02 ; SPRITE_ANIM_FRAME_IDX_03
	dbw $6c, .OAMData_04 ; SPRITE_ANIM_FRAME_IDX_04
	dbw $6e, .OAMData_04 ; SPRITE_ANIM_FRAME_IDX_05
	dbw $2d, .OAMData_06 ; SPRITE_ANIM_FRAME_IDX_06
	dbw $4d, .OAMData_06 ; SPRITE_ANIM_FRAME_IDX_07
	dbw $60, .OAMData_08 ; SPRITE_ANIM_FRAME_IDX_08
	dbw $00, .OAMData_08 ; SPRITE_ANIM_FRAME_IDX_09
	dbw $00, .OAMData_08 ; SPRITE_ANIM_FRAME_IDX_0A
	dbw $06, .OAMData_08 ; SPRITE_ANIM_FRAME_IDX_0B
	dbw $0c, .OAMData_0c ; SPRITE_ANIM_FRAME_IDX_0C
	dbw $0d, .OAMData_02 ; SPRITE_ANIM_FRAME_IDX_0D
	dbw $00, .OAMData_0e ; SPRITE_ANIM_FRAME_IDX_0E
	dbw $04, .OAMData_0e ; SPRITE_ANIM_FRAME_IDX_0F
	dbw $08, .OAMData_0e ; SPRITE_ANIM_FRAME_IDX_10
	dbw $40, .OAMData_0e ; SPRITE_ANIM_FRAME_IDX_11
	dbw $44, .OAMData_0e ; SPRITE_ANIM_FRAME_IDX_12
	dbw $48, .OAMData_0e ; SPRITE_ANIM_FRAME_IDX_13
	dbw $4c, .OAMData_0e ; SPRITE_ANIM_FRAME_IDX_14
	dbw $80, .OAMData_15 ; SPRITE_ANIM_FRAME_IDX_15
	dbw $85, .OAMData_15 ; SPRITE_ANIM_FRAME_IDX_16
	dbw $8a, .OAMData_15 ; SPRITE_ANIM_FRAME_IDX_17
	dbw $00, .OAMData_18 ; SPRITE_ANIM_FRAME_IDX_18
	dbw $01, .OAMData_19 ; SPRITE_ANIM_FRAME_IDX_19
	dbw $09, .OAMData_1a ; SPRITE_ANIM_FRAME_IDX_1A
	dbw $10, .OAMData_1b ; SPRITE_ANIM_FRAME_IDX_1B
	dbw $29, .OAMData_1b ; SPRITE_ANIM_FRAME_IDX_1C
	dbw $42, .OAMData_1b ; SPRITE_ANIM_FRAME_IDX_1D
	dbw $f8, .OAMData_GSTitleTrail ; SPRITE_ANIM_FRAME_IDX_GS_TITLE_TRAIL_1
	dbw $fa, .OAMData_GSTitleTrail ; SPRITE_ANIM_FRAME_IDX_GS_TITLE_TRAIL_2
	dbw $00, .OAMData_20 ; SPRITE_ANIM_FRAME_IDX_20
	dbw $00, .OAMData_ForFrameset09 ; SPRITE_ANIM_FRAME_IDX_FOR_FRAMESET_09
	dbw $00, .OAMData_22 ; SPRITE_ANIM_FRAME_IDX_22
	dbw $0f, .OAMData_23 ; SPRITE_ANIM_FRAME_IDX_23
	dbw $11, .OAMData_02 ; SPRITE_ANIM_FRAME_IDX_24
	dbw $12, .OAMData_02 ; SPRITE_ANIM_FRAME_IDX_25
	dbw $13, .OAMData_02 ; SPRITE_ANIM_FRAME_IDX_26
	dbw $00, .OAMData_27 ; SPRITE_ANIM_FRAME_IDX_27
	dbw $08, .OAMData_27 ; SPRITE_ANIM_FRAME_IDX_28
	dbw $10, .OAMData_29 ; SPRITE_ANIM_FRAME_IDX_29
	dbw $10, .OAMData_2a ; SPRITE_ANIM_FRAME_IDX_2A
	dbw $10, .OAMData_2b ; SPRITE_ANIM_FRAME_IDX_2B
	dbw $10, .OAMData_2c ; SPRITE_ANIM_FRAME_IDX_2C
	dbw $10, .OAMData_2d ; SPRITE_ANIM_FRAME_IDX_2D
	dbw $3a, .OAMData_02 ; SPRITE_ANIM_FRAME_IDX_2E
	dbw $00, .OAMData_RedWalk ; SPRITE_ANIM_FRAME_IDX_STILL_CURSOR
	dbw $00, .OAMData_30 ; SPRITE_ANIM_FRAME_IDX_30
	dbw $02, .OAMData_31 ; SPRITE_ANIM_FRAME_IDX_31
	dbw $06, .OAMData_19 ; SPRITE_ANIM_FRAME_IDX_32
	dbw $0a, .OAMData_19 ; SPRITE_ANIM_FRAME_IDX_33
	dbw $0e, .OAMData_19 ; SPRITE_ANIM_FRAME_IDX_34
	dbw $12, .OAMData_35 ; SPRITE_ANIM_FRAME_IDX_35
	dbw $13, .OAMData_35 ; SPRITE_ANIM_FRAME_IDX_36
	dbw $00, .OAMData_RedWalk ; SPRITE_ANIM_FRAME_IDX_TRADEMON_ICON_1
	dbw $04, .OAMData_RedWalk ; SPRITE_ANIM_FRAME_IDX_TRADEMON_ICON_2
	dbw $10, .OAMData_19 ; SPRITE_ANIM_FRAME_IDX_39
	dbw $00, .OAMData_31 ; SPRITE_ANIM_FRAME_IDX_3A
	dbw $04, .OAMData_02 ; SPRITE_ANIM_FRAME_IDX_3B
	dbw $00, .OAMData_RadioTuningKnob ; SPRITE_ANIM_FRAME_IDX_RADIO_TUNING_KNOB
	dbw $00, .OAMData_PartyMonWithMail1 ; SPRITE_ANIM_FRAME_IDX_PARTY_MON_WITH_MAIL_1
	dbw $00, .OAMData_PartyMonWithMail2 ; SPRITE_ANIM_FRAME_IDX_PARTY_MON_WITH_MAIL_2
	dbw $00, .OAMData_PartyMonWithItem1 ; SPRITE_ANIM_FRAME_IDX_PARTY_MON_WITH_ITEM_1
	dbw $00, .OAMData_PartyMonWithItem2 ; SPRITE_ANIM_FRAME_IDX_PARTY_MON_WITH_ITEM_2
	dbw $00, .OAMData_31 ; SPRITE_ANIM_FRAME_IDX_41
	dbw $04, .OAMData_31 ; SPRITE_ANIM_FRAME_IDX_42
	dbw $00, .OAMData_43 ; SPRITE_ANIM_FRAME_IDX_43
	dbw $30, .OAMData_43 ; SPRITE_ANIM_FRAME_IDX_44
	dbw $03, .OAMData_43 ; SPRITE_ANIM_FRAME_IDX_45
	dbw $33, .OAMData_43 ; SPRITE_ANIM_FRAME_IDX_46
	dbw $06, .OAMData_43 ; SPRITE_ANIM_FRAME_IDX_47
	dbw $36, .OAMData_43 ; SPRITE_ANIM_FRAME_IDX_48
	dbw $09, .OAMData_43 ; SPRITE_ANIM_FRAME_IDX_49
	dbw $39, .OAMData_43 ; SPRITE_ANIM_FRAME_IDX_4A
	dbw $0c, .OAMData_4b ; SPRITE_ANIM_FRAME_IDX_4B
	dbw $0c, .OAMData_4c ; SPRITE_ANIM_FRAME_IDX_4C
	dbw $3c, .OAMData_02 ; SPRITE_ANIM_FRAME_IDX_4D
	dbw $3e, .OAMData_02 ; SPRITE_ANIM_FRAME_IDX_4E
	dbw $00, .OAMData_Leaf ; SPRITE_ANIM_FRAME_IDX_LEAF
	dbw $00, .OAMData_Tree ; SPRITE_ANIM_FRAME_IDX_TREE_1
	dbw $00, .OAMData_CutTree2 ; SPRITE_ANIM_FRAME_IDX_CUT_TREE_2
	dbw $00, .OAMData_CutTree3 ; SPRITE_ANIM_FRAME_IDX_CUT_TREE_3
	dbw $00, .OAMData_CutTree4 ; SPRITE_ANIM_FRAME_IDX_CUT_TREE_4
	dbw $00, .OAMData_02 ; SPRITE_ANIM_FRAME_IDX_EGG_CRACK
	dbw $01, .OAMData_02 ; SPRITE_ANIM_FRAME_IDX_55
	dbw $00, .OAMData_56 ; SPRITE_ANIM_FRAME_IDX_56
	dbw $00, .OAMData_57 ; SPRITE_ANIM_FRAME_IDX_57
	dbw $00, .OAMData_58 ; SPRITE_ANIM_FRAME_IDX_58
	dbw $00, .OAMData_59 ; SPRITE_ANIM_FRAME_IDX_59
	dbw $00, .OAMData_5a ; SPRITE_ANIM_FRAME_IDX_5A
	dbw $04, .OAMData_Tree ; SPRITE_ANIM_FRAME_IDX_HEADBUTT_TREE_2
	dbw $00, .OAMData_5c ; SPRITE_ANIM_FRAME_IDX_5C
	dbw $00, .OAMData_5d ; SPRITE_ANIM_FRAME_IDX_5D
	dbw $00, .OAMData_5e ; SPRITE_ANIM_FRAME_IDX_5E
	dbw $00, .OAMData_5f ; SPRITE_ANIM_FRAME_IDX_5F
	dbw $00, .OAMData_60 ; SPRITE_ANIM_FRAME_IDX_60
	dbw $00, .OAMData_61 ; SPRITE_ANIM_FRAME_IDX_61
	dbw $00, .OAMData_62 ; SPRITE_ANIM_FRAME_IDX_62
	dbw $00, .OAMData_BlueWalk ; SPRITE_ANIM_FRAME_IDX_BLUE_WALK_1
	dbw $04, .OAMData_BlueWalk ; SPRITE_ANIM_FRAME_IDX_BLUE_WALK_2
	dbw $00, .OAMData_65 ; SPRITE_ANIM_FRAME_IDX_65
	dbw $04, .OAMData_65 ; SPRITE_ANIM_FRAME_IDX_66
	dbw $20, .OAMData_67 ; SPRITE_ANIM_FRAME_IDX_67
	dbw $21, .OAMData_67 ; SPRITE_ANIM_FRAME_IDX_68
	dbw $22, .OAMData_69 ; SPRITE_ANIM_FRAME_IDX_69
	dbw $23, .OAMData_6a ; SPRITE_ANIM_FRAME_IDX_6A
	dbw $27, .OAMData_6b ; SPRITE_ANIM_FRAME_IDX_6B
	dbw $2a, .OAMData_6c ; SPRITE_ANIM_FRAME_IDX_6C
	dbw $2a, .OAMData_6d ; SPRITE_ANIM_FRAME_IDX_6D
	dbw $00, .OAMData_6e ; SPRITE_ANIM_FRAME_IDX_6E
	dbw $08, .OAMData_6f ; SPRITE_ANIM_FRAME_IDX_6F
	dbw $60, .OAMData_70 ; SPRITE_ANIM_FRAME_IDX_70
	dbw $68, .OAMData_71 ; SPRITE_ANIM_FRAME_IDX_71
	dbw $00, .OAMData_72 ; SPRITE_ANIM_FRAME_IDX_72
	dbw $05, .OAMData_72 ; SPRITE_ANIM_FRAME_IDX_73
	dbw $0a, .OAMData_72 ; SPRITE_ANIM_FRAME_IDX_74
	dbw $50, .OAMData_75 ; SPRITE_ANIM_FRAME_IDX_75
	dbw $00, .OAMData_76 ; SPRITE_ANIM_FRAME_IDX_76
	dbw $01, .OAMData_77 ; SPRITE_ANIM_FRAME_IDX_77
	dbw $04, .OAMData_78 ; SPRITE_ANIM_FRAME_IDX_78
	dbw $00, .OAMData_18 ; SPRITE_ANIM_FRAME_IDX_79
	dbw $01, .OAMData_7a ; SPRITE_ANIM_FRAME_IDX_7A
	dbw $03, .OAMData_7b ; SPRITE_ANIM_FRAME_IDX_7B
	dbw $08, .OAMData_7c ; SPRITE_ANIM_FRAME_IDX_7C
	dbw $1c, .OAMData_7c ; SPRITE_ANIM_FRAME_IDX_7D
	dbw $80, .OAMData_IntroSuicuneAway ; SPRITE_ANIM_FRAME_IDX_INTRO_SUICUNE_AWAY
	dbw $00, .OAMData_Celebi ; SPRITE_ANIM_FRAME_IDX_CELEBI_1
	dbw $04, .OAMData_Celebi ; SPRITE_ANIM_FRAME_IDX_CELEBI_2
	dbw $d0, .OAMData_81 ; SPRITE_ANIM_FRAME_IDX_81
	dbw $d3, .OAMData_81 ; SPRITE_ANIM_FRAME_IDX_82
	dbw $d6, .OAMData_81 ; SPRITE_ANIM_FRAME_IDX_83
	dbw $6c, .OAMData_84 ; SPRITE_ANIM_FRAME_IDX_84
	dbw $68, .OAMData_84 ; SPRITE_ANIM_FRAME_IDX_85
	dbw $64, .OAMData_84 ; SPRITE_ANIM_FRAME_IDX_86
	dbw $60, .OAMData_84 ; SPRITE_ANIM_FRAME_IDX_87
	dbw $0c, .OAMData_84 ; SPRITE_ANIM_FRAME_IDX_88
	dbw $08, .OAMData_84 ; SPRITE_ANIM_FRAME_IDX_89
	dbw $04, .OAMData_84 ; SPRITE_ANIM_FRAME_IDX_8A
	dbw $00, .OAMData_84 ; SPRITE_ANIM_FRAME_IDX_8B

.OAMData_02:
	db 1
	dsprite -1,  4, -1,  4, $00, $00

.OAMData_04:
	db 4
	dsprite -1,  0, -1,  0, $00, $00
	dsprite -1,  0,  0,  0, $01, $00
	dsprite  0,  0, -1,  0, $10, $00
	dsprite  0,  0,  0,  0, $11, $00

.OAMData_23:
	db 4
	dsprite -1,  0, -1,  0, $00, $00
	dsprite -1,  0,  0,  0, $00, $20
	dsprite  0,  0, -1,  0, $01, $00
	dsprite  0,  0,  0,  0, $01, $20

.OAMData_30:
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

.OAMData_19:
	db 16
	dsprite -2,  0, -2,  0, $00, $00
	dsprite -2,  0, -1,  0, $01, $00
	dsprite -1,  0, -2,  0, $02, $00
	dsprite -1,  0, -1,  0, $03, $00
	dsprite -2,  0,  0,  0, $01, $20
	dsprite -2,  0,  1,  0, $00, $20
	dsprite -1,  0,  0,  0, $03, $20
	dsprite -1,  0,  1,  0, $02, $20
	dsprite  0,  0, -2,  0, $02, $40
	dsprite  0,  0, -1,  0, $03, $40
	dsprite  1,  0, -2,  0, $00, $40
	dsprite  1,  0, -1,  0, $01, $40
	dsprite  0,  0,  0,  0, $03, $60
	dsprite  0,  0,  1,  0, $02, $60
	dsprite  1,  0,  0,  0, $01, $60
	dsprite  1,  0,  1,  0, $00, $60

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

.OAMData_31:
	db 4
	dsprite -1,  0, -1,  0, $00, $80
	dsprite -1,  0,  0,  0, $01, $80
	dsprite  0,  0, -1,  0, $02, $80
	dsprite  0,  0,  0,  0, $03, $80

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

.OAMData_20:
	db 4
	dsprite -1,  7, -1,  7, $00, $00
	dsprite -1,  7,  0,  0, $00, $20
	dsprite  0,  0, -1,  7, $00, $40
	dsprite  0,  0,  0,  0, $00, $60

.OAMData_ForFrameset09:
	db 10
	dsprite -1,  7,  0,  0, $00, $0
	dsprite -1,  7,  1,  0, $01, $0
	dsprite -1,  7,  2,  0, $01, $0
	dsprite -1,  7,  3,  0, $01, $0
	dsprite -1,  7,  4,  0, $00, $0 | X_FLIP
	dsprite  0,  0,  0,  0, $00, $0 | Y_FLIP
	dsprite  0,  0,  1,  0, $01, $0 | Y_FLIP
	dsprite  0,  0,  2,  0, $01, $0 | Y_FLIP
	dsprite  0,  0,  3,  0, $01, $0 | Y_FLIP
	dsprite  0,  0,  4,  0, $00, $0 | X_FLIP | Y_FLIP

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

.OAMData_27:
	db 6
	dsprite -2,  4, -2,  4, $00, $15
	dsprite -2,  4, -1,  4, $02, $15
	dsprite -2,  4,  0,  4, $00, $35
	dsprite  0,  4, -2,  4, $04, $15
	dsprite  0,  4, -1,  4, $06, $15
	dsprite  0,  4,  0,  4, $04, $35

.OAMData_29:
	db 6
	dsprite -2,  4, -2,  4, $00, $16
	dsprite -2,  4, -1,  4, $02, $16
	dsprite -2,  4,  0,  4, $04, $16
	dsprite  0,  4, -2,  4, $06, $16
	dsprite  0,  4, -1,  4, $08, $16
	dsprite  0,  4,  0,  4, $0a, $16

.OAMData_2a:
	db 6
	dsprite -2,  4, -2,  4, $00, $16
	dsprite -2,  4, -1,  4, $02, $16
	dsprite -2,  4,  0,  4, $04, $16
	dsprite  0,  4, -2,  4, $0c, $16
	dsprite  0,  4, -1,  4, $0e, $16
	dsprite  0,  4,  0,  4, $10, $16

.OAMData_2b:
	db 6
	dsprite -2,  4, -2,  4, $00, $16
	dsprite -2,  4, -1,  4, $02, $16
	dsprite -2,  4,  0,  4, $04, $16
	dsprite  0,  4, -2,  4, $12, $16
	dsprite  0,  4, -1,  4, $14, $16
	dsprite  0,  4,  0,  4, $16, $16

.OAMData_2c:
	db 6
	dsprite -2,  4, -2,  4, $00, $16
	dsprite -2,  4, -1,  4, $02, $16
	dsprite -2,  4,  0,  4, $04, $16
	dsprite  0,  4, -2,  4, $18, $16
	dsprite  0,  4, -1,  4, $1a, $16
	dsprite  0,  4,  0,  4, $1c, $16

.OAMData_2d:
	db 6
	dsprite -2,  4, -2,  4, $1e, $16
	dsprite -2,  4, -1,  4, $20, $16
	dsprite -2,  4,  0,  4, $22, $16
	dsprite  0,  4, -2,  4, $24, $16
	dsprite  0,  4, -1,  4, $26, $16
	dsprite  0,  4,  0,  4, $28, $16

.OAMData_RadioTuningKnob:
	db 3
	dsprite -2,  4, -1,  4, $00, $0 | OBP_NUM
	dsprite -1,  4, -1,  4, $00, $0 | OBP_NUM
	dsprite  0,  4, -1,  4, $00, $0 | OBP_NUM

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
	dsprite -1,  4, -1,  4, $00, $1 | OBP_NUM

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

.OAMData_65:
	db 4
	dsprite -1,  0, -1,  0, $00, $81
	dsprite -1,  0,  0,  0, $01, $81
	dsprite  0,  0, -1,  0, $02, $81
	dsprite  0,  0,  0,  0, $03, $81

.OAMData_67:
	db 1
	dsprite -1,  4, -1,  4, $00, $02

.OAMData_6c:
	db 4
	dsprite -2,  0, -1,  4, $00, $03
	dsprite -1,  0, -1,  4, $01, $03
	dsprite  0,  0, -1,  4, $02, $03
	dsprite  1,  0, -1,  4, $03, $03

.OAMData_6d:
	db 4
	dsprite -2,  0, -1,  4, $03, $44
	dsprite -1,  0, -1,  4, $02, $44
	dsprite  0,  0, -1,  4, $01, $44
	dsprite  1,  0, -1,  4, $00, $44

.OAMData_69:
	db 4
	dsprite -1,  0, -1,  0, $00, $01
	dsprite -1,  0,  0,  0, $00, $21
	dsprite  0,  0, -1,  0, $00, $41
	dsprite  0,  0,  0,  0, $00, $61

.OAMData_6a:
	db 8
	dsprite -2,  4, -2,  4, $00, $01
	dsprite -2,  4, -1,  4, $01, $01
	dsprite -2,  4,  0,  4, $00, $21
	dsprite -1,  4, -2,  4, $02, $01
	dsprite -1,  4,  0,  4, $02, $21
	dsprite  0,  4, -2,  4, $00, $41
	dsprite  0,  4, -1,  4, $01, $41
	dsprite  0,  4,  0,  4, $00, $61

.OAMData_6b:
	db 12
	dsprite -2,  0, -2,  0, $00, $01
	dsprite -2,  0, -1,  0, $01, $01
	dsprite -1,  0, -2,  0, $02, $01
	dsprite -2,  0,  0,  0, $01, $21
	dsprite -2,  0,  1,  0, $00, $21
	dsprite -1,  0,  1,  0, $02, $21
	dsprite  0,  0, -2,  0, $02, $41
	dsprite  1,  0, -2,  0, $00, $41
	dsprite  1,  0, -1,  0, $01, $41
	dsprite  0,  0,  1,  0, $02, $61
	dsprite  1,  0,  0,  0, $01, $61
	dsprite  1,  0,  1,  0, $00, $61

.OAMData_6e:
	db 36
	dsprite -3,  0,  1,  0, $05, $00
	dsprite -3,  0,  2,  0, $06, $00
	dsprite -3,  0,  3,  0, $07, $00
	dsprite -2,  0, -3,  0, $11, $00
	dsprite -2,  0, -2,  0, $12, $00
	dsprite -2,  0, -1,  0, $13, $00
	dsprite -2,  0,  0,  0, $14, $00
	dsprite -2,  0,  1,  0, $15, $00
	dsprite -2,  0,  2,  0, $16, $00
	dsprite -2,  0,  3,  0, $17, $00
	dsprite -1,  0, -4,  0, $20, $00
	dsprite -1,  0, -3,  0, $21, $00
	dsprite -1,  0, -2,  0, $22, $00
	dsprite -1,  0, -1,  0, $23, $00
	dsprite -1,  0,  0,  0, $24, $00
	dsprite -1,  0,  1,  0, $25, $00
	dsprite -1,  0,  2,  0, $26, $00
	dsprite -1,  0,  3,  0, $27, $00
	dsprite  0,  0, -4,  0, $30, $00
	dsprite  0,  0, -3,  0, $31, $00
	dsprite  0,  0, -2,  0, $32, $00
	dsprite  0,  0, -1,  0, $33, $00
	dsprite  0,  0,  0,  0, $34, $00
	dsprite  0,  0,  1,  0, $35, $00
	dsprite  0,  0,  2,  0, $36, $00
	dsprite  1,  0, -4,  0, $40, $00
	dsprite  1,  0, -3,  0, $41, $00
	dsprite  1,  0, -2,  0, $42, $00
	dsprite  1,  0, -1,  0, $43, $00
	dsprite  1,  0,  0,  0, $44, $00
	dsprite  1,  0,  1,  0, $45, $00
	dsprite  1,  0,  2,  0, $46, $00
	dsprite  1,  0,  3,  0, $47, $00
	dsprite  2,  0, -4,  0, $50, $00
	dsprite  2,  0, -3,  0, $51, $00
	dsprite  2,  0,  3,  0, $57, $00

.OAMData_6f:
	db 28
	dsprite -3,  0,  0,  0, $04, $00
	dsprite -3,  0,  1,  0, $05, $00
	dsprite -3,  0,  2,  0, $06, $00
	dsprite -2,  0, -3,  0, $11, $00
	dsprite -2,  0, -2,  0, $12, $00
	dsprite -2,  0, -1,  0, $13, $00
	dsprite -2,  0,  0,  0, $14, $00
	dsprite -2,  0,  1,  0, $15, $00
	dsprite -2,  0,  2,  0, $16, $00
	dsprite -1,  0, -3,  0, $21, $00
	dsprite -1,  0, -2,  0, $22, $00
	dsprite -1,  0, -1,  0, $23, $00
	dsprite -1,  0,  0,  0, $24, $00
	dsprite -1,  0,  1,  0, $25, $00
	dsprite -1,  0,  2,  0, $26, $00
	dsprite  0,  0, -4,  0, $30, $00
	dsprite  0,  0, -3,  0, $31, $00
	dsprite  0,  0, -2,  0, $32, $00
	dsprite  0,  0, -1,  0, $33, $00
	dsprite  0,  0,  0,  0, $34, $00
	dsprite  0,  0,  1,  0, $35, $00
	dsprite  1,  0, -2,  0, $42, $00
	dsprite  1,  0, -1,  0, $43, $00
	dsprite  1,  0,  0,  0, $44, $00
	dsprite  1,  0,  1,  0, $45, $00
	dsprite  2,  0, -1,  0, $53, $00
	dsprite  2,  0,  0,  0, $54, $00
	dsprite  2,  0,  1,  0, $55, $00

.OAMData_70:
	db 30
	dsprite -3,  0,  0,  0, $04, $00
	dsprite -3,  0,  1,  0, $05, $00
	dsprite -2,  0, -3,  0, $11, $00
	dsprite -2,  0, -2,  0, $12, $00
	dsprite -2,  0, -1,  0, $13, $00
	dsprite -2,  0,  0,  0, $14, $00
	dsprite -2,  0,  1,  0, $15, $00
	dsprite -2,  0,  2,  0, $16, $00
	dsprite -2,  0,  3,  0, $17, $00
	dsprite -1,  0, -4,  0, $20, $00
	dsprite -1,  0, -3,  0, $21, $00
	dsprite -1,  0, -2,  0, $22, $00
	dsprite -1,  0, -1,  0, $23, $00
	dsprite -1,  0,  0,  0, $24, $00
	dsprite -1,  0,  1,  0, $25, $00
	dsprite -1,  0,  2,  0, $26, $00
	dsprite  0,  0, -4,  0, $30, $00
	dsprite  0,  0, -3,  0, $31, $00
	dsprite  0,  0, -2,  0, $32, $00
	dsprite  0,  0, -1,  0, $33, $00
	dsprite  0,  0,  0,  0, $34, $00
	dsprite  0,  0,  1,  0, $35, $00
	dsprite  1,  0, -2,  0, $42, $00
	dsprite  1,  0, -1,  0, $43, $00
	dsprite  1,  0,  0,  0, $44, $00
	dsprite  1,  0,  1,  0, $45, $00
	dsprite  2,  0, -2,  0, $52, $00
	dsprite  2,  0, -1,  0, $53, $00
	dsprite  2,  0,  0,  0, $54, $00
	dsprite  2,  0,  1,  0, $55, $00

.OAMData_71:
	db 31
	dsprite -2,  0, -3,  0, $11, $00
	dsprite -2,  0, -2,  0, $12, $00
	dsprite -2,  0, -1,  0, $13, $00
	dsprite -2,  0,  0,  0, $14, $00
	dsprite -2,  0,  1,  0, $15, $00
	dsprite -2,  0,  2,  0, $16, $00
	dsprite -2,  0,  3,  0, $17, $00
	dsprite -1,  0, -4,  0, $20, $00
	dsprite -1,  0, -3,  0, $21, $00
	dsprite -1,  0, -2,  0, $22, $00
	dsprite -1,  0, -1,  0, $23, $00
	dsprite -1,  0,  0,  0, $24, $00
	dsprite -1,  0,  1,  0, $25, $00
	dsprite -1,  0,  2,  0, $26, $00
	dsprite -1,  0,  3,  0, $27, $00
	dsprite  0,  0, -4,  0, $30, $00
	dsprite  0,  0, -3,  0, $31, $00
	dsprite  0,  0, -2,  0, $32, $00
	dsprite  0,  0, -1,  0, $33, $00
	dsprite  0,  0,  0,  0, $34, $00
	dsprite  0,  0,  1,  0, $35, $00
	dsprite  0,  0,  2,  0, $36, $00
	dsprite  1,  0, -3,  0, $41, $00
	dsprite  1,  0, -2,  0, $42, $00
	dsprite  1,  0, -1,  0, $43, $00
	dsprite  1,  0,  0,  0, $44, $00
	dsprite  1,  0,  1,  0, $45, $00
	dsprite  2,  0, -3,  0, $51, $00
	dsprite  2,  0, -2,  0, $52, $00
	dsprite  2,  0,  0,  0, $54, $00
	dsprite  2,  0,  1,  0, $55, $00

.OAMData_72:
	db 25
	dsprite -3,  4, -3,  4, $00, $09
	dsprite -3,  4, -2,  4, $01, $09
	dsprite -3,  4, -1,  4, $02, $09
	dsprite -3,  4,  0,  4, $03, $09
	dsprite -3,  4,  1,  4, $04, $09
	dsprite -2,  4, -3,  4, $10, $09
	dsprite -2,  4, -2,  4, $11, $09
	dsprite -2,  4, -1,  4, $12, $09
	dsprite -2,  4,  0,  4, $13, $09
	dsprite -2,  4,  1,  4, $14, $09
	dsprite -1,  4, -3,  4, $20, $09
	dsprite -1,  4, -2,  4, $21, $09
	dsprite -1,  4, -1,  4, $22, $09
	dsprite -1,  4,  0,  4, $23, $09
	dsprite -1,  4,  1,  4, $24, $09
	dsprite  0,  4, -3,  4, $30, $09
	dsprite  0,  4, -2,  4, $31, $09
	dsprite  0,  4, -1,  4, $32, $09
	dsprite  0,  4,  0,  4, $33, $09
	dsprite  0,  4,  1,  4, $34, $09
	dsprite  1,  4, -3,  4, $40, $09
	dsprite  1,  4, -2,  4, $41, $09
	dsprite  1,  4, -1,  4, $42, $09
	dsprite  1,  4,  0,  4, $43, $09
	dsprite  1,  4,  1,  4, $44, $09

.OAMData_75:
	db 16
	dsprite -2,  0, -3,  4, $00, $0a
	dsprite -2,  0, -2,  4, $01, $0a
	dsprite -2,  0, -1,  4, $02, $0a
	dsprite -2,  0,  0,  4, $03, $0a
	dsprite -1,  0, -3,  4, $04, $0a
	dsprite -1,  0, -2,  4, $05, $0a
	dsprite -1,  0, -1,  4, $06, $0a
	dsprite -1,  0,  0,  4, $07, $0a
	dsprite  0,  0, -3,  4, $08, $0a
	dsprite  0,  0, -2,  4, $09, $0a
	dsprite  0,  0, -1,  4, $0a, $0a
	dsprite  0,  0,  0,  4, $0b, $0a
	dsprite  1,  0, -3,  4, $0c, $0a
	dsprite  1,  0, -2,  4, $0d, $0a
	dsprite  1,  0, -1,  4, $0e, $0a
	dsprite  1,  0,  0,  4, $0f, $0a

.OAMData_76:
	db 1
	dsprite -1,  4, -1,  4, $00, $00

.OAMData_77:
	db 3
	dsprite  0,  0, -1,  0, $00, $00
	dsprite -1,  0, -1,  0, $01, $00
	dsprite -1,  0,  0,  0, $02, $00

.OAMData_78:
	db 7
	dsprite  1,  0, -2,  0, $00, $00
	dsprite  0,  0, -2,  0, $01, $00
	dsprite -1,  0, -2,  0, $02, $00
	dsprite -1,  0, -1,  0, $03, $00
	dsprite -2,  0, -1,  0, $04, $00
	dsprite -2,  0,  0,  0, $05, $00
	dsprite -2,  0,  1,  0, $06, $00

.OAMData_7a:
	db 8
	dsprite -1,  0, -2,  0, $00, $0
	dsprite -1,  0, -1,  0, $01, $0
	dsprite -1,  0,  0,  0, $01, $0 | X_FLIP
	dsprite -1,  0,  1,  0, $00, $0 | X_FLIP
	dsprite  0,  0, -2,  0, $00, $0 | Y_FLIP
	dsprite  0,  0, -1,  0, $01, $0 | Y_FLIP
	dsprite  0,  0,  0,  0, $01, $0 | X_FLIP | Y_FLIP
	dsprite  0,  0,  1,  0, $00, $0 | X_FLIP | Y_FLIP

.OAMData_7b:
	db 12
	dsprite -3,  0, -1,  0, $00, $0
	dsprite -2,  0, -1,  0, $01, $0
	dsprite -1,  0, -1,  0, $02, $0
	dsprite -3,  0,  0,  0, $00, $0 | X_FLIP
	dsprite -2,  0,  0,  0, $01, $0 | X_FLIP
	dsprite -1,  0,  0,  0, $02, $0 | X_FLIP
	dsprite  0,  0, -1,  0, $02, $0 | Y_FLIP
	dsprite  1,  0, -1,  0, $01, $0 | Y_FLIP
	dsprite  2,  0, -1,  0, $00, $0 | Y_FLIP
	dsprite  0,  0,  0,  0, $02, $0 | X_FLIP | Y_FLIP
	dsprite  1,  0,  0,  0, $01, $0 | X_FLIP | Y_FLIP
	dsprite  2,  0,  0,  0, $00, $0 | X_FLIP | Y_FLIP

.OAMData_7c:
	db 20
	dsprite -3,  4, -2,  0, $00, $00
	dsprite -3,  4, -1,  0, $01, $00
	dsprite -3,  4,  0,  0, $02, $00
	dsprite -3,  4,  1,  0, $03, $00
	dsprite -2,  4, -2,  0, $04, $00
	dsprite -2,  4, -1,  0, $05, $00
	dsprite -2,  4,  0,  0, $06, $00
	dsprite -2,  4,  1,  0, $07, $00
	dsprite -1,  4, -2,  0, $08, $00
	dsprite -1,  4, -1,  0, $09, $00
	dsprite -1,  4,  0,  0, $0a, $00
	dsprite -1,  4,  1,  0, $0b, $00
	dsprite  0,  4, -2,  0, $0c, $00
	dsprite  0,  4, -1,  0, $0d, $00
	dsprite  0,  4,  0,  0, $0e, $00
	dsprite  0,  4,  1,  0, $0f, $00
	dsprite  1,  4, -2,  0, $10, $00
	dsprite  1,  4, -1,  0, $11, $00
	dsprite  1,  4,  0,  0, $12, $00
	dsprite  1,  4,  1,  0, $13, $00

.OAMData_IntroSuicuneAway:
	db 20
	dsprite  0,  0,   1,  0, $00, $1 | BEHIND_BG
	dsprite  1,  0,   2,  0, $00, $1 | BEHIND_BG
	dsprite  2,  0,   3,  0, $00, $1 | BEHIND_BG
	dsprite  3,  0,   4,  0, $00, $1 | BEHIND_BG
	dsprite  4,  0,   5,  0, $00, $1 | BEHIND_BG
	dsprite  3,  0,   6,  0, $00, $1 | BEHIND_BG
	dsprite  2,  0,   7,  0, $00, $1 | BEHIND_BG
	dsprite  1,  0,   8,  0, $00, $1 | BEHIND_BG
	dsprite  0,  0,   9,  0, $00, $1 | BEHIND_BG
	dsprite  1,  0,  10,  0, $00, $1 | BEHIND_BG
	dsprite  2,  0,  11,  0, $00, $1 | BEHIND_BG
	dsprite  3,  0,  12,  0, $00, $1 | BEHIND_BG
	dsprite  4,  0,  13,  0, $00, $1 | BEHIND_BG
	dsprite  3,  0,  14,  0, $00, $1 | BEHIND_BG
	dsprite  2,  0,  15,  0, $00, $1 | BEHIND_BG
	dsprite  1,  0,  16,  0, $00, $1 | BEHIND_BG
	dsprite  0,  0, -15,  0, $00, $1 | BEHIND_BG
	dsprite  1,  0, -14,  0, $00, $1 | BEHIND_BG
	dsprite  2,  0, -13,  0, $00, $1 | BEHIND_BG
	dsprite  3,  0, -12,  0, $00, $1 | BEHIND_BG

.OAMData_Celebi:
	db 4
	dsprite -1,  0, -1,  0, $00, PAL_OW_GREEN
	dsprite -1,  0,  0,  0, $01, PAL_OW_GREEN
	dsprite  0,  0, -1,  0, $02, PAL_OW_GREEN
	dsprite  0,  0,  0,  0, $03, PAL_OW_GREEN

.OAMData_81:
	db 9
	dsprite -2,  0, -2,  4, $00, $01
	dsprite -2,  0, -1,  4, $01, $01
	dsprite -2,  0,  0,  4, $02, $01
	dsprite -1,  0, -2,  4, $10, $01
	dsprite -1,  0, -1,  4, $11, $01
	dsprite -1,  0,  0,  4, $12, $01
	dsprite  0,  0, -2,  4, $20, $01
	dsprite  0,  0, -1,  4, $21, $01
	dsprite  0,  0,  0,  4, $22, $01

.OAMData_84:
	db 24
	dsprite -5,  0, -2,  4, $00, $01
	dsprite -5,  0, -1,  4, $01, $01
	dsprite -5,  0,  0,  4, $02, $01
	dsprite -5,  0,  1,  4, $03, $01
	dsprite -4,  0, -2,  4, $10, $01
	dsprite -4,  0, -1,  4, $11, $01
	dsprite -4,  0,  0,  4, $12, $01
	dsprite -4,  0,  1,  4, $13, $01
	dsprite -3,  0, -2,  4, $20, $01
	dsprite -3,  0, -1,  4, $21, $01
	dsprite -3,  0,  0,  4, $22, $01
	dsprite -3,  0,  1,  4, $23, $01
	dsprite -2,  0, -2,  4, $30, $01
	dsprite -2,  0, -1,  4, $31, $01
	dsprite -2,  0,  0,  4, $32, $01
	dsprite -2,  0,  1,  4, $33, $01
	dsprite -1,  0, -2,  4, $40, $01
	dsprite -1,  0, -1,  4, $41, $01
	dsprite -1,  0,  0,  4, $42, $01
	dsprite -1,  0,  1,  4, $43, $01
	dsprite  0,  0, -2,  4, $50, $01
	dsprite  0,  0, -1,  4, $51, $01
	dsprite  0,  0,  0,  4, $52, $01
	dsprite  0,  0,  1,  4, $53, $01
; 8e706
