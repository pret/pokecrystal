UpdateTimeAndPals::
; update time and time-sensitive palettes

; rtc enabled?
	ld a, [wSpriteUpdatesEnabled]
	cp FALSE
	ret z

	call UpdateTime

; obj update on?
	ld a, [wStateFlags]
	bit SPRITE_UPDATES_DISABLED_F, a ; obj update
	ret z

TimeOfDayPals::
	callfar _TimeOfDayPals
	ret

UpdateTimePals::
	callfar _UpdateTimePals
	ret
