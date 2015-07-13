Route28FamousSpeechHouse_MapScriptHeader:
	; trigger count
	db 1

	; triggers
	dw .Trigger, $0000

	; callback count
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

	; warps
	db 2
	warp_def $7, $2, 1, GROUP_ROUTE_28, MAP_ROUTE_28
	warp_def $7, $3, 1, GROUP_ROUTE_28, MAP_ROUTE_28

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 0, $0, CelebrityHouseBookshelf
	signpost 1, 1, $0, CelebrityHouseBookshelf

	; people-events
	db 2
	person_event SPRITE_COOLTRAINER_F, 7, 6, $6, $0, 255, 255, $a0, 0, Celebrity, -1
	person_event SPRITE_MOLTRES, 9, 10, $16, $0, 255, 255, $b0, 0, CelebritysFearow, -1
