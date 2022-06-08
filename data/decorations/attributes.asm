MACRO decoration
	; type, name, action, event flag, tile/sprite
	db \1, \2, \3
	dw \4
	db \5
ENDM

DecorationAttributes:
; entries correspond to deco constants
	table_width DECOATTR_STRUCT_LENGTH, DecorationAttributes
	decoration DECO_PLANT,   0,               0,                 EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1, 0
	decoration DECO_PLANT,   PUT_IT_AWAY,     PUT_AWAY_BED,      EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1, 0
	decoration DECO_BED,     FEATHERY_BED,    SET_UP_BED,        EVENT_DECO_BED_1,                   $1b
	decoration DECO_BED,     PINK_BED,        SET_UP_BED,        EVENT_DECO_BED_2,                   $1c
	decoration DECO_BED,     POLKADOT_BED,    SET_UP_BED,        EVENT_DECO_BED_3,                   $1d
	decoration DECO_BED,     PIKACHU_BED,     SET_UP_BED,        EVENT_DECO_BED_4,                   $1e
	decoration DECO_PLANT,   PUT_IT_AWAY,     PUT_AWAY_CARPET,   EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1, 0
	decoration DECO_CARPET,  RED_CARPET,      SET_UP_CARPET,     EVENT_DECO_CARPET_1,                $08
	decoration DECO_CARPET,  BLUE_CARPET,     SET_UP_CARPET,     EVENT_DECO_CARPET_2,                $0b
	decoration DECO_CARPET,  YELLOW_CARPET,   SET_UP_CARPET,     EVENT_DECO_CARPET_3,                $0e
	decoration DECO_CARPET,  GREEN_CARPET,    SET_UP_CARPET,     EVENT_DECO_CARPET_4,                $11
	decoration DECO_PLANT,   PUT_IT_AWAY,     PUT_AWAY_PLANT,    EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1, 0
	decoration DECO_PLANT,   MAGNAPLANT,      SET_UP_PLANT,      EVENT_DECO_PLANT_1,                 $20
	decoration DECO_PLANT,   TROPICPLANT,     SET_UP_PLANT,      EVENT_DECO_PLANT_2,                 $21
	decoration DECO_PLANT,   JUMBOPLANT,      SET_UP_PLANT,      EVENT_DECO_PLANT_3,                 $22
	decoration DECO_PLANT,   PUT_IT_AWAY,     PUT_AWAY_POSTER,   EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1, 0
	decoration DECO_PLANT,   TOWN_MAP_POSTER, SET_UP_POSTER,     EVENT_DECO_POSTER_1,                $1f
	decoration DECO_POSTER,  PIKACHU,         SET_UP_POSTER,     EVENT_DECO_POSTER_2,                $23
	decoration DECO_POSTER,  CLEFAIRY,        SET_UP_POSTER,     EVENT_DECO_POSTER_3,                $24
	decoration DECO_POSTER,  JIGGLYPUFF,      SET_UP_POSTER,     EVENT_DECO_POSTER_4,                $25
	decoration DECO_PLANT,   PUT_IT_AWAY,     PUT_AWAY_CONSOLE,  EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1, 0
	decoration DECO_PLANT,   FAMICOM,         SET_UP_CONSOLE,    EVENT_DECO_FAMICOM,                 SPRITE_FAMICOM
	decoration DECO_PLANT,   SUPER_NES,       SET_UP_CONSOLE,    EVENT_DECO_SNES,                    SPRITE_SNES
	decoration DECO_PLANT,   NINTENDO_64,     SET_UP_CONSOLE,    EVENT_DECO_N64,                     SPRITE_N64
	decoration DECO_PLANT,   VIRTUAL_BOY,     SET_UP_CONSOLE,    EVENT_DECO_VIRTUAL_BOY,             SPRITE_VIRTUAL_BOY
	decoration DECO_PLANT,   PUT_IT_AWAY,     PUT_AWAY_BIG_DOLL, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1, 0
	decoration DECO_BIGDOLL, SNORLAX,         SET_UP_BIG_DOLL,   EVENT_DECO_BIG_SNORLAX_DOLL,        SPRITE_BIG_SNORLAX
	decoration DECO_BIGDOLL, ONIX,            SET_UP_BIG_DOLL,   EVENT_DECO_BIG_ONIX_DOLL,           SPRITE_BIG_ONIX
	decoration DECO_BIGDOLL, LAPRAS,          SET_UP_BIG_DOLL,   EVENT_DECO_BIG_LAPRAS_DOLL,         SPRITE_BIG_LAPRAS
	decoration DECO_PLANT,   PUT_IT_AWAY,     PUT_AWAY_DOLL,     EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1, 0
	decoration DECO_DOLL,    PIKACHU,         SET_UP_DOLL,       EVENT_DECO_PIKACHU_DOLL,            SPRITE_PIKACHU
	decoration DECO_PLANT,   SURF_PIKA_DOLL,  SET_UP_DOLL,       EVENT_DECO_SURFING_PIKACHU_DOLL,    SPRITE_SURFING_PIKACHU
	decoration DECO_DOLL,    CLEFAIRY,        SET_UP_DOLL,       EVENT_DECO_CLEFAIRY_DOLL,           SPRITE_CLEFAIRY
	decoration DECO_DOLL,    JIGGLYPUFF,      SET_UP_DOLL,       EVENT_DECO_JIGGLYPUFF_DOLL,         SPRITE_JIGGLYPUFF
	decoration DECO_DOLL,    BULBASAUR,       SET_UP_DOLL,       EVENT_DECO_BULBASAUR_DOLL,          SPRITE_BULBASAUR
	decoration DECO_DOLL,    CHARMANDER,      SET_UP_DOLL,       EVENT_DECO_CHARMANDER_DOLL,         SPRITE_CHARMANDER
	decoration DECO_DOLL,    SQUIRTLE,        SET_UP_DOLL,       EVENT_DECO_SQUIRTLE_DOLL,           SPRITE_SQUIRTLE
	decoration DECO_DOLL,    POLIWAG,         SET_UP_DOLL,       EVENT_DECO_POLIWAG_DOLL,            SPRITE_POLIWAG
	decoration DECO_DOLL,    DIGLETT,         SET_UP_DOLL,       EVENT_DECO_DIGLETT_DOLL,            SPRITE_DIGLETT
	decoration DECO_DOLL,    STARYU,          SET_UP_DOLL,       EVENT_DECO_STARMIE_DOLL,            SPRITE_STARMIE
	decoration DECO_DOLL,    MAGIKARP,        SET_UP_DOLL,       EVENT_DECO_MAGIKARP_DOLL,           SPRITE_MAGIKARP
	decoration DECO_DOLL,    ODDISH,          SET_UP_DOLL,       EVENT_DECO_ODDISH_DOLL,             SPRITE_ODDISH
	decoration DECO_DOLL,    GENGAR,          SET_UP_DOLL,       EVENT_DECO_GENGAR_DOLL,             SPRITE_GENGAR
	decoration DECO_DOLL,    SHELLDER,        SET_UP_DOLL,       EVENT_DECO_SHELLDER_DOLL,           SPRITE_SHELLDER
	decoration DECO_DOLL,    GRIMER,          SET_UP_DOLL,       EVENT_DECO_GRIMER_DOLL,             SPRITE_GRIMER
	decoration DECO_DOLL,    VOLTORB,         SET_UP_DOLL,       EVENT_DECO_VOLTORB_DOLL,            SPRITE_VOLTORB
	decoration DECO_DOLL,    WEEDLE,          SET_UP_DOLL,       EVENT_DECO_WEEDLE_DOLL,             SPRITE_WEEDLE
	decoration DECO_DOLL,    UNOWN,           SET_UP_DOLL,       EVENT_DECO_UNOWN_DOLL,              SPRITE_UNOWN
	decoration DECO_DOLL,    GEODUDE,         SET_UP_DOLL,       EVENT_DECO_GEODUDE_DOLL,            SPRITE_GEODUDE
	decoration DECO_DOLL,    MACHOP,          SET_UP_DOLL,       EVENT_DECO_MACHOP_DOLL,             SPRITE_MACHOP
	decoration DECO_DOLL,    TENTACOOL,       SET_UP_DOLL,       EVENT_DECO_TENTACOOL_DOLL,          SPRITE_TENTACOOL
	decoration DECO_PLANT,   GOLD_TROPHY,     SET_UP_DOLL,       EVENT_DECO_GOLD_TROPHY,             SPRITE_GOLD_TROPHY
	decoration DECO_PLANT,   SILVER_TROPHY,   SET_UP_DOLL,       EVENT_DECO_SILVER_TROPHY,           SPRITE_SILVER_TROPHY
	assert_table_length NUM_DECOS + NUM_DECO_CATEGORIES + 1
