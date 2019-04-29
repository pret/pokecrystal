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
	farwritetext UnknownText_0x174688
	buttonsound
	end

.Beth:
	farwritetext UnknownText_0x174c7f
	buttonsound
	end

.Reena:
	farwritetext UnknownText_0x1752f5
	buttonsound
	end

.Liz:
	farwritetext UnknownText_0x175fda
	buttonsound
	end

.Gina:
	farwritetext UnknownText_0x1771fd
	buttonsound
	end

.Dana:
	farwritetext UnknownText_0x64f74
	buttonsound
	end

.Tiffany:
	farwritetext UnknownText_0x665ad
	buttonsound
	end

.Erin:
	farwritetext UnknownText_0x6717a
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
	farwritetext UnknownText_0x174a80
	buttonsound
	end

.Jose:
	farwritetext UnknownText_0x174f90
	buttonsound
	end

.Joey:
	farwritetext UnknownText_0x175591
	buttonsound
	end

.Wade:
	farwritetext UnknownText_0x175869
	buttonsound
	end

.Ralph:
	farwritetext UnknownText_0x175c24
	buttonsound
	end

.Anthony:
	farwritetext UnknownText_0x176aef
	buttonsound
	end

.Todd:
	farwritetext UnknownText_0x176e9c
	buttonsound
	end

.Arnie:
	farwritetext UnknownText_0x64a13
	buttonsound
	end

.Alan:
	farwritetext UnknownText_0x64cf3
	buttonsound
	end

.Chad:
	farwritetext UnknownText_0x65318
	buttonsound
	end

.Derek:
	farwritetext UnknownText_0x65b29
	buttonsound
	end

.Tully:
	farwritetext UnknownText_0x65e42
	buttonsound
	end

.Brent:
	farwritetext UnknownText_0x6613c
	buttonsound
	end

.Vance:
	farwritetext UnknownText_0x669b2
	buttonsound
	end

.Wilton:
	farwritetext UnknownText_0x66b3e
	buttonsound
	end

.Parry:
	farwritetext UnknownText_0x66fc0
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
	farwritetext UnknownText_0x1746c3
	buttonsound
	end

.Beth:
	farwritetext UnknownText_0x174cf6
	buttonsound
	end

.Reena:
	farwritetext UnknownText_0x17536b
	buttonsound
	end

.Liz:
	farwritetext UnknownText_0x17602d
	buttonsound
	end

.Gina:
	farwritetext UnknownText_0x177237
	buttonsound
	end

.Dana:
	farwritetext UnknownText_0x64fb2
	buttonsound
	end

.Tiffany:
	farwritetext UnknownText_0x66605
	buttonsound
	end

.Erin:
	farwritetext UnknownText_0x671a4
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
	farwritetext UnknownText_0x174165
	buttonsound
	end

.Gaven:
	farwritetext UnknownText_0x174b2d
	buttonsound
	end

.Jose:
	farwritetext UnknownText_0x174ffd
	buttonsound
	end

.Joey:
	farwritetext UnknownText_0x175611
	buttonsound
	end

.Wade:
	farwritetext UnknownText_0x1758e4
	buttonsound
	end

.Ralph:
	farwritetext UnknownText_0x175c9f
	buttonsound
	end

.Anthony:
	farwritetext UnknownText_0x176b45
	buttonsound
	end

.Todd:
	farwritetext UnknownText_0x176eee
	buttonsound
	end

.Arnie:
	farwritetext UnknownText_0x64a71
	buttonsound
	end

.Alan:
	farwritetext UnknownText_0x64d4f
	buttonsound
	end

.Chad:
	farwritetext UnknownText_0x65399
	buttonsound
	end

.Derek:
	farwritetext UnknownText_0x65bc8
	buttonsound
	end

.Tully:
	farwritetext UnknownText_0x65eac
	buttonsound
	end

.Brent:
	farwritetext UnknownText_0x6618c
	buttonsound
	end

.Vance:
	farwritetext UnknownText_0x669ed
	buttonsound
	end

.Wilton:
	farwritetext UnknownText_0x66b8f
	buttonsound
	end

.Parry:
	farwritetext UnknownText_0x67001
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
	farwritetext UnknownText_0x174734
	buttonsound
	end

.Beth:
	farwritetext UnknownText_0x174d86
	buttonsound
	end

.Reena:
	farwritetext UnknownText_0x1753c5
	buttonsound
	end

.Liz:
	farwritetext UnknownText_0x176095
	buttonsound
	end

.Gina:
	farwritetext UnknownText_0x177297
	buttonsound
	end

.Dana:
	farwritetext UnknownText_0x6501c
	buttonsound
	end

.Tiffany:
	farwritetext UnknownText_0x66688
	buttonsound
	end

.Erin:
	farwritetext UnknownText_0x671eb
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
	farwritetext UnknownText_0x1741e1
	buttonsound
	end

.Huey:
	farwritetext UnknownText_0x1748ea
	buttonsound
	end

.Gaven:
	farwritetext UnknownText_0x174bc5
	buttonsound
	end

.Jose:
	farwritetext UnknownText_0x17507d
	buttonsound
	end

.Joey:
	farwritetext UnknownText_0x175693
	buttonsound
	end

.Wade:
	farwritetext UnknownText_0x175976
	buttonsound
	end

.Ralph:
	farwritetext UnknownText_0x175d40
	buttonsound
	end

.Anthony:
	farwritetext UnknownText_0x176bee
	buttonsound
	end

.Todd:
	farwritetext UnknownText_0x176f60
	buttonsound
	end

.Arnie:
	farwritetext UnknownText_0x64ada
	buttonsound
	end

.Alan:
	farwritetext UnknownText_0x64da4
	buttonsound
	end

.Chad:
	farwritetext UnknownText_0x65419
	buttonsound
	end

.Tully:
	farwritetext UnknownText_0x65f17
	buttonsound
	end

.Brent:
	farwritetext UnknownText_0x66214
	buttonsound
	end

.Vance:
	farwritetext UnknownText_0x66a3a
	buttonsound
	end

.Wilton:
	farwritetext UnknownText_0x66bf3
	buttonsound
	end

.Parry:
	farwritetext UnknownText_0x67096
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
	farwritetext UnknownText_0x174e4e
	buttonsound
	end

.Reena:
	farwritetext UnknownText_0x17543a
	buttonsound
	end

.Liz:
	farwritetext UnknownText_0x17610a
	buttonsound
	end

.Gina:
	farwritetext UnknownText_0x1772e2
	buttonsound
	end

.Dana:
	farwritetext UnknownText_0x65091
	buttonsound
	end

.Tiffany:
	farwritetext UnknownText_0x66730
	buttonsound
	end

.Erin:
	farwritetext UnknownText_0x6722e
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
	farwritetext UnknownText_0x174251
	end

.Huey:
	farwritetext UnknownText_0x174962
	end

.Gaven:
	farwritetext UnknownText_0x174c0e
	end

.Jose:
	farwritetext UnknownText_0x175106
	end

.Joey:
	farwritetext UnknownText_0x17570a
	end

.Wade:
	farwritetext UnknownText_0x1759e7
	end

.Ralph:
	farwritetext UnknownText_0x175db7
	end

.Anthony:
	farwritetext UnknownText_0x176c47
	end

.Todd:
	farwritetext UnknownText_0x176fdb
	end

.Irwin:
	farwritetext UnknownText_0x64000
	end

.Arnie:
	farwritetext UnknownText_0x64b48
	end

.Alan:
	farwritetext UnknownText_0x64e1f
	end

.Chad:
	farwritetext UnknownText_0x65471
	end

.Derek:
	farwritetext UnknownText_0x65c4e
	end

.Tully:
	farwritetext UnknownText_0x65f6e
	end

.Brent:
	farwritetext UnknownText_0x662a9
	end

.Vance:
	farwritetext UnknownText_0x66a93
	end

.Wilton:
	farwritetext UnknownText_0x66c58
	end

.Kenji:
	farwritetext UnknownText_0x66dab
	end

.Parry:
	farwritetext UnknownText_0x670eb
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
	farwritetext UnknownText_0x1747ac
	end

.Beth:
	farwritetext UnknownText_0x174eb7
	end

.Reena:
	farwritetext UnknownText_0x175488
	end

.Liz:
	farwritetext UnknownText_0x17620a
	end

.Gina:
	farwritetext UnknownText_0x177361
	end

.Dana:
	farwritetext UnknownText_0x650e2
	end

.Tiffany:
	farwritetext UnknownText_0x667f7
	end

.Erin:
	farwritetext UnknownText_0x67281
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

IrwinRocketRumor:
	farwritetext UnknownText_0x64032
	buttonsound
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa05c6:
	farwritetext UnknownText_0x177378
	buttonsound
	sjump PhoneScript_HangupText_Female

UnknownScript_0xa05ce:
	farwritetext UnknownText_0x64b5f
	buttonsound
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa05d6:
	farwritetext UnknownText_0x175dd9
	buttonsound
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa05de:
	farwritetext UnknownText_0x176c61
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
	farwritetext UnknownText_0x64e2f
	end

.Derek:
	farwritetext UnknownText_0x65cf9
	end

.Tully:
	farwritetext UnknownText_0x65f88
	end

.Wilton:
	farwritetext UnknownText_0x66c6b
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
	farwritetext UnknownText_0x1773e7
	end

.Dana:
	farwritetext UnknownText_0x650ec
	end

.Tiffany:
	farwritetext UnknownText_0x66801
	end

UnknownScript_0xa0644:
	farwritetext UnknownText_0x176feb
	buttonsound
	sjump PhoneScript_HangupText_Male

KenjiCallingPhoneScript:
	farwritetext UnknownText_0x66dc5
	buttonsound
	sjump PhoneScript_HangupText_Male
