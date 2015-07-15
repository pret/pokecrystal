PokeCenter2F_MapScriptHeader:
	; trigger count
	db 6

	; triggers
	dw UnknownScript_0x19285f, $0000
	dw UnknownScript_0x192873, $0000
	dw UnknownScript_0x192877, $0000
	dw UnknownScript_0x19287b, $0000
	dw UnknownScript_0x19287f, $0000
	dw UnknownScript_0x192883, $0000

	; callback count
	db 0

UnknownScript_0x19285f:
	special Functionc2f6
	if_equal $0, UnknownScript_0x192872
	clearevent EVENT_711
	checkevent EVENT_001
	iftrue UnknownScript_0x192872
	priorityjump UnknownScript_0x192887

UnknownScript_0x192872:
	end

UnknownScript_0x192873:
	priorityjump UnknownScript_0x192ab6
	end

UnknownScript_0x192877:
	priorityjump UnknownScript_0x192add
	end

UnknownScript_0x19287b:
	priorityjump UnknownScript_0x192c4e
	end

UnknownScript_0x19287f:
	priorityjump UnknownScript_0x192ac3
	end

UnknownScript_0x192883:
	priorityjump UnknownScript_0x192aea
	end

UnknownScript_0x192887:
	appear $5
	setevent EVENT_001
	end

UnknownScript_0x19288d:
	faceplayer
	loadfont
	writetext UnknownText_0x19312f
	closetext
	loadmovesprites
	end

UnknownScript_0x192895:
	faceplayer
	loadfont
	writetext UnknownText_0x19315f
	closetext
	loadmovesprites
	end

LinkReceptionistScript_0x19289d:
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iffalse UnknownScript_0x19288d
	loadfont
	writetext UnknownText_0x192e3a
	yesorno
	iffalse UnknownScript_0x19291d
	special Function10630f
	iffalse UnknownScript_0x1928be
	writetext UnknownText_0x192d7e
	special Function103612
	iffalse UnknownScript_0x19291d
	if_equal $1, UnknownScript_0x19291f
UnknownScript_0x1928be:
	special Function29ce8
	writetext UnknownText_0x192f67
	special Function29d11
	iffalse UnknownScript_0x1928f6
	writetext UnknownText_0x192f34
	yesorno
	iffalse UnknownScript_0x192917
	special Function29e66
	iffalse UnknownScript_0x192917
	writetext UnknownText_0x192f67
	special Function29d92
	iffalse UnknownScript_0x192911
	copybytetovar wcf51
	iffalse UnknownScript_0x1928fe
	special Function29e82
	iffalse UnknownScript_0x192909
	writetext UnknownText_0x19306b
	closetext
	loadmovesprites
	scall UnknownScript_0x192b04
	warpcheck
	end

UnknownScript_0x1928f6:
	special Function29c92
	writetext UnknownText_0x192f19
	loadmovesprites
	end

UnknownScript_0x1928fe:
	special Function29efa
	writetext UnknownText_0x193029
	special Function29eee
	loadmovesprites
	end

UnknownScript_0x192909:
	writetext UnknownText_0x19304a
	special Function29eee
	loadmovesprites
	end

UnknownScript_0x192911:
	writetext UnknownText_0x192f75
	jump UnknownScript_0x19291a

UnknownScript_0x192917:
	writetext UnknownText_0x192fd1
UnknownScript_0x19291a:
	special Function29c92
UnknownScript_0x19291d:
	loadmovesprites
	end

UnknownScript_0x19291f:
	scall UnknownScript_0x19292b
	iftrue UnknownScript_0x19292a
	scall UnknownScript_0x19294a
	warpcheck
	end

UnknownScript_0x19292a:
	end

UnknownScript_0x19292b:
	writetext UnknownText_0x192f34
	yesorno
	iffalse UnknownScript_0x192943
	special Function29e66
	iffalse UnknownScript_0x192943
	special Function1011f1
	writetext UnknownText_0x19306b
	closetext
	loadmovesprites
	writebyte $0
	end

UnknownScript_0x192943:
	writetext UnknownText_0x192fd1
	loadmovesprites
	writebyte $1
	end

UnknownScript_0x19294a:
	applymovement2 MovementData_0x192cce
	applymovement $0, MovementData_0x192ce7
	end

LinkReceptionistScript_0x192952:
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iffalse UnknownScript_0x192895
	loadfont
	writetext UnknownText_0x192de0
	yesorno
	iffalse UnknownScript_0x1929d2
	special Function10630f
	iffalse UnknownScript_0x192973
	writetext UnknownText_0x192d39
	special Function103612
	iffalse UnknownScript_0x1929d2
	if_equal $1, UnknownScript_0x1929d4
UnknownScript_0x192973:
	special Function29cf1
	writetext UnknownText_0x192f67
	special Function29d11
	iffalse UnknownScript_0x1929ab
	writetext UnknownText_0x192f34
	yesorno
	iffalse UnknownScript_0x1929cc
	special Function29e66
	iffalse UnknownScript_0x1929cc
	writetext UnknownText_0x192f67
	special Function29d92
	iffalse UnknownScript_0x1929c6
	copybytetovar wcf51
	iffalse UnknownScript_0x1929b3
	special Function29e82
	iffalse UnknownScript_0x1929be
	writetext UnknownText_0x19306b
	closetext
	loadmovesprites
	scall UnknownScript_0x192b04
	warpcheck
	end

UnknownScript_0x1929ab:
	special Function29c92
	writetext UnknownText_0x192f19
	loadmovesprites
	end

UnknownScript_0x1929b3:
	special Function29efa
	writetext UnknownText_0x193029
	special Function29eee
	loadmovesprites
	end

UnknownScript_0x1929be:
	writetext UnknownText_0x19304a
	special Function29eee
	loadmovesprites
	end

UnknownScript_0x1929c6:
	writetext UnknownText_0x192f75
	jump UnknownScript_0x1929cf

UnknownScript_0x1929cc:
	writetext UnknownText_0x192fd1
UnknownScript_0x1929cf:
	special Function29c92
UnknownScript_0x1929d2:
	loadmovesprites
	end

UnknownScript_0x1929d4:
	scall UnknownScript_0x192a05
	iffalse UnknownScript_0x1929e5
	scall UnknownScript_0x1929e6
	iftrue UnknownScript_0x1929e5
	scall UnknownScript_0x19294a
	warpcheck
	end

UnknownScript_0x1929e5:
	end

UnknownScript_0x1929e6:
	writetext UnknownText_0x192f34
	yesorno
	iffalse UnknownScript_0x1929fe
	special Function103780
	iffalse UnknownScript_0x1929fe
	special Function1011f1
	writetext UnknownText_0x19306b
	closetext
	loadmovesprites
	writebyte $0
	end

UnknownScript_0x1929fe:
	writetext UnknownText_0x192fd1
	loadmovesprites
	writebyte $1
	end

UnknownScript_0x192a05:
	special Function10366e
	iffalse UnknownScript_0x192a1e
	if_equal $1, UnknownScript_0x192a22
	if_equal $2, UnknownScript_0x192a22
	if_equal $3, UnknownScript_0x192a1a
	jump UnknownScript_0x192a1e

UnknownScript_0x192a1a:
	writetext UnknownText_0x1932bc
	closetext
UnknownScript_0x192a1e:
	loadmovesprites
	writebyte $0
	end

UnknownScript_0x192a22:
	writebyte $1
	end

UnknownScript_0x192a25:
	faceplayer
	loadfont
	writetext UnknownText_0x193100
	closetext
	loadmovesprites
	end

LinkReceptionistScript_0x192a2d:
	checkevent EVENT_MET_BILL
	iftrue UnknownScript_0x192a25
	checkflag ENGINE_TIME_CAPSULE
	iftrue UnknownScript_0x192a25
	special Function29cfa
	faceplayer
	loadfont
	writetext UnknownText_0x192e9f
	yesorno
	iffalse UnknownScript_0x192aa2
	special Function29bfb
	if_equal $1, UnknownScript_0x192aa7
	if_equal $2, UnknownScript_0x192aac
	if_equal $3, UnknownScript_0x192ab1
	writetext UnknownText_0x192f67
	special Function29d11
	iffalse UnknownScript_0x192a91
	writetext UnknownText_0x192f34
	yesorno
	iffalse UnknownScript_0x192a9f
	special Function29e66
	iffalse UnknownScript_0x192a9f
	writetext UnknownText_0x192f67
	special Function29d92
	iffalse UnknownScript_0x192a99
	copybytetovar wcf51
	iffalse UnknownScript_0x192a84
	special Function29e82
	writetext UnknownText_0x19304a
	special Function29eee
	loadmovesprites
	end

UnknownScript_0x192a84:
	special Function29c7b
	writetext UnknownText_0x19306b
	closetext
	loadmovesprites
	scall UnknownScript_0x192bc4
	warpcheck
	end

UnknownScript_0x192a91:
	special Function29c92
	writetext UnknownText_0x192f19
	loadmovesprites
	end

UnknownScript_0x192a99:
	writetext UnknownText_0x192f75
	jump UnknownScript_0x192aa2

UnknownScript_0x192a9f:
	writetext UnknownText_0x192fd1
UnknownScript_0x192aa2:
	special Function29c92
	loadmovesprites
	end

UnknownScript_0x192aa7:
	writetext UnknownText_0x19308b
	loadmovesprites
	end

UnknownScript_0x192aac:
	writetext UnknownText_0x1930a8
	loadmovesprites
	end

UnknownScript_0x192ab1:
	writetext UnknownText_0x1930cf
	loadmovesprites
	end

UnknownScript_0x192ab6:
	special Function29c92
	scall UnknownScript_0x192b50
	dotrigger $0
	domaptrigger GROUP_TRADE_CENTER, MAP_TRADE_CENTER, $0
	end

UnknownScript_0x192ac3:
	special Function101220
	scall UnknownScript_0x192ad0
	dotrigger $0
	domaptrigger GROUP_MOBILE_TRADE_ROOM_MOBILE, MAP_MOBILE_TRADE_ROOM_MOBILE, $0
	end

UnknownScript_0x192ad0:
	applymovement $2, MovementData_0x192d0b
	applymovement $0, MovementData_0x192d0f
	applymovement $2, MovementData_0x192d14
	end

UnknownScript_0x192add:
	special Function29c92
	scall UnknownScript_0x192b8a
	dotrigger $0
	domaptrigger GROUP_COLOSSEUM, MAP_COLOSSEUM, $0
	end

UnknownScript_0x192aea:
	special Function101220
	scall UnknownScript_0x192af7
	dotrigger $0
	domaptrigger GROUP_MOBILE_BATTLE_ROOM, MAP_MOBILE_BATTLE_ROOM, $0
	end

UnknownScript_0x192af7:
	applymovement $3, MovementData_0x192d0b
	applymovement $0, MovementData_0x192d0f
	applymovement $3, MovementData_0x192d14
	end

UnknownScript_0x192b04:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue UnknownScript_0x192b12
	applymovement2 MovementData_0x192cca
	applymovement $0, MovementData_0x192cde
	end

UnknownScript_0x192b12:
	applymovement2 MovementData_0x192cd8
	applymovement $0, MovementData_0x192ce2
	loadfont
	writetext UnknownText_0x193266
	closetext
	loadmovesprites
	applymovement2 MovementData_0x192cdc
	spriteface $0, LEFT
	loadfont
	writetext UnknownText_0x193278
	closetext
	loadmovesprites
	playsound SFX_TINGLE
	applymovement $0, MovementData_0x192d17
	writebyte $80
	special Functionc225
	applymovement $0, MovementData_0x192d1c
	setflag ENGINE_KRIS_IN_CABLE_CLUB
	special Functione4a
	loadfont
	writetext UnknownText_0x19329a
	closetext
	loadmovesprites
	showemote EMOTE_SHOCK, $0, 15
	applymovement $0, MovementData_0x192ce5
	end

UnknownScript_0x192b50:
	checkflag ENGINE_KRIS_IN_CABLE_CLUB
	iftrue UnknownScript_0x192b63
	applymovement $2, MovementData_0x192d04
	applymovement $0, MovementData_0x192cf5
	applymovement $2, MovementData_0x192cfe
	end

UnknownScript_0x192b63:
	applymovement $2, MovementData_0x192d04
	applymovement $0, MovementData_0x192d28
	clearflag ENGINE_KRIS_IN_CABLE_CLUB
	playsound SFX_TINGLE
	applymovement $0, MovementData_0x192d17
	writebyte $90
	special Functionc225
	applymovement $0, MovementData_0x192d1c
	special Functione4a
	applymovement $0, MovementData_0x192d2a
	applymovement $2, MovementData_0x192cfe
	end

UnknownScript_0x192b8a:
	checkflag ENGINE_KRIS_IN_CABLE_CLUB
	iftrue UnknownScript_0x192b9d
	applymovement $3, MovementData_0x192d04
	applymovement $0, MovementData_0x192cf5
	applymovement $3, MovementData_0x192cfe
	end

UnknownScript_0x192b9d:
	applymovement $3, MovementData_0x192d04
	applymovement $0, MovementData_0x192d28
	clearflag ENGINE_KRIS_IN_CABLE_CLUB
	playsound SFX_TINGLE
	applymovement $0, MovementData_0x192d17
	writebyte $90
	special Functionc225
	applymovement $0, MovementData_0x192d1c
	special Functione4a
	applymovement $0, MovementData_0x192d2a
	applymovement $3, MovementData_0x192cfe
	end

UnknownScript_0x192bc4:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue UnknownScript_0x192bec
	checkcode VAR_FACING
	if_equal $2, UnknownScript_0x192bdc
	if_equal $3, UnknownScript_0x192be4
	applymovement2 MovementData_0x192cd2
	applymovement $0, MovementData_0x192cec
	end

UnknownScript_0x192bdc:
	applymovement2 MovementData_0x192cd2
	applymovement $0, MovementData_0x192cef
	end

UnknownScript_0x192be4:
	applymovement2 MovementData_0x192cd5
	applymovement $0, MovementData_0x192cf2
	end

UnknownScript_0x192bec:
	checkcode VAR_FACING
	if_equal $3, UnknownScript_0x192c00
	if_equal $2, UnknownScript_0x192c0a
	applymovement2 MovementData_0x192d33
	applymovement $0, MovementData_0x192d2d
	jump UnknownScript_0x192c11

UnknownScript_0x192c00:
	applymovement2 MovementData_0x192d36
	applymovement $0, MovementData_0x192d2f
	jump UnknownScript_0x192c11

UnknownScript_0x192c0a:
	applymovement2 MovementData_0x192d33
	applymovement $0, MovementData_0x192d31
UnknownScript_0x192c11:
	loadfont
	writetext UnknownText_0x193266
	closetext
	loadmovesprites
	checkcode VAR_FACING
	if_not_equal $1, UnknownScript_0x192c20
	spriteface $0, LEFT
UnknownScript_0x192c20:
	loadfont
	writetext UnknownText_0x193278
	closetext
	loadmovesprites
	playsound SFX_TINGLE
	applymovement $0, MovementData_0x192d17
	writebyte $80
	special Functionc225
	applymovement $0, MovementData_0x192d22
	faceperson $0, $4
	setflag ENGINE_KRIS_IN_CABLE_CLUB
	special Functione4a
	loadfont
	writetext UnknownText_0x19329a
	closetext
	loadmovesprites
	showemote EMOTE_SHOCK, $0, 15
	applymovement $0, MovementData_0x192d2d
	end

UnknownScript_0x192c4e:
	special Function29c92
	checkflag ENGINE_KRIS_IN_CABLE_CLUB
	iftrue UnknownScript_0x192c66
	applymovement $4, MovementData_0x192d08
	applymovement $0, MovementData_0x192cf9
	applymovement $4, MovementData_0x192d01
	jump UnknownScript_0x192c8c

UnknownScript_0x192c66:
	applymovement $4, MovementData_0x192d08
	applymovement $0, MovementData_0x192cfc
	clearflag ENGINE_KRIS_IN_CABLE_CLUB
	playsound SFX_TINGLE
	applymovement $0, MovementData_0x192d17
	writebyte $90
	special Functionc225
	applymovement $0, MovementData_0x192d1c
	special Functione4a
	applymovement $0, MovementData_0x192cfc
	applymovement $4, MovementData_0x192d01
UnknownScript_0x192c8c:
	dotrigger $0
	domaptrigger GROUP_TIME_CAPSULE, MAP_TIME_CAPSULE, $0
	end

MapPokeCenter2FSignpost0Script:
	refreshscreen $0
	special Functionc2da
	loadmovesprites
	end

OfficerScript_0x192c9a:
	faceplayer
	loadfont
	checkevent EVENT_711
	iftrue UnknownScript_0x192cb8
	writetext UnknownText_0x193190
	yesorno
	iffalse UnknownScript_0x192cc4
	writetext UnknownText_0x1931c4
	keeptextopen
	waitbutton
	special Functionc309
	iffalse UnknownScript_0x192cbe
	itemnotify
	setevent EVENT_711
UnknownScript_0x192cb8:
	writetext UnknownText_0x1931d2
	closetext
	loadmovesprites
	end

UnknownScript_0x192cbe:
	writetext UnknownText_0x1931ef
	closetext
	loadmovesprites
	end

UnknownScript_0x192cc4:
	writetext UnknownText_0x19324d
	closetext
	loadmovesprites
	end

MovementData_0x192cca:
	slow_step_up
	slow_step_left
	turn_head_right
	step_end

MovementData_0x192cce:
	slow_step_up
	slow_step_left
	turn_head_down
	step_end

MovementData_0x192cd2:
	slow_step_left
	turn_head_down
	step_end

MovementData_0x192cd5:
	slow_step_right
	turn_head_down
	step_end

MovementData_0x192cd8:
	slow_step_up
	slow_step_left
	turn_head_right
	step_end

MovementData_0x192cdc:
	turn_head_right
	step_end

MovementData_0x192cde:
	step_up
	step_up
	step_up
	step_end

MovementData_0x192ce2:
	step_up
	step_up
	step_end

MovementData_0x192ce5:
	step_up
	step_end

MovementData_0x192ce7:
	step_up
	step_up
	step_right
	step_up
	step_end

MovementData_0x192cec:
	step_up
	step_up
	step_end

MovementData_0x192cef:
	step_left
	step_up
	step_end

MovementData_0x192cf2:
	step_right
	step_up
	step_end

MovementData_0x192cf5:
	step_down
	step_down
	step_down
	step_end

MovementData_0x192cf9:
	step_down
	step_down
	step_end

MovementData_0x192cfc:
	step_down
	step_end

MovementData_0x192cfe:
	slow_step_right
	slow_step_down
	step_end

MovementData_0x192d01:
	slow_step_right
	turn_head_down
	step_end

MovementData_0x192d04:
	slow_step_up
	slow_step_left
	turn_head_right
	step_end

MovementData_0x192d08:
	slow_step_left
	turn_head_right
	step_end

MovementData_0x192d0b:
	slow_step_up
	slow_step_left
	turn_head_right
	step_end

MovementData_0x192d0f:
	step_down
	step_left
	step_down
	step_down
	step_end

MovementData_0x192d14:
	slow_step_right
	slow_step_down
	step_end

MovementData_0x192d17:
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	step_end

MovementData_0x192d1c:
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_left
	step_end

MovementData_0x192d22:
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	step_end

MovementData_0x192d28:
	step_down
	step_end

MovementData_0x192d2a:
	step_down
	step_down
	step_end

MovementData_0x192d2d:
	step_up
	step_end

MovementData_0x192d2f:
	step_right
	step_end

MovementData_0x192d31:
	step_left
	step_end

MovementData_0x192d33:
	slow_step_left
	turn_head_right
	step_end

MovementData_0x192d36:
	slow_step_right
	turn_head_left
	step_end

UnknownText_0x192d39:
	text "Would you like to"
	line "battle over a GAME"

	para "LINK cable or by"
	line "mobile phone?"
	done

UnknownText_0x192d7e:
	text "Would you like to"
	line "trade over a GAME"

	para "LINK cable or by"
	line "mobile phone?"
	done

UnknownText_0x192dc2:
	text "This way to the"
	line "MOBILE ROOM."
	done

UnknownText_0x192de0:
	text "Welcome to CABLE"
	line "CLUB COLOSSEUM."

	para "You may battle a"
	line "friend here."

	para "Would you like to"
	line "battle?"
	done

UnknownText_0x192e3a:
	text "Welcome to CABLE"
	line "TRADE CENTER."

	para "You may trade your"
	line "#MON here with"
	cont "a friend."

	para "Would you like to"
	line "trade?"
	done

UnknownText_0x192e9f:
	text "Welcome to CABLE"
	line "CLUB TIME CAPSULE."

	para "You can travel to"
	line "the past and trade"
	cont "your #MON."

	para "Would you like to"
	line "trade across time?"
	done

UnknownText_0x192f19:
	text "Your friend is not"
	line "ready."
	prompt

UnknownText_0x192f34:
	text "Before opening the"
	line "link, you must"
	cont "save your game."
	done

UnknownText_0x192f67:
	text "Please wait."
	done

UnknownText_0x192f75:
	text "The link has been"
	line "closed because of"
	cont "inactivity."

	para "Please contact"
	line "your friend and"
	cont "come again."
	prompt

UnknownText_0x192fd1:
	text "Please come again."
	prompt

UnknownText_0x192fe5:
	text "Please come in."
	prompt

UnknownText_0x192ff6:
	text "We'll put you in"
	line "the link room for"
	cont "the time being."
	done

UnknownText_0x193029:
	text "You can't link to"
	line "the past here."
	prompt

UnknownText_0x19304a:
	text "Incompatible rooms"
	line "were chosen."
	prompt

UnknownText_0x19306b:
	text "Please come in."
	done

UnknownText_0x19307c:
	text "Please enter."
	prompt

UnknownText_0x19308b:
	text "Sorry--@"
	text_from_ram StringBuffer1
	text ""
	line "can't be taken."
	prompt

UnknownText_0x1930a8:
	text "You can't take the"
	line "@"
	text_from_ram StringBuffer1
	text " with a"
	cont "@"
	text_from_ram StringBuffer2
	text "."
	prompt

UnknownText_0x1930cf:
	text "You can't take the"
	line "@"
	text_from_ram StringBuffer1
	text " that"
	cont "has MAIL with you."
	prompt

UnknownText_0x193100:
	text "I'm sorry--the"
	line "TIME CAPSULE is"
	cont "being adjusted."
	done

UnknownText_0x19312f:
	text "I'm sorry--the"
	line "TRADE MACHINE is"
	cont "being adjusted."
	done

UnknownText_0x19315f:
	text "I'm sorry--the"
	line "BATTLE MACHINE is"
	cont "being adjusted."
	done

UnknownText_0x193190:
	text "Hello! You're"
	line "<PLAYER>, right?"

	para "I have some-"
	line "thing for you."
	done

UnknownText_0x1931c4:
	text "Here you go!"
	done

UnknownText_0x1931d2:
	text "We hope to serve"
	line "you again."
	done

UnknownText_0x1931ef:
	text "Oh, you have no"
	line "space for this."

	para "Stop in at any"
	line "#MON CENTER"

	para "across the country"
	line "to pick it up."
	done

UnknownText_0x19324d:
	text "No? That's very"
	line "strange…"
	done

UnknownText_0x193266:
	text "Oh, please wait."
	done

UnknownText_0x193278:
	text "We need to change"
	line "the look here…"
	done

UnknownText_0x19329a:
	text "How does this"
	line "style look to you?"
	done

UnknownText_0x1932bc:
	text "Excuse me!"

	para "For STADIUM rules,"
	line "please bring six"

	para "different #MON,"
	line "excluding EGGS."

	para "The six #MON"
	line "must be different."

	para "Also, they must"
	line "not be holding"
	cont "identical items."

	para "Please come back"
	line "when you're ready."
	done

PokeCenter2F_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 6
	warp_def $7, $0, 255, GROUP_POKECENTER_2F, MAP_POKECENTER_2F
	warp_def $0, $5, 1, GROUP_TRADE_CENTER, MAP_TRADE_CENTER
	warp_def $0, $9, 1, GROUP_COLOSSEUM, MAP_COLOSSEUM
	warp_def $2, $d, 1, GROUP_TIME_CAPSULE, MAP_TIME_CAPSULE
	warp_def $0, $6, 1, GROUP_MOBILE_TRADE_ROOM_MOBILE, MAP_MOBILE_TRADE_ROOM_MOBILE
	warp_def $0, $a, 1, GROUP_MOBILE_BATTLE_ROOM, MAP_MOBILE_BATTLE_ROOM

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 3, 7, $0, MapPokeCenter2FSignpost0Script

	; people-events
	db 4
	person_event SPRITE_LINK_RECEPTIONIST, 6, 9, $6, $0, 255, 255, $a0, 0, LinkReceptionistScript_0x19289d, -1
	person_event SPRITE_LINK_RECEPTIONIST, 6, 13, $6, $0, 255, 255, $a0, 0, LinkReceptionistScript_0x192952, -1
	person_event SPRITE_LINK_RECEPTIONIST, 7, 17, $6, $0, 255, 255, $a0, 0, LinkReceptionistScript_0x192a2d, -1
	person_event SPRITE_OFFICER, 5, 5, $6, $0, 255, 255, $0, 0, OfficerScript_0x192c9a, EVENT_711
