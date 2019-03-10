BillPhoneCalleeScript:
	checktime DAY
	iftrue .daygreet
	checktime NITE
	iftrue .nitegreet
	farwritetext BillPhoneMornGreetingText
	buttonsound
	sjump .main

.daygreet
	farwritetext BillPhoneDayGreetingText
	buttonsound
	sjump .main

.nitegreet
	farwritetext BillPhoneNiteGreetingText
	buttonsound
	sjump .main

.main
	farwritetext BillPhoneGenericText
	buttonsound
	readvar VAR_BOXSPACE
	getnum STRING_BUFFER_3
	ifequal 0, .full
	ifless PARTY_LENGTH, .nearlyfull
	farwritetext BillPhoneNotFullText
	end

.nearlyfull
	farwritetext BillPhoneNearlyFullText
	end

.full
	farwritetext BillPhoneFullText
	end

BillPhoneCallerScript:
	farwritetext BillPhoneNewlyFullText
	waitbutton
	end
