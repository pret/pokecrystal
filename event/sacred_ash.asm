
_SacredAsh: ; 507e6
	ld a, $0
	ld [wItemEffectSucceeded], a
	call CheckAnyFaintedMon
	ret nc

	ld hl, SacredAshScript
	call QueueScript
	ld a, $1
	ld [wItemEffectSucceeded], a
	ret
; 507fb

CheckAnyFaintedMon: ; 507fb
	ld de, PARTYMON_STRUCT_LENGTH
	ld bc, PartySpecies
	ld hl, PartyMon1HP
	ld a, [PartyCount]
	and a
	ret z

.loop
	push af
	push hl
	ld a, [bc]
	inc bc
	cp EGG
	jr z, .next

	ld a, [hli]
	or [hl]
	jr z, .done

.next
	pop hl
	add hl, de
	pop af
	dec a
	jr nz, .loop
	xor a
	ret

.done
	pop hl
	pop af
	scf
	ret
; 50821

SacredAshScript: ; 0x50821
	special HealParty
	reloadmappart
	playsound SFX_WARP_TO
	special FadeOutPalettes
	special FadeInPalettes
	special FadeOutPalettes
	special FadeInPalettes
	special FadeOutPalettes
	special FadeInPalettes
	waitsfx
	writetext UnknownText_0x50845
	playsound SFX_CAUGHT_MON
	waitsfx
	waitbutton
	closetext
	end
; 0x50845

UnknownText_0x50845: ; 0x50845
	; 's #MON were all healed!
	text_jump UnknownText_0x1c0b65
	db "@"
; 0x5084a
