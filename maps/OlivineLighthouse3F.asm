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
	2writetext UnknownText_0x5b2df
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
	2writetext UnknownText_0x5b457
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
	2writetext UnknownText_0x5b384
	closetext
	loadmovesprites
	end
; 0x5b279

ItemFragment_0x5b279: ; 0x5b279
	db ETHER, 1
; 0x5b27b

Bird_keeperTheoSeenText: ; 0x5b27b
	db $0, "Why are you here?", $4f
	db "Are you just going", $51
	db "to gawk? I suggest", $4f
	db "that you leave!", $57
; 0x5b2c4

Bird_keeperTheoBeatenText: ; 0x5b2c4
	db $0, "You really are", $4f
	db "concerned…", $57
; 0x5b2df

UnknownText_0x5b2df: ; 0x5b2df
	db $0, "How the heck do", $4f
	db "you go up?", $51
	db "I want to visit", $4f
	db "the sick #MON,", $51
	db "but I can't get up", $4f
	db "there…", $57
; 0x5b333

SailorTerrellSeenText: ; 0x5b333
	db $0, "Sailors are both", $4f
	db "kind and strong.", $55
	db "How about you?", $57
; 0x5b365

SailorTerrellBeatenText: ; 0x5b365
	db $0, "You are both kind", $4f
	db "and strong…", $57
; 0x5b384

UnknownText_0x5b384: ; 0x5b384
	db $0, "Every time I come", $4f
	db "back to OLIVINE, I", $55
	db "visit the GYM.", $51
	db "The GYM LEADER's", $4f
	db "#MON type has", $51
	db "changed without me", $4f
	db "noticing.", $57
; 0x5b3f4

GentlemanPrestonSeenText: ; 0x5b3f4
	db $0, "I travel the world", $4f
	db "to train my #-", $55
	db "MON. I wish to", $55
	db "battle with you.", $57
; 0x5b437

GentlemanPrestonBeatenText: ; 0x5b437
	db $0, "…sigh… I must", $4f
	db "train some more…", $57
; 0x5b457

UnknownText_0x5b457: ; 0x5b457
	db $0, "JASMINE used to", $4f
	db "use rock #MON", $55
	db "like ONIX.", $57
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
	person_event $49, 6, 13, $6, $0, 255, 255, $92, 1, TrainerSailorTerrell, $ffff
	person_event $40, 9, 17, $9, $0, 255, 255, $92, 4, TrainerGentlemanPreston, $ffff
	person_event $27, 13, 7, $7, $0, 255, 255, $92, 3, TrainerBird_keeperTheo, $ffff
	person_event $54, 6, 12, $1, $0, 255, 255, $1, 0, ItemFragment_0x5b279, $0664
; 0x5b4e8

