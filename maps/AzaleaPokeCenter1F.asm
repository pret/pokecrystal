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

UnknownScript_0x18db28: ; 0x18db28
	jumpstd $0000
; 0x18db2b

UnknownScript_0x18db2b: ; 0x18db2b
	jumptextfaceplayer UnknownText_0x18db34
; 0x18db2e

UnknownScript_0x18db2e: ; 0x18db2e
	jumptextfaceplayer UnknownText_0x18dbee
; 0x18db31

UnknownScript_0x18db31: ; 0x18db31
	jumptextfaceplayer UnknownText_0x18dc19
; 0x18db34

UnknownText_0x18db34: ; 0x18db34
	db $0, "Do your #MON", $4f
	db "know HM moves?", $51
	db "Those moves can", $4f
	db "be used even if", $51
	db "your #MON has", $4f
	db "fainted.", $57
; 0x18db88

UnknownText_0x18db88: ; 0x18db88
	db $0, "This BILL guy", $4f
	db "created the system", $51
	db "for storing", $4f
	db "#MON in a PC.", $51
	db "BILL's PC can", $4f
	db "store up to 20", $55
	db "#MON per BOX.", $57
; 0x18dbee

UnknownText_0x18dbee: ; 0x18dbee
	db $0, "BILL's PC can", $4f
	db "store up to 20", $55
	db "#MON per BOX.", $57
; 0x18dc19

UnknownText_0x18dc19: ; 0x18dc19
	db $0, "Do you know about", $4f
	db "APRICORNS?", $51
	db "Crack one open,", $4f
	db "hollow it out and", $51
	db "fit it with a", $4f
	db "special device.", $51
	db "Then you can catch", $4f
	db "#MON with it.", $51
	db "Before # BALLS", $4f
	db "were invented,", $51
	db "everyone used", $4f
	db "APRICORNS.", $57
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
	person_event $37, 5, 7, $6, $0, 255, 255, $0, 0, UnknownScript_0x18db28, $ffff
	person_event $40, 10, 13, $4, $10, 255, 255, $0, 0, UnknownScript_0x18db2b, $ffff
	person_event $3b, 5, 10, $6, $0, 255, 255, $0, 0, UnknownScript_0x18db2e, $ffff
	person_event $2e, 8, 5, $2, $21, 255, 255, $0, 0, UnknownScript_0x18db31, $ffff
; 0x18dd18

