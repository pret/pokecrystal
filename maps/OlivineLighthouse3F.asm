const_value set 2
	const OLIVINELIGHTHOUSE3F_SAILOR
	const OLIVINELIGHTHOUSE3F_GENTLEMAN
	const OLIVINELIGHTHOUSE3F_YOUNGSTER
	const OLIVINELIGHTHOUSE3F_POKE_BALL

OlivineLighthouse3F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerBird_keeperTheo:
	trainer EVENT_BEAT_BIRD_KEEPER_THEO, BIRD_KEEPER, THEO, Bird_keeperTheoSeenText, Bird_keeperTheoBeatenText, 0, Bird_keeperTheoScript

Bird_keeperTheoScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x5b2df
	waitbutton
	closetext
	end

TrainerGentlemanPreston:
	trainer EVENT_BEAT_GENTLEMAN_PRESTON, GENTLEMAN, PRESTON, GentlemanPrestonSeenText, GentlemanPrestonBeatenText, 0, GentlemanPrestonScript

GentlemanPrestonScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x5b457
	waitbutton
	closetext
	end

TrainerSailorTerrell:
	trainer EVENT_BEAT_SAILOR_TERRELL, SAILOR, TERRELL, SailorTerrellSeenText, SailorTerrellBeatenText, 0, SailorTerrellScript

SailorTerrellScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x5b384
	waitbutton
	closetext
	end

OlivineLighthouse3FEther:
	itemball ETHER

Bird_keeperTheoSeenText:
	text "Why are you here?"
	line "Are you just going"

	para "to gawk? I suggest"
	line "that you leave!"
	done

Bird_keeperTheoBeatenText:
	text "You really are"
	line "concerned…"
	done

UnknownText_0x5b2df:
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

UnknownText_0x5b384:
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

UnknownText_0x5b457:
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

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 4
	person_event SPRITE_SAILOR, 2, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerSailorTerrell, -1
	person_event SPRITE_GENTLEMAN, 5, 13, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerGentlemanPreston, -1
	person_event SPRITE_YOUNGSTER, 9, 3, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerBird_keeperTheo, -1
	person_event SPRITE_POKE_BALL, 2, 8, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, OlivineLighthouse3FEther, EVENT_OLIVINE_LIGHTHOUSE_3F_ETHER
