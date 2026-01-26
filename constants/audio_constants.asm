; pitch
; FrequencyTable indexes (see audio/notes.asm)
	const_def 1
	const C_ ; 1
	const C# ; 2
	const D_ ; 3
	const D# ; 4
	const E_ ; 5
	const F_ ; 6
	const F# ; 7
	const G_ ; 8
	const G# ; 9
	const A_ ; a
	const A# ; b
	const B_ ; c
DEF NUM_NOTES EQU const_value - 1

; channel
; ChannelPointers indexes (see audio/engine.asm)
	const_def
	const CHAN1 ; 0
	const CHAN2 ; 1
	const CHAN3 ; 2
	const CHAN4 ; 3
DEF NUM_MUSIC_CHANS EQU const_value
	const CHAN5 ; 4
	const CHAN6 ; 5
	const CHAN7 ; 6
	const CHAN8 ; 7
DEF NUM_NOISE_CHANS EQU const_value - NUM_MUSIC_CHANS
DEF NUM_CHANNELS EQU const_value

; channel_struct members (see macros/ram.asm)
rsreset
DEF CHANNEL_MUSIC_ID                    rw
DEF CHANNEL_MUSIC_BANK                  rb
DEF CHANNEL_FLAGS1                      rb
DEF CHANNEL_FLAGS2                      rb
DEF CHANNEL_FLAGS3                      rb
DEF CHANNEL_MUSIC_ADDRESS               rw
DEF CHANNEL_LAST_MUSIC_ADDRESS          rw
                                        rb_skip 2
DEF CHANNEL_NOTE_FLAGS                  rb
DEF CHANNEL_CONDITION                   rb
DEF CHANNEL_DUTY_CYCLE                  rb
DEF CHANNEL_VOLUME_ENVELOPE             rb
DEF CHANNEL_FREQUENCY                   rw
DEF CHANNEL_PITCH                       rb
DEF CHANNEL_OCTAVE                      rb
DEF CHANNEL_TRANSPOSITION               rb
DEF CHANNEL_NOTE_DURATION               rb
DEF CHANNEL_NOTE_DURATION_MODIFIER      rb
                                        rb_skip
DEF CHANNEL_LOOP_COUNT                  rb
DEF CHANNEL_TEMPO                       rw
DEF CHANNEL_TRACKS                      rb
DEF CHANNEL_DUTY_CYCLE_PATTERN          rb
DEF CHANNEL_VIBRATO_DELAY_COUNT         rb
DEF CHANNEL_VIBRATO_DELAY               rb
DEF CHANNEL_VIBRATO_EXTENT              rb
DEF CHANNEL_VIBRATO_RATE                rb
DEF CHANNEL_PITCH_SLIDE_TARGET          rw
DEF CHANNEL_PITCH_SLIDE_AMOUNT          rb
DEF CHANNEL_PITCH_SLIDE_AMOUNT_FRACTION rb
DEF CHANNEL_FIELD25                     rb
                                        rb_skip
DEF CHANNEL_PITCH_OFFSET                rw
DEF CHANNEL_FIELD29                     rb
DEF CHANNEL_FIELD2A                     rw
DEF CHANNEL_FIELD2C                     rb
DEF CHANNEL_NOTE_LENGTH                 rb
DEF CHANNEL_FIELD2E                     rb
DEF CHANNEL_FIELD2F                     rb
DEF CHANNEL_FIELD30                     rb
                                        rb_skip
DEF CHANNEL_STRUCT_LENGTH EQU _RS

DEF NOISE_CHAN_F EQU 2 ; bit set in CHAN5-CHAN7

; Flags1
	const_def
	const SOUND_CHANNEL_ON ; 0
	const SOUND_SUBROUTINE ; 1
	const SOUND_LOOPING    ; 2
	const SOUND_SFX        ; 3
	const SOUND_NOISE      ; 4
	const SOUND_CRY        ; 5

; Flags2
	const_def
	const SOUND_VIBRATO      ; 0
	const SOUND_PITCH_SLIDE  ; 1
	const SOUND_DUTY_LOOP    ; 2
	const SOUND_UNKN_0B      ; 3
	const SOUND_PITCH_OFFSET ; 4
	const SOUND_UNKN_0D      ; 5
	const SOUND_UNKN_0E      ; 6
	const SOUND_UNKN_0F      ; 7

; Flags3
	const_def
	const SOUND_VIBRATO_DIR     ; 0
	const SOUND_PITCH_SLIDE_DIR ; 1

; NoteFlags
	const_def
	const NOTE_DUTY_OVERRIDE    ; 0
	const NOTE_FREQ_OVERRIDE    ; 1
	const NOTE_UNUSED           ; 2
	const NOTE_PITCH_SWEEP      ; 3
	const NOTE_NOISE_SAMPLING   ; 4
	const NOTE_REST             ; 5
	const NOTE_VIBRATO_OVERRIDE ; 6

; wVolume
DEF MAX_VOLUME EQU AUDVOL_LEFT | AUDVOL_RIGHT

; wSoundInput
DEF SOUND_INPUT_CH1_F    EQU 0
DEF SOUND_INPUT_CH2_F    EQU 1
DEF SOUND_INPUT_CH3_F    EQU 2
DEF SOUND_INPUT_CH4_F    EQU 3
DEF SOUND_INPUT_GLOBAL_F EQU 7

; wLowHealthAlarm
DEF DANGER_PITCH_F EQU 4
DEF DANGER_ON_F    EQU 7

; wMusicFade
DEF MUSIC_FADE_IN_F EQU 7
