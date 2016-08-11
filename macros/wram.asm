
flag_array: MACRO
	ds ((\1) + 7) / 8
ENDM

box_struct: MACRO
\1Species::        db
\1Item::           db
\1Moves::          ds NUM_MOVES
\1ID::             dw
\1Exp::            ds 3
\1StatExp::
\1HPExp::          dw
\1AtkExp::         dw
\1DefExp::         dw
\1SpdExp::         dw
\1SpcExp::         dw
\1DVs::            ds 2
\1PP::             ds NUM_MOVES
\1Happiness::      db
\1PokerusStatus::  db
\1CaughtData::
\1CaughtTime::
\1CaughtLevel::    db
\1CaughtGender::
\1CaughtLocation:: db
\1Level::          db
\1End::
ENDM

party_struct: MACRO
	box_struct \1
\1Status::         db
\1Unused::         db
\1HP::             dw
\1MaxHP::          dw
\1Stats:: ; big endian
\1Attack::         dw
\1Defense::        dw
\1Speed::          dw
\1SpclAtk::        dw
\1SpclDef::        dw
\1StatsEnd::
ENDM

red_box_struct: MACRO
\1Species::    db
\1HP::         dw
\1BoxLevel::   db
\1Status::     db
\1Type::
\1Type1::      db
\1Type2::      db
\1CatchRate::  db
\1Moves::      ds NUM_MOVES
\1OTID::       dw
\1Exp::        ds 3
\1HPExp::      dw
\1AttackExp::  dw
\1DefenseExp:: dw
\1SpeedExp::   dw
\1SpecialExp:: dw
\1DVs::        ds 2
\1PP::         ds NUM_MOVES
ENDM

red_party_struct: MACRO
	red_box_struct \1
\1Level::      db
\1Stats::
\1MaxHP::      dw
\1Attack::     dw
\1Defense::    dw
\1Speed::      dw
\1Special::    dw
ENDM


battle_struct: MACRO
\1Species::   db
\1Item::      db
\1Moves::     ds NUM_MOVES
\1MovesEnd::
\1DVs::       ds 2
\1PP::        ds NUM_MOVES
\1Happiness:: db
\1Level::     db
\1Status::    ds 2
\1HP::        dw
\1MaxHP::     dw
\1Stats:: ; big endian
\1Attack::    dw
\1Defense::   dw
\1Speed::     dw
\1SpclAtk::   dw
\1SpclDef::   dw
\1StatsEnd::
\1Type::
\1Type1::     db
\1Type2::     db
\1StructEnd::
ENDM

box: MACRO
\1::
\1Count::           ds 1
\1Species::         ds MONS_PER_BOX + 1
\1Mons::
\1Mon1::            box_struct \1Mon1
\1Mon2::            ds BOXMON_STRUCT_LENGTH * (MONS_PER_BOX +- 1)
\1MonOT::           ds NAME_LENGTH * MONS_PER_BOX
\1MonNicknames::    ds PKMN_NAME_LENGTH * MONS_PER_BOX
\1MonNicknamesEnd::
\1End::             ds 2 ; padding
ENDM


channel_struct: MACRO
; Addreses are Channel1 (c101).
\1MusicID::           dw
\1MusicBank::         db
\1Flags::             db ; 0:on/off 1:subroutine 3:sfx 4:noise 5:rest
\1Flags2::            db ; 0:vibrato on/off 2:duty 4:cry pitch
\1Flags3::            db ; 0:vibrato up/down
\1MusicAddress::      dw
\1LastMusicAddress::  dw
                      dw
\1NoteFlags::         db ; 5:rest
\1Condition::         db ; conditional jumps
\1DutyCycle::         db ; bits 6-7 (0:12.5% 1:25% 2:50% 3:75%)
\1Intensity::         db ; hi:pressure lo:velocity
\1Frequency:: ; 11 bits
\1FrequencyLo::       db
\1FrequencyHi::       db
\1Pitch::             db ; 0:rest 1-c:note
\1Octave::            db ; 7-0 (0 is highest)
\1PitchOffset::    db ; raises existing octaves (to repeat phrases)
\1NoteDuration::      db ; frames remaining for the current note
\1Field0x16::         ds 1 ; c117
                      ds 1 ; c118
\1LoopCount::         db
\1Tempo::             dw
\1Tracks::            db ; hi:left lo:right
\1SFXDutyLoop::         ds 1 ; c11d
\1VibratoDelayCount:: db ; initialized by \1VibratoDelay
\1VibratoDelay::      db ; number of frames a note plays until vibrato starts
\1VibratoExtent::     db
\1VibratoRate::       db ; hi:frames for each alt lo:frames to the next alt
\1PitchWheelTarget::  dw ; frequency endpoint for pitch wheel
\1PitchWheelAmount::  db ; c124
\1PitchWheelAmountFraction::   db ; c125
\1Field0x25::         ds 1 ; c126
                      ds 1 ; c127
\1CryPitch::          dw
\1Field0x29::         ds 1
\1Field0x2a::         ds 2
\1Field0x2c::         ds 1
\1NoteLength::        db ; frames per 16th note
\1Field0x2e::         ds 1 ; c12f
\1Field0x2f::         ds 1 ; c130
\1Field0x30::         ds 1 ; c131
                      ds 1 ; c132
ENDM

battle_tower_struct: MACRO
\1Name:: ds NAME_LENGTH +- 1
\1TrainerClass:: ds 1
\1Pkmn1:: party_struct \1Pkmn1
\1Pkmn1Name:: ds PKMN_NAME_LENGTH
\1Pkmn1NameEnd::
\1Pkmn2:: party_struct \1Pkmn2
\1Pkmn2Name:: ds PKMN_NAME_LENGTH
\1Pkmn2NameEnd::
\1Pkmn3:: party_struct \1Pkmn3
\1Pkmn3Name:: ds PKMN_NAME_LENGTH
\1Pkmn3NameEnd::
\1TrainerData:: ds BATTLETOWER_TRAINERDATALENGTH
\1TrainerEnd::
endm

mailmsg: MACRO
\1Message:: ds MAIL_MSG_LENGTH
\1MessageEnd:: ds 1
\1Author:: ds PLAYER_NAME_LENGTH
\1AuthorNationality:: ds 2
\1AuthorID:: ds 2
\1Species:: ds 1
\1Type:: ds 1
\1End::
endm

hof_mon: MACRO
\1Species:: ds 1
\1ID:: ds 2
\1DVs:: ds 2
\1Level:: ds 1
\1Nickname:: ds PKMN_NAME_LENGTH +- 1
\1End::
endm

roam_struct: MACRO
\1Species::   db
\1Level::     db
\1MapGroup::  db
\1MapNumber:: db
\1HP::        ds 1
\1DVs::       ds 2
ENDM

bugcontestwinner: macro
\1PersonID:: ds 1
\1Mon:: ds 1
\1Score:: ds 2
endm

hall_of_fame: MACRO
\1::
\1WinCount:: ds 1
\1Mon1:: hof_mon \1Mon1
\1Mon2:: hof_mon \1Mon2
\1Mon3:: hof_mon \1Mon3
\1Mon4:: hof_mon \1Mon4
\1Mon5:: hof_mon \1Mon5
\1Mon6:: hof_mon \1Mon6
\1End:: ds 1
ENDM

trademon: MACRO
\1Species:: ds 1 ; wc6d0 | wc702
\1SpeciesName:: ds PKMN_NAME_LENGTH ; wc6d1 | wc703
\1Nickname:: ds PKMN_NAME_LENGTH ; wc6dc | wc70e
\1SenderName:: ds NAME_LENGTH ; wc6e7 | wc719
\1OTName:: ds NAME_LENGTH ; wc6f2 | wc724
\1DVs:: ds 2 ; wc6fd | wc72f
\1ID:: ds 2 ; wc6ff | wc731
\1CaughtData:: ds 1 ; wc701 | wc733
\1End::
ENDM

move_struct: MACRO
\1Animation:: ds 1
\1Effect:: ds 1
\1Power:: ds 1
\1Type:: ds 1
\1Accuracy:: ds 1
\1PP:: ds 1
\1EffectChance:: ds 1
endm

slot_reel: MACRO
\1ReelAction::   db
\1TilemapAddr::  dw
\1Position::     db
\1SpinDistance:: db
\1SpinRate::     db
\1OAMAddr::      dw
\1XCoord::       db
\1Slot09::       ds 1
\1Slot0a::       ds 1
\1Slot0b::       ds 1
\1Slot0c::       ds 1
\1Slot0d::       ds 1
\1Slot0e::       ds 1
\1Slot0f::       ds 1
endm

object_struct: MACRO
\1Struct::
\1Sprite:: ds 1
\1MapObjectIndex:: ds 1
\1SpriteTile:: ds 1
\1MovementType:: ds 1
\1Flags:: ds 2
\1Palette:: ds 1
\1Walking:: ds 1
\1Direction:: ds 1
\1StepType:: ds 1
\1StepDuration:: ds 1
\1Action:: ds 1
\1ObjectStepFrame:: ds 1
\1Facing:: ds 1
\1StandingTile:: ds 1 ; collision
\1LastTile:: ds 1     ; collision
\1StandingMapX:: ds 1
\1StandingMapY:: ds 1
\1LastMapX:: ds 1
\1LastMapY:: ds 1
\1ObjectInitX:: ds 1
\1ObjectInitY:: ds 1
\1Radius:: ds 1
\1SpriteX:: ds 1
\1SpriteY:: ds 1
\1SpriteXOffset:: ds 1
\1SpriteYOffset:: ds 1
\1MovementByteIndex:: ds 1
\1Object28:: ds 1
\1Object29:: ds 1
\1Object30:: ds 1
\1Object31:: ds 1
\1Range:: ds 1
	ds 7
\1StructEnd::
ENDM

map_object: MACRO
\1Object::
\1ObjectStructID::  ds 1
\1ObjectSprite::    ds 1
\1ObjectYCoord::    ds 1
\1ObjectXCoord::    ds 1
\1ObjectMovement::  ds 1
\1ObjectRadius::    ds 1
\1ObjectHour::      ds 1
\1ObjectTimeOfDay:: ds 1
\1ObjectColor::     ds 1
\1ObjectRange::     ds 1
\1ObjectScript::    ds 2
\1ObjectEventFlag:: ds 2
	ds 2
endm

sprite_anim_struct: MACRO
\1Index:: ds 1          ; 0
\1FramesetID:: ds 1     ; 1
\1AnimSeqID:: ds 1      ; 2
\1TileID:: ds 1         ; 3
\1XCoord:: ds 1         ; 4
\1YCoord:: ds 1         ; 5
\1XOffset:: ds 1        ; 6
\1YOffset:: ds 1        ; 7
\1Duration:: ds 1       ; 8
\1DurationOffset:: ds 1 ; 9
\1FrameIndex:: ds 1     ; a
\1Sprite0b:: ds 1
\1Sprite0c:: ds 1
\1Sprite0d:: ds 1
\1Sprite0e:: ds 1
\1Sprite0f:: ds 1
ENDM

battle_anim_struct: MACRO
; Placeholder until we can figure out what it all means
\1_Index::  ds 1
\1_Anim01:: ds 1
\1_Anim02:: ds 1
\1_FramesetIndex:: ds 1
\1_FunctionIndex:: ds 1
\1_Anim05:: ds 1
\1_TileID:: ds 1
\1_XCoord:: ds 1
\1_YCoord:: ds 1
\1_XOffset:: ds 1
\1_YOffset:: ds 1
\1_Anim0b:: ds 1
\1_Anim0c:: ds 1
\1_Anim0d:: ds 1
\1_AnonJumptableIndex:: ds 1
\1_Anim0f:: ds 1
\1_Anim10:: ds 1
\1_Anim11:: ds 1
\1_Anim12:: ds 1
\1_Anim13:: ds 1
\1_Anim14:: ds 1
\1_Anim15:: ds 1
\1_Anim16:: ds 1
\1_Anim17:: ds 1
endm

battle_bg_effect: MACRO
\1_Function:: ds 1
\1_01:: ds 1
\1_02:: ds 1
\1_03:: ds 1
endm
