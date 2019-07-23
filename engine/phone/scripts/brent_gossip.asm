BrentBillTriviaScript:
	random 10
	ifequal 0, .Father
	ifequal 1, .Grandpa
	ifequal 2, .Goldenrod
	ifequal 3, .Route25
	ifequal 4, .Abra
	ifequal 5, .Sister
	ifequal 6, .Milk
	ifequal 7, .Battling
	ifequal 8, .FlowerShop
	ifequal 9, .KimonoGirl

.Father:
	farwritetext BrentFatherGossipText
	buttonsound
	sjump PhoneScript_HangupText_Male

.Grandpa:
	farwritetext BrentGrandpaGossipText
	buttonsound
	sjump PhoneScript_HangupText_Male

.Goldenrod:
	farwritetext BrentGoldenrodGossipText
	buttonsound
	sjump PhoneScript_HangupText_Male

.Route25:
	farwritetext BrentRoute25GossipText
	buttonsound
	sjump PhoneScript_HangupText_Male

.Abra:
	farwritetext BrentAbraGossipText
	buttonsound
	sjump PhoneScript_HangupText_Male

.Sister:
	farwritetext BrentSisterGossipText
	buttonsound
	sjump PhoneScript_HangupText_Male

.Milk:
	farwritetext BrentMilkGossipText
	buttonsound
	sjump PhoneScript_HangupText_Male

.Battling:
	farwritetext BrentBattlingGossipText
	buttonsound
	sjump PhoneScript_HangupText_Male

.FlowerShop:
	farwritetext BrentFlowerShopGossipText
	buttonsound
	sjump PhoneScript_HangupText_Male

.KimonoGirl:
	farwritetext BrentKimonoGirlGossipText
	buttonsound
	sjump PhoneScript_HangupText_Male
