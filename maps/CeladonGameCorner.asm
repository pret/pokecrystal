CeladonGameCorner_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

ClerkScript_0x7211d:
	jumpstd gamecornercoinvendor

ReceptionistScript_0x72120:
	jumptextfaceplayer UnknownText_0x721d0

PokefanMScript_0x72123:
	faceplayer
	loadfont
	writetext UnknownText_0x72215
	closetext
	loadmovesprites
	spriteface $4, LEFT
	end

TeacherScript_0x7212e:
	faceplayer
	loadfont
	writetext UnknownText_0x72242
	closetext
	loadmovesprites
	spriteface $5, RIGHT
	end

FishingGuruScript_0x72139:
	faceplayer
	loadfont
	writetext UnknownText_0x72295
	closetext
	loadmovesprites
	spriteface $6, RIGHT
	end

FisherScript_0x72144:
	faceplayer
	loadfont
	checkevent EVENT_GOT_COINS_FROM_GAMBLER_AT_CELADON
	iftrue .UnknownScript_0x72169
	writetext UnknownText_0x722dc
	keeptextopen
	checkitem COIN_CASE
	iffalse UnknownScript_0x7217b
	checkcoins 9998
	if_equal $0, UnknownScript_0x72184
	stringtotext .coinname, $1
	scall .UnknownScript_0x72172
	givecoins 18
	setevent EVENT_GOT_COINS_FROM_GAMBLER_AT_CELADON
.UnknownScript_0x72169
	writetext UnknownText_0x72345
	closetext
	loadmovesprites
	spriteface $fe, LEFT
	end

.UnknownScript_0x72172
	jumpstd receiveitem
	end

.coinname
	db "COIN@"

UnknownScript_0x7217b:
	writetext UnknownText_0x7238a
	closetext
	loadmovesprites
	spriteface $fe, LEFT
	end

UnknownScript_0x72184:
	writetext UnknownText_0x723d9
	closetext
	loadmovesprites
	spriteface $fe, LEFT
	end

CeladonGymGuyScript:
	jumptextfaceplayer CeladonGymGuyText

GrampsScript_0x72190:
	faceplayer
	loadfont
	writetext UnknownText_0x724ad
	closetext
	loadmovesprites
	spriteface $a, LEFT
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
	special Functionc373
	loadmovesprites
	end

MapCeladonGameCornerSignpost16Script:
	refreshscreen $0
	writebyte $1
	special Functionc373
	loadmovesprites
	end

MapCeladonGameCornerSignpost11Script:
	refreshscreen $0
	special Functionc380
	loadmovesprites
	end

MapCeladonGameCornerSignpost32Script:
	jumptext UnknownText_0x7254f

MapCeladonGameCornerSignpost9Script:
	loadfont
	writetext UnknownText_0x72567
	closetext
	special Functionc380
	loadmovesprites
	end

MovementData_0x721cd:
; Unreferenced.
	step_right
	turn_head_left
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

	; warps
	db 2
	warp_def $d, $e, 6, GROUP_CELADON_CITY, MAP_CELADON_CITY
	warp_def $d, $f, 6, GROUP_CELADON_CITY, MAP_CELADON_CITY

	; xy triggers
	db 0

	; signposts
	db 38
	signpost 6, 1, $0, MapCeladonGameCornerSignpost11Script
	signpost 7, 1, $0, MapCeladonGameCornerSignpost11Script
	signpost 8, 1, $0, MapCeladonGameCornerSignpost11Script
	signpost 9, 1, $0, MapCeladonGameCornerSignpost11Script
	signpost 10, 1, $0, MapCeladonGameCornerSignpost11Script
	signpost 11, 1, $4, MapCeladonGameCornerSignpost11Script
	signpost 6, 6, $0, MapCeladonGameCornerSignpost11Script
	signpost 7, 6, $0, MapCeladonGameCornerSignpost11Script
	signpost 8, 6, $0, MapCeladonGameCornerSignpost11Script
	signpost 9, 6, $0, MapCeladonGameCornerSignpost9Script
	signpost 10, 6, $0, MapCeladonGameCornerSignpost11Script
	signpost 11, 6, $3, MapCeladonGameCornerSignpost11Script
	signpost 6, 7, $0, MapCeladonGameCornerSignpost35Script
	signpost 7, 7, $0, MapCeladonGameCornerSignpost35Script
	signpost 8, 7, $0, MapCeladonGameCornerSignpost35Script
	signpost 9, 7, $0, MapCeladonGameCornerSignpost35Script
	signpost 10, 7, $0, MapCeladonGameCornerSignpost16Script
	signpost 11, 7, $4, MapCeladonGameCornerSignpost35Script
	signpost 6, 12, $0, MapCeladonGameCornerSignpost35Script
	signpost 7, 12, $0, MapCeladonGameCornerSignpost35Script
	signpost 8, 12, $0, MapCeladonGameCornerSignpost35Script
	signpost 9, 12, $0, MapCeladonGameCornerSignpost35Script
	signpost 10, 12, $0, MapCeladonGameCornerSignpost35Script
	signpost 11, 12, $3, MapCeladonGameCornerSignpost35Script
	signpost 6, 13, $0, MapCeladonGameCornerSignpost35Script
	signpost 7, 13, $0, MapCeladonGameCornerSignpost35Script
	signpost 8, 13, $0, MapCeladonGameCornerSignpost35Script
	signpost 9, 13, $0, MapCeladonGameCornerSignpost35Script
	signpost 10, 13, $0, MapCeladonGameCornerSignpost35Script
	signpost 11, 13, $4, MapCeladonGameCornerSignpost35Script
	signpost 6, 18, $0, MapCeladonGameCornerSignpost35Script
	signpost 7, 18, $0, MapCeladonGameCornerSignpost35Script
	signpost 8, 18, $0, MapCeladonGameCornerSignpost32Script
	signpost 9, 18, $0, MapCeladonGameCornerSignpost35Script
	signpost 10, 18, $0, MapCeladonGameCornerSignpost35Script
	signpost 11, 18, $3, MapCeladonGameCornerSignpost35Script
	signpost 0, 15, $0, MapCeladonGameCornerSignpost36Script
	signpost 0, 9, $0, MapCeladonGameCornerSignpost37Script

	; people-events
	db 9
	person_event SPRITE_CLERK, 6, 9, $6, $0, 255, 255, $a0, 0, ClerkScript_0x7211d, -1
	person_event SPRITE_RECEPTIONIST, 6, 7, $6, $0, 255, 255, $a0, 0, ReceptionistScript_0x72120, -1
	person_event SPRITE_POKEFAN_M, 14, 18, $8, $0, 255, 255, $80, 0, PokefanMScript_0x72123, -1
	person_event SPRITE_TEACHER, 11, 21, $9, $0, 255, 255, $90, 0, TeacherScript_0x7212e, -1
	person_event SPRITE_FISHING_GURU, 11, 15, $9, $0, 255, 255, $a0, 0, FishingGuruScript_0x72139, -1
	person_event SPRITE_FISHER, 14, 12, $8, $0, 255, 2, $80, 0, FisherScript_0x72144, -1
	person_event SPRITE_FISHER, 14, 12, $8, $0, 255, 4, $80, 0, FisherScript_0x72144, -1
	person_event SPRITE_GYM_GUY, 7, 15, $6, $0, 255, 255, $80, 0, CeladonGymGuyScript, -1
	person_event SPRITE_GRAMPS, 12, 6, $8, $0, 255, 255, $a0, 0, GrampsScript_0x72190, -1
