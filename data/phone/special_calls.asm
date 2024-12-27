MACRO specialcall
; condition, contact, script
	dw \1
	db \2
	dba \3
ENDM

SpecialPhoneCallList:
; entries correspond to SPECIALCALL_* constants
	table_width SPECIALCALL_SIZE
	specialcall SpecialCallOnlyWhenOutside, PHONECONTACT_ELM,      ElmPhoneCallerScript
	specialcall SpecialCallOnlyWhenOutside, PHONECONTACT_ELM,      ElmPhoneCallerScript
	specialcall SpecialCallOnlyWhenOutside, PHONECONTACT_ELM,      ElmPhoneCallerScript
	specialcall SpecialCallOnlyWhenOutside, PHONECONTACT_ELM,      ElmPhoneCallerScript
	specialcall SpecialCallWhereverYouAre,  PHONECONTACT_ELM,      ElmPhoneCallerScript
	specialcall SpecialCallWhereverYouAre,  PHONECONTACT_BIKESHOP, BikeShopPhoneCallerScript
	specialcall SpecialCallWhereverYouAre,  PHONECONTACT_MOM,      MomPhoneLectureScript
	specialcall SpecialCallOnlyWhenOutside, PHONECONTACT_ELM,      ElmPhoneCallerScript
	assert_table_length NUM_SPECIALCALLS
