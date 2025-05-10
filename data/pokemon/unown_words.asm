MACRO unownword
for n, CHARLEN(\1)
	db STRCHAR(\1, n) - "A" + FIRST_UNOWN_CHAR
endr
	db -1
ENDM

UnownWords:
; entries correspond to UNOWN_* form constants
	table_width 2
	dw UnownWordA ; unused
	dw UnownWordA
	dw UnownWordB
	dw UnownWordC
	dw UnownWordD
	dw UnownWordE
	dw UnownWordF
	dw UnownWordG
	dw UnownWordH
	dw UnownWordI
	dw UnownWordJ
	dw UnownWordK
	dw UnownWordL
	dw UnownWordM
	dw UnownWordN
	dw UnownWordO
	dw UnownWordP
	dw UnownWordQ
	dw UnownWordR
	dw UnownWordS
	dw UnownWordT
	dw UnownWordU
	dw UnownWordV
	dw UnownWordW
	dw UnownWordX
	dw UnownWordY
	dw UnownWordZ
	assert_table_length NUM_UNOWN + 1

UnownWordA: unownword "ANGRY"
UnownWordB: unownword "BEAR"
UnownWordC: unownword "CHASE"
UnownWordD: unownword "DIRECT"
UnownWordE: unownword "ENGAGE"
UnownWordF: unownword "FIND"
UnownWordG: unownword "GIVE"
UnownWordH: unownword "HELP"
UnownWordI: unownword "INCREASE"
UnownWordJ: unownword "JOIN"
UnownWordK: unownword "KEEP"
UnownWordL: unownword "LAUGH"
UnownWordM: unownword "MAKE"
UnownWordN: unownword "NUZZLE"
UnownWordO: unownword "OBSERVE"
UnownWordP: unownword "PERFORM"
UnownWordQ: unownword "QUICKEN"
UnownWordR: unownword "REASSURE"
UnownWordS: unownword "SEARCH"
UnownWordT: unownword "TELL"
UnownWordU: unownword "UNDO"
UnownWordV: unownword "VANISH"
UnownWordW: unownword "WANT"
UnownWordX: unownword "XXXXX"
UnownWordY: unownword "YIELD"
UnownWordZ: unownword "ZOOM"
