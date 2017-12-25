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
	if_equal $0, .FullCoinCase
	stringtotext .coinname, $1
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
	random $6
	if_equal $0, CeladonGameCornerSlotMachineScript
	refreshscreen $0
	writebyte $0
	special Special_SlotMachine
	closetext
	end

CeladonGameCornerSlotMachineScript:
	refreshscreen $0
	writebyte $1
	special Special_SlotMachine
	closetext
	end

CeladonGameCornerCardFlipScript:
	refreshscreen $0
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
; Unreferenced.
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

CeladonGameCorner_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $d, $e, 6, CELADON_CITY
	warp_def $d, $f, 6, CELADON_CITY

.CoordEvents:
	db 0

.BGEvents:
	db 38
	bg_event 6, 1, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event 7, 1, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event 8, 1, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event 9, 1, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event 10, 1, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event 11, 1, BGEVENT_LEFT, CeladonGameCornerCardFlipScript
	bg_event 6, 6, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event 7, 6, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event 8, 6, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event 9, 6, BGEVENT_READ, MapCeladonGameCornerSignpost9Script
	bg_event 10, 6, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event 11, 6, BGEVENT_RIGHT, CeladonGameCornerCardFlipScript
	bg_event 6, 7, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 7, 7, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 8, 7, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 9, 7, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 10, 7, BGEVENT_READ, CeladonGameCornerSlotMachineScript
	bg_event 11, 7, BGEVENT_LEFT, CeladonGameCornerLuckySlotMachineScript
	bg_event 6, 12, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 7, 12, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 8, 12, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 9, 12, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 10, 12, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 11, 12, BGEVENT_RIGHT, CeladonGameCornerLuckySlotMachineScript
	bg_event 6, 13, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 7, 13, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 8, 13, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 9, 13, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 10, 13, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 11, 13, BGEVENT_LEFT, CeladonGameCornerLuckySlotMachineScript
	bg_event 6, 18, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 7, 18, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 8, 18, BGEVENT_READ, CeladonGameCornerLighterScript
	bg_event 9, 18, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 10, 18, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 11, 18, BGEVENT_RIGHT, CeladonGameCornerLuckySlotMachineScript
	bg_event 0, 15, BGEVENT_READ, CeladonGameCornerPoster1Script
	bg_event 0, 9, BGEVENT_READ, CeladonGameCornerPoster2Script

.ObjectEvents:
	db 9
	object_event SPRITE_CLERK, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerClerkScript, -1
	object_event SPRITE_RECEPTIONIST, 2, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerReceptionistScript, -1
	object_event SPRITE_POKEFAN_M, 10, 14, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerPokefanMScript, -1
	object_event SPRITE_TEACHER, 7, 17, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerTeacherScript, -1
	object_event SPRITE_FISHING_GURU, 7, 11, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerFishingGuruScript, -1
	object_event SPRITE_FISHER, 10, 8, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerFisherScript, -1
	object_event SPRITE_FISHER, 10, 8, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, NITE, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerFisherScript, -1
	object_event SPRITE_GYM_GUY, 3, 11, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonGymGuyScript, -1
	object_event SPRITE_GRAMPS, 8, 2, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerGrampsScript, -1
