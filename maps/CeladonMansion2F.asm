CeladonMansion2F_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

CeladonMansion2FComputer:
	jumptext CeladonMansion2FComputerText

CeladonMansion2FSign:
	jumptext CeladonMansion2FSignText

CeladonMansion2FBookshelf:
	jumpstd difficultbookshelf

CeladonMansion2FComputerText:
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

CeladonMansion2FSignText:
	text "GAME FREAK"
	line "MEETING ROOM"
	done

CeladonMansion2F_MapEventHeader:
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
	signpost 3, 0, $0, CeladonMansion2FComputer
	signpost 8, 5, $1, CeladonMansion2FSign
	signpost 3, 2, $0, CeladonMansion2FBookshelf

	; people-events
	db 0
