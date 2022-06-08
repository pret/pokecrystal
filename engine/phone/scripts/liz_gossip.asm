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
	ifequal 8, .BeautifulTrainer
	ifequal 9, .Forgot

.RuinsOfAlph:
	farwritetext LizRuinsOfAlphGossipText
	promptbutton
	sjump PhoneScript_HangUpText_Female

.Falkner:
	farwritetext LizFalknerGossipText
	promptbutton
	sjump PhoneScript_HangUpText_Female

.Earl:
	farwritetext LizEarlGossipText
	promptbutton
	sjump PhoneScript_HangUpText_Female

.SurfPikachu:
	farwritetext LizSurfPikachuGossipText
	promptbutton
	sjump PhoneScript_HangUpText_Female

.MooMooMilk:
	farwritetext LizMooMooMilkGossipText
	promptbutton
	sjump PhoneScript_HangUpText_Female

.Salon:
	farwritetext LizSalonGossipText
	promptbutton
	sjump PhoneScript_HangUpText_Female

.Whitney:
	farwritetext LizWhitneyGossipText
	promptbutton
	sjump PhoneScript_HangUpText_Female

.BugCatchingContest:
	farwritetext LizBugCatchingContestGossipText
	promptbutton
	sjump PhoneScript_HangUpText_Female

.BeautifulTrainer:
	farwritetext LizBeautifulTrainerGossipText
	promptbutton
	sjump PhoneScript_HangUpText_Female

.Forgot:
	farwritetext LizForgotGossipText
	promptbutton
	sjump PhoneScript_HangUpText_Female
