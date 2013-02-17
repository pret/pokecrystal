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
	2writetext UnknownText_0x1ac873
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
	2writetext UnknownText_0x1ac8f1
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
	2writetext UnknownText_0x1ac95c
	closetext
	loadmovesprites
	end
; 0x1ac850

SwimmermSethSeenText: ; 0x1ac850
	db $0, "Land ho! Gotta", $4f
	db "keep going!", $57
; 0x1ac86c

SwimmermSethBeatenText: ; 0x1ac86c
	db $0, "Glug…", $57
; 0x1ac873

UnknownText_0x1ac873: ; 0x1ac873
	db $0, "This arrogant guy", $4f
	db "was at CINNABAR's", $55
	db "volcano.", $57
; 0x1ac8a0

SwimmerfNikkiSeenText: ; 0x1ac8a0
	db $0, "If I win, you have", $4f
	db "to help me with my", $55
	db "suntan lotion!", $57
; 0x1ac8d6

SwimmerfNikkiBeatenText: ; 0x1ac8d6
	db $0, "I'm worried about", $4f
	db "sunburn…", $57
; 0x1ac8f1

UnknownText_0x1ac8f1: ; 0x1ac8f1
	db $0, "I have to watch", $4f
	db "out for blemishes", $55
	db "caused by the sun.", $57
; 0x1ac927

FisherArnoldSeenText: ; 0x1ac927
	db $0, "I'm bored by fish-", $4f
	db "ing. Let's battle!", $57
; 0x1ac94c

FisherArnoldBeatenText: ; 0x1ac94c
	db $0, "Utter failure…", $57
; 0x1ac95c

UnknownText_0x1ac95c: ; 0x1ac95c
	db $0, "I'll just go back", $4f
	db "to fishing…", $57
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
	person_event $32, 20, 15, $a, $0, 255, 255, $a2, 3, TrainerSwimmerfNikki, $ffff
	person_event $31, 34, 6, $9, $0, 255, 255, $82, 4, TrainerSwimmermSeth, $ffff
	person_event $3a, 26, 18, $7, $0, 255, 255, $a2, 1, TrainerFisherArnold, $ffff
; 0x1ac9a7

