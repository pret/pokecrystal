MrFujisHouse_MapScriptHeader: ; 0x7e8c8
	; trigger count
	db 0

	; callback count
	db 0
; 0x7e8ca

SuperNerdScript_0x7e8ca: ; 0x7e8ca
	jumptextfaceplayer UnknownText_0x7e8f1
; 0x7e8cd

LassScript_0x7e8cd: ; 0x7e8cd
	jumptextfaceplayer UnknownText_0x7e940
; 0x7e8d0

RhydonScript_0x7e8d0: ; 0x7e8d0
	loadfont
	2writetext UnknownText_0x7e9b6
	cry PSYDUCK
	closetext
	loadmovesprites
	end
; 0x7e8da

GrowlitheScript_0x7e8da: ; 0x7e8da
	loadfont
	2writetext UnknownText_0x7e9c9
	cry NIDORINO
	closetext
	loadmovesprites
	end
; 0x7e8e4

MoltresScript_0x7e8e4: ; 0x7e8e4
	loadfont
	2writetext UnknownText_0x7e9da
	cry PIDGEY
	closetext
	loadmovesprites
	end
; 0x7e8ee

MapMrFujisHouseSignpost1Script: ; 0x7e8ee
	jumpstd $0001
; 0x7e8f1

UnknownText_0x7e8f1: ; 0x7e8f1
	text "MR.FUJI does live"
	line "here, but he's not"

	para "home now."

	para "He should be at"
	line "the SOUL HOUSE."
	done
; 0x7e940

UnknownText_0x7e940: ; 0x7e940
	text "Some cold-hearted"
	line "people stop caring"
	cont "for their #MON."

	para "Grandpa takes in"
	line "the poor homeless"

	para "#MON and takes"
	line "care of them."
	done
; 0x7e9b6

UnknownText_0x7e9b6: ; 0x7e9b6
	text "PSYDUCK: Gu-guwa?"
	done
; 0x7e9c9

UnknownText_0x7e9c9: ; 0x7e9c9
	text "NIDORINO: Gyun!"
	done
; 0x7e9da

UnknownText_0x7e9da: ; 0x7e9da
	text "PIDGEY: Pijji!"
	done
; 0x7e9ea

MrFujisHouse_MapEventHeader: ; 0x7e9ea
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 2, GROUP_LAVENDER_TOWN, MAP_LAVENDER_TOWN
	warp_def $7, $3, 2, GROUP_LAVENDER_TOWN, MAP_LAVENDER_TOWN

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 0, $0, MapMrFujisHouseSignpost1Script
	signpost 1, 1, $0, MapMrFujisHouseSignpost1Script

	; people-events
	db 5
	person_event SPRITE_SUPER_NERD, 5, 8, $6, $0, 255, 255, $a0, 0, SuperNerdScript_0x7e8ca, $ffff
	person_event SPRITE_LASS, 8, 7, $2, $11, 255, 255, $0, 0, LassScript_0x7e8cd, $ffff
	person_event SPRITE_RHYDON, 8, 11, $16, $0, 255, 255, $0, 0, RhydonScript_0x7e8d0, $ffff
	person_event SPRITE_GROWLITHE, 9, 9, $16, $0, 255, 255, $90, 0, GrowlitheScript_0x7e8da, $ffff
	person_event SPRITE_MOLTRES, 7, 5, $16, $0, 255, 255, $b0, 0, MoltresScript_0x7e8e4, $ffff
; 0x7ea45

