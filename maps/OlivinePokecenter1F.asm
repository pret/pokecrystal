const_value set 2 ; object constants
	const OLIVINEPOKECENTER1F_NURSE
	const OLIVINEPOKECENTER1F_FISHING_GURU
	const OLIVINEPOKECENTER1F_FISHER
	const OLIVINEPOKECENTER1F_TEACHER

OlivinePokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

NurseScript_0x9c002:
	jumpstd pokecenternurse

FishingGuruScript_0x9c005:
	jumpstd happinesschecknpc

OlivinePokecenter1FFisherScript:
	jumptextfaceplayer OlivinePokecenter1FFisherText

OlivinePokecenter1FTeacherScript:
	jumptextfaceplayer OlivinePokecenter1FTeacherText

OlivinePokecenter1FFisherText:
	text "The SAILOR in the"
	line "OLIVINE CAFE next"

	para "door is really"
	line "generous."

	para "He taught my"
	line "#MON STRENGTH."

	para "Now it can move"
	line "big boulders."
	done

OlivinePokecenter1FTeacherText:
	text "There's a person"
	line "in CIANWOOD CITY"
	cont "across the sea."

	para "I heard him brag-"
	line "ging about his"
	cont "rare #MON."
	done

OlivinePokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 3, 7, 1, OLIVINE_CITY
	warp_event 4, 7, 1, OLIVINE_CITY
	warp_event 0, 7, 1, POKECENTER_2F

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event 3, 1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NurseScript_0x9c002, -1
	object_event 8, 4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FishingGuruScript_0x9c005, -1
	object_event 2, 3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, OlivinePokecenter1FFisherScript, -1
	object_event 7, 1, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePokecenter1FTeacherScript, -1
