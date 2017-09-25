RedsHouse2F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

MapRedsHouse2FSignpost0Script:
	jumptext UnknownText_0x19b050

MapRedsHouse2FSignpost1Script:
	jumptext UnknownText_0x19b087

UnknownText_0x19b050:
	text "<PLAYER> played the"
	line "N64."

	para "Better get going--"
	line "no time to lose!"
	done

UnknownText_0x19b087:
	text "It looks like it"
	line "hasn't been used"
	cont "in a long time…"
	done

RedsHouse2F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 1
	warp_def $0, $7, 3, REDS_HOUSE_1F

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 5, 3, SIGNPOST_READ, MapRedsHouse2FSignpost0Script
	signpost 1, 0, SIGNPOST_READ, MapRedsHouse2FSignpost1Script

.PersonEvents:
	db 0
