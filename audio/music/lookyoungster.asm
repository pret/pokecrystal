Music_LookYoungster: ; f66c3
	dbw $80, Music_LookYoungster_Ch1
	dbw $01, Music_LookYoungster_Ch2
	dbw $02, Music_LookYoungster_Ch3
; f66cc


Music_LookYoungster_Ch1: ; f66cc
	tempo 118
	volume $77
	stereopanning $f
	dutycycle $3
	notetype $c, $a3
	octave 3
	note G_, 0
	note G#, 0
	note A_, 0
	note A#, 0
	intensity $3e
	note B_, 15
	intensity $c3
	octave 4
	note C_, 0
	note __, 2
	note C_, 3
	note __, 1
	note C_, 5
	intensity $b3

Music_LookYoungster_branch_f66ea: ; f66ea
	note __, 1
	octave 3
	note G_, 0
	note __, 0
	note B_, 0
	note __, 0
	note G_, 0
	note __, 0
	octave 4
	note D_, 0
	note __, 0
	note C_, 0
	note __, 2
	note C_, 0
	note __, 0
	note __, 15
	note __, 1
	octave 3
	note G_, 0
	note __, 0
	note B_, 0
	note __, 0
	note G_, 0
	note __, 0
	octave 4
	note D_, 0
	note __, 0
	note C_, 0
	note __, 2
	note C_, 0
	note __, 0
	note __, 15
	loopchannel 0, Music_LookYoungster_branch_f66ea
INCBIN "baserom.gbc", $f670e, $f670f - $f670e

Music_LookYoungster_Ch2: ; f670f
	stereopanning $f0
	vibrato $12, $26
	dutycycle $1
	notetype $c, $a3
	octave 3
	note B_, 0
	octave 4
	note C_, 0
	note C#, 0
	note D_, 0
	intensity $3e
	notetype $c, $2e
	note G_, 15
	notetype $c, $b3
	intensity $c3
	note F_, 0
	note __, 2
	note F_, 3
	note __, 1
	note F#, 5

Music_LookYoungster_branch_f672f: ; f672f
	dutycycle $3
	intensity $b3
	note __, 1
	octave 3
	note B_, 0
	note __, 0
	octave 4
	note D_, 0
	note __, 0
	octave 3
	note B_, 0
	note __, 0
	octave 4
	note G_, 0
	note __, 0
	note F_, 0
	note __, 2
	note F_, 0
	note __, 0
	intensity $97
	dutycycle $2
	note D#, 0
	note F_, 0
	note D#, 0
	note D_, 0
	note C_, 0
	note __, 0
	octave 3
	note G#, 0
	note __, 2
	note F_, 0
	note __, 0
	note G_, 0
	note __, 0
	note G#, 0
	note __, 0
	dutycycle $3
	intensity $b3
	note __, 1
	note B_, 0
	note __, 0
	octave 4
	note D_, 0
	note __, 0
	octave 3
	note B_, 0
	note __, 0
	octave 4
	note G_, 0
	note __, 0
	note F_, 0
	note __, 2
	note F_, 0
	note __, 0
	dutycycle $2
	intensity $97
	note G#, 0
	note A#, 0
	note G#, 0
	note G_, 0
	note F_, 0
	note __, 0
	note C_, 0
	note __, 2
	octave 3
	note G#, 0
	note __, 0
	note A#, 0
	note __, 0
	octave 4
	note C_, 0
	note __, 0
	loopchannel 0, Music_LookYoungster_branch_f672f
INCBIN "baserom.gbc", $f6783, $f6784 - $f6783

Music_LookYoungster_Ch3: ; f6784
	stereopanning $ff
	vibrato $2, $24
	notetype $c, $25
	note __, 3
	octave 2
	note G_, 0
	note __, 0
	octave 3
	note G_, 0
	note __, 0
	octave 2
	note G_, 0
	note __, 0
	octave 3
	note G_, 0
	note __, 0
	octave 2
	note G_, 0
	note __, 0
	octave 3
	note G_, 0
	note __, 0
	intensity $15
	octave 2
	note G_, 0
	note __, 0
	octave 3
	note G_, 0
	note __, 0
	note D_, 0
	note __, 2
	note D_, 3
	note __, 1
	note G#, 5
	intensity $25

Music_LookYoungster_branch_f67ae: ; f67ae
	octave 2
	note G_, 0
	note __, 0
	octave 3
	note G_, 0
	note __, 0
	octave 2
	note G_, 0
	note __, 0
	octave 3
	note G_, 0
	note __, 0
	octave 2
	note G_, 0
	note __, 0
	octave 3
	note G_, 0
	note __, 0
	octave 2
	note G_, 0
	note __, 0
	octave 3
	note G_, 0
	note __, 0
	octave 2
	note F_, 0
	note __, 0
	octave 3
	note D#, 0
	note __, 0
	octave 2
	note F_, 0
	note __, 0
	octave 3
	note D#, 0
	note __, 0
	octave 2
	note F_, 0
	note __, 0
	octave 3
	note D#, 0
	note __, 0
	octave 2
	note F_, 0
	note __, 0
	octave 3
	note D#, 0
	note __, 0
	octave 2
	note G_, 0
	note __, 0
	octave 3
	note G_, 0
	note __, 0
	octave 2
	note G_, 0
	note __, 0
	octave 3
	note G_, 0
	note __, 0
	octave 2
	note G_, 0
	note __, 0
	octave 3
	note G_, 0
	note __, 0
	octave 2
	note G_, 0
	note __, 0
	octave 3
	note G_, 0
	note __, 0
	octave 2
	note G#, 0
	note __, 0
	octave 3
	note D#, 0
	note __, 0
	octave 2
	note G#, 0
	note __, 0
	octave 3
	note D#, 0
	note __, 0
	octave 2
	note G#, 0
	note __, 0
	octave 3
	note D#, 0
	note __, 0
	note G_, 0
	note __, 0
	note G#, 0
	note __, 0
	loopchannel 0, Music_LookYoungster_branch_f67ae
; f6810

INCBIN "baserom.gbc", $f6810, $f6811 - $f6810
