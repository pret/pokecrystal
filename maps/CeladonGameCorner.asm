CeladonGameCorner_MapScriptHeader: ; 0x7211b
	; trigger count
	db 0

	; callback count
	db 0
; 0x7211d

UnknownScript_0x7211d: ; 0x7211d
	jumpstd $0032
; 0x72120

UnknownScript_0x72120: ; 0x72120
	jumptextfaceplayer UnknownText_0x721d0
; 0x72123

UnknownScript_0x72123: ; 0x72123
	faceplayer
	loadfont
	2writetext UnknownText_0x72215
	closetext
	loadmovesprites
	spriteface $4, $2
	end
; 0x7212e

UnknownScript_0x7212e: ; 0x7212e
	faceplayer
	loadfont
	2writetext UnknownText_0x72242
	closetext
	loadmovesprites
	spriteface $5, $3
	end
; 0x72139

UnknownScript_0x72139: ; 0x72139
	faceplayer
	loadfont
	2writetext UnknownText_0x72295
	closetext
	loadmovesprites
	spriteface $6, $3
	end
; 0x72144

UnknownScript_0x72144: ; 0x72144
	faceplayer
	loadfont
	checkbit1 $00ce
	iftrue .UnknownScript_0x72169
	2writetext UnknownText_0x722dc
	keeptextopen
	checkitem COIN_CASE
	iffalse UnknownScript_0x7217b
	checkcoins 9998
	if_equal $0, UnknownScript_0x72184
	stringtotext .coinname, $1
	2call .UnknownScript_0x72172
	givecoins 18
	setbit1 $00ce
.UnknownScript_0x72169 ; 0x72169
	2writetext UnknownText_0x72345
	closetext
	loadmovesprites
	spriteface $fe, $2
	end
; 0x72172

.UnknownScript_0x72172 ; 0x72172
	jumpstd $002f
	end
; 0x72176

.coinname ; 0x72176
	db "COIN@"
; 0x7217b

UnknownScript_0x7217b: ; 0x7217b
	2writetext UnknownText_0x7238a
	closetext
	loadmovesprites
	spriteface $fe, $2
	end
; 0x72184

UnknownScript_0x72184: ; 0x72184
	2writetext UnknownText_0x723d9
	closetext
	loadmovesprites
	spriteface $fe, $2
	end
; 0x7218d

CeladonGymGuyScript: ; 0x7218d
	jumptextfaceplayer CeladonGymGuyText
; 0x72190

UnknownScript_0x72190: ; 0x72190
	faceplayer
	loadfont
	2writetext UnknownText_0x724ad
	closetext
	loadmovesprites
	spriteface $a, $2
	end
; 0x7219b

MapCeladonGameCornerSignpost36Script: ; 0x7219b
	jumptext UnknownText_0x724f3
; 0x7219e

MapCeladonGameCornerSignpost37Script: ; 0x7219e
	jumptext UnknownText_0x72521
; 0x721a1

MapCeladonGameCornerSignpost35Script: ; 0x721a1
	random $6
	if_equal $0, MapCeladonGameCornerSignpost16Script
	refreshscreen $0
	writebyte $0
	special $002a
	loadmovesprites
	end
; 0x721b0

MapCeladonGameCornerSignpost16Script: ; 0x721b0
	refreshscreen $0
	writebyte $1
	special $002a
	loadmovesprites
	end
; 0x721b9

MapCeladonGameCornerSignpost11Script: ; 0x721b9
	refreshscreen $0
	special $002b
	loadmovesprites
	end
; 0x721c0

MapCeladonGameCornerSignpost32Script: ; 0x721c0
	jumptext UnknownText_0x7254f
; 0x721c3

MapCeladonGameCornerSignpost9Script: ; 0x721c3
	loadfont
	2writetext UnknownText_0x72567
	closetext
	special $002b
	loadmovesprites
	end
; 0x721cd

INCBIN "baserom.gbc",$721cd,$721d0 - $721cd

UnknownText_0x721d0: ; 0x721d0
	db $0, "Welcome!", $51
	db "You may exchange", $4f
	db "your coins for", $51
	db "fabulous prizes", $4f
	db "next door.", $57
; 0x72215

UnknownText_0x72215: ; 0x72215
	db $0, "The slot machines", $4f
	db "are all state of", $55
	db "the art.", $57
; 0x72242

UnknownText_0x72242: ; 0x72242
	db $0, "It's this machine", $4f
	db "I want.", $51
	db "It cleaned me out", $4f
	db "yesterday, so it", $51
	db "should pay out", $4f
	db "today.", $57
; 0x72295

UnknownText_0x72295: ; 0x72295
	db $0, "I think this slot", $4f
	db "machine will pay", $55
	db "out…", $51
	db "The odds vary", $4f
	db "among machines.", $57
; 0x722dc

UnknownText_0x722dc: ; 0x722dc
	db $0, "Gahahaha!", $51
	db "The coins just", $4f
	db "keep popping out!", $51
	db "Hm? What, kid? You", $4f
	db "want to play?", $51
	db "I'll share my luck", $4f
	db "with you!", $57
; 0x72345

UnknownText_0x72345: ; 0x72345
	db $0, "Gahahaha!", $51
	db "It makes me feel", $4f
	db "good to do nice", $51
	db "things for other", $4f
	db "people!", $57
; 0x7238a

UnknownText_0x7238a: ; 0x7238a
	db $0, "Hey, you don't", $4f
	db "have a COIN CASE.", $51
	db "How am I supposed", $4f
	db "to give you any", $55
	db "coins, kid?", $57
; 0x723d9

UnknownText_0x723d9: ; 0x723d9
	db $0, "Hey, your COIN", $4f
	db "CASE is full, kid.", $51
	db "You must be riding", $4f
	db "a winning streak", $55
	db "too.", $57
; 0x72425

CeladonGymGuyText: ; 0x72425
	db $0, "Hey! CHAMP in", $4f
	db "making!", $51
	db "Are you playing", $4f
	db "the slots too?", $51
	db "I'm trying to get", $4f
	db "enough coins for a", $55
	db "prize #MON.", $51
	db "But I don't have", $4f
	db "enough coins yet…", $57
; 0x724ad

UnknownText_0x724ad: ; 0x724ad
	db $0, "Hmmm… The odds are", $4f
	db "surely better for", $51
	db "PIKACHU's line,", $4f
	db "but… What to do?", $57
; 0x724f3

UnknownText_0x724f3: ; 0x724f3
	db $0, "Hey!", $51
	db "Underneath this", $4f
	db "poster…", $51
	db "There's nothing!", $57
; 0x72521

UnknownText_0x72521: ; 0x72521
	db $0, "Hey!", $51
	db "Underneath this", $4f
	db "poster…", $51
	db "There's nothing!", $57
; 0x7254f

UnknownText_0x7254f: ; 0x7254f
	db $0, "There's a lighter", $4f
	db "here.", $57
; 0x72567

UnknownText_0x72567: ; 0x72567
	db $0, "A can of soda…", $51
	db "Someone must be", $4f
	db "coming back…", $51
	db "Huh? It's empty!", $57
; 0x725a4

CeladonGameCorner_MapEventHeader: ; 0x725a4
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $d, $e, 6, GROUP_CELADON_CITY, MAP_CELADON_CITY
	warp_def $d, $f, 6, GROUP_CELADON_CITY, MAP_CELADON_CITY

	; xy triggers
	db 0

	; signposts
	db 38
	signpost 6, 1, $0, MapCeladonGameCornerSignpost11Script
	signpost 7, 1, $0, MapCeladonGameCornerSignpost11Script
	signpost 8, 1, $0, MapCeladonGameCornerSignpost11Script
	signpost 9, 1, $0, MapCeladonGameCornerSignpost11Script
	signpost 10, 1, $0, MapCeladonGameCornerSignpost11Script
	signpost 11, 1, $4, MapCeladonGameCornerSignpost11Script
	signpost 6, 6, $0, MapCeladonGameCornerSignpost11Script
	signpost 7, 6, $0, MapCeladonGameCornerSignpost11Script
	signpost 8, 6, $0, MapCeladonGameCornerSignpost11Script
	signpost 9, 6, $0, MapCeladonGameCornerSignpost9Script
	signpost 10, 6, $0, MapCeladonGameCornerSignpost11Script
	signpost 11, 6, $3, MapCeladonGameCornerSignpost11Script
	signpost 6, 7, $0, MapCeladonGameCornerSignpost35Script
	signpost 7, 7, $0, MapCeladonGameCornerSignpost35Script
	signpost 8, 7, $0, MapCeladonGameCornerSignpost35Script
	signpost 9, 7, $0, MapCeladonGameCornerSignpost35Script
	signpost 10, 7, $0, MapCeladonGameCornerSignpost16Script
	signpost 11, 7, $4, MapCeladonGameCornerSignpost35Script
	signpost 6, 12, $0, MapCeladonGameCornerSignpost35Script
	signpost 7, 12, $0, MapCeladonGameCornerSignpost35Script
	signpost 8, 12, $0, MapCeladonGameCornerSignpost35Script
	signpost 9, 12, $0, MapCeladonGameCornerSignpost35Script
	signpost 10, 12, $0, MapCeladonGameCornerSignpost35Script
	signpost 11, 12, $3, MapCeladonGameCornerSignpost35Script
	signpost 6, 13, $0, MapCeladonGameCornerSignpost35Script
	signpost 7, 13, $0, MapCeladonGameCornerSignpost35Script
	signpost 8, 13, $0, MapCeladonGameCornerSignpost35Script
	signpost 9, 13, $0, MapCeladonGameCornerSignpost35Script
	signpost 10, 13, $0, MapCeladonGameCornerSignpost35Script
	signpost 11, 13, $4, MapCeladonGameCornerSignpost35Script
	signpost 6, 18, $0, MapCeladonGameCornerSignpost35Script
	signpost 7, 18, $0, MapCeladonGameCornerSignpost35Script
	signpost 8, 18, $0, MapCeladonGameCornerSignpost32Script
	signpost 9, 18, $0, MapCeladonGameCornerSignpost35Script
	signpost 10, 18, $0, MapCeladonGameCornerSignpost35Script
	signpost 11, 18, $3, MapCeladonGameCornerSignpost35Script
	signpost 0, 15, $0, MapCeladonGameCornerSignpost36Script
	signpost 0, 9, $0, MapCeladonGameCornerSignpost37Script

	; people-events
	db 9
	person_event $39, 6, 9, $6, $0, 255, 255, $a0, 0, UnknownScript_0x7211d, $ffff
	person_event $42, 6, 7, $6, $0, 255, 255, $a0, 0, UnknownScript_0x72120, $ffff
	person_event $2d, 14, 18, $8, $0, 255, 255, $80, 0, UnknownScript_0x72123, $ffff
	person_event $29, 11, 21, $9, $0, 255, 255, $90, 0, UnknownScript_0x7212e, $ffff
	person_event $3b, 11, 15, $9, $0, 255, 255, $a0, 0, UnknownScript_0x72139, $ffff
	person_event $3a, 14, 12, $8, $0, 255, 2, $80, 0, UnknownScript_0x72144, $ffff
	person_event $3a, 14, 12, $8, $0, 255, 4, $80, 0, UnknownScript_0x72144, $ffff
	person_event $48, 7, 15, $6, $0, 255, 255, $80, 0, CeladonGymGuyScript, $ffff
	person_event $2f, 12, 6, $8, $0, 255, 255, $a0, 0, UnknownScript_0x72190, $ffff
; 0x726e7

