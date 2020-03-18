common1 = open('../data/text/common_1.asm', 'r')
common2 = open('../data/text/common_2.asm', 'r')
common3 = open('../data/text/common_3.asm', 'r')

mergedCommon = open('common.asm', 'w+')

mergedCommon.write('INCLUDE "constants.asm"\n')

# create the merged file
commonFiles = [common1, common2, common3]

for file in commonFiles:
    line = file.readline()
    while line:
        if line.find('::') > 0:
            splitLine = line.split('::')
            foo = splitLine[0]
            mergedCommon.write('SECTION "' + foo + '", ROMX\n')
        mergedCommon.write(line)
        line = file.readline()

common1.close()
common2.close()
common3.close()
mergedCommon.close()