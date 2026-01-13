# Pokémon Modern Crystal

A quality-of-life focused ROM hack of Pokémon Crystal with built-in randomization options and challenge mode features for increased replayability.

Inspired by [Modern Emerald](https://github.com/resetes12/pokeemerald), this hack aims to enable challenge runs with a nice array of configurable options while keeping the game mostly vanilla.

## Features

### New Game Options Menu
When starting a new game, you can now configure:

- **Wild Encounters** - Standard or Randomized
- **Starters** - Standard (Chikorita/Cyndaquil/Totodile) or Randomized
- **Trainer Battles** - Standard or Randomized (preserves levels)
- **TM Mode** - Standard (consumable) or Unlimited use
- **Poison Survival** - Standard (can faint) or Safe (stops at 1 HP with "poison faded" message)

### Quality of Life Improvements

- **Always walk at bike speed** - No need to constantly use the bike in towns
- **Shorter Nurse Joy interactions** - Faster Pokémon Center healing
- **Smarter Mom dialogue** - No more phone tutorials if you say you know how to use it
- **Modern shiny odds** - Shiny Pokémon now appear at 1 in 4096 odds (matching Generation VI+) instead of the original 1 in 8192
  - *Note*: Due to Gen II's DV-based gender system, shiny starters have a 50% chance of being female instead of the normal 12.5%

## Planned Features

The following features are planned for future releases:

- Nuzlocke mode rules enforcement
- Randomized items and held items
- Randomized nicknames
- Randomized cries
- Randomized movesets and learnsets
- Buy all TMs (possibly expensive)
- No-heal Pokémon Center challenge mode
- Access PC from phone
- Proper sprint button (instead of always walking at bike speed)
- Enhanced Pokédex with movesets and learnsets
- Improved FIGHT menu
- Improved MOVE menu

## Building

To set up the repository and build the ROM, see [INSTALL.md](INSTALL.md).


## See also

- [**FAQ**](FAQ.md)
- [**Documentation**][docs]
- [**Wiki**][wiki] (includes [tutorials][tutorials])
- [**Symbols**][symbols]
- [**Tools**][tools]

You can find us on [Discord (pret, #pokecrystal)](https://discord.gg/d5dubZ3).

For other pret projects, see [pret.github.io](https://pret.github.io/).

[docs]: https://pret.github.io/pokecrystal/
[wiki]: https://github.com/pret/pokecrystal/wiki
[tutorials]: https://github.com/pret/pokecrystal/wiki/Tutorials
[symbols]: https://github.com/pret/pokecrystal/tree/symbols
[tools]: https://github.com/pret/gb-asm-tools
[ci]: https://github.com/pret/pokecrystal/actions
[ci-badge]: https://github.com/pret/pokecrystal/actions/workflows/main.yml/badge.svg
