TownMap_ConvertLineBreakCharacters: ; 1de2c5
	ld hl, wStringBuffer1
.loop
	ld a, [hl]
	cp "@"
	jr z, .end
	cp "%"
	jr z, .line_break
	cp "¯"
	jr z, .line_break
	inc hl
	jr .loop

.line_break
	ld [hl], "<LNBRK>"

.end
	ld de, wStringBuffer1
	hlcoord 9, 0
	call PlaceString
	ret
