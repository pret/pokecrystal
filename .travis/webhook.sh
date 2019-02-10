#!/bin/sh
set -e

root="$(readlink -e "$(dirname "$0")/..")"

# Report unnamed symbols
content="$("$root/tools/unnamed.py" -r "$root" "$root/pokecrystal.sym" | grep -v -e '^lib/mobile/' -e '^mobile/' | head)"

curl -H 'Content-Type: application/json' -X POST "$POKECRYSTAL_DISCORD_WEBHOOK_URL" -d@- << EOF
{
    "username": "$POKECRYSTAL_DISCORD_WEBHOOK_USERNAME",
    "avatar_url": "$POKECRYSTAL_DISCORD_WEBHOOK_AVATAR_URL",
    "content": "\`\`\`$(echo "$content" | sed -E ':a;N;$!ba;s/\r{0,1}\n/\\n/g')\`\`\`"
}
EOF
