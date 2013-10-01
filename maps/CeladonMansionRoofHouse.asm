CeladonMansionRoofHouse_MapScriptHeader: ; 0x71afb
	; trigger count
	db 0

	; callback count
	db 0
; 0x71afd

PharmacistScript_0x71afd: ; 0x71afd
	faceplayer
	loadfont
	checkevent EVENT_GOT_TM03_CURSE
	iftrue UnknownScript_0x71b21
	2writetext UnknownText_0x71b27
	keeptextopen
	checktime $4
	iftrue UnknownScript_0x71b14
	2writetext UnknownText_0x71b4a
	closetext
	loadmovesprites
	end
; 0x71b14

UnknownScript_0x71b14: ; 0x71b14
	2writetext UnknownText_0x71ba3
	keeptextopen
	verbosegiveitem TM_03, 1
	iffalse UnknownScript_0x71b25
	setevent EVENT_GOT_TM03_CURSE
UnknownScript_0x71b21: ; 0x71b21
	2writetext UnknownText_0x71db3
	closetext
UnknownScript_0x71b25: ; 0x71b25
	loadmovesprites
	end
; 0x71b27

UnknownText_0x71b27: ; 0x71b27
	db $0, "Let me recount a", $4f
	db "terrifying tale…", $57
; 0x71b4a

UnknownText_0x71b4a: ; 0x71b4a
	db $0, "Then again, it's", $4f
	db "not as scary while", $51
	db "it's still light", $4f
	db "outside.", $51
	db "Come back after", $4f
	db "sunset, OK?", $57
; 0x71ba3

UnknownText_0x71ba3: ; 0x71ba3
	db $0, "Once upon a time,", $4f
	db "there was a little", $51
	db "boy who was given", $4f
	db "a new BICYCLE…", $51
	db "He wanted to try", $4f
	db "it right away…", $51
	db "He was having so", $4f
	db "much fun that he", $51
	db "didn't notice the", $4f
	db "sun had set…", $51
	db "While riding home", $4f
	db "in the pitch-black", $51
	db "night, the bike", $4f
	db "suddenly slowed!", $51
	db "The pedals became", $4f
	db "heavy!", $51
	db "When he stopped", $4f
	db "pedaling, the bike", $51
	db "began slipping", $4f
	db "backwards!", $51
	db "It was as if the", $4f
	db "bike were cursed", $51
	db "and trying to drag", $4f
	db "him into oblivion!", $51
	db "…", $51
	db "…", $51
	db "SHRIEEEEK!", $51
	db "The boy had been", $4f
	db "riding uphill on", $55
	db "CYCLING ROAD!", $51
	db "…", $4f
	db "Ba-dum ba-dum!", $51
	db "For listening so", $4f
	db "patiently, you may", $55
	db "take this--TM03!", $57
; 0x71db3

UnknownText_0x71db3: ; 0x71db3
	db $0, "TM03 is CURSE.", $51
	db "It's a terrifying", $4f
	db "move that slowly", $51
	db "whittles down the", $4f
	db "victim's HP.", $57
; 0x71e03

CeladonMansionRoofHouse_MapEventHeader: ; 0x71e03
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 3, GROUP_CELADON_MANSION_ROOF, MAP_CELADON_MANSION_ROOF
	warp_def $7, $3, 3, GROUP_CELADON_MANSION_ROOF, MAP_CELADON_MANSION_ROOF

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_PHARMACIST, 6, 7, $6, $20, 255, 255, $a0, 0, PharmacistScript_0x71afd, $ffff
; 0x71e20

