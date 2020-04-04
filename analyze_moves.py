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
	def __init__(self, name, power, accuracy, effect, move_type, category, pp, second_effect_chance):
		self.name = name
		self.power = power
		self.accuracy = accuracy
		self.effect = effect
		self.move_type = move_type
		self.category = category
		self.pp = pp
		self.second_effect_chance = second_effect_chance
	
	@staticmethod
	def get_default_state():
		return Move('N/A', 0, 0, 'N/A', 'N/A', 'N/A', 0, 0)

	@staticmethod
	def convert_file_line_to_move(file_line):
		# Get the name without the '\tmove' and split line into an array
		move_attributes = file_line[6:].split(',')

		# Store values into labeled variables
		move_name = move_attributes[0].strip()
		move_effect = move_attributes[1].strip()
		move_power = move_attributes[2].strip()
		move_type = move_attributes[3].strip()
		move_category = move_attributes[4].strip()
		move_accuracy = move_attributes[5].strip()
		move_pp = move_attributes[6].strip()
		move_second_effect_chance = move_attributes[7].strip()

		return Move(move_name, \
					move_power, \
					move_accuracy, \
					move_effect, \
					move_type, \
					move_category, \
					move_pp, \
					move_second_effect_chance)

class CategoryInfo:
	def __init__(self, category_name):
		self.category_name = category_name
		self.strongest_move = Move.get_default_state()
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

	@staticmethod
	def format_strongest_moves_by_type(strongest_moves_by_type):
		# Format and write results to file
		formatted_strongest_moves_by_type = ''
		formatted_strongest_moves_by_type += '# Strongest Moves\n'
		for key in strongest_moves_by_type:
			formatted_strongest_moves_by_type += ('## ' + str(key).title() + ':\n')

			formatted_strongest_moves_by_type \
				+= MoveFormatter.format_strongest_move_in_category(strongest_moves_by_type[key].physical)
			formatted_strongest_moves_by_type \
				+= MoveFormatter.format_strongest_move_in_category(strongest_moves_by_type[key].special)

			formatted_strongest_moves_by_type += '---\n'

		return formatted_strongest_moves_by_type


class MoveAnalyzer:

	@staticmethod
	def get_moves_to_ignore():
		sacrifice_moves = ['EXPLOSION', 'SELFDESTRUCT']
		legendary_exclusive_moves = ['SACRED_FIRE', 'AEROBLAST']
		cooldown_required_moves = ['HYPER_BEAM']
		setup_required_turn = ['DREAM_EATER']
		multi_turn_moves = ['FLY', 'SOLARBEAM', 'DIG', 'SKY_ATTACK']

		moves_to_ignore = sacrifice_moves \
							+ legendary_exclusive_moves \
							+ cooldown_required_moves \
							+ setup_required_turn \
							+ multi_turn_moves
		return moves_to_ignore

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
		strongest_moves_by_type_dict = {}

		for move_file_line in move_file_lines:

			# Only read move information from moves.asm
			if move_file_line.startswith('\tmove '):
				move_to_compare = Move.convert_file_line_to_move(move_file_line)

				# If dictionary entry for type doesn't exist yet, create one
				dictVal = strongest_moves_by_type_dict.get(move_to_compare.move_type, -1)
				if dictVal == -1:
					strongest_moves_by_type_dict[move_to_compare.move_type] = StrongestMovesInType(move_to_compare.move_type)

				# Update the info for each category
				if(move_to_compare.category == 'PHYSICAL'):
					current_strongest_move = strongest_moves_by_type_dict[move_to_compare.move_type].physical.strongest_move
					strongest_move = MoveAnalyzer.calculate_stronger_move(current_strongest_move, move_to_compare)
					strongest_moves_by_type_dict[move_to_compare.move_type].physical.strongest_move = strongest_move
					strongest_moves_by_type_dict[move_to_compare.move_type].physical.moves_in_category_count += 1
				elif(move_to_compare.category == 'SPECIAL'):
					current_strongest_move = strongest_moves_by_type_dict[move_to_compare.move_type].special.strongest_move
					strongest_move = MoveAnalyzer.calculate_stronger_move(current_strongest_move, move_to_compare)
					strongest_moves_by_type_dict[move_to_compare.move_type].special.strongest_move = strongest_move
					strongest_moves_by_type_dict[move_to_compare.move_type].special.moves_in_category_count += 1

		return strongest_moves_by_type_dict

class MarkdownExporter:

	@staticmethod
	def export_strongest_moves_by_type_markdown(formatted_strongest_moves_by_type):
		with open('strongest_moves.md', 'w', encoding='utf8') as results_file:
			results_file.write(formatted_strongest_moves_by_type)

def main():
		strongest_moves_by_type = MoveAnalyzer.calculate_strongest_moves_per_type()
		formatted_strongest_moves_by_type = MoveFormatter.format_strongest_moves_by_type(strongest_moves_by_type)
		MarkdownExporter.export_strongest_moves_by_type_markdown(formatted_strongest_moves_by_type)

if __name__ == '__main__':
	main()
