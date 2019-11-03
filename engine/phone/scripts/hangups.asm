JackPhoneTipsScript:
	farwritetext JackHeardSomeGreatTipsText
	promptbutton
	sjump PhoneScript_HangUpText_Male

BeverlyHangUpScript:
	farwritetext BeverlyLetsChatAboutMonAgainText
	promptbutton
	sjump PhoneScript_HangUpText_Female

HueyHangUpScript:
	farwritetext HueyWeHaveToBattleAgainSometimeText
	promptbutton
	sjump PhoneScript_HangUpText_Male

GavenHangUpNotThursdayScript:
	farwritetext GavenHangUpNotThursdayText
	promptbutton
	sjump PhoneScript_HangUpText_Male

BethHangUpScript:
	farwritetext BethLetsBattleAgainSometimeText
	promptbutton
	sjump PhoneScript_HangUpText_Female

JoseHangUpScript:
	farwritetext JoseHaventGottenItemYetText
	promptbutton
	sjump PhoneScript_HangUpText_Male

ReenaForwardScript:
	farwritetext ReenaForwardText
	promptbutton
	sjump PhoneScript_HangUpText_Female

JoeyHangUpScript:
	farwritetext JoeyDevisingStrategiesText
	promptbutton
	sjump PhoneScript_HangUpText_Male

WadeNoBerriesScript:
	farwritetext WadeNoBerriesText
	promptbutton
	sjump PhoneScript_HangUpText_Male

RalphNoItemScript:
	farwritetext RalphNoItemText
	promptbutton
	sjump PhoneScript_HangUpText_Male

LizHangUpScript:
	farwritetext LizFawningOverMonText
	promptbutton
	sjump PhoneScript_HangUpText_Female

AnthonyHangUpScript:
	farwritetext AnthonyWasntPayingAttentionText
	promptbutton
	sjump PhoneScript_HangUpText_Male

ToddNoItemScript:
	farwritetext ToddSavingUpForBargainSaleText
	promptbutton
	sjump PhoneScript_HangUpText_Male

GinaHangUpScript:
	farwritetext GinaHaventFoundAnythingYetText
	promptbutton
	sjump PhoneScript_HangUpText_Female

ArnieHangUpScript:
	farwritetext ArnieHaventSeenRareMonText
	promptbutton
	sjump PhoneScript_HangUpText_Male

AlanHangUpScript:
	farwritetext AlanHaventPickedUpAnythingText
	promptbutton
	sjump PhoneScript_HangUpText_Male

DanaHangUpScript:
	farwritetext DanaCanYouWaitABitLongerText
	promptbutton
	sjump PhoneScript_HangUpText_Female

ChadHangUpScript:
	farwritetext ChadGoingToStudyHardText
	promptbutton
	sjump PhoneScript_HangUpText_Male

DerekHangUpScript:
	farwritetext DerekLetsGetTogetherText
	promptbutton
	sjump PhoneScript_HangUpText_Male

TullyNoItemScript:
	farwritetext TullyNoItemText
	promptbutton
	sjump PhoneScript_HangUpText_Male

BrentHangUpScript:
	farwritetext BrentSorryImTooBusyText
	promptbutton
	sjump PhoneScript_HangUpText_Male

TiffanyNoItemScript:
	farwritetext TiffanyNoItemText
	promptbutton
	sjump PhoneScript_HangUpText_Female

VanceLookingForwardScript:
	farwritetext VanceLookingForwardText
	promptbutton
	sjump PhoneScript_HangUpText_Male

WiltonHaventFoundAnythingScript:
	farwritetext WiltonHaventFoundAnythingText
	promptbutton
	sjump PhoneScript_HangUpText_Male

ParryBattleWithMeScript:
	farwritetext ParryBattleWithMeText
	promptbutton
	sjump PhoneScript_HangUpText_Male

ErinWorkingHardScript:
	farwritetext ErinWorkingHardText
	promptbutton
	sjump PhoneScript_HangUpText_Female

IrwinRandomTextScript:
	random 3
	ifequal 0, IrwinEscapadeScript
	ifequal 1, IrwinGoodMatchScript
	ifequal 2, IrwinSoMuchToChatAboutScript

IrwinEscapadeScript:
	farwritetext IrwinYourEscapadesRockText
	promptbutton
	sjump PhoneScript_HangUpText_Male

IrwinGoodMatchScript:
	farwritetext IrwinGoodMatchText
	promptbutton
	sjump PhoneScript_HangUpText_Male

IrwinSoMuchToChatAboutScript:
	farwritetext IrwinSoMuchToChatAboutText
	promptbutton
	sjump PhoneScript_HangUpText_Male

KenjiAnswerPhoneScript:
	readvar VAR_KENJI_BREAK
	ifequal 2, .Training
	ifequal 1, .OnBreak
	farwritetext KenjiCallMeBackAnotherTimeText
	promptbutton
	sjump PhoneScript_HangUpText_Male

.Training:
	farwritetext KenjiIllHaveTimeToChatTomorrowText
	promptbutton
	sjump PhoneScript_HangUpText_Male

.OnBreak:
	checktime MORN
	iftrue .Morning
	checktime NITE
	iftrue .Night
	setevent EVENT_KENJI_ON_BREAK
	farwritetext KenjiTakingABreakText
	promptbutton
	sjump PhoneScript_HangUpText_Male

.Morning:
	farwritetext KenjiHangUpMorningText
	promptbutton
	sjump PhoneScript_HangUpText_Male

.Night:
	farwritetext KenjiHangUpNightText
	promptbutton
	sjump PhoneScript_HangUpText_Male
