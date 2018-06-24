GetPartyParamLocation::
; Get the location of parameter a from wCurPartyMon in hl
	push bc
	ld hl, wPartyMons
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [wCurPartyMon]
	call GetPartyLocation
	pop bc
	ret

GetPartyLocation::
; Add the length of a PartyMon struct to hl a times.
	ld bc, PARTYMON_STRUCT_LENGTH
	jp AddNTimes

Unreferenced_GetDexNumber::
; Probably used in gen 1 to convert index number to dex number
; Not required in gen 2 because index number == dex number
	push hl
	ld a, b
	dec a
	ld b, 0
	add hl, bc
	ld hl, BaseData + BASE_DEX_NO
	ld bc, BASE_DATA_SIZE
	call AddNTimes
	ld a, BANK(BaseData)
	call GetFarHalfword
	ld b, l
	ld c, h
	pop hl
	ret
