; Structures in RAM

MACRO flag_array
	ds ((\1) + 7) / 8
ENDM

MACRO box_struct
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
\1DVs::            dw
\1PP::             ds NUM_MOVES
\1Happiness::      db
\1PokerusStatus::  db
\1CaughtData::
\1CaughtTime::
\1CaughtLevel::    db
\1CaughtGender::
\1CaughtLocation:: db
\1Level::          db
\1BoxEnd::
ENDM

MACRO party_struct
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
\1StructEnd::
ENDM

MACRO red_box_struct
\1Species::    db
\1HP::         dw
\1BoxLevel::   db
\1Status::     db
\1Type::
\1Type1::      db
\1Type2::      db
\1CatchRate::  db
\1Moves::      ds NUM_MOVES
\1ID::         dw
\1Exp::        ds 3
\1HPExp::      dw
\1AttackExp::  dw
\1DefenseExp:: dw
\1SpeedExp::   dw
\1SpecialExp:: dw
\1DVs::        dw
\1PP::         ds NUM_MOVES
ENDM

MACRO red_party_struct
	red_box_struct \1
\1Level::      db
\1Stats::
\1MaxHP::      dw
\1Attack::     dw
\1Defense::    dw
\1Speed::      dw
\1Special::    dw
ENDM

MACRO battle_struct
\1Species::   db
\1Item::      db
\1Moves::     ds NUM_MOVES
\1DVs::       dw
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
\1Type::
\1Type1::     db
\1Type2::     db
\1StructEnd::
ENDM

MACRO box
\1Count::   db
\1Species:: ds MONS_PER_BOX + 1
\1Mons::
	; \1Mon1 - \1Mon20
	for n, 1, MONS_PER_BOX + 1
	\1Mon{d:n}:: box_struct \1Mon{d:n}
	endr
\1MonOTs::
	; \1Mon1OT - \1Mon20OT
	for n, 1, MONS_PER_BOX + 1
	\1Mon{d:n}OT:: ds NAME_LENGTH
	endr
\1MonNicknames::
	; \1Mon1Nickname - \1Mon20Nickname
	for n, 1, MONS_PER_BOX + 1
	\1Mon{d:n}Nickname:: ds MON_NAME_LENGTH
	endr
\1MonNicknamesEnd::
\1End::
	ds 2 ; padding
ENDM

MACRO map_connection_struct
\1ConnectedMapGroup::       db
\1ConnectedMapNumber::      db
\1ConnectionStripPointer::  dw
\1ConnectionStripLocation:: dw
\1ConnectionStripLength::   db
\1ConnectedMapWidth::       db
\1ConnectionStripYOffset::  db
\1ConnectionStripXOffset::  db
\1ConnectionWindow::        dw
ENDM

MACRO channel_struct
\1MusicID::           dw
\1MusicBank::         db
\1Flags1::            db ; 0:on/off 1:subroutine 2:looping 3:sfx 4:noise 5:rest
\1Flags2::            db ; 0:vibrato on/off 1:pitch slide 2:duty cycle pattern 4:pitch offset
\1Flags3::            db ; 0:vibrato up/down 1:pitch slide direction
\1MusicAddress::      dw
\1LastMusicAddress::  dw
                      dw
\1NoteFlags::         db ; 5:rest
\1Condition::         db ; conditional jumps
\1DutyCycle::         db ; bits 6-7 (0:12.5% 1:25% 2:50% 3:75%)
\1VolumeEnvelope::    db ; hi:volume lo:fade
\1Frequency::         dw ; 11 bits
\1Pitch::             db ; 0:rest 1-c:note
\1Octave::            db ; 7-0 (0 is highest)
\1Transposition::     db ; raises existing octaves (to repeat phrases)
\1NoteDuration::      db ; frames remaining for the current note
\1Field16::           ds 1
                      ds 1
\1LoopCount::         db
\1Tempo::             dw
\1Tracks::            db ; hi:left lo:right
\1DutyCyclePattern::  db
\1VibratoDelayCount:: db ; initialized by \1VibratoDelay
\1VibratoDelay::      db ; number of frames a note plays until vibrato starts
\1VibratoExtent::     db
\1VibratoRate::       db ; hi:frames for each alt lo:frames to the next alt
\1PitchSlideTarget::  dw ; frequency endpoint for pitch slide
\1PitchSlideAmount::  db
\1PitchSlideAmountFraction:: db
\1Field25::           db
                      ds 1
\1PitchOffset::       dw
\1Field29::           ds 1
\1Field2a::           ds 2
\1Field2c::           ds 1
\1NoteLength::        db ; frames per 16th note
\1Field2e::           ds 1
\1Field2f::           ds 1
\1Field30::           ds 1
                      ds 1
ENDM

MACRO battle_tower_struct
\1Name::         ds NAME_LENGTH - 1
\1TrainerClass:: db
	; \1Mon1 - \1Mon3 and \1Mon1Name - \1Mon3Name
	for n, 1, BATTLETOWER_PARTY_LENGTH + 1
	\1Mon{d:n}::     party_struct \1Mon{d:n}
	\1Mon{d:n}Name:: ds MON_NAME_LENGTH
	endr
\1TrainerData::  ds BATTLETOWER_TRAINERDATALENGTH
\1TrainerEnd::
ENDM

MACRO mailmsg
\1Message::     ds MAIL_MSG_LENGTH
\1MessageEnd::  db
\1Author::      ds PLAYER_NAME_LENGTH
\1Nationality:: dw
\1AuthorID::    dw
\1Species::     db
\1Type::        db
\1End::
ENDM

MACRO mailmsg_jp
\1Message::    ds MAIL_MSG_LENGTH
\1MessageEnd:: db
\1Author::     ds NAME_LENGTH_JAPANESE - 1
\1AuthorID::   dw
\1Species::    db
\1Type::       db
\1End::
ENDM

MACRO roam_struct
\1Species::   db
\1Level::     db
\1MapGroup::  db
\1MapNumber:: db
\1HP::        db
\1DVs::       dw
ENDM

MACRO bugcontestwinner
\1WinnerID:: db
\1Mon::      db
\1Score::    dw
ENDM

MACRO hof_mon
\1Species::  db
\1ID::       dw
\1DVs::      dw
\1Level::    db
\1Nickname:: ds MON_NAME_LENGTH - 1
\1End::
ENDM

MACRO hall_of_fame
\1WinCount:: db
	; \1Mon1 - \1Mon6
	for n, 1, PARTY_LENGTH + 1
	\1Mon{d:n}:: hof_mon \1Mon{d:n}
	endr
\1End:: db
ENDM

MACRO link_battle_record
\1ID::     dw
\1Name::   ds NAME_LENGTH - 1
\1Wins::   dw
\1Losses:: dw
\1Draws::  dw
\1End::
ENDM

MACRO trademon
\1Species::     db
\1SpeciesName:: ds MON_NAME_LENGTH
\1Nickname::    ds MON_NAME_LENGTH
\1SenderName::  ds NAME_LENGTH
\1OTName::      ds NAME_LENGTH
\1DVs::         dw
\1ID::          dw
\1CaughtData::  db
\1End::
ENDM

MACRO move_struct
\1Animation::    db
\1Effect::       db
\1Power::        db
\1Type::         db
\1Accuracy::     db
\1PP::           db
\1EffectChance:: db
ENDM

MACRO slot_reel
\1ReelAction::   db
\1TilemapAddr::  dw
\1Position::     db
\1SpinDistance:: db
\1SpinRate::     db
\1OAMAddr::      dw
\1XCoord::       db
\1ManipCounter:: db
\1ManipDelay::   db
\1Field0b::      ds 1
\1Field0c::      ds 1
\1Field0d::      ds 1
\1Field0e::      ds 1
\1StopDelay::    db
ENDM

MACRO object_struct
\1Sprite::         db
\1MapObjectIndex:: db
\1SpriteTile::     db
\1MovementType::   db
\1Flags::          dw
\1Palette::        db
\1Walking::        db
\1Direction::      db
\1StepType::       db
\1StepDuration::   db
\1Action::         db
\1StepFrame::      db
\1Facing::         db
\1Tile::           db
\1LastTile::       db
\1MapX::           db
\1MapY::           db
\1LastMapX::       db
\1LastMapY::       db
\1InitX::          db
\1InitY::          db
\1Radius::         db
\1SpriteX::        db
\1SpriteY::        db
\1SpriteXOffset::  db
\1SpriteYOffset::  db
\1MovementIndex::  db
\1StepIndex::      db
\1Field1d::        ds 1
\1Field1e::        ds 1
\1JumpHeight::     db
\1Range::          db
	ds 7
\1StructEnd::
ENDM

MACRO map_object
\1ObjectStructID::   db
\1ObjectSprite::     db
\1ObjectYCoord::     db
\1ObjectXCoord::     db
\1ObjectMovement::   db
\1ObjectRadius::     db
\1ObjectHour1::      db
\1ObjectHour2::
\1ObjectTimeOfDay::  db
\1ObjectPalette::
\1ObjectType::       db
\1ObjectSightRange:: db
\1ObjectScript::     dw
\1ObjectEventFlag::  dw
	ds 2
ENDM

MACRO sprite_oam_struct
\1YCoord::     db
\1XCoord::     db
\1TileID::     db
\1Attributes:: db
; bit 7: priority
; bit 6: y flip
; bit 5: x flip
; bit 4: pal # (non-cgb)
; bit 3: vram bank (cgb only)
; bit 2-0: pal # (cgb only)
ENDM

MACRO sprite_anim_struct
\1Index::          db
\1FramesetID::     db
\1AnimSeqID::      db
\1TileID::         db
\1XCoord::         db
\1YCoord::         db
\1XOffset::        db
\1YOffset::        db
\1Duration::       db
\1DurationOffset:: db
\1FrameIndex::     db
\1JumptableIndex:: db
\1Var1::           ds 1
\1Var2::           ds 1
\1Var3::           ds 1
\1Var4::           ds 1
ENDM

MACRO battle_anim_struct
\1Index::          db
\1OAMFlags::       db
\1FixY::           db
\1FramesetID::     db
\1Function::       db
\1Palette::        db
\1TileID::         db
\1XCoord::         db
\1YCoord::         db
\1XOffset::        db
\1YOffset::        db
\1Param::          db
\1Duration::       db
\1Frame::          db
\1JumptableIndex:: db
\1Var1::           db
\1Var2::           db
	ds 7
ENDM

MACRO battle_bg_effect
\1Function::       db
\1JumptableIndex:: db
\1BattleTurn::     db
\1Param::          db
ENDM
