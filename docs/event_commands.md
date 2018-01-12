# Event Commands

Defined in [macros/scripts/events.asm](/macros/scripts/events.asm) and [engine/scripting.asm:ScriptCommandTable](/engine/scripting.asm).


## `$00`: `scall` *script*

## `$01`: `farscall` *script*

## `$02`: `ptcall` *script*

## `$03`: `jump` *script*

## `$04`: `farjump` *script*

## `$05`: `ptjump` *script*

## `$06`: `if_equal` *byte*, *script*

## `$07`: `if_not_equal` *byte*, *script*

## `$08`: `iffalse` *script*

## `$09`: `iftrue` *script*

## `$0A`: `if_greater_than` *byte*, *script*

## `$0B`: `if_less_than` *byte*, *script*

## `$0C`: `jumpstd` *std_script*

## `$0D`: `callstd` *std_script*

## `$0E`: `callasm` *asm*

## `$0F`: `special` *special_pointer*

## `$10`: `ptcallasm` *asm*

## `$11`: `checkmapscene` *map*

## `$12`: `setmapscene` *map*, *scene_id*

## `$13`: `checkscene`

## `$14`: `setscene` *scene_id*

## `$15`: `writebyte` *value*

## `$16`: `addvar` *value*

## `$17`: `random` *value*

## `$18`: `checkver`

## `$19`: `copybytetovar` *address*

## `$1A`: `copyvartobyte` *address*

## `$1B`: `loadvar` *address*, *value*

## `$1C`: `checkcode` *variable*

## `$1D`: `writevarcode` *variable*

## `$1E`: `writecode` *variable*, *value*

## `$1F`: `giveitem` *item_id*[, *quantity*=1]

## `$20`: `takeitem` *item_id*[, *quantity*=1]

## `$21`: `checkitem` *item_id*

## `$22`: `givemoney` *account*, *value*

## `$23`: `takemoney` *account*, *value*

## `$24`: `checkmoney` *account*, *value*

## `$25`: `givecoins` *value*

## `$26`: `takecoins` *value*

## `$27`: `checkcoins` *value*

## `$28`: `addcellnum` *contact_id*

## `$29`: `delcellnum` *contact_id*

## `$2A`: `checkcellnum` *contact_id*

## `$2B`: `checktime` *time*

- **`checkmorn`:** `checktime MORN`
- **`checkday`:** `checktime DAY`
- **`checknite`:** `checktime NITE`

## `$2C`: `checkpoke` *mon_id*

## `$2D`: `givepoke` *mon_id*, *level*[, *item*=0[, *trainer*=0, *ot_name*, *nickname*]]

## `$2E`: `giveegg` *mon_id*, *level*

## `$2F`: `givepokeitem` *pointer*

## `$30`: `checkpokeitem` *pointer*

## `$31`: `checkevent` *event_flag*

## `$32`: `clearevent` *event_flag*

## `$33`: `setevent` *event_flag*

## `$34`: `checkflag` *engine_flag*

## `$35`: `clearflag` *engine_flag*

## `$36`: `setflag` *engine_flag*

## `$37`: `wildon`

## `$38`: `wildoff`

## `$39`: `xycompare` *pointer*

## `$3A`: `warpmod` *warp_id*, *map*

## `$3B`: `blackoutmod` *map*

## `$3C`: `warp` *map*, *x*, *y*

## `$3D`: `readmoney` *account*, *memory*

## `$3E`: `readcoins` *memory*

## `$3F`: `vartomem` *memory*

## `$40`: `pokenamemem` *mon_id*, *memory*

## `$41`: `itemtotext` *item_id*, *memory*

## `$42`: `mapnametotext` *memory*

## `$43`: `trainertotext` *trainer_id*, *trainer_group*, *memory*

## `$44`: `stringtotext` *text_pointer*, *memory*

## `$45`: `itemnotify`

## `$46`: `pocketisfull`

## `$47`: `opentext`

## `$48`: `refreshscreen` [*dummy*=0]

## `$49`: `closetext`

## `$4A`: `loadbytec2cf` *byte*

## `$4B`: `farwritetext` *text_pointer*

## `$4C`: `writetext` *text_pointer*

## `$4D`: `repeattext` *byte1*, *byte2*

## `$4E`: `yesorno`

## `$4F`: `loadmenudata` *data_pointer*

## `$50`: `closewindow`

## `$51`: `jumptextfaceplayer` *text_pointer*

## `$52`: `farjumptext` *text_pointer*

## `$53`: `jumptext` *text_pointer*

## `$54`: `waitbutton`

## `$55`: `buttonsound`

## `$56`: `pokepic` *mon_id*

## `$57`: `closepokepic`

## `$58`: `_2dmenu`

## `$59`: `verticalmenu`

## `$5A`: `loadpikachudata`

## `$5B`: `randomwildmon`

## `$5C`: `loadmemtrainer`

## `$5D`: `loadwildmon` *mon_id*, *level*

## `$5E`: `loadtrainer` *trainer_group*, *trainer_id*

## `$5F`: `startbattle`

## `$60`: `reloadmapafterbattle`

## `$61`: `catchtutorial` *byte*

## `$62`: `trainertext` *which_text*

## `$63`: `trainerflagaction` *action*

## `$64`: `winlosstext` *win_text_pointer*, *loss_text_pointer*

## `$65`: `scripttalkafter`

## `$66`: `end_if_just_battled`

## `$67`: `check_just_battled`

## `$68`: `setlasttalked` *object_id*

## `$69`: `applymovement` *object_id*, *data_pointer*

## `$6A`: `applymovement2` *data_pointer*

## `$6B`: `faceplayer`

## `$6C`: `faceobject` *object1*, *object2*

## `$6D`: `variablesprite` *variable_sprite_id*, *sprite_id*

## `$6E`: `disappear` *object_id*

## `$6F`: `appear` *object_id*

## `$70`: `follow` *object2*, *object1*

## `$71`: `stopfollow`

## `$72`: `moveobject` *object_id*, *x*, *y*

## `$73`: `writeobjectxy` *object_id*

## `$74`: `loademote` *emote_id*

## `$75`: `showemote` *emote_id*, *object_id*, *length*

## `$76`: `spriteface` *object_id*, *facing*

## `$77`: `follownotexact` *object2*, *object1*

## `$78`: `earthquake` *param*

## `$79`: `changemap` *bank*, *blockdata_pointer*

## `$7A`: `changeblock` *x*, *y*, *block*

## `$7B`: `reloadmap`

## `$7C`: `reloadmappart`

## `$7D`: `writecmdqueue` *queue_pointer*

## `$7E`: `delcmdqueue` *byte*

## `$7F`: `playmusic` *music_id*

## `$80`: `encountermusic`

## `$81`: `musicfadeout` *music_id*, *length*

## `$82`: `playmapmusic`

## `$83`: `dontrestartmapmusic`

## `$84`: `cry` *mon_id*

## `$85`: `playsound` *sfx_id*

## `$86`: `waitsfx`

## `$87`: `warpsound`

## `$88`: `specialsound`

## `$89`: `passtoengine` *data_pointer*

## `$8A`: `newloadmap` *which_method*

## `$8B`: `pause` *length*

## `$8C`: `deactivatefacing` *length*

## `$8D`: `priorityjump` *script*

## `$8E`: `warpcheck`

## `$8F`: `ptpriorityjump` *script*

## `$90`: `return`

## `$91`: `end`

## `$92`: `reloadandreturn` *which_method*

## `$93`: `end_all`

## `$94`: `pokemart` *dialog_id*, *mart_id*

## `$95`: `elevator` *floor_list*

## `$96`: `trade` *trade_id*

## `$97`: `askforphonenumber` *contact_id*

## `$98`: `phonecall` *call_id*

## `$99`: `hangup`

## `$9A`: `describedecoration` *byte*

## `$9B`: `fruittree` *tree_id*

## `$9C`: `specialphonecall` *call_id*

## `$9D`: `checkphonecall`

## `$9E`: `verbosegiveitem` *item_id*[, *quantity*=1]

## `$9F`: `verbosegiveitem2` *item_id*, *variable*

## `$A0`: `swarm` *swarm_id*, *map*

## `$A1`: `halloffame`

## `$A2`: `credits`

## `$A3`: `warpfacing` *facing*, *map*, *x*, *y*

## `$A4`: `battletowertext` *memory*

## `$A5`: `landmarktotext` *landmark_id*, *memory*

## `$A6`: `trainerclassname` *trainer_group*, *memory*

## `$A7`: `name` *type*, *id*, *memory*

## `$A8`: `wait` *duration*

## `$A9`: `check_save`
