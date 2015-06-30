GoldenrodBillsHouse_MapScriptHeader: ; 0x54be2
	; trigger count
	db 0

	; callback count
	db 0
; 0x54be4

BillsHouseBill:
	faceplayer
	loadfont
	checkevent EVENT_GOT_EEVEE
	iftrue UnknownScript_0x54c1f
	writetext UnknownText_0x54c74
	yesorno
	iffalse UnknownScript_0x54c19
	writetext UnknownText_0x54d3f
	keeptextopen
	waitbutton
	checkcode VAR_PARTYCOUNT
	if_equal $6, UnknownScript_0x54c13
	writetext UnknownText_0x54dae
	playsound SFX_CAUGHT_MON
	waitbutton
	givepoke EEVEE, 20, 0, 0
	setevent EVENT_GOT_EEVEE
	writetext UnknownText_0x54dc1
	closetext
	loadmovesprites
	end
; 0x54c13

UnknownScript_0x54c13: ; 0x54c13
	writetext UnknownText_0x54e02
	closetext
	loadmovesprites
	end
; 0x54c19

UnknownScript_0x54c19: ; 0x54c19
	writetext UnknownText_0x54e2d
	closetext
	loadmovesprites
	end
; 0x54c1f

UnknownScript_0x54c1f: ; 0x54c1f
	writetext UnknownText_0x54e42
	closetext
	loadmovesprites
	end
; 0x54c25

BillsMom: ; 0x54c25
	faceplayer
	loadfont
	checkevent $0712
	iffalse UnknownScript_0x54c33
	writetext UnknownText_0x54ea8
	closetext
	loadmovesprites
	end
; 0x54c33

UnknownScript_0x54c33: ; 0x54c33
	writetext UnknownText_0x54f4e
	closetext
	loadmovesprites
	end
; 0x54c39

BillsSister:
	faceplayer
	loadfont
	checkcellnum $3
	iftrue UnknownScript_0x54c58
	writetext UnknownText_0x54f9e
	askforphonenumber $3
	if_equal $1, UnknownScript_0x54c64
	if_equal $2, UnknownScript_0x54c5e
	waitbutton
	addcellnum $3
	writetext UnknownText_0x54fd9
	playsound SFX_REGISTER_PHONE_NUMBER
	waitbutton
	keeptextopen
UnknownScript_0x54c58: ;0x54c58
	writetext UnknownText_0x55069
	closetext
	loadmovesprites
	end
; 0x54c5e

UnknownScript_0x54c5e: ; 0x54c5e
	writetext UnknownText_0x54ff3
	closetext
	loadmovesprites
	end
; 0x54c64

UnknownScript_0x54c64: ; 0x54c64
	writetext UnknownText_0x55046
	keeptextopen
	jump UnknownScript_0x54c5e
; 0x54c6b

BillsHouseBookshelf1:
	jumpstd picturebookshelf

BillsHouseBookshelf2:
	jumpstd magazinebookshelf

BillsHouseRadio:
	jumpstd radio2

UnknownText_0x54c74: ; 0x54c74
	text "BILL: Hi, <PLAYER>!"
	line "Do us a favor and"
	cont "take this EEVEE."

	para "It came over when"
	line "I was adjusting"
	cont "the TIME CAPSULE."

	para "Someone has to"
	line "take care of it,"

	para "but I don't like"
	line "being outside."

	para "Can I count on you"
	line "to play with it,"
	cont "<PLAYER>?"
	done
; 0x54d3f

UnknownText_0x54d3f: ; 0x54d3f
	text "BILL: I knew you'd"
	line "come through!"

	para "Way to go! You're"
	line "the real deal!"

	para "OK, I'm counting"
	line "on you."

	para "Take good care of"
	line "it!"
	done
; 0x54dae

UnknownText_0x54dae: ; 0x54dae
	text "<PLAYER> received"
	line "EEVEE!"
	done
; 0x54dc1

UnknownText_0x54dc1: ; 0x54dc1
	text "BILL: PROF.ELM"
	line "claims EEVEE may"

	para "evolve in new and"
	line "unknown ways."
	done
; 0x54e02

UnknownText_0x54e02: ; 0x54e02
	text "Whoa, wait. You"
	line "can't carry any"
	cont "more #MON."
	done
; 0x54e2d

UnknownText_0x54e2d: ; 0x54e2d
	text "Oh… Now what to"
	line "do?"
	done
; 0x54e42

UnknownText_0x54e42: ; 0x54e42
	text "BILL: My pop, he"
	line "won't work. All he"

	para "does is goof off"
	line "all day long."

	para "He's getting to be"
	line "a real headache…"
	done
; 0x54ea8

UnknownText_0x54ea8: ; 0x54ea8
	text "Oh, you collect"
	line "#MON? My son"
	cont "BILL is an expert."

	para "He just got called"
	line "to the #MON"

	para "CENTER in ECRUTEAK"
	line "CITY."

	para "My husband went"
	line "off to the GAME"

	para "CORNER without"
	line "being called…"
	done
; 0x54f4e

UnknownText_0x54f4e: ; 0x54f4e
	text "My husband was"
	line "once known as a"

	para "#MANIAC."
	line "BILL must have"

	para "taken after his"
	line "father."
	done
; 0x54f9e

UnknownText_0x54f9e: ; 0x54f9e
	text "Are you a trainer?"

	para "I've got a useful"
	line "phone number for"
	cont "you."
	done
; 0x54fd9

UnknownText_0x54fd9: ; 0x54fd9
	text "<PLAYER> recorded"
	line "BILL's number."
	done
; 0x54ff3

UnknownText_0x54ff3: ; 0x54ff3
	text "My brother made"
	line "the PC #MON"
	cont "storage system."

	para "I was going to"
	line "give you BILL's"
	cont "number…"
	done
; 0x55046

UnknownText_0x55046: ; 0x55046
	text "You can't record"
	line "any more numbers."
	done
; 0x55069

UnknownText_0x55069: ; 0x55069
	text "My big brother"
	line "BILL made the PC"

	para "#MON storage"
	line "system."
	done
; 0x5509f

GoldenrodBillsHouse_MapEventHeader: ; 0x5509f
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 4, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY
	warp_def $7, $3, 4, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY

	; xy triggers
	db 0

	; signposts
	db 3
	signpost 1, 0, $0, BillsHouseBookshelf2
	signpost 1, 1, $0, BillsHouseBookshelf1
	signpost 1, 7, $0, BillsHouseRadio

	; people-events
	db 3
	person_event SPRITE_BILL, 7, 6, $9, $0, 255, 255, $0, 0, BillsHouseBill, $0712
	person_event SPRITE_POKEFAN_F, 7, 9, $6, $0, 255, 255, $0, 0, BillsMom, $ffff
	person_event SPRITE_TWIN, 8, 9, $2, $11, 255, 255, $a0, 0, BillsSister, $ffff
; 0x550e5
