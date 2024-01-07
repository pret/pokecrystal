; collision permissions (see data/collision/collision_permissions.asm)
DEF LAND_TILE  EQU $00
DEF WATER_TILE EQU $01
DEF WALL_TILE  EQU $0f
DEF TALK       EQU $10

; collision data types (see data/tilesets/*_collision.asm)
; CollisionPermissionTable indexes (see data/collision/collision_permissions.asm)
DEF COLL_FLOOR             EQU $00
DEF COLL_01                EQU $01 ; garbage
DEF COLL_03                EQU $03 ; garbage
DEF COLL_04                EQU $04 ; garbage
DEF COLL_WALL              EQU $07
DEF COLL_CUT_08            EQU $08 ; unused
DEF COLL_TALL_GRASS_10     EQU $10 ; unused
DEF COLL_CUT_TREE          EQU $12
DEF COLL_LONG_GRASS        EQU $14
DEF COLL_HEADBUTT_TREE     EQU $15
DEF COLL_TALL_GRASS        EQU $18
DEF COLL_CUT_TREE_1A       EQU $1a ; unused
DEF COLL_LONG_GRASS_1C     EQU $1c ; unused
DEF COLL_HEADBUTT_TREE_1D  EQU $1d ; unused
DEF COLL_WATER_21          EQU $21 ; unused
DEF COLL_ICE               EQU $23
DEF COLL_WHIRLPOOL         EQU $24
DEF COLL_BUOY              EQU $27
DEF COLL_CUT_28            EQU $28 ; garbage
DEF COLL_WATER             EQU $29
DEF COLL_ICE_2B            EQU $2b ; unused
DEF COLL_WHIRLPOOL_2C      EQU $2c ; unused
DEF COLL_WATERFALL_RIGHT   EQU $30 ; unused
DEF COLL_WATERFALL_LEFT    EQU $31 ; unused
DEF COLL_WATERFALL_UP      EQU $32 ; unused
DEF COLL_WATERFALL         EQU $33
DEF COLL_CURRENT_RIGHT     EQU $38 ; unused
DEF COLL_CURRENT_LEFT      EQU $39 ; unused
DEF COLL_CURRENT_UP        EQU $3a ; unused
DEF COLL_CURRENT_DOWN      EQU $3b ; unused
DEF COLL_BRAKE             EQU $40 ; unused
DEF COLL_WALK_RIGHT        EQU $41 ; unused
DEF COLL_WALK_LEFT         EQU $42 ; unused
DEF COLL_WALK_UP           EQU $43 ; unused
DEF COLL_WALK_DOWN         EQU $44 ; unused
DEF COLL_BRAKE_45          EQU $45 ; garbage
DEF COLL_BRAKE_46          EQU $46 ; unused
DEF COLL_BRAKE_47          EQU $47 ; unused
DEF COLL_GRASS_48          EQU $48 ; unused
DEF COLL_GRASS_49          EQU $49 ; unused
DEF COLL_GRASS_4A          EQU $4a ; garbage
DEF COLL_GRASS_4B          EQU $4b ; garbage
DEF COLL_GRASS_4C          EQU $4c ; unused
DEF COLL_WALK_RIGHT_ALT    EQU $50 ; unused
DEF COLL_WALK_LEFT_ALT     EQU $51 ; unused
DEF COLL_WALK_UP_ALT       EQU $52 ; unused
DEF COLL_WALK_DOWN_ALT     EQU $53 ; unused
DEF COLL_BRAKE_ALT         EQU $54 ; unused
DEF COLL_BRAKE_55          EQU $55 ; unused
DEF COLL_BRAKE_56          EQU $56 ; unused
DEF COLL_BRAKE_57          EQU $57 ; unused
DEF COLL_5B                EQU $5b ; garbage
DEF COLL_PIT               EQU $60
DEF COLL_VIRTUAL_BOY       EQU $61 ; garbage
DEF COLL_64                EQU $64 ; garbage
DEF COLL_65                EQU $65 ; garbage
DEF COLL_PIT_68            EQU $68 ; unused
DEF COLL_WARP_CARPET_DOWN  EQU $70
DEF COLL_DOOR              EQU $71
DEF COLL_LADDER            EQU $72
DEF COLL_STAIRCASE_73      EQU $73 ; unused
DEF COLL_CAVE_74           EQU $74 ; unused
DEF COLL_DOOR_75           EQU $75 ; unused
DEF COLL_WARP_CARPET_LEFT  EQU $76
DEF COLL_WARP_77           EQU $77 ; unused
DEF COLL_WARP_CARPET_UP    EQU $78
DEF COLL_DOOR_79           EQU $79 ; unused
DEF COLL_STAIRCASE         EQU $7a
DEF COLL_CAVE              EQU $7b
DEF COLL_WARP_PANEL        EQU $7c
DEF COLL_DOOR_7D           EQU $7d ; unused
DEF COLL_WARP_CARPET_RIGHT EQU $7e
DEF COLL_WARP_7F           EQU $7f ; unused
DEF COLL_COUNTER           EQU $90
DEF COLL_BOOKSHELF         EQU $91
DEF COLL_PC                EQU $93
DEF COLL_RADIO             EQU $94
DEF COLL_TOWN_MAP          EQU $95
DEF COLL_MART_SHELF        EQU $96
DEF COLL_TV                EQU $97
DEF COLL_COUNTER_98        EQU $98 ; unused
DEF COLL_9C                EQU $9c ; garbage
DEF COLL_WINDOW            EQU $9d
DEF COLL_INCENSE_BURNER    EQU $9f
DEF COLL_HOP_RIGHT         EQU $a0
DEF COLL_HOP_LEFT          EQU $a1
DEF COLL_HOP_UP            EQU $a2 ; unused
DEF COLL_HOP_DOWN          EQU $a3
DEF COLL_HOP_DOWN_RIGHT    EQU $a4
DEF COLL_HOP_DOWN_LEFT     EQU $a5
DEF COLL_HOP_UP_RIGHT      EQU $a6 ; unused
DEF COLL_HOP_UP_LEFT       EQU $a7 ; unused
DEF COLL_RIGHT_WALL        EQU $b0
DEF COLL_LEFT_WALL         EQU $b1
DEF COLL_UP_WALL           EQU $b2
DEF COLL_DOWN_WALL         EQU $b3 ; unused
DEF COLL_DOWN_RIGHT_WALL   EQU $b4 ; unused
DEF COLL_DOWN_LEFT_WALL    EQU $b5 ; unused
DEF COLL_UP_RIGHT_WALL     EQU $b6 ; unused
DEF COLL_UP_LEFT_WALL      EQU $b7 ; unused
DEF COLL_RIGHT_BUOY        EQU $c0 ; unused
DEF COLL_LEFT_BUOY         EQU $c1 ; unused
DEF COLL_UP_BUOY           EQU $c2 ; unused
DEF COLL_DOWN_BUOY         EQU $c3 ; unused
DEF COLL_DOWN_RIGHT_BUOY   EQU $c4 ; unused
DEF COLL_DOWN_LEFT_BUOY    EQU $c5 ; unused
DEF COLL_UP_RIGHT_BUOY     EQU $c6 ; unused
DEF COLL_UP_LEFT_BUOY      EQU $c7 ; unused
DEF COLL_FF                EQU $ff ; garbage

; collision data type nybbles
DEF LO_NYBBLE_GRASS      EQU $07
DEF HI_NYBBLE_TALL_GRASS EQU $10
DEF HI_NYBBLE_WATER      EQU $20
DEF HI_NYBBLE_CURRENT    EQU $30
DEF HI_NYBBLE_WALK       EQU $40
DEF HI_NYBBLE_WALK_ALT   EQU $50
DEF HI_NYBBLE_WARPS      EQU $70
DEF HI_NYBBLE_LEDGES     EQU $a0
DEF HI_NYBBLE_SIDE_WALLS EQU $b0
DEF HI_NYBBLE_SIDE_BUOYS EQU $c0
