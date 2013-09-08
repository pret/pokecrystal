Route39Farmhouse_MapScriptHeader: ; 0x9ceb2
	; trigger count
	db 0

	; callback count
	db 0
; 0x9ceb4

PokefanMScript_0x9ceb4: ; 0x9ceb4
	faceplayer
	loadfont
	checkbit1 EVENT_HEALED_MOOMOO
	iftrue UnknownScript_0x9cec5
	2writetext UnknownText_0x9cf38
	closetext
	loadmovesprites
	setbit1 EVENT_TALKED_TO_FARMER_ABOUT_MOOMOO
	end
; 0x9cec5

UnknownScript_0x9cec5: ; 0x9cec5
	checkitem MOOMOO_MILK
	iftrue UnknownScript_0x9cf08
	2writetext UnknownText_0x9cfe1
	special $0051
	yesorno
	iffalse UnknownScript_0x9cf02
	checkmoney $0, 500
	if_equal $2, UnknownScript_0x9cef6
	giveitem MOOMOO_MILK, $1
	iffalse UnknownScript_0x9cefc
	takemoney $0, 500
	special $0051
	waitbutton
	playsound $0022
	2writetext UnknownText_0x9d05d
	keeptextopen
	itemnotify
	loadmovesprites
	end
; 0x9cef6

UnknownScript_0x9cef6: ; 0x9cef6
	2writetext UnknownText_0x9d07c
	closetext
	loadmovesprites
	end
; 0x9cefc

UnknownScript_0x9cefc: ; 0x9cefc
	2writetext UnknownText_0x9d09d
	closetext
	loadmovesprites
	end
; 0x9cf02

UnknownScript_0x9cf02: ; 0x9cf02
	2writetext UnknownText_0x9d0b7
	closetext
	loadmovesprites
	end
; 0x9cf08

UnknownScript_0x9cf08: ; 0x9cf08
	2writetext UnknownText_0x9d0dc
	closetext
	loadmovesprites
	end
; 0x9cf0e

PokefanFScript_0x9cf0e: ; 0x9cf0e
	faceplayer
	loadfont
	checkbit1 EVENT_GOT_TM13_SNORE_FROM_MOOMOO_FARM
	iftrue UnknownScript_0x9cf2f
	checkbit1 EVENT_HEALED_MOOMOO
	iftrue UnknownScript_0x9cf22
	2writetext UnknownText_0x9d0f6
	closetext
	loadmovesprites
	end
; 0x9cf22

UnknownScript_0x9cf22: ; 0x9cf22
	2writetext UnknownText_0x9d156
	keeptextopen
	verbosegiveitem TM_13, 1
	iffalse UnknownScript_0x9cf33
	setbit1 EVENT_GOT_TM13_SNORE_FROM_MOOMOO_FARM
UnknownScript_0x9cf2f: ; 0x9cf2f
	2writetext UnknownText_0x9d1c7
	closetext
UnknownScript_0x9cf33: ; 0x9cf33
	loadmovesprites
	end
; 0x9cf35

MapRoute39FarmhouseSignpost1Script: ; 0x9cf35
	jumpstd $0002
; 0x9cf38

UnknownText_0x9cf38: ; 0x9cf38
	db $0, "My MILTANK ain't", $4f
	db "givin' me milk", $55
	db "n'more.", $51
	db "This here FARM's", $4f
	db "got famous milk.", $51
	db "Most everyone", $4f
	db "wants a drink.", $51
	db "It'll give me lots", $4f
	db "o' milk if'n I", $51
	db "feed it lots o'", $4f
	db "BERRIES, I reckon.", $57
; 0x9cfe1

UnknownText_0x9cfe1: ; 0x9cfe1
	db $0, "How'd you like my", $4f
	db "MOOMOO MILK?", $51
	db "It's my pride and", $4f
	db "joy, there.", $51
	db "Give it to #MON", $4f
	db "to restore HP!", $51
	db "I'll give it to ya", $4f
	db "fer just ¥500.", $57
; 0x9d05d

UnknownText_0x9d05d: ; 0x9d05d
	db $0, "Here ya go!", $4f
	db "Drink up'n enjoy!", $57
; 0x9d07c

UnknownText_0x9d07c: ; 0x9d07c
	db $0, "Sorry, there.", $4f
	db "No cash, no sale!", $57
; 0x9d09d

UnknownText_0x9d09d: ; 0x9d09d
	db $0, "I reckon yer", $4f
	db "PACK's full.", $57
; 0x9d0b7

UnknownText_0x9d0b7: ; 0x9d0b7
	db $0, "You don't want it?", $4f
	db "Come again, hear?", $57
; 0x9d0dc

UnknownText_0x9d0dc: ; 0x9d0dc
	db $0, "I best go do my", $4f
	db "milkin'.", $57
; 0x9d0f6

UnknownText_0x9d0f6: ; 0x9d0f6
	db $0, "Our milk even goes", $4f
	db "out to KANTO.", $51
	db "So if our own", $4f
	db "MILTANK won't give", $51
	db "us any milk, we're", $4f
	db "in trouble.", $57
; 0x9d156

UnknownText_0x9d156: ; 0x9d156
	db $0, "You fixed our", $4f
	db "MILTANK, hon. Now", $51
	db "it gives MOOMOO", $4f
	db "MILK again.", $51
	db "Here's somethin'", $4f
	db "fer your trouble.", $57
; 0x9d1b5

UnknownText_0x9d1b5: ; 0x9d1b5
	db $0, $52, " received", $4f
	db "TM13.", $57
; 0x9d1c7

UnknownText_0x9d1c7: ; 0x9d1c7
	db $0, "That there's", $4f
	db "SNORE.", $51
	db "It's a rare move", $4f
	db "that only works", $51
	db "while the #MON", $4f
	db "is asleep.", $51
	db "You best think how", $4f
	db "you ought to use", $55
	db "it, hon.", $57
; 0x9d242

Route39Farmhouse_MapEventHeader: ; 0x9d242
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 2, GROUP_ROUTE_39, MAP_ROUTE_39
	warp_def $7, $3, 2, GROUP_ROUTE_39, MAP_ROUTE_39

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 0, $0, MapRoute39FarmhouseSignpost1Script
	signpost 1, 1, $0, MapRoute39FarmhouseSignpost1Script

	; people-events
	db 2
	person_event SPRITE_POKEFAN_M, 6, 7, $6, $0, 255, 255, $90, 0, PokefanMScript_0x9ceb4, $ffff
	person_event SPRITE_POKEFAN_F, 8, 9, $8, $0, 255, 255, $b0, 0, PokefanFScript_0x9cf0e, $ffff
; 0x9d276

