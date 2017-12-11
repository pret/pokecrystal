specialcall: macro
; condition, contact, script
	dw \1
	db \2
	dba \3
endm

; entries correspond to SPECIALCALL_* constants
	specialcall SpecialCallOnlyWhenOutside, PHONE_ELM, ElmPhoneScript2
	specialcall SpecialCallOnlyWhenOutside, PHONE_ELM, ElmPhoneScript2
	specialcall SpecialCallOnlyWhenOutside, PHONE_ELM, ElmPhoneScript2
	specialcall SpecialCallOnlyWhenOutside, PHONE_ELM, ElmPhoneScript2
	specialcall SpecialCallWhereverYouAre,  PHONE_ELM, ElmPhoneScript2
	specialcall SpecialCallWhereverYouAre,  PHONE_OAK, BikeShopPhoneScript
	specialcall SpecialCallWhereverYouAre,  PHONE_MOM, MomPhoneLectureScript
	specialcall SpecialCallOnlyWhenOutside, PHONE_ELM, ElmPhoneScript2
