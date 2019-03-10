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
	farwritetext UnknownText_0x662bc
	buttonsound
	sjump PhoneScript_HangupText_Male

.Grandpa:
	farwritetext UnknownText_0x662fc
	buttonsound
	sjump PhoneScript_HangupText_Male

.Goldenrod:
	farwritetext UnknownText_0x66335
	buttonsound
	sjump PhoneScript_HangupText_Male

.Route25:
	farwritetext UnknownText_0x66366
	buttonsound
	sjump PhoneScript_HangupText_Male

.Abra:
	farwritetext UnknownText_0x663a1
	buttonsound
	sjump PhoneScript_HangupText_Male

.Sister:
	farwritetext UnknownText_0x663e6
	buttonsound
	sjump PhoneScript_HangupText_Male

.Milk:
	farwritetext UnknownText_0x66421
	buttonsound
	sjump PhoneScript_HangupText_Male

.Battling:
	farwritetext UnknownText_0x6645f
	buttonsound
	sjump PhoneScript_HangupText_Male

.FlowerShop:
	farwritetext UnknownText_0x6649b
	buttonsound
	sjump PhoneScript_HangupText_Male

.KimonoGirl:
	farwritetext UnknownText_0x664dd
	buttonsound
	sjump PhoneScript_HangupText_Male
