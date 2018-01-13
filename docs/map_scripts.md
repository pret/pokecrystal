# Map Scripts


## `const_value set 2`

- **`const` *`MAPNAME_OBJECTNAME`***


## `MapName_MapScriptHeader:`


## `.SceneScripts: db` *N*

- **`scene_script` *script***


## `.MapCallbacks: db` *N*

- **`callback` *type*, *script***

Callback types:

- **`MAPCALLBACK_NEWMAP`**

- **`MAPCALLBACK_TILES`**

- **`MAPCALLBACK_OBJECTS`**

- **`MAPCALLBACK_SPRITES`**

- **`MAPCALLBACK_CMDQUEUE`**

<!-- need pre tags here; can't use inline bold/italic formatting in Markdown code blocks -->
<pre>
	callback MAPCALLBACK_CMDQUEUE, .Boulders

.Boulders:
	writecmdqueue .BoulderCmdQueue
	return

.BoulderCmdQueue:
	cmdqueue CMDQUEUE_STONETABLE, .BoulderTable

.BoulderTable:
	stonetable <i>warp_id</i>, <i>person</i>, <i>script</i>
	db -1 ; end
</pre>


## Event scripts

[Event commands](event_commands.md)


## Text

[Text commands](text_commands.md)


## Movement data

[Movement commands](movement_commands.md)


## `MapName_MapEventHeader:`

```asm
	; filler
	db 0, 0
```


## `.Warps: db` *N*

- **`warp_def` *x*, *y*, *warp_id*, *map***


## `.CoordEvents: db` *N*

- **`coord_event` *x*, *y*, *scene_id*, *script***


## `.BGEvents: db` *N*

- **`bg_event` *x*, *y*, *type*, *script***

BG event types:

- **`BGEVENT_READ`**

- **`BGEVENT_UP/DOWN/LEFT/RIGHT`**

- **`BGEVENT_IFSET/IFNOTSET`**

  **`conditional_event` *event_flag*, *script***

- **`BGEVENT_ITEM`**

  **`hiddenitem` *event_flag*, *item_id***

- **`BGEVENT_COPY`**

## `.ObjectEvents: db` *N*

- **`object_event` *x*, *y*, *sprite*, *movement*, *rx*, *ry*, *h1*, *h2*, *palette*, *type*, *range*, *script*, *event_flag***

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

Object types:

- **`OBJECTTYPE_SCRIPT`**

- **`OBJECTTYPE_ITEMBALL`**

  **`itemball` *item_id***

- **`OBJECTTYPE_TRAINER`**

  **`trainer` *event_flag*, *group_id*, *trainer_id*, *seen_text*, *beaten_text*, *loss_text*, *script***
