UnknownScript_0xa0b14:
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue UnknownScript_0xa0b73
	checkcode VAR_HOUR
	if_greater_than 17, UnknownScript_0xa0b4b
	scall UnknownScript_0xa0b32
	jump UnknownScript_0xa0c0e

UnknownScript_0xa0b26:
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue UnknownScript_0xa0b73
	scall UnknownScript_0xa0b4f
	jump UnknownScript_0xa0b77

UnknownScript_0xa0b32:
	checkmorn
	iftrue UnknownScript_0xa0b41
	checkday
	iftrue UnknownScript_0xa0b46
	writetext UnknownText_0xa0d42
	keeptextopen
	end

UnknownScript_0xa0b41:
	writetext UnknownText_0xa0c28
	keeptextopen
	end

UnknownScript_0xa0b46:
	writetext UnknownText_0xa0c72
	keeptextopen
	end

UnknownScript_0xa0b4b:
	writetext UnknownText_0xa0caf
	end

UnknownScript_0xa0b4f:
	checkcode VAR_HOUR
	if_greater_than 17, UnknownScript_0xa0b6e
	checkmorn
	iftrue UnknownScript_0xa0b64
	checkday
	iftrue UnknownScript_0xa0b69
	writetext UnknownText_0xa0e29
	keeptextopen
	end

UnknownScript_0xa0b64:
	writetext UnknownText_0xa0d96
	keeptextopen
	end

UnknownScript_0xa0b69:
	writetext UnknownText_0xa0dcf
	keeptextopen
	end

UnknownScript_0xa0b6e:
	writetext UnknownText_0xa0e01
	keeptextopen
	end

UnknownScript_0xa0b73:
	writetext UnknownText_0xa0e5e
	end

UnknownScript_0xa0b77:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue UnknownScript_0xa0b82
	random 11
	jump UnknownScript_0xa0b84

UnknownScript_0xa0b82:
	random 14

UnknownScript_0xa0b84:
	if_equal 0, UnknownScript_0xa0bbc
	if_equal 1, UnknownScript_0xa0bc2
	if_equal 2, UnknownScript_0xa0bc8
	if_equal 3, UnknownScript_0xa0bce
	if_equal 4, UnknownScript_0xa0bd4
	if_equal 5, UnknownScript_0xa0bda
	if_equal 6, UnknownScript_0xa0be0
	if_equal 7, UnknownScript_0xa0be6
	if_equal 8, UnknownScript_0xa0bec
	if_equal 9, UnknownScript_0xa0bf2
	if_equal 10, UnknownScript_0xa0bf8
	if_equal 11, UnknownScript_0xa0bfe
	if_equal 12, UnknownScript_0xa0c04
	if_equal 13, UnknownScript_0xa0c0a

UnknownScript_0xa0bbc:
	writetext UnknownText_0xa0efb
	jump UnknownScript_0xa0c0d

UnknownScript_0xa0bc2:
	writetext UnknownText_0xa0fcf
	jump UnknownScript_0xa0c0d

UnknownScript_0xa0bc8:
	writetext UnknownText_0xa109d
	jump UnknownScript_0xa0c0d

UnknownScript_0xa0bce:
	writetext UnknownText_0xa1143
	jump UnknownScript_0xa0c0d

UnknownScript_0xa0bd4:
	writetext UnknownText_0xa1244
	jump UnknownScript_0xa0c0d

UnknownScript_0xa0bda:
	writetext UnknownText_0xa1318
	jump UnknownScript_0xa0c0d

UnknownScript_0xa0be0:
	writetext UnknownText_0xa13d8
	jump UnknownScript_0xa0c0d

UnknownScript_0xa0be6:
	writetext UnknownText_0xa1488
	jump UnknownScript_0xa0c0d

UnknownScript_0xa0bec:
	writetext UnknownText_0xa15de
	jump UnknownScript_0xa0c0d

UnknownScript_0xa0bf2:
	writetext UnknownText_0xa1717
	jump UnknownScript_0xa0c0d

UnknownScript_0xa0bf8:
	writetext UnknownText_0xa183d
	jump UnknownScript_0xa0c0d

UnknownScript_0xa0bfe:
	writetext UnknownText_0xa19b1
	jump UnknownScript_0xa0c0d

UnknownScript_0xa0c04:
	writetext UnknownText_0xa1ac0
	jump UnknownScript_0xa0c0d

UnknownScript_0xa0c0a:
	writetext UnknownText_0xa1bed

UnknownScript_0xa0c0d:
	end

UnknownScript_0xa0c0e:
	random 3
	if_equal 0, UnknownScript_0xa0c1c
	if_equal 1, UnknownScript_0xa0c20
	if_equal 2, UnknownScript_0xa0c24

UnknownScript_0xa0c1c:
	writetext UnknownText_0xa1c88
	end

UnknownScript_0xa0c20:
	writetext UnknownText_0xa1d5f
	end

UnknownScript_0xa0c24:
	writetext UnknownText_0xa1e2f
	end
; a0c28
