PalletTown_MapScriptHeader: ; 0x1ac6cc
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 5, UnknownScript_0x1ac6d1
; 0x1ac6d1

UnknownScript_0x1ac6d1: ; 0x1ac6d1
	setflag $0035
	return
; 0x1ac6d5

TeacherScript_0x1ac6d5: ; 0x1ac6d5
	jumptextfaceplayer UnknownText_0x1ac6e7
; 0x1ac6d8

FisherScript_0x1ac6d8: ; 0x1ac6d8
	jumptextfaceplayer UnknownText_0x1ac720
; 0x1ac6db

MapPalletTownSignpost0Script: ; 0x1ac6db
	jumptext UnknownText_0x1ac76b
; 0x1ac6de

MapPalletTownSignpost1Script: ; 0x1ac6de
	jumptext UnknownText_0x1ac79d
; 0x1ac6e1

MapPalletTownSignpost2Script: ; 0x1ac6e1
	jumptext UnknownText_0x1ac7aa
; 0x1ac6e4

MapPalletTownSignpost3Script: ; 0x1ac6e4
	jumptext UnknownText_0x1ac7c1
; 0x1ac6e7

UnknownText_0x1ac6e7: ; 0x1ac6e7
	text "I'm raising #-"
	line "MON too."

	para "They serve as my"
	line "private guards."
	done
; 0x1ac720

UnknownText_0x1ac720: ; 0x1ac720
	text "Technology is"
	line "incredible!"

	para "You can now trade"
	line "#MON across"
	cont "time like e-mail."
	done
; 0x1ac76b

UnknownText_0x1ac76b: ; 0x1ac76b
	text "PALLET TOWN"

	para "A Tranquil Setting"
	line "of Peace & Purity"
	done
; 0x1ac79d

UnknownText_0x1ac79d: ; 0x1ac79d
	text "RED'S HOUSE"
	done
; 0x1ac7aa

UnknownText_0x1ac7aa: ; 0x1ac7aa
	text "OAK #MON"
	line "RESEARCH LAB"
	done
; 0x1ac7c1

UnknownText_0x1ac7c1: ; 0x1ac7c1
	text "BLUE'S HOUSE"
	done
; 0x1ac7cf

PalletTown_MapEventHeader: ; 0x1ac7cf
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $5, $5, 1, GROUP_REDS_HOUSE_1F, MAP_REDS_HOUSE_1F
	warp_def $5, $d, 1, GROUP_BLUES_HOUSE, MAP_BLUES_HOUSE
	warp_def $b, $c, 1, GROUP_OAKS_LAB, MAP_OAKS_LAB

	; xy triggers
	db 0

	; signposts
	db 4
	signpost 9, 7, $0, MapPalletTownSignpost0Script
	signpost 5, 3, $0, MapPalletTownSignpost1Script
	signpost 13, 13, $0, MapPalletTownSignpost2Script
	signpost 5, 11, $0, MapPalletTownSignpost3Script

	; people-events
	db 2
	person_event SPRITE_TEACHER, 12, 7, $2, $22, 255, 255, $0, 0, TeacherScript_0x1ac6d5, $ffff
	person_event SPRITE_FISHER, 18, 16, $5, $2, 255, 255, $a0, 0, FisherScript_0x1ac6d8, $ffff
; 0x1ac812
