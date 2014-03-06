RedsHouse2F_MapScriptHeader: ; 0x19b048
	; trigger count
	db 0

	; callback count
	db 0
; 0x19b04a

MapRedsHouse2FSignpost0Script: ; 0x19b04a
	jumptext UnknownText_0x19b050
; 0x19b04d

MapRedsHouse2FSignpost1Script: ; 0x19b04d
	jumptext UnknownText_0x19b087
; 0x19b050

UnknownText_0x19b050: ; 0x19b050
	text $52, " played the"
	line "N64."

	para "Better get going--"
	line "no time to lose!"
	done
; 0x19b087

UnknownText_0x19b087: ; 0x19b087
	text "It looks like it"
	line "hasn't been used"
	cont "in a long time…"
	done
; 0x19b0b9

RedsHouse2F_MapEventHeader: ; 0x19b0b9
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $0, $7, 3, GROUP_REDS_HOUSE_1F, MAP_REDS_HOUSE_1F

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 5, 3, $0, MapRedsHouse2FSignpost0Script
	signpost 1, 0, $0, MapRedsHouse2FSignpost1Script

	; people-events
	db 0
; 0x19b0ce

