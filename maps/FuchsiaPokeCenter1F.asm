const_value set 2
	const FUCHSIAPOKECENTER1F_NURSE
	const FUCHSIAPOKECENTER1F_COOLTRAINER_M
	const FUCHSIAPOKECENTER1F_COOLTRAINER_F
	const FUCHSIAPOKECENTER1F_JANINE_IMPERSONATOR

FuchsiaPokeCenter1F_MapScriptHeader:
.MapTriggers:
	db 1

	; triggers
	dw UnknownScript_0x196458, 0

.MapCallbacks:
	db 0

UnknownScript_0x196458:
	end

NurseScript_0x196459:
	jumpstd pokecenternurse

CooltrainerMScript_0x19645c:
	jumptextfaceplayer UnknownText_0x196494

CooltrainerFScript_0x19645f:
	jumptextfaceplayer UnknownText_0x1964dc

JanineImpersonatorScript_0x196462:
	faceplayer
	opentext
	writetext UnknownText_0x19652e
	waitbutton
	closetext
	applymovement FUCHSIAPOKECENTER1F_JANINE_IMPERSONATOR, MovementData_0x196486
	faceplayer
	variablesprite SPRITE_JANINE_IMPERSONATOR, SPRITE_JANINE
	special MapCallbackSprites_LoadUsedSpritesGFX
	opentext
	writetext UnknownText_0x19654e
	waitbutton
	closetext
	applymovement FUCHSIAPOKECENTER1F_JANINE_IMPERSONATOR, MovementData_0x196486
	faceplayer
	variablesprite SPRITE_JANINE_IMPERSONATOR, SPRITE_LASS
	special MapCallbackSprites_LoadUsedSpritesGFX
	end

MovementData_0x196486:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end

UnknownText_0x196494:
	text "Hey! You have a"
	line "brand new kind of"
	cont "#DEX."

	para "Did PROF.OAK give"
	line "that to you?"
	done

UnknownText_0x1964dc:
	text "I got quite a"
	line "shock at the GYM."

	para "There were all"
	line "these girls who"
	cont "looked identical."
	done

UnknownText_0x19652e:
	text "I'm JANINE! Hocus-"
	line "pocus… Poof!"
	done

UnknownText_0x19654e:
	text "See? I look just"
	line "like her now!"
	done

FuchsiaPokeCenter1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $7, $3, 5, FUCHSIA_CITY
	warp_def $7, $4, 5, FUCHSIA_CITY
	warp_def $7, $0, 1, POKECENTER_2F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 4
	person_event SPRITE_NURSE, 1, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, NurseScript_0x196459, -1
	person_event SPRITE_COOLTRAINER_M, 4, 8, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CooltrainerMScript_0x19645c, -1
	person_event SPRITE_COOLTRAINER_F, 4, 1, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CooltrainerFScript_0x19645f, -1
	person_event SPRITE_JANINE_IMPERSONATOR, 3, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, JanineImpersonatorScript_0x196462, -1
