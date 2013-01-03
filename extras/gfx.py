# -*- coding: utf-8 -*-

import os
import sys
import errno
import string
from copy import copy, deepcopy
import random
import argparse
from math import sqrt, floor, ceil
from datetime import datetime

from crystal import load_rom



rom = load_rom()


def mkdir_p(path):
	try:
		os.makedirs(path)
	except OSError as exc: # Python >2.5
		if exc.errno == errno.EEXIST:
			pass
		else: raise


def hex_dump(input, debug = True):
	"""display hex dump in rows of 16 bytes"""
	
	dump = ''
	output = ''
	stream = ''
	address = 0x00
	margin = 2 + len(hex(len(input))[2:])
	
	# dump
	for byte in input:
		cool = hex(byte)[2:].zfill(2)
		dump += cool + ' '
		if debug: stream += cool
	
	# convenient for testing quick edits in bgb
	if debug: output += stream + '\n'
	
	# get dump info
	bytes_per_line = 16
	chars_per_byte = 3 # '__ '
	chars_per_line = bytes_per_line * chars_per_byte
	num_lines = int(ceil(float(len(dump)) / float(chars_per_line)))
	
	# top
	# margin
	for char in range(margin):
		output += ' '
	# 
	for byte in range(bytes_per_line):
		output += hex(byte)[2:].zfill(2) + ' '
	output = output[:-1] # last space
	
	# print hex
	for line in range(num_lines):
		# address
		output += '\n' + hex(address)[2:].zfill(margin - 2) + ': '
		# contents
		start = line * chars_per_line
		end = chars_per_line + start - 1 # ignore last space
		output += dump[start:end]
		address += 0x10
		
	return output
	

def get_tiles(image):
	"""split a 2bpp image into 8x8 tiles"""
	tiles = []
	tile = []
	bytes_per_tile = 16
	
	cur_byte = 0
	for byte in image:
		# build tile
		tile.append(byte)
		cur_byte += 1
		# done building?
		if cur_byte >= bytes_per_tile:
			# push completed tile
			tiles.append(tile)
			tile = []
			cur_byte = 0
	return tiles


def connect(tiles):
	"""combine 8x8 tiles into a 2bpp image"""
	out = []
	for tile in tiles:
		for byte in tile:
			out.append(byte)
	return out
	

def transpose(tiles):
	"""transpose a tile arrangement along line y=x"""
	
	#     horizontal    <->     vertical
	# 00 01 02 03 04 05     00 06 0c 12 18 1e
	# 06 07 08 09 0a 0b     01 07 0d 13 19 1f
	# 0c 0d 0e 0f 10 11 <-> 02 08 0e 14 1a 20
	# 12 13 14 15 16 17 <-> 03 09 0f 15 1b 21
	# 18 19 1a 1b 1c 1d     04 0a 10 16 1c 22
	# 1e 1f 20 21 22 23     05 0b 11 17 1d 23
	# etc
	
	flipped = []
	t = 0 # which tile we're on
	w = int(sqrt(len(tiles))) # assume square image
	for tile in tiles:
		flipped.append(tiles[t])
		t += w
		# end of row?
		if t >= w*w:
			# wrap around
			t -= w*w
			# next row
			t += 1
	return flipped


def to_file(filename, data):
	file = open(filename, 'wb')
	for byte in data:
		file.write('%c' % byte)
	file.close()




# basic rundown of crystal's compression scheme:

# a control command consists of
# the command (bits 5-7)
# and the count (bits 0-4)
# followed by additional params

cpr_lit = 0
# print literal for [count] bytes

cpr_iter = 1
# print one byte [count] times

cpr_alt = 2
# print alternating bytes (2 params) for [count] bytes

cpr_zeros = 3
# print 00 for [count] bytes

# repeater control commands have a signed parameter used to determine the start point
# wraparound is simulated
# positive values are added to the start address of the decompressed data
# and negative values are subtracted from the current position

cpr_repeat = 4
# print [count] bytes from decompressed data

cpr_flip = 5
# print [count] bytes from decompressed data in bit order 01234567

cpr_reverse = 6
# print [count] bytes from decompressed data backwards

cpr_hi = 7
# -used when the count exceeds 5 bits. uses a 10-bit count instead
# -bits 2-4 now contain the control code, bits 0-1 are bits 8-9 of the count
# -the following byte contains bits 0-7 of the count

cpr_end = 0xff
# if 0xff is encountered the decompression ends

# since frontpics have animation tiles lumped onto them,
# sizes must be grabbed from base stats to know when to stop reading them

max_length = 1 << 10 # can't go higher than 10 bits
lowmax = 1 << 5 # standard 5-bit param


class Compressed:
	"""compress 2bpp data"""
	
	def __init__(self, image = None, mode = 'horiz', size = None):
	
		assert image, 'need something to compress!'
		self.image = image
		self.pic = []
		self.animtiles = []
		
		# only transpose pic (animtiles were never transposed in decompression)
		if size != None:
			for byte in range((size*size)*16):
				self.pic += image[byte]
			for byte in range(((size*size)*16),len(image)):
				self.animtiles += image[byte]
		else:
			self.pic = image
		
		if mode == 'vert':
			self.tiles = get_tiles(self.pic)
			self.tiles = transpose(self.tiles)
			self.pic = connect(self.tiles)
		
		self.image = self.pic + self.animtiles
		
		self.end = len(self.image)
		
		self.byte = None
		self.address = 0
		
		self.stream = []
		
		self.zeros = []
		self.alts = []
		self.iters = []
		self.repeats = []
		self.flips = []
		self.reverses = []
		self.literals = []
		
		self.output = []
		
		self.compress()
	
	
	def compress(self):
		"""incomplete, but outputs working compressed data"""
		
		self.address = 0
		
		# todo
		#self.scanRepeats()
		
		while ( self.address < self.end ):
			
			#if (self.repeats):
			#	self.doRepeats()
			
			#if (self.flips):
			#	self.doFlips()
			
			#if (self.reverses):
			#	self.doReverses
			
			if (self.checkWhitespace()):
				self.doLiterals()
				self.doWhitespace()
			
			elif (self.checkIter()):
				self.doLiterals()
				self.doIter()
			
			elif (self.checkAlts()):
				self.doLiterals()
				self.doAlts()
			
			else: # doesn't fit any pattern -> literal
				self.addLiteral()
				self.next()
			
			self.doStream()
		
		# add any literals we've been sitting on
		self.doLiterals()
		
		# done
		self.output.append(cpr_end)
	
	
	def getCurByte(self):
		if self.address < self.end:
			self.byte = ord(self.image[self.address])
		else: self.byte = None
	
	def next(self):
		self.address += 1
		self.getCurByte()
	
	def addLiteral(self):
		self.getCurByte()
		self.literals.append(self.byte)
		if len(self.literals) > max_length:
			raise Exception, "literals exceeded max length and the compressor didn't catch it"
		elif len(self.literals) == max_length:
			self.doLiterals()
	
	def doLiterals(self):
		if len(self.literals) > lowmax:
			self.output.append( (cpr_hi << 5) | (cpr_lit << 2) | ((len(self.literals) - 1) >> 8) )
			self.output.append( (len(self.literals) - 1) & 0xff )
		elif len(self.literals) > 0:
			self.output.append( (cpr_lit << 5) | (len(self.literals) - 1) )
		for byte in self.literals:
			self.output.append(byte)
		self.literals = []	
	
	def doStream(self):
		for byte in self.stream:
			self.output.append(byte)
		self.stream = []
	
	
	def scanRepeats(self):
		"""works, but doesn't do flipped/reversed streams yet
		
		this takes up most of the compress time and only saves a few bytes
		it might be more feasible to exclude it entirely"""
		
		self.repeats = []
		self.flips = []
		self.reverses = []
		
		# make a 5-letter word list of the sequence
		letters = 5 # how many bytes it costs to use a repeat over a literal
		# any shorter and it's not worth the trouble
		num_words = len(self.image) - letters
		words = []
		for i in range(self.address,num_words):
			word = []
			for j in range(letters):
				word.append( ord(self.image[i+j]) )
			words.append((word, i))
		
		zeros = []
		for zero in range(letters):
			zeros.append( 0 )
		
		# check for matches
		def get_matches():
		# TODO:
		# append to 3 different match lists instead of yielding to one
		#
		#flipped = []
		#for byte in enumerate(this[0]):
		#	flipped.append( sum(1<<(7-i) for i in range(8) if (this[0][byte])>>i&1) )
		#reversed = this[0][::-1]
		#
			for whereabout, this in enumerate(words):
				for that in range(whereabout+1,len(words)):
					if words[that][0] == this[0]:
						if words[that][1] - this[1] >= letters:
							# remove zeros
							if this[0] != zeros:
								yield [this[0], this[1], words[that][1]]
		
		matches = list(get_matches())
		
		# remove more zeros
		buffer = []
		for match in matches:
			# count consecutive zeros in a word
			num_zeros = 0
			highest = 0
			for j in range(letters):
				if match[0][j] == 0:
					num_zeros += 1
				else:
					if highest < num_zeros: highest = num_zeros
					num_zeros = 0
			if highest < 4:
				# any more than 3 zeros in a row isn't worth it
				# (and likely to already be accounted for)
				buffer.append(match)
		matches = buffer
		
		# combine overlapping matches
		buffer = []
		for this, match in enumerate(matches):
			if this < len(matches) - 1: # special case for the last match
				if matches[this+1][1] <= (match[1] + len(match[0])): # check overlap
					if match[1] + len(match[0]) < match[2]:
						# next match now contains this match's bytes too
						# this only appends the last byte (assumes overlaps are +1
						match[0].append(matches[this+1][0][-1])
						matches[this+1] = match
					elif match[1] + len(match[0]) == match[2]:
						# we've run into the thing we matched
						buffer.append(match)
					# else we've gone past it and we can ignore it
				else: # no more overlaps
					buffer.append(match)	
			else: # last match, so there's nothing to check
				buffer.append(match) 
		matches = buffer
		
		# remove alternating sequences
		buffer = []
		for match in matches:
			for i in range(6 if letters > 6 else letters): 
				if match[0][i] != match[0][i&1]:
					buffer.append(match)
					break
		matches = buffer
		
		self.repeats = matches
		
	
	def doRepeats(self):
		"""doesn't output the right values yet"""
		
		unusedrepeats = []
		for repeat in self.repeats:
			if self.address >= repeat[2]:
				
				# how far in we are
				length = (len(repeat[0]) - (self.address - repeat[2]))
				
				# decide which side we're copying from
				if (self.address - repeat[1]) <= 0x80:
					self.doLiterals()
					self.stream.append( (cpr_repeat << 5) | length - 1 )
					
					# wrong?
					self.stream.append( (((self.address - repeat[1])^0xff)+1)&0xff )

				else:
					self.doLiterals()
					self.stream.append( (cpr_repeat << 5) | length - 1 )
					
					# wrong?
					self.stream.append(repeat[1]>>8)
					self.stream.append(repeat[1]&0xff)
				
				#print hex(self.address) + ': ' + hex(len(self.output)) + ' ' + hex(length)
				self.address += length
				
			else: unusedrepeats.append(repeat)
				
		self.repeats = unusedrepeats
	
	
	def checkWhitespace(self):
		self.zeros = []
		self.getCurByte()
		original_address = self.address
		
		if ( self.byte == 0 ):
			while ( self.byte == 0 ) & ( len(self.zeros) <= max_length ):
				self.zeros.append(self.byte)
				self.next()
			if len(self.zeros) > 1:
				return True
		self.address = original_address
		return False
	
	def doWhitespace(self):
		if (len(self.zeros) + 1) >= lowmax:
			self.stream.append( (cpr_hi << 5) | (cpr_zeros << 2) | ((len(self.zeros) - 1) >> 8) )
			self.stream.append( (len(self.zeros) - 1) & 0xff )
		elif len(self.zeros) > 1:
			self.stream.append( cpr_zeros << 5 | (len(self.zeros) - 1) )
		else:
			raise Exception, "checkWhitespace() should prevent this from happening"
	
	
	def checkAlts(self):
		self.alts = []
		self.getCurByte()
		original_address = self.address
		num_alts = 0
		
		# make sure we don't check for alts at the end of the file
		if self.address+2 >= self.end: return False
		
		self.alts.append(self.byte)
		self.alts.append(ord(self.image[self.address+1]))
		
		# are we onto smething?
		if ( ord(self.image[self.address+2]) == self.alts[0] ):
			cur_alt = 0
			while (ord(self.image[(self.address)+1]) == self.alts[num_alts&1]) & (num_alts <= max_length):
				num_alts += 1
				self.next()
			# include the last alternated byte
			num_alts += 1
			self.address = original_address
			if num_alts > lowmax:
				return True
			elif num_alts > 2:
				return True
		return False
	
	def doAlts(self):
		original_address = self.address
		self.getCurByte()
		
		#self.alts = []
		#num_alts = 0
		
		#self.alts.append(self.byte)
		#self.alts.append(ord(self.image[self.address+1]))
		
		#i = 0
		#while (ord(self.image[self.address+1]) == self.alts[i^1]) & (num_alts <= max_length):
		#	num_alts += 1
		#	i ^=1
		#	self.next()
		## include the last alternated byte
		#num_alts += 1
		
		num_alts = len(self.iters) + 1
		
		if num_alts > lowmax:
			self.stream.append( (cpr_hi << 5) | (cpr_alt << 2) | ((num_alts - 1) >> 8) )
			self.stream.append( num_alts & 0xff )
			self.stream.append( self.alts[0] )
			self.stream.append( self.alts[1] )
		elif num_alts > 2:
			self.stream.append( (cpr_alt << 5) | (num_alts - 1) )
			self.stream.append( self.alts[0] )
			self.stream.append( self.alts[1] )
		else:
			raise Exception, "checkAlts() should prevent this from happening"
		
		self.address = original_address
		self.address += num_alts
	

	def checkIter(self):
		self.iters = []
		self.getCurByte()
		iter = self.byte
		original_address = self.address
		while (self.byte == iter) & (len(self.iters) < max_length):
			self.iters.append(self.byte)
			self.next()
		self.address = original_address
		if len(self.iters) > 3:
			# 3 or fewer isn't worth the trouble and actually longer
			# if part of a larger literal set
			return True
		
		return False
	
	def doIter(self):
		self.getCurByte()
		iter = self.byte
		original_address = self.address
		
		self.iters = []
		while (self.byte == iter) & (len(self.iters) < max_length):
			self.iters.append(self.byte)
			self.next()
		
		if (len(self.iters) - 1) >= lowmax:
			self.stream.append( (cpr_hi << 5) | (cpr_iter << 2) | ((len(self.iters)-1) >> 8) )
			self.stream.append( (len(self.iters) - 1) & 0xff )
			self.stream.append( iter )
		elif len(self.iters) > 3:
			# 3 or fewer isn't worth the trouble and actually longer
			# if part of a larger literal set
			self.stream.append( (cpr_iter << 5) | (len(self.iters) - 1) )
			self.stream.append( iter )
		else:
			self.address = original_address
			raise Exception, "checkIter() should prevent this from happening"





class Decompressed:
	"""parse compressed 2bpp data
	
	parameters:
		[compressed 2bpp data]
		[tile arrangement] default: 'vert'
		[size of pic] default: None
		[start] (optional)
	
	splits output into pic [size] and animation tiles if applicable
	data can be fed in from rom if [start] is specified"""
	
	def __init__(self, cpr = None, mode = None, size = None, start = 0):
		# todo: play nice with Compressed
	
		assert cpr, 'need something to compress!'
		self.cpr = cpr
		
		self.byte = None
		self.address = 0
		self.start = start
		
		self.output = []
		
		self.decompress()
		
		debug = False
		# print tuple containing start and end address
		if debug: print '(' + hex(self.start) + ', ' + hex(self.start + self.address+1) + '),'
		
		# only transpose pic
		self.pic = []
		self.animtiles = []
		
		if size != None:
			self.tiles = get_tiles(self.output)
			self.pic = connect(self.tiles[:(size*size)])
			self.animtiles = connect(self.tiles[(size*size):])
		else: self.pic = self.output
		
		if mode == 'vert':
			self.tiles = get_tiles(self.pic)
			self.tiles = transpose(self.tiles)
			self.pic = connect(self.tiles)
		
	
	def decompress(self):
		"""replica of crystal's decompression"""
		
		self.output = []
		
		while True:
			self.getCurByte()
			
			if (self.byte == cpr_end):
				break
			
			self.cmd = (self.byte & 0b11100000) >> 5
			
			if self.cmd == cpr_hi: # 10-bit param
				self.cmd = (self.byte & 0b00011100) >> 2
				self.length = (self.byte & 0b00000011) << 8
				self.next()
				self.length += self.byte + 1
			else: # 5-bit param
				self.length = (self.byte & 0b00011111) + 1
			
			# literals
			if self.cmd == cpr_lit:
				self.doLiteral()
			elif self.cmd == cpr_iter:
				self.doIter()
			elif self.cmd == cpr_alt:
				self.doAlt()
			elif self.cmd == cpr_zeros:
				self.doZeros()
				
			else: # repeaters
				self.next()
				if self.byte > 0x7f: # negative
					self.displacement = self.byte & 0x7f
					self.displacement = len(self.output) - self.displacement - 1
				else: # positive
					self.displacement = self.byte * 0x100
					self.next()
					self.displacement += self.byte
				
				if self.cmd == cpr_flip:
					self.doFlip()
				elif self.cmd == cpr_reverse:
					self.doReverse()
				else: # cpr_repeat
					self.doRepeat()
			
			self.address += 1
			#self.next() # somewhat of a hack
	
	
	def getCurByte(self):
		self.byte = ord(self.cpr[self.start+self.address])
	
	def next(self):
		self.address += 1
		self.getCurByte()
	
	def doLiteral(self):
		# copy 2bpp data directly
		for byte in range(self.length):
			self.next()
			self.output.append(self.byte)
		
	def doIter(self):
		# write one byte repeatedly
		self.next()
		for byte in range(self.length):
			self.output.append(self.byte)
		
	def doAlt(self):
		# write alternating bytes
		self.alts = []
		self.next()
		self.alts.append(self.byte)
		self.next()
		self.alts.append(self.byte)
		
		for byte in range(self.length):
			self.output.append(self.alts[byte&1])
		
	def doZeros(self):
		# write zeros
		for byte in range(self.length):
			self.output.append(0x00)
		
	def doFlip(self):
		# repeat flipped bytes from 2bpp output
		# eg  11100100 -> 00100111
		# quat 3 2 1 0 ->  0 2 1 3
		for byte in range(self.length):
			flipped = sum(1<<(7-i) for i in range(8) if self.output[self.displacement+byte]>>i&1)
			self.output.append(flipped)
		
	def doReverse(self):
		# repeat reversed bytes from 2bpp output
		for byte in range(self.length):
			self.output.append(self.output[self.displacement-byte])
		
	def doRepeat(self):
		# repeat bytes from 2bpp output
		for byte in range(self.length):
			self.output.append(self.output[self.displacement+byte])





sizes = {
0: 5,
1: 6,
2: 7,
3: 5,
4: 6,
5: 7,
6: 5,
7: 6,
8: 7,
9: 5,
10: 5,
11: 7,
12: 5,
13: 5,
14: 7,
15: 5,
16: 6,
17: 7,
18: 5,
19: 6,
20: 5,
21: 7,
22: 5,
23: 7,
24: 5,
25: 7,
26: 5,
27: 6,
28: 5,
29: 6,
30: 7,
31: 5,
32: 6,
33: 7,
34: 5,
35: 6,
36: 6,
37: 7,
38: 5,
39: 6,
40: 5,
41: 7,
42: 5,
43: 6,
44: 7,
45: 5,
46: 7,
47: 5,
48: 7,
49: 5,
50: 7,
51: 5,
52: 7,
53: 5,
54: 7,
55: 5,
56: 7,
57: 5,
58: 7,
59: 5,
60: 6,
61: 7,
62: 5,
63: 6,
64: 7,
65: 5,
66: 7,
67: 7,
68: 5,
69: 6,
70: 7,
71: 5,
72: 6,
73: 5,
74: 6,
75: 6,
76: 6,
77: 7,
78: 5,
79: 7,
80: 5,
81: 6,
82: 6,
83: 5,
84: 7,
85: 6,
86: 7,
87: 5,
88: 7,
89: 5,
90: 7,
91: 7,
92: 6,
93: 6,
94: 7,
95: 6,
96: 7,
97: 5,
98: 7,
99: 5,
100: 5,
101: 7,
102: 7,
103: 5,
104: 6,
105: 7,
106: 6,
107: 7,
108: 6,
109: 7,
110: 7,
111: 7,
112: 6,
113: 6,
114: 7,
115: 5,
116: 6,
117: 6,
118: 7,
119: 6,
120: 6,
121: 6,
122: 7,
123: 6,
124: 6,
125: 6,
126: 7,
127: 7,
128: 6,
129: 7,
130: 7,
131: 5,
132: 5,
133: 6,
134: 6,
135: 6,
136: 6,
137: 5,
138: 6,
139: 5,
140: 6,
141: 7,
142: 7,
143: 7,
144: 7,
145: 7,
146: 5,
147: 6,
148: 7,
149: 7,
150: 5,
151: 5,
152: 6,
153: 7,
154: 5,
155: 6,
156: 7,
157: 5,
158: 6,
159: 7,
160: 6,
161: 6,
162: 5,
163: 7,
164: 6,
165: 6,
166: 5,
167: 7,
168: 7,
169: 6,
170: 6,
171: 5,
172: 5,
173: 5,
174: 5,
175: 7,
176: 5,
177: 6,
178: 5,
179: 6,
180: 7,
181: 7,
182: 5,
183: 7,
184: 6,
185: 7,
186: 5,
187: 6,
188: 7,
189: 5,
190: 5,
191: 6,
192: 6,
193: 5,
194: 6,
195: 6,
196: 6,
197: 6,
198: 7,
199: 6,
200: 5,
201: 6,
202: 7,
203: 5,
204: 7,
205: 6,
206: 6,
207: 7,
208: 6,
209: 6,
210: 5,
211: 7,
212: 5,
213: 6,
214: 6,
215: 5,
216: 7,
217: 5,
218: 6,
219: 5,
220: 6,
221: 6,
222: 5,
223: 6,
224: 6,
225: 7,
226: 7,
227: 6,
228: 7,
229: 7,
230: 5,
231: 7,
232: 6,
233: 7,
234: 7,
235: 5,
236: 7,
237: 5,
238: 6,
239: 6,
240: 6,
241: 7,
242: 7,
243: 7,
244: 7,
245: 5,
246: 6,
247: 7,
248: 7,
249: 7,
250: 5,
}

def make_sizes():
	"""front pics have specified sizes"""
	top = 251
	base_stats = 0x51424
	# print monster sizes
	address = base_stats + 0x11
	for id in range(top):
		size = (ord(rom[address])) & 0x0f
		print str(id) + ': ' + str(size) + ','
		address += 0x20



fxs = 0xcfcf6
num_fx = 40

def decompress_fx_by_id(id):
	address = fxs + id*4 # len_fxptr
	# get size
	num_tiles = ord(rom[address]) # # tiles
	# get pointer
	bank = ord(rom[address+1])
	address = (ord(rom[address+3]) << 8) + ord(rom[address+2])
	address = (bank * 0x4000) + (address & 0x3fff)
	# decompress
	fx = Decompressed(rom, 'horiz', num_tiles, address)
	return fx
	
def decompress_fx():
	for id in range(num_fx):
		fx = decompress_fx_by_id(id)
		filename = '../gfx/fx/' + str(id).zfill(3) + '.2bpp' # ../gfx/fx/039.2bpp
		to_file(filename, fx.pic)


num_pics = 2
front = 0
back = 1

monsters = 0x120000
num_monsters = 251

unowns = 0x124000
num_unowns = 26
unown_dex = 201

def decompress_monster_by_id(id = 0, type = front):
	# no unowns here
	if id + 1 == unown_dex: return None
	# get size
	if type == front:
		size = sizes[id]
	else: size = None
	# get pointer
	address = monsters + (id*2 + type)*3 # bank, address
	bank = ord(rom[address]) + 0x36 # crystal
	address = (ord(rom[address+2]) << 8) + ord(rom[address+1])
	address = (bank * 0x4000) + (address & 0x3fff)
	# decompress
	monster = Decompressed(rom, 'vert', size, address)
	return monster
	
def decompress_monsters(type = front):
	for id in range(num_monsters):
		# decompress
		monster = decompress_monster_by_id(id, type)
		if monster != None: # no unowns here
			filename = str(id+1).zfill(3) + '.2bpp' # 001.2bpp
			if not type: # front
				folder = '../gfx/frontpics/'
				to_file(folder+filename, monster.pic)
				folder = '../gfx/anim/'
				to_file(folder+filename, monster.animtiles)
			else: # back
				folder = '../gfx/backpics/'
				to_file(folder+filename, monster.pic)


def decompress_unown_by_id(letter, type = front):
	# get size
	if type == front:
		size = sizes[unown_dex-1]
	else: size = None
	# get pointer
	address = unowns + (letter*2 + type)*3 # bank, address
	bank = ord(rom[address]) + 0x36 # crystal
	address = (ord(rom[address+2]) << 8) + ord(rom[address+1])
	address = (bank * 0x4000) + (address & 0x3fff)
	# decompress
	unown = Decompressed(rom, 'vert', size, address)
	return unown

def decompress_unowns(type = front):
	for letter in range(num_unowns):
		# decompress
		unown = decompress_unown_by_id(letter, type)
		
		filename = str(unown_dex).zfill(3) + chr(ord('a') + letter) + '.2bpp' # 201a.2bpp
		if not type: # front
			folder = '../gfx/frontpics/'
			to_file(folder+filename, unown.pic)
			folder = '../gfx/anim/'
			to_file(folder+filename, unown.animtiles)
		else: # back
			folder = '../gfx/backpics/'
			to_file(folder+filename, unown.pic)


trainers = 0x128000
num_trainers = 67

def decompress_trainer_by_id(id):
	# get pointer
	address = trainers + id*3 # bank, address
	bank = ord(rom[address]) + 0x36 # crystal
	address = (ord(rom[address+2]) << 8) + ord(rom[address+1])
	address = (bank * 0x4000) + (address & 0x3fff)
	# decompress
	trainer = Decompressed(rom, 'vert', None, address)
	return trainer

def decompress_trainers():
	for id in range(num_trainers):
		# decompress
		trainer = decompress_trainer_by_id(id)
		filename = '../gfx/trainers/' + str(id).zfill(3) + '.2bpp' # ../gfx/trainers/066.2bpp
		to_file(filename, trainer.pic)


# in order of use (sans repeats)
intro_gfx = [
	('logo', 0x109407),
	('001', 0xE641D), # tilemap
	('unowns', 0xE5F5D),
	('pulse', 0xE634D),
	('002', 0xE63DD), # tilemap
	('003', 0xE5ECD), # tilemap
	('background', 0xE5C7D),
	('004', 0xE5E6D), # tilemap
	('005', 0xE647D), # tilemap
	('006', 0xE642D), # tilemap
	('pichu_wooper', 0xE592D),
	('suicune_run', 0xE555D),
	('007', 0xE655D), # tilemap
	('008', 0xE649D), # tilemap
	('009', 0xE76AD), # tilemap
	('suicune_jump', 0xE6DED),
	('unown_back', 0xE785D),
	('010', 0xE764D), # tilemap
	('011', 0xE6D0D), # tilemap
	('suicune_close', 0xE681D),
	('012', 0xE6C3D), # tilemap
	('013', 0xE778D), # tilemap
	('suicune_back', 0xE72AD),
	('014', 0xE76BD), # tilemap
	('015', 0xE676D), # tilemap
	('crystal_unowns', 0xE662D),
	('017', 0xE672D), # tilemap
]

def decompress_intro():
	for name, address in intro_gfx:
		filename = '../gfx/intro/' + name + '.2bpp'
		gfx = Decompressed( rom, 'horiz', None, address )
		to_file(filename, gfx.output)


title_gfx = [
	('suicune', 0x10EF46),
	('logo', 0x10F326),
	('crystal', 0x10FCEE),
]

def decompress_title():
	for name, address in title_gfx:
		filename = '../gfx/title/' + name + '.2bpp'
		gfx = Decompressed( rom, 'horiz', None, address )
		to_file(filename, gfx.output)

def decompress_tilesets():
	tileset_headers = 0x4d596
	len_tileset = 15
	num_tilesets = 0x25
	for tileset in range(num_tilesets):
		ptr = tileset*len_tileset + tileset_headers
		address = (ord(rom[ptr])*0x4000) + (((ord(rom[ptr+1]))+ord(rom[ptr+2])*0x100)&0x3fff)
		tiles = Decompressed( rom, 'horiz', None, address )
		filename = '../gfx/tilesets/'+str(tileset).zfill(2)+'.2bpp'
		to_file( filename, tiles.output )
		#print '(' + hex(address) + ', '+ hex(address+tiles.address+1) + '),'

misc = [
	('player', 0x2BA1A, 'vert'),
	('dude', 0x2BBAA, 'vert'),
	('town_map', 0xF8BA0, 'horiz'),
	('pokegear', 0x1DE2E4, 'horiz'),
	('pokegear_sprites', 0x914DD, 'horiz'),
]
def decompress_misc():
	for name, address, mode in misc:
		filename = '../gfx/misc/' + name + '.2bpp'
		gfx = Decompressed( rom, mode, None, address )
		to_file(filename, gfx.output)

def decompress_all(debug = False):
	"""decompress all known compressed data in baserom"""
	
	#mkdir_p('../gfx/')
	#mkdir_p('../gfx/frontpics/')
	#mkdir_p('../gfx/anim/')
	#mkdir_p('../gfx/backpics/')
	#mkdir_p('../gfx/trainers/')
	#mkdir_p('../gfx/fx/')
	#mkdir_p('../gfx/intro/')
	#mkdir_p('../gfx/title/')
	mkdir_p('../gfx/tilesets/')
	#mkdir_p('../gfx/misc/')
	
	if debug: print 'fronts'
	decompress_monsters(front)
	if debug: print 'backs'
	decompress_monsters(back)
	if debug: print 'unown fronts'
	decompress_unowns(front)
	if debug: print 'unown backs'
	decompress_unowns(back)
	
	if debug: print 'trainers'
	decompress_trainers()
	
	if debug: print 'fx'
	decompress_fx()
	
	if debug: print 'intro'
	decompress_intro()
	
	if debug: print 'title'
	decompress_title()
	
	if debug: print 'tilesets'
	decompress_tilesets()
	
	if debug: print 'misc'
	decompress_misc()
	
	return


def decompress_from_address(address, mode='horiz', filename = 'de.2bpp', size = None):
	"""write decompressed data from an address to a 2bpp file"""
	image = Decompressed(rom, mode, size, address)
	to_file(filename, image.pic)


def decompress_file(filein, fileout, mode = 'horiz', size = None):
	f = open(filein, 'rb')
	image = f.read()
	f.close()
	
	de = Decompressed(image, mode, size)
	
	to_file(fileout, de.pic)


def compress_file(filein, fileout, mode = 'horiz'):
	f = open(filein, 'rb')
	image = f.read()
	f.close()
	
	cpr = Compressed(image, mode)
	
	to_file(fileout, cpr.output)




def compress_monster_frontpic(id, fileout):
	mode = 'vert'
	
	fpic = '../gfx/frontpics/' + str(id).zfill(3) + '.2bpp'
	fanim = '../gfx/anim/' + str(id).zfill(3) + '.2bpp'
	
	pic = open(fpic, 'rb').read()
	anim = open(fanim, 'rb').read()
	image = pic + anim
	
	cpr = Compressed(image, mode, 5)
	
	out = '../gfx/frontpics/cpr/' + str(id).zfill(3) + '.cpr'
	
	to_file(out, cpr.output)



if __name__ == "__main__":
	parser = argparse.ArgumentParser()
	parser.add_argument('cmd', nargs='?', metavar='cmd', type=str)
	parser.add_argument('arg1', nargs='?', metavar='arg1', type=str)
	parser.add_argument('arg2', nargs='?', metavar='arg2', type=str)
	parser.add_argument('arg3', nargs='?', metavar='arg3', type=str)
	args = parser.parse_args()
	
	debug = True
	
	if args.cmd == 'de':
		# python gfx.py de [addr] [fileout] [mode]
		addr = int(args.arg1,16)
		fileout = args.arg2
		mode = args.arg3
		decompress_from_address(addr, fileout, mode)
		if debug: print 'decompressed to ' + args.arg2 + ' from ' + hex(int(args.arg1,16)) + '!'
		
	elif args.cmd == 'cpr':
		# python gfx.py cpr [filein] [fileout] [mode]
		filein = args.arg1
		fileout = args.arg2
		mode = args.arg3
		compress_file(filein, fileout, mode)
		if debug: print 'compressed ' + filein + ' to ' + fileout + '!'
		
	else:
		decompress_all()
		if debug: print 'decompressed known gfx to ../gfx/!'
