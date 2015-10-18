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

; Drumkit0
D0Drum00 EQU 0
D0Snare1 EQU 1
D0Snare2 EQU 2
D0Snare3 EQU 3
D0Snare4 EQU 4
D0Drum05 EQU 5
D0Triangle1 EQU 6
D0Triangle2 EQU 7
D0HiHat1 EQU 8
D0Snare5 EQU 9
D0Snare6 EQU 10
D0Snare7 EQU 11
D0HiHat2 EQU 12


octave: macro
	db $d8 - (\1)
	endm

notetype: macro
	db $d8
	db \1 ; note_length
	if _NARG >= 2
	db ((\2) << 4) | ((\3) << 3) | (\4) ; volenvelope
	endc
	endm

setabsnote: macro
; \1: octave (0 - 15)
; \2: pitch (0 - 15)
	db $d9
	db (\1 << 4) | (\2) 
	endm

tempo: macro
	db $da
	bigdw \1 ; tempo
	endm

setwaveduty: macro
	db $db
	db \1 ; duty_cycle
	endm

volenvelope: macro
; \1: Initial Volume of envelope (0-0Fh) (0=No Sound)
; \2: Envelope Direction (0=Decrease, 1=Increase)
; \3: Number of envelope sweep (n: 0-7)
;     (If zero, stop envelope operation.)
	db $dc
;	db (((\1) & 0xf) << 4) | (((\2) & 0x1) << 3) | (((\3) & 0x7) << 0)
	db ((\1) << 4) | ((\2) << 3) | (\3)
	endm

setsweep: macro
; \1: Sweep Time (0-7)
; \2: Sweep Direction (0=Increase, 1=Decrease)
; \3: Number of sweep shift (n: 0-7)
	db $dd
	db (\1 << 4) | (\2 << 3) | (\3) ; sweep settings
	endm

dutycycle: macro
	db $de
    db (\1) | ((\2) << 2) | ((\3) << 4) | ((\4) << 6)
	endm

togglesfx: macro
	db $df
	endm

pitchbend: macro
; \1: duration of the pitch
; \2: octave
; \3: pitch
	db $e0
	db \1, (\2 << 4) | (\3 << 0) 
	endm

vibrato: macro
; \1: vibrato delay (in frames)
; \2: extent
; \3: rate (# frames per cycle)
	db $e1
	db \1 ; delay
	db (\2 << 4) | \3 ; extent and rate
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
	db $e5
	db ((\1) << 4) | (\2) ; volume left and right
	endm

setpitchoffset: macro
	db $e6
	bigdw \1 ; pitch offset/frequency
	endm

unknownmusic0xe7: macro
	db $e7
	db \1 ; unknown
	endm

unknownmusic0xe8: macro
	db $e8
	db \1 ; unknown
	endm

addtempo: macro
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

conditionaljump: macro
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
