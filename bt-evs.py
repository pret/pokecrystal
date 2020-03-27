from math import sqrt, ceil

def derive_ev(stat_exp_line):
	stat_exp = int(stat_exp_line[len('\tbigdw '):])
	return str(int(ceil(sqrt(stat_exp))))

filename = 'data/battle_tower/parties.asm'

with open(filename, 'r', encoding='utf8') as file:
	lines = file.readlines()

with open(filename, 'w', encoding='utf8') as file:
	i = 0
	while i < len(lines):
		line = lines[i]

		if line != '\t; Stat exp\n':
			file.write(line)
			i += 1
			continue

		exp_lines = lines[i+1:i+6]
		evs = [derive_ev(exp_line) for exp_line in exp_lines]
		evs.append(evs[-1]) # Special -> Sp.Atk and Sp.Def
		file.write('\tdb {} ; EVs\n'.format(', '.join(evs)))
		file.write('\tdb 0, 0, 0, 0 ; padding\n')
		i += 6

print('Done!')