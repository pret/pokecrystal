'''
Read moves from data/moves/moves.asm and report how many moves of each category there are
'''

class MoveInfo:
	def __init__(self):
		self.name = 'N/A'
		self.power = 0
		self.accuracy = 0

class CategoryInfo:
	LEGENDARY_EXCLUSIVE_EFFECTS = ['EFFECT_SACRED_FIRE']
	COOLDOWN_REQUIRED_EFFECTS = ['EFFECT_HYPER_BEAM']
	SETUP_REQUIRED_EFFECTS = ['EFFECT_DREAM_EATER']
	SACRIFICE_EFFECTS = ['EFFECT_SELFDESTRUCT', 'EFFECT_SELFDESTRUCT']
	MULTI_TURN_EFFECTS = ['EFFECT_FLY', 'EFFECT_SOLARBEAM', 'EFFECT_DIG', 'EFFECT_SKY_ATTACK']

	MOVE_EFFECTS_TO_IGNORE = LEGENDARY_EXCLUSIVE_EFFECTS \
								+ COOLDOWN_REQUIRED_EFFECTS \
								+ SETUP_REQUIRED_EFFECTS \
								+ SACRIFICE_EFFECTS \
								+ MULTI_TURN_EFFECTS

	def __init__(self, name):
		self.name = name
		self.strongest_move = MoveInfo()
		self.count = 0

	def updateInfo(self, move_name, move_power, move_accuracy, move_effect):
		if(self.strongest_move.power < int(move_power) \
				and int(move_accuracy) >= 90 \
				and move_effect not in self.MOVE_EFFECTS_TO_IGNORE):
			self.strongest_move.name = move_name
			self.strongest_move.power = int(move_power)
			self.strongest_move.accuracy = int(move_accuracy)
			self.strongest_move.effect = move_effect
		self.count += 1

	def formatNum(self, label, value):
		return '{:<11} {:>12}\n'.format('\t\t' + label + ':', value)

	def formatStr(self, label, value):
		return '{:<11} {:>12}\n'.format('\t\t' + label + ': ', value)

	def getFormattedInfo(self):
		return '\tStrongest Move:\n' \
				+ self.formatStr('Name', 		str(self.strongest_move.name)).replace('_', ' ').title() \
				+ self.formatNum('Power', 		str(self.strongest_move.power)) \
				+ self.formatNum('Accuracy', 	str(self.strongest_move.accuracy)) \
				+ '\tMove Count: ' + str(self.count)

class TypeInfo:
	def __init__(self, name):
		self.name = name
		self.physical = CategoryInfo('Physical')
		self.special = CategoryInfo('Special')
		self.total = 0

# Parse moves.asm, build dictionary of TypeInfo objects, and return them when finished
def get_move_analysis_by_type_dict():
	with open('data/moves/moves.asm', 'r', encoding='utf8') as move_file:
		move_file_lines = move_file.readlines()

	# {{'ELECTRIC': TypeInfo()}, {'FIGHTING': TypeInfo()}}
	move_analysis_by_type_dict = {}

	for move_file_line in move_file_lines:
		# Only read move information from moves.asm
		if move_file_line.startswith('\tmove '):
			# Get the name without the '\tmove'
			move_attributes = move_file_line[6:].split(',')
			move_name = move_attributes[0].strip()
			move_effect = move_attributes[1].strip()
			move_power = move_attributes[2].strip()
			move_type = move_attributes[3].strip()
			move_category = move_attributes[4].strip()
			move_accuracy = move_attributes[5].strip()
			# move_pp = move_attributes[6].strip()
			# move_second_effect_chance = move_attributes[7].strip()

			# If dictionary entry for type doesn't exist yet, create one
			dictVal = move_analysis_by_type_dict.get(move_type, -1)
			if dictVal == -1:
				move_analysis_by_type_dict[move_type] = TypeInfo(move_type)

			# Update the info for each category
			if(move_category == 'PHYSICAL'):
				move_analysis_by_type_dict[move_type].physical.updateInfo(move_name, move_power, move_accuracy, move_effect)
			elif(move_category == 'SPECIAL'):
				move_analysis_by_type_dict[move_type].special.updateInfo(move_name, move_power, move_accuracy, move_effect)
			move_analysis_by_type_dict[move_type].total += 1

	return move_analysis_by_type_dict

def format_and_export_move_analysis_by_type(move_analysis_by_type_dict):
	# Format and write results to file
	with open('move_analysis_results.txt', 'w', encoding='utf8') as results_file:
		for key in move_analysis_by_type_dict:
			results_file.write(str(key).title() + ':\n')
			results_file.write('------------------------------\n')

			results_file.write('Physical:\n' + move_analysis_by_type_dict[key].physical.getFormattedInfo() + '\n')
			results_file.write('\n')
			results_file.write('Special:\n' + move_analysis_by_type_dict[key].special.getFormattedInfo() + '\n')
			results_file.write('\n')
			results_file.write('Total Moves: ' + str(move_analysis_by_type_dict[key].total) + '\n')
		
			results_file.write('==============================\n')
			results_file.write('\n\n')

def main():
		move_analysis_by_type = get_move_analysis_by_type_dict()
		format_and_export_move_analysis_by_type(move_analysis_by_type)

if __name__ == '__main__':
	main()
