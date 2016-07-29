Sfx_PokeballsPlacedOnTable: ; f0941
	musicheader 1, 5, Sfx_PokeballsPlacedOnTable_Ch5
; f0944

Sfx_BallWiggle: ; f0944
	musicheader 1, 5, Sfx_BallWiggle_Ch5
; f0947

Sfx_Potion: ; f0947
	musicheader 1, 5, Sfx_Potion_Ch5
; f094a

Sfx_FullHeal: ; f094a
	musicheader 1, 5, Sfx_FullHeal_Ch5
; f094d

Sfx_Menu: ; f094d
	musicheader 1, 8, Sfx_Menu_Ch8
; f0950

Sfx_ReadText2: ; f0950
Sfx_ReadText: ; f0950
	musicheader 1, 5, Sfx_ReadText2_Ch5
; f0953

Sfx_Poison: ; f0953
	musicheader 1, 5, Sfx_Poison_Ch5
; f0956

Sfx_GotSafariBalls: ; f0956
	musicheader 1, 5, Sfx_GotSafariBalls_Ch5
; f0959

Sfx_BootPc: ; f0959
	musicheader 1, 5, Sfx_BootPc_Ch5
; f095c

Sfx_ShutDownPc: ; f095c
	musicheader 1, 5, Sfx_ShutDownPc_Ch5
; f095f

Sfx_ChoosePcOption: ; f095f
	musicheader 1, 5, Sfx_ChoosePcOption_Ch5
; f0962

Sfx_EscapeRope: ; f0962
	musicheader 1, 5, Sfx_EscapeRope_Ch5
; f0965

Sfx_PushButton: ; f0965
	musicheader 1, 5, Sfx_PushButton_Ch5
; f0968

Sfx_SecondPartOfItemfinder: ; f0968
	musicheader 1, 5, Sfx_SecondPartOfItemfinder_Ch5
; f096b

Sfx_WarpTo: ; f096b
	musicheader 1, 5, Sfx_WarpTo_Ch5
; f096e

Sfx_WarpFrom: ; f096e
	musicheader 1, 5, Sfx_WarpFrom_Ch5
; f0971

Sfx_ChangeDexMode: ; f0971
	musicheader 1, 5, Sfx_ChangeDexMode_Ch5
; f0974

Sfx_JumpOverLedge: ; f0974
	musicheader 1, 5, Sfx_JumpOverLedge_Ch5
; f0977

Sfx_GrassRustle: ; f0977
	musicheader 1, 8, Sfx_GrassRustle_Ch8
; f097a

Sfx_Fly: ; f097a
	musicheader 1, 8, Sfx_Fly_Ch8
; f097d

Sfx_Wrong: ; f097d
	musicheader 2, 5, Sfx_Wrong_Ch5
	musicheader 1, 6, Sfx_Wrong_Ch6
; f0983

Sfx_Squeak: ; f0983
	musicheader 1, 5, Sfx_Squeak_Ch5
; f0986

Sfx_Strength: ; f0986
	musicheader 1, 8, Sfx_Strength_Ch8
; f0989

Sfx_Boat: ; f0989
	musicheader 2, 5, Sfx_Boat_Ch5
	musicheader 1, 6, Sfx_Boat_Ch6
; f098f

Sfx_WallOpen: ; f098f
	musicheader 1, 5, Sfx_WallOpen_Ch5
; f0992

Sfx_PlacePuzzlePieceDown: ; f0992
	musicheader 1, 8, Sfx_PlacePuzzlePieceDown_Ch8
; f0995

Sfx_EnterDoor: ; f0995
	musicheader 1, 8, Sfx_EnterDoor_Ch8
; f0998

Sfx_SwitchPokemon: ; f0998
	musicheader 2, 5, Sfx_SwitchPokemon_Ch5
	musicheader 1, 6, Sfx_SwitchPokemon_Ch6
; f099e

Sfx_Tally: ; f099e
	musicheader 2, 5, Sfx_Tally_Ch5
	musicheader 1, 6, Sfx_Tally_Ch6
; f09a4

Sfx_Transaction: ; f09a4
	musicheader 2, 5, Sfx_Transaction_Ch5
	musicheader 1, 6, Sfx_Transaction_Ch6
; f09aa

Sfx_Bump: ; f09aa
	musicheader 1, 5, Sfx_Bump_Ch5
; f09ad

Sfx_ExitBuilding: ; f09ad
	musicheader 1, 8, Sfx_ExitBuilding_Ch8
; f09b0

Sfx_Save: ; f09b0
	musicheader 2, 5, Sfx_Save_Ch5
	musicheader 1, 6, Sfx_Save_Ch6
; f09b6

Sfx_Save_Ch5: ; f09b6
	dutycycle $2
	sound __,  3, $f1, $0700
	sound __,  2, $e1, $0600
	sound __,  2, $e1, $0680
	sound __,  2, $e1, $06c0
	sound __,  3, $e1, $0700
	sound __,  3, $e1, $07c0
	sound __, 16, $f2, $07e0
	endchannel
; f09d5

Sfx_Save_Ch6: ; f09d5
	dutycycle $2
	sound __,  3, $8, 0
	sound __,  3, $a1, $0701
	sound __,  2, $91, $0601
	sound __,  2, $91, $0681
	sound __,  2, $91, $06c1
	sound __,  3, $91, $0701
	sound __,  3, $91, $07c1
	sound __, 16, $d2, $07e1
	endchannel
; f09f8

Sfx_Pokeflute: ; f09f8
	musicheader 1, 7, Sfx_Pokeflute_Ch7
; f09fb

Sfx_ElevatorEnd: ; f09fb
	musicheader 1, 5, Sfx_ElevatorEnd_Ch5
; f09fe

Sfx_ThrowBall: ; f09fe
	musicheader 2, 5, Sfx_ThrowBall_Ch5
	musicheader 1, 6, Sfx_ThrowBall_Ch6
; f0a04

Sfx_BallPoof: ; f0a04
	musicheader 2, 5, Sfx_BallPoof_Ch5
	musicheader 1, 8, Sfx_BallPoof_Ch8
; f0a0a

Sfx_Unknown3A: ; f0a0a
	musicheader 2, 5, Sfx_Unknown3A_Ch5
	musicheader 1, 8, Sfx_Unknown3A_Ch8
; f0a10

Sfx_Run: ; f0a10
	musicheader 1, 8, Sfx_Run_Ch8
; f0a13

Sfx_SlotMachineStart: ; f0a13
	musicheader 2, 5, Sfx_SlotMachineStart_Ch5
	musicheader 1, 6, Sfx_SlotMachineStart_Ch6
; f0a19

Sfx_Call: ; f0a19
	musicheader 1, 5, Sfx_Call_Ch5
; f0a1c

Sfx_Unknown60: ; f0a1c
	musicheader 1, 8, Sfx_Unknown60_Ch8
; f0a1f

Sfx_Unknown61: ; f0a1f
	musicheader 1, 8, Sfx_Unknown61_Ch8
; f0a22

Sfx_SwitchPockets: ; f0a22
	musicheader 1, 8, Sfx_SwitchPockets_Ch8
; f0a25

Sfx_Unknown63: ; f0a25
	musicheader 1, 8, Sfx_Unknown63_Ch8
; f0a28

Sfx_Burn: ; f0a28
	musicheader 1, 8, Sfx_Burn_Ch8
; f0a2b

Sfx_TitleScreenEntrance: ; f0a2b
	musicheader 1, 8, Sfx_TitleScreenEntrance_Ch8
; f0a2e

Sfx_Unknown66: ; f0a2e
	musicheader 1, 5, Sfx_Unknown66_Ch5
; f0a31

Sfx_GetCoinFromSlots: ; f0a31
	musicheader 1, 5, Sfx_GetCoinFromSlots_Ch5
; f0a34

Sfx_PayDay: ; f0a34
	musicheader 2, 5, Sfx_PayDay_Ch5
	musicheader 1, 6, Sfx_PayDay_Ch6
; f0a3a

Sfx_Metronome: ; f0a3a
	musicheader 1, 5, Sfx_Metronome_Ch5
; f0a3d

Sfx_Peck: ; f0a3d
	musicheader 1, 8, Sfx_Peck_Ch8
; f0a40

Sfx_Kinesis: ; f0a40
	musicheader 1, 5, Sfx_Kinesis_Ch5
; f0a43

Sfx_Lick: ; f0a43
	musicheader 1, 5, Sfx_Lick_Ch5
; f0a46

Sfx_Pound: ; f0a46
	musicheader 1, 8, Sfx_Pound_Ch8
; f0a49

Sfx_MovePuzzlePiece: ; f0a49
	musicheader 1, 8, Sfx_MovePuzzlePiece_Ch8
; f0a4c

Sfx_CometPunch: ; f0a4c
	musicheader 1, 8, Sfx_CometPunch_Ch8
; f0a4f

Sfx_MegaPunch: ; f0a4f
	musicheader 1, 8, Sfx_MegaPunch_Ch8
; f0a52

Sfx_Scratch: ; f0a52
	musicheader 1, 8, Sfx_Scratch_Ch8
; f0a55

Sfx_Vicegrip: ; f0a55
	musicheader 1, 8, Sfx_Vicegrip_Ch8
; f0a58

Sfx_RazorWind: ; f0a58
	musicheader 1, 8, Sfx_RazorWind_Ch8
; f0a5b

Sfx_Cut: ; f0a5b
	musicheader 1, 8, Sfx_Cut_Ch8
; f0a5e

Sfx_WingAttack: ; f0a5e
	musicheader 1, 8, Sfx_WingAttack_Ch8
; f0a61

Sfx_Whirlwind: ; f0a61
	musicheader 1, 8, Sfx_Whirlwind_Ch8
; f0a64

Sfx_Bind: ; f0a64
	musicheader 1, 8, Sfx_Bind_Ch8
; f0a67

Sfx_VineWhip: ; f0a67
	musicheader 1, 8, Sfx_VineWhip_Ch8
; f0a6a

Sfx_DoubleKick: ; f0a6a
	musicheader 1, 8, Sfx_DoubleKick_Ch8
; f0a6d

Sfx_MegaKick: ; f0a6d
	musicheader 1, 8, Sfx_MegaKick_Ch8
; f0a70

Sfx_Headbutt: ; f0a70
	musicheader 1, 8, Sfx_Headbutt_Ch8
; f0a73

Sfx_HornAttack: ; f0a73
	musicheader 1, 8, Sfx_HornAttack_Ch8
; f0a76

Sfx_Tackle: ; f0a76
	musicheader 1, 8, Sfx_Tackle_Ch8
; f0a79

Sfx_PoisonSting: ; f0a79
	musicheader 1, 8, Sfx_PoisonSting_Ch8
; f0a7c

Sfx_Powder: ; f0a7c
	musicheader 1, 8, Sfx_Powder_Ch8
; f0a7f

Sfx_Doubleslap: ; f0a7f
	musicheader 1, 8, Sfx_Doubleslap_Ch8
; f0a82

Sfx_Bite: ; f0a82
	musicheader 2, 5, Sfx_Bite_Ch5
	musicheader 1, 8, Sfx_Bite_Ch8
; f0a88

Sfx_JumpKick: ; f0a88
	musicheader 1, 8, Sfx_JumpKick_Ch8
; f0a8b

Sfx_Stomp: ; f0a8b
	musicheader 1, 8, Sfx_Stomp_Ch8
; f0a8e

Sfx_TailWhip: ; f0a8e
	musicheader 1, 8, Sfx_TailWhip_Ch8
; f0a91

Sfx_KarateChop: ; f0a91
	musicheader 1, 8, Sfx_KarateChop_Ch8
; f0a94

Sfx_Submission: ; f0a94
	musicheader 1, 8, Sfx_Submission_Ch8
; f0a97

Sfx_WaterGun: ; f0a97
	musicheader 2, 5, Sfx_WaterGun_Ch5
	musicheader 1, 8, Sfx_WaterGun_Ch8
; f0a9d

Sfx_SwordsDance: ; f0a9d
	musicheader 1, 8, Sfx_SwordsDance_Ch8
; f0aa0

Sfx_Thunder: ; f0aa0
	musicheader 1, 8, Sfx_Thunder_Ch8
; f0aa3

Sfx_Supersonic: ; f0aa3
	musicheader 3, 5, Sfx_Supersonic_Ch5
	musicheader 1, 6, Sfx_Supersonic_Ch6
	musicheader 1, 8, Sfx_Supersonic_Ch8
; f0aac

Sfx_Leer: ; f0aac
	musicheader 3, 5, Sfx_Leer_Ch5
	musicheader 1, 6, Sfx_Leer_Ch6
	musicheader 1, 8, Sfx_Leer_Ch8
; f0ab5

Sfx_Ember: ; f0ab5
	musicheader 2, 5, Sfx_Ember_Ch5
	musicheader 1, 8, Sfx_Ember_Ch8
; f0abb

Sfx_Bubblebeam: ; f0abb
	musicheader 3, 5, Sfx_Bubblebeam_Ch5
	musicheader 1, 6, Sfx_Bubblebeam_Ch6
	musicheader 1, 8, Sfx_Bubblebeam_Ch8
; f0ac4

Sfx_HydroPump: ; f0ac4
	musicheader 2, 5, Sfx_HydroPump_Ch5
	musicheader 1, 8, Sfx_HydroPump_Ch8
; f0aca

Sfx_Surf: ; f0aca
	musicheader 3, 5, Sfx_Surf_Ch5
	musicheader 1, 6, Sfx_Surf_Ch6
	musicheader 1, 8, Sfx_Surf_Ch8
; f0ad3

Sfx_Psybeam: ; f0ad3
	musicheader 3, 5, Sfx_Psybeam_Ch5
	musicheader 1, 6, Sfx_Psybeam_Ch6
	musicheader 1, 8, Sfx_Psybeam_Ch8
; f0adc

Sfx_Charge: ; f0adc
	musicheader 3, 5, Sfx_Charge_Ch5
	musicheader 1, 6, Sfx_Charge_Ch6
	musicheader 1, 8, Sfx_Charge_Ch8
; f0ae5

Sfx_Thundershock: ; f0ae5
	musicheader 3, 5, Sfx_Thundershock_Ch5
	musicheader 1, 6, Sfx_Thundershock_Ch6
	musicheader 1, 8, Sfx_Thundershock_Ch8
; f0aee

Sfx_Psychic: ; f0aee
	musicheader 3, 5, Sfx_Psychic_Ch5
	musicheader 1, 6, Sfx_Psychic_Ch6
	musicheader 1, 8, Sfx_Psychic_Ch8
; f0af7

Sfx_Screech: ; f0af7
	musicheader 2, 5, Sfx_Screech_Ch5
	musicheader 1, 6, Sfx_Screech_Ch6
; f0afd

Sfx_BoneClub: ; f0afd
	musicheader 2, 5, Sfx_BoneClub_Ch5
	musicheader 1, 6, Sfx_BoneClub_Ch6
; f0b03

Sfx_Sharpen: ; f0b03
	musicheader 2, 5, Sfx_Sharpen_Ch5
	musicheader 1, 6, Sfx_Sharpen_Ch6
; f0b09

Sfx_EggBomb: ; f0b09
	musicheader 3, 5, Sfx_EggBomb_Ch5
	musicheader 1, 6, Sfx_EggBomb_Ch6
	musicheader 1, 8, Sfx_EggBomb_Ch8
; f0b12

Sfx_Sing: ; f0b12
	musicheader 2, 5, Sfx_Sing_Ch5
	musicheader 1, 6, Sfx_Sing_Ch6
; f0b18

Sfx_HyperBeam: ; f0b18
	musicheader 3, 5, Sfx_HyperBeam_Ch5
	musicheader 1, 6, Sfx_HyperBeam_Ch6
	musicheader 1, 8, Sfx_HyperBeam_Ch8
; f0b21

Sfx_Shine: ; f0b21
	musicheader 1, 5, Sfx_Shine_Ch5
; f0b24

Sfx_Unknown5F: ; f0b24
	musicheader 3, 5, Sfx_Unknown5F_Ch5
	musicheader 1, 6, Sfx_Unknown5F_Ch6
Sfx_Sandstorm: ; f0b2a
	musicheader 1, 8, Sfx_Sandstorm_Ch8
; f0b2d

Sfx_HangUp: ; f0b2d
	musicheader 1, 5, Sfx_HangUp_Ch5
; f0b30

Sfx_NoSignal: ; f0b30
	musicheader 1, 5, Sfx_NoSignal_Ch5
; f0b33

Sfx_Elevator: ; f0b33
	musicheader 4, 5, Sfx_Elevator_Ch5
	musicheader 1, 6, Sfx_Elevator_Ch6
	musicheader 1, 7, Sfx_Elevator_Ch7
	musicheader 1, 8, Sfx_Elevator_Ch8
; f0b3f

Sfx_DexFanfare5079: ; f0b3f
Sfx_LevelUp: ; f0b3f
	musicheader 4, 5, Sfx_DexFanfare5079_Ch5
	musicheader 1, 6, Sfx_DexFanfare5079_Ch6
	musicheader 1, 7, Sfx_DexFanfare5079_Ch7
	musicheader 1, 8, Sfx_DexFanfare5079_Ch8
; f0b4b

Sfx_DexFanfare5079_Ch5: ; f0b4b
Sfx_LevelUp_Ch5: ; f0b4b
	togglesfx
	tempo 120
	volume $77
	dutycycle $2
	notetype $8, $b1
	octave 3
	note B_, 2
	note B_, 2
	note B_, 2
	intensity $b3
	octave 4
	note G#, 12
	endchannel
; f0b5f

Sfx_DexFanfare5079_Ch6: ; f0b5f
Sfx_LevelUp_Ch6: ; f0b5f
	togglesfx
	dutycycle $2
	notetype $8, $c1
	octave 4
	note E_, 2
	note E_, 2
	note E_, 2
	intensity $c3
	note B_, 12
	endchannel
; f0b6d

Sfx_DexFanfare5079_Ch7: ; f0b6d
Sfx_LevelUp_Ch7: ; f0b6d
	togglesfx
	notetype $8, $25
	octave 4
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	octave 5
	note E_, 5
	intensity $35
	note E_, 3
	note __, 4
	endchannel
; f0b7f

Sfx_DexFanfare5079_Ch8: ; f0b7f
Sfx_LevelUp_Ch8: ; f0b7f
	togglesfx
	sfxtogglenoise $4
	notetype $c
	note C_, 12
	endchannel
; f0b86

Sfx_KeyItem: ; f0b86
	musicheader 4, 5, Sfx_KeyItem_Ch5
	musicheader 1, 6, Sfx_KeyItem_Ch6
	musicheader 1, 7, Sfx_KeyItem_Ch7
	musicheader 1, 8, Sfx_KeyItem_Ch8
; f0b92

Sfx_KeyItem_Ch5: ; f0b92
	togglesfx
	tempo 120
	volume $77
	dutycycle $2
	notetype $6, $b1
	octave 3
	note B_, 4
	note B_, 2
	note B_, 2
	note B_, 4
	octave 4
	note E_, 4
	intensity $b3
	note G#, 16
	endchannel
; f0ba8

Sfx_KeyItem_Ch6: ; f0ba8
	togglesfx
	dutycycle $2
	notetype $6, $c1
	octave 4
	note E_, 4
	note E_, 2
	note E_, 2
	note E_, 4
	note G#, 4
	intensity $c3
	note B_, 16
	endchannel
; f0bb8

Sfx_KeyItem_Ch7: ; f0bb8
	togglesfx
	notetype $6, $25
	octave 4
	note G#, 2
	note __, 2
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note G#, 2
	note __, 2
	note B_, 2
	note __, 2
	octave 5
	note E_, 8
	intensity $35
	note E_, 4
	note __, 4
	endchannel
; f0bce

Sfx_KeyItem_Ch8: ; f0bce
	togglesfx
	sfxtogglenoise $4
	notetype $c
	note C_, 16
	endchannel
; f0bd5

Sfx_DexFanfare2049: ; f0bd5
	musicheader 4, 5, Sfx_DexFanfare2049_Ch5
	musicheader 1, 6, Sfx_DexFanfare2049_Ch6
	musicheader 1, 7, Sfx_DexFanfare2049_Ch7
	musicheader 1, 8, Sfx_DexFanfare2049_Ch8
; f0be1

Sfx_DexFanfare2049_Ch5: ; f0be1
	togglesfx
	tempo 104
	volume $77
	dutycycle $2
	notetype $c, $88
	octave 3
	note A_, 4
	note __, 2
	note A_, 1
	note __, 1
	note A#, 4
	note __, 2
	note A#, 1
	note __, 1
	octave 4
	note C_, 2
	note __, 2
	octave 3
	note A#, 2
	note __, 2
	note A_, 2
	note __, 6
	endchannel
; f0bfe

Sfx_DexFanfare2049_Ch6: ; f0bfe
	togglesfx
	dutycycle $2
	notetype $c, $c1
	octave 5
	note F_, 2
	note E_, 2
	note D_, 2
	note C_, 2
	octave 4
	note A#, 2
	octave 5
	note C_, 2
	note D_, 2
	note E_, 2
	note F_, 4
	note G_, 4
	note F_, 8
	endchannel
; f0c13

Sfx_DexFanfare2049_Ch7: ; f0c13
	togglesfx
	notetype $c, $25
	octave 4
	note F_, 4
	note __, 2
	note F_, 1
	note __, 1
	note F_, 4
	note __, 2
	note F_, 1
	note __, 1
	note A_, 2
	note __, 2
	note E_, 2
	note __, 2
	note F_, 2
	note __, 6
	endchannel
; f0c27

Sfx_DexFanfare2049_Ch8: ; f0c27
	togglesfx
	sfxtogglenoise $4
	notetype $c
	note C_, 16
	note __, 16
	endchannel
; f0c2f

Sfx_Item: ; f0c2f
	musicheader 4, 5, Sfx_Item_Ch5
	musicheader 1, 6, Sfx_Item_Ch6
	musicheader 1, 7, Sfx_Item_Ch7
	musicheader 1, 8, Sfx_Item_Ch8
; f0c3b

Sfx_Item_Ch5: ; f0c3b
	togglesfx
	tempo 108
	volume $77
	vibrato $8, $27
	dutycycle $2
	notetype $8, $b2
	octave 4
	note C_, 6
	note C_, 2
	note F_, 2
	note C_, 2
	note G_, 4
	note G_, 4
	note G_, 4
	note F_, 12
	note __, 12
	endchannel
; f0c54

Sfx_Item_Ch6: ; f0c54
	togglesfx
	vibrato $8, $27
	dutycycle $2
	notetype $8, $c3
	octave 4
	note A_, 6
	note A_, 2
	note A_, 2
	note A_, 2
	note A#, 4
	note A#, 4
	note A#, 4
	note A_, 12
	note __, 12
	endchannel
; f0c68

Sfx_Item_Ch7: ; f0c68
	togglesfx
	notetype $8, $25
	octave 4
	note F_, 4
	note __, 2
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note D#, 2
	note __, 2
	note D#, 2
	note __, 2
	note E_, 2
	note __, 2
	note F_, 6
	intensity $35
	note F_, 4
	note __, 14
	endchannel
; f0c81

Sfx_Item_Ch8: ; f0c81
	togglesfx
	sfxtogglenoise $4
	notetype $c
	note C_, 16
	note __, 16
	endchannel
; f0c89

Sfx_CaughtMon: ; f0c89
	musicheader 4, 5, Sfx_CaughtMon_Ch5
	musicheader 1, 6, Sfx_CaughtMon_Ch6
	musicheader 1, 7, Sfx_CaughtMon_Ch7
	musicheader 1, 8, Sfx_CaughtMon_Ch8
; f0c95

Sfx_CaughtMon_Ch5: ; f0c95
	togglesfx
	tempo 112
	volume $77
	vibrato $8, $27
	dutycycle $2
	notetype $8, $b3
	octave 4
	note C_, 6
	octave 3
	note A_, 6
	note F_, 12
	intensity $b1
	octave 4
	note D#, 2
	note D#, 2
	note D#, 2
	note D#, 2
	note D#, 2
	note G_, 2
	intensity $b3
	note F_, 12
	endchannel
; f0cb5

Sfx_CaughtMon_Ch6: ; f0cb5
	togglesfx
	dutycycle $2
	vibrato $8, $27
	notetype $8, $c3
	octave 4
	note A_, 6
	note F_, 6
	note C_, 12
	intensity $c1
	note A#, 2
	note A#, 2
	note A#, 2
	note G_, 2
	note G_, 2
	note A#, 2
	intensity $c3
	note A_, 12
	endchannel
; f0cce

Sfx_CaughtMon_Ch7: ; f0cce
	togglesfx
	notetype $8, $25
	octave 3
	note C_, 12
	note C_, 6
	octave 2
	note A_, 2
	octave 3
	note C_, 2
	note F_, 2
	note G_, 6
	note A#, 6
	note A_, 6
	intensity $35
	note A_, 3
	note __, 3
	endchannel
; f0ce2

Sfx_CaughtMon_Ch8: ; f0ce2
	togglesfx
	sfxtogglenoise $4
	notetype $c
	note C_, 16
	note __, 16
	endchannel
; f0cea

Sfx_DexFanfare80109: ; f0cea
	musicheader 4, 5, Sfx_DexFanfare80109_Ch5
	musicheader 1, 6, Sfx_DexFanfare80109_Ch6
	musicheader 1, 7, Sfx_DexFanfare80109_Ch7
	musicheader 1, 8, Sfx_DexFanfare80109_Ch8
; f0cf6

Sfx_DexFanfare80109_Ch5: ; f0cf6
	togglesfx
	tempo 112
	volume $77
	vibrato $8, $27
	dutycycle $2
	notetype $c, $b1
	octave 4
	note D#, 2
	note D#, 1
	note D#, 1
	octave 3
	note A#, 2
	note A#, 1
	note A#, 1
	octave 4
	note D#, 2
	note D#, 1
	note D#, 1
	note F_, 2
	note F_, 1
	note F_, 1
	intensity $a5
	note A#, 16
	endchannel
; f0d17

Sfx_DexFanfare80109_Ch6: ; f0d17
	togglesfx
	vibrato $8, $27
	dutycycle $2
	notetype $c, $c1
	octave 4
	note G_, 2
	note G_, 1
	note G_, 1
	note D#, 2
	note D#, 1
	note D#, 1
	note G#, 2
	note G#, 1
	note G#, 1
	note A#, 2
	note A#, 1
	note A#, 1
	intensity $b5
	octave 5
	note D#, 16
	endchannel
; f0d32

Sfx_DexFanfare80109_Ch7: ; f0d32
	togglesfx
	notetype $c, $25
	octave 4
	note D#, 1
	note __, 1
	octave 3
	note A#, 2
	octave 4
	note D#, 1
	note __, 1
	octave 3
	note A#, 2
	octave 4
	note D#, 1
	note __, 1
	note C_, 2
	note D_, 1
	note __, 1
	octave 3
	note A#, 2
	note D#, 4
	intensity $35
	note D#, 3
	note __, 9
	endchannel
; f0d4e

Sfx_DexFanfare80109_Ch8: ; f0d4e
	togglesfx
	sfxtogglenoise $4
	notetype $c
	note C_, 16
	note __, 16
	endchannel
; f0d56

Sfx_Fanfare2: ; f0d56
	musicheader 3, 5, Sfx_Fanfare2_Ch5
	musicheader 1, 6, Sfx_Fanfare2_Ch6
	musicheader 1, 8, Sfx_Fanfare2_Ch8
; f0d5f

UnknownSfx: ; f0d5f
	musicheader 4, 5, UnknownSfx_Ch5
	musicheader 1, 6, UnknownSfx_Ch6
	musicheader 1, 7, UnknownSfx_Ch7
	musicheader 1, 8, UnknownSfx_Ch8
; f0d6b

UnknownSfx_Ch5: ; f0d6b
	togglesfx
	tempo 124
	volume $77
	vibrato $8, $27
	dutycycle $2
	notetype $c, $b1
	octave 4
	note F_, 2
	note F_, 1
	note F_, 1
	note C_, 2
	note C_, 1
	note C_, 1
	note E_, 2
	note G_, 1
	note G_, 1
	note C_, 2
	note E_, 1
	note E_, 1
	intensity $a5
	note F_, 16
	endchannel
; f0d8a

UnknownSfx_Ch6: ; f0d8a
	togglesfx
	vibrato $8, $27
	dutycycle $2
	notetype $c, $c1
	octave 4
	note A_, 2
	note A_, 1
	note A_, 1
	note F_, 2
	note F_, 1
	note F_, 1
	octave 5
	note C_, 2
	note C_, 1
	note C_, 1
	octave 4
	note A#, 2
	note A#, 1
	note A#, 1
	intensity $b5
	note A_, 16
	endchannel
; f0da6

UnknownSfx_Ch7: ; f0da6
	togglesfx
	notetype $c, $25
	octave 4
	note F_, 8
	note C_, 2
	note E_, 2
	note G_, 2
	note A#, 2
	note A_, 4
	intensity $35
	note A_, 3
	note __, 9
	endchannel
; f0db6

UnknownSfx_Ch8: ; f0db6
	togglesfx
	sfxtogglenoise $4
	notetype $c
	note C_, 16
	note __, 16
	endchannel
; f0dbe

Sfx_Fanfare: ; f0dbe
	musicheader 3, 5, Sfx_Fanfare_Ch5
	musicheader 1, 6, Sfx_Fanfare_Ch6
	musicheader 1, 8, Sfx_Fanfare_Ch8
; f0dc7

Sfx_RegisterPhoneNumber: ; f0dc7
	musicheader 4, 5, Sfx_RegisterPhoneNumber_Ch5
	musicheader 1, 6, Sfx_RegisterPhoneNumber_Ch6
	musicheader 1, 7, Sfx_RegisterPhoneNumber_Ch7
	musicheader 1, 8, Sfx_RegisterPhoneNumber_Ch8
; f0dd3

Sfx_RegisterPhoneNumber_Ch5: ; f0dd3
	togglesfx
	tempo 124
	volume $77
	dutycycle $3
	notetype $c, $a2
	note __, 2
	octave 3
	note C_, 4
	note G#, 4
	octave 4
	note C_, 2
	octave 3
	note F_, 1
	note G#, 2
	note C_, 1
	note F_, 2
	note A#, 3
	octave 4
	note C#, 3
	note C_, 2
	note __, 8
	endchannel
; f0def

	togglesfx

Sfx_RegisterPhoneNumber_Ch6: ; f0df0
	togglesfx
	dutycycle $3
	notetype $c, $c2
	note __, 2
	octave 4
	note D#, 2
	note C#, 2
	note C_, 2
	note D#, 2
	note F_, 2
	note __, 1
	note G#, 3
	octave 5
	note C_, 2
	note D#, 3
	octave 4
	note G_, 3
	note G#, 2
	note __, 8
	endchannel
; f0e07

	togglesfx

Sfx_RegisterPhoneNumber_Ch7: ; f0e08
	togglesfx
	notetype $c, $25
	note __, 2
	octave 3
	note D#, 7
	note __, 1
	note G#, 2
	note __, 1
	note C_, 2
	note __, 1
	note G#, 2
	note G_, 2
	note __, 1
	note A#, 3
	note G#, 2
	note __, 8
	endchannel
; f0e1b

	togglesfx

Sfx_RegisterPhoneNumber_Ch8: ; f0e1c
	togglesfx
	sfxtogglenoise $4
	notetype $c
	note C_, 2
	note __, 16
	note __, 16
	endchannel
; f0e25

	togglesfx

Sfx_3RdPlace: ; f0e26
	musicheader 3, 5, Sfx_3RdPlace_Ch5
	musicheader 1, 6, Sfx_3RdPlace_Ch6
	musicheader 1, 7, Sfx_3RdPlace_Ch7
; f0e2f

Sfx_3RdPlace_Ch5: ; f0e2f
	togglesfx
	tempo 120
	volume $77
	dutycycle $2
	notetype $c, $a4
	octave 4
	note F_, 1
	note A_, 1
	octave 5
	note C_, 1
	note F_, 1
	note __, 1
	note C_, 1
	note D_, 6
	endchannel
; f0e44

	togglesfx

Sfx_3RdPlace_Ch6: ; f0e45
	togglesfx
	dutycycle $2
	notetype $c, $b4
	octave 4
	note A_, 1
	octave 5
	note C_, 1
	note F_, 1
	note A_, 1
	note __, 1
	note F_, 1
	note G_, 6
	endchannel
; f0e55

	togglesfx

Sfx_3RdPlace_Ch7: ; f0e56
	togglesfx
	notetype $c, $25
	octave 3
	note A_, 1
	note F_, 1
	note A_, 1
	octave 4
	note C_, 1
	note __, 1
	octave 3
	note A_, 1
	note B_, 6
	endchannel
; f0e65

	togglesfx

Sfx_GetEggFromDaycareLady: ; f0e66
Sfx_GetEggFromDaycareMan: ; f0e66
	musicheader 4, 5, Sfx_GetEggFromDaycareLady_Ch5
	musicheader 1, 6, Sfx_GetEggFromDaycareLady_Ch6
	musicheader 1, 7, Sfx_GetEggFromDaycareLady_Ch7
	musicheader 1, 8, Sfx_GetEggFromDaycareLady_Ch8
; f0e72

Sfx_GetEggFromDaycareLady_Ch5: ; f0e72
Sfx_GetEggFromDaycareMan_Ch5: ; f0e72
	togglesfx
	tempo 120
	volume $77
	vibrato $12, $34
	dutycycle $2
	notetype $8, $a1
	note __, 2
	octave 3
	note C_, 2
	note F_, 2
	note A_, 2
	note F_, 2
	note A#, 2
	octave 4
	note D_, 2
	intensity $a2
	note F_, 6
	intensity $a1
	dutycycle $3
	octave 3
	note E_, 2
	note G_, 2
	octave 4
	note C_, 2
	intensity $a4
	note F_, 9
	note __, 9
	endchannel
; f0e9a

	togglesfx

Sfx_GetEggFromDaycareLady_Ch6: ; f0e9b
Sfx_GetEggFromDaycareMan_Ch6: ; f0e9b
	togglesfx
	vibrato $12, $34
	dutycycle $3
	notetype $8, $c2
	note __, 2
	octave 4
	note F_, 2
	note __, 2
	note A_, 2
	intensity $c1
	note A#, 2
	note A_, 2
	note A#, 2
	intensity $c2
	octave 5
	note C_, 6
	intensity $c1
	octave 4
	note C_, 2
	note E_, 2
	note G_, 2
	intensity $c4
	note A_, 9
	note __, 9
	endchannel
; f0ebd

	togglesfx

Sfx_GetEggFromDaycareLady_Ch7: ; f0ebe
Sfx_GetEggFromDaycareMan_Ch7: ; f0ebe
	togglesfx
	notetype $8, $25
	note __, 2
	octave 3
	note C_, 6
	octave 2
	note A#, 6
	octave 3
	note C_, 2
	note F_, 2
	note G_, 2
	note A#, 6
	note A_, 9
	note __, 9
	endchannel
; f0ecf

	togglesfx

Sfx_GetEggFromDaycareLady_Ch8: ; f0ed0
Sfx_GetEggFromDaycareMan_Ch8: ; f0ed0
	togglesfx
	sfxtogglenoise $4
	notetype $8
	note __, 2
	notetype $c
	note __, 16
	note __, 12
	endchannel
; f0edb

	togglesfx

Sfx_MoveDeleted: ; f0edc
	musicheader 4, 5, Sfx_MoveDeleted_Ch5
	musicheader 1, 6, Sfx_MoveDeleted_Ch6
	musicheader 1, 7, Sfx_MoveDeleted_Ch7
	musicheader 1, 8, Sfx_MoveDeleted_Ch8
; f0ee8

Sfx_MoveDeleted_Ch5: ; f0ee8
	togglesfx
	tempo 116
	volume $77
	dutycycle $2
	vibrato $c, $44
	notetype $c, $a4
	note __, 8
	octave 2
	note G_, 1
	note __, 2
	note C#, 1
	note E_, 1
	note D#, 1
	note E_, 4
	intensity $a1
	note G_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note G#, 2
	note B_, 2
	intensity $a6
	octave 3
	note D_, 10
	note __, 6
	endchannel
; f0f0c

	togglesfx

Sfx_MoveDeleted_Ch6: ; f0f0d
	togglesfx
	dutycycle $3
	vibrato $c, $44
	notetype $c, $74
	octave 1
	note B_, 1
	octave 2
	note D_, 1
	note F_, 1
	note G#, 1
	intensity $94
	note D_, 1
	note F_, 1
	note G#, 1
	note B_, 1
	intensity $b4
	octave 3
	note C#, 1
	note __, 2
	octave 2
	note A#, 1
	octave 3
	note C#, 4
	note __, 2
	intensity $b1
	note C#, 2
	note D#, 2
	note E_, 2
	intensity $b6
	note F_, 16
	note __, 6
	endchannel
; f0f36

	togglesfx

Sfx_MoveDeleted_Ch7: ; f0f37
	togglesfx
	notetype $6, $25
	octave 2
	note G#, 8
	note A_, 8
	note A#, 2
	note __, 4
	note A#, 1
	note __, 1
	note A#, 8
	note __, 4
	octave 3
	note C#, 2
	note __, 2
	note C_, 2
	note __, 2
	octave 2
	note A#, 2
	note __, 2
	notetype $c, $20
	note B_, 16
	note __, 6
	endchannel
; f0f52

	togglesfx

Sfx_MoveDeleted_Ch8: ; f0f53
	togglesfx
	sfxtogglenoise $3
	notetype $c
	note F_, 8
	note __, 16
	note __, 16
	note __, 6
	endchannel
; f0f5d

	togglesfx

Sfx_2ndPlace: ; f0f5e
	musicheader 4, 5, Sfx_2ndPlace_Ch5
	musicheader 1, 6, Sfx_2ndPlace_Ch6
	musicheader 1, 7, Sfx_2ndPlace_Ch7
	musicheader 1, 8, Sfx_2ndPlace_Ch8
; f0f6a

Sfx_2ndPlace_Ch5: ; f0f6a
	togglesfx
	tempo 116
	volume $77
	dutycycle $2
	vibrato $c, $34
	notetype $8, $a1
	octave 4
	note E_, 2
	note E_, 2
	note E_, 2
	note C_, 2
	octave 3
	note A_, 2
	note F_, 2
	note A_, 2
	octave 4
	note C_, 2
	note F_, 2
	note C_, 2
	octave 3
	note A_, 2
	octave 4
	note F_, 2
	note A_, 2
	note A_, 2
	note A_, 2
	intensity $a7
	note B_, 12
	note __, 6
	endchannel
; f0f91

	togglesfx

Sfx_2ndPlace_Ch6: ; f0f92
	togglesfx
	dutycycle $2
	notetype $8, $b1
	octave 4
	note G_, 2
	note G_, 2
	note G_, 2
	note A_, 4
	note B_, 2
	intensity $b4
	octave 5
	note C_, 12
	intensity $b1
	note C_, 2
	note C_, 2
	note C_, 2
	intensity $b7
	note D_, 12
	note __, 6
	endchannel
; f0fac

	togglesfx

Sfx_2ndPlace_Ch7: ; f0fad
	togglesfx
	notetype $8, $25
	octave 3
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 2
	note F_, 2
	note __, 2
	octave 3
	note F_, 2
	octave 2
	note F_, 2
	note __, 2
	octave 3
	note F_, 2
	octave 2
	note F_, 2
	note __, 2
	octave 3
	note F_, 2
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 2
	note G_, 12
	note __, 6
	endchannel
; f0fd1

	togglesfx

Sfx_2ndPlace_Ch8: ; f0fd2
	togglesfx
	sfxtogglenoise $3
	notetype $8
Sfx_2ndPlace_branch_f0fd7: ; f0fd7
	note C#, 1
	loopchannel 6, Sfx_2ndPlace_branch_f0fd7
	note B_, 12
	note B_, 12
	note B_, 12
	note __, 6
	endchannel
; f0fe1

	togglesfx

Sfx_1stPlace: ; f0fe2
	musicheader 4, 5, Sfx_1stPlace_Ch5
	musicheader 1, 6, Sfx_1stPlace_Ch6
	musicheader 1, 7, Sfx_1stPlace_Ch7
	musicheader 1, 8, Sfx_1stPlace_Ch8
; f0fee

Sfx_1stPlace_Ch5: ; f0fee
	togglesfx
	tempo 124
	volume $77
	dutycycle $3
	vibrato $c, $34
	notetype $c, $a1
	octave 5
	note D_, 2
	octave 4
	note B_, 2
	octave 5
	note D_, 2
	note A#, 1
	note F_, 1
	note D_, 1
	note F_, 1
	intensity $91
	note D_, 1
	octave 4
	note A#, 1
	note F_, 1
	note A#, 1
	intensity $81
	octave 5
	note D_, 1
	octave 4
	note A#, 1
	note F_, 1
	note D_, 1
	intensity $a1
	note C_, 2
	note E_, 2
	note G_, 2
	intensity $a7
	note A_, 10
	note __, 6
	endchannel
; f101f

	togglesfx

Sfx_1stPlace_Ch6: ; f1020
	togglesfx
	dutycycle $3
	vibrato $c, $34
	notetype $c, $c1
	octave 3
	note B_, 2
	note G_, 2
	note B_, 2
	intensity $b6
	octave 4
	note D_, 12
	intensity $c1
	note E_, 2
	note G_, 2
	octave 5
	note C_, 2
	intensity $b7
	note D_, 10
	note __, 6
	endchannel
; f103c

	togglesfx

Sfx_1stPlace_Ch7: ; f103d
	togglesfx
	notetype $c, $25
	octave 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note A#, 6
	note F_, 6
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note D_, 10
	note __, 6
	endchannel
; f1053

	togglesfx

Sfx_1stPlace_Ch8: ; f1054
	togglesfx
	sfxtogglenoise $4
	notetype $6
	note D_, 4
	note D_, 4
	note D_, 4
	note B_, 12
	note B_, 10
	note C#, 1
	note C#, 1
	note D_, 4
	note D_, 4
	note D_, 4
	notetype $c
	note B_, 10
	note __, 6
	endchannel
; f1068

	togglesfx

Sfx_ChooseACard: ; f1069
	musicheader 4, 5, Sfx_ChooseACard_Ch5
	musicheader 1, 6, Sfx_ChooseACard_Ch6
	musicheader 1, 7, Sfx_ChooseACard_Ch7
	musicheader 1, 8, Sfx_ChooseACard_Ch8
; f1075

Sfx_ChooseACard_Ch5: ; f1075
	togglesfx
	tempo 152
	volume $77
	dutycycle $3
	notetype $6, $a4
	octave 3
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	octave 4
	note C#, 4
	octave 3
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	octave 4
	note D_, 4
	octave 3
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	octave 4
	note E_, 4
	intensity $71
	octave 3
	note E_, 1
	note F#, 1
	note G#, 1
	note A_, 1
	intensity $91
	note B_, 1
	octave 4
	note C#, 1
	note D_, 1
	note D#, 1
	intensity $a4
	note E_, 4
	note __, 12
	endchannel
; f10a8

	togglesfx

Sfx_ChooseACard_Ch6: ; f10a9
	togglesfx
	dutycycle $3
	notetype $6, $b4
	octave 3
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 4
	note E_, 4
	octave 3
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 4
	note F_, 4
	octave 3
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 4
	note G_, 4
	note G#, 8
	note A_, 4
	note __, 12
	endchannel
; f10c8

	togglesfx

Sfx_ChooseACard_Ch7: ; f10c9
	togglesfx
	notetype $6, $25
	octave 3
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 2
	note A_, 4
	octave 3
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 2
	note A_, 4
	octave 3
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 2
	note A_, 4
	octave 3
	note E_, 2
	octave 2
	note G#, 2
	note B_, 2
	note G#, 2
	note A_, 4
	note __, 12
	endchannel
; f10eb

	togglesfx

Sfx_ChooseACard_Ch8: ; f10ec
	togglesfx
	sfxtogglenoise $4
	notetype $6
	note D_, 2
	note C#, 2
	note B_, 4
	note D_, 2
	note C#, 2
	note B_, 4
	note D_, 2
	note C#, 2
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note D_, 2
	note C#, 2
	note C#, 2
	note D_, 2
	note B_, 16
	endchannel
; f1103

	togglesfx

Sfx_GetTm: ; f1104
	musicheader 4, 5, Sfx_GetTm_Ch5
	musicheader 1, 6, Sfx_GetTm_Ch6
	musicheader 1, 7, Sfx_GetTm_Ch7
	musicheader 1, 8, Sfx_GetTm_Ch8
; f1110

Sfx_GetTm_Ch5: ; f1110
	togglesfx
	tempo 144
	volume $77
	dutycycle $3
	vibrato $8, $24
	notetype $c, $a3
	octave 4
	note D_, 1
	note __, 1
	octave 3
	note B_, 1
	octave 4
	note D_, 1
	note G_, 6
	intensity $b1
	note E_, 2
	note F#, 2
	note G_, 2
	intensity $a5
	note F#, 8
	note __, 6
	endchannel
; f1130

	togglesfx

Sfx_GetTm_Ch6: ; f1131
	togglesfx
	dutycycle $3
	vibrato $8, $24
	notetype $c, $b3
	octave 4
	note G_, 1
	note __, 1
	note D_, 1
	note G_, 1
	note B_, 6
	intensity $c1
	note A_, 2
	note B_, 2
	octave 5
	note C_, 2
	intensity $b5
	note D_, 8
	note __, 6
	endchannel
; f114b

	togglesfx

Sfx_GetTm_Ch7: ; f114c
	togglesfx
	notetype $6, $25
	octave 2
	note B_, 2
	note __, 2
	note G_, 2
	note B_, 2
	octave 3
	note D_, 4
	octave 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 4
	octave 3
	note C_, 2
	note __, 2
	octave 2
	note B_, 2
	note __, 2
	octave 3
	note C_, 4
	octave 2
	note A_, 16
	note __, 6
	endchannel
; f1169

	togglesfx

Sfx_GetTm_Ch8: ; f116a
	togglesfx
	sfxtogglenoise $4
	notetype $6
	note D_, 4
	note C#, 2
	note D_, 2
	note B_, 8
	note D_, 4
	note C#, 4
	note D_, 4
	note C#, 1
	note C#, 1
	note D_, 2
	note B_, 16
	note __, 6
	endchannel
; f117c

	togglesfx

Sfx_GetBadge: ; f117d
	musicheader 4, 5, Sfx_GetBadge_Ch5
	musicheader 1, 6, Sfx_GetBadge_Ch6
	musicheader 1, 7, Sfx_GetBadge_Ch7
	musicheader 1, 8, Sfx_GetBadge_Ch8
; f1189

Sfx_GetBadge_Ch5: ; f1189
	togglesfx
	tempo 120
	volume $77
	dutycycle $2
	vibrato $8, $24
	notetype $6, $92
	octave 4
	note F_, 3
	callchannel Sfx_GetBadge_branch_f11aa
	note A#, 3
	pitchoffset 0, D_
	callchannel Sfx_GetBadge_branch_f11aa
	pitchoffset 0, C_
	intensity $a7
	note A_, 16
	note __, 6
	endchannel
; f11a9

	togglesfx

Sfx_GetBadge_branch_f11aa: ; f11aa
	note __, 5
	octave 3
	note F_, 2
	note G#, 2
	octave 4
	note C#, 2
	note F_, 2
	note C#, 2
	octave 3
	note F_, 2
	note G#, 2
	octave 4
	note C#, 2
	octave 3
	note F_, 2
	note G#, 2
	octave 4
	note C#, 2
	note F_, 2
	endchannel
; f11be

Sfx_GetBadge_Ch6: ; f11be
	togglesfx
	dutycycle $3
	vibrato $8, $24
	notetype $6, $b5
	octave 5
	note C#, 3
	note __, 3
	octave 4
	note G#, 1
	note __, 1
	note G#, 8
	octave 3
	note C#, 2
	note __, 2
	octave 2
	note G#, 2
	note __, 1
	intensity $95
	octave 5
	note C_, 1
	intensity $b5
	note C#, 2
	note __, 2
	note D_, 2
	note __, 2
	note D#, 3
	note __, 3
	octave 4
	note A#, 1
	note __, 1
	note A#, 8
	octave 3
	note D#, 2
	note __, 2
	octave 2
	note A#, 2
	note __, 1
	intensity $95
	octave 5
	note D_, 1
	intensity $b5
	note D#, 8
	note F_, 16
	note __, 6
	endchannel
; f11f4

	togglesfx

Sfx_GetBadge_Ch7: ; f11f5
	togglesfx
	notetype $6, $25
	octave 2
	note G#, 3
	note __, 3
	octave 3
	note C#, 1
	note __, 1
	note C#, 8
	note G#, 2
	note __, 2
	note F_, 2
	note __, 2
	note C#, 2
	note C_, 2
	octave 2
	note A#, 2
	note G#, 2
	note G_, 3
	note __, 3
	octave 3
	note D#, 1
	note __, 1
	note D#, 8
	note A#, 2
	note __, 2
	note G_, 2
	note __, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note D#, 2
	note F_, 16
	note __, 6
	endchannel
; f121a

	togglesfx

Sfx_GetBadge_Ch8: ; f121b
	togglesfx
	sfxtogglenoise $4
	notetype $6
Sfx_GetBadge_branch_f1220: ; f1220
	note B_, 12
	note D_, 1
	note D_, 1
	note D_, 2
	note D_, 4
	note D_, 4
	note D_, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	loopchannel 2, Sfx_GetBadge_branch_f1220
	note B_, 16
	note __, 6
	endchannel
; f1235

	togglesfx

Sfx_QuitSlots: ; f1236
	musicheader 4, 5, Sfx_QuitSlots_Ch5
	musicheader 1, 6, Sfx_QuitSlots_Ch6
	musicheader 1, 7, Sfx_QuitSlots_Ch7
	musicheader 1, 8, Sfx_QuitSlots_Ch8
; f1242

Sfx_QuitSlots_Ch5: ; f1242
	togglesfx
	tempo 144
	volume $77
	dutycycle $2
	notetype $8, $82
	octave 3
	note G#, 2
	note __, 4
	note C#, 2
	note F_, 2
	note G#, 2
	note F_, 2
	note G#, 2
	octave 4
	note D_, 2
	note F_, 2
	note D_, 2
	octave 3
	note B_, 2
	note A#, 2
	note F#, 2
	note A#, 2
	note G#, 2
	note F#, 2
	intensity $97
	note G#, 14
	note __, 6
	endchannel
; f1265

	togglesfx

Sfx_QuitSlots_Ch6: ; f1266
	togglesfx
	dutycycle $2
	notetype $8, $b3
	note __, 3
	octave 4
	note B_, 1
	octave 5
	note C_, 2
	octave 4
	note G#, 4
	note A#, 2
	intensity $c1
	note B_, 4
	note A#, 2
	note G#, 4
	note F_, 2
	note F#, 4
	note F_, 2
	note D#, 4
	intensity $b7
	note F_, 14
	note __, 6
	endchannel
; f1282

	togglesfx

Sfx_QuitSlots_Ch7: ; f1283
	togglesfx
	notetype $8, $25
	octave 3
	note C#, 2
	note __, 2
	note F_, 2
	note D#, 2
	note C#, 2
	note G#, 2
	note D_, 2
	note __, 2
	note D_, 2
	octave 2
	note G#, 2
	note B_, 2
	octave 3
	note D_, 2
	note D#, 2
	note __, 2
	octave 2
	note A#, 2
	octave 3
	note C_, 2
	note __, 2
	note C#, 14
	note __, 6
	endchannel
; f12a0

	togglesfx

Sfx_QuitSlots_Ch8: ; f12a1
	togglesfx
	sfxtogglenoise $3
	notetype $8
	note D#, 6
	note D_, 4
	note D#, 2
	note D#, 4
	note D#, 2
	note D_, 4
	note D#, 2
	note D_, 4
	note D#, 2
	note D_, 4
	note B_, 14
	note __, 6
	endchannel
; f12b3

	togglesfx

Sfx_Protect: ; f12b4
	musicheader 2, 5, Sfx_Protect_Ch5
	musicheader 1, 8, Sfx_Protect_Ch8
; f12ba

Sfx_Protect_Ch5: ; f12ba
	togglesfx
	notetype $1, $f1
	dutycycle $0
Sfx_Protect_branch_f12c0: ; f12c0
	octave 5
	note F_, 5
	note A_, 5
	octave 6
	note C_, 5
	note E_, 5
	octave 5
	note F#, 5
	note A#, 5
	octave 6
	note C#, 5
	note E_, 5
	loopchannel 3, Sfx_Protect_branch_f12c0
	intensity $c1
	octave 5
	note F_, 5
	note A_, 5
	intensity $91
	octave 6
	note C_, 5
	note E_, 5
	intensity $71
	octave 5
	note F#, 5
	note A#, 5
	intensity $51
	octave 6
	note C#, 5
	note E_, 5
	endchannel
; f12e5

Sfx_Protect_Ch8: ; f12e5
Sfx_Protect_branch_f12e5: ; f12e5
	noise __, 10, $9e, $0
	noise __, 10, $be, $11
	loopchannel 6, Sfx_Protect_branch_f12e5
	noise __, 10, $a7, $0
	noise C_,  1, $75, $11
	endchannel
; f12f6

Sfx_Sketch: ; f12f6
	musicheader 1, 5, Sfx_Sketch_Ch5
; f12f9

Sfx_Sketch_Ch5: ; f12f9
	dutycycle $1
	soundinput $a5
Sfx_Sketch_branch_f12fd: ; f12fd
	sound __,  3, $f1, $06e0
	sound __, 14, $af, $05b0
	sound __,  5, $0, 0
	sound __, 10, $f4, $0718
	loopchannel 3, Sfx_Sketch_branch_f12fd
	soundinput $8
	endchannel
; f1314

Sfx_RainDance: ; f1314
	musicheader 1, 8, Sfx_RainDance_Ch8
; f1317

Sfx_RainDance_Ch8: ; f1317
Sfx_RainDance_branch_f1317: ; f1317
	noise __, 12, $7d, $50
	noise __,  7, $7d, $4f
	noise __, 12, $7f, $47
	noise __, 16, $6e, $22
	loopchannel 3, Sfx_RainDance_branch_f1317
	noise __,  7, $6d, $50
	noise __,  6, $5d, $4f
	noise __,  6, $4f, $47
	noise __, 11, $32, $46
	endchannel
; f1334

Sfx_Aeroblast: ; f1334
	musicheader 2, 5, Sfx_Aeroblast_Ch5
	musicheader 1, 8, Sfx_Aeroblast_Ch8
; f133a

Sfx_Aeroblast_Ch5: ; f133a
	sound_duty 2, 0, 3, 3
	soundinput $f5
	sound C_, 13, $f8, $0580
	soundinput $8
	endchannel
; f1345

Sfx_Aeroblast_Ch8: ; f1345
	noise __,  5, $f8, $6c
	noise __,  5, $c8, $5c
	noise __,  5, $78, $5b
	noise C_,  1, $31, $5a
	endchannel
; f1352

Sfx_Spark: ; f1352
	musicheader 1, 8, Sfx_Spark_Ch8
; f1355

Sfx_Spark_Ch8: ; f1355
Sfx_Spark_branch_f1355: ; f1355
	noise __,  5, $f8, $5d
	noise __,  5, $d8, $6f
	loopchannel 2, Sfx_Spark_branch_f1355
	endchannel
; f1360

Sfx_Curse: ; f1360
	musicheader 2, 5, Sfx_Curse_Ch5
	musicheader 1, 8, Sfx_Curse_Ch8
; f1366

Sfx_Curse_Ch5: ; f1366
	dutycycle $3
	sound __,  5, $f2, $0483
	sound __,  5, $f2, $0511
	sound __,  5, $f2, $0589
	sound __,  5, $f2, $05ed
	endchannel
; f1379

Sfx_Curse_Ch8: ; f1379
	noise C_,  5, $9a, $9
	endchannel
; f137d

Sfx_Rage: ; f137d
	musicheader 2, 5, Sfx_Rage_Ch5
	musicheader 1, 8, Sfx_Rage_Ch8
; f1383

Sfx_Rage_Ch5: ; f1383
	dutycycle $0
	sound __,  4, $d1, $07b0
	sound __,  4, $d1, $07c2
	sound C_,  9, $d2, $07d5
	endchannel
; f1392

Sfx_Rage_Ch8: ; f1392
	noise __,  4, $f4, $1a
	noise __,  4, $f4, $19
	noise C_,  9, $f2, $18
	endchannel
; f139c

Sfx_Thief: ; f139c
	musicheader 1, 8, Sfx_Thief_Ch8
; f139f

Sfx_Thief_Ch8: ; f139f
Sfx_Thief_branch_f139f: ; f139f
	noise __,  1, $0, $0
	noise __,  5, $e1, $12
	noise __,  1, $0, $0
	noise __,  3, $b1, $22
	loopchannel 2, Sfx_Thief_branch_f139f
	endchannel
; f13b0

Sfx_Thief2: ; f13b0
	musicheader 1, 5, Sfx_Thief2_Ch5
; f13b3

Sfx_Thief2_Ch5: ; f13b3
	togglesfx
	notetype $2, $f4
	dutycycle $0
	octave 4
	note C#, 3
	note A#, 3
	intensity $d2
	note C#, 3
	note A#, 3
	intensity $b1
	note C_, 3
	note A_, 3
	intensity $81
	note C_, 3
	note A_, 3
	togglesfx
	endchannel
; f13ca

Sfx_SpiderWeb: ; f13ca
	musicheader 2, 5, Sfx_SpiderWeb_Ch5
	musicheader 1, 8, Sfx_SpiderWeb_Ch8
; f13d0

Sfx_SpiderWeb_Ch5: ; f13d0
	dutycycle $0
	sound C#,  1, $7f, $0720
	soundinput $95
	sound __,  5, $f8, $0620
	sound __,  5, $e8, $0630
	sound __,  5, $d8, $0640
	sound __,  5, $95, $0620
	sound __,  5, $73, $0630
	sound __,  5, $51, $0640
	soundinput $8
	endchannel
; f13f3

Sfx_SpiderWeb_Ch8: ; f13f3
	noise C#,  1, $ef, $0
	endchannel
; f13f7

Sfx_MindReader: ; f13f7
	musicheader 2, 5, Sfx_MindReader_Ch5
	musicheader 1, 8, Sfx_MindReader_Ch8
; f13fd

Sfx_MindReader_Ch5: ; f13fd
	togglesfx
	dutycycle $2
	notetype $2, $f1
	octave 5
	note C_, 3
	intensity $41
	note C_, 3
	intensity $f1
	note C#, 3
	intensity $41
	note C#, 3
	intensity $f1
	note D_, 3
	intensity $41
	note D_, 3
	togglesfx
	endchannel
; f1416

Sfx_MindReader_Ch8: ; f1416
	noise C_,  2, $af, $19
	noise C_,  3, $af, $18
	endchannel
; f141d

Sfx_Nightmare: ; f141d
	musicheader 1, 5, Sfx_Nightmare_Ch5
; f1420

Sfx_Nightmare_Ch5: ; f1420
	dutycycle $0
	soundinput $34
Sfx_Nightmare_branch_f1424: ; f1424
	sound __,  4, $ba, $0631
	sound __,  3, $0, 0
	sound __,  4, $f8, $0621
	sound __,  3, $0, 0
	sound __,  4, $f8, $0611
	sound __,  3, $0, 0
	sound __,  4, $e8, $0601
	sound __,  3, $0, 0
	sound __,  4, $e8, $05f1
	sound __,  3, $0, 0
	loopchannel 2, Sfx_Nightmare_branch_f1424
	soundinput $8
	endchannel
; f1453

Sfx_Snore: ; f1453
	musicheader 1, 8, Sfx_Snore_Ch8
; f1456

Sfx_Snore_Ch8: ; f1456
	noise __,  3, $ea, $4b
	noise __,  3, $ea, $5b
	noise __,  3, $0, $0
	noise __,  5, $ee, $47
	noise __,  5, $ee, $46
	noise __,  5, $ee, $45
	endchannel
; f1469

Sfx_SweetKiss: ; f1469
	musicheader 1, 5, Sfx_SweetKiss_Ch5
; f146c

Sfx_SweetKiss_Ch5: ; f146c
	dutycycle $2
Sfx_SweetKiss_branch_f146e: ; f146e
	sound __,  3, $c1, $07c8
	sound __,  3, $d1, $07da
	loopchannel 2, Sfx_SweetKiss_branch_f146e
	sound C_, 11, $f1, $07e2
	endchannel
; f147f

Sfx_SweetKiss2: ; f147f
	musicheader 1, 5, Sfx_SweetKiss2_Ch5
; f1482

Sfx_SweetKiss2_Ch5: ; f1482
	dutycycle $0
	soundinput $97
	sound __,  3, $f4, $0772
	sound __,  5, $0, 0
	sound __,  3, $c4, $0772
	sound __,  5, $0, 0
	sound __,  3, $b4, $0772
	sound __,  5, $0, 0
	sound __,  3, $a1, $0772
	soundinput $8
	endchannel
; f14a5

Sfx_BellyDrum: ; f14a5
	musicheader 2, 5, Sfx_BellyDrum_Ch5
	musicheader 1, 8, Sfx_BellyDrum_Ch8
; f14ab

Sfx_BellyDrum_Ch5: ; f14ab
	dutycycle $2
	soundinput $ac
	sound __, 13, $f1, $05a3
	soundinput $8
	endchannel
; f14b6

Sfx_BellyDrum_Ch8: ; f14b6
	noise __, 13, $b1, $6c
	endchannel
; f14ba

Sfx_Unknown7F: ; f14ba
	musicheader 1, 5, Sfx_Unknown7F_Ch5
; f14bd

Sfx_Unknown7F_Ch5: ; f14bd
	dutycycle $2
	soundinput $95
	sound __,  3, $c9, $03b3
	sound __,  6, $f8, $0463
	sound __,  5, $d1, $0543
	soundinput $8
	endchannel
; f14d0

Sfx_SludgeBomb: ; f14d0
	musicheader 2, 5, Sfx_SludgeBomb_Ch5
	musicheader 1, 8, Sfx_SludgeBomb_Ch8
; f14d6

Sfx_SludgeBomb_Ch5: ; f14d6
	dutycycle $2
	soundinput $c5
	sound __,  4, $f8, $0581
	sound __,  2, $0, 0
	soundinput $cb
	sound C_,  1, $f2, $05d1
	soundinput $8
	endchannel
; f14eb

Sfx_SludgeBomb_Ch8: ; f14eb
	noise __,  4, $e2, $6e
	noise __,  2, $0, $0
	noise C_,  1, $e2, $6d
	endchannel
; f14f5

Sfx_Foresight: ; f14f5
	musicheader 1, 5, Sfx_Foresight_Ch5
; f14f8

Sfx_Foresight_Ch5: ; f14f8
	sound __,  4, $f4, $07b5
	sound __,  4, $f5, $07c8
	sound __,  9, $f4, $07da
	sound __,  3, $0, 0
	sound __,  9, $c1, $07da
	sound __,  3, $0, 0
	sound __,  9, $91, $07da
	endchannel
; f1515

Sfx_Spite: ; f1515
	musicheader 1, 5, Sfx_Spite_Ch5
; f1518

Sfx_Spite_Ch5: ; f1518
	togglesfx
	vibrato $0, $12
	dutycycle $3
	soundinput $fd
	notetype $3, $f8
	octave 3
	note F_, 3
	note G#, 3
	note B_, 3
	note E_, 3
	note G_, 3
	note A#, 3
	intensity $bf
	note D#, 3
	note F#, 3
	note A_, 3
	intensity $5f
	note D_, 3
	intensity $2f
	note F_, 3
	note G#, 3
	soundinput $8
	togglesfx
	endchannel
; f153a

Sfx_Outrage: ; f153a
	musicheader 1, 8, Sfx_Outrage_Ch8
; f153d

Sfx_Outrage_Ch8: ; f153d
	noise __, 12, $ea, $6c
	noise __, 12, $ea, $6b
	noise __, 12, $ea, $6a
	noise __, 12, $ea, $69
	noise __, 12, $e1, $59
	endchannel
; f154d

Sfx_PerishSong: ; f154d
	musicheader 2, 5, Sfx_PerishSong_Ch5
	musicheader 1, 6, Sfx_PerishSong_Ch6
; f1553

Sfx_PerishSong_Ch5: ; f1553
	togglesfx
	dutycycle $0
	vibrato $12, $53
	notetype $8, $af
	octave 4
	note A_, 9
	note G#, 9
	togglesfx
	endchannel
; f1561

Sfx_PerishSong_Ch6: ; f1561
	togglesfx
	dutycycle $0
	vibrato $12, $53
	notetype $8, $af
	octave 4
	note C_, 9
	octave 3
	note B_, 9
	togglesfx
	endchannel
; f1570

Sfx_GigaDrain: ; f1570
	musicheader 2, 5, Sfx_GigaDrain_Ch5
	musicheader 1, 8, Sfx_GigaDrain_Ch8
; f1576

Sfx_GigaDrain_Ch5: ; f1576
	dutycycle $2
	soundinput $97
	sound __,  5, $f8, $0680
	sound C_,  5, $f8, $0680
	sound C_,  5, $c8, $0660
	sound C_,  5, $a8, $0670
	sound C_,  5, $88, $0680
	sound C_,  5, $f8, $0561
	sound C_,  5, $c8, $0541
	sound C_,  5, $a8, $0521
	sound C_,  5, $88, $0511
	soundinput $8
	endchannel
; f15a1

Sfx_GigaDrain_Ch8: ; f15a1
	noise __,  5, $c8, $44
	noise C_,  5, $c8, $50
	noise C_,  5, $c8, $52
	noise C_,  5, $c8, $54
	noise C_,  5, $c8, $56
	noise D#,  1, $c7, $57
	endchannel
; f15b4

Sfx_Attract: ; f15b4
	musicheader 1, 5, Sfx_Attract_Ch5
; f15b7

Sfx_Attract_Ch5: ; f15b7
	dutycycle $0
	soundinput $77
	sound __,  5, $a9, $06f0
	sound __, 13, $f8, $0720
	soundinput $7f
	sound __,  9, $f1, $0740
	soundinput $8
	endchannel
; f15cc

Sfx_Kinesis2: ; f15cc
	musicheader 1, 5, Sfx_Kinesis2_Ch5
; f15cf

Sfx_Kinesis2_Ch5: ; f15cf
	dutycycle $0
	sound __,  3, $f3, $0796
	sound __,  3, $23, $0796
	sound C_,  5, $f1, $07c4
	endchannel
; f15de

Sfx_ZapCannon: ; f15de
	musicheader 1, 8, Sfx_ZapCannon_Ch8
; f15e1

Sfx_ZapCannon_Ch8: ; f15e1
Sfx_ZapCannon_branch_f15e1: ; f15e1
	noise __,  3, $e1, $49
	noise __,  1, $0, $0
	loopchannel 8, Sfx_ZapCannon_branch_f15e1
	noise __,  9, $e1, $49
	endchannel
; f15ef

Sfx_MeanLook: ; f15ef
	musicheader 1, 5, Sfx_MeanLook_Ch5
; f15f2

Sfx_MeanLook_Ch5: ; f15f2
	soundinput $77
	dutycycle $3
	sound __,  3, $f8, $0720
Sfx_MeanLook_branch_f15fa: ; f15fa
	sound __,  2, $88, $0660
	sound __,  3, $f8, $0790
	loopchannel 5, Sfx_MeanLook_branch_f15fa
	sound __, 13, $f8, $0700
	sound __, 13, $c8, $0720
	sound __, 13, $a8, $0700
	sound __, 13, $78, $0720
	sound __, 13, $48, $0700
	sound __, 13, $28, $0720
	soundinput $8
	endchannel
; f1621

Sfx_HealBell: ; f1621
	musicheader 1, 5, Sfx_HealBell_Ch5
; f1624

Sfx_HealBell_Ch5: ; f1624
	dutycycle $1
	sound __,  2, $f1, $07da
	sound __,  2, $d1, $07d9
	sound __,  2, $f1, $07da
	sound __,  9, $d1, $07db
	endchannel
; f1637

Sfx_Return: ; f1637
	musicheader 1, 5, Sfx_Return_Ch5
; f163a

Sfx_Return_Ch5: ; f163a
	dutycycle $0
Sfx_Return_branch_f163c: ; f163c
	soundinput $bf
	sound __,  9, $f1, $0759
	soundinput $57
	sound __,  9, $f1, $0759
	sound C_,  1, $0, 0
	loopchannel 2, Sfx_Return_branch_f163c
	soundinput $8
	endchannel
; f1653

Sfx_ExpBar: ; f1653
	musicheader 1, 5, Sfx_ExpBar_Ch5
; f1656

Sfx_ExpBar_Ch5: ; f1656
	dutycycle $2
	soundinput $d7
	sound __,  9, $e1, $0750
	soundinput $e7
	sound __,  9, $48, $06e0
	sound __,  9, $58, $06f8
	sound __,  9, $68, $0710
	sound __,  9, $78, $0728
	sound __,  9, $88, $0740
	sound __,  9, $98, $0758
	sound C_,  1, $a8, $0770
	soundinput $8
	endchannel
; f167f

Sfx_MilkDrink: ; f167f
	musicheader 1, 5, Sfx_MilkDrink_Ch5
; f1682

Sfx_MilkDrink_Ch5: ; f1682
	dutycycle $2
Sfx_MilkDrink_branch_f1684: ; f1684
	soundinput $a4
	sound __,  3, $ea, $04e0
	sound __, 14, $f7, $0290
	soundinput $9e
	sound __,  5, $c9, $05e1
	sound __,  3, $0, 0
	loopchannel 6, Sfx_MilkDrink_branch_f1684
	soundinput $8
	endchannel
; f169f

Sfx_Present: ; f169f
	musicheader 1, 5, Sfx_Present_Ch5
; f16a2

Sfx_Present_Ch5: ; f16a2
	dutycycle $2
	soundinput $d6
Sfx_Present_branch_f16a6: ; f16a6
	sound __,  3, $f1, $0740
	sound __,  2, $0, 0
	loopchannel 3, Sfx_Present_branch_f16a6
	sound C_,  1, $f1, $0780
	soundinput $8
	endchannel
; f16b9

Sfx_MorningSun: ; f16b9
	musicheader 1, 5, Sfx_MorningSun_Ch5
; f16bc

Sfx_MorningSun_Ch5: ; f16bc
	dutycycle $3
Sfx_MorningSun_branch_f16be: ; f16be
	sound __,  3, $f1, $07e4
	sound __,  3, $f1, $07e0
	sound __,  6, $f2, $07e7
	loopchannel 3, Sfx_MorningSun_branch_f16be
	sound __,  2, $0, 0
	sound __,  9, $c2, $07e7
	sound __,  2, $0, 0
	sound __,  9, $82, $07e7
	endchannel
; f16df

Sfx_Moonlight: ; f16df
	musicheader 1, 5, Sfx_Moonlight_Ch5
; f16e2

Sfx_Moonlight_Ch5: ; f16e2
	dutycycle $2
Sfx_Moonlight_branch_f16e4: ; f16e4
	sound __,  2, $f8, $07d0
	sound __,  5, $f1, $07e0
	loopchannel 2, Sfx_Moonlight_branch_f16e4
	sound C_,  1, $f1, $07e0
	sound C_,  1, $d1, $07e0
	sound C_,  1, $81, $07e0
	endchannel
; f16fd

Sfx_Encore: ; f16fd
	musicheader 2, 5, Sfx_Encore_Ch5
	musicheader 1, 8, Sfx_Encore_Ch8
; f1703

Sfx_Encore_Ch5: ; f1703
	dutycycle $2
	soundinput $ce
	sound C_,  1, $0, 0
Sfx_Encore_branch_f170b: ; f170b
	sound __,  3, $f8, $0774
	sound C#,  5, $0, 0
	loopchannel 2, Sfx_Encore_branch_f170b
	soundinput $8
	endchannel
; f171a

Sfx_Encore_Ch8: ; f171a
	noise D_,  1, $1f, $36
	noise D_,  1, $76, $36
	endchannel
; f1721

Sfx_BeatUp: ; f1721
	musicheader 1, 8, Sfx_BeatUp_Ch8
; f1724

Sfx_BeatUp_Ch8: ; f1724
	noise __,  3, $e8, $69
	noise __,  7, $d8, $24
	noise __,  3, $e8, $6c
	noise __,  5, $c8, $46
	noise __,  7, $d1, $24
	endchannel
; f1734

Sfx_SweetScent: ; f1734
	musicheader 1, 5, Sfx_SweetScent_Ch5
; f1737

Sfx_SweetScent_Ch5: ; f1737
	dutycycle $2
	soundinput $96
	sound __,  7, $f8, $0760
	sound __,  7, $e8, $0720
	soundinput $df
	sound C_,  7, $f1, $0730
	soundinput $8
	endchannel
; f174c

Sfx_BatonPass: ; f174c
	musicheader 2, 5, Sfx_BatonPass_Ch5
	musicheader 1, 8, Sfx_BatonPass_Ch8
; f1752

Sfx_BatonPass_Ch5: ; f1752
	dutycycle $2
	soundinput $f7
	sound C#,  1, $f2, $0680
	sound __,  2, $f1, $0760
	sound C#,  1, $0, 0
	sound __,  2, $f1, $0760
	sound C_, 11, $0, 0
	sound __,  2, $f1, $0760
	soundinput $8
	endchannel
; f1771

Sfx_BatonPass_Ch8: ; f1771
	noise C#,  1, $f2, $20
	endchannel
; f1775

Sfx_EggCrack: ; f1775
	musicheader 1, 5, Sfx_EggCrack_Ch5
; f1778

Sfx_EggCrack_Ch5: ; f1778
	togglesfx
	notetype $1, $f1
	dutycycle $0
	octave 4
	note D#, 1
	note C_, 1
	note __, 1
	note F#, 1
	endchannel
; f1784

Sfx_Evolved: ; f1784
	musicheader 1, 5, Sfx_Evolved_Ch5
; f1787

Sfx_Evolved_Ch5: ; f1787
	togglesfx
	notetype $1, $c1
	octave 4
	note C_, 2
	note E_, 2
	note C_, 2
	note E_, 3
	note G_, 3
	note B_, 3
	octave 5
	note E_, 2
	note C_, 2
	note E_, 2
	note G_, 3
	note B_, 3
	octave 7
	note C_, 16
	endchannel
; f179b

Sfx_MasterBall: ; f179b
	musicheader 1, 5, Sfx_MasterBall_Ch5
; f179e

Sfx_MasterBall_Ch5: ; f179e
	togglesfx
	dutycycle $1
	notetype $2, $e1
	octave 6
	note B_, 2
	octave 7
	note D_, 2
	octave 6
	note B_, 2
	note G_, 2
	note B_, 2
	note A#, 2
	note A_, 2
	note A#, 2
	note A_, 2
	intensity $c1
	note G#, 2
	note G_, 2
	note F#, 2
	intensity $91
	note F_, 2
	note E_, 2
	note D#, 2
	intensity $61
	note D_, 2
	note C#, 2
	note C_, 2
	endchannel
; f17c0

Sfx_EggHatch: ; f17c0
	musicheader 1, 5, Sfx_EggHatch_Ch5
; f17c3

Sfx_EggHatch_Ch5: ; f17c3
	togglesfx
	notetype $2, $f1
	dutycycle $2
	octave 5
	note E_, 1
	note C_, 1
	note __, 1
	note G_, 1
	note D_, 1
	intensity $e2
	note B_, 7
	intensity $82
	note B_, 7
	intensity $42
	note B_, 7
	endchannel
; f17d9

Sfx_GsIntroCharizardFireball: ; f17d9
	musicheader 1, 8, Sfx_GsIntroCharizardFireball_Ch8
; f17dc

Sfx_GsIntroCharizardFireball_Ch8: ; f17dc
	noise __,  9, $cf, $4d
	noise __,  9, $f1, $37
Sfx_GsIntroCharizardFireball_branch_f17e2: ; f17e2
	noise __,  2, $f8, $4f
	noise __,  1, $c8, $26
	noise __,  2, $d8, $5f
	noise __,  1, $a8, $37
	loopchannel 12, Sfx_GsIntroCharizardFireball_branch_f17e2
	noise __,  4, $f8, $6f
	noise __,  5, $d8, $5f
	noise __, 13, $d8, $5c
	noise C#,  9, $d3, $4f
	endchannel
; f17ff

Sfx_GsIntroPokemonAppears: ; f17ff
	musicheader 1, 8, Sfx_GsIntroPokemonAppears_Ch8
; f1802

Sfx_GsIntroPokemonAppears_Ch8: ; f1802
	noise __,  2, $88, $4f
	noise __,  3, $8f, $2
	noise __,  3, $5f, $12
	noise __,  3, $3f, $22
	noise __,  1, $f8, $27
	noise __,  2, $f8, $4f
	noise __,  9, $f1, $0
	endchannel
; f1818

Sfx_Flash: ; f1818
	musicheader 1, 5, Sfx_Flash_Ch5
; f181b

Sfx_Flash_Ch5: ; f181b
	dutycycle $1
	soundinput $ef
	sound __,  2, $40, $07e8
	sound __,  2, $60, $07e8
	sound __,  3, $80, $07e8
	sound __,  6, $a0, $07e8
	sound __,  7, $a0, $07e8
	sound __,  8, $80, $07e8
	sound __,  9, $60, $07e8
	sound __, 10, $30, $07e8
	sound __, 16, $12, $07e8
	soundinput $8
	endchannel
; f1846

Sfx_GameFreakLogoGs: ; f1846
	musicheader 1, 5, Sfx_GameFreakLogoGs_Ch5
; f1849

Sfx_GameFreakLogoGs_Ch5: ; f1849
	dutycycle $3
	soundinput $7f
	sound __,  5, $55, $07e2
	sound __,  6, $75, $07e2
	sound __,  7, $94, $07e2
	sound __,  8, $b4, $07e2
	sound __,  9, $b3, $07e2
	sound __, 10, $93, $07e2
	sound __, 11, $72, $07e2
	sound __, 11, $53, $07e2
	sound __, 11, $34, $07e2
	sound __, 11, $15, $07e2
	soundinput $8
	endchannel
; f1878

Sfx_DexFanfareLessThan20: ; f1878
	musicheader 4, 5, Sfx_DexFanfareLessThan20_Ch5
	musicheader 1, 6, Sfx_DexFanfareLessThan20_Ch6
	musicheader 1, 7, Sfx_DexFanfareLessThan20_Ch7
	musicheader 1, 8, Sfx_DexFanfareLessThan20_Ch8
; f1884

Sfx_DexFanfareLessThan20_Ch5: ; f1884
	togglesfx
	tempo 124
	volume $77
	notetype $8, $b1
	octave 3
	note A_, 4
	note F#, 2
	note A_, 4
	note F#, 2
	note C#, 6
	note G_, 6
	note F#, 6
	note E_, 2
	note E_, 2
	note E_, 2
	note D_, 6
	endchannel
; f189a

	togglesfx

Sfx_DexFanfareLessThan20_Ch6: ; f189b
	togglesfx
	notetype $8, $c1
	octave 3
	note B_, 4
	note A_, 2
	note B_, 4
	note A_, 2
	note D#, 6
	note A#, 6
	note A_, 6
	note A_, 2
	note A_, 2
	note G_, 2
	note F#, 6
	endchannel
; f18ac

	togglesfx

Sfx_DexFanfareLessThan20_Ch7: ; f18ad
	togglesfx
	notetype $8, $25
	octave 4
	note D_, 6
	octave 3
	note A_, 2
	note __, 2
	note A_, 2
	note A#, 4
	note G_, 2
	octave 4
	note D#, 6
	note D_, 2
	note __, 4
	octave 3
	note E_, 1
	note __, 1
	note F#, 1
	note __, 1
	note G_, 1
	note __, 1
	note A_, 2
	note __, 6
	endchannel
; f18c7

	togglesfx

Sfx_DexFanfareLessThan20_Ch8: ; f18c8
	togglesfx
	sfxtogglenoise $4
	notetype $c
	note C#, 6
	note __, 16
	note __, 12
	endchannel
; f18d1

	togglesfx

Sfx_DexFanfare140169: ; f18d2
	musicheader 4, 5, Sfx_DexFanfare140169_Ch5
	musicheader 1, 6, Sfx_DexFanfare140169_Ch6
	musicheader 1, 7, Sfx_DexFanfare140169_Ch7
	musicheader 1, 8, Sfx_DexFanfare140169_Ch8
; f18de

Sfx_DexFanfare140169_Ch5: ; f18de
	togglesfx
	tempo 120
	volume $77
	dutycycle $3
	vibrato $12, $34
	notetype $6, $b1
	note __, 8
	octave 3
	note E_, 4
	note E_, 4
	note A_, 4
	octave 4
	note C#, 4
	intensity $a4
	note D_, 4
	note C_, 4
	octave 3
	note A_, 2
	note G_, 2
	note F#, 4
	note G_, 16
	octave 2
	note B_, 8
	note __, 8
	endchannel
; f1900

	togglesfx

Sfx_DexFanfare140169_Ch6: ; f1901
	togglesfx
	dutycycle $2
	vibrato $12, $34
	notetype $6, $c1
	octave 4
	note E_, 4
	note F#, 4
	note G_, 4
	note G_, 4
	note G_, 4
	note G_, 4
	intensity $b4
	note F#, 4
	note G_, 4
	note A_, 4
	octave 5
	note C_, 4
	octave 4
	note B_, 16
	note G_, 8
	note __, 8
	endchannel
; f191d

	togglesfx

Sfx_DexFanfare140169_Ch7: ; f191e
	togglesfx
	notetype $c, $25
	note __, 4
	octave 2
	note A_, 1
	octave 3
	note C#, 1
	note E_, 1
	note A_, 3
	note C#, 1
	note __, 1
	note D_, 1
	note F#, 1
	note A_, 1
	octave 4
	note D_, 3
	octave 2
	note A_, 1
	note __, 1
	note G_, 1
	note B_, 1
	octave 3
	note D_, 1
	note G_, 3
	octave 2
	note B_, 1
	note __, 1
	note G_, 4
	note __, 4
	endchannel
; f193e

	togglesfx

Sfx_DexFanfare140169_Ch8: ; f193f
	togglesfx
	sfxtogglenoise $4
	notetype $c
	note C_, 4
Sfx_DexFanfare140169_branch_f1945: ; f1945
	note D_, 4
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	loopchannel 3, Sfx_DexFanfare140169_branch_f1945
	note D_, 8
	endchannel
; f1950

	togglesfx

Sfx_DexFanfare170199: ; f1951
	musicheader 4, 5, Sfx_DexFanfare170199_Ch5
	musicheader 1, 6, Sfx_DexFanfare170199_Ch6
	musicheader 1, 7, Sfx_DexFanfare170199_Ch7
	musicheader 1, 8, Sfx_DexFanfare170199_Ch8
; f195d

Sfx_DexFanfare170199_Ch5: ; f195d
	togglesfx
	tempo 112
	volume $77
	vibrato $12, $34
	dutycycle $3
	notetype $8, $b4
	octave 3
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 6
	note __, 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	intensity $c1
	note F_, 4
	note G_, 4
	note A_, 4
	notetype $c, $a8
	note A#, 12
	note __, 4
	endchannel
; f1981

	togglesfx

Sfx_DexFanfare170199_Ch6: ; f1982
	togglesfx
	vibrato $12, $34
	dutycycle $3
	notetype $8, $c4
	octave 3
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	note A#, 6
	note __, 2
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	intensity $d1
	octave 4
	note D#, 4
	note D#, 4
	note D#, 4
	notetype $c, $b8
	note D_, 12
	note __, 4
	endchannel
; f19a2

	togglesfx

Sfx_DexFanfare170199_Ch7: ; f19a3
	togglesfx
	notetype $8, $25
	octave 3
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note D#, 6
	note __, 2
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note C_, 2
	note __, 2
	note C_, 2
	note __, 2
	note C_, 2
	note __, 2
	notetype $c, $25
	octave 2
	note A#, 12
	note __, 4
	endchannel
; f19bf

	togglesfx

Sfx_DexFanfare170199_Ch8: ; f19c0
	togglesfx
	sfxtogglenoise $4
	notetype $8
	note D_, 2
	note D_, 2
	note D_, 4
	note D_, 4
	note D_, 2
	note D_, 2
	note D_, 4
	note D_, 4
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	notetype $c
	note B_, 16
	endchannel
; f19d5

	db $fd

Sfx_DexFanfare200229: ; f19d6
	musicheader 4, 5, Sfx_DexFanfare200229_Ch5
	musicheader 1, 6, Sfx_DexFanfare200229_Ch6
	musicheader 1, 7, Sfx_DexFanfare200229_Ch7
	musicheader 1, 8, Sfx_DexFanfare200229_Ch8
; f19e2

Sfx_DexFanfare200229_Ch5: ; f19e2
	togglesfx
	tempo 124
	volume $77
	vibrato $12, $34
	dutycycle $3
	notetype $8, $b2
	octave 3
	note C_, 2
	note E_, 2
	note G_, 2
	octave 4
	note C_, 4
	octave 3
	note B_, 4
	note A_, 4
	note A#, 4
	octave 4
	note D#, 4
	note G_, 4
	notetype $c, $a8
	note F#, 12
	note __, 4
	endchannel
; f1a03

	togglesfx

Sfx_DexFanfare200229_Ch6: ; f1a04
	togglesfx
	vibrato $12, $34
	dutycycle $3
	notetype $8, $b2
	octave 3
	note E_, 2
	note G_, 2
	octave 4
	note C_, 2
	note E_, 4
	note D_, 4
	note C_, 4
	note D#, 4
	note G_, 4
	note A#, 4
	notetype $c, $b8
	note A_, 12
	note __, 4
	endchannel
; f1a1e

	togglesfx

Sfx_DexFanfare200229_Ch7: ; f1a1f
	togglesfx
	notetype $8, $25
	octave 3
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 2
	note E_, 2
	note G_, 2
	octave 4
	note C_, 2
	octave 3
	note C_, 4
	note D#, 2
	note G_, 2
	note A#, 2
	octave 4
	note D#, 2
	octave 3
	note D#, 4
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 2
	note A_, 2
	octave 3
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 2
	note A_, 2
	octave 3
	note D_, 6
	note __, 6
	endchannel
; f1a49

	togglesfx

Sfx_DexFanfare200229_Ch8: ; f1a4a
	togglesfx
	sfxtogglenoise $4
	notetype $8
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note D_, 4
	note D_, 4
	note D_, 4
	note D_, 4
	note D_, 4
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note D_, 4
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 2
	note B_, 12
	endchannel
; f1a65

	togglesfx

Sfx_DexFanfare230Plus: ; f1a66
	musicheader 4, 5, Sfx_DexFanfare230Plus_Ch5
	musicheader 1, 6, Sfx_DexFanfare230Plus_Ch6
	musicheader 1, 7, Sfx_DexFanfare230Plus_Ch7
	musicheader 1, 8, Sfx_DexFanfare230Plus_Ch8
; f1a72

Sfx_DexFanfare230Plus_Ch5: ; f1a72
	togglesfx
	tempo 112
	volume $77
	vibrato $12, $34
	dutycycle $3
	notetype $8, $a5
	octave 3
	note B_, 2
	note G_, 2
	note B_, 2
	octave 4
	note D_, 14
	note __, 2
	dutycycle $2
	intensity $85
	octave 2
	note F_, 1
	note __, 1
	note F_, 6
	intensity $a5
	dutycycle $3
	octave 3
	note A_, 2
	note G_, 2
	note F_, 10
	note __, 2
	dutycycle $2
	intensity $85
	octave 2
	note F_, 1
	note __, 1
	note F_, 6
	intensity $a5
	dutycycle $3
	octave 3
	note A#, 12
	intensity $b2
	note G_, 4
	note A_, 4
	note A#, 4
	notetype $c, $a8
	note A_, 14
	note __, 2
	endchannel
; f1ab1

	togglesfx

Sfx_DexFanfare230Plus_Ch6: ; f1ab2
	togglesfx
	vibrato $12, $34
	dutycycle $3
	notetype $8, $b5
	octave 4
	note G_, 2
	note D_, 2
	note G_, 2
	note F_, 14
	note __, 4
	note F_, 2
	note E_, 2
	note D_, 2
	note C_, 2
	octave 3
	note B_, 2
	note A_, 10
	note __, 4
	note A_, 2
	octave 4
	note C_, 2
	note D_, 2
	note D#, 12
	intensity $c2
	note G_, 4
	note G_, 4
	note G_, 4
	notetype $c, $b8
	note F#, 14
	note __, 2
	endchannel
; f1ad9

	togglesfx

Sfx_DexFanfare230Plus_Ch7: ; f1ada
	togglesfx
	notetype $8, $25
	octave 3
	note G_, 6
	note A#, 4
	note F_, 2
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	note A#, 2
	note __, 2
	note D_, 1
	note __, 1
	note D_, 6
	note A_, 4
	note F_, 2
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A_, 2
	note __, 2
	note C_, 1
	note __, 1
	note C_, 6
	note G_, 4
	note D#, 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note A#, 4
	note G_, 4
	note D#, 4
	notetype $c, $25
	note D_, 14
	note __, 2
	endchannel
; f1b0b

	togglesfx

Sfx_DexFanfare230Plus_Ch8: ; f1b0c
	togglesfx
	sfxtogglenoise $4
	notetype $8
	note D_, 2
	note D_, 2
	note D_, 2
Sfx_DexFanfare230Plus_branch_f1b14: ; f1b14
	note D_, 6
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 6
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	loopchannel 2, Sfx_DexFanfare230Plus_branch_f1b14
	note D_, 6
	note D_, 2
	note D_, 2
	note C#, 1
	note C#, 1
	note D_, 4
	note D_, 4
	note D_, 4
Sfx_DexFanfare230Plus_branch_f1b2b: ; f1b2b
	note C#, 1
	loopchannel 18, Sfx_DexFanfare230Plus_branch_f1b2b
	note D_, 6
	endchannel
; f1b32

	togglesfx

Sfx_NotVeryEffective: ; f1b33
	musicheader 1, 8, Sfx_NotVeryEffective_Ch8
; f1b36

Sfx_NotVeryEffective_Ch8: ; f1b36
	noise __,  5, $f1, $5f
	noise __,  2, $a0, $42
	noise C_,  1, $f1, $53
	endchannel
; f1b40

Sfx_Damage: ; f1b40
	musicheader 1, 8, Sfx_Damage_Ch8
; f1b43

Sfx_Damage_Ch8: ; f1b43
	noise __,  5, $f1, $5e
	noise __,  2, $a0, $12
	noise __,  5, $f0, $32
	noise C_,  1, $f1, $44
	endchannel
; f1b50

Sfx_SuperEffective: ; f1b50
	musicheader 1, 8, Sfx_SuperEffective_Ch8
; f1b53

Sfx_SuperEffective_Ch8: ; f1b53
	noise __,  4, $f1, $4f
	noise __,  2, $c8, $22
	noise __,  3, $f8, $3f
	noise __,  4, $d0, $15
	noise C#,  1, $f2, $35
	endchannel
; f1b63

Sfx_BallBounce: ; f1b63
	musicheader 2, 5, Sfx_BallBounce_Ch5
	musicheader 1, 6, Sfx_BallBounce_Ch6
; f1b69

Sfx_BallBounce_Ch5: ; f1b69
	dutycycle $2
	sound __,  9, $e1, $0740
	sound C_,  8, $0, 0
	sound __,  9, $b1, $0740
	sound C_,  8, $0, 0
	sound __,  9, $81, $0740
	sound C_,  8, $0, 0
	sound __,  9, $51, $0740
	sound C_,  8, $0, 0
	endchannel
; f1b8c

Sfx_BallBounce_Ch6: ; f1b8c
	dutycycle $2
	sound __,  3, $8, 0
	sound __,  9, $b1, $0741
	sound C_,  8, $0, 0
	sound __,  9, $81, $0741
	sound C_,  8, $0, 0
	sound __,  9, $51, $0741
	sound C_,  8, $0, 0
	sound __,  9, $21, $0741
	sound C_,  8, $0, 0
	endchannel
; f1bb3

Sfx_SweetScent2: ; f1bb3
	musicheader 2, 5, Sfx_SweetScent2_Ch5
	musicheader 1, 8, Sfx_SweetScent2_Ch8
; f1bb9

Sfx_SweetScent2_Ch5: ; f1bb9
	soundinput $af
	dutycycle $1
	sound __,  7, $f8, $05f0
	sound __,  3, $f1, $0620
	sound C_,  1, $f1, $0650
	soundinput $8
	endchannel
; f1bcc

Sfx_SweetScent2_Ch8: ; f1bcc
	noise __,  3, $e8, $22
	noise C_,  2, $aa, $0
Sfx_SweetScent2_branch_f1bd2: ; f1bd2
	noise __,  5, $d9, $10
	noise __,  9, $91, $0
	noise __,  3, $61, $7
	loopchannel 5, Sfx_SweetScent2_branch_f1bd2
	noise __,  5, $99, $0
	noise __, 11, $61, $0
	noise __,  7, $59, $0
	noise __,  3, $21, $7
	endchannel
; f1bec

Sfx_HitEndOfExpBar: ; f1bec
	musicheader 2, 5, Sfx_HitEndOfExpBar_Ch5
	musicheader 1, 6, Sfx_HitEndOfExpBar_Ch6
; f1bf2

Sfx_HitEndOfExpBar_Ch5: ; f1bf2
	dutycycle $2
	sound __,  2, $e1, $0789
	sound __,  2, $e1, $07a2
	sound C_,  1, $e1, $07b1
	endchannel
; f1c01

Sfx_HitEndOfExpBar_Ch6: ; f1c01
	dutycycle $2
	sound __,  2, $e1, $07a2
	sound __,  2, $e1, $07b1
	sound C_,  1, $e1, $07c4
	endchannel
; f1c10

Sfx_GiveTrademon: ; f1c10
	musicheader 1, 5, Sfx_GiveTrademon_Ch5
; f1c13

Sfx_GiveTrademon_Ch5: ; f1c13
	sound C#,  1, $0, 0
	dutycycle $1
	soundinput $a7
	sound C_, 12, $f4, $0750
	sound C_, 12, $d4, $0750
	sound C_, 12, $b4, $0750
	sound C_, 12, $94, $0750
	sound C_, 12, $74, $0750
	sound C_, 12, $54, $0750
	sound C_, 12, $34, $0750
	sound C_, 12, $14, $0750
	soundinput $8
	endchannel
; f1c3e

Sfx_GetTrademon: ; f1c3e
	musicheader 1, 5, Sfx_GetTrademon_Ch5
; f1c41

Sfx_GetTrademon_Ch5: ; f1c41
	sound C#,  1, $0, 0
	dutycycle $2
	soundinput $bf
	sound C_, 12, $14, $07bc
	sound C_, 12, $34, $07bc
	sound C_, 12, $54, $07bc
	sound C_, 12, $74, $07bc
	sound C_, 12, $94, $07bc
	sound C_, 12, $b4, $07bc
	sound C_, 12, $d4, $07bc
	sound C_, 12, $f4, $07bc
	soundinput $8
	endchannel
; f1c6c

Sfx_TrainArrived: ; f1c6c
	musicheader 3, 5, Sfx_TrainArrived_Ch5
	musicheader 1, 6, Sfx_TrainArrived_Ch6
	musicheader 1, 8, Sfx_TrainArrived_Ch8
; f1c75

Sfx_TrainArrived_Ch6: ; f1c75
	tone $0008
	sound __,  9, $0, 0
Sfx_TrainArrived_Ch5: ; f1c7c
	dutycycle $2
	sound __,  5, $5f, $0691
	sound __,  5, $6f, $0694
	sound __,  5, $78, $0697
	sound __,  5, $7f, $069a
	sound __,  5, $68, $06ae
	sound C_,  1, $6f, $06ab
	sound F_,  9, $65, $06a8
	endchannel
; f1c9b

Sfx_TrainArrived_Ch8: ; f1c9b
	noise __,  6, $af, $10
	noise __,  5, $9f, $20
	noise __,  5, $8f, $21
	noise __,  5, $7f, $22
	noise __,  5, $8f, $21
	noise __,  5, $9f, $20
	noise __,  5, $9f, $10
	noise F_,  9, $a3, $0
	endchannel
; f1cb4

Sfx_2Boops: ; f1cb4
	musicheader 1, 5, Sfx_2Boops_Ch5
; f1cb7

Sfx_2Boops_Ch5: ; f1cb7
	dutycycle $2
Sfx_2Boops_branch_f1cb9: ; f1cb9
	soundinput $79
	sound __,  2, $99, $0563
	sound __,  5, $f2, $04b5
	soundinput $43
	sound C_,  1, $f8, $05cd
	loopchannel 2, Sfx_2Boops_branch_f1cb9
	soundinput $8
	endchannel
; f1cd0

Sfx_UnknownCB: ; f1cd0
	musicheader 1, 8, Sfx_UnknownCB_Ch8
; f1cd3

Sfx_Menu_Ch8: ; f1cd3
	noise __,  2, $e2, $33
	noise __,  9, $e1, $22
	endchannel
; f1cda

Sfx_Pokeflute_Ch7: ; f1cda
	tempo 256
	volume $77
	togglesfx
	vibrato $10, $14
	notetype $c, $10
	octave 5
	note E_, 2
	note F_, 2
	note G_, 4
	note A_, 2
	note G_, 2
	octave 6
	note C_, 4
	note C_, 2
	note D_, 2
	note C_, 2
	octave 5
	note G_, 2
	note A_, 2
	note F_, 2
	note G_, 8
	note __, 12
	endchannel
; f1cf8

Sfx_PlacePuzzlePieceDown_Ch8: ; f1cf8
	noise __,  3, $f7, $24
	noise __,  3, $f7, $34
	noise __,  5, $f7, $44
	noise __,  9, $f4, $55
	noise __,  9, $f1, $44
	endchannel
; f1d08

Sfx_EnterDoor_Ch8: ; f1d08
	noise __, 10, $f1, $44
	noise __,  9, $d1, $43
	endchannel
; f1d0f

Sfx_SwitchPokemon_Ch5: ; f1d0f
	dutycycle $2
	sound __,  9, $e1, $0740
	endchannel
; f1d16

Sfx_SwitchPokemon_Ch6: ; f1d16
	dutycycle $2
	sound __,  3, $8, 0
	sound __,  9, $b1, $0741
	endchannel
; f1d21

Sfx_PokeballsPlacedOnTable_Ch5: ; f1d21
	dutycycle $2
	soundinput $3a
	sound __,  5, $f2, $0200
	soundinput $22
	sound __,  9, $e2, $0200
	soundinput $8
	endchannel
; f1d32

Sfx_BallWiggle_Ch5: ; f1d32
	dutycycle $2
	soundinput $3a
	sound __,  5, $f2, $0400
	soundinput $22
	sound __,  9, $e2, $0400
	soundinput $8
	endchannel
; f1d43

Sfx_Tally_Ch5: ; f1d43
	dutycycle $2
	sound __,  5, $f1, $0780
	endchannel
; f1d4a

Sfx_Tally_Ch6: ; f1d4a
	dutycycle $2
	sound __,  2, $8, 0
	sound __,  5, $a1, $0761
	endchannel
; f1d55

Sfx_Transaction_Ch5: ; f1d55
	dutycycle $2
	sound __,  5, $e1, $0700
	sound C_,  9, $f2, $07e0
	endchannel
; f1d60

Sfx_Transaction_Ch6: ; f1d60
	dutycycle $2
	sound __,  2, $8, 0
	sound __,  5, $91, $06c1
	sound C_,  9, $a2, $07a1
	endchannel
; f1d6f

Sfx_Bump_Ch5: ; f1d6f
	dutycycle $2
	soundinput $5a
	sound __, 16, $f1, $0300
	soundinput $8
	endchannel
; f1d7a

Sfx_ExitBuilding_Ch8: ; f1d7a
	noise __,  3, $f1, $54
	noise __, 13, $71, $23
	noise __,  3, $b1, $54
	noise __, 13, $61, $23
	noise __,  7, $41, $54
	endchannel
; f1d8a

Sfx_ReadText2_Ch5: ; f1d8a
Sfx_ReadText_Ch5: ; f1d8a
	dutycycle $2
	sound __,  1, $91, $07c0
	sound __,  1, $81, $07d0
	sound __,  1, $91, $07c0
	sound __, 13, $a1, $07d0
	endchannel
; f1d9d

Sfx_Potion_Ch5: ; f1d9d
	dutycycle $2
	soundinput $17
	sound __, 16, $f0, $04f0
	sound __, 16, $f2, $0650
	soundinput $8
	endchannel
; f1dac

Sfx_Poison_Ch5: ; f1dac
Sfx_Poison_branch_f1dac: ; f1dac
	dutycycle $0
	soundinput $14
	sound __,  5, $f2, $0600
	loopchannel 4, Sfx_Poison_branch_f1dac
	sound __, 16, $f3, $0600
	soundinput $8
	endchannel
; f1dbf

Sfx_FullHeal_Ch5: ; f1dbf
	dutycycle $2
	soundinput $14
	sound __,  5, $f2, $0600
	sound __,  5, $f2, $0600
	soundinput $17
	sound __, 16, $f2, $0600
	soundinput $8
	endchannel
; f1dd4

Sfx_GotSafariBalls_Ch5: ; f1dd4
	dutycycle $2
	soundinput $15
	sound __, 16, $f0, $04f0
	sound __, 16, $f2, $0650
	soundinput $8
	endchannel
; f1de3

Sfx_BootPc_Ch5: ; f1de3
	dutycycle $2
	sound __, 16, $f2, $07c0
	sound __, 16, $0, 0
	sound __,  4, $a1, $0780
	sound __,  4, $a1, $0700
	sound __,  4, $a1, $0740
	sound __,  4, $a1, $0700
	sound __,  4, $a1, $0780
	sound __,  4, $a1, $0700
	sound __,  4, $a1, $07c0
	sound __,  9, $a1, $0700
	endchannel
; f1e0e

Sfx_ShutDownPc_Ch5: ; f1e0e
	dutycycle $2
	sound __,  5, $f0, $0600
	sound __,  5, $f0, $0400
	sound __,  5, $f0, $0200
	sound __,  2, $0, 0
	endchannel
; f1e21

Sfx_ChoosePcOption_Ch5: ; f1e21
	dutycycle $2
	sound __,  7, $f0, $0700
	sound __,  5, $0, 0
	sound __,  7, $f0, $0700
	sound __,  2, $0, 0
	endchannel
; f1e34

Sfx_EscapeRope_Ch5: ; f1e34
	dutycycle $1
	soundinput $17
	sound __, 16, $d7, $0600
	sound __, 16, $b7, $0580
	sound __, 16, $87, $0500
	sound __, 16, $47, $0480
	sound __, 16, $17, $0400
	soundinput $8
	endchannel
; f1e4f

Sfx_PushButton_Ch5: ; f1e4f
	dutycycle $2
	sound __,  5, $0, 0
	sound __,  3, $f1, $0680
	sound __,  2, $0, 0
	sound __,  5, $f1, $0780
	sound __,  5, $0, 0
	endchannel
; f1e66

Sfx_SecondPartOfItemfinder_Ch5: ; f1e66
	dutycycle $2
	soundinput $2c
	sound __,  5, $f2, $0500
	soundinput $22
	sound __,  3, $f1, $0500
	soundinput $8
	sound __,  2, $0, 0
	endchannel
; f1e7b

Sfx_WarpTo_Ch5: ; f1e7b
	dutycycle $1
	soundinput $17
	sound __, 16, $d7, $0500
	sound __, 16, $b7, $0580
	sound __, 16, $87, $0600
	sound __, 16, $47, $0680
	sound __, 16, $17, $0700
	soundinput $8
	endchannel
; f1e96

Sfx_WarpFrom_Ch5: ; f1e96
	dutycycle $1
	soundinput $17
	sound __, 16, $d7, $0700
	sound __, 16, $b7, $0680
	sound __, 16, $87, $0600
	sound __, 16, $47, $0580
	sound __, 16, $17, $0500
	soundinput $8
	endchannel
; f1eb1

Sfx_ChangeDexMode_Ch5: ; f1eb1
	dutycycle $1
	soundinput $16
	sound __, 16, $d2, $0500
	soundinput $8
	endchannel
; f1ebc

Sfx_JumpOverLedge_Ch5: ; f1ebc
	dutycycle $2
	soundinput $95
	sound __, 16, $f2, $0400
	soundinput $8
	endchannel
; f1ec7

Sfx_GrassRustle_Ch8: ; f1ec7
	noise __,  3, $f1, $32
	noise __,  3, $0, $0
	noise __,  3, $f1, $22
	noise __,  2, $0, $0
	endchannel
; f1ed4

Sfx_Fly_Ch8: ; f1ed4
	noise __,  3, $f1, $12
	noise __,  3, $0, $0
	noise __,  3, $a1, $12
	noise __,  3, $0, $0
	noise __,  3, $d1, $12
	noise __,  3, $0, $0
	noise __,  3, $81, $12
	noise __,  3, $0, $0
	noise __,  3, $b1, $12
	noise __,  3, $0, $0
	noise __,  3, $61, $12
	noise __,  3, $0, $0
	noise __,  3, $91, $12
	noise __,  3, $0, $0
	noise __,  3, $41, $12
	noise __,  3, $0, $0
	endchannel
; f1f05

Sfx_Wrong_Ch5: ; f1f05
	dutycycle $3
	soundinput $5a
	sound __,  5, $f0, $0500
	soundinput $8
	sound __,  5, $0, 0
	sound __, 16, $f0, $0500
	sound __,  2, $0, 0
	endchannel
; f1f1c

Sfx_Wrong_Ch6: ; f1f1c
	dutycycle $3
	sound __,  5, $f0, $0401
	sound __,  5, $0, 0
	sound __, 16, $f0, $0401
	sound __,  2, $0, 0
	endchannel
; f1f2f

Sfx_Squeak_Ch5: ; f1f2f
	dutycycle $0
	soundinput $17
	sound __, 16, $d2, $0700
	soundinput $8
	endchannel
; f1f3a

Sfx_Strength_Ch8: ; f1f3a
	noise __,  5, $a2, $23
	noise __,  9, $f1, $34
	noise __, 16, $0, $0
	noise __,  3, $f7, $24
	noise __,  3, $f7, $34
	noise __,  5, $f7, $44
	noise __,  9, $f4, $55
	noise __,  9, $f1, $44
	endchannel
; f1f53

Sfx_Boat_Ch5: ; f1f53
	dutycycle $2
	sound __, 16, $f0, $0500
	sound __,  5, $0, 0
	sound __, 16, $f0, $0500
	sound __, 16, $f0, $0500
	sound __, 16, $f0, $0500
	sound __, 16, $f0, $0500
	sound __, 16, $f2, $0500
	endchannel
; f1f72

Sfx_Boat_Ch6: ; f1f72
	dutycycle $3
	sound __, 16, $f0, $0482
	sound __,  5, $0, 0
	sound __, 16, $f0, $0482
	sound __, 16, $f0, $0482
	sound __, 16, $f0, $0482
	sound __, 16, $f0, $0482
	sound __, 16, $f2, $0482
	endchannel
; f1f91

Sfx_WallOpen_Ch5: ; f1f91
	dutycycle $1
	soundinput $3a
	sound __,  5, $f2, $0500
	soundinput $22
	sound __,  5, $e2, $0500
	soundinput $3a
	sound __,  5, $f2, $0700
	soundinput $22
	sound __, 16, $e2, $0700
	soundinput $8
	endchannel
; f1fae

Sfx_ElevatorEnd_Ch5: ; f1fae
	dutycycle $2
	sound __, 16, $f3, $0730
	sound __,  9, $65, $0730
	sound __, 16, $f4, $0700
	sound __, 16, $74, $0700
	sound __, 16, $44, $0700
	sound __, 16, $24, $0700
	endchannel
; f1fc9

Sfx_ThrowBall_Ch5: ; f1fc9
	dutycycle $2
	soundinput $2f
	sound __, 16, $f2, $0780
	endchannel
; f1fd2

Sfx_ThrowBall_Ch6: ; f1fd2
	dutycycle $2
	sound __, 16, $c2, $0782
	endchannel
; f1fd9

Sfx_Shine_Ch5: ; f1fd9
	dutycycle $0
	sound __,  1, $d2, $0700
	sound __,  1, $d2, $0740
	sound __,  1, $d2, $0780
	sound __,  1, $d2, $07c0
	sound __, 11, $e1, $07e0
	sound __,  2, $0, 0
	endchannel
; f1ff4

Sfx_BallPoof_Ch5: ; f1ff4
	dutycycle $2
	soundinput $16
	sound __, 16, $f2, $0400
	soundinput $8
	endchannel
; f1fff

Sfx_BallPoof_Ch8: ; f1fff
	noise __, 16, $a2, $22
	endchannel
; f2003

Sfx_Unknown3A_Ch5: ; f2003
	sound __, 16, $d1, $0200
	soundinput $8
	endchannel
; f200a

Sfx_Unknown3A_Ch8: ; f200a
	noise __,  5, $f5, $33
	noise __,  9, $f4, $22
	noise __, 16, $f2, $21
	endchannel
; f2014

Sfx_Run_Ch8: ; f2014
	noise __,  3, $61, $23
	noise __,  3, $a1, $33
	noise __,  3, $c1, $33
	noise __,  3, $51, $11
	noise __,  3, $f1, $33
	noise __,  3, $41, $11
	noise __,  3, $c1, $33
	noise __,  3, $31, $11
	noise __,  3, $81, $33
	noise __,  3, $31, $11
	noise __,  9, $41, $33
	endchannel
; f2036

Sfx_SlotMachineStart_Ch5: ; f2036
	dutycycle $2
	soundinput $44
	sound __, 16, $f0, $04f0
	soundinput $17
	sound __, 16, $f2, $0650
	soundinput $8
	endchannel
; f2047

Sfx_SlotMachineStart_Ch6: ; f2047
	dutycycle $2
	sound __, 16, $92, $0600
	sound __, 16, $92, $0782
	endchannel
; f2052

Sfx_Call_Ch5: ; f2052
	soundinput $67
	sound __,  5, $f7, $07a0
	sound __,  5, $f7, $07a0
	sound __,  5, $f7, $07a0
	sound __,  5, $f7, $07a0
	sound __,  5, $f7, $07a0
	soundinput $8
	sound __,  5, $0, 0
	endchannel
; f206f

Sfx_Peck_Ch8: ; f206f
	noise __,  3, $a1, $12
	endchannel
; f2073

Sfx_Kinesis_Ch5: ; f2073
	dutycycle $1
	soundinput $af
	sound __, 16, $f2, $0780
	soundinput $8
	endchannel
; f207e

Sfx_Lick_Ch5: ; f207e
	dutycycle $1
	soundinput $97
	sound __, 16, $f2, $0500
	soundinput $8
	endchannel
; f2089

Sfx_Pound_Ch8: ; f2089
	noise __,  3, $a1, $22
	endchannel
; f208d

Sfx_MovePuzzlePiece_Ch8: ; f208d
	noise __,  9, $f1, $54
	endchannel
; f2091

Sfx_CometPunch_Ch8: ; f2091
	noise __, 16, $8f, $11
	noise __,  5, $ff, $12
	noise __, 11, $f1, $55
	endchannel
; f209b

Sfx_MegaPunch_Ch8: ; f209b
	noise __, 16, $8f, $34
	noise __,  9, $f2, $35
	noise __, 11, $f1, $55
	endchannel
; f20a5

Sfx_Scratch_Ch8: ; f20a5
	noise __, 16, $9f, $23
	noise __,  9, $f1, $21
	endchannel
; f20ac

Sfx_Vicegrip_Ch8: ; f20ac
	noise __,  3, $e1, $4b
	noise __, 11, $f1, $44
	noise __,  3, $e1, $3a
	noise __,  7, $f1, $34
	endchannel
; f20b9

Sfx_RazorWind_Ch8: ; f20b9
	noise __,  3, $f4, $44
	noise __,  3, $f4, $14
	noise __, 16, $f1, $32
	endchannel
; f20c3

Sfx_Cut_Ch8: ; f20c3
	noise __,  5, $8f, $55
	noise __,  3, $f4, $44
	noise __,  9, $f4, $22
	noise __, 16, $f2, $21
	endchannel
; f20d0

Sfx_WingAttack_Ch8: ; f20d0
Sfx_WingAttack_branch_f20d0: ; f20d0
	noise __,  9, $4f, $23
	noise __,  5, $c4, $22
	noise __,  7, $f2, $23
	loopchannel 4, Sfx_WingAttack_branch_f20d0
	endchannel
; f20de

Sfx_Whirlwind_Ch8: ; f20de
	noise __,  9, $4f, $33
	noise __,  5, $c4, $22
	noise __,  7, $f2, $23
	noise __, 16, $f2, $22
	endchannel
; f20eb

Sfx_Bind_Ch8: ; f20eb
	noise __,  9, $ff, $32
	noise __,  9, $f4, $43
	noise __,  9, $f2, $54
	noise __,  9, $f1, $65
	endchannel
; f20f8

Sfx_VineWhip_Ch8: ; f20f8
	noise __,  2, $c2, $33
	noise __,  3, $f2, $21
	noise __,  2, $e2, $33
	noise __,  2, $c2, $32
	noise __,  2, $92, $12
	noise __,  2, $b2, $31
	noise __, 13, $91, $10
	noise __,  9, $f2, $41
	endchannel
; f2111

Sfx_DoubleKick_Ch8: ; f2111
	noise __,  2, $94, $23
	noise __,  2, $b4, $22
	noise __,  9, $f1, $44
	endchannel
; f211b

Sfx_MegaKick_Ch8: ; f211b
	noise __,  3, $94, $33
	noise __,  5, $b4, $22
	noise __,  5, $f1, $44
	noise __,  9, $f1, $55
	endchannel
; f2128

Sfx_Headbutt_Ch8: ; f2128
	noise __,  5, $ff, $55
	noise __,  9, $f1, $65
	endchannel
; f212f

Sfx_HornAttack_Ch8: ; f212f
	noise __,  3, $84, $43
	noise __,  3, $c4, $22
	noise __,  9, $f2, $34
	endchannel
; f2139

Sfx_Tackle_Ch8: ; f2139
	noise __,  5, $f1, $34
	noise __, 16, $f2, $64
	endchannel
; f2140

Sfx_PoisonSting_Ch8: ; f2140
	noise __,  3, $f1, $22
	noise __, 16, $f2, $12
	endchannel
; f2147

Sfx_Powder_Ch8: ; f2147
	noise __,  3, $c2, $1
	noise __, 16, $f4, $1
	noise __, 16, $f2, $1
	endchannel
; f2151

Sfx_Doubleslap_Ch8: ; f2151
	noise __,  9, $f1, $32
	noise __,  9, $f1, $33
	endchannel
; f2158

Sfx_Bite_Ch5: ; f2158
	dutycycle $0
	soundinput $3a
	sound __,  5, $f2, $0200
	soundinput $22
	sound __,  9, $e2, $0200
	soundinput $8
	endchannel
; f2169

Sfx_Bite_Ch8: ; f2169
	noise __,  1, $d1, $42
	noise __,  5, $a1, $32
	noise __,  1, $d1, $22
	noise __,  7, $a1, $32
	endchannel
; f2176

Sfx_JumpKick_Ch8: ; f2176
	noise __,  4, $92, $31
	noise __,  4, $b2, $32
	noise __,  4, $c2, $33
	noise __,  9, $f1, $54
	endchannel
; f2183

Sfx_Stomp_Ch8: ; f2183
	noise __, 13, $f1, $54
	noise __,  9, $f1, $64
	endchannel
; f218a

Sfx_TailWhip_Ch8: ; f218a
	noise __,  3, $f1, $33
	noise __,  3, $c1, $32
	noise __,  3, $a1, $31
	noise __, 16, $82, $32
	noise __,  9, $f1, $34
	endchannel
; f219a

Sfx_KarateChop_Ch8: ; f219a
	noise __,  3, $d2, $32
	noise __, 16, $f2, $43
	endchannel
; f21a1

Sfx_Submission_Ch8: ; f21a1
	noise __,  3, $f2, $43
	noise __,  5, $b5, $32
	noise __, 10, $86, $31
	noise __,  8, $64, $0
	noise __, 16, $f2, $55
	endchannel
; f21b1

Sfx_WaterGun_Ch5: ; f21b1
	dutycycle $1
	soundinput $97
	sound __, 16, $f2, $0700
	soundinput $8
	endchannel
; f21bc

Sfx_WaterGun_Ch8: ; f21bc
	noise __, 16, $3f, $22
	noise __, 16, $f2, $21
	endchannel
; f21c3

Sfx_SwordsDance_Ch8: ; f21c3
	noise __, 16, $4f, $41
	noise __,  9, $8f, $41
	noise __,  9, $cf, $41
	noise __,  9, $f2, $42
	noise __, 16, $f2, $41
	endchannel
; f21d3

Sfx_Thunder_Ch8: ; f21d3
	noise __, 11, $ff, $50
	noise __, 16, $ff, $51
	noise __,  9, $f2, $51
	noise __,  7, $ff, $52
	noise __,  7, $ff, $53
	noise __,  9, $ff, $54
	noise __, 16, $f2, $54
	endchannel
; f21e9

Sfx_Supersonic_Ch5: ; f21e9
	dutycycle $2
	sound __, 16, $3f, $07c0
Sfx_Supersonic_branch_f21ef: ; f21ef
	sound __, 16, $df, $07c0
	loopchannel 4, Sfx_Supersonic_branch_f21ef
	sound __, 16, $d1, $07c0
	endchannel
; f21fc

Sfx_Supersonic_Ch6: ; f21fc
	sound_duty 3, 0, 3, 2
	sound __, 16, $2f, $07c8
Sfx_Supersonic_branch_f2202: ; f2202
	sound __, 16, $cf, $07c7
	loopchannel 4, Sfx_Supersonic_branch_f2202
	sound __, 16, $c1, $07c8
	endchannel
; f220f

Sfx_Supersonic_Ch8: ; f220f
Sfx_Supersonic_branch_f220f: ; f220f
	noise __,  4, $97, $12
	noise __,  4, $a1, $11
	loopchannel 10, Sfx_Supersonic_branch_f220f
	endchannel
; f221a

Sfx_Leer_Ch5: ; f221a
Sfx_Leer_branch_f221a: ; f221a
	dutycycle $0
	sound __,  1, $f1, $07c0
	sound __,  1, $f1, $0700
	loopchannel 12, Sfx_Leer_branch_f221a
	endchannel
; f2229

Sfx_Leer_Ch6: ; f2229
Sfx_Leer_branch_f2229: ; f2229
	sound_duty 3, 0, 3, 2
	sound __,  1, $e1, $07c1
	sound __,  1, $e1, $0701
	loopchannel 12, Sfx_Leer_branch_f2229
	endchannel
; f2238

Sfx_Leer_Ch8: ; f2238
Sfx_Leer_branch_f2238: ; f2238
	noise __,  2, $d1, $49
	noise __,  2, $d1, $29
	loopchannel 6, Sfx_Leer_branch_f2238
	endchannel
; f2243

Sfx_Ember_Ch5: ; f2243
Sfx_Ember_branch_f2243: ; f2243
	sound_duty 1, 2, 0, 3
	sound __, 12, $f3, $0120
	sound __, 10, $d3, $0150
	loopchannel 5, Sfx_Ember_branch_f2243
	sound __,  9, $e3, $0130
	sound __, 16, $c2, $0110
	endchannel
; f225a

Sfx_Ember_Ch8: ; f225a
Sfx_Ember_branch_f225a: ; f225a
	noise __, 11, $f3, $35
	noise __, 15, $f6, $45
	loopchannel 4, Sfx_Ember_branch_f225a
	noise __, 13, $f4, $bc
	noise __, 13, $f5, $9c
	noise __, 16, $f4, $ac
	endchannel
; f226e

Sfx_Bubblebeam_Ch5: ; f226e
Sfx_Bubblebeam_branch_f226e: ; f226e
	sound_duty 1, 2, 3, 0
	sound __,  5, $f4, $0600
	sound __,  4, $c4, $0500
	sound __,  6, $b5, $0600
	sound __, 14, $e2, $06c0
	loopchannel 3, Sfx_Bubblebeam_branch_f226e
	sound __,  9, $d1, $0600
	endchannel
; f2289

Sfx_Bubblebeam_Ch6: ; f2289
Sfx_Bubblebeam_branch_f2289: ; f2289
	sound_duty 1, 3, 0, 2
	sound __,  6, $e4, $05e0
	sound __,  5, $b4, $04e0
	sound __,  7, $a5, $05e8
	sound __, 15, $d1, $06a0
	loopchannel 3, Sfx_Bubblebeam_branch_f2289
	endchannel
; f22a0

Sfx_Bubblebeam_Ch8: ; f22a0
Sfx_Bubblebeam_branch_f22a0: ; f22a0
	noise __,  6, $c3, $33
	noise __,  4, $92, $43
	noise __, 11, $b5, $33
	noise __, 16, $c3, $32
	loopchannel 2, Sfx_Bubblebeam_branch_f22a0
	endchannel
; f22b1

Sfx_HydroPump_Ch5: ; f22b1
Sfx_HydroPump_branch_f22b1: ; f22b1
	sound_duty 2, 0, 1, 3
	sound __,  4, $81, $0300
	sound __,  4, $c1, $0400
	sound __,  4, $f1, $0500
	sound __,  4, $b1, $0400
	sound __,  4, $71, $0300
	loopchannel 5, Sfx_HydroPump_branch_f22b1
	sound __,  9, $81, $0400
	endchannel
; f22d0

Sfx_HydroPump_Ch8: ; f22d0
Sfx_HydroPump_branch_f22d0: ; f22d0
	noise __,  4, $62, $22
	noise __,  4, $a2, $32
	noise __,  4, $d2, $33
	noise __,  4, $92, $23
	noise __,  4, $52, $12
	loopchannel 5, Sfx_HydroPump_branch_f22d0
	noise __,  9, $81, $12
	endchannel
; f22e7

Sfx_Surf_Ch5: ; f22e7
Sfx_Surf_branch_f22e7: ; f22e7
	sound_duty 1, 2, 3, 0
	sound __, 16, $f4, $0500
	sound __, 16, $c4, $0400
	sound __, 16, $e2, $05c0
	loopchannel 3, Sfx_Surf_branch_f22e7
	endchannel
; f22fa

Sfx_Surf_Ch6: ; f22fa
Sfx_Surf_branch_f22fa: ; f22fa
	sound_duty 1, 3, 0, 2
	sound __,  8, $e4, $0430
	sound __, 16, $b4, $0330
	sound __, 16, $a2, $0438
	loopchannel 4, Sfx_Surf_branch_f22fa
	endchannel
; f230d

Sfx_Surf_Ch8: ; f230d
Sfx_Surf_branch_f230d: ; f230d
	noise __, 10, $f4, $44
	noise __, 10, $f2, $43
	noise __, 16, $f4, $42
	noise __, 16, $f4, $41
	loopchannel 3, Sfx_Surf_branch_f230d
	endchannel
; f231e

Sfx_Psybeam_Ch5: ; f231e
Sfx_Psybeam_branch_f231e: ; f231e
	sound_duty 1, 0, 2, 2
	sound __, 11, $f1, $0640
	sound __, 11, $f3, $0680
	sound __, 11, $f2, $0620
	loopchannel 4, Sfx_Psybeam_branch_f231e
	sound __, 11, $f1, $0640
	endchannel
; f2335

Sfx_Psybeam_Ch6: ; f2335
Sfx_Psybeam_branch_f2335: ; f2335
	sound_duty 3, 0, 3, 2
	sound __, 11, $f3, $0571
	sound __,  8, $e3, $0531
	sound __, 11, $f1, $0551
	loopchannel 4, Sfx_Psybeam_branch_f2335
	sound __, 11, $f1, $0571
	endchannel
; f234c

Sfx_Psybeam_Ch8: ; f234c
Sfx_Psybeam_branch_f234c: ; f234c
	noise __,  3, $d1, $4a
	noise __,  3, $d2, $2a
	loopchannel 21, Sfx_Psybeam_branch_f234c
	endchannel
; f2357

Sfx_Charge_Ch5: ; f2357
Sfx_Charge_branch_f2357: ; f2357
	dutycycle $0
	sound __,  3, $f1, $0200
	sound __,  4, $f1, $0700
	sound __,  5, $f1, $0500
	sound __,  6, $f1, $07f0
	loopchannel 8, Sfx_Charge_branch_f2357
	endchannel
; f236e

Sfx_Charge_Ch6: ; f236e
Sfx_Charge_branch_f236e: ; f236e
	sound_duty 3, 0, 3, 2
	sound __,  3, $e1, $0302
	sound __,  4, $e1, $07f2
	sound __,  5, $e1, $0602
	sound __,  6, $e1, $0702
	loopchannel 8, Sfx_Charge_branch_f236e
	endchannel
; f2385

Sfx_Charge_Ch8: ; f2385
Sfx_Charge_branch_f2385: ; f2385
	noise __,  3, $d3, $10
	noise __,  4, $d3, $11
	noise __,  3, $d2, $10
	noise __,  6, $d2, $12
	loopchannel 9, Sfx_Charge_branch_f2385
	endchannel
; f2396

Sfx_Thundershock_Ch5: ; f2396
Sfx_Thundershock_branch_f2396: ; f2396
	sound_duty 3, 2, 2, 0
	sound __,  4, $f1, $07f0
	sound __,  5, $f2, $0200
	loopchannel 8, Sfx_Thundershock_branch_f2396
	endchannel
; f23a5

Sfx_Thundershock_Ch6: ; f23a5
Sfx_Thundershock_branch_f23a5: ; f23a5
	sound_duty 3, 0, 3, 2
	sound __,  5, $e2, $0202
	sound __,  5, $e1, $07e2
	loopchannel 9, Sfx_Thundershock_branch_f23a5
	endchannel
; f23b4

Sfx_Thundershock_Ch8: ; f23b4
Sfx_Thundershock_branch_f23b4: ; f23b4
	noise __,  5, $ff, $43
	noise __,  5, $f2, $44
	loopchannel 9, Sfx_Thundershock_branch_f23b4
	endchannel
; f23bf

Sfx_Psychic_Ch5: ; f23bf
	dutycycle $2
	soundinput $f7
	sound __,  9, $c4, $07bd
	sound __,  9, $c4, $07be
	sound __,  9, $c4, $07bf
	sound __,  9, $c4, $07c0
	sound __, 16, $c4, $07c1
	sound __, 16, $f2, $07c0
	soundinput $8
	endchannel
; f23de

Sfx_Psychic_Ch6: ; f23de
	dutycycle $2
	sound __,  9, $c4, $0770
	sound __,  9, $c4, $0761
	sound __,  9, $c4, $0762
	sound __,  9, $c4, $0763
	sound __, 16, $c4, $0764
	sound __, 16, $f2, $0764
	endchannel
; f23f9

Sfx_Psychic_Ch8: ; f23f9
	noise __, 16, $3f, $14
	noise __, 16, $cf, $13
	noise __, 16, $cf, $12
	noise __, 16, $cf, $11
	noise __, 16, $cf, $10
	noise __, 16, $c2, $10
	endchannel
; f240c

Sfx_Screech_Ch5: ; f240c
	dutycycle $2
	sound __, 16, $ff, $07e0
	sound __, 16, $ff, $07e0
	sound __, 16, $ff, $07e0
	sound __, 16, $ff, $07e0
	sound __, 16, $f2, $07e0
	endchannel
; f2423

Sfx_Screech_Ch6: ; f2423
	dutycycle $3
	sound __, 16, $ff, $07e2
	sound __, 16, $ff, $07e1
	sound __, 16, $ff, $07e2
	sound __, 16, $ff, $07e1
	sound __, 16, $f2, $07e2
	endchannel
; f243a

Sfx_BoneClub_Ch5: ; f243a
	dutycycle $2
	soundinput $af
	sound __,  9, $f1, $0700
	soundinput $8
	endchannel
; f2445

Sfx_BoneClub_Ch6: ; f2445
	dutycycle $3
	sound __,  9, $f1, $0701
	endchannel
; f244c

Sfx_Sharpen_Ch5: ; f244c
	dutycycle $2
	sound __,  7, $f1, $0500
	sound __,  7, $f1, $0580
	sound __,  7, $f1, $0600
	sound __,  7, $f1, $0680
	sound __,  9, $f1, $0700
	endchannel
; f2463

Sfx_Sharpen_Ch6: ; f2463
	dutycycle $3
	sound __,  7, $e1, $0510
	sound __,  7, $e1, $0590
	sound __,  7, $e1, $0610
	sound __,  7, $e1, $0690
	sound __,  9, $e1, $0710
	endchannel
; f247a

Sfx_EggBomb_Ch5: ; f247a
	sound_duty 1, 3, 2, 3
	sound __,  9, $ff, $03f8
	sound __, 16, $ff, $0400
	sound __, 16, $f3, $0400
	endchannel
; f2489

Sfx_EggBomb_Ch6: ; f2489
	sound_duty 0, 1, 3, 2
	sound __,  9, $ef, $03c0
	sound __, 16, $ef, $03c0
	sound __, 16, $e3, $03c0
	endchannel
; f2498

Sfx_EggBomb_Ch8: ; f2498
	noise __,  5, $ff, $51
	noise __,  9, $ff, $54
	noise __, 16, $ff, $55
	noise __, 16, $f3, $56
	endchannel
; f24a5

Sfx_Sing_Ch5: ; f24a5
	togglesfx
	vibrato $a, $24
	dutycycle $2
	notetype $a, $87
	octave 5
	note G_, 8
	octave 6
	note F_, 4
	note D#, 4
	octave 5
	note G_, 8
	endchannel
; f24b6

Sfx_Sing_Ch6: ; f24b6
	togglesfx
	vibrato $a, $23
	dutycycle $2
	notetype $b, $67
	octave 5
	note G_, 8
	notetype $a, $67
	octave 6
	note F_, 4
	note D#, 4
	octave 5
	note G_, 8
	endchannel
; f24ca

Sfx_HyperBeam_Ch5: ; f24ca
	dutycycle $0
	sound __,  3, $f1, $0780
	sound __,  3, $f1, $0700
	sound __,  3, $f1, $0790
	sound __,  3, $f1, $0700
	sound __,  3, $f1, $07a0
	sound __,  3, $f1, $0700
	sound __,  3, $f1, $07b0
	sound __,  3, $f1, $0700
	sound __,  3, $f1, $07c0
	sound __,  3, $f1, $0700
	sound __,  3, $f1, $07d0
Sfx_HyperBeam_branch_f24f8: ; f24f8
	sound __,  3, $f1, $0700
	sound __,  3, $f1, $07e0
	loopchannel 12, Sfx_HyperBeam_branch_f24f8
	sound __, 16, $f1, $0700
	endchannel
; f2509

Sfx_HyperBeam_Ch6: ; f2509
	sound_duty 3, 0, 3, 2
	sound __,  3, $f1, $0781
	sound __,  3, $f1, $0701
	sound __,  3, $f1, $0791
	sound __,  3, $f1, $0701
	sound __,  3, $f1, $07a1
	sound __,  3, $f1, $0701
	sound __,  3, $f1, $07b1
	sound __,  3, $f1, $0701
	sound __,  3, $f1, $07c1
	sound __,  3, $f1, $0701
	sound __,  3, $f1, $07d1
Sfx_HyperBeam_branch_f2537: ; f2537
	sound __,  3, $f1, $0701
	sound __,  3, $f1, $07e1
	loopchannel 12, Sfx_HyperBeam_branch_f2537
	sound __, 16, $f1, $0701
	endchannel
; f2548

Sfx_HyperBeam_Ch8: ; f2548
Sfx_HyperBeam_branch_f2548: ; f2548
	noise __,  2, $d1, $49
	noise __,  2, $d1, $29
	loopchannel 26, Sfx_HyperBeam_branch_f2548
	endchannel
; f2553

Sfx_Unknown60_Ch8: ; f2553
	noise __,  7, $20, $10
	noise __,  7, $2f, $40
	noise __,  7, $4f, $41
	noise __,  7, $8f, $41
	noise __,  7, $cf, $42
	noise __,  9, $d7, $42
	noise __, 16, $e7, $43
	noise __, 16, $f2, $43
	endchannel
; f256c

Sfx_UnknownCB_Ch8: ; f256c
	noise __,  2, $10, $10
	noise __,  3, $20, $10
	noise __,  3, $30, $20
	noise __,  3, $40, $20
	noise __,  3, $50, $21
	noise __,  3, $60, $22
	noise __,  5, $70, $22
	noise __,  9, $80, $22
	noise __, 16, $94, $22
	endchannel
; f2588

Sfx_Unknown61_Ch8: ; f2588
	noise __,  5, $d1, $41
	endchannel
; f258c

Sfx_SwitchPockets_Ch8: ; f258c
	noise __,  5, $c1, $42
	endchannel
; f2590

Sfx_Unknown63_Ch8: ; f2590
	noise __,  3, $6f, $21
	noise __,  3, $af, $31
	noise __, 16, $f2, $41
	endchannel
; f259a

Sfx_Burn_Ch8: ; f259a
	noise __,  3, $d2, $32
	noise __, 16, $f2, $43
	endchannel
; f25a1

Sfx_TitleScreenEntrance_Ch8: ; f25a1
	noise __,  3, $70, $22
	noise __,  3, $80, $23
	noise __,  3, $90, $24
	noise __,  3, $a0, $25
	noise __,  3, $b0, $26
	noise __, 16, $c2, $26
	endchannel
; f25b4

Sfx_Unknown66_Ch5: ; f25b4
	dutycycle $2
	sound __,  2, $f2, $06a0
	sound __,  2, $f2, $06e0
	sound __,  9, $f1, $0700
	endchannel
; f25c3

Sfx_GetCoinFromSlots_Ch5: ; f25c3
	dutycycle $2
	sound __,  3, $f1, $0700
	sound __,  9, $81, $07e0
	endchannel
; f25ce

Sfx_PayDay_Ch5: ; f25ce
	dutycycle $3
	sound __,  6, $e1, $0700
	sound __,  3, $e1, $0780
	sound __, 16, $f1, $07c0
	endchannel
; f25dd

Sfx_PayDay_Ch6: ; f25dd
	dutycycle $2
	sound __,  5, $c1, $06c1
	sound __,  3, $c1, $0741
	sound __, 16, $d1, $0781
	endchannel
; f25ec

Sfx_Metronome_Ch5: ; f25ec
	dutycycle $2
	soundinput $5f
	sound __,  5, $40, $07e0
	sound __,  5, $60, $07e0
	sound __,  5, $80, $07e0
	sound __,  9, $a0, $07e0
	sound __,  9, $a0, $07e0
	sound __,  9, $80, $07e0
	sound __,  9, $60, $07e0
	sound __,  9, $30, $07e0
	sound __, 16, $12, $07e0
	soundinput $8
	endchannel
; f2617

Sfx_Unknown5F_Ch5: ; f2617
Sfx_Unknown5F_branch_f2617: ; f2617
	sound __,  3, $f7, $0601
	sound __,  3, $f7, $0701
	loopchannel 8, Sfx_Unknown5F_branch_f2617
	endchannel
; f2624

Sfx_Unknown5F_Ch6: ; f2624
	sound __,  2, $f7, $ffff
	sound __,  3, $f7, $0602
	sound __,  3, $f7, $0702
	loopchannel 8, Sfx_Unknown5F_branch_f2617
	endchannel
; f2635

Sfx_Fanfare2_Ch5: ; f2635
	togglesfx
	sfxpriorityon
	tempo 256
	volume $77
	tone $0001
	dutycycle $3
	notetype $6, $b5
	octave 3
	note G#, 4
	notetype $4, $b2
	note F_, 2
	note G#, 2
	note A_, 2
	note A#, 2
	note F#, 2
	note A#, 2
	octave 4
	note C_, 4
	note C_, 2
	notetype $4, $b6
	note C#, 12
	sfxpriorityoff
	endchannel
; f2658

Sfx_Fanfare2_Ch6: ; f2658
	togglesfx
	dutycycle $2
	notetype $6, $c5
	octave 4
	note C#, 6
	notetype $4, $c1
	note C#, 1
	note C#, 1
	note C#, 1
	notetype $4, $c2
	note D#, 2
	note C#, 2
	note D#, 2
	note E_, 4
	note E_, 2
	notetype $4, $c6
	note F_, 12
	endchannel
; f2673

Sfx_Fanfare2_Ch8: ; f2673
	togglesfx
	notetype $6
	note C_, 1
	octave 5
	note C#, 2
	note __, 2
	note C#, 2
	note __, 2
	notetype $4
	note C_, 1
	note C#, 2
	note __, 2
	note C#, 2
	note D#, 2
	note __, 2
	note F_, 2
	note G#, 6
	endchannel
; f2687

Sfx_Fanfare_Ch5: ; f2687
	togglesfx
	sfxpriorityon
	tempo 256
	volume $77
	dutycycle $3
	tone $0001
	notetype $6, $b3
	octave 3
	note F_, 4
	note C#, 4
	note F#, 4
	note D#, 4
	note G#, 4
	note F_, 4
	note A#, 4
	note F#, 4
	notetype $4, $b3
	note A#, 4
	note B_, 4
	octave 4
	note C_, 4
	note C#, 4
	note D#, 4
	note C_, 4
	notetype $4, $b6
	note C#, 12
	sfxpriorityoff
	endchannel
; f26af

Sfx_Fanfare_Ch6: ; f26af
	togglesfx
	dutycycle $2
	notetype $6, $c4
	octave 4
	note C#, 4
	notetype $4, $c4
	note C#, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 2
	note D#, 6
	note D#, 2
	octave 3
	note B_, 2
	octave 4
	note D#, 2
	note F_, 6
	note F_, 2
	note C#, 2
	note F_, 2
	note F#, 6
	note F#, 2
	note D#, 2
	note F#, 2
	note C#, 4
	note D#, 4
	note E_, 4
	note F_, 4
	note F#, 4
	note G#, 4
	notetype $4, $c6
	note F#, 12
	endchannel
; f26d8

Sfx_Fanfare_Ch8: ; f26d8
	togglesfx
	notetype $6
	note C_, 1
	octave 4
	note A#, 4
	note __, 4
	note B_, 4
	note __, 4
	octave 5
	note C#, 4
	note __, 4
	note D#, 4
	note __, 4
	notetype $4
	note C_, 1
	note F_, 4
	note D#, 4
	note C#, 4
	note A#, 4
	note G#, 4
	note F_, 4
	note F#, 6
	endchannel
; f26f1

Sfx_HangUp_Ch5: ; f26f1
	dutycycle $2
	sound __,  5, $b8, $077b
	sound __,  3, $21, $077b
	sound C_,  1, $0, 0
Sfx_HangUp_branch_f26ff: ; f26ff
Sfx_NoSignal_Ch5: ; f26ff
Sfx_NoSignal_branch_f26ff: ; f26ff
	dutycycle $2
	sound C_,  5, $e8, $070b
	sound C_, 13, $0, 0
	loopchannel 3, Sfx_HangUp_branch_f26ff
	endchannel
; f270e

Sfx_Sandstorm_Ch8: ; f270e
Sfx_Sandstorm_branch_f270e: ; f270e
Sfx_Unknown5F_Ch8: ; f270e
Sfx_Unknown5F_branch_f270e: ; f270e
	noise __,  2, $f8, $41
	noise __,  3, $9c, $24
	noise __,  1, $0, $0
	noise __,  4, $59, $16
	noise __,  3, $0, $0
	loopchannel 3, Sfx_Sandstorm_branch_f270e
	endchannel
; f2722

Sfx_Elevator_Ch5: ; f2722
	dutycycle $2
	soundinput $5a
Sfx_Elevator_branch_f2726: ; f2726
	sound __,  3, $f1, $0300
	loopchannel 48, Sfx_Elevator_branch_f2726
	soundinput $8
	dutycycle $2
	sound __, 16, $f3, $0730
	sound __,  9, $65, $0730
	sound __, 16, $f4, $0700
	sound __, 16, $74, $0700
	sound __, 16, $44, $0700
	sound __, 16, $24, $0700
	endchannel
; f274b

Sfx_Elevator_Ch6: ; f274b
Sfx_Elevator_Ch7: ; f274b
	sound F_,  1, $0, 0
	sound E_,  4, $0, 0
	endchannel
; f2754

Sfx_Elevator_Ch8: ; f2754
	noise F_,  1, $0, $0
	noise E_,  4, $0, $0
	endchannel
; f275b

Sfx_StopSlot: ; f275b
	musicheader 1, 5, Sfx_StopSlot_Ch5
; f275e

Sfx_StopSlot_Ch5: ; f275e
	dutycycle $2
	sound __,  2, $f8, $0760
	sound __,  5, $82, $0760
	endchannel
; f2769

Sfx_GlassTing: ; f2769
	musicheader 1, 5, Sfx_GlassTing_Ch5
; f276c

Sfx_GlassTing_Ch5: ; f276c
	dutycycle $2
	sound C#,  1, $d1, $07dc
	endchannel
; f2773

Sfx_GlassTing2: ; f2773
	musicheader 2, 5, Sfx_GlassTing2_Ch5
	musicheader 1, 6, Sfx_GlassTing2_Ch6
; f2779

Sfx_GlassTing2_Ch5: ; f2779
	dutycycle $2
	sound C_,  1, $f1, $07dc
	endchannel
; f2780

Sfx_GlassTing2_Ch6: ; f2780
	dutycycle $2
	sound C_,  1, $d1, $07dd
	endchannel
; f2787
