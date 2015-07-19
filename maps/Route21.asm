Route21_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

TrainerSwimmermSeth:
	trainer EVENT_BEAT_SWIMMERM_SETH, SWIMMERM, SETH, SwimmermSethSeenText, SwimmermSethBeatenText, $0000, SwimmermSethScript

SwimmermSethScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ac873
	closetext
	loadmovesprites
	end

TrainerSwimmerfNikki:
	trainer EVENT_BEAT_SWIMMERF_NIKKI, SWIMMERF, NIKKI, SwimmerfNikkiSeenText, SwimmerfNikkiBeatenText, $0000, SwimmerfNikkiScript

SwimmerfNikkiScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ac8f1
	closetext
	loadmovesprites
	end

TrainerFisherArnold:
	trainer EVENT_BEAT_FISHER_ARNOLD, FISHER, ARNOLD, FisherArnoldSeenText, FisherArnoldBeatenText, $0000, FisherArnoldScript

FisherArnoldScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ac95c
	closetext
	loadmovesprites
	end

SwimmermSethSeenText:
	text "Land ho! Gotta"
	line "keep going!"
	done

SwimmermSethBeatenText:
	text "Glug…"
	done

UnknownText_0x1ac873:
	text "This arrogant guy"
	line "was at CINNABAR's"
	cont "volcano."
	done

SwimmerfNikkiSeenText:
	text "If I win, you have"
	line "to help me with my"
	cont "suntan lotion!"
	done

SwimmerfNikkiBeatenText:
	text "I'm worried about"
	line "sunburn…"
	done

UnknownText_0x1ac8f1:
	text "I have to watch"
	line "out for blemishes"
	cont "caused by the sun."
	done

FisherArnoldSeenText:
	text "I'm bored by fish-"
	line "ing. Let's battle!"
	done

FisherArnoldBeatenText:
	text "Utter failure…"
	done

UnknownText_0x1ac95c:
	text "I'll just go back"
	line "to fishing…"
	done

Route21_MapEventHeader:
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
	person_event SPRITE_SWIMMER_GIRL, 20, 15, LEFT << 2 | $2, $0, -1, -1, (PAL_OW_GREEN << 4) | $82, 3, TrainerSwimmerfNikki, -1
	person_event SPRITE_SWIMMER_GUY, 34, 6, LEFT << 2 | $1, $0, -1, -1, (PAL_OW_RED << 4) | $82, 4, TrainerSwimmermSeth, -1
	person_event SPRITE_FISHER, 26, 18, UP << 2 | $3, $0, -1, -1, (PAL_OW_GREEN << 4) | $82, 1, TrainerFisherArnold, -1
