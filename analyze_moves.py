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

class Move:
	def __init__(self, name, power, accuracy, effect):
		self.name = name
		self.power = power
		self.accuracy = accuracy
		self.effect = effect

class CategoryInfo:
	def __init__(self, category_name):
		self.category_name = category_name
		self.strongest_move = Move('N/A', 0, 0, 'N/A')
		self.moves_in_category_count = 0

class StrongestMovesInType:
	def __init__(self, name):
		self.physical = CategoryInfo('Physical')
		self.special = CategoryInfo('Special')

class MoveFormatter:

	# HORN_ATTACK -> Horn Attack
	@staticmethod
	def format_move_name(name):
		return name.replace('_', ' ').title()

	@staticmethod
	def format_move(move):
		return 		('  - Name: ' 		+ 	MoveFormatter.format_move_name(move.name)	+ '\n') \
				+ 	('  - Power: ' 		+ 	str(move.power) 							+ '\n') \
				+ 	('  - Accuracy: '	+ 	str(move.accuracy) 							+ '\n')
	
	@staticmethod
	def format_strongest_move_in_category(strongest_move_in_category):
		return 		('### ' + strongest_move_in_category.category_name + '\n') \
				+	('- Strongest Move:' + '\n') \
				+	MoveFormatter.format_move(strongest_move_in_category.strongest_move) \
				+	('- Move Count: ' + str(strongest_move_in_category.moves_in_category_count) + '\n')

	# TODO: separate formatting and exporting into two functions
	@staticmethod
	def format_and_export_strongest_moves_by_type(moves_by_type):
		# Format and write results to file
		with open('strongest_moves.md', 'w', encoding='utf8') as results_file:
			results_file.write('# Strongest Moves\n')
			for key in moves_by_type:
				results_file.write('## ' + str(key).title() + ':\n')

				results_file.write(MoveFormatter.format_strongest_move_in_category(moves_by_type[key].physical))
				results_file.write(MoveFormatter.format_strongest_move_in_category(moves_by_type[key].special))

				results_file.write('---\n')

class MoveAnalyzer:

	@staticmethod
	def get_moves_to_ignore():
		SACRIFICE_MOVES = ['EXPLOSION', 'SELFDESTRUCT']
		LEGENDARY_EXCLUSIVE_MOVES = ['SACRED_FIRE', 'AEROBLAST']
		COOLDOWN_REQUIRED_MOVES = ['HYPER_BEAM']
		SETUP_REQUIRED_MOVES = ['DREAM_EATER']
		MULTI_TURN_MOVES = ['FLY', 'SOLARBEAM', 'DIG', 'SKY_ATTACK']


		MOVES_TO_IGNORE = SACRIFICE_MOVES \
							+ LEGENDARY_EXCLUSIVE_MOVES \
							+ COOLDOWN_REQUIRED_MOVES \
							+ SETUP_REQUIRED_MOVES \
							+ MULTI_TURN_MOVES
		return MOVES_TO_IGNORE

	@staticmethod
	def is_move_stronger(move1, move2):
		return int(move1.power) < int(move2.power) \
				and int(move2.accuracy) >= 90 \
				and move2.name not in MoveAnalyzer.get_moves_to_ignore()

	@staticmethod
	def calculate_stronger_move(move1, move2):
		return move2 if(MoveAnalyzer.is_move_stronger(move1, move2)) else move1

	# Parse moves.asm, build dictionary of StrongestMovesInType objects, and return them when finished
	@staticmethod
	def calculate_strongest_moves_per_type():
		with open('data/moves/moves.asm', 'r', encoding='utf8') as move_file:
			move_file_lines = move_file.readlines()

		# {{'ELECTRIC': StrongestMovesInType()}, {'FIGHTING': StrongestMovesInType()}}
		strongest_moves_by_type = {}

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

				move_to_compare = Move(move_name, move_power, move_accuracy, move_effect)

				# If dictionary entry for type doesn't exist yet, create one
				dictVal = strongest_moves_by_type.get(move_type, -1)
				if dictVal == -1:
					strongest_moves_by_type[move_type] = StrongestMovesInType(move_type)

				# Update the info for each category
				if(move_category == 'PHYSICAL'):
					current_strongest_move = strongest_moves_by_type[move_type].physical.strongest_move
					strongest_move = MoveAnalyzer.calculate_stronger_move(current_strongest_move, move_to_compare)
					strongest_moves_by_type[move_type].physical.strongest_move = strongest_move
					strongest_moves_by_type[move_type].physical.moves_in_category_count += 1
				elif(move_category == 'SPECIAL'):
					current_strongest_move = strongest_moves_by_type[move_type].special.strongest_move
					strongest_move = MoveAnalyzer.calculate_stronger_move(current_strongest_move, move_to_compare)
					strongest_moves_by_type[move_type].special.strongest_move = strongest_move
					strongest_moves_by_type[move_type].special.moves_in_category_count += 1

		return strongest_moves_by_type


def main():
		strongest_moves_by_type = MoveAnalyzer.calculate_strongest_moves_per_type()
		MoveFormatter.format_and_export_strongest_moves_by_type(strongest_moves_by_type)

if __name__ == '__main__':
	main()
