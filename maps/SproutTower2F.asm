SproutTower2F_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

TrainerSageNico:
	; bit/flag number
	dw EVENT_BEAT_SAGE_NICO

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

SageNicoScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1847ff
	closetext
	loadmovesprites
	end

TrainerSageEdmond:
	; bit/flag number
	dw EVENT_BEAT_SAGE_EDMOND

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

SageEdmondScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x18486f
	closetext
	loadmovesprites
	end

MapSproutTower2FSignpost0Script:
	jumptext UnknownText_0x1848c8

ItemFragment_0x1847a7:
	db X_ACCURACY, 1

SageNicoSeenText:
	text "However hard we"
	line "battle, the TOWER"
	cont "will stand strong."
	done

SageNicoBeatenText:
	text "I fought hard but"
	line "I'm too weak."
	done

UnknownText_0x1847ff:
	text "The flexible pil-"
	line "lar protects the"

	para "TOWER, even from"
	line "earthquakes."
	done

SageEdmondSeenText:
	text "…Sway like leaves"
	line "in the wind…"
	done

SageEdmondBeatenText:
	text "Oh, I'm weak!"
	done

UnknownText_0x18486f:
	text "I tried to copy"
	line "BELLSPROUT's"

	para "gentle movements"
	line "for battle…"

	para "But I didn't train"
	line "well enough."
	done

UnknownText_0x1848c8:
	text "A #MON statue…"

	para "It looks very"
	line "distinguished."
	done

SproutTower2F_MapEventHeader:
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
	person_event SPRITE_SAGE, 7, 16, $a, $0, 255, 255, $92, 4, TrainerSageNico, EVENT_ALWAYS_THERE
	person_event SPRITE_SAGE, 18, 13, $8, $0, 255, 255, $92, 5, TrainerSageEdmond, EVENT_ALWAYS_THERE
	person_event SPRITE_POKE_BALL, 5, 7, $1, $0, 255, 255, $1, 0, ItemFragment_0x1847a7, EVENT_648
