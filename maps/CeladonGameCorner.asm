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

CeladonGameCorner_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

CeladonGameCornerClerkScript:
	jumpstd gamecornercoinvendor

CeladonGameCornerReceptionistScript:
	jumptextfaceplayer CeladonGameCornerReceptionistText

CeladonGameCornerPokefanMScript:
	faceplayer
	opentext
	writetext CeladonGameCornerPokefanMText
	waitbutton
	closetext
	spriteface CELADONGAMECORNER_POKEFAN_M, LEFT
	end

CeladonGameCornerTeacherScript:
	faceplayer
	opentext
	writetext CeladonGameCornerTeacherText
	waitbutton
	closetext
	spriteface CELADONGAMECORNER_TEACHER, RIGHT
	end

CeladonGameCornerFishingGuruScript:
	faceplayer
	opentext
	writetext CeladonGameCornerFishingGuruText
	waitbutton
	closetext
	spriteface CELADONGAMECORNER_FISHING_GURU, RIGHT
	end

CeladonGameCornerFisherScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_COINS_FROM_GAMBLER_AT_CELADON
	iftrue .GotCoins
	writetext CeladonGameCornerFisherText1
	buttonsound
	checkitem COIN_CASE
	iffalse .NoCoinCase
	checkcoins MAX_COINS - 1
	if_equal HAVE_MORE, .FullCoinCase
	stringtotext .coinname, MEM_BUFFER_1
	scall .GiveCoins
	givecoins 18
	setevent EVENT_GOT_COINS_FROM_GAMBLER_AT_CELADON
.GotCoins:
	writetext CeladonGameCornerFisherText2
	waitbutton
	closetext
	spriteface LAST_TALKED, LEFT
	end

.GiveCoins:
	jumpstd receiveitem
	end

.coinname
	db "COIN@"

.NoCoinCase:
	writetext CeladonGameCornerFisherNoCoinCaseText
	waitbutton
	closetext
	spriteface LAST_TALKED, LEFT
	end

.FullCoinCase:
	writetext CeladonGameCornerFisherFullCoinCaseText
	waitbutton
	closetext
	spriteface LAST_TALKED, LEFT
	end

CeladonGymGuyScript:
	jumptextfaceplayer CeladonGymGuyText

CeladonGameCornerGrampsScript:
	faceplayer
	opentext
	writetext CeladonGameCornerGrampsText
	waitbutton
	closetext
	spriteface CELADONGAMECORNER_GRAMPS, LEFT
	end

CeladonGameCornerPoster1Script:
	jumptext CeladonGameCornerPoster1Text

CeladonGameCornerPoster2Script:
	jumptext CeladonGameCornerPoster2Text

CeladonGameCornerLuckySlotMachineScript:
	random 6
	if_equal 0, CeladonGameCornerSlotMachineScript
	refreshscreen
	writebyte FALSE
	special Special_SlotMachine
	closetext
	end

CeladonGameCornerSlotMachineScript:
	refreshscreen
	writebyte TRUE
	special Special_SlotMachine
	closetext
	end

CeladonGameCornerCardFlipScript:
	refreshscreen
	special Special_CardFlip
	closetext
	end

CeladonGameCornerLighterScript:
	jumptext CeladonGameCornerLighterText

MapCeladonGameCornerSignpost9Script:
	opentext
	writetext UnknownText_0x72567
	waitbutton
	special Special_CardFlip
	closetext
	end

MovementData_0x721cd:
; unused
	step RIGHT
	turn_head LEFT
	step_end

CeladonGameCornerReceptionistText:
	text "Welcome!"

	para "You may exchange"
	line "your coins for"

	para "fabulous prizes"
	line "next door."
	done

CeladonGameCornerPokefanMText:
	text "The slot machines"
	line "are all state of"
	cont "the art."
	done

CeladonGameCornerTeacherText:
	text "It's this machine"
	line "I want."

	para "It cleaned me out"
	line "yesterday, so it"

	para "should pay out"
	line "today."
	done

CeladonGameCornerFishingGuruText:
	text "I think this slot"
	line "machine will pay"
	cont "out…"

	para "The odds vary"
	line "among machines."
	done

CeladonGameCornerFisherText1:
	text "Gahahaha!"

	para "The coins just"
	line "keep popping out!"

	para "Hm? What, kid? You"
	line "want to play?"

	para "I'll share my luck"
	line "with you!"
	done

CeladonGameCornerFisherText2:
	text "Gahahaha!"

	para "It makes me feel"
	line "good to do nice"

	para "things for other"
	line "people!"
	done

CeladonGameCornerFisherNoCoinCaseText:
	text "Hey, you don't"
	line "have a COIN CASE."

	para "How am I supposed"
	line "to give you any"
	cont "coins, kid?"
	done

CeladonGameCornerFisherFullCoinCaseText:
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

CeladonGameCornerGrampsText:
	text "Hmmm… The odds are"
	line "surely better for"

	para "PIKACHU's line,"
	line "but… What to do?"
	done

CeladonGameCornerPoster1Text:
	text "Hey!"

	para "Underneath this"
	line "poster…"

	para "There's nothing!"
	done

CeladonGameCornerPoster2Text:
	text "Hey!"

	para "Underneath this"
	line "poster…"

	para "There's nothing!"
	done

CeladonGameCornerLighterText:
	text "There's a lighter"
	line "here."
	done

UnknownText_0x72567:
	text "A can of soda…"

	para "Someone must be"
	line "coming back…"

	para "Huh? It's empty!"
	done

CeladonGameCorner_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def 14, 13, 6, CELADON_CITY
	warp_def 15, 13, 6, CELADON_CITY

.CoordEvents:
	db 0

.BGEvents:
	db 38
	bg_event 1, 6, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event 1, 7, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event 1, 8, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event 1, 9, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event 1, 10, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event 1, 11, BGEVENT_LEFT, CeladonGameCornerCardFlipScript
	bg_event 6, 6, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event 6, 7, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event 6, 8, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event 6, 9, BGEVENT_READ, MapCeladonGameCornerSignpost9Script
	bg_event 6, 10, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event 6, 11, BGEVENT_RIGHT, CeladonGameCornerCardFlipScript
	bg_event 7, 6, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 7, 7, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 7, 8, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 7, 9, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 7, 10, BGEVENT_READ, CeladonGameCornerSlotMachineScript
	bg_event 7, 11, BGEVENT_LEFT, CeladonGameCornerLuckySlotMachineScript
	bg_event 12, 6, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 12, 7, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 12, 8, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 12, 9, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 12, 10, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 12, 11, BGEVENT_RIGHT, CeladonGameCornerLuckySlotMachineScript
	bg_event 13, 6, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 13, 7, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 13, 8, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 13, 9, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 13, 10, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 13, 11, BGEVENT_LEFT, CeladonGameCornerLuckySlotMachineScript
	bg_event 18, 6, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 18, 7, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 18, 8, BGEVENT_READ, CeladonGameCornerLighterScript
	bg_event 18, 9, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 18, 10, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 18, 11, BGEVENT_RIGHT, CeladonGameCornerLuckySlotMachineScript
	bg_event 15, 0, BGEVENT_READ, CeladonGameCornerPoster1Script
	bg_event 9, 0, BGEVENT_READ, CeladonGameCornerPoster2Script

.ObjectEvents:
	db 9
	object_event 5, 2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerClerkScript, -1
	object_event 3, 2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerReceptionistScript, -1
	object_event 14, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerPokefanMScript, -1
	object_event 17, 7, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerTeacherScript, -1
	object_event 11, 7, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerFishingGuruScript, -1
	object_event 8, 10, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerFisherScript, -1
	object_event 8, 10, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, NITE, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerFisherScript, -1
	object_event 11, 3, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonGymGuyScript, -1
	object_event 2, 8, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerGrampsScript, -1
