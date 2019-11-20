# Pokémon Crystal ![](https://github.com/b13rg/pokecrystal/workflows/CI/badge.svg)

This is a disassembly of Pokémon Crystal.

It builds the following ROMs:

- Pokemon - Crystal Version (UE) (V1.0) [C][!].gbc
- Pokemon - Crystal Version (UE) (V1.1) [C][!].gbc
- Pokemon - Crystal Version (A) [C][!].gbc

To set up the repository, see [INSTALL.md](INSTALL.md).

## Feature List

- [x] Rematch all overworld NPC's at will
- [x] Updated language
  - [x] Berry Names  
  - [x] Enemy → Foe, 
  - [x] Cooltrainer → Ace Trainer, 
  - [x] Fisher → Fisherman,
  - [x] Elixer → Elixir, 
  - [x] Pink Bow → PNK Silk Bow
  - [x] Adding back unused text in the code
- [ ] Update trainer graphics with JPN sprite
  - [x] Trainer beauty
  - [x] Trainer fisher
  - [x] Trainer medium
  - [x] Trainer swimmer_f
  - [ ] Trainer sage

### Pokemon

- [x] All baby pokemon (Pichu, Cleffa, Igglybuff, Togepi) now also evolve when they become teenagers, level 13
- [x] Traded pokemon also evolve at a level
  - [x] Kadabra Lvl. 34
  - [x] Machoke Lvl. 38
  - [x] Graveler Lvl. 35
  - [x] Haunter Lvl. 42
  - [x] Machoke Lvl. 38
- [x] Pokemon needed to be traded with an item can also use the item directly
  - [x] Poliwhirl -> Politoed Kings Rock
  - [x] Slowpoke -> Slowking Kings Rock
  - [x] Onix -> Steelix Metal Coat
  - [x] Seadra -> Kingdra Dragon Scale
  - [x] Scyther -> Scizor Metal Coat
  - [x] Porygon -> Porygon2 Upgrade
- [x] Pokemon that evolve with happiness now also have a high evolution level
  - [x] Golbat Lvl. 42
  - [x] Chansey Lvl. 45
  - [x] Eevee -> Espeon Sun Stone
  - [x] Eevee -> Umbreon Moon Stone
- [x] All evolution items are sold on Celadon Market 4f
- [x] All non-legendary pokemon available
  - [x] Johoto starters Route 29
  - [x] Kanto starters Route 1
  - [x] Mareep Routes 32, 42, 43 
  - [x] Flaaffy Routes 42, 43
  - [x] Vulpix Route 36, 7, 8
  - [x] Mankey Routes 42, 
  - [x] Girafarig Route 43
  - [x] Remoraid Route 44
  - [x] Primeape Route 9
  - [x] Omanyte Route 20
  - [x] Kabuto Route 21
  - [x] Tyrogue Route 34
- [x] Pokemon have 1/512 to be shiny (Attack in [2,3,6,7,10,11,14,15], Defense in [4,5,6,7,12,13,14,15], Special = 10 and Speed in [11,15])

### Bug Fixes

- [x] HP bar lowers same speed even for high hp
- [x] Rocket execs use Team Rocket battle music, not just grunts
- [x] Default to fast text speed
- [x] Show tops of gym leaders heads on trainer card
- [x] Remove artificial save delay

## See also

- [**FAQ**](FAQ.md)
- [**Documentation**][docs]
- [**Wiki**][wiki] (includes [tutorials][tutorials])
- **Discord:** [pret][discord]
- **IRC:** [freenode#pret][irc]

Other disassembly projects:

- [**Pokémon Red/Blue**][pokered]
- [**Pokémon Yellow**][pokeyellow]
- [**Pokémon Gold**][pokegold]
- [**Pokémon Pinball**][pokepinball]
- [**Pokémon TCG**][poketcg]
- [**Pokémon Ruby**][pokeruby]
- [**Pokémon Fire Red**][pokefirered]
- [**Pokémon Emerald**][pokeemerald]

[pokered]: https://github.com/pret/pokered
[pokeyellow]: https://github.com/pret/pokeyellow
[pokegold]: https://github.com/pret/pokegold
[pokepinball]: https://github.com/pret/pokepinball
[poketcg]: https://github.com/pret/poketcg
[pokeruby]: https://github.com/pret/pokeruby
[pokefirered]: https://github.com/pret/pokefirered
[pokeemerald]: https://github.com/pret/pokeemerald
[docs]: https://pret.github.io/pokecrystal/
[wiki]: https://github.com/pret/pokecrystal/wiki
[tutorials]: https://github.com/pret/pokecrystal/wiki/Tutorials
[discord]: https://discord.gg/6EuWgX9
[irc]: https://kiwiirc.com/client/irc.freenode.net/?#pret
[travis]: https://travis-ci.org/pret/pokecrystal
[travis-badge]: https://travis-ci.org/pret/pokecrystal.svg?branch=master
