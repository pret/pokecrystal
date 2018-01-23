CeladonMansion2F_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

CeladonMansion2FComputer:
	jumptext CeladonMansion2FComputerText

CeladonMansion2FSign:
	jumptext CeladonMansion2FSignText

CeladonMansion2FBookshelf:
	jumpstd difficultbookshelf

CeladonMansion2FComputerText:
	text "<PLAYER> turned on"
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

CeladonMansion2F_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def 0, 0, 4, CELADON_MANSION_1F
	warp_def 1, 0, 2, CELADON_MANSION_3F
	warp_def 6, 0, 3, CELADON_MANSION_3F
	warp_def 7, 0, 5, CELADON_MANSION_1F

.CoordEvents:
	db 0

.BGEvents:
	db 3
	bg_event 0, 3, BGEVENT_READ, CeladonMansion2FComputer
	bg_event 5, 8, BGEVENT_UP, CeladonMansion2FSign
	bg_event 2, 3, BGEVENT_READ, CeladonMansion2FBookshelf

.ObjectEvents:
	db 0
