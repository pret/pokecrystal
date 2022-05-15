ChadOakGossipScript:
	random 10
	ifequal 0, .Blue
	ifequal 1, .Daisy
	ifequal 2, .ProfElm
	ifequal 3, .Dream
	ifequal 4, .Kurt
	ifequal 5, .League
	ifequal 6, .RadioShow
	ifequal 7, .Battling
	ifequal 8, .DaisyTea
	ifequal 9, .Traveled

.Blue:
	farwritetext ChadBlueGossipText
	promptbutton
	sjump PhoneScript_HangUpText_Male

.Daisy:
	farwritetext ChadDaisyGossipText
	promptbutton
	sjump PhoneScript_HangUpText_Male

.ProfElm:
	farwritetext ChadProfElmGossipText
	promptbutton
	sjump PhoneScript_HangUpText_Male

.Dream:
	farwritetext ChadProfOaksDreamGossipText
	promptbutton
	sjump PhoneScript_HangUpText_Male

.Kurt:
	farwritetext ChadKurtGossipText
	promptbutton
	sjump PhoneScript_HangUpText_Male

.League:
	farwritetext ChadLeagueGossipText
	promptbutton
	sjump PhoneScript_HangUpText_Male

.RadioShow:
	farwritetext ChadPokemonTalkGossipText
	promptbutton
	sjump PhoneScript_HangUpText_Male

.Battling:
	farwritetext ChadProfOakTrainerGossipText
	promptbutton
	sjump PhoneScript_HangUpText_Male

.DaisyTea:
	farwritetext ChadDaisyTeaGossipText
	promptbutton
	sjump PhoneScript_HangUpText_Male

.Traveled:
	farwritetext ChadProfOakTravelingGossipText
	promptbutton
	sjump PhoneScript_HangUpText_Male
