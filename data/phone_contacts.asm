phone: MACRO
; trainer class, trainer id, map, ?, script 1, ?, script 2
	db  \1, \2
	map \3
	db  \4
	dba \5
	db  \6
	dba \7
ENDM

PhoneContacts: ; 9045f
; entries correspond to PHONE_* constants
	phone TRAINER_NONE, PHONE_00,              N_A,                       0, UnusedPhoneScript,   0, UnusedPhoneScript
	phone TRAINER_NONE, PHONECONTACT_MOM,      KRISS_HOUSE_1F,            7, MomPhoneScript,      0, UnusedPhoneScript
	phone TRAINER_NONE, PHONECONTACT_BIKESHOP, OAKS_LAB,                  0, UnusedPhoneScript,   0, UnusedPhoneScript
	phone TRAINER_NONE, PHONECONTACT_BILL,     N_A,                       7, BillPhoneScript1,    0, BillPhoneScript2
	phone TRAINER_NONE, PHONECONTACT_ELM,      ELMS_LAB,                  7, ElmPhoneScript1,     0, ElmPhoneScript2
	phone SCHOOLBOY,    JACK1,                 NATIONAL_PARK,             7, JackPhoneScript1,    7, JackPhoneScript2
	phone POKEFANF,     BEVERLY1,              NATIONAL_PARK,             7, BeverlyPhoneScript1, 7, BeverlyPhoneScript2
	phone SAILOR,       HUEY1,                 OLIVINE_LIGHTHOUSE_2F,     7, HueyPhoneScript1,    7, HueyPhoneScript2
	phone TRAINER_NONE, PHONE_00,              N_A,                       0, UnusedPhoneScript,   0, UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,              N_A,                       0, UnusedPhoneScript,   0, UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,              N_A,                       0, UnusedPhoneScript,   0, UnusedPhoneScript
	phone COOLTRAINERM, GAVEN3,                ROUTE_26,                  7, GavenPhoneScript1,   7, GavenPhoneScript2
	phone COOLTRAINERF, BETH1,                 ROUTE_26,                  7, BethPhoneScript1,    7, BethPhoneScript2
	phone BIRD_KEEPER,  JOSE2,                 ROUTE_27,                  7, JosePhoneScript1,    7, JosePhoneScript2
	phone COOLTRAINERF, REENA1,                ROUTE_27,                  7, ReenaPhoneScript1,   7, ReenaPhoneScript2
	phone YOUNGSTER,    JOEY1,                 ROUTE_30,                  7, JoeyPhoneScript1,    7, JoeyPhoneScript2
	phone BUG_CATCHER,  WADE1,                 ROUTE_31,                  7, WadePhoneScript1,    7, WadePhoneScript2
	phone FISHER,       RALPH1,                ROUTE_32,                  7, RalphPhoneScript1,   7, RalphPhoneScript2
	phone PICNICKER,    LIZ1,                  ROUTE_32,                  7, LizPhoneScript1,     7, LizPhoneScript2
	phone HIKER,        ANTHONY2,              ROUTE_33,                  7, AnthonyPhoneScript1, 7, AnthonyPhoneScript2
	phone CAMPER,       TODD1,                 ROUTE_34,                  7, ToddPhoneScript1,    7, ToddPhoneScript2
	phone PICNICKER,    GINA1,                 ROUTE_34,                  7, GinaPhoneScript1,    7, GinaPhoneScript2
	phone JUGGLER,      IRWIN1,                ROUTE_35,                  7, IrwinPhoneScript1,   7, IrwinPhoneScript2
	phone BUG_CATCHER,  ARNIE1,                ROUTE_35,                  7, ArniePhoneScript1,   7, ArniePhoneScript2
	phone SCHOOLBOY,    ALAN1,                 ROUTE_36,                  7, AlanPhoneScript1,    7, AlanPhoneScript2
	phone TRAINER_NONE, PHONE_00,              N_A,                       0, UnusedPhoneScript,   0, UnusedPhoneScript
	phone LASS,         DANA1,                 ROUTE_38,                  7, DanaPhoneScript1,    7, DanaPhoneScript2
	phone SCHOOLBOY,    CHAD1,                 ROUTE_38,                  7, ChadPhoneScript1,    7, ChadPhoneScript2
	phone POKEFANM,     DEREK1,                ROUTE_39,                  7, DerekPhoneScript1,   7, DerekPhoneScript2
	phone FISHER,       TULLY1,                ROUTE_42,                  7, TullyPhoneScript1,   7, TullyPhoneScript2
	phone POKEMANIAC,   BRENT1,                ROUTE_43,                  7, BrentPhoneScript1,   7, BrentPhoneScript2
	phone PICNICKER,    TIFFANY3,              ROUTE_43,                  7, TiffanyPhoneScript1, 7, TiffanyPhoneScript2
	phone BIRD_KEEPER,  VANCE1,                ROUTE_44,                  7, VancePhoneScript1,   7, VancePhoneScript2
	phone FISHER,       WILTON1,               ROUTE_44,                  7, WiltonPhoneScript1,  7, WiltonPhoneScript2
	phone BLACKBELT_T,  KENJI3,                ROUTE_45,                  7, KenjiPhoneScript1,   7, KenjiPhoneScript2
	phone HIKER,        PARRY1,                ROUTE_45,                  7, ParryPhoneScript1,   7, ParryPhoneScript2
	phone PICNICKER,    ERIN1,                 ROUTE_46,                  7, ErinPhoneScript1,    7, ErinPhoneScript2
	phone TRAINER_NONE, PHONECONTACT_BUENA,    GOLDENROD_DEPT_STORE_ROOF, 7, BuenaPhoneScript1,   7, BuenaPhoneScript2
; 90627
