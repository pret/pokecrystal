Route27SandstormHouse_MapScriptHeader: ; 0x7b392
	; trigger count
	db 0

	; callback count
	db 0
; 0x7b394

GrannyScript_0x7b394: ; 0x7b394
	faceplayer
	loadfont
	checkevent EVENT_GOT_TM37_SANDSTORM
	iftrue UnknownScript_0x7b3b7
	special $0059
	2writetext UnknownText_0x7b3c6
	keeptextopen
	if_less_than $95, UnknownScript_0x7b3aa
	2jump UnknownScript_0x7b3bd
; 0x7b3aa

UnknownScript_0x7b3aa: ; 0x7b3aa
	2writetext UnknownText_0x7b42b
	keeptextopen
	verbosegiveitem TM_37, 1
	iffalse UnknownScript_0x7b3bb
	setevent EVENT_GOT_TM37_SANDSTORM
UnknownScript_0x7b3b7: ; 0x7b3b7
	2writetext UnknownText_0x7b48f
	closetext
UnknownScript_0x7b3bb: ; 0x7b3bb
	loadmovesprites
	end
; 0x7b3bd

UnknownScript_0x7b3bd: ; 0x7b3bd
	2writetext UnknownText_0x7b51f
	closetext
	loadmovesprites
	end
; 0x7b3c3

MapRoute27SandstormHouseSignpost1Script: ; 0x7b3c3
	jumpstd $0003
; 0x7b3c6

UnknownText_0x7b3c6: ; 0x7b3c6
	db $0, "Where are you off", $4f
	db "to with #MON?", $51
	db "#MON LEAGUE?", $51
	db "Are your #MON", $4f
	db "loyal enough for", $55
	db "you to win?", $51
	db "Let me see…", $57
; 0x7b42b

UnknownText_0x7b42b: ; 0x7b42b
	db $0, "Ah! Your #MON", $4f
	db "trusts you very", $55
	db "much.", $51
	db "It's nice to see a", $4f
	db "good trainer.", $51
	db "Here. A gift for", $4f
	db "your journey.", $57
; 0x7b48f

UnknownText_0x7b48f: ; 0x7b48f
	db $0, "TM37 happens to be", $4f
	db "SANDSTORM.", $51
	db "It's a move that", $4f
	db "inflicts damage on", $55
	db "both battlers.", $51
	db "It's for advanced", $4f
	db "trainers only.", $51
	db "Use it if you", $4f
	db "dare. Good luck!", $57
; 0x7b51f

UnknownText_0x7b51f: ; 0x7b51f
	db $0, "If it doesn't come", $4f
	db "to trust you some", $51
	db "more, it could be", $4f
	db "tough going.", $51
	db "Trust is the tie", $4f
	db "that binds #MON", $55
	db "and trainers.", $57
; 0x7b592

Route27SandstormHouse_MapEventHeader: ; 0x7b592
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 1, GROUP_ROUTE_27, MAP_ROUTE_27
	warp_def $7, $3, 1, GROUP_ROUTE_27, MAP_ROUTE_27

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 0, $0, MapRoute27SandstormHouseSignpost1Script
	signpost 1, 1, $0, MapRoute27SandstormHouseSignpost1Script

	; people-events
	db 1
	person_event SPRITE_GRANNY, 8, 6, $6, $0, 255, 255, $0, 0, GrannyScript_0x7b394, $ffff
; 0x7b5b9

