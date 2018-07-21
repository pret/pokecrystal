specialcall: MACRO
; condition, contact, script
	dw \1
	db \2
	dba \3
ENDM

SpecialPhoneCallList:
; entries correspond to SPECIALCALL_* constants
	specialcall SpecialCallOnlyWhenOutside, PHONECONTACT_ELM,      ElmPhoneScript2
	specialcall SpecialCallOnlyWhenOutside, PHONECONTACT_ELM,      ElmPhoneScript2
	specialcall SpecialCallOnlyWhenOutside, PHONECONTACT_ELM,      ElmPhoneScript2
	specialcall SpecialCallOnlyWhenOutside, PHONECONTACT_ELM,      ElmPhoneScript2
	specialcall SpecialCallWhereverYouAre,  PHONECONTACT_ELM,      ElmPhoneScript2
	specialcall SpecialCallWhereverYouAre,  PHONECONTACT_BIKESHOP, BikeShopPhoneScript
	specialcall SpecialCallWhereverYouAre,  PHONECONTACT_MOM,      MomPhoneLectureScript
	specialcall SpecialCallOnlyWhenOutside, PHONECONTACT_ELM,      ElmPhoneScript2
