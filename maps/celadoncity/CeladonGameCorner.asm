const_value set 2
	const CELADONGAMECORNER_CLERK
	const CELADONGAMECORNER_RECEPTIONIST
	const CELADONGAMECORNER_POKEFAN_M
	const CELADONGAMECORNER_TEACHER
	const CELADONGAMECORNER_FISHING_GURU
	const CELADONGAMECORNER_FISHER1
	const CELADONGAMECORNER_FISHER2
	const CELADONGAMECORNER_GYM_GUY
	const CELADONGAMECORNER_GRAMPS

CeladonGameCorner_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ClerkScript_0x7211d:
	jumpstd gamecornercoinvendor

ReceptionistScript_0x72120:
	jumptextfaceplayer UnknownText_0x721d0

PokefanMScript_0x72123:
	faceplayer
	opentext
	writetext UnknownText_0x72215
	waitbutton
	closetext
	spriteface CELADONGAMECORNER_POKEFAN_M, LEFT
	end

TeacherScript_0x7212e:
	faceplayer
	opentext
	writetext UnknownText_0x72242
	waitbutton
	closetext
	spriteface CELADONGAMECORNER_TEACHER, RIGHT
	end

FishingGuruScript_0x72139:
	faceplayer
	opentext
	writetext UnknownText_0x72295
	waitbutton
	closetext
	spriteface CELADONGAMECORNER_FISHING_GURU, RIGHT
	end

FisherScript_0x72144:
	faceplayer
	opentext
	checkevent EVENT_GOT_COINS_FROM_GAMBLER_AT_CELADON
	iftrue .UnknownScript_0x72169
	writetext UnknownText_0x722dc
	buttonsound
	checkitem COIN_CASE
	iffalse UnknownScript_0x7217b
	checkcoins 9998
	if_equal $0, UnknownScript_0x72184
	stringtotext .coinname, $1
	scall .UnknownScript_0x72172
	givecoins 18
	setevent EVENT_GOT_COINS_FROM_GAMBLER_AT_CELADON
.UnknownScript_0x72169:
	writetext UnknownText_0x72345
	waitbutton
	closetext
	spriteface LAST_TALKED, LEFT
	end

.UnknownScript_0x72172:
	jumpstd receiveitem
	end

.coinname
	db "COIN@"

UnknownScript_0x7217b:
	writetext UnknownText_0x7238a
	waitbutton
	closetext
	spriteface LAST_TALKED, LEFT
	end

UnknownScript_0x72184:
	writetext UnknownText_0x723d9
	waitbutton
	closetext
	spriteface LAST_TALKED, LEFT
	end

CeladonGymGuyScript:
	jumptextfaceplayer CeladonGymGuyText

GrampsScript_0x72190:
	faceplayer
	opentext
	writetext UnknownText_0x724ad
	waitbutton
	closetext
	spriteface CELADONGAMECORNER_GRAMPS, LEFT
	end

MapCeladonGameCornerSignpost36Script:
	jumptext UnknownText_0x724f3

MapCeladonGameCornerSignpost37Script:
	jumptext UnknownText_0x72521

MapCeladonGameCornerSignpost35Script:
	random $6
	if_equal $0, MapCeladonGameCornerSignpost16Script
	refreshscreen $0
	writebyte $0
	special Special_SlotMachine
	closetext
	end

MapCeladonGameCornerSignpost16Script:
	refreshscreen $0
	writebyte $1
	special Special_SlotMachine
	closetext
	end

MapCeladonGameCornerSignpost11Script:
	refreshscreen $0
	special Special_CardFlip
	closetext
	end

MapCeladonGameCornerSignpost32Script:
	jumptext UnknownText_0x7254f

MapCeladonGameCornerSignpost9Script:
	opentext
	writetext UnknownText_0x72567
	waitbutton
	special Special_CardFlip
	closetext
	end

MovementData_0x721cd:
; Unreferenced.
	step RIGHT
	turn_head LEFT
	step_end

UnknownText_0x721d0:
	text "Welcome!"

	para "You may exchange"
	line "your coins for"

	para "fabulous prizes"
	line "next door."
	done

UnknownText_0x72215:
	text "The slot machines"
	line "are all state of"
	cont "the art."
	done

UnknownText_0x72242:
	text "It's this machine"
	line "I want."

	para "It cleaned me out"
	line "yesterday, so it"

	para "should pay out"
	line "today."
	done

UnknownText_0x72295:
	text "I think this slot"
	line "machine will pay"
	cont "out…"

	para "The odds vary"
	line "among machines."
	done

UnknownText_0x722dc:
	text "Gahahaha!"

	para "The coins just"
	line "keep popping out!"

	para "Hm? What, kid? You"
	line "want to play?"

	para "I'll share my luck"
	line "with you!"
	done

UnknownText_0x72345:
	text "Gahahaha!"

	para "It makes me feel"
	line "good to do nice"

	para "things for other"
	line "people!"
	done

UnknownText_0x7238a:
	text "Hey, you don't"
	line "have a COIN CASE."

	para "How am I supposed"
	line "to give you any"
	cont "coins, kid?"
	done

UnknownText_0x723d9:
	text "Hey, your COIN"
	line "CASE is full, kid."

	para "You must be riding"
	line "a winning streak"
	cont "too."
	done

CeladonGymGuyText:
	text "Hey! CHAMP in"
	line "making!"

	para "Are you playing"
	line "the slots too?"

	para "I'm trying to get"
	line "enough coins for a"
	cont "prize #MON."

	para "But I don't have"
	line "enough coins yet…"
	done

UnknownText_0x724ad:
	text "Hmmm… The odds are"
	line "surely better for"

	para "PIKACHU's line,"
	line "but… What to do?"
	done

UnknownText_0x724f3:
	text "Hey!"

	para "Underneath this"
	line "poster…"

	para "There's nothing!"
	done

UnknownText_0x72521:
	text "Hey!"

	para "Underneath this"
	line "poster…"

	para "There's nothing!"
	done

UnknownText_0x7254f:
	text "There's a lighter"
	line "here."
	done

UnknownText_0x72567:
	text "A can of soda…"

	para "Someone must be"
	line "coming back…"

	para "Huh? It's empty!"
	done

CeladonGameCorner_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $d, $e, 6, CELADON_CITY
	warp_def $d, $f, 6, CELADON_CITY

.XYTriggers:
	db 0

.Signposts:
	db 38
	signpost 6, 1, SIGNPOST_READ, MapCeladonGameCornerSignpost11Script
	signpost 7, 1, SIGNPOST_READ, MapCeladonGameCornerSignpost11Script
	signpost 8, 1, SIGNPOST_READ, MapCeladonGameCornerSignpost11Script
	signpost 9, 1, SIGNPOST_READ, MapCeladonGameCornerSignpost11Script
	signpost 10, 1, SIGNPOST_READ, MapCeladonGameCornerSignpost11Script
	signpost 11, 1, SIGNPOST_LEFT, MapCeladonGameCornerSignpost11Script
	signpost 6, 6, SIGNPOST_READ, MapCeladonGameCornerSignpost11Script
	signpost 7, 6, SIGNPOST_READ, MapCeladonGameCornerSignpost11Script
	signpost 8, 6, SIGNPOST_READ, MapCeladonGameCornerSignpost11Script
	signpost 9, 6, SIGNPOST_READ, MapCeladonGameCornerSignpost9Script
	signpost 10, 6, SIGNPOST_READ, MapCeladonGameCornerSignpost11Script
	signpost 11, 6, SIGNPOST_RIGHT, MapCeladonGameCornerSignpost11Script
	signpost 6, 7, SIGNPOST_READ, MapCeladonGameCornerSignpost35Script
	signpost 7, 7, SIGNPOST_READ, MapCeladonGameCornerSignpost35Script
	signpost 8, 7, SIGNPOST_READ, MapCeladonGameCornerSignpost35Script
	signpost 9, 7, SIGNPOST_READ, MapCeladonGameCornerSignpost35Script
	signpost 10, 7, SIGNPOST_READ, MapCeladonGameCornerSignpost16Script
	signpost 11, 7, SIGNPOST_LEFT, MapCeladonGameCornerSignpost35Script
	signpost 6, 12, SIGNPOST_READ, MapCeladonGameCornerSignpost35Script
	signpost 7, 12, SIGNPOST_READ, MapCeladonGameCornerSignpost35Script
	signpost 8, 12, SIGNPOST_READ, MapCeladonGameCornerSignpost35Script
	signpost 9, 12, SIGNPOST_READ, MapCeladonGameCornerSignpost35Script
	signpost 10, 12, SIGNPOST_READ, MapCeladonGameCornerSignpost35Script
	signpost 11, 12, SIGNPOST_RIGHT, MapCeladonGameCornerSignpost35Script
	signpost 6, 13, SIGNPOST_READ, MapCeladonGameCornerSignpost35Script
	signpost 7, 13, SIGNPOST_READ, MapCeladonGameCornerSignpost35Script
	signpost 8, 13, SIGNPOST_READ, MapCeladonGameCornerSignpost35Script
	signpost 9, 13, SIGNPOST_READ, MapCeladonGameCornerSignpost35Script
	signpost 10, 13, SIGNPOST_READ, MapCeladonGameCornerSignpost35Script
	signpost 11, 13, SIGNPOST_LEFT, MapCeladonGameCornerSignpost35Script
	signpost 6, 18, SIGNPOST_READ, MapCeladonGameCornerSignpost35Script
	signpost 7, 18, SIGNPOST_READ, MapCeladonGameCornerSignpost35Script
	signpost 8, 18, SIGNPOST_READ, MapCeladonGameCornerSignpost32Script
	signpost 9, 18, SIGNPOST_READ, MapCeladonGameCornerSignpost35Script
	signpost 10, 18, SIGNPOST_READ, MapCeladonGameCornerSignpost35Script
	signpost 11, 18, SIGNPOST_RIGHT, MapCeladonGameCornerSignpost35Script
	signpost 0, 15, SIGNPOST_READ, MapCeladonGameCornerSignpost36Script
	signpost 0, 9, SIGNPOST_READ, MapCeladonGameCornerSignpost37Script

.PersonEvents:
	db 9
	person_event SPRITE_CLERK, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ClerkScript_0x7211d, -1
	person_event SPRITE_RECEPTIONIST, 2, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ReceptionistScript_0x72120, -1
	person_event SPRITE_POKEFAN_M, 10, 14, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, PokefanMScript_0x72123, -1
	person_event SPRITE_TEACHER, 7, 17, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TeacherScript_0x7212e, -1
	person_event SPRITE_FISHING_GURU, 7, 11, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, FishingGuruScript_0x72139, -1
	person_event SPRITE_FISHER, 10, 8, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 2, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, FisherScript_0x72144, -1
	person_event SPRITE_FISHER, 10, 8, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 4, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, FisherScript_0x72144, -1
	person_event SPRITE_GYM_GUY, 3, 11, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, CeladonGymGuyScript, -1
	person_event SPRITE_GRAMPS, 8, 2, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, GrampsScript_0x72190, -1
