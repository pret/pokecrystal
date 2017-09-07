const_value set 2
	const SILPHCO1F_RECEPTIONIST
	const SILPHCO1F_OFFICER

SilphCo1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

SilphCoReceptionist:
	jumptextfaceplayer SilphCoReceptionistText

OfficerScript_0x18abe8:
	faceplayer
	opentext
	checkevent EVENT_GOT_UP_GRADE
	iftrue UnknownScript_0x18abfd
	writetext UnknownText_0x18ac36
	buttonsound
	verbosegiveitem UP_GRADE
	iffalse UnknownScript_0x18ac01
	setevent EVENT_GOT_UP_GRADE
UnknownScript_0x18abfd:
	writetext UnknownText_0x18aca8
	waitbutton
UnknownScript_0x18ac01:
	closetext
	end

SilphCoReceptionistText:
	text "Welcome. This is"
	line "SILPH CO.'s HEAD"
	cont "OFFICE BUILDING."
	done

UnknownText_0x18ac36:
	text "Only employees are"
	line "permitted to go"
	cont "upstairs."

	para "But since you came"
	line "such a long way,"

	para "have this neat"
	line "little souvenir."
	done

UnknownText_0x18aca8:
	text "It's SILPH CO.'s"
	line "latest product."

	para "It's not for sale"
	line "anywhere yet."
	done

SilphCo1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 7, SAFFRON_CITY
	warp_def $7, $3, 7, SAFFRON_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 2
	person_event SPRITE_RECEPTIONIST, 2, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SilphCoReceptionist, -1
	person_event SPRITE_OFFICER, 1, 13, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, OfficerScript_0x18abe8, -1
