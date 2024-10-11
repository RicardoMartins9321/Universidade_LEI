// Generated from /home/ricardo/Universidade/Compiladores/Guião2/bloco2/b2_09/FracCalculator.g4 by ANTLR 4.13.1
import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.misc.*;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast", "CheckReturnValue", "this-escape"})
public class FracCalculatorLexer extends Lexer {
	static { RuntimeMetaData.checkVersion("4.13.1", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, T__2=3, T__3=4, T__4=5, T__5=6, T__6=7, T__7=8, T__8=9, 
		T__9=10, T__10=11, T__11=12, T__12=13, T__13=14, ID=15, Integer=16, StringLiteral=17, 
		NEWLINE=18, WS=19, COMMENT=20, LINE_COMMENT=21;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	private static String[] makeRuleNames() {
		return new String[] {
			"T__0", "T__1", "T__2", "T__3", "T__4", "T__5", "T__6", "T__7", "T__8", 
			"T__9", "T__10", "T__11", "T__12", "T__13", "ID", "Integer", "StringLiteral", 
			"NEWLINE", "WS", "COMMENT", "LINE_COMMENT"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "';'", "'print'", "'->'", "'read'", "'to'", "'^'", "'+'", "'-'", 
			"'reduce'", "'*'", "':'", "'/'", "'('", "')'"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, "ID", "Integer", "StringLiteral", "NEWLINE", "WS", 
			"COMMENT", "LINE_COMMENT"
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


	public FracCalculatorLexer(CharStream input) {
		super(input);
		_interp = new LexerATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	@Override
	public String getGrammarFileName() { return "FracCalculator.g4"; }

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
		"\u0004\u0000\u0015\u008d\u0006\uffff\uffff\u0002\u0000\u0007\u0000\u0002"+
		"\u0001\u0007\u0001\u0002\u0002\u0007\u0002\u0002\u0003\u0007\u0003\u0002"+
		"\u0004\u0007\u0004\u0002\u0005\u0007\u0005\u0002\u0006\u0007\u0006\u0002"+
		"\u0007\u0007\u0007\u0002\b\u0007\b\u0002\t\u0007\t\u0002\n\u0007\n\u0002"+
		"\u000b\u0007\u000b\u0002\f\u0007\f\u0002\r\u0007\r\u0002\u000e\u0007\u000e"+
		"\u0002\u000f\u0007\u000f\u0002\u0010\u0007\u0010\u0002\u0011\u0007\u0011"+
		"\u0002\u0012\u0007\u0012\u0002\u0013\u0007\u0013\u0002\u0014\u0007\u0014"+
		"\u0001\u0000\u0001\u0000\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001"+
		"\u0001\u0001\u0001\u0001\u0001\u0002\u0001\u0002\u0001\u0002\u0001\u0003"+
		"\u0001\u0003\u0001\u0003\u0001\u0003\u0001\u0003\u0001\u0004\u0001\u0004"+
		"\u0001\u0004\u0001\u0005\u0001\u0005\u0001\u0006\u0001\u0006\u0001\u0007"+
		"\u0001\u0007\u0001\b\u0001\b\u0001\b\u0001\b\u0001\b\u0001\b\u0001\b\u0001"+
		"\t\u0001\t\u0001\n\u0001\n\u0001\u000b\u0001\u000b\u0001\f\u0001\f\u0001"+
		"\r\u0001\r\u0001\u000e\u0004\u000eW\b\u000e\u000b\u000e\f\u000eX\u0001"+
		"\u000f\u0003\u000f\\\b\u000f\u0001\u000f\u0004\u000f_\b\u000f\u000b\u000f"+
		"\f\u000f`\u0001\u0010\u0001\u0010\u0005\u0010e\b\u0010\n\u0010\f\u0010"+
		"h\t\u0010\u0001\u0010\u0001\u0010\u0001\u0011\u0003\u0011m\b\u0011\u0001"+
		"\u0011\u0001\u0011\u0001\u0012\u0004\u0012r\b\u0012\u000b\u0012\f\u0012"+
		"s\u0001\u0012\u0001\u0012\u0001\u0013\u0001\u0013\u0005\u0013z\b\u0013"+
		"\n\u0013\f\u0013}\t\u0013\u0001\u0013\u0001\u0013\u0001\u0013\u0001\u0013"+
		"\u0001\u0014\u0001\u0014\u0001\u0014\u0001\u0014\u0005\u0014\u0087\b\u0014"+
		"\n\u0014\f\u0014\u008a\t\u0014\u0001\u0014\u0001\u0014\u0001{\u0000\u0015"+
		"\u0001\u0001\u0003\u0002\u0005\u0003\u0007\u0004\t\u0005\u000b\u0006\r"+
		"\u0007\u000f\b\u0011\t\u0013\n\u0015\u000b\u0017\f\u0019\r\u001b\u000e"+
		"\u001d\u000f\u001f\u0010!\u0011#\u0012%\u0013\'\u0014)\u0015\u0001\u0000"+
		"\u0005\u0002\u0000AZaz\u0001\u000009\u0001\u0000\"\"\u0002\u0000\t\t "+
		" \u0002\u0000\n\n\r\r\u0094\u0000\u0001\u0001\u0000\u0000\u0000\u0000"+
		"\u0003\u0001\u0000\u0000\u0000\u0000\u0005\u0001\u0000\u0000\u0000\u0000"+
		"\u0007\u0001\u0000\u0000\u0000\u0000\t\u0001\u0000\u0000\u0000\u0000\u000b"+
		"\u0001\u0000\u0000\u0000\u0000\r\u0001\u0000\u0000\u0000\u0000\u000f\u0001"+
		"\u0000\u0000\u0000\u0000\u0011\u0001\u0000\u0000\u0000\u0000\u0013\u0001"+
		"\u0000\u0000\u0000\u0000\u0015\u0001\u0000\u0000\u0000\u0000\u0017\u0001"+
		"\u0000\u0000\u0000\u0000\u0019\u0001\u0000\u0000\u0000\u0000\u001b\u0001"+
		"\u0000\u0000\u0000\u0000\u001d\u0001\u0000\u0000\u0000\u0000\u001f\u0001"+
		"\u0000\u0000\u0000\u0000!\u0001\u0000\u0000\u0000\u0000#\u0001\u0000\u0000"+
		"\u0000\u0000%\u0001\u0000\u0000\u0000\u0000\'\u0001\u0000\u0000\u0000"+
		"\u0000)\u0001\u0000\u0000\u0000\u0001+\u0001\u0000\u0000\u0000\u0003-"+
		"\u0001\u0000\u0000\u0000\u00053\u0001\u0000\u0000\u0000\u00076\u0001\u0000"+
		"\u0000\u0000\t;\u0001\u0000\u0000\u0000\u000b>\u0001\u0000\u0000\u0000"+
		"\r@\u0001\u0000\u0000\u0000\u000fB\u0001\u0000\u0000\u0000\u0011D\u0001"+
		"\u0000\u0000\u0000\u0013K\u0001\u0000\u0000\u0000\u0015M\u0001\u0000\u0000"+
		"\u0000\u0017O\u0001\u0000\u0000\u0000\u0019Q\u0001\u0000\u0000\u0000\u001b"+
		"S\u0001\u0000\u0000\u0000\u001dV\u0001\u0000\u0000\u0000\u001f[\u0001"+
		"\u0000\u0000\u0000!b\u0001\u0000\u0000\u0000#l\u0001\u0000\u0000\u0000"+
		"%q\u0001\u0000\u0000\u0000\'w\u0001\u0000\u0000\u0000)\u0082\u0001\u0000"+
		"\u0000\u0000+,\u0005;\u0000\u0000,\u0002\u0001\u0000\u0000\u0000-.\u0005"+
		"p\u0000\u0000./\u0005r\u0000\u0000/0\u0005i\u0000\u000001\u0005n\u0000"+
		"\u000012\u0005t\u0000\u00002\u0004\u0001\u0000\u0000\u000034\u0005-\u0000"+
		"\u000045\u0005>\u0000\u00005\u0006\u0001\u0000\u0000\u000067\u0005r\u0000"+
		"\u000078\u0005e\u0000\u000089\u0005a\u0000\u00009:\u0005d\u0000\u0000"+
		":\b\u0001\u0000\u0000\u0000;<\u0005t\u0000\u0000<=\u0005o\u0000\u0000"+
		"=\n\u0001\u0000\u0000\u0000>?\u0005^\u0000\u0000?\f\u0001\u0000\u0000"+
		"\u0000@A\u0005+\u0000\u0000A\u000e\u0001\u0000\u0000\u0000BC\u0005-\u0000"+
		"\u0000C\u0010\u0001\u0000\u0000\u0000DE\u0005r\u0000\u0000EF\u0005e\u0000"+
		"\u0000FG\u0005d\u0000\u0000GH\u0005u\u0000\u0000HI\u0005c\u0000\u0000"+
		"IJ\u0005e\u0000\u0000J\u0012\u0001\u0000\u0000\u0000KL\u0005*\u0000\u0000"+
		"L\u0014\u0001\u0000\u0000\u0000MN\u0005:\u0000\u0000N\u0016\u0001\u0000"+
		"\u0000\u0000OP\u0005/\u0000\u0000P\u0018\u0001\u0000\u0000\u0000QR\u0005"+
		"(\u0000\u0000R\u001a\u0001\u0000\u0000\u0000ST\u0005)\u0000\u0000T\u001c"+
		"\u0001\u0000\u0000\u0000UW\u0007\u0000\u0000\u0000VU\u0001\u0000\u0000"+
		"\u0000WX\u0001\u0000\u0000\u0000XV\u0001\u0000\u0000\u0000XY\u0001\u0000"+
		"\u0000\u0000Y\u001e\u0001\u0000\u0000\u0000Z\\\u0005-\u0000\u0000[Z\u0001"+
		"\u0000\u0000\u0000[\\\u0001\u0000\u0000\u0000\\^\u0001\u0000\u0000\u0000"+
		"]_\u0007\u0001\u0000\u0000^]\u0001\u0000\u0000\u0000_`\u0001\u0000\u0000"+
		"\u0000`^\u0001\u0000\u0000\u0000`a\u0001\u0000\u0000\u0000a \u0001\u0000"+
		"\u0000\u0000bf\u0005\"\u0000\u0000ce\b\u0002\u0000\u0000dc\u0001\u0000"+
		"\u0000\u0000eh\u0001\u0000\u0000\u0000fd\u0001\u0000\u0000\u0000fg\u0001"+
		"\u0000\u0000\u0000gi\u0001\u0000\u0000\u0000hf\u0001\u0000\u0000\u0000"+
		"ij\u0005\"\u0000\u0000j\"\u0001\u0000\u0000\u0000km\u0005\r\u0000\u0000"+
		"lk\u0001\u0000\u0000\u0000lm\u0001\u0000\u0000\u0000mn\u0001\u0000\u0000"+
		"\u0000no\u0005\n\u0000\u0000o$\u0001\u0000\u0000\u0000pr\u0007\u0003\u0000"+
		"\u0000qp\u0001\u0000\u0000\u0000rs\u0001\u0000\u0000\u0000sq\u0001\u0000"+
		"\u0000\u0000st\u0001\u0000\u0000\u0000tu\u0001\u0000\u0000\u0000uv\u0006"+
		"\u0012\u0000\u0000v&\u0001\u0000\u0000\u0000w{\u0005#\u0000\u0000xz\t"+
		"\u0000\u0000\u0000yx\u0001\u0000\u0000\u0000z}\u0001\u0000\u0000\u0000"+
		"{|\u0001\u0000\u0000\u0000{y\u0001\u0000\u0000\u0000|~\u0001\u0000\u0000"+
		"\u0000}{\u0001\u0000\u0000\u0000~\u007f\u0005\n\u0000\u0000\u007f\u0080"+
		"\u0001\u0000\u0000\u0000\u0080\u0081\u0006\u0013\u0000\u0000\u0081(\u0001"+
		"\u0000\u0000\u0000\u0082\u0083\u0005/\u0000\u0000\u0083\u0084\u0005/\u0000"+
		"\u0000\u0084\u0088\u0001\u0000\u0000\u0000\u0085\u0087\b\u0004\u0000\u0000"+
		"\u0086\u0085\u0001\u0000\u0000\u0000\u0087\u008a\u0001\u0000\u0000\u0000"+
		"\u0088\u0086\u0001\u0000\u0000\u0000\u0088\u0089\u0001\u0000\u0000\u0000"+
		"\u0089\u008b\u0001\u0000\u0000\u0000\u008a\u0088\u0001\u0000\u0000\u0000"+
		"\u008b\u008c\u0006\u0014\u0000\u0000\u008c*\u0001\u0000\u0000\u0000\t"+
		"\u0000X[`fls{\u0088\u0001\u0006\u0000\u0000";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}