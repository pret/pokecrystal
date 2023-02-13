ItemPocketNames:
; entries correspond to item type constants
	table_width 2, ItemPocketNames
	dw .Item
	dw .Key
	dw .Ball
	dw .TM
	assert_table_length NUM_ITEM_TYPES

.Item: db "POCHE OBJETS@"
.Key:  db "POCHE RARES@"
.Ball: db "POCHE BALLS@"
.TM:   db "POCHE CT@"
