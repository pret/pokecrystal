Route21_MapScriptHeader: ; 0x1ac812
	; trigger count
	db 0

	; callback count
	db 0
; 0x1ac814

TrainerSwimmermSeth: ; 0x1ac814
	; bit/flag number
	dw $5a5

	; trainer group && trainer id
	db SWIMMERM, SETH

	; text when seen
	dw SwimmermSethSeenText

	; text when trainer beaten
	dw SwimmermSethBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmermSethScript
; 0x1ac820

SwimmermSethScript: ; 0x1ac820
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ac873
	closetext
	loadmovesprites
	end
; 0x1ac828

TrainerSwimmerfNikki: ; 0x1ac828
	; bit/flag number
	dw $3f8

	; trainer group && trainer id
	db SWIMMERF, NIKKI

	; text when seen
	dw SwimmerfNikkiSeenText

	; text when trainer beaten
	dw SwimmerfNikkiBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmerfNikkiScript
; 0x1ac834

SwimmerfNikkiScript: ; 0x1ac834
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ac8f1
	closetext
	loadmovesprites
	end
; 0x1ac83c

TrainerFisherArnold: ; 0x1ac83c
	; bit/flag number
	dw $450

	; trainer group && trainer id
	db FISHER, ARNOLD

	; text when seen
	dw FisherArnoldSeenText

	; text when trainer beaten
	dw FisherArnoldBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw FisherArnoldScript
; 0x1ac848

FisherArnoldScript: ; 0x1ac848
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ac95c
	closetext
	loadmovesprites
	end
; 0x1ac850

SwimmermSethSeenText: ; 0x1ac850
	text "Land ho! Gotta"
	line "keep going!"
	done
; 0x1ac86c

SwimmermSethBeatenText: ; 0x1ac86c
	text "Glug…"
	done
; 0x1ac873

UnknownText_0x1ac873: ; 0x1ac873
	text "This arrogant guy"
	line "was at CINNABAR's"
	cont "volcano."
	done
; 0x1ac8a0

SwimmerfNikkiSeenText: ; 0x1ac8a0
	text "If I win, you have"
	line "to help me with my"
	cont "suntan lotion!"
	done
; 0x1ac8d6

SwimmerfNikkiBeatenText: ; 0x1ac8d6
	text "I'm worried about"
	line "sunburn…"
	done
; 0x1ac8f1

UnknownText_0x1ac8f1: ; 0x1ac8f1
	text "I have to watch"
	line "out for blemishes"
	cont "caused by the sun."
	done
; 0x1ac927

FisherArnoldSeenText: ; 0x1ac927
	text "I'm bored by fish-"
	line "ing. Let's battle!"
	done
; 0x1ac94c

FisherArnoldBeatenText: ; 0x1ac94c
	text "Utter failure…"
	done
; 0x1ac95c

UnknownText_0x1ac95c: ; 0x1ac95c
	text "I'll just go back"
	line "to fishing…"
	done
; 0x1ac97a

Route21_MapEventHeader: ; 0x1ac97a
	; filler
	db 0, 0

	; warps
	db 0

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 3
	person_event SPRITE_SWIMMER_GIRL, 20, 15, $a, $0, 255, 255, $a2, 3, TrainerSwimmerfNikki, $ffff
	person_event SPRITE_SWIMMER_GUY, 34, 6, $9, $0, 255, 255, $82, 4, TrainerSwimmermSeth, $ffff
	person_event SPRITE_FISHER, 26, 18, $7, $0, 255, 255, $a2, 1, TrainerFisherArnold, $ffff
; 0x1ac9a7
