import glob

filenames = glob.glob('data/pokemon/base_stats/*.asm')

for filename in filenames:

	print('Update', filename)

	with open(filename, 'r', encoding='utf8') as file:
		lines = file.readlines()

	with open(filename, 'w', encoding='utf8') as file:
		for line in lines:
			if line in ['\tdb 100 ; unknown 1\n', '\tdb 5 ; unknown 2\n']:
				continue
			if line == '\t;   hp  atk  def  spd  sat  sdf\n':
				file.write('\tevs  0,   0,   0,   0,   0,   0\n')
			file.write(line)