const_value set 2
	const LAVRADIOTOWER1F_RECEPTIONIST
	const LAVRADIOTOWER1F_OFFICER
	const LAVRADIOTOWER1F_SUPER_NERD1
	const LAVRADIOTOWER1F_GENTLEMAN
	const LAVRADIOTOWER1F_SUPER_NERD2

LavRadioTower1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ReceptionistScript_0x7ee63:
	jumptextfaceplayer UnknownText_0x7eebf

OfficerScript_0x7ee66:
	jumptextfaceplayer UnknownText_0x7eefa

SuperNerdScript_0x7ee69:
	jumptextfaceplayer UnknownText_0x7ef90

GentlemanScript_0x7ee6c:
	faceplayer
	opentext
	checkflag ENGINE_EXPN_CARD
	iftrue .UnknownScript_0x7ee8e
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .UnknownScript_0x7ee80
	writetext UnknownText_0x7effb
	waitbutton
	closetext
	end

.UnknownScript_0x7ee80:
	writetext UnknownText_0x7f0a1
	buttonsound
	stringtotext .expncardname, $1
	scall .UnknownScript_0x7ee94
	setflag ENGINE_EXPN_CARD
.UnknownScript_0x7ee8e:
	writetext UnknownText_0x7f141
	waitbutton
	closetext
	end

.UnknownScript_0x7ee94:
	jumpstd receiveitem
	end

.expncardname
	db "EXPN CARD@"

SuperNerdScript_0x7eea2:
	faceplayer
	opentext
	checkflag ENGINE_EXPN_CARD
	iftrue UnknownScript_0x7eeb0
	writetext UnknownText_0x7f193
	waitbutton
	closetext
	end

UnknownScript_0x7eeb0:
	writetext UnknownText_0x7f248
	waitbutton
	closetext
	end

MapLavRadioTower1FSignpost0Script:
	jumptext UnknownText_0x7f2e3

MapLavRadioTower1FSignpost1Script:
	jumptext UnknownText_0x7f32d

UnknownScript_0x7eebc:
	jumptext UnknownText_0x7f36b

UnknownText_0x7eebf:
	text "Welcome!"
	line "Feel free to look"

	para "around anywhere on"
	line "this floor."
	done

UnknownText_0x7eefa:
	text "Sorry, but you can"
	line "only tour the"
	cont "ground floor."

	para "Ever since JOHTO's"
	line "RADIO TOWER was"

	para "taken over by a"
	line "criminal gang, we"

	para "have had to step"
	line "up our security."
	done

UnknownText_0x7ef90:
	text "Many people are"
	line "hard at work here"

	para "in the RADIO"
	line "TOWER."

	para "They must be doing"
	line "their best to put"
	cont "on good shows."
	done

UnknownText_0x7effb:
	text "Oh, no, no, no!"

	para "We've been off the"
	line "air ever since the"

	para "POWER PLANT shut"
	line "down."

	para "All my efforts to"
	line "start this station"

	para "would be wasted if"
	line "I can't broadcast."

	para "I'll be ruined!"
	done

UnknownText_0x7f0a1:
	text "Ah! So you're the"
	line "<PLAY_G> who solved"

	para "the POWER PLANT's"
	line "problem?"

	para "Thanks to you, I"
	line "never lost my job."

	para "I tell you, you're"
	line "a real lifesaver!"

	para "Please take this"
	line "as my thanks."
	done

UnknownText_0x7f141:
	text "With that thing,"
	line "you can tune into"

	para "the radio programs"
	line "here in KANTO."

	para "Gahahahaha!"
	done

UnknownText_0x7f193:
	text "Hey there!"

	para "I am the super"
	line "MUSIC DIRECTOR!"

	para "Huh? Your #GEAR"
	line "can't tune into my"

	para "music programs."
	line "How unfortunate!"

	para "If you get an EXPN"
	line "CARD upgrade, you"

	para "can tune in. You'd"
	line "better get one!"
	done

UnknownText_0x7f248:
	text "Hey there!"

	para "I am the super"
	line "MUSIC DIRECTOR!"

	para "I'm responsible"
	line "for the gorgeous"

	para "melodies that go"
	line "out over the air."

	para "Don't be square."
	line "Grab your music"
	cont "off the air!"
	done

UnknownText_0x7f2e3:
	text "1F RECEPTION"
	line "2F SALES"

	para "3F PERSONNEL"
	line "4F PRODUCTION"

	para "5F DIRECTOR'S"
	line "   OFFICE"
	done

UnknownText_0x7f32d:
	text "Perk Up #MON"
	line "with Mellow Sounds"

	para "of the # FLUTE"
	line "on CHANNEL 20"
	done

UnknownText_0x7f36b:
	text "Wow! A full rack"
	line "of #MON CDs and"
	cont "videos."

	para "This must be the"
	line "reference library."
	done

LavRadioTower1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 7, LAVENDER_TOWN
	warp_def $7, $3, 7, LAVENDER_TOWN

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 0, 11, SIGNPOST_READ, MapLavRadioTower1FSignpost0Script
	signpost 0, 5, SIGNPOST_READ, MapLavRadioTower1FSignpost1Script

.PersonEvents:
	db 5
	person_event SPRITE_RECEPTIONIST, 6, 6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ReceptionistScript_0x7ee63, -1
	person_event SPRITE_OFFICER, 1, 15, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, OfficerScript_0x7ee66, -1
	person_event SPRITE_SUPER_NERD, 3, 1, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SuperNerdScript_0x7ee69, -1
	person_event SPRITE_GENTLEMAN, 1, 9, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GentlemanScript_0x7ee6c, -1
	person_event SPRITE_SUPER_NERD, 6, 14, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SuperNerdScript_0x7eea2, -1
