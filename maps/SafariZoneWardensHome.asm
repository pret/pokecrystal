const_value set 2
	const SAFARIZONEWARDENSHOME_LASS

SafariZoneWardensHome_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

WardensGranddaughter:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_WARDENS_GRANDDAUGHTER
	iftrue .AlreadyMet
	writetext WardensGranddaughterText1
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_WARDENS_GRANDDAUGHTER
	end
.AlreadyMet:
	writetext WardensGranddaughterText2
	waitbutton
	closetext
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
	warp_def $7, $2, 6, FUCHSIA_CITY
	warp_def $7, $3, 6, FUCHSIA_CITY

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
	person_event SPRITE_LASS, 4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, WardensGranddaughter, -1
