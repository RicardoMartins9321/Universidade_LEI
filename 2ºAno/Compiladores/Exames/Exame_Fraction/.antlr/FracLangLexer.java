// Generated from /home/ricardo/Universidade/Compiladores/Exames/Exame_Fraction/FracLang.g4 by ANTLR 4.13.1
import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.misc.*;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast", "CheckReturnValue", "this-escape"})
public class FracLangLexer extends Lexer {
	static { RuntimeMetaData.checkVersion("4.13.1", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, T__2=3, T__3=4, T__4=5, T__5=6, T__6=7, T__7=8, T__8=9, 
		T__9=10, T__10=11, INT=12, FRACTION=13, ID=14, STRING=15, COMMENT=16, 
		NEWLINE=17, WS=18, ERROR=19;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	private static String[] makeRuleNames() {
		return new String[] {
			"T__0", "T__1", "T__2", "T__3", "T__4", "T__5", "T__6", "T__7", "T__8", 
			"T__9", "T__10", "INT", "FRACTION", "ID", "STRING", "COMMENT", "NEWLINE", 
			"WS", "ERROR"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "';'", "'('", "')'", "'+'", "'-'", "'*'", "':'", "'reduce'", "'read'", 
			"'<='", "'display'"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, null, null, null, null, null, null, null, null, null, null, null, 
			"INT", "FRACTION", "ID", "STRING", "COMMENT", "NEWLINE", "WS", "ERROR"
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


	public FracLangLexer(CharStream input) {
		super(input);
		_interp = new LexerATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	@Override
	public String getGrammarFileName() { return "FracLang.g4"; }

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
		"\u0004\u0000\u0013\u0081\u0006\uffff\uffff\u0002\u0000\u0007\u0000\u0002"+
		"\u0001\u0007\u0001\u0002\u0002\u0007\u0002\u0002\u0003\u0007\u0003\u0002"+
		"\u0004\u0007\u0004\u0002\u0005\u0007\u0005\u0002\u0006\u0007\u0006\u0002"+
		"\u0007\u0007\u0007\u0002\b\u0007\b\u0002\t\u0007\t\u0002\n\u0007\n\u0002"+
		"\u000b\u0007\u000b\u0002\f\u0007\f\u0002\r\u0007\r\u0002\u000e\u0007\u000e"+
		"\u0002\u000f\u0007\u000f\u0002\u0010\u0007\u0010\u0002\u0011\u0007\u0011"+
		"\u0002\u0012\u0007\u0012\u0001\u0000\u0001\u0000\u0001\u0001\u0001\u0001"+
		"\u0001\u0002\u0001\u0002\u0001\u0003\u0001\u0003\u0001\u0004\u0001\u0004"+
		"\u0001\u0005\u0001\u0005\u0001\u0006\u0001\u0006\u0001\u0007\u0001\u0007"+
		"\u0001\u0007\u0001\u0007\u0001\u0007\u0001\u0007\u0001\u0007\u0001\b\u0001"+
		"\b\u0001\b\u0001\b\u0001\b\u0001\t\u0001\t\u0001\t\u0001\n\u0001\n\u0001"+
		"\n\u0001\n\u0001\n\u0001\n\u0001\n\u0001\n\u0001\u000b\u0004\u000bN\b"+
		"\u000b\u000b\u000b\f\u000bO\u0001\f\u0001\f\u0001\f\u0003\fU\b\f\u0001"+
		"\r\u0004\rX\b\r\u000b\r\f\rY\u0001\u000e\u0001\u000e\u0005\u000e^\b\u000e"+
		"\n\u000e\f\u000ea\t\u000e\u0001\u000e\u0001\u000e\u0001\u000f\u0001\u000f"+
		"\u0001\u000f\u0001\u000f\u0005\u000fi\b\u000f\n\u000f\f\u000fl\t\u000f"+
		"\u0001\u000f\u0001\u000f\u0001\u000f\u0001\u000f\u0001\u0010\u0003\u0010"+
		"s\b\u0010\u0001\u0010\u0001\u0010\u0001\u0010\u0001\u0010\u0001\u0011"+
		"\u0004\u0011z\b\u0011\u000b\u0011\f\u0011{\u0001\u0011\u0001\u0011\u0001"+
		"\u0012\u0001\u0012\u0002_j\u0000\u0013\u0001\u0001\u0003\u0002\u0005\u0003"+
		"\u0007\u0004\t\u0005\u000b\u0006\r\u0007\u000f\b\u0011\t\u0013\n\u0015"+
		"\u000b\u0017\f\u0019\r\u001b\u000e\u001d\u000f\u001f\u0010!\u0011#\u0012"+
		"%\u0013\u0001\u0000\u0003\u0001\u000009\u0003\u000009__az\u0003\u0000"+
		"\t\n\r\r  \u0087\u0000\u0001\u0001\u0000\u0000\u0000\u0000\u0003\u0001"+
		"\u0000\u0000\u0000\u0000\u0005\u0001\u0000\u0000\u0000\u0000\u0007\u0001"+
		"\u0000\u0000\u0000\u0000\t\u0001\u0000\u0000\u0000\u0000\u000b\u0001\u0000"+
		"\u0000\u0000\u0000\r\u0001\u0000\u0000\u0000\u0000\u000f\u0001\u0000\u0000"+
		"\u0000\u0000\u0011\u0001\u0000\u0000\u0000\u0000\u0013\u0001\u0000\u0000"+
		"\u0000\u0000\u0015\u0001\u0000\u0000\u0000\u0000\u0017\u0001\u0000\u0000"+
		"\u0000\u0000\u0019\u0001\u0000\u0000\u0000\u0000\u001b\u0001\u0000\u0000"+
		"\u0000\u0000\u001d\u0001\u0000\u0000\u0000\u0000\u001f\u0001\u0000\u0000"+
		"\u0000\u0000!\u0001\u0000\u0000\u0000\u0000#\u0001\u0000\u0000\u0000\u0000"+
		"%\u0001\u0000\u0000\u0000\u0001\'\u0001\u0000\u0000\u0000\u0003)\u0001"+
		"\u0000\u0000\u0000\u0005+\u0001\u0000\u0000\u0000\u0007-\u0001\u0000\u0000"+
		"\u0000\t/\u0001\u0000\u0000\u0000\u000b1\u0001\u0000\u0000\u0000\r3\u0001"+
		"\u0000\u0000\u0000\u000f5\u0001\u0000\u0000\u0000\u0011<\u0001\u0000\u0000"+
		"\u0000\u0013A\u0001\u0000\u0000\u0000\u0015D\u0001\u0000\u0000\u0000\u0017"+
		"M\u0001\u0000\u0000\u0000\u0019Q\u0001\u0000\u0000\u0000\u001bW\u0001"+
		"\u0000\u0000\u0000\u001d[\u0001\u0000\u0000\u0000\u001fd\u0001\u0000\u0000"+
		"\u0000!r\u0001\u0000\u0000\u0000#y\u0001\u0000\u0000\u0000%\u007f\u0001"+
		"\u0000\u0000\u0000\'(\u0005;\u0000\u0000(\u0002\u0001\u0000\u0000\u0000"+
		")*\u0005(\u0000\u0000*\u0004\u0001\u0000\u0000\u0000+,\u0005)\u0000\u0000"+
		",\u0006\u0001\u0000\u0000\u0000-.\u0005+\u0000\u0000.\b\u0001\u0000\u0000"+
		"\u0000/0\u0005-\u0000\u00000\n\u0001\u0000\u0000\u000012\u0005*\u0000"+
		"\u00002\f\u0001\u0000\u0000\u000034\u0005:\u0000\u00004\u000e\u0001\u0000"+
		"\u0000\u000056\u0005r\u0000\u000067\u0005e\u0000\u000078\u0005d\u0000"+
		"\u000089\u0005u\u0000\u00009:\u0005c\u0000\u0000:;\u0005e\u0000\u0000"+
		";\u0010\u0001\u0000\u0000\u0000<=\u0005r\u0000\u0000=>\u0005e\u0000\u0000"+
		">?\u0005a\u0000\u0000?@\u0005d\u0000\u0000@\u0012\u0001\u0000\u0000\u0000"+
		"AB\u0005<\u0000\u0000BC\u0005=\u0000\u0000C\u0014\u0001\u0000\u0000\u0000"+
		"DE\u0005d\u0000\u0000EF\u0005i\u0000\u0000FG\u0005s\u0000\u0000GH\u0005"+
		"p\u0000\u0000HI\u0005l\u0000\u0000IJ\u0005a\u0000\u0000JK\u0005y\u0000"+
		"\u0000K\u0016\u0001\u0000\u0000\u0000LN\u0007\u0000\u0000\u0000ML\u0001"+
		"\u0000\u0000\u0000NO\u0001\u0000\u0000\u0000OM\u0001\u0000\u0000\u0000"+
		"OP\u0001\u0000\u0000\u0000P\u0018\u0001\u0000\u0000\u0000QT\u0003\u0017"+
		"\u000b\u0000RS\u0005/\u0000\u0000SU\u0003\u0017\u000b\u0000TR\u0001\u0000"+
		"\u0000\u0000TU\u0001\u0000\u0000\u0000U\u001a\u0001\u0000\u0000\u0000"+
		"VX\u0007\u0001\u0000\u0000WV\u0001\u0000\u0000\u0000XY\u0001\u0000\u0000"+
		"\u0000YW\u0001\u0000\u0000\u0000YZ\u0001\u0000\u0000\u0000Z\u001c\u0001"+
		"\u0000\u0000\u0000[_\u0005\"\u0000\u0000\\^\t\u0000\u0000\u0000]\\\u0001"+
		"\u0000\u0000\u0000^a\u0001\u0000\u0000\u0000_`\u0001\u0000\u0000\u0000"+
		"_]\u0001\u0000\u0000\u0000`b\u0001\u0000\u0000\u0000a_\u0001\u0000\u0000"+
		"\u0000bc\u0005\"\u0000\u0000c\u001e\u0001\u0000\u0000\u0000de\u0005-\u0000"+
		"\u0000ef\u0005-\u0000\u0000fj\u0001\u0000\u0000\u0000gi\t\u0000\u0000"+
		"\u0000hg\u0001\u0000\u0000\u0000il\u0001\u0000\u0000\u0000jk\u0001\u0000"+
		"\u0000\u0000jh\u0001\u0000\u0000\u0000km\u0001\u0000\u0000\u0000lj\u0001"+
		"\u0000\u0000\u0000mn\u0005\n\u0000\u0000no\u0001\u0000\u0000\u0000op\u0006"+
		"\u000f\u0000\u0000p \u0001\u0000\u0000\u0000qs\u0005\r\u0000\u0000rq\u0001"+
		"\u0000\u0000\u0000rs\u0001\u0000\u0000\u0000st\u0001\u0000\u0000\u0000"+
		"tu\u0005\n\u0000\u0000uv\u0001\u0000\u0000\u0000vw\u0006\u0010\u0000\u0000"+
		"w\"\u0001\u0000\u0000\u0000xz\u0007\u0002\u0000\u0000yx\u0001\u0000\u0000"+
		"\u0000z{\u0001\u0000\u0000\u0000{y\u0001\u0000\u0000\u0000{|\u0001\u0000"+
		"\u0000\u0000|}\u0001\u0000\u0000\u0000}~\u0006\u0011\u0000\u0000~$\u0001"+
		"\u0000\u0000\u0000\u007f\u0080\t\u0000\u0000\u0000\u0080&\u0001\u0000"+
		"\u0000\u0000\b\u0000OTY_jr{\u0001\u0006\u0000\u0000";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}