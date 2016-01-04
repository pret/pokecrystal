const_value set 2
	const ECRUTEAKLUGIASPEECHHOUSE_GRAMPS
	const ECRUTEAKLUGIASPEECHHOUSE_YOUNGSTER

EcruteakLugiaSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

GrampsScript_0x99334:
	jumptextfaceplayer UnknownText_0x9933d

YoungsterScript_0x99337:
	jumptextfaceplayer UnknownText_0x993ec

LugiaSpeechHouseRadio:
	jumpstd radio2

UnknownText_0x9933d:
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

UnknownText_0x993ec:
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

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 1, 2, SIGNPOST_READ, LugiaSpeechHouseRadio

.PersonEvents:
	db 2
	person_event SPRITE_GRAMPS, 3, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GrampsScript_0x99334, -1
	person_event SPRITE_YOUNGSTER, 4, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x99337, -1
