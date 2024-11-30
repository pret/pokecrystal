; joypad buttons
	const_def
	shift_const A_BUTTON ; 0
	shift_const B_BUTTON ; 1
	shift_const SELECT   ; 2
	shift_const START    ; 3
	shift_const D_RIGHT  ; 4
	shift_const D_LEFT   ; 5
	shift_const D_UP     ; 6
	shift_const D_DOWN   ; 7

DEF NO_INPUT EQU %00000000

DEF BUTTONS EQU A_BUTTON | B_BUTTON | SELECT | START
DEF D_PAD   EQU D_RIGHT | D_LEFT | D_UP | D_DOWN
