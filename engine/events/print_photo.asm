PhotoStudio:
	ld hl, .Text_AskWhichMon
	call PrintText
	farcall SelectMonFromParty
	jr c, .cancel
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .egg

	ld hl, .Text_HoldStill
	call PrintText
	call DisableSpriteUpdates
	farcall PrintPartymon
	call ReturnToMapWithSpeechTextbox
	ldh a, [hPrinter]
	and a
	jr nz, .cancel
	ld hl, .Text_Presto
	jr .print_text

.cancel
	ld hl, .Text_NoPicture
	jr .print_text

.egg
	ld hl, .Text_Egg

.print_text
	call PrintText
	ret

.Text_AskWhichMon:
	; Which #MON should I photo- graph?
	text_far _WhichMonPhotoText
	text_end

.Text_HoldStill:
	; All righty. Hold still for a bit.
	text_far _HoldOnText
	text_end

.Text_Presto:
	; Presto! All done. Come again, OK?
	text_far _PrestoAllDoneText
	text_end

.Text_NoPicture:
	; Oh, no picture? Come again, OK?
	text_far UnknownText_0x1c0000
	text_end

.Text_Egg:
	; An EGG? My talent is worth more…
	text_far UnknownText_0x1c0021
	text_end
