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
    ]

    ourmacros += command_classes
    ourmacros += even_more_macros
    ourmacros += [each[1] for each in text_command_classes]
    ourmacros += movement_command_classes
    ourmacros += music_classes
    ourmacros += effect_classes

    return ourmacros

def preprocess(config, macros, lines=None):
    """
    Entry point for the preprocessor.
    """
    processor = preprocessor.Preprocessor(config, macros)
    return processor.preprocess(lines=lines)

def main():
    config = configuration.Config()
    macros = load_pokecrystal_macros()
    return preprocess(config, macros)

# only run against stdin when not included as a module
if __name__ == "__main__":
    main()
