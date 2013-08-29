#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys

import extras.pokemontools.preprocessor as preprocessor

from extras.pokemontools.crystal import (
    command_classes,
    Warp,
    XYTrigger,
    Signpost,
    PeopleEvent,
    DataByteWordMacro,
    ItemFragment,
    text_command_classes,
    movement_command_classes,
    music_classes,
    effect_classes,
)

even_more_macros = [
    Warp,
    XYTrigger,
    Signpost,
    PeopleEvent,
    DataByteWordMacro,
    ItemFragment,
]

macros = command_classes
macros += even_more_macros
macros += [each[1] for each in text_command_classes]
macros += movement_command_classes
macros += music_classes
macros += effect_classes

def preprocess(macros):
    """
    Entry point for the preprocessor.
    """
    return preprocessor.preprocess(macros)

# only run against stdin when not included as a module
if __name__ == "__main__":
    preprocess(macros)
