UnknownScript_0xa0b14:
	checkflag ENGINE_BIKE_SHOP_CALL_ENABLED
	iftrue UnknownScript_0xa0b73
	checkcode $a
	if_greater_than $11, UnknownScript_0xa0b4b
	2call UnknownScript_0xa0b32
	2jump UnknownScript_0xa0c0e

UnknownScript_0xa0b26:
	checkflag ENGINE_BIKE_SHOP_CALL_ENABLED
	iftrue UnknownScript_0xa0b73
	2call UnknownScript_0xa0b4f
	2jump UnknownScript_0xa0b77

UnknownScript_0xa0b32:
	checktime $1
	iftrue UnknownScript_0xa0b41
	checktime $2
	iftrue UnknownScript_0xa0b46
	2writetext UnknownText_0xa0d42
	keeptextopen
	end

UnknownScript_0xa0b41:
	2writetext UnknownText_0xa0c28
	keeptextopen
	end

UnknownScript_0xa0b46:
	2writetext UnknownText_0xa0c72
	keeptextopen
	end

UnknownScript_0xa0b4b:
	2writetext UnknownText_0xa0caf
	end

UnknownScript_0xa0b4f:
	checkcode $a
	if_greater_than $11, UnknownScript_0xa0b6e
	checktime $1
	iftrue UnknownScript_0xa0b64
	checktime $2
	iftrue UnknownScript_0xa0b69
	2writetext UnknownText_0xa0e29
	keeptextopen
	end

UnknownScript_0xa0b64:
	2writetext UnknownText_0xa0d96
	keeptextopen
	end

UnknownScript_0xa0b69:
	2writetext UnknownText_0xa0dcf
	keeptextopen
	end

UnknownScript_0xa0b6e:
	2writetext UnknownText_0xa0e01
	keeptextopen
	end

UnknownScript_0xa0b73:
	2writetext UnknownText_0xa0e5e
	end

UnknownScript_0xa0b77:
	checkevent $0044
	iftrue UnknownScript_0xa0b82
	random $b
	2jump UnknownScript_0xa0b84

UnknownScript_0xa0b82:
	random $e

UnknownScript_0xa0b84:
	if_equal $0, UnknownScript_0xa0bbc
	if_equal $1, UnknownScript_0xa0bc2
	if_equal $2, UnknownScript_0xa0bc8
	if_equal $3, UnknownScript_0xa0bce
	if_equal $4, UnknownScript_0xa0bd4
	if_equal $5, UnknownScript_0xa0bda
	if_equal $6, UnknownScript_0xa0be0
	if_equal $7, UnknownScript_0xa0be6
	if_equal $8, UnknownScript_0xa0bec
	if_equal $9, UnknownScript_0xa0bf2
	if_equal $a, UnknownScript_0xa0bf8
	if_equal $b, UnknownScript_0xa0bfe
	if_equal $c, UnknownScript_0xa0c04
	if_equal $d, UnknownScript_0xa0c0a

UnknownScript_0xa0bbc:
	2writetext UnknownText_0xa0efb
	2jump UnknownScript_0xa0c0d

UnknownScript_0xa0bc2:
	2writetext UnknownText_0xa0fcf
	2jump UnknownScript_0xa0c0d

UnknownScript_0xa0bc8:
	2writetext UnknownText_0xa109d
	2jump UnknownScript_0xa0c0d

UnknownScript_0xa0bce:
	2writetext UnknownText_0xa1143
	2jump UnknownScript_0xa0c0d

UnknownScript_0xa0bd4:
	2writetext UnknownText_0xa1244
	2jump UnknownScript_0xa0c0d

UnknownScript_0xa0bda:
	2writetext UnknownText_0xa1318
	2jump UnknownScript_0xa0c0d

UnknownScript_0xa0be0:
	2writetext UnknownText_0xa13d8
	2jump UnknownScript_0xa0c0d

UnknownScript_0xa0be6:
	2writetext UnknownText_0xa1488
	2jump UnknownScript_0xa0c0d

UnknownScript_0xa0bec:
	2writetext UnknownText_0xa15de
	2jump UnknownScript_0xa0c0d

UnknownScript_0xa0bf2:
	2writetext UnknownText_0xa1717
	2jump UnknownScript_0xa0c0d

UnknownScript_0xa0bf8:
	2writetext UnknownText_0xa183d
	2jump UnknownScript_0xa0c0d

UnknownScript_0xa0bfe:
	2writetext UnknownText_0xa19b1
	2jump UnknownScript_0xa0c0d

UnknownScript_0xa0c04:
	2writetext UnknownText_0xa1ac0
	2jump UnknownScript_0xa0c0d

UnknownScript_0xa0c0a:
	2writetext UnknownText_0xa1bed

UnknownScript_0xa0c0d:
	end

UnknownScript_0xa0c0e:
	random $3
	if_equal $0, UnknownScript_0xa0c1c
	if_equal $1, UnknownScript_0xa0c20
	if_equal $2, UnknownScript_0xa0c24

UnknownScript_0xa0c1c:
	2writetext UnknownText_0xa1c88
	end

UnknownScript_0xa0c20:
	2writetext UnknownText_0xa1d5f
	end

UnknownScript_0xa0c24:
	2writetext UnknownText_0xa1e2f
	end
; a0c28
