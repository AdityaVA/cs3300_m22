DIGIT   [0-9]
INTEGER [+-]?{DIGIT}+
DECIMAL ({INTEGER}?["."]{DIGIT}+)|{INTEGER}["."]
REAL    ({DECIMAL}|{INTEGER})[Ee]{INTEGER}
VARIABLE [A-Za-z_][A-Za-z0-9_]*
%%
{VARIABLE}  
{REAL}  printf("REAL: %s\n", yytext);
{DECIMAL}  printf("DECIMAL: %s\n", yytext);
{INTEGER}  printf("INTEGER: %s\n", yytext);
.|[\n]
%%

int main()
{
    yylex();
    return 0;
}