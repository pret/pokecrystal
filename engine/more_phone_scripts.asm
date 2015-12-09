UnknownScript_0xa0000:
	special RandomPhoneMon
	farscall PhoneScript_Random2
	if_equal 0, UnknownScript_0xa0013
	farscall PhoneScript_Generic_Male
	farjump UnknownScript_0xa003e

UnknownScript_0xa0013:
	farjump UnknownScript_0xa002e

UnknownScript_0xa0017:
	special RandomPhoneMon
	farscall PhoneScript_Random2
	if_equal 0, UnknownScript_0xa002a
	farscall PhoneScript_Generic_Female
	farjump UnknownScript_0xa0055

UnknownScript_0xa002a:
	farjump UnknownScript_0xa0036

UnknownScript_0xa002e:
	farscall UnknownScript_0xa007c
	farjump UnknownScript_0xa003e

UnknownScript_0xa0036:
	farscall UnknownScript_0xa0128
	farjump UnknownScript_0xa0055

UnknownScript_0xa003e:
	special RandomPhoneWildMon
	farscall PhoneScript_Random2
	if_equal 0, UnknownScript_0xa0051
	farscall UnknownScript_0xa017a
	farjump PhoneScript_HangupText_Male

UnknownScript_0xa0051:
	farjump UnknownScript_0xa006c

UnknownScript_0xa0055:
	special RandomPhoneWildMon
	farscall PhoneScript_Random2
	if_equal 0, UnknownScript_0xa0068
	farscall UnknownScript_0xa0226
	farjump PhoneScript_HangupText_Female

UnknownScript_0xa0068:
	farjump UnknownScript_0xa0074

UnknownScript_0xa006c:
	farscall UnknownScript_0xa0278
	farjump PhoneScript_HangupText_Male

UnknownScript_0xa0074:
	farscall UnknownScript_0xa0324
	farjump PhoneScript_HangupText_Female

UnknownScript_0xa007c:
	checkcode VAR_CALLERID
	if_equal PHONE_SCHOOLBOY_JACK, .Jack
	if_equal PHONE_COOLTRAINERM_GAVEN, .Gaven
	if_equal PHONE_BIRDKEEPER_JOSE, .Jose
	if_equal PHONE_YOUNGSTER_JOEY, .Joey
	if_equal PHONE_BUG_CATCHER_WADE, .Wade
	if_equal PHONE_FISHER_RALPH, .Ralph
	if_equal PHONE_HIKER_ANTHONY, .Anthony
	if_equal PHONE_CAMPER_TODD, .Todd
	if_equal PHONE_BUG_CATCHER_ARNIE, .Arnie
	if_equal PHONE_SCHOOLBOY_ALAN, .Alan
	if_equal PHONE_SCHOOLBOY_CHAD, .Chad
	if_equal PHONE_POKEFANM_DEREK, .Derek
	if_equal PHONE_FISHER_TULLY, .Tully
	if_equal PHONE_POKEMANIAC_BRENT, .Brent
	if_equal PHONE_BIRDKEEPER_VANCE, .Vance
	if_equal PHONE_FISHER_WILTON, .Wilton
	if_equal PHONE_HIKER_PARRY, .Parry

.Jack:
	farwritetext UnknownText_0x1740c0
	buttonsound
	end

.Gaven:
	farwritetext UnknownText_0x174a24
	buttonsound
	end

.Jose:
	farwritetext UnknownText_0x174f2f
	buttonsound
	end

.Joey:
	farwritetext UnknownText_0x175530
	buttonsound
	end

.Wade:
	farwritetext UnknownText_0x1757d4
	buttonsound
	end

.Ralph:
	farwritetext UnknownText_0x175bc4
	buttonsound
	end

.Anthony:
	farwritetext UnknownText_0x176a2f
	buttonsound
	end

.Todd:
	farwritetext UnknownText_0x176e5d
	buttonsound
	end

.Arnie:
	farwritetext UnknownText_0x649dc
	buttonsound
	end

.Alan:
	farwritetext UnknownText_0x64cbd
	buttonsound
	end

.Chad:
	farwritetext UnknownText_0x65271
	buttonsound
	end

.Derek:
	farwritetext UnknownText_0x65ab2
	buttonsound
	end

.Tully:
	farwritetext UnknownText_0x65de4
	buttonsound
	end

.Brent:
	farwritetext UnknownText_0x660be
	buttonsound
	end

.Vance:
	farwritetext UnknownText_0x66980
	buttonsound
	end

.Wilton:
	farwritetext UnknownText_0x66afc
	buttonsound
	end

.Parry:
	farwritetext UnknownText_0x66f9f
	buttonsound
	end

UnknownScript_0xa0128:
	checkcode VAR_CALLERID
	if_equal PHONE_POKEFAN_BEVERLY, .Beverly
	if_equal PHONE_COOLTRAINERF_BETH, .Beth
	if_equal PHONE_COOLTRAINERF_REENA, .Reena
	if_equal PHONE_PICNICKER_LIZ, .Liz
	if_equal PHONE_PICNICKER_GINA, .Gina
	if_equal PHONE_LASS_DANA, .Dana
	if_equal PHONE_PICNICKER_TIFFANY, .Tiffany
	if_equal PHONE_PICNICKER_ERIN, .Erin

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

UnknownScript_0xa017a:
	checkcode VAR_CALLERID
	if_equal PHONE_SCHOOLBOY_JACK, .Jack
	if_equal PHONE_COOLTRAINERM_GAVEN, .Gaven
	if_equal PHONE_BIRDKEEPER_JOSE, .Jose
	if_equal PHONE_YOUNGSTER_JOEY, .Joey
	if_equal PHONE_BUG_CATCHER_WADE, .Wade
	if_equal PHONE_FISHER_RALPH, .Ralph
	if_equal PHONE_HIKER_ANTHONY, .Anthony
	if_equal PHONE_CAMPER_TODD, .Todd
	if_equal PHONE_BUG_CATCHER_ARNIE, .Arnie
	if_equal PHONE_SCHOOLBOY_ALAN, .Alan
	if_equal PHONE_SCHOOLBOY_CHAD, .Chad
	if_equal PHONE_POKEFANM_DEREK, .Derek
	if_equal PHONE_FISHER_TULLY, .Tully
	if_equal PHONE_POKEMANIAC_BRENT, .Brent
	if_equal PHONE_BIRDKEEPER_VANCE, .Vance
	if_equal PHONE_FISHER_WILTON, .Wilton
	if_equal PHONE_HIKER_PARRY, .Parry

.Jack:
	farwritetext UnknownText_0x174106
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

UnknownScript_0xa0226:
	checkcode VAR_CALLERID
	if_equal PHONE_POKEFAN_BEVERLY, .Beverly
	if_equal PHONE_COOLTRAINERF_BETH, .Beth
	if_equal PHONE_COOLTRAINERF_REENA, .Reena
	if_equal PHONE_PICNICKER_LIZ, .Liz
	if_equal PHONE_PICNICKER_GINA, .Gina
	if_equal PHONE_LASS_DANA, .Dana
	if_equal PHONE_PICNICKER_TIFFANY, .Tiffany
	if_equal PHONE_PICNICKER_ERIN, .Erin

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

UnknownScript_0xa0278:
	checkcode VAR_CALLERID
	if_equal PHONE_SCHOOLBOY_JACK, .Jack
	if_equal PHONE_COOLTRAINERM_GAVEN, .Gaven
	if_equal PHONE_BIRDKEEPER_JOSE, .Jose
	if_equal PHONE_YOUNGSTER_JOEY, .Joey
	if_equal PHONE_BUG_CATCHER_WADE, .Wade
	if_equal PHONE_FISHER_RALPH, .Ralph
	if_equal PHONE_HIKER_ANTHONY, .Anthony
	if_equal PHONE_CAMPER_TODD, .Todd
	if_equal PHONE_BUG_CATCHER_ARNIE, .Arnie
	if_equal PHONE_SCHOOLBOY_ALAN, .Alan
	if_equal PHONE_SCHOOLBOY_CHAD, .Chad
	if_equal PHONE_POKEFANM_DEREK, .Derek
	if_equal PHONE_FISHER_TULLY, .Tully
	if_equal PHONE_POKEMANIAC_BRENT, .Brent
	if_equal PHONE_BIRDKEEPER_VANCE, .Vance
	if_equal PHONE_FISHER_WILTON, .Wilton
	if_equal PHONE_HIKER_PARRY, .Parry

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

UnknownScript_0xa0324:
	checkcode VAR_CALLERID
	if_equal PHONE_POKEFAN_BEVERLY, .Beverly
	if_equal PHONE_COOLTRAINERF_BETH, .Beth
	if_equal PHONE_COOLTRAINERF_REENA, .Reena
	if_equal PHONE_PICNICKER_LIZ, .Liz
	if_equal PHONE_PICNICKER_GINA, .Gina
	if_equal PHONE_LASS_DANA, .Dana
	if_equal PHONE_PICNICKER_TIFFANY, .Tiffany
	if_equal PHONE_PICNICKER_ERIN, .Erin

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

UnknownScript_0xa0376:
	farscall PhoneScript_RematchText_Male
	farjump PhoneScript_HangupText_Male

UnknownScript_0xa037e:
	farscall PhoneScript_RematchText_Female
	farjump PhoneScript_HangupText_Female

PhoneScript_RematchText_Male:
	checkcode VAR_CALLERID
	if_equal PHONE_SCHOOLBOY_JACK, .Jack
	if_equal PHONE_SAILOR_HUEY, .Huey
	if_equal PHONE_COOLTRAINERM_GAVEN, .Gaven
	if_equal PHONE_BIRDKEEPER_JOSE, .Jose
	if_equal PHONE_YOUNGSTER_JOEY, .Joey
	if_equal PHONE_BUG_CATCHER_WADE, .Wade
	if_equal PHONE_FISHER_RALPH, .Ralph
	if_equal PHONE_HIKER_ANTHONY, .Anthony
	if_equal PHONE_CAMPER_TODD, .Todd
	if_equal PHONE_BUG_CATCHER_ARNIE, .Arnie
	if_equal PHONE_SCHOOLBOY_ALAN, .Alan
	if_equal PHONE_SCHOOLBOY_CHAD, .Chad
	if_equal PHONE_FISHER_TULLY, .Tully
	if_equal PHONE_POKEMANIAC_BRENT, .Brent
	if_equal PHONE_BIRDKEEPER_VANCE, .Vance
	if_equal PHONE_FISHER_WILTON, .Wilton
	if_equal PHONE_HIKER_PARRY, .Parry

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
	checkcode VAR_CALLERID
	if_equal PHONE_COOLTRAINERF_BETH, .Beth
	if_equal PHONE_COOLTRAINERF_REENA, .Reena
	if_equal PHONE_PICNICKER_LIZ, .Liz
	if_equal PHONE_PICNICKER_GINA, .Gina
	if_equal PHONE_LASS_DANA, .Dana
	if_equal PHONE_PICNICKER_TIFFANY, .Tiffany
	if_equal PHONE_PICNICKER_ERIN, .Erin

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

UnknownScript_0xa047a:
	farwritetext UnknownText_0x1761a7
	end

UnknownScript_0xa047f:
	farwritetext UnknownText_0x66796
	end

PhoneScript_HangupText_Male:
	checkcode VAR_CALLERID
	if_equal PHONE_SCHOOLBOY_JACK, .Jack
	if_equal PHONE_SAILOR_HUEY, .Huey
	if_equal PHONE_COOLTRAINERM_GAVEN, .Gaven
	if_equal PHONE_BIRDKEEPER_JOSE, .Jose
	if_equal PHONE_YOUNGSTER_JOEY, .Joey
	if_equal PHONE_BUG_CATCHER_WADE, .Wade
	if_equal PHONE_FISHER_RALPH, .Ralph
	if_equal PHONE_HIKER_ANTHONY, .Anthony
	if_equal PHONE_CAMPER_TODD, .Todd
	if_equal PHONE_JUGGLER_IRWIN, .Irwin
	if_equal PHONE_BUG_CATCHER_ARNIE, .Arnie
	if_equal PHONE_SCHOOLBOY_ALAN, .Alan
	if_equal PHONE_SCHOOLBOY_CHAD, .Chad
	if_equal PHONE_POKEFANM_DEREK, .Derek
	if_equal PHONE_FISHER_TULLY, .Tully
	if_equal PHONE_POKEMANIAC_BRENT, .Brent
	if_equal PHONE_BIRDKEEPER_VANCE, .Vance
	if_equal PHONE_FISHER_WILTON, .Wilton
	if_equal PHONE_BLACKBELT_KENJI, .Kenji
	if_equal PHONE_HIKER_PARRY, .Parry

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
	checkcode VAR_CALLERID
	if_equal PHONE_POKEFAN_BEVERLY, .Beverly
	if_equal PHONE_COOLTRAINERF_BETH, .Beth
	if_equal PHONE_COOLTRAINERF_REENA, .Reena
	if_equal PHONE_PICNICKER_LIZ, .Liz
	if_equal PHONE_PICNICKER_GINA, .Gina
	if_equal PHONE_LASS_DANA, .Dana
	if_equal PHONE_PICNICKER_TIFFANY, .Tiffany
	if_equal PHONE_PICNICKER_ERIN, .Erin

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

UnknownScript_0xa0584:
	scall UnknownScript_0xa05a0
	iffalse UnknownScript_0xa058e
	farjump UnknownScript_0xa0000

UnknownScript_0xa058e:
	farjump PhoneScript_HangupText_Male

UnknownScript_0xa0592:
	scall UnknownScript_0xa05a0
	iffalse UnknownScript_0xa059c
	farjump UnknownScript_0xa0017

UnknownScript_0xa059c:
	farjump PhoneScript_HangupText_Female

UnknownScript_0xa05a0:
	special RandomPhoneRareWildMon
	end

UnknownScript_0xa05a4:
	checkcode VAR_CALLERID
	if_equal PHONE_BUG_CATCHER_WADE, .Wade
	if_equal PHONE_POKEFANM_DEREK, .Derek

.Wade:
	farwritetext UnknownText_0x1759f7
	buttonsound
	jump PhoneScript_HangupText_Male

.Derek:
	farwritetext UnknownText_0x65c66
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa05be:
	farwritetext UnknownText_0x64032
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa05c6:
	farwritetext UnknownText_0x177378
	buttonsound
	jump PhoneScript_HangupText_Female

UnknownScript_0xa05ce:
	farwritetext UnknownText_0x64b5f
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa05d6:
	farwritetext UnknownText_0x175dd9
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa05de:
	farwritetext UnknownText_0x176c61
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa05e6:
	checkcode VAR_CALLERID
	if_equal PHONE_BIRDKEEPER_JOSE, .Jose
	if_equal PHONE_BUG_CATCHER_WADE, .Wade
	if_equal PHONE_SCHOOLBOY_ALAN, .Alan
	if_equal PHONE_POKEFANM_DEREK, .Derek
	if_equal PHONE_FISHER_TULLY, .Tully
	if_equal PHONE_FISHER_WILTON, .Wilton

.Jose:
	farwritetext UnknownText_0x175116
	end

.Wade:
	farwritetext UnknownText_0x175a60
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

UnknownScript_0xa061e:
	checkcode VAR_CALLERID
	if_equal PHONE_POKEFAN_BEVERLY, .Beverly
	if_equal PHONE_PICNICKER_GINA, .Gina
	if_equal PHONE_LASS_DANA, .Dana
	if_equal PHONE_PICNICKER_TIFFANY, .Tiffany

.Beverly:
	farwritetext UnknownText_0x1747cc
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
	jump PhoneScript_HangupText_Male

UnknownScript_0xa064c:
	farwritetext UnknownText_0x66dc5
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0654:
	random 11
	if_equal  0, UnknownScript_0xa0682
	if_equal  1, UnknownScript_0xa068a
	if_equal  2, UnknownScript_0xa0692
	if_equal  3, UnknownScript_0xa069a
	if_equal  4, UnknownScript_0xa06a2
	if_equal  5, UnknownScript_0xa06aa
	if_equal  6, UnknownScript_0xa06b2
	if_equal  7, UnknownScript_0xa06ba
	if_equal  8, UnknownScript_0xa06c2
	if_equal  9, UnknownScript_0xa06ca
	if_equal 10, UnknownScript_0xa06d2

UnknownScript_0xa0682:
	farwritetext UnknownText_0x174261
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa068a:
	farwritetext UnknownText_0x17429d
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0692:
	farwritetext UnknownText_0x1742ee
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa069a:
	farwritetext UnknownText_0x174340
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa06a2:
	farwritetext UnknownText_0x174391
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa06aa:
	farwritetext UnknownText_0x1743e3
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa06b2:
	farwritetext UnknownText_0x174433
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa06ba:
	farwritetext UnknownText_0x174485
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa06c2:
	farwritetext UnknownText_0x1744d6
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa06ca:
	farwritetext UnknownText_0x174522
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa06d2:
	farwritetext UnknownText_0x174571
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa06da:
	random 10
	if_equal 0, UnknownScript_0xa0704
	if_equal 1, UnknownScript_0xa070c
	if_equal 2, UnknownScript_0xa0714
	if_equal 3, UnknownScript_0xa071c
	if_equal 4, UnknownScript_0xa0724
	if_equal 5, UnknownScript_0xa072c
	if_equal 6, UnknownScript_0xa0734
	if_equal 7, UnknownScript_0xa073c
	if_equal 8, UnknownScript_0xa0744
	if_equal 9, UnknownScript_0xa074c

UnknownScript_0xa0704:
	farwritetext UnknownText_0x176223
	buttonsound
	jump PhoneScript_HangupText_Female

UnknownScript_0xa070c:
	farwritetext UnknownText_0x1762c3
	buttonsound
	jump PhoneScript_HangupText_Female

UnknownScript_0xa0714:
	farwritetext UnknownText_0x17638a
	buttonsound
	jump PhoneScript_HangupText_Female

UnknownScript_0xa071c:
	farwritetext UnknownText_0x176424
	buttonsound
	jump PhoneScript_HangupText_Female

UnknownScript_0xa0724:
	farwritetext UnknownText_0x1764eb
	buttonsound
	jump PhoneScript_HangupText_Female

UnknownScript_0xa072c:
	farwritetext UnknownText_0x176599
	buttonsound
	jump PhoneScript_HangupText_Female

UnknownScript_0xa0734:
	farwritetext UnknownText_0x1766ac
	buttonsound
	jump PhoneScript_HangupText_Female

UnknownScript_0xa073c:
	farwritetext UnknownText_0x17674f
	buttonsound
	jump PhoneScript_HangupText_Female

UnknownScript_0xa0744:
	farwritetext UnknownText_0x176816
	buttonsound
	jump PhoneScript_HangupText_Female

UnknownScript_0xa074c:
	farwritetext UnknownText_0x17686d
	buttonsound
	jump PhoneScript_HangupText_Female

UnknownScript_0xa0754:
	random 10
	if_equal 0, UnknownScript_0xa077e
	if_equal 1, UnknownScript_0xa0786
	if_equal 2, UnknownScript_0xa078e
	if_equal 3, UnknownScript_0xa0796
	if_equal 4, UnknownScript_0xa079e
	if_equal 5, UnknownScript_0xa07a6
	if_equal 6, UnknownScript_0xa07ae
	if_equal 7, UnknownScript_0xa07b6
	if_equal 8, UnknownScript_0xa07be
	if_equal 9, UnknownScript_0xa07c6

UnknownScript_0xa077e:
	farwritetext UnknownText_0x65481
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0786:
	farwritetext UnknownText_0x654ea
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa078e:
	farwritetext UnknownText_0x65555
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0796:
	farwritetext UnknownText_0x655c7
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa079e:
	farwritetext UnknownText_0x65628
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa07a6:
	farwritetext UnknownText_0x6569b
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa07ae:
	farwritetext UnknownText_0x6574a
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa07b6:
	farwritetext UnknownText_0x65810
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa07be:
	farwritetext UnknownText_0x658c6
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa07c6:
	farwritetext UnknownText_0x65969
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa07ce:
	random 10
	if_equal 0, UnknownScript_0xa07f8
	if_equal 1, UnknownScript_0xa0800
	if_equal 2, UnknownScript_0xa0808
	if_equal 3, UnknownScript_0xa0810
	if_equal 4, UnknownScript_0xa0818
	if_equal 5, UnknownScript_0xa0820
	if_equal 6, UnknownScript_0xa0828
	if_equal 7, UnknownScript_0xa0830
	if_equal 8, UnknownScript_0xa0838
	if_equal 9, UnknownScript_0xa0840

UnknownScript_0xa07f8:
	farwritetext UnknownText_0x662bc
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0800:
	farwritetext UnknownText_0x662fc
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0808:
	farwritetext UnknownText_0x66335
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0810:
	farwritetext UnknownText_0x66366
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0818:
	farwritetext UnknownText_0x663a1
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0820:
	farwritetext UnknownText_0x663e6
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0828:
	farwritetext UnknownText_0x66421
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0830:
	farwritetext UnknownText_0x6645f
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0838:
	farwritetext UnknownText_0x6649b
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0840:
	farwritetext UnknownText_0x664dd
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0848:
	checkevent EVENT_OPENED_MT_SILVER
	iftrue UnknownScript_0xa08e0
	checkevent EVENT_FOUGHT_SNORLAX
	iftrue UnknownScript_0xa08d8
	checkevent EVENT_GOT_PASS_FROM_COPYCAT
	iftrue UnknownScript_0xa08d0
	checkflag ENGINE_MARSHBADGE
	iftrue UnknownScript_0xa08f0
	checkflag ENGINE_FLYPOINT_VERMILION
	iftrue UnknownScript_0xa08c8
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue UnknownScript_0xa08c0
	checkflag ENGINE_RISINGBADGE
	iftrue UnknownScript_0xa08b8
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue UnknownScript_0xa08b0
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue UnknownScript_0xa08a8
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iftrue UnknownScript_0xa08a0
	checkflag ENGINE_FOGBADGE
	iftrue UnknownScript_0xa08e8
	checkflag ENGINE_PLAINBADGE
	iftrue UnknownScript_0xa0898
	farwritetext UnknownText_0x646a3
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0898:
	farwritetext UnknownText_0x64099
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa08a0:
	farwritetext UnknownText_0x640e6
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa08a8:
	farwritetext UnknownText_0x6416d
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa08b0:
	farwritetext UnknownText_0x641e8
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa08b8:
	farwritetext UnknownText_0x64247
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa08c0:
	farwritetext UnknownText_0x642bb
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa08c8:
	farwritetext UnknownText_0x643d4
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa08d0:
	farwritetext UnknownText_0x64448
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa08d8:
	farwritetext UnknownText_0x6455b
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa08e0:
	farwritetext UnknownText_0x645ff
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa08e8:
	farwritetext UnknownText_0x646df
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa08f0:
	farwritetext UnknownText_0x647d8
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa08f8:
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

UnknownScript_0xa09a8:
	farwritetext UnknownText_0x66aa5
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa09b0:
	farwritetext UnknownText_0x66ca7
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa09b8:
	farwritetext UnknownText_0x67106
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa09c0:
	farwritetext UnknownText_0x67294
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

UnknownScript_0xa09ee:
	checkcode VAR_KENJI_BREAK
	if_equal 2, UnknownScript_0xa0a00
	if_equal 1, UnknownScript_0xa0a08
	farwritetext UnknownText_0x66e17
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0a00:
	farwritetext UnknownText_0x66e67
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0a08:
	checkmorn
	iftrue UnknownScript_0xa0a1d
	checknite
	iftrue UnknownScript_0xa0a25
	setevent EVENT_KENJI_ON_BREAK
	farwritetext UnknownText_0x66f11
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0a1d:
	farwritetext UnknownText_0x66ed3
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0a25:
	farwritetext UnknownText_0x66f52
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0a2d:
	farwritetext UnknownText_0x174638
	end

UnknownScript_0xa0a32:
	farwritetext UnknownText_0x1749c7
	end

UnknownScript_0xa0a37:
	farwritetext UnknownText_0x174c49
	end

UnknownScript_0xa0a3c:
	farwritetext UnknownText_0x174ee2
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

UnknownScript_0xa0a91:
	farwritetext UnknownText_0x66ad1
	end

UnknownScript_0xa0a96:
	farwritetext UnknownText_0x66cf7
	end

UnknownScript_0xa0a9b:
	farwritetext UnknownText_0x6712a
	end

UnknownScript_0xa0aa0:
	farwritetext UnknownText_0x672d5
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

UnknownScript_0xa0aed:
	farwritetext UnknownText_0x66d45
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
