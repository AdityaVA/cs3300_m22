%%
[\t] printf("    ");
[ \t]*"\n" printf("\n");
[\n]+ printf("\n");
%%
int main()
{
    yylex();
    return 0;
}