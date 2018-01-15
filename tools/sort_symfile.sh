#!/bin/sh
sed $1 \
    -e "s/^..:[0-3]/0_ROM0@&/g" \
    -e "s/^..:[4-7]/1_ROMX@&/g" \
    -e "s/^..:[8-9]/2_VRAM@&/g" \
    -e "s/^..:[A-B]/3_SRAM@&/g" \
    -e "s/^00:[C-D]/4_WRAM0@&/g" \
    -e "s/^..:[D-D]/5_WRAMX@&/g" \
| sort -o $1
sed -i $1 -e "s/^\w*@//g"
