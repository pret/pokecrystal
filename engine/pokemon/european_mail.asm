ParseMailLanguage:
	ld c, MAIL_LANG_ENGLISH
	ld hl, sPartyMon1MailNationality - sPartyMon1Mail
	add hl, de
	ld a, [hli]
	cp "E"
	ret nz
	ld a, [hli]
	assert MAIL_LANG_ENGLISH + 1 == MAIL_LANG_FRENCH
	inc c
	cp "F"
	ret z
	assert MAIL_LANG_FRENCH + 1 == MAIL_LANG_GERMAN
	inc c
	cp "G"
	ret z
	assert MAIL_LANG_GERMAN + 1 == MAIL_LANG_ITALIAN
	inc c
	cp "I"
	ret z
	assert MAIL_LANG_ITALIAN + 1 == MAIL_LANG_SPANISH
	inc c
	cp "S"
	ret z
	ld c, MAIL_LANG_ENGLISH
	ret

; The regular font.
StandardEnglishFont:
INCBIN "gfx/font/english.1bpp"

; An extended font.
FrenchGermanFont:
INCBIN "gfx/font/french_german.1bpp"

; An even more extended font.
SpanishItalianFont:
INCBIN "gfx/font/spanish_italian.1bpp"

ConvertFrenchGermanMailToEnglish:
; Called when sending French or German mail
; Remaps 's from French/German character set to English 
; Converts c' d' j' from French/German character set to unused values in English
	ld b, sPartyMon1MailAuthor - sPartyMon1Mail
	ld h, d
	ld l, e
.loop
	ld a, [hl]
	cp $dc ; 's in French/German font
	jr nz, .check_intermediate_chars
	ld a, "'s"
	jr .replace

.check_intermediate_chars
	sub "'s"
	jr c, .dont_replace
	cp "'v" - "'s" + 1
	jr nc, .dont_replace
	add $cd

.replace
	ld [hl], a

.dont_replace
	inc hl
	dec b
	jr nz, .loop
	ret

ConvertEnglishMailToFrenchGerman:
; Called when receiving French or German mail
; Remaps 's from English character set to French/German 
; Converts unused values from English character set back to c' d' j' in French/German
	ld b, sPartyMon1MailAuthor - sPartyMon1Mail
	ld h, d
	ld l, e
.loop
	ld a, [hl]
	cp "'s"
	jr nz, .check_intermediate_chars
	ld a, $dc ; 's in French/German font
	jr .replace

.check_intermediate_chars
	sub $cd
	jr c, .dont_replace
	cp "'v" - "'s" + 1
	jr nc, .dont_replace
	add "'s"

.replace
	ld [hl], a

.dont_replace
	inc hl
	dec b
	jr nz, .loop
	ret

ConvertSpanishItalianMailToEnglish:
; Called when sending Spanish or Italian mail
; Converts 'd 'l 'm 'r 's 't 'v from Spanish/Italian character set to English
; Converts ì í ñ ò ó ú º from Spanish/Italian character set to unused values in English
ConvertEnglishMailToSpanishItalian:
; Called when receiving Spanish or Italian mail
; Converts 'd 'l 'm 'r 's 't 'v from English character set to Spanish/Italian
; Converts unused values from English character set back to ì í ñ ò ó ú º in Spanish/Italian
	ld b, sPartyMon1MailAuthor - sPartyMon1Mail
	ld h, d
	ld l, e
.loop
	ld a, [hl]
	and $f0
	cp $d0
	jr nz, .dont_replace
	ld a, [hl]
	add $8
	and $f
	or $d0
	ld [hl], a

.dont_replace
	inc hl
	dec b
	jr nz, .loop
	ret
