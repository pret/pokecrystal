JackTriviaScript:
	random 11
	if_equal  0, .Thunder
	if_equal  1, .Rollout
	if_equal  2, .Solarbeam
	if_equal  3, .Stomp
	if_equal  4, .Gust
	if_equal  5, .Twister
	if_equal  6, .Earthquake
	if_equal  7, .Magnitude
	if_equal  8, .Sandstorm
	if_equal  9, .SunnyDay
	if_equal 10, .RainDance

.Thunder:
	farwritetext JackThunderTriviaText
	buttonsound
	jump PhoneScript_HangupText_Male

.Rollout:
	farwritetext JackRolloutTriviaText
	buttonsound
	jump PhoneScript_HangupText_Male

.Solarbeam:
	farwritetext JackSolarbeamTriviaText
	buttonsound
	jump PhoneScript_HangupText_Male

.Stomp:
	farwritetext JackStompTriviaText
	buttonsound
	jump PhoneScript_HangupText_Male

.Gust:
	farwritetext JackGustTriviaText
	buttonsound
	jump PhoneScript_HangupText_Male

.Twister:
	farwritetext JackTwisterTriviaText
	buttonsound
	jump PhoneScript_HangupText_Male

.Earthquake:
	farwritetext JackEarthquakeTriviaText
	buttonsound
	jump PhoneScript_HangupText_Male

.Magnitude:
	farwritetext JackMagnitudeTriviaText
	buttonsound
	jump PhoneScript_HangupText_Male

.Sandstorm:
	farwritetext JackSandstormTriviaText
	buttonsound
	jump PhoneScript_HangupText_Male

.SunnyDay:
	farwritetext JackSunnyDayTriviaText
	buttonsound
	jump PhoneScript_HangupText_Male

.RainDance:
	farwritetext JackRainDanceTriviaText
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa06da:
	random 10
	if_equal 0, .RuinsOfAlph
	if_equal 1, .Falkner
	if_equal 2, .Earl
	if_equal 3, .SurfPikachu
	if_equal 4, .MooMooMilk
	if_equal 5, .Salon
	if_equal 6, .Whitney
	if_equal 7, .BugCatchingContest
	if_equal 8, .BeautifulMon
	if_equal 9, .Forgot

.RuinsOfAlph:
	farwritetext UnknownText_0x176223
	buttonsound
	jump PhoneScript_HangupText_Female

.Falkner:
	farwritetext UnknownText_0x1762c3
	buttonsound
	jump PhoneScript_HangupText_Female

.Earl:
	farwritetext UnknownText_0x17638a
	buttonsound
	jump PhoneScript_HangupText_Female

.SurfPikachu:
	farwritetext UnknownText_0x176424
	buttonsound
	jump PhoneScript_HangupText_Female

.MooMooMilk:
	farwritetext UnknownText_0x1764eb
	buttonsound
	jump PhoneScript_HangupText_Female

.Salon:
	farwritetext UnknownText_0x176599
	buttonsound
	jump PhoneScript_HangupText_Female

.Whitney:
	farwritetext UnknownText_0x1766ac
	buttonsound
	jump PhoneScript_HangupText_Female

.BugCatchingContest:
	farwritetext UnknownText_0x17674f
	buttonsound
	jump PhoneScript_HangupText_Female

.BeautifulMon:
	farwritetext UnknownText_0x176816
	buttonsound
	jump PhoneScript_HangupText_Female

.Forgot:
	farwritetext UnknownText_0x17686d
	buttonsound
	jump PhoneScript_HangupText_Female

ChadOakGossipScript:
	random 10
	if_equal 0, .Blue
	if_equal 1, .Daisy
	if_equal 2, .ProfElm
	if_equal 3, .Dream
	if_equal 4, .Kurt
	if_equal 5, .League
	if_equal 6, .RadioShow
	if_equal 7, .Battling
	if_equal 8, .DaisyTea
	if_equal 9, .Traveled

.Blue:
	farwritetext ChadBlueGossipText
	buttonsound
	jump PhoneScript_HangupText_Male

.Daisy:
	farwritetext ChadDaisyGossipText
	buttonsound
	jump PhoneScript_HangupText_Male

.ProfElm:
	farwritetext ChadProfElmGossipText
	buttonsound
	jump PhoneScript_HangupText_Male

.Dream:
	farwritetext ChadDreamGossipText
	buttonsound
	jump PhoneScript_HangupText_Male

.Kurt:
	farwritetext ChadKurtGossipText
	buttonsound
	jump PhoneScript_HangupText_Male

.League:
	farwritetext ChadLeagueGossipText
	buttonsound
	jump PhoneScript_HangupText_Male

.RadioShow:
	farwritetext ChadRadioShowGossipText
	buttonsound
	jump PhoneScript_HangupText_Male

.Battling:
	farwritetext ChadBattlingGossipText
	buttonsound
	jump PhoneScript_HangupText_Male

.DaisyTea:
	farwritetext ChadDaisyTeaGossipText
	buttonsound
	jump PhoneScript_HangupText_Male

.Traveled:
	farwritetext ChadTravelGossipText
	buttonsound
	jump PhoneScript_HangupText_Male

BrentBillTriviaScript:
	random 10
	if_equal 0, .Father
	if_equal 1, .Grandpa
	if_equal 2, .Goldenrod
	if_equal 3, .Route25
	if_equal 4, .Abra
	if_equal 5, .Sister
	if_equal 6, .Milk
	if_equal 7, .Battling
	if_equal 8, .FlowerShop
	if_equal 9, .KimonoGirl

.Father:
	farwritetext UnknownText_0x662bc
	buttonsound
	jump PhoneScript_HangupText_Male

.Grandpa:
	farwritetext UnknownText_0x662fc
	buttonsound
	jump PhoneScript_HangupText_Male

.Goldenrod:
	farwritetext UnknownText_0x66335
	buttonsound
	jump PhoneScript_HangupText_Male

.Route25:
	farwritetext UnknownText_0x66366
	buttonsound
	jump PhoneScript_HangupText_Male

.Abra:
	farwritetext UnknownText_0x663a1
	buttonsound
	jump PhoneScript_HangupText_Male

.Sister:
	farwritetext UnknownText_0x663e6
	buttonsound
	jump PhoneScript_HangupText_Male

.Milk:
	farwritetext UnknownText_0x66421
	buttonsound
	jump PhoneScript_HangupText_Male

.Battling:
	farwritetext UnknownText_0x6645f
	buttonsound
	jump PhoneScript_HangupText_Male

.FlowerShop:
	farwritetext UnknownText_0x6649b
	buttonsound
	jump PhoneScript_HangupText_Male

.KimonoGirl:
	farwritetext UnknownText_0x664dd
	buttonsound
	jump PhoneScript_HangupText_Male

IrwinRumorScript:
	checkevent EVENT_OPENED_MT_SILVER
	iftrue IrwinMtSilver
	checkevent EVENT_FOUGHT_SNORLAX
	iftrue IrwinSnorlax
	checkevent EVENT_GOT_PASS_FROM_COPYCAT
	iftrue IrwinTrainPass
	checkflag ENGINE_MARSHBADGE
	iftrue IrwinMarshBadge
	checkflag ENGINE_FLYPOINT_VERMILION
	iftrue IrwinVermilionCity
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue IrwinEliteFour
	checkflag ENGINE_RISINGBADGE
	iftrue IrwinRisingBadge
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue IrwinRadioTower
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue IrwinRocketHideout
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iftrue IrwinJasmineReturned
	checkflag ENGINE_FOGBADGE
	iftrue IrwinFogBadge
	checkflag ENGINE_PLAINBADGE
	iftrue IrwinPlainBadge
	farwritetext IrwinCalledRightAwayText
	buttonsound
	jump PhoneScript_HangupText_Male

IrwinPlainBadge:
	farwritetext UnknownText_0x64099
	buttonsound
	jump PhoneScript_HangupText_Male

IrwinJasmineReturned:
	farwritetext UnknownText_0x640e6
	buttonsound
	jump PhoneScript_HangupText_Male

IrwinRocketHideout:
	farwritetext UnknownText_0x6416d
	buttonsound
	jump PhoneScript_HangupText_Male

IrwinRadioTower:
	farwritetext UnknownText_0x641e8
	buttonsound
	jump PhoneScript_HangupText_Male

IrwinRisingBadge:
	farwritetext UnknownText_0x64247
	buttonsound
	jump PhoneScript_HangupText_Male

IrwinEliteFour:
	farwritetext UnknownText_0x642bb
	buttonsound
	jump PhoneScript_HangupText_Male

IrwinVermilionCity:
	farwritetext UnknownText_0x643d4
	buttonsound
	jump PhoneScript_HangupText_Male

IrwinTrainPass:
	farwritetext UnknownText_0x64448
	buttonsound
	jump PhoneScript_HangupText_Male

IrwinSnorlax:
	farwritetext UnknownText_0x6455b
	buttonsound
	jump PhoneScript_HangupText_Male

IrwinMtSilver:
	farwritetext UnknownText_0x645ff
	buttonsound
	jump PhoneScript_HangupText_Male

IrwinFogBadge:
	farwritetext UnknownText_0x646df
	buttonsound
	jump PhoneScript_HangupText_Male

IrwinMarshBadge:
	farwritetext UnknownText_0x647d8
	buttonsound
	jump PhoneScript_HangupText_Male

JackPhoneTips:
	farwritetext UnknownText_0x1745c2
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0900:
	farwritetext UnknownText_0x17485b
	buttonsound
	jump PhoneScript_HangupText_Female

UnknownScript_0xa0908:
	farwritetext UnknownText_0x17496b
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0910:
	farwritetext UnknownText_0x174c29
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0918:
	farwritetext UnknownText_0x174ec5
	buttonsound
	jump PhoneScript_HangupText_Female

UnknownScript_0xa0920:
	farwritetext UnknownText_0x17519b
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0928:
	farwritetext UnknownText_0x17549b
	buttonsound
	jump PhoneScript_HangupText_Female

UnknownScript_0xa0930:
	farwritetext UnknownText_0x17571d
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0938:
	farwritetext UnknownText_0x175abe
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0940:
	farwritetext UnknownText_0x175eaf
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0948:
	farwritetext UnknownText_0x1768b0
	buttonsound
	jump PhoneScript_HangupText_Female

UnknownScript_0xa0950:
	farwritetext UnknownText_0x176d32
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0958:
	farwritetext UnknownText_0x1770fb
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0960:
	farwritetext UnknownText_0x177465
	buttonsound
	jump PhoneScript_HangupText_Female

UnknownScript_0xa0968:
	farwritetext UnknownText_0x64bc6
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0970:
	farwritetext UnknownText_0x64e90
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0978:
	farwritetext UnknownText_0x65161
	buttonsound
	jump PhoneScript_HangupText_Female

UnknownScript_0xa0980:
	farwritetext UnknownText_0x65a23
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0988:
	farwritetext UnknownText_0x65d5c
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0990:
	farwritetext UnknownText_0x65ff2
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0998:
	farwritetext UnknownText_0x6651e
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa09a0:
	farwritetext UnknownText_0x66882
	buttonsound
	jump PhoneScript_HangupText_Female

VanceLookingForward:
	farwritetext VanceLookingForwardText
	buttonsound
	jump PhoneScript_HangupText_Male

WiltonHaventFoundAnything:
	farwritetext WiltonHaventFoundAnythingText
	buttonsound
	jump PhoneScript_HangupText_Male

ParryBattleWithMe:
	farwritetext ParryBattleWithMeText
	buttonsound
	jump PhoneScript_HangupText_Male

ErinWorkingHardScript:
	farwritetext ErinWorkingHardText
	buttonsound
	jump PhoneScript_HangupText_Female

UnknownScript_0xa09c8:
	random 3
	if_equal 0, UnknownScript_0xa09d6
	if_equal 1, UnknownScript_0xa09de
	if_equal 2, UnknownScript_0xa09e6

UnknownScript_0xa09d6:
	farwritetext UnknownText_0x64846
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa09de:
	farwritetext UnknownText_0x64881
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa09e6:
	farwritetext UnknownText_0x648dc
	buttonsound
	jump PhoneScript_HangupText_Male

KenjiAnswerPhoneScript:
	checkcode VAR_KENJI_BREAK
	if_equal 2, .Training
	if_equal 1, .OnBreak
	farwritetext UnknownText_0x66e17
	buttonsound
	jump PhoneScript_HangupText_Male

.Training:
	farwritetext UnknownText_0x66e67
	buttonsound
	jump PhoneScript_HangupText_Male

.OnBreak:
	checkmorn
	iftrue .Morning
	checknite
	iftrue .Night
	setevent EVENT_KENJI_ON_BREAK
	farwritetext KenjiBreakText
	buttonsound
	jump PhoneScript_HangupText_Male

.Morning:
	farwritetext UnknownText_0x66ed3
	buttonsound
	jump PhoneScript_HangupText_Male

.Night:
	farwritetext UnknownText_0x66f52
	buttonsound
	jump PhoneScript_HangupText_Male

JackWantsBattleScript:
	farwritetext UnknownText_0x174638
	end

HueyWantsBattleScript:
	farwritetext UnknownText_0x1749c7
	end

UnknownScript_0xa0a37:
	farwritetext UnknownText_0x174c49
	end

BethBattleReminderScript:
	farwritetext BethForgetDealText
	end

UnknownScript_0xa0a41:
	farwritetext UnknownText_0x17520a
	end

UnknownScript_0xa0a46:
	farwritetext UnknownText_0x1754e5
	end

UnknownScript_0xa0a4b:
	farwritetext UnknownText_0x175786
	end

UnknownScript_0xa0a50:
	farwritetext UnknownText_0x175b1e
	end

UnknownScript_0xa0a55:
	farwritetext UnknownText_0x175f11
	end

UnknownScript_0xa0a5a:
	farwritetext UnknownText_0x1769da
	end

UnknownScript_0xa0a5f:
	farwritetext UnknownText_0x176d85
	end

UnknownScript_0xa0a64:
	farwritetext UnknownText_0x177138
	end

UnknownScript_0xa0a69:
	farwritetext UnknownText_0x1774c1
	end

UnknownScript_0xa0a6e:
	farwritetext UnknownText_0x64c13
	end

UnknownScript_0xa0a73:
	farwritetext UnknownText_0x64ed4
	end

UnknownScript_0xa0a78:
	farwritetext UnknownText_0x651bf
	end

UnknownScript_0xa0a7d:
	farwritetext UnknownText_0x65a63
	end

UnknownScript_0xa0a82:
	farwritetext UnknownText_0x66043
	end

UnknownScript_0xa0a87:
	farwritetext UnknownText_0x66579
	end

UnknownScript_0xa0a8c:
	farwritetext UnknownText_0x668a3
	end

VanceHurryHurry:
	farwritetext VanceHurryHurryText
	end

WiltonNotBiting:
	farwritetext WiltonNotBitingText
	end

ParryHaventYouGottenTo:
	farwritetext ParryHaventYouGottenToText
	end

ErinComeBattleScript:
	farwritetext ErinComeBattleText
	end

UnknownScript_0xa0aa5:
	farwritetext UnknownText_0x174895
	buttonsound
	jump PhoneScript_HangupText_Female

UnknownScript_0xa0aad:
	farwritetext UnknownText_0x17529c
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0ab5:
	farwritetext UnknownText_0x175b6d
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0abd:
	farwritetext UnknownText_0x17750e
	buttonsound
	jump PhoneScript_HangupText_Female

UnknownScript_0xa0ac5:
	farwritetext UnknownText_0x64f1a
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0acd:
	farwritetext UnknownText_0x6520f
	buttonsound
	jump PhoneScript_HangupText_Female

UnknownScript_0xa0ad5:
	farwritetext UnknownText_0x65da6
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0add:
	farwritetext UnknownText_0x66087
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0ae5:
	farwritetext UnknownText_0x6691d
	buttonsound
	jump PhoneScript_HangupText_Female

WiltonWantThis:
	farwritetext WiltonWantThisText
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0af5:
	farwritetext UnknownText_0x175f70
	end

UnknownScript_0xa0afa:
	farwritetext UnknownText_0x176dd1
	end

UnknownScript_0xa0aff:
	farwritetext UnknownText_0x64c5a
	end

UnknownScript_0xa0b04:
	farwritetext UnknownText_0x17717c
	end

BikeShopPhoneScript:
	farwritetext UnknownText_0x174000
	clearflag ENGINE_BIKE_SHOP_CALL_ENABLED
	specialphonecall SPECIALCALL_NONE
	end
