CutTreeBlockPointers: ; c862
; tileset, block list pointer
	dbw TILESET_JOHTO_1,     .johto1
	dbw TILESET_JOHTO_2,     .johto2
	dbw TILESET_KANTO,       .kanto
	dbw TILESET_PARK,        .park
	dbw TILESET_ILEX_FOREST, .ilex_forest
	db -1 ; end

.johto1:
; facing block, replacement block, animation
	db $03, $02, 1 ; grass
	db $5b, $3c, 0 ; tree
	db $5f, $3d, 0 ; tree
	db $63, $3f, 0 ; tree
	db $67, $3e, 0 ; tree
	db -1 ; end

.johto2:
; facing block, replacement block, animation
	db $03, $02, $01 ; grass
	db -1 ; end

.kanto:
; facing block, replacement block, animation
	db $0b, $0a, 1 ; grass
	db $32, $6d, 0 ; tree
	db $33, $6c, 0 ; tree
	db $34, $6f, 0 ; tree
	db $35, $4c, 0 ; tree
	db $60, $6e, 0 ; tree
	db -1 ; end

.park:
; facing block, replacement block, animation
	db $13, $03, 1 ; grass
	db $03, $04, 1 ; grass
	db -1 ; end

.ilex_forest:
; facing block, replacement block, animation
	db $0f, $17, 0
	db -1 ; end


WhirlpoolBlockPointers: ; c8a4
	dbw TILESET_JOHTO_1, .johto
	db -1 ; end

.johto:
; facing block, replacement block, animation
	db $07, $36, 0
	db -1 ; end
