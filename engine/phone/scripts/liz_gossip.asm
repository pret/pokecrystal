LizGossipRandomScript:
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
	farwritetext LizRuinsOfAlphGossipText
	buttonsound
	sjump PhoneScript_HangupText_Female

.Falkner:
	farwritetext LizFalknerGossipText
	buttonsound
	sjump PhoneScript_HangupText_Female

.Earl:
	farwritetext LizEarlGossipText
	buttonsound
	sjump PhoneScript_HangupText_Female

.SurfPikachu:
	farwritetext LizSurfPikachuGossipText
	buttonsound
	sjump PhoneScript_HangupText_Female

.MooMooMilk:
	farwritetext LizMooMooMilkGossipText
	buttonsound
	sjump PhoneScript_HangupText_Female

.Salon:
	farwritetext LizSalonGossipText
	buttonsound
	sjump PhoneScript_HangupText_Female

.Whitney:
	farwritetext LizWhitneyGossipText
	buttonsound
	sjump PhoneScript_HangupText_Female

.BugCatchingContest:
	farwritetext LizBugCatchingContestGossipText
	buttonsound
	sjump PhoneScript_HangupText_Female

.BeautifulMon:
	farwritetext LizBeautifulMonGossipText
	buttonsound
	sjump PhoneScript_HangupText_Female

.Forgot:
	farwritetext LizForgotGossipText
	buttonsound
	sjump PhoneScript_HangupText_Female
