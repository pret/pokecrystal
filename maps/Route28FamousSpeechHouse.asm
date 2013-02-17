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

UnknownScript_0x1ae658: ; 0x1ae658
	faceplayer
	loadfont
	checkbit1 $0074
	iftrue UnknownScript_0x1ae66f
	2writetext UnknownText_0x1ae682
	keeptextopen
	verbosegiveitem TM_47, 1
	iffalse UnknownScript_0x1ae66d
	setbit1 $0074
UnknownScript_0x1ae66d: ; 0x1ae66d
	loadmovesprites
	end
; 0x1ae66f

UnknownScript_0x1ae66f: ; 0x1ae66f
	2writetext UnknownText_0x1ae6f0
	closetext
	loadmovesprites
	end
; 0x1ae675

UnknownScript_0x1ae675: ; 0x1ae675
	loadfont
	2writetext UnknownText_0x1ae752
	cry FEAROW
	closetext
	loadmovesprites
	end
; 0x1ae67f

MapRoute28FamousSpeechHouseSignpost1Script: ; 0x1ae67f
	jumpstd $0003
; 0x1ae682

UnknownText_0x1ae682: ; 0x1ae682
	db $0, "Oh, dear.", $4f
	db "You've found me.", $51
	db "Please don't tell", $4f
	db "anyone about me.", $51
	db "I'll give you this", $4f
	db "for keeping my", $55
	db "secret. Please?", $57
; 0x1ae6f0

UnknownText_0x1ae6f0: ; 0x1ae6f0
	db $0, "It's tough being a", $4f
	db "top celebrity.", $51
	db "Everywhere I go,", $4f
	db "people chase me.", $51
	db "I just want to be", $4f
	db "left alone…", $57
; 0x1ae752

UnknownText_0x1ae752: ; 0x1ae752
	db $0, "FEAROW: Feero!", $57
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
	person_event $24, 7, 6, $6, $0, 255, 255, $a0, 0, UnknownScript_0x1ae658, $ffff
	person_event $9e, 9, 10, $16, $0, 255, 255, $b0, 0, UnknownScript_0x1ae675, $ffff
; 0x1ae796


