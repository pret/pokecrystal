GoldenrodFlowerShop_MapScriptHeader: ; 0x5535b
	; trigger count
	db 0

	; callback count
	db 0
; 0x5535d

UnknownScript_0x5535d: ; 0x5535d
	checkbit1 $002a
	iftrue UnknownScript_0x5538f
	checkbit1 $005c
	iftrue UnknownScript_0x55399
	checkbit1 $00b9
	iffalse UnknownScript_0x5539f
	checkbit1 $00ba
	iffalse UnknownScript_0x5538f
	checkbit2 $001d
	iffalse UnknownScript_0x5539c
	faceplayer
	loadfont
	2writetext UnknownText_0x554c2
	keeptextopen
	verbosegiveitem SQUIRTBOTTLE, 1
	setbit1 $005c
	loadmovesprites
	setbit1 $0769
	clearbit1 $0768
	end
; 0x5538f

UnknownScript_0x5538f: ; 0x5538f
	spriteface $2, $2
	loadfont
	2writetext UnknownText_0x5552e
	closetext
	loadmovesprites
	end
; 0x55399

UnknownScript_0x55399: ; 0x55399
	jumptextfaceplayer UnknownText_0x5550d
; 0x5539c

UnknownScript_0x5539c: ; 0x5539c
	jumptextfaceplayer UnknownText_0x55463
; 0x5539f

UnknownScript_0x5539f: ; 0x5539f
	jumptextfaceplayer UnknownText_0x553d4
; 0x553a2

UnknownScript_0x553a2: ; 0x553a2
	faceplayer
	loadfont
	checkbit1 $002a
	iftrue UnknownScript_0x553c5
	checkbit1 $005c
	iftrue UnknownScript_0x553bf
	2writetext UnknownText_0x55561
	closetext
	loadmovesprites
	setbit1 $00ba
	setbit1 $0768
	clearbit1 $0769
	end
; 0x553bf

UnknownScript_0x553bf: ; 0x553bf
	2writetext UnknownText_0x555e6
	closetext
	loadmovesprites
	end
; 0x553c5

UnknownScript_0x553c5: ; 0x553c5
	2writetext UnknownText_0x55604
	closetext
	loadmovesprites
	end
; 0x553cb

UnknownScript_0x553cb: ; 0x553cb
	jumpstd $0002
; 0x553ce

UnknownScript_0x553ce: ; 0x553ce
	jumpstd $0003
; 0x553d1

UnknownScript_0x553d1: ; 0x553d1
	jumpstd $000c
; 0x553d4

UnknownText_0x553d4: ; 0x553d4
	db $0, "Have you seen that", $4f
	db "wiggly tree that's", $51
	db "growing on ROUTE", $4f
	db "36?", $51
	db "My little sister", $4f
	db "got all excited", $51
	db "and went to see", $4f
	db "it…", $51
	db "I'm worried… Isn't", $4f
	db "it dangerous?", $57
; 0x55463

UnknownText_0x55463: ; 0x55463
	db $0, "Do you want to", $4f
	db "borrow the water", $51
	db "bottle too?", $4f
	db "I don't want you", $51
	db "doing anything", $4f
	db "dangerous with it.", $57
; 0x554c2

UnknownText_0x554c2: ; 0x554c2
	db $0, "Oh, you're better", $4f
	db "than WHITNEY…", $51
	db "You'll be OK,", $4f
	db "then. Here's the", $55
	db "SQUIRTBOTTLE!", $57
; 0x5550d

UnknownText_0x5550d: ; 0x5550d
	db $0, "Don't do anything", $4f
	db "too dangerous!", $57
; 0x5552e

UnknownText_0x5552e: ; 0x5552e
	db $0, "Lalala lalalala.", $4f
	db "Have plenty of", $55
	db "water, my lovely!", $57
; 0x55561

UnknownText_0x55561: ; 0x55561
	db $0, "When I told my sis", $4f
	db "about the jiggly", $51
	db "tree, she told me", $4f
	db "it's dangerous.", $51
	db "If I beat WHITNEY,", $4f
	db "I wonder if she'll", $51
	db "lend me her water", $4f
	db "bottle…", $57
; 0x555e6

UnknownText_0x555e6: ; 0x555e6
	db $0, "Wow, you beat", $4f
	db "WHITNEY? Cool!", $57
; 0x55604

UnknownText_0x55604: ; 0x55604
	db $0, "So it really was a", $4f
	db "#MON!", $57
; 0x5561e

GoldenrodFlowerShop_MapEventHeader: ; 0x5561e
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 6, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY
	warp_def $7, $3, 6, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event $29, 8, 6, $9, $0, 255, 255, $0, 0, UnknownScript_0x5535d, $ffff
	person_event $28, 10, 9, $2, $11, 255, 255, $90, 0, UnknownScript_0x553a2, $0768
; 0x55648

