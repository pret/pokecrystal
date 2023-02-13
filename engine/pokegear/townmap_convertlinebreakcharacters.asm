TownMap_ConvertLineBreakCharacters:
	ld hl, wStringBuffer1
.loop
	ld a, [hl]
	cp "@"
	jr z, .end
	cp "%"
	jr z, .line_feed
	cp "¯"
	jr z, .line_feed
	cp "<1E>"
	jr z, .dash_line_end
	inc hl
	jr .loop

.dash_line_end
	ld [hl], "<1D>"
	jr .end

.line_feed
	ld [hl], "<LF>"

.end
	ld de, wStringBuffer1
	hlcoord 9, 0
	call PlaceString
	ret
