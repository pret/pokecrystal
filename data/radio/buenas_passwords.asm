BuenasPasswordTable:
	table_width 2, BuenasPasswordTable
	dw .JohtoStarters
	dw .Beverages
	dw .HealingItems
	dw .Balls
	dw .Pokemon1
	dw .Pokemon2
	dw .JohtoTowns
	dw .Types
	dw .Moves
	dw .XItems
	dw .RadioStations
	assert_table_length NUM_PASSWORD_CATEGORIES

                ; string type, points, option 1, option 2, option 3
.JohtoStarters: db BUENA_MON,    10, CYNDAQUIL, TOTODILE, CHIKORITA
.Beverages:     db BUENA_ITEM,   12, FRESH_WATER, SODA_POP, LEMONADE
.HealingItems:  db BUENA_ITEM,   12, POTION, ANTIDOTE, PARLYZ_HEAL
.Balls:         db BUENA_ITEM,   12, POKE_BALL, GREAT_BALL, ULTRA_BALL
.Pokemon1:      db BUENA_MON,    10, PIKACHU, RATTATA, GEODUDE
.Pokemon2:      db BUENA_MON,    10, HOOTHOOT, SPINARAK, DROWZEE
.JohtoTowns:    db BUENA_STRING, 16, "NEW BARK TOWN@", "CHERRYGROVE CITY@", "AZALEA TOWN@"
.Types:         db BUENA_STRING,  6, "FLYING@", "BUG@", "GRASS@"
.Moves:         db BUENA_MOVE,   12, TACKLE, GROWL, MUD_SLAP
.XItems:        db BUENA_ITEM,   12, X_ATTACK, X_DEFEND, X_SPEED
.RadioStations: db BUENA_STRING, 13, "#MON Talk@", "#MON Music@", "Lucky Channel@"
