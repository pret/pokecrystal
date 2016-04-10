RTC:: ; 46f
; update time and time-sensitive palettes

; rtc enabled?
	ld a, [wSpriteUpdatesEnabled]
	cp 0
	ret z

	call UpdateTime

; obj update on?
	ld a, [VramState]
	bit 0, a ; obj update
	ret z

TimeOfDayPals:: ; 47e
	callab _TimeOfDayPals
	ret
; 485

UpdateTimePals:: ; 485
	callab _UpdateTimePals
	ret
; 48c
