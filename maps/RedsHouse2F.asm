RedsHouse2F_MapScriptHeader:
.SceneScripts:
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

.CoordEvents:
	db 0

.BGEvents:
	db 2
	bg_event 5, 3, BGEVENT_READ, RedsHouse2FN64Script
	bg_event 1, 0, BGEVENT_READ, RedsHouse2FPCScript

.ObjectEvents:
	db 0
