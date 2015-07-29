PokeCenter2F_MapScriptHeader:
.MapTriggers:
	db 6

	; triggers
	dw .Trigger1, $0000
	dw .Trigger2, $0000
	dw .Trigger3, $0000
	dw .Trigger4, $0000
	dw .Trigger5, $0000
	dw .Trigger6, $0000

.MapCallbacks:
	db 0

.Trigger1:
	special Special_CheckMysteryGift
	if_equal $0, .Trigger1Done
	clearevent EVENT_MYSTERY_GIFT_DELIVERY_GUY
	checkevent EVENT_RECEIVED_BALLS_FROM_KURT
	iftrue .Trigger1Done
	priorityjump PokeCenter2F_AppearMysteryGiftDeliveryGuy

.Trigger1Done:
	end

.Trigger2:
	priorityjump Script_LeftCableTradeCenter
	end

.Trigger3:
	priorityjump Script_LeftCableColosseum
	end

.Trigger4:
	priorityjump Script_LeftTimeCapsule
	end

.Trigger5:
	priorityjump Script_LeftMobileTradeRoom
	end

.Trigger6:
	priorityjump Script_LeftMobileBattleRoom
	end

PokeCenter2F_AppearMysteryGiftDeliveryGuy:
	appear $5
	setevent EVENT_RECEIVED_BALLS_FROM_KURT
	end

Script_TradeCenterClosed:
	faceplayer
	loadfont
	writetext Text_TradeRoomClosed
	closetext
	loadmovesprites
	end

Script_BattleRoomClosed:
	faceplayer
	loadfont
	writetext Text_BattleRoomClosed
	closetext
	loadmovesprites
	end

LinkReceptionistScript_Trade:
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iffalse Script_TradeCenterClosed
	loadfont
	writetext Text_TradeReceptionistIntro
	yesorno
	iffalse .Cancel
	special Function10630f
	iffalse .NoMobile
	writetext Text_TradeReceptionistMobile
	special Function103612
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
	copybytetovar wcf51
	iffalse .LinkedToFirstGen
	special Special_CheckBothSelectedSameRoom
	iffalse .IncompatibleRooms
	writetext Text_PleaseComeIn2
	closetext
	loadmovesprites
	scall PokeCenter2F_CheckGender
	warpcheck
	end

.FriendNotReady:
	special Special_AbortLink
	writetext Text_FriendNotReady
	loadmovesprites
	end

.LinkedToFirstGen:
	special Special_FailedLinkToPast
	writetext Text_CantLinkToThePast
	special Special_CloseLink
	loadmovesprites
	end

.IncompatibleRooms:
	writetext Text_IncompatibleRooms
	special Special_CloseLink
	loadmovesprites
	end

.LinkTimedOut:
	writetext Text_LinkTimedOut
	jump .AbortLink

.DidNotSave:
	writetext Text_PleaseComeAgain
.AbortLink:
	special Special_AbortLink
.Cancel:
	loadmovesprites
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
	closetext
	loadmovesprites
	writebyte $0
	end

.Mobile_DidNotSave:
	writetext Text_PleaseComeAgain
	loadmovesprites
	writebyte $1
	end

BattleTradeMobile_WalkIn:
	applymovement2 MovementData_0x192cce
	applymovement $0, MovementData_0x192ce7
	end

LinkReceptionistScript_Battle:
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iffalse Script_BattleRoomClosed
	loadfont
	writetext Text_BattleReceptionistIntro
	yesorno
	iffalse .Cancel
	special Function10630f
	iffalse .NoMobile
	writetext Text_BattleReceptionistMobile
	special Function103612
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
	copybytetovar wcf51
	iffalse .LinkedToFirstGen
	special Special_CheckBothSelectedSameRoom
	iffalse .IncompatibleRooms
	writetext Text_PleaseComeIn2
	closetext
	loadmovesprites
	scall PokeCenter2F_CheckGender
	warpcheck
	end

.FriendNotReady:
	special Special_AbortLink
	writetext Text_FriendNotReady
	loadmovesprites
	end

.LinkedToFirstGen:
	special Special_FailedLinkToPast
	writetext Text_CantLinkToThePast
	special Special_CloseLink
	loadmovesprites
	end

.IncompatibleRooms:
	writetext Text_IncompatibleRooms
	special Special_CloseLink
	loadmovesprites
	end

.LinkTimedOut:
	writetext Text_LinkTimedOut
	jump .AbortLink

.DidNotSave:
	writetext Text_PleaseComeAgain
.AbortLink:
	special Special_AbortLink
.Cancel:
	loadmovesprites
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
	closetext
	loadmovesprites
	writebyte $0
	end

.Mobile_DidNotSave:
	writetext Text_PleaseComeAgain
	loadmovesprites
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
	closetext
.Mobile_DidNotSelect:
	loadmovesprites
	writebyte $0
	end

.Mobile_OK:
	writebyte $1
	end

Script_TimeCapsuleClosed:
	faceplayer
	loadfont
	writetext Text_TimeCapsuleClosed
	closetext
	loadmovesprites
	end

LinkReceptionistScript_TimeCapsule:
	checkevent EVENT_MET_BILL
	iftrue Script_TimeCapsuleClosed
	checkflag ENGINE_TIME_CAPSULE
	iftrue Script_TimeCapsuleClosed
	special Special_SetBitsForTimeCapsuleRequest
	faceplayer
	loadfont
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
	copybytetovar wcf51
	iffalse .OK
	special Special_CheckBothSelectedSameRoom
	writetext Text_IncompatibleRooms
	special Special_CloseLink
	loadmovesprites
	end

.OK:
	special Special_EnterTimeCapsule
	writetext Text_PleaseComeIn2
	closetext
	loadmovesprites
	scall TimeCapsuleScript_CheckPlayerGender
	warpcheck
	end

.FriendNotReady:
	special Special_AbortLink
	writetext Text_FriendNotReady
	loadmovesprites
	end

.LinkTimedOut:
	writetext Text_LinkTimedOut
	jump .Cancel

.DidNotSave:
	writetext Text_PleaseComeAgain
.Cancel:
	special Special_AbortLink
	loadmovesprites
	end

.MonTooNew:
	writetext Text_RejectNewMon
	loadmovesprites
	end

.MonMoveTooNew:
	writetext Text_RejectMonWithNewMove
	loadmovesprites
	end

.MonHasMail:
	writetext Text_RejectMonWithMail
	loadmovesprites
	end

Script_LeftCableTradeCenter:
	special Special_AbortLink
	scall Script_CleanUpFemaleFlagAfterTrade
	dotrigger $0
	domaptrigger GROUP_TRADE_CENTER, MAP_TRADE_CENTER, $0
	end

Script_LeftMobileTradeRoom:
	special Function101220
	scall Script_WalkOutOfMobileTradeRoom
	dotrigger $0
	domaptrigger GROUP_MOBILE_TRADE_ROOM_MOBILE, MAP_MOBILE_TRADE_ROOM_MOBILE, $0
	end

Script_WalkOutOfMobileTradeRoom:
	applymovement $2, MovementData_0x192d0b
	applymovement $0, MovementData_0x192d0f
	applymovement $2, MovementData_0x192d14
	end

Script_LeftCableColosseum:
	special Special_AbortLink
	scall Script_CleanUpFemaleFlagAfterBattle
	dotrigger $0
	domaptrigger GROUP_COLOSSEUM, MAP_COLOSSEUM, $0
	end

Script_LeftMobileBattleRoom:
	special Function101220
	scall Script_WalkOutOfMobileBattleRoom
	dotrigger $0
	domaptrigger GROUP_MOBILE_BATTLE_ROOM, MAP_MOBILE_BATTLE_ROOM, $0
	end

Script_WalkOutOfMobileBattleRoom:
	applymovement $3, MovementData_0x192d0b
	applymovement $0, MovementData_0x192d0f
	applymovement $3, MovementData_0x192d14
	end

PokeCenter2F_CheckGender:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female
	applymovement2 MovementData_0x192cca
	applymovement $0, MovementData_0x192cde
	end

.Female:
	applymovement2 MovementData_0x192cd8
	applymovement $0, MovementData_0x192ce2
	loadfont
	writetext Text_OhPleaseWait
	closetext
	loadmovesprites
	applymovement2 MovementData_0x192cdc
	spriteface $0, LEFT
	loadfont
	writetext Text_ChangeTheLook
	closetext
	loadmovesprites
	playsound SFX_TINGLE
	applymovement $0, MovementData_0x192d17
	writebyte $80
	special Functionc225
	applymovement $0, MovementData_0x192d1c
	setflag ENGINE_KRIS_IN_CABLE_CLUB
	special Special_ReplaceKrisSprite
	loadfont
	writetext Text_LikeTheLook
	closetext
	loadmovesprites
	showemote EMOTE_SHOCK, $0, 15
	applymovement $0, MovementData_0x192ce5
	end

Script_CleanUpFemaleFlagAfterTrade:
	checkflag ENGINE_KRIS_IN_CABLE_CLUB
	iftrue .Female
	applymovement $2, MovementData_0x192d04
	applymovement $0, MovementData_0x192cf5
	applymovement $2, MovementData_0x192cfe
	end

.Female:
	applymovement $2, MovementData_0x192d04
	applymovement $0, MovementData_0x192d28
	clearflag ENGINE_KRIS_IN_CABLE_CLUB
	playsound SFX_TINGLE
	applymovement $0, MovementData_0x192d17
	writebyte $90
	special Functionc225
	applymovement $0, MovementData_0x192d1c
	special Special_ReplaceKrisSprite
	applymovement $0, MovementData_0x192d2a
	applymovement $2, MovementData_0x192cfe
	end

Script_CleanUpFemaleFlagAfterBattle:
	checkflag ENGINE_KRIS_IN_CABLE_CLUB
	iftrue .Female
	applymovement $3, MovementData_0x192d04
	applymovement $0, MovementData_0x192cf5
	applymovement $3, MovementData_0x192cfe
	end

.Female:
	applymovement $3, MovementData_0x192d04
	applymovement $0, MovementData_0x192d28
	clearflag ENGINE_KRIS_IN_CABLE_CLUB
	playsound SFX_TINGLE
	applymovement $0, MovementData_0x192d17
	writebyte $90
	special Functionc225
	applymovement $0, MovementData_0x192d1c
	special Special_ReplaceKrisSprite
	applymovement $0, MovementData_0x192d2a
	applymovement $3, MovementData_0x192cfe
	end

TimeCapsuleScript_CheckPlayerGender:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female
	checkcode VAR_FACING
	if_equal LEFT, .MaleFacingLeft
	if_equal RIGHT, .MaleFacingRight
	applymovement2 MovementData_0x192cd2
	applymovement $0, MovementData_0x192cec
	end

.MaleFacingLeft:
	applymovement2 MovementData_0x192cd2
	applymovement $0, MovementData_0x192cef
	end

.MaleFacingRight:
	applymovement2 MovementData_0x192cd5
	applymovement $0, MovementData_0x192cf2
	end

.Female:
	checkcode VAR_FACING
	if_equal RIGHT, .FemaleFacingRight
	if_equal LEFT, .FemaleFacingLeft
	applymovement2 MovementData_0x192d33
	applymovement $0, MovementData_0x192d2d
	jump .FemaleContinue

.FemaleFacingRight:
	applymovement2 MovementData_0x192d36
	applymovement $0, MovementData_0x192d2f
	jump .FemaleContinue

.FemaleFacingLeft:
	applymovement2 MovementData_0x192d33
	applymovement $0, MovementData_0x192d31
.FemaleContinue:
	loadfont
	writetext Text_OhPleaseWait
	closetext
	loadmovesprites
	checkcode VAR_FACING
	if_not_equal UP, .FemaleChangeApperance
	spriteface $0, LEFT
.FemaleChangeApperance:
	loadfont
	writetext Text_ChangeTheLook
	closetext
	loadmovesprites
	playsound SFX_TINGLE
	applymovement $0, MovementData_0x192d17
	writebyte $80
	special Functionc225
	applymovement $0, MovementData_0x192d22
	faceperson $0, $4
	setflag ENGINE_KRIS_IN_CABLE_CLUB
	special Special_ReplaceKrisSprite
	loadfont
	writetext Text_LikeTheLook
	closetext
	loadmovesprites
	showemote EMOTE_SHOCK, $0, 15
	applymovement $0, MovementData_0x192d2d
	end

Script_LeftTimeCapsule:
	special Special_AbortLink
	checkflag ENGINE_KRIS_IN_CABLE_CLUB
	iftrue .Female
	applymovement $4, MovementData_0x192d08
	applymovement $0, MovementData_0x192cf9
	applymovement $4, MovementData_0x192d01
	jump .Done

.Female:
	applymovement $4, MovementData_0x192d08
	applymovement $0, MovementData_0x192cfc
	clearflag ENGINE_KRIS_IN_CABLE_CLUB
	playsound SFX_TINGLE
	applymovement $0, MovementData_0x192d17
	writebyte $90
	special Functionc225
	applymovement $0, MovementData_0x192d1c
	special Special_ReplaceKrisSprite
	applymovement $0, MovementData_0x192cfc
	applymovement $4, MovementData_0x192d01
.Done:
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
	checkevent EVENT_MYSTERY_GIFT_DELIVERY_GUY
	iftrue .AlreadyGotGift
	writetext Text_MysteryGiftDeliveryGuy_Intro
	yesorno
	iffalse .RefusedGift
	writetext Text_MysteryGiftDeliveryGuy_HereYouGo
	keeptextopen
	waitbutton
	special Special_GetMysteryGiftItem
	iffalse .BagIsFull
	itemnotify
	setevent EVENT_MYSTERY_GIFT_DELIVERY_GUY
.AlreadyGotGift:
	writetext Text_MysteryGiftDeliveryGuy_Outro
	closetext
	loadmovesprites
	end

.BagIsFull:
	writetext Text_MysteryGiftDeliveryGuy_NoRoom
	closetext
	loadmovesprites
	end

.RefusedGift:
	writetext Text_MysteryGiftDeliveryGuy_SaidNo
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
	warp_def $7, $0, -1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F
	warp_def $0, $5, 1, GROUP_TRADE_CENTER, MAP_TRADE_CENTER
	warp_def $0, $9, 1, GROUP_COLOSSEUM, MAP_COLOSSEUM
	warp_def $2, $d, 1, GROUP_TIME_CAPSULE, MAP_TIME_CAPSULE
	warp_def $0, $6, 1, GROUP_MOBILE_TRADE_ROOM_MOBILE, MAP_MOBILE_TRADE_ROOM_MOBILE
	warp_def $0, $a, 1, GROUP_MOBILE_BATTLE_ROOM, MAP_MOBILE_BATTLE_ROOM

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 3, 7, SIGNPOST_READ, MapPokeCenter2FSignpost0Script

.PersonEvents:
	db 4
	person_event SPRITE_LINK_RECEPTIONIST, 6, 9, OW_UP | $2, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, LinkReceptionistScript_Trade, -1
	person_event SPRITE_LINK_RECEPTIONIST, 6, 13, OW_UP | $2, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, LinkReceptionistScript_Battle, -1
	person_event SPRITE_LINK_RECEPTIONIST, 7, 17, OW_UP | $2, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, LinkReceptionistScript_TimeCapsule, -1
	person_event SPRITE_OFFICER, 5, 5, OW_UP | $2, $0, -1, -1, $0, 0, OfficerScript_0x192c9a, EVENT_MYSTERY_GIFT_DELIVERY_GUY
