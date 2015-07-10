OlivineLighthouse4F_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

TrainerLassConnie:
	; bit/flag number
	dw EVENT_BEAT_LASS_CONNIE

	; trainer group && trainer id
	db LASS, CONNIE1

	; text when seen
	dw LassConnie1SeenText

	; text when trainer beaten
	dw LassConnie1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw LassConnie1Script

LassConnie1Script:
	talkaftercancel
	loadfont
	writetext UnknownText_0x5b63c
	closetext
	loadmovesprites
	end

TrainerSailorKent:
	; bit/flag number
	dw EVENT_BEAT_SAILOR_KENT

	; trainer group && trainer id
	db SAILOR, KENT

	; text when seen
	dw SailorKentSeenText

	; text when trainer beaten
	dw SailorKentBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SailorKentScript

SailorKentScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x5b584
	closetext
	loadmovesprites
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

	; warps
	db 10
	warp_def $3, $d, 1, GROUP_OLIVINE_LIGHTHOUSE_3F, MAP_OLIVINE_LIGHTHOUSE_3F
	warp_def $5, $3, 2, GROUP_OLIVINE_LIGHTHOUSE_5F, MAP_OLIVINE_LIGHTHOUSE_5F
	warp_def $7, $9, 3, GROUP_OLIVINE_LIGHTHOUSE_5F, MAP_OLIVINE_LIGHTHOUSE_5F
	warp_def $5, $9, 3, GROUP_OLIVINE_LIGHTHOUSE_3F, MAP_OLIVINE_LIGHTHOUSE_3F
	warp_def $9, $10, 6, GROUP_OLIVINE_LIGHTHOUSE_3F, MAP_OLIVINE_LIGHTHOUSE_3F
	warp_def $9, $11, 7, GROUP_OLIVINE_LIGHTHOUSE_3F, MAP_OLIVINE_LIGHTHOUSE_3F
	warp_def $3, $8, 8, GROUP_OLIVINE_LIGHTHOUSE_3F, MAP_OLIVINE_LIGHTHOUSE_3F
	warp_def $3, $9, 9, GROUP_OLIVINE_LIGHTHOUSE_3F, MAP_OLIVINE_LIGHTHOUSE_3F
	warp_def $7, $10, 4, GROUP_OLIVINE_LIGHTHOUSE_5F, MAP_OLIVINE_LIGHTHOUSE_5F
	warp_def $7, $11, 5, GROUP_OLIVINE_LIGHTHOUSE_5F, MAP_OLIVINE_LIGHTHOUSE_5F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event SPRITE_SAILOR, 18, 11, $8, $0, 255, 255, $92, 3, TrainerSailorKent, $ffff
	person_event SPRITE_LASS, 6, 15, $6, $0, 255, 255, $92, 1, TrainerLassConnie, $ffff
