SproutTower2F_MapScriptHeader: ; 0x18477a
	; trigger count
	db 0

	; callback count
	db 0
; 0x18477c

TrainerSageNico: ; 0x18477c
	; bit/flag number
	dw $412

	; trainer group && trainer id
	db SAGE, NICO

	; text when seen
	dw SageNicoSeenText

	; text when trainer beaten
	dw SageNicoBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SageNicoScript
; 0x184788

SageNicoScript: ; 0x184788
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1847ff
	closetext
	loadmovesprites
	end
; 0x184790

TrainerSageEdmond: ; 0x184790
	; bit/flag number
	dw $417

	; trainer group && trainer id
	db SAGE, EDMOND

	; text when seen
	dw SageEdmondSeenText

	; text when trainer beaten
	dw SageEdmondBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SageEdmondScript
; 0x18479c

SageEdmondScript: ; 0x18479c
	talkaftercancel
	loadfont
	2writetext UnknownText_0x18486f
	closetext
	loadmovesprites
	end
; 0x1847a4

MapSproutTower2FSignpost0Script: ; 0x1847a4
	jumptext UnknownText_0x1848c8
; 0x1847a7

ItemFragment_0x1847a7: ; 0x1847a7
	db X_ACCURACY, 1
; 0x1847a9

SageNicoSeenText: ; 0x1847a9
	text "However hard we"
	line "battle, the TOWER"
	cont "will stand strong."
	done
; 0x1847df

SageNicoBeatenText: ; 0x1847df
	text "I fought hard but"
	line "I'm too weak."
	done
; 0x1847ff

UnknownText_0x1847ff: ; 0x1847ff
	text "The flexible pil-"
	line "lar protects the"

	para "TOWER, even from"
	line "earthquakes."
	done
; 0x184841

SageEdmondSeenText: ; 0x184841
	text "…Sway like leaves"
	line "in the wind…"
	done
; 0x184861

SageEdmondBeatenText: ; 0x184861
	text "Oh, I'm weak!"
	done
; 0x18486f

UnknownText_0x18486f: ; 0x18486f
	text "I tried to copy"
	line "BELLSPROUT's"

	para "gentle movements"
	line "for battle…"

	para "But I didn't train"
	line "well enough."
	done
; 0x1848c8

UnknownText_0x1848c8: ; 0x1848c8
	text "A #MON statue…"

	para "It looks very"
	line "distinguished."
	done
; 0x1848f5

SproutTower2F_MapEventHeader: ; 0x1848f5
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $4, $6, 3, GROUP_SPROUT_TOWER_1F, MAP_SPROUT_TOWER_1F
	warp_def $6, $2, 4, GROUP_SPROUT_TOWER_1F, MAP_SPROUT_TOWER_1F
	warp_def $3, $11, 5, GROUP_SPROUT_TOWER_1F, MAP_SPROUT_TOWER_1F
	warp_def $e, $a, 1, GROUP_SPROUT_TOWER_3F, MAP_SPROUT_TOWER_3F

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 15, 12, $0, MapSproutTower2FSignpost0Script

	; people-events
	db 3
	person_event SPRITE_SAGE, 7, 16, $a, $0, 255, 255, $92, 4, TrainerSageNico, $ffff
	person_event SPRITE_SAGE, 18, 13, $8, $0, 255, 255, $92, 5, TrainerSageEdmond, $ffff
	person_event SPRITE_POKE_BALL, 5, 7, $1, $0, 255, 255, $1, 0, ItemFragment_0x1847a7, $0648
; 0x18493b

