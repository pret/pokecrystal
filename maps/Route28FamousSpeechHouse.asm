Route28FamousSpeechHouse_MapScriptHeader: ; 0x1ae651
	; trigger count
	db 1

	; triggers
	dw UnknownScript_0x1ae657, $0000

	; callback count
	db 0
; 0x1ae657

UnknownScript_0x1ae657: ; 0x1ae657
	end
; 0x1ae658

CooltrainerFScript_0x1ae658: ; 0x1ae658
	faceplayer
	loadfont
	checkevent EVENT_GOT_TM47_STEEL_WING
	iftrue UnknownScript_0x1ae66f
	writetext UnknownText_0x1ae682
	keeptextopen
	verbosegiveitem TM_47, 1
	iffalse UnknownScript_0x1ae66d
	setevent EVENT_GOT_TM47_STEEL_WING
UnknownScript_0x1ae66d: ; 0x1ae66d
	loadmovesprites
	end
; 0x1ae66f

UnknownScript_0x1ae66f: ; 0x1ae66f
	writetext UnknownText_0x1ae6f0
	closetext
	loadmovesprites
	end
; 0x1ae675

MoltresScript_0x1ae675: ; 0x1ae675
	loadfont
	writetext UnknownText_0x1ae752
	cry FEAROW
	closetext
	loadmovesprites
	end
; 0x1ae67f

MapRoute28FamousSpeechHouseSignpost1Script: ; 0x1ae67f
	jumpstd magazinebookshelf
; 0x1ae682

UnknownText_0x1ae682: ; 0x1ae682
	text "Oh, dear."
	line "You've found me."

	para "Please don't tell"
	line "anyone about me."

	para "I'll give you this"
	line "for keeping my"
	cont "secret. Please?"
	done
; 0x1ae6f0

UnknownText_0x1ae6f0: ; 0x1ae6f0
	text "It's tough being a"
	line "top celebrity."

	para "Everywhere I go,"
	line "people chase me."

	para "I just want to be"
	line "left alone…"
	done
; 0x1ae752

UnknownText_0x1ae752: ; 0x1ae752
	text "FEAROW: Feero!"
	done
; 0x1ae762

Route28FamousSpeechHouse_MapEventHeader: ; 0x1ae762
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
	signpost 1, 0, $0, MapRoute28FamousSpeechHouseSignpost1Script
	signpost 1, 1, $0, MapRoute28FamousSpeechHouseSignpost1Script

	; people-events
	db 2
	person_event SPRITE_COOLTRAINER_F, 7, 6, $6, $0, 255, 255, $a0, 0, CooltrainerFScript_0x1ae658, $ffff
	person_event SPRITE_MOLTRES, 9, 10, $16, $0, 255, 255, $b0, 0, MoltresScript_0x1ae675, $ffff
; 0x1ae796
