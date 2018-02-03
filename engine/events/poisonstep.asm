DoPoisonStep:: ; 505da
	ld a, [wPartyCount]
	and a
	jr z, .no_faint

	xor a
	ld c, 7
	ld hl, wEngineBuffer1
.loop_clearEngineBuffer1
	ld [hli], a
	dec c
	jr nz, .loop_clearEngineBuffer1

	xor a
	ld [wCurPartyMon], a
.loop_check_poison
	call .DamageMonIfPoisoned
	jr nc, .not_poisoned
; the output flag is stored in c, copy it to the ([wCurPartyMon] + 2)nd EngineBuffer
; and set the corresponding flag in wEngineBuffer1
	ld a, [wCurPartyMon]
	ld e, a
	ld d, 0
	ld hl, wEngineBuffer2
	add hl, de
	ld [hl], c
	ld a, [wEngineBuffer1]
	or c
	ld [wEngineBuffer1], a

.not_poisoned
	ld a, [wPartyCount]
	ld hl, wCurPartyMon
	inc [hl]
	cp [hl]
	jr nz, .loop_check_poison

	ld a, [wEngineBuffer1]
	and %10
	jr nz, .someone_has_fainted
	ld a, [wEngineBuffer1]
	and %01
	jr z, .no_faint
	call .PlayPoisonSFX
	xor a
	ret

.someone_has_fainted
	ld a, BANK(.Script_MonFaintedToPoison)
	ld hl, .Script_MonFaintedToPoison
	call CallScript
	scf
	ret

.no_faint
	xor a
	ret
; 5062e

.DamageMonIfPoisoned: ; 5062e
; check if mon is poisoned, return if not
	ld a, MON_STATUS
	call GetPartyParamLocation
	ld a, [hl]
	and 1 << PSN
	ret z

; check if mon is already fainted, return if so
	ld a, MON_HP
	call GetPartyParamLocation
	ld a, [hli]
	ld b, a
	ld c, [hl]
	or c
	ret z

; do 1 HP damage
	dec bc
	ld [hl], c
	dec hl
	ld [hl], b

; check if mon has fainted as a result of poison damage
	ld a, b
	or c
	jr nz, .not_fainted

; the mon has fainted, reset its status, set carry, and return %10
	ld a, MON_STATUS
	call GetPartyParamLocation
	ld [hl], 0
	ld c, %10
	scf
	ret

.not_fainted
; set carry and return %01
	ld c, %01
	scf
	ret
; 50658

.PlayPoisonSFX: ; 50658
	ld de, SFX_POISON
	call PlaySFX
	ld b, $2
	predef LoadPoisonBGPals
	call DelayFrame
	ret
; 50669

.Script_MonFaintedToPoison: ; 50669
	callasm .PlayPoisonSFX
	opentext
	callasm .CheckWhitedOut
	iffalse .whiteout
	closetext
	end
; 50677

.whiteout ; 50677
	farjump Script_OverworldWhiteout
; 5067b

.CheckWhitedOut: ; 5067b
	xor a
	ld [wCurPartyMon], a
	ld de, wEngineBuffer2
.party_loop
	push de
	ld a, [de]
	and %10
	jr z, .mon_not_fainted
	ld c, HAPPINESS_POISONFAINT
	farcall ChangeHappiness
	farcall GetPartyNick
	ld hl, .PoisonFaintText
	call PrintText

.mon_not_fainted
	pop de
	inc de
	ld hl, wCurPartyMon
	inc [hl]
	ld a, [wPartyCount]
	cp [hl]
	jr nz, .party_loop
	predef CheckPlayerPartyForFitPkmn
	ld a, d
	ld [wScriptVar], a
	ret
; 506b2

.PoisonFaintText: ; 506b2
	text_jump UnknownText_0x1c0acc
	db "@"
; 506b7

.PoisonWhiteOutText: ; 506b7
	text_jump UnknownText_0x1c0ada
	db "@"
; 506bc
