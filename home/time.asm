; Functions relating to the timer interrupt and the real-time-clock.


AskTimer:: ; 591
	push af
	ld a, [hMobile]
	and a
	jr z, .not_mobile
	call Timer

.not_mobile
	pop af
	reti
; 59c


LatchClock:: ; 59c
; latch clock counter data
	ld a, 0
	ld [MBC3LatchClock], a
	ld a, 1
	ld [MBC3LatchClock], a
	ret
; 5a7


UpdateTime:: ; 5a7
	call GetClock
	call FixDays
	call FixTime
	callba GetTimeOfDay
	ret
; 5b7


GetClock:: ; 5b7
; store clock data in hRTCDayHi-hRTCSeconds

; enable clock r/w
	ld a, SRAM_ENABLE
	ld [MBC3SRamEnable], a

; clock data is 'backwards' in hram

	call LatchClock
	ld hl, MBC3SRamBank
	ld de, MBC3RTC

	ld [hl], RTC_S
	ld a, [de]
	maskbits 60
	and x
	ld [hRTCSeconds], a

	ld [hl], RTC_M
	ld a, [de]
	maskbits 60
	and x
	ld [hRTCMinutes], a

	ld [hl], RTC_H
	ld a, [de]
	maskbits 24
	and x
	ld [hRTCHours], a

	ld [hl], RTC_DL
	ld a, [de]
	ld [hRTCDayLo], a

	ld [hl], RTC_DH
	ld a, [de]
	ld [hRTCDayHi], a

; unlatch clock / disable clock r/w
	call CloseSRAM
	ret
; 5e8


FixDays:: ; 5e8
; fix day count
; mod by 140

; check if day count > 255 (bit 8 set)
	ld a, [hRTCDayHi] ; DH
	bit 0, a
	jr z, .daylo
; reset dh (bit 8)
	res 0, a
	ld [hRTCDayHi], a ; DH

; mod 140
; mod twice since bit 8 (DH) was set
	ld a, [hRTCDayLo] ; DL
.modh
	sub 140
	jr nc, .modh
.modl
	sub 140
	jr nc, .modl
	add 140

; update dl
	ld [hRTCDayLo], a ; DL

; flag for sRTCStatusFlags
	ld a, %01000000
	jr .set

.daylo
; quit if fewer than 140 days have passed
	ld a, [hRTCDayLo] ; DL
	cp 140
	jr c, .quit

; mod 140
.mod
	sub 140
	jr nc, .mod
	add 140

; update dl
	ld [hRTCDayLo], a ; DL

; flag for sRTCStatusFlags
	ld a, %00100000

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
; 61d


FixTime:: ; 61d
; add ingame time (set at newgame) to current time
;				  day     hr    min    sec
; store time in CurDay, hHours, hMinutes, hSeconds

; second
	ld a, [hRTCSeconds] ; S
	ld c, a
	ld a, [StartSecond]
	add c
	sub 60
	jr nc, .updatesec
	add 60
.updatesec
	ld [hSeconds], a

; minute
	ccf ; carry is set, so turn it off
	ld a, [hRTCMinutes] ; M
	ld c, a
	ld a, [StartMinute]
	adc c
	sub 60
	jr nc, .updatemin
	add 60
.updatemin
	ld [hMinutes], a

; hour
	ccf ; carry is set, so turn it off
	ld a, [hRTCHours] ; H
	ld c, a
	ld a, [StartHour]
	adc c
	sub 24
	jr nc, .updatehr
	add 24
.updatehr
	ld [hHours], a

; day
	ccf ; carry is set, so turn it off
	ld a, [hRTCDayLo] ; DL
	ld c, a
	ld a, [StartDay]
	adc c
	ld [CurDay], a
	ret
; 658

SetTimeOfDay:: ; 658
	xor a
	ld [StringBuffer2], a
	ld a, $0 ; useless
	ld [StringBuffer2 + 3], a
	jr InitTime

SetDayOfWeek:: ; 663
	call UpdateTime
	ld a, [hHours]
	ld [StringBuffer2 + 1], a
	ld a, [hMinutes]
	ld [StringBuffer2 + 2], a
	ld a, [hSeconds]
	ld [StringBuffer2 + 3], a
	jr InitTime ; useless

InitTime:: ; 677
	callba _InitTime
	ret
; 67e



PanicResetClock:: ; 67e
	call .ClearhRTC
	call SetClock
	ret
; 685

.ClearhRTC: ; 685
	xor a
	ld [hRTCSeconds], a
	ld [hRTCMinutes], a
	ld [hRTCHours], a
	ld [hRTCDayLo], a
	ld [hRTCDayHi], a
	ret
; 691


SetClock:: ; 691
; set clock data from hram

; enable clock r/w
	ld a, SRAM_ENABLE
	ld [MBC3SRamEnable], a

; set clock data
; stored 'backwards' in hram

	call LatchClock
	ld hl, MBC3SRamBank
	ld de, MBC3RTC

; seems to be a halt check that got partially commented out
; this block is totally pointless
	ld [hl], RTC_DH
	ld a, [de]
	bit 6, a ; halt
	ld [de], a

; seconds
	ld [hl], RTC_S
	ld a, [hRTCSeconds]
	ld [de], a
; minutes
	ld [hl], RTC_M
	ld a, [hRTCMinutes]
	ld [de], a
; hours
	ld [hl], RTC_H
	ld a, [hRTCHours]
	ld [de], a
; day lo
	ld [hl], RTC_DL
	ld a, [hRTCDayLo]
	ld [de], a
; day hi
	ld [hl], RTC_DH
	ld a, [hRTCDayHi]
	res 6, a ; make sure timer is active
	ld [de], a

; cleanup
	call CloseSRAM ; unlatch clock, disable clock r/w
	ret
; 6c4


ClearRTCStatus:: ; 6c4
; clear sRTCStatusFlags
	xor a
	push af
	ld a, BANK(sRTCStatusFlags)
	call GetSRAMBank
	pop af
	ld [sRTCStatusFlags], a
	call CloseSRAM
	ret
; 6d3

RecordRTCStatus:: ; 6d3
; append flags to sRTCStatusFlags
	ld hl, sRTCStatusFlags
	push af
	ld a, BANK(sRTCStatusFlags)
	call GetSRAMBank
	pop af
	or [hl]
	ld [hl], a
	call CloseSRAM
	ret
; 6e3

CheckRTCStatus:: ; 6e3
; check sRTCStatusFlags
	ld a, BANK(sRTCStatusFlags)
	call GetSRAMBank
	ld a, [sRTCStatusFlags]
	call CloseSRAM
	ret
; 6ef
