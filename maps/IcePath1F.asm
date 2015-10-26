IcePath1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ItemFragment_0x7e472:
	db HM_WATERFALL, 1

ItemFragment_0x7e474:
	db PP_UP, 1

ItemFragment_0x7e476:
	db PROTEIN, 1

IcePath1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $13, $4, 1, ROUTE_44
	warp_def $1b, $24, 7, BLACKTHORN_CITY
	warp_def $5, $25, 1, ICE_PATH_B1F
	warp_def $d, $25, 7, ICE_PATH_B1F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_POKE_BALL, 7, 31, $1, 0, 0, -1, -1, 0, 1, 0, ItemFragment_0x7e472, EVENT_GOT_HM07_WATERFALL
	person_event SPRITE_POKE_BALL, 23, 32, $1, 0, 0, -1, -1, 0, 1, 0, ItemFragment_0x7e474, EVENT_ICE_PATH_1F_PP_UP
	person_event SPRITE_POKE_BALL, 9, 35, $1, 0, 0, -1, -1, 0, 1, 0, ItemFragment_0x7e476, EVENT_ICE_PATH_1F_PROTEIN
