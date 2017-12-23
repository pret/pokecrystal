const_value set 2
	const VIOLETNICKNAMESPEECHHOUSE_TEACHER
	const VIOLETNICKNAMESPEECHHOUSE_LASS
	const VIOLETNICKNAMESPEECHHOUSE_BIRD

VioletNicknameSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

VioletNicknameSpeechHouseTeacherScript:
	jumptextfaceplayer VioletNicknameSpeechHouseTeacherText

VioletNicknameSpeechHouseLassScript:
	jumptextfaceplayer VioletNicknameSpeechHouseLassText

BirdScript_0x693ef:
	faceplayer
	opentext
	writetext UnknownText_0x6947c
	cry PIDGEY
	waitbutton
	closetext
	end

VioletNicknameSpeechHouseTeacherText:
	text "She uses the names"
	line "of her favorite"
	cont "things to eat."

	para "For the nicknames"
	line "she gives to her"
	cont "#MON, I mean."
	done

VioletNicknameSpeechHouseLassText:
	text "I call my PIDGEY"
	line "STRAWBERRY!"
	done

UnknownText_0x6947c:
	text "STRAWBERRY: Pijji!"
	done

VioletNicknameSpeechHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $3, 4, VIOLET_CITY
	warp_def $7, $4, 4, VIOLET_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_TEACHER, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, VioletNicknameSpeechHouseTeacherScript, -1
	person_event SPRITE_LASS, 4, 6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, PERSONTYPE_SCRIPT, 0, VioletNicknameSpeechHouseLassScript, -1
	person_event SPRITE_BIRD, 2, 5, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, PAL_NPC_BROWN, PERSONTYPE_SCRIPT, 0, BirdScript_0x693ef, -1
