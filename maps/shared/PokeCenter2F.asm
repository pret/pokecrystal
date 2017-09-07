const_value set 2
	const POKECENTER2F_TRADE_RECEPTIONIST
	const POKECENTER2F_BATTLE_RECEPTIONIST
	const POKECENTER2F_TIME_CAPSULE_RECEPTIONIST
	const POKECENTER2F_OFFICER

PokeCenter2F_MapScriptHeader:
.MapTriggers:
	db 6

	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1
	maptrigger .Trigger2
	maptrigger .Trigger3
	maptrigger .Trigger4
	maptrigger .Trigger5

.MapCallbacks:
	db 0

.Trigger0:
	special Special_CheckMysteryGift
	if_equal $0, .Trigger0Done
	clearevent EVENT_MYSTERY_GIFT_DELIVERY_GUY
	checkevent EVENT_RECEIVED_BALLS_FROM_KURT
	iftrue .Trigger0Done
	priorityjump PokeCenter2F_AppearMysteryGiftDeliveryGuy

.Trigger0Done:
	end

.Trigger1:
	priorityjump Script_LeftCableTradeCenter
	end

.Trigger2:
	priorityjump Script_LeftCableColosseum
	end

.Trigger3:
	priorityjump Script_LeftTimeCapsule
	end

.Trigger4:
	priorityjump Script_LeftMobileTradeRoom
	end

.Trigger5:
	priorityjump Script_LeftMobileBattleRoom
	end

PokeCenter2F_AppearMysteryGiftDeliveryGuy:
	appear POKECENTER2F_OFFICER
	setevent EVENT_RECEIVED_BALLS_FROM_KURT
	end

Script_TradeCenterClosed:
	faceplayer
	opentext
	writetext Text_TradeRoomClosed
	waitbutton
	closetext
	end

Script_BattleRoomClosed:
	faceplayer
	opentext
	writetext Text_BattleRoomClosed
	waitbutton
	closetext
	end

LinkReceptionistScript_Trade:
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iffalse Script_TradeCenterClosed
	opentext
	writetext Text_TradeReceptionistIntro
	yesorno
	iffalse .Cancel
	special Mobile_DummyReturnFalse ; always returns false
	iffalse .NoMobile
	writetext Text_TradeReceptionistMobile
	special AskMobileOrCable
	iffalse .Cancel
	if_equal $1, .Mobile
.NoMobile:
	special Special_SetBitsForLinkTradeRequest
	writetext Text_PleaseWait
	special Special_WaitForLinkedFriend
	iffalse .FriendNotReady
	writetext Text_MustSaveGame
	yesorno
	iffalse .DidNotSave
	special Special_TryQuickSave
	iffalse .DidNotSave
	writetext Text_PleaseWait
	special Special_CheckLinkTimeout
	iffalse .LinkTimedOut
	copybytetovar wOtherPlayerLinkMode
	iffalse .LinkedToFirstGen
	special Special_CheckBothSelectedSameRoom
	iffalse .IncompatibleRooms
	writetext Text_PleaseComeIn2
	waitbutton
	closetext
	scall PokeCenter2F_CheckGender
	warpcheck
	end

.FriendNotReady:
	special WaitForOtherPlayerToExit
	writetext Text_FriendNotReady
	closetext
	end

.LinkedToFirstGen:
	special Special_FailedLinkToPast
	writetext Text_CantLinkToThePast
	special Special_CloseLink
	closetext
	end

.IncompatibleRooms:
	writetext Text_IncompatibleRooms
	special Special_CloseLink
	closetext
	end

.LinkTimedOut:
	writetext Text_LinkTimedOut
	jump .AbortLink

.DidNotSave:
	writetext Text_PleaseComeAgain
.AbortLink:
	special WaitForOtherPlayerToExit
.Cancel:
	closetext
	end

.Mobile:
	scall .Mobile_TrySave
	iftrue .Mobile_Abort
	scall BattleTradeMobile_WalkIn
	warpcheck
	end

.Mobile_Abort:
	end

.Mobile_TrySave:
	writetext Text_MustSaveGame
	yesorno
	iffalse .Mobile_DidNotSave
	special Special_TryQuickSave
	iffalse .Mobile_DidNotSave
	special Function1011f1
	writetext Text_PleaseComeIn2
	waitbutton
	closetext
	writebyte $0
	end

.Mobile_DidNotSave:
	writetext Text_PleaseComeAgain
	closetext
	writebyte $1
	end

BattleTradeMobile_WalkIn:
	applymovement2 PokeCenter2FMobileMobileMovementData_ReceptionistWalksUpAndLeft_LookDown
	applymovement PLAYER, PokeCenter2FMobileMovementData_PlayerWalksIntoMobileBattleRoom
	end

LinkReceptionistScript_Battle:
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iffalse Script_BattleRoomClosed
	opentext
	writetext Text_BattleReceptionistIntro
	yesorno
	iffalse .Cancel
	special Mobile_DummyReturnFalse ; always returns false
	iffalse .NoMobile
	writetext Text_BattleReceptionistMobile
	special AskMobileOrCable
	iffalse .Cancel
	if_equal $1, .Mobile
.NoMobile:
	special Special_SetBitsForBattleRequest
	writetext Text_PleaseWait
	special Special_WaitForLinkedFriend
	iffalse .FriendNotReady
	writetext Text_MustSaveGame
	yesorno
	iffalse .DidNotSave
	special Special_TryQuickSave
	iffalse .DidNotSave
	writetext Text_PleaseWait
	special Special_CheckLinkTimeout
	iffalse .LinkTimedOut
	copybytetovar wOtherPlayerLinkMode
	iffalse .LinkedToFirstGen
	special Special_CheckBothSelectedSameRoom
	iffalse .IncompatibleRooms
	writetext Text_PleaseComeIn2
	waitbutton
	closetext
	scall PokeCenter2F_CheckGender
	warpcheck
	end

.FriendNotReady:
	special WaitForOtherPlayerToExit
	writetext Text_FriendNotReady
	closetext
	end

.LinkedToFirstGen:
	special Special_FailedLinkToPast
	writetext Text_CantLinkToThePast
	special Special_CloseLink
	closetext
	end

.IncompatibleRooms:
	writetext Text_IncompatibleRooms
	special Special_CloseLink
	closetext
	end

.LinkTimedOut:
	writetext Text_LinkTimedOut
	jump .AbortLink

.DidNotSave:
	writetext Text_PleaseComeAgain
.AbortLink:
	special WaitForOtherPlayerToExit
.Cancel:
	closetext
	end

.Mobile:
	scall .SelectThreeMons
	iffalse .Mobile_Abort
	scall .Mobile_TrySave
	iftrue .Mobile_Abort
	scall BattleTradeMobile_WalkIn
	warpcheck
	end

.Mobile_Abort:
	end

.Mobile_TrySave:
	writetext Text_MustSaveGame
	yesorno
	iffalse .Mobile_DidNotSave
	special Function103780
	iffalse .Mobile_DidNotSave
	special Function1011f1
	writetext Text_PleaseComeIn2
	waitbutton
	closetext
	writebyte $0
	end

.Mobile_DidNotSave:
	writetext Text_PleaseComeAgain
	closetext
	writebyte $1
	end

.SelectThreeMons:
	special Mobile_SelectThreeMons
	iffalse .Mobile_DidNotSelect
	if_equal $1, .Mobile_OK
	if_equal $2, .Mobile_OK
	if_equal $3, .Mobile_InvalidParty
	jump .Mobile_DidNotSelect

.Mobile_InvalidParty:
	writetext Text_BrokeStadiumRules
	waitbutton
.Mobile_DidNotSelect:
	closetext
	writebyte $0
	end

.Mobile_OK:
	writebyte $1
	end

Script_TimeCapsuleClosed:
	faceplayer
	opentext
	writetext Text_TimeCapsuleClosed
	waitbutton
	closetext
	end

LinkReceptionistScript_TimeCapsule:
	checkevent EVENT_MET_BILL
	iftrue Script_TimeCapsuleClosed
	checkflag ENGINE_TIME_CAPSULE
	iftrue Script_TimeCapsuleClosed
	special Special_SetBitsForTimeCapsuleRequest
	faceplayer
	opentext
	writetext Text_TimeCapsuleReceptionistIntro
	yesorno
	iffalse .Cancel
	special Special_CheckTimeCapsuleCompatibility
	if_equal $1, .MonTooNew
	if_equal $2, .MonMoveTooNew
	if_equal $3, .MonHasMail
	writetext Text_PleaseWait
	special Special_WaitForLinkedFriend
	iffalse .FriendNotReady
	writetext Text_MustSaveGame
	yesorno
	iffalse .DidNotSave
	special Special_TryQuickSave
	iffalse .DidNotSave
	writetext Text_PleaseWait
	special Special_CheckLinkTimeout
	iffalse .LinkTimedOut
	copybytetovar wOtherPlayerLinkMode
	iffalse .OK
	special Special_CheckBothSelectedSameRoom
	writetext Text_IncompatibleRooms
	special Special_CloseLink
	closetext
	end

.OK:
	special Special_EnterTimeCapsule
	writetext Text_PleaseComeIn2
	waitbutton
	closetext
	scall TimeCapsuleScript_CheckPlayerGender
	warpcheck
	end

.FriendNotReady:
	special WaitForOtherPlayerToExit
	writetext Text_FriendNotReady
	closetext
	end

.LinkTimedOut:
	writetext Text_LinkTimedOut
	jump .Cancel

.DidNotSave:
	writetext Text_PleaseComeAgain
.Cancel:
	special WaitForOtherPlayerToExit
	closetext
	end

.MonTooNew:
	writetext Text_RejectNewMon
	closetext
	end

.MonMoveTooNew:
	writetext Text_RejectMonWithNewMove
	closetext
	end

.MonHasMail:
	writetext Text_RejectMonWithMail
	closetext
	end

Script_LeftCableTradeCenter:
	special WaitForOtherPlayerToExit
	scall Script_WalkOutOfLinkTradeRoom
	dotrigger $0
	domaptrigger TRADE_CENTER, $0
	end

Script_LeftMobileTradeRoom:
	special Function101220
	scall Script_WalkOutOfMobileTradeRoom
	dotrigger $0
	domaptrigger MOBILE_TRADE_ROOM_MOBILE, $0
	end

Script_WalkOutOfMobileTradeRoom:
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, PokeCenter2FMobileMovementData_ReceptionistWalksUpAndLeft
	applymovement PLAYER, PokeCenter2FMovementData_PlayerWalksOutOfMobileRoom
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, PokeCenter2FMobileMovementData_ReceptionistWalksRightAndDown
	end

Script_LeftCableColosseum:
	special WaitForOtherPlayerToExit
	scall Script_WalkOutOfLinkBattleRoom
	dotrigger $0
	domaptrigger COLOSSEUM, $0
	end

Script_LeftMobileBattleRoom:
	special Function101220
	scall Script_WalkOutOfMobileBattleRoom
	dotrigger $0
	domaptrigger MOBILE_BATTLE_ROOM, $0
	end

Script_WalkOutOfMobileBattleRoom:
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, PokeCenter2FMobileMovementData_ReceptionistWalksUpAndLeft
	applymovement PLAYER, PokeCenter2FMovementData_PlayerWalksOutOfMobileRoom
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, PokeCenter2FMobileMovementData_ReceptionistWalksRightAndDown
	end

PokeCenter2F_CheckGender:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female
	applymovement2 PokeCenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight
	applymovement PLAYER, PokeCenter2FMovementData_PlayerTakesThreeStepsUp
	end

.Female:
	applymovement2 PokeCenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight_2
	applymovement PLAYER, PokeCenter2FMovementData_PlayerTakesTwoStepsUp
	opentext
	writetext Text_OhPleaseWait
	waitbutton
	closetext
	applymovement2 PokeCenter2FMovementData_ReceptionistLooksRight
	spriteface PLAYER, LEFT
	opentext
	writetext Text_ChangeTheLook
	waitbutton
	closetext
	playsound SFX_TINGLE
	applymovement PLAYER, PokeCenter2FMovementData_PlayerSpinsClockwiseEndsFacingRight
	writebyte (1 << 7) | (PAL_OW_RED << 4)
	special Special_SetPlayerPalette
	applymovement PLAYER, PokeCenter2FMovementData_PlayerSpinsClockwiseEndsFacingLeft
	setflag ENGINE_KRIS_IN_CABLE_CLUB
	special ReplaceKrisSprite
	opentext
	writetext Text_LikeTheLook
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement PLAYER, PokeCenter2FMovementData_PlayerTakesOneStepUp
	end

Script_WalkOutOfLinkTradeRoom:
	checkflag ENGINE_KRIS_IN_CABLE_CLUB
	iftrue .Female
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, PokeCenter2FMovementData_ReceptionistStepsRightLooksDown_3
	applymovement PLAYER, PokeCenter2FMovementData_PlayerTakesThreeStepsDown
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, PokeCenter2FMovementData_ReceptionistStepsRightAndDown
	end

.Female:
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, PokeCenter2FMovementData_ReceptionistStepsRightLooksDown_3
	applymovement PLAYER, PokeCenter2FMovementData_PlayerTakesOneStepDown_2
	clearflag ENGINE_KRIS_IN_CABLE_CLUB
	playsound SFX_TINGLE
	applymovement PLAYER, PokeCenter2FMovementData_PlayerSpinsClockwiseEndsFacingRight
	writebyte (1 << 7) | (PAL_OW_BLUE << 4)
	special Special_SetPlayerPalette
	applymovement PLAYER, PokeCenter2FMovementData_PlayerSpinsClockwiseEndsFacingLeft
	special ReplaceKrisSprite
	applymovement PLAYER, PokeCenter2FMovementData_PlayerTakesTwoStepsDown_2
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, PokeCenter2FMovementData_ReceptionistStepsRightAndDown
	end

Script_WalkOutOfLinkBattleRoom:
	checkflag ENGINE_KRIS_IN_CABLE_CLUB
	iftrue .Female
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, PokeCenter2FMovementData_ReceptionistStepsRightLooksDown_3
	applymovement PLAYER, PokeCenter2FMovementData_PlayerTakesThreeStepsDown
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, PokeCenter2FMovementData_ReceptionistStepsRightAndDown
	end

.Female:
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, PokeCenter2FMovementData_ReceptionistStepsRightLooksDown_3
	applymovement PLAYER, PokeCenter2FMovementData_PlayerTakesOneStepDown_2
	clearflag ENGINE_KRIS_IN_CABLE_CLUB
	playsound SFX_TINGLE
	applymovement PLAYER, PokeCenter2FMovementData_PlayerSpinsClockwiseEndsFacingRight
	writebyte (1 << 7) | (PAL_OW_BLUE << 4)
	special Special_SetPlayerPalette
	applymovement PLAYER, PokeCenter2FMovementData_PlayerSpinsClockwiseEndsFacingLeft
	special ReplaceKrisSprite
	applymovement PLAYER, PokeCenter2FMovementData_PlayerTakesTwoStepsDown_2
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, PokeCenter2FMovementData_ReceptionistStepsRightAndDown
	end

TimeCapsuleScript_CheckPlayerGender:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female
	checkcode VAR_FACING
	if_equal LEFT, .MaleFacingLeft
	if_equal RIGHT, .MaleFacingRight
	applymovement2 PokeCenter2FMovementData_ReceptionistStepsLeftLooksDown
	applymovement PLAYER, PokeCenter2FMovementData_PlayerTakesTwoStepsUp_2
	end

.MaleFacingLeft:
	applymovement2 PokeCenter2FMovementData_ReceptionistStepsLeftLooksDown
	applymovement PLAYER, PokeCenter2FMovementData_PlayerWalksLeftAndUp
	end

.MaleFacingRight:
	applymovement2 PokeCenter2FMovementData_ReceptionistStepsRightLooksDown
	applymovement PLAYER, PokeCenter2FMovementData_PlayerWalksRightAndUp
	end

.Female:
	checkcode VAR_FACING
	if_equal RIGHT, .FemaleFacingRight
	if_equal LEFT, .FemaleFacingLeft
	applymovement2 PokeCenter2FMovementData_ReceptionistStepsLeftLooksRight_2
	applymovement PLAYER, PokeCenter2FMovementData_PlayerTakesOneStepUp_2
	jump .FemaleContinue

.FemaleFacingRight:
	applymovement2 PokeCenter2FMovementData_ReceptionistStepsRightLooksLeft_2
	applymovement PLAYER, PokeCenter2FMovementData_PlayerTakesOneStepRight
	jump .FemaleContinue

.FemaleFacingLeft:
	applymovement2 PokeCenter2FMovementData_ReceptionistStepsLeftLooksRight_2
	applymovement PLAYER, PokeCenter2FMovementData_PlayerTakesOneStepLeft
.FemaleContinue:
	opentext
	writetext Text_OhPleaseWait
	waitbutton
	closetext
	checkcode VAR_FACING
	if_not_equal UP, .FemaleChangeApperance
	spriteface PLAYER, LEFT
.FemaleChangeApperance:
	opentext
	writetext Text_ChangeTheLook
	waitbutton
	closetext
	playsound SFX_TINGLE
	applymovement PLAYER, PokeCenter2FMovementData_PlayerSpinsClockwiseEndsFacingRight
	writebyte (1 << 7) | (PAL_OW_RED << 4)
	special Special_SetPlayerPalette
	applymovement PLAYER, PokeCenter2FMovementData_PlayerSpinsClockwiseEndsFacingDown
	faceperson PLAYER, POKECENTER2F_TIME_CAPSULE_RECEPTIONIST
	setflag ENGINE_KRIS_IN_CABLE_CLUB
	special ReplaceKrisSprite
	opentext
	writetext Text_LikeTheLook
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement PLAYER, PokeCenter2FMovementData_PlayerTakesOneStepUp_2
	end

Script_LeftTimeCapsule:
	special WaitForOtherPlayerToExit
	checkflag ENGINE_KRIS_IN_CABLE_CLUB
	iftrue .Female
	applymovement POKECENTER2F_TIME_CAPSULE_RECEPTIONIST, PokeCenter2FMovementData_ReceptionistStepsLeftLooksRight
	applymovement PLAYER, PokeCenter2FMovementData_PlayerTakesTwoStepsDown
	applymovement POKECENTER2F_TIME_CAPSULE_RECEPTIONIST, PokeCenter2FMovementData_ReceptionistStepsRightLooksDown_2
	jump .Done

.Female:
	applymovement POKECENTER2F_TIME_CAPSULE_RECEPTIONIST, PokeCenter2FMovementData_ReceptionistStepsLeftLooksRight
	applymovement PLAYER, PokeCenter2FMovementData_PlayerTakesOneStepDown
	clearflag ENGINE_KRIS_IN_CABLE_CLUB
	playsound SFX_TINGLE
	applymovement PLAYER, PokeCenter2FMovementData_PlayerSpinsClockwiseEndsFacingRight
	writebyte (1 << 7) | (PAL_OW_BLUE << 4)
	special Special_SetPlayerPalette
	applymovement PLAYER, PokeCenter2FMovementData_PlayerSpinsClockwiseEndsFacingLeft
	special ReplaceKrisSprite
	applymovement PLAYER, PokeCenter2FMovementData_PlayerTakesOneStepDown
	applymovement POKECENTER2F_TIME_CAPSULE_RECEPTIONIST, PokeCenter2FMovementData_ReceptionistStepsRightLooksDown_2
.Done:
	dotrigger $0
	domaptrigger TIME_CAPSULE, $0
	end

MapPokeCenter2FSignpost0Script:
	refreshscreen $0
	special Special_DisplayLinkRecord
	closetext
	end

OfficerScript_0x192c9a:
	faceplayer
	opentext
	checkevent EVENT_MYSTERY_GIFT_DELIVERY_GUY
	iftrue .AlreadyGotGift
	writetext Text_MysteryGiftDeliveryGuy_Intro
	yesorno
	iffalse .RefusedGift
	writetext Text_MysteryGiftDeliveryGuy_HereYouGo
	buttonsound
	waitsfx
	special Special_GetMysteryGiftItem
	iffalse .BagIsFull
	itemnotify
	setevent EVENT_MYSTERY_GIFT_DELIVERY_GUY
.AlreadyGotGift:
	writetext Text_MysteryGiftDeliveryGuy_Outro
	waitbutton
	closetext
	end

.BagIsFull:
	writetext Text_MysteryGiftDeliveryGuy_NoRoom
	waitbutton
	closetext
	end

.RefusedGift:
	writetext Text_MysteryGiftDeliveryGuy_SaidNo
	waitbutton
	closetext
	end

PokeCenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight:
	slow_step UP
	slow_step LEFT
	turn_head RIGHT
	step_end

PokeCenter2FMobileMobileMovementData_ReceptionistWalksUpAndLeft_LookDown:
	slow_step UP
	slow_step LEFT
	turn_head DOWN
	step_end

PokeCenter2FMovementData_ReceptionistStepsLeftLooksDown:
	slow_step LEFT
	turn_head DOWN
	step_end

PokeCenter2FMovementData_ReceptionistStepsRightLooksDown:
	slow_step RIGHT
	turn_head DOWN
	step_end

PokeCenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight_2:
	slow_step UP
	slow_step LEFT
	turn_head RIGHT
	step_end

PokeCenter2FMovementData_ReceptionistLooksRight:
	turn_head RIGHT
	step_end

PokeCenter2FMovementData_PlayerTakesThreeStepsUp:
	step UP
	step UP
	step UP
	step_end

PokeCenter2FMovementData_PlayerTakesTwoStepsUp:
	step UP
	step UP
	step_end

PokeCenter2FMovementData_PlayerTakesOneStepUp:
	step UP
	step_end

PokeCenter2FMobileMovementData_PlayerWalksIntoMobileBattleRoom:
	step UP
	step UP
	step RIGHT
	step UP
	step_end

PokeCenter2FMovementData_PlayerTakesTwoStepsUp_2:
	step UP
	step UP
	step_end

PokeCenter2FMovementData_PlayerWalksLeftAndUp:
	step LEFT
	step UP
	step_end

PokeCenter2FMovementData_PlayerWalksRightAndUp:
	step RIGHT
	step UP
	step_end

PokeCenter2FMovementData_PlayerTakesThreeStepsDown:
	step DOWN
	step DOWN
	step DOWN
	step_end

PokeCenter2FMovementData_PlayerTakesTwoStepsDown:
	step DOWN
	step DOWN
	step_end

PokeCenter2FMovementData_PlayerTakesOneStepDown:
	step DOWN
	step_end

PokeCenter2FMovementData_ReceptionistStepsRightAndDown:
	slow_step RIGHT
	slow_step DOWN
	step_end

PokeCenter2FMovementData_ReceptionistStepsRightLooksDown_2:
	slow_step RIGHT
	turn_head DOWN
	step_end

PokeCenter2FMovementData_ReceptionistStepsRightLooksDown_3:
	slow_step UP
	slow_step LEFT
	turn_head RIGHT
	step_end

PokeCenter2FMovementData_ReceptionistStepsLeftLooksRight:
	slow_step LEFT
	turn_head RIGHT
	step_end

PokeCenter2FMobileMovementData_ReceptionistWalksUpAndLeft:
	slow_step UP
	slow_step LEFT
	turn_head RIGHT
	step_end

PokeCenter2FMovementData_PlayerWalksOutOfMobileRoom:
	step DOWN
	step LEFT
	step DOWN
	step DOWN
	step_end

PokeCenter2FMobileMovementData_ReceptionistWalksRightAndDown:
	slow_step RIGHT
	slow_step DOWN
	step_end

PokeCenter2FMovementData_PlayerSpinsClockwiseEndsFacingRight:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	step_end

PokeCenter2FMovementData_PlayerSpinsClockwiseEndsFacingLeft:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head LEFT
	step_end

PokeCenter2FMovementData_PlayerSpinsClockwiseEndsFacingDown:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end

PokeCenter2FMovementData_PlayerTakesOneStepDown_2:
	step DOWN
	step_end

PokeCenter2FMovementData_PlayerTakesTwoStepsDown_2:
	step DOWN
	step DOWN
	step_end

PokeCenter2FMovementData_PlayerTakesOneStepUp_2:
	step UP
	step_end

PokeCenter2FMovementData_PlayerTakesOneStepRight:
	step RIGHT
	step_end

PokeCenter2FMovementData_PlayerTakesOneStepLeft:
	step LEFT
	step_end

PokeCenter2FMovementData_ReceptionistStepsLeftLooksRight_2:
	slow_step LEFT
	turn_head RIGHT
	step_end

PokeCenter2FMovementData_ReceptionistStepsRightLooksLeft_2:
	slow_step RIGHT
	turn_head LEFT
	step_end

Text_BattleReceptionistMobile:
	text "Would you like to"
	line "battle over a GAME"

	para "LINK cable or by"
	line "mobile phone?"
	done

Text_TradeReceptionistMobile:
	text "Would you like to"
	line "trade over a GAME"

	para "LINK cable or by"
	line "mobile phone?"
	done

Text_ThisWayToMobileRoom:
	text "This way to the"
	line "MOBILE ROOM."
	done

Text_BattleReceptionistIntro:
	text "Welcome to CABLE"
	line "CLUB COLOSSEUM."

	para "You may battle a"
	line "friend here."

	para "Would you like to"
	line "battle?"
	done

Text_TradeReceptionistIntro:
	text "Welcome to CABLE"
	line "TRADE CENTER."

	para "You may trade your"
	line "#MON here with"
	cont "a friend."

	para "Would you like to"
	line "trade?"
	done

Text_TimeCapsuleReceptionistIntro:
	text "Welcome to CABLE"
	line "CLUB TIME CAPSULE."

	para "You can travel to"
	line "the past and trade"
	cont "your #MON."

	para "Would you like to"
	line "trade across time?"
	done

Text_FriendNotReady:
	text "Your friend is not"
	line "ready."
	prompt

Text_MustSaveGame:
	text "Before opening the"
	line "link, you must"
	cont "save your game."
	done

Text_PleaseWait:
	text "Please wait."
	done

Text_LinkTimedOut:
	text "The link has been"
	line "closed because of"
	cont "inactivity."

	para "Please contact"
	line "your friend and"
	cont "come again."
	prompt

Text_PleaseComeAgain:
	text "Please come again."
	prompt

Text_PleaseComeIn:
	text "Please come in."
	prompt

Text_TemporaryStagingInLinkRoom:
	text "We'll put you in"
	line "the link room for"
	cont "the time being."
	done

Text_CantLinkToThePast:
	text "You can't link to"
	line "the past here."
	prompt

Text_IncompatibleRooms:
	text "Incompatible rooms"
	line "were chosen."
	prompt

Text_PleaseComeIn2:
	text "Please come in."
	done

Text_PleaseEnter:
	text "Please enter."
	prompt

Text_RejectNewMon:
	text "Sorry--@"
	text_from_ram StringBuffer1
	text ""
	line "can't be taken."
	prompt

Text_RejectMonWithNewMove:
	text "You can't take the"
	line "@"
	text_from_ram StringBuffer1
	text " with a"
	cont "@"
	text_from_ram StringBuffer2
	text "."
	prompt

Text_RejectMonWithMail:
	text "You can't take the"
	line "@"
	text_from_ram StringBuffer1
	text " that"
	cont "has MAIL with you."
	prompt

Text_TimeCapsuleClosed:
	text "I'm sorry--the"
	line "TIME CAPSULE is"
	cont "being adjusted."
	done

Text_TradeRoomClosed:
	text "I'm sorry--the"
	line "TRADE MACHINE is"
	cont "being adjusted."
	done

Text_BattleRoomClosed:
	text "I'm sorry--the"
	line "BATTLE MACHINE is"
	cont "being adjusted."
	done

Text_MysteryGiftDeliveryGuy_Intro:
	text "Hello! You're"
	line "<PLAYER>, right?"

	para "I have some-"
	line "thing for you."
	done

Text_MysteryGiftDeliveryGuy_HereYouGo:
	text "Here you go!"
	done

Text_MysteryGiftDeliveryGuy_Outro:
	text "We hope to serve"
	line "you again."
	done

Text_MysteryGiftDeliveryGuy_NoRoom:
	text "Oh, you have no"
	line "space for this."

	para "Stop in at any"
	line "#MON CENTER"

	para "across the country"
	line "to pick it up."
	done

Text_MysteryGiftDeliveryGuy_SaidNo:
	text "No? That's very"
	line "strange…"
	done

Text_OhPleaseWait:
	text "Oh, please wait."
	done

Text_ChangeTheLook:
	text "We need to change"
	line "the look here…"
	done

Text_LikeTheLook:
	text "How does this"
	line "style look to you?"
	done

Text_BrokeStadiumRules:
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

.Warps:
	db 6
	warp_def $7, $0, -1, POKECENTER_2F
	warp_def $0, $5, 1, TRADE_CENTER
	warp_def $0, $9, 1, COLOSSEUM
	warp_def $2, $d, 1, TIME_CAPSULE
	warp_def $0, $6, 1, MOBILE_TRADE_ROOM_MOBILE
	warp_def $0, $a, 1, MOBILE_BATTLE_ROOM

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 3, 7, SIGNPOST_READ, MapPokeCenter2FSignpost0Script

.PersonEvents:
	db 4
	person_event SPRITE_LINK_RECEPTIONIST, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LinkReceptionistScript_Trade, -1
	person_event SPRITE_LINK_RECEPTIONIST, 2, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LinkReceptionistScript_Battle, -1
	person_event SPRITE_LINK_RECEPTIONIST, 3, 13, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LinkReceptionistScript_TimeCapsule, -1
	person_event SPRITE_OFFICER, 1, 1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, OfficerScript_0x192c9a, EVENT_MYSTERY_GIFT_DELIVERY_GUY
