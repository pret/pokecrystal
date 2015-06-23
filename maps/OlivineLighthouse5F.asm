OlivineLighthouse5F_MapScriptHeader: ; 0x60980
	; trigger count
	db 0

	; callback count
	db 0
; 0x60982

TrainerBird_keeperDenis: ; 0x60982
	; bit/flag number
	dw $400

	; trainer group && trainer id
	db BIRD_KEEPER, DENIS

	; text when seen
	dw Bird_keeperDenisSeenText

	; text when trainer beaten
	dw Bird_keeperDenisBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Bird_keeperDenisScript
; 0x6098e

Bird_keeperDenisScript: ; 0x6098e
	talkaftercancel
	loadfont
	writetext UnknownText_0x60ac3
	closetext
	loadmovesprites
	end
; 0x60996

TrainerSailorErnest: ; 0x60996
	; bit/flag number
	dw $579

	; trainer group && trainer id
	db SAILOR, ERNEST

	; text when seen
	dw SailorErnestSeenText

	; text when trainer beaten
	dw SailorErnestBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SailorErnestScript
; 0x609a2

SailorErnestScript: ; 0x609a2
	talkaftercancel
	loadfont
	writetext UnknownText_0x60a1f
	closetext
	loadmovesprites
	end
; 0x609aa

ItemFragment_0x609aa: ; 0x609aa
	db RARE_CANDY, 1
; 0x609ac

ItemFragment_0x609ac: ; 0x609ac
	db SUPER_REPEL, 1
; 0x609ae

ItemFragment_0x609ae: ; 0x609ae
	db TM_34, 1
; 0x609b0

MapOlivineLighthouse5FSignpostItem0: ; 0x609b0
	dw $0085
	db HYPER_POTION
	
; 0x609b3

SailorErnestSeenText: ; 0x609b3
	text "I wanted to battle"
	line "JASMINE, but she's"

	para "not up to it now."
	line "So, how about you?"
	done
; 0x609fe

SailorErnestBeatenText: ; 0x609fe
	text "Whoa, whoa. You're"
	line "overwhelming!"
	done
; 0x60a1f

UnknownText_0x60a1f: ; 0x60a1f
	text "A GYM LEADER isn't"
	line "just about being"

	para "strong. A LEADER"
	line "also needs to be"
	cont "compassionate."
	done
; 0x60a74

Bird_keeperDenisSeenText: ; 0x60a74
	text "We're pretty high"
	line "up here. My bird"

	para "#MON are in"
	line "prime form."
	done
; 0x60aaf

Bird_keeperDenisBeatenText: ; 0x60aaf
	text "Oops…They crashed…"
	done
; 0x60ac3

UnknownText_0x60ac3: ; 0x60ac3
	text "My #MON learned"
	line "how to use FLY in"
	cont "CIANWOOD."

	para "Well, since I'm a"
	line "loser, I'll FLY"
	cont "across the sea…"
	done
; 0x60b20

OlivineLighthouse5F_MapEventHeader: ; 0x60b20
	; filler
	db 0, 0

	; warps
	db 7
	warp_def $f, $9, 1, GROUP_OLIVINE_LIGHTHOUSE_6F, MAP_OLIVINE_LIGHTHOUSE_6F
	warp_def $5, $3, 2, GROUP_OLIVINE_LIGHTHOUSE_4F, MAP_OLIVINE_LIGHTHOUSE_4F
	warp_def $7, $9, 3, GROUP_OLIVINE_LIGHTHOUSE_4F, MAP_OLIVINE_LIGHTHOUSE_4F
	warp_def $7, $10, 9, GROUP_OLIVINE_LIGHTHOUSE_4F, MAP_OLIVINE_LIGHTHOUSE_4F
	warp_def $7, $11, 10, GROUP_OLIVINE_LIGHTHOUSE_4F, MAP_OLIVINE_LIGHTHOUSE_4F
	warp_def $5, $10, 2, GROUP_OLIVINE_LIGHTHOUSE_6F, MAP_OLIVINE_LIGHTHOUSE_6F
	warp_def $5, $11, 3, GROUP_OLIVINE_LIGHTHOUSE_6F, MAP_OLIVINE_LIGHTHOUSE_6F

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 13, 3, $7, MapOlivineLighthouse5FSignpostItem0

	; people-events
	db 5
	person_event SPRITE_SAILOR, 15, 12, $a, $0, 255, 255, $92, 3, TrainerSailorErnest, $ffff
	person_event SPRITE_YOUNGSTER, 7, 12, $8, $0, 255, 255, $92, 4, TrainerBird_keeperDenis, $ffff
	person_event SPRITE_POKE_BALL, 16, 19, $1, $0, 255, 255, $1, 0, ItemFragment_0x609aa, $0665
	person_event SPRITE_POKE_BALL, 19, 10, $1, $0, 255, 255, $1, 0, ItemFragment_0x609ac, $0666
	person_event SPRITE_POKE_BALL, 17, 6, $1, $0, 255, 255, $1, 0, ItemFragment_0x609ae, $0667
; 0x60b8f
