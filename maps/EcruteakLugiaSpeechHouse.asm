const_value set 2
	const ECRUTEAKLUGIASPEECHHOUSE_GRAMPS
	const ECRUTEAKLUGIASPEECHHOUSE_YOUNGSTER

EcruteakLugiaSpeechHouse_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

EcruteakLugiaSpeechHouseGrampsScript:
	jumptextfaceplayer EcruteakLugiaSpeechHouseGrampsText

EcruteakLugiaSpeechHouseYoungsterScript:
	jumptextfaceplayer EcruteakLugiaSpeechHouseYoungsterText

LugiaSpeechHouseRadio:
	jumpstd radio2

EcruteakLugiaSpeechHouseGrampsText:
	text "This happened when"
	line "I was young."

	para "The sky suddenly"
	line "turned black. A"

	para "giant flying #-"
	line "MON was blocking"
	cont "out the sun."

	para "I wonder what that"
	line "#MON was? "

	para "It was like a bird"
	line "and a dragon."
	done

EcruteakLugiaSpeechHouseYoungsterText:
	text "Is there really a"
	line "#MON that big?"

	para "If it exists, it"
	line "must be powerful."
	done

EcruteakLugiaSpeechHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $3, 7, ECRUTEAK_CITY
	warp_def $7, $4, 7, ECRUTEAK_CITY

.CoordEvents:
	db 0

.BGEvents:
	db 1
	bg_event 1, 2, BGEVENT_READ, LugiaSpeechHouseRadio

.ObjectEvents:
	db 2
	object_event SPRITE_GRAMPS, 3, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakLugiaSpeechHouseGrampsScript, -1
	object_event SPRITE_YOUNGSTER, 4, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakLugiaSpeechHouseYoungsterScript, -1
