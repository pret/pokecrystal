JackPhoneTipsScript:
	farwritetext JackPhoneTipsText
	buttonsound
	sjump PhoneScript_HangupText_Male

BeverlyHangupScript:
	farwritetext BeverlyHangupText
	buttonsound
	sjump PhoneScript_HangupText_Female

HueyHangupScript:
	farwritetext HueyHangupText
	buttonsound
	sjump PhoneScript_HangupText_Male

GavenHangupNotThursdayScript:
	farwritetext GavenHangupNotThursdayText
	buttonsound
	sjump PhoneScript_HangupText_Male

BethHangupScript:
	farwritetext BethHangupText
	buttonsound
	sjump PhoneScript_HangupText_Female

JoseHangupScript:
	farwritetext JoseHangupText
	buttonsound
	sjump PhoneScript_HangupText_Male

ReenaForwardScript:
	farwritetext ReenaForwardText
	buttonsound
	sjump PhoneScript_HangupText_Female

JoeyHangupScript:
	farwritetext JoeyHangupText
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
	farwritetext LizHangupText
	buttonsound
	sjump PhoneScript_HangupText_Female

AnthonyHangupScript:
	farwritetext AnthonyHangupText
	buttonsound
	sjump PhoneScript_HangupText_Male

ToddNoItemScript:
	farwritetext ToddNoItemText
	buttonsound
	sjump PhoneScript_HangupText_Male

GinaHangupScript:
	farwritetext GinaHangupText
	buttonsound
	sjump PhoneScript_HangupText_Female

ArnieHangupScript:
	farwritetext ArnieHangupText
	buttonsound
	sjump PhoneScript_HangupText_Male

AlanHangupScript:
	farwritetext AlanHangupText
	buttonsound
	sjump PhoneScript_HangupText_Male

DanaHangupScript:
	farwritetext DanaHangupText
	buttonsound
	sjump PhoneScript_HangupText_Female

ChadHangupScript:
	farwritetext ChadHangupText
	buttonsound
	sjump PhoneScript_HangupText_Male

DerekHangupScript:
	farwritetext DerekHangupText
	buttonsound
	sjump PhoneScript_HangupText_Male

TullyNoItemScript:
	farwritetext TullyNoItemText
	buttonsound
	sjump PhoneScript_HangupText_Male

BrentHangupScript:
	farwritetext BrentHangupText
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
	farwritetext IrwinEscapadeText
	buttonsound
	sjump PhoneScript_HangupText_Male

IrwinGoodMatchScript:
	farwritetext IrwinGoodMatchText
	buttonsound
	sjump PhoneScript_HangupText_Male

IrwinNoseyScript:
	farwritetext IrwinNoseyText
	buttonsound
	sjump PhoneScript_HangupText_Male

KenjiAnswerPhoneScript:
	readvar VAR_KENJI_BREAK
	ifequal 2, .Training
	ifequal 1, .OnBreak
	farwritetext KenjiHangupText
	buttonsound
	sjump PhoneScript_HangupText_Male

.Training:
	farwritetext KenjiHangupTrainingText
	buttonsound
	sjump PhoneScript_HangupText_Male

.OnBreak:
	checktime MORN
	iftrue .Morning
	checktime NITE
	iftrue .Night
	setevent EVENT_KENJI_ON_BREAK
	farwritetext KenjiBreakText
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
