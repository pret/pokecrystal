GoldenrodDeptStore5F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks

	dbw 2, .CheckIfSunday

.CheckIfSunday:
	checkcode VAR_WEEKDAY
	if_equal SUNDAY, .yes
	disappear $7
	return

.yes:
	appear $7
	return

ClerkScript_0x5609c:
	faceplayer
	loadfont
	checkevent EVENT_GOT_TM02_HEADBUTT
	iftrue .headbutt
	checkevent EVENT_GOT_TM08_ROCK_SMASH
	iftrue .onlyrocksmash
	jump .neither

.headbutt:
	checkevent EVENT_GOT_TM08_ROCK_SMASH
	iftrue .both
	jump .onlyheadbutt

.neither:
	pokemart $0, $0009
	loadmovesprites
	end

.onlyheadbutt:
	pokemart $0, $000a
	loadmovesprites
	end

.onlyrocksmash:
	pokemart $0, $000b
	loadmovesprites
	end

.both:
	pokemart $0, $000c
	loadmovesprites
	end

ReceptionistScript_0x560ce:
	faceplayer
	loadfont
	checkcode VAR_WEEKDAY
	if_not_equal SUNDAY, .EventIsOver
	checkflag ENGINE_GOLDENROD_MALL_5F_HAPPINESS_EVENT
	iftrue .EventIsOver
	special GetFirstPokemonHappiness
	writetext UnknownText_0x56143
	keeptextopen
	if_greater_than $95, .VeryHappy
	if_greater_than $31, .SomewhatHappy
	jump .NotVeryHappy

.VeryHappy:
	writetext UnknownText_0x5615a
	keeptextopen
	verbosegiveitem TM_RETURN, 1
	iffalse .Done
	setflag ENGINE_GOLDENROD_MALL_5F_HAPPINESS_EVENT
	loadmovesprites
	end

.SomewhatHappy:
	writetext UnknownText_0x561a6
	closetext
	loadmovesprites
	end

.NotVeryHappy:
	writetext UnknownText_0x561d8
	keeptextopen
	verbosegiveitem TM_FRUSTRATION, 1
	iffalse .Done
	setflag ENGINE_GOLDENROD_MALL_5F_HAPPINESS_EVENT
	loadmovesprites
	end

.EventIsOver:
	writetext UnknownText_0x56202
	closetext
.Done:
	loadmovesprites
	end

TwinScript_0x56118:
	faceplayer
	loadfont
	special SpecialGameboyCheck
	if_not_equal $2, .NotGBC ; This is a dummy check from Gold and Silver.  In normal gameplay, this would not be checked.
	writetext UnknownText_0x56241
	closetext
	loadmovesprites
	special Special_UnlockMysteryGift
	end

.NotGBC:
	writetext UnknownText_0x56279
	closetext
	loadmovesprites
	end

LassScript_0x56130:
	jumptextfaceplayer UnknownText_0x562ad

CooltrainerMScript_0x56133:
	faceplayer
	loadfont
	trade $0
	closetext
	loadmovesprites
	end

PokefanMScript_0x5613a:
	jumptextfaceplayer UnknownText_0x562f3

GoldenrodDeptStore5FDirectory:
	jumptext GoldenrodDeptStore5FDirectoryText

GoldenrodDeptStore5FElevatorButton:
	jumpstd elevatorbutton

UnknownText_0x56143:
	text "Hello. Oh, your"
	line "#MON…"
	done

UnknownText_0x5615a:
	text "It's very attached"
	line "to you."

	para "This move should"
	line "be perfect for a"
	cont "pair like you."
	done

UnknownText_0x561a6:
	text "It's adorable!"

	para "You should teach"
	line "it good TM moves."
	done

UnknownText_0x561d8:
	text "It looks evil. How"
	line "about this TM for"
	cont "it?"
	done

UnknownText_0x56202:
	text "There are sure to"
	line "be TMs that are"

	para "just perfect for"
	line "your #MON."
	done

UnknownText_0x56241:
	text "MYSTERY GIFT."

	para "With just a"
	line "little beep, you"
	cont "get a gift."
	done

UnknownText_0x56279:
	text "The MYSTERY GIFT"
	line "option requires a"
	cont "Game Boy Color."
	done

UnknownText_0x562ad:
	text "On Sundays, a lady"
	line "comes to check out"
	cont "#MON."

	para "She even gives"
	line "away TMs!"
	done

UnknownText_0x562f3:
	text "You can't rename a"
	line "#MON you get in"
	cont "a trade."

	para "The name is a re-"
	line "flection of the"

	para "original trainer's"
	line "feelings for it."
	done

GoldenrodDeptStore5FDirectoryText:
	text "Customize Your"
	line "#MON"

	para "5F TM CORNER"
	done

GoldenrodDeptStore5F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $0, $c, 1, GROUP_GOLDENROD_DEPT_STORE_4F, MAP_GOLDENROD_DEPT_STORE_4F
	warp_def $0, $f, 1, GROUP_GOLDENROD_DEPT_STORE_6F, MAP_GOLDENROD_DEPT_STORE_6F
	warp_def $0, $2, 1, GROUP_GOLDENROD_DEPT_STORE_ELEVATOR, MAP_GOLDENROD_DEPT_STORE_ELEVATOR

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 0, 14, SIGNPOST_READ, GoldenrodDeptStore5FDirectory
	signpost 0, 3, SIGNPOST_READ, GoldenrodDeptStore5FElevatorButton

.PersonEvents:
	db 6
	person_event SPRITE_CLERK, 9, 12, OW_UP | $3, $0, -1, -1, $0, 0, ClerkScript_0x5609c, -1
	person_event SPRITE_LASS, 10, 7, OW_DOWN | $2, $11, -1, -1, $0, 0, LassScript_0x56130, -1
	person_event SPRITE_COOLTRAINER_M, 7, 10, OW_DOWN | $3, $0, -1, -1, $0, 0, CooltrainerMScript_0x56133, -1
	person_event SPRITE_POKEFAN_M, 9, 17, OW_DOWN | $2, $22, -1, -1, $0, 0, PokefanMScript_0x5613a, -1
	person_event SPRITE_TWIN, 5, 13, OW_UP | $2, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, TwinScript_0x56118, -1
	person_event SPRITE_RECEPTIONIST, 9, 11, OW_UP | $3, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, ReceptionistScript_0x560ce, EVENT_GOLDENROD_DEPT_STORE_5F_HAPPINESS_EVENT_LADY
