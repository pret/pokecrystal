IcePathB3F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ItemFragment_0x7e66f:
	db NEVERMELTICE, 1

IcePathB3FRock:
	jumpstd smashrock

IcePathB3F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $5, $3, 2, ICE_PATH_B2F_MAHOGANY_SIDE
	warp_def $5, $f, 2, ICE_PATH_B2F_BLACKTHORN_SIDE

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 2
	person_event SPRITE_POKE_BALL, 7, 5, SPRITEMOVEDATA_01, 0, 0, -1, -1, 0, 1, 0, ItemFragment_0x7e66f, EVENT_ICE_PATH_B3F_NEVERMELTICE
	person_event SPRITE_ROCK, 6, 6, SPRITEMOVEDATA_18, 0, 0, -1, -1, 0, 0, 0, IcePathB3FRock, -1
