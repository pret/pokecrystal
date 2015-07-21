SilphCo1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ReceptionistScript_0x18abe5:
	jumptextfaceplayer UnknownText_0x18ac03

OfficerScript_0x18abe8:
	faceplayer
	loadfont
	checkevent EVENT_GOT_UP_GRADE
	iftrue UnknownScript_0x18abfd
	writetext UnknownText_0x18ac36
	keeptextopen
	verbosegiveitem UP_GRADE, 1
	iffalse UnknownScript_0x18ac01
	setevent EVENT_GOT_UP_GRADE
UnknownScript_0x18abfd:
	writetext UnknownText_0x18aca8
	closetext
UnknownScript_0x18ac01:
	loadmovesprites
	end

UnknownText_0x18ac03:
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
	warp_def $7, $2, 7, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY
	warp_def $7, $3, 7, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 2
	person_event SPRITE_RECEPTIONIST, 6, 8, OW_UP | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, ReceptionistScript_0x18abe5, -1
	person_event SPRITE_OFFICER, 5, 17, OW_UP | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, OfficerScript_0x18abe8, -1
