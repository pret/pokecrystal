const_value set 2
	const OLIVINELIGHTHOUSE4F_SAILOR
	const OLIVINELIGHTHOUSE4F_LASS

OlivineLighthouse4F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerLassConnie:
	trainer EVENT_BEAT_LASS_CONNIE, LASS, CONNIE1, LassConnie1SeenText, LassConnie1BeatenText, 0, LassConnie1Script

LassConnie1Script:
	end_if_just_battled
	opentext
	writetext UnknownText_0x5b63c
	waitbutton
	closetext
	end

TrainerSailorKent:
	trainer EVENT_BEAT_SAILOR_KENT, SAILOR, KENT, SailorKentSeenText, SailorKentBeatenText, 0, SailorKentScript

SailorKentScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x5b584
	waitbutton
	closetext
	end

SailorKentSeenText:
	text "JASMINE must be"
	line "worried sick about"
	cont "the #MON here."

	para "She won't even"
	line "smile these days."
	done

SailorKentBeatenText:
	text "I can't manage a"
	line "smile either…"
	done

UnknownText_0x5b584:
	text "Speaking of sick,"
	line "I've heard there's"

	para "a good PHARMACY in"
	line "CIANWOOD."
	done

LassConnie1SeenText:
	text "JASMINE is this"
	line "city's GYM LEADER."

	para "I mean to bring"
	line "her back with me."

	para "Nobody had better"
	line "get in my way!"
	done

LassConnie1BeatenText:
	text "Aaack! My #MON!"
	done

UnknownText_0x5b63c:
	text "Right. Anybody"
	line "would be worried"
	cont "if his or her own"
	cont "#MON were hurt."

	para "I'll pray for the"
	line "#MON here, so"

	para "JASMINE can come"
	line "back to the GYM."
	done

OlivineLighthouse4F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 10
	warp_def $3, $d, 1, OLIVINE_LIGHTHOUSE_3F
	warp_def $5, $3, 2, OLIVINE_LIGHTHOUSE_5F
	warp_def $7, $9, 3, OLIVINE_LIGHTHOUSE_5F
	warp_def $5, $9, 3, OLIVINE_LIGHTHOUSE_3F
	warp_def $9, $10, 6, OLIVINE_LIGHTHOUSE_3F
	warp_def $9, $11, 7, OLIVINE_LIGHTHOUSE_3F
	warp_def $3, $8, 8, OLIVINE_LIGHTHOUSE_3F
	warp_def $3, $9, 9, OLIVINE_LIGHTHOUSE_3F
	warp_def $7, $10, 4, OLIVINE_LIGHTHOUSE_5F
	warp_def $7, $11, 5, OLIVINE_LIGHTHOUSE_5F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 2
	person_event SPRITE_SAILOR, 14, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerSailorKent, -1
	person_event SPRITE_LASS, 2, 11, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerLassConnie, -1
