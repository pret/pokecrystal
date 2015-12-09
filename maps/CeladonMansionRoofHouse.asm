const_value set 2
	const CELADONMANSIONROOFHOUSE_PHARMACIST

CeladonMansionRoofHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

PharmacistScript_0x71afd:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM03_CURSE
	iftrue UnknownScript_0x71b21
	writetext UnknownText_0x71b27
	buttonsound
	checknite
	iftrue UnknownScript_0x71b14
	writetext UnknownText_0x71b4a
	waitbutton
	closetext
	end

UnknownScript_0x71b14:
	writetext UnknownText_0x71ba3
	buttonsound
	verbosegiveitem TM_CURSE
	iffalse UnknownScript_0x71b25
	setevent EVENT_GOT_TM03_CURSE
UnknownScript_0x71b21:
	writetext UnknownText_0x71db3
	waitbutton
UnknownScript_0x71b25:
	closetext
	end

UnknownText_0x71b27:
	text "Let me recount a"
	line "terrifying tale…"
	done

UnknownText_0x71b4a:
	text "Then again, it's"
	line "not as scary while"

	para "it's still light"
	line "outside."

	para "Come back after"
	line "sunset, OK?"
	done

UnknownText_0x71ba3:
	text "Once upon a time,"
	line "there was a little"

	para "boy who was given"
	line "a new BICYCLE…"

	para "He wanted to try"
	line "it right away…"

	para "He was having so"
	line "much fun that he"

	para "didn't notice the"
	line "sun had set…"

	para "While riding home"
	line "in the pitch-black"

	para "night, the bike"
	line "suddenly slowed!"

	para "The pedals became"
	line "heavy!"

	para "When he stopped"
	line "pedaling, the bike"

	para "began slipping"
	line "backwards!"

	para "It was as if the"
	line "bike were cursed"

	para "and trying to drag"
	line "him into oblivion!"

	para "…"

	para "…"

	para "SHRIEEEEK!"

	para "The boy had been"
	line "riding uphill on"
	cont "CYCLING ROAD!"

	para "…"
	line "Ba-dum ba-dum!"

	para "For listening so"
	line "patiently, you may"
	cont "take this--TM03!"
	done

UnknownText_0x71db3:
	text "TM03 is CURSE."

	para "It's a terrifying"
	line "move that slowly"

	para "whittles down the"
	line "victim's HP."
	done

CeladonMansionRoofHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 3, CELADON_MANSION_ROOF
	warp_def $7, $3, 3, CELADON_MANSION_ROOF

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_PHARMACIST, 2, 3, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, PharmacistScript_0x71afd, -1
