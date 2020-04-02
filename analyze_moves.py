"""
Report  data/moves/moves.asm files for N code lines in a row that match some conditions.
"""

with open("data/moves/moves.asm", "r", encoding="utf8") as move_file:
	move_file_lines = move_file.readlines()

# {{'ELECTRIC': {'PHYSICAL': 2}, {'SPECIAL': 4}, {'STATUS': 1}}...}
move_analysis_by_type_dict = {}

for move_file_line in move_file_lines:
    # Only read move information from moves.asm
    if move_file_line.startswith('\tmove '):
	    move_attributes = move_file_line[6:].split(",")
	    move_name = move_attributes[0].strip()
	    move_type = move_attributes[3].strip()
	    move_category = move_attributes[4].strip()

	    # If dictionary entry for type doesn't exist yet, create one
	    dictVal = move_analysis_by_type_dict.get(move_type, -1)
	    if dictVal == -1:
	    	move_analysis_by_type_dict[move_type] = {}
	    	move_analysis_by_type_dict[move_type]["PHYSICAL"] = 0
	    	move_analysis_by_type_dict[move_type]["SPECIAL"] = 0
	    	move_analysis_by_type_dict[move_type]["STATUS"] = 0
	    	move_analysis_by_type_dict[move_type]["TOTAL"] = 0

        # Increment number of moves of move_type that belong to move_category
	    move_analysis_by_type_dict[move_type][move_category] += 1
	    move_analysis_by_type_dict[move_type]["TOTAL"] += 1

# Format and write results to file
with open("move_analysis_results.txt", "w", encoding="utf8") as result_file:
	for key in move_analysis_by_type_dict:
		result_file.write(key + " :\n")
		result_file.write("---------------\n")
		for prop in move_analysis_by_type_dict[key]:
			result_file.write("{:<8} {:<0} {:>3}\n".format(prop, ":", move_analysis_by_type_dict[key][prop]))
		result_file.write("===============\n")
		result_file.write("\n")

			

