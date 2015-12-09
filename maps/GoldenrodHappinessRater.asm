const_value set 2
	const GOLDENRODHAPPINESSRATER_TEACHER
	const GOLDENRODHAPPINESSRATER_POKEFAN_M
	const GOLDENRODHAPPINESSRATER_TWIN

GoldenrodHappinessRater_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TeacherScript_0x54953:
	faceplayer
	opentext
	special GetFirstPokemonHappiness
	writetext UnknownText_0x549a3
	buttonsound
	if_greater_than $f9, UnknownScript_0x54973
	if_greater_than $c7, UnknownScript_0x54979
	if_greater_than $95, UnknownScript_0x5497f
	if_greater_than $63, UnknownScript_0x54985
	if_greater_than $31, UnknownScript_0x5498b
	jump UnknownScript_0x54991

UnknownScript_0x54973:
	writetext UnknownText_0x549fc
	waitbutton
	closetext
	end

UnknownScript_0x54979:
	writetext UnknownText_0x54a2c
	waitbutton
	closetext
	end

UnknownScript_0x5497f:
	writetext UnknownText_0x54a5a
	waitbutton
	closetext
	end

UnknownScript_0x54985:
	writetext UnknownText_0x54a8e
	waitbutton
	closetext
	end

UnknownScript_0x5498b:
	writetext UnknownText_0x54a9f
	waitbutton
	closetext
	end

UnknownScript_0x54991:
	writetext UnknownText_0x54ad1
	waitbutton
	closetext
	end

PokefanMScript_0x54997:
	jumptextfaceplayer UnknownText_0x54b04

TwinScript_0x5499a:
	jumptextfaceplayer UnknownText_0x54b67

HappinessRatersHouseBookshelf:
	jumpstd difficultbookshelf

HappinessRatersHouseRadio:
	jumpstd radio2

UnknownText_0x549a3:
	text "If you treat your"
	line "#MON nicely,"

	para "they will love you"
	line "in return."

	para "Oh? Let me see"
	line "your @"
	text_from_ram StringBuffer3
	text "…"
	done

UnknownText_0x549fc:
	text "It looks really"
	line "happy! It must"
	cont "love you a lot."
	done

UnknownText_0x54a2c:
	text "I get the feeling"
	line "that it really"
	cont "trusts you."
	done

UnknownText_0x54a5a:
	text "It's friendly to-"
	line "ward you. It looks"
	cont "sort of happy."
	done

UnknownText_0x54a8e:
	text "It's quite cute."
	done

UnknownText_0x54a9f:
	text "You should treat"
	line "it better. It's"
	cont "not used to you."
	done

UnknownText_0x54ad1:
	text "It doesn't seem to"
	line "like you at all."
	cont "It looks mean."
	done

UnknownText_0x54b04:
	text "I keep losing in"
	line "battles, and my"

	para "#MON end up"
	line "fainting…"

	para "Maybe that's why"
	line "my #MON don't"
	cont "like me much…"
	done

UnknownText_0x54b67:
	text "When I use an item"
	line "on my #MON, it"
	cont "acts really glad!"
	done

GoldenrodHappinessRater_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 3, GOLDENROD_CITY
	warp_def $7, $3, 3, GOLDENROD_CITY

.XYTriggers:
	db 0

.Signposts:
	db 3
	signpost 1, 0, SIGNPOST_READ, HappinessRatersHouseBookshelf
	signpost 1, 1, SIGNPOST_READ, HappinessRatersHouseBookshelf
	signpost 1, 7, SIGNPOST_READ, HappinessRatersHouseRadio

.PersonEvents:
	db 3
	person_event SPRITE_TEACHER, 4, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TeacherScript_0x54953, -1
	person_event SPRITE_POKEFAN_M, 3, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PokefanMScript_0x54997, -1
	person_event SPRITE_TWIN, 6, 5, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, TwinScript_0x5499a, -1
