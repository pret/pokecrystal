PhotoStudio:
	ld hl, .WhichMonPhotoText
	call PrintText
	farcall SelectMonFromParty
	jr c, .cancel
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .egg

	ld hl, .HoldStillText
	call PrintText
	call DisableSpriteUpdates
	farcall PrintPartymon
	call ReturnToMapWithSpeechTextbox
	ldh a, [hPrinter]
	and a
	jr nz, .cancel
	ld hl, .PrestoAllDoneText
	jr .print_text

.cancel
	ld hl, .NoPhotoText
	jr .print_text

.egg
	ld hl, .EggPhotoTalentText

.print_text
	call PrintText
	ret

.WhichMonPhotoText:
	; Which #MON should I photo- graph?
	text_far _WhichMonPhotoText
	text_end

.HoldStillText:
	; All righty. Hold still for a bit.
	text_far _HoldStillText
	text_end

.PrestoAllDoneText:
	; Presto! All done. Come again, OK?
	text_far _PrestoAllDoneText
	text_end

.NoPhotoText:
	; Oh, no picture? Come again, OK?
	text_far _NoPhotoText
	text_end

.EggPhotoTalentText:
	; An EGG? My talent is worth more…
	text_far _EggPhotoTalentText
	text_end
