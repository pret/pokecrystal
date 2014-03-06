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
	text $52, " turned on"
	line "the PC."

	para "…"

	para "Someone was in the"
	line "middle of compos-"
	cont "ing an e-mail."

	para "…I hope you'll"
	line "come visit KANTO."

	para "I think you'll be"
	line "surprised at how"

	para "much things have"
	line "changed here."

	para "You'll also see"
	line "many #MON that"

	para "aren't native to"
	line "JOHTO."

	para "To the PRODUCER"

	para "…"
	done
; 0x7162c

UnknownText_0x7162c: ; 0x7162c
	text "GAME FREAK"
	line "MEETING ROOM"
	done
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

