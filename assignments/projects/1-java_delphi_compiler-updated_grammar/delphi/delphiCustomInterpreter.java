import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import java.io.*;

public class delphiCustomInterpreter {
    public static void main(String[] args) {
        if (args.length < 1) {
            System.err.println("Usage: java delphiCustomInterpreter <file.pas>");
            return;
        }

        try {
            // Read Pascal source file
            String fileName = args[0];
            File file = new File(fileName);
            CharStream input = CharStreams.fromFileName(fileName);

            // Lexer and parser
            delphiLexer lexer = new delphiLexer(input);
            CommonTokenStream tokens = new CommonTokenStream(lexer);
            delphiParser parser = new delphiParser(tokens);

            // Parse the input
            ParseTree tree = parser.program(); // Start parsing from 'program' rule

            PrintableTree printableTree = new PrintableTree(tree);
            String baseName = file.getName().substring(0, file.getName().lastIndexOf('.'));
            String astFileName = "AST_Tree_" + baseName + ".txt";
            printableTree.saveToFile("./ast", astFileName);
            
            // Walk and interpret the AST
            delphiCustomVisitor interpreter = new delphiCustomVisitor();
            interpreter.visit(tree);

        } catch (IOException e) {
            System.err.println("Error reading file: " + e.getMessage());
        }
    }
}
