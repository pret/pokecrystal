SECTION "home/call_regs.asm", ROM0

; Register aliases

_hl_::
	jp hl

_de_::
	push de
	ret
