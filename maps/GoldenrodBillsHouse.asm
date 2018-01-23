const_value set 2
	const GOLDENRODBILLSHOUSE_BILL
	const GOLDENRODBILLSHOUSE_POKEFAN_F
	const GOLDENRODBILLSHOUSE_TWIN

GoldenrodBillsHouse_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

BillsHouseBill:
	faceplayer
	opentext
	checkevent EVENT_GOT_EEVEE
	iftrue UnknownScript_0x54c1f
	writetext UnknownText_0x54c74
	yesorno
	iffalse UnknownScript_0x54c19
	writetext UnknownText_0x54d3f
	buttonsound
	waitsfx
	checkcode VAR_PARTYCOUNT
	if_equal PARTY_LENGTH, UnknownScript_0x54c13
	writetext UnknownText_0x54dae
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke EEVEE, 20
	setevent EVENT_GOT_EEVEE
	writetext UnknownText_0x54dc1
	waitbutton
	closetext
	end

UnknownScript_0x54c13:
	writetext UnknownText_0x54e02
	waitbutton
	closetext
	end

UnknownScript_0x54c19:
	writetext UnknownText_0x54e2d
	waitbutton
	closetext
	end

UnknownScript_0x54c1f:
	writetext UnknownText_0x54e42
	waitbutton
	closetext
	end

BillsMom:
	faceplayer
	opentext
	checkevent EVENT_MET_BILL
	iffalse UnknownScript_0x54c33
	writetext UnknownText_0x54ea8
	waitbutton
	closetext
	end

UnknownScript_0x54c33:
	writetext UnknownText_0x54f4e
	waitbutton
	closetext
	end

BillsSister:
	faceplayer
	opentext
	checkcellnum PHONE_BILL
	iftrue UnknownScript_0x54c58
	writetext UnknownText_0x54f9e
	askforphonenumber PHONE_BILL
	if_equal PHONE_CONTACTS_FULL, UnknownScript_0x54c64
	if_equal PHONE_CONTACT_REFUSED, UnknownScript_0x54c5e
	waitsfx
	addcellnum PHONE_BILL
	writetext UnknownText_0x54fd9
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	buttonsound
UnknownScript_0x54c58: ;0x54c58
	writetext UnknownText_0x55069
	waitbutton
	closetext
	end

UnknownScript_0x54c5e:
	writetext UnknownText_0x54ff3
	waitbutton
	closetext
	end

UnknownScript_0x54c64:
	writetext UnknownText_0x55046
	buttonsound
	jump UnknownScript_0x54c5e

BillsHouseBookshelf1:
	jumpstd picturebookshelf

BillsHouseBookshelf2:
	jumpstd magazinebookshelf

BillsHouseRadio:
	jumpstd radio2

UnknownText_0x54c74:
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

UnknownText_0x54d3f:
	text "BILL: I knew you'd"
	line "come through!"

	para "Way to go! You're"
	line "the real deal!"

	para "OK, I'm counting"
	line "on you."

	para "Take good care of"
	line "it!"
	done

UnknownText_0x54dae:
	text "<PLAYER> received"
	line "EEVEE!"
	done

UnknownText_0x54dc1:
	text "BILL: PROF.ELM"
	line "claims EEVEE may"

	para "evolve in new and"
	line "unknown ways."
	done

UnknownText_0x54e02:
	text "Whoa, wait. You"
	line "can't carry any"
	cont "more #MON."
	done

UnknownText_0x54e2d:
	text "Oh… Now what to"
	line "do?"
	done

UnknownText_0x54e42:
	text "BILL: My pop, he"
	line "won't work. All he"

	para "does is goof off"
	line "all day long."

	para "He's getting to be"
	line "a real headache…"
	done

UnknownText_0x54ea8:
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

UnknownText_0x54f4e:
	text "My husband was"
	line "once known as a"

	para "#MANIAC."
	line "BILL must have"

	para "taken after his"
	line "father."
	done

UnknownText_0x54f9e:
	text "Are you a trainer?"

	para "I've got a useful"
	line "phone number for"
	cont "you."
	done

UnknownText_0x54fd9:
	text "<PLAYER> recorded"
	line "BILL's number."
	done

UnknownText_0x54ff3:
	text "My brother made"
	line "the PC #MON"
	cont "storage system."

	para "I was going to"
	line "give you BILL's"
	cont "number…"
	done

UnknownText_0x55046:
	text "You can't record"
	line "any more numbers."
	done

UnknownText_0x55069:
	text "My big brother"
	line "BILL made the PC"

	para "#MON storage"
	line "system."
	done

GoldenrodBillsHouse_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def 2, 7, 4, GOLDENROD_CITY
	warp_def 3, 7, 4, GOLDENROD_CITY

.CoordEvents:
	db 0

.BGEvents:
	db 3
	bg_event 0, 1, BGEVENT_READ, BillsHouseBookshelf2
	bg_event 1, 1, BGEVENT_READ, BillsHouseBookshelf1
	bg_event 7, 1, BGEVENT_READ, BillsHouseRadio

.ObjectEvents:
	db 3
	object_event 2, 3, SPRITE_BILL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillsHouseBill, EVENT_MET_BILL
	object_event 5, 3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillsMom, -1
	object_event 5, 4, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BillsSister, -1
