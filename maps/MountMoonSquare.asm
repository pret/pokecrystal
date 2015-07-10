MountMoonSquare_MapScriptHeader:
	; trigger count
	db 1

	; triggers
	dw UnknownScript_0x77092, $0000

	; callback count
	db 2

	; callbacks

	dbw 5, UnknownScript_0x77093

	dbw 2, UnknownScript_0x77097

UnknownScript_0x77092:
	end

UnknownScript_0x77093:
	setevent $00ec
	return

UnknownScript_0x77097:
	disappear $4
	return

UnknownScript_0x7709a:
	checkflag ENGINE_MT_MOON_SQUARE_CLEFAIRY
	iftrue UnknownScript_0x77117
	checkcode VAR_WEEKDAY
	if_not_equal MONDAY, UnknownScript_0x77117
	checknite
	iffalse UnknownScript_0x77117
	appear $2
	appear $3
	applymovement $0, MovementData_0x77121
	pause 15
	appear $4
	spriteface $2, RIGHT
	cry CLEFAIRY
	waitbutton
	pause 30
	follow $2, $3
	cry CLEFAIRY
	applymovement $2, MovementData_0x77123
	cry CLEFAIRY
	applymovement $2, MovementData_0x77126
	cry CLEFAIRY
	applymovement $2, MovementData_0x77128
	cry CLEFAIRY
	applymovement $2, MovementData_0x7712b
	cry CLEFAIRY
	applymovement $2, MovementData_0x7712d
	stopfollow
	applymovement $3, MovementData_0x77130
	follow $2, $3
	applymovement $2, MovementData_0x77132
	stopfollow
	spriteface $2, DOWN
	pause 10
	showemote $0, $2, 15
	spriteface $2, DOWN
	cry CLEFAIRY
	pause 15
	follow $2, $3
	applymovement $2, MovementData_0x77134
	disappear $2
	disappear $3
	stopfollow
	clearevent $00ec
	setflag ENGINE_MT_MOON_SQUARE_CLEFAIRY
	end

UnknownScript_0x77117:
	end

MapMountMoonSquareSignpostItem0:
	dw $00ec
	db MOON_STONE
	

MapMountMoonSquareSignpost1Script:
	jumptext UnknownText_0x7713b

MtMoonSquareRock:
	jumpstd smashrock

MovementData_0x77121:
	step_up
	step_end

MovementData_0x77123:
	slow_step_down
	slow_jump_step_down
	step_end

MovementData_0x77126:
	slow_jump_step_right
	step_end

MovementData_0x77128:
	slow_step_up
	slow_jump_step_up
	step_end

MovementData_0x7712b:
	slow_jump_step_left
	step_end

MovementData_0x7712d:
	slow_step_down
	slow_jump_step_down
	step_end

MovementData_0x77130:
	slow_step_down
	step_end

MovementData_0x77132:
	slow_step_right
	step_end

MovementData_0x77134:
	step_right
	step_right
	step_right
	jump_step_right
	step_right
	step_right
	step_end

UnknownText_0x7713b:
	text "MT.MOON SQUARE"
	line "DON'T LITTER"
	done

MountMoonSquare_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $5, $14, 5, GROUP_MOUNT_MOON, MAP_MOUNT_MOON
	warp_def $b, $16, 6, GROUP_MOUNT_MOON, MAP_MOUNT_MOON
	warp_def $7, $d, 1, GROUP_MOUNT_MOON_GIFT_SHOP, MAP_MOUNT_MOON_GIFT_SHOP

	; xy triggers
	db 1
	xy_trigger 0, $b, $7, $0, UnknownScript_0x7709a, $0, $0

	; signposts
	db 2
	signpost 7, 7, $7, MapMountMoonSquareSignpostItem0
	signpost 7, 17, $0, MapMountMoonSquareSignpost1Script

	; people-events
	db 3
	person_event SPRITE_FAIRY, 10, 10, $6, $0, 255, 255, $0, 0, ObjectEvent, $0779
	person_event SPRITE_FAIRY, 10, 11, $6, $0, 255, 255, $0, 0, ObjectEvent, $0779
	person_event SPRITE_ROCK, 11, 11, $18, $0, 255, 255, $0, 0, MtMoonSquareRock, $0778
