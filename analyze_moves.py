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

# Define all of the moves that should be ignored while finding which move is "strongest"
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

class MoveInfo:
	def __init__(self):
		self.name = 'N/A'
		self.power = 0
		self.accuracy = 0

class CategoryInfo:
	def __init__(self, name):
		self.name = name
		self.strongest_move = MoveInfo()
		self.count = 0
	
	# TODO: move the functions below out of this class
	def is_strongest_so_far(self, name, power, accuracy, effect):
		return self.strongest_move.power < int(power) \
				and int(accuracy) >= 90 \
				and effect not in MOVE_EFFECTS_TO_IGNORE \
				and name not in MOVES_TO_IGNORE

	def updateInfo(self, name, power, accuracy, effect):
		if(self.is_strongest_so_far(name, power, accuracy, effect)):
			self.strongest_move.name = name
			self.strongest_move.power = int(power)
			self.strongest_move.accuracy = int(accuracy)
			self.strongest_move.effect = effect
		self.count += 1

	def formatNum(self, label, value):
		return '{:<11} {:>12}\n'.format('  - ' + label + ':', value)

	def formatStr(self, label, value):
		return '{:<11} {:>12}\n'.format('  - ' + label + ': ', value)

	def getFormattedInfo(self):
		return '- Strongest Move:\n' \
				+ self.formatStr('Name', 		str(self.strongest_move.name)).replace('_', ' ').title() \
				+ self.formatNum('Power', 		str(self.strongest_move.power)) \
				+ self.formatNum('Accuracy', 	str(self.strongest_move.accuracy)) \
				+ '- Move Count: ' + str(self.count)

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
	with open('strongest_moves.md', 'w', encoding='utf8') as results_file:
		results_file.write('# Strongest Moves\n')
		for key in moves_by_type:
			results_file.write('## ' + str(key).title() + ':\n')

			results_file.write('### Physical:\n' + moves_by_type[key].physical.getFormattedInfo() + '\n')
			results_file.write('\n')
			results_file.write('### Special:\n' + moves_by_type[key].special.getFormattedInfo() + '\n')
			results_file.write('\n')
			results_file.write('### Total Moves: ' + str(moves_by_type[key].total) + '\n')
		
			results_file.write('---\n')

def main():
		move_analysis_by_type = get_moves_by_type()
		format_and_export_move_analysis_by_type(move_analysis_by_type)

if __name__ == '__main__':
	main()
