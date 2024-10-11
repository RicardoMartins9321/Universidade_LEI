// Generated from /home/ricardo/Universidade/Compiladores/Exames/MinhaResolucao_StrLang/StrLang.g4 by ANTLR 4.13.1
import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.misc.*;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast", "CheckReturnValue", "this-escape"})
public class StrLangLexer extends Lexer {
	static { RuntimeMetaData.checkVersion("4.13.1", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, T__2=3, T__3=4, T__4=5, T__5=6, T__6=7, T__7=8, T__8=9, 
		T__9=10, STRING=11, ID=12, COMMENT=13, WS=14, NEWLINE=15, ERROR=16;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	private static String[] makeRuleNames() {
		return new String[] {
			"T__0", "T__1", "T__2", "T__3", "T__4", "T__5", "T__6", "T__7", "T__8", 
			"T__9", "STRING", "ID", "COMMENT", "WS", "NEWLINE", "ERROR"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "'('", "')'", "'input'", "'+'", "'-'", "'trim'", "'/'", "'print'", 
			"','", "':'"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, null, null, null, null, null, null, null, null, null, null, "STRING", 
			"ID", "COMMENT", "WS", "NEWLINE", "ERROR"
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


	public StrLangLexer(CharStream input) {
		super(input);
		_interp = new LexerATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	@Override
	public String getGrammarFileName() { return "StrLang.g4"; }

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
		"\u0004\u0000\u0010m\u0006\uffff\uffff\u0002\u0000\u0007\u0000\u0002\u0001"+
		"\u0007\u0001\u0002\u0002\u0007\u0002\u0002\u0003\u0007\u0003\u0002\u0004"+
		"\u0007\u0004\u0002\u0005\u0007\u0005\u0002\u0006\u0007\u0006\u0002\u0007"+
		"\u0007\u0007\u0002\b\u0007\b\u0002\t\u0007\t\u0002\n\u0007\n\u0002\u000b"+
		"\u0007\u000b\u0002\f\u0007\f\u0002\r\u0007\r\u0002\u000e\u0007\u000e\u0002"+
		"\u000f\u0007\u000f\u0001\u0000\u0001\u0000\u0001\u0001\u0001\u0001\u0001"+
		"\u0002\u0001\u0002\u0001\u0002\u0001\u0002\u0001\u0002\u0001\u0002\u0001"+
		"\u0003\u0001\u0003\u0001\u0004\u0001\u0004\u0001\u0005\u0001\u0005\u0001"+
		"\u0005\u0001\u0005\u0001\u0005\u0001\u0006\u0001\u0006\u0001\u0007\u0001"+
		"\u0007\u0001\u0007\u0001\u0007\u0001\u0007\u0001\u0007\u0001\b\u0001\b"+
		"\u0001\t\u0001\t\u0001\n\u0001\n\u0005\nC\b\n\n\n\f\nF\t\n\u0001\n\u0001"+
		"\n\u0001\u000b\u0001\u000b\u0005\u000bL\b\u000b\n\u000b\f\u000bO\t\u000b"+
		"\u0001\f\u0001\f\u0001\f\u0001\f\u0005\fU\b\f\n\f\f\fX\t\f\u0001\f\u0001"+
		"\f\u0001\f\u0001\f\u0001\r\u0004\r_\b\r\u000b\r\f\r`\u0001\r\u0001\r\u0001"+
		"\u000e\u0003\u000ef\b\u000e\u0001\u000e\u0001\u000e\u0001\u000e\u0001"+
		"\u000e\u0001\u000f\u0001\u000f\u0002DV\u0000\u0010\u0001\u0001\u0003\u0002"+
		"\u0005\u0003\u0007\u0004\t\u0005\u000b\u0006\r\u0007\u000f\b\u0011\t\u0013"+
		"\n\u0015\u000b\u0017\f\u0019\r\u001b\u000e\u001d\u000f\u001f\u0010\u0001"+
		"\u0000\u0003\u0003\u0000AZ__az\u0004\u000009AZ__az\u0003\u0000\t\n\r\r"+
		"  q\u0000\u0001\u0001\u0000\u0000\u0000\u0000\u0003\u0001\u0000\u0000"+
		"\u0000\u0000\u0005\u0001\u0000\u0000\u0000\u0000\u0007\u0001\u0000\u0000"+
		"\u0000\u0000\t\u0001\u0000\u0000\u0000\u0000\u000b\u0001\u0000\u0000\u0000"+
		"\u0000\r\u0001\u0000\u0000\u0000\u0000\u000f\u0001\u0000\u0000\u0000\u0000"+
		"\u0011\u0001\u0000\u0000\u0000\u0000\u0013\u0001\u0000\u0000\u0000\u0000"+
		"\u0015\u0001\u0000\u0000\u0000\u0000\u0017\u0001\u0000\u0000\u0000\u0000"+
		"\u0019\u0001\u0000\u0000\u0000\u0000\u001b\u0001\u0000\u0000\u0000\u0000"+
		"\u001d\u0001\u0000\u0000\u0000\u0000\u001f\u0001\u0000\u0000\u0000\u0001"+
		"!\u0001\u0000\u0000\u0000\u0003#\u0001\u0000\u0000\u0000\u0005%\u0001"+
		"\u0000\u0000\u0000\u0007+\u0001\u0000\u0000\u0000\t-\u0001\u0000\u0000"+
		"\u0000\u000b/\u0001\u0000\u0000\u0000\r4\u0001\u0000\u0000\u0000\u000f"+
		"6\u0001\u0000\u0000\u0000\u0011<\u0001\u0000\u0000\u0000\u0013>\u0001"+
		"\u0000\u0000\u0000\u0015@\u0001\u0000\u0000\u0000\u0017I\u0001\u0000\u0000"+
		"\u0000\u0019P\u0001\u0000\u0000\u0000\u001b^\u0001\u0000\u0000\u0000\u001d"+
		"e\u0001\u0000\u0000\u0000\u001fk\u0001\u0000\u0000\u0000!\"\u0005(\u0000"+
		"\u0000\"\u0002\u0001\u0000\u0000\u0000#$\u0005)\u0000\u0000$\u0004\u0001"+
		"\u0000\u0000\u0000%&\u0005i\u0000\u0000&\'\u0005n\u0000\u0000\'(\u0005"+
		"p\u0000\u0000()\u0005u\u0000\u0000)*\u0005t\u0000\u0000*\u0006\u0001\u0000"+
		"\u0000\u0000+,\u0005+\u0000\u0000,\b\u0001\u0000\u0000\u0000-.\u0005-"+
		"\u0000\u0000.\n\u0001\u0000\u0000\u0000/0\u0005t\u0000\u000001\u0005r"+
		"\u0000\u000012\u0005i\u0000\u000023\u0005m\u0000\u00003\f\u0001\u0000"+
		"\u0000\u000045\u0005/\u0000\u00005\u000e\u0001\u0000\u0000\u000067\u0005"+
		"p\u0000\u000078\u0005r\u0000\u000089\u0005i\u0000\u00009:\u0005n\u0000"+
		"\u0000:;\u0005t\u0000\u0000;\u0010\u0001\u0000\u0000\u0000<=\u0005,\u0000"+
		"\u0000=\u0012\u0001\u0000\u0000\u0000>?\u0005:\u0000\u0000?\u0014\u0001"+
		"\u0000\u0000\u0000@D\u0005\"\u0000\u0000AC\t\u0000\u0000\u0000BA\u0001"+
		"\u0000\u0000\u0000CF\u0001\u0000\u0000\u0000DE\u0001\u0000\u0000\u0000"+
		"DB\u0001\u0000\u0000\u0000EG\u0001\u0000\u0000\u0000FD\u0001\u0000\u0000"+
		"\u0000GH\u0005\"\u0000\u0000H\u0016\u0001\u0000\u0000\u0000IM\u0007\u0000"+
		"\u0000\u0000JL\u0007\u0001\u0000\u0000KJ\u0001\u0000\u0000\u0000LO\u0001"+
		"\u0000\u0000\u0000MK\u0001\u0000\u0000\u0000MN\u0001\u0000\u0000\u0000"+
		"N\u0018\u0001\u0000\u0000\u0000OM\u0001\u0000\u0000\u0000PQ\u0005/\u0000"+
		"\u0000QR\u0005/\u0000\u0000RV\u0001\u0000\u0000\u0000SU\t\u0000\u0000"+
		"\u0000TS\u0001\u0000\u0000\u0000UX\u0001\u0000\u0000\u0000VW\u0001\u0000"+
		"\u0000\u0000VT\u0001\u0000\u0000\u0000WY\u0001\u0000\u0000\u0000XV\u0001"+
		"\u0000\u0000\u0000YZ\u0005\n\u0000\u0000Z[\u0001\u0000\u0000\u0000[\\"+
		"\u0006\f\u0000\u0000\\\u001a\u0001\u0000\u0000\u0000]_\u0007\u0002\u0000"+
		"\u0000^]\u0001\u0000\u0000\u0000_`\u0001\u0000\u0000\u0000`^\u0001\u0000"+
		"\u0000\u0000`a\u0001\u0000\u0000\u0000ab\u0001\u0000\u0000\u0000bc\u0006"+
		"\r\u0000\u0000c\u001c\u0001\u0000\u0000\u0000df\u0005\r\u0000\u0000ed"+
		"\u0001\u0000\u0000\u0000ef\u0001\u0000\u0000\u0000fg\u0001\u0000\u0000"+
		"\u0000gh\u0005\n\u0000\u0000hi\u0001\u0000\u0000\u0000ij\u0006\u000e\u0000"+
		"\u0000j\u001e\u0001\u0000\u0000\u0000kl\t\u0000\u0000\u0000l \u0001\u0000"+
		"\u0000\u0000\u0006\u0000DMV`e\u0001\u0006\u0000\u0000";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}