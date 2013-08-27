LakeofRageMagikarpHouse_MapScriptHeader: ; 0x19a6ac
	; trigger count
	db 0

	; callback count
	db 0
; 0x19a6ae

FishingGuruScript_0x19a6ae: ; 0x19a6ae
	faceplayer
	loadfont
	checkbit1 $003a
	iftrue UnknownScript_0x19a6fe
	checkbit1 $0039
	iftrue UnknownScript_0x19a6e0
	checkbit1 $0022
	iftrue UnknownScript_0x19a6d7
	checkbit1 $0038
	iftrue UnknownScript_0x19a6d1
	2writetext UnknownText_0x19a72e
	closetext
	loadmovesprites
	setbit1 $0038
	end
; 0x19a6d1

UnknownScript_0x19a6d1: ; 0x19a6d1
	2writetext UnknownText_0x19a84d
	closetext
	loadmovesprites
	end
; 0x19a6d7

UnknownScript_0x19a6d7: ; 0x19a6d7
	2writetext UnknownText_0x19a890
	closetext
	loadmovesprites
	setbit1 $0039
	end
; 0x19a6e0

UnknownScript_0x19a6e0: ; 0x19a6e0
	writebyte MAGIKARP
	special $0042
	iffalse UnknownScript_0x19a6d7
	2writetext UnknownText_0x19a93e
	closetext
	special $0019
	if_equal $0, UnknownScript_0x19a71c
	if_equal $1, UnknownScript_0x19a722
	if_equal $2, UnknownScript_0x19a716
	2jump UnknownScript_0x19a6fe
; 0x19a6fe

UnknownScript_0x19a6fe: ; 0x19a6fe
	2writetext UnknownText_0x19a977
	keeptextopen
	verbosegiveitem ELIXER, 1
	iffalse UnknownScript_0x19a711
	2writetext UnknownText_0x19a9c3
	closetext
	loadmovesprites
	clearbit1 $003a
	end
; 0x19a711

UnknownScript_0x19a711: ; 0x19a711
	loadmovesprites
	setbit1 $003a
	end
; 0x19a716

UnknownScript_0x19a716: ; 0x19a716
	2writetext UnknownText_0x19aa01
	closetext
	loadmovesprites
	end
; 0x19a71c

UnknownScript_0x19a71c: ; 0x19a71c
	2writetext UnknownText_0x19aa5c
	closetext
	loadmovesprites
	end
; 0x19a722

UnknownScript_0x19a722: ; 0x19a722
	2writetext UnknownText_0x19aa79
	closetext
	loadmovesprites
	end
; 0x19a728

UnknownScript_0x19a728: ; 0x19a728
	jumptext UnknownText_0x19aabc
; 0x19a72b

MapLakeofRageMagikarpHouseSignpost1Script: ; 0x19a72b
	jumpstd $0001
; 0x19a72e

UnknownText_0x19a72e: ; 0x19a72e
	db $0, "LAKE OF RAGE is", $4f
	db "actually a crater", $51
	db "made by rampaging", $4f
	db "GYARADOS.", $51
	db "The crater filled", $4f
	db "up with rainwater", $51
	db "and the LAKE was", $4f
	db "formed.", $51
	db "That's the story", $4f
	db "passed on from my", $51
	db "Grandpa's great-", $4f
	db "great-grandpa.", $51
	db "It used to be that", $4f
	db "you could catch", $51
	db "lively MAGIKARP", $4f
	db "there, but…", $51
	db "I don't understand", $4f
	db "what's happening.", $57
; 0x19a84d

UnknownText_0x19a84d: ; 0x19a84d
	db $0, "The LAKE hasn't", $4f
	db "been normal since", $51
	db "those men wearing", $4f
	db "black arrived.", $57
; 0x19a890

UnknownText_0x19a890: ; 0x19a890
	db $0, "LAKE OF RAGE is", $4f
	db "back to normal.", $51
	db "The MAGIKARP have", $4f
	db "returned.", $51
	db "I may yet realize", $4f
	db "my dream of see-", $55
	db "ing the world's", $55
	db "largest MAGIKARP.", $51
	db "Do you have a ROD?", $4f
	db "Please help me if", $55
	db "you do.", $57
; 0x19a93e

UnknownText_0x19a93e: ; 0x19a93e
	db $0, "Ah, you have a", $4f
	db "MAGIKARP! Let's", $51
	db "see how big that", $4f
	db "baby is.", $57
; 0x19a977

UnknownText_0x19a977: ; 0x19a977
	db $0, "Wow! This one is", $4f
	db "outstanding!", $51
	db "I tip my hat to", $4f
	db "you!", $51
	db "Take this as a", $4f
	db "memento!", $57
; 0x19a9c3

UnknownText_0x19a9c3: ; 0x19a9c3
	db $0, "The record is the", $4f
	db "important thing.", $51
	db "Think of that as", $4f
	db "a bonus!", $57
; 0x19aa01

UnknownText_0x19aa01: ; 0x19aa01
	db $0, "Wow! This one is", $4f
	db "outstanding!", $51
	db "…I wish I could", $4f
	db "say that, but I've", $51
	db "seen a bigger one", $4f
	db "before.", $57
; 0x19aa5c

UnknownText_0x19aa5c: ; 0x19aa5c
	db $0, "What? That's not a", $4f
	db "MAGIKARP!", $57
; 0x19aa79

UnknownText_0x19aa79: ; 0x19aa79
	db $0, "Oh… So you didn't", $4f
	db "get one good", $51
	db "enough to show me?", $4f
	db "Maybe next time.", $57
; 0x19aabc

UnknownText_0x19aabc: ; 0x19aabc
	db $0, "CURRENT RECORD", $51
	db "@"
	text_from_ram $d099
	db $0, " caught by", $4f
	db "@"
	text_from_ram $d0ac
	db "@@"
; 0x19aae2

LakeofRageMagikarpHouse_MapEventHeader: ; 0x19aae2
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 2, GROUP_LAKE_OF_RAGE, MAP_LAKE_OF_RAGE
	warp_def $7, $3, 2, GROUP_LAKE_OF_RAGE, MAP_LAKE_OF_RAGE

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 0, $0, MapLakeofRageMagikarpHouseSignpost1Script
	signpost 1, 1, $0, MapLakeofRageMagikarpHouseSignpost1Script

	; people-events
	db 1
	person_event SPRITE_FISHING_GURU, 7, 6, $3, $0, 255, 255, $0, 0, FishingGuruScript_0x19a6ae, $ffff
; 0x19ab09

