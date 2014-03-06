AzaleaPokeCenter1F_MapScriptHeader: ; 0x18db21
	; trigger count
	db 1

	; triggers
	dw UnknownScript_0x18db27, $0000

	; callback count
	db 0
; 0x18db27

UnknownScript_0x18db27: ; 0x18db27
	end
; 0x18db28

NurseScript_0x18db28: ; 0x18db28
	jumpstd $0000
; 0x18db2b

GentlemanScript_0x18db2b: ; 0x18db2b
	jumptextfaceplayer UnknownText_0x18db34
; 0x18db2e

FishingGuruScript_0x18db2e: ; 0x18db2e
	jumptextfaceplayer UnknownText_0x18dbee
; 0x18db31

PokefanFScript_0x18db31: ; 0x18db31
	jumptextfaceplayer UnknownText_0x18dc19
; 0x18db34

UnknownText_0x18db34: ; 0x18db34
	text "Do your #MON"
	line "know HM moves?"

	para "Those moves can"
	line "be used even if"

	para "your #MON has"
	line "fainted."
	done
; 0x18db88

UnknownText_0x18db88: ; 0x18db88
	text "This BILL guy"
	line "created the system"

	para "for storing"
	line "#MON in a PC."

	para "BILL's PC can"
	line "store up to 20"
	cont "#MON per BOX."
	done
; 0x18dbee

UnknownText_0x18dbee: ; 0x18dbee
	text "BILL's PC can"
	line "store up to 20"
	cont "#MON per BOX."
	done
; 0x18dc19

UnknownText_0x18dc19: ; 0x18dc19
	text "Do you know about"
	line "APRICORNS?"

	para "Crack one open,"
	line "hollow it out and"

	para "fit it with a"
	line "special device."

	para "Then you can catch"
	line "#MON with it."

	para "Before # BALLS"
	line "were invented,"

	para "everyone used"
	line "APRICORNS."
	done
; 0x18dccf

AzaleaPokeCenter1F_MapEventHeader: ; 0x18dccf
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $3, 1, GROUP_AZALEA_TOWN, MAP_AZALEA_TOWN
	warp_def $7, $4, 1, GROUP_AZALEA_TOWN, MAP_AZALEA_TOWN
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 4
	person_event SPRITE_NURSE, 5, 7, $6, $0, 255, 255, $0, 0, NurseScript_0x18db28, $ffff
	person_event SPRITE_GENTLEMAN, 10, 13, $4, $10, 255, 255, $0, 0, GentlemanScript_0x18db2b, $ffff
	person_event SPRITE_FISHING_GURU, 5, 10, $6, $0, 255, 255, $0, 0, FishingGuruScript_0x18db2e, $ffff
	person_event SPRITE_POKEFAN_F, 8, 5, $2, $21, 255, 255, $0, 0, PokefanFScript_0x18db31, $ffff
; 0x18dd18

