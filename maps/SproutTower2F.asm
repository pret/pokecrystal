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
	db $0, "However hard we", $4f
	db "battle, the TOWER", $55
	db "will stand strong.", $57
; 0x1847df

SageNicoBeatenText: ; 0x1847df
	db $0, "I fought hard but", $4f
	db "I'm too weak.", $57
; 0x1847ff

UnknownText_0x1847ff: ; 0x1847ff
	db $0, "The flexible pil-", $4f
	db "lar protects the", $51
	db "TOWER, even from", $4f
	db "earthquakes.", $57
; 0x184841

SageEdmondSeenText: ; 0x184841
	db $0, "…Sway like leaves", $4f
	db "in the wind…", $57
; 0x184861

SageEdmondBeatenText: ; 0x184861
	db $0, "Oh, I'm weak!", $57
; 0x18486f

UnknownText_0x18486f: ; 0x18486f
	db $0, "I tried to copy", $4f
	db "BELLSPROUT's", $51
	db "gentle movements", $4f
	db "for battle…", $51
	db "But I didn't train", $4f
	db "well enough.", $57
; 0x1848c8

UnknownText_0x1848c8: ; 0x1848c8
	db $0, "A #MON statue…", $51
	db "It looks very", $4f
	db "distinguished.", $57
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

