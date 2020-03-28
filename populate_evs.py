import glob

filenames = glob.glob('data/pokemon/base_stats/*.asm')

handleManuallyList = []

with open('ev_yields.txt', 'r', encoding='utf8') as ev_yields_file:
	ev_yields = ev_yields_file.readlines()
	for filename in filenames:

		with open(filename, 'r', encoding='utf8') as file:
			lines = file.readlines()

		with open(filename, 'w', encoding='utf8') as file:
			for line in lines:
				if line == '\tevs  0,   0,   0,   0,   0,   0\n':
					monName = filename.split('\\')[-1][0:-4]
					matches = [i for i in ev_yields if i.split('\t')[0].lower() == monName.lower()]
					if len(matches) == 0:
						handleManuallyList.append(filename + ' : ' + monName)
						file.write(line)
					elif len(matches) > 1:
						handleManuallyList.append(filename + ' : ' + monName)
						file.write(line)
					else:
						monValues = matches[0].split('\t')
						hp = monValues[2]
						attack = monValues[3]
						defense = monValues[4]
						speed = monValues[7]
						specialAttack = monValues[5]
						specialDefense = monValues[6]

						br = ',   '
						# TODO: format ev yields and print
						file.write('\tevs  ' + hp + br + attack + br + defense + br + speed + br + specialAttack + br + specialDefense + '\n') 
				else:
					file.write(line)

print(handleManuallyList)