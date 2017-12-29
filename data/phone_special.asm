specialcall: MACRO
; condition, contact, script
	dw \1
	db \2
	dba \3
ENDM

SpecialPhoneCallList: ; 90627
; entries correspond to SPECIALCALL_* constants
	specialcall SpecialCallOnlyWhenOutside, PHONE_ELM, ElmPhoneScript2
	specialcall SpecialCallOnlyWhenOutside, PHONE_ELM, ElmPhoneScript2
	specialcall SpecialCallOnlyWhenOutside, PHONE_ELM, ElmPhoneScript2
	specialcall SpecialCallOnlyWhenOutside, PHONE_ELM, ElmPhoneScript2
	specialcall SpecialCallWhereverYouAre,  PHONE_ELM, ElmPhoneScript2
	specialcall SpecialCallWhereverYouAre,  PHONE_OAK, BikeShopPhoneScript
	specialcall SpecialCallWhereverYouAre,  PHONE_MOM, MomPhoneLectureScript
	specialcall SpecialCallOnlyWhenOutside, PHONE_ELM, ElmPhoneScript2
; 90657
