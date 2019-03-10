PhoneScript_Random2:
	random 2
	end

PhoneScript_Random3:
	random 3
	end

PhoneScript_Random4:
	random 4
	end

PhoneScript_Random5:
	random 5
	end

PhoneScript_Random11:
	random 11
	end

PhoneScript_AnswerPhone_Male:
	checktime DAY
	iftrue PhoneScript_AnswerPhone_Male_Day
	checktime NITE
	iftrue PhoneScript_AnswerPhone_Male_Nite
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
	farwritetext UnknownText_0x1b4dc5
	buttonsound
	end

.Huey:
	farwritetext UnknownText_0x1b5073
	buttonsound
	end

.Gaven:
	farwritetext UnknownText_0x1b5270
	buttonsound
	end

.Jose:
	farwritetext UnknownText_0x1b55ae
	buttonsound
	end

.Joey:
	farwritetext UnknownText_0x1b589a
	buttonsound
	end

.Wade:
	farwritetext UnknownText_0x1b5a3b
	buttonsound
	end

.Ralph:
	farwritetext UnknownText_0x1b5c10
	buttonsound
	end

.Anthony:
	farwritetext UnknownText_0x1b5f7a
	buttonsound
	end

.Todd:
	farwritetext UnknownText_0x1b60f5
	buttonsound
	end

.Irwin:
	farwritetext UnknownText_0x1b638c
	buttonsound
	end

.Arnie:
	farwritetext UnknownText_0x1b6454
	buttonsound
	end

.Alan:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Chad:
	farwritetext UnknownText_0x1b67e2
	buttonsound
	end

.Derek:
	farwritetext UnknownText_0x1b69a8
	buttonsound
	end

.Tully:
	farwritetext UnknownText_0x1b6b39
	buttonsound
	end

.Brent:
	farwritetext UnknownText_0x1b6c96
	buttonsound
	end

.Vance:
	farwritetext UnknownText_0x1b7019
	buttonsound
	end

.Wilton:
	farwritetext UnknownText_0x1b71d5
	buttonsound
	end

.Kenji:
	farwritetext UnknownText_0x1b730b
	buttonsound
	end

.Parry:
	farwritetext UnknownText_0x1b73c7
	buttonsound
	end

PhoneScript_AnswerPhone_Male_Day:
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
	farwritetext UnknownText_0x1b4ded
	buttonsound
	end

.Huey:
	farwritetext UnknownText_0x1b509b
	buttonsound
	end

.Gaven:
	farwritetext UnknownText_0x1b52a5
	buttonsound
	end

.Jose:
	farwritetext UnknownText_0x1b55da
	buttonsound
	end

.Joey:
	farwritetext UnknownText_0x1b58c2
	buttonsound
	end

.Wade:
	farwritetext UnknownText_0x1b5a74
	buttonsound
	end

.Ralph:
	farwritetext UnknownText_0x1b5c63
	buttonsound
	end

.Anthony:
	farwritetext UnknownText_0x1b5f9e
	buttonsound
	end

.Todd:
	farwritetext UnknownText_0x1b611b
	buttonsound
	end

.Irwin:
	farwritetext UnknownText_0x1b63a8
	buttonsound
	end

.Arnie:
	farwritetext UnknownText_0x1b647e
	buttonsound
	end

.Alan:
	farwritetext UnknownText_0x1b65c7
	buttonsound
	end

.Chad:
	farwritetext UnknownText_0x1b680e
	buttonsound
	end

.Derek:
	farwritetext UnknownText_0x1b69d2
	buttonsound
	end

.Tully:
	farwritetext UnknownText_0x1b6b65
	buttonsound
	end

.Brent:
	farwritetext UnknownText_0x1b6cc6
	buttonsound
	end

.Vance:
	farwritetext UnknownText_0x1b7057
	buttonsound
	end

.Wilton:
	farwritetext UnknownText_0x1b71fc
	buttonsound
	end

.Kenji:
	farwritetext UnknownText_0x1b7331
	buttonsound
	end

.Parry:
	farwritetext UnknownText_0x1b73ef
	buttonsound
	end

PhoneScript_AnswerPhone_Male_Nite:
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
	farwritetext UnknownText_0x1b4e16
	buttonsound
	end

.Huey:
	farwritetext UnknownText_0x1b50c2
	buttonsound
	end

.Gaven:
	farwritetext UnknownText_0x1b52cc
	buttonsound
	end

.Jose:
	farwritetext UnknownText_0x1b55fc
	buttonsound
	end

.Joey:
	farwritetext UnknownText_0x1b58ea
	buttonsound
	end

.Wade:
	farwritetext UnknownText_0x1b5a9f
	buttonsound
	end

.Ralph:
	farwritetext UnknownText_0x1b5cb6
	buttonsound
	end

.Anthony:
	farwritetext UnknownText_0x1b5fc9
	buttonsound
	end

.Todd:
	farwritetext UnknownText_0x1b6149
	buttonsound
	end

.Irwin:
	farwritetext UnknownText_0x1b63c4
	buttonsound
	end

.Arnie:
	farwritetext UnknownText_0x1b64a8
	buttonsound
	end

.Alan:
	farwritetext UnknownText_0x1b65e3
	buttonsound
	end

.Chad:
	farwritetext UnknownText_0x1b6836
	buttonsound
	end

.Derek:
	farwritetext UnknownText_0x1b69f8
	buttonsound
	end

.Tully:
	farwritetext UnknownText_0x1b6b92
	buttonsound
	end

.Brent:
	farwritetext UnknownText_0x1b6cf6
	buttonsound
	end

.Vance:
	farwritetext UnknownText_0x1b7092
	buttonsound
	end

.Wilton:
	farwritetext UnknownText_0x1b722a
	buttonsound
	end

.Kenji:
	farwritetext UnknownText_0x1b7357
	buttonsound
	end

.Parry:
	farwritetext UnknownText_0x1b7417
	buttonsound
	end

PhoneScript_AnswerPhone_Female:
	checktime DAY
	iftrue PhoneScript_AnswerPhone_Female_Day
	checktime NITE
	iftrue PhoneScript_AnswerPhone_Female_Nite
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
	farwritetext UnknownText_0x1b4f21
	buttonsound
	end

.Beth:
	farwritetext UnknownText_0x1b53f7
	buttonsound
	end

.Reena:
	farwritetext UnknownText_0x1b5702
	buttonsound
	end

.Liz:
	farwritetext UnknownText_0x1b5d9f
	buttonsound
	end

.Gina:
	farwritetext UnknownText_0x1b626a
	buttonsound
	end

.Dana:
	farwritetext UnknownText_0x1b66c8
	buttonsound
	end

.Tiffany:
	farwritetext UnknownText_0x1b6e7c
	buttonsound
	end

.Erin:
	farwritetext UnknownText_0x1b751a
	buttonsound
	end

PhoneScript_AnswerPhone_Female_Day:
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
	farwritetext UnknownText_0x1b4f4d
	buttonsound
	end

.Beth:
	farwritetext UnknownText_0x1b5424
	buttonsound
	end

.Reena:
	farwritetext UnknownText_0x1b572e
	buttonsound
	end

.Liz:
	farwritetext UnknownText_0x1b5dcc
	buttonsound
	end

.Gina:
	farwritetext UnknownText_0x1b6296
	buttonsound
	end

.Dana:
	farwritetext UnknownText_0x1b66ec
	buttonsound
	end

.Tiffany:
	farwritetext UnknownText_0x1b6ea6
	buttonsound
	end

.Erin:
	farwritetext UnknownText_0x1b7548
	buttonsound
	end

PhoneScript_AnswerPhone_Female_Nite:
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
	farwritetext UnknownText_0x1b4f75
	buttonsound
	end

.Beth:
	farwritetext UnknownText_0x1b5446
	buttonsound
	end

.Reena:
	farwritetext UnknownText_0x1b575a
	buttonsound
	end

.Liz:
	farwritetext UnknownText_0x1b5df8
	buttonsound
	end

.Gina:
	farwritetext UnknownText_0x1b62c5
	buttonsound
	end

.Dana:
	farwritetext UnknownText_0x1b6713
	buttonsound
	end

.Tiffany:
	farwritetext UnknownText_0x1b6ec9
	buttonsound
	end

.Erin:
	farwritetext UnknownText_0x1b756f
	buttonsound
	end

PhoneScript_GreetPhone_Male:
	checktime DAY
	iftrue PhoneScript_GreetPhone_Male_Day
	checktime NITE
	iftrue PhoneScript_GreetPhone_Male_Nite
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
	farwritetext UnknownText_0x1b4e3e
	buttonsound
	end

.Huey:
	farwritetext UnknownText_0x1b50e9
	buttonsound
	end

.Gaven:
	farwritetext UnknownText_0x1b5301
	buttonsound
	end

.Jose:
	farwritetext UnknownText_0x1b5628
	buttonsound
	end

.Joey:
	farwritetext UnknownText_0x1b5912
	buttonsound
	end

.Wade:
	farwritetext UnknownText_0x1b5ad8
	buttonsound
	end

.Ralph:
	farwritetext UnknownText_0x1b5d09
	buttonsound
	end

.Anthony:
	farwritetext UnknownText_0x1b5ff6
	buttonsound
	end

.Todd:
	farwritetext UnknownText_0x1b616e
	buttonsound
	end

.Irwin:
	farwritetext UnknownText_0x1b63e3
	buttonsound
	end

.Arnie:
	farwritetext UnknownText_0x1b64d2
	buttonsound
	end

.Alan:
	farwritetext UnknownText_0x1b660d
	buttonsound
	end

.Chad:
	farwritetext UnknownText_0x1b6862
	buttonsound
	end

.Derek:
	farwritetext UnknownText_0x1b6a22
	buttonsound
	end

.Tully:
	farwritetext UnknownText_0x1b6bb9
	buttonsound
	end

.Brent:
	farwritetext UnknownText_0x1b6d26
	buttonsound
	end

.Vance:
	farwritetext UnknownText_0x1b70e7
	buttonsound
	end

.Wilton:
	farwritetext UnknownText_0x1b725c
	buttonsound
	end

.Kenji:
	farwritetext UnknownText_0x1b737f
	buttonsound
	end

.Parry:
	farwritetext UnknownText_0x1b743f
	buttonsound
	end

PhoneScript_GreetPhone_Male_Day:
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
	farwritetext UnknownText_0x1b4e72
	buttonsound
	end

.Huey:
	farwritetext UnknownText_0x1b511a
	buttonsound
	end

.Gaven:
	farwritetext UnknownText_0x1b5335
	buttonsound
	end

.Jose:
	farwritetext UnknownText_0x1b564c
	buttonsound
	end

.Joey:
	farwritetext UnknownText_0x1b5948
	buttonsound
	end

.Wade:
	farwritetext UnknownText_0x1b5b0b
	buttonsound
	end

.Ralph:
	farwritetext UnknownText_0x1b5d21
	buttonsound
	end

.Anthony:
	farwritetext UnknownText_0x1b6017
	buttonsound
	end

.Todd:
	farwritetext UnknownText_0x1b618f
	buttonsound
	end

.Irwin:
	farwritetext UnknownText_0x1b6407
	buttonsound
	end

.Arnie:
	farwritetext UnknownText_0x1b6506
	buttonsound
	end

.Alan:
	farwritetext UnknownText_0x1b6624
	buttonsound
	end

.Chad:
	farwritetext UnknownText_0x1b6890
	buttonsound
	end

.Derek:
	farwritetext UnknownText_0x1b6a56
	buttonsound
	end

.Tully:
	farwritetext UnknownText_0x1b6bef
	buttonsound
	end

.Brent:
	farwritetext UnknownText_0x1b6d57
	buttonsound
	end

.Vance:
	farwritetext UnknownText_0x1b7112
	buttonsound
	end

.Wilton:
	farwritetext UnknownText_0x1b7283
	buttonsound
	end

.Kenji:
	farwritetext UnknownText_0x1b7397
	buttonsound
	end

.Parry:
	farwritetext UnknownText_0x1b746f
	buttonsound
	end

PhoneScript_GreetPhone_Male_Nite:
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
	farwritetext UnknownText_0x1b4e9e
	buttonsound
	end

.Huey:
	farwritetext UnknownText_0x1b5154
	buttonsound
	end

.Gaven:
	farwritetext UnknownText_0x1b535f
	buttonsound
	end

.Jose:
	farwritetext UnknownText_0x1b5670
	buttonsound
	end

.Joey:
	farwritetext UnknownText_0x1b597c
	buttonsound
	end

.Wade:
	farwritetext UnknownText_0x1b5b37
	buttonsound
	end

.Ralph:
	farwritetext UnknownText_0x1b5d39
	buttonsound
	end

.Anthony:
	farwritetext UnknownText_0x1b6041
	buttonsound
	end

.Todd:
	farwritetext UnknownText_0x1b61bd
	buttonsound
	end

.Irwin:
	farwritetext UnknownText_0x1b642c
	buttonsound
	end

.Arnie:
	farwritetext UnknownText_0x1b6539
	buttonsound
	end

.Alan:
	farwritetext UnknownText_0x1b663b
	buttonsound
	end

.Chad:
	farwritetext UnknownText_0x1b68ba
	buttonsound
	end

.Derek:
	farwritetext UnknownText_0x1b6a8b
	buttonsound
	end

.Tully:
	farwritetext UnknownText_0x1b6c23
	buttonsound
	end

.Brent:
	farwritetext UnknownText_0x1b6d88
	buttonsound
	end

.Vance:
	farwritetext UnknownText_0x1b7132
	buttonsound
	end

.Wilton:
	farwritetext UnknownText_0x1b72a5
	buttonsound
	end

.Kenji:
	farwritetext UnknownText_0x1b73af
	buttonsound
	end

.Parry:
	farwritetext UnknownText_0x1b749b
	buttonsound
	end

PhoneScript_GreetPhone_Female:
	checktime DAY
	iftrue PhoneScript_GreetPhone_Female_Day
	checktime NITE
	iftrue PhoneScript_GreetPhone_Female_Nite
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
	farwritetext UnknownText_0x1b4fa1
	buttonsound
	end

.Beth:
	farwritetext UnknownText_0x1b5472
	buttonsound
	end

.Reena:
	farwritetext UnknownText_0x1b5786
	buttonsound
	end

.Liz:
	farwritetext UnknownText_0x1b5e25
	buttonsound
	end

.Gina:
	farwritetext UnknownText_0x1b62f1
	buttonsound
	end

.Dana:
	farwritetext UnknownText_0x1b6738
	buttonsound
	end

.Tiffany:
	farwritetext UnknownText_0x1b6ef3
	buttonsound
	end

.Erin:
	farwritetext UnknownText_0x1b758f
	buttonsound
	end

PhoneScript_GreetPhone_Female_Day:
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
	farwritetext UnknownText_0x1b4fda
	buttonsound
	end

.Beth:
	farwritetext UnknownText_0x1b54a6
	buttonsound
	end

.Reena:
	farwritetext UnknownText_0x1b57b7
	buttonsound
	end

.Liz:
	farwritetext UnknownText_0x1b5e59
	buttonsound
	end

.Gina:
	farwritetext UnknownText_0x1b630e
	buttonsound
	end

.Dana:
	farwritetext UnknownText_0x1b6757
	buttonsound
	end

.Tiffany:
	farwritetext UnknownText_0x1b6f1c
	buttonsound
	end

.Erin:
	farwritetext UnknownText_0x1b75ac
	buttonsound
	end

PhoneScript_GreetPhone_Female_Nite:
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
	farwritetext UnknownText_0x1b5004
	buttonsound
	end

.Beth:
	farwritetext UnknownText_0x1b54d4
	buttonsound
	end

.Reena:
	farwritetext UnknownText_0x1b57e8
	buttonsound
	end

.Liz:
	farwritetext UnknownText_0x1b5e8e
	buttonsound
	end

.Gina:
	farwritetext UnknownText_0x1b6331
	buttonsound
	end

.Dana:
	farwritetext UnknownText_0x1b6776
	buttonsound
	end

.Tiffany:
	farwritetext UnknownText_0x1b6f37
	buttonsound
	end

.Erin:
	farwritetext UnknownText_0x1b75c9
	buttonsound
	end

PhoneScript_Generic_Male:
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
	farwritetext UnknownText_0x1b4ecd
	buttonsound
	end

.Unknown:
	farwritetext UnknownText_0x1b518b
	buttonsound
	end

.Gaven:
	farwritetext UnknownText_0x1b5393
	buttonsound
	end

.Jose:
	farwritetext UnknownText_0x1b5694
	buttonsound
	end

.Joey:
	farwritetext UnknownText_0x1b59b2
	buttonsound
	end

.Wade:
	farwritetext UnknownText_0x1b5b68
	buttonsound
	end

.Ralph:
	farwritetext UnknownText_0x1b5d51
	buttonsound
	end

.Anthony:
	farwritetext UnknownText_0x1b606f
	buttonsound
	end

.Todd:
	farwritetext UnknownText_0x1b61f2
	buttonsound
	end

.Arnie:
	farwritetext UnknownText_0x1b656c
	buttonsound
	end

.Alan:
	farwritetext UnknownText_0x1b6652
	buttonsound
	end

.Chad:
	farwritetext UnknownText_0x1b68e8
	buttonsound
	end

.Derek:
	farwritetext UnknownText_0x1b6ac2
	buttonsound
	end

.Tully:
	farwritetext UnknownText_0x1b6c56
	buttonsound
	end

.Brent:
	farwritetext UnknownText_0x1b6db9
	buttonsound
	end

.Vance:
	farwritetext UnknownText_0x1b7161
	buttonsound
	end

.Wilton:
	farwritetext UnknownText_0x1b72d0
	buttonsound
	end

.Parry:
	farwritetext UnknownText_0x1b74c8
	buttonsound
	end

PhoneScript_Generic_Female:
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
	farwritetext UnknownText_0x1b502b
	buttonsound
	end

.Beth:
	farwritetext UnknownText_0x1b5510
	buttonsound
	end

.Reena:
	farwritetext UnknownText_0x1b5819
	buttonsound
	end

.Liz:
	farwritetext UnknownText_0x1b5ebe
	buttonsound
	end

.Gina:
	farwritetext UnknownText_0x1b6352
	buttonsound
	end

.Dana:
	farwritetext UnknownText_0x1b6795
	buttonsound
	end

.Tiffany:
	farwritetext UnknownText_0x1b6f60
	buttonsound
	end

.Erin:
	farwritetext UnknownText_0x1b75e5
	buttonsound
	end

PhoneScript_MonFlavorText:
	special RandomPhoneMon
	farscall PhoneScript_Random2
	ifequal $0, .TooEnergetic
	farwritetext UnknownText_0x1b518b
	buttonsound
	farsjump PhoneScript_HangupText_Male

.TooEnergetic:
	farsjump .unnecessary

.unnecessary
	farwritetext UnknownText_0x1b522b
	buttonsound
	farsjump PhoneScript_HangupText_Male

GrandmaString: db "Grandma@"
GrandpaString: db "Grandpa@"
MomString: db "Mom@"
DadString: db "Dad@"
SisterString: db "Sister@"
BrotherString: db "Brother@"
