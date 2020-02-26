SECTION "home/call_regs", ROM0

; Register aliases

_hl_::
	jp hl

_de_::
	push de
	ret
