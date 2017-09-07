const_value set 2
	const ROUTE28FAMOUSSPEECHHOUSE_CELEBRITY
	const ROUTE28FAMOUSSPEECHHOUSE_FEAROW

Route28FamousSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 1

	; triggers
	dw .Trigger, 0

.MapCallbacks:
	db 0

.Trigger:
	end

Celebrity:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM47_STEEL_WING
	iftrue .AlreadyGotItem
	writetext CelebrityText1
	buttonsound
	verbosegiveitem TM_STEEL_WING
	iffalse .Done
	setevent EVENT_GOT_TM47_STEEL_WING
.Done:
	closetext
	end
.AlreadyGotItem:
	writetext CelebrityText2
	waitbutton
	closetext
	end

CelebritysFearow:
	opentext
	writetext CelebritysFearowText
	cry FEAROW
	waitbutton
	closetext
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
	warp_def $7, $2, 1, ROUTE_28
	warp_def $7, $3, 1, ROUTE_28

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 1, 0, SIGNPOST_READ, CelebrityHouseBookshelf
	signpost 1, 1, SIGNPOST_READ, CelebrityHouseBookshelf

.PersonEvents:
	db 2
	person_event SPRITE_COOLTRAINER_F, 3, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Celebrity, -1
	person_event SPRITE_MOLTRES, 5, 6, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, CelebritysFearow, -1
