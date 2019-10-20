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
	farsjump PhoneScript_HangUpText_Male

.GotAway:
	farsjump Phone_GotAwayCall_Male

Phone_FoundAMon_Female:
	special RandomPhoneWildMon
	farscall PhoneScript_Random2
	ifequal 0, .GotAway
	farscall Phone_WhoDefeatedMon_Female
	farsjump PhoneScript_HangUpText_Female

.GotAway:
	farsjump Phone_GotAwayCall_Female

Phone_GotAwayCall_Male:
	farscall Phone_WhoLostAMon_Male
	farsjump PhoneScript_HangUpText_Male

Phone_GotAwayCall_Female:
	farscall Phone_WhoLostAMon_Female
	farsjump PhoneScript_HangUpText_Female

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
	farwritetext JackIntelligenceKeepsRisingText
	buttonsound
	end

.Gaven:
	farwritetext GavenMonGreaterThanImaginedText
	buttonsound
	end

.Jose:
	farwritetext JoseMonsStickHasADeliciousAromaText
	buttonsound
	end

.Joey:
	farwritetext JoeyMonLookingSharperText
	buttonsound
	end

.Wade:
	farwritetext WadeAreYourMonGrowingText
	buttonsound
	end

.Ralph:
	farwritetext RalphNeglectingKidsText
	buttonsound
	end

.Anthony:
	farwritetext AnthonyMonAteSomeBerriesText
	buttonsound
	end

.Todd:
	farwritetext ToddLooksCuteLikeMeText
	buttonsound
	end

.Arnie:
	farwritetext ArnieMonIsSoCuteText
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
	farwritetext DerekCheekPinchingText
	buttonsound
	end

.Tully:
	farwritetext TullyMonHasGrownText
	buttonsound
	end

.Brent:
	farwritetext BrentRareTradeText
	buttonsound
	end

.Vance:
	farwritetext VanceMonHasBecomeTougherText
	buttonsound
	end

.Wilton:
	farwritetext WiltonMonHasGrownText
	buttonsound
	end

.Parry:
	farwritetext ParryNothingCanMatchText
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
	farwritetext BeverlyMadeMonEvenCuterText
	buttonsound
	end

.Beth:
	farwritetext BethExhilaratingRideText
	buttonsound
	end

.Reena:
	farwritetext ReenaMonsIsAPerfectMatchText
	buttonsound
	end

.Liz:
	farwritetext LizMonAlwaysWantsToNuzzleText
	buttonsound
	end

.Gina:
	farwritetext GinaGettingInSyncWithMonText
	buttonsound
	end

.Dana:
	farwritetext DanaTakingPhotosText
	buttonsound
	end

.Tiffany:
	farwritetext TiffanyMonIsAdorableText
	buttonsound
	end

.Erin:
	farwritetext ErinMonIsMuchStrongerText
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
	farwritetext GavenDefeatedMonText
	buttonsound
	end

.Jose:
	farwritetext JoseDefeatedMonText
	buttonsound
	end

.Joey:
	farwritetext JoeyDefeatedMonText
	buttonsound
	end

.Wade:
	farwritetext WadeDefeatedMonText
	buttonsound
	end

.Ralph:
	farwritetext RalphDefeatedMonText
	buttonsound
	end

.Anthony:
	farwritetext AnthonyDefeatedMonText
	buttonsound
	end

.Todd:
	farwritetext ToddDefeatedMonText
	buttonsound
	end

.Arnie:
	farwritetext ArnieDefeatedMonText
	buttonsound
	end

.Alan:
	farwritetext AlanDefeatedMonText
	buttonsound
	end

.Chad:
	farwritetext ChadDefeatedMonText
	buttonsound
	end

.Derek:
	farwritetext DerekDefeatedMonText
	buttonsound
	end

.Tully:
	farwritetext TullyDefeatedMonText
	buttonsound
	end

.Brent:
	farwritetext BrentDefeatedMonText
	buttonsound
	end

.Vance:
	farwritetext VanceDefeatedMonText
	buttonsound
	end

.Wilton:
	farwritetext WiltonDefeatedMonText
	buttonsound
	end

.Parry:
	farwritetext ParryDefeatedMonText
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
	farwritetext BeverlyDefeatedMonText
	buttonsound
	end

.Beth:
	farwritetext BethDefeatedMonText
	buttonsound
	end

.Reena:
	farwritetext ReenaDefeatedMonText
	buttonsound
	end

.Liz:
	farwritetext LizDefeatedMonText
	buttonsound
	end

.Gina:
	farwritetext GinaDefeatedMonText
	buttonsound
	end

.Dana:
	farwritetext DanaDefeatedMonText
	buttonsound
	end

.Tiffany:
	farwritetext TiffanyDefeatedMonText
	buttonsound
	end

.Erin:
	farwritetext ErinDefeatedMonText
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
	farwritetext JackLostAMonText
	buttonsound
	end

.Gaven:
	farwritetext GavenLostAMonText
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
	farwritetext WadeLostAMonText
	buttonsound
	end

.Ralph:
	farwritetext RalphLostAMonText
	buttonsound
	end

.Anthony:
	farwritetext AnthonyLostAMonText
	buttonsound
	end

.Todd:
	farwritetext ToddLostAMonText
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
	farwritetext TullyLostAMonText
	buttonsound
	end

.Brent:
	farwritetext BrentLostAMonText
	buttonsound
	end

.Vance:
	farwritetext VanceLostAMonText
	buttonsound
	end

.Wilton:
	farwritetext WiltonLostAMonText
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
	farwritetext ReenaLostAMonText
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
	farwritetext TiffanyLostAMonText
	buttonsound
	end

.Erin:
	farwritetext ErinLostAMonText
	buttonsound
	end

PhoneScript_WantsToBattle_Male:
	farscall PhoneScript_RematchText_Male
	farsjump PhoneScript_HangUpText_Male

PhoneScript_WantsToBattle_Female:
	farscall PhoneScript_RematchText_Female
	farsjump PhoneScript_HangUpText_Female

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
	farwritetext WadeBattleRematchText
	buttonsound
	end

.Ralph:
	farwritetext RalphBattleRematchText
	buttonsound
	end

.Anthony:
	farwritetext AnthonyBattleRematchText
	buttonsound
	end

.Todd:
	farwritetext ToddBattleRematchText
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
	farwritetext TullyBattleRematchText
	buttonsound
	end

.Brent:
	farwritetext BrentBattleRematchText
	buttonsound
	end

.Vance:
	farwritetext VanceBattleRematchText
	buttonsound
	end

.Wilton:
	farwritetext WiltonBattleRematchText
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
	farwritetext ReenaBattleRematchText
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
	farwritetext TiffanyBattleRematchText
	buttonsound
	end

.Erin:
	farwritetext ErinBattleRematchText
	buttonsound
	end

LizWrongNumberScript:
	farwritetext LizWrongNumberText
	end

TiffanyItsAwful:
	farwritetext TiffanyItsAwfulText
	end

PhoneScript_HangUpText_Male:
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
	farwritetext JackHangUpText
	end

.Huey:
	farwritetext HueyHangUpText
	end

.Gaven:
	farwritetext GavenHangUpText
	end

.Jose:
	farwritetext JoseHangUpText
	end

.Joey:
	farwritetext JoeyHangUpText
	end

.Wade:
	farwritetext WadeHangUpText
	end

.Ralph:
	farwritetext RalphHangUpText
	end

.Anthony:
	farwritetext AnthonyHangUpText
	end

.Todd:
	farwritetext ToddHangUpText
	end

.Irwin:
	farwritetext IrwinHangUpText
	end

.Arnie:
	farwritetext ArnieHangUpText
	end

.Alan:
	farwritetext AlanHangUpText
	end

.Chad:
	farwritetext ChadHangUpText
	end

.Derek:
	farwritetext DerekHangUpText
	end

.Tully:
	farwritetext TullyHangUpText
	end

.Brent:
	farwritetext BrentHangUpText
	end

.Vance:
	farwritetext VanceHangUpText
	end

.Wilton:
	farwritetext WiltonHangUpText
	end

.Kenji:
	farwritetext KenjiHangUpText
	end

.Parry:
	farwritetext ParryHangUpText
	end

PhoneScript_HangUpText_Female:
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
	farwritetext BeverlyHangUpText
	end

.Beth:
	farwritetext BethHangUpText
	end

.Reena:
	farwritetext ReenaHangUpText
	end

.Liz:
	farwritetext LizHangUpText
	end

.Gina:
	farwritetext GinaHangUpText
	end

.Dana:
	farwritetext DanaHangUpText
	end

.Tiffany:
	farwritetext TiffanyHangUpText
	end

.Erin:
	farwritetext ErinHangUpText
	end

Phone_CheckIfUnseenRare_Male:
	scall PhoneScriptRareWildMon
	iffalse .HangUp
	farsjump Phone_GenericCall_Male

.HangUp:
	farsjump PhoneScript_HangUpText_Male

Phone_CheckIfUnseenRare_Female:
	scall PhoneScriptRareWildMon
	iffalse .HangUp
	farsjump Phone_GenericCall_Female

.HangUp:
	farsjump PhoneScript_HangUpText_Female

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
	sjump PhoneScript_HangUpText_Male

.Derek:
	farwritetext DerekBugCatchingContestText
	buttonsound
	sjump PhoneScript_HangUpText_Male

IrwinRocketRumorScript:
	farwritetext IrwinRocketTakeoverRumorText
	buttonsound
	sjump PhoneScript_HangUpText_Male

GinaRocketRumorScript:
	farwritetext GinaRocketTakeoverRumorText
	buttonsound
	sjump PhoneScript_HangUpText_Female

ArnieSwarmScript:
	farwritetext ArnieSwarmText
	buttonsound
	sjump PhoneScript_HangUpText_Male

RalphItemScript:
	farwritetext RalphItemText
	buttonsound
	sjump PhoneScript_HangUpText_Male

AnthonySwarmScript:
	farwritetext AnthonySwarmText
	buttonsound
	sjump PhoneScript_HangUpText_Male

PhoneScript_FoundItem_Male:
	readvar VAR_CALLERID
	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_SCHOOLBOY_ALAN, .Alan
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully
	ifequal PHONE_FISHER_WILTON, .Wilton

.Jose:
	farwritetext JoseFoundItemText
	end

.Wade:
	farwritetext WadeFoundItemText
	end

.Alan:
	farwritetext AlanFoundItemText
	end

.Derek:
	farwritetext DerekFoundItemText
	end

.Tully:
	farwritetext TullyFoundItemText
	end

.Wilton:
	farwritetext WiltonFoundItemText
	end

PhoneScript_FoundItem_Female:
	readvar VAR_CALLERID
	ifequal PHONE_POKEFAN_BEVERLY, .Beverly
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_LASS_DANA, .Dana
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany

.Beverly:
	farwritetext BeverlyFoundItemText
	end

.Gina:
	farwritetext GinaFoundItemText
	end

.Dana:
	farwritetext DanaFoundItemText
	end

.Tiffany:
	farwritetext TiffanyFoundItemText
	end

ToddItemScript:
	farwritetext ToddDepartmentStoreBargainSaleText
	buttonsound
	sjump PhoneScript_HangUpText_Male

KenjiCallingPhoneScript:
	farwritetext KenjiRemainDedicatedText
	buttonsound
	sjump PhoneScript_HangUpText_Male
