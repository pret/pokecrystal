	const_def 2 ; object constants
	const CIANWOODPHOTOSTUDIO_FISHING_GURU

CianwoodPhotoStudio_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FishingGuruScript_0x9e0e0:
	faceplayer
	opentext
	writetext UnknownText_0x9e0f9
	yesorno
	iffalse UnknownScript_0x9e0f3
	writetext UnknownText_0x9e142
	waitbutton
	special PhotoStudio
	waitbutton
	closetext
	end

UnknownScript_0x9e0f3:
	writetext UnknownText_0x9e156
	waitbutton
	closetext
	end

UnknownText_0x9e0f9:
	text "You have magnifi-"
	line "cent #MON with"
	cont "you."

	para "How about a photo"
	line "for a souvenir?"
	done

UnknownText_0x9e142:
	text "OK! Big smile now!"
	done

UnknownText_0x9e156:
	text "Oh, that's too"
	line "bad. I thought it"

	para "would be a great"
	line "memento…"
	done

CianwoodPhotoStudio_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 2, 7, 5, CIANWOOD_CITY
	warp_event 3, 7, 5, CIANWOOD_CITY

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 2, 3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FishingGuruScript_0x9e0e0, -1
