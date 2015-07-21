CeruleanPoliceStation_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

FishingGuruScript_0x18804a:
	jumptextfaceplayer UnknownText_0x18805a

PokefanFScript_0x18804d:
	jumptextfaceplayer UnknownText_0x1880c3

DiglettScript_0x188050:
	loadfont
	writetext UnknownText_0x1880e7
	cry DIGLETT
	closetext
	loadmovesprites
	end

UnknownText_0x18805a:
	text "I heard that some"
	line "shady character is"
	cont "skulking about."

	para "I won't stand for"
	line "it if he turns out"
	cont "to be a thief."
	done

UnknownText_0x1880c3:
	text "We were held up by"
	line "robbers before."
	done

UnknownText_0x1880e7:
	text "DIGLETT: Dug dug."
	done

CeruleanPoliceStation_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 2, GROUP_CERULEAN_CITY, MAP_CERULEAN_CITY
	warp_def $7, $3, 2, GROUP_CERULEAN_CITY, MAP_CERULEAN_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_FISHING_GURU, 5, 9, OW_UP | $3, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, FishingGuruScript_0x18804a, -1
	person_event SPRITE_POKEFAN_F, 8, 9, OW_LEFT | $0, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, PokefanFScript_0x18804d, -1
	person_event SPRITE_DIGLETT, 9, 7, OW_UP | $12, $0, -1, -1, (PAL_OW_BROWN << 4) | $80, 0, DiglettScript_0x188050, -1
