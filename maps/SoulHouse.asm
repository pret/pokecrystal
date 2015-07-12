SoulHouse_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

GrampsScript_0x7ec47:
	jumptextfaceplayer UnknownText_0x7ec53

TeacherScript_0x7ec4a:
	jumptextfaceplayer UnknownText_0x7ed4d

LassScript_0x7ec4d:
	jumptextfaceplayer UnknownText_0x7edb1

GrannyScript_0x7ec50:
	jumptextfaceplayer UnknownText_0x7eddb

UnknownText_0x7ec53:
	text "MR.FUJI: Welcome."

	para "Hmm… You appear to"
	line "be raising your"

	para "#MON in a kind"
	line "and loving manner."

	para "#MON lovers"
	line "come here to pay"

	para "their respects to"
	line "departed #MON."

	para "Please offer con-"
	line "dolences for the"

	para "souls of the de-"
	line "parted #MON."

	para "I'm sure that will"
	line "make them happy."
	done

UnknownText_0x7ed4d:
	text "There are other"
	line "graves of #MON"
	cont "here, I think."

	para "There are many"
	line "chambers that only"
	cont "MR.FUJI may enter."
	done

UnknownText_0x7edb1:
	text "I came with my mom"
	line "to visit #MON"
	cont "graves…"
	done

UnknownText_0x7eddb:
	text "The #MON that"
	line "lived with me…"

	para "I loved them like"
	line "my grandchildren…"
	done

SoulHouse_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $4, 6, GROUP_LAVENDER_TOWN, MAP_LAVENDER_TOWN
	warp_def $7, $5, 6, GROUP_LAVENDER_TOWN, MAP_LAVENDER_TOWN

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 4
	person_event SPRITE_GRAMPS, 6, 8, $6, $0, 255, 255, $90, 0, GrampsScript_0x7ec47, EVENT_ALWAYS_THERE
	person_event SPRITE_TEACHER, 7, 11, $5, $1, 255, 255, $90, 0, TeacherScript_0x7ec4a, EVENT_ALWAYS_THERE
	person_event SPRITE_LASS, 9, 6, $7, $0, 255, 255, $90, 0, LassScript_0x7ec4d, EVENT_ALWAYS_THERE
	person_event SPRITE_GRANNY, 7, 5, $7, $0, 255, 255, $90, 0, GrannyScript_0x7ec50, EVENT_ALWAYS_THERE
