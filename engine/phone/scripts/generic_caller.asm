Phone_GenericCall_Male:
	special RandomPhoneMon
	farscall PhoneScript_Random2
	ifequal 0, .Bragging
	farscall PhoneScript_Generic_Male
	farsjump Phone_FoundAMon_Male

.Bragging:
	farsjump Phone_BraggingCall_Male

Phone_GenericCall_Female:
	special RandomPhoneMon
	farscall PhoneScript_Random2
	ifequal 0, .Bragging
	farscall PhoneScript_Generic_Female
	farsjump Phone_FoundAMon_Female

.Bragging:
	farsjump Phone_BraggingCall_Female

Phone_BraggingCall_Male:
	farscall Phone_WhosBragging_Male
	farsjump Phone_FoundAMon_Male

Phone_BraggingCall_Female:
	farscall Phone_WhosBragging_Female
	farsjump Phone_FoundAMon_Female

Phone_FoundAMon_Male:
	special RandomPhoneWildMon
	farscall PhoneScript_Random2
	ifequal 0, .GotAway
	farscall Phone_WhoDefeatedMon_Male
	farsjump PhoneScript_HangupText_Male

.GotAway:
	farsjump Phone_GotAwayCall_Male

Phone_FoundAMon_Female:
	special RandomPhoneWildMon
	farscall PhoneScript_Random2
	ifequal 0, .GotAway
	farscall Phone_WhoDefeatedMon_Female
	farsjump PhoneScript_HangupText_Female

.GotAway:
	farsjump Phone_GotAwayCall_Female

Phone_GotAwayCall_Male:
	farscall Phone_WhoLostAMon_Male
	farsjump PhoneScript_HangupText_Male

Phone_GotAwayCall_Female:
	farscall Phone_WhoLostAMon_Female
	farsjump PhoneScript_HangupText_Female

Phone_WhosBragging_Male:
	readvar VAR_CALLERID
	ifequal PHONE_SCHOOLBOY_JACK, .Jack
	ifequal PHONE_COOLTRAINERM_GAVEN, .Gaven
	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
	ifequal PHONE_YOUNGSTER_JOEY, .Joey
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_HIKER_ANTHONY, .Anthony
	ifequal PHONE_CAMPER_TODD, .Todd
	ifequal PHONE_BUG_CATCHER_ARNIE, .Arnie
	ifequal PHONE_SCHOOLBOY_ALAN, .Alan
	ifequal PHONE_SCHOOLBOY_CHAD, .Chad
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully
	ifequal PHONE_POKEMANIAC_BRENT, .Brent
	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
	ifequal PHONE_FISHER_WILTON, .Wilton
	ifequal PHONE_HIKER_PARRY, .Parry

.Jack:
	farwritetext JackIntelligenceText
	buttonsound
	end

.Gaven:
	farwritetext GavenGreaterText
	buttonsound
	end

.Jose:
	farwritetext JoseAromaText
	buttonsound
	end

.Joey:
	farwritetext JoeySharperText
	buttonsound
	end

.Wade:
	farwritetext WadeAreYouGrowingText
	buttonsound
	end

.Ralph:
	farwritetext RalphNeglectingKidsText
	buttonsound
	end

.Anthony:
	farwritetext AnthonyAteBerriesText
	buttonsound
	end

.Todd:
	farwritetext ToddLooksCuteLikeMeText
	buttonsound
	end

.Arnie:
	farwritetext ArnieLovesTheCuteText
	buttonsound
	end

.Alan:
	farwritetext AlanGettingStrongerText
	buttonsound
	end

.Chad:
	farwritetext ChadObservingWildText
	buttonsound
	end

.Derek:
	farwritetext DerekCheekPincherText
	buttonsound
	end

.Tully:
	farwritetext TullyGrownText
	buttonsound
	end

.Brent:
	farwritetext BrentRareTradeText
	buttonsound
	end

.Vance:
	farwritetext VanceLiftoffText
	buttonsound
	end

.Wilton:
	farwritetext WiltonGrownText
	buttonsound
	end

.Parry:
	farwritetext ParryNoMatchText
	buttonsound
	end

Phone_WhosBragging_Female:
	readvar VAR_CALLERID
	ifequal PHONE_POKEFAN_BEVERLY, .Beverly
	ifequal PHONE_COOLTRAINERF_BETH, .Beth
	ifequal PHONE_COOLTRAINERF_REENA, .Reena
	ifequal PHONE_PICNICKER_LIZ, .Liz
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_LASS_DANA, .Dana
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
	ifequal PHONE_PICNICKER_ERIN, .Erin

.Beverly:
	farwritetext BeverlyCuterText
	buttonsound
	end

.Beth:
	farwritetext BethHorsebackText
	buttonsound
	end

.Reena:
	farwritetext ReenaPerfectText
	buttonsound
	end

.Liz:
	farwritetext LizNuzzleText
	buttonsound
	end

.Gina:
	farwritetext GinaSyncText
	buttonsound
	end

.Dana:
	farwritetext DanaPhotosText
	buttonsound
	end

.Tiffany:
	farwritetext TiffanyAdorableText
	buttonsound
	end

.Erin:
	farwritetext ErinStrongerText
	buttonsound
	end

Phone_WhoDefeatedMon_Male:
	readvar VAR_CALLERID
	ifequal PHONE_SCHOOLBOY_JACK, .Jack
	ifequal PHONE_COOLTRAINERM_GAVEN, .Gaven
	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
	ifequal PHONE_YOUNGSTER_JOEY, .Joey
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_HIKER_ANTHONY, .Anthony
	ifequal PHONE_CAMPER_TODD, .Todd
	ifequal PHONE_BUG_CATCHER_ARNIE, .Arnie
	ifequal PHONE_SCHOOLBOY_ALAN, .Alan
	ifequal PHONE_SCHOOLBOY_CHAD, .Chad
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully
	ifequal PHONE_POKEMANIAC_BRENT, .Brent
	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
	ifequal PHONE_FISHER_WILTON, .Wilton
	ifequal PHONE_HIKER_PARRY, .Parry

.Jack:
	farwritetext JackDefeatedMonText
	buttonsound
	end

.Gaven:
	farwritetext GavenBarelyDefeatText
	buttonsound
	end

.Jose:
	farwritetext JoseStickText
	buttonsound
	end

.Joey:
	farwritetext JoeyToughText
	buttonsound
	end

.Wade:
	farwritetext WadeOneHitText
	buttonsound
	end

.Ralph:
	farwritetext RalphWildWinText
	buttonsound
	end

.Anthony:
	farwritetext AnthonyLotsaWildText
	buttonsound
	end

.Todd:
	farwritetext ToddKOdText
	buttonsound
	end

.Arnie:
	farwritetext ArnieChangeTopicText
	buttonsound
	end

.Alan:
	farwritetext AlanAdvancedStudyText
	buttonsound
	end

.Chad:
	farwritetext ChadInevitableText
	buttonsound
	end

.Derek:
	farwritetext DerekGreatPikaText
	buttonsound
	end

.Tully:
	farwritetext TullyKOdText
	buttonsound
	end

.Brent:
	farwritetext BrentRareCatchText
	buttonsound
	end

.Vance:
	farwritetext VanceEasyBeatText
	buttonsound
	end

.Wilton:
	farwritetext WiltonFunFishingText
	buttonsound
	end

.Parry:
	farwritetext ParryWildBirdText
	buttonsound
	end

Phone_WhoDefeatedMon_Female:
	readvar VAR_CALLERID
	ifequal PHONE_POKEFAN_BEVERLY, .Beverly
	ifequal PHONE_COOLTRAINERF_BETH, .Beth
	ifequal PHONE_COOLTRAINERF_REENA, .Reena
	ifequal PHONE_PICNICKER_LIZ, .Liz
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_LASS_DANA, .Dana
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
	ifequal PHONE_PICNICKER_ERIN, .Erin

.Beverly:
	farwritetext BeverlyCuteSnubbullText
	buttonsound
	end

.Beth:
	farwritetext BethShockedWinText
	buttonsound
	end

.Reena:
	farwritetext ReenaWildWinText
	buttonsound
	end

.Liz:
	farwritetext LizOneHitText
	buttonsound
	end

.Gina:
	farwritetext GinaGrooveText
	buttonsound
	end

.Dana:
	farwritetext DanaInstantKOText
	buttonsound
	end

.Tiffany:
	farwritetext TiffanyWildWinText
	buttonsound
	end

.Erin:
	farwritetext ErinProperRaisingText
	buttonsound
	end

Phone_WhoLostAMon_Male:
	readvar VAR_CALLERID
	ifequal PHONE_SCHOOLBOY_JACK, .Jack
	ifequal PHONE_COOLTRAINERM_GAVEN, .Gaven
	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
	ifequal PHONE_YOUNGSTER_JOEY, .Joey
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_HIKER_ANTHONY, .Anthony
	ifequal PHONE_CAMPER_TODD, .Todd
	ifequal PHONE_BUG_CATCHER_ARNIE, .Arnie
	ifequal PHONE_SCHOOLBOY_ALAN, .Alan
	ifequal PHONE_SCHOOLBOY_CHAD, .Chad
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully
	ifequal PHONE_POKEMANIAC_BRENT, .Brent
	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
	ifequal PHONE_FISHER_WILTON, .Wilton
	ifequal PHONE_HIKER_PARRY, .Parry

.Jack:
	farwritetext JackMissedText
	buttonsound
	end

.Gaven:
	farwritetext GavenMissedCatchText
	buttonsound
	end

.Jose:
	farwritetext JoseLostAMonText
	buttonsound
	end

.Joey:
	farwritetext JoeyLostAMonText
	buttonsound
	end

.Wade:
	farwritetext WadeRunAwayText
	buttonsound
	end

.Ralph:
	farwritetext RalphWildLossText
	buttonsound
	end

.Anthony:
	farwritetext AnthonyLostAMonText
	buttonsound
	end

.Todd:
	farwritetext ToddWildLossText
	buttonsound
	end

.Arnie:
	farwritetext ArnieLostAMonText
	buttonsound
	end

.Alan:
	farwritetext AlanLostAMonText
	buttonsound
	end

.Chad:
	farwritetext ChadLostAMonText
	buttonsound
	end

.Derek:
	farwritetext DerekLostAMonText
	buttonsound
	end

.Tully:
	farwritetext TullyLostWildText
	buttonsound
	end

.Brent:
	farwritetext BrentLostAMonText
	buttonsound
	end

.Vance:
	farwritetext VanceFlyAfterText
	buttonsound
	end

.Wilton:
	farwritetext WiltonLandWildText
	buttonsound
	end

.Parry:
	farwritetext ParryLostAMonText
	buttonsound
	end

Phone_WhoLostAMon_Female:
	readvar VAR_CALLERID
	ifequal PHONE_POKEFAN_BEVERLY, .Beverly
	ifequal PHONE_COOLTRAINERF_BETH, .Beth
	ifequal PHONE_COOLTRAINERF_REENA, .Reena
	ifequal PHONE_PICNICKER_LIZ, .Liz
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_LASS_DANA, .Dana
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
	ifequal PHONE_PICNICKER_ERIN, .Erin

.Beverly:
	farwritetext BeverlyLostAMonText
	buttonsound
	end

.Beth:
	farwritetext BethLostAMonText
	buttonsound
	end

.Reena:
	farwritetext ReenaWildLossText
	buttonsound
	end

.Liz:
	farwritetext LizLostAMonText
	buttonsound
	end

.Gina:
	farwritetext GinaLostAMonText
	buttonsound
	end

.Dana:
	farwritetext DanaLostAMonText
	buttonsound
	end

.Tiffany:
	farwritetext TiffanyWildLossText
	buttonsound
	end

.Erin:
	farwritetext ErinLostAMonText
	buttonsound
	end

PhoneScript_WantsToBattle_Male:
	farscall PhoneScript_RematchText_Male
	farsjump PhoneScript_HangupText_Male

PhoneScript_WantsToBattle_Female:
	farscall PhoneScript_RematchText_Female
	farsjump PhoneScript_HangupText_Female

PhoneScript_RematchText_Male:
	readvar VAR_CALLERID
	ifequal PHONE_SCHOOLBOY_JACK, .Jack
	ifequal PHONE_SAILOR_HUEY, .Huey
	ifequal PHONE_COOLTRAINERM_GAVEN, .Gaven
	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
	ifequal PHONE_YOUNGSTER_JOEY, .Joey
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_HIKER_ANTHONY, .Anthony
	ifequal PHONE_CAMPER_TODD, .Todd
	ifequal PHONE_BUG_CATCHER_ARNIE, .Arnie
	ifequal PHONE_SCHOOLBOY_ALAN, .Alan
	ifequal PHONE_SCHOOLBOY_CHAD, .Chad
	ifequal PHONE_FISHER_TULLY, .Tully
	ifequal PHONE_POKEMANIAC_BRENT, .Brent
	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
	ifequal PHONE_FISHER_WILTON, .Wilton
	ifequal PHONE_HIKER_PARRY, .Parry

.Jack:
	farwritetext JackBattleRematchText
	buttonsound
	end

.Huey:
	farwritetext HueyBattleRematchText
	buttonsound
	end

.Gaven:
	farwritetext GavenBattleRematchText
	buttonsound
	end

.Jose:
	farwritetext JoseBattleRematchText
	buttonsound
	end

.Joey:
	farwritetext JoeyBattleRematchText
	buttonsound
	end

.Wade:
	farwritetext WadeAnotherBattleText
	buttonsound
	end

.Ralph:
	farwritetext RalphAskBattleText
	buttonsound
	end

.Anthony:
	farwritetext AnthonyBattleRematchText
	buttonsound
	end

.Todd:
	farwritetext ToddAskBattleText
	buttonsound
	end

.Arnie:
	farwritetext ArnieBattleRematchText
	buttonsound
	end

.Alan:
	farwritetext AlanBattleRematchText
	buttonsound
	end

.Chad:
	farwritetext ChadBattleRematchText
	buttonsound
	end

.Tully:
	farwritetext TullyAskBattleText
	buttonsound
	end

.Brent:
	farwritetext BrentBattleRematchText
	buttonsound
	end

.Vance:
	farwritetext VanceAskBattleText
	buttonsound
	end

.Wilton:
	farwritetext WiltonWhileTimeText
	buttonsound
	end

.Parry:
	farwritetext ParryBattleRematchText
	buttonsound
	end

PhoneScript_RematchText_Female:
	readvar VAR_CALLERID
	ifequal PHONE_COOLTRAINERF_BETH, .Beth
	ifequal PHONE_COOLTRAINERF_REENA, .Reena
	ifequal PHONE_PICNICKER_LIZ, .Liz
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_LASS_DANA, .Dana
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
	ifequal PHONE_PICNICKER_ERIN, .Erin

.Beth:
	farwritetext BethBattleRematchText
	buttonsound
	end

.Reena:
	farwritetext ReenaAskBattleText
	buttonsound
	end

.Liz:
	farwritetext LizBattleRematchText
	buttonsound
	end

.Gina:
	farwritetext GinaBattleRematchText
	buttonsound
	end

.Dana:
	farwritetext DanaBattleRematchText
	buttonsound
	end

.Tiffany:
	farwritetext TiffanyAskBattleText
	buttonsound
	end

.Erin:
	farwritetext ErinBattleRematchText
	buttonsound
	end

LizWrongNumberScript:
	farwritetext LizHiTaniaText
	end

TiffanyItsAwful:
	farwritetext TiffanyItsAwfulText
	end

PhoneScript_HangupText_Male:
	readvar VAR_CALLERID
	ifequal PHONE_SCHOOLBOY_JACK, .Jack
	ifequal PHONE_SAILOR_HUEY, .Huey
	ifequal PHONE_COOLTRAINERM_GAVEN, .Gaven
	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
	ifequal PHONE_YOUNGSTER_JOEY, .Joey
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_HIKER_ANTHONY, .Anthony
	ifequal PHONE_CAMPER_TODD, .Todd
	ifequal PHONE_JUGGLER_IRWIN, .Irwin
	ifequal PHONE_BUG_CATCHER_ARNIE, .Arnie
	ifequal PHONE_SCHOOLBOY_ALAN, .Alan
	ifequal PHONE_SCHOOLBOY_CHAD, .Chad
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully
	ifequal PHONE_POKEMANIAC_BRENT, .Brent
	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
	ifequal PHONE_FISHER_WILTON, .Wilton
	ifequal PHONE_BLACKBELT_KENJI, .Kenji
	ifequal PHONE_HIKER_PARRY, .Parry

.Jack:
	farwritetext JackLaterText
	end

.Huey:
	farwritetext HueySeeyaText
	end

.Gaven:
	farwritetext GavenHangupText
	end

.Jose:
	farwritetext JoseSeeyaText
	end

.Joey:
	farwritetext JoeyLaterText
	end

.Wade:
	farwritetext WadeLaterText
	end

.Ralph:
	farwritetext RalphLaterText
	end

.Anthony:
	farwritetext AnthonyLaterText
	end

.Todd:
	farwritetext ToddLaterText
	end

.Irwin:
	farwritetext IrwinHangupText
	end

.Arnie:
	farwritetext ArnieLaterText
	end

.Alan:
	farwritetext AlanLaterText
	end

.Chad:
	farwritetext ChadLaterText
	end

.Derek:
	farwritetext DerekLaterText
	end

.Tully:
	farwritetext TullyLaterText
	end

.Brent:
	farwritetext BrentLaterText
	end

.Vance:
	farwritetext VanceLaterText
	end

.Wilton:
	farwritetext WiltonLaterText
	end

.Kenji:
	farwritetext KenjiLaterText
	end

.Parry:
	farwritetext ParryLaterText
	end

PhoneScript_HangupText_Female:
	readvar VAR_CALLERID
	ifequal PHONE_POKEFAN_BEVERLY, .Beverly
	ifequal PHONE_COOLTRAINERF_BETH, .Beth
	ifequal PHONE_COOLTRAINERF_REENA, .Reena
	ifequal PHONE_PICNICKER_LIZ, .Liz
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_LASS_DANA, .Dana
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
	ifequal PHONE_PICNICKER_ERIN, .Erin

.Beverly:
	farwritetext BeverlyLaterText
	end

.Beth:
	farwritetext BethLaterText
	end

.Reena:
	farwritetext ReenaLaterText
	end

.Liz:
	farwritetext LizLaterText
	end

.Gina:
	farwritetext GinaLaterText
	end

.Dana:
	farwritetext DanaLaterText
	end

.Tiffany:
	farwritetext TiffanyLaterText
	end

.Erin:
	farwritetext ErinLaterText
	end

Phone_CheckIfUnseenRare_Male:
	scall PhoneScriptRareWildMon
	iffalse .HangUp
	farsjump Phone_GenericCall_Male

.HangUp:
	farsjump PhoneScript_HangupText_Male

Phone_CheckIfUnseenRare_Female:
	scall PhoneScriptRareWildMon
	iffalse .HangUp
	farsjump Phone_GenericCall_Female

.HangUp:
	farsjump PhoneScript_HangupText_Female

PhoneScriptRareWildMon:
	special RandomUnseenWildMon
	end

PhoneScript_BugCatchingContest:
	readvar VAR_CALLERID
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_POKEFANM_DEREK, .Derek

.Wade:
	farwritetext WadeBugCatchingContestText
	buttonsound
	sjump PhoneScript_HangupText_Male

.Derek:
	farwritetext DerekBugCatchingContestText
	buttonsound
	sjump PhoneScript_HangupText_Male

IrwinRocketRumorScript:
	farwritetext IrwinRocketRumorText
	buttonsound
	sjump PhoneScript_HangupText_Male

GinaRocketRumorScript:
	farwritetext GinaRocketRumorText
	buttonsound
	sjump PhoneScript_HangupText_Female

ArnieSwarmScript:
	farwritetext ArnieSwarmText
	buttonsound
	sjump PhoneScript_HangupText_Male

RalphItemScript:
	farwritetext RalphItemText
	buttonsound
	sjump PhoneScript_HangupText_Male

AnthonySwarmScript:
	farwritetext AnthonySwarmText
	buttonsound
	sjump PhoneScript_HangupText_Male

PhoneScript_FoundItem_Male:
	readvar VAR_CALLERID
	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_SCHOOLBOY_ALAN, .Alan
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully
	ifequal PHONE_FISHER_WILTON, .Wilton

.Jose:
	farwritetext JoseFoundSomethingText
	end

.Wade:
	farwritetext WadeFoundBerryText
	end

.Alan:
	farwritetext AlanFoundItemText
	end

.Derek:
	farwritetext DerekFoundItemText
	end

.Tully:
	farwritetext TullyItemText
	end

.Wilton:
	farwritetext WiltonItemFishingText
	end

PhoneScript_FoundItem_Female:
	readvar VAR_CALLERID
	ifequal PHONE_POKEFAN_BEVERLY, .Beverly
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_LASS_DANA, .Dana
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany

.Beverly:
	farwritetext BeverlyFoundNuggetText
	end

.Gina:
	farwritetext GinaFoundItemText
	end

.Dana:
	farwritetext DanaFoundItemText
	end

.Tiffany:
	farwritetext TiffanyItemText
	end

ToddItemScript:
	farwritetext ToddItemText
	buttonsound
	sjump PhoneScript_HangupText_Male

KenjiCallingPhoneScript:
	farwritetext KenjiCallingPhoneText
	buttonsound
	sjump PhoneScript_HangupText_Male
