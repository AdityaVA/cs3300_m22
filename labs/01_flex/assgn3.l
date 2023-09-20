%{
char macros[8][64];
char replacements[8][64];
int macro_count = 0;
void fill(char * str)
{
    int i = 7;
    while(str[i] == ' ')
    {
        i++;
    }
    int c=0;
    while(str[i] != ' ')
    {
        macros[macro_count][c] = str[i];
        i++;
        c++;
    }
    macros[macro_count][c] = '\0';
    while(str[i] == ' ')
    {
        i++;
    }
    c=0;
    while(str[i] != '\n')
    {
        replacements[macro_count][c] = str[i];
        i++;
        c++;
    }
    replacements[macro_count][c] = '\0';
    macro_count++;
}
void replace(char* s)
{
    for(int i=0;i<macro_count;i++)
    {
        if(strcmp(s, macros[i]) == 0)
        {
            printf("%s", replacements[i]);
            return;;
        }
    }
    printf("%s", s);
}
%}

MACRONAME [A-Za-z][A-Za-z0-9]*
REPLACEMENT .*
MACRO "#define"[ ]+{MACRONAME}[ ]+{REPLACEMENT}

%%
{MACRO}[\n] fill(yytext);
{MACRONAME} replace(yytext);
[\n]+ printf("\n");
%%