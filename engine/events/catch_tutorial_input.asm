_DudeAutoInput_A::
	ld hl, DudeAutoInput_A
	jr _DudeAutoInput

_DudeAutoInput_RightA:
	ld hl, DudeAutoInput_RightA
	jr _DudeAutoInput

_DudeAutoInput_DownA:
	ld hl, DudeAutoInput_DownA
	jr _DudeAutoInput

_DudeAutoInput:
	ld a, BANK(DudeAutoInputs)
	call StartAutoInput
	ret

DudeAutoInputs: ; used only for BANK(DudeAutoInputs)

DudeAutoInput_A:
	db NO_INPUT, $50
	db PAD_A, $00
	db NO_INPUT, $ff ; end

DudeAutoInput_RightA:
	db NO_INPUT, $08
	db PAD_RIGHT,  $00
	db NO_INPUT, $08
	db PAD_A, $00
	db NO_INPUT, $ff ; end

DudeAutoInput_DownA:
	db NO_INPUT, $fe
	db NO_INPUT, $fe
	db NO_INPUT, $fe
	db NO_INPUT, $fe
	db PAD_DOWN,   $00
	db NO_INPUT, $fe
	db NO_INPUT, $fe
	db NO_INPUT, $fe
	db NO_INPUT, $fe
	db PAD_A, $00
	db NO_INPUT, $ff ; end
