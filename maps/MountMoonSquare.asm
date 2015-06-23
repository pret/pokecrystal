MountMoonSquare_MapScriptHeader: ; 0x77086
	; trigger count
	db 1

	; triggers
	dw UnknownScript_0x77092, $0000

	; callback count
	db 2

	; callbacks

	dbw 5, UnknownScript_0x77093

	dbw 2, UnknownScript_0x77097
; 0x77092

UnknownScript_0x77092: ; 0x77092
	end
; 0x77093

UnknownScript_0x77093: ; 0x77093
	setevent $00ec
	return
; 0x77097

UnknownScript_0x77097: ; 0x77097
	disappear $4
	return
; 0x7709a

UnknownScript_0x7709a: ; 0x7709a
	checkflag $0058
	iftrue UnknownScript_0x77117
	checkcode $b
	if_not_equal MONDAY, UnknownScript_0x77117
	checknite
	iffalse UnknownScript_0x77117
	appear $2
	appear $3
	applymovement $0, MovementData_0x77121
	pause 15
	appear $4
	spriteface $2, $3
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
	spriteface $2, $0
	pause 10
	showemote $0, $2, 15
	spriteface $2, $0
	cry CLEFAIRY
	pause 15
	follow $2, $3
	applymovement $2, MovementData_0x77134
	disappear $2
	disappear $3
	stopfollow
	clearevent $00ec
	setflag $0058
	end
; 0x77117

UnknownScript_0x77117: ; 0x77117
	end
; 0x77118

MapMountMoonSquareSignpostItem0: ; 0x77118
	dw $00ec
	db MOON_STONE
	
; 0x7711b

MapMountMoonSquareSignpost1Script: ; 0x7711b
	jumptext UnknownText_0x7713b
; 0x7711e

RockScript_0x7711e: ; 0x7711e
	jumpstd $000f
; 0x77121

MovementData_0x77121: ; 0x77121
	step_up
	step_end
; 0x77123

MovementData_0x77123: ; 0x77123
	slow_step_down
	slow_jump_step_down
	step_end
; 0x77126

MovementData_0x77126: ; 0x77126
	slow_jump_step_right
	step_end
; 0x77128

MovementData_0x77128: ; 0x77128
	slow_step_up
	slow_jump_step_up
	step_end
; 0x7712b

MovementData_0x7712b: ; 0x7712b
	slow_jump_step_left
	step_end
; 0x7712d

MovementData_0x7712d: ; 0x7712d
	slow_step_down
	slow_jump_step_down
	step_end
; 0x77130

MovementData_0x77130: ; 0x77130
	slow_step_down
	step_end
; 0x77132

MovementData_0x77132: ; 0x77132
	slow_step_right
	step_end
; 0x77134

MovementData_0x77134: ; 0x77134
	step_right
	step_right
	step_right
	jump_step_right
	step_right
	step_right
	step_end
; 0x7713b

UnknownText_0x7713b: ; 0x7713b
	text "MT.MOON SQUARE"
	line "DON'T LITTER"
	done
; 0x77158

MountMoonSquare_MapEventHeader: ; 0x77158
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
	person_event SPRITE_ROCK, 11, 11, $18, $0, 255, 255, $0, 0, RockScript_0x7711e, $0778
; 0x771a6
