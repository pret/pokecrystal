JackPhoneTipsScript:
	farwritetext JackHeardSomeGreatTipsText
	buttonsound
	sjump PhoneScript_HangupText_Male

BeverlyHangupScript:
	farwritetext BeverlyLetsChatAboutMonAgainText
	buttonsound
	sjump PhoneScript_HangupText_Female

HueyHangupScript:
	farwritetext HueyWeHaveToBattleAgainSometimeText
	buttonsound
	sjump PhoneScript_HangupText_Male

GavenHangupNotThursdayScript:
	farwritetext GavenHangupNotThursdayText
	buttonsound
	sjump PhoneScript_HangupText_Male

BethHangupScript:
	farwritetext BethLetsBattleAgainSometimeText
	buttonsound
	sjump PhoneScript_HangupText_Female

JoseHangupScript:
	farwritetext JoseHaventGottenItemYetText
	buttonsound
	sjump PhoneScript_HangupText_Male

ReenaForwardScript:
	farwritetext ReenaForwardText
	buttonsound
	sjump PhoneScript_HangupText_Female

JoeyHangupScript:
	farwritetext JoeyDevisingStrategiesText
	buttonsound
	sjump PhoneScript_HangupText_Male

WadeNoBerriesScript:
	farwritetext WadeNoBerriesText
	buttonsound
	sjump PhoneScript_HangupText_Male

RalphNoItemScript:
	farwritetext RalphNoItemText
	buttonsound
	sjump PhoneScript_HangupText_Male

LizHangupScript:
	farwritetext LizFawningOverMonText
	buttonsound
	sjump PhoneScript_HangupText_Female

AnthonyHangupScript:
	farwritetext AnthonyWasntPayingAttentionText
	buttonsound
	sjump PhoneScript_HangupText_Male

ToddNoItemScript:
	farwritetext ToddSavingUpForBargainSaleText
	buttonsound
	sjump PhoneScript_HangupText_Male

GinaHangupScript:
	farwritetext GinaHaventFoundAnythingYetText
	buttonsound
	sjump PhoneScript_HangupText_Female

ArnieHangupScript:
	farwritetext ArnieHaventSeenRareMonText
	buttonsound
	sjump PhoneScript_HangupText_Male

AlanHangupScript:
	farwritetext AlanHaventPickedUpAnythingText
	buttonsound
	sjump PhoneScript_HangupText_Male

DanaHangupScript:
	farwritetext DanaCanYouWaitABitLongerText
	buttonsound
	sjump PhoneScript_HangupText_Female

ChadHangupScript:
	farwritetext ChadGoingToStudyHardText
	buttonsound
	sjump PhoneScript_HangupText_Male

DerekHangupScript:
	farwritetext DerekLetsGetTogetherText
	buttonsound
	sjump PhoneScript_HangupText_Male

TullyNoItemScript:
	farwritetext TullyNoItemText
	buttonsound
	sjump PhoneScript_HangupText_Male

BrentHangupScript:
	farwritetext BrentSorryImTooBusyText
	buttonsound
	sjump PhoneScript_HangupText_Male

TiffanyNoItemScript:
	farwritetext TiffanyNoItemText
	buttonsound
	sjump PhoneScript_HangupText_Female

VanceLookingForwardScript:
	farwritetext VanceLookingForwardText
	buttonsound
	sjump PhoneScript_HangupText_Male

WiltonHaventFoundAnythingScript:
	farwritetext WiltonHaventFoundAnythingText
	buttonsound
	sjump PhoneScript_HangupText_Male

ParryBattleWithMeScript:
	farwritetext ParryBattleWithMeText
	buttonsound
	sjump PhoneScript_HangupText_Male

ErinWorkingHardScript:
	farwritetext ErinWorkingHardText
	buttonsound
	sjump PhoneScript_HangupText_Female

IrwinRandomTextScript:
	random 3
	ifequal 0, IrwinEscapadeScript
	ifequal 1, IrwinGoodMatchScript
	ifequal 2, IrwinNoseyScript

IrwinEscapadeScript:
	farwritetext IrwinYourEscapadesRockText
	buttonsound
	sjump PhoneScript_HangupText_Male

IrwinGoodMatchScript:
	farwritetext IrwinGoodMatchText
	buttonsound
	sjump PhoneScript_HangupText_Male

IrwinNoseyScript:
	farwritetext IrwinSoMuchToChatAboutText
	buttonsound
	sjump PhoneScript_HangupText_Male

KenjiAnswerPhoneScript:
	readvar VAR_KENJI_BREAK
	ifequal 2, .Training
	ifequal 1, .OnBreak
	farwritetext KenjiCallMeBackAnotherTimeText
	buttonsound
	sjump PhoneScript_HangupText_Male

.Training:
	farwritetext KenjiIllHaveTimeToChatTomorrowText
	buttonsound
	sjump PhoneScript_HangupText_Male

.OnBreak:
	checktime MORN
	iftrue .Morning
	checktime NITE
	iftrue .Night
	setevent EVENT_KENJI_ON_BREAK
	farwritetext KenjiTakingABreakText
	buttonsound
	sjump PhoneScript_HangupText_Male

.Morning:
	farwritetext KenjiHangupMorningText
	buttonsound
	sjump PhoneScript_HangupText_Male

.Night:
	farwritetext KenjiHangupNightText
	buttonsound
	sjump PhoneScript_HangupText_Male
