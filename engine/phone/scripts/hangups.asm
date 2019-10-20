JackPhoneTipsScript:
	farwritetext JackHeardSomeGreatTipsText
	buttonsound
	sjump PhoneScript_HangUpText_Male

BeverlyHangUpScript:
	farwritetext BeverlyLetsChatAboutMonAgainText
	buttonsound
	sjump PhoneScript_HangUpText_Female

HueyHangUpScript:
	farwritetext HueyWeHaveToBattleAgainSometimeText
	buttonsound
	sjump PhoneScript_HangUpText_Male

GavenHangUpNotThursdayScript:
	farwritetext GavenHangUpNotThursdayText
	buttonsound
	sjump PhoneScript_HangUpText_Male

BethHangUpScript:
	farwritetext BethLetsBattleAgainSometimeText
	buttonsound
	sjump PhoneScript_HangUpText_Female

JoseHangUpScript:
	farwritetext JoseHaventGottenItemYetText
	buttonsound
	sjump PhoneScript_HangUpText_Male

ReenaForwardScript:
	farwritetext ReenaForwardText
	buttonsound
	sjump PhoneScript_HangUpText_Female

JoeyHangUpScript:
	farwritetext JoeyDevisingStrategiesText
	buttonsound
	sjump PhoneScript_HangUpText_Male

WadeNoBerriesScript:
	farwritetext WadeNoBerriesText
	buttonsound
	sjump PhoneScript_HangUpText_Male

RalphNoItemScript:
	farwritetext RalphNoItemText
	buttonsound
	sjump PhoneScript_HangUpText_Male

LizHangUpScript:
	farwritetext LizFawningOverMonText
	buttonsound
	sjump PhoneScript_HangUpText_Female

AnthonyHangUpScript:
	farwritetext AnthonyWasntPayingAttentionText
	buttonsound
	sjump PhoneScript_HangUpText_Male

ToddNoItemScript:
	farwritetext ToddSavingUpForBargainSaleText
	buttonsound
	sjump PhoneScript_HangUpText_Male

GinaHangUpScript:
	farwritetext GinaHaventFoundAnythingYetText
	buttonsound
	sjump PhoneScript_HangUpText_Female

ArnieHangUpScript:
	farwritetext ArnieHaventSeenRareMonText
	buttonsound
	sjump PhoneScript_HangUpText_Male

AlanHangUpScript:
	farwritetext AlanHaventPickedUpAnythingText
	buttonsound
	sjump PhoneScript_HangUpText_Male

DanaHangUpScript:
	farwritetext DanaCanYouWaitABitLongerText
	buttonsound
	sjump PhoneScript_HangUpText_Female

ChadHangUpScript:
	farwritetext ChadGoingToStudyHardText
	buttonsound
	sjump PhoneScript_HangUpText_Male

DerekHangUpScript:
	farwritetext DerekLetsGetTogetherText
	buttonsound
	sjump PhoneScript_HangUpText_Male

TullyNoItemScript:
	farwritetext TullyNoItemText
	buttonsound
	sjump PhoneScript_HangUpText_Male

BrentHangUpScript:
	farwritetext BrentSorryImTooBusyText
	buttonsound
	sjump PhoneScript_HangUpText_Male

TiffanyNoItemScript:
	farwritetext TiffanyNoItemText
	buttonsound
	sjump PhoneScript_HangUpText_Female

VanceLookingForwardScript:
	farwritetext VanceLookingForwardText
	buttonsound
	sjump PhoneScript_HangUpText_Male

WiltonHaventFoundAnythingScript:
	farwritetext WiltonHaventFoundAnythingText
	buttonsound
	sjump PhoneScript_HangUpText_Male

ParryBattleWithMeScript:
	farwritetext ParryBattleWithMeText
	buttonsound
	sjump PhoneScript_HangUpText_Male

ErinWorkingHardScript:
	farwritetext ErinWorkingHardText
	buttonsound
	sjump PhoneScript_HangUpText_Female

IrwinRandomTextScript:
	random 3
	ifequal 0, IrwinEscapadeScript
	ifequal 1, IrwinGoodMatchScript
	ifequal 2, IrwinSoMuchToChatAboutScript

IrwinEscapadeScript:
	farwritetext IrwinYourEscapadesRockText
	buttonsound
	sjump PhoneScript_HangUpText_Male

IrwinGoodMatchScript:
	farwritetext IrwinGoodMatchText
	buttonsound
	sjump PhoneScript_HangUpText_Male

IrwinSoMuchToChatAboutScript:
	farwritetext IrwinSoMuchToChatAboutText
	buttonsound
	sjump PhoneScript_HangUpText_Male

KenjiAnswerPhoneScript:
	readvar VAR_KENJI_BREAK
	ifequal 2, .Training
	ifequal 1, .OnBreak
	farwritetext KenjiCallMeBackAnotherTimeText
	buttonsound
	sjump PhoneScript_HangUpText_Male

.Training:
	farwritetext KenjiIllHaveTimeToChatTomorrowText
	buttonsound
	sjump PhoneScript_HangUpText_Male

.OnBreak:
	checktime MORN
	iftrue .Morning
	checktime NITE
	iftrue .Night
	setevent EVENT_KENJI_ON_BREAK
	farwritetext KenjiTakingABreakText
	buttonsound
	sjump PhoneScript_HangUpText_Male

.Morning:
	farwritetext KenjiHangUpMorningText
	buttonsound
	sjump PhoneScript_HangUpText_Male

.Night:
	farwritetext KenjiHangUpNightText
	buttonsound
	sjump PhoneScript_HangUpText_Male
