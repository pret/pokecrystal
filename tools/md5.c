#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

#include "common.h"

static const int s[64] = {
	7, 12, 17, 22,  7, 12, 17, 22,  7, 12, 17, 22,  7, 12, 17, 22,
	5,  9, 14, 20,  5,  9, 14, 20,  5,  9, 14, 20,  5,  9, 14, 20,
	4, 11, 16, 23,  4, 11, 16, 23,  4, 11, 16, 23,  4, 11, 16, 23,
	6, 10, 15, 21,  6, 10, 15, 21,  6, 10, 15, 21,  6, 10, 15, 21,
};

static const uint32_t K[64] = {
	0xd76aa478, 0xe8c7b756, 0x242070db, 0xc1bdceee,
	0xf57c0faf, 0x4787c62a, 0xa8304613, 0xfd469501,
	0x698098d8, 0x8b44f7af, 0xffff5bb1, 0x895cd7be,
	0x6b901122, 0xfd987193, 0xa679438e, 0x49b40821,
	0xf61e2562, 0xc040b340, 0x265e5a51, 0xe9b6c7aa,
	0xd62f105d, 0x02441453, 0xd8a1e681, 0xe7d3fbc8,
	0x21e1cde6, 0xc33707d6, 0xf4d50d87, 0x455a14ed,
	0xa9e3e905, 0xfcefa3f8, 0x676f02d9, 0x8d2a4c8a,
	0xfffa3942, 0x8771f681, 0x6d9d6122, 0xfde5380c,
	0xa4beea44, 0x4bdecfa9, 0xf6bb4b60, 0xbebfbc70,
	0x289b7ec6, 0xeaa127fa, 0xd4ef3085, 0x04881d05,
	0xd9d4d039, 0xe6db99e5, 0x1fa27cf8, 0xc4ac5665,
	0xf4292244, 0x432aff97, 0xab9423a7, 0xfc93a039,
	0x655b59c3, 0x8f0ccc92, 0xffeff47d, 0x85845dd1,
	0x6fa87e4f, 0xfe2ce6e0, 0xa3014314, 0x4e0811a1,
	0xf7537e82, 0xbd3af235, 0x2ad7d2bb, 0xeb86d391,
};

#define rotate_left_32(value, by) \
	((((value) << (by)) & 0xffffffff) | ((value) >> (32 - (by))))

void md5_wikipedia(uint8_t *data, int length, uint8_t *result) {

	uint8_t *message = calloc(length + 64, sizeof(uint8_t));
	memcpy(message, data, length);

	int64_t orig_bitlength = length * 8;

	message[length++] |= 1 << 7;

	while (length % 64 != (64 - 8)) {
		length++;
	}
	for (int i = 0; i < 8; i++) {
		message[length++] = (orig_bitlength >> (i * 8)) & 0xff;
	}

	int a0 = 0x67452301;
	int b0 = 0xefcdab89;
	int c0 = 0x98badcfe;
	int d0 = 0x10325476;

	for (int start = 0; start < length; start += 64) {
		uint32_t M[16];
		for (int j = 0; j < 16; j++) {
			uint8_t *word = &message[start + j * 4];
			M[j] = *word++;
			M[j] |= *word++ << 8;
			M[j] |= *word++ << 16;
			M[j] |= *word++ << 24;
		}

		int A = a0;
		int B = b0;
		int C = c0;
		int D = d0;
		for (int i = 0; i < 64; i++) {
			int F, g;
			switch (i / 16) {
			case 0:
				F = (B & C) | (~B & D);
				g = i;
				break;
			case 1:
				F = (D & B) | (~D & C);
				g = (5 * i + 1) % 16;
				break;
			case 2:
				F = B ^ C ^ D;
				g = (3 * i + 5) % 16;
				break;
			case 3:
				F = C ^ (B | ~D);
				g = (7 * i) % 16;
				break;
			}
			int e = D;
			D = C;
			C = B;
			B = B + rotate_left_32(A + F + K[i] + M[g], s[i]);
			A = e;
		}
		a0 += A;
		b0 += B;
		c0 += C;
		d0 += D;
	}

	int values[] = {a0, b0, c0, d0};
	for (int i = 0; i < 16; i++) {
		int value = values[i >> 2];
		int shift = (i % 4) * 8;
		result[i] = (value >> shift) & 0xff;
	}

	free(message);
}

int main(int argc, char *argv[]) {
	if (argc < 2) {
		exit(1);
	}
	char *infile = argv[1];
	int size;
	uint8_t *data = read_u8(infile, &size);

	uint8_t result[16];
	md5_wikipedia(data, size, result);
	for (int i = 0; i < 16; i++) {
		printf("%02x", result[i]);
	}
	printf("\n");
}
