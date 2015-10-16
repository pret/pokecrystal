note: MACRO
	dn (\1), (\2) - 1
	ENDM

sound: macro
	db \1 ; duration
	db \2 ; intensity
	dw \3 ; frequency
	endm

noise: macro
	db \1 ; duration
	db \2 ; intensity
	db \3 ; frequency
	endm

; pitch
__ EQU 0
C_ EQU 1
C# EQU 2
D_ EQU 3
D# EQU 4
E_ EQU 5
F_ EQU 6
F# EQU 7
G_ EQU 8
G# EQU 9
A_ EQU 10
A# EQU 11
B_ EQU 12

; Drumkit5
;__ EQU 0
D5Snare9 EQU 1 ; c
D5Snare10 EQU 2 ; c#
D5Snare11 EQU 3 ; d
D5Drum27 EQU 4 ; d#
D5Drum28 EQU 5 ; e
D5Drum29 EQU 6 ; f
D5Drum05 EQU 7 ; f#
D5Triangle1 EQU 8 ; g
D5Crash1 EQU 9 ; g#
D5Snare14 EQU 10 ; a
D5Snare13 EQU 11 ; a#
D5Kick2 EQU 12 ; b


octave: macro
	db $d8 - (\1)
	endm

notetype: macro
	db $d8
	db \1 ; note_length
	if _NARG >= 2
	db \2 ; intensity
	endc
	endm

forceoctave: macro
	db $d9
	db \1 ; octave
    ; (\1 << 4) | \2
	endm

tempo: macro
	db $da
	bigdw \1 ; tempo
	endm

dutycycle: macro
	db $db
	db \1 ; duty_cycle
	endm

intensity: macro ; names: volenvelope
; parameter is directly written
; in hardware register NRX2
; FF12 - NR12 - Channel 1 Volume Envelope (R/W)
; Bit 7-4 - Initial Volume of envelope (0-0Fh) (0=No Sound)
; Bit 3   - Envelope Direction (0=Decrease, 1=Increase)
; Bit 2-0 - Number of envelope sweep (n: 0-7)
;           (If zero, stop envelope operation.)
	db $dc
	if _NARG == 1
	db \1 ; intensity
    endc
	if _NARG == 2
	db (\1 << 4) | \2
    endc
	endm

soundinput: macro
; Loads Parameter into 'SoundInput'
; Sets 3rd Bit in ChannelXNoteFlags 
; which later loads 'SoundInput' into NR10
	db $dd
	db \1 ; input
	endm

unknownmusic0xde: macro
; Rotates through 4 Settings of Wave Duty every frame
; begins with Bits 0-1, then 2-3, 4-5, 6-7
; Bit6-7 of TempNRX1 are written into NR11 to set the Wave Pattern Duty
	db $de
	db \1 ; unknown
	endm

togglesfx: macro
	db $df
	endm


unknownmusic0xe0: macro ; maybe pitchbend???
	db $e0
	db \1 ; unknown
	db \2 ; unknown
	endm


vibrato: macro
	db $e1
	if _NARG == 2
	db \1 ; delay
	db \2 ; extent
    endc
; format: vibrato delay (in frames), extent, rate (# frames per cycle)
	if _NARG == 3
	db \1, (\2 << 4) | \3
    endc
	endm

unknownmusic0xe2: macro
	db $e2
	db \1 ; unknown
	endm

togglenoise: macro
	db $e3
	db \1 ; id
	endm

panning: macro
	db $e4
	db \1 ; tracks
	endm

volume: macro
; parameter is directly written
; in hardware register NR50
; FF24 - NR50 - Channel control / ON-OFF / Volume (R/W)
; The volume bits specify the "Master Volume" for Left/Right sound output.
; Bit 7   - Output Vin to SO2 terminal (1=Enable)
; Bit 6-4 - SO2 output level (volume)  (0-7)
; Bit 3   - Output Vin to SO1 terminal (1=Enable)
; Bit 2-0 - SO1 output level (volume)  (0-7)
	db $e5
	if _NARG == 1
	db \1 ; volume
    endc
; \1: SO2 output level (volume)  (0-7)
; \2: SO1 output level (volume)  (0-7)
	if _NARG == 2
	db (\1 << 4) | \2
    endc
	endm

tone: macro
	db $e6
	bigdw \1 ; tone
	endm

unknownmusic0xe7: macro
	db $e7
	db \1 ; unknown
	endm

unknownmusic0xe8: macro
	db $e8
	db \1 ; unknown
	endm

globaltempo: macro
	db $e9
	bigdw \1 ; value
	endm

restartchannel: macro
	db $ea
	dw \1 ; address
	endm

newsong: macro
	db $eb
	bigdw \1 ; id
	endm

sfxpriorityon: macro
	db $ec
	endm

sfxpriorityoff: macro
	db $ed
	endm

unknownmusic0xee: macro
	db $ee
	dw \1 ; address
	endm

stereopanning: macro
	db $ef
	db \1 ; tracks
	endm

sfxtogglenoise: macro
	db $f0
	db \1 ; id
	endm

music0xf1: macro
	db $f1
	endm

music0xf2: macro
	db $f2
	endm

music0xf3: macro
	db $f3
	endm

music0xf4: macro
	db $f4
	endm

music0xf5: macro
	db $f5
	endm

music0xf6: macro
	db $f6
	endm

music0xf7: macro
	db $f7
	endm

music0xf8: macro
	db $f8
	endm

unknownmusic0xf9: macro
	db $f9
	endm

setcondition: macro
	db $fa
	db \1 ; condition
	endm

jumpif: macro
	db $fb
	db \1 ; condition
	dw \2 ; address
	endm

jumpchannel: macro
	db $fc
	dw \1 ; address
	endm

loopchannel: macro
	db $fd
	db \1 ; count
	dw \2 ; address
	endm

callchannel: macro
	db $fe
	dw \1 ; address
	endm

endchannel: macro
	db $ff
	endm
