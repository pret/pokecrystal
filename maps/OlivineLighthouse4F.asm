const_value set 2
	const OLIVINELIGHTHOUSE4F_SAILOR
	const OLIVINELIGHTHOUSE4F_LASS

OlivineLighthouse4F_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

TrainerLassConnie:
	trainer EVENT_BEAT_LASS_CONNIE, LASS, CONNIE1, LassConnie1SeenText, LassConnie1BeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext LassConnie1AfterBattleText
	waitbutton
	closetext
	end

TrainerSailorKent:
	trainer EVENT_BEAT_SAILOR_KENT, SAILOR, KENT, SailorKentSeenText, SailorKentBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SailorKentAfterBattleText
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

SailorKentAfterBattleText:
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

LassConnie1AfterBattleText:
	text "Right. Anybody"
	line "would be worried"
	cont "if his or her own"
	cont "#MON were hurt."

	para "I'll pray for the"
	line "#MON here, so"

	para "JASMINE can come"
	line "back to the GYM."
	done

OlivineLighthouse4F_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 10
	warp_def 13, 3, 1, OLIVINE_LIGHTHOUSE_3F
	warp_def 3, 5, 2, OLIVINE_LIGHTHOUSE_5F
	warp_def 9, 7, 3, OLIVINE_LIGHTHOUSE_5F
	warp_def 9, 5, 3, OLIVINE_LIGHTHOUSE_3F
	warp_def 16, 9, 6, OLIVINE_LIGHTHOUSE_3F
	warp_def 17, 9, 7, OLIVINE_LIGHTHOUSE_3F
	warp_def 8, 3, 8, OLIVINE_LIGHTHOUSE_3F
	warp_def 9, 3, 9, OLIVINE_LIGHTHOUSE_3F
	warp_def 16, 7, 4, OLIVINE_LIGHTHOUSE_5F
	warp_def 17, 7, 5, OLIVINE_LIGHTHOUSE_5F

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 2
	object_event 7, 14, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSailorKent, -1
	object_event 11, 2, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLassConnie, -1
