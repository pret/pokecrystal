'''
Report the "Strongest Move" for each category (Physical/Special) of each type (Grass/Water/Fire...)

Strongest Move Requirements
- Accuracy greater than 90
- Effect Can't...
	- Be exclusive to a legendary
	- Require a cooldown turn after use
	- Require at least 1 turn of setup
	- Knock the user out
	- Span multiple turns
- Stronger than all other moves in the same category that meet the above criteria
'''

class MoveInfo:
	def __init__(self):
		self.name = 'N/A'
		self.power = 0
		self.accuracy = 0

class CategoryInfo:
	SACRIFICE_EFFECTS = ['EFFECT_SELFDESTRUCT']

	LEGENDARY_EXCLUSIVE_MOVES = ['SACRED_FIRE', 'AEROBLAST']
	COOLDOWN_REQUIRED_MOVES = ['HYPER_BEAM']
	SETUP_REQUIRED_MOVES = ['DREAM_EATER']
	MULTI_TURN_MOVES = ['FLY', 'SOLARBEAM', 'DIG', 'SKY_ATTACK']

	MOVE_EFFECTS_TO_IGNORE = SACRIFICE_EFFECTS
	MOVES_TO_IGNORE = LEGENDARY_EXCLUSIVE_MOVES \
						+ COOLDOWN_REQUIRED_MOVES \
						+ SETUP_REQUIRED_MOVES \
						+ MULTI_TURN_MOVES

	def __init__(self, name):
		self.name = name
		self.strongest_move = MoveInfo()
		self.count = 0

	def updateInfo(self, move_name, move_power, move_accuracy, move_effect):
		if(self.strongest_move.power < int(move_power) \
				and int(move_accuracy) >= 90 \
				and move_effect not in self.MOVE_EFFECTS_TO_IGNORE \
				and move_name not in self.MOVES_TO_IGNORE):
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
def get_moves_by_type():
	with open('data/moves/moves.asm', 'r', encoding='utf8') as move_file:
		move_file_lines = move_file.readlines()

	# {{'ELECTRIC': TypeInfo()}, {'FIGHTING': TypeInfo()}}
	moves_by_type = {}

	for move_file_line in move_file_lines:

		# Only read move information from moves.asm
		if move_file_line.startswith('\tmove '):

			# Get the name without the '\tmove and split line into an array'
			move_attributes = move_file_line[6:].split(',')

			# Store values into labeled variables
			move_name = move_attributes[0].strip()
			move_effect = move_attributes[1].strip()
			move_power = move_attributes[2].strip()
			move_type = move_attributes[3].strip()
			move_category = move_attributes[4].strip()
			move_accuracy = move_attributes[5].strip()
			# move_pp = move_attributes[6].strip()
			# move_second_effect_chance = move_attributes[7].strip()

			# If dictionary entry for type doesn't exist yet, create one
			dictVal = moves_by_type.get(move_type, -1)
			if dictVal == -1:
				moves_by_type[move_type] = TypeInfo(move_type)

			# Update the info for each category
			if(move_category == 'PHYSICAL'):
				moves_by_type[move_type].physical.updateInfo(move_name, move_power, move_accuracy, move_effect)
			elif(move_category == 'SPECIAL'):
				moves_by_type[move_type].special.updateInfo(move_name, move_power, move_accuracy, move_effect)
			moves_by_type[move_type].total += 1

	return moves_by_type

def format_and_export_move_analysis_by_type(moves_by_type):
	# Format and write results to file
	with open('strongest_moves.txt', 'w', encoding='utf8') as results_file:
		for key in moves_by_type:
			results_file.write(str(key).title() + ':\n')
			results_file.write('------------------------------\n')

			results_file.write('Physical:\n' + moves_by_type[key].physical.getFormattedInfo() + '\n')
			results_file.write('\n')
			results_file.write('Special:\n' + moves_by_type[key].special.getFormattedInfo() + '\n')
			results_file.write('\n')
			results_file.write('Total Moves: ' + str(moves_by_type[key].total) + '\n')
		
			results_file.write('==============================\n')
			results_file.write('\n\n')

def main():
		move_analysis_by_type = get_moves_by_type()
		format_and_export_move_analysis_by_type(move_analysis_by_type)

if __name__ == '__main__':
	main()
