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
	buttonsound
	sjump PhoneScript_HangUpText_Male

.Daisy:
	farwritetext ChadDaisyGossipText
	buttonsound
	sjump PhoneScript_HangUpText_Male

.ProfElm:
	farwritetext ChadProfElmGossipText
	buttonsound
	sjump PhoneScript_HangUpText_Male

.Dream:
	farwritetext ChadProfOaksDreamGossipText
	buttonsound
	sjump PhoneScript_HangUpText_Male

.Kurt:
	farwritetext ChadKurtGossipText
	buttonsound
	sjump PhoneScript_HangUpText_Male

.League:
	farwritetext ChadLeagueGossipText
	buttonsound
	sjump PhoneScript_HangUpText_Male

.RadioShow:
	farwritetext ChadPokemonTalkGossipText
	buttonsound
	sjump PhoneScript_HangUpText_Male

.Battling:
	farwritetext ChadProfOakTrainerGossipText
	buttonsound
	sjump PhoneScript_HangUpText_Male

.DaisyTea:
	farwritetext ChadDaisyTeaGossipText
	buttonsound
	sjump PhoneScript_HangUpText_Male

.Traveled:
	farwritetext ChadProfOakTravelingGossipText
	buttonsound
	sjump PhoneScript_HangUpText_Male
