Route35Goldenrodgate_MapScriptHeader: ; 0x69d35
	; trigger count
	db 0

	; callback count
	db 0
; 0x69d37

OfficerScript_0x69d37: ; 0x69d37
	faceplayer
	loadfont
	checkevent EVENT_GOT_HP_UP_FROM_RANDY
	iftrue UnknownScript_0x69d92
	checkevent EVENT_GAVE_KENYA
	iftrue UnknownScript_0x69d85
	checkevent EVENT_GOT_KENYA
	iftrue UnknownScript_0x69d73
	writetext UnknownText_0x69ddd
	yesorno
	iffalse UnknownScript_0x69d7f
	writetext UnknownText_0x69e48
	keeptextopen
	waitbutton
	checkcode $1
	if_equal $6, UnknownScript_0x69d79
	writetext UnknownText_0x69eb8
	playsound SFX_KEY_ITEM
	waitbutton
	givepoke SPEAROW, 10, 0, 1, GiftSpearowName, GiftSpearowOTName
	givepokeitem GiftSpearowMail
	setevent EVENT_GOT_KENYA
UnknownScript_0x69d73: ; 0x69d73
	writetext UnknownText_0x69ed6
	closetext
	loadmovesprites
	end
; 0x69d79

UnknownScript_0x69d79: ; 0x69d79
	writetext UnknownText_0x69f56
	closetext
	loadmovesprites
	end
; 0x69d7f

UnknownScript_0x69d7f: ; 0x69d7f
	writetext UnknownText_0x69f74
	closetext
	loadmovesprites
	end
; 0x69d85

UnknownScript_0x69d85: ; 0x69d85
	writetext UnknownText_0x69f8b
	keeptextopen
	verbosegiveitem HP_UP, 1
	iffalse UnknownScript_0x69d96
	setevent EVENT_GOT_HP_UP_FROM_RANDY
UnknownScript_0x69d92: ; 0x69d92
	writetext UnknownText_0x69fd9
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
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue UnknownScript_0x69dd4
	writetext UnknownText_0x6a00a
	closetext
	loadmovesprites
	end
; 0x69dd4

UnknownScript_0x69dd4: ; 0x69dd4
	writetext UnknownText_0x6a09a
	closetext
	loadmovesprites
	end
; 0x69dda

FisherScript_0x69dda: ; 0x69dda
	jumptextfaceplayer UnknownText_0x6a0cb
; 0x69ddd

UnknownText_0x69ddd: ; 0x69ddd
	text "Excuse me, kid!"
	line "Can you do a guy"
	cont "a favor?"

	para "Can you take this"
	line "#MON with MAIL"
	cont "to my friend?"

	para "He's on ROUTE 31."
	done
; 0x69e48

UnknownText_0x69e48: ; 0x69e48
	text "You will? Perfect!"
	line "Thanks, kid!"

	para "My pal's a chubby"
	line "guy who snoozes"
	cont "all the time."

	para "You'll recognize"
	line "him right away!"
	done
; 0x69eb8

UnknownText_0x69eb8: ; 0x69eb8
	text $52, " received a"
	line "#MON with MAIL."
	done
; 0x69ed6

UnknownText_0x69ed6: ; 0x69ed6
	text "You can read it,"
	line "but don't lose it!"
	cont "ROUTE 31!"

	para "Oh, yeah. There"
	line "was a weird tree"
	cont "blocking the road."

	para "I wonder if it's"
	line "been cleared?"
	done
; 0x69f56

UnknownText_0x69f56: ; 0x69f56
	text "You can't carry"
	line "another #MON…"
	done
; 0x69f74

UnknownText_0x69f74: ; 0x69f74
	text "Oh… Never mind,"
	line "then…"
	done
; 0x69f8b

UnknownText_0x69f8b: ; 0x69f8b
	text "Thanks, kid! You"
	line "made the delivery"
	cont "for me!"

	para "Here's something"
	line "for your trouble!"
	done
; 0x69fd9

UnknownText_0x69fd9: ; 0x69fd9
	text "My pal was snooz-"
	line "ing, right? Heh,"
	cont "what'd I say?"
	done
; 0x6a00a

UnknownText_0x6a00a: ; 0x6a00a
	text "A strange tree is"
	line "blocking the road."

	para "It wriggles around"
	line "if you talk to it."

	para "I heard it became"
	line "wild when someone"

	para "watered it with a"
	line "SQUIRTBOTTLE."
	done
; 0x6a09a

UnknownText_0x6a09a: ; 0x6a09a
	text "I like the #MON"
	line "Lullaby they play"
	cont "on the radio."
	done
; 0x6a0cb

UnknownText_0x6a0cb: ; 0x6a0cb
	text "I wonder how many"
	line "kinds of #MON"

	para "there are in the"
	line "world."

	para "Three years ago,"
	line "PROF.OAK said that"

	para "there were 150"
	line "different kinds."
	done
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

