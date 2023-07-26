; Pokémon traded from RBY do not have held items, so GSC usually interprets the
; catch rate as an item. However, if the catch rate appears in this table, the
; item associated with the table entry is used instead.

TimeCapsule_CatchRateItems:
	db ITEM_BE, BERRY
	db ITEM_C3, BERRY
	db ITEM_DC, BERRY
	db ITEM_FA, BERRY
	db -1,      BERRY
	db 0 ; end
