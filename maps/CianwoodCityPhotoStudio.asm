const_value set 2
	const CIANWOODCITYPHOTOSTUDIO_FISHING_GURU

CianwoodCityPhotoStudio_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

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

CianwoodCityPhotoStudio_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 5, CIANWOOD_CITY
	warp_def $7, $3, 5, CIANWOOD_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_FISHING_GURU, 3, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, FishingGuruScript_0x9e0e0, -1
