	object_const_def
	const PEWTERSNOOZESPEECHHOUSE_GIOVANNI
	const PEWTERSNOOZESPEECHHOUSE_PERSIAN

PewterSnoozeSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

PewterCityGiovanniScript:
    faceplayer
	opentext
	writetext PewterCityGiovanniIntroText
	yesorno
    iftrue .DoMatch
	; keep going if false
	
.DontDoMatch:
    writetext GiovanniMatchRefuseText
    waitbutton
    closetext
    end
	
.DoMatch:
    writetext GiovanniMatchAcceptText
    waitbutton
    closetext
    winlosstext GiovanniMatchLossText, 0
    loadtrainer GIOVANNI, GIOVANNI3
    loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
    startbattle
	reloadmapafterbattle
    opentext
    writetext GiovanniMatchAferText
    waitbutton
    closetext
    end
	
PewterSnoozeSpeechHousePersian:
	faceplayer
	opentext
	writetext PewterSnoozeSpeechHousePersianText
	cry PERSIAN
	waitbutton
	closetext
	end

PewterSnoozeSpeechHouseBookshelf:
	jumpstd PictureBookshelfScript

PewterCityGiovanniIntroText:
    text "Ah, <PLAY_G>!"
	line "So we meet again!"
	
	para "Welcome to my"
	line "home."
	
	para "It shall be so"
	line "for the time"
	cont "being."
	
	para "The skill and"
	line "confidence you've"
	cont "shown in TOHJO"
	cont "FALLS is most"
	cont "fascinating."
	
	para "I would like to"
	line "battle you once"
	cont "more."
	done 
	
GiovanniMatchAcceptText:
    text "I'll show you"
	line "true power!"
	done 
	
GiovanniMatchRefuseText:
    text "How dissapointing."
	done 
	
GiovanniMatchLossText:
    text "Ha! That was a"
    line "truly intense"
    cont "fight."
    done 
	
GiovanniMatchAferText:
    text "Hah… Your talent"
	line "is true."
	
	para "I hope we get"
	line "to battle again"
	cont "in the future."
	done 
	
PewterSnoozeSpeechHousePersianText:
    text "PERSIAN: Fufushaa!"
	done

PewterSnoozeSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, PEWTER_CITY, 5
	warp_event  3,  7, PEWTER_CITY, 5

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, PewterSnoozeSpeechHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, PewterSnoozeSpeechHouseBookshelf

	def_object_events
	object_event  5,  1, SPRITE_GIOVANNI, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PewterCityGiovanniScript, -1
	object_event  4,  1, SPRITE_PERSIAN, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterSnoozeSpeechHousePersian, -1
