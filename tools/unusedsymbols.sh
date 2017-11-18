#!/bin/sh
set -e

# Generate the file with ignored labels
rm -f unused_ignore.txt

# Scrape labels from a few select files
sed -n -e '/^Prefectures:$/,/^$/s/^\([A-z]*\):.*/\1/p' misc/mobile_12.asm | grep -xv Prefectures >> unused_ignore.txt
sed -n -e 's/^\(BattleTowerMons[0-9][0-9]*\):$/\1/p' data/battle_tower.asm >> unused_ignore.txt
sed -n -e 's/^\(BattleTowerTrainer[0-9][0-9]*DataTable\):$/\1/p' data/battle_tower_2.asm >> unused_ignore.txt
sed -n -e 's/^\(IncGradGBPalTable_[0-9][0-9]\)::.*/\1/p' home/fade.asm >> unused_ignore.txt
sed -n -e 's/^\([A-Za-z]*Menu\):.*/\1/p' engine/main_menu.asm | grep -xv MainMenu >> unused_ignore.txt
sed -n -e 's/^\([A-z0-9]*CryHeader\):.*/\1/p' -e 's/^\(CryHeader[0-9][0-9]*\):.*/\1/p' audio/cry_headers.asm >> unused_ignore.txt
sed -n -e 's/^\([A-z0-9]*Palette\):.*/\1/p' gfx/pics/palette_pointers.asm gfx/trainers/palette_pointers.asm >> unused_ignore.txt
sed -n -e 's/^\([A-z0-9]*Sprite\):.*/\1/p' gfx/overworld/sprite_headers.asm >> unused_ignore.txt
sed -n -e 's/^\tmap_header \([A-z0-9]*\),.*/\1_MapHeader/p' maps/map_headers.asm >> unused_ignore.txt

# Add more labels manually
cat >> unused_ignore.txt << EOF
BattleTowerTrainerDataEnd
BoxNameInputUpper
CheckPlayerTurn
ClearScreenArea
Coord2Attr
Cry_Teddiursa_branch_f3286
Cry_Teddiursa_branch_f328e
Cry_Teddiursa_branch_f3296
Cry_Teddiursa_branch_f32a2
Cry_Teddiursa_branch_f32ae
DrawHP
FacingsEnd
FemalePlayerNameArray
Function118125
Function24f19
Function4a3aa
Function4aa34
GetDamageStats
GetIcon
InterpretTwoOptionMenu
LeerCorreosIngleses
LeggiPostaInglese
LireLeCourrierAnglais
MalePlayerNameArray
NamingScreen_AdvanceCursor_CheckEndOfString
NamingScreen_LoadNextCharacter
SGBBorderPalettes
SetSeenMon
Sfx_GetEggFromDaycareMan_Ch5
Sfx_GetEggFromDaycareMan_Ch6
Sfx_GetEggFromDaycareMan_Ch7
Sfx_GetEggFromDaycareMan_Ch8
Sfx_LevelUp_Ch5
Sfx_LevelUp_Ch6
Sfx_LevelUp_Ch7
Sfx_LevelUp_Ch8
Sfx_NoSignal_branch_f26ff
Sfx_ReadText_Ch5
Sfx_Unknown5F_Ch8
Sfx_Unknown5F_branch_f270e
StatsScreenPageTilesGFX_Part2
TeruSama
UnknownMoveDescription
UnknownScript_0x58f6e
WaitDMATransfer
_CalcHoursDaysSince
asm_118e3e
EOF

# Create objects with all the labels exported
# Excluding wram.o since that includes a lot of labels we aren't interested in.
objs=$(make -n -p | grep '^crystal_obj :=' | sed -e 's/^crystal_obj := //' -e 's/wram.o //')
rm -f $objs
make RGBASM='rgbasm -E' $objs

# Run the program to generate a list of unreferenced labels
# All the local labels (the ones contain a '.') are filtered out, as well as the labels in unused_ignore.txt
python3 -u tools/unusedsymbols.py $objs \
	| sed -u -e '/\..*$/d' \
	| grep --line-buffered -xvf unused_ignore.txt \
	| tee unused.txt

# Clean it up so a regular make won't mess up for the user
rm -f $objs

# Try to filter out any label referenced through a 'jr'
# This is a hack, and kind of sensitive to whatever files the user might have.
# Make sure to look through the unused.txt as well, since that's much more accurate.
rm -f unused_nojr.txt
for x in $(cat unused.txt); do
	if ! grep -rwh --include='*.asm' --exclude-dir=docs --exclude-dir=env $x | grep '^	jr' | grep -v ' \.'; then
		echo $x >> unused_nojr.txt
	fi
done
