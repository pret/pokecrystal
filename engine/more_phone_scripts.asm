UnknownScript_0xa0000:
	special RandomPhoneMon
	farscall UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xa0013
	farscall UnknownScript_0xbe51e
	farjump UnknownScript_0xa003e

UnknownScript_0xa0013:
	farjump UnknownScript_0xa002e

UnknownScript_0xa0017:
	special RandomPhoneMon
	farscall UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xa002a
	farscall UnknownScript_0xbe5d0
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
	farscall UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xa0051
	farscall UnknownScript_0xa017a
	farjump UnknownScript_0xa0484

UnknownScript_0xa0051:
	farjump UnknownScript_0xa006c

UnknownScript_0xa0055:
	special RandomPhoneWildMon
	farscall UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xa0068
	farscall UnknownScript_0xa0226
	farjump UnknownScript_0xa053a

UnknownScript_0xa0068:
	farjump UnknownScript_0xa0074

UnknownScript_0xa006c:
	farscall UnknownScript_0xa0278
	farjump UnknownScript_0xa0484

UnknownScript_0xa0074:
	farscall UnknownScript_0xa0324
	farjump UnknownScript_0xa053a

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
	keeptextopen
	end

.Gaven:
	farwritetext UnknownText_0x174a24
	keeptextopen
	end

.Jose:
	farwritetext UnknownText_0x174f2f
	keeptextopen
	end

.Joey:
	farwritetext UnknownText_0x175530
	keeptextopen
	end

.Wade:
	farwritetext UnknownText_0x1757d4
	keeptextopen
	end

.Ralph:
	farwritetext UnknownText_0x175bc4
	keeptextopen
	end

.Anthony:
	farwritetext UnknownText_0x176a2f
	keeptextopen
	end

.Todd:
	farwritetext UnknownText_0x176e5d
	keeptextopen
	end

.Arnie:
	farwritetext UnknownText_0x649dc
	keeptextopen
	end

.Alan:
	farwritetext UnknownText_0x64cbd
	keeptextopen
	end

.Chad:
	farwritetext UnknownText_0x65271
	keeptextopen
	end

.Derek:
	farwritetext UnknownText_0x65ab2
	keeptextopen
	end

.Tully:
	farwritetext UnknownText_0x65de4
	keeptextopen
	end

.Brent:
	farwritetext UnknownText_0x660be
	keeptextopen
	end

.Vance:
	farwritetext UnknownText_0x66980
	keeptextopen
	end

.Wilton:
	farwritetext UnknownText_0x66afc
	keeptextopen
	end

.Parry:
	farwritetext UnknownText_0x66f9f
	keeptextopen
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
	keeptextopen
	end

.Beth:
	farwritetext UnknownText_0x174c7f
	keeptextopen
	end

.Reena:
	farwritetext UnknownText_0x1752f5
	keeptextopen
	end

.Liz:
	farwritetext UnknownText_0x175fda
	keeptextopen
	end

.Gina:
	farwritetext UnknownText_0x1771fd
	keeptextopen
	end

.Dana:
	farwritetext UnknownText_0x64f74
	keeptextopen
	end

.Tiffany:
	farwritetext UnknownText_0x665ad
	keeptextopen
	end

.Erin:
	farwritetext UnknownText_0x6717a
	keeptextopen
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
	keeptextopen
	end

.Gaven:
	farwritetext UnknownText_0x174a80
	keeptextopen
	end

.Jose:
	farwritetext UnknownText_0x174f90
	keeptextopen
	end

.Joey:
	farwritetext UnknownText_0x175591
	keeptextopen
	end

.Wade:
	farwritetext UnknownText_0x175869
	keeptextopen
	end

.Ralph:
	farwritetext UnknownText_0x175c24
	keeptextopen
	end

.Anthony:
	farwritetext UnknownText_0x176aef
	keeptextopen
	end

.Todd:
	farwritetext UnknownText_0x176e9c
	keeptextopen
	end

.Arnie:
	farwritetext UnknownText_0x64a13
	keeptextopen
	end

.Alan:
	farwritetext UnknownText_0x64cf3
	keeptextopen
	end

.Chad:
	farwritetext UnknownText_0x65318
	keeptextopen
	end

.Derek:
	farwritetext UnknownText_0x65b29
	keeptextopen
	end

.Tully:
	farwritetext UnknownText_0x65e42
	keeptextopen
	end

.Brent:
	farwritetext UnknownText_0x6613c
	keeptextopen
	end

.Vance:
	farwritetext UnknownText_0x669b2
	keeptextopen
	end

.Wilton:
	farwritetext UnknownText_0x66b3e
	keeptextopen
	end

.Parry:
	farwritetext UnknownText_0x66fc0
	keeptextopen
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
	keeptextopen
	end

.Beth:
	farwritetext UnknownText_0x174cf6
	keeptextopen
	end

.Reena:
	farwritetext UnknownText_0x17536b
	keeptextopen
	end

.Liz:
	farwritetext UnknownText_0x17602d
	keeptextopen
	end

.Gina:
	farwritetext UnknownText_0x177237
	keeptextopen
	end

.Dana:
	farwritetext UnknownText_0x64fb2
	keeptextopen
	end

.Tiffany:
	farwritetext UnknownText_0x66605
	keeptextopen
	end

.Erin:
	farwritetext UnknownText_0x671a4
	keeptextopen
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
	keeptextopen
	end

.Gaven:
	farwritetext UnknownText_0x174b2d
	keeptextopen
	end

.Jose:
	farwritetext UnknownText_0x174ffd
	keeptextopen
	end

.Joey:
	farwritetext UnknownText_0x175611
	keeptextopen
	end

.Wade:
	farwritetext UnknownText_0x1758e4
	keeptextopen
	end

.Ralph:
	farwritetext UnknownText_0x175c9f
	keeptextopen
	end

.Anthony:
	farwritetext UnknownText_0x176b45
	keeptextopen
	end

.Todd:
	farwritetext UnknownText_0x176eee
	keeptextopen
	end

.Arnie:
	farwritetext UnknownText_0x64a71
	keeptextopen
	end

.Alan:
	farwritetext UnknownText_0x64d4f
	keeptextopen
	end

.Chad:
	farwritetext UnknownText_0x65399
	keeptextopen
	end

.Derek:
	farwritetext UnknownText_0x65bc8
	keeptextopen
	end

.Tully:
	farwritetext UnknownText_0x65eac
	keeptextopen
	end

.Brent:
	farwritetext UnknownText_0x6618c
	keeptextopen
	end

.Vance:
	farwritetext UnknownText_0x669ed
	keeptextopen
	end

.Wilton:
	farwritetext UnknownText_0x66b8f
	keeptextopen
	end

.Parry:
	farwritetext UnknownText_0x67001
	keeptextopen
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
	keeptextopen
	end

.Beth:
	farwritetext UnknownText_0x174d86
	keeptextopen
	end

.Reena:
	farwritetext UnknownText_0x1753c5
	keeptextopen
	end

.Liz:
	farwritetext UnknownText_0x176095
	keeptextopen
	end

.Gina:
	farwritetext UnknownText_0x177297
	keeptextopen
	end

.Dana:
	farwritetext UnknownText_0x6501c
	keeptextopen
	end

.Tiffany:
	farwritetext UnknownText_0x66688
	keeptextopen
	end

.Erin:
	farwritetext UnknownText_0x671eb
	keeptextopen
	end

UnknownScript_0xa0376:
	farscall UnknownScript_0xa0386
	farjump UnknownScript_0xa0484

UnknownScript_0xa037e:
	farscall UnknownScript_0xa0432
	farjump UnknownScript_0xa053a

UnknownScript_0xa0386:
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
	keeptextopen
	end

.Huey:
	farwritetext UnknownText_0x1748ea
	keeptextopen
	end

.Gaven:
	farwritetext UnknownText_0x174bc5
	keeptextopen
	end

.Jose:
	farwritetext UnknownText_0x17507d
	keeptextopen
	end

.Joey:
	farwritetext UnknownText_0x175693
	keeptextopen
	end

.Wade:
	farwritetext UnknownText_0x175976
	keeptextopen
	end

.Ralph:
	farwritetext UnknownText_0x175d40
	keeptextopen
	end

.Anthony:
	farwritetext UnknownText_0x176bee
	keeptextopen
	end

.Todd:
	farwritetext UnknownText_0x176f60
	keeptextopen
	end

.Arnie:
	farwritetext UnknownText_0x64ada
	keeptextopen
	end

.Alan:
	farwritetext UnknownText_0x64da4
	keeptextopen
	end

.Chad:
	farwritetext UnknownText_0x65419
	keeptextopen
	end

.Tully:
	farwritetext UnknownText_0x65f17
	keeptextopen
	end

.Brent:
	farwritetext UnknownText_0x66214
	keeptextopen
	end

.Vance:
	farwritetext UnknownText_0x66a3a
	keeptextopen
	end

.Wilton:
	farwritetext UnknownText_0x66bf3
	keeptextopen
	end

.Parry:
	farwritetext UnknownText_0x67096
	keeptextopen
	end

UnknownScript_0xa0432:
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
	keeptextopen
	end

.Reena:
	farwritetext UnknownText_0x17543a
	keeptextopen
	end

.Liz:
	farwritetext UnknownText_0x17610a
	keeptextopen
	end

.Gina:
	farwritetext UnknownText_0x1772e2
	keeptextopen
	end

.Dana:
	farwritetext UnknownText_0x65091
	keeptextopen
	end

.Tiffany:
	farwritetext UnknownText_0x66730
	keeptextopen
	end

.Erin:
	farwritetext UnknownText_0x6722e
	keeptextopen
	end

UnknownScript_0xa047a:
	farwritetext UnknownText_0x1761a7
	end

UnknownScript_0xa047f:
	farwritetext UnknownText_0x66796
	end

UnknownScript_0xa0484:
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

UnknownScript_0xa053a:
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
	farjump UnknownScript_0xa0484

UnknownScript_0xa0592:
	scall UnknownScript_0xa05a0
	iffalse UnknownScript_0xa059c
	farjump UnknownScript_0xa0017

UnknownScript_0xa059c:
	farjump UnknownScript_0xa053a

UnknownScript_0xa05a0:
	special RandomPhoneRareWildMon
	end

UnknownScript_0xa05a4:
	checkcode VAR_CALLERID
	if_equal PHONE_BUG_CATCHER_WADE, .Wade
	if_equal PHONE_POKEFANM_DEREK, .Derek

.Wade:
	farwritetext UnknownText_0x1759f7
	keeptextopen
	jump UnknownScript_0xa0484

.Derek:
	farwritetext UnknownText_0x65c66
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa05be:
	farwritetext UnknownText_0x64032
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa05c6:
	farwritetext UnknownText_0x177378
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa05ce:
	farwritetext UnknownText_0x64b5f
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa05d6:
	farwritetext UnknownText_0x175dd9
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa05de:
	farwritetext UnknownText_0x176c61
	keeptextopen
	jump UnknownScript_0xa0484

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
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa064c:
	farwritetext UnknownText_0x66dc5
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0654:
	random $b
	if_equal $0, UnknownScript_0xa0682
	if_equal $1, UnknownScript_0xa068a
	if_equal $2, UnknownScript_0xa0692
	if_equal $3, UnknownScript_0xa069a
	if_equal $4, UnknownScript_0xa06a2
	if_equal $5, UnknownScript_0xa06aa
	if_equal $6, UnknownScript_0xa06b2
	if_equal $7, UnknownScript_0xa06ba
	if_equal $8, UnknownScript_0xa06c2
	if_equal $9, UnknownScript_0xa06ca
	if_equal $a, UnknownScript_0xa06d2

UnknownScript_0xa0682:
	farwritetext UnknownText_0x174261
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa068a:
	farwritetext UnknownText_0x17429d
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0692:
	farwritetext UnknownText_0x1742ee
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa069a:
	farwritetext UnknownText_0x174340
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa06a2:
	farwritetext UnknownText_0x174391
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa06aa:
	farwritetext UnknownText_0x1743e3
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa06b2:
	farwritetext UnknownText_0x174433
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa06ba:
	farwritetext UnknownText_0x174485
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa06c2:
	farwritetext UnknownText_0x1744d6
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa06ca:
	farwritetext UnknownText_0x174522
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa06d2:
	farwritetext UnknownText_0x174571
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa06da:
	random $a
	if_equal $0, UnknownScript_0xa0704
	if_equal $1, UnknownScript_0xa070c
	if_equal $2, UnknownScript_0xa0714
	if_equal $3, UnknownScript_0xa071c
	if_equal $4, UnknownScript_0xa0724
	if_equal $5, UnknownScript_0xa072c
	if_equal $6, UnknownScript_0xa0734
	if_equal $7, UnknownScript_0xa073c
	if_equal $8, UnknownScript_0xa0744
	if_equal $9, UnknownScript_0xa074c

UnknownScript_0xa0704:
	farwritetext UnknownText_0x176223
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa070c:
	farwritetext UnknownText_0x1762c3
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa0714:
	farwritetext UnknownText_0x17638a
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa071c:
	farwritetext UnknownText_0x176424
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa0724:
	farwritetext UnknownText_0x1764eb
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa072c:
	farwritetext UnknownText_0x176599
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa0734:
	farwritetext UnknownText_0x1766ac
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa073c:
	farwritetext UnknownText_0x17674f
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa0744:
	farwritetext UnknownText_0x176816
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa074c:
	farwritetext UnknownText_0x17686d
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa0754:
	random $a
	if_equal $0, UnknownScript_0xa077e
	if_equal $1, UnknownScript_0xa0786
	if_equal $2, UnknownScript_0xa078e
	if_equal $3, UnknownScript_0xa0796
	if_equal $4, UnknownScript_0xa079e
	if_equal $5, UnknownScript_0xa07a6
	if_equal $6, UnknownScript_0xa07ae
	if_equal $7, UnknownScript_0xa07b6
	if_equal $8, UnknownScript_0xa07be
	if_equal $9, UnknownScript_0xa07c6

UnknownScript_0xa077e:
	farwritetext UnknownText_0x65481
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0786:
	farwritetext UnknownText_0x654ea
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa078e:
	farwritetext UnknownText_0x65555
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0796:
	farwritetext UnknownText_0x655c7
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa079e:
	farwritetext UnknownText_0x65628
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa07a6:
	farwritetext UnknownText_0x6569b
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa07ae:
	farwritetext UnknownText_0x6574a
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa07b6:
	farwritetext UnknownText_0x65810
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa07be:
	farwritetext UnknownText_0x658c6
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa07c6:
	farwritetext UnknownText_0x65969
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa07ce:
	random $a
	if_equal $0, UnknownScript_0xa07f8
	if_equal $1, UnknownScript_0xa0800
	if_equal $2, UnknownScript_0xa0808
	if_equal $3, UnknownScript_0xa0810
	if_equal $4, UnknownScript_0xa0818
	if_equal $5, UnknownScript_0xa0820
	if_equal $6, UnknownScript_0xa0828
	if_equal $7, UnknownScript_0xa0830
	if_equal $8, UnknownScript_0xa0838
	if_equal $9, UnknownScript_0xa0840

UnknownScript_0xa07f8:
	farwritetext UnknownText_0x662bc
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0800:
	farwritetext UnknownText_0x662fc
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0808:
	farwritetext UnknownText_0x66335
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0810:
	farwritetext UnknownText_0x66366
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0818:
	farwritetext UnknownText_0x663a1
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0820:
	farwritetext UnknownText_0x663e6
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0828:
	farwritetext UnknownText_0x66421
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0830:
	farwritetext UnknownText_0x6645f
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0838:
	farwritetext UnknownText_0x6649b
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0840:
	farwritetext UnknownText_0x664dd
	keeptextopen
	jump UnknownScript_0xa0484

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
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0898:
	farwritetext UnknownText_0x64099
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa08a0:
	farwritetext UnknownText_0x640e6
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa08a8:
	farwritetext UnknownText_0x6416d
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa08b0:
	farwritetext UnknownText_0x641e8
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa08b8:
	farwritetext UnknownText_0x64247
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa08c0:
	farwritetext UnknownText_0x642bb
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa08c8:
	farwritetext UnknownText_0x643d4
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa08d0:
	farwritetext UnknownText_0x64448
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa08d8:
	farwritetext UnknownText_0x6455b
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa08e0:
	farwritetext UnknownText_0x645ff
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa08e8:
	farwritetext UnknownText_0x646df
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa08f0:
	farwritetext UnknownText_0x647d8
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa08f8:
	farwritetext UnknownText_0x1745c2
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0900:
	farwritetext UnknownText_0x17485b
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa0908:
	farwritetext UnknownText_0x17496b
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0910:
	farwritetext UnknownText_0x174c29
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0918:
	farwritetext UnknownText_0x174ec5
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa0920:
	farwritetext UnknownText_0x17519b
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0928:
	farwritetext UnknownText_0x17549b
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa0930:
	farwritetext UnknownText_0x17571d
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0938:
	farwritetext UnknownText_0x175abe
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0940:
	farwritetext UnknownText_0x175eaf
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0948:
	farwritetext UnknownText_0x1768b0
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa0950:
	farwritetext UnknownText_0x176d32
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0958:
	farwritetext UnknownText_0x1770fb
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0960:
	farwritetext UnknownText_0x177465
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa0968:
	farwritetext UnknownText_0x64bc6
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0970:
	farwritetext UnknownText_0x64e90
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0978:
	farwritetext UnknownText_0x65161
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa0980:
	farwritetext UnknownText_0x65a23
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0988:
	farwritetext UnknownText_0x65d5c
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0990:
	farwritetext UnknownText_0x65ff2
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0998:
	farwritetext UnknownText_0x6651e
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa09a0:
	farwritetext UnknownText_0x66882
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa09a8:
	farwritetext UnknownText_0x66aa5
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa09b0:
	farwritetext UnknownText_0x66ca7
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa09b8:
	farwritetext UnknownText_0x67106
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa09c0:
	farwritetext UnknownText_0x67294
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa09c8:
	random $3
	if_equal $0, UnknownScript_0xa09d6
	if_equal $1, UnknownScript_0xa09de
	if_equal $2, UnknownScript_0xa09e6

UnknownScript_0xa09d6:
	farwritetext UnknownText_0x64846
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa09de:
	farwritetext UnknownText_0x64881
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa09e6:
	farwritetext UnknownText_0x648dc
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa09ee:
	checkcode VAR_KENJI_BREAK
	if_equal $2, UnknownScript_0xa0a00
	if_equal $1, UnknownScript_0xa0a08
	farwritetext UnknownText_0x66e17
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0a00:
	farwritetext UnknownText_0x66e67
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0a08:
	checkmorn
	iftrue UnknownScript_0xa0a1d
	checknite
	iftrue UnknownScript_0xa0a25
	setevent EVENT_KENJI_ON_BREAK
	farwritetext UnknownText_0x66f11
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0a1d:
	farwritetext UnknownText_0x66ed3
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0a25:
	farwritetext UnknownText_0x66f52
	keeptextopen
	jump UnknownScript_0xa0484

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
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa0aad:
	farwritetext UnknownText_0x17529c
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0ab5:
	farwritetext UnknownText_0x175b6d
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0abd:
	farwritetext UnknownText_0x17750e
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa0ac5:
	farwritetext UnknownText_0x64f1a
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0acd:
	farwritetext UnknownText_0x6520f
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa0ad5:
	farwritetext UnknownText_0x65da6
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0add:
	farwritetext UnknownText_0x66087
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0ae5:
	farwritetext UnknownText_0x6691d
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa0aed:
	farwritetext UnknownText_0x66d45
	keeptextopen
	jump UnknownScript_0xa0484

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
