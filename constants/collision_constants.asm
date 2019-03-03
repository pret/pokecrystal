; collision permissions (see data/collision_permissions.asm)
LANDTILE             EQU $00
WATERTILE            EQU $01
WALLTILE             EQU $0f
TALK                 EQU $10

; collision data types (see data/tilesets/*_collision.asm)
; TileCollisionTable indexes (see data/collision_permissions.asm)
COLL_FLOOR             EQU $00
COLL_01                EQU $01 ; garbage
COLL_03                EQU $03 ; garbage
COLL_04                EQU $04 ; garbage
COLL_WALL              EQU $07
COLL_CUT_08            EQU $08 ; unused
COLL_TALL_GRASS_10     EQU $10 ; unused
COLL_CUT_TREE          EQU $12
COLL_LONG_GRASS        EQU $14
COLL_HEADBUTT_TREE     EQU $15
COLL_TALL_GRASS        EQU $18
COLL_CUT_TREE_1A       EQU $1a ; unused
COLL_LONG_GRASS_1C     EQU $1c ; unused
COLL_HEADBUTT_TREE_1D  EQU $1d ; unused
COLL_WATER_21          EQU $21 ; ???
COLL_ICE               EQU $23
COLL_WHIRLPOOL         EQU $24
COLL_BUOY              EQU $27
COLL_CUT_28            EQU $28 ; garbage
COLL_WATER             EQU $29
COLL_ICE_2B            EQU $2b ; unused
COLL_WHIRLPOOL_2C      EQU $2c ; unused
COLL_WATERFALL_RIGHT   EQU $30 ; unused
COLL_WATERFALL_LEFT    EQU $31 ; unused
COLL_WATERFALL_UP      EQU $32 ; unused
COLL_WATERFALL         EQU $33
COLL_CURRENT_RIGHT     EQU $38 ; unused
COLL_CURRENT_LEFT      EQU $39 ; unused
COLL_CURRENT_UP        EQU $3a ; unused
COLL_CURRENT_DOWN      EQU $3b ; unused
COLL_BRAKE             EQU $40 ; unused
COLL_WALK_RIGHT        EQU $41 ; unused
COLL_WALK_LEFT         EQU $42 ; unused
COLL_WALK_UP           EQU $43 ; unused
COLL_WALK_DOWN         EQU $44 ; unused
COLL_BRAKE_45          EQU $45 ; garbage
COLL_BRAKE_46          EQU $46 ; unused
COLL_BRAKE_47          EQU $47 ; unused
COLL_GRASS_48          EQU $48 ; unused
COLL_GRASS_49          EQU $49 ; unused
COLL_GRASS_4A          EQU $4a ; garbage
COLL_GRASS_4B          EQU $4b ; garbage
COLL_GRASS_4C          EQU $4c ; unused
COLL_WALK_RIGHT_ALT    EQU $50 ; unused
COLL_WALK_LEFT_ALT     EQU $51 ; unused
COLL_WALK_UP_ALT       EQU $52 ; unused
COLL_WALK_DOWN_ALT     EQU $53 ; unused
COLL_BRAKE_ALT         EQU $54 ; unused
COLL_BRAKE_55          EQU $55 ; unused
COLL_BRAKE_56          EQU $56 ; unused
COLL_BRAKE_57          EQU $57 ; unused
COLL_5B                EQU $5b ; garbage
COLL_PIT               EQU $60
COLL_VIRTUAL_BOY       EQU $61 ; garbage
COLL_64                EQU $64 ; garbage
COLL_65                EQU $65 ; garbage
COLL_PIT_68            EQU $68 ; unused
COLL_WARP_CARPET_DOWN  EQU $70
COLL_DOOR              EQU $71
COLL_LADDER            EQU $72
COLL_STAIRCASE_73      EQU $73 ; unused
COLL_CAVE_74           EQU $74 ; unused
COLL_DOOR_75           EQU $75 ; unused
COLL_WARP_CARPET_LEFT  EQU $76
COLL_WARP_77           EQU $77 ; unused
COLL_WARP_CARPET_UP    EQU $78
COLL_DOOR_79           EQU $79 ; unused
COLL_STAIRCASE         EQU $7a
COLL_CAVE              EQU $7b
COLL_WARP_PANEL        EQU $7c
COLL_DOOR_7D           EQU $7d ; unused
COLL_WARP_CARPET_RIGHT EQU $7e
COLL_WARP_7F           EQU $7f ; unused
COLL_COUNTER           EQU $90
COLL_BOOKSHELF         EQU $91
COLL_PC                EQU $93
COLL_RADIO             EQU $94
COLL_TOWN_MAP          EQU $95
COLL_MART_SHELF        EQU $96
COLL_TV                EQU $97
COLL_COUNTER_98        EQU $98 ; unused
COLL_9C                EQU $9c ; garbage
COLL_WINDOW            EQU $9d
COLL_INCENSE_BURNER    EQU $9f
COLL_HOP_RIGHT         EQU $a0
COLL_HOP_LEFT          EQU $a1
COLL_HOP_UP            EQU $a2 ; unused
COLL_HOP_DOWN          EQU $a3
COLL_HOP_DOWN_RIGHT    EQU $a4
COLL_HOP_DOWN_LEFT     EQU $a5
COLL_HOP_UP_RIGHT      EQU $a6 ; unused
COLL_HOP_UP_LEFT       EQU $a7 ; unused
COLL_RIGHT_WALL        EQU $b0
COLL_LEFT_WALL         EQU $b1
COLL_UP_WALL           EQU $b2
COLL_DOWN_WALL         EQU $b3 ; unused
COLL_DOWN_RIGHT_WALL   EQU $b4 ; unused
COLL_DOWN_LEFT_WALL    EQU $b5 ; unused
COLL_UP_RIGHT_WALL     EQU $b6 ; unused
COLL_UP_LEFT_WALL      EQU $b7 ; unused
COLL_RIGHT_BUOY        EQU $c0 ; unused
COLL_LEFT_BUOY         EQU $c1 ; unused
COLL_UP_BUOY           EQU $c2 ; unused
COLL_DOWN_BUOY         EQU $c3 ; unused
COLL_DOWN_RIGHT_BUOY   EQU $c4 ; unused
COLL_DOWN_LEFT_BUOY    EQU $c5 ; unused
COLL_UP_RIGHT_BUOY     EQU $c6 ; unused
COLL_UP_LEFT_BUOY      EQU $c7 ; unused
COLL_FF                EQU $ff ; garbage

; collision data type nybbles
LO_NYBBLE_GRASS      EQU $07
HI_NYBBLE_TALL_GRASS EQU $10
HI_NYBBLE_WATER      EQU $20
HI_NYBBLE_CURRENT    EQU $30
HI_NYBBLE_WALK       EQU $40
HI_NYBBLE_WALK_ALT   EQU $50
HI_NYBBLE_WARPS      EQU $70
HI_NYBBLE_LEDGES     EQU $a0
HI_NYBBLE_SIDE_WALLS EQU $b0
HI_NYBBLE_SIDE_BUOYS EQU $c0
