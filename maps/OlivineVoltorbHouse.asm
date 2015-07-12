OlivineVoltorbHouse_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

Tim:
	faceplayer
	loadfont
	trade $2
	closetext
	loadmovesprites
	end

TimsHouseBookshelf:
	jumpstd magazinebookshelf

OlivineVoltorbHouse_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 3, GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY
	warp_def $7, $3, 3, GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 0, $0, TimsHouseBookshelf
	signpost 1, 1, $0, TimsHouseBookshelf

	; people-events
	db 1
	person_event SPRITE_FISHING_GURU, 7, 6, $3, $0, 255, 255, $80, 0, Tim, EVENT_ALWAYS_THERE
