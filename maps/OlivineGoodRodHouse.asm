OlivineGoodRodHouse_MapScriptHeader: ; 0x9c719
	; trigger count
	db 0

	; callback count
	db 0
; 0x9c71b

UnknownScript_0x9c71b: ; 0x9c71b
	faceplayer
	loadfont
	checkbit1 $0018
	iftrue UnknownScript_0x9c740
	2writetext UnknownText_0x9c749
	yesorno
	iffalse UnknownScript_0x9c73a
	2writetext UnknownText_0x9c7db
	keeptextopen
	verbosegiveitem GOOD_ROD, 1
	2writetext UnknownText_0x9c807
	closetext
	loadmovesprites
	setbit1 $0018
	end
; 0x9c73a

UnknownScript_0x9c73a: ; 0x9c73a
	2writetext UnknownText_0x9c84c
	closetext
	loadmovesprites
	end
; 0x9c740

UnknownScript_0x9c740: ; 0x9c740
	2writetext UnknownText_0x9c87f
	closetext
	loadmovesprites
	end
; 0x9c746

UnknownScript_0x9c746: ; 0x9c746
	jumpstd $0002
; 0x9c749

UnknownText_0x9c749: ; 0x9c749
	db $0, "OLIVINE is on the", $4f
	db "sea!", $51
	db "And if it's on the", $4f
	db "sea, there are", $55
	db "bound to be fish!", $51
	db "I've fished here", $4f
	db "for 30 years.", $51
	db "Would you like to", $4f
	db "face the sea and", $55
	db "fish?", $57
; 0x9c7db

UnknownText_0x9c7db: ; 0x9c7db
	db $0, "Ah, hahah!", $4f
	db "We have ourselves", $55
	db "a new angler!", $57
; 0x9c807

UnknownText_0x9c807: ; 0x9c807
	db $0, "Fish aren't found", $4f
	db "in the sea alone.", $51
	db "They go wherever", $4f
	db "there is water.", $57
; 0x9c84c

UnknownText_0x9c84c: ; 0x9c84c
	db $0, "Whaaat? You don't", $4f
	db "like to fish!?", $55
	db "Incomprehensible!", $57
; 0x9c87f

UnknownText_0x9c87f: ; 0x9c87f
	db $0, "How are things?", $4f
	db "Land the big one?", $57
; 0x9c8a2

OlivineGoodRodHouse_MapEventHeader: ; 0x9c8a2
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 6, GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY
	warp_def $7, $3, 6, GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event $3b, 7, 6, $6, $0, 255, 255, $a0, 0, UnknownScript_0x9c71b, $ffff
; 0x9c8bf

