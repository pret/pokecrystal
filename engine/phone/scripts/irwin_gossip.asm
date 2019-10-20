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
	sjump PhoneScript_HangUpText_Male

.PlainBadge:
	farwritetext IrwinPlainBadgeGossipText
	buttonsound
	sjump PhoneScript_HangUpText_Male

.JasmineReturned:
	farwritetext IrwinJasmineReturnedGossipText
	buttonsound
	sjump PhoneScript_HangUpText_Male

.RocketHideout:
	farwritetext IrwinRocketHideoutGossipText
	buttonsound
	sjump PhoneScript_HangUpText_Male

.RadioTower:
	farwritetext IrwinRadioTowerGossipText
	buttonsound
	sjump PhoneScript_HangUpText_Male

.RisingBadge:
	farwritetext IrwinRisingBadgeGossipText
	buttonsound
	sjump PhoneScript_HangUpText_Male

.EliteFour:
	farwritetext IrwinEliteFourGossipText
	buttonsound
	sjump PhoneScript_HangUpText_Male

.VermilionCity:
	farwritetext IrwinVermilionCityGossipText
	buttonsound
	sjump PhoneScript_HangUpText_Male

.TrainPass:
	farwritetext IrwinTrainPassGossipText
	buttonsound
	sjump PhoneScript_HangUpText_Male

.Snorlax:
	farwritetext IrwinSnorlaxGossipText
	buttonsound
	sjump PhoneScript_HangUpText_Male

.MtSilver:
	farwritetext IrwinMtSilverGossipText
	buttonsound
	sjump PhoneScript_HangUpText_Male

.FogBadge:
	farwritetext IrwinFogBadgeGossipText
	buttonsound
	sjump PhoneScript_HangUpText_Male

.MarshBadge:
	farwritetext IrwinMarshBadgeGossipText
	buttonsound
	sjump PhoneScript_HangUpText_Male
