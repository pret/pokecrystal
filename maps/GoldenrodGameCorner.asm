const_value set 2
	const GOLDENRODGAMECORNER_CLERK
	const GOLDENRODGAMECORNER_RECEPTIONIST1
	const GOLDENRODGAMECORNER_RECEPTIONIST2
	const GOLDENRODGAMECORNER_PHARMACIST1
	const GOLDENRODGAMECORNER_PHARMACIST2
	const GOLDENRODGAMECORNER_POKEFAN_M1
	const GOLDENRODGAMECORNER_COOLTRAINER_M
	const GOLDENRODGAMECORNER_POKEFAN_F
	const GOLDENRODGAMECORNER_COOLTRAINER_F
	const GOLDENRODGAMECORNER_GENTLEMAN
	const GOLDENRODGAMECORNER_POKEFAN_M2
	const GOLDENRODGAMECORNER_POKEFAN_M3

GoldenrodGameCorner_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_OBJECTS, .Callback

.Callback:
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .finish
	checkitem COIN_CASE
	iffalse .move_tutor_inside
	checkcode VAR_WEEKDAY
	if_equal WEDNESDAY, .move_tutor_outside
	if_equal SATURDAY, .move_tutor_outside
.move_tutor_inside
	appear GOLDENRODGAMECORNER_POKEFAN_M3
	return

.move_tutor_outside
	checkflag ENGINE_DAILY_MOVE_TUTOR
	iftrue .finish
	disappear GOLDENRODGAMECORNER_POKEFAN_M3
.finish
	return

GoldenrodGameCornerPokefanM3Script:
	faceplayer
	opentext
	writetext GoldenrodGameCornerPokefanM3Text
	waitbutton
	closetext
	spriteface GOLDENRODGAMECORNER_POKEFAN_M3, RIGHT
	end

GoldenrodGmeCornerCoinVendorScript:
	jumpstd gamecornercoinvendor

GoldenrodGmeCornerTMVendorScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerPrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse GoldenrodGameCornerPrizeVendor_NoCoinCaseScript
	writetext GoldenrodGameCornerPrizeVendorWhichPrizeText
GoldenrodGmeCornerTMVendor_LoopScript: ; 056c36
	special Special_DisplayCoinCaseBalance
	loadmenudata GoldenrodGameCornerTMVendorMenuData
	verticalmenu
	closewindow
	if_equal $1, .Thunder
	if_equal $2, .Blizzard
	if_equal $3, .FireBlast
	jump GoldenrodGameCornerPrizeVendor_CancelPurchaseScript

.Thunder:
	checkcoins 5500
	if_equal $2, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext TM_THUNDER, $0
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	giveitem TM_THUNDER
	iffalse GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 5500
	jump GoldenrodGmeCornerTMVendor_FinishScript

.Blizzard:
	checkcoins 5500
	if_equal $2, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext TM_BLIZZARD, $0
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	giveitem TM_BLIZZARD
	iffalse GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 5500
	jump GoldenrodGmeCornerTMVendor_FinishScript

.FireBlast:
	checkcoins 5500
	if_equal $2, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext TM_FIRE_BLAST, $0
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	giveitem TM_FIRE_BLAST
	iffalse GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 5500
	jump GoldenrodGmeCornerTMVendor_FinishScript

GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript:
	writetext GoldenrodGameCornerPrizeVendorConfirmPrizeText
	yesorno
	end

GoldenrodGmeCornerTMVendor_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	waitbutton
	jump GoldenrodGmeCornerTMVendor_LoopScript

GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript:
	writetext GoldenrodGameCornerPrizeVendorNeedMoreCoinsText
	waitbutton
	closetext
	end

GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript:
	writetext GoldenrodGameCornerPrizeVendorNoMoreRoomText
	waitbutton
	closetext
	end

GoldenrodGameCornerPrizeVendor_CancelPurchaseScript:
	writetext GoldenrodGameCornerPrizeVendorQuitText
	waitbutton
	closetext
	end

GoldenrodGameCornerPrizeVendor_NoCoinCaseScript:
	writetext GoldenrodGameCornerPrizeVendorNoCoinCaseText
	waitbutton
	closetext
	end


GoldenrodGameCornerTMVendorMenuData:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 15 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 4 ; items
	db "TM25    5500@"
	db "TM14    5500@"
	db "TM38    5500@"
	db "CANCEL@"


GoldenrodGameCornerPrizeMonVendorScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerPrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse GoldenrodGameCornerPrizeVendor_NoCoinCaseScript
.loop
	writetext GoldenrodGameCornerPrizeVendorWhichPrizeText
	special Special_DisplayCoinCaseBalance
	loadmenudata .MenuDataHeader
	verticalmenu
	closewindow
	if_equal $1, .abra
	if_equal $2, .cubone
	if_equal $3, .wobbuffet
	jump GoldenrodGameCornerPrizeVendor_CancelPurchaseScript

.abra
	checkcoins 100
	if_equal $2, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	checkcode VAR_PARTYCOUNT
	if_equal $6, GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	pokenamemem ABRA, $0
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	waitbutton
	writebyte ABRA
	special Special_GameCornerPrizeMonCheckDex
	givepoke ABRA, 5
	takecoins 100
	jump .loop

.cubone
	checkcoins 800
	if_equal $2, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	checkcode VAR_PARTYCOUNT
	if_equal $6, GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	pokenamemem CUBONE, $0
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	waitbutton
	writebyte CUBONE
	special Special_GameCornerPrizeMonCheckDex
	givepoke CUBONE, 15
	takecoins 800
	jump .loop

.wobbuffet
	checkcoins 1500
	if_equal $2, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	checkcode VAR_PARTYCOUNT
	if_equal $6, GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	pokenamemem WOBBUFFET, $0
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	waitbutton
	writebyte WOBBUFFET
	special Special_GameCornerPrizeMonCheckDex
	givepoke WOBBUFFET, 15
	takecoins 1500
	jump .loop


.MenuDataHeader:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 17 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 4 ; items
	db "ABRA        100@"
	db "CUBONE      800@"
	db "WOBBUFFET  1500@"
	db "CANCEL@"


GoldenrodGameCornerPharmacistScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerPharmacistText
	waitbutton
	closetext
	spriteface LAST_TALKED, LEFT
	end

GoldenrodGameCornerPokefanM1Script:
	faceplayer
	opentext
	writetext GoldenrodGameCornerPokefanM1Text
	waitbutton
	closetext
	spriteface GOLDENRODGAMECORNER_POKEFAN_M1, RIGHT
	end

GoldenrodGameCornerCooltrainerMScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerCooltrainerMText
	waitbutton
	closetext
	spriteface GOLDENRODGAMECORNER_COOLTRAINER_M, LEFT
	end

GoldenrodGameCornerPokefanFScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerPokefanFText
	waitbutton
	closetext
	spriteface GOLDENRODGAMECORNER_POKEFAN_F, RIGHT
	end

GoldenrodGameCornerCooltrainerFScript:
	jumptextfaceplayer GoldenrodGameCornerCooltrainerFText

GoldenrodGameCornerGentlemanScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerGentlemanText
	waitbutton
	closetext
	spriteface GOLDENRODGAMECORNER_GENTLEMAN, RIGHT
	end

GoldenrodGameCornerPokefanM2Script:
	jumptextfaceplayer GoldenrodGameCornerPokefanM2Text

GoldenrodGameCornerLeftTheirDrinkScript:
	jumptext GoldenrodGameCornerLeftTheirDrinkText

GoldenrodGameCornerSlotsMachineScript:
	random 6
	if_equal 0, GoldenrodGameCornerLuckySlotsMachineScript
	refreshscreen $0
	writebyte FALSE
	special Special_SlotMachine
	closetext
	end

GoldenrodGameCornerLuckySlotsMachineScript:
	refreshscreen $0
	writebyte TRUE
	special Special_SlotMachine
	closetext
	end

GoldenrodGameCornerCardFlipMachineScript:
	refreshscreen $0
	special Special_CardFlip
	closetext
	end

GoldenrodGameCornerPrizeVendorIntroText:
	text "Welcome!"

	para "We exchange your"
	line "game coins for"
	cont "fabulous prizes!"
	done

GoldenrodGameCornerPrizeVendorWhichPrizeText:
	text "Which prize would"
	line "you like?"
	done

GoldenrodGameCornerPrizeVendorConfirmPrizeText:
	text_from_ram StringBuffer3
	text "."
	line "Is that right?"
	done

GoldenrodGameCornerPrizeVendorHereYouGoText:
	text "Here you go!"
	done

GoldenrodGameCornerPrizeVendorNeedMoreCoinsText:
	text "Sorry! You need"
	line "more coins."
	done

GoldenrodGameCornerPrizeVendorNoMoreRoomText:
	text "Sorry. You can't"
	line "carry any more."
	done

GoldenrodGameCornerPrizeVendorQuitText:
	text "OK. Please save"
	line "your coins and"
	cont "come again!"
	done

GoldenrodGameCornerPrizeVendorNoCoinCaseText:
	text "Oh? You don't have"
	line "a COIN CASE."
	done

GoldenrodGameCornerPharmacistText:
	text "I always play this"
	line "slot machine. It"

	para "pays out more than"
	line "others, I think."
	done

GoldenrodGameCornerPokefanM1Text:
	text "I just love this"
	line "new slot machine."

	para "It's more of a"
	line "challenge than the"
	cont "ones in CELADON."
	done

GoldenrodGameCornerCooltrainerMText:
	text "Life is a gamble."
	line "I'm going to flip"
	cont "cards till I drop!"
	done

GoldenrodGameCornerPokefanFText:
	text "Card flip…"

	para "I prefer it over"
	line "the slots because"

	para "it's easier to"
	line "figure the odds."

	para "But the payout is"
	line "much lower."
	done

GoldenrodGameCornerCooltrainerFText:
	text "I won't quit until"
	line "I win!"
	done

GoldenrodGameCornerGentlemanText:
	text "I taught BLIZZARD"
	line "to my #MON."

	para "It was hard to get"
	line "enough coins for"

	para "it, but it was"
	line "worth it."
	done

GoldenrodGameCornerPokefanM2Text:
	text "I couldn't win at"
	line "the slots, and I"

	para "blew it on card"
	line "flipping…"

	para "I got so furious,"
	line "I tossed out my"

	para "COIN CASE in the"
	line "UNDERGROUND."
	done

GoldenrodGameCornerPokefanM3Text:
	text "Wahahah! The coins"
	line "keep rolling in!"
	done

GoldenrodGameCornerLeftTheirDrinkText:
	text "Someone left their"
	line "drink."

	para "It smells sweet."
	done

GoldenrodGameCorner_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $d, $2, 10, GOLDENROD_CITY
	warp_def $d, $3, 10, GOLDENROD_CITY

.XYTriggers:
	db 0

.Signposts:
	db 31
	signpost 6, 6, SIGNPOST_READ, GoldenrodGameCornerSlotsMachineScript
	signpost 7, 6, SIGNPOST_READ, GoldenrodGameCornerSlotsMachineScript
	signpost 8, 6, SIGNPOST_READ, GoldenrodGameCornerSlotsMachineScript
	signpost 9, 6, SIGNPOST_READ, GoldenrodGameCornerSlotsMachineScript
	signpost 10, 6, SIGNPOST_READ, GoldenrodGameCornerSlotsMachineScript
	signpost 11, 6, SIGNPOST_RIGHT, GoldenrodGameCornerSlotsMachineScript
	signpost 6, 7, SIGNPOST_READ, GoldenrodGameCornerSlotsMachineScript
	signpost 7, 7, SIGNPOST_READ, GoldenrodGameCornerLuckySlotsMachineScript
	signpost 8, 7, SIGNPOST_READ, GoldenrodGameCornerSlotsMachineScript
	signpost 9, 7, SIGNPOST_READ, GoldenrodGameCornerSlotsMachineScript
	signpost 10, 7, SIGNPOST_READ, GoldenrodGameCornerSlotsMachineScript
	signpost 11, 7, SIGNPOST_LEFT, GoldenrodGameCornerSlotsMachineScript
	signpost 6, 12, SIGNPOST_READ, GoldenrodGameCornerSlotsMachineScript
	signpost 7, 12, SIGNPOST_READ, GoldenrodGameCornerSlotsMachineScript
	signpost 8, 12, SIGNPOST_READ, GoldenrodGameCornerSlotsMachineScript
	signpost 9, 12, SIGNPOST_READ, GoldenrodGameCornerSlotsMachineScript
	signpost 10, 12, SIGNPOST_READ, GoldenrodGameCornerSlotsMachineScript
	signpost 11, 12, SIGNPOST_RIGHT, GoldenrodGameCornerSlotsMachineScript
	signpost 6, 13, SIGNPOST_READ, GoldenrodGameCornerCardFlipMachineScript
	signpost 7, 13, SIGNPOST_READ, GoldenrodGameCornerCardFlipMachineScript
	signpost 8, 13, SIGNPOST_READ, GoldenrodGameCornerCardFlipMachineScript
	signpost 9, 13, SIGNPOST_READ, GoldenrodGameCornerCardFlipMachineScript
	signpost 10, 13, SIGNPOST_READ, GoldenrodGameCornerCardFlipMachineScript
	signpost 11, 13, SIGNPOST_LEFT, GoldenrodGameCornerCardFlipMachineScript
	signpost 6, 18, SIGNPOST_READ, GoldenrodGameCornerCardFlipMachineScript
	signpost 7, 18, SIGNPOST_READ, GoldenrodGameCornerCardFlipMachineScript
	signpost 8, 18, SIGNPOST_READ, GoldenrodGameCornerCardFlipMachineScript
	signpost 9, 18, SIGNPOST_READ, GoldenrodGameCornerCardFlipMachineScript
	signpost 10, 18, SIGNPOST_READ, GoldenrodGameCornerCardFlipMachineScript
	signpost 11, 18, SIGNPOST_RIGHT, GoldenrodGameCornerCardFlipMachineScript
	signpost 1, 12, SIGNPOST_LEFT, GoldenrodGameCornerLeftTheirDrinkScript

.PersonEvents:
	db 12
	person_event SPRITE_CLERK, 2, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GoldenrodGmeCornerCoinVendorScript, -1
	person_event SPRITE_RECEPTIONIST, 2, 16, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GoldenrodGmeCornerTMVendorScript, -1
	person_event SPRITE_RECEPTIONIST, 2, 18, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GoldenrodGameCornerPrizeMonVendorScript, -1
	person_event SPRITE_PHARMACIST, 7, 8, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, (1 << DAY), (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GoldenrodGameCornerPharmacistScript, -1
	person_event SPRITE_PHARMACIST, 7, 8, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, (1 << NITE), (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GoldenrodGameCornerPharmacistScript, -1
	person_event SPRITE_POKEFAN_M, 10, 11, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, GoldenrodGameCornerPokefanM1Script, -1
	person_event SPRITE_COOLTRAINER_M, 8, 14, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GoldenrodGameCornerCooltrainerMScript, -1
	person_event SPRITE_POKEFAN_F, 6, 17, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GoldenrodGameCornerPokefanFScript, -1
	person_event SPRITE_COOLTRAINER_F, 3, 10, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, GoldenrodGameCornerCooltrainerFScript, -1
	person_event SPRITE_GENTLEMAN, 10, 5, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GoldenrodGameCornerGentlemanScript, -1
	person_event SPRITE_POKEFAN_M, 9, 2, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, GoldenrodGameCornerPokefanM2Script, -1
	person_event SPRITE_POKEFAN_M, 10, 17, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GoldenrodGameCornerPokefanM3Script, EVENT_GOLDENROD_GAME_CORNER_MOVE_TUTOR
