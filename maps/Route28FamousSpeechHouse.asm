Route28FamousSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 1

	; triggers
	dw .Trigger, $0000

.MapCallbacks:
	db 0

.Trigger
	end

Celebrity:
	faceplayer
	loadfont
	checkevent EVENT_GOT_TM47_STEEL_WING
	iftrue .AlreadyGotItem
	writetext CelebrityText1
	keeptextopen
	verbosegiveitem TM_STEEL_WING, 1
	iffalse .Done
	setevent EVENT_GOT_TM47_STEEL_WING
.Done
	loadmovesprites
	end
.AlreadyGotItem
	writetext CelebrityText2
	closetext
	loadmovesprites
	end

CelebritysFearow:
	loadfont
	writetext CelebritysFearowText
	cry FEAROW
	closetext
	loadmovesprites
	end

CelebrityHouseBookshelf:
	jumpstd magazinebookshelf

CelebrityText1:
	text "Oh, dear."
	line "You've found me."

	para "Please don't tell"
	line "anyone about me."

	para "I'll give you this"
	line "for keeping my"
	cont "secret. Please?"
	done

CelebrityText2:
	text "It's tough being a"
	line "top celebrity."

	para "Everywhere I go,"
	line "people chase me."

	para "I just want to be"
	line "left alone…"
	done

CelebritysFearowText:
	text "FEAROW: Feero!"
	done

Route28FamousSpeechHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 1, GROUP_ROUTE_28, MAP_ROUTE_28
	warp_def $7, $3, 1, GROUP_ROUTE_28, MAP_ROUTE_28

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 1, 0, SIGNPOST_READ, CelebrityHouseBookshelf
	signpost 1, 1, SIGNPOST_READ, CelebrityHouseBookshelf

.PersonEvents:
	db 2
	person_event SPRITE_COOLTRAINER_F, 7, 6, OW_UP | $2, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, Celebrity, -1
	person_event SPRITE_MOLTRES, 9, 10, OW_UP | $12, $0, -1, -1, (PAL_OW_BROWN << 4) | $80, 0, CelebritysFearow, -1
