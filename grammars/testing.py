import sys
from antlr4 import FileStream, CommonTokenStream
from MyGrammarLexer import MyGrammarLexer
from MyGrammarParser import MyGrammarParser

def main(input_file):
    # Read input file
    input_stream = FileStream(input_file)
    
    # Create a lexer
    lexer = MyGrammarLexer(input_stream)
    
    # Create a token stream
    token_stream = CommonTokenStream(lexer)
    
    # Create a parser
    parser = MyGrammarParser(token_stream)
    
    # Parse the input according to the top-level rule in the grammar
    tree = parser.expr()
    
    # Print the parse tree
    print(tree.toStringTree(recog=parser))

if __name__ == "__main__":
    input_file = sys.argv[1] if len(sys.argv) > 1 else "input.txt"
    main(input_file)
