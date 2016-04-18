SpriteAnimFrameData: ; 8d6e6
	dw .Frameset_00 ; 00
	dw .Frameset_01 ; 01
	dw .Frameset_02 ; 02
	dw .Frameset_03 ; 03
	dw .Frameset_04 ; 04
	dw .Frameset_05 ; 05
	dw .Frameset_06 ; 06
	dw .Frameset_07 ; 07
	dw .Frameset_08 ; 08
	dw .Frameset_09 ; 09
	dw .Frameset_0a ; 0a
	dw .Frameset_0b ; 0b
	dw .Frameset_0c ; 0c
	dw .Frameset_0d ; 0d
	dw .Frameset_0e ; 0e
	dw .Frameset_0f ; 0f
	dw .Frameset_10 ; 10
	dw .Frameset_11 ; 11
	dw .Frameset_12 ; 12
	dw .Frameset_13 ; 13
	dw .Frameset_14 ; 14
	dw .Frameset_15 ; 15
	dw .Frameset_16 ; 16
	dw .Frameset_17 ; 17
	dw .Frameset_18 ; 18
	dw .Frameset_19 ; 19
	dw .Frameset_1a ; 1a
	dw .Frameset_1b ; 1b
	dw .Frameset_1c ; 1c
	dw .Frameset_1d ; 1d
	dw .Frameset_1e ; 1e
	dw .Frameset_1f ; 1f
	dw .Frameset_20 ; 20
	dw .Frameset_21 ; 21
	dw .Frameset_22 ; 22
	dw .Frameset_23 ; 23
	dw .Frameset_24 ; 24
	dw .Frameset_25 ; 25 headbutt
	dw .Frameset_26 ; 26
	dw .Frameset_27 ; 27
	dw .Frameset_28 ; 28
	dw .Frameset_29 ; 29
	dw .Frameset_2a ; 2a
	dw .Frameset_2b ; 2b
	dw .Frameset_2c ; 2c
	dw .Frameset_2d ; 2d
	dw .Frameset_2e ; 2e
	dw .Frameset_2f ; 2f
	dw .Frameset_30 ; 30
	dw .Frameset_31 ; 31
	dw .Frameset_32 ; 32
	dw .Frameset_33 ; 33
	dw .Frameset_34 ; 34
	dw .Frameset_35 ; 35
	dw .Frameset_36 ; 36
	dw .Frameset_37 ; 37
	dw .Frameset_38 ; 38
	dw .Frameset_39 ; 39 unown in intro
	dw .Frameset_3a ; 3a unown in intro
	dw .Frameset_3b ; 3b unown in intro
	dw .Frameset_3c ; 3c unown in intro
	dw .Frameset_3d ; 3d
	dw .Frameset_3e ; 3e
	dw .Frameset_3f ; 3f
	dw .Frameset_40 ; 40 celebi on the left
	dw .Frameset_41 ; 41 celebi on the right
; 8d76a
; OAM idx (see SpriteAnimOAMData), flip flags/duration
.Frameset_00:
	db $00, $20
	db -1

.Frameset_01:
	db $00, $08
	db $01, $08
	db -2

.Frameset_02:
	db $3d, $08
	db $3e, $08
	db -2

.Frameset_03:
	db $3f, $08
	db $40, $08
	db -2

.Frameset_04:
	db $00, $04
	db $01, $04
	db -2

.Frameset_05:
	db $3d, $04
	db $3e, $04
	db -2

.Frameset_06:
	db $3f, $04
	db $40, $04
	db -2

.Frameset_11:
	db $00, $08
	db $01, $08
	db $00, $08
	db $01, $48
	db -2

.Frameset_2d:
	db $63, $08
	db $64, $08
	db $63, $08
	db $64, $48
	db -2

.Frameset_2e:
	db $65, $08
	db $66, $08
	db $65, $08
	db $66, $48
	db -2

.Frameset_07:
	db $1e, $01
	db $1f, $01
	db -2

.Frameset_08:
	db $20, $01
	db -3, $01
	db -2

.Frameset_09:
	db $21, $01
	db -3, $01
	db -2

.Frameset_0a:
	db $81, $0c
	db $82, $01
	db $83, $01
	db $82, $04
	db $81, $0c
	db $82, $0c
	db $83, $04
	db $84, $20
	db $85, $03
	db $86, $03
	db $87, $04
	db $88, $04
	db $89, $04
	db $8a, $0a
	db $8b, $07
	db -1

.Frameset_0b:
	db $23, $03
	db $23, $83
	db -2

.Frameset_0c:
	db $24, $02
	db $25, $02
	db $26, $02
	db $25, $02
	db -2

.Frameset_0d:
	db $27, $07
	db $28, $07
	db $27, $87
	db $28, $47
	db -2

.Frameset_0e:
	db $29, $07
	db $2a, $07
	db $29, $07
	db $2b, $07
	db -2

.Frameset_0f:
	db $29, $07
	db $2c, $07
	db $2d, $07
	db $2c, $07
	db $29, $07
	db -1

.Frameset_10:
	db $2e, $14
	db -1

.Frameset_12:
	db $2f, $20
	db -1

.Frameset_13:
	db $30, $20
	db -1

.Frameset_14:
	db $30, $03
	db $31, $03
	db $30, $03
	db $31, $43
	db -2

.Frameset_15:
	db $32, $04
	db $33, $04
	db $34, $04
	db -4

.Frameset_16:
	db $35, $03
	db $36, $03
	db -2

.Frameset_17:
	db $37, $07
	db $38, $07
	db -2

.Frameset_18:
	db $39, $20
	db -1

.Frameset_19:
	db $3b, $02
	db $3a, $02
	db $3b, $02
	db -1

.Frameset_1a:
	db $3c, $20
	db -1

.Frameset_1b:
	db $41, $08
	db $42, $08
	db $41, $08
	db $42, $48
	db -2
	db $43, $08
	db $44, $08
	db -2
	db $45, $08
	db $46, $08
	db -2
	db $47, $08
	db $48, $08
	db -2
	db $49, $01
	db $49, $41
	db $49, $c1
	db $49, $81
	db -2
	db $4a, $20
	db -1
	db $4b, $20
	db -1
	db $4c, $20
	db -1
	db $4d, $20
	db -1
	db $4e, $03
	db -3, $03
	db -2

.Frameset_1c:
	db -3, $20
	db -1

.Frameset_1d:
	db $4f, $20
	db -1

.Frameset_1e:
	db $50, $02
	db $51, $10
	db -3, $01
	db $52, $01
	db -3, $01
	db $53, $01
	db -4

.Frameset_1f:
	db $54, $20
	db -1

.Frameset_20:
	db $55, $20
	db -1

.Frameset_21:
	db $55, $60
	db -1

.Frameset_22:
	db $55, $a0
	db -1

.Frameset_23:
	db $55, $e0
	db -1

.Frameset_24:
	db $56, $0a
	db $57, $09
	db $58, $0a
	db $59, $0a
	db $58, $09
	db $5a, $0a
	db -2

.Frameset_25:
	db $50, $02
	db $5b, $02
	db $50, $02
	db $5b, $42
	db -2

.Frameset_26:
	db $5c, $02
	db -1

.Frameset_27:
	db $5d, $02
	db -1

.Frameset_28:
	db $5e, $02
	db -1

.Frameset_29:
	db $5f, $02
	db -1

.Frameset_2a:
	db $60, $02
	db -1

.Frameset_2b:
	db $61, $02
	db -1

.Frameset_2c:
	db $62, $02
	db -1

.Frameset_2f:
	db $32, $03
	db $33, $03
	db $34, $03
	db $30, $03
	db $31, $03
	db $30, $03
	db $31, $43
	db $30, $03
	db $31, $03
	db $30, $03
	db $31, $43
	db $30, $03
	db $31, $03
	db $30, $03
	db $31, $43
	db -1

.Frameset_30:
	db $30, $03
	db $31, $03
	db $30, $03
	db $31, $43
	db $30, $03
	db $31, $03
	db $30, $03
	db $31, $43
	db $30, $03
	db $31, $03
	db $30, $03
	db $31, $43
	db $32, $03
	db $33, $03
	db $34, $03
	db -4

.Frameset_31:
	db $67, $03
	db $68, $03
	db -2

.Frameset_32:
	db $6c, $03
	db -1

.Frameset_33:
	db $6d, $03
	db -1

.Frameset_34:
	db $69, $02
	db $6a, $02
	db $6b, $02
	db -4

.Frameset_35:
	db $6e, $03
	db $6f, $03
	db $70, $03
	db $71, $03
	db -2

.Frameset_36:
	db $71, $03
	db $6e, $07
	db -1

.Frameset_37:
	db $72, $20
	db $73, $07
	db $74, $07
	db -1

.Frameset_38:
	db $75, $03
	db -1

.Frameset_39:
	db $76, $03
	db $77, $03
	db $78, $07
	db -4

.Frameset_3a:
	db $76, $43
	db $77, $43
	db $78, $47
	db -4

.Frameset_3b:
	db $76, $83
	db $77, $83
	db $78, $87
	db -4

.Frameset_3c:
	db $76, $c3
	db $77, $c3
	db $78, $c7
	db -4

.Frameset_3d:
	db $79, $03
	db $7a, $03
	db $7b, $03
	db $7c, $07
	db $7d, $07
	db -1

.Frameset_3e:
	db $7e, $03
	db -1

.Frameset_3f:
	db -3, $00
	db -1

.Frameset_40:
	db $7f, $08
	db $80, $08
	db -1

.Frameset_41:
	db $7f, $48
	db $80, $48
	db -1
; 8d94d

SpriteAnimOAMData: ; 8d94d
	; vtile offset, pointer
	dbw $00, .OAMData_00 ; 00
	dbw $04, .OAMData_00 ; 01
	dbw $4c, .OAMData_02 ; 02
	dbw $5c, .OAMData_02 ; 03
	dbw $6c, .OAMData_04 ; 04
	dbw $6e, .OAMData_04 ; 05
	dbw $2d, .OAMData_06 ; 06
	dbw $4d, .OAMData_06 ; 07
	dbw $60, .OAMData_08 ; 08
	dbw $00, .OAMData_08 ; 09
	dbw $00, .OAMData_08 ; 0a
	dbw $06, .OAMData_08 ; 0b
	dbw $0c, .OAMData_0c ; 0c
	dbw $0d, .OAMData_02 ; 0d
	dbw $00, .OAMData_0e ; 0e
	dbw $04, .OAMData_0e ; 0f
	dbw $08, .OAMData_0e ; 10
	dbw $40, .OAMData_0e ; 11
	dbw $44, .OAMData_0e ; 12
	dbw $48, .OAMData_0e ; 13
	dbw $4c, .OAMData_0e ; 14
	dbw $80, .OAMData_15 ; 15
	dbw $85, .OAMData_15 ; 16
	dbw $8a, .OAMData_15 ; 17
	dbw $00, .OAMData_18 ; 18
	dbw $01, .OAMData_19 ; 19
	dbw $09, .OAMData_1a ; 1a
	dbw $10, .OAMData_1b ; 1b
	dbw $29, .OAMData_1b ; 1c
	dbw $42, .OAMData_1b ; 1d
	dbw $f8, .OAMData_1e ; 1e
	dbw $fa, .OAMData_1e ; 1f
	dbw $00, .OAMData_20 ; 20
	dbw $00, .OAMData_21 ; 21
	dbw $00, .OAMData_22 ; 22
	dbw $0f, .OAMData_23 ; 23
	dbw $11, .OAMData_02 ; 24
	dbw $12, .OAMData_02 ; 25
	dbw $13, .OAMData_02 ; 26
	dbw $00, .OAMData_27 ; 27
	dbw $08, .OAMData_27 ; 28
	dbw $10, .OAMData_29 ; 29
	dbw $10, .OAMData_2a ; 2a
	dbw $10, .OAMData_2b ; 2b
	dbw $10, .OAMData_2c ; 2c
	dbw $10, .OAMData_2d ; 2d
	dbw $3a, .OAMData_02 ; 2e
	dbw $00, .OAMData_00 ; 2f
	dbw $00, .OAMData_30 ; 30
	dbw $02, .OAMData_31 ; 31
	dbw $06, .OAMData_19 ; 32
	dbw $0a, .OAMData_19 ; 33
	dbw $0e, .OAMData_19 ; 34
	dbw $12, .OAMData_35 ; 35
	dbw $13, .OAMData_35 ; 36
	dbw $00, .OAMData_00 ; 37
	dbw $04, .OAMData_00 ; 38
	dbw $10, .OAMData_19 ; 39
	dbw $00, .OAMData_31 ; 3a
	dbw $04, .OAMData_02 ; 3b
	dbw $00, .OAMData_3c ; 3c
	dbw $00, .OAMData_3d ; 3d
	dbw $00, .OAMData_3e ; 3e
	dbw $00, .OAMData_3f ; 3f
	dbw $00, .OAMData_40 ; 40
	dbw $00, .OAMData_31 ; 41
	dbw $04, .OAMData_31 ; 42
	dbw $00, .OAMData_43 ; 43
	dbw $30, .OAMData_43 ; 44
	dbw $03, .OAMData_43 ; 45
	dbw $33, .OAMData_43 ; 46
	dbw $06, .OAMData_43 ; 47
	dbw $36, .OAMData_43 ; 48
	dbw $09, .OAMData_43 ; 49
	dbw $39, .OAMData_43 ; 4a
	dbw $0c, .OAMData_4b ; 4b
	dbw $0c, .OAMData_4c ; 4c
	dbw $3c, .OAMData_02 ; 4d
	dbw $3e, .OAMData_02 ; 4e
	dbw $00, .OAMData_4f ; 4f
	dbw $00, .OAMData_50 ; 50
	dbw $00, .OAMData_51 ; 51
	dbw $00, .OAMData_52 ; 52
	dbw $00, .OAMData_53 ; 53
	dbw $00, .OAMData_02 ; 54
	dbw $01, .OAMData_02 ; 55
	dbw $00, .OAMData_56 ; 56
	dbw $00, .OAMData_57 ; 57
	dbw $00, .OAMData_58 ; 58
	dbw $00, .OAMData_59 ; 59
	dbw $00, .OAMData_5a ; 5a
	dbw $04, .OAMData_50 ; 5b
	dbw $00, .OAMData_5c ; 5c
	dbw $00, .OAMData_5d ; 5d
	dbw $00, .OAMData_5e ; 5e
	dbw $00, .OAMData_5f ; 5f
	dbw $00, .OAMData_60 ; 60
	dbw $00, .OAMData_61 ; 61
	dbw $00, .OAMData_62 ; 62
	dbw $00, .OAMData_63 ; 63
	dbw $04, .OAMData_63 ; 64
	dbw $00, .OAMData_65 ; 65
	dbw $04, .OAMData_65 ; 66
	dbw $20, .OAMData_67 ; 67
	dbw $21, .OAMData_67 ; 68
	dbw $22, .OAMData_69 ; 69
	dbw $23, .OAMData_6a ; 6a
	dbw $27, .OAMData_6b ; 6b
	dbw $2a, .OAMData_6c ; 6c
	dbw $2a, .OAMData_6d ; 6d
	dbw $00, .OAMData_6e ; 6e
	dbw $08, .OAMData_6f ; 6f
	dbw $60, .OAMData_70 ; 70
	dbw $68, .OAMData_71 ; 71
	dbw $00, .OAMData_72 ; 72
	dbw $05, .OAMData_72 ; 73
	dbw $0a, .OAMData_72 ; 74
	dbw $50, .OAMData_75 ; 75
	dbw $00, .OAMData_76 ; 76
	dbw $01, .OAMData_77 ; 77
	dbw $04, .OAMData_78 ; 78
	dbw $00, .OAMData_18 ; 79
	dbw $01, .OAMData_7a ; 7a
	dbw $03, .OAMData_7b ; 7b
	dbw $08, .OAMData_7c ; 7c
	dbw $1c, .OAMData_7c ; 7d
	dbw $80, .OAMData_7e ; 7e
	dbw $00, .OAMData_7f ; 7f
	dbw $04, .OAMData_7f ; 80
	dbw $d0, .OAMData_81 ; 81
	dbw $d3, .OAMData_81 ; 82
	dbw $d6, .OAMData_81 ; 83
	dbw $6c, .OAMData_84 ; 84
	dbw $68, .OAMData_84 ; 85
	dbw $64, .OAMData_84 ; 86
	dbw $60, .OAMData_84 ; 87
	dbw $0c, .OAMData_84 ; 88
	dbw $08, .OAMData_84 ; 89
	dbw $04, .OAMData_84 ; 8a
	dbw $00, .OAMData_84 ; 8b

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

.OAMData_00:
; party menu icons
	db 4
	dsprite -1,  0, -1,  0, $00, $00
	dsprite -1,  0,  0,  0, $01, $00
	dsprite  0,  0, -1,  0, $02, $00
	dsprite  0,  0,  0,  0, $03, $00

.OAMData_31:
	db 4
	dsprite -1,  0, -1,  0, $00, $80
	dsprite -1,  0,  0,  0, $01, $80
	dsprite  0,  0, -1,  0, $02, $80
	dsprite  0,  0,  0,  0, $03, $80

.OAMData_3d:
; party menu icon with mail, frame 1
	db 4
	dsprite -1,  0, -1,  0, $00, $00
	dsprite -1,  0,  0,  0, $01, $00
	dsprite  0,  0, -1,  0, $08, $00
	dsprite  0,  0,  0,  0, $03, $00

.OAMData_3e:
; party menu icon with mail, frame 2
	db 4
	dsprite -1,  0, -1,  0, $04, $00
	dsprite -1,  0,  0,  0, $05, $00
	dsprite  0,  0, -1,  0, $08, $00
	dsprite  0,  0,  0,  0, $07, $00

.OAMData_3f:
; party menu icon with item, frame 1
	db 4
	dsprite -1,  0, -1,  0, $00, $00
	dsprite -1,  0,  0,  0, $01, $00
	dsprite  0,  0, -1,  0, $09, $00
	dsprite  0,  0,  0,  0, $03, $00

.OAMData_40:
; party menu icon with item, frame 2
	db 4
	dsprite -1,  0, -1,  0, $04, $00
	dsprite -1,  0,  0,  0, $05, $00
	dsprite  0,  0, -1,  0, $09, $00
	dsprite  0,  0,  0,  0, $07, $00

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

.OAMData_4f:
	db 1
	dsprite -1,  4, -1,  4, $00, $06

.OAMData_50:
	db 4
	dsprite -1,  0, -1,  0, $00, $06
	dsprite -1,  0,  0,  0, $01, $06
	dsprite  0,  0, -1,  0, $02, $06
	dsprite  0,  0,  0,  0, $03, $06

.OAMData_20:
	db 4
	dsprite -1,  7, -1,  7, $00, $00
	dsprite -1,  7,  0,  0, $00, $20
	dsprite  0,  0, -1,  7, $00, $40
	dsprite  0,  0,  0,  0, $00, $60

.OAMData_21:
	db 10
	dsprite -1,  7,  0,  0, $00, $00
	dsprite -1,  7,  1,  0, $01, $00
	dsprite -1,  7,  2,  0, $01, $00
	dsprite -1,  7,  3,  0, $01, $00
	dsprite -1,  7,  4,  0, $00, $20
	dsprite  0,  0,  0,  0, $00, $40
	dsprite  0,  0,  1,  0, $01, $40
	dsprite  0,  0,  2,  0, $01, $40
	dsprite  0,  0,  3,  0, $01, $40
	dsprite  0,  0,  4,  0, $00, $60

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

.OAMData_3c:
	db 3
	dsprite -2,  4, -1,  4, $00, $10
	dsprite -1,  4, -1,  4, $00, $10
	dsprite  0,  4, -1,  4, $00, $10

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

.OAMData_51:
	db 4
	dsprite -1,  0, -2,  6, $00, $06
	dsprite -1,  0,  0,  2, $01, $06
	dsprite  0,  0, -2,  6, $02, $06
	dsprite  0,  0,  0,  2, $03, $06

.OAMData_52:
	db 4
	dsprite -1,  0, -2,  4, $00, $06
	dsprite -1,  0,  0,  4, $01, $06
	dsprite  0,  0, -2,  4, $02, $06
	dsprite  0,  0,  0,  4, $03, $06

.OAMData_53:
	db 4
	dsprite -1,  0, -2,  0, $00, $06
	dsprite -1,  0,  1,  0, $01, $06
	dsprite  0,  0, -2,  0, $02, $06
	dsprite  0,  0,  1,  0, $03, $06

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

.OAMData_1e:
	db 1
	dsprite -1,  4, -1,  4, $00, $11

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

.OAMData_63:
	db 4
	dsprite -1,  0, -1,  0, $00, $01
	dsprite -1,  0,  0,  0, $01, $01
	dsprite  0,  0, -1,  0, $02, $01
	dsprite  0,  0,  0,  0, $03, $01

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
	dsprite -1,  0, -2,  0, $00, $00
	dsprite -1,  0, -1,  0, $01, $00
	dsprite -1,  0,  0,  0, $01, $20
	dsprite -1,  0,  1,  0, $00, $20
	dsprite  0,  0, -2,  0, $00, $40
	dsprite  0,  0, -1,  0, $01, $40
	dsprite  0,  0,  0,  0, $01, $60
	dsprite  0,  0,  1,  0, $00, $60

.OAMData_7b:
	db 12
	dsprite -3,  0, -1,  0, $00, $00
	dsprite -2,  0, -1,  0, $01, $00
	dsprite -1,  0, -1,  0, $02, $00
	dsprite -3,  0,  0,  0, $00, $20
	dsprite -2,  0,  0,  0, $01, $20
	dsprite -1,  0,  0,  0, $02, $20
	dsprite  0,  0, -1,  0, $02, $40
	dsprite  1,  0, -1,  0, $01, $40
	dsprite  2,  0, -1,  0, $00, $40
	dsprite  0,  0,  0,  0, $02, $60
	dsprite  1,  0,  0,  0, $01, $60
	dsprite  2,  0,  0,  0, $00, $60

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

.OAMData_7e:
	db 20
	dsprite  0,  0,   1,  0, $00, $81
	dsprite  1,  0,   2,  0, $00, $81
	dsprite  2,  0,   3,  0, $00, $81
	dsprite  3,  0,   4,  0, $00, $81
	dsprite  4,  0,   5,  0, $00, $81
	dsprite  3,  0,   6,  0, $00, $81
	dsprite  2,  0,   7,  0, $00, $81
	dsprite  1,  0,   8,  0, $00, $81
	dsprite  0,  0,   9,  0, $00, $81
	dsprite  1,  0,  10,  0, $00, $81
	dsprite  2,  0,  11,  0, $00, $81
	dsprite  3,  0,  12,  0, $00, $81
	dsprite  4,  0,  13,  0, $00, $81
	dsprite  3,  0,  14,  0, $00, $81
	dsprite  2,  0,  15,  0, $00, $81
	dsprite  1,  0,  16,  0, $00, $81
	dsprite  0,  0, -15,  0, $00, $81
	dsprite  1,  0, -14,  0, $00, $81
	dsprite  2,  0, -13,  0, $00, $81
	dsprite  3,  0, -12,  0, $00, $81

.OAMData_7f:
	db 4
	dsprite -1,  0, -1,  0, $00, $02
	dsprite -1,  0,  0,  0, $01, $02
	dsprite  0,  0, -1,  0, $02, $02
	dsprite  0,  0,  0,  0, $03, $02

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
BrokenStdGFXPointers: ; Broken 2bpp pointers
	dbbw $80, $01, .deleted ; 128-tile 2bpp at 1:672a (inside Multiply)
	dbbw $80, $01, .deleted
	dbbw $80, $01, .deleted
	dbbw $80, $01, .deleted
	dbbw $10, $37, .deleted ; 16-tile 2bpp at 37:672a (within Tileset11GFX)
	dbbw $10, $11, .deleted ; 16-tile 2bpp at 11:672a (empty data)
	dbbw $10, $39, .deleted ; 16-tile 2bpp at 39:672a (empty data)
	dbbw $10, $24, .deleted ; 16-tile 2bpp at 24:672a (inside Function926f7)
	dbbw $10, $21, .deleted ; 16-tile 2bpp at 21:672a (inside Function8671c)

.deleted
; 8e72a (23:672a)
