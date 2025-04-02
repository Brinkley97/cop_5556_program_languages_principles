// Generated from cookie.g4 by ANTLR 4.13.0
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link cookieParser}.
 */
public interface cookieListener extends ParseTreeListener {
    void enterCookie(cookieParser.CookieContext ctx);
    void exitCookie(cookieParser.CookieContext ctx);
    void enterName(cookieParser.NameContext ctx);
    void exitName(cookieParser.NameContext ctx);
    void enterAv_pairs(cookieParser.Av_pairsContext ctx);
    void exitAv_pairs(cookieParser.Av_pairsContext ctx);
    void enterAv_pair(cookieParser.Av_pairContext ctx);
    void exitAv_pair(cookieParser.Av_pairContext ctx);
    void enterAttr(cookieParser.AttrContext ctx);
    void exitAttr(cookieParser.AttrContext ctx);
    void enterValue(cookieParser.ValueContext ctx);
    void exitValue(cookieParser.ValueContext ctx);
    void enterWord(cookieParser.WordContext ctx);
    void exitWord(cookieParser.WordContext ctx);
    void enterToken(cookieParser.TokenContext ctx);
    void exitToken(cookieParser.TokenContext ctx);
    void enterQuoted_string(cookieParser.Quoted_stringContext ctx);
    void exitQuoted_string(cookieParser.Quoted_stringContext ctx);
}

class CustomCookieListener extends cookieBaseListener {
    @Override
    public void exitCookie(cookieParser.CookieContext ctx) {
        if (ctx != null) {
            for (int i = 0; i < ctx.getChildCount(); i++) {
                System.out.println("Child " + i + ": " + ctx.getChild(i).getText());
            }
        }
    }

    public static void main(String[] args) throws Exception {
        // Read the input file
        CharStream input = CharStreams.fromFileName("input.txt");

        // Create a lexer and parser
        cookieLexer lexer = new cookieLexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        cookieParser parser = new cookieParser(tokens);

        // Create a parse tree
        ParseTree tree = parser.cookie();

        // Create a listener and attach it to the parse tree walker
        ParseTreeWalker walker = new ParseTreeWalker();
        CustomCookieListener listener = new CustomCookieListener();
        walker.walk(listener, tree);
    }
}
