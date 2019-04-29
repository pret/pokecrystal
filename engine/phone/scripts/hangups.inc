JackPhoneTips:
	farwritetext UnknownText_0x1745c2
	buttonsound
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa0900:
	farwritetext UnknownText_0x17485b
	buttonsound
	sjump PhoneScript_HangupText_Female

UnknownScript_0xa0908:
	farwritetext UnknownText_0x17496b
	buttonsound
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa0910:
	farwritetext UnknownText_0x174c29
	buttonsound
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa0918:
	farwritetext UnknownText_0x174ec5
	buttonsound
	sjump PhoneScript_HangupText_Female

UnknownScript_0xa0920:
	farwritetext UnknownText_0x17519b
	buttonsound
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa0928:
	farwritetext UnknownText_0x17549b
	buttonsound
	sjump PhoneScript_HangupText_Female

UnknownScript_0xa0930:
	farwritetext UnknownText_0x17571d
	buttonsound
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa0938:
	farwritetext UnknownText_0x175abe
	buttonsound
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa0940:
	farwritetext UnknownText_0x175eaf
	buttonsound
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa0948:
	farwritetext UnknownText_0x1768b0
	buttonsound
	sjump PhoneScript_HangupText_Female

UnknownScript_0xa0950:
	farwritetext UnknownText_0x176d32
	buttonsound
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa0958:
	farwritetext UnknownText_0x1770fb
	buttonsound
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa0960:
	farwritetext UnknownText_0x177465
	buttonsound
	sjump PhoneScript_HangupText_Female

UnknownScript_0xa0968:
	farwritetext UnknownText_0x64bc6
	buttonsound
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa0970:
	farwritetext UnknownText_0x64e90
	buttonsound
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa0978:
	farwritetext UnknownText_0x65161
	buttonsound
	sjump PhoneScript_HangupText_Female

UnknownScript_0xa0980:
	farwritetext UnknownText_0x65a23
	buttonsound
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa0988:
	farwritetext UnknownText_0x65d5c
	buttonsound
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa0990:
	farwritetext UnknownText_0x65ff2
	buttonsound
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa0998:
	farwritetext UnknownText_0x6651e
	buttonsound
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa09a0:
	farwritetext UnknownText_0x66882
	buttonsound
	sjump PhoneScript_HangupText_Female

VanceLookingForward:
	farwritetext VanceLookingForwardText
	buttonsound
	sjump PhoneScript_HangupText_Male

WiltonHaventFoundAnything:
	farwritetext WiltonHaventFoundAnythingText
	buttonsound
	sjump PhoneScript_HangupText_Male

ParryBattleWithMe:
	farwritetext ParryBattleWithMeText
	buttonsound
	sjump PhoneScript_HangupText_Male

ErinWorkingHardScript:
	farwritetext ErinWorkingHardText
	buttonsound
	sjump PhoneScript_HangupText_Female

UnknownScript_0xa09c8:
	random 3
	ifequal 0, UnknownScript_0xa09d6
	ifequal 1, UnknownScript_0xa09de
	ifequal 2, UnknownScript_0xa09e6

UnknownScript_0xa09d6:
	farwritetext UnknownText_0x64846
	buttonsound
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa09de:
	farwritetext UnknownText_0x64881
	buttonsound
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa09e6:
	farwritetext UnknownText_0x648dc
	buttonsound
	sjump PhoneScript_HangupText_Male

KenjiAnswerPhoneScript:
	readvar VAR_KENJI_BREAK
	ifequal 2, .Training
	ifequal 1, .OnBreak
	farwritetext UnknownText_0x66e17
	buttonsound
	sjump PhoneScript_HangupText_Male

.Training:
	farwritetext UnknownText_0x66e67
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
	farwritetext UnknownText_0x66ed3
	buttonsound
	sjump PhoneScript_HangupText_Male

.Night:
	farwritetext UnknownText_0x66f52
	buttonsound
	sjump PhoneScript_HangupText_Male
