# Music Commands

Defined in [macros/scripts/audio.asm](/macros/scripts/audio.asm) and [audio/engine.asm:MusicCommands](/audio/engine.asm).

See also: [Sound Engine Commands](https://github.com/pret/pokecrystal/wiki/Sound-Engine-Commands)


## `musicheader` *n*, *index*, *address*

## `cry_header` *n*, *index*, *address*

## `note` *pitch*, *length*

(Used on all channels)

The high nibble is the note to play. 0 is rest, 1 is `C_`, 2 is `C#`, etc; `$C` is `B_`.
The low nibble is the length of the note. 1 gets added to this, so 0 still has a length.

## `sound` *pitch*, *octave*, *intensity*, *frequency*

## `noise` *pitch*, *duration*, *intensity*, *frequency*

## `$D0`−`$D7`: `octave` *n*

(Used in channels 1-3)

Sets the octave for the notes played on the channel.
`$D7` is the lowest octave, whereas `$D0` is the highest.

## `$D8`: `notetype` *length*[, *intensity*]

(Used in channels 1-4) (When using in channel 4, the *intensity* byte is not needed)

Sets the length multiplier of notes on the channel, and the envelope for channels 1-3 (see `intensity`).
The first byte only reads the lower 4 bits, and multiplies it by the note length. A larger number means slower playback/longer notes. `$C` is commonly used for a normal timeframe.

The second byte is identical to the first byte in the `intensity` command.

## `$D9`: `pitchoffset` *octave*, *key*

(Used in channels 1-3)

Transposes all notes played on the channel by a value.
The high nibble determins how many octaves to subtract, while the low nibble is how many note values to add.
Ex: Setting a value of `$13` would make a `C_`4 play as a `D#`3.

## `$DA`: `tempo` *tempo*

(Used in channel 1)

Sets the tempo for all playing channels. This should only be called on channel 1.

The formula to convert from this tempo to BPM is: BPM = 19200 / Tempo
This formula also works backwards to convert BPM to tempo: Tempo = 19200 / BPM

Only set or change this value when all playing channels are triggering a note or rest at the same time, otherwise desyncs may happen.

## `$DB`: `dutycycle` *duty_cycle*

(Used on channels 1&2)

Sets the square duty (sound) for the current channel. To change the sound for channel 3, use intensity. The only accepted values are 0-3.

- 0 = 12.5% waveform: `_______¯`
- 1 = 25% waveform: `______¯¯`
- 2 = 50% waveform: `____¯¯¯¯`
- 3 = 75% waveform: `__¯¯¯¯¯¯` (sounds the same as 25%)

## `$DC`: `intensity` *intensity*

(Used on channels 1-3) (Used to set instrument on channel 3)

For channels 1&2:
This sets the volume and fade of the notes. The high nibble is the starting volume, 0 is mute, $F is max. Bit 3 determines the fade direction (0=Fade to silence, 1=Fade to max volume). The last 3 bits is how fast the fade happens. 0 is no fade, 1 is fastest fade, 7 is slowest fade.

For channel 3:
The high nibble sets the volume of channel 3. Only 4 values are accepted (0=Mute, 1=100% volume, 2=50% volume, 3=25% volume). The low nibble sets the instrument/waveform for channel 3 to play. Crystal natively has 10 instruments, values 0-9.

## `$DD`: `soundinput` *input*

## `$DE`: `sound_duty` *a*, *b*, *c*, *d*

(Used on channels 1&2)

This cycles the channel through 4 duty definitions, one per frame.
Each pair of bits defines a duty, same as the `dutycycle` command.
This is mostly only used in cries, SFX, and Jigglypuff's song in RBY.

## `$DF`: `togglesfx`

## `$E0`: `slidepitchto` *duration*, *octave*, *pitch*

(Used on channel 1)

This bends the pitch of the note played next, and only that note.
The first byte tells how many frames to play the destination note for, before the length of the note is up.
The high nibble of the second byte is the octave of the destination note.
The low nibble of the second byte is the destination note. If rest is used as the destination note, then the whole destination pitch becomes `$0000` (the lowest pitch).

## `$E1`: `vibrato` *delay*, *extent*

(Used on channels 1-3)

Modifies pitch after the timer runs out, making notes sound less "flat".
First byte will set the delay, decrementing by one each frame. When it tries subtracting from 0, it starts decrementing from the speed timer.
Second byte, high nibble is the speed timer. It will decrement by one each frame, when it tries decrementing from 0, it mods the frequencey by half of pitch depth, and resets itself to it's initial value.
Second byte, low nibble is the pitch depth. Half of this value will alternate between adding to the pitch, and subtracting from the pitch each time speed timer resets. When this is an odd number, the value added to the pitch will be greater than the value subtracted from the pitch.
Ex: normal pitch of 405, if pitch depth = 3, it will alternate between 407 and 404. Speed timer does NOT reset when a new note is played. only when the song stops or changes. (Also, because a timer counts 0, a timer of 5 will take 6 frames to change.)

## `$E2`: `unknownmusic0xe2` *unknown*

## `$E3`: `togglenoise` *id*

(Used on channel 4)

Sets the "drum kit" to be used. This needs to be called before channel 4 can make any noise.
Calling it more than once in a song will mute the channel. (Keep it out of loops!)

## `$E4`: `panning` *tracks*

## `$E5`: `volume` *volume*

## `$E6`: `tone` *tone*

(Used on channel 1-3)

This modifies the pitch of the notes (fine tuning).
It makes notes sound better if multiple channels play the same note simultaneously.
A lot of GSC songs set the main melody channel with a value of 1, and the secondary channel (not bass) as 2.

## `$E7`: `unknownmusic0xe7` *unknown*

## `$E8`: `unknownmusic0xe8` *unknown*

## `$E9`: `tempo_relative` *value*

## `$EA`: `restartchannel` *address*

## `$EB`: `newsong` *id*

## `$EC`: `sfxpriorityon`

## `$ED`: `sfxpriorityoff`

## `$EE`: `unknownmusic0xee` *address*

## `$EF`: `stereopanning` *tracks*

## `$F0`: `sfxtogglenoise` *id*

## `$F1`: `music0xf1`

## `$F2`: `music0xf2`

## `$F3`: `music0xf3`

## `$F4`: `music0xf4`

## `$F5`: `music0xf5`

## `$F6`: `music0xf6`

## `$F7`: `music0xf7`

## `$F8`: `music0xf8`

## `$F9`: `unknownmusic0xf9`

## `$FA`: `setcondition` *condition*

## `$FB`: `jumpif` *condition*, *address*

## `$FC`: `jumpchannel` *address*

## `$FD`: `loopchannel` *count*, *address*

## `$FE`: `callchannel` *address*

## `$FF`: `endchannel`
