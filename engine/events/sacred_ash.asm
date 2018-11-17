
_SacredAsh:
	ld a, $0
	ld [wItemEffectSucceeded], a
	call CheckAnyFaintedMon
	ret nc

	ld hl, SacredAshScript
	call QueueScript
	ld a, $1
	ld [wItemEffectSucceeded], a
	ret

CheckAnyFaintedMon:
	ld de, PARTYMON_STRUCT_LENGTH
	ld bc, wPartySpecies
	ld hl, wPartyMon1HP
	ld a, [wPartyCount]
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

SacredAshScript:
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

UnknownText_0x50845:
	; 's #MON were all healed!
	text_far UnknownText_0x1c0b65
	text_end
