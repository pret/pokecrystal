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
	2writetext UnknownText_0x60ac3
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
	2writetext UnknownText_0x60a1f
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
	db $0, "I wanted to battle", $4f
	db "JASMINE, but she's", $51
	db "not up to it now.", $4f
	db "So, how about you?", $57
; 0x609fe

SailorErnestBeatenText: ; 0x609fe
	db $0, "Whoa, whoa. You're", $4f
	db "overwhelming!", $57
; 0x60a1f

UnknownText_0x60a1f: ; 0x60a1f
	db $0, "A GYM LEADER isn't", $4f
	db "just about being", $51
	db "strong. A LEADER", $4f
	db "also needs to be", $55
	db "compassionate.", $57
; 0x60a74

Bird_keeperDenisSeenText: ; 0x60a74
	db $0, "We're pretty high", $4f
	db "up here. My bird", $51
	db "#MON are in", $4f
	db "prime form.", $57
; 0x60aaf

Bird_keeperDenisBeatenText: ; 0x60aaf
	db $0, "Oops…They crashed…", $57
; 0x60ac3

UnknownText_0x60ac3: ; 0x60ac3
	db $0, "My #MON learned", $4f
	db "how to use FLY in", $55
	db "CIANWOOD.", $51
	db "Well, since I'm a", $4f
	db "loser, I'll FLY", $55
	db "across the sea…", $57
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
	person_event $49, 15, 12, $a, $0, 255, 255, $92, 3, TrainerSailorErnest, $ffff
	person_event $27, 7, 12, $8, $0, 255, 255, $92, 4, TrainerBird_keeperDenis, $ffff
	person_event $54, 16, 19, $1, $0, 255, 255, $1, 0, ItemFragment_0x609aa, $0665
	person_event $54, 19, 10, $1, $0, 255, 255, $1, 0, ItemFragment_0x609ac, $0666
	person_event $54, 17, 6, $1, $0, 255, 255, $1, 0, ItemFragment_0x609ae, $0667
; 0x60b8f

