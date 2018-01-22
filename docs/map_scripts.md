# Map Scripts


## <code>const_value set 2</code>

<pre>
	const <i>MAPNAME</i>_<i>OBJECTNAME</i>
</pre>


## <code>MapName_MapScripts:</code>


### <code>.SceneScripts: db <i>N</i></code>

<pre>
	scene_script <i>script</i>
</pre>


### <code>.MapCallbacks: db <i>N</i></code>

<pre>
	callback <i>type</i>, <i>script</i>
</pre>

Callback types:

- `MAPCALLBACK_NEWMAP`

- `MAPCALLBACK_TILES`

- `MAPCALLBACK_OBJECTS`

- `MAPCALLBACK_SPRITES`

- `MAPCALLBACK_CMDQUEUE`

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


## <code>MapName_MapEvents:</code>

```asm
	; filler
	db 0, 0
```


### <code>.Warps: db <i>N</i></code>

<pre>
	warp_def <i>x</i>, <i>y</i>, <i>warp_id</i>, <i>map</i>
</pre>


### <code>.CoordEvents: db <i>N</i></code>

<pre>
	coord_event <i>x</i>, <i>y</i>, <i>scene_id</i>, <i>script</i>
</pre>


### <code>.BGEvents: db <i>N</i></code>

<pre>
	bg_event <i>x</i>, <i>y</i>, <i>type</i>, <i>script</i>
</pre>

BG event types:

- `BGEVENT_READ`

- `BGEVENT_UP/DOWN/LEFT/RIGHT`

- `BGEVENT_IFSET/IFNOTSET`

<pre>
	conditional_event <i>event_flag</i>, <i>script</i>
</pre>

- `BGEVENT_ITEM`

<pre>
	hiddenitem <i>event_flag</i>, <i>item_id</i>
</pre>

- `BGEVENT_COPY`

### <code>.ObjectEvents: db <i>N</i></code>

<pre>
	object_event <i>x</i>, <i>y</i>, <i>sprite</i>, <i>movement</i>, <i>rx</i>, <i>ry</i>, <i>h1</i>, <i>h2</i>, <i>palette</i>, <i>type</i>, <i>range</i>, <i>script</i>, <i>event_flag</i>
</pre>

Movement types:

- `SPRITEMOVEDATA_ITEM_TREE`

- `SPRITEMOVEDATA_WANDER`

- `SPRITEMOVEDATA_SPINRANDOM_SLOW`

- `SPRITEMOVEDATA_WALK_UP_DOWN`

- `SPRITEMOVEDATA_WALK_LEFT_RIGHT`

- `SPRITEMOVEDATA_STANDING_UP/DOWN/LEFT/RIGHT`

- `SPRITEMOVEDATA_SPINRANDOM_FAST`

- `SPRITEMOVEDATA_SNORLAX`

- `SPRITEMOVEDATA_POKEMON`

- `SPRITEMOVEDATA_SUDOWOODO`

- `SPRITEMOVEDATA_SMASHABLE_ROCK`

- `SPRITEMOVEDATA_STRENGTH_BOULDER`

- `SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE`

- `SPRITEMOVEDATA_SPINCLOCKWISE`

- `SPRITEMOVEDATA_BIGDOLL`

- `SPRITEMOVEDATA_LAPRAS`

Object types:

- `OBJECTTYPE_SCRIPT`

- `OBJECTTYPE_ITEMBALL`

<pre>
	itemball <i>item_id</i>
</pre>

- `OBJECTTYPE_TRAINER`

<pre>
	trainer <i>event_flag</i>, <i>group_id</i>, <i>trainer_id</i>, <i>seen_text</i>, <i>beaten_text</i>, <i>loss_text</i>, <i>script</i>
</pre>
