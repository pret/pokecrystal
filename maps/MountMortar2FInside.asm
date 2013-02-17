MountMortar2FInside_MapScriptHeader: ; 0x7e0c8
	; trigger count
	db 0

	; callback count
	db 0
; 0x7e0ca

TrainerSupernerdHugh: ; 0x7e0ca
	; bit/flag number
	dw $5c5

	; trainer group && trainer id
	db SUPER_NERD, HUGH

	; text when seen
	dw SupernerdHughSeenText

	; text when trainer beaten
	dw SupernerdHughBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SupernerdHughScript
; 0x7e0d6

SupernerdHughScript: ; 0x7e0d6
	talkaftercancel
	loadfont
	2writetext UnknownText_0x7e10e
	closetext
	loadmovesprites
	end
; 0x7e0de

ItemFragment_0x7e0de: ; 0x7e0de
	db MAX_POTION, 1
; 0x7e0e0

ItemFragment_0x7e0e0: ; 0x7e0e0
	db RARE_CANDY, 1
; 0x7e0e2

ItemFragment_0x7e0e2: ; 0x7e0e2
	db TM_40, 1
; 0x7e0e4

ItemFragment_0x7e0e4: ; 0x7e0e4
	db DRAGON_SCALE, 1
; 0x7e0e6

ItemFragment_0x7e0e6: ; 0x7e0e6
	db ELIXER, 1
; 0x7e0e8

ItemFragment_0x7e0e8: ; 0x7e0e8
	db ESCAPE_ROPE, 1
; 0x7e0ea

MapMountMortar2FInsideSignpostItem0: ; 0x7e0ea
	dw $0092
	db FULL_RESTORE
	
; 0x7e0ed

SupernerdHughSeenText: ; 0x7e0ed
	db $0, "Yo! MARKUS!", $57
; 0x7e0fa

SupernerdHughBeatenText: ; 0x7e0fa
	db $0, "Sorry, my mistake.", $57
; 0x7e10e

UnknownText_0x7e10e: ; 0x7e10e
	db $0, "I'm investigating", $4f
	db "MT.MORTAR, but my", $55
	db "pal's gone AWOL.", $51
	db "Have you seen a", $4f
	db "trainer who has a", $51
	db "SLOWPOKE that can", $4f
	db "use STRENGTH?", $57
; 0x7e184

MountMortar2FInside_MapEventHeader: ; 0x7e184
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $21, $11, 4, GROUP_MOUNT_MORTAR_1F_OUTSIDE, MAP_MOUNT_MORTAR_1F_OUTSIDE
	warp_def $5, $3, 6, GROUP_MOUNT_MORTAR_1F_INSIDE, MAP_MOUNT_MORTAR_1F_INSIDE

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 8, 24, $7, MapMountMortar2FInsideSignpostItem0

	; people-events
	db 7
	person_event $54, 26, 32, $1, $0, 255, 255, $1, 0, ItemFragment_0x7e0de, $0680
	person_event $54, 37, 6, $1, $0, 255, 255, $1, 0, ItemFragment_0x7e0e0, $0681
	person_event $54, 21, 23, $1, $0, 255, 255, $1, 0, ItemFragment_0x7e0e2, $0682
	person_event $54, 9, 20, $1, $0, 255, 255, $1, 0, ItemFragment_0x7e0e4, $0683
	person_event $54, 15, 13, $1, $0, 255, 255, $1, 0, ItemFragment_0x7e0e6, $0684
	person_event $54, 9, 32, $1, $0, 255, 255, $1, 0, ItemFragment_0x7e0e8, $0685
	person_event $2b, 30, 17, $a, $0, 255, 255, $b2, 2, TrainerSupernerdHugh, $ffff
; 0x7e1f4

