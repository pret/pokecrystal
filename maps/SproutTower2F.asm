SproutTower2F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerSageNico:
	trainer EVENT_BEAT_SAGE_NICO, SAGE, NICO, SageNicoSeenText, SageNicoBeatenText, $0000, SageNicoScript

SageNicoScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1847ff
	closetext
	loadmovesprites
	end

TrainerSageEdmond:
	trainer EVENT_BEAT_SAGE_EDMOND, SAGE, EDMOND, SageEdmondSeenText, SageEdmondBeatenText, $0000, SageEdmondScript

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

.Warps:
	db 4
	warp_def $4, $6, 3, GROUP_SPROUT_TOWER_1F, MAP_SPROUT_TOWER_1F
	warp_def $6, $2, 4, GROUP_SPROUT_TOWER_1F, MAP_SPROUT_TOWER_1F
	warp_def $3, $11, 5, GROUP_SPROUT_TOWER_1F, MAP_SPROUT_TOWER_1F
	warp_def $e, $a, 1, GROUP_SPROUT_TOWER_3F, MAP_SPROUT_TOWER_3F

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 15, 12, SIGNPOST_READ, MapSproutTower2FSignpost0Script

.PersonEvents:
	db 3
	person_event SPRITE_SAGE, 7, 16, OW_LEFT | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 4, TrainerSageNico, -1
	person_event SPRITE_SAGE, 18, 13, OW_LEFT | $0, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 5, TrainerSageEdmond, -1
	person_event SPRITE_POKE_BALL, 5, 7, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x1847a7, EVENT_SPROUT_TOWER2F_X_ACCURACY
