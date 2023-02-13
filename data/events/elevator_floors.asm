ElevatorFloorNames:
; entries correspond to FLOOR_* constants
	table_width 2, ElevatorFloorNames
	dw .B4F
	dw .B3F
	dw .B2F
	dw .B1F
	dw ._1F
	dw ._2F
	dw ._3F
	dw ._4F
	dw ._5F
	dw ._6F
	dw ._7F
	dw ._8F
	dw ._9F
	dw ._10F
	dw ._11F
	dw .ROOF
	assert_table_length NUM_FLOORS

.B4F:  db "4 SS@"
.B3F:  db "3 SS@"
.B2F:  db "2 SS@"
.B1F:  db "1 SS@"
._1F:  db "RDC@"
._2F:  db "1ER@"
._3F:  db "2EME@"
._4F:  db "3EME@"
._5F:  db "4EME@"
._6F:  db "5EME@"
._7F:  db "6EME@"
._8F:  db "7EME@"
._9F:  db "8EME@"
._10F: db "9EME@"
._11F: db "10EME@"
.ROOF: db "TOIT@"
