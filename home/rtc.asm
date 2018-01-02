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
	callfar _TimeOfDayPals
	ret
; 485

Special_UpdateTimePals:: ; 485
	callfar _Special_UpdateTimePals
	ret
; 48c
