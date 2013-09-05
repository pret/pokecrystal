Route35Goldenrodgate_MapScriptHeader: ; 0x69d35
	; trigger count
	db 0

	; callback count
	db 0
; 0x69d37

OfficerScript_0x69d37: ; 0x69d37
	faceplayer
	loadfont
	checkbit1 EVENT_GOT_HP_UP_FROM_RANDY
	iftrue UnknownScript_0x69d92
	checkbit1 EVENT_GAVE_KENYA
	iftrue UnknownScript_0x69d85
	checkbit1 EVENT_GOT_KENYA
	iftrue UnknownScript_0x69d73
	2writetext UnknownText_0x69ddd
	yesorno
	iffalse UnknownScript_0x69d7f
	2writetext UnknownText_0x69e48
	keeptextopen
	waitbutton
	checkcode $1
	if_equal $6, UnknownScript_0x69d79
	2writetext UnknownText_0x69eb8
	playsound $0091
	waitbutton
	givepoke SPEAROW, 10, 0, 1, GiftSpearowName, GiftSpearowOTName
	givepokeitem GiftSpearowMail
	setbit1 EVENT_GOT_KENYA
UnknownScript_0x69d73: ; 0x69d73
	2writetext UnknownText_0x69ed6
	closetext
	loadmovesprites
	end
; 0x69d79

UnknownScript_0x69d79: ; 0x69d79
	2writetext UnknownText_0x69f56
	closetext
	loadmovesprites
	end
; 0x69d7f

UnknownScript_0x69d7f: ; 0x69d7f
	2writetext UnknownText_0x69f74
	closetext
	loadmovesprites
	end
; 0x69d85

UnknownScript_0x69d85: ; 0x69d85
	2writetext UnknownText_0x69f8b
	keeptextopen
	verbosegiveitem HP_UP, 1
	iffalse UnknownScript_0x69d96
	setbit1 EVENT_GOT_HP_UP_FROM_RANDY
UnknownScript_0x69d92: ; 0x69d92
	2writetext UnknownText_0x69fd9
	closetext
UnknownScript_0x69d96: ; 0x69d96
	loadmovesprites
	end

GiftSpearowMail: ; 0x69d98
	db FLOWER_MAIL
	db "DARK CAVE leads", $4E
	db "to another road@"
GiftSpearowName: ; 0x69db9
	db "KENYA@"
GiftSpearowOTName: ; 0x69dbf
	db "RANDY@"

	db 0 ; 0x69dc5 XXX is there a reason for this?

PokefanFScript_0x69dc6: ; 0x69dc6
	faceplayer
	loadfont
	checkbit1 EVENT_FOUGHT_SUDOWOODO
	iftrue UnknownScript_0x69dd4
	2writetext UnknownText_0x6a00a
	closetext
	loadmovesprites
	end
; 0x69dd4

UnknownScript_0x69dd4: ; 0x69dd4
	2writetext UnknownText_0x6a09a
	closetext
	loadmovesprites
	end
; 0x69dda

FisherScript_0x69dda: ; 0x69dda
	jumptextfaceplayer UnknownText_0x6a0cb
; 0x69ddd

UnknownText_0x69ddd: ; 0x69ddd
	db $0, "Excuse me, kid!", $4f
	db "Can you do a guy", $55
	db "a favor?", $51
	db "Can you take this", $4f
	db "#MON with MAIL", $55
	db "to my friend?", $51
	db "He's on ROUTE 31.", $57
; 0x69e48

UnknownText_0x69e48: ; 0x69e48
	db $0, "You will? Perfect!", $4f
	db "Thanks, kid!", $51
	db "My pal's a chubby", $4f
	db "guy who snoozes", $55
	db "all the time.", $51
	db "You'll recognize", $4f
	db "him right away!", $57
; 0x69eb8

UnknownText_0x69eb8: ; 0x69eb8
	db $0, $52, " received a", $4f
	db "#MON with MAIL.", $57
; 0x69ed6

UnknownText_0x69ed6: ; 0x69ed6
	db $0, "You can read it,", $4f
	db "but don't lose it!", $55
	db "ROUTE 31!", $51
	db "Oh, yeah. There", $4f
	db "was a weird tree", $55
	db "blocking the road.", $51
	db "I wonder if it's", $4f
	db "been cleared?", $57
; 0x69f56

UnknownText_0x69f56: ; 0x69f56
	db $0, "You can't carry", $4f
	db "another #MON…", $57
; 0x69f74

UnknownText_0x69f74: ; 0x69f74
	db $0, "Oh… Never mind,", $4f
	db "then…", $57
; 0x69f8b

UnknownText_0x69f8b: ; 0x69f8b
	db $0, "Thanks, kid! You", $4f
	db "made the delivery", $55
	db "for me!", $51
	db "Here's something", $4f
	db "for your trouble!", $57
; 0x69fd9

UnknownText_0x69fd9: ; 0x69fd9
	db $0, "My pal was snooz-", $4f
	db "ing, right? Heh,", $55
	db "what'd I say?", $57
; 0x6a00a

UnknownText_0x6a00a: ; 0x6a00a
	db $0, "A strange tree is", $4f
	db "blocking the road.", $51
	db "It wriggles around", $4f
	db "if you talk to it.", $51
	db "I heard it became", $4f
	db "wild when someone", $51
	db "watered it with a", $4f
	db "SQUIRTBOTTLE.", $57
; 0x6a09a

UnknownText_0x6a09a: ; 0x6a09a
	db $0, "I like the #MON", $4f
	db "Lullaby they play", $55
	db "on the radio.", $57
; 0x6a0cb

UnknownText_0x6a0cb: ; 0x6a0cb
	db $0, "I wonder how many", $4f
	db "kinds of #MON", $51
	db "there are in the", $4f
	db "world.", $51
	db "Three years ago,", $4f
	db "PROF.OAK said that", $51
	db "there were 150", $4f
	db "different kinds.", $57
; 0x6a148

Route35Goldenrodgate_MapEventHeader: ; 0x6a148
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $0, $4, 1, GROUP_ROUTE_35, MAP_ROUTE_35
	warp_def $0, $5, 2, GROUP_ROUTE_35, MAP_ROUTE_35
	warp_def $7, $4, 12, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY
	warp_def $7, $5, 12, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 3
	person_event SPRITE_OFFICER, 8, 4, $9, $0, 255, 255, $80, 0, OfficerScript_0x69d37, $ffff
	person_event SPRITE_POKEFAN_F, 8, 10, $4, $10, 255, 255, $90, 0, PokefanFScript_0x69dc6, $ffff
	person_event SPRITE_FISHER, 6, 7, $3, $0, 255, 255, $a0, 0, FisherScript_0x69dda, $ffff
; 0x6a189

