person_event: macro
	db \1 ; sprite
	db \2 ; y
	db \3 ; x
	db \4 ; facing
	db \5 ; movement
	db \6 ; clock_hour
	db \7 ; clock_daytime
	db \8 ; color_function
	db \9 ; sight_range
	shift
	dw \9 ; pointer
	shift
	dw \9 ; event flag
	endm

signpost: macro
	db \1 ; y
	db \2 ; x
	db \3 ; function
	dw \4 ; pointer
	endm

xy_trigger: macro
	db \1 ; number
	db \2 ; y
	db \3 ; x
	db \4 ; unknown1
	dw \5 ; script
	db \6 ; unknown2
	db \7 ; unknown3
	endm

warp_def: macro
	db \1 ; y
	db \2 ; x
	db \3 ; warp_to
	db \4 ; map group
	db \5 ; map number
	endm
