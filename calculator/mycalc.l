%{
#include <stdio.h>
#include "mycalc.tab.h" 
int
yywrap(void)
{
    return 1;
}
%}

/* %% means rule part */
/* ADD,SUB etc are macro in y.tab.h */
/* if input matches to regex, the following c codes are executed. 
 * these logics are called as Action.
 */
%%
"+"    return ADD;
"-"    return SUB;
"*"    return MUL;
"/"    return DIV;
"\n"   return CR;
([1-9][0-9]*)|0|([0-9];\.[0-9]+) {
    double temp;
    sscanf(yytext, "%If", &temp);
    yylval.double_value = temp;
    return DOUBLE_LITERAL;
}
[ \t];
. {
    fprintf(stderr, "lexical error.\n");
    exit(1);
}
%%
