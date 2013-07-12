Route26HealSpeechHouse_MapScriptHeader: ; 0x7b123
	; trigger count
	db 0

	; callback count
	db 0
; 0x7b125

TeacherScript_0x7b125: ; 0x7b125
	faceplayer
	loadfont
	2writetext UnknownText_0x7b14d
	closetext
	loadmovesprites
	special $0030
	special $0033
	special $009d
	playmusic $000d
	special $001b
	pause 60
	special $0032
	special $003d
	loadfont
	2writetext UnknownText_0x7b18b
	closetext
	loadmovesprites
	end
; 0x7b14a

MapRoute26HealSpeechHouseSignpost1Script: ; 0x7b14a
	jumpstd $0002
; 0x7b14d

UnknownText_0x7b14d: ; 0x7b14d
	db $0, "Your #MON look", $4f
	db "a little tired.", $51
	db "You should rest", $4f
	db "them a while.", $57
; 0x7b18b

UnknownText_0x7b18b: ; 0x7b18b
	db $0, "There!", $51
	db "Your #MON are", $4f
	db "looking good!", $51
	db "Keep at it!", $57
; 0x7b1bb

Route26HealSpeechHouse_MapEventHeader: ; 0x7b1bb
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 2, GROUP_ROUTE_26, MAP_ROUTE_26
	warp_def $7, $3, 2, GROUP_ROUTE_26, MAP_ROUTE_26

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 0, $0, MapRoute26HealSpeechHouseSignpost1Script
	signpost 1, 1, $0, MapRoute26HealSpeechHouseSignpost1Script

	; people-events
	db 1
	person_event SPRITE_TEACHER, 7, 6, $6, $0, 255, 255, $90, 0, TeacherScript_0x7b125, $ffff
; 0x7b1e2

