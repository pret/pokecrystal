const_value set 2
	const ECRUTEAKPOKECENTER1F_NURSE
	const ECRUTEAKPOKECENTER1F_POKEFAN_M
	const ECRUTEAKPOKECENTER1F_COOLTRAINER_F
	const ECRUTEAKPOKECENTER1F_GYM_GUY
	const ECRUTEAKPOKECENTER1F_BILL

EcruteakPokeCenter1F_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1

.MapCallbacks:
	db 0

.Trigger0:
	priorityjump .BillActivatesTimeCapsule
	end

.Trigger1:
	end

.BillActivatesTimeCapsule:
	pause 30
	playsound SFX_EXIT_BUILDING
	appear ECRUTEAKPOKECENTER1F_BILL
	waitsfx
	applymovement ECRUTEAKPOKECENTER1F_BILL, EcruteakPokeCenter1FBillMovement1
	applymovement PLAYER, EcruteakPokeCenter1FPlayerMovement1
	spriteface ECRUTEAKPOKECENTER1F_NURSE, UP
	pause 10
	spriteface ECRUTEAKPOKECENTER1F_NURSE, DOWN
	pause 30
	spriteface ECRUTEAKPOKECENTER1F_NURSE, UP
	pause 10
	spriteface ECRUTEAKPOKECENTER1F_NURSE, DOWN
	pause 20
	spriteface ECRUTEAKPOKECENTER1F_BILL, DOWN
	pause 10
	opentext
	writetext EcruteakPokeCenter1F_BillText1
	buttonsound
	jump .PointlessJump

.PointlessJump:
	writetext EcruteakPokeCenter1F_BillText2
	waitbutton
	closetext
	spriteface PLAYER, DOWN
	applymovement ECRUTEAKPOKECENTER1F_BILL, EcruteakPokeCenter1FBillMovement2
	playsound SFX_EXIT_BUILDING
	disappear ECRUTEAKPOKECENTER1F_BILL
	clearevent EVENT_MET_BILL
	setflag ENGINE_TIME_CAPSULE
	dotrigger $1
	waitsfx
	end

EcruteakPokeCenter1FNurseScript:
	jumpstd pokecenternurse

EcruteakPokeCenter1FPokefanMScript:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptextfaceplayer EcruteakPokeCenter1FPokefanMText

.mobile
	jumptextfaceplayer EcruteakPokeCenter1FPokefanMTextMobile

EcruteakPokeCenter1FCooltrainerFScript:
	jumptextfaceplayer EcruteakPokeCenter1FCooltrainerFText

EcruteakPokeCenter1FGymGuyScript:
	jumptextfaceplayer EcruteakPokeCenter1FGymGuyText

EcruteakPokeCenter1FBillMovement1:
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

EcruteakPokeCenter1FBillMovement2:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

EcruteakPokeCenter1FPlayerMovement1:
	step UP
	step UP
	step UP
	step_end

EcruteakPokeCenter1F_BillText1:
	text "Hi, I'm BILL. And"
	line "who are you?"

	para "Hmm, <PLAYER>, huh?"
	line "You've come at the"
	cont "right time."
	done

EcruteakPokeCenter1F_BillText2:
	text "I just finished"
	line "adjustments on my"
	cont "TIME CAPSULE."

	para "You know that"
	line "#MON can be"
	cont "traded, right?"

	para "My TIME CAPSULE"
	line "was developed to"

	para "enable trades with"
	line "the past."

	para "But you can't send"
	line "anything that"

	para "didn't exist in"
	line "the past."

	para "If you did, the PC"
	line "in the past would"
	cont "have a breakdown."

	para "So you have to"
	line "remove anything"

	para "that wasn't around"
	line "in the past."

	para "Put simply, no"
	line "sending new moves"

	para "or new #MON in"
	line "the TIME CAPSULE."

	para "Don't you worry."
	line "I'm done with the"
	cont "adjustments."

	para "Tomorrow, TIME"
	line "CAPSULES will be"

	para "running at all"
	line "#MON CENTERS."

	para "I have to hurry on"
	line "back to GOLDENROD"
	cont "and see my folks."

	para "Buh-bye!"
	done

EcruteakPokeCenter1FPokefanMText:
	text "The way the KIMONO"
	line "GIRLS dance is"

	para "marvelous. Just"
	line "like the way they"
	cont "use their #MON."
	done

EcruteakPokeCenter1FPokefanMTextMobile:
	text "You must be hoping"
	line "to battle more"

	para "people, right?"
	line "There's apparently"

	para "some place where"
	line "trainers gather."

	para "Where, you ask?"

	para "It's a little past"
	line "OLIVINE CITY."
	done

EcruteakPokeCenter1FCooltrainerFText:
	text "MORTY, the GYM"
	line "LEADER, is soooo"
	cont "cool."

	para "His #MON are"
	line "really tough too."
	done

EcruteakPokeCenter1FGymGuyText:
	text "LAKE OF RAGE…"

	para "The appearance of"
	line "a GYARADOS swarm…"

	para "I smell a conspir-"
	line "acy. I know it!"
	done

EcruteakPokeCenter1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $7, $3, 6, ECRUTEAK_CITY
	warp_def $7, $4, 6, ECRUTEAK_CITY
	warp_def $7, $0, 1, POKECENTER_2F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 5
	person_event SPRITE_NURSE, 1, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, EcruteakPokeCenter1FNurseScript, -1
	person_event SPRITE_POKEFAN_M, 6, 7, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, EcruteakPokeCenter1FPokefanMScript, -1
	person_event SPRITE_COOLTRAINER_F, 4, 1, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, EcruteakPokeCenter1FCooltrainerFScript, -1
	person_event SPRITE_GYM_GUY, 1, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, EcruteakPokeCenter1FGymGuyScript, -1
	person_event SPRITE_BILL, 7, 0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ECRUTEAK_POKE_CENTER_BILL
