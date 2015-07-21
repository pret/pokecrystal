MahoganyRedGyaradosSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

BlackBeltScript_0x19997f:
	jumptextfaceplayer UnknownText_0x19999c

TeacherScript_0x199982:
	faceplayer
	loadfont
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue UnknownScript_0x199990
	writetext UnknownText_0x199a0e
	closetext
	loadmovesprites
	end

UnknownScript_0x199990:
	writetext UnknownText_0x199a3d
	closetext
	loadmovesprites
	end

UnknownScript_0x195996:
	jumpstd picturebookshelf

UnknownScript_0x195999:
	jumpstd magazinebookshelf

UnknownText_0x19999c:
	text "I heard that a red"
	line "GYARADOS appeared"
	cont "at the LAKE."

	para "That's odd, since"
	line "even ordinary"

	para "GYARADOS are rare"
	line "in that lake…"
	done

UnknownText_0x199a0e:
	text "My favorite radio"
	line "program? I'd say"
	cont "#MON MUSIC."
	done

UnknownText_0x199a3d:
	text "I've been hearing"
	line "laughter on the"

	para "radio…"
	line "It's creepy."
	done

MahoganyRedGyaradosSpeechHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 2, GROUP_MAHOGANY_TOWN, MAP_MAHOGANY_TOWN
	warp_def $7, $3, 2, GROUP_MAHOGANY_TOWN, MAP_MAHOGANY_TOWN

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 2
	person_event SPRITE_BLACK_BELT, 7, 6, OW_LEFT | $1, $0, -1, -1, $0, 0, BlackBeltScript_0x19997f, -1
	person_event SPRITE_TEACHER, 9, 10, OW_UP | $0, $10, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, TeacherScript_0x199982, -1
