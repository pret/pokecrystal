Route35Goldenrodgate_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

OfficerScript_0x69d37:
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
	checkcode VAR_PARTYCOUNT
	if_equal $6, UnknownScript_0x69d79
	writetext UnknownText_0x69eb8
	playsound SFX_KEY_ITEM
	waitbutton
	givepoke SPEAROW, 10, 0, 1, GiftSpearowName, GiftSpearowOTName
	givepokeitem GiftSpearowMail
	setevent EVENT_GOT_KENYA
UnknownScript_0x69d73:
	writetext UnknownText_0x69ed6
	closetext
	loadmovesprites
	end

UnknownScript_0x69d79:
	writetext UnknownText_0x69f56
	closetext
	loadmovesprites
	end

UnknownScript_0x69d7f:
	writetext UnknownText_0x69f74
	closetext
	loadmovesprites
	end

UnknownScript_0x69d85:
	writetext UnknownText_0x69f8b
	keeptextopen
	verbosegiveitem HP_UP, 1
	iffalse UnknownScript_0x69d96
	setevent EVENT_GOT_HP_UP_FROM_RANDY
UnknownScript_0x69d92:
	writetext UnknownText_0x69fd9
	closetext
UnknownScript_0x69d96:
	loadmovesprites
	end

GiftSpearowMail:
	db FLOWER_MAIL
	db "DARK CAVE leads", $4E
	db "to another road@"
GiftSpearowName:
	db "KENYA@"
GiftSpearowOTName:
	db "RANDY@"

	db 0

PokefanFScript_0x69dc6:
	faceplayer
	loadfont
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue UnknownScript_0x69dd4
	writetext UnknownText_0x6a00a
	closetext
	loadmovesprites
	end

UnknownScript_0x69dd4:
	writetext UnknownText_0x6a09a
	closetext
	loadmovesprites
	end

FisherScript_0x69dda:
	jumptextfaceplayer UnknownText_0x6a0cb

UnknownText_0x69ddd:
	text "Excuse me, kid!"
	line "Can you do a guy"
	cont "a favor?"

	para "Can you take this"
	line "#MON with MAIL"
	cont "to my friend?"

	para "He's on ROUTE 31."
	done

UnknownText_0x69e48:
	text "You will? Perfect!"
	line "Thanks, kid!"

	para "My pal's a chubby"
	line "guy who snoozes"
	cont "all the time."

	para "You'll recognize"
	line "him right away!"
	done

UnknownText_0x69eb8:
	text "<PLAYER> received a"
	line "#MON with MAIL."
	done

UnknownText_0x69ed6:
	text "You can read it,"
	line "but don't lose it!"
	cont "ROUTE 31!"

	para "Oh, yeah. There"
	line "was a weird tree"
	cont "blocking the road."

	para "I wonder if it's"
	line "been cleared?"
	done

UnknownText_0x69f56:
	text "You can't carry"
	line "another #MON…"
	done

UnknownText_0x69f74:
	text "Oh… Never mind,"
	line "then…"
	done

UnknownText_0x69f8b:
	text "Thanks, kid! You"
	line "made the delivery"
	cont "for me!"

	para "Here's something"
	line "for your trouble!"
	done

UnknownText_0x69fd9:
	text "My pal was snooz-"
	line "ing, right? Heh,"
	cont "what'd I say?"
	done

UnknownText_0x6a00a:
	text "A strange tree is"
	line "blocking the road."

	para "It wriggles around"
	line "if you talk to it."

	para "I heard it became"
	line "wild when someone"

	para "watered it with a"
	line "SQUIRTBOTTLE."
	done

UnknownText_0x6a09a:
	text "I like the #MON"
	line "Lullaby they play"
	cont "on the radio."
	done

UnknownText_0x6a0cb:
	text "I wonder how many"
	line "kinds of #MON"

	para "there are in the"
	line "world."

	para "Three years ago,"
	line "PROF.OAK said that"

	para "there were 150"
	line "different kinds."
	done

Route35Goldenrodgate_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $0, $4, 1, GROUP_ROUTE_35, MAP_ROUTE_35
	warp_def $0, $5, 2, GROUP_ROUTE_35, MAP_ROUTE_35
	warp_def $7, $4, 12, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY
	warp_def $7, $5, 12, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_OFFICER, 8, 4, OW_LEFT | $1, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, OfficerScript_0x69d37, -1
	person_event SPRITE_POKEFAN_F, 8, 10, OW_UP | $0, $10, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, PokefanFScript_0x69dc6, -1
	person_event SPRITE_FISHER, 6, 7, OW_DOWN | $3, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, FisherScript_0x69dda, -1
