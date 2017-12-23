RedsHouse2F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

RedsHouse2FN64Script:
	jumptext RedsHouse2FN64Text

RedsHouse2FPCScript:
	jumptext RedsHouse2FPCText

RedsHouse2FN64Text:
	text "<PLAYER> played the"
	line "N64."

	para "Better get going--"
	line "no time to lose!"
	done

RedsHouse2FPCText:
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
	signpost 5, 3, SIGNPOST_READ, RedsHouse2FN64Script
	signpost 1, 0, SIGNPOST_READ, RedsHouse2FPCScript

.PersonEvents:
	db 0
