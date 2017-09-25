const_value set 2
	const SAFFRONPOKECENTER1F_NURSE
	const SAFFRONPOKECENTER1F_TEACHER
	const SAFFRONPOKECENTER1F_FISHER
	const SAFFRONPOKECENTER1F_YOUNGSTER

SaffronPokeCenter1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

NurseScript_0x18a47d:
	jumpstd pokecenternurse

TeacherScript_0x18a480:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptextfaceplayer UnknownText_0x18a4a3

.mobile
	jumptextfaceplayer UnknownText_0x18a532

FisherScript_0x18a48c:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .SolvedKantoPowerCrisis
	writetext UnknownText_0x18a5d3
	waitbutton
	closetext
	end

.SolvedKantoPowerCrisis:
	writetext UnknownText_0x18a62e
	waitbutton
	closetext
	end

YoungsterScript_0x18a4a0:
	jumptextfaceplayer UnknownText_0x18a6c5

UnknownText_0x18a4a3:
	text "What are JOHTO's"
	line "#MON CENTERS"
	cont "like?"

	para "…Oh, I see. So"
	line "they're not much"

	para "different from the"
	line "ones in KANTO."

	para "I can go to JOHTO"
	line "without worrying,"
	cont "then!"
	done

UnknownText_0x18a532:
	text "What are JOHTO's"
	line "#MON CENTERS"
	cont "like?"

	para "…Oh, I see."
	line "So they let you"

	para "link with people"
	line "far away?"

	para "Then I'll get my"
	line "friend in JOHTO to"

	para "catch a MARILL and"
	line "trade it to me!"
	done

UnknownText_0x18a5d3:
	text "I just happened to"
	line "come through ROCK"

	para "TUNNEL. There was"
	line "some commotion at"
	cont "the POWER PLANT."
	done

UnknownText_0x18a62e:
	text "Caves collapse"
	line "easily."

	para "Several caves have"
	line "disappeared in the"

	para "past few years,"
	line "like the one out-"
	cont "side CERULEAN."

	para "As a pro HIKER,"
	line "that's common"
	cont "knowledge."
	done

UnknownText_0x18a6c5:
	text "SILPH CO.'s HEAD"
	line "OFFICE and the"

	para "MAGNET TRAIN STA-"
	line "TION--they're the"

	para "places to see in"
	line "SAFFRON."
	done

SaffronPokeCenter1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $7, $3, 4, SAFFRON_CITY
	warp_def $7, $4, 4, SAFFRON_CITY
	warp_def $7, $0, 1, POKECENTER_2F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 4
	person_event SPRITE_NURSE, 1, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, NurseScript_0x18a47d, -1
	person_event SPRITE_TEACHER, 2, 7, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, TeacherScript_0x18a480, -1
	person_event SPRITE_FISHER, 6, 8, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, FisherScript_0x18a48c, -1
	person_event SPRITE_YOUNGSTER, 4, 1, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x18a4a0, -1
