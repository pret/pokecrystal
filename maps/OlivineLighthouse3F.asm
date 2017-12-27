const_value set 2
	const OLIVINELIGHTHOUSE3F_SAILOR
	const OLIVINELIGHTHOUSE3F_GENTLEMAN
	const OLIVINELIGHTHOUSE3F_YOUNGSTER
	const OLIVINELIGHTHOUSE3F_POKE_BALL

OlivineLighthouse3F_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

TrainerBirdKeeperTheo:
	trainer EVENT_BEAT_BIRD_KEEPER_THEO, BIRD_KEEPER, THEO, BirdKeeperTheoSeenText, BirdKeeperTheoBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext BirdKeeperTheoAfterBattleText
	waitbutton
	closetext
	end

TrainerGentlemanPreston:
	trainer EVENT_BEAT_GENTLEMAN_PRESTON, GENTLEMAN, PRESTON, GentlemanPrestonSeenText, GentlemanPrestonBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext GentlemanPrestonAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorTerrell:
	trainer EVENT_BEAT_SAILOR_TERRELL, SAILOR, TERRELL, SailorTerrellSeenText, SailorTerrellBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SailorTerrellAfterBattleText
	waitbutton
	closetext
	end

OlivineLighthouse3FEther:
	itemball ETHER

BirdKeeperTheoSeenText:
	text "Why are you here?"
	line "Are you just going"

	para "to gawk? I suggest"
	line "that you leave!"
	done

BirdKeeperTheoBeatenText:
	text "You really are"
	line "concerned…"
	done

BirdKeeperTheoAfterBattleText:
	text "How the heck do"
	line "you go up?"

	para "I want to visit"
	line "the sick #MON,"

	para "but I can't get up"
	line "there…"
	done

SailorTerrellSeenText:
	text "Sailors are both"
	line "kind and strong."
	cont "How about you?"
	done

SailorTerrellBeatenText:
	text "You are both kind"
	line "and strong…"
	done

SailorTerrellAfterBattleText:
	text "Every time I come"
	line "back to OLIVINE, I"
	cont "visit the GYM."

	para "The GYM LEADER's"
	line "#MON type has"

	para "changed without me"
	line "noticing."
	done

GentlemanPrestonSeenText:
	text "I travel the world"
	line "to train my #-"
	cont "MON. I wish to"
	cont "battle with you."
	done

GentlemanPrestonBeatenText:
	text "…sigh… I must"
	line "train some more…"
	done

GentlemanPrestonAfterBattleText:
	text "JASMINE used to"
	line "use rock #MON"
	cont "like ONIX."
	done

OlivineLighthouse3F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 9
	warp_def $3, $d, 1, OLIVINE_LIGHTHOUSE_4F
	warp_def $3, $5, 2, OLIVINE_LIGHTHOUSE_2F
	warp_def $5, $9, 4, OLIVINE_LIGHTHOUSE_4F
	warp_def $b, $10, 5, OLIVINE_LIGHTHOUSE_2F
	warp_def $b, $11, 6, OLIVINE_LIGHTHOUSE_2F
	warp_def $9, $10, 5, OLIVINE_LIGHTHOUSE_4F
	warp_def $9, $11, 6, OLIVINE_LIGHTHOUSE_4F
	warp_def $3, $8, 7, OLIVINE_LIGHTHOUSE_4F
	warp_def $3, $9, 8, OLIVINE_LIGHTHOUSE_4F

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 4
	object_event SPRITE_SAILOR, 2, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSailorTerrell, -1
	object_event SPRITE_GENTLEMAN, 5, 13, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerGentlemanPreston, -1
	object_event SPRITE_YOUNGSTER, 9, 3, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperTheo, -1
	object_event SPRITE_POKE_BALL, 2, 8, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OlivineLighthouse3FEther, EVENT_OLIVINE_LIGHTHOUSE_3F_ETHER
