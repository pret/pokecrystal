_InitializeStartDay: ; 113d6
	call InitializeStartDay
	ret
; 113da

ClearDailyTimers: ; 113da
	xor a
	ld [wLuckyNumberDayBuffer], a
	ld [wUnusedTwoDayTimer], a
	ld [wDailyResetTimer], a
	ret
; 113e5

InitCallReceiveDelay:: ; 113e5
	xor a
	ld [wTimeCyclesSinceLastCall], a

NextCallReceiveDelay: ; 113e9
	ld a, [wTimeCyclesSinceLastCall]
	cp 3
	jr c, .okay
	ld a, 3

.okay
	ld e, a
	ld d, 0
	ld hl, .ReceiveCallDelays
	add hl, de
	ld a, [hl]
	jp RestartReceiveCallDelay
; 113fd

.ReceiveCallDelays:
	db 20, 10, 5, 3
; 11401

CheckReceiveCallTimer: ; 11401
	call CheckReceiveCallDelay ; check timer
	ret nc
	ld hl, wTimeCyclesSinceLastCall
	ld a, [hl]
	cp 3
	jr nc, .ok
	inc [hl]

.ok
	call NextCallReceiveDelay ; restart timer
	scf
	ret
; 11413

InitOneDayCountdown: ; 11413
	ld a, 1

InitNDaysCountdown: ; 11415
	ld [hl], a
	push hl
	call UpdateTime
	pop hl
	inc hl
	call CopyDayToHL
	ret
; 11420

CheckDayDependentEventHL: ; 11420
	inc hl
	push hl
	call CalcDaysSince
	call GetDaysSince
	pop hl
	dec hl
	call UpdateTimeRemaining
	ret
; 1142e

RestartReceiveCallDelay: ; 1142e
	ld hl, wReceiveCallDelay_MinsRemaining
	ld [hl], a
	call UpdateTime
	ld hl, wReceiveCallDelay_StartTime
	call CopyDayHourMinToHL
	ret
; 1143c

CheckReceiveCallDelay: ; 1143c
	ld hl, wReceiveCallDelay_StartTime
	call CalcMinsHoursDaysSince
	call GetMinutesSinceIfLessThan60
	ld hl, wReceiveCallDelay_MinsRemaining
	call UpdateTimeRemaining
	ret
; 1144c

RestartDailyResetTimer: ; 1144c
	ld hl, wDailyResetTimer
	jp InitOneDayCountdown
; 11452

CheckDailyResetTimer:: ; 11452
	ld hl, wDailyResetTimer
	call CheckDayDependentEventHL
	ret nc
	xor a
	ld hl, DailyFlags
rept 3
	ld [hli], a
endr
	ld [hl], a
	ld hl, wDailyRematchFlags
rept 4
	ld [hli], a
endr
	ld hl, wDailyPhoneItemFlags
rept 4
	ld [hli], a
endr
	ld hl, wDailyPhoneTimeOfDayFlags
rept 4
	ld [hli], a
endr
	ld hl, wKenjiBreakTimer
	ld a, [hl]
	and a
	jr z, .RestartKenjiBreakCountdown
	dec [hl]
	jr nz, .DontRestartKenjiBreakCountdown
.RestartKenjiBreakCountdown:
	call Special_SampleKenjiBreakCountdown
.DontRestartKenjiBreakCountdown:
	jr RestartDailyResetTimer
; 11485

Special_SampleKenjiBreakCountdown: ; 11485
; Generate a random number between 3 and 6
	call Random
	and 3
	add 3
	ld [wKenjiBreakTimer], a
	ret
; 11490

StartBugContestTimer: ; 11490
	ld a, 20
	ld [wBugContestMinsRemaining], a
	ld a, 0
	ld [wBugContestSecsRemaining], a
	call UpdateTime
	ld hl, wBugContestStartTime
	call CopyDayHourMinSecToHL
	ret
; 114a4


CheckBugContestTimer:: ; 114a4 (4:54a4)
	ld hl, wBugContestStartTime
	call CalcSecsMinsHoursDaysSince
	ld a, [wDaysSince]
	and a
	jr nz, .timed_out
	ld a, [wHoursSince]
	and a
	jr nz, .timed_out
	ld a, [wSecondsSince]
	ld b, a
	ld a, [wBugContestSecsRemaining]
	sub b
	jr nc, .okay
	add 60

.okay
	ld [wBugContestSecsRemaining], a
	ld a, [wMinutesSince]
	ld b, a
	ld a, [wBugContestMinsRemaining]
	sbc b
	ld [wBugContestMinsRemaining], a
	jr c, .timed_out
	and a
	ret

.timed_out
	xor a
	ld [wBugContestMinsRemaining], a
	ld [wBugContestSecsRemaining], a
	scf
	ret


InitializeStartDay: ; 114dd
	call UpdateTime
	ld hl, wStartDay
	call CopyDayToHL
	ret
; 114e7

CheckPokerusTick:: ; 114e7
	ld hl, wStartDay
	call CalcDaysSince
	call GetDaysSince
	and a
	jr z, .done ; not even a day has passed since game start
	ld b, a
	callba ApplyPokerusTick
.done
	xor a
	ret
; 114fc

SetUnusedTwoDayTimer: ; 114fc
	ld a, 2
	ld hl, wUnusedTwoDayTimer
	ld [hl], a
	call UpdateTime
	ld hl, wUnusedTwoDayTimerStartDate
	call CopyDayToHL
	ret
; 1150c

CheckUnusedTwoDayTimer: ; 1150c
	ld hl, wUnusedTwoDayTimerStartDate
	call CalcDaysSince
	call GetDaysSince
	ld hl, wUnusedTwoDayTimer
	call UpdateTimeRemaining
	ret
; 1151c

; XXX
	ld hl, DailyFlags
	set 2, [hl]
	ret
; 11522

; XXX
	and a
	ld hl, DailyFlags
	bit 2, [hl]
	ret nz
	scf
	ret
; 1152b

RestartLuckyNumberCountdown: ; 1152b
	call .GetDaysUntilNextFriday
	ld hl, wLuckyNumberDayBuffer
	jp InitNDaysCountdown
; 11534

.GetDaysUntilNextFriday: ; 11534
	call GetWeekday
	ld c, a
	ld a, FRIDAY
	sub c
	jr z, .friday_saturday
	jr nc, .earlier ; should've done "ret nc"

.friday_saturday
	add 7

.earlier
	ret
; 11542

CheckLuckyNumberShowFlag: ; 11542
	ld hl, wLuckyNumberDayBuffer
	jp CheckDayDependentEventHL
; 11548

DoMysteryGiftIfDayHasPassed: ; 11548
	ld a, BANK(sMysteryGiftTimer)
	call GetSRAMBank
	ld hl, sMysteryGiftTimer
	ld a, [hli]
	ld [Buffer1], a
	ld a, [hl]
	ld [Buffer2], a
	call CloseSRAM

	ld hl, Buffer1
	call CheckDayDependentEventHL
	jr nc, .not_timed_out
	ld hl, Buffer1
	call InitOneDayCountdown
	call CloseSRAM
	callba Function1050c8

.not_timed_out
	ld a, BANK(sMysteryGiftTimer)
	call GetSRAMBank
	ld hl, Buffer1
	ld a, [hli]
	ld [sMysteryGiftTimer], a
	ld a, [hl]
	ld [sMysteryGiftTimer + 1], a
	call CloseSRAM
	ret
; 11586

UpdateTimeRemaining: ; 11586
; If the amount of time elapsed exceeds the capacity of its
; unit, skip this part.
	cp -1
	jr z, .set_carry
	ld c, a
	ld a, [hl] ; time remaining
	sub c
	jr nc, .ok
	xor a

.ok
	ld [hl], a
	jr z, .set_carry
	xor a
	ret

.set_carry
	xor a
	ld [hl], a
	scf
	ret
; 11599

GetSecondsSinceIfLessThan60: ; 11599
	ld a, [wDaysSince]
	and a
	jr nz, GetTimeElapsed_ExceedsUnitLimit
	ld a, [wHoursSince]
	and a
	jr nz, GetTimeElapsed_ExceedsUnitLimit
	ld a, [wMinutesSince]
	jr nz, GetTimeElapsed_ExceedsUnitLimit
	ld a, [wSecondsSince]
	ret
; 115ae

GetMinutesSinceIfLessThan60: ; 115ae
	ld a, [wDaysSince]
	and a
	jr nz, GetTimeElapsed_ExceedsUnitLimit
	ld a, [wHoursSince]
	and a
	jr nz, GetTimeElapsed_ExceedsUnitLimit
	ld a, [wMinutesSince]
	ret
; 115be

GetHoursSinceIfLessThan24: ; 115be
	ld a, [wDaysSince]
	and a
	jr nz, GetTimeElapsed_ExceedsUnitLimit
	ld a, [wHoursSince]
	ret
; 115c8

GetDaysSince: ; 115c8
	ld a, [wDaysSince]
	ret
; 115cc

GetTimeElapsed_ExceedsUnitLimit: ; 115cc
	ld a, -1
	ret
; 115cf

CalcDaysSince: ; 115cf
	xor a
	jr _CalcDaysSince
; 115d2

CalcHoursDaysSince: ; 115d2
	inc hl
	xor a
	jr _CalcHoursDaysSince
; 115d6

CalcMinsHoursDaysSince: ; 115d6
rept 2
	inc hl
endr
	xor a
	jr _CalcMinsHoursDaysSince
; 115db

CalcSecsMinsHoursDaysSince: ; 115db
rept 3
	inc hl
endr
	ld a, [hSeconds]
	ld c, a
	sub [hl]
	jr nc, .skip
	add 60
.skip
	ld [hl], c ; current seconds
	dec hl
	ld [wSecondsSince], a ; seconds since

_CalcMinsHoursDaysSince: ; 115eb
	ld a, [hMinutes]
	ld c, a
	sbc [hl]
	jr nc, .skip
	add 60
.skip
	ld [hl], c ; current minutes
	dec hl
	ld [wMinutesSince], a ; minutes since

_CalcHoursDaysSince: ; 115f8
	ld a, [hHours]
	ld c, a
	sbc [hl]
	jr nc, .skip
	add 24
.skip
	ld [hl], c ; current hours
	dec hl
	ld [wHoursSince], a ; hours since

_CalcDaysSince:
	ld a, [CurDay]
	ld c, a
	sbc [hl]
	jr nc, .skip
	add 20 * 7
.skip
	ld [hl], c ; current days
	ld [wDaysSince], a ; days since
	ret
; 11613

CopyDayHourMinSecToHL: ; 11613
	ld a, [CurDay]
	ld [hli], a
	ld a, [hHours]
	ld [hli], a
	ld a, [hMinutes]
	ld [hli], a
	ld a, [hSeconds]
	ld [hli], a
	ret
; 11621

CopyDayToHL: ; 11621
	ld a, [CurDay]
	ld [hl], a
	ret
; 11626

CopyDayHourToHL: ; 11626
	ld a, [CurDay]
	ld [hli], a
	ld a, [hHours]
	ld [hli], a
	ret
; 1162e

CopyDayHourMinToHL: ; 1162e
	ld a, [CurDay]
	ld [hli], a
	ld a, [hHours]
	ld [hli], a
	ld a, [hMinutes]
	ld [hli], a
	ret
; 11639