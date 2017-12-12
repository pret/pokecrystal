# Map Scripts


## `const_value set 2`

- **`const` *`MAPNAME_PERSONNAME`***


## `MapName_MapScriptHeader:`


## `.MapTriggers: db` *N*

- **`maptrigger` *script***


## `.MapCallbacks: db` *N*

- **`dbw` *type*, *script***

Callback types:

- **`MAPCALLBACK_NEWMAP`**

- **`MAPCALLBACK_TILES`**

- **`MAPCALLBACK_OBJECTS`**

- **`MAPCALLBACK_SPRITES`**

- **`MAPCALLBACK_CMDQUEUE`**

  **`dbw CMDQUEUE_STONETABLE,` *table_pointer***
  
  **`stonetable` *warp_id*, *person*, *script***
  
  **`db -1 ; end`**


## Event scripts

[Event commands](event_commands.md)


## Text

[Text commands](text_commands.md)


## Movement data

[Movement commands](movement_commands.md)


## `MapName_MapEventHeader:`

	; filler
	db 0, 0


## `.Warps: db` *N*

- **`warp_def` *y*, *x*, *warp_id*, *map***


## `.XYTriggers: db` *N*

- **`xy_trigger` *id*, *y*, *x*, `$0`, *script*, `$0`, `$0`**


## `.Signposts: db` *N*

- `signpost` *y*, *x*, *type*, *script***

Signpost types:

- **`SIGNPOST_READ`**

- **`SIGNPOST_UP/DOWN/LEFT/RIGHT`**

- **`SIGNPOST_IFSET/IFNOTSET`**

  **`dw` *event_flag*, *script***

- **`SIGNPOST_ITEM`**

  **`dwb` *event_flag*, *item_id***

- **`SIGNPOST_COPY`**

## `.PersonEvents: db` *N*

- **`person_event` *sprite*, *y*, *x*, *movement*, *ry*, *rx*, *hour*, *daytime*, *palette*, *type*, *range*, *script*, *event_flag***

Movement types:

- **`SPRITEMOVEDATA_ITEM_TREE`**

- **`SPRITEMOVEDATA_WANDER`**

- **`SPRITEMOVEDATA_SPINRANDOM_SLOW`**

- **`SPRITEMOVEDATA_WALK_UP_DOWN`**

- **`SPRITEMOVEDATA_WALK_LEFT_RIGHT`**

- **`SPRITEMOVEDATA_STANDING_UP/DOWN/LEFT/RIGHT`**

- **`SPRITEMOVEDATA_SPINRANDOM_FAST`**

- **`SPRITEMOVEDATA_SNORLAX`**

- **`SPRITEMOVEDATA_POKEMON`**

- **`SPRITEMOVEDATA_SUDOWOODO`**

- **`SPRITEMOVEDATA_SMASHABLE_ROCK`**

- **`SPRITEMOVEDATA_STRENGTH_BOULDER`**

- **`SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE`**

- **`SPRITEMOVEDATA_SPINCLOCKWISE`**

- **`SPRITEMOVEDATA_BIGDOLL`**

- **`SPRITEMOVEDATA_LAPRAS`**

Person types:

- **`PERSONTYPE_SCRIPT`**

- **`PERSONTYPE_ITEMBALL`**

  **`itemball` *item_id***

- **`PERSONTYPE_TRAINER`**

  **`trainer` *event_flag*, *group_id*, *trainer_id*, *seen_text*, *beaten_text*, *loss_text*, *script***
