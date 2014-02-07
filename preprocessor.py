#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys

import extras.pokemontools.configuration as configuration
import extras.pokemontools.preprocessor as preprocessor

from extras.pokemontools.crystal import (
    command_classes,
    Warp,
    XYTrigger,
    Signpost,
    PeopleEvent,
    DataByteWordMacro,
    text_command_classes,
    movement_command_classes,
    music_classes,
    effect_classes,
    ChannelCommand,
    OctaveCommand,
)

from extras.pokemontools.audio import (
    Note,
    Noise,
    SoundCommand,
)

from extras.pokemontools.battle_animations import (
    BattleAnimWait,
    battle_animation_classes,
)

def load_pokecrystal_macros():
    """
    Construct a list of macros that are needed for pokecrystal preprocessing.
    """
    ourmacros = []

    even_more_macros = [
        Warp,
        XYTrigger,
        Signpost,
        PeopleEvent,
        DataByteWordMacro,
        ChannelCommand,
        OctaveCommand,
        Note,
        Noise,
        SoundCommand,
    ]

    ourmacros += command_classes
    ourmacros += even_more_macros
    ourmacros += [each[1] for each in text_command_classes]
    ourmacros += movement_command_classes
    ourmacros += music_classes
    ourmacros += effect_classes
    ourmacros += battle_animation_classes + [BattleAnimWait]

    return ourmacros

def setup_processor():
    config = configuration.Config()
    macros = load_pokecrystal_macros()
    processor = preprocessor.Preprocessor(config, macros)
    return processor

def main():
    processor = setup_processor()
    processor.preprocess()

# only run against stdin when not included as a module
if __name__ == "__main__":
    main()
