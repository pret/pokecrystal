# -*- coding: utf-8 -*-

import ply.lex as lex
import sys, os


FILENAME = '' # Current filename


_tokens = ('STRING', 'NEWLINE', 'LABEL',
        'ID', 'COMMA', 'PLUS', 'MINUS', 'LP', 'RP', 'MUL', 'DIV', 'POW',
        'UMINUS', 'APO', 'INTEGER', 'ADDR', 'RB', 'LB',
        'LOCALLABEL', 'LSHIFT', 'RSHIFT', 'BITWISE_OR', 'BITWISE_AND',
        'LOGICAL_NOT', 'BITWISE_COMPLEMENT',
    )

reserved_instructions = {
    'adc': 'ADC',
    'add': 'ADD',
    'and': 'AND',
    'bit': 'BIT',
    'call': 'CALL',
    'ccf': 'CCF',
    'cp': 'CP',
    'cpd': 'CPD',
    'cpdr': 'CPDR',
    'cpi': 'CPI',
    'cpir': 'CPIR',
    'cpl': 'CPL',
    'daa': 'DAA',
    'dec': 'DEC',
    'di': 'DI',
    'djnz': 'DJNZ',
    'ei': 'EI',
    'ex': 'EX',
    'exx': 'EXX',
    'halt': 'HALT',
    'im': 'IM',
    'in': 'IN',
    'inc': 'INC',
    'ind': 'IND',
    'indr': 'INDR',
    'ini': 'INI',
    'inir': 'INIR',
    'jp': 'JP',
    'jr': 'JR',
    'ld': 'LD',
    'ldd': 'LDD',
    'lddr': 'LDDR',
    'ldi': 'LDI',
    'ldir': 'LDIR',
    'neg': 'NEG',
    'nop': 'NOP',
    'or': 'OR',
    'otdr': 'OTDR',
    'otir': 'OTIR',
    'out': 'OUT',
    'outd': 'OUTD',
    'outi': 'OUTI',
    'pop': 'POP',
    'push': 'PUSH',
    'res': 'RES',
    'ret': 'RET',
    'reti': 'RETI',
    'retn': 'RETN',
    'rl': 'RL',
    'rla': 'RLA',
    'rlc': 'RLC',
    'rlca': 'RLCA',
    'rld': 'RLD',
    'rr': 'RR',
    'rra': 'RRA',
    'rrc': 'RRC',
    'rrca': 'RRCA',
    'rrd': 'RRD',
    'rst': 'RST',
    'sbc': 'SBC',
    'scf': 'SCF',
    'set': 'SET',
    'sla': 'SLA',
    'sll': 'SLL',
    'sra': 'SRA',
    'srl': 'SRL',
    'sub': 'SUB',
    'xor': 'XOR',
    }


pseudo = { # pseudo ops
    'align': 'ALIGN',
    'org': 'ORG',
    'defb': 'DEFB',
    'defm': 'DEFB',
    'db'  : 'DEFB',
    'defs': 'DEFS',
    'defw': 'DEFW',
    'ds'  : 'DEFS',
    'dw'  : 'DEFW',
    'equ': 'EQU',
    'proc': 'PROC',
    'endp': 'ENDP',
    'local': 'LOCAL',
    'end': 'END',
    'incbin': 'INCBIN'
    }


regs8 = {'a': 'A', 
    'b': 'B', 'c': 'C',
    'd': 'D', 'e': 'E',
    'h': 'H', 'l': 'L',
    'i': 'I', 'r': 'R',
    'ixh': 'IXH', 'ixl': 'IXL',
    'iyh': 'IYH', 'iyl': 'IYL'
    }


regs16 = {
    'af': 'AF',
    'bc': 'BC',
    'de': 'DE',
    'hl': 'HL',
    'ix': 'IX',
    'iy': 'IY',
    'sp': 'SP'
}


flags = {
    'z' : 'Z',
    'nz' : 'NZ',
    'nc' : 'NC',
    'po' : 'PO',
    'pe' : 'PE',
    'p' : 'P',
    'm' : 'M',
}


preprocessor = {
    'init' : '_INIT',
    'line' : '_LINE'
}



# List of token names.
_tokens = _tokens \
        + tuple(reserved_instructions.values()) \
        + tuple(pseudo.values()) \
        + tuple(regs8.values()) \
        + tuple(regs16.values()) \
        + tuple(flags.values()) \
        + tuple(preprocessor.values())


def get_uniques(l):
    ''' Returns a list with no repeated elements.
    '''
    result = []

    for i in l:
        if i not in result:
            result.append(i)

    return result
    


tokens = get_uniques(_tokens)
        

class Lexer(object):
    ''' Own class lexer to allow multiple instances.
    This lexer is just a wrapper of the current FILESTACK[-1] lexer
    '''
    states = (
        ('preproc', 'exclusive'),
    )

    # -------------- TOKEN ACTIONS --------------


    def __set_lineno(self, value):
        ''' Setter for lexer.lineno
        '''
        self.lex.lineno = value


    def __get_lineno(self):
        ''' Getter for lexer.lineno
        '''
        if self.lex is None:
            return 0

        return self.lex.lineno

    lineno = property(__get_lineno, __set_lineno)


    def t_INITIAL_preproc_skip(self, t):
        r'[ \t]+'
        pass    # Ignore whitespaces and tabs


    def t_CHAR(self, t):
        r"'.'" # A single char
        
        t.value = ord(t.value[1])
        t.type = 'INTEGER'

        return t


    def t_HEXA(self, t):
        r'([0-9][0-9a-fA-F]*[hH])|(\$[0-9a-fA-F]+)'

        if t.value[0] == '$': 
            t.value = t.value[1:] # Remove initial '$'
        else:
            t.value = t.value[:-1] # Remove last 'h'
        
        t.value = int(t.value, 16) # Convert to decimal
        t.type = 'INTEGER'

        return t


    def t_BIN(self, t):
        r'(%[01]+)|([01]+[bB])' # A Binary integer
        # Note 00B is a 0 binary, but 
        # 00Bh is a 12 in hex. So this pattern must come
        # after HEXA
    
        if t.value[0] == '%':
            t.value = t.value[1:] # Remove initial %
        else:
            t.value = t.value[:-1] # Remove last 'b'

        t.value = int(t.value, 2) # Convert to decimal
        t.type = 'INTEGER'

        return t


    def t_INITIAL_preproc_INTEGER(self, t):
        r'[0-9]+' # an integer decimal number

        t.value = int(t.value)
        
        return t
        
    def t_INITIAL_ID(self, t):
        r'[_a-zA-Z.]([.]?[_a-zA-Z0-9\\@\#]+)*[:]?(\\\W)?' # Any identifier

        tmp = t.value # Saves original value
        if tmp[-1] == ':':
            t.type = 'LABEL'
            t.value = tmp[:-1]
            return t
        if tmp[0] == "." and (tmp[-2:] == "\@" or tmp[-3:] == "\@:"):
            t.type = "LOCALLABEL"
            t.value = tmp[1:]
            return t

        t.value = tmp.upper() # Convert it to uppercase, since our internal tables uses uppercase
        id = tmp.lower()

        t.type = reserved_instructions.get(id)
        if t.type is not None: return t

        t.type = pseudo.get(id)
        if t.type is not None: return t

        t.type = regs8.get(id)
        if t.type is not None: return t

        t.type = flags.get(id)
        if t.type is not None: return t

        t.type = regs16.get(id, 'ID')
        if t.type == 'ID':
            t.value = tmp # Restores original value

        return t


    def t_preproc_ID(self, t):
        r'[_a-zA-Z][_a-zA-Z0-9]*' # preprocessor directives

        t.type = preprocessor.get(t.value.lower(), 'ID')
        return t

    
    def t_COMMA(self, t):
        r',' 
    
        return t


    def t_ADDR(self, t):
        r'\$'

        return t


    def t_LP(self, t):
        r'\('
    
        return t


    def t_RP(self, t):
        r'\)'
    
        return t


    def t_RB(self, t):
        r'\['

        return t


    def t_LB(self, t):
        r'\]'
        return t

    def t_LSHIFT(self, t):
        r'<<'
        return t
    def t_RSHIFT(self, t):
        r'>>'
        return t

    def t_BITWISE_OR(self, t):
        r'\|'
        return t
    def t_BITWISE_AND(self, t):
        r'\&'
        return t
    def t_BITWISE_COMPLEMENT(self, t):
        r'~'
        return t
    def t_LOGICAL_NOT(self, t):
        r'\!'
        return t

    def t_PLUS(self, t):
        r'\+'

        return t


    def t_MINUS(self, t):
        r'\-'

        return t


    def t_MUL(self, t):
        r'\*'

        return t


    def t_DIV(self, t):
        r'\/'

        return t


    def t_POW(self, t):
        r'\^'

        return t


    def t_APO(self, t):
        r"'"

        return t


    def t_INITIAL_preproc_STRING(self, t):
        r'"[^"]*"' # a doubled quoted string
        t.value = t.value[1:-1] # Remove quotes
    
        return t


    def t_INITIAL_preproc_error(self, t):
        ''' error handling rule
        '''
        self.error("illegal character '%s'" % t.value[0])


    def t_INITIAL_preproc_CONTINUE(self, t):
        r'\\\r?\n'
        t.lexer.lineno += 1
        
        # Allows line breaking


    def t_COMMENT(self, t):
        r';.*'
        
        # Skip to end of line (except end of line)


    def t_INITIAL_preproc_NEWLINE(self, t):
        r'\r?\n'

        t.lexer.lineno += 1
        t.lexer.begin('INITIAL')

        return t


    def t_INITIAL_SHARP(self, t):
        r'\#'
    
        if self.find_column(t) == 1:
            t.lexer.begin('preproc')
        else:
            self.error("illegal character '%s'" % t.value[0])


    def __init__(self):
        ''' Creates a new GLOBAL lexer instance
        '''
        self.lex = None
        self.filestack = [] # Current filename, and line number being parsed
        self.input_data = ''
        self.tokens = tokens
        self.next_token = None # if set to something, this will be returned once


    def input(self, str):
        ''' Defines input string, removing current lexer.
        '''
        self.input_data = str
        self.lex = lex.lex(object = self)
        self.lex.input(self.input_data)


    def token(self):
        return self.lex.token()


    def find_column(self, token):
        ''' Compute column:
                - token is a token instance
        '''
        i = token.lexpos
        while i > 0:
            if self.input_data[i - 1] == '\n': break
            i -= 1
    
        column = token.lexpos - i + 1
    
        return column


    def msg(self, str):
        ''' Prints an error msg.
        '''
        #print '%s:%i %s' % (FILENAME, self.lex.lineno, str)
        print '%s:%s %s' % (FILENAME, "?", str)
    
    
    def error(self, str):
        ''' Prints an error msg, and exits.
        '''
        self.msg('Error: %s' % str)
    
        sys.exit(1)
    
    
    def warning(self, str):
        ''' Emmits a warning and continue execution.
        '''
        self.msg('Warning: %s' % str)

# Needed for states 
tmp = lex.lex(object = Lexer(), lextab = 'zxbasmlextab')

if __name__ == '__main__':
    FILENAME = sys.argv[1]
    tmp.input(open(sys.argv[1]).read())
    tok = tmp.token()
    while tok:
        print tok
        tok = tmp.token()
