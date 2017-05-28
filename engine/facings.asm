Facings: ; 4049
	dw FacingStepDown0
	dw FacingStepDown1
	dw FacingStepDown2
	dw FacingStepDown3
	dw FacingStepUp0
	dw FacingStepUp1
	dw FacingStepUp2
	dw FacingStepUp3
	dw FacingStepLeft0
	dw FacingStepLeft1
	dw FacingStepLeft2
	dw FacingStepLeft3
	dw FacingStepRight0
	dw FacingStepRight1
	dw FacingStepRight2
	dw FacingStepRight3
	dw FacingFishDown
	dw FacingFishUp
	dw FacingFishLeft
	dw FacingFishRight
	dw FacingEmote
	dw FacingShadow
	dw FacingBigDollAsymmetric
	dw FacingBigDollSymmetric
	dw FacingWeirdTree0
	dw FacingWeirdTree1
	dw FacingWeirdTree2
	dw FacingWeirdTree3
	dw FacingBoulderDust1
	dw FacingBoulderDust2
	dw FacingGrass1
	dw FacingGrass2
FacingsEnd: dw 0

NUM_FACINGS EQU (FacingsEnd - Facings) / 2


; Tables used as a reference to transform OAM data.

; Format:
;	db y, x, attributes, tile index

; Attributes:
X_FLIP    EQU 1 << OAM_X_FLIP
Y_FLIP    EQU 1 << OAM_Y_FLIP
BEHIND_BG EQU 1 << OAM_PRIORITY


FacingStepDown0:
FacingStepDown2:
FacingWeirdTree0:
FacingWeirdTree2: ; standing down
	db 4 ; #
	db  0,  0, 0, $00
	db  0,  8, 0, $01
	db  8,  0, 2, $02
	db  8,  8, 2, $03
; 409c

FacingStepDown1: ; walking down 1
	db 4 ; #
	db  0,  0, 0, $80
	db  0,  8, 0, $81
	db  8,  0, 2, $82
	db  8,  8, 2, $83
; 40ad

FacingStepDown3: ; walking down 2
	db 4 ; #
	db  0,  8, X_FLIP, $80
	db  0,  0, X_FLIP, $81
	db  8,  8, 2 | X_FLIP, $82
	db  8,  0, 2 | X_FLIP, $83
; 40be

FacingStepUp0:
FacingStepUp2: ; standing up
	db 4 ; #
	db  0,  0, 0, $04
	db  0,  8, 0, $05
	db  8,  0, 2, $06
	db  8,  8, 2, $07
; 40cf

FacingStepUp1: ; walking up 1
	db 4 ; #
	db  0,  0, 0, $84
	db  0,  8, 0, $85
	db  8,  0, 2, $86
	db  8,  8, 2, $87
; 40e0

FacingStepUp3: ; walking up 2
	db 4 ; #
	db  0,  8, X_FLIP, $84
	db  0,  0, X_FLIP, $85
	db  8,  8, 2 | X_FLIP, $86
	db  8,  0, 2 | X_FLIP, $87
; 40f1

FacingStepLeft0:
FacingStepLeft2: ; standing left
	db 4 ; #
	db  0,  0, 0, $08
	db  0,  8, 0, $09
	db  8,  0, 2, $0a
	db  8,  8, 2, $0b
; 4102

FacingStepRight0:
FacingStepRight2: ; standing right
	db 4 ; #
	db  0,  8, X_FLIP, $08
	db  0,  0, X_FLIP, $09
	db  8,  8, 2 | X_FLIP, $0a
	db  8,  0, 2 | X_FLIP, $0b
; 4113

FacingStepLeft1:
FacingStepLeft3: ; walking left
	db 4 ; #
	db  0,  0, 0, $88
	db  0,  8, 0, $89
	db  8,  0, 2, $8a
	db  8,  8, 2, $8b
; 4124

FacingStepRight1:
FacingStepRight3: ; walking right
	db 4 ; #
	db  0,  8, X_FLIP, $88
	db  0,  0, X_FLIP, $89
	db  8,  8, 2 | X_FLIP, $8a
	db  8,  0, 2 | X_FLIP, $8b
; 4135

FacingFishDown: ; fishing down
	db 5 ; #
	db  0,  0, 0, $00
	db  0,  8, 0, $01
	db  8,  0, 2, $02
	db  8,  8, 2, $03
	db 16,  0, 4, $fc
; 414a

FacingFishUp: ; fishing up
	db 5 ; #
	db  0,  0, 0, $04
	db  0,  8, 0, $05
	db  8,  0, 2, $06
	db  8,  8, 2, $07
	db -8,  0, 4, $fc
; 415f

FacingFishLeft: ; fishing left
	db 5 ; #
	db  0,  0, 0, $08
	db  0,  8, 0, $09
	db  8,  0, 2, $0a
	db  8,  8, 2, $0b
	db  5, -8, 4 | X_FLIP, $fd
; 4174

FacingFishRight: ; fishing right
	db 5 ; #
	db  0,  8, X_FLIP, $08
	db  0,  0, X_FLIP, $09
	db  8,  8, 2 | X_FLIP, $0a
	db  8,  0, 2 | X_FLIP, $0b
	db  5, 16, 4, $fd
; 4189

FacingEmote: ; emote
	db 4 ; #
	db  0,  0, 4, $f8
	db  0,  8, 4, $f9
	db  8,  0, 4, $fa
	db  8,  8, 4, $fb
; 419a

FacingShadow: ; shadow
	db 2 ; #
	db  0,  0, 4, $fc
	db  0,  8, 4 | X_FLIP, $fc
; 41a3

FacingBigDollSymmetric: ; big snorlax or lapras doll
	db 16 ; #
	db  0,  0, 0, $00
	db  0,  8, 0, $01
	db  8,  0, 0, $02
	db  8,  8, 0, $03
	db 16,  0, 0, $04
	db 16,  8, 0, $05
	db 24,  0, 0, $06
	db 24,  8, 0, $07
	db  0, 24, X_FLIP, $00
	db  0, 16, X_FLIP, $01
	db  8, 24, X_FLIP, $02
	db  8, 16, X_FLIP, $03
	db 16, 24, X_FLIP, $04
	db 16, 16, X_FLIP, $05
	db 24, 24, X_FLIP, $06
	db 24, 16, X_FLIP, $07
; 41e4

FacingWeirdTree1: ; 41e4
	db 4 ; #
	db  0,  0, 0, $04
	db  0,  8, 0, $05
	db  8,  0, 0, $06
	db  8,  8, 0, $07
; 41f5

FacingWeirdTree3: ; 41f5
	db 4 ; #
	db  0,  8, X_FLIP, $04
	db  0,  0, X_FLIP, $05
	db  8,  8, X_FLIP, $06
	db  8,  0, X_FLIP, $07
; 4206

FacingBigDollAsymmetric: ; big doll other than snorlax or lapras
	db 14 ; #
	db  0,  0, 0, $00
	db  0,  8, 0, $01
	db  8,  0, 0, $04
	db  8,  8, 0, $05
	db 16,  8, 0, $07
	db 24,  8, 0, $0a
	db  0, 24, 0, $03
	db  0, 16, 0, $02
	db  8, 24, X_FLIP, $02
	db  8, 16, 0, $06
	db 16, 24, 0, $09
	db 16, 16, 0, $08
	db 24, 24, X_FLIP, $04
	db 24, 16, 0, $0b
; 423f

FacingBoulderDust1: ; boulder dust 1
	db 4 ; #
	db  0,  0, 4, $fe
	db  0,  8, 4, $fe
	db  8,  0, 4, $fe
	db  8,  8, 4, $fe
; 4250

FacingBoulderDust2: ; boulder dust 2
	db 4 ; #
	db  0,  0, 4, $ff
	db  0,  8, 4, $ff
	db  8,  0, 4, $ff
	db  8,  8, 4, $ff
; 4261

FacingGrass1: ; 4261
	db 2 ; #
	db  8,  0, 4, $fe
	db  8,  8, 4 | X_FLIP, $fe
; 426a

FacingGrass2: ; 426a
	db 2 ; #
	db  9, -1, 4, $fe
	db  9,  9, 4 | X_FLIP, $fe
; 4273
