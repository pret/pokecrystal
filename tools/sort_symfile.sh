#!/bin/sh
TEMP_FILE=$(mktemp)
sed \
    -e "s/^..:[0-3]/0_ROM0@&/g" \
    -e "s/^..:[4-7]/1_ROMX@&/g" \
    -e "s/^..:[8-9]/2_VRAM@&/g" \
    -e "s/^..:[A-B]/3_SRAM@&/g" \
    -e "s/^00:[C-D]/4_WRAM0@&/g" \
    -e "s/^..:[D-D]/5_WRAMX@&/g" \
    -e "s/^..:[F-F]/6_HRAM@&/g" \
    $1 \
| sort \
| sed -e "s/^.*@//g" > $TEMP_FILE
mv $TEMP_FILE $1
