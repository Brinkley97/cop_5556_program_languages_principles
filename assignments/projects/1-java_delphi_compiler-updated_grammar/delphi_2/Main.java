import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;

public class Main {
    public static void main(String[] args) throws Exception {
        // Prepare the input that will be parsed.
        CharStream input = CharStreams.fromFileName("delphi_examples/constructor.pas");  // Adjust "input_file.txt" to your specific input file.

        // Instantiate the lexer.
        delphiLexer lexer = new delphiLexer(input);

        // Generate tokens from the lexer.
        CommonTokenStream tokens = new CommonTokenStream(lexer);

        // Instantiate the parser using the tokens.
        delphiParser parser = new delphiParser(tokens);

        // Assuming 'program' is the start rule in your delphi.g4 grammar.
        ParseTree tree = parser.program();

        // Optionally, use a custom visitor if defined.
        // Example assuming a visitor named DelphiCustomVisitor which extends delphiBaseVisitor is defined elsewhere.
        // DelphiCustomVisitor visitor = new DelphiCustomVisitor();
        // visitor.visit(tree);
    }
}