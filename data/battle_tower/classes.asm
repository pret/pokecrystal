BattleTowerTrainers:
; The trainer class is not used in Crystal 1.0 due to a bug.
; Instead, the sixth character in the trainer's name is used.
; See BattleTowerText in engine/events/battle_tower/trainer_text.asm.
	table_width (NAME_LENGTH - 1) + 1, BattleTowerTrainers
	; name, class
	db "PAGNOL@@@@", FISHER
	db "DURAND@@@@", POKEMANIAC
	db "RISOLI@@@@", GUITARIST
	db "MOMO@@@@@@", SCIENTIST
	db "AUBRE@@@@@", POKEFANM
	db "TROGER@@@@", LASS
	db "ANAYA@@@@@", YOUNGSTER
	db "TOPAK@@@@@", HIKER
	db "POUTARD@@@", TEACHER
	db "DARON@@@@@", POKEFANM
	db "ANJU@@@@@@", KIMONO_GIRL
	db "CHARBIT@@@", BOARDER
	db "NIKI@@@@@@", PICNICKER
	db "SOVANET@@@", BIKER
	db "SANCHEZ@@@", JUGGLER
	db "LAMICHE@@@", POKEFANF
	db "PINDER@@@@", FIREBREATHER
	db "ARHAN@@@@@", SWIMMERF
	db "BORG@@@@@@", SWIMMERM
	db "STIFFY@@@@", SKIER
	db "BOLE@@@@@@", CAMPER
	assert_table_length BATTLETOWER_NUM_UNIQUE_MON
; The following can only be sampled in Crystal 1.1.
	db "MINEL@@@@@", GENTLEMAN
	db "SCHIFER@@@", BEAUTY
	db "BRAMAS@@@@", SUPER_NERD
	db "GOKU@@@@@@", BLACKBELT_T
	db "BABOU@@@@@", COOLTRAINERF
	db "ALVES@@@@@", OFFICER
	db "PICHON@@@@", PSYCHIC_T
	db "GANON@@@@@", POKEFANM
	db "BABU@@@@@@", SCIENTIST
	db "DIPASQUALE", BEAUTY
	db "PIOLET@@@@", CAMPER
	db "LAMU@@@@@@", BIRD_KEEPER
	db "PICK@@@@@@", PICNICKER
	db "LATOUR@@@@", POKEMANIAC
	db "BEZU@@@@@@", SCIENTIST
	db "UESUGI@@@@", SAGE
	db "DUVERGER@@", SCHOOLBOY
	db "KERGOAT@@@", FISHER
	db "SUZUKI@@@@", KIMONO_GIRL
	db "MICHEL@@@@", PSYCHIC_T
	db "LECLERC@@@", CAMPER
	db "DUPOND@@@@", LASS
	db "BIGARD@@@@", GENTLEMAN
	db "MICHARD@@@", POKEFANF
	db "PATEL@@@@@", POKEMANIAC
	db "RODRIGUEZ@", YOUNGSTER
	db "LENEUF@@@@", TEACHER
	db "TROADEC@@@", SAILOR
	db "BENRAMOU@@", BLACKBELT_T
	db "COTTEN@@@@", SUPER_NERD
	db "MONDY@@@@@", COOLTRAINERF
	db "ROBERT@@@@", SWIMMERM
	db "PIAF@@@@@@", BIRD_KEEPER
	db "BARKOFF@@@", BOARDER
	db "LAMBLIN@@@", LASS
	db "HUNTER@@@@", OFFICER
	db "KILLY@@@@@", SKIER
	db "GOURIO@@@@", SCHOOLBOY
	db "SCHMITT@@@", SWIMMERF
	db "MARTIN@@@@", YOUNGSTER
	db "OLEG@@@@@@", GUITARIST
	db "LABULLE@@@", BUG_CATCHER
	db "LATRUFFE@@", BUG_CATCHER
	db "FICHER@@@@", POKEMANIAC
	db "PALU@@@@@@", SCIENTIST
	db "FLEURY@@@@", SUPER_NERD
	db "LAARSEN@@@", SWIMMERF
	db "ALIDET@@@@", BIKER
	db "ZAVATA@@@@", FIREBREATHER
	assert_table_length BATTLETOWER_NUM_UNIQUE_TRAINERS
