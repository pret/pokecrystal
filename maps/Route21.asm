const_value set 2
	const ROUTE21_SWIMMER_GIRL
	const ROUTE21_SWIMMER_GUY
	const ROUTE21_FISHER

Route21_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerSwimmermSeth:
	trainer EVENT_BEAT_SWIMMERM_SETH, SWIMMERM, SETH, SwimmermSethSeenText, SwimmermSethBeatenText, 0, SwimmermSethScript

SwimmermSethScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1ac873
	waitbutton
	closetext
	end

TrainerSwimmerfNikki:
	trainer EVENT_BEAT_SWIMMERF_NIKKI, SWIMMERF, NIKKI, SwimmerfNikkiSeenText, SwimmerfNikkiBeatenText, 0, SwimmerfNikkiScript

SwimmerfNikkiScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1ac8f1
	waitbutton
	closetext
	end

TrainerFisherArnold:
	trainer EVENT_BEAT_FISHER_ARNOLD, FISHER, ARNOLD, FisherArnoldSeenText, FisherArnoldBeatenText, 0, FisherArnoldScript

FisherArnoldScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1ac95c
	waitbutton
	closetext
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

.Warps:
	db 0

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_SWIMMER_GIRL, 16, 11, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 3, TrainerSwimmerfNikki, -1
	person_event SPRITE_SWIMMER_GUY, 30, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 4, TrainerSwimmermSeth, -1
	person_event SPRITE_FISHER, 22, 14, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 1, TrainerFisherArnold, -1
