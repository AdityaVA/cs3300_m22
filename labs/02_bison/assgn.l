%{
void set(char * str)
{
    yylval.string=(char*)malloc(sizeof(char)*(strlen(str)+1));
    strcpy(yylval.string, str);
}
%}

DIGIT [0-9]
INTEGER {DIGIT}+
IDENTIFIER [a-zA-Z_][_a-zA-Z0-9]*

%%
"//".*[\n] 
["\n\r"]
[\t]
[ ] 
"("  {set(yytext);return LEFTPAR;}
")"  {set(yytext);return RIGHTPAR;}
"{"  {set(yytext);return LEFTCURLY;}
"}"  {set(yytext);return RIGHTCURLY;}
"["  {set(yytext);return LEFTSQUARE;}
"]"  {set(yytext);return RIGHTSQUARE;}
"class"  {set(yytext);return CLASS;}
"public"  {set(yytext);return PUBLIC;}
"static"  {set(yytext);return STATIC;}
"void"  {set(yytext);return VOID;}
"main"  {set(yytext);return MAIN;}
";"   {set(yytext);return SEMICOLON;} 
","   {set(yytext);return COMMA;} 
"="   {set(yytext);return EQ;}
"+"   {set(yytext);return ADD;}
"-"   {set(yytext);return SUB;}
"*"   {set(yytext);return MUL;}
"/"   {set(yytext);return DIV;}
"."   {set(yytext);return DOT;}
"!"   {set(yytext);return NOT;}
"!="    {set(yytext);return NEQ;}
"<="   {set(yytext);return LEQ;}
"||"  {set(yytext);return OR;}
"&&"  {set(yytext);return AND;}
"true"  {set(yytext);return TRUE;}
"false" {set(yytext);return FALSE;}
"new"   {set(yytext);return NEW;}
"this"  {set(yytext);return THIS;} 
"extends" {set(yytext);return EXTENDS;} 
"return" {set(yytext);return RETURN;} 
"if"     {set(yytext);return IF;} 
"else"   {set(yytext);return ELSE;} 
"while"  {set(yytext);return WHILE;}
"#defineStmt"  {set(yytext);return DEFINESTMT;}
"#defineStmt0" {set(yytext);return DEFINESTMT0;}
"#defineStmt1" {set(yytext);return DEFINESTMT1;}
"#defineStmt2" {set(yytext);return DEFINESTMT2;}
"#defineExpr"   {set(yytext);return DEFINEEXPR;}
"#defineExpr0"  {set(yytext);return DEFINEEXPR0;}
"#defineExpr1"  {set(yytext);return DEFINEEXPR1;}
"#defineExpr2"  {set(yytext);return DEFINEEXPR2;}
"System.out.println" {set(yytext);return PRINTLN;}
"String"     {set(yytext);return STRING;} 
"int"        {set(yytext);return INT;} 
"boolean"    {set(yytext);return BOOLEAN; }
"length"     {set(yytext);return LENGTH;}
{IDENTIFIER}  {set(yytext);return IDENTIFIER;}
{INTEGER}     {set(yytext);return INTEGER;}
%%