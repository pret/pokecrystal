const_value set 2
	const SPROUTTOWER2F_SAGE1
	const SPROUTTOWER2F_SAGE2
	const SPROUTTOWER2F_POKE_BALL

SproutTower2F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerSageNico:
	trainer EVENT_BEAT_SAGE_NICO, SAGE, NICO, SageNicoSeenText, SageNicoBeatenText, 0, SageNicoScript

SageNicoScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1847ff
	waitbutton
	closetext
	end

TrainerSageEdmond:
	trainer EVENT_BEAT_SAGE_EDMOND, SAGE, EDMOND, SageEdmondSeenText, SageEdmondBeatenText, 0, SageEdmondScript

SageEdmondScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x18486f
	waitbutton
	closetext
	end

MapSproutTower2FSignpost0Script:
	jumptext UnknownText_0x1848c8

SproutTower2FXAccuracy:
	itemball X_ACCURACY

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
	warp_def $4, $6, 3, SPROUT_TOWER_1F
	warp_def $6, $2, 4, SPROUT_TOWER_1F
	warp_def $3, $11, 5, SPROUT_TOWER_1F
	warp_def $e, $a, 1, SPROUT_TOWER_3F

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 15, 12, SIGNPOST_READ, MapSproutTower2FSignpost0Script

.PersonEvents:
	db 3
	person_event SPRITE_SAGE, 3, 12, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerSageNico, -1
	person_event SPRITE_SAGE, 14, 9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 5, TrainerSageEdmond, -1
	person_event SPRITE_POKE_BALL, 1, 3, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, SproutTower2FXAccuracy, EVENT_SPROUT_TOWER2F_X_ACCURACY
