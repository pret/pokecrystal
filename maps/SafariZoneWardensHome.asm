	object_const_def
	const SAFARIZONEWARDENSHOME_LASS

SafariZoneWardensHome_MapScripts:
	def_scene_scripts

	def_callbacks

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
	jumpstd PictureBookshelfScript

WardensGranddaughterText1:
	text "Mon pépé est le"
	line "GARDIEN du PARC"
	cont "SAFARI."

	para "Enfin..."
	line "Il l'était."

	para "Il a décidé de"
	line "prendre des vacan-"

	para "ces et de voyager"
	line "tout seul."

	para "Il a démissionné"
	line "juste comme ça."
	done

WardensGranddaughterText2:
	text "Les gens étaient"
	line "déçus d'apprendre"

	para "la fermeture du"
	line "PARC SAFARI mais"
	cont "pépé est si têtu."
	done

WardenPhotoText:
	text "C'est la photo"
	line "d'un vieil homme"

	para "entouré de"
	line "#MON."
	done

SafariZonePhotoText:
	text "C'est la photo"
	line "d'une grande plai-"

	para "ne verdoyante avec"
	line "des #MON rares"
	cont "tout partout."
	done

SafariZoneWardensHome_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, FUCHSIA_CITY, 6
	warp_event  3,  7, FUCHSIA_CITY, 6

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, WardensHomeBookshelf
	bg_event  1,  1, BGEVENT_READ, WardensHomeBookshelf
	bg_event  7,  0, BGEVENT_READ, WardenPhoto
	bg_event  9,  0, BGEVENT_READ, SafariZonePhoto

	def_object_events
	object_event  2,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WardensGranddaughter, -1
