// Generated from /home/ricardo/Universidade/Compiladores/Guião2/bloco2/b2_09/FracCalculatorv2.g4 by ANTLR 4.13.1
import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.misc.*;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast", "CheckReturnValue", "this-escape"})
public class FracCalculatorv2Lexer extends Lexer {
	static { RuntimeMetaData.checkVersion("4.13.1", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, T__2=3, T__3=4, T__4=5, T__5=6, T__6=7, T__7=8, T__8=9, 
		T__9=10, T__10=11, T__11=12, T__12=13, ID=14, Integer=15, Fraction=16, 
		StringLiteral=17, NEWLINE=18, WS=19, COMMENT=20, LINE_COMMENT=21;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	private static String[] makeRuleNames() {
		return new String[] {
			"T__0", "T__1", "T__2", "T__3", "T__4", "T__5", "T__6", "T__7", "T__8", 
			"T__9", "T__10", "T__11", "T__12", "ID", "Integer", "Fraction", "StringLiteral", 
			"NEWLINE", "WS", "COMMENT", "LINE_COMMENT"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "';'", "'print'", "'->'", "'read'", "'to'", "'('", "')'", "'^'", 
			"'-'", "'*'", "':'", "'+'", "'reduce'"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, "ID", "Integer", "Fraction", "StringLiteral", "NEWLINE", 
			"WS", "COMMENT", "LINE_COMMENT"
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


	public FracCalculatorv2Lexer(CharStream input) {
		super(input);
		_interp = new LexerATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	@Override
	public String getGrammarFileName() { return "FracCalculatorv2.g4"; }

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
		"\u0004\u0000\u0015\u008f\u0006\uffff\uffff\u0002\u0000\u0007\u0000\u0002"+
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
		"\u0001\u0007\u0001\b\u0001\b\u0001\t\u0001\t\u0001\n\u0001\n\u0001\u000b"+
		"\u0001\u000b\u0001\f\u0001\f\u0001\f\u0001\f\u0001\f\u0001\f\u0001\f\u0001"+
		"\r\u0004\rU\b\r\u000b\r\f\rV\u0001\u000e\u0003\u000eZ\b\u000e\u0001\u000e"+
		"\u0004\u000e]\b\u000e\u000b\u000e\f\u000e^\u0001\u000f\u0001\u000f\u0001"+
		"\u000f\u0001\u000f\u0001\u0010\u0001\u0010\u0005\u0010g\b\u0010\n\u0010"+
		"\f\u0010j\t\u0010\u0001\u0010\u0001\u0010\u0001\u0011\u0003\u0011o\b\u0011"+
		"\u0001\u0011\u0001\u0011\u0001\u0012\u0004\u0012t\b\u0012\u000b\u0012"+
		"\f\u0012u\u0001\u0012\u0001\u0012\u0001\u0013\u0001\u0013\u0005\u0013"+
		"|\b\u0013\n\u0013\f\u0013\u007f\t\u0013\u0001\u0013\u0001\u0013\u0001"+
		"\u0013\u0001\u0013\u0001\u0014\u0001\u0014\u0001\u0014\u0001\u0014\u0005"+
		"\u0014\u0089\b\u0014\n\u0014\f\u0014\u008c\t\u0014\u0001\u0014\u0001\u0014"+
		"\u0001}\u0000\u0015\u0001\u0001\u0003\u0002\u0005\u0003\u0007\u0004\t"+
		"\u0005\u000b\u0006\r\u0007\u000f\b\u0011\t\u0013\n\u0015\u000b\u0017\f"+
		"\u0019\r\u001b\u000e\u001d\u000f\u001f\u0010!\u0011#\u0012%\u0013\'\u0014"+
		")\u0015\u0001\u0000\u0005\u0002\u0000AZaz\u0001\u000009\u0001\u0000\""+
		"\"\u0002\u0000\t\t  \u0002\u0000\n\n\r\r\u0096\u0000\u0001\u0001\u0000"+
		"\u0000\u0000\u0000\u0003\u0001\u0000\u0000\u0000\u0000\u0005\u0001\u0000"+
		"\u0000\u0000\u0000\u0007\u0001\u0000\u0000\u0000\u0000\t\u0001\u0000\u0000"+
		"\u0000\u0000\u000b\u0001\u0000\u0000\u0000\u0000\r\u0001\u0000\u0000\u0000"+
		"\u0000\u000f\u0001\u0000\u0000\u0000\u0000\u0011\u0001\u0000\u0000\u0000"+
		"\u0000\u0013\u0001\u0000\u0000\u0000\u0000\u0015\u0001\u0000\u0000\u0000"+
		"\u0000\u0017\u0001\u0000\u0000\u0000\u0000\u0019\u0001\u0000\u0000\u0000"+
		"\u0000\u001b\u0001\u0000\u0000\u0000\u0000\u001d\u0001\u0000\u0000\u0000"+
		"\u0000\u001f\u0001\u0000\u0000\u0000\u0000!\u0001\u0000\u0000\u0000\u0000"+
		"#\u0001\u0000\u0000\u0000\u0000%\u0001\u0000\u0000\u0000\u0000\'\u0001"+
		"\u0000\u0000\u0000\u0000)\u0001\u0000\u0000\u0000\u0001+\u0001\u0000\u0000"+
		"\u0000\u0003-\u0001\u0000\u0000\u0000\u00053\u0001\u0000\u0000\u0000\u0007"+
		"6\u0001\u0000\u0000\u0000\t;\u0001\u0000\u0000\u0000\u000b>\u0001\u0000"+
		"\u0000\u0000\r@\u0001\u0000\u0000\u0000\u000fB\u0001\u0000\u0000\u0000"+
		"\u0011D\u0001\u0000\u0000\u0000\u0013F\u0001\u0000\u0000\u0000\u0015H"+
		"\u0001\u0000\u0000\u0000\u0017J\u0001\u0000\u0000\u0000\u0019L\u0001\u0000"+
		"\u0000\u0000\u001bT\u0001\u0000\u0000\u0000\u001dY\u0001\u0000\u0000\u0000"+
		"\u001f`\u0001\u0000\u0000\u0000!d\u0001\u0000\u0000\u0000#n\u0001\u0000"+
		"\u0000\u0000%s\u0001\u0000\u0000\u0000\'y\u0001\u0000\u0000\u0000)\u0084"+
		"\u0001\u0000\u0000\u0000+,\u0005;\u0000\u0000,\u0002\u0001\u0000\u0000"+
		"\u0000-.\u0005p\u0000\u0000./\u0005r\u0000\u0000/0\u0005i\u0000\u0000"+
		"01\u0005n\u0000\u000012\u0005t\u0000\u00002\u0004\u0001\u0000\u0000\u0000"+
		"34\u0005-\u0000\u000045\u0005>\u0000\u00005\u0006\u0001\u0000\u0000\u0000"+
		"67\u0005r\u0000\u000078\u0005e\u0000\u000089\u0005a\u0000\u00009:\u0005"+
		"d\u0000\u0000:\b\u0001\u0000\u0000\u0000;<\u0005t\u0000\u0000<=\u0005"+
		"o\u0000\u0000=\n\u0001\u0000\u0000\u0000>?\u0005(\u0000\u0000?\f\u0001"+
		"\u0000\u0000\u0000@A\u0005)\u0000\u0000A\u000e\u0001\u0000\u0000\u0000"+
		"BC\u0005^\u0000\u0000C\u0010\u0001\u0000\u0000\u0000DE\u0005-\u0000\u0000"+
		"E\u0012\u0001\u0000\u0000\u0000FG\u0005*\u0000\u0000G\u0014\u0001\u0000"+
		"\u0000\u0000HI\u0005:\u0000\u0000I\u0016\u0001\u0000\u0000\u0000JK\u0005"+
		"+\u0000\u0000K\u0018\u0001\u0000\u0000\u0000LM\u0005r\u0000\u0000MN\u0005"+
		"e\u0000\u0000NO\u0005d\u0000\u0000OP\u0005u\u0000\u0000PQ\u0005c\u0000"+
		"\u0000QR\u0005e\u0000\u0000R\u001a\u0001\u0000\u0000\u0000SU\u0007\u0000"+
		"\u0000\u0000TS\u0001\u0000\u0000\u0000UV\u0001\u0000\u0000\u0000VT\u0001"+
		"\u0000\u0000\u0000VW\u0001\u0000\u0000\u0000W\u001c\u0001\u0000\u0000"+
		"\u0000XZ\u0005-\u0000\u0000YX\u0001\u0000\u0000\u0000YZ\u0001\u0000\u0000"+
		"\u0000Z\\\u0001\u0000\u0000\u0000[]\u0007\u0001\u0000\u0000\\[\u0001\u0000"+
		"\u0000\u0000]^\u0001\u0000\u0000\u0000^\\\u0001\u0000\u0000\u0000^_\u0001"+
		"\u0000\u0000\u0000_\u001e\u0001\u0000\u0000\u0000`a\u0003\u001d\u000e"+
		"\u0000ab\u0005/\u0000\u0000bc\u0003\u001d\u000e\u0000c \u0001\u0000\u0000"+
		"\u0000dh\u0005\"\u0000\u0000eg\b\u0002\u0000\u0000fe\u0001\u0000\u0000"+
		"\u0000gj\u0001\u0000\u0000\u0000hf\u0001\u0000\u0000\u0000hi\u0001\u0000"+
		"\u0000\u0000ik\u0001\u0000\u0000\u0000jh\u0001\u0000\u0000\u0000kl\u0005"+
		"\"\u0000\u0000l\"\u0001\u0000\u0000\u0000mo\u0005\r\u0000\u0000nm\u0001"+
		"\u0000\u0000\u0000no\u0001\u0000\u0000\u0000op\u0001\u0000\u0000\u0000"+
		"pq\u0005\n\u0000\u0000q$\u0001\u0000\u0000\u0000rt\u0007\u0003\u0000\u0000"+
		"sr\u0001\u0000\u0000\u0000tu\u0001\u0000\u0000\u0000us\u0001\u0000\u0000"+
		"\u0000uv\u0001\u0000\u0000\u0000vw\u0001\u0000\u0000\u0000wx\u0006\u0012"+
		"\u0000\u0000x&\u0001\u0000\u0000\u0000y}\u0005#\u0000\u0000z|\t\u0000"+
		"\u0000\u0000{z\u0001\u0000\u0000\u0000|\u007f\u0001\u0000\u0000\u0000"+
		"}~\u0001\u0000\u0000\u0000}{\u0001\u0000\u0000\u0000~\u0080\u0001\u0000"+
		"\u0000\u0000\u007f}\u0001\u0000\u0000\u0000\u0080\u0081\u0005\n\u0000"+
		"\u0000\u0081\u0082\u0001\u0000\u0000\u0000\u0082\u0083\u0006\u0013\u0000"+
		"\u0000\u0083(\u0001\u0000\u0000\u0000\u0084\u0085\u0005/\u0000\u0000\u0085"+
		"\u0086\u0005/\u0000\u0000\u0086\u008a\u0001\u0000\u0000\u0000\u0087\u0089"+
		"\b\u0004\u0000\u0000\u0088\u0087\u0001\u0000\u0000\u0000\u0089\u008c\u0001"+
		"\u0000\u0000\u0000\u008a\u0088\u0001\u0000\u0000\u0000\u008a\u008b\u0001"+
		"\u0000\u0000\u0000\u008b\u008d\u0001\u0000\u0000\u0000\u008c\u008a\u0001"+
		"\u0000\u0000\u0000\u008d\u008e\u0006\u0014\u0000\u0000\u008e*\u0001\u0000"+
		"\u0000\u0000\t\u0000VY^hnu}\u008a\u0001\u0006\u0000\u0000";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}