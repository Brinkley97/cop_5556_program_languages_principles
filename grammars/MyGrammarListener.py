# Generated from MyGrammar.g4 by ANTLR 4.13.0
from antlr4 import *
if "." in __name__:
    from .MyGrammarParser import MyGrammarParser
else:
    from MyGrammarParser import MyGrammarParser

# This class defines a complete listener for a parse tree produced by MyGrammarParser.
class MyGrammarListener(ParseTreeListener):

    # Enter a parse tree produced by MyGrammarParser#SingleTerm.
    def enterSingleTerm(self, ctx:MyGrammarParser.SingleTermContext):
        pass

    # Exit a parse tree produced by MyGrammarParser#SingleTerm.
    def exitSingleTerm(self, ctx:MyGrammarParser.SingleTermContext):
        pass


    # Enter a parse tree produced by MyGrammarParser#AddSub.
    def enterAddSub(self, ctx:MyGrammarParser.AddSubContext):
        pass

    # Exit a parse tree produced by MyGrammarParser#AddSub.
    def exitAddSub(self, ctx:MyGrammarParser.AddSubContext):
        pass


    # Enter a parse tree produced by MyGrammarParser#MulDiv.
    def enterMulDiv(self, ctx:MyGrammarParser.MulDivContext):
        pass

    # Exit a parse tree produced by MyGrammarParser#MulDiv.
    def exitMulDiv(self, ctx:MyGrammarParser.MulDivContext):
        pass


    # Enter a parse tree produced by MyGrammarParser#SingleFactor.
    def enterSingleFactor(self, ctx:MyGrammarParser.SingleFactorContext):
        pass

    # Exit a parse tree produced by MyGrammarParser#SingleFactor.
    def exitSingleFactor(self, ctx:MyGrammarParser.SingleFactorContext):
        pass


    # Enter a parse tree produced by MyGrammarParser#Int.
    def enterInt(self, ctx:MyGrammarParser.IntContext):
        pass

    # Exit a parse tree produced by MyGrammarParser#Int.
    def exitInt(self, ctx:MyGrammarParser.IntContext):
        pass


    # Enter a parse tree produced by MyGrammarParser#Parens.
    def enterParens(self, ctx:MyGrammarParser.ParensContext):
        pass

    # Exit a parse tree produced by MyGrammarParser#Parens.
    def exitParens(self, ctx:MyGrammarParser.ParensContext):
        pass



del MyGrammarParser