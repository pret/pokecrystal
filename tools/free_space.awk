#!/usr/bin/awk -f

# Usage: tools/free_space.awk pokecrystal.map

BEGIN {
	total = free = 16384 * 128
}
/^  SECTION: \$[0-7]/ {
	free -= strtonum("0x" substr($3, 3))
}
END {
	percent = free * 100.0 / total
	printf("Free space: %d/%d (%.2f%%)\n", free, total, percent)
}
