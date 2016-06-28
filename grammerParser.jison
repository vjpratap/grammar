/* description: Parses end executes mathematical expressions. */

/* lexical grammar */

%{
		var formatWithObject = function(noun, verb, object){
			return {"noun":noun, "verb":verb, "object":object};
		};
		var  formatWithoutObject = function(noun, verb){
			return {"noun":noun, "verb":verb};
		}
%}

%lex


%%
\s+                   /* skip whitespace */
("ram"|"sita") 															return 'NOUN';
("hates"|"likes")   													return 'VERB';
("tea"|"coffee"|"butter"|"cheese"|"biscuits")   						return 'OBJECT';
"."																		return 'DOT';
<<EOF>>             return 'EOF';

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
		$$ = formatWithObject($1,$2,$3)
	}
	|NOUN VERB NOUN DOT {
		$$ = formatWithObject($1,$2,$3)
	}
	|NOUN VERB OBJECT {
		$$ = formatWithObject($1,$2,$3)
	}
	;


