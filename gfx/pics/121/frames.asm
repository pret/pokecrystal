	dw .frame1
	dw .frame2
	dw .frame3
.frame4
	db $f4, $5a, $f5, $5a
.frame1
	db $00 ; bitmask
	db $24, $25, $26, $27, $00, $28, $29, $2a, $2b, $2c, $2d, $2e
	db $2f, $00, $30, $31, $32, $00, $33, $34, $35, $33
.frame2
	db $01 ; bitmask
	db $36
.frame3
	db $02 ; bitmask
	db $37
	db $03, $03 ; unused
; 0xd5af4
