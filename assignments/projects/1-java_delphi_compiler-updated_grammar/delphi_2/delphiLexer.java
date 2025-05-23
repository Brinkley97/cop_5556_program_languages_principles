// Generated from delphi.g4 by ANTLR 4.9.2
import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.misc.*;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class delphiLexer extends Lexer {
	static { RuntimeMetaData.checkVersion("4.9.2", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, T__2=3, T__3=4, T__4=5, T__5=6, T__6=7, T__7=8, T__8=9, 
		T__9=10, T__10=11, T__11=12, T__12=13, T__13=14, T__14=15, T__15=16, T__16=17, 
		T__17=18, T__18=19, T__19=20, T__20=21, T__21=22, T__22=23, T__23=24, 
		T__24=25, T__25=26, T__26=27, IDENT=28, INTEGER=29, COLON=30, SEMI=31, 
		NEWLINE=32, WS=33, EQUAL=34, NOT_EQUAL=35;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	private static String[] makeRuleNames() {
		return new String[] {
			"T__0", "T__1", "T__2", "T__3", "T__4", "T__5", "T__6", "T__7", "T__8", 
			"T__9", "T__10", "T__11", "T__12", "T__13", "T__14", "T__15", "T__16", 
			"T__17", "T__18", "T__19", "T__20", "T__21", "T__22", "T__23", "T__24", 
			"T__25", "T__26", "IDENT", "INTEGER", "COLON", "SEMI", "NEWLINE", "WS", 
			"EQUAL", "NOT_EQUAL"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "'program'", "'('", "')'", "'begin'", "'end'", "'.'", "'type'", 
			"'class'", "'public'", "'private'", "'constructor'", "'destructor'", 
			"'procedure'", "'function'", "'var'", "','", "'Integer'", "'String'", 
			"'Boolean'", "':='", "'WriteLn'", "'whileLoop'", "'doLoop'", "'forLoop'", 
			"'toLoop'", "'break'", "'continue'", null, null, "':'", "';'", null, 
			null, "'='", "'<>'"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, "IDENT", "INTEGER", "COLON", "SEMI", "NEWLINE", 
			"WS", "EQUAL", "NOT_EQUAL"
		};
	}
	private static final String[] _SYMBOLIC_NAMES = makeSymbolicNames();
	public static final Vocabulary VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	@Deprecated
	public static final String[] tokenNames;
	static {
		tokenNames = new String[_SYMBOLIC_NAMES.length];
		for (int i = 0; i < tokenNames.length; i++) {
			tokenNames[i] = VOCABULARY.getLiteralName(i);
			if (tokenNames[i] == null) {
				tokenNames[i] = VOCABULARY.getSymbolicName(i);
			}

			if (tokenNames[i] == null) {
				tokenNames[i] = "<INVALID>";
			}
		}
	}

	@Override
	@Deprecated
	public String[] getTokenNames() {
		return tokenNames;
	}

	@Override

	public Vocabulary getVocabulary() {
		return VOCABULARY;
	}


	public delphiLexer(CharStream input) {
		super(input);
		_interp = new LexerATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	@Override
	public String getGrammarFileName() { return "delphi.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public String[] getChannelNames() { return channelNames; }

	@Override
	public String[] getModeNames() { return modeNames; }

	@Override
	public ATN getATN() { return _ATN; }

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\2%\u011f\b\1\4\2\t"+
		"\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13"+
		"\t\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22\t\22"+
		"\4\23\t\23\4\24\t\24\4\25\t\25\4\26\t\26\4\27\t\27\4\30\t\30\4\31\t\31"+
		"\4\32\t\32\4\33\t\33\4\34\t\34\4\35\t\35\4\36\t\36\4\37\t\37\4 \t \4!"+
		"\t!\4\"\t\"\4#\t#\4$\t$\3\2\3\2\3\2\3\2\3\2\3\2\3\2\3\2\3\3\3\3\3\4\3"+
		"\4\3\5\3\5\3\5\3\5\3\5\3\5\3\6\3\6\3\6\3\6\3\7\3\7\3\b\3\b\3\b\3\b\3\b"+
		"\3\t\3\t\3\t\3\t\3\t\3\t\3\n\3\n\3\n\3\n\3\n\3\n\3\n\3\13\3\13\3\13\3"+
		"\13\3\13\3\13\3\13\3\13\3\f\3\f\3\f\3\f\3\f\3\f\3\f\3\f\3\f\3\f\3\f\3"+
		"\f\3\r\3\r\3\r\3\r\3\r\3\r\3\r\3\r\3\r\3\r\3\r\3\16\3\16\3\16\3\16\3\16"+
		"\3\16\3\16\3\16\3\16\3\16\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3\17"+
		"\3\20\3\20\3\20\3\20\3\21\3\21\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22"+
		"\3\23\3\23\3\23\3\23\3\23\3\23\3\23\3\24\3\24\3\24\3\24\3\24\3\24\3\24"+
		"\3\24\3\25\3\25\3\25\3\26\3\26\3\26\3\26\3\26\3\26\3\26\3\26\3\27\3\27"+
		"\3\27\3\27\3\27\3\27\3\27\3\27\3\27\3\27\3\30\3\30\3\30\3\30\3\30\3\30"+
		"\3\30\3\31\3\31\3\31\3\31\3\31\3\31\3\31\3\31\3\32\3\32\3\32\3\32\3\32"+
		"\3\32\3\32\3\33\3\33\3\33\3\33\3\33\3\33\3\34\3\34\3\34\3\34\3\34\3\34"+
		"\3\34\3\34\3\34\3\35\3\35\7\35\u00ff\n\35\f\35\16\35\u0102\13\35\3\36"+
		"\6\36\u0105\n\36\r\36\16\36\u0106\3\37\3\37\3 \3 \3!\5!\u010e\n!\3!\3"+
		"!\3!\3!\3\"\6\"\u0115\n\"\r\"\16\"\u0116\3\"\3\"\3#\3#\3$\3$\3$\2\2%\3"+
		"\3\5\4\7\5\t\6\13\7\r\b\17\t\21\n\23\13\25\f\27\r\31\16\33\17\35\20\37"+
		"\21!\22#\23%\24\'\25)\26+\27-\30/\31\61\32\63\33\65\34\67\359\36;\37="+
		" ?!A\"C#E$G%\3\2\6\5\2C\\aac|\6\2\62;C\\aac|\3\2\62;\4\2\13\13\"\"\2\u0122"+
		"\2\3\3\2\2\2\2\5\3\2\2\2\2\7\3\2\2\2\2\t\3\2\2\2\2\13\3\2\2\2\2\r\3\2"+
		"\2\2\2\17\3\2\2\2\2\21\3\2\2\2\2\23\3\2\2\2\2\25\3\2\2\2\2\27\3\2\2\2"+
		"\2\31\3\2\2\2\2\33\3\2\2\2\2\35\3\2\2\2\2\37\3\2\2\2\2!\3\2\2\2\2#\3\2"+
		"\2\2\2%\3\2\2\2\2\'\3\2\2\2\2)\3\2\2\2\2+\3\2\2\2\2-\3\2\2\2\2/\3\2\2"+
		"\2\2\61\3\2\2\2\2\63\3\2\2\2\2\65\3\2\2\2\2\67\3\2\2\2\29\3\2\2\2\2;\3"+
		"\2\2\2\2=\3\2\2\2\2?\3\2\2\2\2A\3\2\2\2\2C\3\2\2\2\2E\3\2\2\2\2G\3\2\2"+
		"\2\3I\3\2\2\2\5Q\3\2\2\2\7S\3\2\2\2\tU\3\2\2\2\13[\3\2\2\2\r_\3\2\2\2"+
		"\17a\3\2\2\2\21f\3\2\2\2\23l\3\2\2\2\25s\3\2\2\2\27{\3\2\2\2\31\u0087"+
		"\3\2\2\2\33\u0092\3\2\2\2\35\u009c\3\2\2\2\37\u00a5\3\2\2\2!\u00a9\3\2"+
		"\2\2#\u00ab\3\2\2\2%\u00b3\3\2\2\2\'\u00ba\3\2\2\2)\u00c2\3\2\2\2+\u00c5"+
		"\3\2\2\2-\u00cd\3\2\2\2/\u00d7\3\2\2\2\61\u00de\3\2\2\2\63\u00e6\3\2\2"+
		"\2\65\u00ed\3\2\2\2\67\u00f3\3\2\2\29\u00fc\3\2\2\2;\u0104\3\2\2\2=\u0108"+
		"\3\2\2\2?\u010a\3\2\2\2A\u010d\3\2\2\2C\u0114\3\2\2\2E\u011a\3\2\2\2G"+
		"\u011c\3\2\2\2IJ\7r\2\2JK\7t\2\2KL\7q\2\2LM\7i\2\2MN\7t\2\2NO\7c\2\2O"+
		"P\7o\2\2P\4\3\2\2\2QR\7*\2\2R\6\3\2\2\2ST\7+\2\2T\b\3\2\2\2UV\7d\2\2V"+
		"W\7g\2\2WX\7i\2\2XY\7k\2\2YZ\7p\2\2Z\n\3\2\2\2[\\\7g\2\2\\]\7p\2\2]^\7"+
		"f\2\2^\f\3\2\2\2_`\7\60\2\2`\16\3\2\2\2ab\7v\2\2bc\7{\2\2cd\7r\2\2de\7"+
		"g\2\2e\20\3\2\2\2fg\7e\2\2gh\7n\2\2hi\7c\2\2ij\7u\2\2jk\7u\2\2k\22\3\2"+
		"\2\2lm\7r\2\2mn\7w\2\2no\7d\2\2op\7n\2\2pq\7k\2\2qr\7e\2\2r\24\3\2\2\2"+
		"st\7r\2\2tu\7t\2\2uv\7k\2\2vw\7x\2\2wx\7c\2\2xy\7v\2\2yz\7g\2\2z\26\3"+
		"\2\2\2{|\7e\2\2|}\7q\2\2}~\7p\2\2~\177\7u\2\2\177\u0080\7v\2\2\u0080\u0081"+
		"\7t\2\2\u0081\u0082\7w\2\2\u0082\u0083\7e\2\2\u0083\u0084\7v\2\2\u0084"+
		"\u0085\7q\2\2\u0085\u0086\7t\2\2\u0086\30\3\2\2\2\u0087\u0088\7f\2\2\u0088"+
		"\u0089\7g\2\2\u0089\u008a\7u\2\2\u008a\u008b\7v\2\2\u008b\u008c\7t\2\2"+
		"\u008c\u008d\7w\2\2\u008d\u008e\7e\2\2\u008e\u008f\7v\2\2\u008f\u0090"+
		"\7q\2\2\u0090\u0091\7t\2\2\u0091\32\3\2\2\2\u0092\u0093\7r\2\2\u0093\u0094"+
		"\7t\2\2\u0094\u0095\7q\2\2\u0095\u0096\7e\2\2\u0096\u0097\7g\2\2\u0097"+
		"\u0098\7f\2\2\u0098\u0099\7w\2\2\u0099\u009a\7t\2\2\u009a\u009b\7g\2\2"+
		"\u009b\34\3\2\2\2\u009c\u009d\7h\2\2\u009d\u009e\7w\2\2\u009e\u009f\7"+
		"p\2\2\u009f\u00a0\7e\2\2\u00a0\u00a1\7v\2\2\u00a1\u00a2\7k\2\2\u00a2\u00a3"+
		"\7q\2\2\u00a3\u00a4\7p\2\2\u00a4\36\3\2\2\2\u00a5\u00a6\7x\2\2\u00a6\u00a7"+
		"\7c\2\2\u00a7\u00a8\7t\2\2\u00a8 \3\2\2\2\u00a9\u00aa\7.\2\2\u00aa\"\3"+
		"\2\2\2\u00ab\u00ac\7K\2\2\u00ac\u00ad\7p\2\2\u00ad\u00ae\7v\2\2\u00ae"+
		"\u00af\7g\2\2\u00af\u00b0\7i\2\2\u00b0\u00b1\7g\2\2\u00b1\u00b2\7t\2\2"+
		"\u00b2$\3\2\2\2\u00b3\u00b4\7U\2\2\u00b4\u00b5\7v\2\2\u00b5\u00b6\7t\2"+
		"\2\u00b6\u00b7\7k\2\2\u00b7\u00b8\7p\2\2\u00b8\u00b9\7i\2\2\u00b9&\3\2"+
		"\2\2\u00ba\u00bb\7D\2\2\u00bb\u00bc\7q\2\2\u00bc\u00bd\7q\2\2\u00bd\u00be"+
		"\7n\2\2\u00be\u00bf\7g\2\2\u00bf\u00c0\7c\2\2\u00c0\u00c1\7p\2\2\u00c1"+
		"(\3\2\2\2\u00c2\u00c3\7<\2\2\u00c3\u00c4\7?\2\2\u00c4*\3\2\2\2\u00c5\u00c6"+
		"\7Y\2\2\u00c6\u00c7\7t\2\2\u00c7\u00c8\7k\2\2\u00c8\u00c9\7v\2\2\u00c9"+
		"\u00ca\7g\2\2\u00ca\u00cb\7N\2\2\u00cb\u00cc\7p\2\2\u00cc,\3\2\2\2\u00cd"+
		"\u00ce\7y\2\2\u00ce\u00cf\7j\2\2\u00cf\u00d0\7k\2\2\u00d0\u00d1\7n\2\2"+
		"\u00d1\u00d2\7g\2\2\u00d2\u00d3\7N\2\2\u00d3\u00d4\7q\2\2\u00d4\u00d5"+
		"\7q\2\2\u00d5\u00d6\7r\2\2\u00d6.\3\2\2\2\u00d7\u00d8\7f\2\2\u00d8\u00d9"+
		"\7q\2\2\u00d9\u00da\7N\2\2\u00da\u00db\7q\2\2\u00db\u00dc\7q\2\2\u00dc"+
		"\u00dd\7r\2\2\u00dd\60\3\2\2\2\u00de\u00df\7h\2\2\u00df\u00e0\7q\2\2\u00e0"+
		"\u00e1\7t\2\2\u00e1\u00e2\7N\2\2\u00e2\u00e3\7q\2\2\u00e3\u00e4\7q\2\2"+
		"\u00e4\u00e5\7r\2\2\u00e5\62\3\2\2\2\u00e6\u00e7\7v\2\2\u00e7\u00e8\7"+
		"q\2\2\u00e8\u00e9\7N\2\2\u00e9\u00ea\7q\2\2\u00ea\u00eb\7q\2\2\u00eb\u00ec"+
		"\7r\2\2\u00ec\64\3\2\2\2\u00ed\u00ee\7d\2\2\u00ee\u00ef\7t\2\2\u00ef\u00f0"+
		"\7g\2\2\u00f0\u00f1\7c\2\2\u00f1\u00f2\7m\2\2\u00f2\66\3\2\2\2\u00f3\u00f4"+
		"\7e\2\2\u00f4\u00f5\7q\2\2\u00f5\u00f6\7p\2\2\u00f6\u00f7\7v\2\2\u00f7"+
		"\u00f8\7k\2\2\u00f8\u00f9\7p\2\2\u00f9\u00fa\7w\2\2\u00fa\u00fb\7g\2\2"+
		"\u00fb8\3\2\2\2\u00fc\u0100\t\2\2\2\u00fd\u00ff\t\3\2\2\u00fe\u00fd\3"+
		"\2\2\2\u00ff\u0102\3\2\2\2\u0100\u00fe\3\2\2\2\u0100\u0101\3\2\2\2\u0101"+
		":\3\2\2\2\u0102\u0100\3\2\2\2\u0103\u0105\t\4\2\2\u0104\u0103\3\2\2\2"+
		"\u0105\u0106\3\2\2\2\u0106\u0104\3\2\2\2\u0106\u0107\3\2\2\2\u0107<\3"+
		"\2\2\2\u0108\u0109\7<\2\2\u0109>\3\2\2\2\u010a\u010b\7=\2\2\u010b@\3\2"+
		"\2\2\u010c\u010e\7\17\2\2\u010d\u010c\3\2\2\2\u010d\u010e\3\2\2\2\u010e"+
		"\u010f\3\2\2\2\u010f\u0110\7\f\2\2\u0110\u0111\3\2\2\2\u0111\u0112\b!"+
		"\2\2\u0112B\3\2\2\2\u0113\u0115\t\5\2\2\u0114\u0113\3\2\2\2\u0115\u0116"+
		"\3\2\2\2\u0116\u0114\3\2\2\2\u0116\u0117\3\2\2\2\u0117\u0118\3\2\2\2\u0118"+
		"\u0119\b\"\2\2\u0119D\3\2\2\2\u011a\u011b\7?\2\2\u011bF\3\2\2\2\u011c"+
		"\u011d\7>\2\2\u011d\u011e\7@\2\2\u011eH\3\2\2\2\7\2\u0100\u0106\u010d"+
		"\u0116\3\b\2\2";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}