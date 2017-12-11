CutTreeBlockPointers: ; c862
; tileset, block list pointer
	dbw TILESET_JOHTO_1, .johto1
	dbw TILESET_JOHTO_2, .johto2
	dbw TILESET_KANTO, .kanto
	dbw TILESET_PARK, .park
	dbw TILESET_ILEX_FOREST, .ilex
	db -1

.johto1 ; Johto OW
; facing block, replacement block, animation
	db $03, $02, $01 ; grass
	db $5b, $3c, $00 ; tree
	db $5f, $3d, $00 ; tree
	db $63, $3f, $00 ; tree
	db $67, $3e, $00 ; tree
	db -1

.johto2 ; Goldenrod area
; facing block, replacement block, animation
	db $03, $02, $01 ; grass
	db -1

.kanto ; Kanto OW
; facing block, replacement block, animation
	db $0b, $0a, $01 ; grass
	db $32, $6d, $00 ; tree
	db $33, $6c, $00 ; tree
	db $34, $6f, $00 ; tree
	db $35, $4c, $00 ; tree
	db $60, $6e, $00 ; tree
	db -1

.park ; National Park
; facing block, replacement block, animation
	db $13, $03, $01 ; grass
	db $03, $04, $01 ; grass
	db -1

.ilex ; Ilex Forest
; facing block, replacement block, animation
	db $0f, $17, $00
	db -1


WhirlpoolBlockPointers: ; c8a4
	dbw TILESET_JOHTO_1, .johto
	db -1

.johto ; c8a8
; facing block, replacement block, animation
	db $07, $36, $00
	db -1
