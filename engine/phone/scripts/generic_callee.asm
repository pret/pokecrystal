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
	farwritetext JackAnswerPhoneText
	buttonsound
	end

.Huey:
	farwritetext HueyAnswerPhoneText
	buttonsound
	end

.Gaven:
	farwritetext GavenAnswerPhoneText
	buttonsound
	end

.Jose:
	farwritetext JoseAnswerPhoneText
	buttonsound
	end

.Joey:
	farwritetext JoeyAnswerPhoneText
	buttonsound
	end

.Wade:
	farwritetext WadeAnswerPhoneText
	buttonsound
	end

.Ralph:
	farwritetext RalphAnswerPhoneText
	buttonsound
	end

.Anthony:
	farwritetext AnthonyAnswerPhoneText
	buttonsound
	end

.Todd:
	farwritetext ToddAnswerPhoneText
	buttonsound
	end

.Irwin:
	farwritetext IrwinAnswerPhoneText
	buttonsound
	end

.Arnie:
	farwritetext ArnieAnswerPhoneText
	buttonsound
	end

.Alan:
	farwritetext AlanAnswerPhoneText
	buttonsound
	end

.Chad:
	farwritetext ChadAnswerPhoneText
	buttonsound
	end

.Derek:
	farwritetext DerekAnswerPhoneText
	buttonsound
	end

.Tully:
	farwritetext TullyAnswerPhoneText
	buttonsound
	end

.Brent:
	farwritetext BrentAnswerPhoneText
	buttonsound
	end

.Vance:
	farwritetext VanceAnswerPhoneText
	buttonsound
	end

.Wilton:
	farwritetext WiltonAnswerPhoneText
	buttonsound
	end

.Kenji:
	farwritetext KenjiAnswerPhoneText
	buttonsound
	end

.Parry:
	farwritetext ParryAnswerPhoneText
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
	farwritetext JackAnswerPhoneDayText
	buttonsound
	end

.Huey:
	farwritetext HueyAnswerPhoneDayText
	buttonsound
	end

.Gaven:
	farwritetext GavenAnswerPhoneDayText
	buttonsound
	end

.Jose:
	farwritetext JoseAnswerPhoneDayText
	buttonsound
	end

.Joey:
	farwritetext JoeyAnswerPhoneDayText
	buttonsound
	end

.Wade:
	farwritetext WadeAnswerPhoneDayText
	buttonsound
	end

.Ralph:
	farwritetext RalphAnswerPhoneDayText
	buttonsound
	end

.Anthony:
	farwritetext AnthonyAnswerPhoneDayText
	buttonsound
	end

.Todd:
	farwritetext ToddAnswerPhoneDayText
	buttonsound
	end

.Irwin:
	farwritetext IrwinAnswerPhoneDayText
	buttonsound
	end

.Arnie:
	farwritetext ArnieAnswerPhoneDayText
	buttonsound
	end

.Alan:
	farwritetext AlanAnswerPhoneDayText
	buttonsound
	end

.Chad:
	farwritetext ChadAnswerPhoneDayText
	buttonsound
	end

.Derek:
	farwritetext DerekAnswerPhoneDayText
	buttonsound
	end

.Tully:
	farwritetext TullyAnswerPhoneDayText
	buttonsound
	end

.Brent:
	farwritetext BrentAnswerPhoneDayText
	buttonsound
	end

.Vance:
	farwritetext VanceAnswerPhoneDayText
	buttonsound
	end

.Wilton:
	farwritetext WiltonAnswerPhoneDayText
	buttonsound
	end

.Kenji:
	farwritetext KenjiAnswerPhoneDayText
	buttonsound
	end

.Parry:
	farwritetext ParryAnswerPhoneDayText
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
	farwritetext JackAnswerPhoneNiteText
	buttonsound
	end

.Huey:
	farwritetext HueyAnswerPhoneNiteText
	buttonsound
	end

.Gaven:
	farwritetext GavenAnswerPhoneNiteText
	buttonsound
	end

.Jose:
	farwritetext JoseAnswerPhoneNiteText
	buttonsound
	end

.Joey:
	farwritetext JoeyAnswerPhoneNiteText
	buttonsound
	end

.Wade:
	farwritetext WadeAnswerPhoneNiteText
	buttonsound
	end

.Ralph:
	farwritetext RalphAnswerPhoneNiteText
	buttonsound
	end

.Anthony:
	farwritetext AnthonyAnswerPhoneNiteText
	buttonsound
	end

.Todd:
	farwritetext ToddAnswerPhoneNiteText
	buttonsound
	end

.Irwin:
	farwritetext IrwinAnswerPhoneNiteText
	buttonsound
	end

.Arnie:
	farwritetext ArnieAnswerPhoneNiteText
	buttonsound
	end

.Alan:
	farwritetext AlanAnswerPhoneNiteText
	buttonsound
	end

.Chad:
	farwritetext ChadAnswerPhoneNiteText
	buttonsound
	end

.Derek:
	farwritetext DerekAnswerPhoneNiteText
	buttonsound
	end

.Tully:
	farwritetext TullyAnswerPhoneNiteText
	buttonsound
	end

.Brent:
	farwritetext BrentAnswerPhoneNiteText
	buttonsound
	end

.Vance:
	farwritetext VanceAnswerPhoneNiteText
	buttonsound
	end

.Wilton:
	farwritetext WiltonAnswerPhoneNiteText
	buttonsound
	end

.Kenji:
	farwritetext KenjiAnswerPhoneNiteText
	buttonsound
	end

.Parry:
	farwritetext ParryAnswerPhoneNiteText
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
	farwritetext BeverlyAnswerPhoneText
	buttonsound
	end

.Beth:
	farwritetext BethAnswerPhoneText
	buttonsound
	end

.Reena:
	farwritetext ReenaAnswerPhoneText
	buttonsound
	end

.Liz:
	farwritetext LizAnswerPhoneText
	buttonsound
	end

.Gina:
	farwritetext GinaAnswerPhoneText
	buttonsound
	end

.Dana:
	farwritetext DanaAnswerPhoneText
	buttonsound
	end

.Tiffany:
	farwritetext TiffanyAnswerPhoneText
	buttonsound
	end

.Erin:
	farwritetext ErinAnswerPhoneText
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
	farwritetext BeverlyAnswerPhoneDayText
	buttonsound
	end

.Beth:
	farwritetext BethAnswerPhoneDayText
	buttonsound
	end

.Reena:
	farwritetext ReenaAnswerPhoneDayText
	buttonsound
	end

.Liz:
	farwritetext LizAnswerPhoneDayText
	buttonsound
	end

.Gina:
	farwritetext GinaAnswerPhoneDayText
	buttonsound
	end

.Dana:
	farwritetext DanaAnswerPhoneDayText
	buttonsound
	end

.Tiffany:
	farwritetext TiffanyAnswerPhoneDayText
	buttonsound
	end

.Erin:
	farwritetext ErinAnswerPhoneDayText
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
	farwritetext BeverlyAnswerPhoneNiteText
	buttonsound
	end

.Beth:
	farwritetext BethAnswerPhoneNiteText
	buttonsound
	end

.Reena:
	farwritetext ReenaAnswerPhoneNiteText
	buttonsound
	end

.Liz:
	farwritetext LizAnswerPhoneNiteText
	buttonsound
	end

.Gina:
	farwritetext GinaAnswerPhoneNiteText
	buttonsound
	end

.Dana:
	farwritetext DanaAnswerPhoneNiteText
	buttonsound
	end

.Tiffany:
	farwritetext TiffanyAnswerPhoneNiteText
	buttonsound
	end

.Erin:
	farwritetext ErinAnswerPhoneNiteText
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
	farwritetext JackGreetText
	buttonsound
	end

.Huey:
	farwritetext HueyGreetText
	buttonsound
	end

.Gaven:
	farwritetext GavenGreetText
	buttonsound
	end

.Jose:
	farwritetext JoseGreetText
	buttonsound
	end

.Joey:
	farwritetext JoeyGreetText
	buttonsound
	end

.Wade:
	farwritetext WadeGreetText
	buttonsound
	end

.Ralph:
	farwritetext RalphGreetText
	buttonsound
	end

.Anthony:
	farwritetext AnthonyGreetText
	buttonsound
	end

.Todd:
	farwritetext ToddGreetText
	buttonsound
	end

.Irwin:
	farwritetext IrwinGreetText
	buttonsound
	end

.Arnie:
	farwritetext ArnieGreetText
	buttonsound
	end

.Alan:
	farwritetext AlanGreetText
	buttonsound
	end

.Chad:
	farwritetext ChadGreetText
	buttonsound
	end

.Derek:
	farwritetext DerekGreetText
	buttonsound
	end

.Tully:
	farwritetext TullyGreetText
	buttonsound
	end

.Brent:
	farwritetext BrentGreetText
	buttonsound
	end

.Vance:
	farwritetext VanceGreetText
	buttonsound
	end

.Wilton:
	farwritetext WiltonGreetText
	buttonsound
	end

.Kenji:
	farwritetext KenjiGreetText
	buttonsound
	end

.Parry:
	farwritetext ParryGreetText
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
	farwritetext JackGreetDayText
	buttonsound
	end

.Huey:
	farwritetext HueyGreetDayText
	buttonsound
	end

.Gaven:
	farwritetext GavenGreetDayText
	buttonsound
	end

.Jose:
	farwritetext JoseGreetDayText
	buttonsound
	end

.Joey:
	farwritetext JoeyGreetDayText
	buttonsound
	end

.Wade:
	farwritetext WadeGreetDayText
	buttonsound
	end

.Ralph:
	farwritetext RalphGreetDayText
	buttonsound
	end

.Anthony:
	farwritetext AnthonyGreetDayText
	buttonsound
	end

.Todd:
	farwritetext ToddGreetDayText
	buttonsound
	end

.Irwin:
	farwritetext IrwinGreetDayText
	buttonsound
	end

.Arnie:
	farwritetext ArnieGreetDayText
	buttonsound
	end

.Alan:
	farwritetext AlanGreetDayText
	buttonsound
	end

.Chad:
	farwritetext ChadGreetDayText
	buttonsound
	end

.Derek:
	farwritetext DerekGreetDayText
	buttonsound
	end

.Tully:
	farwritetext TullyGreetDayText
	buttonsound
	end

.Brent:
	farwritetext BrentGreetDayText
	buttonsound
	end

.Vance:
	farwritetext VanceGreetDayText
	buttonsound
	end

.Wilton:
	farwritetext WiltonGreetDayText
	buttonsound
	end

.Kenji:
	farwritetext KenjiGreetDayText
	buttonsound
	end

.Parry:
	farwritetext ParryGreetDayText
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
	farwritetext JackGreetNiteText
	buttonsound
	end

.Huey:
	farwritetext HueyGreetNiteText
	buttonsound
	end

.Gaven:
	farwritetext GavenGreetNiteText
	buttonsound
	end

.Jose:
	farwritetext JoseGreetNiteText
	buttonsound
	end

.Joey:
	farwritetext JoeyGreetNiteText
	buttonsound
	end

.Wade:
	farwritetext WadeGreetNiteText
	buttonsound
	end

.Ralph:
	farwritetext RalphGreetNiteText
	buttonsound
	end

.Anthony:
	farwritetext AnthonyGreetNiteText
	buttonsound
	end

.Todd:
	farwritetext ToddGreetNiteText
	buttonsound
	end

.Irwin:
	farwritetext IrwinGreetNiteText
	buttonsound
	end

.Arnie:
	farwritetext ArnieGreetNiteText
	buttonsound
	end

.Alan:
	farwritetext AlanGreetNiteText
	buttonsound
	end

.Chad:
	farwritetext ChadGreetNiteText
	buttonsound
	end

.Derek:
	farwritetext DerekGreetNiteText
	buttonsound
	end

.Tully:
	farwritetext TullyGreetNiteText
	buttonsound
	end

.Brent:
	farwritetext BrentGreetNiteText
	buttonsound
	end

.Vance:
	farwritetext VanceGreetNiteText
	buttonsound
	end

.Wilton:
	farwritetext WiltonGreetNiteText
	buttonsound
	end

.Kenji:
	farwritetext KenjiGreetNiteText
	buttonsound
	end

.Parry:
	farwritetext ParryGreetNiteText
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
	farwritetext BeverlyGreetText
	buttonsound
	end

.Beth:
	farwritetext BethGreetText
	buttonsound
	end

.Reena:
	farwritetext ReenaGreetText
	buttonsound
	end

.Liz:
	farwritetext LizGreetText
	buttonsound
	end

.Gina:
	farwritetext GinaGreetText
	buttonsound
	end

.Dana:
	farwritetext DanaGreetText
	buttonsound
	end

.Tiffany:
	farwritetext TiffanyGreetText
	buttonsound
	end

.Erin:
	farwritetext ErinGreetText
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
	farwritetext BeverlyGreetDayText
	buttonsound
	end

.Beth:
	farwritetext BethGreetDayText
	buttonsound
	end

.Reena:
	farwritetext ReenaGreetDayText
	buttonsound
	end

.Liz:
	farwritetext LizGreetDayText
	buttonsound
	end

.Gina:
	farwritetext GinaGreetDayText
	buttonsound
	end

.Dana:
	farwritetext DanaGreetDayText
	buttonsound
	end

.Tiffany:
	farwritetext TiffanyGreetDayText
	buttonsound
	end

.Erin:
	farwritetext ErinGreetDayText
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
	farwritetext BeverlyGreetNiteText
	buttonsound
	end

.Beth:
	farwritetext BethGreetNiteText
	buttonsound
	end

.Reena:
	farwritetext ReenaGreetNiteText
	buttonsound
	end

.Liz:
	farwritetext LizGreetNiteText
	buttonsound
	end

.Gina:
	farwritetext GinaGreetNiteText
	buttonsound
	end

.Dana:
	farwritetext DanaGreetNiteText
	buttonsound
	end

.Tiffany:
	farwritetext TiffanyGreetNiteText
	buttonsound
	end

.Erin:
	farwritetext ErinGreetNiteText
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
	farwritetext JackGenericText
	buttonsound
	end

.Unknown:
	farwritetext UnknownGenericText
	buttonsound
	end

.Gaven:
	farwritetext GavenGenericText
	buttonsound
	end

.Jose:
	farwritetext JoseGenericText
	buttonsound
	end

.Joey:
	farwritetext JoeyGenericText
	buttonsound
	end

.Wade:
	farwritetext WadeGenericText
	buttonsound
	end

.Ralph:
	farwritetext RalphGenericText
	buttonsound
	end

.Anthony:
	farwritetext AnthonyGenericText
	buttonsound
	end

.Todd:
	farwritetext ToddGenericText
	buttonsound
	end

.Arnie:
	farwritetext ArnieGenericText
	buttonsound
	end

.Alan:
	farwritetext AlanGenericText
	buttonsound
	end

.Chad:
	farwritetext ChadGenericText
	buttonsound
	end

.Derek:
	farwritetext DerekGenericText
	buttonsound
	end

.Tully:
	farwritetext TullyGenericText
	buttonsound
	end

.Brent:
	farwritetext BrentGenericText
	buttonsound
	end

.Vance:
	farwritetext VanceGenericText
	buttonsound
	end

.Wilton:
	farwritetext WiltonGenericText
	buttonsound
	end

.Parry:
	farwritetext ParryGenericText
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
	farwritetext BeverlyGenericText
	buttonsound
	end

.Beth:
	farwritetext BethGenericText
	buttonsound
	end

.Reena:
	farwritetext ReenaGenericText
	buttonsound
	end

.Liz:
	farwritetext LizGenericText
	buttonsound
	end

.Gina:
	farwritetext GinaGenericText
	buttonsound
	end

.Dana:
	farwritetext DanaGenericText
	buttonsound
	end

.Tiffany:
	farwritetext TiffanyGenericText
	buttonsound
	end

.Erin:
	farwritetext ErinGenericText
	buttonsound
	end

PhoneScript_MonFlavorText:
	special RandomPhoneMon
	farscall PhoneScript_Random2
	ifequal $0, .TooEnergetic
	farwritetext UnknownGenericText
	buttonsound
	farsjump PhoneScript_HangupText_Male

.TooEnergetic:
	farsjump .unnecessary

.unnecessary
	farwritetext UnknownUnnecessaryText
	buttonsound
	farsjump PhoneScript_HangupText_Male

GrandmaString: db "Grandma@"
GrandpaString: db "Grandpa@"
MomString: db "Mom@"
DadString: db "Dad@"
SisterString: db "Sister@"
BrotherString: db "Brother@"
