OlivineLighthouse1F_MapScriptHeader: ; 0x5ae65
	; trigger count
	db 0

	; callback count
	db 0
; 0x5ae67

SailorScript_0x5ae67: ; 0x5ae67
	jumptextfaceplayer UnknownText_0x5ae6d
; 0x5ae6a

PokefanFScript_0x5ae6a: ; 0x5ae6a
	jumptextfaceplayer UnknownText_0x5aec2
; 0x5ae6d

UnknownText_0x5ae6d: ; 0x5ae6d
	text "People train at"
	line "this LIGHTHOUSE."

	para "It's not easy to"
	line "climb because of"
	cont "all the trainers."
	done
; 0x5aec2

UnknownText_0x5aec2: ; 0x5aec2
	text "In the past, #-"
	line "MON used to light"

	para "the sea around"
	line "OLIVINE at night."

	para "The LIGHTHOUSE was"
	line "made in honor of"
	cont "those #MON."
	done
; 0x5af36

OlivineLighthouse1F_MapEventHeader: ; 0x5af36
	; filler
	db 0, 0

	; warps
	db 5
	warp_def $11, $a, 9, GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY
	warp_def $11, $b, 9, GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY
	warp_def $b, $3, 1, GROUP_OLIVINE_LIGHTHOUSE_2F, MAP_OLIVINE_LIGHTHOUSE_2F
	warp_def $d, $10, 3, GROUP_OLIVINE_LIGHTHOUSE_2F, MAP_OLIVINE_LIGHTHOUSE_2F
	warp_def $d, $11, 4, GROUP_OLIVINE_LIGHTHOUSE_2F, MAP_OLIVINE_LIGHTHOUSE_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event SPRITE_SAILOR, 6, 12, $6, $0, 255, 255, $0, 0, SailorScript_0x5ae67, $ffff
	person_event SPRITE_POKEFAN_F, 13, 20, $4, $20, 255, 255, $0, 0, PokefanFScript_0x5ae6a, $ffff
; 0x5af6f
