# Pokémon Crystal ![](https://github.com/b13rg/pokecrystal/workflows/CI/badge.svg)

This is a disassembly of Pokémon Crystal.

It builds the following ROMs:

- Pokemon - Crystal Version (UE) (V1.0) [C][!].gbc
- Pokemon - Crystal Version (UE) (V1.1) [C][!].gbc
- Pokemon - Crystal Version (A) [C][!].gbc

To set up the repository, see [INSTALL.md](INSTALL.md).

## Feature List

- [x] Rematch all overworld NPC's at will
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
- [x] Pokemon have 1/512 to be shiny (Attack in [2,3,6,7,10,11,14,15], Defense in [4,5,6,7,12,13,14,15], Special = 10 and Speed in [11,15])

### Bug Fixes

- [x] HP bar lowers same speed even for high hp
- [x] Rocket execs use Team Rocket battle music, not just grunts
- [x] Default to fast text speed

## TODO List

### Features

- [ ] All 253 pokemon available
- [ ] Trade evolutions evolve by leveling
- [ ] Gain experience from catching pokemon
- [ ] Play low pitched cry when pokemon faints
- [ ] Mystery gift girl gives random berry each day
- [ ] Odd egg is always shiny
- [ ] Prof. Oaks aids give you items as you complete pokedex
- [ ] All legendaries respawn after beating elite 4
- [ ] Rematch more powerful elite 4 after earning all 16 badges
- [ ] NPC's can have shiny pokemon
- [ ] After earning 16 badges and beating elite 4, all gym leaders are more powerful
- [ ] New pokemon balls
- [ ] All fossils available
- [ ] Pokemon communication center is back in goldenrod
- [ ] Pokemon communication center contains move reminder, deleter, and seer
- [ ] Updated language (Pack → Bag, Enemy → Foe, Cooltrainer → Ace Trainer, Fisher → Fisherman,Elixer → Elixir, Pink Bow → Silk Scarf, new Berry names, etc).
- [ ] Brass Tower → Gong Tower (かね kane can mean 金 "metal" or 鉦, a gong-like bell).
- [ ] Janine's pink badge is called the Marsh Badge; Sabrina's gold badge is called the Soul 

### QoL Changes

- [ ] Light ball doubles both attach and spc. attack
- [ ] Electric pokemon immune to paralysis
- [ ] Ice type immune to freezing
- [ ] Fire type immune to burns
- [ ] Steel type immune to poison
- [ ] Hidden power is always 70% power
- [ ] Sandstorm does 1/16 per turn
- [ ] Twineedle checks for poison after each turn
- [ ] Wild pokemon have more common held items (50% for common, 5% for rare)
- [ ] Hold b to use running shoes, setting to always use them
- [ ] Unlimited use TMs
- [ ] Continious repel system
- [ ] Surf at bicycle speed
- [ ] Trees randomly give 1 2 or 3 berries
- [ ] Maximum 9,999,999 money and 50,000 coins
- [ ] Maximum 30 items and 16 balls in bag pocket
- [ ] Bill calls to switch boxes when full
- [ ] Move reminder in same house as move deleter
- [ ] Restored original japanese sprites for Beauty, Fisher, Medium, Sage, and Swimmer♀.
- [ ] Revised shiny pallete
- [ ] Color coded starter poke balls
- [ ] Stereo sound by default
- [ ] Third Trainer Card page for Kanto badges.
- [ ] Fourth stats page for capture data formerly told by the Poké Seer.
- [ ] Move stats include type, category, power, and accuracy.
- [ ] The Mineral Badge, not Storm Badge, makes Pokémon up to L70 obey, like in HG/SS.
- [ ] The Zephyr Badge lets you use traded Pokémon up to level 20, like in HG/SS.
- [ ] Flash does not require the Zephyr Badge.
- [ ] Default to Set battle style
- [ ] Level curve changes
- [ ] Fly to the Rock Tunnel/Power Plant Pokémon Center.
- [ ] Fishing works 75% of the time, not 50%.
- [ ] Nidorina and Nidoqueen can breed, and will produce eggs of either Nidoran gender.
- [ ] Always show numbers in Pokédex, even in Johto order.
- [ ] Celibi side mission is available


## Bug fixes

- [ ] Fishing returns to Cerulean Gym
- [ ] Catch rate fixes
- [ ] Expshare formula fixes
- [ ] Menu navigation speed
- [ ] Menu scrolling oversight
- [ ] Opponents full heal and full restore correctly heals nightmare and confusion





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
