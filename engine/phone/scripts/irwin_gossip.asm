IrwinRumorScript:
	checkevent EVENT_OPENED_MT_SILVER
	iftrue .MtSilver
	checkevent EVENT_FOUGHT_SNORLAX
	iftrue .Snorlax
	checkevent EVENT_GOT_PASS_FROM_COPYCAT
	iftrue .TrainPass
	checkflag ENGINE_MARSHBADGE
	iftrue .MarshBadge
	checkflag ENGINE_FLYPOINT_VERMILION
	iftrue .VermilionCity
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .EliteFour
	checkflag ENGINE_RISINGBADGE
	iftrue .RisingBadge
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .RadioTower
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .RocketHideout
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iftrue .JasmineReturned
	checkflag ENGINE_FOGBADGE
	iftrue .FogBadge
	checkflag ENGINE_PLAINBADGE
	iftrue .PlainBadge
	farwritetext IrwinCalledRightAwayText
	buttonsound
	sjump PhoneScript_HangupText_Male

.PlainBadge:
	farwritetext UnknownText_0x64099
	buttonsound
	sjump PhoneScript_HangupText_Male

.JasmineReturned:
	farwritetext UnknownText_0x640e6
	buttonsound
	sjump PhoneScript_HangupText_Male

.RocketHideout:
	farwritetext UnknownText_0x6416d
	buttonsound
	sjump PhoneScript_HangupText_Male

.RadioTower:
	farwritetext UnknownText_0x641e8
	buttonsound
	sjump PhoneScript_HangupText_Male

.RisingBadge:
	farwritetext UnknownText_0x64247
	buttonsound
	sjump PhoneScript_HangupText_Male

.EliteFour:
	farwritetext UnknownText_0x642bb
	buttonsound
	sjump PhoneScript_HangupText_Male

.VermilionCity:
	farwritetext UnknownText_0x643d4
	buttonsound
	sjump PhoneScript_HangupText_Male

.TrainPass:
	farwritetext UnknownText_0x64448
	buttonsound
	sjump PhoneScript_HangupText_Male

.Snorlax:
	farwritetext UnknownText_0x6455b
	buttonsound
	sjump PhoneScript_HangupText_Male

.MtSilver:
	farwritetext UnknownText_0x645ff
	buttonsound
	sjump PhoneScript_HangupText_Male

.FogBadge:
	farwritetext UnknownText_0x646df
	buttonsound
	sjump PhoneScript_HangupText_Male

.MarshBadge:
	farwritetext UnknownText_0x647d8
	buttonsound
	sjump PhoneScript_HangupText_Male
