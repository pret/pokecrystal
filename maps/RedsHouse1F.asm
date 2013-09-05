RedsHouse1F_MapScriptHeader: ; 0x19ae9c
	; trigger count
	db 1

	; triggers
	dw UnknownScript_0x19aea2, $0000

	; callback count
	db 0
; 0x19aea2

UnknownScript_0x19aea2: ; 0x19aea2
	end
; 0x19aea3

RedsMomScript_0x19aea3: ; 0x19aea3
	faceplayer
	loadfont
	checkbit1 EVENT_MET_REDS_MOM
	iftrue UnknownScript_0x19aeb4
	2writetext UnknownText_0x19aec0
	closetext
	loadmovesprites
	setbit1 EVENT_MET_REDS_MOM
	end
; 0x19aeb4

UnknownScript_0x19aeb4: ; 0x19aeb4
	2writetext UnknownText_0x19af81
	closetext
	loadmovesprites
	end
; 0x19aeba

MapRedsHouse1FSignpost2Script: ; 0x19aeba
	jumptext UnknownText_0x19afe8
; 0x19aebd

MapRedsHouse1FSignpost1Script: ; 0x19aebd
	jumpstd $0002
; 0x19aec0

UnknownText_0x19aec0: ; 0x19aec0
	db $0, "Hi!", $51
	db "RED's been away", $4f
	db "for a long time.", $51
	db "He hasn't called", $4f
	db "either, so I have", $51
	db "no idea where he", $4f
	db "is or what he's", $55
	db "been doing.", $51
	db "They say that no", $4f
	db "word is proof that", $51
	db "he's doing fine,", $4f
	db "but I do worry", $55
	db "about him.", $57
; 0x19af81

UnknownText_0x19af81: ; 0x19af81
	db $0, "I worry about RED", $4f
	db "getting hurt or", $51
	db "sick, but he's a", $4f
	db "boy. I'm proud", $51
	db "that he is doing", $4f
	db "what he wants to", $51
	db "do.", $57
; 0x19afe8

UnknownText_0x19afe8: ; 0x19afe8
	db $0, "They have programs", $4f
	db "that aren't shown", $55
	db "in JOHTO…", $57
; 0x19b017

RedsHouse1F_MapEventHeader: ; 0x19b017
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $2, 1, GROUP_PALLET_TOWN, MAP_PALLET_TOWN
	warp_def $7, $3, 1, GROUP_PALLET_TOWN, MAP_PALLET_TOWN
	warp_def $0, $7, 1, GROUP_REDS_HOUSE_2F, MAP_REDS_HOUSE_2F

	; xy triggers
	db 0

	; signposts
	db 3
	signpost 1, 0, $0, MapRedsHouse1FSignpost1Script
	signpost 1, 1, $0, MapRedsHouse1FSignpost1Script
	signpost 1, 2, $0, MapRedsHouse1FSignpost2Script

	; people-events
	db 1
	person_event SPRITE_REDS_MOM, 7, 9, $8, $0, 255, 255, $0, 0, RedsMomScript_0x19aea3, $ffff
; 0x19b048

