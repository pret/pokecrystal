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
	promptbutton
	sjump PhoneScript_HangUpText_Male

.Grandpa:
	farwritetext BrentGrandpaGossipText
	promptbutton
	sjump PhoneScript_HangUpText_Male

.Goldenrod:
	farwritetext BrentGoldenrodGossipText
	promptbutton
	sjump PhoneScript_HangUpText_Male

.Route25:
	farwritetext BrentRoute25GossipText
	promptbutton
	sjump PhoneScript_HangUpText_Male

.Abra:
	farwritetext BrentAbraGossipText
	promptbutton
	sjump PhoneScript_HangUpText_Male

.Sister:
	farwritetext BrentSisterGossipText
	promptbutton
	sjump PhoneScript_HangUpText_Male

.Milk:
	farwritetext BrentMilkGossipText
	promptbutton
	sjump PhoneScript_HangUpText_Male

.Battling:
	farwritetext BrentBattlingGossipText
	promptbutton
	sjump PhoneScript_HangUpText_Male

.FlowerShop:
	farwritetext BrentFlowerShopGossipText
	promptbutton
	sjump PhoneScript_HangUpText_Male

.KimonoGirl:
	farwritetext BrentKimonoGirlGossipText
	promptbutton
	sjump PhoneScript_HangUpText_Male
