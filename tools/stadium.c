#define PROGRAM_NAME "stadium"
#define USAGE_OPTS "[-h|--help] [-e|--european] pokecrystal.gbc"

#include "common.h"

void parse_args(int argc, char *argv[], bool *european) {
	struct option long_options[] = {
		{"european", no_argument, 0, 'e'},
		{"help", no_argument, 0, 'h'},
		{0}
	};
	for (int opt; (opt = getopt_long(argc, argv, "eh", long_options)) != -1;) {
		switch (opt) {
		case 'e':
			*european = true;
			break;
		case 'h':
			usage_exit(0);
			break;
		default:
			usage_exit(1);
		}
	}
}

// A matching ROM has 128 banks
#define NUMBANKS 128
// ROM banks are $4000 bytes
#define BANKSIZE 0x4000
// A matching ROM is $200000 bytes
#define ROMSIZE (NUMBANKS * BANKSIZE)

// The Game Boy cartridge header stores a global checksum at 0x014E-0x014F
#define GLOBALOFF 0x014E

// ASCII "base" header (Crystal only)
#define BASE10SIZE 6
uint8_t base10[BASE10SIZE] = {'b', 'a', 's', 'e', 1, 0};
// "base" + 2-byte version + 2-byte CRC
#define BASEHEADERSIZE (BASE10SIZE + 2)
// "base" + 2-byte version + 2-byte CRC + per-bank bit flags
#define BASEDATASIZE (BASEHEADERSIZE + NUMBANKS / 8)
// The base data is stored before the Stadium data
#define BASEDATAOFF (N64PS3DATAOFF - BASEDATASIZE)

// ASCII "N64PS3" header (Stadium G/S was the third Japanese Stadium release for N64)
#define N64PS3SIZE 6
uint8_t n64ps3[N64PS3SIZE] = {'N', '6', '4', 'P', 'S', '3'};
// "N64PS3" + 2-byte CRC
#define N64PS3HEADERSIZE (N64PS3SIZE + 2)
// "N64PS3" + 2-byte CRC + per-half-bank 2-byte checksums
#define N64PS3DATASIZE (N64PS3HEADERSIZE + NUMBANKS * 2 * 2)
// The Stadium data is stored at the end of the ROM
#define N64PS3DATAOFF (ROMSIZE - N64PS3DATASIZE)

// The CRC polynomial value
#define CRC_POLY 0xC387
// The CRC initial value (also used for checksums)
#define CRC_INIT 0xFEFE
// The CRC initial value for Crystal base data
#define CRC_INIT_BASE 0xACDE
// The CRC lookup table
uint16_t crc_table[256];

#define SET_U16BE(file, off, v) do { \
	file[(off) + 0] = (uint8_t)(((v) & 0xFF00) >> 8); \
	file[(off) + 1] = (uint8_t)(((v) & 0x00FF) >> 0); \
} while (0)

// CRCs of every bank in the base ROM, crystal_base0.bin
uint16_t base0_crcs[NUMBANKS] = {
	0x9650, 0x8039, 0x2D8F, 0xD75A, 0xAC50, 0x5D55, 0xE94B, 0x9886,
	0x2A46, 0xB5AC, 0xC3D3, 0x79C4, 0xCE55, 0xA95E, 0xEF78, 0x9B50,
	0x82BA, 0x8716, 0x5895, 0xAD33, 0x4EF0, 0xE434, 0xC521, 0xBFB1,
	0xB352, 0xA497, 0xCA84, 0xD3F5, 0x3C79, 0xB61A, 0xAE1B, 0xF314,
	0x00B3, 0x7C0A, 0x1018, 0x7F6B, 0x1CFF, 0x15AF, 0x4078, 0xE473,
	0x081C, 0x4B9D, 0x2FFC, 0xD9D0, 0x2CBA, 0xCD8C, 0x004C, 0x773C,
	0xF040, 0x3585, 0xF924, 0x6FD5, 0xC5E4, 0xD918, 0x1228, 0x1C86,
	0x21C0, 0x77F3, 0x6206, 0x0110, 0x152F, 0x0F74, 0xCEDF, 0xBBFE,
	0xE382, 0x5C15, 0xFD4D, 0x954C, 0xD2D9, 0xCA2F, 0x14B1, 0x9D2F,
	0x172C, 0xEA0C, 0x4EAD, 0x604B, 0x0659, 0xF4C5, 0x4168, 0xD151,
	0x58C7, 0x99BF, 0x77D3, 0xCDEC, 0x61B5, 0x1A48, 0xD614, 0x7FB0,
	0x91D5, 0x812A, 0x812A, 0x82B2, 0xDCE2, 0x9067, 0x6DB3, 0x3DC7,
	0xDCB8, 0xA1CE, 0x9C21, 0x4A23, 0xB50F, 0x63E6, 0xE78A, 0x9238,
	0x644D, 0x1BD6, 0xB5B6, 0x1AB9, 0x9D07, 0xC849, 0x6992, 0x10CA,
	0x4453, 0xA3A1, 0x5A18, 0xAFE0, 0x7F2B, 0xFC38, 0xFC38, 0xBA98,
	0x5AEB, 0xFC38, 0xFC38, 0xFC38, 0xFC38, 0xEFAD, 0x6D83, 0xFC38
};

// CRCs of every bank in the European base ROM, crystal_base1.bin
uint16_t base1_crcs[NUMBANKS] = {
	0x5416, 0xFD37, 0xC4A4, 0xBC37, 0x9458, 0xB489, 0xE94B, 0x9906,
	0x2A46, 0xDEA9, 0x17F4, 0xF447, 0xCE55, 0xD843, 0xC5B2, 0xAE13,
	0x4E91, 0x3984, 0xD984, 0xD02F, 0x77B8, 0x4D8D, 0x1F8C, 0x7185,
	0xBA34, 0xA497, 0xE813, 0xFF97, 0x245E, 0xB61A, 0xCEF0, 0x8BF4,
	0xA786, 0x4CE5, 0xA9B8, 0x1988, 0xEF53, 0x2A24, 0x4588, 0x6084,
	0x2609, 0x4B9D, 0x8C33, 0xD9D0, 0x2CBA, 0xCD8C, 0xDA4F, 0xE020,
	0xF040, 0x3585, 0x2B21, 0xAEEA, 0xC5E4, 0xD918, 0x1228, 0x1C86,
	0x78B3, 0xF4B1, 0x7577, 0x0110, 0x152F, 0x0F74, 0xCCDD, 0x3444,
	0x58A8, 0x1FB0, 0xDACE, 0x954C, 0xD2D9, 0xF7CB, 0xEE99, 0xA5F0,
	0x172C, 0xEA0C, 0x4EAD, 0x604B, 0x0659, 0xF4C5, 0x4168, 0xD151,
	0x58C7, 0x99BF, 0x77D3, 0xCDEC, 0x61B5, 0x1A48, 0xD614, 0x7FB0,
	0x91D5, 0x812A, 0x812A, 0x82B2, 0x5C2C, 0x91E6, 0x79C5, 0xF2BF,
	0xDCB8, 0xA1CE, 0x9C21, 0x579B, 0x4B59, 0x21F5, 0xB2B6, 0x58AD,
	0xC91D, 0xB96F, 0x4DCE, 0xBA03, 0x9D07, 0x7A7E, 0xC77E, 0xB8AA,
	0xF7E4, 0xA7A4, 0x22E8, 0xAFE0, 0xE0C8, 0xFC38, 0xFC38, 0x2277,
	0x5AEB, 0xFC38, 0xFC38, 0x4314, 0x25B0, 0xCE7B, 0x12FA, 0xDD05
};

uint16_t calculate_checksum(uint16_t checksum, uint8_t *file, int size) {
	for (int i = 0; i < size; i++) {
		checksum += file[i];
	}
	return checksum;
}

uint16_t calculate_crc(uint16_t crc, uint8_t *file, int size) {
	for (int i = 0; i < size; i++) {
		crc = (crc >> 8) ^ crc_table[(crc & 0xFF) ^ file[i]];
	}
	return crc;
}

void calculate_checksums(uint8_t *file, bool european) {
	// Initialize the CRC table
	for (int i = 0; i < 256; i++) {
		uint16_t c = i;
		uint16_t rem = 0;
		for (int y = 0; y < 8; y++) {
			rem = (rem >> 1) ^ ((rem ^ c) & 1 ? CRC_POLY : 0);
			c >>= 1;
		}
		crc_table[i] = rem;
	}

	// Clear the global checksum
	SET_U16BE(file, GLOBALOFF, 0);

	// Initialize the base data (this should be free space anyway)
	memset(file + BASEDATAOFF, 0, BASEDATASIZE);
	memcpy(file + BASEDATAOFF, base10, BASE10SIZE);

	// Use the appropriate base CRCs
	uint16_t *base_crcs = base0_crcs;
	if (european) {
		base_crcs = base1_crcs;
		file[BASEDATAOFF + BASE10SIZE - 1] = 1;
	}

	// Calculate the base data bits using bank CRCs
	// Bits indicate if the bank CRC matches the base one
	for (int i = 0; i < BASEDATASIZE - BASEHEADERSIZE; i++) {
		uint8_t bits = 0;
		for (int j = 0; j < 8; j++) {
			int bank = i * 8 + j;
			uint16_t crc = calculate_crc(CRC_INIT, file + bank * BANKSIZE, BANKSIZE);
			bits |= (crc == base_crcs[bank]) << j;
		}
		file[BASEDATAOFF + BASEHEADERSIZE + i] = bits;
	}

	// Calculate the CRC of the base data
	uint16_t crc = calculate_crc(CRC_INIT_BASE, file + BASEDATAOFF, BASEDATASIZE);
	SET_U16BE(file, BASEDATAOFF + BASEHEADERSIZE - 2, crc);

	// Initialize the Stadium data (this should be free space anyway)
	memset(file + N64PS3DATAOFF, 0, N64PS3DATASIZE);
	memcpy(file + N64PS3DATAOFF, n64ps3, N64PS3SIZE);

	// Calculate the half-bank checksums
	for (int i = 0; i < NUMBANKS * 2; i++) {
		uint16_t checksum = calculate_checksum(CRC_INIT, file + i * BANKSIZE / 2, BANKSIZE / 2);
		SET_U16BE(file, N64PS3DATAOFF + N64PS3HEADERSIZE + i * 2, checksum);
	}

	// Calculate the CRC of the half-bank checksums
	crc = calculate_crc(CRC_INIT, file + N64PS3DATAOFF + N64PS3HEADERSIZE, N64PS3DATASIZE - N64PS3HEADERSIZE);
	SET_U16BE(file, N64PS3DATAOFF + N64PS3HEADERSIZE - 2, crc);

	// Calculate the global checksum
	uint16_t globalsum = calculate_checksum(0, file, ROMSIZE);
	SET_U16BE(file, GLOBALOFF, globalsum);
}

int main(int argc, char *argv[]) {
	bool european = false;
	parse_args(argc, argv, &european);

	argc -= optind;
	argv += optind;
	if (argc < 1) {
		usage_exit(1);
	}

	char *filename = argv[0];
	long filesize;
	uint8_t *file = read_u8(filename, &filesize);
	if (filesize == ROMSIZE) {
		calculate_checksums(file, european);
	}
	write_u8(filename, file, filesize);
	return 0;
}
