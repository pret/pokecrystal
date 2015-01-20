OlivineLighthouse3F_MapScriptHeader: ; 0x5b23b
	; trigger count
	db 0

	; callback count
	db 0
; 0x5b23d

TrainerBird_keeperTheo: ; 0x5b23d
	; bit/flag number
	dw $3fe

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
; 0x5b249

Bird_keeperTheoScript: ; 0x5b249
	talkaftercancel
	loadfont
	writetext UnknownText_0x5b2df
	closetext
	loadmovesprites
	end
; 0x5b251

TrainerGentlemanPreston: ; 0x5b251
	; bit/flag number
	dw $49a

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
; 0x5b25d

GentlemanPrestonScript: ; 0x5b25d
	talkaftercancel
	loadfont
	writetext UnknownText_0x5b457
	closetext
	loadmovesprites
	end
; 0x5b265

TrainerSailorTerrell: ; 0x5b265
	; bit/flag number
	dw $577

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
; 0x5b271

SailorTerrellScript: ; 0x5b271
	talkaftercancel
	loadfont
	writetext UnknownText_0x5b384
	closetext
	loadmovesprites
	end
; 0x5b279

ItemFragment_0x5b279: ; 0x5b279
	db ETHER, 1
; 0x5b27b

Bird_keeperTheoSeenText: ; 0x5b27b
	text "Why are you here?"
	line "Are you just going"

	para "to gawk? I suggest"
	line "that you leave!"
	done
; 0x5b2c4

Bird_keeperTheoBeatenText: ; 0x5b2c4
	text "You really are"
	line "concerned…"
	done
; 0x5b2df

UnknownText_0x5b2df: ; 0x5b2df
	text "How the heck do"
	line "you go up?"

	para "I want to visit"
	line "the sick #MON,"

	para "but I can't get up"
	line "there…"
	done
; 0x5b333

SailorTerrellSeenText: ; 0x5b333
	text "Sailors are both"
	line "kind and strong."
	cont "How about you?"
	done
; 0x5b365

SailorTerrellBeatenText: ; 0x5b365
	text "You are both kind"
	line "and strong…"
	done
; 0x5b384

UnknownText_0x5b384: ; 0x5b384
	text "Every time I come"
	line "back to OLIVINE, I"
	cont "visit the GYM."

	para "The GYM LEADER's"
	line "#MON type has"

	para "changed without me"
	line "noticing."
	done
; 0x5b3f4

GentlemanPrestonSeenText: ; 0x5b3f4
	text "I travel the world"
	line "to train my #-"
	cont "MON. I wish to"
	cont "battle with you."
	done
; 0x5b437

GentlemanPrestonBeatenText: ; 0x5b437
	text "…sigh… I must"
	line "train some more…"
	done
; 0x5b457

UnknownText_0x5b457: ; 0x5b457
	text "JASMINE used to"
	line "use rock #MON"
	cont "like ONIX."
	done
; 0x5b481

OlivineLighthouse3F_MapEventHeader: ; 0x5b481
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
	person_event SPRITE_SAILOR, 6, 13, $6, $0, 255, 255, $92, 1, TrainerSailorTerrell, $ffff
	person_event SPRITE_GENTLEMAN, 9, 17, $9, $0, 255, 255, $92, 4, TrainerGentlemanPreston, $ffff
	person_event SPRITE_YOUNGSTER, 13, 7, $7, $0, 255, 255, $92, 3, TrainerBird_keeperTheo, $ffff
	person_event SPRITE_POKE_BALL, 6, 12, $1, $0, 255, 255, $1, 0, ItemFragment_0x5b279, $0664
; 0x5b4e8

