SafariZoneWardensHome_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

WardensGranddaughter:
	faceplayer
	loadfont
	checkevent EVENT_TALKED_TO_WARDENS_GRANDDAUGHTER
	iftrue .AlreadyMet
	writetext WardensGranddaughterText1
	closetext
	loadmovesprites
	setevent EVENT_TALKED_TO_WARDENS_GRANDDAUGHTER
	end
.AlreadyMet
	writetext WardensGranddaughterText2
	closetext
	loadmovesprites
	end

WardenPhoto:
	jumptext WardenPhotoText

SafariZonePhoto:
	jumptext SafariZonePhotoText

WardensHomeBookshelf:
	jumpstd picturebookshelf

WardensGranddaughterText1:
	text "My grandpa is the"
	line "SAFARI ZONE WAR-"
	cont "DEN."

	para "At least he was…"

	para "He decided to go"
	line "on a vacation and"

	para "took off overseas"
	line "all by himself."

	para "He quit running"
	line "SAFARI ZONE just"
	cont "like that."
	done

WardensGranddaughterText2:
	text "Many people were"
	line "disappointed that"

	para "SAFARI ZONE closed"
	line "down, but Grandpa"
	cont "is so stubborn…"
	done

WardenPhotoText:
	text "It's a photo of a"
	line "grinning old man"

	para "who's surrounded"
	line "by #MON."
	done

SafariZonePhotoText:
	text "It's a photo of a"
	line "huge grassy plain"

	para "with rare #MON"
	line "frolicking in it."
	done

SafariZoneWardensHome_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 6, GROUP_FUCHSIA_CITY, MAP_FUCHSIA_CITY
	warp_def $7, $3, 6, GROUP_FUCHSIA_CITY, MAP_FUCHSIA_CITY

.XYTriggers:
	db 0

.Signposts:
	db 4
	signpost 1, 0, SIGNPOST_READ, WardensHomeBookshelf
	signpost 1, 1, SIGNPOST_READ, WardensHomeBookshelf
	signpost 0, 7, SIGNPOST_READ, WardenPhoto
	signpost 0, 9, SIGNPOST_READ, SafariZonePhoto

.PersonEvents:
	db 1
	person_event SPRITE_LASS, 8, 6, OW_LEFT | $1, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, WardensGranddaughter, -1
