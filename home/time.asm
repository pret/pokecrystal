; Functions relating to the timer interrupt and the real-time-clock.

Timer:: ; unreferenced
	push af
	ldh a, [hMobile]
	and a
	jr z, .not_mobile
	call MobileTimer

.not_mobile
	pop af
	reti

LatchClock::
; latch clock counter data
	ld a, 0
	ld [rRTCLATCH], a
	ld a, 1
	ld [rRTCLATCH], a
	ret

UpdateTime::
	call GetClock
	call FixDays
	call FixTime
	farcall GetTimeOfDay
	ret

GetClock::
; store clock data in hRTCDayHi-hRTCSeconds

; enable clock r/w
	ld a, RAMG_SRAM_ENABLE
	ld [rRAMG], a

; clock data is 'backwards' in hram

	call LatchClock
	ld hl, rRAMB
	ld de, rRTCREG

	ld [hl], RAMB_RTC_S
	ld a, [de]
	maskbits 60
	ldh [hRTCSeconds], a

	ld [hl], RAMB_RTC_M
	ld a, [de]
	maskbits 60
	ldh [hRTCMinutes], a

	ld [hl], RAMB_RTC_H
	ld a, [de]
	maskbits 24
	ldh [hRTCHours], a

	ld [hl], RAMB_RTC_DL
	ld a, [de]
	ldh [hRTCDayLo], a

	ld [hl], RAMB_RTC_DH
	ld a, [de]
	ldh [hRTCDayHi], a

; unlatch clock / disable clock r/w
	call CloseSRAM
	ret

FixDays::
; fix day count
; mod by 140

; check if day count > 255 (bit 8 set)
	ldh a, [hRTCDayHi] ; DH
	bit B_RAMB_RTC_DH_HIGH, a
	jr z, .daylo
; reset dh (bit 8)
	res B_RAMB_RTC_DH_HIGH, a
	ldh [hRTCDayHi], a

; mod 140
; mod twice since bit 8 (DH) was set
	ldh a, [hRTCDayLo]
.modh
	sub 140
	jr nc, .modh
.modl
	sub 140
	jr nc, .modl
	add 140

; update dl
	ldh [hRTCDayLo], a

; flag for sRTCStatusFlags
	ld a, RTC_DAYS_EXCEED_255
	jr .set

.daylo
; quit if fewer than 140 days have passed
	ldh a, [hRTCDayLo]
	cp 140
	jr c, .quit

; mod 140
.mod
	sub 140
	jr nc, .mod
	add 140

; update dl
	ldh [hRTCDayLo], a

; flag for sRTCStatusFlags
	ld a, RTC_DAYS_EXCEED_139

.set
; update clock with modded day value
	push af
	call SetClock
	pop af
	scf
	ret

.quit
	xor a
	ret

FixTime::
; add ingame time (set at newgame) to current time
; store time in wCurDay, hHours, hMinutes, hSeconds

; second
	ldh a, [hRTCSeconds]
	ld c, a
	ld a, [wStartSecond]
	add c
	sub 60
	jr nc, .updatesec
	add 60
.updatesec
	ldh [hSeconds], a

; minute
	ccf ; carry is set, so turn it off
	ldh a, [hRTCMinutes]
	ld c, a
	ld a, [wStartMinute]
	adc c
	sub 60
	jr nc, .updatemin
	add 60
.updatemin
	ldh [hMinutes], a

; hour
	ccf ; carry is set, so turn it off
	ldh a, [hRTCHours]
	ld c, a
	ld a, [wStartHour]
	adc c
	sub 24
	jr nc, .updatehr
	add 24
.updatehr
	ldh [hHours], a

; day
	ccf ; carry is set, so turn it off
	ldh a, [hRTCDayLo]
	ld c, a
	ld a, [wStartDay]
	adc c
	ld [wCurDay], a
	ret

InitTimeOfDay::
	xor a
	ld [wStringBuffer2], a
	ld a, 0 ; useless
	ld [wStringBuffer2 + 3], a
	jr InitTime

InitDayOfWeek::
	call UpdateTime
	ldh a, [hHours]
	ld [wStringBuffer2 + 1], a
	ldh a, [hMinutes]
	ld [wStringBuffer2 + 2], a
	ldh a, [hSeconds]
	ld [wStringBuffer2 + 3], a
	jr InitTime ; useless

InitTime::
	farcall _InitTime
	ret

ClearClock::
	call .ClearhRTC
	call SetClock
	ret

.ClearhRTC:
	xor a
	ldh [hRTCSeconds], a
	ldh [hRTCMinutes], a
	ldh [hRTCHours], a
	ldh [hRTCDayLo], a
	ldh [hRTCDayHi], a
	ret

SetClock::
; set clock data from hram

; enable clock r/w
	ld a, RAMG_SRAM_ENABLE
	ld [rRAMG], a

; set clock data
; stored 'backwards' in hram

	call LatchClock
	ld hl, rRAMB
	ld de, rRTCREG

; seems to be a halt check that got partially commented out
; this block is totally pointless
	ld [hl], RAMB_RTC_DH
	ld a, [de]
	bit B_RAMB_RTC_DH_HALT, a
	ld [de], a

; seconds
	ld [hl], RAMB_RTC_S
	ldh a, [hRTCSeconds]
	ld [de], a
; minutes
	ld [hl], RAMB_RTC_M
	ldh a, [hRTCMinutes]
	ld [de], a
; hours
	ld [hl], RAMB_RTC_H
	ldh a, [hRTCHours]
	ld [de], a
; day lo
	ld [hl], RAMB_RTC_DL
	ldh a, [hRTCDayLo]
	ld [de], a
; day hi
	ld [hl], RAMB_RTC_DH
	ldh a, [hRTCDayHi]
	res B_RAMB_RTC_DH_HALT, a ; make sure timer is active
	ld [de], a

; cleanup
	call CloseSRAM ; unlatch clock, disable clock r/w
	ret

ClearRTCStatus:: ; unreferenced
; clear sRTCStatusFlags
	xor a
	push af
	ld a, BANK(sRTCStatusFlags)
	call OpenSRAM
	pop af
	ld [sRTCStatusFlags], a
	call CloseSRAM
	ret

RecordRTCStatus::
; append flags to sRTCStatusFlags
	ld hl, sRTCStatusFlags
	push af
	ld a, BANK(sRTCStatusFlags)
	call OpenSRAM
	pop af
	or [hl]
	ld [hl], a
	call CloseSRAM
	ret

CheckRTCStatus::
; check sRTCStatusFlags
	ld a, BANK(sRTCStatusFlags)
	call OpenSRAM
	ld a, [sRTCStatusFlags]
	call CloseSRAM
	ret
