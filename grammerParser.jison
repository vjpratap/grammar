/* description: Parses end executes mathematical expressions. */

/* lexical grammar */

%lex


%%
\s+                   /* skip whitespace */
("ram"|"sita") 															return 'NOUN';
("hates"|"likes")   													return 'VERB';
("tea"|"coffee"|"butter"|"cheese"|"biscuits")   						return 'OBJECT';
"."																		return 'DOT';
<<EOF>>             													return 'EOF';

/lex

%start allSentences
/* language grammar */
%%

allSentences
	:sentences EOF {return $1;}
	;

sentences
	: sentences sentence { $$ = $1.concat($2);}
	| sentence {$$ = [$1];}
	;

sentence
	:NOUN VERB OBJECT DOT {
		$$ = {"noun":$1, "verb":$2, "object":$3};
	}
	|NOUN VERB NOUN DOT {
		$$ = {"noun":$1, "verb":$2, "object":$3};
	}
	;