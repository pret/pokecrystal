SilphCo1F_MapScriptHeader: ; 0x18abe3
	; trigger count
	db 0

	; callback count
	db 0
; 0x18abe5

ReceptionistScript_0x18abe5: ; 0x18abe5
	jumptextfaceplayer UnknownText_0x18ac03
; 0x18abe8

OfficerScript_0x18abe8: ; 0x18abe8
	faceplayer
	loadfont
	checkbit1 EVENT_GOT_UP_GRADE
	iftrue UnknownScript_0x18abfd
	2writetext UnknownText_0x18ac36
	keeptextopen
	verbosegiveitem UP_GRADE, 1
	iffalse UnknownScript_0x18ac01
	setbit1 EVENT_GOT_UP_GRADE
UnknownScript_0x18abfd: ; 0x18abfd
	2writetext UnknownText_0x18aca8
	closetext
UnknownScript_0x18ac01: ; 0x18ac01
	loadmovesprites
	end
; 0x18ac03

UnknownText_0x18ac03: ; 0x18ac03
	db $0, "Welcome. This is", $4f
	db "SILPH CO.'s HEAD", $55
	db "OFFICE BUILDING.", $57
; 0x18ac36

UnknownText_0x18ac36: ; 0x18ac36
	db $0, "Only employees are", $4f
	db "permitted to go", $55
	db "upstairs.", $51
	db "But since you came", $4f
	db "such a long way,", $51
	db "have this neat", $4f
	db "little souvenir.", $57
; 0x18aca8

UnknownText_0x18aca8: ; 0x18aca8
	db $0, "It's SILPH CO.'s", $4f
	db "latest product.", $51
	db "It's not for sale", $4f
	db "anywhere yet.", $57
; 0x18ace7

SilphCo1F_MapEventHeader: ; 0x18ace7
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 7, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY
	warp_def $7, $3, 7, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event SPRITE_RECEPTIONIST, 6, 8, $6, $0, 255, 255, $90, 0, ReceptionistScript_0x18abe5, $ffff
	person_event SPRITE_OFFICER, 5, 17, $6, $0, 255, 255, $90, 0, OfficerScript_0x18abe8, $ffff
; 0x18ad11

