_GetVarAction:: ; 80648 (20:4648)
	ld a, c
	cp NUM_VARS
	jr c, .valid
	xor a
.valid
	ld c, a
	ld b, 0
	ld hl, .VarActionTable
	add hl, bc
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld b, [hl]
	ld a, b
	and RETVAR_EXECUTE
	jr nz, .call
	ld a, b
	and RETVAR_ADDR_DE
	ret nz
	ld a, [de]
	jr .loadstringbuffer2

.call
	call _de_
	ret

.loadstringbuffer2 ; 8066c (20:466c)
	ld de, StringBuffer2
	ld [de], a
	ret
; 80671 (20:4671)

.VarActionTable: ; 80671
; $00: copy [de] to StringBuffer2
; $40: return address in de
; $80: call function
	dwb StringBuffer2,                  RETVAR_STRBUF2
	dwb PartyCount,                     RETVAR_STRBUF2
	dwb .BattleResult,                  RETVAR_EXECUTE
	dwb BattleType,                     RETVAR_ADDR_DE
	dwb TimeOfDay,                      RETVAR_STRBUF2
	dwb .CountCaughtMons,               RETVAR_EXECUTE
	dwb .CountSeenMons,                 RETVAR_EXECUTE
	dwb .CountBadges,                   RETVAR_EXECUTE
	dwb PlayerState,                    RETVAR_ADDR_DE
	dwb .PlayerFacing,                  RETVAR_EXECUTE
	dwb hHours,                         RETVAR_STRBUF2
	dwb .DayOfWeek,                     RETVAR_EXECUTE
	dwb MapGroup,                       RETVAR_STRBUF2
	dwb MapNumber,                      RETVAR_STRBUF2
	dwb .UnownCaught,                   RETVAR_EXECUTE
	dwb wPermission,                    RETVAR_STRBUF2
	dwb .BoxFreeSpace,                  RETVAR_EXECUTE
	dwb wBugContestMinsRemaining,       RETVAR_STRBUF2
	dwb XCoord,                         RETVAR_STRBUF2
	dwb YCoord,                         RETVAR_STRBUF2
	dwb wSpecialPhoneCallID,            RETVAR_STRBUF2
	dwb wNrOfBeatenBattleTowerTrainers, RETVAR_STRBUF2
	dwb wKurtApricornQuantity,          RETVAR_STRBUF2
	dwb wCurrentCaller,                 RETVAR_ADDR_DE
	dwb wBlueCardBalance,               RETVAR_ADDR_DE
	dwb wBuenasPassword,                RETVAR_ADDR_DE
	dwb wKenjiBreakTimer,               RETVAR_STRBUF2
	dwb NULL,                           RETVAR_STRBUF2
; 806c5

.CountCaughtMons: ; 806c5
; Caught mons.
	ld hl, PokedexCaught
	ld b, EndPokedexCaught - PokedexCaught
	call CountSetBits
	ld a, [wd265]
	jp .loadstringbuffer2
; 806d3

.CountSeenMons: ; 806d3
; Seen mons.
	ld hl, PokedexSeen
	ld b, EndPokedexSeen - PokedexSeen
	call CountSetBits
	ld a, [wd265]
	jp .loadstringbuffer2
; 806e1

.CountBadges: ; 806e1
; Number of owned badges.
	ld hl, Badges
	ld b, 2
	call CountSetBits
	ld a, [wd265]
	jp .loadstringbuffer2
; 806ef

.PlayerFacing: ; 806ef
; The direction the player is facing.
	ld a, [PlayerDirection]
	and $c
	rrca
	rrca
	jp .loadstringbuffer2
; 806f9

.DayOfWeek: ; 806f9
; The day of the week.
	call GetWeekday
	jp .loadstringbuffer2
; 806ff

.UnownCaught: ; 806ff
; Number of unique Unown caught.
	call .count
	ld a, b
	jp .loadstringbuffer2

.count
	ld hl, UnownDex
	ld b, 0
.loop
	ld a, [hli]
	and a
	ret z
	inc b
	ld a, b
	cp 26
	jr c, .loop
	ret
; 80715

.BoxFreeSpace: ; 80715
; Remaining slots in the current box.
	ld a, BANK(sBoxCount)
	call GetSRAMBank
	ld hl, sBoxCount
	ld a, MONS_PER_BOX
	sub [hl]
	ld b, a
	call CloseSRAM
	ld a, b
	jp .loadstringbuffer2
; 80728

.BattleResult: ; 80728
	ld a, [wBattleResult]
	and $3f
	jp .loadstringbuffer2
; 80730
