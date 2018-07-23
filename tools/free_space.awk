#!/usr/bin/awk -f

# Usage: tools/free_space.awk pokecrystal.map

BEGIN {
	total = free = 16384 * 128
}
/^  SECTION: \$[0-7]/ {
	free -= strtonum("0x" substr($3, 3))
}
END {
	printf "Free space: %d/%d (%.2f%%)\n", free, total, free * 100 / total
}
