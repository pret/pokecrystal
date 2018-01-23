#!/usr/bin/awk -nf

BEGIN {
	total = free = 0x4000 * 128
}
/^  SECTION: \$[0-7]/ {
	free -= sprintf("%d", "0x" substr($3, 3))
}
END {
	printf("Free space: %d/%d (%.2f%%)\n", free, total, free*100.0/total)
}
