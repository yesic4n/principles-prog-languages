# Generated from c:\Users\84865\Documents\BK-CSE20\CSE-PPL\assignment-1\src\main\mt22\parser\MT22.g4 by ANTLR 4.9.2
# encoding: utf-8
from antlr4 import *
from io import StringIO
import sys
if sys.version_info[1] > 5:
	from typing import TextIO
else:
	from typing.io import TextIO


def serializedATN():
    with StringIO() as buf:
        buf.write("\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\3 ")
        buf.write("\7\4\2\t\2\3\2\3\2\3\2\2\2\3\2\2\2\2\5\2\4\3\2\2\2\4\5")
        buf.write("\7\2\2\3\5\3\3\2\2\2\2")
        return buf.getvalue()


class MT22Parser ( Parser ):

    grammarFileName = "MT22.g4"

    atn = ATNDeserializer().deserialize(serializedATN())

    decisionsToDFA = [ DFA(ds, i) for i, ds in enumerate(atn.decisionToState) ]

    sharedContextCache = PredictionContextCache()

    literalNames = [ "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                     "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                     "'auto'", "'break'", "'integer'", "'void'", "'array'", 
                     "'float'", "'return'", "'out'", "'boolean'", "'for'", 
                     "'string'", "'continue'", "'do'", "'function'", "'of'", 
                     "'else'", "'if'", "'while'", "'inherit'" ]

    symbolicNames = [ "<INVALID>", "COMMENT", "INTEGER_LIT", "FLOAT_LIT", 
                      "BOOLEAN_LIT", "STRING_LIT", "ARRAY_LIT", "StringList", 
                      "AUTO", "BREAK", "INTEGER", "VOID", "ARRAY", "FLOAT", 
                      "RETURN", "OUT", "BOOLEAN", "FOR", "STRING", "CONTINUE", 
                      "DO", "FUNCTION", "OF", "ELSE", "IF", "WHILE", "INHERIT", 
                      "WS", "ERROR_CHAR", "UNCLOSE_STRING", "ILLEGAL_ESCAPE" ]

    RULE_program = 0

    ruleNames =  [ "program" ]

    EOF = Token.EOF
    COMMENT=1
    INTEGER_LIT=2
    FLOAT_LIT=3
    BOOLEAN_LIT=4
    STRING_LIT=5
    ARRAY_LIT=6
    StringList=7
    AUTO=8
    BREAK=9
    INTEGER=10
    VOID=11
    ARRAY=12
    FLOAT=13
    RETURN=14
    OUT=15
    BOOLEAN=16
    FOR=17
    STRING=18
    CONTINUE=19
    DO=20
    FUNCTION=21
    OF=22
    ELSE=23
    IF=24
    WHILE=25
    INHERIT=26
    WS=27
    ERROR_CHAR=28
    UNCLOSE_STRING=29
    ILLEGAL_ESCAPE=30

    def __init__(self, input:TokenStream, output:TextIO = sys.stdout):
        super().__init__(input, output)
        self.checkVersion("4.9.2")
        self._interp = ParserATNSimulator(self, self.atn, self.decisionsToDFA, self.sharedContextCache)
        self._predicates = None




    class ProgramContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def EOF(self):
            return self.getToken(MT22Parser.EOF, 0)

        def getRuleIndex(self):
            return MT22Parser.RULE_program




    def program(self):

        localctx = MT22Parser.ProgramContext(self, self._ctx, self.state)
        self.enterRule(localctx, 0, self.RULE_program)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 2
            self.match(MT22Parser.EOF)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx





