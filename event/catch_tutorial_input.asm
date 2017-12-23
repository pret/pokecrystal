_DudeAutoInput_A:: ; 1de28a
	ld hl, DudeAutoInput_A
	jr _DudeAutoInput

_DudeAutoInput_RightA: ; 1de28f
	ld hl, DudeAutoInput_RightA
	jr _DudeAutoInput

_DudeAutoInput_DownA: ; 1de294
	ld hl, DudeAutoInput_DownA
	jr _DudeAutoInput

_DudeAutoInput: ; 1de299
	ld a, BANK(DudeAutoInputs)
	call StartAutoInput
	ret

DudeAutoInputs:

DudeAutoInput_A: ; 1de29f
	db NO_INPUT, $50
	db A_BUTTON, $00
	db NO_INPUT, $ff ; end

DudeAutoInput_RightA: ; 1de2a5
	db NO_INPUT, $08
	db D_RIGHT,  $00
	db NO_INPUT, $08
	db A_BUTTON, $00
	db NO_INPUT, $ff ; end

DudeAutoInput_DownA: ; 1de2af
	db NO_INPUT, $fe
	db NO_INPUT, $fe
	db NO_INPUT, $fe
	db NO_INPUT, $fe
	db D_DOWN,   $00
	db NO_INPUT, $fe
	db NO_INPUT, $fe
	db NO_INPUT, $fe
	db NO_INPUT, $fe
	db A_BUTTON, $00
	db NO_INPUT, $ff ; end
