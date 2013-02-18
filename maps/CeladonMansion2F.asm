CeladonMansion2F_MapScriptHeader: ; 0x7152e
	; trigger count
	db 0

	; callback count
	db 0
; 0x71530

MapCeladonMansion2FSignpost0Script: ; 0x71530
	jumptext UnknownText_0x71539
; 0x71533

MapCeladonMansion2FSignpost1Script: ; 0x71533
	jumptext UnknownText_0x7162c
; 0x71536

MapCeladonMansion2FSignpost2Script: ; 0x71536
	jumpstd $0001
; 0x71539

UnknownText_0x71539: ; 0x71539
	db $0, $52, " turned on", $4f
	db "the PC.", $51
	db "…", $51
	db "Someone was in the", $4f
	db "middle of compos-", $55
	db "ing an e-mail.", $51
	db "…I hope you'll", $4f
	db "come visit KANTO.", $51
	db "I think you'll be", $4f
	db "surprised at how", $51
	db "much things have", $4f
	db "changed here.", $51
	db "You'll also see", $4f
	db "many #MON that", $51
	db "aren't native to", $4f
	db "JOHTO.", $51
	db "To the PRODUCER", $51
	db "…", $57
; 0x7162c

UnknownText_0x7162c: ; 0x7162c
	db $0, "GAME FREAK", $4f
	db "MEETING ROOM", $57
; 0x71645

CeladonMansion2F_MapEventHeader: ; 0x71645
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $0, $0, 4, GROUP_CELADON_MANSION_1F, MAP_CELADON_MANSION_1F
	warp_def $0, $1, 2, GROUP_CELADON_MANSION_3F, MAP_CELADON_MANSION_3F
	warp_def $0, $6, 3, GROUP_CELADON_MANSION_3F, MAP_CELADON_MANSION_3F
	warp_def $0, $7, 5, GROUP_CELADON_MANSION_1F, MAP_CELADON_MANSION_1F

	; xy triggers
	db 0

	; signposts
	db 3
	signpost 3, 0, $0, MapCeladonMansion2FSignpost0Script
	signpost 8, 5, $1, MapCeladonMansion2FSignpost1Script
	signpost 3, 2, $0, MapCeladonMansion2FSignpost2Script

	; people-events
	db 0
; 0x7166e

