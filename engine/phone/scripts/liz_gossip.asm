UnknownScript_0xa06da:
	random 10
	ifequal 0, .RuinsOfAlph
	ifequal 1, .Falkner
	ifequal 2, .Earl
	ifequal 3, .SurfPikachu
	ifequal 4, .MooMooMilk
	ifequal 5, .Salon
	ifequal 6, .Whitney
	ifequal 7, .BugCatchingContest
	ifequal 8, .BeautifulMon
	ifequal 9, .Forgot

.RuinsOfAlph:
	farwritetext UnknownText_0x176223
	buttonsound
	sjump PhoneScript_HangupText_Female

.Falkner:
	farwritetext UnknownText_0x1762c3
	buttonsound
	sjump PhoneScript_HangupText_Female

.Earl:
	farwritetext UnknownText_0x17638a
	buttonsound
	sjump PhoneScript_HangupText_Female

.SurfPikachu:
	farwritetext UnknownText_0x176424
	buttonsound
	sjump PhoneScript_HangupText_Female

.MooMooMilk:
	farwritetext UnknownText_0x1764eb
	buttonsound
	sjump PhoneScript_HangupText_Female

.Salon:
	farwritetext UnknownText_0x176599
	buttonsound
	sjump PhoneScript_HangupText_Female

.Whitney:
	farwritetext UnknownText_0x1766ac
	buttonsound
	sjump PhoneScript_HangupText_Female

.BugCatchingContest:
	farwritetext UnknownText_0x17674f
	buttonsound
	sjump PhoneScript_HangupText_Female

.BeautifulMon:
	farwritetext UnknownText_0x176816
	buttonsound
	sjump PhoneScript_HangupText_Female

.Forgot:
	farwritetext UnknownText_0x17686d
	buttonsound
	sjump PhoneScript_HangupText_Female
