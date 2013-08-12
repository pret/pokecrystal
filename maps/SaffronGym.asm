SaffronGym_MapScriptHeader: ; 0x189c2c
	; trigger count
	db 0

	; callback count
	db 0
; 0x189c2e

SabrinaScript_0x189c2e: ; 0x189c2e
	faceplayer
	loadfont
	checkbit2 $0028
	iftrue UnknownScript_0x189c65
	2writetext UnknownText_0x189cdf
	closetext
	loadmovesprites
	winlosstext UnknownText_0x189df4, $0000
	loadtrainer SABRINA, 1
	startbattle
	returnafterbattle
	setbit1 $04ca
	setbit1 $0590
	setbit1 $0591
	setbit1 $043b
	setbit1 $0444
	loadfont
	2writetext UnknownText_0x189e95
	playsound $009c
	waitbutton
	setbit2 $0028
	2writetext UnknownText_0x189ead
	closetext
	loadmovesprites
	end
; 0x189c65

UnknownScript_0x189c65: ; 0x189c65
	2writetext UnknownText_0x189f6c
	closetext
	loadmovesprites
	end
; 0x189c6b

TrainerMediumRebecca: ; 0x189c6b
	; bit/flag number
	dw $590

	; trainer group && trainer id
	db MEDIUM, REBECCA

	; text when seen
	dw MediumRebeccaSeenText

	; text when trainer beaten
	dw MediumRebeccaBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw MediumRebeccaScript
; 0x189c77

MediumRebeccaScript: ; 0x189c77
	talkaftercancel
	loadfont
	2writetext UnknownText_0x18a034
	closetext
	loadmovesprites
	end
; 0x189c7f

TrainerPsychicFranklin: ; 0x189c7f
	; bit/flag number
	dw $43b

	; trainer group && trainer id
	db PSYCHIC_T, FRANKLIN

	; text when seen
	dw PsychicFranklinSeenText

	; text when trainer beaten
	dw PsychicFranklinBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PsychicFranklinScript
; 0x189c8b

PsychicFranklinScript: ; 0x189c8b
	talkaftercancel
	loadfont
	2writetext UnknownText_0x18a0a6
	closetext
	loadmovesprites
	end
; 0x189c93

TrainerMediumDoris: ; 0x189c93
	; bit/flag number
	dw $591

	; trainer group && trainer id
	db MEDIUM, DORIS

	; text when seen
	dw MediumDorisSeenText

	; text when trainer beaten
	dw MediumDorisBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw MediumDorisScript
; 0x189c9f

MediumDorisScript: ; 0x189c9f
	talkaftercancel
	loadfont
	2writetext UnknownText_0x18a136
	closetext
	loadmovesprites
	end
; 0x189ca7

TrainerPsychicJared: ; 0x189ca7
	; bit/flag number
	dw $444

	; trainer group && trainer id
	db PSYCHIC_T, JARED

	; text when seen
	dw PsychicJaredSeenText

	; text when trainer beaten
	dw PsychicJaredBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PsychicJaredScript
; 0x189cb3

PsychicJaredScript: ; 0x189cb3
	talkaftercancel
	loadfont
	2writetext UnknownText_0x18a1b3
	closetext
	loadmovesprites
	end
; 0x189cbb

SaffronGymGuyScript: ; 0x189cbb
	faceplayer
	loadfont
	checkbit1 $04ca
	iftrue .SaffronGymGuyWinScript
	2writetext SaffronGymGuyText
	closetext
	loadmovesprites
	end

.SaffronGymGuyWinScript
	2writetext SaffronGymGuyWinText
	closetext
	loadmovesprites
	end
; 0x189ccf

MapSaffronGymSignpost0Script: ; 0x189ccf
	checkbit2 $0028
	iftrue UnknownScript_0x189cd8
	jumpstd $002d
; 0x189cd8

UnknownScript_0x189cd8: ; 0x189cd8
	trainertotext SABRINA, 1, $1
	jumpstd $002e
; 0x189cdf

UnknownText_0x189cdf: ; 0x189cdf
	db $0, "SABRINA: I knew", $4f
	db "you were coming…", $51
	db "Three years ago I", $4f
	db "had a vision of", $55
	db "your arrival.", $51
	db "You're after my", $4f
	db "BADGE.", $51
	db "I don't enjoy bat-", $4f
	db "tling, but it's my", $51
	db "duty as a LEADER", $4f
	db "to confer BADGES", $51
	db "on anyone who has", $4f
	db "proven him- or", $55
	db "herself worthy.", $51
	db "Since you wish it,", $4f
	db "I will show you my", $55
	db "psychic powers!", $57
; 0x189df4

UnknownText_0x189df4: ; 0x189df4
	db $0, "SABRINA: Your", $4f
	db "power…", $51
	db "It far exceeds", $4f
	db "what I foresaw…", $51
	db "Maybe it isn't", $4f
	db "possible to fully", $51
	db "predict what the", $4f
	db "future holds…", $51
	db "OK, you win. You", $4f
	db "earned yourself", $55
	db "MARSHBADGE.", $57
; 0x189e95

UnknownText_0x189e95: ; 0x189e95
	db $0, $52, " received", $4f
	db "MARSHBADGE.", $57
; 0x189ead

UnknownText_0x189ead: ; 0x189ead
	db $0, "SABRINA: MARSH-", $4f
	db "BADGE draws out", $51
	db "your subliminal", $4f
	db "powers…", $51
	db "Although I failed", $4f
	db "to accurately pre-", $55
	db "dict your power,", $55
	db "this much I know", $55
	db "to be true.", $51
	db "You will become a", $4f
	db "celebrated and", $55
	db "beloved CHAMPION!", $57
; 0x189f6c

UnknownText_0x189f6c: ; 0x189f6c
	db $0, "SABRINA: Your love", $4f
	db "for your #MON", $51
	db "overwhelmed my", $4f
	db "psychic power…", $51
	db "The power of love,", $4f
	db "I think, is also a", $51
	db "kind of psychic", $4f
	db "power…", $57
; 0x189fe9

MediumRebeccaSeenText: ; 0x189fe9
	db $0, "The power of all", $4f
	db "those you defeated", $55
	db "comes to me!", $57
; 0x18a01b

MediumRebeccaBeatenText: ; 0x18a01b
	db $0, "Strong…", $4f
	db "Far too strong…", $57
; 0x18a034

UnknownText_0x18a034: ; 0x18a034
	db $0, "What is the source", $4f
	db "of your power?", $57
; 0x18a057

PsychicFranklinSeenText: ; 0x18a057
	db $0, "Psychic power is", $4f
	db "the power of your", $55
	db "soul.", $57
; 0x18a081

PsychicFranklinBeatenText: ; 0x18a081
	db $0, "Your soul has more", $4f
	db "power than mine!", $57
; 0x18a0a6

UnknownText_0x18a0a6: ; 0x18a0a6
	db $0, "You made your soul", $4f
	db "stronger, not just", $55
	db "your abilities.", $57
; 0x18a0dd

MediumDorisSeenText: ; 0x18a0dd
	db $0, "Fufufufu…", $4f
	db "I see it clearly.", $51
	db "I can see into", $4f
	db "your soul!", $57
; 0x18a114

MediumDorisBeatenText: ; 0x18a114
	db $0, "Though I read you,", $4f
	db "I still lost…", $57
; 0x18a136

UnknownText_0x18a136: ; 0x18a136
	db $0, "Darn! I forgot", $4f
	db "that I predicted I", $55
	db "would lose to you.", $57
; 0x18a16c

PsychicJaredSeenText: ; 0x18a16c
	db $0, "The FIGHTING DOJO", $4f
	db "next door was once", $55
	db "this city's GYM.", $57
; 0x18a1a2

PsychicJaredBeatenText: ; 0x18a1a2
	db $0, "I was no match…", $57
; 0x18a1b3

UnknownText_0x18a1b3: ; 0x18a1b3
	db $0, "KARATE KING, the", $4f
	db "master of the", $51
	db "FIGHTING DOJO, was", $4f
	db "just destroyed by", $55
	db "SABRINA.", $57
; 0x18a201

SaffronGymGuyText: ; 0x18a201
	db $0, "Yo, CHAMP in", $4f
	db "making!", $51
	db "A trainer as", $4f
	db "skilled as you", $51
	db "doesn't need to be", $4f
	db "told how to deal", $51
	db "with psychic-type", $4f
	db "#MON, right?", $51
	db "I expect great", $4f
	db "things from you!", $51
	db "Good luck!", $57
; 0x18a2a0

SaffronGymGuyWinText: ; 0x18a2a0
	db $0, "That was another", $4f
	db "fantastic battle!", $57
; 0x18a2c4

SaffronGym_MapEventHeader: ; 0x18a2c4
	; filler
	db 0, 0

	; warps
	db 32
	warp_def $11, $8, 2, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY
	warp_def $11, $9, 2, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY
	warp_def $f, $b, 18, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $f, $13, 19, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $b, $13, 20, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $b, $1, 21, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $3, $5, 22, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $5, $b, 23, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $f, $1, 24, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $3, $13, 25, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $11, $f, 26, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $11, $5, 27, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $9, $5, 28, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $3, $9, 29, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $9, $f, 30, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $5, $f, 31, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $5, $1, 32, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $11, $13, 3, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $9, $13, 4, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $9, $1, 5, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $5, $5, 6, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $3, $b, 7, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $11, $1, 8, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $5, $13, 9, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $f, $f, 10, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $f, $5, 11, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $b, $5, 12, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $5, $9, 13, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $b, $f, 14, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $3, $f, 15, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $3, $1, 16, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $9, $b, 17, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 15, 8, $0, MapSaffronGymSignpost0Script

	; people-events
	db 6
	person_event SPRITE_SABRINA, 12, 13, $6, $0, 255, 255, $80, 0, SabrinaScript_0x189c2e, $ffff
	person_event SPRITE_GRANNY, 20, 21, $a, $0, 255, 255, $b2, 3, TrainerMediumRebecca, $ffff
	person_event SPRITE_YOUNGSTER, 20, 7, $a, $0, 255, 255, $92, 3, TrainerPsychicFranklin, $ffff
	person_event SPRITE_GRANNY, 8, 7, $a, $0, 255, 255, $b2, 2, TrainerMediumDoris, $ffff
	person_event SPRITE_YOUNGSTER, 8, 21, $a, $0, 255, 255, $92, 2, TrainerPsychicJared, $ffff
	person_event SPRITE_GYM_GUY, 18, 13, $6, $0, 255, 255, $90, 0, SaffronGymGuyScript, $ffff
; 0x18a3bd

