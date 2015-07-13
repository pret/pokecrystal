OlivineLighthouse3F_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

TrainerBird_keeperTheo:
	; bit/flag number
	dw EVENT_BEAT_BIRD_KEEPER_THEO

	; trainer group && trainer id
	db BIRD_KEEPER, THEO

	; text when seen
	dw Bird_keeperTheoSeenText

	; text when trainer beaten
	dw Bird_keeperTheoBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Bird_keeperTheoScript

Bird_keeperTheoScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x5b2df
	closetext
	loadmovesprites
	end

TrainerGentlemanPreston:
	; bit/flag number
	dw EVENT_BEAT_GENTLEMAN_PRESTON

	; trainer group && trainer id
	db GENTLEMAN, PRESTON

	; text when seen
	dw GentlemanPrestonSeenText

	; text when trainer beaten
	dw GentlemanPrestonBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw GentlemanPrestonScript

GentlemanPrestonScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x5b457
	closetext
	loadmovesprites
	end

TrainerSailorTerrell:
	; bit/flag number
	dw EVENT_BEAT_SAILOR_TERRELL

	; trainer group && trainer id
	db SAILOR, TERRELL

	; text when seen
	dw SailorTerrellSeenText

	; text when trainer beaten
	dw SailorTerrellBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SailorTerrellScript

SailorTerrellScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x5b384
	closetext
	loadmovesprites
	end

ItemFragment_0x5b279:
	db ETHER, 1

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

	; warps
	db 9
	warp_def $3, $d, 1, GROUP_OLIVINE_LIGHTHOUSE_4F, MAP_OLIVINE_LIGHTHOUSE_4F
	warp_def $3, $5, 2, GROUP_OLIVINE_LIGHTHOUSE_2F, MAP_OLIVINE_LIGHTHOUSE_2F
	warp_def $5, $9, 4, GROUP_OLIVINE_LIGHTHOUSE_4F, MAP_OLIVINE_LIGHTHOUSE_4F
	warp_def $b, $10, 5, GROUP_OLIVINE_LIGHTHOUSE_2F, MAP_OLIVINE_LIGHTHOUSE_2F
	warp_def $b, $11, 6, GROUP_OLIVINE_LIGHTHOUSE_2F, MAP_OLIVINE_LIGHTHOUSE_2F
	warp_def $9, $10, 5, GROUP_OLIVINE_LIGHTHOUSE_4F, MAP_OLIVINE_LIGHTHOUSE_4F
	warp_def $9, $11, 6, GROUP_OLIVINE_LIGHTHOUSE_4F, MAP_OLIVINE_LIGHTHOUSE_4F
	warp_def $3, $8, 7, GROUP_OLIVINE_LIGHTHOUSE_4F, MAP_OLIVINE_LIGHTHOUSE_4F
	warp_def $3, $9, 8, GROUP_OLIVINE_LIGHTHOUSE_4F, MAP_OLIVINE_LIGHTHOUSE_4F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 4
	person_event SPRITE_SAILOR, 6, 13, $6, $0, 255, 255, $92, 1, TrainerSailorTerrell, -1
	person_event SPRITE_GENTLEMAN, 9, 17, $9, $0, 255, 255, $92, 4, TrainerGentlemanPreston, -1
	person_event SPRITE_YOUNGSTER, 13, 7, $7, $0, 255, 255, $92, 3, TrainerBird_keeperTheo, -1
	person_event SPRITE_POKE_BALL, 6, 12, $1, $0, 255, 255, $1, 0, ItemFragment_0x5b279, EVENT_664
