# Music Commands

Defined in [macros/scripts/audio.asm](https://github.com/pret/pokecrystal/blob/master/macros/scripts/audio.asm) and [audio/engine.asm:MusicCommands](https://github.com/pret/pokecrystal/blob/master/audio/engine.asm).

Note: Commands that are intended for the song channels (1-4) can be used by the sound effect channels (5-8) if the sound effect channel exits sound effect mode with the `toggle_sfx` command.


## <code>channel_count <i>n</i></code>

Used at the start of each sound header to specify how many channels are used in the sound.  
`n`: Number of channels [`1`, `4`]


## <code>channel <i>index</i>, <i>address</i></code>

Used for each channel in a sound header.  
`index`: Channel number [`1`, `8`]  
`address`: Pointer to the sound data


## <code>note <i>pitch</i>, <i>length</i></code>

Play a basic note. Used by channels 1-3.  
`pitch`: Pitch of note (see [constants/audio_constants.asm](https://github.com/pret/pokecrystal/blob/master/constants/audio_constants.asm))  
`length`: Length of note in "ticks" [`1`, `16`]. The exact duration of a tick is dependant on the current "speed" (see `note_type` and `drum_speed`) and the current "tempo" (see `tempo`).


## <code>drum_note <i>instrument</i>, <i>length</i></code>

Play a predefined drum note. Used by channel 4.  
`instrument`: Instrument ID [`1`, `12`] (see `toggle_noise`)  
`length`: Length of note [`1`, `16`]


## <code>rest <i>length</i></code>

Basic rest. Used by channels 1-4.  
`length`: Length of rest [`1`, `16`]


## <code>square_note <i>length</i>, <i>volume</i>, <i>fade</i>, <i>frequency</i></code>

Sound effect square note. Used by channels 5-7.  
`length`: Length of note [`0`, `255`]  
`volume`: Initial volume [`0`, `15`]  
`fade`: Volume fade [`-7`, `7`]  
`frequency`: Note frequency [`0`, `65535`]


## <code>noise_note <i>length</i>, <i>volume</i>, <i>fade</i>, <i>frequency</i></code>

Sound effect noise note. Used by channel 8.  
`length`: Length of note [`0`, `255`]  
`volume`: Initial volume [`0`, `15`]  
`fade`: Volume fade [`-7`, `7`]  
`frequency`: Note frequency [`0`, `255`]


## `$D0`−`$D7`: <code>octave <i>n</i></code>

Set the octave for the notes played on the current channel. Used by channels 1-3.  
`n`: New octave [`1`, `8`]


## `$D8`: <code>note_type <i>length</i>, <i>volume</i>, <i>fade/wave_instrument</i></code>

Set persistent note properties. Used by channels 1-3.  
`length`: Base note length [`1`, `15`] (`12` is often used for 4/4 common time because `12` is factorable by both `3` and `4`. Therefore it works very well for quarter notes, eighth notes, sixteenth notes, and triplets.)  
`volume`: Initial volume [`0`, `15`] for channels 1-2, [`0`, `3`] for channel 3 (see `volume_envelope`)  
`fade`: Volume fade [`-7`, `7`] (applies to channels 1-2)  
`wave_instrument`: Wave instrument ID (applies to channel 3) (see [audio/wave_samples.asm](https://github.com/pret/pokecrystal/blob/master/audio/wave_samples.asm))


## `$D8`: <code>drum_speed <i>length</i></code>

Set persistent note properties. Used by channel 4.  
`length`: Base note length [`1`, `15`] (use `12` for common time)


## `$D9`: <code>transpose <i>num_octaves</i>, <i>num_pitches</i></code>

Transpose all notes played on the current channel. Used by channels 1-3.  
`num_octaves`: Number of octaves to subtract from each note  
`num_pitches`: Number of pitches to add to each note


## `$DA`: <code>tempo <i>tempo</i></code>

Set the tempo for all playing channels. This should only be used by channel 1.

The formula to convert from this tempo to BPM is: BPM = 19200 / `tempo`  
This formula also works backwards to convert BPM to tempo: `tempo` = 19200 / BPM

Only set or change this value when all playing channels are triggering a note or rest at the same time, otherwise desyncs may happen.


## `$DB`: <code>duty_cycle <i>duty_cycle</i></code>

Set the square duty (sound) for the current channel. Used by channels 1-2.  
The only accepted values are 0-3.

- 0 = 12.5% waveform: `_______¯`
- 1 = 25% waveform: `______¯¯`
- 2 = 50% waveform: `____¯¯¯¯`
- 3 = 75% waveform: `__¯¯¯¯¯¯` (sounds the same as 25%)

To change the sound for channel 3, use `note_type` or `volume_envelope`.


## `$DC`: <code>volume_envelope <i>volume</i>, <i>fade/wave_instrument</i></code>

Set the volume envelope for the current channel. Used by channels 1-3.  
`volume`: Initial volume [`0`, `15`] for channels 1-2, [`0`, `3`] for channel 3  
`fade`: Volume fade [`-7`, `7`] (applies to channels 1-2)  
`wave_instrument`: Wave instrument ID (applies to channel 3) (see [audio/wave_samples.asm](https://github.com/pret/pokecrystal/blob/master/audio/wave_samples.asm))

For channel 3, the only accepted `volume` values are 0-3.

- 0 = Mute
- 1 = 100% volume
- 2 = 50% volume
- 3 = 25% volume

Note about `fade`: A positive value means a decrease in volume; a negative value means an increase in volume. A small magnitude means a quick change; a large magnitude means a slow change. It is stored in signed magnitude representation, so a value of `8` is the same as (negative) `0`.


## `$DD`: <code>pitch_sweep <i>length</i>, <i>pitch_change</i></code>

Set pitch sweep properties. Used by channel 5.  
`length`: Duration of effect [`0`, `15`]  
`pitch_change`: Extent of effect [`-7`, `8`] Note: `8` is used in place of `0`


## `$DE`: <code>duty_cycle_pattern <i>a</i>, <i>b</i>, <i>c</i>, <i>d</i></code>

Set duty cycle pattern (ie, pulse width modulation). Used by channels 5-6.

This cycles the channel through 4 duty cycles, one per frame.  
Each argument defines a duty cycle, same as the `duty_cycle` command.


## `$DF`: <code>toggle_sfx</code>

Toggle between pitch-based songs and frequency-based sound effects. Can be used by any channel.

Note: Similar to the pokered command `execute_music`, however `execute_music` can only be used on channels 5-8 and can not be disabled for the duration of the sound once it is enabled.


## `$E0`: <code>pitch_slide <i>duration</i>, <i>octave</i>, <i>pitch</i></code>

Bend the pitch of the next note played, and only that note. Used by channel 1.  
`duration`: Duration of the target note after slide effect  
`octave`: Target octave  
`pitch`: Target pitch (see [constants/audio_constants.asm](https://github.com/pret/pokecrystal/blob/master/constants/audio_constants.asm))


## `$E1`: <code>vibrato <i>delay</i>, <i>extent</i>, <i>rate</i></code>

Apply vibrato to current channel. Used by channels 1-3.  
`delay`: Delay until vibrato effect begins for each note [`0`, `255`]  
`extent`: Amplitude of vibrato [`0`, `15`]  
`rate`: Frequency of vibrato [`0`, `15`]


## `$E2`: <code>unknownmusic0xe2 <i>unknown</i></code>


## `$E3`: <code>toggle_noise <i>id</i></code>

Set the "drum kit" to be used if it is currently unset. Mute the channel otherwise. Used by channel 4.  
`id`: Drum kit ID [`0`, `5`] (see [audio/drumkits.asm](https://github.com/pret/pokecrystal/blob/master/audio/drumkits.asm))

Note: The drum kit ID is initially unset at the start of a song. When muting the channel, the `id` argument must not be present.


## `$E4`: <code>force_stereo_panning <i>left_enable</i>, <i>right_enable</i></code>

Set left/right stereo output for the current channel, regardless of user's stereo setting. Used by channels 1-4.  
`left_enable`: `TRUE`/`FALSE`  
`right_enable`: `TRUE`/`FALSE`


## `$E5`: <code>volume <i>left_volume</i>, <i>right_volume</i></code>

Set master volume for left/right speakers. Typically only used by channel 1.  
`left_volume`: Left speaker volume [`0`, `7`]  
`right_volume`: Right speaker volume [`0`, `7`]

Note: Minimum volume, `0`, is not muted.


## `$E6`: <code>pitch_offset <i>pitch_offset</i></code>

Adjust the pitch of all notes on the current channel. Used by channels 1-3.  
`pitch_offset`: Frequency adjustment of each pitch

Note: Similar to the pokered command `toggle_perfect_pitch`. `toggle_perfect_pitch` can be replaced with a combination of `pitch_offset 1` and `pitch_offset 0`.


## `$E7`: <code>unknownmusic0xe7 <i>unknown</i></code>


## `$E8`: <code>unknownmusic0xe8 <i>unknown</i></code>


## `$E9`: <code>tempo_relative <i>value</i></code>


## `$EA`: <code>restart_channel <i>address</i></code>


## `$EB`: <code>new_song <i>id</i></code>


## `$EC`: <code>sfx_priority_on</code>


## `$ED`: <code>sfx_priority_off</code>


## `$EE`: <code>unknownmusic0xee <i>address</i></code>


## `$EF`: <code>stereo_panning <i>left_enable</i>, <i>right_enable</i></code>

Set left/right stereo output for the current channel, if the user has stereo mode enabled. Used by channels 1-4.  
`left_enable`: `TRUE`/`FALSE`  
`right_enable`: `TRUE`/`FALSE`


## `$F0`: <code>sfx_toggle_noise <i>id</i></code>

Set the "drum kit" to be used if it is currently unset. Mute the channel otherwise. Used by channel 8.  
`id`: Drum kit ID [`0`, `5`] (see [audio/drumkits.asm](https://github.com/pret/pokecrystal/blob/master/audio/drumkits.asm))

Note: The drum kit ID is initially unset at the start of a song. When muting the channel, the `id` argument must not be present.


## `$F1`: <code>music0xf1</code>


## `$F2`: <code>music0xf2</code>


## `$F3`: <code>music0xf3</code>


## `$F4`: <code>music0xf4</code>


## `$F5`: <code>music0xf5</code>


## `$F6`: <code>music0xf6</code>


## `$F7`: <code>music0xf7</code>


## `$F8`: <code>music0xf8</code>


## `$F9`: <code>unknownmusic0xf9</code>


## `$FA`: <code>set_condition <i>condition</i></code>


## `$FB`: <code>sound_jump_if <i>condition</i>, <i>address</i></code>


## `$FC`: <code>sound_jump <i>address</i></code>


## `$FD`: <code>sound_loop <i>count</i>, <i>address</i></code>

Execute a branch of sound commands a total of `count` times.  
`count`: Number of times to execute the loop (including the first execution) (use `0` for an infinite loop)  
`address`: Pointer to the start of the loop of sound commands


## `$FE`: <code>sound_call <i>address</i></code>

Execute a branch of sound commands, returning to the call point once a `sound_ret` command is reached.  
`address`: Pointer to the branch of sound commands to call


## `$FF`: <code>sound_ret</code>

Return to the caller (ie, `sound_call`) if in a sub branch. End the sound otherwise.
