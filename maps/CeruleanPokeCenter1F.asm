CeruleanPokeCenter1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

NurseScript_0x18820f:
	jumpstd pokecenternurse

SuperNerdScript_0x188212:
	special Function10630f
	iftrue UnknownScript_0x18821b
	jumptextfaceplayer UnknownText_0x188221

UnknownScript_0x18821b:
	jumptextfaceplayer UnknownText_0x18828c

GymGuyScript_0x18821e:
	jumptextfaceplayer UnknownText_0x1882ff

UnknownText_0x188221:
	text "For battles, I'd"
	line "much rather use"

	para "#MON I've been"
	line "raising, even if"

	para "they're weaker"
	line "than some newly"
	cont "caught #MON."
	done

UnknownText_0x18828c:
	text "Do you battle by"
	line "mobile phone?"

	para "If time runs out"
	line "during a battle,"

	para "waiting to see who"
	line "won is really"
	cont "nerve wracking."
	done

UnknownText_0x1882ff:
	text "The MAGNET TRAIN"
	line "travels at over"

	para "340 mph. It goes"
	line "between KANTO and"

	para "JOHTO in almost no"
	line "time at all."

	para "It really makes"
	line "JOHTO accessible."
	done

CeruleanPokeCenter1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $7, $3, 4, GROUP_CERULEAN_CITY, MAP_CERULEAN_CITY
	warp_def $7, $4, 4, GROUP_CERULEAN_CITY, MAP_CERULEAN_CITY
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_NURSE, 5, 7, OW_UP | $2, $0, -1, -1, $0, 0, NurseScript_0x18820f, -1
	person_event SPRITE_SUPER_NERD, 8, 12, OW_UP | $1, $1, -1, -1, $0, 0, SuperNerdScript_0x188212, -1
	person_event SPRITE_GYM_GUY, 9, 5, OW_DOWN | $2, $11, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, GymGuyScript_0x18821e, -1
