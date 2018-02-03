Special_PhotoStudio: ; 16dc7
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
	ld a, [hPrinter]
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
; 16e04

.Text_AskWhichMon: ; 0x16e04
	; Which #MON should I photo- graph?
	text_jump UnknownText_0x1be024
	db "@"
; 0x16e09

.Text_HoldStill: ; 0x16e09
	; All righty. Hold still for a bit.
	text_jump UnknownText_0x1be047
	db "@"
; 0x16e0e

.Text_Presto: ; 0x16e0e
	; Presto! All done. Come again, OK?
	text_jump UnknownText_0x1be06a
	db "@"
; 0x16e13

.Text_NoPicture: ; 0x16e13
	; Oh, no picture? Come again, OK?
	text_jump UnknownText_0x1c0000
	db "@"
; 0x16e18

.Text_Egg: ; 0x16e18
	; An EGG? My talent is worth more…
	text_jump UnknownText_0x1c0021
	db "@"
; 0x16e1d
