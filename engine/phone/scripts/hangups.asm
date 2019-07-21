JackPhoneTipsScript:
	farwritetext JackPhoneTipsText
	buttonsound
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa0900:
	farwritetext BeverlyHangupText
	buttonsound
	sjump PhoneScript_HangupText_Female

UnknownScript_0xa0908:
	farwritetext HueyHangupText
	buttonsound
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa0910:
	farwritetext GavenHangupNotThursdayText
	buttonsound
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa0918:
	farwritetext BethHangupText
	buttonsound
	sjump PhoneScript_HangupText_Female

UnknownScript_0xa0920:
	farwritetext JoseHangupText
	buttonsound
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa0928:
	farwritetext ReenaForwardText
	buttonsound
	sjump PhoneScript_HangupText_Female

UnknownScript_0xa0930:
	farwritetext JoeyHangupText
	buttonsound
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa0938:
	farwritetext WadeNoBerriesText
	buttonsound
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa0940:
	farwritetext RalphNoItemText
	buttonsound
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa0948:
	farwritetext LizHangupText
	buttonsound
	sjump PhoneScript_HangupText_Female

UnknownScript_0xa0950:
	farwritetext AnthonyHangupText
	buttonsound
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa0958:
	farwritetext ToddNoItemText
	buttonsound
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa0960:
	farwritetext GinaHangupText
	buttonsound
	sjump PhoneScript_HangupText_Female

UnknownScript_0xa0968:
	farwritetext ArnieHangupText
	buttonsound
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa0970:
	farwritetext AlanHangupText
	buttonsound
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa0978:
	farwritetext DanaHangupText
	buttonsound
	sjump PhoneScript_HangupText_Female

UnknownScript_0xa0980:
	farwritetext ChadHangupText
	buttonsound
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa0988:
	farwritetext DerekHangupText
	buttonsound
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa0990:
	farwritetext TullyNoItemText
	buttonsound
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa0998:
	farwritetext BrentHangupText
	buttonsound
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa09a0:
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

UnknownScript_0xa09c8:
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
